[cmdletbinding()]
param(
    [string[]]$Task = 'ModuleBuild'
)

$DependentModules = @('InvokeBuild','PlatyPS',"PSDeploy","Pester") # add pester when pester tests are added, 'PSDeploy',
Foreach ($Module in $DependentModules){
    If (-not (Get-Module $module -ListAvailable)){
        Install-Module -name $Module -Scope CurrentUser -Force
    }
    Import-Module $module -ErrorAction Stop
}
# Builds the module by invoking psake on the build.psake.ps1 script.
Invoke-Build "$PSScriptRoot\RapidID.build.ps1" -Task $Task
