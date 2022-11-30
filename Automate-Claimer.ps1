<#
    .SYNOPSIS
        Adds claimer script of your choice to Windows Task Scheduler System
    .DESCRIPTION
        Specify time of day and path to the script to apply scheduling to.
    .EXAMPLE
        powershell .\Automate-Claimer.ps1 -hour 3 -timeOfDay pm -scriptPath .\GameClaimerScripts\GOGGiveawayClaimer.py
#>
param (
    [int]$hour = 3,

    [ValidateSet("am", "pm")]
    [string]$timeOfDay = 'am',

    [string]$scriptPath
)

if (!(Test-Path $scriptPath)) {
    Write-Host "Unable to find $scriptPath"
    exit(1)
}

$fullScriptPath = Resolve-Path $scriptPath
$taskAction = New-ScheduledTaskAction -Execute 'python' -Argument "$fullScriptPath"
$taskTrigger = New-ScheduledTaskTrigger -Daily -At "$($hour)$($timeOfDay)"
$task = New-ScheduledTask -Action $taskAction -Trigger $taskTrigger

$taskName = Split-Path $fullScriptPath -Leaf
Register-ScheduledTask -TaskName "$taskName" -InputObject $task
