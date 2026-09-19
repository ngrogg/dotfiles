<#
.SYNOPSIS
    Brief description of the script.

.DESCRIPTION
    Detailed description of what the script does.

.PARAMETER Action
    Action to perform.

.EXAMPLE
    .\program.ps1 -Action Main

.NOTES
    Author: Nicholas Grogg
    Revision: TODO
#>

Set-StrictMode -Version Latest

# Parameters
param (
    [ValidateSet("Help", "Main")]
    [string]$Action = "Main"
)

# Help
function Show-Help {
    Write-Host "Help"
    Write-Host "-------------------------------------------"
    Write-Host "PROGRAM DESCRIPTION"
    Write-Host ""
    Write-Host "Usage:"
    Write-Host ".\program.ps1 -Action <Action>"
    Write-Host ""
    Write-Host "Actions:"
    Write-Host "Help"
    Write-Host "* Output this help message and exit"
    Write-Host ""
    Write-Host "Main"
    Write-Host "* Run the main function"
}

# Main Function
function Invoke-Main {
    Write-Host "MAIN FUNCTION"
    Write-Host "-------------------------------------------"
}

# Main
Write-Host "PROGRAM NAME"
Write-Host "-------------------------------------------"
Write-Host "Checking Flags passed"
Write-Host "-------------------------------------------"

switch ($Action) {
    "Help" {
        Show-Help
        exit 0
    }

    "Main" {
        Invoke-Main
        exit 0
    }
}
