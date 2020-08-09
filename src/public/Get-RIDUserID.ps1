function Get-RIDUserID {
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
        $Object = Get-ADUser -Identity $Identity -property idautoID -Server $Server | Select-Object -Property name, idautoID
        Return $Object
    }

    end {

    }
}