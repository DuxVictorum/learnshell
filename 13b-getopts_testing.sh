#!/usr/bin/bash

# Practice with getopts (following the model of 13-parameter_parsing.sh

while getopts :i:p:oh flag ; do
	echo $flag
	case $flag in 
		i) historian=$OPTARG;;
		p) poet=$OPTARG;;
		o) echo "Orators are good at everything! But we don't need one today...";;
		h) echo "You want help, sure, everyone does! But it will cost you. How much you got?";;
		:) echo "You silly, did you forget something? The $flag option requires an additional argument.";;
		?) echo -e "What kind of command flag is that? Use this syntax: \n\t$(basename $0) [-i -p -o -h]";;
	esac
done


if [ $historian ] ; then echo "The famous historian $historian is writing about you!" ; fi 
if [ $poet ] ; then echo "The famous poet $poet will be composing a ballad about you!" ; fi


