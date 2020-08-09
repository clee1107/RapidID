function Clear-RIDGroupCoOwner {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        ## region Code
            ## Set logic attribute
            Write-Verbose -Message "Attempting to clear GroupCoOwners for $Identity"
            Try {
                Set-ADGroup -Identity $Identity -Server $Server -Clear idautoGroupCoOwners -ErrorAction Stop
                Write-Verbose -Message "Cleared GroupCoOwners for $Identity"
            }
            Catch {
                    Throw "Failed to clear GroupCoOwners for $Identity"
            }
        ## endregion
    }

    end {

    }
}
function Clear-RIDGroupLogic {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server= (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        ## region Code
            ## Set logic attribute
                Write-Verbose -Message "Attempting to clear include logic for $Identity"
                Try {
                    Set-ADGroup -Identity $Identity -Server $Server -Clear idautoGroupIncludeFilter -ErrorAction Stop
                    Write-Verbose -Message "Cleared include logic for $Identity"
                }
                Catch {
                        Throw "Failed to clear include logic for $Identity"
                }
        ## endregion
    }

    end {

    }
}
function Clear-RIDGroupStaticMember {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        ## region Code
            ## Set logic attribute
            Write-Verbose -Message "Attempting to clear Static Members for $Identity"
            Try {
                Set-ADGroup -Identity $Identity -Server $Server -Clear idautoGroupStaticIncludes -ErrorAction Stop
                Write-Verbose -Message "Cleared Static Members for $Identity"
            }
            Catch {
                    Throw "Failed to clear Static Members for $Identity"
            }
        ## endregion
    }

    end {

    }
}
function Clear-RIDUserOverrideNote {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server= (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        ## region Code
            ## Set logic attribute
                Write-Verbose -Message "Attempting to clear override note(s) for $Identity"
                Try {
                    Set-ADUser -Identity $Identity -Server $Server -Clear idautoPersonStatusOverride -ErrorAction Stop
                    Write-Verbose -Message "Cleared override note(s) for $Identity"
                }
                Catch {
                        Throw "Failed to clear override note(s) for $Identity"
                }
        ## endregion
    }

    end {

    }
}
function Clear-RIDUserOverrideStatus {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server= (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        ## region Code
            ## Set logic attribute
                Write-Verbose -Message "Attempting to clear override status for $Identity"
                Try {
                    Set-ADUser -Identity $Identity -Server $Server -Clear idautoPersonOverride -ErrorAction Stop
                    Write-Verbose -Message "Cleared override status for $Identity"
                }
                Catch {
                        Throw "Failed to clear override status for $Identity"
                }
        ## endregion
    }

    end {

    }
}
function Clear-RIDUserTermDate {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server= (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        ## region Code
            ## Set logic attribute
                Write-Verbose -Message "Attempting to clear term date for $Identity"
                Try {
                    Set-ADUser -Identity $Identity -Server $Server -Clear idautoPersonTermDate -ErrorAction Stop
                    Write-Verbose -Message "Cleared term date for $Identity"
                }
                Catch {
                        Throw "Failed to clear term date for $Identity"
                }
        ## endregion
    }

    end {

    }
}
function Get-RIDGroupCoOwner {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        $Object = Get-ADGroup -Identity $Identity -property idautoGroupCoOwners -Server $Server | Select-Object -Property name, idautoGroupCoOwners
        Return $Object
    }

    end {

    }
}
function Get-RIDGroupLogic {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        $Object = Get-ADGroup -Identity $Identity -property idautoGroupIncludeFilter -Server $Server | Select-Object -Property name, idautoGroupIncludeFilter
        Return $Object
    }

    end {

    }
}
function Get-RIDGroupStaticMember {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        $Object = Get-ADGroup -Identity $Identity -property idautoGroupStaticIncludes -Server $Server | Select-Object -Property name, idautoGroupStaticIncludes
        Return $Object
    }

    end {

    }
}
function Get-RIDUserID {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        $Object = Get-ADUser -Identity $Identity -property idautoID -Server $Server | Select-Object -Property name, idautoID
        Return $Object
    }

    end {

    }
}
function Get-RIDUserOverrideNote {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        $Object = Get-ADUser -Identity $Identity -property idautoPersonStatusOverride -Server $Server | Select-Object -Property name, idautoPersonStatusOverride
        Return $Object
    }

    end {

    }
}
function Get-RIDUserOverrideStatus {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        $Object = Get-ADUser -Identity $Identity -property idautoPersonOverride -Server $Server | Select-Object -Property name, idautoPersonOverride
        Return $Object
    }

    end {

    }
}
function Get-RIDUserTermDate {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        $Object = Get-ADUser -Identity $Identity -property idautoPersonTermDate -Server $Server | Select-Object -Property name, idautoPersonTermDate
        Return $Object
    }

    end {

    }
}
function Remove-RIDGroupCoOwner {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [parameter(Mandatory=$TRUE,Position=1,ValueFromPipelineByPropertyName)]
        [Alias("TargetCoOwner","User")]
        [String]
            $Member,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        ## region Code
            ## Set logic attribute
            Write-Verbose -Message "Attempting to remove GroupCoOwner ($Member) for $Identity"
            Try {
                Set-ADGroup -Identity $Identity -Server $Server -Remove @{idautoGroupCoOwners="$Member"} -ErrorAction Stop
                Write-Verbose -Message "Removed GroupCoOwner ($Member) for $Identity"
            }
            Catch {
                    Throw "Failed to remove GroupCoOwner ($Member) for $Identity"
            }
        ## endregion
    }

    end {

    }
}
function Remove-RIDGroupStaticMember {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [parameter(Mandatory=$TRUE,Position=1,ValueFromPipelineByPropertyName)]
        [Alias("TargetCoOwner","User")]
        [String]
            $Member,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        ## region Code
            ## Set logic attribute
            Write-Verbose -Message "Attempting to remove static member ($Member) for $Identity"
            Try {
                Set-ADGroup -Identity $Identity -Server $Server -Remove @{idautoGroupStaticIncludes="$Member"} -ErrorAction Stop
                Write-Verbose -Message "Removed static member ($Member) for $Identity"
            }
            Catch {
                    Throw "Failed to remove static member ($Member) for $Identity"
            }
        ## endregion
    }

    end {

    }
}
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
function Set-RIDGroupCoOwner {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [Alias("TargetGroup","Group")]
        [String]
            $Identity,
        [parameter(Mandatory=$TRUE,Position=1,ValueFromPipelineByPropertyName)]
        [Alias("TargetCoOwner","User")]
        [String]
            $Member,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        Write-Verbose -Message "Attempting to set GroupCoOwner for $Identity"
        Try {
            Set-ADGroup -Identity $Identity -Server $Server -Add @{idautoGroupCoOwners="$Member"} -ErrorAction Stop
            Write-Verbose -Message "Set GroupCoOwner ($Member) for $Identity"
        }
        Catch
            {
                Throw "Failed to set GroupCoOwner for $Identity"
        }
    }

    end {

    }
}
function Set-RIDGroupLogic {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [parameter(Mandatory=$TRUE,Position=1,ValueFromPipelineByPropertyName)]
        [String]
            $Logic,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        ## region Code
            ## Set logic attribute
                Write-Verbose -Message "Attempting to set include logic for $Identity"
                Try {
                    Set-ADGroup -Identity $Identity -Server $Server -Add @{idautoGroupIncludeFilter="$Logic"} -ErrorAction Stop
                    Write-Verbose -Message "Set include logic ($logic) for $Identity"
                }
                Catch
                    {
                        Throw "Failed to set include logic for $Identity"
                }
        ## endregion
    }

    end {

    }
}
function Set-RIDGroupStaticMember {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [Alias("TargetGroup","Group")]
        [String]
            $Identity,
        [parameter(Mandatory=$TRUE,Position=1,ValueFromPipelineByPropertyName)]
        [Alias("TargetCoOwner","User")]
        [String]
            $Member,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        Write-Verbose -Message "Attempting to set stativ member for $Identity"
        Try {
            Set-ADGroup -Identity $Identity -Server $Server -Add @{idautoGroupStaticIncludes="$Member"} -ErrorAction Stop
            Write-Verbose -Message "Set stativ member ($Member) for $Identity"
        }
        Catch
            {
                Throw "Failed to set stativ member for $Identity"
        }
    }

    end {

    }
}
function Set-RIDUserOverrideNote {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [Alias("User")]
        [String]
            $Identity,
        [parameter(Mandatory=$TRUE,Position=1,ValueFromPipelineByPropertyName)]
        [Alias("Info")]
        [String]
            $Note,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        ## region Code
            ## Set note attribute
                Write-Verbose -Message "Attempting to set term date for $Identity"
                Try {
                    Set-ADUser -Identity $Identity -Server $Server -Add @{idautoPersonStatusOverride="$note"} -ErrorAction Stop
                    Write-Verbose -Message "Set term date ($note) for $Identity"
                }
                Catch
                    {
                        Throw "Failed to set term date ($note) for $Identity"
                }
        ## endregion
    }

    end {

    }
}
function Set-RIDUserOverrideStatus {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [Alias("User")]
        [String]
            $Identity,
        [parameter(Mandatory=$TRUE,Position=1,ValueFromPipelineByPropertyName)]
        [Switch]
            $Status,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        ## region Code
            ## Set note attribute
                Write-Verbose -Message "Attempting to set override status for [$Identity]"
                Try {
                    If ($Status) {
                        Set-ADUser -Identity $Identity -Server $Server -Add @{idautoPersonOverride=$true} -ErrorAction Stop
                    } else {
                        Set-ADUser -Identity $Identity -Server $Server -Add @{idautoPersonOverride=$false} -ErrorAction Stop
                    }
                    Write-Verbose -Message "Set override status to [$status] for [$Identity]"
                }
                Catch
                    {
                        Throw "Failed to set override status [$status] for [$Identity]"
                }
        ## endregion
    }

    end {

    }
}
function Set-RIDUserTermDate {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [Alias("User")]
        [String]
            $Identity,
        [parameter(Mandatory=$TRUE,Position=1,ValueFromPipelineByPropertyName)]
        [Alias("TermDate")]
        [DateTime]
            $Date,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        ## region Code
            ##Build Term Date entry
                $TermDate = "DTD$(Get-Date -Date $Date -Format "yyyyMMdd")"
            ## Set termdate attribute
                Write-Verbose -Message "Attempting to set term date for $Identity"
                Try {
                    Set-ADUser -Identity $Identity -Server $Server -Add @{idautoPersonTermDate="$TermDate"} -ErrorAction Stop
                    Write-Verbose -Message "Set term date ($logic) for $Identity"
                }
                Catch
                    {
                        Throw "Failed to set term date ($TermDate) for $Identity"
                }
        ## endregion
    }

    end {

    }
}
function Test-RIDGroupCoOwner {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        If ($Null -eq (Get-ADGroup -Identity $Identity -Property idautoGroupCoOwners -Server $Server | Select-Object -ExpandProperty idautoGroupCoOwners))
            {Write-Output $FALSE -NoEnumerate}
        Else
            {Write-Output $TRUE -NoEnumerate}
    }

    end {

    }
}
function Test-RIDGroupLogic {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        If ($Null -eq (Get-ADGroup -Identity $Identity -Property idautoGroupIncludeFilter -Server $Server | Select-Object -ExpandProperty idautoGroupIncludeFilter))
            {Write-Output $FALSE -NoEnumerate}
        Else
            {Write-Output $TRUE -NoEnumerate}
    }

    end {

    }
}
function Test-RIDGroupStaticMember {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        If ($Null -eq (Get-ADGroup -Identity $Identity -Property idautoGroupStaticIncludes -Server $Server | Select-Object -ExpandProperty idautoGroupStaticIncludes))
            {Write-Output $FALSE -NoEnumerate}
        Else
            {Write-Output $TRUE -NoEnumerate}
    }

    end {

    }
}
function Test-RIDUserOverrideNote {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        If ($Null -eq (Get-ADUser -Identity $Identity -Property idautoPersonStatusOverride -Server $Server |
                Select-Object -ExpandProperty idautoPersonStatusOverride))
            {Write-Output $FALSE -NoEnumerate}
        Else
            {Write-Output $TRUE -NoEnumerate}
    }

    end {

    }
}
function Test-RIDUserOverrideStatus {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        If ($Null -eq (Get-ADUser -Identity $Identity -Property idautoPersonOverride -Server $Server |
                Select-Object -ExpandProperty idautoPersonOverride) -OR $False -eq (Get-ADUser -Identity $Identity -Property idautoPersonOverride -Server $Server |
                Select-Object -ExpandProperty idautoPersonOverride) )
            {Write-Output $FALSE -NoEnumerate}
        Else
            {Write-Output $TRUE -NoEnumerate}
    }

    end {

    }
}
function Test-RIDUserTermDate {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        If ($Null -eq (Get-ADUser -Identity $Identity -Property idautoPersonTermDate -Server $Server |
                Select-Object -ExpandProperty idautoPersonTermDate) -OR
                (Get-ADUser -Identity $Identity -Property idautoPersonTermDate -Server $Server).idautoPersonTermDate.length -le 4
            )
            {Write-Output $FALSE -NoEnumerate}
        Else
            {Write-Output $TRUE -NoEnumerate}
    }

    end {

    }
}
