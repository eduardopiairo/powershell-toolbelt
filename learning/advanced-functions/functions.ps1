#region Basic
function Get-SomethingBasic 
{
    param(
        [string]$Param
    )

    Write-Host $Param

}

Clear-Host
Get-SomethingBasic -Param 'This is my param'
#endregion

#region Advanced 
function Get-SomethingBasicPipeline 
{
    Write-Output "This"
    
}

function Get-SomethingAdvanced
{
    [CmdletBinding()]
	param (
		[Parameter(Mandatory,ValueFromPipeline)]
		[ValidateSet('This','That')]
		[string]$Param
	)
	Write-Host $Param
}

Get-SomethingBasicPipeline | Get-SomethingAdvanced
#endregion



function New-VirtualMachine
{
	[CmdletBinding()]
	param
	(
		[string]$VMName
	)
	
    switch ($VMName) {
        'SQLInjectAttackName' {
            Write-Error -Message "OMG! Someone's trying to H@x0r our base!"
        }

        'AlreadyExists' {
            Write-Warning -Message "You got a problem. This VM already exists so you can't add it, dummy"
        }

        'DoesNotExistAlready' {
            Write-Verbose -Message 'The VM does not already exist. You may proceed to add a new one with that name'
        }

        'FlakyIssue' {
            $ThatVariable = 'notright'
            Write-Debug -Message 'I will add this VM on host 123, blade 4564 on the molecule H2S squared'
        }
    }
}

#region 2nd Exercise 

## Check what the $ErrorActionPreference variable is set at to see what kind of behavior to expect
$ErrorActionPreference

## A major error occurs!!
New-VirtualMachine -VMName 'SQLInjectAttackName'

## During debugging maybe I don't care for now if it throws an error. Override it in just this function
New-VirtualMachine -VMName 'SQLInjectAttackName' -ErrorAction SilentlyContinue


## Check what the global preference is set at
$WarningPreference

New-VirtualMachine -VMName 'AlreadyExists'

## Override it
New-VirtualMachine -VMName 'AlreadyExists' -WarningAction Stop


## Check what the $VerbosePreference variable is set at to see what kind of behavior to expect
$VerbosePreference

## No VM exists but why no Verbose message?
New-VirtualMachine -VMName 'DoesNotExistAlready'

## Forgot -Verbose since $VerbosePreference defaults to SilentlyContinue
New-VirtualMachine -VMName 'DoesNotExistAlready' -Verbose

#endregion

#region Testing debug behavior

## Nothing special
New-VirtualMachine -VMName 'FlakyIssue'

## Setting a breakpoint to further investigate the variable
New-VirtualMachine -VMName 'FlakyIssue' -Debug

#endregion

## A VM already exists so instead of confusing the user let's just log to fictional file instead
New-VirtualMachine -VMName 'AlreadyExists' -WarningVariable VMAlreadyExists
if ($VMAlreadyExists) {
    Add-Content -Path 'somelogfile.log' -Value "WARNING: $VMAlreadyExists"
}

New-VirtualMachine -VMName 'SQLInjectAttackName' -ErrorVariable err -ErrorAction SilentlyContinue
if ($err) {
    Add-Content -Path 'somelogfile.log' -Value "ERR: $($err.Exception.Message)"
}


