DevOps quote from John Willis, keynote talk at 2017 ServerlessConf
> "DevOps is about humans. DevOps is a set of practices and patterns that turn human capital into high performance organizational capital."

# Introduction to AWK
According to it's own manual, awk is a "pattern scanning and processing language." Yes, it's actually a (fairly compact) language, one designed for scanning text line-by-line and performing actions on those lines that match the pattern it is searching for. That may not sound like much, but it is an impressive and useful tool in your Linux tool belt.  

(*Note:* This guide is written for **gawk** or 'GNU awk', the version of awk found on all modern Linux systems. It contains all the functionality of the original plus some extra cool stuff.)

## Basic Fundamentals
The awk program treats every line of text in a file as a separate record. It then splits that record / line into discrete fields (based on whitespace).

**--> The most basic structure of an 'awk' command is:**  
> ***pattern* { action }**

The awk language looks at every line in the file/input and processes it according to the pattern.  
**If the pattern matches the input, then the action is performed.**  
It is common, however, for an awk command to leave either the pattern or action side empty. In that case, awk applies the **default**:
- If the pattern portion is left empty, the default pattern is to match the entire record.
- If the action portion is left empty (i.e. no square brackets at all), the default action is to print the entire record.  

## Awk Command Structure
When using awk, it is best practice to:
- Place the entire pattern-action sequence inside single quotes (`awk 'pattern { action }'`)
- Place the action section inside curly brackets.  
- If the pattern section contains more than just a simple match pattern (e.g. an 'if' conditional) then put that section in curly brackets too.

Each field of a record can be referenced with `$1`, `$2`, `$3`, etc.  
You can use `$0` to signify the entire record / line.

The most common use of awk is as a filter to act on the redirected output from another command. For example, to print out the owner of each running process:
> `ps -ef | awk '{print "Process #" $2, "is owned by", $1 "."}'`

When using awk as a stand-alone command, you need to designate a file or files for awk to act upon. Place that filename at the end outside of the single quotes.  
> `awk 'pattern { action }' file_name.txt`

Awk can also read multiple files in order simply by listing them all in row:
> `awk 'pattern { action }' file_1.txt file_2.txt file_3.txt`


## Summary of Commands in AWK
Awk does not have very many commands. That makes it easier for you to learn them! Here is a complete list (usable in either the 'pattern' or 'action' side):  
- if / else if / else (conditional)
- while (conditional)
- for (expression / conditional / increment)
- for (var in array)
- break
- continue
- var=expression
- print
- printf
- next
- exit

In either the pattern or action side, you can have multiple statements. You just separate them with a semicolon (`;`).

---

# Patterns & Expressions
To begin with, two important patterns are BEGIN and END.
- BEGIN signals the action to be taken before any lines are read.
- END signals the action to be taken after the last line is read.
> BEGIN `{ print "File\tOwner" }`

## Variables
You can define variables inside the action section.  
There are two kinds of variables: 
- Built-in: e.g. `$2` (second column or field of record) or `NR` (number of record)
- User-defined: `students=15`

**Important**: In awk, the `$` symbol is a function trigger that creates a positional variable. This is not like bash, where you use `$` to reference a variable. Instead, with awk you only reference a variable with the variable name and not with a prefixed $ symbol.  
Thus, if you declare `num=3`, then from that point on, typing `num` (and not `$num`) means `3`. Using `$num` would mean the 3rd column of a record.  

*Further note*: In awk, there is no variable expansion inside quotes. For example, `print $1` prints the first field, but `print "$1"` will just print out the literal string `$1`.  

When declaring user-defined variables, it usually makes sense to initialize them in a `BEGIN` line:
> `BEGIN { x=5 }`

## Built-in Variables

### **`$` - Positional** 
By far the most common built-in variable you will see is the positional variable, e.g. `$1`, `$4`, etc. These reference the corresponding column or field of a given record.  
You can use `$0` to reference all fields of the record (= `$1` `$2` `$3`, etc.).  
You can overwrite a positional variable by explicitly assigning it a new value (`$2=25`) or deleting its value (`$4=""`).

### **FS - Field Separator**
The default way that awk identifies fields is by looking for blank space. You can change this however by defining the built-in FS variable. For example, the `/etc/passwd` file separates records with a colon, and you could tell awk to do the same by defining the FS variable.
> `BEGIN { FS=":"; }`

You can also set a new field separator at the CLI by using the -F option and following that immediately with the character to be the new separator, e.g. `awk -F:`.
 (Note that this -F option can only take a single character, whereas the FS variable can take multiple characters, making it more versatile.)

