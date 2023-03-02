Function Test-Command {
    <#
        .SYNOPSIS
            Tests that provided command exists on local machine's PATH.
        .DESCRIPTION
            Tests that provided command exists on local machine's PATH.
        .PARAMETER Command
            The Command to test/search for.
        .EXAMPLE
            Test-Command aws

            # Tests if the command `aws` is available.
        .NOTES
            This function simply wraps the native `Get-Command` PowerShell CmdLet.
        .OUTPUTS
            System.Boolean
    #>
    [CmdLetBinding()]
    [OutputType([Boolean])]
    Param(
        [string]$Command
    )

    $out = $false

    If (Get-Command -Name $Command -ErrorAction SilentlyContinue) {
        $out = $true
    }

    $out
}
