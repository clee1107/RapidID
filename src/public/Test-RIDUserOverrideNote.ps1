function Test-RIDUserOverrideNote {
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
        If ($Null -eq (Get-ADUser -Identity $Identity -Property idautoPersonStatusOverride -Server $Server |
                Select-Object -ExpandProperty idautoPersonStatusOverride))
            {Write-Output $FALSE -NoEnumerate}
        Else
            {Write-Output $TRUE -NoEnumerate}
    }

    end {

    }
}