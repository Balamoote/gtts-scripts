# Деомографизатор
# Читает файл словаря с морфологической информаций и заменяет омографы согласно правилам

# Перенумеровать правила в vim:
# let @a=1|%s/"R\zs\d\+\ze"/\=''.(@a+setreg('a',@a+1))/g|%s/{r\[\zs\d\+\ze\]++; print "R\(\d\+\)"/\1/g|%s/(dbgstat==1) {for (i=1; i<=\zs\d\+\ze;/\=''.(@a-1)/g
#
# NB: во всех функциях поле указывается относительно 0, 0 - это позиция поискового слова. 

 # @: развести падежи сущ в ед.ч.

function joinpat(array, seps, nuf,    rett, i, k) # Склеить строку обратно
                { rett = seps [0]; for (i=1; i<= nuf; i++) {rett = rett array[i] seps[i]}; return rett }
function pusha(arr, arrto,    k)                  # добывать массив выдать 1-й символ строки-сеператора
                { for (k in arr) {arrto[k]}; }
function stoar(string, arrto, sepr,    i,arrt)    # добывать массив выдать 1-й символ строки-сеператора
                { split(string, arrt, sepr); for (i in arrt) {arrto[arrt[i]]}; delete arrt; }
function sl(n,    rett)                           # выдать 1-й символ строки-сеператора
                { rett = substr(sep[i+n],1,1); return rett }
function lc(n,   rett)                            # перевести в нижний гегистр
                { rett = tolower(l[i+n]); return rett }
function q(n, array,    el, rett)                 # слово в массиве?
                { el = tolower(l[i+n]); if(el in array) {rett=1} else {rett=0}; return rett}
function qq(m, n,    rett)                        # слово m равно слово n?
                { if ( tolower(l[i+m]) == tolower(l[i+n]) ) {rett=1} else {rett=0}; return rett}
function qb(n, array,    k, rett)                 # поиск на n шагов назад наличия слова в массиве
                { rett=0; qbn=""; for (k=-1; k>=n; k--) { if (tolower(l[i+k]) in array) {rett=1; qbn=k; break}; }; return rett }
function qf(n, array,    k, rett)                 # поиск на n шагов вперёд наличия слова в массиве
                { rett=0; qfn=""; for (k= 1; k<=n; k++) { if (tolower(l[i+k]) in array) {rett=1; qfn=k; break}; }; return rett }
function Qb(n, array,    k, rett)                 # поиск на n шагов назад отсутствия слова в массиве
                { rett=1; for (k=-1; k>=n; k--)   { if (tolower(l[i+k]) in array) {rett=0; break}; }; return rett }
function Qf(n, array,    k, rett)                 # поиск на n шагов вперёд отсутствия слова в массиве
                { rett=1; for (k= 1; k<=n; k++)   { if (tolower(l[i+k]) in array) {rett=0; break}; }; return rett }
function Q(n, array,    rett)                     # слово НЕ в массиве?
                { if (tolower(l[i+n]) in array) {rett=0} else {rett=1}; return rett }
function p(n,    rett)                            # разделитель содержит препинаний?
                { if ( sep[i+n] ~ "[…,.:;!?—]" )  {rett=1} else {rett=0}; return rett }
function sc(n, sym,    el, k, rett)               # поиск символа в разделителе: "содержит"
                { el = sep[i+n]; if (el ~ sym)    {rett=1} else {rett=0}; return rett }
function se(n, sym,    el, k, rett)               # разделитель "равен"
                { el = sep[i+n]; if (el == sym)   {rett=1} else {rett=0}; return rett }
function cap(n,    el, rett)                      # Слово с заглавной буквы?
                { el = l[i+n]; if ( substr(el,1,1) ~ RUUC ) {rett=1} else {rett=0}; return rett }
function w(n, wl,    wrds, k, lk, rett)           # нахождение в списке? = "одно из слов"
                { lk=split(wl, wrds, " "); for (k=1; k<=lk; k++) { if (tolower(l[i+n])==wrds[k]) {rett=1; break} else {rett=0};}; return rett }
function W(n, wl,    wrds, k, lk, rett)           # НЕнахождение в списке? != "одно из слов"
                { lk=split(wl, wrds, " "); for (k=1; k<=lk; k++) { if (tolower(l[i+n])==wrds[k]) {rett=0; break} else {rett=1};}; return rett }
function wb(n, wl,    wrds, k, rett)              # поиск на n шагов назад слова из списка 
                { rett=0; wbn=""; split(wl, wrds, " "); for (k=-1; k>=n; k--) { if (tolower(l[i+k]) in wrds) {rett=1; wbn=k; break};}; return rett }
function wf(n, wl,    wrds, k, rett)              # поиск на n шагов вперёд наличия слова в массиве
                { rett=0; wfn=""; stoar(wl, wrds, " "); for (k= 1; k<=n; k++) { if (tolower(l[i+k]) in wrds) {rett=1; wfn=k; break};}; return rett }
function s(m, n,    k, rett)                      # разделители в диапазоне НЕ содержат препинаний? = пробел
                { for (k=m; k<=n; k++) { if (sep[i+k] ~ "[…,.:;!?—]" ) {rett=0; break} else {rett=1}; }; return rett }
function sv(m, n, pu,    k, rett)                 # разделители в диапазоне НЕ содержат препинания препинаний, кроме , и —
                { for (k=m; k<=n; k++) { if (sep[i+k] ~ "[….:;!?]")    {rett=0; break} else {rett=1}; }; return rett }
function pv(m, n, pu,    k, rett)                 # разделители в диапазоне НЕ содержат препинания pu
                { for (k=m; k<=n; k++) { if (sep[i+k] ~ pu) {rett=0; break} else {rett=1}; }; return rett }
function vv(n,    k, rett)                        # выдать границы вводного предложения: , и —, n= первая запятая
                {vvn="";rett=0; if(sep[i+n]~vvpat) {for(k=++n;k<=n+7;k++) {if(sep[i+k] !~ "[….:;!?]") {if(sep[i+k]~vvpat) {rett=1;vvn=k;break};};};}; return rett}
function vvb(n,    k, rett)                       # выдать границы вводного предложения: , и —, n= первая запятая
                {vvn="";rett=0; if(sep[i+n]~vvpat) {for(k=--n;k>=n-7;k--) {if(sep[i+k] !~ "[….:;!?]") {if(sep[i+k]~vvpat) {rett=1;vvn=k;break};};};}; return rett}
function phs(n, wl,    wrds, k, lk, cnt, rett)    # кусок фразы ДО слова
                {hsn="";lk=split(wl,wrds," "); for(k=1;k<=lk;k++){if(tolower(l[i-lk+k+n])==wrds[k]){cnt++}else{cnt=0; break};};if(cnt==lk){rett=1;hsn=n+lk}else{rett=0}; return rett}
function phf(n, wl,    wrds, k, lk, cnt, rett)    # кусок фразы ПОСЛЕ слова
                {hfn="";lk=split(wl,wrds," "); for(k=1;k<=lk;k++){if(tolower(l[i+n+k-1]) ==wrds[k]){cnt++}else{cnt=0; break};};if(cnt==lk){rett=1;hfn=n+lk}else{rett=0}; return rett}
function ar(n, array,   i, rett)                  # устранить пропуск в массиве
                { rett = length(array); for (i=n; i<=rett; i++) {array[i] = array[i+1]}; delete array[rett+1]; return rett }

