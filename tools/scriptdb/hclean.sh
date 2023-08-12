#!/bin/bash

# key:
# -ord  перенумеровать все правила во всех рабочих скриптах

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

        exit 1; ;;

    * ) exit 0; ;;


esac

