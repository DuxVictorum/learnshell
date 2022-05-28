#!/usr/bin/bash

# Practice with more Linux filter commands (uniq, comm, od)

# 1) Fun with uniq
echo -e "Your computer has the following processor: $(cat /proc/cpuinfo | grep -oP 'model name.*\: \K.*' | uniq)."

# 2) Fun with comm - I've set up two files with slighly differing phone numbers to compare
echo -e "\nNow let's compare two sets of phone numbers."
comm <(sort comm_practice1.txt) <(sort comm_practice2.txt)   # process substitution!
echo -e "\nThe phone numbers common to both sets are as follows:"
comm -12 <(sort comm_practice1.txt) <(sort comm_practice2.txt)

# 3) Fun with od 
echo -e "\nThe 'od' command will convert ascii text into octal (or other) format."
echo -e "\nHere you can see the output of gp_results.txt with both the octal bytes and printable characters."
od -bc gp_results.txt

# 4) Fun with awk
echo -e "\nFirst here are just the process IDs from running 'ps -eF'"
ps -eF | awk 'NR>1 {printf "%-8s %s\n", $2, $11}'
