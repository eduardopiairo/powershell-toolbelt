# Start/Stop Windows Services

# Jenkins
Start-Service Jenkins

Stop-Service Jenkins


# TeamCity
Start-Service TeamCity
Start-Service TCBuildAgent

Stop-Service TeamCity
Stop-Service TCBuildAgent


# Octopus Deploy
Start-Service OctopusDeploy
Start-Service "OctopusDeploy Tentacle"

Stop-Service OctopusDeploy
Stop-Service "OctopusDeploy Tentacle"


# SQL Server 2014 (EP14)
Start-Service -DisplayName "SQL Server (EP14)"
Start-Service -DisplayName "SQL Server Agent (EP14)"

Stop-Service -DisplayName "SQL Server (EP14)"
Stop-Service -DisplayName "SQL Server Agent (EP14)"


# SQL Server 2016 (EP16)
Start-Service -DisplayName "SQL Server (EP16)"
Start-Service -DisplayName "SQL Server Agent (EP16)"

Stop-Service -DisplayName "SQL Server (EP16)"
Stop-Service -DisplayName "SQL Server Agent (EP16)"


# SQL Server 2017 (EP17)
Start-Service -DisplayName "SQL Server (EP17)"
Start-Service -DisplayName "SQL Server Agent (EP17)"

Stop-Service -DisplayName "SQL Server (EP17)"
Stop-Service -DisplayName "SQL Server Agent (EP17)"