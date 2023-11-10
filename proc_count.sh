#!/bin/bash

# this is a comment

# for loop to count to 10
for c in {1..5}; do
	echo "Count: $c"

	# if does not use == it uses -eq
	# note the spaces around if [ ]
	if [ $c -eq 3 ]; then
		echo "found the third item"
	fi
done

# how do we pass parameters from the command line
# into this bash script. 
# we use the notation $1, $2 etc to represent
# the first, second etc parameter into this script
if [ -z $1 ]; then
	echo "You didn't pass any paraemters to $0"
else
	echo "You passed in $1 to $0"
fi

# heres a brand new command: 
# it calls ps -ef, then pipes it into word counter
# then stores the result in ct
ct=$(ps -ef | wc -l)
echo "There are $ct processes running on this machine"

if [ $ct -gt $1 ]; then
	echo "There are more than $1 process running on this machine"
fi

if [ $ct -lt $1 ]; then
	echo "a very good amount of processes, well done!"
	echo "Max no of processes Not exceeded $(date)" >> lab1Output.txt
else
	echo "YOU ARE RUUNING $ct PROCESSES THAT IS OVER THE LIMIT"
	echo " max no of processes exceeded $(date)"
fi	

