# Plaster

Plaster is a template-based file and project generator written in PowerShell. Its purpose is to streamline the creation of PowerShell module projects, Pester tests, DSC configurations, and more. File generation is performed using crafted templates which allow the user to fill in details and choose from options to get their desired output. [GitHub](https://github.com/PowerShell/Plaster)

````powershell
$plasterDest = 'C:\Users\eduardopiairo\OneDrive\Playground\pester\my-pester-tests'

$defaultTemplate = Get-PlasterTemplate | Where-Object -FilterScript {$PSItem.Title -eq 'New PowerShell Manifest Module'}

Invoke-Plaster -TemplatePath $defaultTemplate.TemplatePath -DestinationPath $plasterDest\MyFirstPlasterModule  -Verbose
````