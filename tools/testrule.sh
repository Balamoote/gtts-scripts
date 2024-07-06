#!/bin/bash

IN="$@"

 echo $IN| sed -r "s/[\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]+//g; s/^.*$/<p>\0<\/p>/g" |\
     awk -vindb=scriptdb/ -vinax=scriptaux/ -vlocdic=scriptdb/ -ddebug.txt -vescan=1 -vdbg=1 -f scriptdb/maint.awk |\
     sed -r "s/.\xcc\x81/`printf "\e[32m&\e[0m"`/g"

#echo $IN| sed -r "s/[\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]+//g; s/^.*$/<p>\0<\/p>/g" |\
#    awk -vindb=scriptdb/ -vinax=scriptaux/ -ddebug.txt -f scriptdb/yodef.awk |\
#    sed -r "s/(.\xcc\x81)|[ёЁ]/`printf "\e[32m&\e[0m"`/g"

