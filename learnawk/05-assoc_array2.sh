#!/usr/bin/bash -i

# This script will print out the number of files in a chosen directory created in each calendar month.
# This is meant as practice with awk's 'associative' arrays, in which the index is not a number but rather a string.
ll $1 | awk 'NR > 2 {month[$6]++4444} END {for (i in month) {print month[i], "files were created in", i"."}}' | sort -M -k6
