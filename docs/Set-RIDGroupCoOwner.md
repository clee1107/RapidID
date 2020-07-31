---
external help file: RapidID-help.xml
Module Name: RapidID
online version: https://github.com/clee1107/RapidID/blob/master/docs/Remove-RIDGroupCoOwner.md
schema: 2.0.0
---

# Set-RIDGroupCoOwner

## SYNOPSIS
Set a member to idautoGroupCoOwners value from an Active Directory group.

## SYNTAX

```
Set-RIDGroupCoOwner [-Identity] <String> [-Member] <String> [-Server <String>] [<CommonParameters>]
```

## DESCRIPTION
The Set-RIDGroupCoOWner cmdlet set (adds) the target user to an Active Directory group's idautoGroupCoOwners.

The Identity parameter specifies the Active Directory group to get. You can identify a group by its name. You can also set the parameter to a group object variable, such as $<localGroupObject> or pass a group object through the pipeline to the Identity parameter.


## EXAMPLES

### Example 1
```powershell
PS C:\> Set-RIDGroupCoOwner -Identity TestGroup -Member "CN=someone,OU=Users,DC=Domain,DC=Local"

```

This command sets "CN=someone,OU=Users,DC=Domain,DC=Local" to idautoGroupCoOWners property for group name testGroup.

### Example 2
```powershell
PS C:\> Set-RIDGroupCoOwner -Identity TestGroup -Member "CN=someone,OU=Users,DC=Domain,DC=Local" -Server DC01
```

This command sets "CN=someone,OU=Users,DC=Domain,DC=Local" to idautoGroupCoOWners property for group name testGroup on Domain Controller DC01.


## PARAMETERS

### -Identity
Specifies an Active Directory group object by providing SAM account name (sAMAccountName). The identifier in parentheses is the LDAP display name for the attribute.

```yaml
Type: String
Parameter Sets: (All)
Aliases: TargetGroup, Group

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Member
Specifies an Active Directory user object by providing Distinguised Name (DistinguishedName). The identifier in parentheses is the LDAP display name for the attribute.

```yaml
Type: String
Parameter Sets: (All)
Aliases: TargetCoOwner, User

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
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

[Test-RIDGroupCoOwner](https://github.com/clee1107/RapidID/blob/master/docs/Test-RIDGroupCoOwner.md)