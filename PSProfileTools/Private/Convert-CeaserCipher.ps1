

Function Convert-CeaserCipher {
    <#
        .SYNOPSIS
            Convert a string to and from a ceaser cipher (ROT-13) encoding.
        .DESCRIPTION
            Convert a string to and from a ceaser cipher (ROT-13) encoding.
        .PARAMETER String
            The string to encode or decode.
    #>
    [CmdletBinding()]
    [OutputType([String])]
    Param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]$String
    )

    Process {
        $chars = ForEach ($char in $string.ToCharArray()) {
            if ($char -notmatch '[a-z]') {
                $char
                continue
            }

            $decrement = ($char -ge 'A' -and $char -le 'Z' -and $char -gt 'M') -or
                ($char -ge 'a' -and $char -le 'z' -and $char -gt 'm')

            if ($decrement) {
                [int]$char - 13
            } else {
                [int]$char + 13
            }
        }
        [string]::new([char[]]$chars)
    }
}









