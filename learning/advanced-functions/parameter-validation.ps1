function New-VirtualMachine
{
	[CmdletBinding()]
	param
	(
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
	        if (-not (Test-Path -Path $_ -PathType Container))
	        {
		        throw "The folder [$_] does not exist. Try another"
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

		[Parameter(Mandatory)]
		[AllowNull()]
		[string]$AllowNullParam
	)
}


New-VirtualMachine -Name "myMachine" -Path "C:\Myfile"  -Generation 2