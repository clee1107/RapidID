function RIDUserOverrideReport {
    [CmdletBinding()]
    param (
        [String]
            $SearchBase = (Get-ADDomain).DistinguishedName,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {
        $Report = @()
    }

    process {
        $SearchBaseName = If ($SearchBase -eq ((Get-ADDomain).DistinguishedName)) {
            "Domain Wide"
            } else {
                $Searchbase.Split(",")[0].replace("OU=","")
            }
        $Users = Get-ADUser -SearchBase $Searchbase -LDAPFilter "(|(idautoPersonOverride=*)(idautoPersonStatusOverride=*))" -Properties idautoPersonOverride,idautoPersonStatusOverride,idautostatus
        $Ticker = 0
        ForEach ($User in $Users) {
            $percent = $Ticker * 100 / $Users.count
            Write-Progress -Activity "Quering User Accounts - $SearchBaseName - Total $($Users.count)" -Status "$($Users.count - $ticker) users remaining..." -PercentComplete $percent;
                $UserObj = [pscustomobject]@{
                    name = $user.name
                    enabled = $user.enabled
                    idautostatus = $user.idautostatus
                    OverrideStatus = $user.idautoPersonOverride
                    OverrideNote = $user.idautoPersonStatusOverride
                    UserPrincipalName = $user.UserPrincipalName
                    DistinguishedName = $user.DistinguishedName
                }
            $Report += $UserObj
            $Ticker ++
        }

        Return $Report
    }

    end {
    }
}