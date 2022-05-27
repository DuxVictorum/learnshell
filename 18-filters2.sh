#!/usr/bin/bash

# Practice with more Linux filter commands (uniq, comm, od)

# 1) Fun with uniq
echo -e "Your computer has the following processor: $(cat /proc/cpuinfo | grep -oP 'model name.*\: \K.*' | uniq)."

# 2) Fun with comm - I've set up two files with slighly differing phone numbers to compare
echo -e "\nNow let's compare two sets of phone numbers."
comm <(sort comm_practice1.txt) <(sort comm_practice2.txt)   # process substitution!
echo -e "\nThe phone numbers common to both sets are as follows:"
comm -12 <(sort comm_practice1.txt) <(sort comm_practice2.txt)

# 3) Fun with od - 
echo -e "\nThe 'od' command will convert ascii text into octal (or other) format."
od -bc gp_results.txt
