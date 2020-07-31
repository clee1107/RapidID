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