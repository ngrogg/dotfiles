#!/usr/bin/env bash

# User Backup
# BASH Script to back up important user files
# By Nicholas Grogg
# Revision: 20260914

# Set exit on error
set -e
# Set exit with error on non-zero status from rightmost pipe command
set -o pipefail

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

    ## Variables
    ### Date variable
    backupDate=$(date +%Y%m%d)
    backupDir="$HOME/backup/backup-$backupDate"

    ## Create backup folder
    mkdir -p "$backupDir"

    ## Navigate to home dir or exit with error
    cd "$HOME" || exit 1

    ## Backup directories
    ## PIPELINE LOGIC:
    ## 1. printf "%s\0": Emits each target directory separated by a null byte (\0)
    ##    instead of newline to handle potential special characters or spaces safely.
    ## 2. parallel -0: Reads null-terminated inputs from the pipe and distributes
    ##    jobs across up to 4 parallel workers (-j4), displaying progress bars (--bar/--progress).
    ## 3. tar -czf: Each worker executes tar on a directory replacement string ({}),
    ##    outputting compressed archives directly to "$backupDir/{}-$backupDate.tar.gz".
    printf "%s\0" Documents Downloads Music Pictures Videos | \
        parallel -0 --bar --progress -j4 \
        tar -czf "$backupDir/{}-$backupDate.tar.gz" "{}"

    printf "%s\n" \
    "${green}Backup complete" \
    "----------------------------------------------------" \
    "Double check output files${normal}"

}

# Main, read passed flags
printf "%s\n" \
"User Backup" \
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
