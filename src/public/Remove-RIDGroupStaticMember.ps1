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