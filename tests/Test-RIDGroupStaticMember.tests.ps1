$FunctionName =  "Test-RIDGroupStaticMember"
Describe 'Test-RIDGroupStaticMember' -Tag 'Test-RIDGroupStaticMember','RIDGroupStaticMember' {
    BeforeAll {
        Mock Get-ADDomainController {
            [PSCustomObject]@{
                HostName = 'dc1.domain.com'
            }
        }
    }
    Context 'Parameter & Help  Checks' {
		Set-StrictMode -Version latest
		BeforeAll {
			$helpinfo = Get-Help Test-RIDGroupStaticMember
		}

		It 'should have Identity as mandatory' {
			{Test-RIDGroupStaticMember -Identity $null} | Should -Throw
		}
		It 'should have Help' {
			$helpinfo | Should -Not -BeNullOrEmpty
		}
		It 'should have Help containing examples, Description, and Details' {
			$helpinfo.examples | Should -Not -BeNullOrEmpty  # should have examples
            $helpinfo.Details | Should -Not -BeNullOrEmpty   # Should have Details in the Help
            $helpinfo.Description | Should -Not -BeNullOrEmpty # Should have a Descriptiong for the Function
		}
	}
    Context 'function checks' {
        BeforeAll {
            Mock Get-ADGroup {
                [PSCustomObject]@{
                    name                     = 'PesterGroup'
                    idautoGroupStaticIncludes       = "DN"
                }
            }
        }
        It 'should call Get-ADGroup' {
            Test-RIDGroupStaticMember -Identity "PesterGroup"

            Should -Invoke Get-ADGroup -Times 1 -Scope It
        }
        It 'should return True (group has any static member(s))' {
            Test-RIDGroupStaticMember -Identity "PesterGroup" | Should -BeTrue
        }
        It 'should return False (group doens''t have any static member(s))' {
            Mock Get-ADGroup {
                [PSCustomObject]@{
                    name                     = 'PesterGroup'
                    idautoGroupStaticIncludes       = $Null
                }
            }

            Test-RIDGroupStaticMember -Identity "PesterGroup" | Should -BeFalse
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
