#!/usr/bin/bash

# Practice with getopts (following the model of 13-parameter_parsing.sh

while getopts h:p:oh flag ; do
	case $flag in 
		h) historian=$OPTARG;;
		p) poet=$OPTARG;;
		o) echo "Orators are good at everything! But we don't need one today...";;
		h) echo "You want help, sure, everyone does! But it will cost you. How much you got?";;
	esac
done

if [ -n $historian ] ; then echo "The famous historian $historian is writing about you!" ; fi 
if [ -n $poet ] ; then echo "The famous poet $poet will be composing a ballad about you!" ; fi


