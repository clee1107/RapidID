function Test-RIDUserTermDate {
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
        If ($Null -eq (Get-ADUser -Identity $Identity -Property idautoPersonTermDate -Server $Server |
                Select-Object -ExpandProperty idautoPersonTermDate) -OR
                (Get-ADUser -Identity $Identity -Property idautoPersonTermDate -Server $Server).idautoPersonTermDate.length -le 4
            )
            {Write-Output $FALSE -NoEnumerate}
        Else
            {Write-Output $TRUE -NoEnumerate}
    }

    end {

    }
}