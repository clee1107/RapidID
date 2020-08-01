$FunctionName =  "Test-RIDUserOverrideNote"
Describe 'Test-RIDUserOverrideNote' -Tag 'Test-RIDUserOverrideNote','RIDUserOverrideNote' {
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
			$helpinfo = Get-Help Test-RIDUserOverrideNote
		}

		It 'should have Identity as mandatory' {
			{Test-RIDUserOverrideNote -Identity $null} | Should -Throw
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
            Mock Get-ADUser {
                [PSCustomObject]@{
                    name                     = 'PesterUser'
                    idautoPersonStatusOverride       = "Some Note(s)"
                }
            }
        }
        It 'should call Get-ADUser' {
            Test-RIDUserOverrideNote -Identity "PesterUser"

            Should -Invoke Get-ADUser -Times 1 -Scope It
        }
        It 'should return True (user has Override Note(s))' {
            Test-RIDUserOverrideNote -Identity "PesterUser" | Should -BeTrue
        }
        It 'should return False (user has no Override Note(s))' {
            Mock Get-ADUser {
                [PSCustomObject]@{
                    name                     = 'PesterUser'
                    idautoPersonStatusOverride       = $null
                }
            }

            Test-RIDUserOverrideNote -Identity "PesterUser" | Should -BeFalse
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
