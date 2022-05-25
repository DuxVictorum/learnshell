#!/usr/bin/bash

# Practice with more Linux filter commands (uniq, comm, od)

# 1) Fun with uniq
echo -e "Your computer has the following processor: $(cat /proc/cpuinfo | grep -oP 'model name.*\: \K.*' | uniq)."
