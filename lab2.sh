#!/bin/bash

cpus=$(more /proc/cpuinfo | grep processor | wc -l)
if [ $# -eq 0 ]; then
	echo "You forgot something ..."
	echo "Usage lab2.sh [NUM_CORES]"
	exit 0
fi
if [ $1 -lt $cpus ]; then
	echo "num CPUs is less than the required"
else
	echo "OK"
fi
