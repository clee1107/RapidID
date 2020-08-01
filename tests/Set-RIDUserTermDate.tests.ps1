$FunctionName =  "Set-RIDUserTermDate"
Describe 'Set-RIDUserTermDate' -Tag 'Set-RIDUserTermDate','RIDUserTermDate' {
    BeforeAll {
        Mock Get-ADDomainController {
            [PSCustomObject]@{
                HostName = 'dc1.domain.com'
            }
        }
        Mock Set-ADUser {
            Return $Null
        }
    }
    Context 'Parameter & Help  Checks' {
		Set-StrictMode -Version latest
		BeforeAll {
			$helpinfo = Get-Help Set-RIDUserTermDate
		}

		It 'should have Identity as mandatory' {
			{Set-RIDUserTermDate -Identity $null} | Should -Throw
        }
        It 'should have Identity as mandatory' {
			{Set-RIDUserTermDate -Date $null} | Should -Throw
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
        It 'should call Set-ADUser' {
            Set-RIDUserTermDate -Identity "PesterUser" -Date "6/25/2020"

            Should -Invoke Set-ADUser -Times 1 -Scope It
        }
        It 'should call -add @(idautoPersonTermDate)' {
            Set-RIDUserTermDate -Identity "GroupWithLogic" -Date "6/25/2020"

            Assert-MockCalled 'Set-ADUser' -ParameterFilter { $Add.ContainsKey("idautoPersonTermDate") } -Scope It -Exactly 1
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
