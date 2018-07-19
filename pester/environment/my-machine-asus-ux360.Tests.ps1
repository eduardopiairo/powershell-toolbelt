 Describe ("Delivering changes for dbs and apps"){
    Context "Pipeline"{
        #VSTS agent
        It "VSTS agent should be running"{
            (Get-Process AgentService -ErrorAction SilentlyContinue).Count | Should Be 1
        }

        #Jenkins server
        It "Jenkins should be closed" {
            (Get-Process jenkins -ErrorAction SilentlyContinue).Count | Should Be 0
        }

        #TeamCity server
        It "TeamCity server should be closed" {
            (Get-Process TeamCityService -ErrorAction SilentlyContinue).Count | Should Be 0
        }

        #TeamCity server
        It "TeamCity agent should be closed" {
            (Get-Process TeamCityAgentService-windows-x86-32 -ErrorAction SilentlyContinue).Count | Should Be 0
        }

        #Octopus Deploy server
        It "Octopus Deploy should be running"{
            (Get-Process Octopus.Server -ErrorAction SilentlyContinue).Count | Should Be 1
        }

        #Octopus Deploy tentacle
        It "Octopus Teantacle should be running"{
            (Get-Process Tentacle -ErrorAction SilentlyContinue).Count | Should Be 1
        }

        #SQL server
        It "MS SQL Servers should be running"{
            (Get-Process sqlservr -ErrorAction SilentlyContinue).Count | Should Be 2
        }
    }

    Context "Apps"{
        #Google Drive
        It "Google Drive should be closed"{
            (Get-Process googledrivesync -ErrorAction SilentlyContinue).Count | Should BeLessThan 1
        }

        #Docker
        It "Docker for Windows should be closed"{
            (Get-Process 'Docker for Windows' -ErrorAction SilentlyContinue).Count | Should Be 0
        }

        #OneDrive
        It "OneDrive should be closed"{
            (Get-Process 'OneDrive' -ErrorAction SilentlyContinue).Count | Should Be 0
        }

        #Edge
        It "Edge should be closed"{
        (Get-Process 'MicrosoftEdge' -ErrorAction SilentlyContinue).Count | Should Be 0
        }
    }
}
