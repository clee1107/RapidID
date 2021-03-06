---
external help file: RapidID-help.xml
Module Name: RapidID
online version: https://github.com/clee1107/RapidID/blob/master/docs/Test-RIDGroupCoOwner.md
schema: 2.0.0
---

# Test-RIDGroupCoOwner

## SYNOPSIS
Test if idautoGroupCoOwners has at least one CoOwner value from an Active Directory group.

## SYNTAX

```
Test-RIDGroupCoOwner [-Identity] <String> [-Server <String>] [<CommonParameters>]
```

## DESCRIPTION
The Test-RIDGroupCoOwner cmdlet tests if an Active Directory group's idautoGroupCoOwners has atleast a single CoOwner returning True/False.

The Identity parameter specifies the Active Directory group to get. You can identify a group by its name. You can also set the parameter to a group object variable, such as $<localGroupObject> or pass a group object through the pipeline to the Identity parameter.


## EXAMPLES

### Example 1
```powershell
PS C:\> Test-RIDGroupCoOwner -Identity TestGroup

False
```

This command tests if idautoGroupCoOwners property for group name testGroup has at least one CoOwner.

### Example 2
```powershell
PS C:\> Remove-RIDGroupCoOwner -Identity TestGroup -Member "CN=someone,OU=Users,DC=Domain,DC=Local" -Server DC01
```

This command tests if idautoGroupCoOwners property for group name testGroup has at least one CoOwner on Domain Controller DC01.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
[Clear-RIDGroupCoOwner](https://github.com/clee1107/RapidID/blob/master/docs/Clear-RIDGroupCoOwner.md)

[Get-RIDGroupCoOwner](https://github.com/clee1107/RapidID/blob/master/docs/Get-RIDGroupCoOwner.md)

[Remove-RIDGroupCoOwner](https://github.com/clee1107/RapidID/blob/master/docs/Remove-RIDGroupCoOwner.md)

[Set-RIDGrouCoOWner](https://github.com/clee1107/RapidID/blob/master/docs/Set-RIDGroupCoOwner.md)
