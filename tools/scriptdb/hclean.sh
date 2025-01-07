#!/bin/bash

# Служебная утилита
# key:
#  ord        перенумеровать все правила во всех рабочих скриптах и отсортировать строки
#  omoid      сгенерировать базы omoid_auto.gz из omoid_ini.gz и omoid_pa_ini.gz
#  spell_flat все слова словарей без ё и ударений
#  spell_all  все слова словарей с именами, ё, ударениями и служебными символами
#  ddic       поиск в dic_*.gz дублей с разной основой (предотвратить затирание в памяти первой формы)

key="$1"
# Установка редактора: vim или neovim
edi=$(sed -rn 's/^\s*editor\s*=\s*(vim|nvim)\s*$/\1/ p' settings.ini)
vimspelldir="$HOME/.config/nvim/spell"
cdata=$(date)

# Переменные алфавита и служебных
RUUC=АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ
rulc=абвгдеёжзийклмнопрстуфхцчшщъыьэюя
RVUC=АЕЁИОУЫЭЮЯ
rvlc=аеёиоуыэюя
unxc=$(printf "\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0")
unxa=$(printf "\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0")
unxs=$(printf "\xe2\x80\xa4\xe2\x80\xa7")

# Массив со списком обязательных файлов
pack="automo.gz awx/beautify.awk class.list.gz classes.awk cstauto.awk cstring.awk defunct.awk deomo.awk demorphy.awk dic_cust.gz \
      dic_gl.gz dic_prl.gz dic_prq.gz dic_rest.gz dic_suw.gz exclusion.pat.gz fb2 functions.awk gw_caplists.awk hclean.sh ist.gz \
      main.awk mano-lc.txt.gz mano-uc.txt.gz namebase.txt.gz namedef.awk nomo.txt.gz omo-index.sed omo_list.phy.gz \
      omoid.me omoid_auto.gz omoid_flat.gz omoid_ini.gz omoid_pa_ini.gz preview.awk ruac.py rulg_all.py rulg_omo.py settings.ini \
      vsevso.awk wordbase0.gz yodef.awk yodef.txt.gz yolc.txt.gz yomo-lc.txt.gz yomo-uc.txt.gz ext/x4707.awk ext/x4709.awk \
      dik_prop.gz awx/rules_sort.awk cstrings.gz awx/sort_gzstrings.awk gen_prq.awk dix_prq.gz awx/parser.awk"
read -a minpack <<< $pack

# Проверка не потерялось ли чего
for f in "${minpack[@]}"; do
	if [[ ! -s $f ]]; then printf '\e[31;5;1m%s\e[0m \e[93m%s\e[0m\n' "Отсутствует файл:" $f; exit 1; fi; done

