# Basic Structure of AWK
The awk program treats every line of text in a file as a separate record. It then splits that record / line into discrete fields (based on whitespace).

The most basic structure of an 'awk' command is:  
> ***pattern* { action }**

The awk language looks at every line in the file/input and processes it according to the pattern.  
**If the pattern matches the input, then the action is performed.**  
It is common, however, for an awk command to leave either the pattern or action side empty. In that case, awk applies the **default**:
- If the pattern portion is left empty, the default pattern is to match the entire record.
- If the action portion is left empty (i.e. no square brackets at all), the default action is to print the entire record.  

Each field of a record can be referenced with `$1`, `$2`, `$3`, etc.  
You can use `$0` to signify the entire record / line.

## Summary of Commands in AWK
Awk does not have very many commands. That makes it easier for you! Here is a complete list (usable in either the 'pattern' or 'action' side):  
- if (conditional)
- while (conditional)
- for (expression / conditional / expression)
- for (var in array)
- break
- continue
- var=expression
- print
- printf
- next
- exit


---

# Patterns & Expressions
To begin with, two important patterns are BEGIN and END.
- BEGIN signals the action to be taken before any lines are read.
- END signals the action to be taken after the last line is read.
> BEGIN `{ print "File\tOwner" }`

## Variables
You can define variables inside the action section.  
*Important*: **Unlike bash, you reference a variable only with the variable name**, not with a prefixed $ symbol. Thus, if you declare `num=3`, then from that point on, typing `num` (and not `$num`) means `3`.  
It usually makes sense to define them in a `BEGIN` line:
> `BEGIN { x=5 }`

Thus in the following code example: `{ print x, $x }` the first 'x' prints out '5', whereas the second prints out the fifth field of the record being acted upon.    

*Note*: In awk, there is no variable expansion inside quotes. For example, `print $1` prints the first field, but `print "$1"` will just print out "$1."  



## Numeric Expressions
The usual arithmetic expressions apply: +, -, *, /, %.  
Also, the increments ++ and -- work as usual (both var++ and ++var) as well as the assignment operators `x+=` or `x-=`, etc.  
A few notes:
- The modulo operator (%) it finds the remainder after an *integer* divide. E.g. '7%3' = 1.  
- Usual order of operations applies (PEMDAS).
- A **blank space** between two variables or values concatenates them together. Thus `x=1+2*3 4` assigns the value of `74` and not `7 4`.
- AWK doesn't have data 'types'. Everything is a string or a number, and awk can easily convert from one to the other.
- The unary operators + and - on a value will render them positive or negative. Thus, if `var=10`, then `-var + 3` will yield `-7`.

## Conditions
Awk uses all the usual conditional operators (==, !=, >=, etc.).  You can also use `&&` (AND) and `||` (OR).  
> **[Basic Example - TODO]**

When comparing strings to regular expressions, you can use `~` (matches) or `!~` (doesn't match). The regex must be enclosed by slashes and come *after* the operator. Extended regex is acceptable.  
> `awk 'uniform_number !~ /05/ {print $3}'`

dsf



---

# Actions

## Print
The most basic (indeed, the default) action is to print the record or (more commonly) a specific field. 
In this example, the **third column** of each record (row) will be printed.
> `awk '{ print $3 }'`  


---

# Awk Extras: Tips & Tricks
1. **Make your awk script its own stand-alone executable**  
The awk program functions as an interpreter. This means that you can write an awk script, change its mode, and put it in the PATH *as long as* you add the following at top:  
`#!/bin/awk -f`
1. **Provide a default value to a bash variable**  
Bash provides a way to assign a default value to a variable if nothing else gets assigned. In the context of awk, this is mainly useful for command-line arguments. If the user doesn't pass in a command-line argument, the default value can still get passed and not mess up an awk command / script.  
The basic pattern is:  
`${var:-defaultValue}`  
For example (to print either the column designated by `arg $1`  or the third column if no arg is passed):  
`columnToPrint="${1:-3}"`
1. 

# Notes to organize later:
This is 