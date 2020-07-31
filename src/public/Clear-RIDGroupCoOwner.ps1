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