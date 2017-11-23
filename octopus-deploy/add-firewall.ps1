$ipToAdd = Invoke-RestMethod http://ipinfo.io/json | Select-Object -exp ip

$firewallRules = Get-AzureRmSqlServerFirewallRule -ResourceGroupName "#{Azure-Resource-Group}" -ServerName "devopsporto-solution-sqlserver" | Select-Object FirewallRuleName 

$ruleExists = 0

foreach ($rule in $firewallRules) {

    if ($rule.FirewallRuleName.Equals("Rule01")) {

        $ruleExists = 1
        
    }
}

if ($ruleExists.Equals(0)) {

    New-AzureRmSqlServerFirewallRule -ResourceGroupName "#{Azure-Resource-Group}" -ServerName "devopsporto-solution-sqlserver" -FirewallRuleName "Rule01" -StartIpAddress $ipToAdd -EndIpAddress $ipToAdd
}