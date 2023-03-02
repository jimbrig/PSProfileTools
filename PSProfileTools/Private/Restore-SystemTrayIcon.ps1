function Restore-SystemTrayIcon {
    <#
    .SYNOPSIS
        Restore an existing backup of the System Tray Icon configuration (IconStreams).

    .DESCRIPTION
        Restore an existing backup of the System Tray Icon configuration (IconStreams).

    #>

    [CmdletBinding()]
    param ( )

    $registryPath = 'HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify'
    $value = Get-ItemPropertyValue $registryPath -Name IconStreams_Backup
    if ($value) {
        Set-ItemProperty -Path $registryPath -Name IconStreams -Value $value
    } else {
        Write-Error 'IconStreams backup does not exist!'
    }
}
