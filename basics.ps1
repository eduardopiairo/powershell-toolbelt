###** The BASICS 

# Get modules in the system
Get-Module -All


# Get specific module
Get-Module -ListAvailable -Name dbatools
Get-Module -ListAvailable -Name Azure


# Unnistall a module
Uninstall-Module -Name Pester -AllVersions


# Install Modules

## Pester
Install-Module -Name Pester -Force -SkipPublisherCheck

# Get available functions
Get-Command -Module pester -CommandType Function

## dbatools 
Install-Module dbatools

Update-Module dbatools

Import-Module dbatools

# Get available functions
Get-Command -Module dbatools -CommandType Function


