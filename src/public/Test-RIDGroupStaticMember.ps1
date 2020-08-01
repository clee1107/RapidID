function Test-RIDGroupStaticMember {
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
        If ($Null -eq (Get-ADGroup -Identity $Identity -Property idautoGroupStaticIncludes -Server $Server | Select-Object -ExpandProperty idautoGroupStaticIncludes))
            {Write-Output $FALSE -NoEnumerate}
        Else
            {Write-Output $TRUE -NoEnumerate}
    }

    end {

    }
}