function Set-RIDUserOverrideNote {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [parameter(Mandatory=$TRUE,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName)]
        [Alias("User")]
        [String]
            $Identity,
        [parameter(Mandatory=$TRUE,Position=1,ValueFromPipelineByPropertyName)]
        [Alias("Info")]
        [String]
            $Note,
        [String]
            $Server = (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        ## region Code
            ## Set note attribute
                Write-Verbose -Message "Attempting to set term date for $Identity"
                Try {
                    Set-ADUser -Identity $Identity -Server $Server -Add @{idautoPersonStatusOverride="$note"} -ErrorAction Stop
                    Write-Verbose -Message "Set term date ($note) for $Identity"
                }
                Catch
                    {
                        Throw "Failed to set term date ($note) for $Identity"
                }
        ## endregion
    }

    end {

    }
}