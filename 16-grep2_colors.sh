#!/usr/bin/bash -i

# Practice modifying grep color patterns
# --> Excellent explanation of grep colors: 
# https://askubuntu.com/questions/1042234/modifying-the-color-of-grep

# Default value of GREP_COLORS='ms=01;31:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36'

export GREP_COLORS='ms=05;33'
cpu='/proc/cpuinfo'

grep proc $cpu
