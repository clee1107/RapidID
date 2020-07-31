$FunctionName =  "Test-RIDGroupLogic"
Describe 'Test-RIDGroupLogic' -Tag "Test-RIDGroupLogic" {
    BeforeAll {
        Mock Get-ADDomainController {
            [PSCustomObject]@{
                HostName = 'dc1.domain.com'
            }
        }
    }
    Context 'Group Exists, Filter set' {
        BeforeAll {
            Mock Get-ADGroup {
                [PSCustomObject]@{
                    name                     = 'GroupWithLogic'
                    idautoGroupIncludeFilter = "(&(employeetype=staff))"
                }
            }
        }
        It 'target group idautologicIncludeFilter set, should be True' {
            (Test-RIDGroupLogic -Identity "GroupWithLogic") | Should -BeTrue
        }
    }
    Context 'Group Exists, No Filter ($NULL)' {
        BeforeAll {
            Mock Get-ADGroup {
                [PSCustomObject]@{
                    name                     = 'GroupWithLogic'
                    idautoGroupIncludeFilter = $Null
                }
            }
        }
        It 'target group idautologicIncludeFilter not set ($NULL), should be False' {
            (Test-RIDGroupLogic -Identity "GroupWithLogic") | Should -BeFalse
        }
    }
    Context 'Group doesn''t exists' {
        BeforeAll {
            Mock Get-ADGroup {
            }
        }
        It 'target group doesn''t exist, should be False' {
            Test-RIDGroupLogic -Identity "GroupWithLogic" | Should -BeFalse
        }
    }
    Context 'Code Quality check - ScriptAnalyzer' {
        $Path = Get-ChildItem -Path .\src -Filter "*$FunctionName*" -Recurse | Select-Object -ExpandProperty FullName
        $ScriptAnalyzerResults = Invoke-ScriptAnalyzer -Path $Path -Severity Warning
        It 'Should not return any violations' {
            $ScriptAnalyzerResults | Should -BeNullOrEmpty
        }
    }
}