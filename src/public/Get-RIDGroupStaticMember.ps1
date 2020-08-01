function Get-RIDGroupStaticMember {
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
        $Object = Get-ADGroup -Identity $Identity -property idautoGroupStaticIncludes -Server $Server | Select-Object -Property name, idautoGroupStaticIncludes
        Return $Object
    }

    end {

    }
}