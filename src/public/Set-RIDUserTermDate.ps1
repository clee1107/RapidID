function Set-RIDUserTermDate {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [Alias("User")]
        [String]
            $Identity,
        [parameter(Mandatory=$TRUE,Position=1,ValueFromPipelineByPropertyName)]
        [Alias("TermDate")]
        [DateTime]
            $Date,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        ## region Code
            ##Build Term Date entry
                $TermDate = "DTD$(Get-Date -Date $Date -Format "yyyyMMdd")"
            ## Set termdate attribute
                Write-Verbose -Message "Attempting to set term date for $Identity"
                Try {
                    Set-ADUser -Identity $Identity -Server $Server -Add @{idautoPersonTermDate="$TermDate"} -ErrorAction Stop
                    Write-Verbose -Message "Set term date ($logic) for $Identity"
                }
                Catch
                    {
                        Throw "Failed to set term date ($TermDate) for $Identity"
                }
        ## endregion
    }

    end {

    }
}