#!/bin/bash

IN="$@"

 time echo $IN| sed -r "s/[\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]+//g; s/^.*$/<p>\0<\/p>/g" |\
     awk -vindb=scriptdb/ -vinax=scriptaux/ -vlocdic=scriptdb/ -ddebug.txt -vdbg=1 -f scriptdb/main.awk 

#time awk -vindb=../../scriptdb/ -vinax=../../scriptaux/ -vdbg=1 -f <(sed -r 's=(scriptdb/)=../../\1=g' ../../scriptdb/yodef.awk) 
#time awk -f deomo.awk $in > $out 


