function Get-RIDUserTermDate {
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
        $Object = Get-ADUser -Identity $Identity -property idautoPersonTermDate -Server $Server | Select-Object -Property name, idautoPersonTermDate
        Return $Object
    }

    end {

    }
}