### **OFS - Output Field Separator**
When printing, the default way that awk outputs multiple fields is to separate them with a single blank space. You can change this by defining the OFS variable.
> `BEGIN { OFS=" - "; } { print $2, $4 }` 

### **NF - Number of Fields**
This variable is set to the number of fields awk finds when it reads the line.  
It's useful, for example, in handling input with varying field lengths:
> `{if (NF < 5) { print $2, $4 } else { print $2, $4, $6 }}`

### **NR - Number of Record**
This variable is set to the record number awk is reading at that moment. In other words, `NR` is equal to the line number of the input or file.  
For example, you can use this to tell awk to skip printing the first line and then to add a (newly calculated) line number at the front of all lines it does print:
> `NR > 1 { print NR-1, $0 }`

### **RS - Record Separator**
By default awk reads records one line at a time. In other words, a newline separates records. You can change this by defining the `RS` variable. You could, for example, set it to a single space to make awk treat each word of text as if it were a separate line.  
> `BEGIN { RS=" "; } { print $0 }`

If you set `RS` to an empty string, awk will read the entire file as a single record (up to 99 lines anyway). If you then combine that with defining `FS` as the newline character (`\n`), then awk will read every line as if it were a column. (Not that this kind of thing is useful, by the way, but you could.)  
You won't often need to mess with `RS`.

### **ORS - Output Record Separator**
When printing, the default way that awk outputs multiple records is to make each a separate line. (No surprise there.) Specifically, each record is separated with a newline.  
One use case would be to change this to accommodate ouput for a non-UNIX system, e.g.:
> ` awk 'BEGIN { ORS="\r\n"; } {print $0}' > windows_compatible.txt` 

### **FILENAME - Name of File**
This built-in variable is set equal to the file being read at that moment.  
*Note*: If no file is specified, then the value of this variable is simply `-`, i.e. "standard input". (In a BEGIN rule it stays unspecified in such a scenario.)  
For example, let's say you need to process a file with at least six fields, and you want to print an error message if the user picks a wrong file with fewer fields:
> `NF < 6 {print "Syntax Error in reading file:", FILENAME, "line #", NR}`

### **Other Built-in Variables**
GNU awk has many other less-common variables for use:
- **ARGC** - The number of command line arguments
- **ARGV** - The array of all command line arguments (index starts at 0)
- **ARGIND** - The index in `ARGV` of the current file being processed
- **BINMODE** - On non-POSIX systems, specifies use of "binary" mode for (=1/r) input files, (=2/w) output files, or (=3/rw) all files
- **CONVFMT** - The format used for converting a number into a string ("%.6g" is default, or up to 6 significant decimal digits)
- **ENVIRON** - Array containing the values of the current environment
- **ERRNO** - String describing a system error if it occurs
- **FIELDWIDTHS** - List of set field widths (separated by a single whitespace); if set, it overwrites the FS variable. You can optionally add in front a value (followed by a colon and then the fieldwidth value) specifying the number of characters to skip before that field starts. 
- **FNR** - The current record / line number *in the file currently being read*. This is similar to the NR variable, but `FNR` will reset back to 1 every time it reads a new file, whereas `NR` does not.
- **FPAT** - A regular expression that, if set, causes awk to ignore `FS` and instead use this variable to determine how the fields and their breaks are defined.
- **FUNCTAB** - Array whose indices and values are the names of all user-defined or extension functions available in the program


&&&&

To summarize, if you then set the action `{ print x, $x }` the first 'x' prints out '5', whereas the second prints out the fifth field of the record being acted upon.    


## Numeric Expressions
The usual arithmetic expressions apply: +, -, *, /, %.  
Also, the increments ++ and -- work as usual (both var++ and ++var) as well as the assignment operators `x+=` or `x-=`, etc.  
A few notes:
- The modulo operator (%) it finds the remainder after an *integer* divide. E.g. '7%3' = 1.  
- Usual order of operations applies (PEMDAS).
- A **blank space** between two variables or values concatenates them together. Thus `x=1+2*3 4` assigns the value of `74` and not `7 4`.
- AWK doesn't have data 'types'. Everything is a string or a number, and awk can easily convert from one to the other.
- The unary operators + and - on a value will render them positive or negative. Thus, if `var=10`, then `-var + 3` will yield `-7`.

One useful and interesting way to use awk for math calculations is to put C-style calculation blocks into a BEGIN block. E.g.
```
BEGIN {
  for (i=1; i <= 10; i++) {
    printf "The square of ", i, " is ", i*i;
  }
  exit;
}
```

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
1. **Re-evaluating the record after variable change**  
If you change the value of a variable in the middle of things, then you need to re-evaluate the whole record / line again so that awk can continue with the new variable in place. You do this by simply typing:  
`$0=$0`

# Notes to organize later:
This is 