BEGIN {
    #dbg = 1
    #dbgstat = 1

    unxy    = "[\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
    unxn    = "[^\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
    RUUC    = "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ]+"
    rulc    = "[абвгдеёжзийклмнопрстуфхцчшщъыьэюя]+"
    patword = "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb00-9]+"
    vvpat   = "[,—]"

    # массивы для разных целей
    
    # части слов с дефисом для склейки
    cst = "где докуда зачем из как когда кое кто кому кого кем куда откуда отчего по потому почему что сколько чего чему чье чьё чьем чьём чью"; 
        stoar(cst,hyp1," ")
    cst = "где за зачем когда кое куда либо над нибудь никак откуда отчего под подо почему то что";
        stoar(cst,hyp2," ")
    # расширенное "это"
    cst = "это то се сие оно сё";
        stoar(cst,mest_it," ");
    cst = "готово можно должно нельзя могло смогло было стало хотело желало";
        stoar(cst,md_bz," ");
    cst = "будет был была готов готова мог могла смог смогла сможет хотел хотела захотел захотела хотел хотела должен должна желал желала";
        stoar(cst,md_ed," ");
    cst = "готовы могут будут смогли сможете хотят хотели захотят захотели могли хотели должны желали";
        stoar(cst,md_mn," ");


#    cmd = "zcat basedic.gz glquv.gz glgov.gz gldvi.gz geo.gz gldel.gz";
   cmd = "zcat custdic.gz";
   while ((cmd|getline) > 0) {

   if ($2~ /^gl_/) {
        if($2~  /^gl_чув_/ && $2~ /_ср_ед/               ){  gl_quvedsr [$1];                                           };
        if($2~  /^gl_гов_/ && $2~ /_ср_ед/               ){  gl_quvedsr [$1];                                           };
        if($2~  /^gl_дел_/ && $2~ /_ср_ед/               ){  gl_deledsr [$1];                                           };
        if($2~  /^gl_дви_/ && $2~ /_ср_ед/               ){  gl_dviedsr [$1];                                           };
        if($2~  /^gl_гов_/ && $2~ /_пов/                 ){  gl_govpo   [$1];                                           };
        if($2~  /^gl_чув_/ && $2~ /_пов/                 ){  gl_quvpo   [$1];                                           };
        if($2~  /^gl_дел_/ && $2~ /_пов/                 ){  gl_delpo   [$1];                                           };
        if($2~  /^gl_дви_/ && $2~ /_пов/                 ){  gl_dvipo   [$1];                                           };
        if($2~  /^gl_чув_/ && $2~ /_ед/                  ){  gl_quved   [$1];  gl_quv   [$1];                  continue };
        if($2~  /^gl_чув_/ && $2~ /_мн/                  ){  gl_quvmn   [$1];  gl_quv   [$1];                  continue };
        if($2~  /^gl_чув_/ && $2~ /_инф/                 ){  gl_quvin   [$1];  gl_quv   [$1];                  continue };
        if($2~  /^gl_гов_/ && $2~ /_ед/                  ){  gl_goved   [$1];  gl_gov   [$1];                  continue };
        if($2~  /^gl_гов_/ && $2~ /_мн/                  ){  gl_govmn   [$1];  gl_gov   [$1];                  continue };
        if($2~  /^gl_гов_/ && $2~ /_инф/                 ){  gl_govin   [$1];  gl_gov   [$1];                  continue };
        if($2~  /^gl_дел_/ && $2~ /_ед/                  ){  gl_deled   [$1];  gl_del   [$1];                  continue };
        if($2~  /^gl_дел_/ && $2~ /_мн/                  ){  gl_delmn   [$1];  gl_del   [$1];                  continue };
        if($2~  /^gl_дел_/ && $2~ /_инф/                 ){  gl_delin   [$1];  gl_del   [$1];                  continue };
        if($2~  /^gl_дви_/ && $2~ /_ед/                  ){  gl_dvied   [$1];  gl_dvi   [$1];                  continue };
        if($2~  /^gl_дви_/ && $2~ /_мн/                  ){  gl_dvimn   [$1];  gl_dvi   [$1];                  continue };
        if($2~  /^gl_дви_/ && $2~ /_инф/                 ){  gl_dviin   [$1];  gl_dvi   [$1];                  continue };
   };                                                                                                          
   if ($2~ /^geo_/) {                                                                             
        if($2~  /^geo_ед_ср_им$/                         ){  geo_edsrim [$1];                                  continue };
        if($2~  /^geo_мн_им$/                            ){  geo_mnim   [$1];                                  continue };
   };                                                                                                         
   } close(cmd);                                                                                              
                                                                                                              
   cmd = "zcat basedic.gz";                                                                                   
   while ((cmd|getline) > 0) {                                                                                
                                                                                                              
   if ($2~ /^гл_/) {                                                                             
        if($2~  /_прош_ед_ср$/                           ){  gl_edsr    [$1];                                           };
                                                                                                              
      if ($2~  /^гл_сов_непер_/) {                                                               
                                                                                                              
        if($2~  /^гл_сов_непер_буд_ед/                   ){  gl_ed      [$1];                                  continue }; #gl_sonebued   [$1];
        if($2~  /^гл_сов_непер_буд_мн/                   ){  gl_nemn    [$1];                                  continue }; #gl_sonebumn   [$1];
        if($2~  /^гл_сов_непер_инф$/                     ){  gl_in      [$1];                                  continue }; #gl_sonein     [$1];
        if($2~  /^гл_сов_непер_инф_безл$/                ){  gl_in      [$1];                                  continue }; #gl_soneinbe   [$1];
        if($2~  /^гл_сов_непер_пов_ед$/                  ){  gl_poed    [$1];                                  continue }; #gl_sonepoed   [$1];
        if($2~  /^гл_сов_непер_пов_мн$/                  ){  gl_ponemn  [$1];                                  continue }; #gl_sonepomn   [$1];
        if($2~  /^гл_сов_непер_прош_ед/                  ){  gl_ed      [$1];                                  continue }; #gl_sonepred   [$1];
        if($2~  /^гл_сов_непер_прош_мн/                  ){  gl_nemn    [$1];                                  continue }; #gl_soneprmn   [$1];
        if($2~  /^гл_сов_непер_воз_буд_ед/               ){  gl_ed      [$1]; gl_vzed [$1];                    continue }; #gl_sonevzbued [$1];
        if($2~  /^гл_сов_непер_воз_буд_мн/               ){  gl_vzmn    [$1];                                  continue }; #gl_sonevzbumn [$1];
        if($2~  /^гл_сов_непер_воз_инф$/                 ){  gl_in      [$1];                                  continue }; #gl_sonevzin   [$1];
        if($2~  /^гл_сов_непер_воз_инф_безл$/            ){  gl_in      [$1];                                  continue }; #gl_sonevzinbe [$1];
        if($2~  /^гл_сов_непер_воз_пов_ед$/              ){  gl_poed    [$1]; gl_vzed [$1];                    continue }; #gl_sonevzpoed [$1];
        if($2~  /^гл_сов_непер_воз_пов_мн$/              ){  gl_ponemn  [$1];                                  continue }; #gl_sonevzpomn [$1];
        if($2~  /^гл_сов_непер_воз_прош_ед/              ){  gl_ed      [$1]; gl_vzed [$1];                    continue }; #gl_sonevzpred [$1];
        if($2~  /^гл_сов_непер_воз_прош_мн/              ){  gl_vzmn    [$1];                                  continue }; #gl_sonevzprmn [$1];
      };                                                                                                       
      if ($2~ /^гл_сов_перех_/) {                                                                
                                                                                                               
        if($2~  /^гл_сов_перех_буд_ед/                   ){  gl_ed      [$1];                                  continue }; #gl_sopebued   [$1];
        if($2~  /^гл_сов_перех_буд_мн/                   ){  gl_pemn    [$1];                                  continue }; #gl_sopebumn   [$1];
        if($2~  /^гл_сов_перех_инф$/                     ){  gl_in      [$1];                                  continue }; #gl_sopein     [$1];
        if($2~  /^гл_сов_перех_инф_безл$/                ){  gl_in      [$1];                                  continue }; #gl_sopeinbe   [$1];
        if($2~  /^гл_сов_перех_пов_ед$/                  ){  gl_poed    [$1];                                  continue }; #gl_sopepoed   [$1];
        if($2~  /^гл_сов_перех_пов_мн$/                  ){  gl_popemn  [$1];                                  continue }; #gl_sopepomn   [$1];
        if($2~  /^гл_сов_перех_прош_ед/                  ){  gl_ed      [$1];                                  continue }; #gl_sopepred   [$1];
        if($2~  /^гл_сов_перех_прош_мн$/                 ){  gl_pemn    [$1];                                  continue }; #gl_sopeprmn   [$1];
      };                                                                                                       
      if ($2~ /^гл_сов_перне_/) {                                                                
                                                                                                               
        if($2~  /^гл_сов_перне_буд_ед/                   ){  gl_ed      [$1];                                  continue }; #gl_sopnbued   [$1];
        if($2~  /^гл_сов_перне_буд_мн/                   ){  gl_pnmn    [$1];                                  continue }; #gl_sopnbumn   [$1];
        if($2~  /^гл_сов_перне_инф$/                     ){  gl_in      [$1];                                  continue }; #gl_sopnin     [$1];
        if($2~  /^гл_сов_перне_инф_безл$/                ){  gl_in      [$1];                                  continue }; #gl_sopninbe   [$1];
        if($2~  /^гл_сов_перне_пов_ед$/                  ){  gl_poed    [$1];                                  continue }; #gl_sopnpoed   [$1];
        if($2~  /^гл_сов_перне_пов_мн$/                  ){  gl_popnmn  [$1];                                  continue }; #gl_sopnpomn   [$1];
        if($2~  /^гл_сов_перне_прош_ед/                  ){  gl_ed      [$1];                                  continue }; #gl_sopnpred   [$1];
        if($2~  /^гл_сов_перне_прош_мн$/                 ){  gl_pnmn    [$1];                                  continue }; #gl_sopnprmn   [$1];
      };                                                                                                       
      if ($2~ /^гл_несов_непер_/) {                                                              
                                                                                                               
        if($2~  /^гл_несов_непер_наст_ед/                ){  gl_ed      [$1];                                  continue }; #gl_nsnenaed   [$1];
        if($2~  /^гл_несов_непер_наст_мн/                ){  gl_nemn    [$1];                                  continue }; #gl_nsnenamn   [$1];
        if($2~  /^гл_несов_непер_инф$/                   ){  gl_in      [$1];                                  continue }; #gl_nsnein     [$1];
        if($2~  /^гл_несов_непер_инф_безл$/              ){  gl_in      [$1];                                  continue }; #gl_nsneinbe   [$1];
        if($2~  /^гл_несов_непер_пов_ед$/                ){  gl_poed    [$1];                                  continue }; #gl_nsnepoed   [$1];
        if($2~  /^гл_несов_непер_пов_мн$/                ){  gl_ponemn  [$1];                                  continue }; #gl_nsnepomn   [$1];
        if($2~  /^гл_несов_непер_прош_ед/                ){  gl_ed      [$1];                                  continue }; #gl_nsnepred   [$1];
        if($2~  /^гл_несов_непер_прош_мн/                ){  gl_nemn    [$1];                                  continue }; #gl_nsneprmn   [$1];
        if($2~  /^гл_несов_непер_воз_наст_ед/            ){  gl_ed      [$1]; gl_vzed [$1];                    continue }; #gl_nsnevznaed [$1];
        if($2~  /^гл_несов_непер_воз_наст_мн/            ){  gl_vzmn    [$1];                                  continue }; #gl_nsnevznamn [$1];
        if($2~  /^гл_несов_непер_воз_инф$/               ){  gl_in      [$1];                                  continue }; #gl_nsnevzin   [$1];
        if($2~  /^гл_несов_непер_воз_инф_безл$/          ){  gl_in      [$1];                                  continue }; #gl_nsnevzinbe [$1];
        if($2~  /^гл_несов_непер_воз_пов_ед$/            ){  gl_poed    [$1]; gl_vzed [$1];                    continue }; #gl_nsnevzpoed [$1];
        if($2~  /^гл_несов_непер_воз_пов_мн$/            ){  gl_povzmn  [$1];                                  continue }; #gl_nsnevzpomn [$1];
        if($2~  /^гл_несов_непер_воз_прош_ед/            ){  gl_ed      [$1]; gl_vzed [$1];                    continue }; #gl_nsnevzpred [$1];
        if($2~  /^гл_несов_непер_воз_прош_мн/            ){  gl_vzmn    [$1];                                  continue }; #gl_nsnevzprmn [$1];
      };                                                                                                       
      if ($2~ /^гл_несов_перех_/) {                                                              
                                                                                                               
        if($2~  /^гл_несов_перех_наст_ед/                ){  gl_ed      [$1];                                  continue }; #gl_nspenaed   [$1];
        if($2~  /^гл_несов_перех_наст_мн/                ){  gl_pemn    [$1];                                  continue }; #gl_nspenamn   [$1];
        if($2~  /^гл_несов_перех_инф$/                   ){  gl_in      [$1];                                  continue }; #gl_nspein     [$1];
        if($2~  /^гл_несов_перех_инф_безл$/              ){  gl_in      [$1];                                  continue }; #gl_nspeinbe   [$1];
        if($2~  /^гл_несов_перех_пов_ед$/                ){  gl_poed    [$1];                                  continue }; #gl_nspepoed   [$1];
        if($2~  /^гл_несов_перех_пов_мн$/                ){  gl_popemn  [$1];                                  continue }; #gl_nspepomn   [$1];
        if($2~  /^гл_несов_перех_прош_ед/                ){  gl_ed      [$1];                                  continue }; #gl_nspepred   [$1];
        if($2~  /^гл_несов_перех_прош_мн$/               ){  gl_pemn    [$1];                                  continue }; #gl_nspeprmn   [$1];
      };                                                                                                       
      if ($2~ /^гл_несов_перне_/) {                                                              
                                                                                                               
        if($2~  /^гл_несов_перне_наст_ед/                ){  gl_ed      [$1];                                  continue }; #gl_nspnnaed   [$1];
        if($2~  /^гл_несов_перне_наст_мн/                ){  gl_pnmn    [$1];                                  continue }; #gl_nspnnamn   [$1];
        if($2~  /^гл_несов_перне_инф$/                   ){  gl_in      [$1];                                  continue }; #gl_nspnin     [$1];
        if($2~  /^гл_несов_перне_пов_ед$/                ){  gl_poed    [$1];                                  continue }; #gl_nspnpoed   [$1];
        if($2~  /^гл_несов_перне_пов_мн$/                ){  gl_popnmn  [$1];                                  continue }; #gl_nspnpomn   [$1];
        if($2~  /^гл_несов_перне_прош_ед/                ){  gl_ed      [$1];                                  continue }; #gl_nspnpred   [$1];
        if($2~  /^гл_несов_перне_прош_мн$/               ){  gl_pnmn    [$1];                                  continue }; #gl_nspnprmn   [$1];
      };                                                                                                       
      if ($2~ /^гл_2вид_непер_/) {                                                               
                                                                                                               
        if($2~  /^гл_2вид_непер_буд_ед/                  ){  gl_ed      [$1];                                  continue }; #gl_2vnebued   [$1];
        if($2~  /^гл_2вид_непер_буд_мн/                  ){  gl_nemn    [$1];                                  continue }; #gl_2vnebumn   [$1];
        if($2~  /^гл_2вид_непер_наст_ед/                 ){  gl_ed      [$1];                                  continue }; #gl_2vnenaed   [$1];
        if($2~  /^гл_2вид_непер_наст_мн/                 ){  gl_nemn    [$1];                                  continue }; #gl_2vnenamn   [$1];
        if($2~  /^гл_2вид_непер_инф$/                    ){  gl_in      [$1];                                  continue }; #gl_2vnein     [$1];
        if($2~  /^гл_2вид_непер_инф_безл$/               ){  gl_in      [$1];                                  continue }; #gl_2vneinbe   [$1];
        if($2~  /^гл_2вид_непер_пов_ед$/                 ){  gl_poed    [$1];                                  continue }; #gl_2vnepoed   [$1];
        if($2~  /^гл_2вид_непер_пов_мн$/                 ){  gl_ponemn  [$1];                                  continue }; #gl_2vnepomn   [$1];
        if($2~  /^гл_2вид_непер_прош_ед/                 ){  gl_ed      [$1];                                  continue }; #gl_2vnepred   [$1];
        if($2~  /^гл_2вид_непер_прош_мн/                 ){  gl_nemn    [$1];                                  continue }; #gl_2vneprmn   [$1];
        if($2~  /^гл_2вид_непер_воз_буд_ед/              ){  gl_ed      [$1]; gl_vzed [$1];                    continue }; #gl_2vnevznaed [$1];
        if($2~  /^гл_2вид_непер_воз_буд_мн/              ){  gl_vzmn    [$1];                                  continue }; #gl_2vnevznamn [$1];
        if($2~  /^гл_2вид_непер_воз_наст_ед/             ){  gl_ed      [$1]; gl_vzed [$1];                    continue }; #gl_2vnevznaed [$1];
        if($2~  /^гл_2вид_непер_воз_наст_мн/             ){  gl_vzmn    [$1];                                  continue }; #gl_2vnevznamn [$1];
        if($2~  /^гл_2вид_непер_воз_инф$/                ){  gl_in      [$1];                                  continue }; #gl_2vnevzin   [$1];
        if($2~  /^гл_2вид_непер_воз_пов_ед$/             ){  gl_poed    [$1]; gl_vzed [$1];                    continue }; #gl_2vnevzpoed [$1];
        if($2~  /^гл_2вид_непер_воз_пов_мн$/             ){  gl_povzmn  [$1]; gl_vzmn [$1];                    continue }; #gl_2vnevzpomn [$1];
        if($2~  /^гл_2вид_непер_воз_прош_ед/             ){  gl_ed      [$1]; gl_vzed [$1];                    continue }; #gl_2vnevzpred [$1];
        if($2~  /^гл_2вид_непер_воз_прош_мн/             ){  gl_vzmn    [$1];                                  continue }; #gl_2vnevzprmn [$1];
      };                                                                                                       
      if ($2~ /^гл_2вид_перех_/) {                                                               
                                                                                                               
        if($2~  /^гл_2вид_перех_буд_ед/                  ){  gl_ed      [$1];                                  continue }; #gl_2vpebued   [$1];
        if($2~  /^гл_2вид_перех_буд_мн/                  ){  gl_pemn    [$1];                                  continue }; #gl_2vpebumn   [$1];
        if($2~  /^гл_2вид_перех_наст_ед/                 ){  gl_ed      [$1];                                  continue }; #gl_2vpenaed   [$1];
        if($2~  /^гл_2вид_перех_наст_мн/                 ){  gl_pemn    [$1];                                  continue }; #gl_2vpenamn   [$1];
        if($2~  /^гл_2вид_перех_инф$/                    ){  gl_in      [$1];                                  continue }; #gl_2vpein     [$1];
        if($2~  /^гл_2вид_перех_пов_ед$/                 ){  gl_poed    [$1];                                  continue }; #gl_2vpepoed   [$1];
        if($2~  /^гл_2вид_перех_пов_мн$/                 ){  gl_popemn  [$1];                                  continue }; #gl_2vpepomn   [$1];
        if($2~  /^гл_2вид_перех_прош_ед/                 ){  gl_ed      [$1];                                  continue }; #gl_2vpepred   [$1];
        if($2~  /^гл_2вид_перех_прош_мн$/                ){  gl_pemn    [$1];                                  continue }; #gl_2vpeprmn   [$1];
      };                                                                                                       
      if ($2~ /^гл_2вид_перне_/) {                                                               
                                                                                                               
        if($2~  /^гл_2вид_перне_буд_ед/                  ){  gl_ed      [$1];                                  continue }; #gl_2vpnbued   [$1];
        if($2~  /^гл_2вид_перне_буд_мн/                  ){  gl_pnmn    [$1];                                  continue }; #gl_2vpnbumn   [$1];
        if($2~  /^гл_2вид_перне_наст_ед/                 ){  gl_ed      [$1];                                  continue }; #gl_2vpnnaed   [$1];
        if($2~  /^гл_2вид_перне_наст_мн/                 ){  gl_pnmn    [$1];                                  continue }; #gl_2vpnnamn   [$1];
        if($2~  /^гл_2вид_перне_инф$/                    ){  gl_in      [$1];                                  continue }; #gl_2vpnin     [$1];
        if($2~  /^гл_2вид_перне_пов_ед$/                 ){  gl_poed    [$1];                                  continue }; #gl_2vpnpoed   [$1];
        if($2~  /^гл_2вид_перне_пов_мн$/                 ){  gl_popnmn  [$1];                                  continue }; #gl_2vpnpomn   [$1];
        if($2~  /^гл_2вид_перне_прош_ед/                 ){  gl_ed      [$1];                                  continue }; #gl_2vpnpred   [$1];
        if($2~  /^гл_2вид_перне_прош_мн$/                ){  gl_pnmn    [$1];                                  continue }; #gl_2vpnprmn   [$1];
      };                                                                                                       
   }; # конец блока глаголов                                                                                   
                                                                                                               
    if (($2~ /^сущ_/)) {                                                                          
                                                                                                               
        if($2~  /^сущ_одуш_ед/                           ){  suw_oded   [$1];                                           };
        if($2~  /^сущ_неод_ед/                           ){  suw_noed   [$1];                                           };
        if($2~  /^сущ_одуш_мн/                           ){  suw_odmn   [$1];                                           };
        if($2~  /^сущ_неод_мн/                           ){  suw_nomn   [$1];                                           };

        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /муж_им/  ){  suw_edmuim [$1]; suw_edim [$1];                   continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /жен_им/  ){  suw_edzeim [$1]; suw_edim [$1];                   continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /ср_им/   ){  suw_edsrim [$1]; suw_edim [$1];                   continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /муж_вин/ ){  suw_edmuvi [$1]; suw_edvi [$1];                   continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /жен_вин/ ){  suw_edzevi [$1]; suw_edvi [$1];                   continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /ср_вин/  ){  suw_edsrvi [$1]; suw_edvi [$1];                   continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /_дат/    ){  suw_edda   [$1];                                  continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /_род/    ){  suw_edro   [$1];                                  continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /_пр/     ){  suw_edpr   [$1];                                  continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /_тв/     ){  suw_edtv   [$1];                                  continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /_зват/   ){  suw_edzv   [$1];                                  continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /_мест/   ){  suw_edme   [$1];                                  continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /_нескл/  ){  suw_edne   [$1];                                  continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /_счет/   ){  suw_edsq   [$1];                                  continue };

        if($2~  /^сущ(_одуш)?_мн_им$/                    ){  suw_odmnim [$1];                                  continue };
        if($2~  /^сущ(_неод)?_мн_им$/                    ){  suw_nomniv [$1];                                  continue };
        if($2~  /^сущ(_неод)?_мн_вин$/                   ){  suw_nomniv [$1];                                  continue };
        if($2~  /^сущ(_одуш)?_мн_вин$/                   ){  suw_odmnvr [$1];                                  continue };
        if($2~  /^сущ(_одуш)?_мн_род$/                   ){  suw_odmnvr [$1];                                  continue };
        if($2~  /^сущ(_неод)?_мн/       && $2~ /_род/    ){  suw_mnro   [$1];                                  continue };
        if($2~  /^сущ(_одуш|_неод)?_мн/ && $2~ /_дат/    ){  suw_mnda   [$1];                                  continue };
        if($2~  /^сущ(_одуш|_неод)?_мн/ && $2~ /_пр/     ){  suw_mnpr   [$1];                                  continue };
        if($2~  /^сущ(_одуш|_неод)?_мн/ && $2~ /_тв/     ){  suw_mntv   [$1];                                  continue };
        if($2~  /^сущ(_одуш|_неод)?_мн/ && $2~ /_нескл/  ){  suw_mnne   [$1];                                  continue };
        if($2~  /^сущ(_одуш|_неод)?_мн/ && $2~ /_счет/   ){  suw_mnsq   [$1];                                  continue };
    };                                                                                                         

        if($2~  /^дееп_/                                 ){  deep       [$1];                                  continue };

    if ($2~ /^мест_/) {                                                                           

        if($2~  /_(прл|сущ)_им$/                         ){  mest_im    [$1];                                  continue }; #mest_mi       [$1];
        if($2~  /_(прл|сущ)_вин$/                        ){  mest_vi    [$1]; mest_mnvi [$1];                  continue }; #
        if($2~  /_(прл|сущ)_род$/                        ){  mest_ro    [$1];                                  continue }; #mest_ro       [$1];
        if($2~  /_(прл|сущ)_дат$/                        ){  mest_da    [$1];                                  continue }; #mest_da       [$1];
        if($2~  /_(прл|сущ)_тв$/                         ){  mest_tv    [$1];                                  continue }; #mest_tv       [$1];
        if($2~  /_(прл|сущ)_пр$/                         ){  mest_pr    [$1];                                  continue }; #mest_pr       [$1];
        if($2~  /_(прл|сущ)_мн$/                         ){  mest_mn    [$1];                                  continue }; #mest_mn       [$1];

        if($2~  /_прл_ед_ср$/                            ){  mest_ed    [$1];                                  continue }; #mest_sred     [$1];
        if($2~  /_прл_ед_жен$/                           ){  mest_ed    [$1];                                  continue }; #mest_zeed     [$1];
        if($2~  /_прл_ед_муж$/                           ){  mest_ed    [$1];                                  continue }; #mest_mued     [$1];

        if($2~  /_ед_муж_им$/                            ){  mest_im    [$1]; mest_ed [$1]; mest_edmu [$1];    continue }; #mest_edmuim   [$1];
        if($2~  /_ед_муж_вин$/                           ){  mest_vi    [$1]; mest_ed [$1]; mest_edmu [$1];    continue }; #mest_edmuvi   [$1];
        if($2~  /_ед_муж_вин_неод$/                      ){  mest_vi    [$1]; mest_ed [$1]; mest_edmu [$1];    continue }; #mest_ednomuvi [$1];
        if($2~  /_ед_муж_вин_одуш$/                      ){  mest_vi    [$1]; mest_ed [$1]; mest_edmu [$1];    continue }; #mest_edodmuvi [$1];
        if($2~  /_ед_муж_род$/                           ){  mest_ro    [$1]; mest_ed [$1]; mest_edmu [$1];    continue }; #mest_edmuro   [$1];
        if($2~  /_ед_муж_дат$/                           ){  mest_da    [$1]; mest_ed [$1]; mest_edmu [$1];    continue }; #mest_edmuda   [$1];
        if($2~  /_ед_муж_тв$/                            ){  mest_tv    [$1]; mest_ed [$1]; mest_edmu [$1];    continue }; #mest_edmutv   [$1];
        if($2~  /_ед_муж_пр$/                            ){  mest_pr    [$1]; mest_ed [$1]; mest_edmu [$1];    continue }; #mest_edmupr   [$1];
        if($2~  /_ед_жен_им$/                            ){  mest_im    [$1]; mest_ed [$1]; mest_edze [$1];    continue }; #mest_edzeim   [$1];
        if($2~  /_ед_жен_вин$/                           ){  mest_vi    [$1]; mest_ed [$1]; mest_edze [$1];    continue }; #mest_edzevi   [$1];
        if($2~  /_ед_жен_род$/                           ){  mest_ro    [$1]; mest_ed [$1]; mest_edze [$1];    continue }; #mest_edzero   [$1];
        if($2~  /_ед_жен_дат$/                           ){  mest_da    [$1]; mest_ed [$1]; mest_edze [$1];    continue }; #mest_edzeda   [$1];
        if($2~  /_ед_жен_тв$/                            ){  mest_tv    [$1]; mest_ed [$1]; mest_edze [$1];    continue }; #mest_edzetv   [$1];
        if($2~  /_ед_жен_пр$/                            ){  mest_pr    [$1]; mest_ed [$1]; mest_edze [$1];    continue }; #mest_edzepr   [$1];
        if($2~  /_ед_ср_им$/                             ){  mest_im    [$1]; mest_ed [$1]; mest_edsr [$1];    continue }; #mest_edsrim   [$1];
        if($2~  /_ед_ср_вин$/                            ){  mest_vi    [$1]; mest_ed [$1]; mest_edsr [$1];    continue }; #mest_edsrvi   [$1];
        if($2~  /_ед_ср_род$/                            ){  mest_ro    [$1]; mest_ed [$1]; mest_edsr [$1];    continue }; #mest_edsrro   [$1];
        if($2~  /_ед_ср_дат$/                            ){  mest_da    [$1]; mest_ed [$1]; mest_edsr [$1];    continue }; #mest_edsrda   [$1];
        if($2~  /_ед_ср_тв$/                             ){  mest_tv    [$1]; mest_ed [$1]; mest_edsr [$1];    continue }; #mest_edsrtv   [$1];
        if($2~  /_ед_ср_пр$/                             ){  mest_pr    [$1]; mest_ed [$1]; mest_edsr [$1];    continue }; #mest_edsrpr   [$1];

        if($2~  /_ед_им$/                                ){  mest_im    [$1]; mest_ed [$1];                    continue }; #mest_edim     [$1];
        if($2~  /_ед_вин$/                               ){  mest_vi    [$1]; mest_ed [$1];                    continue }; #mest_edvi     [$1];
        if($2~  /_ед_род$/                               ){  mest_ro    [$1]; mest_ed [$1];                    continue }; #mest_edro     [$1];
        if($2~  /_ед_дат$/                               ){  mest_da    [$1]; mest_ed [$1];                    continue }; #mest_edda     [$1];
        if($2~  /_ед_тв$/                                ){  mest_tv    [$1]; mest_ed [$1];                    continue }; #mest_edtv     [$1];
        if($2~  /_ед_пр$/                                ){  mest_pr    [$1]; mest_ed [$1];                    continue }; #mest_edpr     [$1];

        if($2~  /_мн_им$/                                ){  mest_im    [$1]; mest_mn [$1]; mest_mnim [$1];    continue }; #
        if($2~  /_мн_вин$/                               ){  mest_vi    [$1]; mest_mn [$1]; mest_mnvi [$1];    continue }; #
        if($2~  /_мн_вин_неод$/                          ){  mest_vi    [$1]; mest_mn [$1];                    continue }; #mest_mn_novi  [$1];
        if($2~  /_мн_вин_одуш$/                          ){  mest_vi    [$1]; mest_mn [$1];                    continue }; #mest_mn_odvi  [$1];
        if($2~  /_мн_род$/                               ){  mest_ro    [$1]; mest_mn [$1];                    continue }; #mest_mn_ro    [$1];
        if($2~  /_мн_дат$/                               ){  mest_da    [$1]; mest_mn [$1];                    continue }; #mest_mn_da    [$1];
        if($2~  /_мн_тв$/                                ){  mest_tv    [$1]; mest_mn [$1];                    continue }; #mest_mn_tv    [$1];
        if($2~  /_мн_пр$/                                ){  mest_pr    [$1]; mest_mn [$1];                    continue }; #mest_mn_pr    [$1];
        if($2~  /_сущ$/                                  ){  mest_suw   [$1];                                  continue };
    };                                                                                                        
    if ($2~ /^нар_/) {

        if($2~  /^нар_вопр$/                             ){  nar_vopr   [$1];                                  continue };
        if($2~  /^нар_обст_врем$/                        ){  nar_obvr   [$1];                                  continue };
        if($2~  /^нар_обст_места$/                       ){  nar_obme   [$1];                                  continue };
        if($2~  /^нар_обст_напр$/                        ){  nar_obna   [$1];                                  continue };
        if($2~  /^нар_обст_причин$/                      ){  nar_obpr   [$1];                                  continue };
        if($2~  /^нар_обст_цель$/                        ){  nar_obce   [$1];                                  continue };
        if($2~  /^нар_опред_кач$/                        ){  nar_opka   [$1];                                  continue };
        if($2~  /^нар_опред_спос$/                       ){  nar_opsp   [$1];                                  continue };
        if($2~  /^нар_опред_степ$/                       ){  nar_opst   [$1];                                  continue };
        if($2~  /^нар_прев$/                             ){  nar_prev   [$1];                                  continue };
        if($2~  /^нар_мест$/                             ){  nar_mest   [$1];                                  continue };
        if($2~  /^нар_сравн$/                            ){  nar_srav   [$1];                                  continue };
    };                                                                                                        
    if ($2~ /^предл_/) {                                                                         

        if($2~  /^предл_вин$/                            ){  pre_vi     [$1];                                  continue };
        if($2~  /^предл_дат$/                            ){  pre_da     [$1];                                  continue };
        if($2~  /^предл_им$/                             ){  pre_im     [$1];                                  continue };
        if($2~  /^предл_пр$/                             ){  pre_pr     [$1];                                  continue };
        if($2~  /^предл_род$/                            ){  pre_ro     [$1];                                  continue };
        if($2~  /^предл_тв$/                             ){  pre_tv     [$1];                                  continue };
    };                                                                                                        
    if ($2~ /^прл_/) {                                                                           
       if($2~ /^прл_ед/) {                                                                       
        if($2~  /^прл_ед_муж_им$/                        ){  prl_ediv   [$1];                                  continue }; #prl_edmuim        [$1];
        if($2~  /^прл_ед_жен_им$/                        ){  prl_ediv   [$1];                                  continue }; #prl_edzeim        [$1];
        if($2~  /^прл_ед_ср_им$/                         ){  prl_ediv   [$1]; prl_edsrim [$1];                 continue }; #
        if($2~  /^прл_ед_муж_вин_одуш$/                  ){  prl_edvr   [$1];                                  continue }; #prl_odedmuvi      [$1];
        if($2~  /^прл_ед_муж_вин_неод$/                  ){  prl_ediv   [$1];                                  continue }; #prl_noedmuvi      [$1];
        if($2~  /^прл_ед_жен_вин$/                       ){  prl_ediv   [$1];                                  continue }; #prl_edzevi        [$1];
        if($2~  /^прл_ед_ср_вин$/                        ){  prl_ediv   [$1]; prl_edsrvi [$1];                 continue }; #
        if($2~  /^прл_ед_муж_род$/                       ){  prl_edro   [$1]; prl_edvr   [$1];                 continue }; #prl_edmuro        [$1];
        if($2~  /^прл_ед_жен_род$/                       ){  prl_edro   [$1];                                  continue }; #prl_edzero        [$1];
        if($2~  /^прл_ед_ср_род$/                        ){  prl_edro   [$1];                                  continue }; #prl_edsrro        [$1];
        if($2~  /^прл_ед_муж_дат$/                       ){  prl_edda   [$1]; prl_edmsda [$1];                 continue }; #
        if($2~  /^прл_ед_жен_дат$/                       ){  prl_edda   [$1];                                  continue }; #prl_edzeda        [$1];
        if($2~  /^прл_ед_ср_дат$/                        ){  prl_edda   [$1];                                  continue }; #prl_edmsda        [$1];
        if($2~  /^прл_ед_муж_тв$/                        ){  prl_edtv   [$1];                                  continue }; #prl_edmutv        [$1];
        if($2~  /^прл_ед_жен_тв$/                        ){  prl_edtv   [$1];                                  continue }; #prl_edzetv        [$1];
        if($2~  /^прл_ед_ср_тв$/                         ){  prl_edtv   [$1];                                  continue }; #prl_edsrtv        [$1];
        if($2~  /^прл_ед_жен_пр$/                        ){  prl_edpr   [$1];                                  continue }; #prl_edzepr        [$1];
        if($2~  /^прл_ед_муж_пр$/                        ){  prl_edpr   [$1];                                  continue }; #prl_edmupr        [$1];
        if($2~  /^прл_ед_ср_пр$/                         ){  prl_edpr   [$1];                                  continue }; #prl_edsrpr        [$1];
       };
       if($2~ /^прл_крат/) {
        if($2~  /^прл_крат_ед_муж$/                      ){  prl_kred   [$1]; prl_kred_mu [$1];                continue };
        if($2~  /^прл_крат_ед_жен$/                      ){  prl_kred   [$1]; prl_kred_ze [$1];                continue };
        if($2~  /^прл_крат_ед_ср$/                       ){  prl_kred   [$1]; prl_kred_sr [$1];                continue };
        if($2~  /^прл_крат_мн$/                          ){  prl_krmn   [$1];                                  continue };
       };                                                                                                      
       if($2~ /^прл_мн/) {                                                                        
        if($2~  /^прл_мн_им$/                            ){  prl_mniv   [$1];                                  continue }; #prl_mnim          [$1];
        if($2~  /^прл_мн_вин_одуш$/                      ){  prl_mnvr   [$1];                                  continue }; #prl_mnodvi        [$1];
        if($2~  /^прл_мн_вин_неод$/                      ){  prl_mniv   [$1];                                  continue }; #prl_mnnovi        [$1];
        if($2~  /^прл_мн_род$/                           ){  prl_mnvr   [$1];                                  continue }; #prl_mnro   [$1];
        if($2~  /^прл_мн_дат$/                           ){  prl_mnda   [$1];                                  continue }; #
        if($2~  /^прл_мн_тв$/                            ){  prl_mntv   [$1];                                  continue }; #
        if($2~  /^прл_мн_пр$/                            ){  prl_mnvr   [$1];                                  continue }; #
       };                                                                                                      
       if($2~ /^прл_прев_ед/) {                                                                  
        if($2~  /^прл_прев_ед_муж_им$/                   ){  prl_ediv   [$1];                                  continue }; #prl_prev_ed_muim   [$1];
        if($2~  /^прл_прев_ед_жен_им$/                   ){  prl_ediv   [$1];                                  continue }; #prl_prev_ed_zeim   [$1];
        if($2~  /^прл_прев_ед_ср_вин$/                   ){  prl_ediv   [$1];                                  continue }; #prl_prev_ed_srvi   [$1];
        if($2~  /^прл_прев_ед_муж_вин_одуш$/             ){  prl_edvr   [$1];                                  continue }; #prl_prev_ed_muodvi [$1];
        if($2~  /^прл_прев_ед_муж_вин_неод$/             ){  prl_ediv   [$1];                                  continue }; #prl_prev_ed_munovi [$1];
        if($2~  /^прл_прев_ед_жен_вин$/                  ){  prl_ediv   [$1];                                  continue }; #prl_prev_ed_zevi   [$1];
        if($2~  /^прл_прев_ед_ср_им$/                    ){  prl_ediv   [$1];                                  continue }; #prl_prev_ed_srim   [$1];
        if($2~  /^прл_прев_ед_муж_род$/                  ){  prl_edro   [$1]; prl_edvr   [$1];                 continue }; #prl_prev_ed_muro   [$1];
        if($2~  /^прл_прев_ед_жен_род$/                  ){  prl_edro   [$1];                                  continue }; #prl_prev_ed_zero   [$1];
        if($2~  /^прл_прев_ед_ср_род$/                   ){  prl_edro   [$1];                                  continue }; #prl_prev_ed_srro   [$1];
        if($2~  /^прл_прев_ед_муж_дат$/                  ){  prl_edda   [$1];                                  continue }; #prl_prev_ed_muda   [$1];
        if($2~  /^прл_прев_ед_жен_дат$/                  ){  prl_edda   [$1];                                  continue }; #prl_prev_ed_zeda   [$1];
        if($2~  /^прл_прев_ед_ср_дат$/                   ){  prl_edda   [$1];                                  continue }; #prl_prev_ed_srda   [$1];
        if($2~  /^прл_прев_ед_муж_тв$/                   ){  prl_edtv   [$1]; prl_pvedtv [$1];                 continue }; #prl_prev_ed_mutv   [$1];
        if($2~  /^прл_прев_ед_жен_тв$/                   ){  prl_edtv   [$1]; prl_pvedtv [$1];                 continue }; #prl_prev_ed_zetv   [$1];
        if($2~  /^прл_прев_ед_ср_тв$/                    ){  prl_edtv   [$1]; prl_pvedtv [$1];                 continue }; #prl_prev_ed_srtv   [$1];
        if($2~  /^прл_прев_ед_муж_пр$/                   ){  prl_edpr   [$1];                                  continue }; #prl_prev_ed_mupr   [$1];
        if($2~  /^прл_прев_ед_жен_пр$/                   ){  prl_edpr   [$1];                                  continue }; #prl_prev_ed_zepr   [$1];
        if($2~  /^прл_прев_ед_ср_пр$/                    ){  prl_edpr   [$1];                                  continue }; #prl_prev_ed_srpr   [$1];
       };                                                                                                      
       if($2~ /^прл_прев_мн/) {                                                                  
        if($2~  /^прл_прев_мн_им$/                       ){  prl_mniv   [$1];                                  continue }; #prl_prev_mn_im     [$1];
        if($2~  /^прл_прев_мн_вин_одуш$/                 ){  prl_mnvr   [$1];                                  continue }; #prl_prev_mn_odvi   [$1];
        if($2~  /^прл_прев_мн_вин_неод$/                 ){  prl_mniv   [$1];                                  continue }; #prl_prev_mn_novi   [$1];
        if($2~  /^прл_прев_мн_дат$/                      ){  prl_mnda   [$1];                                  continue }; #prl_prev_mn_da     [$1];
        if($2~  /^прл_прев_мн_род$/                      ){  prl_mnvr   [$1];                                  continue }; #prl_prev_mn_ro     [$1];
        if($2~  /^прл_прев_мн_тв$/                       ){  prl_mntv   [$1]; prl_pvmntv [$1];                 continue }; #prl_prev_mn_tv     [$1];
        if($2~  /^прл_прев_мн_пр$/                       ){  prl_mnvr   [$1];                                  continue }; #prl_prev_mn_pr     [$1];
       };                                                                                                      
        if($2~  /^прл_неизм$/                            ){  prl_neiz   [$1];                                  continue };
        if($2~  /^прл_сравн$/                            ){  prl_srav   [$1];                                  continue };
    };                                                                                                         
    if ($2~ /^прч_/) {                                                                            
                                                                                                               
        if($2~  /_ед_муж$/ && $2~ /_крат_/               ){  prq_kred   [$1]; prq_kred_mu [$1];                continue }; #
        if($2~  /_ед_жен$/ && $2~ /_крат_/               ){  prq_kred   [$1]; prq_kred_ze [$1];                continue }; #
        if($2~  /_ед_ср$/  && $2~ /_крат_/               ){  prq_kred   [$1]; prq_kred_sr [$1];                continue }; #
        if($2~  /_мн$/     && $2~ /_крат_/               ){  prq_krmn   [$1];                                  continue }; #prq_mniv [$1];
                                                                                                               
        if($2~  /_ед_муж_им$/                            ){  prq_ediv   [$1];                                  continue }; #prq_ed_muim   [$1];
        if($2~  /_ед_жен_им$/                            ){  prq_ediv   [$1];                                  continue }; #prq_ed_zeim   [$1];
        if($2~  /_ед_ср_им$/                             ){  prq_ediv   [$1];  prq_edsrim [$1];                continue }; #
        if($2~  /_ед_муж_вин_одуш$/                      ){                    prq_edvr   [$1];                continue }; #prq_ed_odmuvi [$1];
        if($2~  /_ед_муж_вин_неод$/                      ){  prq_ediv   [$1];                                  continue }; #prq_ed_nomuvi [$1];
        if($2~  /_ед_жен_вин$/                           ){  prq_ediv   [$1];                                  continue }; #prq_ed_zevi   [$1];
        if($2~  /_ед_ср_вин$/                            ){  prq_ediv   [$1];                                  continue }; #prq_ed_srvi   [$1];
        if($2~  /_ед_муж_род$/                           ){  prq_edro   [$1];  prq_edvr   [$1];                continue }; #prq_ed_muro   [$1];
        if($2~  /_ед_жен_род$/                           ){  prq_edro   [$1];                                  continue }; #prq_ed_zero   [$1];
        if($2~  /_ед_ср_род$/                            ){  prq_edro   [$1];  prq_edro_sr[$1];                continue }; #
        if($2~  /_ед_муж_дат$/                           ){  prq_edda   [$1];                                  continue }; #prq_ed_muda   [$1];
        if($2~  /_ед_жен_дат$/                           ){  prq_edda   [$1];                                  continue }; #prq_ed_zeda   [$1];
        if($2~  /_ед_ср_дат$/                            ){  prq_edda   [$1];                                  continue }; #prq_ed_srda   [$1];
        if($2~  /_ед_муж_тв$/                            ){  prq_edtv   [$1];                                  continue }; #prq_ed_mutv   [$1];
        if($2~  /_ед_жен_тв$/                            ){  prq_edtv   [$1];                                  continue }; #prq_ed_zetv   [$1];
        if($2~  /_ед_ср_тв$/                             ){  prq_edtv   [$1];                                  continue }; #prq_ed_srtv   [$1];
        if($2~  /_ед_муж_пр$/                            ){  prq_edpr   [$1];                                  continue }; #prq_ed_mupr   [$1];
        if($2~  /_ед_жен_пр$/                            ){  prq_edpr   [$1];                                  continue }; #prq_ed_zepr   [$1];
        if($2~  /_ед_ср_пр$/                             ){  prq_edpr   [$1];                                  continue }; #prq_ed_srpr   [$1];
                                                                                                               
        if($2~  /_мн_им$/                                ){  prq_mniv   [$1];                                  continue }; #prq_mn_im     [$1];
        if($2~  /_мн_вин_одуш$/                          ){  prq_mnvr   [$1];                                  continue }; #prq_mn_vi     [$1];
        if($2~  /_мн_вин_неод$/                          ){  prq_mniv   [$1];                                  continue }; #prq_mn_vi     [$1];
        if($2~  /_мн_род$/                               ){  prq_mnvr   [$1];                                  continue }; #prq_mn_ro     [$1];
        if($2~  /_мн_дат$/                               ){  prq_mnda   [$1];                                  continue }; #prq_mn_da     [$1];
        if($2~  /_мн_тв$/                                ){  prq_mvtv   [$1];                                  continue }; #prq_mn_tv     [$1];
        if($2~  /_мн_пр$/                                ){  prq_mnvr   [$1];                                  continue }; #prq_mn_pr     [$1];
    };                                                                                                         
                                                                                                               
        if($2~   /^ввод$/                                ){  vvod       [$1];                                  continue };
        if($2~   /^предик$/                              ){  predik     [$1];                                  continue };
        if($2~   /^союз$/                                ){  souz       [$1];                                  continue };
        if($2~   /^част$/                                ){  qast       [$1];                                  continue };
        if($2~   /^числ_/ && $2~ /род$/                  ){  qisl_ro    [$1];                                  continue };
        if($2~   /^числ_(кол|поряд)_ед/                  ){  qisl_ed    [$1];                                  continue };
        if($2~   /^числ_(кол|поряд|собир)/               ){  qisl       [$1];                                  continue };

    } close(cmd);

 # Коррекции - удаление омографов delarr
    delete gl_nemn ["есть"]; delete gl_ed ["есть"]; delete qast ["есть"];
    delete gl_ed ["времени"]
    delete gl_ed ["дела"]
    delete gl_ed ["почти"]
    delete gl_ed ["пять"]
    delete gl_ed ["пришли"]
    delete gl_ed ["тускло"]; delete gl_edsr ["тускло"]
    delete gl_edsr ["дело"]
    delete deep ["для"]
    delete deep ["хотя"]
    delete gl_ed ["три"]; #delete gl_nspepoed["три"];
    delete suw_noed ["надо"]
    delete suw_nomniv ["были"]
    delete suw_mntv ["им"]
    delete suw_edim ["его"]; delete suw_odmnim ["его"]; delete suw_nomniv ["его"]
    delete suw_edvi ["сто"]; delete suw_edim ["сто"]; delete suw_edsrvi ["сто"]; delete suw_edsrim ["сто"];

