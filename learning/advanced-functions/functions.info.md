# PowerShell

## Advanced Functions

````powershell
[CmdletBinding()]

function Get-TheAwesome
{
    [CmdletBinding()]
    param()
}
````

### 1 - Control verbose, warning, debug and error output

### 2 - Advanced parameters

### 3 - Pipeline input acceptance

### 4 - Safety net: -WhatIf and -Confirm

## Function Parameters

### Mandatory Parameters

* Mandatory vs optional

### Parameters validation

* Validate script
* Validate pattern
* Validate set
* Validate range
* Validate count
* Validate not null or empty
* Validate not null
* Validate allow null

### Parameter Set

Are meant to separate mutually exclusive parameters from each other.

````powershell
$PSCmdlet.ParameterSetName
````

## Pipeline input

* Pipeline input by object
* Pipeline input by property
* Parameter binding - stitches the output with input in the property 
* begin (first object in the pipeline) / process (every object in the pipeline) / end blocks (first object in the pipeline)