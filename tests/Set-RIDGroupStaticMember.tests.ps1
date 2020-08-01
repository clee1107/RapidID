$FunctionName =  "Set-RIDGroupStaticMember"
Describe 'Set-RIDGroupStaticMember' -Tag 'Set-RIDGroupStaticMember','RIDGroupStaticMember' {
    BeforeAll {
        Mock Get-ADDomainController {
            [PSCustomObject]@{
                HostName = 'dc1.domain.com'
            }
        }
        Mock Set-ADGroup {
            Return $Null
        }
    }
    Context 'Parameter & Help  Checks' {
		Set-StrictMode -Version latest
		BeforeAll {
			$helpinfo = Get-Help Set-RIDGroupStaticMember
		}

		It 'should have Identity as mandatory' {
			{Set-RIDGroupStaticMember -Identity $null} | Should -Throw
        }
        It 'should have Member as mandatory' {
			{Set-RIDGroupStaticMember -Member $null} | Should -Throw
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
        It 'should call Set-ADGroup' {
            Set-RIDGroupStaticMember -Identity "PesterGroup" -Member "Someone"

            Should -Invoke Set-ADGroup -Times 1 -Scope It
        }
        It 'should call -add @(idautoGroupStaticIncludes)' {
            Set-RIDGroupStaticMember -Identity "GroupWithLogic" -Member "DN"

            Assert-MockCalled 'Set-ADGroup' -ParameterFilter { $Add.ContainsKey("idautoGroupStaticIncludes") } -Scope It -Exactly 1
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
