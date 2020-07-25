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
function Remove-RIDGroupLogic {
    [CmdletBinding()]
    param (
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
                        Throw "Failed to remove include logic for $Identity"
                }
        ## endregion
    }

    end {

    }
}
function Set-RIDGroupLogic {
    [CmdletBinding()]
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
        If ((Get-ADGroup -Identity $Identity -Property idautoGroupIncludeFilter -Server $Server | Select-Object -ExpandProperty idautoGroupIncludeFilter) -eq $Null)
            {Return $FALSE}
        Else
            {Return $TRUE}
    }

    end {

    }
}
