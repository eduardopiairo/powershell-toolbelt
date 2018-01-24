# Remove a specific rule from Azure SQl Server firewall 

$firewallRuleName = "OctoServer"

$firewallRules = Get-AzureRmSqlServerFirewallRule -ResourceGroupName "#{Azure-Resource-Group}" -ServerName "#{Database-Server-Name}" | Select-Object FirewallRuleName

$ruleExists = 0

foreach ($rule in $firewallRules) {

    if ($rule.FirewallRuleName.Equals($firewallRuleName)) {

        $ruleExists = 1
        
        Write-Output "Rule already exist and will be deleted"

        Remove-AzureRmSqlServerFirewallRule -ResourceGroupName $rg -ServerName $dbServer -FirewallRuleName $firewallRuleName
    }
}

if ($ruleExists.Equals(0)) {

    Write-Output "Rule do not exist"
}