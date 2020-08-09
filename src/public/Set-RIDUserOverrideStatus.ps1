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