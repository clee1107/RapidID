---
external help file: RapidID-help.xml
Module Name: RapidID
online version: https://github.com/clee1107/RapidID/blob/master/docs/Get-RIDGroupLogic.md
schema: 2.0.0
---

# Get-RIDGroupLogic

## SYNOPSIS
Gets RapidID include logic from attribute "idautoGroupIncludeFilter".

## SYNTAX

```
Get-RIDGroupLogic [-Identity] <String> [-Server <String>] [<CommonParameters>]
```

## DESCRIPTION
The Get-RIDGroupLogic cmdlet gets a specified group object's idautoGroupIncludeFilter attribute

The Identity parameter specifies the Active Directory group to get. You can identify a group by its name. You can also set the parameter to a group object variable, such as $<localGroupObject> or pass a group object through the pipeline to the Identity parameter.

This cmdlet retrieves only the value of idautoGroupIncludeFilter from group object properties.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-RIDGroupLogic -Identity testGroupWithLogic

name                idautoGroupIncludeFilter
----                ------------------------
testGroupWithLogic  (&(employeetype=staff))

PS C:\> Get-RIDGroupLogic -Identity testGroupWithOutLogic

name                idautoGroupIncludeFilter
----                ------------------------
testGroupWithLogic

```

This command displays idautoGroupIncludeFilter property value for group name testGroupWithLogic and testGroupWithOutLogic.

### Example 2
```powershell
PS C:\> Get-RIDGroupLogic -Identity testGroupWithLogic -Server DC01

name                idautoGroupIncludeFilter
----                ------------------------
testGroupWithLogic  (&(employeetype=staff))

PS C:\> Get-RIDGroupLogic -Identity testGroupWithOutLogic -Server DC01

name                   idautoGroupIncludeFilter
----                   ------------------------
testGroupWithOutLogic

```

This command displays idautoGroupIncludeFilter property value for group name testGroupWithLogic and testGroupWithOutLogic as recorded on Domain Controller DC01.

## PARAMETERS

### -Identity
Specifies an Active Directory group object by providing SAM account name (sAMAccountName). The identifier in parentheses is the LDAP display name for the attribute.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Server
Specifies the Active Directory Domain Services instance to connect to, by providing one of the following values for a corresponding domain name or directory server. The service may be any of the following: Active Directory Lightweight Domain Services, Active Directory Domain Services or Active Directory Snapshot instance.

Domain name values:

- Fully qualified domain name (FQDN)
- NetBIOS name

Directory server values:

- Fully qualified directory server name
- NetBIOS name
- Fully qualified directory server name and port

The default value for the Server parameter is determined by one of the following methods in the order that they are listed:

- By using Server value from objects passed through the pipeline.
- By using the domain of the computer running PowerShell.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
[Remove-RIDGroupLogic](https://github.com/clee1107/RapidID/blob/master/docs/Clear-RIDGroupLogic.md)

[Set-RIDGroupLogic](https://github.com/clee1107/RapidID/blob/master/docs/Set-RIDGroupLogic.md)

[Test-RIDGroupLogic](https://github.com/clee1107/RapidID/blob/master/docs/Test-RIDGroupLogic.md)