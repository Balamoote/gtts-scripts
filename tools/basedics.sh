#!/bin/bash

S1=$(echo "$1" | sed -r "s/ё/е/g; s/\*/.*/g")
if [[ $S1 != $1 ]]; then printf "%s\n" $S1; fi

dicword="^"$S1"\b"
sstring="\b"$S1"\b"
sstromo="\s"$S1"\s"

cd scriptdb/

zgrep -EH "$dicword" dic_gl.gz dic_prl.gz dic_prq.gz dic_rest.gz dic_suw.gz dic_cust.gz |\
    awk 'BEGIN {FS="[ :]"} { printf ( "\033[36m%s \033[93m%s \033[33m%s \033[32m%s \033[31m%s\033[0m\n", $1, $2, $3, $4, $5 ) }'
zgrep -EH "$sstromo" automo.gz |\
    awk 'BEGIN {FS="[ :]"} { gsub(/\x27/,"́",$5);
         printf ( "\033[36m%s \033[93m%s \033[33m%s \033[32m%s \033[93m%s \033[32m%s\033[0m\n", $1, $3, $2, $4, $5, $6 ) }'
zgrep -EH "$sstring" omoid_auto.gz omoid_pa_ini.gz omoid_ini.gz |\
    awk 'BEGIN {FS="[ :]"} { rest=gensub(/^[a-z_.-]+:[а-я]+ [a-z_0-9]+ /,"","g",$0); printf ( "\033[36m%s \033[93m%s \033[33m%s \033[32m%s\033[0m\n", $1, $2, $3, rest ) }'
cd ..
