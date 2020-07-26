function Remove-RIDGroupLogic {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [String]
            $Identity,
        [String]
            $Server= (Get-ADDomainController).HostName
    )

    begin {

    }

    process {
        ## region Code
            ## Set logic attribute
                Write-Verbose -Message "Attempting to clear include logic for $Identity"
                Try {
                    Set-ADGroup -Identity $Identity -Server $Server -Clear idautoGroupIncludeFilter -ErrorAction Stop
                    Write-Verbose -Message "Cleared include logic for $Identity"
                }
                Catch {
                        Throw "Failed to remove include logic for $Identity"
                }
        ## endregion
    }

    end {

    }
}