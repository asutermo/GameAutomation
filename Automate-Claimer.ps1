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

if (!Test-Path $scriptPath) {
    Write-Host "Unable to find $scriptPath"
    exit(1)
}

$taskAction = New-ScheduledTaskAction -Execute 'python' -Argument "$scriptPath"
$taskTrigger = New-ScheduledTaskTrigger -Daily -At "$($hour)$($timeOfDay)"
$task = New-ScheduledTask -Action $taskAction -Trigger $taskTrigger
Register-ScheduledTask -TaskName "Run $scriptPath" -InputObject $task
