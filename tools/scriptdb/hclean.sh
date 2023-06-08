#!/bin/bash

# key:
# -ord  перенумеровать все правила во всех рабочих скриптах
# -don  включить возможность дебага (может слегка ускорить скрипты)
# -doff выключить возможность дебага (перестанет работать ./testrule.sh)

key="$1"

case $key in
    -ord )
       awk '{
             reg = "(^.* )[drv](\\[)[0-9]+(\\]\\+\\+; if\\(dbg\\){print \x22)[DRV][0-9]+(\x22.*)$"
             if ($0 ~ reg) {
                 rule++
                 match($0,reg,rega);
                 $0 = rega[1] "r" rega[2] rule rega[3] "R" rule rega[4]
                 print $0 } else { print $0 };
            }' deomo.awk | awk -f sort_cst.awk > deomo.awk_ord; mv deomo.awk_ord deomo.awk;
       awk '{
             reg = "(^.* )[drv](\\[)[0-9]+(\\]\\+\\+; if\\(dbg\\){print \x22)[DRV][0-9]+(\x22.*)$"
             if ($0 ~ reg) {
                 rule++
                 match($0,reg,rega);
                 $0 = rega[1] "v" rega[2] rule rega[3] "V" rule rega[4]
                 print $0 } else { print $0 };
            }' vsevso.awk | awk -f sort_cst.awk > vsevso.awk_ord; mv vsevso.awk_ord vsevso.awk;
       awk '{
             reg = "(^.* )[drv](\\[)[0-9]+(\\]\\+\\+; if\\(dbg\\){print \x22)[DRV][0-9]+(\x22.*)$"
             if ($0 ~ reg) {
                 rule++
                 match($0,reg,rega);
                 $0 = rega[1] "d" rega[2] rule rega[3] "D" rule rega[4]
                 print $0 } else { print $0 };
            }' defunct.awk | awk -f sort_cst.awk > defunct.awk_ord; mv defunct.awk_ord defunct.awk;
        exit 1; ;;

    * ) exit 0; ;;


esac

