$FunctionName =  "Clear-RIDGroupCoOwner"
Describe 'Clear-RIDGroupCoOwner' -Tag 'Clear-RIDGroupCoOwner','RIDGroupCoOwner' {
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
			$helpinfo = Get-Help Clear-RIDGroupCoOwner
		}

		It 'should have Identity as mandatory' {
			{Clear-RIDGroupCoOwner -Identity $null} | Should -Throw
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
            Mock Set-ADGroup {
                [PSCustomObject]@{
                    name                     = 'PesterGroup'
                    idautoGroupCoOwners       = "Someone"
                }
            }
        }
        It 'should call Set-ADGroup' {
            Clear-RIDGroupCoOwner -Identity "PesterGroup"

            Should -Invoke Set-ADGroup -Times 1 -Scope It
        }
        It 'should call -clear idautoGroupCoOwners value' {
            Clear-RIDGroupCoOwner -Identity "PesterGroup"

            Assert-MockCalled 'Set-ADGroup' -ParameterFilter { $Clear -eq 'idautoGroupCoOwners' } -Scope It -Exactly 1
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
