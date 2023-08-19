#!/bin/bash

# key:
# -ord    перенумеровать все правила во всех рабочих скриптах и отсортировать строки
# -omoid  сгенеригорать базы omoid_auto.gz из omoid_ini.gz и omoid_pa_ini.gz

key="$1"

case $key in
    -ord )
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
       zcat omoid_ini.gz | awk '{delete chars; rett="";for(i=3;i<=NF;i++){chars[$i]=$i}; chnum = asort(chars);
                                rett = $1 " " $2; for(j=1;j<=chnum;j++){rett=rett " " chars[j]}; print rett }' |\
                         sort -u | gzip > omoid_ini_ord.gz; mv omoid_ini_ord.gz omoid_ini.gz
       zcat omoid_part_ini.gz | awk '{delete chars; rett="";for(i=3;i<=NF;i++){chars[$i]=$i}; chnum = asort(chars);
                                rett = $1 " " $2; for(j=1;j<=chnum;j++){rett=rett " " chars[j]}; print rett }' |\
                         sort -u | gzip > omoid_part_ini_ord.gz; mv omoid_part_ini_ord.gz omoid_part_ini.gz
       zcat omoid_flat.gz | awk '{delete chars; rett="";for(i=3;i<=NF;i++){chars[$i]=$i}; chnum = asort(chars);
                                rett = $1 " " $2; for(j=1;j<=chnum;j++){rett=rett " " chars[j]}; print rett }' |\
                         sort -u | gzip > omoid_flat_ord.gz; mv omoid_flat_ord.gz omoid_flat.gz
       exit 1; ;;

    -omoid )

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

    * ) exit 0; ;;


esac

