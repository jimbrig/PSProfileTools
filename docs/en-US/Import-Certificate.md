---
external help file: PSProfileTools-help.xml
Module Name: PSProfileTools
online version: https://gist.github.com/indented-automation/37b748056742d5e1b51f7cd767813f5d
schema: 2.0.0
---

# Import-Certificate

## SYNOPSIS
Import an X509 certificate into a named store.

## SYNTAX

```
Import-Certificate [-Certificate] <X509Certificate2> [[-StoreName] <String>] [[-StoreLocation] <StoreLocation>]
 [[-ComputerName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Import a certificate into the specified store.
\`Import-Certificate\` can accept a public key, or a public/private key pair as an X509Certificate2 object.

## EXAMPLES

### EXAMPLE 1
```
Get-Certificate -StoreName My -ComputerName Server1 | Install-Certificate $Certificate -ComputerName Server2 -StoreName TrustedPeople
```

# Get certificates from the Personal (My) store of Server1 and install each into the TrustedPeople store of Server2.

## PARAMETERS

### -Certificate
The certificate to install.

```yaml
Type: X509Certificate2
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -StoreName
(Optional) The store name to install the certificate into.
By default certificates are installed in the personal
store (i.e.
\`My\`).

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: My
Accept pipeline input: False
Accept wildcard characters: False
```

### -StoreLocation
(Optional) The store to install the certificate into.
By default the LocalMachine store is used.

```yaml
Type: StoreLocation
Parameter Sets: (All)
Aliases:
Accepted values: CurrentUser, LocalMachine

Required: False
Position: 3
Default value: LocalMachine
Accept pipeline input: False
Accept wildcard characters: False
```

### -ComputerName
(Optional) The Computer Name to use for this query.
If \`ComputerName\` is not specified \`Import-Certificate\` uses
the current computer via \`$env:ComputerName\`.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: $env:ComputerName
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://gist.github.com/indented-automation/37b748056742d5e1b51f7cd767813f5d](https://gist.github.com/indented-automation/37b748056742d5e1b51f7cd767813f5d)

