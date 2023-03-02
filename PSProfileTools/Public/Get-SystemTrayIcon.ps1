function Get-SystemTrayIcon {
    <#
    .SYNOPSIS
        Get system tray icon visibility.

    .DESCRIPTION
        Get system tray icon visibility using the IconStreams value in the registry.
    #>

    [CmdletBinding()]
    param (
        # The path for the system tray icon. By default app paths are displayed.
        [string]$Path = '*'
    )

    $registryPath = 'HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify'
    $iconStreams = Get-ItemPropertyValue -Path $registryPath -Name IconStreams
    # The flag for visibility appears at offset 528
    $systemTrayToggleOffset = 528

    # The iconStreams array has a 20 byte header, followed by 1640 byte records describing each icon.
    for ($i = 20; $i -lt $iconStreams.Count; $i += 1640) {
        # The path is Unicode encoded and null terminated.
        $iconPathBytes = for (($j = 0), ($isChar = $true); $isChar; $j += 2) {
            $left = $iconStreams[$i + $j]
            $right = $iconStreams[$i + $j + 1]

            $isChar = $left -ne 0 -or $right -ne 0
            if ($isChar) {
                $left, $right
            }
        }
        $iconPath = [System.Text.Encoding]::Unicode.GetString([byte[]]$iconPathBytes) | Convert-CeaserCipher

        if ($iconPath -like $Path) {
            [PSCustomObject]@{
                PSTypeName = 'IconStreamsRecord'
                Visibility = [Visibility]$iconStreams[$i + $systemTrayToggleOffset]
                Offset     = $i
                Path       = Resolve-KnownFolder $iconPath
            }
        }
    }
}
