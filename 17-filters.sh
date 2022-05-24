#!/usr/bin/bash -i

# Practice with the tee command

gp=grep_practice.txt
 
cat $gp | grep -i '^oct' | tee gp_results.txt

export GREP_COLORS='ms=38;5;162:sl=38;5;220'
grep '8' gp_results.txt

cat /etc/passwd | cut -d: -f1,6 | tail -6

# Using the 'tr' command
cat /etc/passwd | cut -c5-15 | tail -6 | tr ':n-p' ' X'
cat /etc/passwd | cut -d: -f1,3 | tail -6 | tr -d 'n0'
cat /etc/passwd | tail -3 | cut -d: -f1,3 | tr '\n' '\t'; echo

# Using the 'sort' command
echo
# Numerical sort of users by id #
cat /etc/passwd | head | sort -n -t: -k3
echo 
# Alphabetical sort by userid
cat /etc/passwd | head -4 | sort -k1
echo
# Reverse numerical sort of users by id#
cat /etc/passwd | tail -5 | sort -r -n -t: -k3
