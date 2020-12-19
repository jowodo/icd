# Intelligently Change Directory (icd) 0.2
**Avoid using tiresome aliases to change directories!**
Change into arbitrary subdirectories.
The "algorithm" is greedy: the shortest matching path is used.
It maps your home directory at "installation" and searches 
the map to find the directory which you want to change into. 
It might be usefull to set an alias to often used command line
options. I for example use `alias icd="icd -f"` as I have 
linked `/mnt` somewhere into my home. You can also manually 
create map files with the naming covention XX_name, where X
is a digit [0-9] and name my be any alphanumeric combination.

## Installation
```
git clone https://github.com/pur80a/icd.git
cd icd
chmod +x install.sh
./install.sh
bash
```
## Command line options

~~~USAGE: icd [-h|--help] [-v|--verbose] [-l|.|--local] [keyword]
-h|--help          show this help text and exit
-v|--verbose       show path of destination directory
-vv|--veryverbose  destination directory
-m|--map           map home filesystem and print to standard out and exit
-f|--follow        follow symbolic links (recommended for mapping)
-l|.|--local       start search at current directory
-                  go to previous directory
~~~



## Examples
~~~
/home/user/
└┬─ Documents
 │  ├─ School
 │  ├─ Personal
 │  └─ Work
 ├─ Pictures
 │  ├─ School
 │  ├─ Personal
 │  └─ Work
 └── Videos

icd sch -v 
/home/user/Pictures/School/
icd doc -v
/home/user/Documents/
icd do*sch -v
/home/user/Documents/School/
icd - -v 
/home/user/Documents/
icd . work
/home/user/Documents/Work

~~~
