## Mandatory Parameters
function New-VirtualMachine
{
	[CmdletBinding()]
	param
	(
        #Mandaroty parameter
        [Parameter(Mandatory)]
		[ValidateCount(1, 5)]
		[string[]]$Name,
		
		[Parameter()]
		[ValidateNotNullOrEmpty()]
		[ValidateRange(1, 5)]
		[int]$Count = 1,
		
		[Parameter()]
		[ValidateNotNull()]
		[ValidateRange(512MB, 1024MB)]
		[int]$MemoryStartupBytes,
		
		[Parameter()]
		[ValidateNotNullOrEmpty()]
		[ValidateSet('1', '2')]
		[int]$Generation = 2,
		
		[Parameter()]
		[ValidateScript({
			if (Test-Connection -ComputerName $_ -Quiet -Count 1)
			{
				throw "The computer [$_] is offline. Try another"
			}
			else
			{
				$true
			}
		})]
		[ValidatePattern('^C:\\')]
		[string]$Path = 'C:\somebogusfolder',
		
		[Parameter()]
		[AllowNull()]
		[string]$OperatingSystem,
		
		[Parameter()]
		[ValidateNotNullOrEmpty()]
		[string]$NullParamTest,
		
		[Parameter()]
		[AllowNull()]
		[string]$AllowNullParam
	)
}

New-VirtualMachine

New-VirtualMachine -Name 'MYNEWVM'