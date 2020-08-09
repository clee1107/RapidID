---
external help file: RapidID-help.xml
Module Name: RapidID
online version: https://github.com/clee1107/RapidID/blob/master/docs/Set-RIDUserOverrideStatus.md
schema: 2.0.0
---

# Set-RIDUserOverrideStatus

## SYNOPSIS
Set targeded users RID Override Status (True/False).

## SYNTAX

```
Set-RIDUserOverrideStatus [-Identity] <String> [-Status] [-Server <String>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
The Set-RIDUserOverrideStatus cmdlet sets a specified user object's idautoPersonOverride attribute.

The Identity parameter specifies the Active Directory user to get. You can identify a user by its name. You can also set the parameter to a user object variable, such as $<localUserObject> or pass a user object through the pipeline to the Identity parameter.

## EXAMPLES

### Example 1
```powershell
PS C:\> Set-RIDUserOverrideStatus -Identity jbob -Status
```

Sets idautoPersonOverride to True for user jbob

### Example 2
```powershell
PS C:\> Set-RIDUserOverrideStatus -Identity jbob -Status:$true
```

Sets idautoPersonOverride to True for user jbob

### Example 3
```powershell
PS C:\> Set-RIDUserOverrideStatus -Identity jbob -Status:$false
```

Sets idautoPersonOverride to False for user jbob

## PARAMETERS

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Identity
Specifies an Active Directory user object by providing SAM (sAMAccountName). The identifier in parentheses is the LDAP display name for the attribute.

```yaml
Type: String
Parameter Sets: (All)
Aliases: User

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Server
Specifies the Active Directory Domain Services instance to connect to, by providing one of the following values for a corresponding domain name or directory server. The service may be any of the following: Active Directory Lightweight Domain Services, Active Directory Domain Services or Active Directory Snapshot instance.

Domain name values:

--Fully qualified domain name (FQDN)
--NetBIOS name

Directory server values:

--Fully qualified directory server name
--NetBIOS name
--Fully qualified directory server name and port

The default value for the Server parameter is determined by one of the following methods in the order that they are listed:

--By using Server value from objects passed through the pipeline.
--By using the domain of the computer running PowerShell.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Status
Set user overrode status: (True)/Fasle.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: True
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

### System.Management.Automation.SwitchParameter

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
[Get-RIDUserOverrideStatus](https://github.com/clee1107/RapidID/blob/master/docs/Get-RIDUserOverrideStatus.md)

[Clear-RIDUserOverrideStatus](https://github.com/clee1107/RapidID/blob/master/docs/Clear-RIDUserOverrideStatus.md)

[Test-RIDUserOverrideStatus](https://github.com/clee1107/RapidID/blob/master/docs/Test-RIDUserOverrideStatus.md)