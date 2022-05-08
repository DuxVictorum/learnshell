#!/usr/bin/bash -i

# Practice modifying grep color patterns
# --> Excellent explanation of grep colors: 
# https://askubuntu.com/questions/1042234/modifying-the-color-of-grep

export GREP_COLORS='ms=04;35'
cpu='/proc/cpuinfo'

grep proc $cpu
