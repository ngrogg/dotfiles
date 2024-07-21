#!/usr/bin/bash

# Program name
# description goes here
# By Nicholas Grogg

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
	"run/Run" \
	"* PROGRAM DESCRIPTION " \
	"* ARGUMENTS " \
	"Ex. ./SCRIPT run ARG ARG"
}

# Function to run program
function runProgram(){
	printf "%s\n" \
	"RUN" \
	"----------------------------------------------------"
}

# Main, read passed flags
	printf "%s\n" \
	"PROGRAM NAME" \
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
[Rr]un)
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
