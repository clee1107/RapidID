function Set-RIDGroupStaticMember {
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
        Write-Verbose -Message "Attempting to set stativ member for $Identity"
        Try {
            Set-ADGroup -Identity $Identity -Server $Server -Add @{idautoGroupStaticIncludes="$Member"} -ErrorAction Stop
            Write-Verbose -Message "Set stativ member ($Member) for $Identity"
        }
        Catch
            {
                Throw "Failed to set stativ member for $Identity"
        }
    }

    end {

    }
}