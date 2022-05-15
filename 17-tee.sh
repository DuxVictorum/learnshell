#!/usr/bin/bash

# Practice with the tee command

gp=grep_practice.txt
 
cat $gp | grep -i '^oct' | tee gp_results.txt
