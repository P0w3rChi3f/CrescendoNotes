# Module created by Microsoft.PowerShell.Crescendo
class PowerShellCustomFunctionAttribute : System.Attribute { 
    [bool]$RequiresElevation
    [string]$Source
    PowerShellCustomFunctionAttribute() { $this.RequiresElevation = $false; $this.Source = "Microsoft.PowerShell.Crescendo" }
    PowerShellCustomFunctionAttribute([bool]$rElevation) {
        $this.RequiresElevation = $rElevation
        $this.Source = "Microsoft.PowerShell.Crescendo"
    }
}

function Get-IPPackets
{
[PowerShellCustomFunctionAttribute(RequiresElevation=$True)]
[CmdletBinding()]

param(
[Parameter()]
[string]$Interface = "",
[Parameter()]
[string]$File = "",
[Parameter()]
[switch]$Print = ""
    )

BEGIN {
    $__PARAMETERMAP = @{
        Interface = @{ OriginalName = '-i'; OriginalPosition = '0'; Position = '2147483647'; ParameterType = [string]; NoGap = $False }
        File = @{ OriginalName = '-r'; OriginalPosition = '0'; Position = '2147483647'; ParameterType = [string]; NoGap = $False }
        Print = @{ OriginalName = '--print'; OriginalPosition = '0'; Position = '2147483647'; ParameterType = [switch]; NoGap = $False }
    }

    $__outputHandlers = @{ Default = @{ StreamOutput = $true; Handler = { $input } } }
}
PROCESS {
    $__commandArgs = @()
    $__boundparms = $PSBoundParameters
    $MyInvocation.MyCommand.Parameters.Values.Where({$_.SwitchParameter -and $_.Name -notmatch "Debug|Whatif|Confirm|Verbose" -and ! $PSBoundParameters[$_.Name]}).ForEach({$PSBoundParameters[$_.Name] = [switch]::new($false)})
    if ($PSBoundParameters["Debug"]){wait-debugger}
    foreach ($paramName in $PSBoundParameters.Keys|Sort-Object {$__PARAMETERMAP[$_].OriginalPosition}) {
        $value = $PSBoundParameters[$paramName]
        $param = $__PARAMETERMAP[$paramName]
        if ($param) {
            if ( $value -is [switch] ) { $__commandArgs += if ( $value.IsPresent ) { $param.OriginalName } else { $param.DefaultMissingValue } }
            elseif ( $param.NoGap ) { $__commandArgs += "{0}""{1}""" -f $param.OriginalName, $value }
            else { $__commandArgs += $param.OriginalName; $__commandArgs += $value |Foreach-Object {$_}}
        }
    }
    $__commandArgs = $__commandArgs|Where-Object {$_}
    if ($PSBoundParameters["Debug"]){wait-debugger}
    if ( $PSBoundParameters["Verbose"]) {
         Write-Verbose -Verbose -Message /usr/sbin/tcpdump
         $__commandArgs | Write-Verbose -Verbose
    }
    $__handlerInfo = $__outputHandlers[$PSCmdlet.ParameterSetName]
    if (! $__handlerInfo ) {
        $__handlerInfo = $__outputHandlers["Default"] # Guaranteed to be present
    }
    $__handler = $__handlerInfo.Handler
    if ( $PSCmdlet.ShouldProcess("/usr/sbin/tcpdump $__commandArgs")) {
        if ( $__handlerInfo.StreamOutput ) {
            & "sudo"   "/usr/sbin/tcpdump" $__commandArgs | & $__handler
        }
        else {
            $result = & "sudo"   "/usr/sbin/tcpdump" $__commandArgs
            & $__handler $result
        }
    }
  } # end PROCESS

<#
.SYNOPSIS
Run invoke-ifconfig

.DESCRIPTION
PowerShell Wrapper for TCPDump

.PARAMETER Interface
Used to read packets from the interface


.PARAMETER File
Used to read in a PCAP


.PARAMETER Print
Print packets to the screen, even it they are being written to a file



#>
}

