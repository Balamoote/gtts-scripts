#!/bin/bash

IN="$@"

if [[ ! -n "$IN" ]]; then
  clip_IN="$(xsel -o)"
  IN="$clip_IN"
fi

IN=$(echo "$IN" | sed -r "\
  s/[\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]+//g;
  s/Ё/Е/g;
  s/ё/е/g;
  s=</?p>==g;
  ")

#printf "\e[93m%s\e[0m %s\n" "Поиск:" "$IN"
if [[ -n "$clip_IN" ]] && [[ "$clip_IN" != "$IN" ]]; then
  echo -n "$IN" | xsel --clipboard --input
fi

 echo $IN | sed -r "s/^.*$/<p>\0<\/p>/g" |\
     awk -vindb=scriptdb/ -vinax=scriptaux/ -vlocdic=scriptdb/ -ddebug.txt -vescan=1 -vescap=1 -vdbg=1 -f scriptdb/maint.awk |\
     sed -r "s/.\xcc\x81/`printf "\e[32m&\e[0m"`/g"

#echo $IN | sed -r "s/^.*$/<p>\0<\/p>/g" |\
#    awk -vindb=scriptdb/ -vinax=scriptaux/ -ddebug.txt -f scriptdb/yodef.awk |\
#    sed -r "s/(.\xcc\x81)|[ёЁ]/`printf "\e[32m&\e[0m"`/g"

