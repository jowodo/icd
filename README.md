# Intelligently Change Directory (icd) 0.2
**Avoid using tiresome aliases to change directories!**
Change into arbitrary subdirectories.
The "algorithm" is greedy: the shortest matching path is used.
At the moment it only works for medium size trees, but fear not. 
Optimization is on it's way!
## Installation
```
git clone https://github.com/pur80a/icd.git
cd icd
chmod +x install.sh
./install.sh
```
##Command line options

~~~USAGE: icd [-h|--help] [-v|--verbose] [-l|.|--local] [keyword]
-h|--help          show this help text and exit
-v|--verbose       show path of destination directory
-vv|--veryverbose  destination directory
-m|--map           map home filesystem and print to standard out and exit
-f|--follow        follow symbolic links (recommended for mapping)
-l|.|--local       start search at current directory
-                  go to previous directory~~~k


## Examples
`icd uni` may change to `~/Documents/Univeristy`  
`icd uni*doc` may change to `~/Documents/University/Documents`  
`icd . doc` may change to `./anypath/doc`  
