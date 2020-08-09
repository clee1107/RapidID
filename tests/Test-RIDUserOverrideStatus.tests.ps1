$FunctionName =  "Test-RIDUserOverrideStatus"
Describe 'Test-RIDUserOverrideStatus' -Tag 'Test-RIDUserOverrideStatus','RIDUserOverrideStatus' {
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
			$helpinfo = Get-Help Test-RIDUserOverrideStatus
		}

		It 'should have Identity as mandatory' {
			{Test-RIDUserOverrideStatus -Identity $null} | Should -Throw
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
                    idautoPersonOverride       = $True
                }
            }
        }
        It 'should call Get-ADUser' {
            Test-RIDUserOverrideStatus -Identity "PesterUser"

            Should -Invoke Get-ADUser -Times 1 -Scope It
        }
        It 'should return True (user has Override set' {
            Test-RIDUserOverrideStatus -Identity "PesterUser" | Should -BeTrue
        }
        It 'should return False (user is not set for override)' {
            Mock Get-ADUser {
                [PSCustomObject]@{
                    name                     = 'PesterUser'
                    idautoPersonOverride       = $null
                }
            }

            Test-RIDUserOverrideStatus -Identity "PesterUser" | Should -BeFalse
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
