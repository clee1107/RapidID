$FunctionName =  "Clear-RIDUserTermDate"
Describe 'Clear-RIDUserTermDate' -Tag 'Clear-RIDUserTermDate','RIDUserTermDate' {
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
			$helpinfo = Get-Help Clear-RIDUserTermDate
		}

		It 'should have Identity as mandatory' {
			{Clear-RIDUserTermDate -Identity $null} | Should -Throw
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
            Mock Set-ADUser {
                [PSCustomObject]@{
                    name                     = 'PesterUser'
                    idautoPersonTermDate       = "2020"
                }
            }
        }
        It 'should call Set-ADUser' {
            Clear-RIDUserTermDate -Identity "PesterUser"

            Should -Invoke Set-ADUser -Times 1 -Scope It
        }
        It 'should call -clear idautoPersonTermDate value' {
            Clear-RIDUserTermDate -Identity "PesterUser"

            Assert-MockCalled 'Set-ADUser' -ParameterFilter { $Clear -eq 'idautoPersonTermDate' } -Scope It -Exactly 1
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
