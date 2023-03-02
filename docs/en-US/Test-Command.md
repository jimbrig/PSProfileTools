---
external help file: PSProfileTools-help.xml
Module Name: PSProfileTools
online version: https://gist.github.com/indented-automation/37b748056742d5e1b51f7cd767813f5d
schema: 2.0.0
---

# Test-Command

## SYNOPSIS
Tests that provided command exists on local machine's PATH.

## SYNTAX

```
Test-Command [[-Command] <String>] [<CommonParameters>]
```

## DESCRIPTION
Tests that provided command exists on local machine's PATH.

## EXAMPLES

### EXAMPLE 1
```
Test-Command aws
```

# Tests if the command \`aws\` is available.

## PARAMETERS

### -Command
The Command to test/search for.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Boolean
## NOTES
This function simply wraps the native \`Get-Command\` PowerShell CmdLet.

## RELATED LINKS