case $key in
    ord ) # перенумеровать все правила во всех рабочих скриптах и отсортировать строки
       awky="deomo.awk";     awk -vLETT="R" -f awx/rules_sort.awk $awky | awk -f awx/beautify.awk > $awky"_ord"; mv $awky"_ord" $awky;
       awky="vsevso.awk";    awk -vLETT="V" -f awx/rules_sort.awk $awky | awk -f awx/beautify.awk > $awky"_ord"; mv $awky"_ord" $awky;
       awky="defunct.awk";   awk -vLETT="D" -f awx/rules_sort.awk $awky | awk -f awx/beautify.awk > $awky"_ord"; mv $awky"_ord" $awky;
       awky="ext/x4707.awk"; awk -vLETT="Z" -f awx/rules_sort.awk $awky | awk -f awx/beautify.awk > $awky"_ord"; mv $awky"_ord" $awky;
       awky="ext/x4709.awk"; awk -vLETT="X" -f awx/rules_sort.awk $awky | awk -f awx/beautify.awk > $awky"_ord"; mv $awky"_ord" $awky;

       awky="cstring.awk";    awk -f awx/beautify.awk $awky > $awky"_ord"; mv $awky"_ord" $awky;
       awky="cstauto.awk";    awk -f awx/beautify.awk $awky > $awky"_ord"; mv $awky"_ord" $awky;
       awky="classes.awk";    awk -f awx/beautify.awk $awky > $awky"_ord"; mv $awky"_ord" $awky;
       awky="awx/parser.awk"; awk -f awx/beautify.awk $awky > $awky"_ord"; mv $awky"_ord" $awky;
       awky="gen_prq.awk";    awk -f awx/beautify.awk $awky > $awky"_ord"; mv $awky"_ord" $awky;

       awk -f awx/parser.awk deomo.awk defunct.awk vsevso.awk yodef.awk ext/x4707.awk ext/x4709.awk;

       zcat omoid_ini.gz | awk '{delete chars; ret="";for(i=3;i<=NF;i++){chars[$i]=$i}; chnum = asort(chars);
                                ret = $1 " " $2; for(j=1;j<=chnum;j++){ret=ret " " chars[j]}; print ret }' |\
                         sort -u | gzip > omoid_ini_ord.gz; mv omoid_ini_ord.gz omoid_ini.gz
       zcat omoid_pa_ini.gz | awk '{delete chars; ret="";for(i=3;i<=NF;i++){chars[$i]=$i}; chnum = asort(chars);
                                ret = $1 " " $2; for(j=1;j<=chnum;j++){ret=ret " " chars[j]}; print ret }' |\
                         sort -u | gzip > omoid_pa_ini_ord.gz; mv omoid_pa_ini_ord.gz omoid_pa_ini.gz
       zcat omoid_flat.gz | awk '{delete chars; ret="";for(i=3;i<=NF;i++){chars[$i]=$i}; chnum = asort(chars);
                                ret = $1 " " $2; for(j=1;j<=chnum;j++){ret=ret " " chars[j]}; print ret }' |\
                         sort -u | gzip > omoid_flat_ord.gz; mv omoid_flat_ord.gz omoid_flat.gz

       # сортировка cstrings.gz
       zcat cstrings.gz | awk -f awx/sort_gzstrings.awk | gzip > cstrings_ord.gz; mv cstrings_ord.gz cstrings.gz
       # gen_prq -- генерируем полный словарь причастий
       zcat dix_prq.gz | awk -f gen_prq.awk | sort -u | gzip > dic_prq.gz
       # ddic -- поиск дублей с разной основой
       zcat dic_*.gz | awk '{ if ( f1 == $1 && f2 == $2 )  {printf("\033[91m%s\n\033[0m", $0); fnd=1}; f1=$1; f2=$2; }
                            END { if(!fnd) printf("\033[32m%s\n\033[0m", "ord: дублей с разной основой не надено.")}' ;
       exit 1; ;;

    omoid ) # сгенерировать базы omoid_auto.gz из omoid_ini.gz и omoid_pa_ini.gz

       awk 'BEGIN {
               cmd = "zcat omoid_ini.gz";
               while ((cmd|getline) > 0) {
                     if ($2== "hsw4edro" ) { for (i=3; i<=NF; i++) hsw4edro[$1][$i]; continue };
                     if ($2== "hsw4mnro" ) { for (i=3; i<=NF; i++) hsw4mnro[$1][$i]; continue };
               }; close(cmd);
                
               cmd = "zcat dic_suw.gz";
               while ((cmd|getline) > 0) {gsub(/ё/,"е",$3); split($3,bf,"#");for(i in bf) { BF[bf[i]][$1] } }; close(cmd);

               for (i in hsw4edro)  {for (j in hsw4edro[i] ) {if(j in BF) {for (k in BF[j]) hsw4edro_[i][k]};};}
               for (i in hsw4mnro)  {for (j in hsw4mnro[i] ) {if(j in BF) {for (k in BF[j]) hsw4mnro_[i][k]};};}

               for (i in hsw4edro_) {for (j in hsw4edro_[i]) {print i, "hsw4edro", j } }
               for (i in hsw4mnro_) {for (j in hsw4mnro_[i]) {print i, "hsw4mnro", j } }                
             }' > omoid_auto 

       awk 'BEGIN {
            
               cmd = "zcat omoid_pa_ini.gz";
               while ((cmd|getline) > 0) {
                     if ($2== "gl4pa" ) { for (i=3; i<=NF; i++) gl4pa[$1][$i]; continue };
               }; close(cmd);
                
               cmd = "zcat dic_gl.gz dic_prq.gz";
               while ((cmd|getline) > 0) {gsub(/ё/,"е",$3); split($3,bf,"#");for(i in bf) { BF[bf[i]][$1] } }; close(cmd);

               for (i in gl4pa)  {for (j in gl4pa[i] ) {if(j in BF) {for (k in BF[j]) gl4pa_[i][k]};};}

               for (i in gl4pa_) {for (j in gl4pa_[i]) {print i, "gl4pa", j } }

                }' >> omoid_auto; sort -u omoid_auto | gzip > omoid_auto.gz; rm omoid_auto

        exit 1; ;;

    spell_flat ) # все слова словарей без ё и ударений
               zcat dic_*.gz | awk '{print $1}' > ru.txt
               zcat dik_prop.gz | awk '{ if ( ! $4 ) printf("%s\n", $1)}' | sort -u >> ru.txt
               zcat mano-lc.txt.gz yomo-lc.txt.gz |sed -r "s/[_=']//g; s/ё/е/g; s/ /\r/g" >> ru.txt
               zcat yodef.txt.gz yolc.txt.gz |sed -r "s/[_']//g; s/ё/е/g; s/=/\r/g;" >> ru.txt
               sed -r "s/\\\xcc\\\x81//g
                       s/\\\xcc\\\xa0//g
	                     s/\\\xcc\\\xa3//g
	                     s/\\\xcc\\\xa4//g
	                     s/\\\xcc\\\xad//g
	                     s/\\\xcc\\\xb0//g
                      " ru.txt |  sort -u > ruflat.txt
               $edi -c "mkspell! ru ruall.txt" +qall
               rm ru.txt ruall.txt
               mv -fv ru.utf-8.spl ~/.config/nvim/spell/ru.utf-8.spl
               printf "Список ruflat.txt: без ударений, ё, служебных символов. В vim: mkspell! ru ruflat.txt\n"
       exit 1; ;;

    spell_all ) # все слова словарей с именами, ё, ударениями и служебными символами
               zcat dic_*.gz | awk '{ if ( ! $4 ) printf("%s\n", $1)}' | sort -u > ru.txt
               zcat dik_prop.gz | awk '{ if ( ! $4 ) printf("%s\n", $1)}' | sort -u >> ru.txt
               zcat mano-lc.txt.gz yomo-lc.txt.gz |sed -r "s/[_=]//g; s/ /\n/g" >> ru.txt
               zcat mano-uc.txt.gz yomo-uc.txt.gz nomo.txt.gz |sed -r "s/[_=]//g; s/\b(.)/\l\1/g; s/ /\n/g" >> ru.txt
               zcat yodef.txt.gz yolc.txt.gz |sed -r "s/_//g; s/=/\n/g;" >> ru.txt
               zcat namebase0.txt.gz nameoverride.txt.gz |\
                    sed -r "s/(=\\\\xcc\\\\x[ab][034d])([$rulc])/\1\u\2/g
                            s/([_=])([$rulc])/\1\u\2/g
                            s/[_g]//g
                            s/=/\n/g" >> ru.txt
               zcat stray.gz names_raw.gz >> ru.txt # stray = некондиция; names_raw = имена без ударений. Только для спеллинга.
               sed -r "s/([$RVUC$rvlc])'/\1\xcc\x81/g
	                     s/\\\xcc\\\xa0/\xcc\xa0/g
	                     s/\\\xcc\\\xa3/\xcc\xa3/g
	                     s/\\\xcc\\\xa4/\xcc\xa4/g
	                     s/\\\xcc\\\xad/\xcc\xad/g
	                     s/\\\xcc\\\xb0/\xcc\xb0/g
                      " ru.txt |  sort -u > ruall.txt
               grep "[$unxa]" ruall.txt | sed -r "s/([$RVUC$rvlc])'/\1\xcc\x81/g; s/[$unxa]//g" | sort -u > ru.txt
               cat ru.txt >> ruall.txt
               $edi -c "mkspell! ru ruall.txt" +qall
               rm ru.txt ruall.txt
               mv -fv ru.utf-8.spl $vimspelldir/ru.utf-8.spl