#print (length(gl_dvimn))


 }  {
 nf=patsplit($0, l, patword, sep)
 # соединяем некоторые слова с дефисом в одно
 for (i=1; i<=nf-1; i++) { if ( se(0,"-") && q(0,hyp1) && (q(1,hyp2)||lc(1)~/[сц]ки$/||q(1,prl_edmsda)||q(1,mest_da)) )
	 { l[i] = l[i] sep[i] l[i+1]; delete sep[i]; delete l[i+1]; nf=ar(i+1, l); ar(i, sep) };};

 ### все !_#_!
 word["все"];
 for (i=1; i<=nf; i++) { if ( lc(0) in word ) wpos[i]; }; i="";
 for (i in wpos) { i=strtonum(i);

 #v всё-таки
 if ( se(0,"-") && w(1,"таки") && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[1]++; print "R1"}; continue;};

 #v всё же
 if ( s(0,0) && (w(1,"же ж равно")) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[2]++; print "R2"}; continue;};

 # География
 if ( (q(1,geo_edsrim)||l[i+1]~/([ео]во|[иы]но)$/) && s(0,0) && cap(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[3]++; print "R3"}; continue;};
 if ( q(1,geo_mnim) && s(0,0) && cap(1) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[4]++; print "R4"}; continue;};


 #v всё в (порядке)
 if ( w(1,"ли уже") &&
       q(2,nar_obme) &&
        w(3,"в") &&
         w(4,"порядке норме ажуре шоколаде") && s(0,3) && (p(4)||w(5,"и с")||q(4,gl_edsr)) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[5]++; print "R5"}; continue;};
 if ( (phf(1,"как будто")||phf(1,"вроде бы")) &&
        w(hfn,"в") &&
         w(hfn+1,"порядке норме ажуре шоколаде") && s(0,hfn) && (p(hfn+1)||w(hfn+2,"и с")||q(hfn+1,gl_edsr)) )
 { sub(/[ее]/, "ё", l[i]); if(dbg){r[6]++; print "R6"}; continue;};
 if ( (q(1,qast)||q(1,nar_obme)) &&
        w(2,"в") &&
         w(3,"порядке норме ажуре шоколаде") && s(0,2) && (p(3)||w(4,"и с")||q(3,gl_edsr)) )
 { sub(/[ее]/, "ё", l[i]); if(dbg){r[7]++; print "R7"}; continue;};
 if ( w(1,"в") &&
      (q(2,prl_edpr)||q(2,prl_edpr)) &&
        w(3,"порядке порядок норме норму ажуре шоколаде") && s(0,2) && (p(3)||w(4,"и с")||q(3,gl_edsr)) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[8]++; print "R8"}; continue;};
 if ( w(1,"в") &&
       w(2,"порядке порядок норме норму ажуре шоколаде целом") && s(0,1) && (p(2)||w(3,"и с")||q(3,gl_edsr)) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[9]++; print "R9"}; continue;};
 if ( q(1,qast) &&
       w(2,"на") &&
        w(3,"мази") && s(0,2) && (p(3)||w(4,"и")) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[10]++; print "R10"}; continue;};
 if ( w(1,"на") &&
       w(2,"мази") && s(0,1) && (p(2)||w(3,"и")) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[11]++; print "R11"}; continue;};

 #v всё ещё
 if ( w(1,"ещё еще") && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[12]++; print "R12"}; continue;};

 #v всё ещё
 if ( w(1,"и") &&
       w(2,"вся") && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[13]++; print "R13"}; continue;};
 if ( w(1,"и") &&
       w(2,"всяческие") && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[14]++; print "R14"}; continue;};

 #v всё так и
 if ( phf(1,"так и") &&
      (q(3,gl_edsr)||w(3,"есть")) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[15]++; print "R15"}; continue;};
 if ( phf(1,"так и") &&
      (q(3,gl_nemn)||q(3,gl_pemn)||q(3,gl_pnmn)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[16]++; print "R16"}; continue;};
 if ( phs(-1,"и так") && Q(-3,mest_mn) &&
      (q(1,gl_nemn)||q(1,gl_pemn)||q(1,gl_pnmn)) && s(-2,0) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[17]++; print "R17"}; continue;};
 if ( phf(1,"и так") &&
      (q(3,gl_ed)||w(3,"есть")) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[18]++; print "R18"}; continue;};


 # фразы
 
 if ( phf(1,"бы ничего") && sc(2,",") && s(0,1) &&
       w(3,"только но да однако") )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[19]++; print "R19"}; continue;};
 if ( w(-1,"на") && (phf(1,"про все")||phf(1,"про всё")) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[20]++; print "R20"}; continue;};
 if ( (phs(-1,"на всё про")||phs(-1,"на все про")) && s(-3,-1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[21]++; print "R21"}; continue;};
 if ( phf(1,"одно и то же") && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[22]++; print "R22"}; continue;};
 if ( phf(1,"потому что") && s(0,0) && sc(1,",") )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[23]++; print "R23"}; continue;};
 if ( phf(1,"тип топ") && s(0,0) && se(1,"-") )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[24]++; print "R24"}; continue;};
 if ( phs(-1,"ну вот и") && s(-3,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[25]++; print "R25"}; continue;};
 if ( phs(-1,"вот и") && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[26]++; print "R26"}; continue;};
 if ( phf(1,"раз и навсегда") && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[27]++; print "R27"}; continue;};
 if ( phf(1,"точно так") && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[28]++; print "R28"}; continue;};
 if ( phf(1,"или ничего") && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[29]++; print "R29"}; continue;};
 if ( phf(1,"под богом ходим") && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[30]++; print "R30"}; continue;};
 if ( phf(1,"за и против") && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[31]++; print "R31"}; continue;};
 if ( phf(1,"только и") &&
       (q(3,gl_pnmn)||q(3,gl_pemn)||q(3,gl_nemn)) &&
         w(4,"что") && s(0,2) && sc(3,",") )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[32]++; print "R32"}; continue;};
 if ( w(1,"как") &&
       w(2,"один одна") && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[33]++; print "R33"}; continue;};
 if ( phf(1,"это само по себе") && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[34]++; print "R34"}; continue;};
 if ( phf(1,"не так уж") &&
       q(4,prl_kred_sr) && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[35]++; print "R35"}; continue;};
 if ( phf(1,"так уж") &&
       q(hfn,prl_kred_sr) && s(0,hfn-1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[36]++; print "R36"}; continue;};
 if ( phf(1,"не так уж") &&
       w(4,"и") &&
        q(5,prl_kred_sr) && s(0,4) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[37]++; print "R37"}; continue;};
 if ( phf(1,"не так") && p(2) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[38]++; print "R38"}; continue;};
 if ( phf(1,"совсем не так") && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[39]++; print "R39"}; continue;};
 if ( w(-1,"и") && p(0) && pv(0,0,",") && s(-1,-1) && (w(-2,"p")||p(-2)) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[40]++; print "R40"}; continue;};
 if ( phf(1,"в том же") && w(4,"роде духе разрезе виде смысле") && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[41]++; print "R41"}; continue;};
 if ( phf(1,"в таком") && w(3,"роде духе разрезе виде смысле") && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[42]++; print "R42"}; continue;};
 if ( phs(-1,"всё равно") && 
       q(1,gl_pnmn) &&
       (q(2,mest_ed)||q(2,mest_mn)) && s(-1,0) && sc(1,",") )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[43]++; print "R43"}; continue;};


 if ( w(1,"позади понапрасну") && s(0,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[44]++; print "R44"}; continue;};
  if ( wf(5,"до") &&
       w(wfn+1,"одного единого") && s(0,wfn) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[45]++; print "R45"}; continue;};


 # Это

 # все + сущ.мн.
 if ( q(1,mest_it) &&
      (q(2,gl_vzmn)||q(2,gl_nemn)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[46]++; print "R46"}; continue;};
 if ( q(-4,mest_it) &&
       phs(-1,"ещё далеко не") && s(-4,-1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[47]++; print "R47"}; continue;};
 if ( q(-3,mest_it) &&
       phs(-1,"ещё не") && s(-3,-1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[48]++; print "R48"}; continue;};
 if ( q(1,mest_it) &&
       phf(2,"не более чем") && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[49]++; print "R49"}; continue;};
 if ( q(-3,mest_it) &&
       phs(-1,"далеко не") && s(-3,-1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[50]++; print "R50"}; continue;};
 if ( q(1,mest_it) &&
       phf(2,"не в счёт") && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[51]++; print "R51"}; continue;};
 if ( q(1,mest_it) &&
       phf(2,"и в самом деле") &&
        q(6,nar_opst) &&
         q(7,prl_kred_sr) && s(0,6) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[52]++; print "R52"}; continue;};
 if ( q(1,mest_it) &&
       w(2,"никак") &&
        w(3,"не") &&
         q(4,gl_in) && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[53]++; print "R53"}; continue;};
 if ( q(-1,mest_it) &&
      (q(1,suw_odmnim)||q(1,suw_nomniv)) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[54]++; print "R54"}; continue;};
 if ( q(-1,mest_it) &&
      (q(1,suw_odmnim)||q(1,suw_nomniv)) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[55]++; print "R55"}; continue;};
 if ( q(1,mest_it) &&
       q(2,mest_im) &&
        q(3,mest_da) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[56]++; print "R56"}; continue;};
 if ( q(1,mest_it) &&
      (q(2,mest_mn)||q(2,mest_ed)) &&
       (q(3,gl_quv)||q(3,gl_gov)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[57]++; print "R57"}; continue;};
 if ( q(1,mest_it) &&
       q(2,mest_da) &&
       (q(3,nar_obvr)||q(3,nar_opst)) &&
         q(4,prl_kred_sr) && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[58]++; print "R58"}; continue;};
 if ( q(1,mest_it) &&
       q(2,mest_da) &&
       (q(3,nar_obvr)||q(3,nar_opst)) &&
         w(4,"не") &&
          q(5,gl_ed) && s(0,4) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[59]++; print "R59"}; continue;};
 if ( q(-1,mest_da) &&
       q(1,mest_it) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[60]++; print "R60"}; continue;};
 if ( q(-2,nar_vopr) &&
       q(-1,mest_it) && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[61]++; print "R61"}; continue;};
 if ( q(-1,mest_it) &&
       q(1,suw_edim) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[62]++; print "R62"}; continue;};
 if ( (q(-1,pre_vi)||q(-1,pre_ro)||q(-1,pre_da)) &&
       q(1,gl_nemn) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[63]++; print "R63"}; continue;};
 if ( (q(-1,pre_vi)||q(-1,pre_ro)||q(-1,pre_da)) &&
       q(1,mest_it) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[64]++; print "R64"}; continue;};
 if ( q(1,mest_it) &&
       q(2,suw_edim) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[65]++; print "R65"}; continue;};
 if ( q(1,qast) &&
       q(2,mest_it) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[66]++; print "R66"}; continue;};
 if ( q(1,mest_it) &&
       (q(2,suw_odmnim)||q(2,suw_nomniv)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[67]++; print "R67"}; continue;};
 if ( q(1,mest_it) &&
      (q(2,nar_opka)||q(2,nar_opsp)||q(2,mest_ed)) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[68]++; print "R68"}; continue;};
 if ( q(1,mest_it) &&
       q(2,pre_ro) &&
       (q(3,mest_ro)||q(3,suw_edro)||q(3,suw_mnro)||q(3,suw_odmnvr)) && s(0,2) && p(3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[69]++; print "R69"}; continue;};
 if ( q(-1,mest_it) &&
       q(1,pre_ro) &&
       (q(2,mest_ro)||q(2,suw_edro)||q(2,suw_mnro)||q(2,suw_odmnvr)) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[70]++; print "R70"}; continue;};
 if ( q(1,mest_it) &&
       q(2,qast) &&
        q(3,pre_ro) &&
        (q(4,mest_ro)||q(4,suw_edro)||q(4,suw_mnro)||q(4,suw_odmnvr)) && s(0,3) && p(4) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[71]++; print "R71"}; continue;};
 if ( q(-1,mest_it) &&
       q(1,mest_da) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[72]++; print "R72"}; continue;};
 if ( q(1,mest_mn) &&
       q(2,mest_it) &&
       (q(3,gl_pnmn)||q(3,gl_nemn)) && s(0,2) && p(3) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[73]++; print "R73"}; continue;};
 if ( q(-1,mest_it) &&
       q(1,mest_ed) &&
        q(2,gl_ed) && s(-1,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[74]++; print "R74"}; continue;};
 if ( q(-1,mest_it) &&
       q(1,mest_mn) &&
       (q(2,gl_pnmn)||q(2,gl_nemn)) && s(-1,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[75]++; print "R75"}; continue;};
 if ( q(1,mest_it) && !(qf(5,gl_pemn)||qf(5,gl_pnmn)||qf(5,gl_in)) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[76]++; print "R76"}; continue;};

 
 # Все как и
 if ( phs(-1,"как и") && s(-2,0) &&
       q(1,mest_mn) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[77]++; print "R77"}; continue;};
 if ( phs(-2,"как и") && s(-3,-1) &&
       q(-1,mest_mn) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[78]++; print "R78"}; continue;};
 if ( phs(-1,"как и") &&
       (q(1,mest_im)||q(1,prl_mniv)) && s(-2,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[79]++; print "R79"}; continue;};
 if ( phs(-1,"как и") &&
       q(1,pre_ro) &&
        q(2,mest_ro) && s(-2,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[80]++; print "R80"}; continue;};

 # как все
 if ( (q(-2,gl_in)||q(-2,prl_ediv)||q(-2,prl_mniv)||q(-2,prl_edtv)||q(-2,prl_mntv)) &&
        w(-1,"как") && s(-1,-1) && sc(-2,",") && p(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[81]++; print "R81"}; continue;};
 if ( q(-2,gl_in) &&
        w(-1,"как") && s(-2,-1) && p(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[82]++; print "R82"}; continue;};
 if ( w(1,"как") &&
       w(2,"будто") &&
        q(3,gl_edsr) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[83]++; print "R83"}; continue;};

 # все как
 if ( w(1,"как") &&
       w(2,"надо нужно есть было") && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[84]++; print "R84"}; continue;};
 if ( w(1,"как") &&
      (q(2,nar_obme)||q(2,nar_opka)||q(2,nar_obvr)) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[85]++; print "R85"}; continue;};
 if ( q(1,gl_pemn) &&
       w(2,"как") &&
        w(3,"надо нужно есть было дома") && s(0,2) && p(3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[86]++; print "R86"}; continue;};

 # Все то же
 if ( q(1,prl_kred_sr) &&
      (q(2,mest_it)||w(2,"эти те той ту того тех тем")) &&
        w(3,"же ж") && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[87]++; print "R87"}; continue;};
 if ( (q(1,mest_it)||w(1,"эти та те той ту того тех так такой таком такого таким такими")) &&
        w(2,"же ж") && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[88]++; print "R88"}; continue;};
 if ( w(1,"тем им ей") &&
       w(2,"же ж") && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[89]++; print "R89"}; continue;};

 # Все то же
 if ( w(1,"вместе") && se(1," — ") &&
      (q(2,mest_mn)||q(2,mest_ed)||cap(2)) && sc(2,",") &&
       (q(3,mest_mn)||q(3,mest_ed)||cap(3)) && p(3) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[90]++; print "R90"}; continue;};

 #v Все + предлог
 if (!(q(-1,mest_mn)||q(-1,mest_ed)||q(-1,gl_ed)||q(-1,gl_in)||q(-1,gl_vzmn)||q(-1,gl_nemn)||q(-1,gl_pemn)||q(-1,gl_pnmn)||q(-1,gl_poed)||q(-1,gl_ponemn)||q(-1,gl_popemn)||q(-1,gl_popnmn)) &&
        q(1,pre_da) &&
        (q(2,suw_edda)||q(2,suw_mnda)) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[91]++; print "R91"}; continue;};
 if ( q(-1,pre_da) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[92]++; print "R92"}; continue;};
 if ( q(-1,pre_vi) &&
       w(1,"чтобы") && s(-1,-1) && sc(0,",") )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[93]++; print "R93"}; continue;};
 if ( q(1,mest_mnim) && sc(0,",") &&
      (q(2,pre_ro)||q(2,pre_vi)) &&
        w(3,"кого") && s(1,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[94]++; print "R94"}; continue;};
 if ( (q(1,pre_ro)||q(1,pre_vi)) && sc(0,",") &&
       w(2,"кого" ) && s(1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[95]++; print "R95"}; continue;};
 if ( q(1,pre_ro) &&
       q(2,mest_ro) &&
        q(3,prq_ediv) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[96]++; print "R96"}; continue;};
 if ( q(-1,gl_in) &&
       q(1,pre_ro) &&
       (q(2,suw_odmnvr)||q(2,suw_mnro)||cap(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[97]++; print "R97"}; continue;};
 if ( (q(-1,gl_ponemn)||q(-1,gl_popnmn)||q(-1,gl_popemn)) &&
        q(1,pre_da) &&
        (q(2,suw_edda)||q(2,suw_mnda)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[98]++; print "R98"}; continue;};
 if ( q(1,pre_ro) &&
       (q(2,suw_odmnvr)||q(2,suw_mnro)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[99]++; print "R99"}; continue;};
 if ( q(1,pre_ro) && sc(0,",") &&
       (q(2,suw_odmnvr)||q(2,suw_mnro)||cap(2)) && s(1,1) && p(2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[100]++; print "R100"}; continue;};
 if ( (q(-1,pre_ro)||q(-1,pre_tv)) && !(q(-1,pre_im)||q(-1,pre_vi)||q(-1,pre_da)||q(-1,pre_pr)||q(-1,suw_edro)) && s(-1,-1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[101]++; print "R101"}; continue;};
 if ( (q(-1,pre_ro)||q(-1,pre_tv)) && s(-1,-1) && p(0) && pv(0,0,",") )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[102]++; print "R102"}; continue;};
 if ( w(1,"за") &&
       q(2,mest_vi) &&
        w(3,"горой") && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[103]++; print "R103"}; continue;};
 if ( w(-1,"со ко") && s(-1,-1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[104]++; print "R104"}; continue;};
 if ( w(1,"до") &&
       w(2,"конца") && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[105]++; print "R105"}; continue;};
 if ( w(1,"до") &&
       w(2,"единого") && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[106]++; print "R106"}; continue;};
 if ( q(-3,pre_pr) &&
      (q(-2,prl_edpr)||q(-2,prl_mnpr)||q(-2,mest_pr)) &&
       (q(-1,suw_edpr)||q(-1,suw_mnpr)) && s(-3,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[107]++; print "R107"}; continue;};

 # все что
 if ( w(1,"что") &&
       q(2,gl_ed) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[108]++; print "R108"}; continue;};

 # всё, на что
 if ( sc(0,",") &&
       q(1,pre_vi) &&
        w(2,"что") && s(1,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[109]++; print "R109"}; continue;};
 if ( sc(0,",") &&
       q(1,pre_vi) &&
        w(2,"кого") && s(1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[110]++; print "R110"}; continue;};
 if ( q(-1,pre_vi) &&
       q(1,gl_vzmn) &&
       (q(2,mest_im)||q(2,prl_ediv)||q(2,prl_mniv)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[111]++; print "R111"}; continue;};
 if ( sc(0,",") &&
       q(1,pre_da) &&
        w(2,"чему") && s(1,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[112]++; print "R112"}; continue;};
 if ( sc(0,",") &&
       q(1,pre_da) &&
        w(2,"кому") && s(1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[113]++; print "R113"}; continue;};
 if ( sc(0,",") &&
       q(1,pre_pr) &&
        w(2,"чём чем") && s(1,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[114]++; print "R114"}; continue;};
 if ( sc(0,",") &&
       q(1,pre_pr) &&
        w(2,"ком") && s(1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[115]++; print "R115"}; continue;};
 if ( q(1,pre_pr) &&
      (q(2,mest_pr)||q(2,suw_edpr)||q(2,suw_mnpr)) &&
        q(3,gl_edsr) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[116]++; print "R116"}; continue;};
 if ( q(-1,pre_pr) &&
       q(1,nar_obme) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[117]++; print "R117"}; continue;};
 if ( q(-2,pre_pr) &&
      (q(-1,mest_pr)||q(2,suw_edtv)||q(2,suw_mntv)) && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[118]++; print "R118"}; continue;};

 # всё так же
 if ( phf(1,"так же") &&
       (q(3,prl_kred)||q(3,gl_ed)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[119]++; print "R119"}; continue;};

 # предикат
 if ( q(1,predik) && sc(0,",") && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[120]++; print "R120"}; continue;};
 if ( q(1,predik) && sc(0,",") && s(1,1) &&
       q(2,gl_in) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[121]++; print "R121"}; continue;};
 if ( q(1,predik) &&
       w(2,"и") &&
        q(3,predik) && s(0,2) && qq(1,3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[122]++; print "R122"}; continue;};

 # обращение
 if ( cap(1) && sc(0,",") && sc(1,",") &&
       q(2,nar_opst) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[123]++; print "R123"}; continue;};

 # модальное
 if ( q(-2,mest_mn) &&
       q(-1,md_mn) &&
        q(1,gl_in) && s(-2,0) )
 { sub(/([Ее])/, "ё", l[i]); if(dbg){r[124]++; print "R124"}; continue;};
 if ( q(-2,md_ed) &&
       q(-1,pre_vi) && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[125]++; print "R125"}; continue;};
 if ( q(1,md_bz) &&
       q(2,gl_in) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[126]++; print "R126"}; continue;};
 if ( q(-1,md_bz) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[127]++; print "R127"}; continue;};


 # глагол говорения -----------------------------------------------------
 if ( (q(-2,suw_oded)||q(-2,suw_odmn)) &&
        q(-1,gl_gov) && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[128]++; print "R128"}; continue;};
 if ( q(-2,gl_gov) &&
        q(-1,pre_vi) && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[129]++; print "R129"}; continue;};
 if ( q(-2,nar_obvr) &&
      (q(-1,mest_ed)||q(-1,mest_mn)) &&
        q(1,gl_gov) && s(-2,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[130]++; print "R130"}; continue;};
 if ( (q(-2,mest_ed)||q(-2,mest_mn)) &&
        w(-1,"же") &&
         q(1,mest_it) &&
          q(2,gl_gov) && s(-2,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[131]++; print "R131"}; continue;};
 if ( q(-1,mest_it) &&
       q(1,gl_govmn) && s(-1,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[132]++; print "R132"}; continue;};
 if ( (q(-1,mest_ed)||q(-1,mest_mn)) &&
        q(1,gl_gov) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[133]++; print "R133"}; continue;};
 if ( q(1,mest_mn) &&
       q(2,gl_govmn) && s(0,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[134]++; print "R134"}; continue;};
 if ( q(1,mest_da) &&
       q(2,gl_gov) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[135]++; print "R135"}; continue;};
 if ( q(1,nar_opka) &&
       q(2,gl_govmn) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[136]++; print "R136"}; continue;};
 if ( q(1,mest_mn) &&
       q(2,nar_opka) &&
        q(3,gl_govmn) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[137]++; print "R137"}; continue;};
 if ( (q(1,mest_ed)||q(1,mest_mn)) &&
        q(2,gl_gov) && s(0,1) && sc(2,",") &&
         w(3,"что как насколько") )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[138]++; print "R138"}; continue;};
 if ( (q(1,mest_ed)||q(1,mest_mn)) &&
        q(2,gl_goved) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[139]++; print "R139"}; continue;};
 if ( q(-1,gl_gov) &&
       w(1,"что") && s(-1,-1) && sc(0,",") )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[140]++; print "R140"}; continue;};
 if ( q(1,gl_govmn) &&
       w(2,"кто что как насколько") && s(0,0) && sc(1,",") )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[141]++; print "R141"}; continue;};
 if ( phf(1,"в один голос") &&
       q(4,gl_gov) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[142]++; print "R142"}; continue;};
 if ( q(-1,mest_ed) &&
       q(1,gl_goved) &&
        q(2,pre_vi) && s(-1,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[143]++; print "R143"}; continue;};
 if ( q(1,gl_govmn) &&
       q(2,pre_pr) &&
       (q(3,mest_pr)||q(3,suw_edpr)||q(3,suw_mnpr)||q(3,prl_mnvr)||cap(3)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[144]++; print "R144"}; continue;};
 if ( q(1,gl_govmn) &&
       q(2,pre_vi) &&
       (q(3,mest_vi)||q(3,suw_edvi)||q(3,suw_odmnvr)||q(3,suw_nomniv)||q(3,prl_mniv)||q(3,prl_mnvr)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[145]++; print "R145"}; continue;};
 if ( q(-2,gl_govmn) &&
       q(-1,mest_da) &&
        q(1,nar_opsp) && s(-2,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[146]++; print "R146"}; continue;};
 if ( q(-1,gl_gov) &&
      (q(1,pre_pr)||q(1,pre_vi)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[147]++; print "R147"}; continue;};
 if ( q(-1,gl_gov) &&
      (q(1,suw_edda)||q(1,suw_mnda)||cap(1)) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[148]++; print "R148"}; continue;};
 if ( q(-3,gl_gov) &&
       w(-2,"о об про") && s(-3,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[149]++; print "R149"}; continue;};
 if ( q(1,pre_tv) &&
      (q(2,mest_tv)||q(2,suw_edtv)||q(2,suw_mntv)) &&
        q(3,gl_gov) && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[150]++; print "R150"}; continue;};
 if ( q(1,pre_pr) &&
      (q(2,mest_pr)||q(2,suw_edpr)||q(2,suw_mnpr)) &&
        q(3,gl_govmn) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[151]++; print "R151"}; continue;};
 if ( q(-1,gl_gov) &&
      (q(1,prl_edtv)||q(1,prl_mntv)) &&
       (q(2,suw_edtv)||q(2,suw_mntv)) && s(-1,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[152]++; print "R152"}; continue;};
 if ( w(-2,"некоторое какое-то") &&
       w(-1,"время") &&
        q(1,gl_govmn) && s(-2,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[153]++; print "R153"}; continue;};
 if ( (q(-2,suw_noed)||q(-2,suw_nomn)) &&
        q(-1,gl_govmn) && s(-2,-1) && p(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[154]++; print "R154"}; continue;};
 if ( q(-1,nar_mest) &&
       q(1,gl_govmn) && s(-1,0) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[155]++; print "R155"}; continue;};
 #--------------------------------------------------------------------
 if ( q(-1,gl_gov) && s(-1,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[156]++; print "R156"}; continue;};
 if ( q(1,gl_goved) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[157]++; print "R157"}; continue;};


 # глагол восприятия, чувствования, думания =====================================
 if ( (q(-2,suw_oded)||q(-2,suw_odmn)) &&
        q(-1,gl_quv) && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[158]++; print "R158"}; continue;};
 if ( (q(-2,mest_vi)||q(-2,suw_edvi)||q(-2,suw_odmniv)||q(-2,suw_nomnvr)) &&
        q(-1,gl_quvmn) && s(-2,-1) && p(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[159]++; print "R159"}; continue;};
 if ( q(1,gl_quvmn) &&
       q(2,pre_tv) &&
       (q(3,mest_tv)||q(3,suw_mntv)||q(3,suw_edtv)) && s(0,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[160]++; print "R160"}; continue;};
 if ( q(-2,gl_quv) &&
       q(-1,pre_vi) && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[161]++; print "R161"}; continue;};
 if ( q(-2,nar_obvr) &&
      (q(-1,mest_ed)||q(-1,mest_mn)) &&
        q(1,gl_quv) && s(-2,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[162]++; print "R162"}; continue;};
 if ( (q(-2,mest_ed)||q(-2,mest_mn)) &&
        w(-1,"же") &&
         q(1,mest_it) &&
          q(2,gl_quv) && s(-2,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[163]++; print "R163"}; continue;};
 if ( q(1,gl_quvmn) &&
      (q(2,nar_obna)||q(2,mest_vi)) && s(0,1) && p(2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[164]++; print "R164"}; continue;};
 if ( q(1,gl_quvmn) &&
       q(2,nar_obvr) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[165]++; print "R165"}; continue;};
 if ( q(-3,mest_im) &&
       q(-2,mest_im) &&
        q(-1,gl_quvmn) && s(-2,-1) )
 { sub(/([Ее])/, "ё", l[i]); if(dbg){r[166]++; print "R166"}; continue;};
 if ( q(-1,mest_it) &&
       q(1,gl_quvmn) && s(-1,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[167]++; print "R167"}; continue;};
 if ( (q(-1,mest_ed)||q(-1,mest_mn)) &&
        q(1,gl_quv) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[168]++; print "R168"}; continue;};
 if ( q(1,mest_da) &&
       q(2,gl_quv) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[169]++; print "R169"}; continue;};
 if ( q(1,nar_opka) &&
       q(2,gl_quvmn) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[170]++; print "R170"}; continue;};
 if ( q(1,mest_mn) &&
      (q(2,nar_opka)||q(2,mest_vi)||q(2,mest_it)) &&
        q(3,gl_quvmn) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[171]++; print "R171"}; continue;};
 if ( q(1,mest_mn) &&
       q(2,prl_kred_sr) &&
        q(3,pre_pr) &&
        (q(4,mest_pr)||q(4,suw_edpr)||q(4,suw_mnpr)) &&
          q(5,gl_quvmn) && s(0,4) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[172]++; print "R172"}; continue;};
 if ( q(1,mest_mn) &&
       q(2,pre_pr) &&
       (q(3,mest_pr)||q(3,suw_edpr)||q(3,suw_mnpr)) &&
         q(4,gl_quvmn) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[173]++; print "R173"}; continue;};
 if ( q(1,pre_pr) &&
      (q(2,mest_pr)||q(2,suw_edpr)||q(2,suw_mnpr)) &&
        q(3,gl_quvmn) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[174]++; print "R174"}; continue;};
 if ( q(1,mest_mn) &&
       q(2,nar_opka) &&
        q(3,gl_quvmn) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[175]++; print "R175"}; continue;};
 if ( (q(1,mest_ed)||q(1,mest_mn)) &&
        q(2,gl_quv) && s(0,1) && sc(2,",") &&
         w(3,"что как насколько") )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[176]++; print "R176"}; continue;};
 if ( (q(-1,mest_ed)||q(-1,mest_mn)) &&
        phf(1,"не так") &&
         q(3,gl_quv) && s(-1,2) && p(3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[177]++; print "R177"}; continue;};
 if ( q(-2,gl_quvmn) &&
       q(-1,mest_mnim) && s(-2,-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[178]++; print "R178"}; continue;};
 if ( q(1,mest_mn) &&
       q(2,gl_quvmn) && s(0,1) && sc(2,",") &&
        w(3,"что") )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[179]++; print "R179"}; continue;};
 if ( q(1,mest_mn) &&
       q(2,gl_quvmn) && s(0,1) && p(2) )
 { sub(/([Ее])/, "ё", l[i]); if(dbg){r[180]++; print "R180"}; continue;};
 if ( (q(-1,mest_ed)||q(-1,mest_mn)) &&
        q(1,gl_quv) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[181]++; print "R181"}; continue;};
 if ( (q(1,mest_ed)||q(1,mest_mn)) &&
        q(2,gl_quved) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[182]++; print "R182"}; continue;};
 if ( q(-1,gl_quv) &&
       w(1,"что") && s(-1,-1) && sc(0,",") )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[183]++; print "R183"}; continue;};
 if ( q(1,gl_quvmn) &&
       w(2,"кто что как насколько") && s(0,0) && sc(1,",") )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[184]++; print "R184"}; continue;};
 if ( q(-1,mest_ed) &&
       q(1,gl_quved) &&
        q(2,pre_vi) && s(-1,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[185]++; print "R185"}; continue;};
 if ( q(1,gl_quvmn) &&
       q(2,pre_pr) &&
       (q(3,mest_pr)||q(3,suw_edpr)||q(3,suw_mnpr)||q(3,prl_mnvr)||cap(3)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[186]++; print "R186"}; continue;};
 if ( q(1,gl_quvmn) &&
       q(2,pre_vi) &&
       (q(3,mest_vi)||q(3,suw_edvi)||q(3,suw_odmnvr)||q(3,suw_nomniv)||q(3,prl_mniv)||q(3,prl_mnvr)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[187]++; print "R187"}; continue;};
 if ( q(1,gl_quvmn) &&
       (q(2,suw_odmnim)||q(2,suw_nomniv)||q(2,prl_mniv)) && s(0,1) )
 { sub(/([Ее])/, "ё", l[i]); if(dbg){r[188]++; print "R188"}; continue;};
 if ( q(-2,gl_quvmn) &&
       q(-1,mest_da) &&
        q(1,nar_opsp) && s(-2,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[189]++; print "R189"}; continue;};
 if ( q(-1,gl_quvpo) && sc(0,",") &&
      (q(1,gl_edpo)||q(1,gl_povzmn)||q(1,gl_popemn)||q(1,gl_popnmn)||q(1,gl_ponemn)) && s(-1,-1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[190]++; print "R190"}; continue;};
 if ( q(-1,gl_quv) &&
      (q(1,pre_pr)||q(1,pre_vi)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[191]++; print "R191"}; continue;};
 if ( w(-2,"о об") &&
      (q(-1,suw_edpr)||q(-1,suw_mnpr)) &&
        q(1,gl_quv) && s(-2,0) && p(1) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[192]++; print "R192"}; continue;};
 if ( q(-3,gl_quv) &&
       w(-2,"о об про") && s(-3,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[193]++; print "R193"}; continue;};
 if ( q(-1,gl_quv) &&
      (q(1,suw_edda)||q(1,suw_mnda)) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[194]++; print "R194"}; continue;};
 if ( q(-1,gl_quv) &&
      (q(1,prl_edtv)||q(1,prl_mntv)) &&
       (q(2,suw_edtv)||q(2,suw_mntv)) && s(-1,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[195]++; print "R195"}; continue;};
 if ( (q(-2,suw_noed)||q(-2,suw_nomn)) &&
        q(-1,gl_quvmn) && s(-2,-1) && p(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[196]++; print "R196"}; continue;};
 if ( q(-1,gl_quv) &&
       q(1,pre_ro) &&
       (q(2,suw_edro)||q(2,suw_mnro)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[197]++; print "R197"}; continue;};
 if ( cap(0) &&
       q(1,gl_quvmn) && s(0,0) && p(1) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[198]++; print "R198"}; continue;};
 if ( cap(-2) &&
       q(-1,gl_quvmn) && s(-2,-1) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[199]++; print "R199"}; continue;};
 if ( cap(-3) &&
       w(-2,"и с") &&
        cap(-1) &&
         q(1,gl_quvmn) && s(-3,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[200]++; print "R200"}; continue;};
 #--------------------------------------------------------------------
 if ( q(-1,gl_quv) && s(-1,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[201]++; print "R201"}; continue;};

 # глаголы движения
 if ( q(-2,gl_dviin) &&
       q(-1,prl_krmn) && s(-2,-1) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[202]++; print "R202"}; continue;};
 if ( q(-2,gl_dvimn) &&
       q(-1,mest_mn) && s(-2,-1) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[203]++; print "R203"}; continue;};
 if ( q(1,gl_dvimn) && s(0,0) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[204]++; print "R204"}; continue;};
 if ( q(1,gl_dvied) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[205]++; print "R205"}; continue;};

 # глаголы делания
 if ( (q(-1,suw_odmnim)||q(-1,suw_nomniv)) &&
       q(1,gl_delmn) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[206]++; print "R206"}; continue;};
 if ( (q(1,suw_odmnim)||q(-1,suw_nomniv)) &&
       q(1,gl_delmn) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[207]++; print "R207"}; continue;};
 
 # глагол в единственном числе
 if ( q(-1,mest_it) &&
      (q(1,nar_obvr)||q(1,nar_obme)||q(1,nar_opsp)||q(1,nar_opst)||q(1,nar_srav)||q(1,nar_opka)) &&
       (q(2,gl_ed)||q(2,gl_in)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[208]++; print "R208"}; continue;};
 if ( q(1,mest_it) &&
      (q(2,nar_obvr)||q(2,nar_obme)||q(2,nar_opsp)||q(2,nar_opst)||q(2,nar_srav)||q(2,nar_opka)) &&
       (q(3,gl_ed)||q(3,gl_in)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[209]++; print "R209"}; continue;};
 if ( q(1,mest_it) &&
      (q(2,nar_obvr)||q(2,nar_obme)||q(2,nar_opsp)||q(2,nar_opst)||q(2,nar_srav)||q(2,nar_opka)) && s(0,2) && (p(2)||w(3,"и")) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[210]++; print "R210"}; continue;};
 if ( q(1,mest_it) && s(0,0) && sc(1,",") &&
       q(2,vvod) && sc(2,",") &&
       (q(3,gl_ed)||q(3,gl_in)) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[211]++; print "R211"}; continue;};
 if ( q(1,mest_it) && s(0,0) && sc(1,",") &&
       q(2,vvod) && sc(2,",") &&
       (q(3,gl_nemn)||q(3,gl_pnmn)) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[212]++; print "R212"}; continue;};
 if ( sc(0,",") &&
       q(1,vvod) && sc(1,",") &&
       (q(2,gl_ed)||q(2,gl_in)) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[213]++; print "R213"}; continue;};
 if ( sc(0,",") &&
       q(1,vvod) && sc(1,",") &&
       (q(2,gl_nemn)||q(2,gl_pnmn)) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[214]++; print "R214"}; continue;};
 if ( q(1,mest_it) &&
       q(2,mest_da) &&
        q(3,prl_kred_sr) && s(0,2) && p(3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[215]++; print "R215"}; continue;};
 if ( q(1,mest_it) &&
       q(2,qast) &&
        q(3,prq_kred_sr) && s(0,2) && p(3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[216]++; print "R216"}; continue;};
 if ( q(1,mest_it) &&
       q(2,prl_kred_sr) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[217]++; print "R217"}; continue;};
 if ( q(-1,mest_it) &&
       q(1,predik) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[218]++; print "R218"}; continue;};
 if ( q(-2,gl_in) &&
       q(-1,mest_it) && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[219]++; print "R219"}; continue;};
 if ( q(-1,mest_it) &&
       q(1,mest_im) &&
        q(2,suw_edim) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[220]++; print "R220"}; continue;};
 if ( q(-1,mest_it) &&
       q(1,pre_ro) &&
       (q(2,mest_ro)||q(2,mest_vi)||q(2,prl_edro)||q(2,prl_edvr)||q(2,prl_mniv)||q(2,prl_mnvr)) &&
        (q(3,suw_edro)||q(3,suw_odmnvr)||q(3,suw_mnro)) && s(-1,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[221]++; print "R221"}; continue;};
 if ( q(-1,mest_it) &&
       w(1,"что чтобы") && s(-1,-1) && sc(0,",") )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[222]++; print "R222"}; continue;};
 if ( q(-1,mest_it) &&
       w(1,"кто") && s(-1,-1) && sc(0,",") )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[223]++; print "R223"}; continue;};
 if ( q(-1,mest_it) &&
       q(1,pre_ro) &&
        w(2,"того") &&
         w(3,"что чтобы") && s(-1,1) && sc(2,",") )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[224]++; print "R224"}; continue;};
 if ( q(1,mest_it) &&
       q(2,pre_ro) &&
        w(3,"того") &&
         w(4,"что чтобы") && s(0,2) && sc(3,",") )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[225]++; print "R225"}; continue;};
 if ( q(1,mest_it) &&
       q(2,mest_da) &&
        q(3,nar_opka) &&
         q(4,gl_edsr) && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[226]++; print "R226"}; continue;};
 if ( q(1,mest_it) &&
      (q(2,prl_ediv)||q(2,prl_edvr)||q(2,prl_mniv)||q(2,prq_mniv)||q(2,prl_mnvr)||q(2,prq_mnvr)) &&
       (q(3,suw_edim)||q(3,suw_odmnim)||q(3,suw_nomniv)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[227]++; print "R227"}; continue;};
 if ( q(1,mest_it) &&
       q(2,pre_pr) &&
       (q(3,suw_edpr)||q(3,suw_mnpr)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[228]++; print "R228"}; continue;};
 if ( q(1,mest_it) &&
       q(2,pre_ro) &&
       (q(3,mest_ro)||q(3,suw_edro)||q(3,suw_odmnvr)||q(3,suw_mnro)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[229]++; print "R229"}; continue;};
 if ( q(1,mest_it) && s(0,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[230]++; print "R230"}; continue;};
 if ( (q(-1,gl_quv)||q(-1,gl_gov)) &&
        q(1,mest_it) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[231]++; print "R231"}; continue;};
 if ( q(-1,mest_it) && cap(-1) &&
       (q(1,mest_ed)||q(1,mest_mn)) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[232]++; print "R232"}; continue;};


 # Все + ... + причастие =====================================
 if ( w(1,"уже") &&
      (q(2,nar_obme)||q(2,nar_opst)) &&
        q(3,prq_kred_sr) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[233]++; print "R233"}; continue;};
 if ( (q(1,nar_obme)||q(1,nar_opst)) &&
        q(2,prq_kred_sr) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[234]++; print "R234"}; continue;};
 if ( q(1,qast) &&
       q(2,prq_kred_sr) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[235]++; print "R235"}; continue;};
 if ( q(1,pre_ro) &&
      (q(2,suw_odmnvr)||q(2,suw_mnro)||q(2,suw_edro)) &&
        q(3,prq_kred_sr) && s(0,2) && (p(3)||w(4,"и")) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[236]++; print "R236"}; continue;};
 if ( q(-2,gl_in) &&
       q(-1,prq_krmn) && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[237]++; print "R237"}; continue;};
 if ( q(-2,prq_kred_sr) &&
       q(-1,nar_opst) && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[238]++; print "R238"}; continue;};
 if ( q(-1,prq_kred_sr) && s(-1,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[239]++; print "R239"}; continue;};
 if ( (q(1,prq_ediv)||q(1,prq_kred)) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[240]++; print "R240"}; continue;};
 if ( q(1,mest_ed) &&
      (q(2,prq_ediv)||q(2,prq_kred)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[241]++; print "R241"}; continue;};
 if ( q(-1,pre_tv) &&
       (q(1,prq_edtv)||q(1,prq_mntv)) &&
        (q(2,suw_edtv)||q(2,suw_mntv)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[242]++; print "R242"}; continue;};
 if ( (q(-1,prq_edtv)||q(-1,prq_mntv)||q(-1,prl_edtv)||q(-1,prl_mntv)) && sc(-1,",") &&
       (q(1,prq_edtv)||q(1,prq_mntv)) &&
        (q(2,suw_edtv)||q(2,suw_mntv)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[243]++; print "R243"}; continue;};
 if ((q(1,nar_obvr)||q(1,qast)) &&
       q(2,nar_opka) &&
       (q(3,prq_ediv)||q(3,prq_kred)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[244]++; print "R244"}; continue;};
 if ( (q(1,prq_mniv)||q(1,prq_krmn)) && s(0,0) && p(1) && pv(1,1",") )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[245]++; print "R245"}; continue;};
 if ( q(1,prq_mniv) &&
       q(2,pre_ro) && s(0,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[246]++; print "R246"}; continue;};
 if ( w(1,"не") &&
       q(2,prq_mniv) &&
        q(3,pre_ro) && s(0,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[247]++; print "R247"}; continue;};
 if ( q(1,mest_vi) &&
      (q(2,prq_mniv)||q(2,prq_krmn)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[248]++; print "R248"}; continue;};
 if ( q(1,prl_srav) &&
      (q(2,prq_edvr)||q(2,prq_edro)||q(2,prq_mnvr)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[249]++; print "R249"}; continue;};
 if ( (q(1,prq_edvr)||q(1,prq_edro)||q(1,prq_mnvr)) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[250]++; print "R250"}; continue;};
 if ( q(1,prq_edsrim) && sc(0,",") )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[251]++; print "R251"}; continue;};
 


 # Все + ... + прилагательное =====================================
 if ( (q(1,prl_mniv)||q(1,prq_mniv)||q(1,prl_mnvr)||q(1,prq_mnvr)||q(1,prl_krmn)) &&
        w(2,"и или") &&
        (q(3,prl_mniv)||q(3,prq_mniv)||q(3,prl_mnvr)||q(3,prq_mnvr)||q(3,prl_krmn)) && s(0,2) && qq(1,3)  )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[252]++; print "R252"}; continue;};
 if ( (q(1,prl_mniv)||q(1,prq_mniv)||q(1,prl_mnvr)||q(1,prq_mnvr)||q(1,prl_krmn)) &&
        w(2,"и или") &&
        (q(3,prl_mniv)||q(3,prq_mniv)||q(3,prl_mnvr)||q(3,prq_mnvr)||q(3,prl_krmn)) &&
         (q(4,suw_odmnim)||q(4,suw_nomniv)) &&
           q(5,gl_nemn) && s(0,4)  )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[253]++; print "R253"}; continue;};
 if ( (q(1,prl_mniv)||q(1,prq_mniv)||q(1,prl_mnvr)||q(1,prq_mnvr)||q(1,prl_krmn)) &&
        w(2,"и или") &&
        (q(3,prl_mniv)||q(3,prq_mniv)||q(3,prl_mnvr)||q(3,prq_mnvr)||q(3,prl_krmn)) &&
         (q(4,suw_odmnim)||q(4,suw_nomniv)) && s(0,3)  )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[254]++; print "R254"}; continue;};
 if ( (q(1,prl_mniv)||q(1,prq_mniv)||q(1,prl_mnvr)||q(1,prq_mnvr)||q(1,prl_krmn)) && W(1,"новые") &&
       (q(2,prl_mniv)||q(2,prq_mniv)||q(2,prl_mnvr)||q(2,prq_mnvr)||q(2,prl_krmn)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[255]++; print "R255"}; continue;};
 if ( w(1,"и") &&
      (q(2,prl_mniv)||q(2,prq_mniv)||q(2,prl_mnvr)||q(2,prq_mnvr)||q(2,prl_krmn)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[256]++; print "R256"}; continue;};
 if ( (q(-2,prl_mniv)||q(-2,prl_mnvr)) &&
       w(-1,"и") &&
       (q(1,prq_mniv)||q(1,prq_mnvr)) && p(1) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[257]++; print "R257"}; continue;};
 if ( (q(1,prl_mniv)||q(1,prq_mniv)||q(1,prl_mnvr)||q(1,prq_mnvr)||q(1,prl_krmn)) && p(1) && s(0,0) && W(1,"новые") )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[258]++; print "R258"}; continue;};
 if ( q(1,mest_tv) &&
       q(2,prl_krmn) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[259]++; print "R259"}; continue;};
 if ( q(1,prl_krmn) && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[260]++; print "R260"}; continue;};
 if ( l[i+1]~".о$" && se(1,"-") &&
      (q(2,prl_mniv)||q(2,prq_mniv)||q(2,prl_mnvr)||q(2,prq_mnvr)||q(2,prl_krmn)) &&
       (q(3,suw_odmnim)||q(3,suw_nomniv)) && s(0,0) && s(2,2))
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[261]++; print "R261"}; continue;};
 if ( (q(1,prl_mniv)||q(1,prq_mniv)||q(1,prl_mnvr)||q(1,prq_mnvr)||q(1,prl_krmn)) && W(1,"новые") &&
       (q(2,suw_odmnim)||q(2,suw_nomniv)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[262]++; print "R262"}; continue;};
 if ( (q(1,prl_ediv)||q(1,prl_edvr)||q(1,prl_kred)) &&
       (q(2,suw_edim)||q(2,suw_edvi)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[263]++; print "R263"}; continue;};
 if ( (q(1,prl_pvedtv)||q(1,prl_pvmntv)) &&
       (q(2,suw_edtv)||q(2,suw_mntv)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[264]++; print "R264"}; continue;};
 if ( (q(1,qast)||q(1,nar_opka)) &&
       (q(2,nar_opka)||q(2,nar_opst)) &&
         q(3,prl_kred_sr) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[265]++; print "R265"}; continue;};
 if ( (q(1,nar_opka)||q(1,nar_opst)) &&
        q(2,prl_kred_sr) &&
         q(3,gl_quvmn) && sc(3,",") &&
          w(4,"что кто") && s(0,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[266]++; print "R266"}; continue;};
 if ( w(1,"ли") &&
      (q(2,suw_odmnim)||q(2,suw_nomniv)) &&
        q(3,prl_krmn) && s(0,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[267]++; print "R267"}; continue;};
 if ( (q(1,suw_odmnim)||q(1,suw_nomniv)) &&
        q(2,prl_krmn) && s(0,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[268]++; print "R268"}; continue;};
 if ( (q(-1,mest_da)||q(-1,suw_edda)||q(-1,suw_mnda)) &&
        q(1,prl_kred_sr) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[269]++; print "R269"}; continue;};
 if ( (q(1,nar_opka)||q(1,nar_opst)) &&
        q(2,prl_kred_sr) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[270]++; print "R270"}; continue;};
 if ( w(1,"так") &&
        q(2,prl_krmn) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[271]++; print "R271"}; continue;};
 if ( (q(1,nar_opka)||q(1,nar_opst)) &&
        q(2,prl_krmn) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[272]++; print "R272"}; continue;};
 if ( q(-2,pre_tv) &&
      (q(-1,suw_edtv)||q(-1,suw_mntv)) &&
        q(1,prl_kred_sr) && s(-2,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[273]++; print "R273"}; continue;};
 if ( w(1,"вроде как") &&
       w(2,"бы как") &&
        q(3,prl_kred_sr) && s(0,2) && p(3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[274]++; print "R274"}; continue;};
 if ( w(1,"так настолько") &&
       q(2,prl_kred_sr) &&
        w(3,"и") &&
         q(4,prl_kred_sr) && s(0,3) && p(4) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[275]++; print "R275"}; continue;};
 if ( (w(1,"именно")||q(1,prl_kred_sr)) &&
        w(2,"так") && sc(2,",") &&
         w(3,"как чтобы") && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[276]++; print "R276"}; continue;};
 if ( (w(1,"именно")||q(1,prl_kred_sr)) &&
        w(2,"так") && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[277]++; print "R277"}; continue;};
 if ( w(1,"вроде как так") &&
       q(2,prl_kred_sr) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[278]++; print "R278"}; continue;};
 if ( q(1,mest_ed) &&
       q(2,nar_opst) &&
        (q(3,prl_kred_sr)||q(3,prl_edsrim)) && s(0,2) && p(3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[279]++; print "R279"}; continue;};
 if ( q(1,mest_ed) &&
       (q(2,prl_kred_sr)||q(2,prl_edsrim)) &&
        (q(3,mest_da)||q(3,suw_edda)||q(3,suw_mnda)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[280]++; print "R280"}; continue;};
 if ( (q(1,nar_obme)||q(1,nar_obvr)) &&
       (q(2,prl_edsrim)||q(2,prl_edsrvi)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[281]++; print "R281"}; continue;};
 if ( (q(1,prl_edsrim)||q(1,prl_edsrvi)) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[282]++; print "R282"}; continue;};
 if ( q(-1,pre_vi) &&
      (q(1,prl_kred_sr)||q(1,prl_edsrim)) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[283]++; print "R283"}; continue;};
 if ( q(-1,vvod) &&
      (q(1,prl_kred_sr)||q(1,prl_edsrim)) && sc(-1,",") && s(0,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[284]++; print "R284"}; continue;};
 if ( (q(-2,gl_nemn)||q(-2,gl_pnmn)||q(-2,gl_pemn)||q(-2,gl_in)) &&
        q(-1,mest_mn) &&
        (q(1,prl_kred_sr)||q(1,prl_edsrim)) && s(-2,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[285]++; print "R285"}; continue;};
 if ( (q(-1,gl_nemn)||q(-1,gl_pnmn)||q(-1,gl_pemn)) &&
       (q(1,prl_kred_sr)||q(1,prl_edsrim)) && s(-1,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[286]++; print "R286"}; continue;};
 if ( (q(1,prl_kred_sr)||q(1,prl_edsrim)) &&
        q(2,pre_ro) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[287]++; print "R287"}; continue;};
 if ( (q(1,prl_kred_sr)||q(1,prl_edsrim)) && s(0,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[288]++; print "R288"}; continue;};
 if ( q(-2,gl_vzmn) &&
      (q(-1,prl_kred_sr)||q(-1,nar_opka)) && s(-2,-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[289]++; print "R289"}; continue;};
 if ( (q(-1,prl_kred_sr)||q(-1,nar_opka)) &&
        w(1,"кто кого кому кем") && sc(0,",") && s(-1,-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[290]++; print "R290"}; continue;};
 if (  w(1,"кто кого кому кем") && sc(0,",") )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[291]++; print "R291"}; continue;};
 if ( (q(-1,prl_kred_sr)||q(-1,nar_opka)) &&
        q(1,pre_ro) &&
        (q(2,suw_edro)||q(2,suw_odmnro)||q(2,suw_nomnvr)) && s(-1,1) && p(2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[292]++; print "R292"}; continue;};
 if ( (q(-1,prl_kred_sr)||q(-1,nar_opka)) && s(-1,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[293]++; print "R293"}; continue;};
 if ( (q(1,mest_ed)||q(1,nar_opka)||q(1,nar_obvr)) &&
        (q(2,prl_kred_sr)||q(2,prl_edsrim)) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[294]++; print "R294"}; continue;};
 if ( q(1,pre_pr) &&
      (q(2,mest_pr)||q(2,suw_edpr)||q(2,suw_mnpr)) &&
        q(3,prl_kred_sr) && s(0,2) && p(3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[295]++; print "R295"}; continue;};
 if ( (q(3,prl_edtv)||q(3,prl_mntv)) &&
        w(2,"и") &&
        (q(3,prl_edtv)||q(3,prl_mntv)) && s(0,2) && qq(1,3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[296]++; print "R296"}; continue;};
 if ( (q(1,prl_mniv)||q(1,prl_mnvr)) &&
        w(2,"и или") &&
        (q(3,prl_mniv)||q(3,prl_mnvr)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[297]++; print "R297"}; continue;};
 if ( (q(1,prl_srav)||q(1,nar_opst)||q(1,nar_opka)||q(1,nar_srav)) &&
        w(2,"и или") &&
        (q(3,prl_srav)||q(3,nar_opst)||q(3,nar_opka)||q(3,nar_srav)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[298]++; print "R298"}; continue;};
 if ( q(1,prl_srav) && se(1,", ") &&
       q(2,prl_srav) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[299]++; print "R299"}; continue;};
 if ( q(1,prl_srav) &&
      (q(2,prl_edro)||q(2,prl_edvr)) &&
        q(3,suw_edro) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[300]++; print "R300"}; continue;};
 if ( q(1,prl_srav) &&
      (q(2,suw_odmnvr)||q(2,suw_nomniv)||q(2,suw_mnro)||q(2,prl_edvr)||q(2,prl_edro)||q(2,prl_mnvr)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[301]++; print "R301"}; continue;};
 if ( q(1,prl_srav) &&
      (q(2,suw_edim)||q(2,suw_nomniv)||q(2,suw_odmnim)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[302]++; print "R302"}; continue;};

 # Все + ... + существительное =====================================

 if ( q(1,souz) && sc(0,",") &&
       w(2,"не") &&
        q(3,prq_mniv) &&
         q(4,suw_edda) &&
         (q(5,suw_nomniv)||q(5,odmnim)) && s(1,4) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[303]++; print "R303"}; continue;};
 if ( q(1,souz) && sc(0,",") &&
       q(2,prq_mniv) &&
        q(3,suw_edda) &&
        (q(4,suw_nomniv)||q(5,odmnim)) && s(1,3) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[304]++; print "R304"}; continue;};
 if (  q(1,prq_mniv) &&
        q(2,suw_edda) &&
        (q(3,suw_nomniv)||q(5,odmnim)) && s(1,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[305]++; print "R305"}; continue;};
 if ( w(1,"не") &&
       q(2,prq_mniv) &&
        q(3,suw_edda) &&
        (q(4,suw_nomniv)||q(5,odmnim)) && s(1,3) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[306]++; print "R306"}; continue;};
 if ( w(1,"нет") &&
      (q(2,suw_odmnvr)||q(2,suw_edro)||q(2,suw_mnro)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[307]++; print "R307"}; continue;};
 if ( (q(1,suw_edim)||q(1,suw_edne)) &&
       (q(2,suw_edro)||q(2,suw_mnro)||q(2,suw_nomniv)) && 
         q(3,gl_edsr) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[308]++; print "R308"}; continue;};
 if ( (q(1,mest_ed)||q(1,mest_mn)) &&
       (q(2,suw_odmnim)||q(2,suw_nomniv)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[309]++; print "R309"}; continue;};
 if ( q(1,suw_edim) && se(1,"-") &&
      (q(2,suw_odmnim)||q(2,suw_nomniv)) && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[310]++; print "R310"}; continue;};
 if ( (q(1,prl_mniv)||q(1,prq_mniv)||q(1,prl_mnvr)||q(1,prq_mnvr)) &&
        q(2,mest_da) &&
        (q(3,suw_odmnim)||q(3,suw_nomniv)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[311]++; print "R311"}; continue;};
 if ( (q(1,mest_ed)||q(1,mest_mn)||q(1,prl_kred_sr)) &&
       (q(2,prl_mniv)||q(2,prq_mniv)||q(2,prl_mnvr)||q(2,prq_mnvr)) &&
        (q(3,suw_odmnim)||q(3,suw_nomniv)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[312]++; print "R312"}; continue;};
 if ( (q(1,suw_odmnim)||q(1,suw_nomniv)) &&
       (q(2,gl_nemn)||q(2,gl_pemn)||q(2,gl_pnmn)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[313]++; print "R313"}; continue;};
 if ( (q(-1,suw_odmnim)||q(-1,suw_nomniv)) &&
        q(1,prl_krmn) && s(-1,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[314]++; print "R314"}; continue;};
 if ( (q(1,suw_odmnim)||q(1,suw_nomniv)) && !(q(1,prl_mniv)||q(1,prl_mnvr)) && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[315]++; print "R315"}; continue;};
 if ( (q(1,mest_ed)||q(1,mest_mn)||q(1,nar_opka)) &&
       (q(2,prl_mniv)||q(2,prq_mniv)||q(2,prl_mnvr)||q(2,prq_mnvr)) &&
         q(3,suw_edim) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[316]++; print "R316"}; continue;};
 if ( (q(1,mest_ed)||q(1,mest_mn)) &&
        q(2,suw_edsrim) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[317]++; print "R317"}; continue;};
 if ( (q(1,mest_ed)||q(1,mest_mn)) &&
        q(2,suw_edim) &&
         q(3,qisl) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[318]++; print "R318"}; continue;};
 if ( q(1,mest_ed) &&
       q(2,qast) &&
        q(3,suw_edim) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[319]++; print "R319"}; continue;};
 if ( (q(1,suw_edsrim)||q(1,suw_edsrvi)) && s(0,0)  )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[320]++; print "R320"}; continue;};
 if ( (q(1,prl_mniv)||l[i+1]~"ские$") && W(1,"новые") &&
       (q(2,suw_edro)||q(2,suw_mnro)||q(2,suw_odmnvr)) && s(0,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[321]++; print "R321"}; continue;};
 if ( w(1,"ли же") &&
      (q(2,prl_mniv)||l[i+2]~"ские$") &&
       (q(3,suw_odmnim)||q(3,suw_nomniv)) && s(0,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[322]++; print "R322"}; continue;};
 if ( q(1,suw_edim) &&
       (q(2,suw_edro)||q(2,suw_mnro)||q(2,suw_odmnvr)) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[323]++; print "R323"}; continue;};
 if ( q(1,suw_edim) && s(0,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[324]++; print "R324"}; continue;};
 if ( q(-1,mest_mn) && s(-1,-1) &&
       q(1,prl_ediv) &&
        q(2,suw_edim) && se(0," — ") && s(1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[325]++; print "R325"}; continue;};
 if ( q(1,mest_mn) && s(0,0) &&
      (q(2,suw_edim)||q(2,suw_odmnim)||q(2,suw_nomniv)) && se(1," — ") )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[326]++; print "R326"}; continue;};
 if ( (q(1,mest_im)||q(1,mest_vi)) && s(1,1) &&
        q(2,suw_edim) && se(0," — ") )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[327]++; print "R327"}; continue;};
 if ( q(1,suw_edim) && se(0," — ") && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[328]++; print "R328"}; continue;};
 if ( q(1,suw_edim) &&
      (q(2,suw_edro)||q(2,suw_mnro)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[329]++; print "R329"}; continue;};


 # наречия =============================================
 if ( q(1,nar_opst) &&
       q(2,nar_srav) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[330]++; print "R330"}; continue;};
 if ( (w(1,"куда")||q(1,prl_kred_sr)) &&
        q(2,nar_srav) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[331]++; print "R331"}; continue;};
 if ( q(1,nar_srav) &&
       (q(2,gl_ed)||q(2,gl_nemn)||q(2,gl_pnmn)||q(2,gl_pemn)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[332]++; print "R332"}; continue;};
 if ( q(1,nar_srav) && s(0,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[333]++; print "R333"}; continue;};
 if ( (q(1,nar_opka)||q(1,nar_obvr)||q(1,mest_ed)) && s(0,0) && p(1) && cap(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[334]++; print "R334"}; continue;};
 if ( (q(-1,gl_vzmn)||q(-1,gl_nemn)) &&
        q(1,prl_srav) &&
         (q(2,prl_mniv)||q(2,prl_mntv)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[335]++; print "R335"}; continue;};
 if ( q(1,nar_opst) &&
      (q(2,prl_mntv)||q(2,prl_edtv)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[336]++; print "R336"}; continue;};
 if ( (q(-1,gl_vzmn)||q(-1,gl_nemn)) &&
       (q(1,nar_opsp)||q(1,nar_obna)||q(1,nar_opst)) && s(-1,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[337]++; print "R337"}; continue;};
 if ( (q(1,nar_opsp)||q(1,nar_obna)||q(1,nar_opst)) && s(0,0) && p(1) && cap(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[338]++; print "R338"}; continue;};
 if ( (q(1,nar_opsp)||q(1,nar_opst)||q(1,prl_kred_sr)) &&
        (q(2,prl_kred_sr)||q(2,prl_krmn)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[339]++; print "R339"}; continue;};
 if ( q(1,nar_opst) &&
      (q(2,prl_mniv)||q(prl_edim)) &&
       (q(3,suw_odmnvr)||q(3,suw_nomniv)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[340]++; print "R340"}; continue;};
 if ( (q(1,qast)||q(1,nar_opst)) &&
        q(2,nar_opka) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[341]++; print "R341"}; continue;};
 if ( q(1,nar_mest) &&
       w(2,"не") &&
        q(3,gl_ed) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[342]++; print "R342"}; continue;};
 if ( q(-1,mest_da) &&
       q(1,nar_mest) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[343]++; print "R343"}; continue;};

 # всё не так плохо
 if ( w(1,"не") &&
       w(2,"так") &&
       (q(3,nar_obvr)||q(3,nar_obme)||q(3,nar_opsp)||q(3,nar_srav)||q(3,nar_opka)||q(3,suw_edvi)||q(3,mest_ed)) && s(0,2) && p(3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[344]++; print "R344"}; continue;};

 # Все + ... + числительное =====================================
 # все + числ.
 if ( (q(1,qisl)||l[i+1]~/^[0-9]+$/) && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[345]++; print "R345"}; continue;};

 # все + местоимения =============================================
 # все + мест.мн
 if ( q(-3,mest_mn) && sc(-3,",") &&
       w(-2,"а но") &&
        w(-1,"не") && s(-2,-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[346]++; print "R346"}; continue;};
 if ( w(-1,"не") && s(-1,-1) &&
       w(1,"а но") && sc(0,",") &&
       (q(2,mest_mn)||q(2,prl_mniv)) && s(1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[347]++; print "R347"}; continue;};
 if ( q(1,mest_mn) &&
       q(2,prl_kred_sr) &&
        w(3,"и") &&
        (q(4,gl_pnmn)||q(4,gl_nemn)||q(4,gl_pemn)) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[348]++; print "R348"}; continue;};
 if ( q(1,mest_mn) &&
       q(2,prl_kred_sr) &&
       (q(3,gl_pnmn)||q(3,gl_nemn)||q(3,gl_pemn)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[349]++; print "R349"}; continue;};
 if ( q(1,mest_mn) &&
       q(2,nar_opsp) &&
        q(3,prq_mniv) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[350]++; print "R350"}; continue;};
 if ( q(1,mest_mn) &&
       q(2,qast) &&
       (q(3,gl_vzmn)||q(3,gl_nemn)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[351]++; print "R351"}; continue;};
 if ( q(-1,mest_mn) &&
      (q(1,gl_pnmn)||q(1,gl_nemn)) &&
        q(2,prl_kred_sr) &&
        (q(3,prl_mniv)||q(3,prl_krmn)) && s(-1,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[352]++; print "R352"}; continue;};
 if ( q(-1,mest_mn) &&
       q(1,gl_povzmn) && s(-1,0) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[353]++; print "R353"}; continue;};
 if ( q(-1,mest_mn) &&
       q(1,pre_tv) &&
        q(2,mest_tv) &&
         q(3,prl_krmn) && s(-1,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[354]++; print "R354"}; continue;};
 if ( q(-1,mest_mn) &&
       q(1,pre_ro) &&
        cap(2) && s(-1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[355]++; print "R355"}; continue;};
 if ( q(-1,mest_mn) &&
       q(1,nar_opst) &&
       (q(2,mest_ro)||q(2,suw_edro)||q(2,suw_odmnvr)||q(2,suw_mnro)) &&
         q(3,gl_pnmn) && s(-1,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[356]++; print "R356"}; continue;};
 if ( q(-1,mest_mn) &&
      (q(1,gl_pnmn)||q(1,gl_nemn)) &&
        q(2,prl_kred_sr) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[357]++; print "R357"}; continue;};
 if ( q(1,mest_mn) &&
      (q(2,nar_opst)||q(2,prl_kred_sr)) &&
        q(3,prl_krmn) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[358]++; print "R358"}; continue;};
 if ( q(1,mest_mn) &&
      (q(2,prl_krmn)||q(2,mest_mn)||q(2,prl_mniv)) && s(0,1) && p(2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[359]++; print "R359"}; continue;};
 if ( q(1,mest_mn) &&
       q(2,nar_obvr) &&
        q(3,md_mn) &&
         q(4,gl_in) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[360]++; print "R360"}; continue;};
 if ( q(1,mest_mn) &&
       q(2,prl_mniv) &&
        q(3,prl_mniv) &&
        (q(4,suw_odmnim)||q(4,suw_nomniv)) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[361]++; print "R361"}; continue;};
 if ( q(-2,mest_mn) &&
       w(-1,"ведь же ж") && s(-2,-1) && p(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[362]++; print "R362"}; continue;};
 if ( q(1,mest_mn) &&
       q(2,pre_pr) &&
       (q(3,suw_edpr)||q(3,suw_mnpr)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[363]++; print "R363"}; continue;};
 if ( q(1,mest_mn) &&
       w(2,"друг") &&
        w(3,"друга дружку") && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[364]++; print "R364"}; continue;};
 if ( (q(1,mest_ed)||q(1,mest_mn)) &&
        q(2,qisl) &&
        (q(3,suw_mnro)||q(2,suw_odmnvr)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[365]++; print "R365"}; continue;};
 if ( q(1,mest_mnim) &&
       (q(2,gl_vzmn)||q(2,gl_nemn)||q(2,gl_pemn)||q(2,gl_pnmn)||q(2,prl_krmn)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[366]++; print "R366"}; continue;};
 if ( q(1,mest_ed) &&
      (q(2,nar_mest)||q(2,nar_obpr)) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[367]++; print "R367"}; continue;};
 if ( q(1,mest_ed) &&
       q(2,pre_tv) &&
       (q(3,mest_tv)||q(3,suw_edtv)||q(3,suw_mntv)||q(3,prl_edtv)||q(3,prl_mntv)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[368]++; print "R368"}; continue;};
 if ( q(1,mest_ed) &&
       q(2,nar_opst) &&
        q(3,nar_opka) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[369]++; print "R369"}; continue;};
 if ( q(1,mest_ed) &&
      (q(2,nar_opka)||q(2,nar_opst)||q(2,nar_opsp)) &&
       (q(3,gl_ed)||q(3,gl_in)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[370]++; print "R370"}; continue;};
 if ( q(1,mest_ed) &&
      (q(2,nar_opka) || q(2,nar_opst)) &&
        q(3,qast) &&
        (q(4,gl_ed)||q(4,gl_in)) && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[371]++; print "R371"}; continue;};
 if ( q(1,mest_mn) && cap(0) && s(0,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[372]++; print "R372"}; continue;};

 # Местоимения + все
 # мест.да
 if ( q(-2,mest_mn) &&
       q(-1,prl_kred_sr) &&
        q(1,gl_quv) && s(-2,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[373]++; print "R373"}; continue;};
 if ( q(-1,mest_da) &&
       q(1,nar_mest) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[374]++; print "R374"}; continue;};

 # Мест + все + ... + глагол ============================================
 # все + ... + гл.мн.
 if ( qb(-5,mest_mn) &&
      (q(-1,suw_edim)||q(-1,suw_nomniv)) &&
       (q(1,gl_vzmn)||q(1,gl_nemn)) && s(-1,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[375]++; print "R375"}; continue;};
 if ( q(-3,mest_mn) &&
       w(-2,"не") &&
        q(-1,gl_nemn) &&
         q(1,gl_in) && s(-2,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[376]++; print "R376"}; continue;};
 if ( q(-2,mest_mn) &&
       q(-1,gl_nemn) &&
        q(1,gl_in) && s(-2,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[377]++; print "R377"}; continue;};
 if ( q(-1,gl_in) &&
       q(1,pre_pr) &&
       (q(2,suw_edpr)||q(2,suw_mnpr)) &&
         q(3,prl_edtv) && s(-1,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[378]++; print "R378"}; continue;};
 if ( q(-1,mest_mn) &&
      (q(1,qast)||q(1,nar_obme)||q(1,nar_opka)||q(1,nar_obvr)||q(1,nar_opsp)||q(1,mest_mn)) &&
       (q(2,gl_pnmn)||q(2,gl_pemn)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[379]++; print "R379"}; continue;};
 if ( q(-1,mest_mn) &&
      (q(1,gl_pnmn)||q(1,gl_pemn)) &&
       (q(2,suw_nomniv)||q(2,suw_odmnvr)) && s(-1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[380]++; print "R380"}; continue;};
 if ( q(1,mest_mn) &&
       q(2,nar_mest) &&
        q(3,gl_vzmn) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[381]++; print "R381"}; continue;};
 if ( q(1,mest_mn) &&
      (q(2,gl_pnmn)||q(2,gl_pemn)) &&
       (q(3,suw_nomniv)||q(3,suw_odmnvr)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[382]++; print "R382"}; continue;};
 if ( (q(1,gl_pnmn)||q(1,gl_pemn)) &&
       (q(2,prl_mniv)||q(2,prq_mniv)||q(2,prl_mnvr)||q(2,prq_mnvr)||q(2,prl_ediv)||q(2,prl_edvr)) &&
        (q(3,suw_nomniv)||q(3,suw_odmnvr)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[383]++; print "R383"}; continue;};
 # оглядывающий + все + вокруг + всех
 if ( q(-1,nar_obme) &&
       w(1,"как") &&
        q(2,pre_ro) &&
         (q(3,mest_ro)||q(3,suw_edro)||q(3,suw_mnro)||q(3,suw_odmnvr)||q(3,prl_edro)||q(3,prl_mnvr)||q(3,prq_edro)||q(3,prq_mnvr)) && s(-1,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[384]++; print "R384"}; continue;};
 if ( (q(-1,prq_ediv)||q(-1,prq_mniv)) &&
        q(1,pre_ro) &&
        (q(2,mest_ro)||q(2,suw_edro)||q(2,suw_mnro)||q(3,suw_odmnvr)||q(2,prl_edro)||q(2,prl_mnvr)||q(2,prq_edro)||q(2,prq_mnvr)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[385]++; print "R385"}; continue;};
 # все + против + всех
 if ( q(-1,gl_in) &&
       q(1,pre_ro) &&
       (q(2,mest_ro)||q(2,mest_vi)||q(2,prl_edro)||q(2,prl_edvr)||q(2,prl_mniv)||q(2,prl_mnvr)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[386]++; print "R386"}; continue;};
 if ( w(1,"для ради") && Q(-1,gl_vzed) &&
      (q(2,mest_ro)||q(2,suw_edro)||q(2,suw_mnro)||q(2,prl_edro)||q(2,prl_mnvr)||q(2,prq_edro)||q(2,prq_mnvr)) && s(-1,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[387]++; print "R387"}; continue;};
 if ( vvb(-1) && (q(vvn,suw_odmnim)||q(vvn,suw_nomniv)) &&
       q(1,pre_ro) &&
       (q(2,mest_ro)||q(2,suw_edro)||q(2,suw_mnro)||q(2,prl_edro)||q(2,prl_mnvr)||q(2,prq_edro)||q(2,prq_mnvr)) && s(0,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[388]++; print "R388"}; continue;};
 if ( q(-1,gl_ed) &&
       q(1,pre_ro) &&
       (q(2,mest_ro)||q(2,suw_edro)||q(2,suw_mnro)||q(2,prl_edro)||q(2,prl_mnvr)||q(2,prq_edro)||q(2,prq_mnvr)) && s(-1,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[389]++; print "R389"}; continue;};
 if ( q(1,pre_ro) &&
      (q(2,mest_ro)||q(2,suw_edro)||q(2,suw_mnro)||q(2,prl_edro)||q(2,prl_mnvr)||q(2,prq_edro)||q(2,prq_mnvr)) &&
        w(3,"так слишком") &&
         q(4,prl_kred_sr) && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[390]++; print "R390"}; continue;};
 if ( q(1,pre_ro) && !(q(-1,gl_vzed)||q(-1,gl_ed)||q(3,gl_ed)) &&
      (q(2,mest_ro)||q(2,suw_edro)||q(2,suw_mnro)||q(2,prl_edro)||q(2,prl_mnvr)||q(2,prq_edro)||q(2,prq_mnvr)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[391]++; print "R391"}; continue;};
 if ( w(1,"кроме") && sc(0,",") &&
         cap(2) && s(1,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); if(dbg){r[392]++; print "R392"}; continue;};


 # дееп =============================================================
 if ( (q(1,prl_srav)||q(1,nar_opst)) &&
        q(2,deep) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[393]++; print "R393"}; continue;};
 if ( q(1,deep) &&
      (q(2,gl_nemn)||q(2,gl_pnmn)||q(2,gl_pemn)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[394]++; print "R394"}; continue;};
 if ( q(-2,deep) &&
       q(-1,mest_vi) &&
        q(1,prl_srav) && s(-2,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[395]++; print "R395"}; continue;};
 if ( q(-1,deep) &&
       q(1,pre_vi) && 
       (q(2,prl_ediv)||q(2,prl_edvr)||q(2,prl_mnvr)||q(2,prl_mniv)||q(2,suw_edvi)||q(2,suw_odmnvr)||q(2,suw_nomniv)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[396]++; print "R396"}; continue;};
 if ( q(-1,deep) &&
       q(1,pre_pr) && 
       (q(2,prl_edpr)||q(2,prl_mnpr)||q(2,suw_edpr)||q(2,suw_mnpr)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[397]++; print "R397"}; continue;};
 if ( q(-1,deep) &&
       q(1,pre_tv) && 
       (q(2,prl_edtv)||q(2,prl_mntv)||q(2,suw_edtv)||q(2,suw_mntv)||q(2,mest_tv)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[398]++; print "R398"}; continue;};
 if ( q(-1,deep) &&
       q(1,prl_srav) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[399]++; print "R399"}; continue;};
 if ( q(-1,deep) &&
       q(1,gl_nepm) && s(-1,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[400]++; print "R400"}; continue;};
 if ( q(-1,deep) && s(-1,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[401]++; print "R401"}; continue;};
 if ( q(1,deep) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[402]++; print "R402"}; continue;};
 if ( q(-1,gl_nemn) && 
      (q(1,prl_mniv)||q(1,prq_mniv)||q(1,prl_mnvr)||q(1,prq_mnvr)||q(1,prl_krmn)) &&
        q(2,deep) && s(-1,0) && sc(1,",") )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[403]++; print "R403"}; continue;};

 # Все + ... + глагол ============================================
 # все + ... + гл.мн.
 if ( (q(1,qast)||q(1,nar_obme)||q(1,nar_opka)||q(1,nar_obvr)||q(1,nar_opsp)) &&
       (q(2,gl_vzmn)||q(2,gl_nemn)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[404]++; print "R404"}; continue;};
 if ( q(1,nar_obvr) &&
       q(2,nar_obvr) &&
       (q(3,gl_vzmn)||q(3,gl_nemn)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[405]++; print "R405"}; continue;};
 if ( (q(-1,gl_vzed)||q(-1,gl_vzmn)||q(-1,gl_nemn)) &&
        q(1,prl_srav) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[406]++; print "R406"}; continue;};
 if ( q(1,nar_srav) &&
      (q(2,gl_vzmn)||q(2,gl_nemn)||q(2,gl_pemn)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[407]++; print "R407"}; continue;};
 if ( (q(-1,suw_odmnim)||q(-1,suw_nomniv)) && cap(-1) &&
       (q(1,gl_vzmn)||q(1,gl_nemn)) && s(0,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[408]++; print "R408"}; continue;};
 if ( (q(-1,suw_edim)||q(-1,suw_nomniv)) &&
       (q(1,gl_vzmn)||q(1,gl_nemn)) && s(-1,0) && p(1) )
 { sub(/([Ее])/, "ё", l[i]); if(dbg){r[409]++; print "R409"}; continue;};
 if ( (q(-3,suw_edim)||q(-3,suw_odmnim)||q(-3,suw_nomniv)) &&
        q(-2,pre_pr) &&
        (q(-1,suw_edpr)||q(-1,suw_mnpr)) &&
         (q(1,gl_vzmn)||q(1,gl_nemn)) && s(0,0) && p(1) )
 { sub(/([Ее])/, "ё", l[i]); if(dbg){r[410]++; print "R410"}; continue;};


 # Всё + ... + глагол.мн + дополнение ============================
 if ( q(1,gl_nemn) &&
       q(2,nar_opka) &&
        q(3,prq_krmn) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[411]++; print "R411"}; continue;};
 if ( q(1,gl_nemn) &&
       q(2,prl_krmn) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[412]++; print "R412"}; continue;};
 if ( (q(1,gl_pemn)||q(1,gl_pnmn)) &&
       (q(2,suw_edro)||q(2,suw_mnro)||q(2,suw_odmnvr)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[413]++; print "R413"}; continue;};

 if ( (q(1,gl_pemn)||q(1,gl_pnmn)) &&
       (q(2,suw_edtv)||q(2,suw_mntv)||q(2,suw_edda)||q(2,suw_mnda)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[414]++; print "R414"}; continue;};

 # все + гл.мн и/или гл.мн
 if ( (q(1,gl_pemn)||q(1,gl_nemn)||q(1,gl_pnmn)||q(1,gl_vzmn)) &&
        w(2,"и") &&
        (q(3,gl_pemn)||q(3,gl_nemn)||q(3,gl_pnmn)||q(3,gl_vzmn)) && s(0,2) && qq(1,3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[415]++; print "R415"}; continue;};
 if ( q(-2,mest_mnim) && w(-1,"то") && se(-2,"-") &&
      (q(1,gl_pemn)||q(1,gl_nemn)||q(1,gl_pnmn)||q(1,gl_vzmn)) &&
        w(2,"и") &&
        (q(3,gl_pemn)||q(3,gl_nemn)||q(3,gl_pnmn)||q(3,gl_vzmn)) && s(0,2) )
 { sub(/([Ее])/, "ё", l[i]); if(dbg){r[416]++; print "R416"}; continue;};
 if ( q(-1,mest_mnim) &&
      (q(1,gl_pemn)||q(1,gl_nemn)||q(1,gl_pnmn)||q(1,gl_vzmn)) &&
        w(2,"и") &&
        (q(3,gl_pemn)||q(3,gl_nemn)||q(3,gl_pnmn)||q(3,gl_vzmn)) && s(0,2) )
 { sub(/([Ее])/, "ё", l[i]); if(dbg){r[417]++; print "R417"}; continue;};
 if ( w(1,"и") &&
      (q(2,gl_pemn)||q(2,gl_nemn)||q(2,gl_pnmn)||q(2,gl_vzmn)) && Q(2,gl_govmn) &&
        w(3,"и") &&
        (q(4,gl_pemn)||q(4,gl_nemn)||q(4,gl_pnmn)||q(4,gl_vzmn)) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[418]++; print "R418"}; continue;};
 if ( (q(1,gl_pemn)||q(1,gl_nemn)||q(1,gl_pnmn)||q(1,gl_vzmn)) && Q(1,gl_govmn) &&
        w(2,"и") &&
        (q(3,gl_pemn)||q(3,gl_nemn)||q(3,gl_pnmn)||q(3,gl_vzmn)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[419]++; print "R419"}; continue;};

 # гл.ед + ... + всё
 if ( (q(-1,gl_ed)||q(-1,gl_in)) &&
       (q(1,nar_obvr)||q(1,nar_obme)||q(1,nar_opsp)||q(1,nar_srav)||q(1,nar_opka)||q(1,suw_edvi)) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[420]++; print "R420"}; continue;};
 # гл.ед + всё
 if ( (q(-2,gl_ed)||q(-2,gl_in)) &&
        q(-1,mest_da) &&
         q(1,pre_pr) &&
         (q(2,prl_edpr)||q(2,prl_mnvr)||q(2,suw_edpr)||q(2,suw_mnpr)) && s(-2,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[421]++; print "R421"}; continue;};
 # гл.ед + всё
 if ( (q(-1,gl_ed)||q(-1,gl_in)) &&
       (q(1,suw_nomniv)||q(1,suw_odmnvr)) && s(-1,0) && W(1,"новые") )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[422]++; print "R422"}; continue;};

 # Всё + ... + глагол.ед ============================================
 if ( (q(1,nar_obvr)||q(1,nar_obme)||q(1,nar_opsp)||q(1,nar_srav)||q(1,nar_opka)||q(3,nar_opst)) &&
        q(2,gl_edsr) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[423]++; print "R423"}; continue;};
 if ( q(1,pre_tv) &&
       (q(2,mest_tv)||q(2,suw_edtv)||q(2,suw_mntv)) &&
         q(3,prl_edsrim) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[424]++; print "R424"}; continue;};
 if ( q(-1,gl_edsr) && s(-1,-1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[425]++; print "R425"}; continue;};
 if ( q(1,gl_vzed) && Q(1,gl_vzmn) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[426]++; print "R426"}; continue;};
 if ( q(1,prl_kred_sr) &&
       q(2,gl_in) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[427]++; print "R427"}; continue;};
 if ( q(-1,gl_vzed) &&
      (q(1,pre_vi)||q(1,pre_ro)||q(1,pre_tv)) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[428]++; print "R428"}; continue;};
 if ( sc(0,",") &&
       q(-1,gl_vzed) && s(-1,-1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[429]++; print "R429"}; continue;};
 if ( q(1,qast) &&
       q(2,qast) &&
       (q(3,nar_obvr)||q(3,nar_obme)||q(3,nar_opsp)||q(3,nar_srav)||q(3,nar_opka)||q(3,suw_edvi)||q(3,mest_ed)) &&
        (q(4,gl_ed)||q(4,gl_in)) && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[430]++; print "R430"}; continue;};
 if ( q(1,qast) &&
       q(2,qast) &&
       (q(3,nar_obvr)||q(3,nar_obme)||q(3,nar_opsp)||q(3,nar_srav)||q(3,nar_opka)||q(3,suw_edvi)||q(3,mest_ed)) &&
         q(4,qast) &&
         (q(5,gl_ed)||q(5,gl_in)) && s(0,4) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[431]++; print "R431"}; continue;};
 if ( q(1,qast) &&
      (q(2,nar_obvr)||q(2,nar_obme)||q(2,nar_opsp)||q(2,nar_srav)||q(2,nar_opka)||q(2,suw_edvi)||q(2,mest_ed)) &&
       (q(3,gl_ed)||q(3,gl_in)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[432]++; print "R432"}; continue;};
 if ( q(1,qast) &&
      (q(2,nar_obvr)||q(2,nar_obme)||q(2,nar_opsp)||q(2,nar_srav)||q(2,nar_opka)||q(2,suw_edvi)||q(2,mest_ed)) &&
        q(3,qast) &&
        (q(4,gl_ed)||q(4,gl_in)) && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[433]++; print "R433"}; continue;};
 if ( q(-2,mest_mnim) &&
      (q(-1,gl_pnmn)) &&
       (q(1,nar_obvr)||q(1,nar_obme)||q(1,nar_opsp)||q(1,nar_srav)||q(1,nar_opka)||q(1,suw_edvi)||q(1,mest_ed)) && s(-2,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[434]++; print "R434"}; continue;};
 if ( (q(1,nar_obvr)||q(1,nar_obme)||q(1,nar_opsp)||q(1,nar_srav)||q(1,nar_opka)||q(1,suw_edvi)||q(1,mest_ed)) &&
        q(2,qast) &&
        (q(3,gl_ed)||q(3,gl_in)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[435]++; print "R435"}; continue;};
 if ( q(-1,gl_nemn) &&
       q(1,gl_in) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[436]++; print "R436"}; continue;};
 if ( q(-1,gl_nemn) &&
       q(1,qast) &&
        q(2,gl_in) && s(-1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[437]++; print "R437"}; continue;};
 if ( q(1,nar_obme) &&
       q(2,mest_da) &&
        q(3,gl_ed) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[438]++; print "R438"}; continue;};
 if ( q(1,nar_obme) &&
       q(2,mest_da) &&
        q(3,qast) &&
         q(4,gl_ed) && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[439]++; print "R439"}; continue;};
 if ( q(1,nar_obme) &&
       q(2,gl_pnmn) &&
        q(3,gl_in) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[440]++; print "R440"}; continue;};
 if ( q(1,nar_obme) &&
       q(2,gl_pnmn) &&
        q(3,qast) &&
         q(4,gl_in) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[441]++; print "R441"}; continue;};
 if ( (q(1,gl_pnmn)||q(1,gl_pemn)) &&
       q(2,gl_in) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[442]++; print "R442"}; continue;};
 if ( (q(1,gl_pnmn)||q(1,gl_pemn)) &&
       q(2,qast) &&
        q(3,gl_in) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[443]++; print "R443"}; continue;};
 if ( (q(1,gl_ed)||q(1,gl_in)) && s(0,0) && cap(0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[444]++; print "R444"}; continue;};
 if ( q(-2,pre_ro) &&
       q(-1,mest_ro) &&
       (q(1,gl_ed)||q(1,gl_in)) && s(-2,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[445]++; print "R445"}; continue;};
 if ( q(1,qast) &&
      (q(2,gl_ed)||q(2,gl_in)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[446]++; print "R446"}; continue;};
 if ( q(-3,gl_ed) &&
       w(-2,"бы") &&
        q(-1,mest_mnvi) &&
        (q(1,gl_ed)||q(1,gl_in)) && s(-3,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[447]++; print "R447"}; continue;};
 if ( q(-2,gl_ed) &&
       q(-1,mest_mnvi) &&
       (q(1,gl_ed)||q(1,gl_in)) && s(-2,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[448]++; print "R448"}; continue;};
 if ( q(-1,mest_mnvi) &&
      (q(1,gl_ed)||q(1,gl_in)) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[449]++; print "R449"}; continue;};
 if ( (q(1,gl_ed)||q(1,gl_in)) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[450]++; print "R450"}; continue;};
 if (  (q(1,nar_obvr)||q(1,nar_obme)||q(1,nar_opsp)||q(1,nar_opst)||q(1,nar_srav)||q(1,nar_opka)) &&
        (q(2,gl_ed)||q(2,gl_in)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[451]++; print "R451"}; continue;};


 # все + ... + перех глагол ============================================
 if ( q(1,mest_mn) &&
      (q(2,gl_pemn)||q(2,gl_pnmn)) &&
        w(3,"о об") &&
        (q(4,mest_pr)||q(4,suw_edtv)||q(4,suw_mntv)) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[452]++; print "R452"}; continue;};
 if ( (q(1,gl_pemn)||q(1,gl_pnmn)) &&
        w(2,"о об") &&
        (q(3,mest_pr)||q(3,suw_edtv)||q(3,suw_mntv)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[453]++; print "R453"}; continue;};
 if ( q(1,mest_vi) &&
      (q(2,gl_pemn)||q(2,gl_pnmn)) &&
       (q(3,suw_odmnim)||q(3,suw_nomniv)||q(3,prl_mniv)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[454]++; print "R454"}; continue;};
 if ( q(1,mest_vi) &&
      (q(2,gl_pemn)||q(2,gl_pnmn)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[455]++; print "R455"}; continue;};
 if ( l[i+1]~/..ы$/ &&
      (q(2,gl_pemn)||q(2,gl_pnmn)||q(2,gl_nemn)||q(2,gl_vzmn)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[456]++; print "R456"}; continue;};
 if ( q(1,mest_vi) &&
       q(2,qast) &&
       (q(3,gl_pemn)||q(3,gl_pnmn)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[457]++; print "R457"}; continue;};
 if (q(1,gl_pemn) &&
     (q(2,prl_ediv)||q(2,prl_edvr)||q(2,prl_mniv)||q(2,prq_mniv)||q(2,prl_mnvr)||q(2,prq_mnvr)) &&
      (q(3,suw_edvi)||q(3,suw_odmnvr)||q(3,suw_nomniv)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[458]++; print "R458"}; continue;};
 if (q(1,qast) &&
      q(2,gl_pemn) &&
      (q(3,prl_ediv)||q(3,prl_edvr)||q(3,prl_mniv)||q(3,prq_mniv)||q(3,prl_mnvr)||q(3,prq_mnvr)) &&
       (q(4,suw_edvi)||q(4,suw_odmnvr)||q(4,suw_nomniv)) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[459]++; print "R459"}; continue;};
 if (q(1,mest_mnim) &&
     (q(2,gl_pemn)||q(2,gl_pnmn)) &&
      (q(3,prl_ediv)||q(3,prl_edvr)||q(3,prl_mniv)||q(3,prq_mniv)||q(3,prl_mnvr)||q(3,prq_mnvr)) &&
       (q(4,suw_edvi)||q(4,suw_odmnvr)||q(4,suw_nomniv)) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[460]++; print "R460"}; continue;};
 if (q(1,mest_mnim) &&
     (q(2,gl_pemn)||q(2,gl_pnmn)) &&
      (q(3,prl_ediv)||q(3,prl_edvr)||q(3,prl_mniv)||q(3,prq_mniv)||q(3,prl_mnvr)||q(3,prq_mnvr)) &&
       (q(4,prl_ediv)||q(4,prl_edvr)||q(4,prl_mniv)||q(4,prq_mniv)||q(4,prl_mnvr)||q(4,prq_mnvr)) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[461]++; print "R461"}; continue;};
 if (q(1,mest_mnim) &&
      q(2,qast) &&
      (q(3,gl_pemn)||q(3,gl_pnmn)) &&
       (q(4,prl_ediv)||q(4,prl_edvr)||q(4,prl_mniv)||q(4,prq_mniv)||q(4,prl_mnvr)||q(4,prq_mnvr)) &&
        (q(5,suw_edvi)||q(5,suw_odmnvr)||q(5,suw_nomniv)) && s(0,4) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[462]++; print "R462"}; continue;};
 if (q(1,gl_pnmn) &&
      q(2,pre_vi) &&
       q(3,suw_edvi) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[463]++; print "R463"}; continue;};
 if ( (q(1,gl_nemn)||q(1,gl_pnmn)||q(1,gl_pemn)) &&
        q(2,nar_srav) && s(0,1) && p(2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[464]++; print "R464"}; continue;};
 if ( (q(-1,suw_odmnim)||q(-1,suw_nomniv)) &&
       (q(1,gl_nemn)||q(1,gl_pnmn)||q(1,gl_pemn)) &&
         q(2,pre_pr) &&
         (q(3,suw_edpr)||q(3,suw_edme)) && s(-1,2) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[465]++; print "R465"}; continue;};
 if ( (q(1,gl_nemn)||q(1,gl_pnmn)||q(1,gl_pemn)) &&
        q(2,pre_pr) &&
        (q(3,suw_edpr)||q(3,suw_edme)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[466]++; print "R466"}; continue;};
 if (q(1,qast) &&
      q(2,gl_pnmn) &&
       q(3,pre_vi) &&
        q(4,suw_edvi) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[467]++; print "R467"}; continue;};
 if (q(1,gl_pnmn) &&
      q(2,pre_vi) &&
       q(3,mest_vi) &&
        q(4,suw_edvi) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[468]++; print "R468"}; continue;};
 if (q(1,qast) &&
      q(2,gl_pnmn) &&
       q(3,pre_vi) &&
        q(4,mest_vi) &&
         q(5,suw_edvi) && s(0,4) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[469]++; print "R469"}; continue;};
 if (q(1,gl_pnmn) &&
      q(2,pre_vi) &&
       q(3,mest_vi) && s(0,2) && p(3) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[470]++; print "R470"}; continue;};
 if (q(1,pre_vi) &&
      q(2,mest_vi) &&
       q(3,gl_pnmn) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[471]++; print "R471"}; continue;};
 if (q(1,pre_vi) &&
      q(2,mest_vi) &&
       q(3,qast) &&
        q(4,gl_pnmn) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[472]++; print "R472"}; continue;};
 if (q(1,pre_tv) &&
      q(2,mest_tv) &&
       q(3,nar_mest) &&
        q(4,gl_vzmn) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[473]++; print "R473"}; continue;};
 if (q(1,pre_pr) &&
     (q(2,prl_edpr)||q(2,prl_mnvr)) &&
      (q(3,suw_edpr)||q(3,suw_mnpr)) &&
        q(4,gl_ed) && s(0,3) )
 { sub(/([Ее])/, "ё", l[i]); if(dbg){r[474]++; print "R474"}; continue;};
 if (q(1,pre_pr) &&
     (q(2,prl_edpr)||q(2,prl_mnvr)) &&
      (q(3,suw_edpr)||q(3,suw_mnpr)) &&
       (q(4,gl_vzmn)||q(4,gl_nemn)) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[475]++; print "R475"}; continue;};
 if ( (q(1,gl_pemn)||q(1,gl_pnmn)) &&
        q(2,mest_vi) &&
        (q(3,prl_ediv)||q(3,prl_edvr)||q(3,prl_mniv)||q(3,prq_mniv)||q(3,prl_mnvr)||q(3,prq_mnvr)||q(3,suw_edvi)||q(3,suw_nomniv)||q(3,suw_odmnvr)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[476]++; print "R476"}; continue;};
 if (q(1,qast) &&
     (q(2,gl_pemn)||q(2,gl_pnmn)) &&
       q(3,mest_vi) &&
       (q(4,prl_ediv)||q(4,prl_edvr)||q(4,prl_mniv)||q(4,prq_mniv)||q(4,prl_mnvr)||q(4,prq_mnvr)||q(4,suw_edvi)||q(4,suw_nomniv)||q(4,suw_odmnvr)) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[477]++; print "R477"}; continue;};
 if ( (q(1,gl_pemn)||q(1,gl_pnmn)) && cap(0) &&
       (q(2,suw_edvi)||q(2,suw_nomniv)||q(2,suw_odmnvr)||q(2,mest_vi)) &&
         q(3,gl_in) && s(0,2) )
 { sub(/([Ее])/, "ё", l[i]); if(dbg){r[478]++; print "R478"}; continue;};
 if ( (q(1,gl_pemn)||q(1,gl_pnmn)) &&
       (q(2,suw_edvi)||q(2,suw_nomniv)||q(2,suw_odmnvr)||q(2,mest_vi)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[479]++; print "R479"}; continue;};
 if (q(-1,mest_da) &&
     (q(1,suw_edvi)||q(1,suw_nomniv)||q(1,suw_odmnvr)) &&
      (q(2,gl_pemn)||q(2,gl_pnmn)) && s(-1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[480]++; print "R480"}; continue;};
 if ((q(1,qast)||q(1,mest_da)) &&
      (q(2,gl_pemn)||q(2,gl_pnmn)) &&
       (q(3,suw_edvi)||q(3,suw_nomniv)||q(3,suw_odmnvr)||q(3,mest_vi)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[481]++; print "R481"}; continue;};



 # всё то, что
 if ( w(1,"то") && sc(1,",") &&
       q(2,mest_edsr) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[482]++; print "R482"}; continue;};
 # всё, что
 if ( sc(0,",") &&
       q(1,mest_edsr) && W(2,"есть") )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[483]++; print "R483"}; continue;};
 # все те, кто
 if ( w(1,"те") && sc(1,",") &&
       (q(1,mest_edmu)||q(1,mest_edze)) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[484]++; print "R484"}; continue;};
 # все, кто
 if ( sc(0,",") &&
       (q(1,mest_edmu)||q(1,mest_edze)) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[485]++; print "R485"}; continue;};
 # учитывало всё, кроме
 if ( q(-1,gl_ed) && s(-1,-1) &&
       sc(0,",") &&
        w(1,"кроме") )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[486]++; print "R486"}; continue;};

 # все, которые
 if ( sc(0,",") &&
      (q(1,mest_da)||q(1,suw_edda)||q(1,suw_mnda)) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[487]++; print "R487"}; continue;};
 if ( sc(0,",") &&
      (q(1,mest_mn)||q(1,prq_mniv)) && W(1,"мы вы") )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[488]++; print "R488"}; continue;};

 # Ну всё,
 if ( w(-1,"ну") && s(-1,-1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[489]++; print "R489"}; continue;};


 # гл.мн + все + ...  ============================================
 # гл.мн + все + ... + доп.
 if ( (q(-1,gl_vzmn)||q(-1,gl_nemn)) &&
        sc(0,",") &&
        (q(1,nar_obme)||q(1,nar_opka)||q(1,nar_obvr)||q(1,nar_opsp)||q(1,mest_mn)||q(1,suw_edda)) && s(-1,-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[490]++; print "R490"}; continue;};
 if ( (q(1,gl_pemn)) && sc(1,",") &&
        w(2,"что") && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[491]++; print "R491"}; continue;};
 if ( (q(-1,gl_vzmn)||q(-1,gl_nemn)) && s(-1,-1) &&
        sc(0,",") )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[492]++; print "R492"}; continue;};
          

 # ... + всё[;.?!]
 if ( (w(-1,"и")||q(-1,mest_ed)||q(-1,nar_obvr)) && s(-1,-1) && cap(-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[493]++; print "R493"}; continue;};

 if ( (q(-1,gl_vzmn)||q(-1,gl_nemn)) && s(-1,-1) && p(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[494]++; print "R494"}; continue;};

 if ( (q(-1,gl_ed)||q(-1,gl_in)) && s(-1,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[495]++; print "R495"}; continue;};

 # гл.ед + всё
 if ( (q(-1,gl_ed)||q(-1,gl_in)) && s(-1,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[496]++; print "R496"}; continue;};

 if ( w(1,"были") && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[497]++; print "R497"}; continue;};

 # вводные предложения ----------------------------------------------------
 if ( vv(0) &&
      (q(vvn+1,suw_odmnim)||q(vvn+1,suw_nomniv)) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[498]++; print "R498"}; continue;};
 if ( q(1,mest_mnim) && vv(1) &&
      (q(vvn+1,nar_opsp)||q(vvn+1,prl_kred_sr)) &&
        q(vvn+2,prl_krmn) && s(0,0) && s(vvn+1,vvn+1) && p(vvn+2) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[499]++; print "R499"}; continue;};
 if ( q(1,mest_mnim) && vv(1) &&
       q(vvn+1,gl_povzmn) && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[500]++; print "R500"}; continue;};
 if ( q(1,mest_mnim) && vv(1) &&
       q(vvn+1,nar_obme) &&
        q(vvn+2,nar_obme) && s(0,0) && s(vvn+1,vvn+1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[501]++; print "R501"}; continue;};
 if ( vv(1) &&
       q(vvn+1,gl_edsr) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[502]++; print "R502"}; continue;};
 if ( vv(0) && (q(vvn+1,gl_vzmn)||q(vvn+1,gl_nemn)) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[503]++; print "R503"}; continue;};

 # поиск вперёд ----------------------------------------------------------
 if ( qf(7,gl_edsr) &&
       (q(qfn+1,prl_kred_sr)||q(qfn+1,suw_edtv)) && s(0,qfn) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[504]++; print "R504"}; continue;};
 if ( qf(7,gl_nemn) &&
       q(qfn+1,prq_krmn) && s(0,qfn) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[505]++; print "R505"}; continue;};
 if ( qf(5,gl_edsr) && s(0,qfn-1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[506]++; print "R506"}; continue;};
 if ( q(1,mest_it) &&
       q(2,mest_da) &&
        qf(7,prl_kred_sr) && s(0,qfn-1) && p(qfn) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[507]++; print "R507"}; continue;};
 if ( q(1,mest_mn) &&
       qf(6,gl_vzmn) && s(0,qfn-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[508]++; print "R508"}; continue;};
 if ( qf(5,gl_vzmn) && s(0,qfn-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[509]++; print "R509"}; continue;};

 #--- фразы ----------------------------------------------------

 # поиск назад ------------------------------------------------------------
 if ( q(1,pre_ro) && qb(-4,mest_mn) &&
      (q(2,suw_edro)||q(2,suw_mnro)||q(2,suw_odmnvr)) && s(qbn,1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[510]++; print "R510"}; continue;};
 if ( qb(-7,mest_im) &&
       phs(-1,"как и") && s(-2,-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[511]++; print "R511"}; continue;};
 if ( (qb(-5,suw_odmnim)||qb(-5,suw_nomniv)) &&
        q(1,pre_pr) &&
        (q(2,mest_pr)||q(2,suw_edtv)||q(2,suw_mntv)) && s(qbn,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[512]++; print "R512"}; continue;};
 if ( (qb(-5,prl_krmn)||qb(-5,mest_mnim)) && pv(qbn,0,".") &&
       (q(1,prl_kred_sr)||q(1,prl_edsrim)) && s(0,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[513]++; print "R513"}; continue;};

 # Конечное подбирание хвостов ----------------------------------------------
 if ( (q(1,nar_opsp)||q(1,nar_obna)||q(1,nar_opst)) && s(0,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[514]++; print "R514"}; continue;};
 if ( (q(1,suw_odmnim)||q(1,suw_nomniv)) && (q(1,prl_mniv)||q(1,prl_mnvr)) && W(1,"новые") && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[515]++; print "R515"}; continue;};
 if ( (q(1,prq_mniv)||q(1,prq_krmn)) && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[516]++; print "R516"}; continue;};
 if ( (q(1,gl_vzmn)||q(1,gl_nemn)) && s(0,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[517]++; print "R517"}; continue;};

 # короткие предложения
 if (i<=5 && prevyo[FNR-1])
 { sub(/[Ее]/, "ё", l[i]); if(dbg){r[518]++; print "R518"}; continue;};

 # короткие предложения
 if (i<=5 && prevje[FNR-1])
 { sub(/([Ее])/, "<_&_>", l[i]); if(dbg){r[519]++; print "R519"; print i}; continue;};


             }; delete wpos;

 # всё/все́ в предыдущей строке
 for (k = 0; k <= 9; k++) {
    if (nf-k > 1) { seeklast = tolower(l[nf-k]);
        if (seeklast == "всё"    ) {prevyo[FNR] = 1; break};
        if (seeklast == "вс<_е_>") {prevje[FNR] = 1; break};
        }; };

 # вывести изменённую строку
 $0 = joinpat(l, sep, nf)
 $0 = gensub(/<_([Ее])_>/, "\\1\xcc\x81", "g", $0)
 print $0 

 }

 END {
 #dbg = 1
 #dbgstat = 1
 if (dbgstat==1) {for (i=1; i<=519; i++) { printf ("%s%s %s %s\n", "R", i, "=", r[i]) }; };

 
  }
