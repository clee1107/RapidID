Describe 'GroupLogic' -Tag "GroupLogic" {
    BeforeAll {
        #Create groups for testing against
            #WithLogic
                $GroupName = 'Pester_GroupWithLogic'
                $OUPath = "OU=Security Groups,OU=Test Site,DC=ISD720,DC=COM"
                $Server = (Get-ADDomainController).HostName
                $Logic = "(&(employeetype=staff))"
                $GroupWithLogicParms = @{
                    Description       = 'Pester Test - Group with Logic'
                    Name              = $GroupName
                    SamAccountName    = $GroupName
                    DisplayName       = $GroupName
                    GroupCategory     = 'Security'
                    GroupScope        = 'Global'
                    Path = $OUPath
                }
                New-ADGroup @GroupWithLogicParms -Server $Server
                Set-ADGroup -Identity $GroupName -Add @{idautoGroupIncludeFilter="$Logic"} -Server $Server
            #WithoutLogic
            $GroupName = 'Pester_GroupWithoutLogic'
            $OUPath = "OU=Security Groups,OU=Test Site,DC=ISD720,DC=COM"
            $Server = (Get-ADDomainController).HostName
            $GroupWithoutLogicParms = @{
                Description       = 'Pester Test - Group without Logic'
                Name              = $GroupName
                SamAccountName    = $GroupName
                DisplayName       = $GroupName
                GroupCategory     = 'Security'
                GroupScope        = 'Global'
                Path = $OUPath
            }
            New-ADGroup @GroupWithoutLogicParms -Server $Server
    }
    Context 'Get' {
        It 'Get-RIDGroupLogic target group has logic should return data' {
            $GroupLogic = Get-RIDGroupLogic -Identity $GroupWithLogicParms.Name
            $GroupLogic.idautoGroupIncludeFilter | Should -Not -BeNullOrEmpty
        }
        It 'Get-RIDGroupLogic target group doensn''t have logic should return data' {
            $GroupLogic = Get-RIDGroupLogic -Identity $GroupWithoutLogicParms.Name
            $GroupLogic.idautoGroupIncludeFilter | Should -BeNullOrEmpty
        }
    }
    Context 'Set' {
        It 'Set-RIDGroupLogic should set logic' {
            Set-RIDGroupLogic -Identity $GroupWithoutLogicParms.Name -Logic $Logic
            (Get-RIDGroupLogic -Identity $GroupWithoutLogicParms.Name).idautoGroupIncludeFilter | Should -Not -BeNullOrEmpty
        }
        It 'Set-RIDGroupLogic should throw error if already set' {
            {Set-RIDGroupLogic -Identity $GroupWithLogicParms.Name -Logic (Get-GUID)} | Should -Throw
        }
    }
    Context 'Remove' {
        It 'Remove-RIDGroupLogic should remove set logic and return null' {
            Remove-RIDGroupLogic -Identity $GroupWithLogicParms.Name
            (Get-RIDGroupLogic -Identity $GroupWithLogicParms.Name).idautoGroupIncludeFilter | Should -BeNullOrEmpty
        }
    }
    Context 'Test' {
        It 'Test-RIDGroupLogic should return True if logic set' {
            Test-RIDGroupLogic -Identity $GroupWithoutLogicParms.Name | Should -BeTrue
        }
        It 'Test-RIDGroupLogic should return False if logic NULL' {
            Test-RIDGroupLogic -Identity $GroupWithLogicParms.Name | Should -BeFalse
        }
    }
    AfterAll {
        Remove-ADGroup -Identity $GroupWithLogicParms.Name -Confirm:$False -Server $Server
        Remove-ADGroup -Identity $GroupWithoutLogicParms.Name -Confirm:$False -Server $Server
    }
}
