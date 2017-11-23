#Get modules in the system
Get-Module -All

#Get specific module
Get-Module -ListAvailable -Name dbatools

Uninstall-Module -Name Pester -AllVersions


### Install Modules

# Pester
Install-Module -Name Pester -Force -SkipPublisherCheck

Get-Command -Module pester -CommandType Function

#dbatools 
Install-Module dbatools

Get-Command -Module dbatools -CommandType Function


