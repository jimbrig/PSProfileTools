using namespace System.IO
using namespace System.Management.Automation
using namespace System.Security.Cryptography.X509Certificates

function Import-Certificate {
    <#
    .SYNOPSIS
        Import an X509 certificate into a named store.
    .DESCRIPTION
        Import a certificate into the specified store.
        `Import-Certificate` can accept a public key, or a public/private key pair as an X509Certificate2 object.
    .PARAMETER Certificate
        The certificate to install.
    .PARAMETER StoreName
        (Optional) The store name to install the certificate into. By default certificates are installed in the personal
        store (i.e. `My`).
    .PARAMETER StoreLocation
        (Optional) The store to install the certificate into. By default the LocalMachine store is used.
    .PARAMETER ComputerName
        (Optional) The Computer Name to use for this query. If `ComputerName` is not specified `Import-Certificate` uses
        the current computer via `$env:ComputerName`.
    .EXAMPLE
        Get-Certificate -StoreName My -ComputerName Server1 | Install-Certificate $Certificate -ComputerName Server2 -StoreName TrustedPeople

        # Get certificates from the Personal (My) store of Server1 and install each into the TrustedPeople store of Server2.
    .LINK
        https://gist.github.com/indented-automation/37b748056742d5e1b51f7cd767813f5d
    #>
    [CmdletBinding()]
    param (
        # The certificate to install.
        [Parameter(Mandatory, ValueFromPipeline)]
        [X509Certificate2]$Certificate,
        [String]$StoreName = 'My',
        [StoreLocation]$StoreLocation = 'LocalMachine',
        [String]$ComputerName = $env:ComputerName
    )

    Begin {
        $store = GetStore -ComputerName $ComputerName -StoreName $StoreName -StoreLocation $StoreLocation
        try {
            $store.Open([OpenFlags]::ReadWrite)
        } catch {
            $errorRecord = [ErrorRecord]::new(
                $_.Exception.GetBaseException(),
                'FailedToOpenCertificateStore',
                'OpenError',
                $store
            )
            $pscmdlet.ThrowTerminatingError($errorRecord)
        }
    }

    Process {
        try {
            $store.Add($Certificate)
        } catch {
            $errorRecord = [ErrorRecord]::new(
                $_.Exception.GetBaseException(),
                'FailedToAddCertificateToStore',
                'WriteError',
                $Certificate
            )
            Write-Error -ErrorRecord $errorRecord
        }
    }

    End {
        $store.Close()
    }
}
