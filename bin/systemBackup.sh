#!/usr/bin/env bash

# System Backup
# BASH Script to back up important system files
# By Nicholas Grogg
# Revision: 20260419

# Set exit on error
set -e

# Color variables
## Errors
red=$(tput setaf 1)
## Clear checks
green=$(tput setaf 2)
## User input required
yellow=$(tput setaf 3)
## Set text back to standard terminal font
normal=$(tput sgr0)

# Help function
function helpFunction(){
    printf "%s\n" \
    "Help" \
    "----------------------------------------------------" \
    " " \
    "help/Help" \
    "* Display this help message and exit" \
    " " \
    "backup/Backup" \
    "* Backup user folders"
}

# Function to run program
function runProgram(){
    printf "%s\n" \
    "Backing Up" \
    "----------------------------------------------------"

    printf "%s\n" \
    "${yellow}IMPORTANT: User Input Required" \
    "----------------------------------------------------" \
    "Value Confirmation" \
    " " \
    "Directories to back up: " \
    "* ~/Documents " \
    "* ~/Downloads " \
    "* ~/Music" \
    "* ~/Pictures" \
    "* ~/Videos" \
    " " \
    "Press enter to proceed${normal}"

    read junkInput

    ## Date variable
    backupDate=$(date +%Y%m%d)

    ## Create backup folder
    cd ~/
    mkdir -p ~/backup/backup-$backupDate

    ## Populate command list
    for dir in Documents Downloads Music Pictures Videos; do
        echo "tar -czf ~/backup/backup-$backupDate/$dir-$backupDate.tar.gz $dir" >> commandList.txt
    done

    ## Run command list with parallel to back up system
    parallel -j4 -a commandList.txt

    ## Cleanup
    rm commandList.txt

    printf "%s\n" \
    "${green}Backup complete" \
    "----------------------------------------------------" \
    "Double check output files${normal}"

}

# Main, read passed flags
printf "%s\n" \
"System Backup" \
"----------------------------------------------------" \
" " \
"Checking flags passed" \
"----------------------------------------------------"

# Check passed flags
case "$1" in
[Hh]elp)
    printf "%s\n" \
    "Running Help function" \
    "----------------------------------------------------"
    helpFunction
    exit
    ;;
[Bb]ackup)
    printf "%s\n" \
    "Running script" \
    "----------------------------------------------------"
    runProgram
    ;;
*)
    printf "%s\n" \
    "${red}ISSUE DETECTED - Invalid input detected!" \
    "----------------------------------------------------" \
    "Running help script and exiting." \
    "Re-run script with valid input${normal}"
    helpFunction
    exit
    ;;
esac
