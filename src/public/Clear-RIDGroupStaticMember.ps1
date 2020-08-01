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