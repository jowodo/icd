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
mkdir -p $HOME/.icd
cp -v $PWD/icd $HOME/.icd/icd

echo "=============================================="
echo "| sourcing $DESTDIR/icd from following file: |"
echo "=============================================="
echo "[1] ~/.bashrc (default)"
echo "[2] ~/.bash_functions"
echo "[3] other file"
read input 
if [[ $input = 2 ]]; then DESTFILE=$HOME/.bash_functions ; fi
if [[ $input = 3 ]]; then
	echo -n "Please specify location: "
	read DESTFILE
fi

echo "following text was apended to $DESTFILE"
echo "if [ -f $HOME/.icd/icd ] ; then source $HOME/.icd/icd ; fi" | tee -a $DESTFILE

