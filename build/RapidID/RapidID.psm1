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
function Remove-RIDGroupCoOwner {
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
