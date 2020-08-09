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