#              printf "Список ruall.txt: с ударениями в омографах, ё, служебными символами! В vim: mkspell! ru ruall.txt\n"
               printf "\e[32m%s \e[36m%s \e[33m%s%s \e[36m%s\e[m\n" \
                 "$cdata" 'Установлен файл' $vimspelldir "/ru.utf-8.spl" 'с ударениями в омографах, ё, служебными символами.'
       exit 1; ;;

    ddic ) # поиск в dic_*.gz дублей с разной основой (предотвратить затирание в памяти первой формы)
               zcat dic_*.gz | awk '{ if ( f1 == $1 && f2 == $2 )  {printf("\033[91m%s\n\033[0m", $0); fnd=1}; f1=$1; f2=$2; }
                           END { if(!fnd) printf("\033[32m%s\n\033[0m", "Дублей с разной основой не надено.")}' ;
       exit 1; ;;

    pat4oc ) # создать полный список всех словоформ для фильтрации словаря opencorpora
              zcat dic_*.gz | awk '{ print "_" $1 "=" }' | sort -u | gzip > _stock.patt.gz
              zcat dik_*.gz | awk '{ $1=tolower($1); gsub("ё","е",$1); print "_" $1 "=" }' | sort -u | gzip >> _stock.patt.gz
              zcat _stock.patt.gz | sort -u | gzip > _stock.pat.gz; rm _stock.patt.gz
       exit 1; ;;

    pat4all ) # создать полный список всех словоформ для фильтрации словаря wiktionary
              zcat dix_prq.gz | awk -f gen_prq.awk | sort -u | gzip > dic_prq.gz

              zcat dic_*.gz | awk '{ print "_" $1 "=" }' | sort -u | gzip > _stock.patt.gz
              zcat dik_*.gz | awk '{ $1=tolower($1); gsub("ё","е",$1); print "_" $1 "=" }' | sort -u | gzip >> _stock.patt.gz
              zcat _stock.patt.gz | sort -u | gzip > _stock.pat.gz; rm _stock.patt.gz
              zcat dic_prl.gz  | awk '{ print   "_" $1 "="   }' | sort -u | gzip > _stock_prl.pat.gz
              zcat dic_prl.gz  | awk '{ print "\\s" $2 "\\s" }' | sort -u | gzip > _class_prl.gz
              zcat dic_prq.gz  | awk '{ print   "_" $1 "="   }' | sort -u | gzip > _stock_prq.pat.gz
              zcat dic_prq.gz  | awk '{ print "\\s" $2 "\\s" }' | sort -u | gzip > _class_prq.gz
              zcat dic_suw.gz  | awk '{ print   "_" $1 "="   }' | sort -u | gzip > _stock_suw.pat.gz
              zcat dic_suw.gz  | awk '{ print "\\s" $2 "\\s" }' | sort -u | gzip > _class_suw.gz
              zcat dic_gl.gz   | awk '{ print   "_" $1 "="   }' | sort -u | gzip > _stock_gl.pat.gz
              zcat dic_gl.gz   | awk '{ print "\\s" $2 "\\s" }' | sort -u | gzip > _class_gl.gz
              zcat dic_rest.gz | awk '{ print   "_" $1 "="   }' | sort -u | gzip > _stock_rest.pat.gz
              zcat dic_rest.gz | awk '{ print "\\s" $2 "\\s" }' | sort -u | gzip > _class_rest.gz
              zcat dix_prq.gz  | awk '{ print   "_" $1 "="   }' | sort -u | gzip > _stock_dixprq.pat.gz
              zcat wordbase0.gz | awk 'BEGIN{FS="="}{ print $1 "=" }' | sort -u | gzip > _stock_wb0.pat.gz
       exit 1; ;;

    gen_prq ) # создать полный список всех словоформ причастий из словаря dix
              zcat dix_prq.gz | awk -f gen_prq.awk | sort -u | gzip > dic_prq.gz
       exit 1; ;;

     * ) printf "%s\n" "WRONG ARG!"; exit 0; ;;


esac

