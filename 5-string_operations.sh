#!/usr/bin/sh
# Some practice with basic string operations

motto="Each man made his own shipwreck."
echo Our motto has ${#motto} characters.
expr index "$motto" "h"		# 4; count starts at 1 (not 0)
expr length "$motto"
