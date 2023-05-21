#!/bin/bash

dicword="^"$1"\b"
sstring="\b"$1"\b"
sstromo="\s"$1"\s"

cd scriptdb/

zgrep -EH "$dicword" dic_gl.gz dic_prl.gz dic_prq.gz dic_rest.gz dic_suw.gz dic_cust.gz |\
	awk 'BEGIN {FS="[ :]"} { printf ( "\033[36m%s \033[93m%s \033[33m%s \033[32m%s\033[0m\n", $1, $2, $3, $4 ) }'
zgrep -EH "$sstromo" automo.gz |\
	awk 'BEGIN {FS="[ :]"} { printf ( "\033[36m%s \033[93m%s \033[33m%s \033[32m%s \033[93m%s \033[32m%s\033[0m\n", $1, $3, $2, $4, $5, $6 ) }'
zgrep -EH "$sstring" omoid_an.gz omoid_part.gz omos_part.gz |\
    awk 'BEGIN {FS="[ :]"} { rest=gensub(/^[a-z_.-]+:[а-я]+ [a-z_0-9]+ /,"","g",$0); printf ( "\033[36m%s \033[93m%s \033[33m%s \033[32m%s\033[0m\n", $1, $2, $3, rest ) }'
cd ..
