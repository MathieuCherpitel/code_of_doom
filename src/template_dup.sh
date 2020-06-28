#!/bin/bash

input=$1
count=0
name=".py"
if [ "$1" == "-h" ];
then
    echo "usage : arg1 : file number arg2 : template file path"
    exit
else
    while [ $1 -gt count ]
    do
        fulname = $1 + $name
        touch $fulname
        cat $2 >> fulname
        count=$((count+1))
    done
fi