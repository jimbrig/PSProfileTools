---
external help file: PSProfileTools-help.xml
Module Name: PSProfileTools
online version: https://gist.github.com/indented-automation/26c637fb530c4b168e62c72582534f5b
schema: 2.0.0
---

# Get-Completion

## SYNOPSIS
Get custom argument completers registered in the current session.

## SYNTAX

### PSCommand (Default)
```
Get-Completion [-CommandName <String>] [-ParameterName <String>] [<CommonParameters>]
```

### Native
```
Get-Completion [-CommandName <String>] [-Native] [<CommonParameters>]
```

## DESCRIPTION
Get custom argument completers registered in the current session.
By default Get-ArgumentCompleter lists all of the completers registered in the session.

## EXAMPLES

### EXAMPLE 1
```
Get-Completion
```

# Get all of the argument completers for PowerShell commands in the current session.

### EXAMPLE 2
```
Get-Completion -CommandName Invoke-ScriptAnalyzer
```

# Get all of the argument completers used by the Invoke-ScriptAnalyzer command.

### EXAMPLE 3
```
Get-ArgumentCompleter -Native
```

# Get all of the argument completers for native commands in the current session.

## PARAMETERS

### -CommandName
Filter results by command name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -ParameterName
Filter results by parameter name.

```yaml
Type: String
Parameter Sets: PSCommand
Aliases:

Required: False
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Native
Get argument completers for native commands.

```yaml
Type: SwitchParameter
Parameter Sets: Native
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://gist.github.com/indented-automation/26c637fb530c4b168e62c72582534f5b](https://gist.github.com/indented-automation/26c637fb530c4b168e62c72582534f5b)

