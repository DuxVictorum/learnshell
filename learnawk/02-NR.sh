#!/usr/bin/bash

# Practice with the NR variable in awk

# This script will skip the first line of input and then add line numbers at the front of each output line
ps -ef | awk 'NR > 1 {print NR-1, $2}'

