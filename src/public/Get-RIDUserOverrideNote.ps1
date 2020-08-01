function Get-RIDUserOverrideNote {
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
        $Object = Get-ADUser -Identity $Identity -property idautoPersonStatusOverride -Server $Server | Select-Object -Property name, idautoPersonStatusOverride
        Return $Object
    }

    end {

    }
}