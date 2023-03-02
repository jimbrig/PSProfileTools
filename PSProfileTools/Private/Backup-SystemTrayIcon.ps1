function Backup-SystemTrayIcon {
    <#
    .SYNOPSIS
        Create a backup of the System Tray Icon configuration (IconStreams).

    .DESCRIPTION
        Create a backup of the System Tray Icon configuration (IconStreams).

    #>

    [CmdletBinding()]
    param ( )

    $registryPath = 'HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify'
    $value = Get-ItemPropertyValue $registryPath -Name IconStreams
    New-ItemProperty -Path $registryPath -Name IconStreams_Backup -Value $value -Force
}
