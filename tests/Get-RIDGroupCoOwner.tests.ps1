$FunctionName =  "Get-RIDGroupCoOwner"
Describe 'Get-RIDGroupCoOwner' -Tag 'Get-RIDGroupCoOwner','RIDGroupCoOwner' {
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
			$helpinfo = Get-Help Get-RIDGroupCoOwner
		}

		It 'should have Identity as mandatory' {
			{Get-RIDGroupCoOwner -Identity $null} | Should -Throw
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
                    idautoGroupCoOwners       = "DN"
                }
            }
        }
        It 'should call Get-ADGroup' {
            Get-RIDGroupCoOwner -Identity "PesterGroup"

            Should -Invoke Get-ADGroup -Times 1 -Scope It
        }
        It 'should return idautoGroupCoOwners value' {
            (Get-RIDGroupCoOwner -Identity "PesterGroup").idautoGroupCoOwners | Should -BeTrue
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
