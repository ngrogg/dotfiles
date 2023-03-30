#!/usr/bin/bash

# description goes here
# By Nicholas Grogg

## Help function
function helpFunction(){
echo "Help
----------------------------------------------------

help/Help
* Display this help message and exit"
}

## Function to run program
function runProgram(){
echo "Main
----------------------------------------------------"
}

## Main, read passed flags 
echo "PROGRAM NAME
----------------------------------------------------

Checking flags passed
----------------------------------------------------"

## Check passed flags 
case "$1" in 
[Hh]elp)
echo "
Running Help function
----------------------------------------------------"
helpFunction
exit
;;
[Mm]ain)
echo "
Running main function
----------------------------------------------------"
runProgram
;;
*)
echo "
ISSUE DETECTED - Invalid input detected!
----------------------------------------------------
Running help script and exiting.
Re-run script with valid input"
helpFunction
exit
;;
esac

