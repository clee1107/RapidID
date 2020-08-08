---
external help file: RapidID-help.xml
Module Name: RapidID
online version: https://github.com/clee1107/RapidID/blob/master/docs/RIDUserOverrideReport.md
schema: 2.0.0
---

# RIDUserOverrideReport

## SYNOPSIS
Reports on users that have Override Statusor Note set.

## SYNTAX

```
RIDUserOverrideReport [[-SearchBase] <String>] [[-Server] <String>] [<CommonParameters>]
```

## DESCRIPTION
The RIDUserOverrideReport cmdlet generates report of custome object from target searchbase (Domian Wide by default).

The SearchBase parameter specifies the Active Directory Organizational Unit (OU) to query. You can identify a Searchbase by its name.

## EXAMPLES

### Example 1
```powershell
PS C:\> RIDUserOverrideReport

name              : jbob
enabled           : True
idautostatus      : Inactive
OverrideStatus    :
OverrideNote      : 20200406 - ssue - WHD44354
UserPrincipalName : jbob@domain.org
DistinguishedName : CN=jbob,OU=Students,OU=School,DC=DOMAIN,DC=COM

name              : gbrown
enabled           : True
idautostatus      : Active
OverrideStatus    :
OverrideNote      : 20200306 - ssue - WHD443
UserPrincipalName : gbrown@domain.org
DistinguishedName : CN=gbrown,OU=Faculty,DC=DOMAIN,DC=COM
```

Queires entire domain and reports back all users that have Override attribute(s) set.

### Example 2
```powershell
PS C:\> RIDUserOverrideReport SearchBase "OU=Students,OU=School,DC=DOMAIN,DC=COM"

name              : jbob
enabled           : True
idautostatus      : Inactive
OverrideStatus    :
OverrideNote      : 20200406 - ssue - WHD44354
UserPrincipalName : jbob@domain.org
DistinguishedName : CN=jbob,OU=Students,OU=School,DC=DOMAIN,DC=COM
```

Queires Student Organizational Unit (OU) and reports back all users that have Override attribute(s) set.
## PARAMETERS

### -SearchBase
Targets provided Distinguised Name (DistinguishedName) of OU, if not provided defaults scan entire domain.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: Domain
Accept pipeline input: False
Accept wildcard characters: False
```

### -Server
Distinguised Name (DistinguishedName). The identifier in parentheses is the LDAP display name for the attribute.

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
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
