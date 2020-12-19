#!/bin/bash

DESTDIR=$HOME/.icd
DESTFILE=$HOME/.bashrc
echo "==============================="
echo "| copying icd-file to ~/.icd/ |"
echo "==============================="
echo "[1] copy from here to ~/.icd/ (default)"
echo "[2] copy from here to ~/.local/bin"
echo "[3] copy to other location"
read input 
if [[ $input = 2 ]]; then DESTDIR=$HOME/.local/bin; fi
if [[ $input = 3 ]]; then
	echo -n "Please specify location: "
	read DESTDIR
fi

PWD=$(pwd)
mkdir -vp $HOME/.icd
cp -v $PWD/icd $HOME/.icd/icd

f=-f
source icd
echo "=========================================="
echo "| Follow links while mapping filesystem? |"
echo "=========================================="
echo -e "[yes] follow links (default)\n[no] don't follow links"
read input 
if [[ input = "no" ]]; then f="" ; fi
echo "saving map of home filesystem "
echo "this might take some time depending on your filesystem size..."
icd -m $f > $HOME/.icd/99_map 
echo "saved map of home filesytem to ~/.icd/99_map"
echo ""

###count length of destdir
lod=$(echo -n $DESTDIR | wc -c )

head -c $lod /dev/zero | tr '\0' '='
echo "======================================"
echo "| sourcing $DESTDIR/icd from following file: |"
head -c $lod /dev/zero | tr '\0' '='
echo "======================================"
echo "[1] ~/.bashrc (default)"
echo "[2] ~/.bash_functions"
echo "[3] other file"
echo "[4] /dev/null (update)"
read input 
if [[ $input = 2 ]]; then DESTFILE=$HOME/.bash_functions ; fi
if [[ $input = 3 ]]; then
	echo -n "Please specify location: "
	read DESTFILE
fi
if [[ $input = 4 ]]; then DESTFILE=/dev/null ; fi 

echo "following text was apended to $DESTFILE"
echo "if [ -f $HOME/.icd/icd ] ; then source $HOME/.icd/icd ; fi" | tee -a $DESTFILE

