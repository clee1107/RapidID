<#$buildPath = $PSScriptRoot.replace('tests','build')
$moduleName = "RapidID"
$modulePath = "$buildPath\$moduleName"

Describe "RapidID Module" {
    Context 'Strict mode' {
        Set-StrictMode -Version latest
        Import-Module $ModulePath -Force
        It 'Should load' {
            $Module = Get-Module $ModuleName
            $Module.Name | Should -Be $ModuleName
            $Commands = $Module.ExportedCommands.Keys
            $Commands -contains 'Get-RIDGroupLogic' | Should -Be True
            $Commands -contains 'Remove-RIDGroupLogic' | Should -Be True
            $Commands -contains 'Set-RIDGroupLogic' | Should -Be True
            $Commands -contains 'Test-RIDGroupLogic' | Should -Be True
        }
    }
}#>

<# Generate Commands tests
$String = @"
`$Commands -contains '<>' | Should -Be $True
"@

Get-Command -Module RapidID | foreach {$string -replace '\<\>',$_.name}
#>