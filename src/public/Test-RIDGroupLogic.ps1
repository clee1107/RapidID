function Test-RIDGroupLogic {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [String]
            $Identity,
        [String]
            $Server = (Get-ADDomain | Select-Object -ExpandProperty DNSRoot)
    )

    begin {

    }

    process {
        If ((Get-ADGroup -Identity $Identity -Property idautoGroupIncludeFilter -Server $Server | Select-Object -ExpandProperty idautoGroupIncludeFilter) -eq $Null)
            {Return $FALSE}
        Else
            {Return $TRUE}
    }

    end {

    }
}