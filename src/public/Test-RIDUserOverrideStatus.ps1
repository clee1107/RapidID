function Test-RIDUserOverrideStatus {
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
        If ($Null -eq (Get-ADUser -Identity $Identity -Property idautoPersonOverride -Server $Server |
                Select-Object -ExpandProperty idautoPersonOverride) -OR $False -eq (Get-ADUser -Identity $Identity -Property idautoPersonOverride -Server $Server |
                Select-Object -ExpandProperty idautoPersonOverride) )
            {Write-Output $FALSE -NoEnumerate}
        Else
            {Write-Output $TRUE -NoEnumerate}
    }

    end {

    }
}