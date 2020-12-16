# Intelligently Change Directory (icd) Version 0.2
Avoid using tiresome aliases to change directories!
Change into arbitrary subdirectories 
The "algorithm" is greedy: the shortest matching path is used 
Only works for medium size trees, but fear not. 
Optimization is on it's way!
## Installation
```
git clone https://github.com/pur80a/icd.git
cd icd
chmod +x install.sh
./install.sh
```

## Examples
`icd uni` may change to `~/Documents/Univeristy`
`icd uni*doc` may change to `~/Documents/University/Documents`
`icd . doc` may change to `./anypath/doc`
