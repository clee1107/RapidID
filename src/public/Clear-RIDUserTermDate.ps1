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