# Add a rule to Azure SQl Server firewall using the host IP 

$ipToAdd = Invoke-RestMethod http://ipinfo.io/json | Select-Object -exp ip

$firewallRuleName = "VSTSagent"

$firewallRules = Get-AzureRmSqlServerFirewallRule -ResourceGroupName "#{Azure-Resource-Group}" -ServerName "#{Database-Server-Name}" | Select-Object FirewallRuleName
 
$ruleExists = 0

foreach ($rule in $firewallRules) {

    if ($rule.FirewallRuleName.Equals($firewallRuleName)) {

        $ruleExists = 1
        
        Write-Output "Rule already exist"
    }
}

if ($ruleExists.Equals(0)) {

    New-AzureRmSqlServerFirewallRule -ResourceGroupName "#{Azure-Resource-Group}" -ServerName "#{Database-Server-Name}" -FirewallRuleName $firewallRuleName -StartIpAddress $ipToAdd -EndIpAddress $ipToAdd

    Write-Output "Rule created"
}