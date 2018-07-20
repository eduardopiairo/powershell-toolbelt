. .\SQLCover.ps1

$result = Get-CoverTSql  .\SQLCover.dll "server=EDPIAIRO\EDP17;integrated security=sspi;"  "DevOpsPorto-Db-Test" "exec tSQLt.RunAll"

Export-Html $result .