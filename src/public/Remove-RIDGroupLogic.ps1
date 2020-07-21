function Remove-RIDGroupLogic {
    [CmdletBinding()]
    param (
        [String]
            $Identity,
        [String]
            $Server= (Get-ADDomain | Select-Object -ExpandProperty DNSRoot)
    )

    begin {

    }

    process {
        ## region Code
            ## Check if already has logic
                Write-Verbose -Message "Checking if group has include logic already."
                If ((Get-ADGroup -Identity $Identity -Property idautoGroupIncludeFilter -Server $Server | Select-Object -ExpandProperty idautoGroupIncludeFilter) -eq $NULL)
                    {
                        Throw "$Identity doesn't have include logic"
                    }
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