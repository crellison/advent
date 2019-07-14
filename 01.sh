#!/bin/bash

DIRECTORY=`dirname $0`
INPUT_FILENAME="$DIRECTORY/input/01.txt"

awk '{s+=$1} END {print s}' $INPUT_FILENAME
