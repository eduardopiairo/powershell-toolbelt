Write-Host "---+++ FlywayMigrations +++---"

#**** Copy Migrations **********
Remove-Item "Z:\flyway\sql\*.*" | Where { ! $_.PSIsContainer }

$copy_source = $OctopusParameters["Octopus.Action[$downloadDbPackStep].Output.Package.InstallationDirectoryPath"] + "\flyway_migrations\*.*"

Write-Host $copy_source

$copy_target = "Z:\flyway\sql" 

Copy-Item $copy_source $copy_target  

#**** Apply Migrations **********
write-Host "---*** FlyInfo ***---"

Z:\flyway\flyway.cmd info "-user=$dbDeployUser" "-password=$dbDeployPassword" "-url=jdbc:sqlserver://$serverName;databaseName=$dbName" 

Write-Host "---*** FlyMigrate ***---"

$flywayMigrate = Z:\flyway\flyway.cmd migrate "-user=$dbDeployUser" "-password=$dbDeployPassword" "-url=jdbc:sqlserver://$serverName;databaseName=$dbName"

Write-Output $flywayMigrate

if ($flywayMigrate -like '*ERROR:*') 
{
    Write-Host "Found error. Requires validation!" 
    exit 1
}