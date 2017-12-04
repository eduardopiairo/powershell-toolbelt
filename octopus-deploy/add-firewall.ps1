$ipToAdd = Invoke-RestMethod http://ipinfo.io/json | Select-Object -exp ip

$firewallRules = Get-AzureRmSqlServerFirewallRule -ResourceGroupName "#{Azure-Resource-Group}" -ServerName "MyServerName" | Select-Object FirewallRuleName 

$ruleExists = 0

foreach ($rule in $firewallRules) {

    if ($rule.FirewallRuleName.Equals("Rule01")) {

        $ruleExists = 1
        
    }
}

if ($ruleExists.Equals(0)) {

    New-AzureRmSqlServerFirewallRule -ResourceGroupName "#{Azure-Resource-Group}" -ServerName "MyServerName" -FirewallRuleName "MyRuleName" -StartIpAddress $ipToAdd -EndIpAddress $ipToAdd
}