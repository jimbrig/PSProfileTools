using namespace System.Management.Automation
using namespace System.Security.Cryptography.X509Certificates

function ConvertTo-X509Certificate {
    <#
    .SYNOPSIS
        Convert a Base64 encoded certificate (with header and footer) to an X509Certificate object.
    .DESCRIPTION
        ConvertTo-X509Certificate reads a Base64 encoded certificate string or file and converts it to an X509Certificate
        object.
    .PARAMETER Path
        The path to an existing certificate file.
    .PARAMETER Certificate
        One or more base64 encoded strings describing the certificate.
    .EXAMPLE
        Get-ChildItem *.pem | ConvertTo-X509Certificate

        # Converts all certificates stored in pem files to an X509Certificate2 object.
    .EXAMPLE
        ConvertTo-X509Certificate -Path cert.cer

        # Converts the certificate stored in cert.cer to an X509Certificate2 object.
    .LINK
        https://gist.github.com/indented-automation/37b748056742d5e1b51f7cd767813f5d
    #>
    [CmdletBinding(DefaultParameterSetName = 'FromPipeline')]
    [OutputType([System.Security.Cryptography.X509Certificates.X509Certificate2])]
    param (
        [Parameter(Mandatory, Position = 1, ValueFromPipeline, ParameterSetName = 'FromFile')]
        [ValidateScript( { Test-Path $_ -PathType Leaf } )]
        [string]$Path,
        # [FileInfo]$Path,
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline, ParameterSetName = 'FromCertificateText')]
        [Alias('RawCertificate')]
        [String]$Certificate
    )

    process {
        try {
            if ($Certificate) {
                if ($Certificate.StartsWith('-----BEGIN')) {
                    $expression = '-----BEGIN CERTIFICATE-----([\s\S]+?)-----END CERTIFICATE-----'
                    foreach ($match in [Regex]::Matches($Certificate, $expression)) {
                        $bytes = [Convert]::FromBase64String($match.Groups[1].Value.Trim())
                        [X509Certificate2]::new($bytes)
                    }
                } else {
                    $bytes = [Convert]::FromBase64String($Certificate)
                    [X509Certificate2]::new($bytes)
                }
            } elseif ($Path) {
                $Path = $pscmdlet.GetUnresolvedProviderPathFromPSPath($Path.ToString())
                [X509Certificate2]::new($Path)
            }
        } catch {
            Write-Error -ErrorRecord $_
        }
    }
}
