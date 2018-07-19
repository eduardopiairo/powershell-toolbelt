# Login Azure DE
#Add-AzureRmAccount -EnvironmentName AzureGermanCloud


# Login Azure EU
Add-AzureRmAccount


# Get Azure subscriptions
Get-AzureRmSubscription

# Select a subscription
Select-AzureRmSubscription -SubscriptionName my_subscription_name


# Get context info (Current Subscription)
Get-AzureRmContext


# Get Resource Groups
Get-AzureRmResourceGroup | Format-Table

Get-AzureRmResourceGroup -Name resource_group_name


# Deploy resources

$rG = "my_resource_group"
$templateFilePath = "path_to_my_template_file"
$parameterFilePath = "path_to_my_parameter_file"

Test-AzureRmResourceGroupDeployment -ResourceGroupName $rG -TemplateFile $templateFilePath -TemplateParameterFile $parameterFilePath

New-AzureRmResourceGroupDeployment -Name name_of_deploy -ResourceGroupName $rG -TemplateFile $templateFilePath -TemplateParameterFile $parameterFilePath


