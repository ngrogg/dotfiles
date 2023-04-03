#!/usr/bin/bash

# description goes here
# By Nicholas Grogg

## Help function
function helpFunction(){
	printf '%s\n' \
	'Help' \
	'----------------------------------------------------' \
	' ' \
	'help/Help' \
	'* Display this help message and exit'
}

## Function to run program
function runProgram(){
	printf '%s\n' \
	'Main' \
	'----------------------------------------------------'
}

## Main, read passed flags
	printf '%s\n' \
	'PROGRAM NAME' \
	'----------------------------------------------------' \
	' ' \
	'Checking flags passed'
	'----------------------------------------------------'

## Check passed flags
case "$1" in
[Hh]elp)
	printf '%s\n' \
	'Running Help function' \
	'----------------------------------------------------'
	helpFunction
	exit
	;;
[Mm]ain)
	printf '%s\n' \
	'Running main function'
	'----------------------------------------------------'
	runProgram
	;;
*)
	printf '%s\n' \
	'ISSUE DETECTED - Invalid input detected!' \
	'----------------------------------------------------' \
	'Running help script and exiting.' \
	'Re-run script with valid input'
	helpFunction
	exit
	;;
esac
