$FunctionName =  "Get-RIDGroupLogic"
Describe 'Get-RIDGroupLogic' -Tag "Get-RIDGroupLogic" {
    Context 'Get' {
        BeforeAll {
            Mock Get-ADDomainController {
                [PSCustomObject]@{
                    HostName = 'dc1.domain.com'
                }
            }
            Mock Get-ADGroup {
                [PSCustomObject]@{
                    name                     = 'PesterGroupWithLogic'
                    idautoGroupIncludeFilter = "(&(employeetype=staff))"
                }
            }
        }
        It 'Get-RIDGroupLogic should run Get-ADGroup' {
            Get-RIDGroupLogic -Identity "Doesn'tMatter"

            Should -Invoke Get-ADGroup -Times 1 -Scope It
        }
        It 'Get-RIDGroupLogic target group idautologicIncludeFilter should not be null' {
            (Get-RIDGroupLogic -Identity "Doesn'tMatter").idautoGroupIncludeFilter | Should -Not -BeNullOrEmpty
        }

    }
    Context 'ScriptAnalyzer' {
        $Path = Get-ChildItem -Path .\src -Filter "*$FunctionName*" -Recurse | Select-Object -ExpandProperty FullName
        $ScriptAnalyzerResults = Invoke-ScriptAnalyzer -Path $Path -Severity Warning
        It 'Should not return any violations' {
            $ScriptAnalyzerResults | Should -BeNullOrEmpty
        }
    }
}
