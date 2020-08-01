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