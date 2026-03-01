#!/usr/bin/bash

# Configure UFW
# BASH script to switch between UFW rules
# By Nicholas Grogg
# Revision: 20260228

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
    "set/Set" \
    "* Configure UFW rules" \
    "* Similar to GUFW profiles" \
    "* Arguments:" \
    "  - home, A minimal set of rules for home network" \
    "  - public, A more locked down set of rules for public wi-fi" \
    " " \
    "Usage. ./configureUFW.sh set PROFILE"
}

# Function to run program
function runProgram(){
    printf "%s\n" \
    "Set" \
    "----------------------------------------------------"

    ## Variables
    profile=$1

    ## Validation
    ### Is profile variable null?
    if [[ -z $profile ]]; then
        printf "%s\n" \
        "${red}ISSUE DETECTED - Invalid input detected!" \
        "----------------------------------------------------" \
        "Running help script and exiting." \
        "Re-run script with valid input${normal}"
        helpFunction
        exit 1
    fi

    ## Value confirmation
    printf "%s\n" \
    "${yellow}IMPORTANT: User Input Required" \
    "----------------------------------------------------" \
    "Confirm UFW profile" \
    " " \
    "Profile:" "$profile" \
    " " \
    "Press enter to proceed or control + c to cancel${normal}"

    read junkInput

    ## Check passed flags
    case "$1" in
    [Hh]ome)
        ### Enable/start ufw - should already be running but this explicitly ensures that
        sudo systemctl enable ufw
        sudo systemctl start ufw

        ### Clear any existing ufw rules
        sudo ufw reset

        ### Configure ufw for home network
        #### Basic block in/allow out settings
        sudo ufw default deny incoming
        sudo ufw default allow outgoing
        sudo ufw default deny forward

        #### Allow loopback
        sudo ufw allow in on lo

        #### Less verbose logging
        sudo ufw logging low

        #### Enable firewall
        sudo ufw enable
        sudo ufw status verbose
        ;;
    [Pp]ublic)
        ### Enable/start ufw - should already be running but this explicitly ensures that
        sudo systemctl enable ufw
        sudo systemctl start ufw

        ### Clear any existing ufw rules
        sudo ufw reset

        ### Configure ufw for public network
        #### Basic block in/allow out settings
        sudo ufw default deny incoming
        sudo ufw default allow outgoing
        sudo ufw default deny forward

        #### Allow loopback
        sudo ufw allow in on lo

        #### More verbose logging
        sudo ufw logging on

        #### Block common LAN Services
        sudo ufw deny in proto udp to any port 5353
        sudo ufw deny in proto udp to any port 1900
        sudo ufw deny in proto tcp to any port 445
        sudo ufw deny in proto tcp to any port 139

        #### Block all inbound LAN traffic private IPs
        sudo ufw deny in from 10.0.0.0/8
        sudo ufw deny in from 172.16.0.0/12
        sudo ufw deny in from 192.168.0.0/16

        #### Enable firewall
        sudo ufw enable
        sudo ufw status verbose
        ;;
    *)
        printf "%s\n" \
        "${red}ISSUE DETECTED - Invalid input detected!" \
        "----------------------------------------------------" \
        "Running help script and exiting." \
        "Re-run script with valid input${normal}"
        helpFunction
        exit 1
        ;;
    esac
}

# Main, read passed flags
printf "%s\n" \
"Configure UFW" \
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
[Ss]et)
    printf "%s\n" \
    "Running script" \
    "----------------------------------------------------"
    runProgram $2
    ;;
*)
    printf "%s\n" \
    "${red}ISSUE DETECTED - Invalid input detected!" \
    "----------------------------------------------------" \
    "Running help script and exiting." \
    "Re-run script with valid input${normal}"
    helpFunction
    exit 1
    ;;
esac
