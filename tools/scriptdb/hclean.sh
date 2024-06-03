#!/bin/bash

# Служебная утилита
# key:
# -ord        перенумеровать все правила во всех рабочих скриптах и отсортировать строки
# -omoid      сгенерировать базы omoid_auto.gz из omoid_ini.gz и omoid_pa_ini.gz
# -spell_flat все слова словарей без ё и ударений
# -spell_all  все слова словарей с именами, ё, ударениями и служебными символами
# -ddic       поиск в dic_*.gz дублей с разной основой (предотвратить затирание в памяти первой формы)

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


case $key in
    -ord ) # перенумеровать все правила во всех рабочих скриптах и отсортировать строки
       awk '{    reg = "(^.* )[drvDRVZ](\\[)[0-9]+(\\]\\+\\+; if\\(dbg\\){print \x22)[DRV][0-9]+(\x22.*)$"
             if ($0 ~ reg) {
                 rule++
                 match($0,reg,rega);
                 $0 = rega[1] "R" rega[2] rule rega[3] "R" rule rega[4]
                 print $0 } else { print $0 };
            }' deomo.awk | awk -f beautify.awk > deomo.awk_ord; mv deomo.awk_ord deomo.awk;
       awk '{    reg = "(^.* )[drvDRV](\\[)[0-9]+(\\]\\+\\+; if\\(dbg\\){print \x22)[DRV][0-9]+(\x22.*)$"
             if ($0 ~ reg) {
                 rule++
                 match($0,reg,rega);
                 $0 = rega[1] "V" rega[2] rule rega[3] "V" rule rega[4]
                 print $0 } else { print $0 };
            }' vsevso.awk | awk -f beautify.awk > vsevso.awk_ord; mv vsevso.awk_ord vsevso.awk;
       awk '{    reg = "(^.* )[drvDRVZ](\\[)[0-9]+(\\]\\+\\+; if\\(dbg\\){print \x22)[DRV][0-9]+(\x22.*)$"
             if ($0 ~ reg) {
                 rule++
                 match($0,reg,rega);
                 $0 = rega[1] "D" rega[2] rule rega[3] "D" rule rega[4]
                 print $0 } else { print $0 };
            }' defunct.awk | awk -f beautify.awk > defunct.awk_ord; mv defunct.awk_ord defunct.awk;
       awk '{    reg = "(^.* )[drvDRVZ](\\[)[0-9]+(\\]\\+\\+; if\\(dbg\\){print \x22)[DRVZ][0-9]+(\x22.*)$"
             if ($0 ~ reg) {
                 rule++
                 match($0,reg,rega);
                 $0 = rega[1] "Z" rega[2] rule rega[3] "Z" rule rega[4]
                 print $0 } else { print $0 };
            }' zamok.awk | awk -f beautify.awk > zamok.awk_ord; mv zamok.awk_ord zamok.awk;
       awk -f beautify.awk cstring.awk > cstring.awk_ord; mv cstring.awk_ord cstring.awk;
       awk -f beautify.awk cstauto.awk > cstauto.awk_ord; mv cstauto.awk_ord cstauto.awk;
       awk -f beautify.awk classes.awk > classes.awk_ord; mv classes.awk_ord classes.awk;
       awk -f beautify.awk parser.awk > parser.awk_ord; mv parser.awk_ord parser.awk;
       awk -f parser.awk deomo.awk defunct.awk vsevso.awk yodef.awk zamok.awk;

       zcat omoid_ini.gz | awk '{delete chars; ret="";for(i=3;i<=NF;i++){chars[$i]=$i}; chnum = asort(chars);
                                ret = $1 " " $2; for(j=1;j<=chnum;j++){ret=ret " " chars[j]}; print ret }' |\
                         sort -u | gzip > omoid_ini_ord.gz; mv omoid_ini_ord.gz omoid_ini.gz
       zcat omoid_pa_ini.gz | awk '{delete chars; ret="";for(i=3;i<=NF;i++){chars[$i]=$i}; chnum = asort(chars);
                                ret = $1 " " $2; for(j=1;j<=chnum;j++){ret=ret " " chars[j]}; print ret }' |\
                         sort -u | gzip > omoid_pa_ini_ord.gz; mv omoid_pa_ini_ord.gz omoid_pa_ini.gz
       zcat omoid_flat.gz | awk '{delete chars; ret="";for(i=3;i<=NF;i++){chars[$i]=$i}; chnum = asort(chars);
                                ret = $1 " " $2; for(j=1;j<=chnum;j++){ret=ret " " chars[j]}; print ret }' |\
                         sort -u | gzip > omoid_flat_ord.gz; mv omoid_flat_ord.gz omoid_flat.gz
       exit 1; ;;

    -omoid ) # сгенерировать базы omoid_auto.gz из omoid_ini.gz и omoid_pa_ini.gz

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

    -spell_flat ) # все слова словарей без ё и ударений
               zcat dic_*.gz | awk '{print $1}' > ru.txt
               zcat dik_prop.gz | awk '{ if ( ! $4 ) printf("%s\n", $1)}' | sort -u >> ru.txt
               zcat mano-lc0.txt.gz yomo-lc0.txt.gz |sed -r "s/[_=']//g; s/ё/е/g; s/ /\r/g" >> ru.txt
               zcat yodef0.txt.gz yodef1.txt.gz |sed -r "s/[_']//g; s/ё/е/g; s/=/\r/g;" >> ru.txt
               cat yolc.txt | sed -r "s/_//g; s/ё/е/g; s/=/\r/g;" >> ru.txt
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

    -spell_all ) # все слова словарей с именами, ё, ударениями и служебными символами
               zcat dic_*.gz | awk '{ if ( ! $4 ) printf("%s\n", $1)}' | sort -u > ru.txt
               zcat dik_prop.gz | awk '{ if ( ! $4 ) printf("%s\n", $1)}' | sort -u >> ru.txt
               zcat mano-lc0.txt.gz yomo-lc0.txt.gz |sed -r "s/[_=]//g; s/ /\n/g" >> ru.txt
               zcat mano-uc0.txt.gz yomo-uc0.txt.gz nomo.txt.gz |sed -r "s/[_=]//g; s/\b(.)/\l\1/g; s/ /\n/g" >> ru.txt
               zcat yodef0.txt.gz yodef1.txt.gz |sed -r "s/_//g; s/=/\n/g;" >> ru.txt
               zcat namebase0.txt.gz nameoverride.txt.gz |\
                    sed -r "s/(=\\\\xcc\\\\x[ab][034d])([$rulc])/\1\u\2/g
                            s/([_=])([$rulc])/\1\u\2/g
                            s/[_g]//g
                            s/=/\n/g" >> ru.txt
               zcat stray.gz names_raw.gz >> ru.txt # stray = некондиция; names_raw = имена без ударений. Только для спеллинга.
               cat yolc.txt |sed -r "s/_//g; s/=/\n/g;" >> ru.txt
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

    -ddic ) # поиск в dic_*.gz дублей с разной основой (предотвратить затирание в памяти первой формы)
               zcat dic_*.gz | awk '{ if ( f1 == $1 && f2 == $2 )  {printf("\033[91m%s\n\033[0m", $0); fnd=1}; f1=$1; f2=$2; }
                           END { if(!fnd) printf("\033[32m%s\n\033[0m", "Дублей с разной основой не надено.")}' ;
       exit 1; ;;

    -pat4oc ) # создать полный список всех словоформ для фильтрации словаря opencorpora
              zcat dic_*.gz | awk '{ print "_" $1 "=" }' | sort -u | gzip > _stock.patt.gz
              zcat dik_*.gz | awk '{ $1=tolower($1); gsub("ё","е",$1); print "_" $1 "=" }' | sort -u | gzip >> _stock.patt.gz
              zcat _stock.patt.gz | sort -u | gzip > _stock.pat.gz; rm _stock.patt.gz
       exit 1; ;;

    * ) exit 0; ;;


esac

