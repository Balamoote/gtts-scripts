#!/bin/bash

part=$1
omoid="^"$2"$"
#omoid=$2
case $part in 
    part) omgz="omoid_part.gz" ;;
    an) omgz="omoid_an.gz" ;;
    aus) omgz="omoid_aus.gz" ;;
    *) printf '\e[32m%s\e[0m\n' "Задайте ключ: part, an, aus"; exit 0 ;;
esac

zcat dic_gl.gz dic_prl.gz dic_prq.gz dic_rest.gz dic_suw.gz | awk -vomoid=$omoid -vmorfy=$3 '{if ($1 ~ omoid) { print $1, morfy } }'|\
	sort -u | gzip >> $omgz
