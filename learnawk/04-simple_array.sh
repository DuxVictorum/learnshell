#!/usr/bin/bash -i

# This script will print out the number of files in ~/ (user home) created in each calendar month.
# This is meant as practice with awk's 'associative' arrays, in which the index is not a number but rather a string.
ll ~/ | awk 'NR > 1 {month[$6]++} END {for (i in month) {print month[i], "files were created in", i"."}}' | sort -M -k6
