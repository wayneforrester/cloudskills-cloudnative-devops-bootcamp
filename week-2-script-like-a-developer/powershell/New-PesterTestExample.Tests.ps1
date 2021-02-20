# To run the test:
# Invoke-Pester ./New-PesterTestExample.ps1

Describe "New-ResourceGroup" {

    It "Name should be cloudskillsbootcamp" {
        $name = 'cloudskillsbootcamp'
        $name | Should -Be 'cloudskillsbootcamp'
    }

    It "Location should be eastus2" {
        $location = 'eastus2'
        $location | Should -Be 'eastus2'
    }   
}
