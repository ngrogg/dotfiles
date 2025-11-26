# PROGRAM
# DESCRIPTION
# By Nicholas Grogg
# Revision: TODO

# Help
function helpFunction {
    Write-Host "Help"
    Write-Host "-------------------------------------------"
    Write-Host "PROGRAM DESCRIPTION"
    Write-Host ""
    Write-Host "help/Help"
    Write-Host "* Output this help message and exit"
}

# User Creation Function
function mainFunction(){
    Write-Host "MAIN FUNCTION"
    Write-Host "-------------------------------------------"
}

# Main, parse passed flags
Write-Host "PROGRAM NAME"
Write-Host "-------------------------------------------"
Write-Host "Checking Flags passed"
Write-Host "-------------------------------------------"

# Check passed values, run functions based on input
switch ($args[0]) {
"Help" {
    Write-Host "Help Function"
    Write-Host "-------------------------------------------"
    helpFunction
    Exit
    }
"Main" {
    Write-Host "MAIN FUNCTION"
    Write-Host "-------------------------------------------"
    mainFunction
    Exit
    }
default {
    Write-Host "Invalid Input detected, exiting"
    Write-Host "-------------------------------------------"
    Exit
    }
}
