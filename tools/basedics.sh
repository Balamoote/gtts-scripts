#!/bin/bash

S1=$(echo "$1" | sed -r "s/ё/е/g; s/\*/.*/g")
if [[ $S1 != $1 ]]; then printf "%s\n" $S1; fi

dicword="^"$S1"\b"
bfword="(\s\b|#)"$S1"(#|\b)"
sstring="\b"$S1"\b"
astromo="\s"$S1"\s"
mstromo="_"$S1"="
alldics="dic_gl.gz dic_prl.gz dix_prq.gz dic_rest.gz dic_suw.gz dic_cust.gz dik_prop.gz"
# выбрать одину из утилит для поиска: zgrep или rg (он же ripgrep)
grepper="rg -zNS --no-heading"
#grepper="zgrep -EH"

cd scriptdb/

case $2 in
  bf | бф | =) # для поиска под базовой форме слова
   $grepper "$bfword" $alldics |\
       awk 'BEGIN {FS="[ :]"} { printf ( "\033[36m%s \033[93m%s \033[33m%s \033[32m%s \033[31m%s\033[0m\n", $1, $2, $3, $4, $5 ) }'; exit 1 ;;
	*) # для всех остальных случаеев
   if [[ $1 ]]; then $grepper "$dicword" $alldics |\
      awk 'BEGIN {FS="[ :]"} { printf ( "\033[36m%s \033[93m%s \033[33m%s \033[32m%s \033[31m%s\033[0m\n", $1, $2, $3, $4, $5 ) }'
       else printf '\e[36m%s \e[33m%s \e[36m%s \e[33m%s \e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Использование:" \
         "./basedics.sh слово" "или" "./basedics.sh слов*" "или" "./basedics.sh слово =" "bf|бф|= для поиска по базовой форме"; fi; exit 1 ;;
esac

$grepper "$astromo" automo.gz |\
    awk 'BEGIN {FS="[ :]"} { gsub(/\x27/,"́",$5);
         printf ( "\033[36m%s \033[93m%s \033[33m%s \033[32m%s\033[0m %s %s\n", $1, $3, $2, $4, $5, $6 ) }'| sed "s/.́/`printf "\e[93m&\e[0m"`/g"
$grepper "$mstromo" mano-lc.txt.gz |\
    awk 'BEGIN {FS="[ =_:]+"} { gsub(/\x27/,"́",$3); gsub(/\x27/,"́",$4);
         printf ( "\033[36m%s \033[93m%s\033[0m %s %s \033[93m%s \033[32m%s\033[0m\n", $1, $2, $3, $4, $5, $6 ) }'| sed "s/.́/`printf "\e[32m&\e[0m"`/g"
$grepper "$sstring" omoid_auto.gz omoid_pa_ini.gz omoid_ini.gz |\
    awk 'BEGIN {FS="[ :]"} { rest=gensub(/^[a-z_.-]+:[а-я]+ [a-z_0-9]+ /,"","g",$0); printf ( "\033[36m%s \033[93m%s \033[33m%s \033[32m%s\033[0m\n", $1, $2, $3, rest ) }'
cd ..
