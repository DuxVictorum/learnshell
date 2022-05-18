#!/usr/bin/bash -i

# Practice with the tee command

gp=grep_practice.txt
 
cat $gp | grep -i '^oct' | tee gp_results.txt

export GREP_COLORS='ms=38;5;162:sl=38;5;220'
grep '8' gp_results.txt
