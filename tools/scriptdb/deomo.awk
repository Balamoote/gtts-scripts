# Деомографизатор
# Читает файл словаря с морфологической информаций и заменяет омографы согласно правилам

# Перенумеровать правила в vim:
# let @a=1|%s/"R\zs\d\+\ze"/\=''.(@a+setreg('a',@a+1))/g|%s/{r\[\zs\d\+\ze\]++; print "R\(\d\+\)"/\1/g|%s/(dbgstat==1) {for (i=1; i<=\zs\d\+\ze;/\=''.(@a-1)/g
#
# NB: во всех функциях поле указывается относительно 0, 0 - это позиция поискового слова. 

 # @: развести падежи сущ в ед.ч.

function joinpat(array, seps, nuf,    rett, i, k) # Склеить строку обратно
                { rett = seps [0]; for (i = 1; i <= nuf; i++) {rett = rett array[i] seps[i]}; return rett }
function pushar(arr, arrto,    k)                 # добывать массив выдать 1-й символ строки-сеператора
                { for (k in arr) {arrto[k]}; }
function sl(n,    rett)                           # выдать 1-й символ строки-сеператора
                { rett = substr(sep[i+n], 1, 1); return rett }
function lc(n,   rett)                            # перевести в нижний гегистр
                { rett = tolower(l[i+n]); return rett }
function q(n, array,    el, rett)                 # слово в массиве?
                { el=tolower(l[i+n]); if(el in array) {rett = 1} else {rett = 0}; return rett}
function qq(m, n,    rett)                        # слово m равно слово n?
                { if ( tolower(l[i+m]) == tolower(l[i+n]) ) {rett = 1} else {rett = 0}; return rett}
function qb(n, array,    el, k, rett)             # поиск на n шагов назад наличия слова в массиве
                { rett = 0; for (k=-1; k>=n; k--) { el = tolower(l[i+k]); if (el in array) {rett = 1; break}; }; return rett }
function qf(n, array,    el, k, rett)             # поиск на n шагов вперёд наличия слова в массиве
                { rett = 0; for (k= 1; k<=n; k++) { el = tolower(l[i+k]); if (el in array) {rett = 1; break}; }; return rett }
function Qb(n, array,    el, k, rett)             # поиск на n шагов назад отсутствия слова в массиве
                { rett = 1; for (k=-1; k>=n; k--) { el = tolower(l[i+k]); if (el in array) {rett = 0; break}; }; return rett }
function Qf(n, array,    el, k, rett)             # поиск на n шагов вперёд отсутствия слова в массиве
                { rett = 1; for (k= 1; k<=n; k++) { el = tolower(l[i+k]); if (el in array) {rett = 0; break}; }; return rett }
function Q(n, array,    el, rett)                 # слово НЕ в массиве?
                { el=tolower(l[i+n]); if (el in array) {rett = 0} else {rett = 1}; return rett }
function sc(n, sym,    el, k, rett)               # поиск символа в разделителе: "содержит"
                { el = sep[i+n]; if (el ~ sym)  {rett = 1} else {rett = 0}; return rett }
function se(n, sym,    el, k, rett)               # разделитель "равен"
                { el = sep[i+n]; if (el == sym) {rett = 1} else {rett = 0}; return rett }
function cap(n, array,    el, rett)               # Слово с заглавной буквы?
                { el = l[i+n]; if ( substr(el,1,1) ~ RUUC ) {rett = 1} else {rett = 0}; return rett }
function w(n, wl,    wrds, k, lk, rett)           # нахождение в списке? = "одно из слов"
                { lk=split(wl, wrds, "|"); for (k=1; k<=lk; k++) { if (tolower(l[i+n])==wrds[k]) {rett = 1; break} else {rett = 0};}; return rett }
function W(n, wl,    wrds, k, lk, rett)           # НЕнахождение в списке? != "одно из слов"
                { lk=split(wl, wrds, "|"); for (k=1; k<=lk; k++) { if (tolower(l[i+n])==wrds[k]) {rett = 0; break} else {rett = 1};}; return rett }
function p(n,    rett)                            # разделитель содержит препинаний?
                { if ( sep[i+n] ~ "[…,.:;!?—]" ) {rett = 1} else {rett = 0}; return rett }
function s(sta, fin,    k, rett)                  # разделители в диапазоне НЕ содержат препинаний? = пробел
                { rett = 1; for (k=sta; k<=fin; k++) { if (sep[i+k] ~ "[…,.:;!?—]" ) {rett = 0; break} else {rett = 1}; }; return rett }
function phs(n, wl,    wrds, k, lk, cnt, rett)    # кусок фразы ДО слова
                { lk = split(wl, wrds, " "); for (k=1; k<=lk; k++) {if (tolower(l[i-lk+k+n])==wrds[k]) {rett = 1} else {rett = 0; break};}; return rett }
function phf(n, wl,    wrds, k, lk, cnt, rett)    # кусок фразы ПОСЛЕ слова
                { lk = split(wl, wrds, " "); for (k=1; k<=lk; k++) {if (tolower(l[i+n+k-1])==wrds[k]) {rett = 1} else {rett = 0; break};}; return rett }
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

    # массивы для разных целей
    
    # части слов с дефисом для склейки
    h1   = "где докуда зачем из как когда кое кто кому кого кем куда откуда отчего по потому почему что сколько чего чему чье чьё чьем чьём чью"; 
    h2   = "где за зачем когда кое куда либо над нибудь никак откуда отчего под подо почему то что";
    split(h1, hy1, " "); for (i in hy1) {hyp1[hy1[i]]}; delete hy1;
    split(h2, hy2, " "); for (i in hy2) {hyp2[hy2[i]]}; delete hy2;

    # расширенное "это"
    ia   = "это то се сие оно сё";     split(ia, ib, " "); for (i in ib) {mest_it[ib[i]]}; delete ib;



    cmd = "zcat basedic.gz"; while((cmd|getline)>0) {
   if (substr($2,1,3) == "гл_") {
      if (substr($2,1,13) == "гл_сов_непер_") {

        if($2~  /^гл_/ && $2~ /_прош_ед_ср/              ){  gl_edsr    [$1];                           };
        if($2~  /^гл_сов_непер_буд_ед/                   ){  gl_ed      [$1];                  continue }; #gl_sonebued   [$1];
        if($2~  /^гл_сов_непер_буд_мн/                   ){  gl_nemn    [$1];                  continue }; #gl_sonebumn   [$1];
        if($2~  /^гл_сов_непер_инф$/                     ){  gl_in      [$1];                  continue }; #gl_sonein     [$1];
        if($2~  /^гл_сов_непер_инф_безл$/                ){  gl_in      [$1];                  continue }; #gl_soneinbe   [$1];
        if($2~  /^гл_сов_непер_пов_ед$/                  ){  gl_poed    [$1];                  continue }; #gl_sonepoed   [$1];
        if($2~  /^гл_сов_непер_пов_мн$/                  ){  gl_ponemn  [$1];                  continue }; #gl_sonepomn   [$1];
        if($2~  /^гл_сов_непер_прош_ед/                  ){  gl_ed      [$1];                  continue }; #gl_sonepred   [$1];
        if($2~  /^гл_сов_непер_прош_мн/                  ){  gl_nemn    [$1];                  continue }; #gl_soneprmn   [$1];
        if($2~  /^гл_сов_непер_воз_буд_ед/               ){  gl_ed      [$1]; gl_edvz [$1];    continue }; #gl_sonevzbued [$1];
        if($2~  /^гл_сов_непер_воз_буд_мн/               ){  gl_vzmn    [$1];                  continue }; #gl_sonevzbumn [$1];
        if($2~  /^гл_сов_непер_воз_инф$/                 ){  gl_in      [$1];                  continue }; #gl_sonevzin   [$1];
        if($2~  /^гл_сов_непер_воз_инф_безл$/            ){  gl_in      [$1];                  continue }; #gl_sonevzinbe [$1];
        if($2~  /^гл_сов_непер_воз_пов_ед$/              ){  gl_poed    [$1]; gl_edvz [$1];    continue }; #gl_sonevzpoed [$1];
        if($2~  /^гл_сов_непер_воз_пов_мн$/              ){  gl_ponemn  [$1];                  continue }; #gl_sonevzpomn [$1];
        if($2~  /^гл_сов_непер_воз_прош_ед/              ){  gl_ed      [$1]; gl_edvz [$1];    continue }; #gl_sonevzpred [$1];
        if($2~  /^гл_сов_непер_воз_прош_мн/              ){  gl_vzmn    [$1];                  continue }; #gl_sonevzprmn [$1];
      };
      if (substr($2,1,13) == "гл_сов_перех_") {

        if($2~  /^гл_сов_перех_буд_ед/                   ){  gl_ed      [$1];                  continue }; #gl_sopebued   [$1];
        if($2~  /^гл_сов_перех_буд_мн/                   ){  gl_pemn    [$1];                  continue }; #gl_sopebumn   [$1];
        if($2~  /^гл_сов_перех_инф$/                     ){  gl_in      [$1];                  continue }; #gl_sopein     [$1];
        if($2~  /^гл_сов_перех_инф_безл$/                ){  gl_in      [$1];                  continue }; #gl_sopeinbe   [$1];
        if($2~  /^гл_сов_перех_пов_ед$/                  ){  gl_poed    [$1];                  continue }; #gl_sopepoed   [$1];
        if($2~  /^гл_сов_перех_пов_мн$/                  ){  gl_popemn  [$1];                  continue }; #gl_sopepomn   [$1];
        if($2~  /^гл_сов_перех_прош_ед/                  ){  gl_ed      [$1];                  continue }; #gl_sopepred   [$1];
        if($2~  /^гл_сов_перех_прош_мн$/                 ){  gl_pemn    [$1];                  continue }; #gl_sopeprmn   [$1];
      };
      if (substr($2,1,13) == "гл_сов_перне_") {

        if($2~  /^гл_сов_перне_буд_ед/                   ){  gl_ed      [$1];                  continue }; #gl_sopnbued   [$1];
        if($2~  /^гл_сов_перне_буд_мн/                   ){  gl_pnmn    [$1];                  continue }; #gl_sopnbumn   [$1];
        if($2~  /^гл_сов_перне_инф$/                     ){  gl_in      [$1];                  continue }; #gl_sopnin     [$1];
        if($2~  /^гл_сов_перне_инф_безл$/                ){  gl_in      [$1];                  continue }; #gl_sopninbe   [$1];
        if($2~  /^гл_сов_перне_пов_ед$/                  ){  gl_poed    [$1];                  continue }; #gl_sopnpoed   [$1];
        if($2~  /^гл_сов_перне_пов_мн$/                  ){  gl_popnmn  [$1];                  continue }; #gl_sopnpomn   [$1];
        if($2~  /^гл_сов_перне_прош_ед/                  ){  gl_ed      [$1];                  continue }; #gl_sopnpred   [$1];
        if($2~  /^гл_сов_перне_прош_мн$/                 ){  gl_pnmn    [$1];                  continue }; #gl_sopnprmn   [$1];
      };
      if (substr($2,1,15) == "гл_несов_непер_") {

	if($2~  /^гл_несов_непер_наст_ед/                    ){  gl_ed      [$1];                  continue }; #gl_nsnenaed   [$1];
        if($2~  /^гл_несов_непер_наст_мн/                ){  gl_nemn    [$1];                  continue }; #gl_nsnenamn   [$1];
        if($2~  /^гл_несов_непер_инф$/                   ){  gl_in      [$1];                  continue }; #gl_nsnein     [$1];
        if($2~  /^гл_несов_непер_инф_безл$/              ){  gl_in      [$1];                  continue }; #gl_nsneinbe   [$1];
        if($2~  /^гл_несов_непер_пов_ед$/                ){  gl_poed    [$1];                  continue }; #gl_nsnepoed   [$1];
        if($2~  /^гл_несов_непер_пов_мн$/                ){  gl_ponemn  [$1];                  continue }; #gl_nsnepomn   [$1];
        if($2~  /^гл_несов_непер_прош_ед/                ){  gl_ed      [$1];                  continue }; #gl_nsnepred   [$1];
        if($2~  /^гл_несов_непер_прош_мн/                ){  gl_nemn    [$1];                  continue }; #gl_nsneprmn   [$1];
        if($2~  /^гл_несов_непер_воз_наст_ед/            ){  gl_ed      [$1]; gl_edvz [$1];    continue }; #gl_nsnevznaed [$1];
        if($2~  /^гл_несов_непер_воз_наст_мн/            ){  gl_vzmn    [$1];                  continue }; #gl_nsnevznamn [$1];
        if($2~  /^гл_несов_непер_воз_инф$/               ){  gl_in      [$1];                  continue }; #gl_nsnevzin   [$1];
        if($2~  /^гл_несов_непер_воз_инф_безл$/          ){  gl_in      [$1];                  continue }; #gl_nsnevzinbe [$1];
        if($2~  /^гл_несов_непер_воз_пов_ед$/            ){  gl_poed    [$1]; gl_edvz [$1];    continue }; #gl_nsnevzpoed [$1];
        if($2~  /^гл_несов_непер_воз_пов_мн$/            ){  gl_povzmn  [$1];                  continue }; #gl_nsnevzpomn [$1];
        if($2~  /^гл_несов_непер_воз_прош_ед/            ){  gl_ed      [$1]; gl_edvz [$1];    continue }; #gl_nsnevzpred [$1];
        if($2~  /^гл_несов_непер_воз_прош_мн/            ){  gl_vzmn    [$1];                  continue }; #gl_nsnevzprmn [$1];
      };
      if (substr($2,1,15) == "гл_несов_перех_") {

        if($2~  /^гл_несов_перех_наст_ед/                ){  gl_ed      [$1];                  continue }; #gl_nspenaed   [$1];
        if($2~  /^гл_несов_перех_наст_мн/                ){  gl_pemn    [$1];                  continue }; #gl_nspenamn   [$1];
        if($2~  /^гл_несов_перех_инф$/                   ){  gl_in      [$1];                  continue }; #gl_nspein     [$1];
        if($2~  /^гл_несов_перех_инф_безл$/              ){  gl_in      [$1];                  continue }; #gl_nspeinbe   [$1];
        if($2~  /^гл_несов_перех_пов_ед$/                ){  gl_poed    [$1];                  continue }; #gl_nspepoed   [$1];
        if($2~  /^гл_несов_перех_пов_мн$/                ){  gl_popemn  [$1];                  continue }; #gl_nspepomn   [$1];
        if($2~  /^гл_несов_перех_прош_ед/                ){  gl_ed      [$1];                  continue }; #gl_nspepred   [$1];
        if($2~  /^гл_несов_перех_прош_мн$/               ){  gl_pemn    [$1];                  continue }; #gl_nspeprmn   [$1];
      };
      if (substr($2,1,15) == "гл_несов_перне_") {

        if($2~  /^гл_несов_перне_наст_ед/                ){  gl_ed      [$1];                  continue }; #gl_nspnnaed   [$1];
        if($2~  /^гл_несов_перне_наст_мн/                ){  gl_pnmn    [$1];                  continue }; #gl_nspnnamn   [$1];
        if($2~  /^гл_несов_перне_инф$/                   ){  gl_in      [$1];                  continue }; #gl_nspnin     [$1];
        if($2~  /^гл_несов_перне_пов_ед$/                ){  gl_poed    [$1];                  continue }; #gl_nspnpoed   [$1];
        if($2~  /^гл_несов_перне_пов_мн$/                ){  gl_popnmn  [$1];                  continue }; #gl_nspnpomn   [$1];
        if($2~  /^гл_несов_перне_прош_ед/                ){  gl_ed      [$1];                  continue }; #gl_nspnpred   [$1];
        if($2~  /^гл_несов_перне_прош_мн$/               ){  gl_pnmn    [$1];                  continue }; #gl_nspnprmn   [$1];
      };
      if (substr($2,1,14) == "гл_2вид_непер_") {

        if($2~  /^гл_2вид_непер_буд_ед/                  ){  gl_ed      [$1];                  continue }; #gl_2vnebued   [$1];
        if($2~  /^гл_2вид_непер_буд_мн/                  ){  gl_nemn    [$1];                  continue }; #gl_2vnebumn   [$1];
        if($2~  /^гл_2вид_непер_наст_ед/                 ){  gl_ed      [$1];                  continue }; #gl_2vnenaed   [$1];
        if($2~  /^гл_2вид_непер_наст_мн/                 ){  gl_nemn    [$1];                  continue }; #gl_2vnenamn   [$1];
        if($2~  /^гл_2вид_непер_инф$/                    ){  gl_in      [$1];                  continue }; #gl_2vnein     [$1];
        if($2~  /^гл_2вид_непер_инф_безл$/               ){  gl_in      [$1];                  continue }; #gl_2vneinbe   [$1];
        if($2~  /^гл_2вид_непер_пов_ед$/                 ){  gl_poed    [$1];                  continue }; #gl_2vnepoed   [$1];
        if($2~  /^гл_2вид_непер_пов_мн$/                 ){  gl_ponemn  [$1];                  continue }; #gl_2vnepomn   [$1];
        if($2~  /^гл_2вид_непер_прош_ед/                 ){  gl_ed      [$1];                  continue }; #gl_2vnepred   [$1];
        if($2~  /^гл_2вид_непер_прош_мн/                 ){  gl_nemn    [$1];                  continue }; #gl_2vneprmn   [$1];
        if($2~  /^гл_2вид_непер_воз_буд_ед/              ){  gl_ed      [$1]; gl_edvz [$1];    continue }; #gl_2vnevznaed [$1];
        if($2~  /^гл_2вид_непер_воз_буд_мн/              ){  gl_vzmn    [$1];                  continue }; #gl_2vnevznamn [$1];
        if($2~  /^гл_2вид_непер_воз_наст_ед/             ){  gl_ed      [$1]; gl_edvz [$1];    continue }; #gl_2vnevznaed [$1];
        if($2~  /^гл_2вид_непер_воз_наст_мн/             ){  gl_vzmn    [$1];                  continue }; #gl_2vnevznamn [$1];
        if($2~  /^гл_2вид_непер_воз_инф$/                ){  gl_in      [$1];                  continue }; #gl_2vnevzin   [$1];
        if($2~  /^гл_2вид_непер_воз_пов_ед$/             ){  gl_poed    [$1]; gl_edvz [$1];    continue }; #gl_2vnevzpoed [$1];
        if($2~  /^гл_2вид_непер_воз_пов_мн$/             ){  gl_povzmn  [$1]; gl_vzmn [$1];    continue }; #gl_2vnevzpomn [$1];
        if($2~  /^гл_2вид_непер_воз_прош_ед/             ){  gl_ed      [$1]; gl_edvz [$1];    continue }; #gl_2vnevzpred [$1];
        if($2~  /^гл_2вид_непер_воз_прош_мн/             ){  gl_vzmn    [$1];                  continue }; #gl_2vnevzprmn [$1];
      };
      if (substr($2,1,14) == "гл_2вид_перех_") {

        if($2~  /^гл_2вид_перех_буд_ед/                  ){  gl_ed      [$1];                  continue }; #gl_2vpebued   [$1];
        if($2~  /^гл_2вид_перех_буд_мн/                  ){  gl_pemn    [$1];                  continue }; #gl_2vpebumn   [$1];
        if($2~  /^гл_2вид_перех_наст_ед/                 ){  gl_ed      [$1];                  continue }; #gl_2vpenaed   [$1];
        if($2~  /^гл_2вид_перех_наст_мн/                 ){  gl_pemn    [$1];                  continue }; #gl_2vpenamn   [$1];
        if($2~  /^гл_2вид_перех_инф$/                    ){  gl_in      [$1];                  continue }; #gl_2vpein     [$1];
        if($2~  /^гл_2вид_перех_пов_ед$/                 ){  gl_poed    [$1];                  continue }; #gl_2vpepoed   [$1];
        if($2~  /^гл_2вид_перех_пов_мн$/                 ){  gl_popemn  [$1];                  continue }; #gl_2vpepomn   [$1];
        if($2~  /^гл_2вид_перех_прош_ед/                 ){  gl_ed      [$1];                  continue }; #gl_2vpepred   [$1];
        if($2~  /^гл_2вид_перех_прош_мн$/                ){  gl_pemn    [$1];                  continue }; #gl_2vpeprmn   [$1];
      };
      if (substr($2,1,14) == "гл_2вид_перне_") {

        if($2~  /^гл_2вид_перне_буд_ед/                  ){  gl_ed      [$1];                  continue }; #gl_2vpnbued   [$1];
        if($2~  /^гл_2вид_перне_буд_мн/                  ){  gl_pnmn    [$1];                  continue }; #gl_2vpnbumn   [$1];
        if($2~  /^гл_2вид_перне_наст_ед/                 ){  gl_ed      [$1];                  continue }; #gl_2vpnnaed   [$1];
        if($2~  /^гл_2вид_перне_наст_мн/                 ){  gl_pnmn    [$1];                  continue }; #gl_2vpnnamn   [$1];
        if($2~  /^гл_2вид_перне_инф$/                    ){  gl_in      [$1];                  continue }; #gl_2vpnin     [$1];
        if($2~  /^гл_2вид_перне_пов_ед$/                 ){  gl_poed    [$1];                  continue }; #gl_2vpnpoed   [$1];
        if($2~  /^гл_2вид_перне_пов_мн$/                 ){  gl_popnmn  [$1];                  continue }; #gl_2vpnpomn   [$1];
        if($2~  /^гл_2вид_перне_прош_ед/                 ){  gl_ed      [$1];                  continue }; #gl_2vpnpred   [$1];
        if($2~  /^гл_2вид_перне_прош_мн$/                ){  gl_pnmn    [$1];                  continue }; #gl_2vpnprmn   [$1];
      };
   }; # конец блока глаголов

    if ((substr($2,1,4) == "сущ_")) {

        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /муж_им/  ){  suw_edmuim [$1]; suw_edim [$1];   continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /жен_им/  ){  suw_edzeim [$1]; suw_edim [$1];   continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /ср_им/   ){  suw_edsrim [$1]; suw_edim [$1];   continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /муж_вин/ ){  suw_edmuvi [$1]; suw_edvi [$1];   continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /жен_вин/ ){  suw_edzevi [$1]; suw_edvi [$1];   continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /ср_вин/  ){  suw_edsrvi [$1]; suw_edvi [$1];   continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /_дат/    ){  suw_edda   [$1];                  continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /_род/    ){  suw_edro   [$1];                  continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /_пр/     ){  suw_edpr   [$1];                  continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /_тв/     ){  suw_edtv   [$1];                  continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /_зват/   ){  suw_edzv   [$1];                  continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /_мест/   ){  suw_edme   [$1];                  continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /_нескл/  ){  suw_edne   [$1];                  continue };
        if($2~  /^сущ(_одуш|_неод)?_ед/ && $2~ /_счет/   ){  suw_edsq   [$1];                  continue };

        if($2~  /^сущ_одуш_мн_им$/                       ){  suw_odmnim [$1];                  continue };
        if($2~  /^сущ_неод_мн_им$/                       ){  suw_nomniv [$1];                  continue };
        if($2~  /^сущ(_неод)?_мн_вин$/                   ){  suw_nomniv [$1];                  continue };
        if($2~  /^сущ_одуш_мн_вин$/                      ){  suw_odmnvr [$1];                  continue };
        if($2~  /^сущ_одуш_мн_род$/                      ){  suw_odmnvr [$1];                  continue };
        if($2~  /^сущ(_неод)?_мн/       && $2~ /_род/    ){  suw_mnro   [$1];                  continue };
        if($2~  /^сущ(_одуш|_неод)?_мн/ && $2~ /_дат/    ){  suw_mnda   [$1];                  continue };
        if($2~  /^сущ(_одуш|_неод)?_мн/ && $2~ /_пр/     ){  suw_mnpr   [$1];                  continue };
        if($2~  /^сущ(_одуш|_неод)?_мн/ && $2~ /_тв/     ){  suw_mntv   [$1];                  continue };
        if($2~  /^сущ(_одуш|_неод)?_мн/ && $2~ /_нескл/  ){  suw_mnne   [$1];                  continue };
        if($2~  /^сущ(_одуш|_неод)?_мн/ && $2~ /_счет/   ){  suw_mnsq   [$1];                  continue };
    };

        if($2~  /^дееп_/                                 ){  deep       [$1];                  continue };

    if (substr($2,1,5) == "мест_") {
        if($2~  /_нар$/                                  ){  mest_nar   [$1];                  continue };

        if($2~  /_(прл|сущ)_им$/                         ){  mest_im    [$1];                  continue }; #mest_mi       [$1];
        if($2~  /_(прл|сущ)_вин$/                        ){  mest_vi    [$1]; mest_mnvi [$1];  continue }; #
        if($2~  /_(прл|сущ)_род$/                        ){  mest_ro    [$1];                  continue }; #mest_ro       [$1];
        if($2~  /_(прл|сущ)_дат$/                        ){  mest_da    [$1];                  continue }; #mest_da       [$1];
        if($2~  /_(прл|сущ)_тв$/                         ){  mest_tv    [$1];                  continue }; #mest_tv       [$1];
        if($2~  /_(прл|сущ)_пр$/                         ){  mest_pr    [$1];                  continue }; #mest_pr       [$1];
        if($2~  /_(прл|сущ)_мн$/                         ){  mest_mn    [$1];                  continue }; #mest_mn       [$1];

        if($2~  /_прл_ед_ср$/                            ){  mest_ed    [$1];                  continue }; #mest_sred     [$1];
        if($2~  /_прл_ед_жен$/                           ){  mest_ed    [$1];                  continue }; #mest_zeed     [$1];
        if($2~  /_прл_ед_муж$/                           ){  mest_ed    [$1];                  continue }; #mest_mued     [$1];

        if($2~  /_ед_муж_им$/                            ){  mest_im    [$1]; mest_ed [$1]; mest_edmu [$1];   continue }; #mest_edmuim   [$1];
        if($2~  /_ед_муж_вин$/                           ){  mest_vi    [$1]; mest_ed [$1]; mest_edmu [$1];   continue }; #mest_edmuvi   [$1];
        if($2~  /_ед_муж_вин_неод$/                      ){  mest_vi    [$1]; mest_ed [$1]; mest_edmu [$1];   continue }; #mest_ednomuvi [$1];
        if($2~  /_ед_муж_вин_одуш$/                      ){  mest_vi    [$1]; mest_ed [$1]; mest_edmu [$1];   continue }; #mest_edodmuvi [$1];
        if($2~  /_ед_муж_род$/                           ){  mest_ro    [$1]; mest_ed [$1]; mest_edmu [$1];   continue }; #mest_edmuro   [$1];
        if($2~  /_ед_муж_дат$/                           ){  mest_da    [$1]; mest_ed [$1]; mest_edmu [$1];   continue }; #mest_edmuda   [$1];
        if($2~  /_ед_муж_тв$/                            ){  mest_tv    [$1]; mest_ed [$1]; mest_edmu [$1];   continue }; #mest_edmutv   [$1];
        if($2~  /_ед_муж_пр$/                            ){  mest_pr    [$1]; mest_ed [$1]; mest_edmu [$1];   continue }; #mest_edmupr   [$1];
        if($2~  /_ед_жен_им$/                            ){  mest_im    [$1]; mest_ed [$1]; mest_edze [$1];   continue }; #mest_edzeim   [$1];
        if($2~  /_ед_жен_вин$/                           ){  mest_vi    [$1]; mest_ed [$1]; mest_edze [$1];   continue }; #mest_edzevi   [$1];
        if($2~  /_ед_жен_род$/                           ){  mest_ro    [$1]; mest_ed [$1]; mest_edze [$1];   continue }; #mest_edzero   [$1];
        if($2~  /_ед_жен_дат$/                           ){  mest_da    [$1]; mest_ed [$1]; mest_edze [$1];   continue }; #mest_edzeda   [$1];
        if($2~  /_ед_жен_тв$/                            ){  mest_tv    [$1]; mest_ed [$1]; mest_edze [$1];   continue }; #mest_edzetv   [$1];
        if($2~  /_ед_жен_пр$/                            ){  mest_pr    [$1]; mest_ed [$1]; mest_edze [$1];   continue }; #mest_edzepr   [$1];
        if($2~  /_ед_ср_им$/                             ){  mest_im    [$1]; mest_ed [$1]; mest_edsr [$1];   continue }; #mest_edsrim   [$1];
        if($2~  /_ед_ср_вин$/                            ){  mest_vi    [$1]; mest_ed [$1]; mest_edsr [$1];   continue }; #mest_edsrvi   [$1];
        if($2~  /_ед_ср_род$/                            ){  mest_ro    [$1]; mest_ed [$1]; mest_edsr [$1];   continue }; #mest_edsrro   [$1];
        if($2~  /_ед_ср_дат$/                            ){  mest_da    [$1]; mest_ed [$1]; mest_edsr [$1];   continue }; #mest_edsrda   [$1];
        if($2~  /_ед_ср_тв$/                             ){  mest_tv    [$1]; mest_ed [$1]; mest_edsr [$1];   continue }; #mest_edsrtv   [$1];
        if($2~  /_ед_ср_пр$/                             ){  mest_pr    [$1]; mest_ed [$1]; mest_edsr [$1];   continue }; #mest_edsrpr   [$1];
                                                                       
        if($2~  /_ед_им$/                                ){  mest_im    [$1]; mest_ed [$1];    continue }; #mest_edim     [$1];
        if($2~  /_ед_вин$/                               ){  mest_vi    [$1]; mest_ed [$1];    continue }; #mest_edvi     [$1];
        if($2~  /_ед_род$/                               ){  mest_ro    [$1]; mest_ed [$1];    continue }; #mest_edro     [$1];
        if($2~  /_ед_дат$/                               ){  mest_da    [$1]; mest_ed [$1];    continue }; #mest_edda     [$1];
        if($2~  /_ед_тв$/                                ){  mest_tv    [$1]; mest_ed [$1];    continue }; #mest_edtv     [$1];
        if($2~  /_ед_пр$/                                ){  mest_pr    [$1]; mest_ed [$1];    continue }; #mest_edpr     [$1];
                                                                       
        if($2~  /_мн_им$/                                ){  mest_im    [$1]; mest_mn [$1]; mest_mnim [$1];   continue }; #
        if($2~  /_мн_вин$/                               ){  mest_vi    [$1]; mest_mn [$1]; mest_mnvi [$1];   continue }; #
        if($2~  /_мн_вин_неод$/                          ){  mest_vi    [$1]; mest_mn [$1];    continue }; #mest_mn_novi  [$1];
        if($2~  /_мн_вин_одуш$/                          ){  mest_vi    [$1]; mest_mn [$1];    continue }; #mest_mn_odvi  [$1];
        if($2~  /_мн_род$/                               ){  mest_ro    [$1]; mest_mn [$1];    continue }; #mest_mn_ro    [$1];
        if($2~  /_мн_дат$/                               ){  mest_da    [$1]; mest_mn [$1];    continue }; #mest_mn_da    [$1];
        if($2~  /_мн_тв$/                                ){  mest_tv    [$1]; mest_mn [$1];    continue }; #mest_mn_tv    [$1];
        if($2~  /_мн_пр$/                                ){  mest_pr    [$1]; mest_mn [$1];    continue }; #mest_mn_pr    [$1];
        if($2~  /_сущ$/                                  ){  mest_suw   [$1];                  continue };
    };
    if (substr($2,1,4) == "нар_") {

        if($2~  /^нар_вопр$/                             ){  nar_vop    [$1];                   continue };
        if($2~  /^нар_обст_врем$/                        ){  nar_obvr   [$1];                   continue };
        if($2~  /^нар_обст_места$/                       ){  nar_obme   [$1];                   continue };
        if($2~  /^нар_обст_напр$/                        ){  nar_obna   [$1];                   continue };
        if($2~  /^нар_обст_причин$/                      ){  nar_obpr   [$1];                   continue };
        if($2~  /^нар_обст_цель$/                        ){  nar_obce   [$1];                   continue };
        if($2~  /^нар_опред_кач$/                        ){  nar_opka   [$1];                   continue };
        if($2~  /^нар_опред_спос$/                       ){  nar_opsp   [$1];                   continue };
        if($2~  /^нар_опред_степ$/                       ){  nar_opst   [$1];                   continue };
        if($2~  /^нар_прев$/                             ){  nar_prev   [$1];                   continue };
        if($2~  /^нар_сравн$/                            ){  nar_srav   [$1];                   continue };
    };
    if (substr($2,1,6) == "предл_") {

        if($2~  /^предл_вин$/                            ){  pre_vi     [$1];                   continue };
        if($2~  /^предл_дат$/                            ){  pre_da     [$1];                   continue };
        if($2~  /^предл_им$/                             ){  pre_im     [$1];                   continue };
        if($2~  /^предл_пр$/                             ){  pre_pr     [$1];                   continue };
        if($2~  /^предл_род$/                            ){  pre_ro     [$1];                   continue };
        if($2~  /^предл_тв$/                             ){  pre_tv     [$1];                   continue };
    };
    if (substr($2,1,4) == "прл_") {
       if(substr($2,1,6) == "прл_ед") {
        if($2~  /^прл_ед_муж_им$/                        ){  prl_ediv   [$1];                   continue }; #prl_edmuim        [$1];
        if($2~  /^прл_ед_жен_им$/                        ){  prl_ediv   [$1];                   continue }; #prl_edzeim        [$1];
        if($2~  /^прл_ед_ср_им$/                         ){  prl_ediv   [$1]; prl_edsrim [$1];  continue }; #
        if($2~  /^прл_ед_муж_вин_одуш$/                  ){  prl_edvr   [$1];                   continue }; #prl_odedmuvi      [$1];
        if($2~  /^прл_ед_муж_вин_неод$/                  ){  prl_ediv   [$1];                   continue }; #prl_noedmuvi      [$1];
        if($2~  /^прл_ед_жен_вин$/                       ){  prl_ediv   [$1];                   continue }; #prl_edzevi        [$1];
        if($2~  /^прл_ед_ср_вин$/                        ){  prl_ediv   [$1]; prl_edsrvi [$1];  continue }; #
        if($2~  /^прл_ед_муж_род$/                       ){  prl_edro   [$1]; prl_edvr   [$1];  continue }; #prl_edmuro        [$1];
        if($2~  /^прл_ед_жен_род$/                       ){  prl_edro   [$1];                   continue }; #prl_edzero        [$1];
        if($2~  /^прл_ед_ср_род$/                        ){  prl_edro   [$1];                   continue }; #prl_edsrro        [$1];
        if($2~  /^прл_ед_муж_дат$/                       ){  prl_edda   [$1]; prl_edmsda [$1];  continue }; #
        if($2~  /^прл_ед_жен_дат$/                       ){  prl_edda   [$1];                   continue }; #prl_edzeda        [$1];
        if($2~  /^прл_ед_ср_дат$/                        ){  prl_edda   [$1];                   continue }; #prl_edmsda        [$1];
        if($2~  /^прл_ед_муж_тв$/                        ){  prl_edtv   [$1];                   continue }; #prl_edmutv        [$1];
        if($2~  /^прл_ед_жен_тв$/                        ){  prl_edtv   [$1];                   continue }; #prl_edzetv        [$1];
        if($2~  /^прл_ед_ср_тв$/                         ){  prl_edtv   [$1];                   continue }; #prl_edsrtv        [$1];
        if($2~  /^прл_ед_жен_пр$/                        ){  prl_edpr   [$1];                   continue }; #prl_edzepr        [$1];
        if($2~  /^прл_ед_муж_пр$/                        ){  prl_edpr   [$1];                   continue }; #prl_edmupr        [$1];
        if($2~  /^прл_ед_ср_пр$/                         ){  prl_edpr   [$1];                   continue }; #prl_edsrpr        [$1];
       };
       if(substr($2,1,8) == "прл_крат") {
        if($2~  /^прл_крат_ед_муж$/                      ){  prl_kred   [$1]; prl_kred_mu [$1]; continue };
        if($2~  /^прл_крат_ед_жен$/                      ){  prl_kred   [$1]; prl_kred_ze [$1]; continue };
        if($2~  /^прл_крат_ед_ср$/                       ){  prl_kred   [$1]; prl_kred_sr [$1]; continue };
        if($2~  /^прл_крат_мн$/                          ){  prl_krmn   [$1];                   continue };
       };
       if(substr($2,1,6) == "прл_мн") {
        if($2~  /^прл_мн_им$/                            ){  prl_mniv   [$1];                   continue }; #prl_mnim          [$1];
        if($2~  /^прл_мн_вин_одуш$/                      ){  prl_mnvr   [$1];                   continue }; #prl_mnodvi        [$1];
        if($2~  /^прл_мн_вин_неод$/                      ){  prl_mniv   [$1];                   continue }; #prl_mnnovi        [$1];
        if($2~  /^прл_мн_род$/                           ){  prl_mnvr   [$1];                   continue }; #prl_mnro   [$1];
        if($2~  /^прл_мн_дат$/                           ){  prl_mnda   [$1];                   continue }; #
        if($2~  /^прл_мн_тв$/                            ){  prl_mntv   [$1];                   continue }; #
        if($2~  /^прл_мн_пр$/                            ){  prl_mnvr   [$1];                   continue }; #
       };
       if(substr($2,1,11) == "прл_прев_ед") {
        if($2~  /^прл_прев_ед_муж_им$/                   ){  prl_ediv   [$1];                   continue }; #prl_prev_ed_muim   [$1];
        if($2~  /^прл_прев_ед_жен_им$/                   ){  prl_ediv   [$1];                   continue }; #prl_prev_ed_zeim   [$1];
        if($2~  /^прл_прев_ед_ср_вин$/                   ){  prl_ediv   [$1];                   continue }; #prl_prev_ed_srvi   [$1];
        if($2~  /^прл_прев_ед_муж_вин_одуш$/             ){  prl_edvr   [$1];                   continue }; #prl_prev_ed_muodvi [$1];
        if($2~  /^прл_прев_ед_муж_вин_неод$/             ){  prl_ediv   [$1];                   continue }; #prl_prev_ed_munovi [$1];
        if($2~  /^прл_прев_ед_жен_вин$/                  ){  prl_ediv   [$1];                   continue }; #prl_prev_ed_zevi   [$1];
        if($2~  /^прл_прев_ед_ср_им$/                    ){  prl_ediv   [$1];                   continue }; #prl_prev_ed_srim   [$1];
        if($2~  /^прл_прев_ед_муж_род$/                  ){  prl_edro   [$1]; prl_edvr   [$1];  continue }; #prl_prev_ed_muro   [$1];
        if($2~  /^прл_прев_ед_жен_род$/                  ){  prl_edro   [$1];                   continue }; #prl_prev_ed_zero   [$1];
        if($2~  /^прл_прев_ед_ср_род$/                   ){  prl_edro   [$1];                   continue }; #prl_prev_ed_srro   [$1];
        if($2~  /^прл_прев_ед_муж_дат$/                  ){  prl_edda   [$1];                   continue }; #prl_prev_ed_muda   [$1];
        if($2~  /^прл_прев_ед_жен_дат$/                  ){  prl_edda   [$1];                   continue }; #prl_prev_ed_zeda   [$1];
        if($2~  /^прл_прев_ед_ср_дат$/                   ){  prl_edda   [$1];                   continue }; #prl_prev_ed_srda   [$1];
        if($2~  /^прл_прев_ед_муж_тв$/                   ){  prl_edtv   [$1]; prl_pvedtv [$1];  continue }; #prl_prev_ed_mutv   [$1];
        if($2~  /^прл_прев_ед_жен_тв$/                   ){  prl_edtv   [$1]; prl_pvedtv [$1];  continue }; #prl_prev_ed_zetv   [$1];
        if($2~  /^прл_прев_ед_ср_тв$/                    ){  prl_edtv   [$1]; prl_pvedtv [$1];  continue }; #prl_prev_ed_srtv   [$1];
        if($2~  /^прл_прев_ед_муж_пр$/                   ){  prl_edpr   [$1];                   continue }; #prl_prev_ed_mupr   [$1];
        if($2~  /^прл_прев_ед_жен_пр$/                   ){  prl_edpr   [$1];                   continue }; #prl_prev_ed_zepr   [$1];
        if($2~  /^прл_прев_ед_ср_пр$/                    ){  prl_edpr   [$1];                   continue }; #prl_prev_ed_srpr   [$1];
       };
       if(substr($2,1,11) == "прл_прев_мн") {
        if($2~  /^прл_прев_мн_им$/                       ){  prl_mniv   [$1];                   continue }; #prl_prev_mn_im     [$1];
        if($2~  /^прл_прев_мн_вин_одуш$/                 ){  prl_mnvr   [$1];                   continue }; #prl_prev_mn_odvi   [$1];
        if($2~  /^прл_прев_мн_вин_неод$/                 ){  prl_mniv   [$1];                   continue }; #prl_prev_mn_novi   [$1];
        if($2~  /^прл_прев_мн_дат$/                      ){  prl_mnda   [$1];                   continue }; #prl_prev_mn_da     [$1];
        if($2~  /^прл_прев_мн_род$/                      ){  prl_mnvr   [$1];                   continue }; #prl_prev_mn_ro     [$1];
        if($2~  /^прл_прев_мн_тв$/                       ){  prl_mntv   [$1]; prl_pvmntv [$1];  continue }; #prl_prev_mn_tv     [$1];
        if($2~  /^прл_прев_мн_пр$/                       ){  prl_mnvr   [$1];                   continue }; #prl_prev_mn_pr     [$1];
       };
        if($2~  /^прл_неизм$/                            ){  prl_neiz   [$1];                   continue };
        if($2~  /^прл_сравн$/                            ){  prl_srav   [$1];                   continue };
    };
    if (substr($2,1,4) == "прч_") {

        if($2~  /_ед_муж$/ && $2~ /_крат_/               ){  prq_kred   [$1]; prq_kred_mu [$1]; continue }; #
        if($2~  /_ед_жен$/ && $2~ /_крат_/               ){  prq_kred   [$1]; prq_kred_ze [$1]; continue }; #
        if($2~  /_ед_ср$/  && $2~ /_крат_/               ){  prq_kred   [$1]; prq_kred_sr [$1]; continue }; #
        if($2~  /_мн$/     && $2~ /_крат_/               ){  prq_krmn   [$1];                   continue }; #prq_mniv [$1];

        if($2~  /_ед_муж_им$/                            ){  prq_ediv   [$1];                   continue }; #prq_ed_muim   [$1];
        if($2~  /_ед_жен_им$/                            ){  prq_ediv   [$1];                   continue }; #prq_ed_zeim   [$1];
        if($2~  /_ед_ср_им$/                             ){  prq_ediv   [$1];                   continue }; #prq_ed_srim   [$1];
        if($2~  /_ед_муж_вин_одуш$/                      ){                    prq_edvr   [$1]; continue }; #prq_ed_odmuvi [$1];
        if($2~  /_ед_муж_вин_неод$/                      ){  prq_ediv   [$1];                   continue }; #prq_ed_nomuvi [$1];
        if($2~  /_ед_жен_вин$/                           ){  prq_ediv   [$1];                   continue }; #prq_ed_zevi   [$1];
        if($2~  /_ед_ср_вин$/                            ){  prq_ediv   [$1];                   continue }; #prq_ed_srvi   [$1];
        if($2~  /_ед_муж_род$/                           ){  prq_edro   [$1];  prq_edvr   [$1]; continue }; #prq_ed_muro   [$1];
        if($2~  /_ед_жен_род$/                           ){  prq_edro   [$1];                   continue }; #prq_ed_zero   [$1];
        if($2~  /_ед_ср_род$/                            ){  prq_edro   [$1];  prq_edro_sr[$1]; continue }; #
        if($2~  /_ед_муж_дат$/                           ){  prq_edda   [$1];                   continue }; #prq_ed_muda   [$1];
        if($2~  /_ед_жен_дат$/                           ){  prq_edda   [$1];                   continue }; #prq_ed_zeda   [$1];
        if($2~  /_ед_ср_дат$/                            ){  prq_edda   [$1];                   continue }; #prq_ed_srda   [$1];
        if($2~  /_ед_муж_тв$/                            ){  prq_edtv   [$1];                   continue }; #prq_ed_mutv   [$1];
        if($2~  /_ед_жен_тв$/                            ){  prq_edtv   [$1];                   continue }; #prq_ed_zetv   [$1];
        if($2~  /_ед_ср_тв$/                             ){  prq_edtv   [$1];                   continue }; #prq_ed_srtv   [$1];
        if($2~  /_ед_муж_пр$/                            ){  prq_edpr   [$1];                   continue }; #prq_ed_mupr   [$1];
        if($2~  /_ед_жен_пр$/                            ){  prq_edpr   [$1];                   continue }; #prq_ed_zepr   [$1];
        if($2~  /_ед_ср_пр$/                             ){  prq_edpr   [$1];                   continue }; #prq_ed_srpr   [$1];

        if($2~  /_мн_им$/                                ){  prq_mniv   [$1];                   continue }; #prq_mn_im     [$1];
        if($2~  /_мн_вин_одуш$/                          ){  prq_mnvr   [$1];                   continue }; #prq_mn_vi     [$1];
        if($2~  /_мн_вин_неод$/                          ){  prq_mniv   [$1];                   continue }; #prq_mn_vi     [$1];
        if($2~  /_мн_род$/                               ){  prq_mnvr   [$1];                   continue }; #prq_mn_ro     [$1];
        if($2~  /_мн_дат$/                               ){  prq_mnda   [$1];                   continue }; #prq_mn_da     [$1];
        if($2~  /_мн_тв$/                                ){  prq_mvtv   [$1];                   continue }; #prq_mn_tv     [$1];
        if($2~  /_мн_пр$/                                ){  prq_mnvr   [$1];                   continue }; #prq_mn_pr     [$1];
    };

        if($2~   /^ввод$/                                ){  vvod       [$1];                   continue };
        if($2~   /^предик$/                              ){  predik     [$1];                   continue };
        if($2~   /^союз$/                                ){  souz       [$1];                   continue };
        if($2~   /^част$/                                ){  qast       [$1];                   continue };
        if($2~   /^числ_(кол|поряд)_ед/                  ){  qisl_ed    [$1];                   continue };
        if($2~   /^числ_(кол|поряд|собир)/               ){  qisl       [$1];                   continue };

    } close(cmd);

 # Коррекции - удаление омографов delarr
    delete gl_nemn ["есть"]; delete gl_ed ["есть"]; delete qast ["есть"];
    delete gl_ed ["времени"]
    delete gl_ed ["дела"]
    delete gl_ed ["почти"]
    delete gl_ed ["пять"]
    delete gl_ed ["пришли"]
    delete deep ["для"]
    delete deep ["хотя"]
    delete gl_ed ["три"]; #delete gl_nspepoed["три"];
    delete suw_mntv ["им"]
    delete suw_edim ["его"]; delete suw_odmnim ["его"]; delete suw_nomniv ["его"]
    delete suw_edvi ["сто"]; delete suw_edim ["сто"]; delete suw_edsrvi ["сто"]; delete suw_edsrim ["сто"];



 }  {
 nf=patsplit($0, l, patword, sep)
 # соединяем некоторые слова с дефисом в одно
 for (i=1; i<=nf-1; i++) { if ( se(0,"-") && q(0,hyp1) && (q(1,hyp2)||lc(1)~/[сц]ки$/||q(1,prl_edmsda)||q(1,mest_da)) )
	 { l[i] = l[i] sep[i] l[i+1]; delete sep[i]; delete l[i+1]; nf=ar(i+1, l); ar(i, sep) };};

 ### все !_#_!
 word["все"];
 for (i=1; i<=nf; i++) { if ( lc(0) in word ) wpos[i]; }; i="";
 for (i in wpos) {

 #v всё-таки
 if (se(0,"-") && w(1,"таки") && s(0,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[1]++; print "R1"}; continue;};

 #v всё же
 if (s(0,0) && (w(1,"же")||w(1,"равно")) )
 { sub(/е/, "ё", l[i]); if(dbg){r[2]++; print "R2"}; continue;};

 #v всё в (порядке)
 if (q(1,qast) &&
      w(2,"в") &&
       w(3,"порядке|порядок|норме|норму|ажуре|шоколаде") && s(0,2) && (p(3)||w(4,"и|с")) )
 { sub(/е/, "ё", l[i]); if(dbg){r[3]++; print "R3"}; continue;};
 if (w(1,"в") &&
      q(2,prl_edpr) &&
       w(3,"порядке|порядок|норме|норму|ажуре|шоколаде") && s(0,2) && (p(3)||w(4,"и|с")) )
 { sub(/е/, "ё", l[i]); if(dbg){r[4]++; print "R4"}; continue;};
 if (w(1,"в") &&
      w(2,"порядке|порядок|норме|норму|ажуре|шоколаде") && s(0,1) && (p(2)||w(3,"и|с")) )
 { sub(/е/, "ё", l[i]); if(dbg){r[5]++; print "R5"}; continue;};
 if ( q(1,qast) &&
       w(2,"на") &&
        w(3,"мази") && s(0,2) && (p(3)||w(4,"и")) )
 { sub(/е/, "ё", l[i]); if(dbg){r[6]++; print "R6"}; continue;};
 if (w(1,"на") &&
      w(2,"мази") && s(0,1) && (p(2)||w(3,"и")) )
 { sub(/е/, "ё", l[i]); if(dbg){r[7]++; print "R7"}; continue;};

 #v всё ещё
 if ( w(1,"ещё|еще") && s(0,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[8]++; print "R8"}; continue;};

 #v всё так и
 if ( phf(1,"так и") &&
       (q(3,gl_nemn)||q(3,gl_pemn)||q(3,gl_pnmn)) && s(0,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[9]++; print "R9"}; continue;};


 # фразы
 
 if ( phf(1,"бы ничего") && sc(2,",") && s(0,1) &&
       w(3,"только|но|да|однако") )
 { sub(/е/, "ё", l[i]); if(dbg){r[10]++; print "R10"}; continue;};
 if ( w(-1,"на") && (phf(1,"про все")||phf(1,"про всё")) && s(-1,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[11]++; print "R11"}; continue;};
 if ( (phs(-1,"на всё про")||phs(-1,"на все про")) && s(-3,-1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[12]++; print "R12"}; continue;};
 if ( phf(1,"одно и то же") && s(0,3) )
 { sub(/е/, "ё", l[i]); if(dbg){r[13]++; print "R13"}; continue;};
 if ( phf(1,"потому что") && s(0,0) && sc(1,",") )
 { sub(/е/, "ё", l[i]); if(dbg){r[14]++; print "R14"}; continue;};
 if ( phs(-1,"ну вот и") && s(-3,-1) && p(0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[15]++; print "R15"}; continue;};
 if ( phs(-1,"вот и") && s(-2,-1) && p(0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[16]++; print "R16"}; continue;};
 if ( phf(1,"или ничего") && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[17]++; print "R17"}; continue;};
 if ( phf(1,"за и против") && s(0,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[18]++; print "R18"}; continue;};
 if ( phf(1,"как один") && s(0,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[19]++; print "R19"}; continue;};
 if ( phf(1,"это само по себе") && s(0,3) )
 { sub(/е/, "ё", l[i]); if(dbg){r[20]++; print "R20"}; continue;};
 if ( phf(1,"не так уж") &&
       q(4,prl_kred_sr) && s(0,3) )
 { sub(/е/, "ё", l[i]); if(dbg){r[21]++; print "R21"}; continue;};
 if ( phf(1,"совсем не так") && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[22]++; print "R22"}; continue;};
 if ( phf(1,"в том же") && w(4,"роде|духе|разрезе|виде|смысле") && s(0,3) )
 { sub(/е/, "ё", l[i]); if(dbg){r[23]++; print "R23"}; continue;};
 if ( phs(-1,"всё равно") && 
       q(1,gl_pnmn) &&
       (q(2,mest_ed)||q(2,mest_mn)) && s(-1,0) && sc(1,",") )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[24]++; print "R24"}; continue;};

 # Это

 # все + сущ.мн.
 if ( q(-4,mest_it) &&
       phs(-1,"ещё далеко не") && s(-4,-1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[25]++; print "R25"}; continue;};
 if ( q(-3,mest_it) &&
       phs(-1,"ещё не") && s(-3,-1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[26]++; print "R26"}; continue;};
 if ( q(1,mest_it) &&
       phf(2,"не более чем") && s(0,3) )
 { sub(/е/, "ё", l[i]); if(dbg){r[27]++; print "R27"}; continue;};
 if ( q(-3,mest_it) &&
       phs(-1,"далеко не") && s(-3,-1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[28]++; print "R28"}; continue;};
 # все + сущ.мн.
 if ( q(-1,mest_it) &&
      (q(1,suw_odmnim)||q(1,suw_nomniv)) && s(-1,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[29]++; print "R29"}; continue;};
 # это + всё + сущ.мн.
 if ( q(-1,mest_it) &&
      (q(1,suw_odmnim)||q(1,suw_nomniv)) && s(-1,0) && p(1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[30]++; print "R30"}; continue;};
 # это + всё + сущ.ед.
 if ( q(-1,mest_da) &&
       q(1,mest_it) && s(-1,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[31]++; print "R31"}; continue;};
 # это + всё + сущ.ед.
 if ( q(-1,mest_it) &&
       q(1,suw_edim) && s(-1,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[32]++; print "R32"}; continue;};
 # через всё + это
 if ( (q(-1,pre_vi)||q(-1,pre_ro)||q(-1,pre_da)) &&
       q(1,mest_it) && s(-1,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[33]++; print "R33"}; continue;};
 # это + всё + сущ.ед.
 if ( q(1,mest_it) &&
       q(2,suw_edim) && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[34]++; print "R34"}; continue;};
 # все + это + ... + нар[….,:;!?—]
 if ( q(1,qast) &&
       q(2,mest_it) && s(0,1) && p(2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[35]++; print "R35"}; continue;};
 # все + ... + сущ.мн.
 if ( q(1,mest_it) &&
       (q(2,suw_odmnim)||q(2,suw_nomniv)) && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[36]++; print "R36"}; continue;};
 # все + это + ... + нар[….,:;!?—]
 if ( q(1,mest_it) &&
      (q(2,nar_opka)||q(2,nar_opsp)||q(2,mest_ed)) && s(0,1) && p(2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[37]++; print "R37"}; continue;};
 if ( q(1,mest_it) &&
       q(2,pre_ro) &&
       (q(3,mest_ro)||q(3,suw_edro)||q(3,suw_mnro)||q(3,suw_odmnvr)) && s(0,2) && p(3) )
 { sub(/е/, "ё", l[i]); if(dbg){r[38]++; print "R38"}; continue;};
 if ( q(-1,mest_it) &&
       q(1,pre_ro) &&
       (q(2,mest_ro)||q(2,suw_edro)||q(2,suw_mnro)||q(2,suw_odmnvr)) && s(0,1) && p(2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[38]++; print "R38"}; continue;};
 if ( q(1,mest_it) &&
       q(2,qast) &&
        q(3,pre_ro) &&
        (q(2,mest_ro)||q(2,suw_edro)||q(2,suw_mnro)||q(2,suw_odmnvr)) && s(0,3) && p(4) )
 { sub(/е/, "ё", l[i]); if(dbg){r[39]++; print "R39"}; continue;};
 if ( q(-1,mest_it) &&
       q(1,mest_da) && s(-1,0) && p(1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[40]++; print "R40"}; continue;};
 # все + мест.мн + [….,;:!?]
 if ( q(-1,mest_it) &&
       q(1,mest_mn) &&
       (q(2,gl_pnmn)||q(2,gl_nemn)) && s(-1,1) && p(2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[41]++; print "R41"}; continue;};
 # всё + гл.ед
 if ( q(-1,mest_it) &&
      (q(1,nar_obvr)||q(1,nar_obme)||q(1,nar_opsp)||q(1,nar_opst)||q(1,nar_srav)||q(1,nar_opka)) &&
       (q(2,gl_ed)||q(2,gl_in)) && s(-1,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[42]++; print "R42"}; continue;};
 # всё + гл.ед
 if ( q(1,mest_it) &&
      (q(2,nar_obvr)||q(2,nar_obme)||q(2,nar_opsp)||q(2,nar_opst)||q(2,nar_srav)||q(2,nar_opka)) &&
       (q(3,gl_ed)||q(3,gl_in)) && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[43]++; print "R43"}; continue;};
 if ( q(1,mest_it) &&
      (q(2,nar_obvr)||q(2,nar_obme)||q(2,nar_opsp)||q(2,nar_opst)||q(2,nar_srav)||q(2,nar_opka)) && s(0,2) && (p(2)||w(3,"и")) )
 { sub(/е/, "ё", l[i]); if(dbg){r[44]++; print "R44"}; continue;};
 # всё, ввод, гл.ед
 if ( q(1,mest_it) && s(0,0) && sc(1,",") &&
       q(2,vvod) && sc(2,",") &&
       (q(3,gl_ed)||q(3,gl_in)) )
 { sub(/е/, "ё", l[i]); if(dbg){r[45]++; print "R45"}; continue;};
 # всё, ввод, гл.ед
 if ( q(1,mest_it) && s(0,0) && sc(1,",") &&
       q(2,vvod) && sc(2,",") &&
       (q(3,gl_nemn)||q(3,gl_pnmn)) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[46]++; print "R46"}; continue;};
 # всё, ввод, гл.ед
 if ( sc(0,",") &&
       q(1,vvod) && sc(1,",") &&
       (q(2,gl_ed)||q(2,gl_in)) )
 { sub(/е/, "ё", l[i]); if(dbg){r[47]++; print "R47"}; continue;};
 # всё, ввод, гл.ед
 if ( sc(0,",") &&
       q(1,vvod) && sc(1,",") &&
       (q(2,gl_nemn)||q(2,gl_pnmn)) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[48]++; print "R48"}; continue;};
 # все + это + ... + нар[….,:;!?—]
 if ( q(1,mest_it) &&
       q(2,mest_da) &&
        q(3,prl_kred_sr) && s(0,2) && p(3) )
 { sub(/е/, "ё", l[i]); if(dbg){r[49]++; print "R49"}; continue;};
 # все + это + ... + нар[….,:;!?—]
 if ( q(1,mest_it) &&
       q(2,qast) &&
        q(3,prq_kred_sr) && s(0,2) && p(3) )
 { sub(/е/, "ё", l[i]); if(dbg){r[50]++; print "R50"}; continue;};
 if ( q(1,mest_it) &&
       q(2,prl_kred_sr) && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[51]++; print "R51"}; continue;};
 # Это всё надо
 if ( q(-1,mest_it) &&
       q(1,predik) && s(-1,0) && p(1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[52]++; print "R52"}; continue;};
 # Это всё из-за
 if ( q(-1,mest_it) &&
       q(1,pre_ro) &&
       (q(2,mest_ro)||q(2,mest_vi)||q(2,prl_edro)||q(2,prl_edvr)||q(2,prl_mniv)||q(2,prl_mnvr)) &&
        (q(3,suw_edro)||q(3,suw_odmnvr)||q(3,suw_mnro)) && s(-1,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[53]++; print "R53"}; continue;};
 # Это всё из-за
 if ( q(-1,mest_it) &&
       q(1,pre_ro) &&
        w(2,"того") &&
         w(3,"что|чтобы") && s(-1,1) && sc(2,",") )
 { sub(/е/, "ё", l[i]); if(dbg){r[54]++; print "R54"}; continue;};
 if ( q(1,mest_it) &&
       q(2,pre_ro) &&
        w(3,"того") &&
         w(4,"что|чтобы") && s(0,2) && sc(3,",") )
 { sub(/е/, "ё", l[i]); if(dbg){r[55]++; print "R55"}; continue;};
 if ( q(1,mest_it) &&
       q(2,mest_da) &&
        q(3,nar_opka) &&
         q(4,gl_edsr) && s(0,3) )
 { sub(/е/, "ё", l[i]); if(dbg){r[56]++; print "R56"}; continue;};
 # все + это (мест.ед) + ...
 if ( q(1,mest_it) &&
      (q(2,prl_ediv)||q(2,prl_edvr)||q(2,prl_mniv)||q(2,prq_mniv)||q(2,prl_mnvr)||q(2,prq_mnvr)) &&
       (q(3,suw_edim)||q(3,suw_odmnim)||q(3,suw_nomniv)) && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[57]++; print "R57"}; continue;};
 # все + это (мест.ед) + ...
 if ( q(1,mest_it) &&
       q(2,pre_pr) &&
       (q(3,suw_edpr)||q(3,suw_mnpr)) && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[58]++; print "R58"}; continue;};
 # все + это (мест.ед) + ...
 if ( q(1,mest_it) &&
       q(2,pre_ro) &&
       (q(3,mest_ro)||q(3,suw_edro)||q(3,suw_odmnvr)||q(3,suw_mnro)) && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[59]++; print "R59"}; continue;};
 # все + это (мест.ед) + ...
 if ( q(1,mest_it) && s(0,0) && p(1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[60]++; print "R60"}; continue;};

 # Все как и
 if ( phs(-1,"как и") && s(-2,0) &&
       q(1,mest_mn) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[61]++; print "R61"}; continue;};
 if ( phs(-2,"как и") && s(-3,-1) &&
       q(-1,mest_mn) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[62]++; print "R62"}; continue;};

 # Все то же
 if ( q(1,mest_ed) &&
       w(2,"же|ж") && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[63]++; print "R63"}; continue;};
 if ( q(1,mest_mn) &&
       w(2,"же|ж") && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[64]++; print "R64"}; continue;};

 #v Все + предлог
 if ( q(-1,pre_da) && s(0,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[65]++; print "R65"}; continue;};
 if ( q(1,pre_ro) &&
       q(2,mest_ro) &&
        q(3,prq_ediv) && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[66]++; print "R66"}; continue;};
 if ( q(1,pre_ro) &&
       (q(2,suw_odmnvr)||q(2,suw_mnro)||cap(2)) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[67]++; print "R67"}; continue;};
 if ( q(1,mest_mnim) && sc(0,",") &&
      (q(2,pre_ro)||q(2,pre_vi)) &&
        w(3,"кого") && s(1,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[68]++; print "R68"}; continue;};
 if ( (q(1,pre_ro)||q(1,pre_vi)) && sc(0,",") &&
       w(2,"кого" ) && s(1,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[69]++; print "R69"}; continue;};
 if ( w(1,"до") &&
       w(2,"конца") && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[70]++; print "R70"}; continue;};
 if ( w(1,"до") &&
       w(2,"единого") && s(0,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[71]++; print "R71"}; continue;};

 # всё, на что
 if ( sc(0,",") &&
       q(1,pre_vi) &&
        w(2,"что") && s(1,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[72]++; print "R72"}; continue;};
 if ( sc(0,",") &&
       q(1,pre_vi) &&
        w(2,"кого") && s(1,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[73]++; print "R73"}; continue;};
 if ( sc(0,",") &&
       q(1,pre_pr) &&
        w(2,"чём|чем") && s(1,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[74]++; print "R74"}; continue;};
 if ( sc(0,",") &&
       q(1,pre_pr) &&
        w(2,"ком") && s(1,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[75]++; print "R75"}; continue;};
 if ( sc(0,",") &&
       q(1,pre_pr) &&
        w(2,"чём|чем") && s(1,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[76]++; print "R76"}; continue;};
 if ( (qb(-5,suw_odmnim)||qb(-5,suw_nomniv)) &&
        q(1,pre_pr) &&
        (q(2,mest_pr)||q(2,suw_edtv)||q(2,suw_mntv)) && s(0,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[77]++; print "R77"}; continue;};
 if ( q(1,pre_pr) &&
      (q(2,mest_pr)||q(2,suw_edtv)||q(2,suw_mntv)) && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[78]++; print "R78"}; continue;};
 if ( q(-2,pre_pr) &&
      (q(-1,mest_pr)||q(2,suw_edtv)||q(2,suw_mntv)) && s(-2,-1) && p(0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[79]++; print "R79"}; continue;};

 # всё так же
 if ( phf(1,"так же") &&
       q(3,prl_kred) && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[80]++; print "R80"}; continue;};

 # Все + ... + причастие =====================================
 # всё + прч.
 if ( q(1,qast) &&
        q(2,prq_kred_sr) && s(0,1) && p(2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[81]++; print "R81"}; continue;};
 if ( q(1,pre_ro) &&
      (q(2,suw_odmnvr)||q(2,suw_mnro)||q(2,suw_edro)) &&
        q(3,prq_kred_sr) && s(0,2) && (p(3)||w(4,"и")) )
 { sub(/е/, "ё", l[i]); if(dbg){r[82]++; print "R82"}; continue;};
 if ( (q(1,prq_ediv)||q(1,prq_kred)) && s(0,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[83]++; print "R83"}; continue;};
 # всё + прч.
 if ( q(1,mest_ed) &&
      (q(2,prq_ediv)||q(2,prq_kred)) && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[84]++; print "R84"}; continue;};
 # всё + прч.
 if ( q(-1,pre_tv) &&
       (q(1,prq_edtv)||q(1,prq_mntv)) &&
        (q(2,suw_edtv)||q(2,suw_mntv)) && s(-1,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[85]++; print "R85"}; continue;};
 # всё + прч.
 if ( (q(-1,prq_edtv)||q(-1,prq_mntv)||q(-1,prl_edtv)||q(-1,prl_mntv)) && sc(-1,",") &&
       (q(1,prq_edtv)||q(1,prq_mntv)) &&
        (q(2,suw_edtv)||q(2,suw_mntv)) && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[86]++; print "R86"}; continue;};

 # все + прч.
 if ((q(1,nar_obvr)||q(1,qast)) &&
       q(2,nar_opka) &&
       (q(3,prq_ediv)||q(3,prq_kred)) && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[87]++; print "R87"}; continue;};
 # все + прч.
 if ( (q(1,prq_mniv)||q(1,prq_krmn))  && s(0,0) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[88]++; print "R88"}; continue;};
 # все + прч.
 if ( q(1,mest_vi) &&
      (q(2,prq_mniv)||q(2,prq_krmn)) && s(0,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[89]++; print "R89"}; continue;};
 # всё + прч.
 if ( (q(1,prq_edvr)||q(1,prq_edro)||q(1,prq_mnvr)) && s(0,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[90]++; print "R90"}; continue;};



 # Все + ... + прилагательное =====================================
 # все + прл + и + прл.
 if ( (q(1,prl_mniv)||q(1,prq_mniv)||q(1,prl_mnvr)||q(1,prq_mnvr)||q(1,prl_krmn)) &&
        w(2,"и|или") &&
        (q(3,prl_mniv)||q(3,prq_mniv)||q(3,prl_mnvr)||q(3,prq_mnvr)||q(3,prl_krmn)) && s(0,2) && qq(1,3)  )
 { sub(/е/, "ё", l[i]); if(dbg){r[91]++; print "R91"}; continue;};
 if ( (q(1,prl_mniv)||q(1,prq_mniv)||q(1,prl_mnvr)||q(1,prq_mnvr)||q(1,prl_krmn)) &&
        w(2,"и|или") &&
        (q(3,prl_mniv)||q(3,prq_mniv)||q(3,prl_mnvr)||q(3,prq_mnvr)||q(3,prl_krmn)) &&
         (q(4,suw_odmnim)||q(4,suw_nomniv)) &&
           q(5,gl_nemn) && s(0,4)  )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[92]++; print "R92"}; continue;};
 if ( (q(1,prl_mniv)||q(1,prq_mniv)||q(1,prl_mnvr)||q(1,prq_mnvr)||q(1,prl_krmn)) &&
        w(2,"и|или") &&
        (q(3,prl_mniv)||q(3,prq_mniv)||q(3,prl_mnvr)||q(3,prq_mnvr)||q(3,prl_krmn)) &&
         (q(4,suw_odmnim)||q(4,suw_nomniv)) && s(0,3)  )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[93]++; print "R93"}; continue;};
 # все + ... + прл.
 if ( (q(1,prl_mniv)||q(1,prq_mniv)||q(1,prl_mnvr)||q(1,prq_mnvr)||q(1,prl_krmn)) &&
       (q(2,prl_mniv)||q(2,prq_mniv)||q(2,prl_mnvr)||q(2,prq_mnvr)||q(2,prl_krmn)) && s(0,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[94]++; print "R94"}; continue;};
 # все + ... + прл.
 if ( q(1,qast) &&
      (q(2,prl_mniv)||q(2,prq_mniv)||q(2,prl_mnvr)||q(2,prq_mnvr)||q(2,prl_krmn)) && s(0,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[95]++; print "R95"}; continue;};
 # все + прл.
 if ( (q(1,prl_mniv)||q(1,prq_mniv)||q(1,prl_mnvr)||q(1,prq_mnvr)||q(1,prl_krmn)) && p(1) && s(0,0) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[96]++; print "R96"}; continue;};
 # все + прл.
 if ( q(1,prl_krmn) && s(0,0) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[97]++; print "R97"}; continue;};
 # все + прл.
 if ( (q(1,prl_mniv)||q(1,prq_mniv)||q(1,prl_mnvr)||q(1,prq_mnvr)||q(1,prl_krmn)) &&
       (q(2,suw_odmnim)||q(2,suw_nomniv)) && s(0,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[98]++; print "R98"}; continue;};
 # всё + прл.
 if ( (q(1,prl_ediv)||q(1,prl_edvr)||q(1,prl_kred)) &&
       (q(2,suw_edim)||q(2,suw_edvi)) && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[99]++; print "R99"}; continue;};
 # всё + прл.
 if ( (q(1,prl_pvedtv)||q(1,prl_pvmntv)) &&
       (q(2,suw_edtv)||q(2,suw_mntv)) && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[100]++; print "R100"}; continue;};
 # всё + же совершенно очевидно
 if ( (q(1,qast)||q(1,nar_opka)) &&
       (q(2,nar_opka)||q(2,nar_opst)) &&
         q(3,prl_kred_sr) && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[101]++; print "R101"}; continue;};
 # мне все + ... + прил.крт[….,:;!?—]
 if ( q(-2,pre_tv) &&
      (q(-1,suw_edtv)||q(-1,suw_mntv)) &&
        q(1,prl_kred_sr) && s(-2,0) && p(1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[102]++; print "R102"}; continue;};
 # мне все + ... + прил.крт[….,:;!?—]
 if ( q(-1,mest_da) &&
       q(1,nar_opst) &&
        q(2,prl_kred_sr) && s(-1,1) && p(2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[103]++; print "R103"}; continue;};
 # все + это + ... + нар[….,:;!?—]
 if ( q(1,mest_ed) &&
       q(2,nar_opst) &&
        (q(3,prl_kred_sr)||q(3,prl_edsrim)) && s(0,2) && p(3) )
 { sub(/е/, "ё", l[i]); if(dbg){r[104]++; print "R104"}; continue;};
 # все + это + ... + нар[….,:;!?—]
 if ( q(1,mest_ed) &&
       (q(2,prl_kred_sr)||q(2,prl_edsrim)) &&
        (q(3,mest_da)||q(3,suw_edda)||q(3,suw_mnda)) && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[105]++; print "R105"}; continue;};
 # все + прл.ед
 if ( (q(1,prl_edsrim)||q(1,prl_edsrvi)) && s(0,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[106]++; print "R106"}; continue;};
 # все + это + ... + нар[….,:;!?—]
 if ( q(-1,vvod) &&
        (q(1,prl_kred_sr)||q(1,prl_edsrim)) && sc(-1,",") && s(0,0) && p(1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[107]++; print "R107"}; continue;};
 # все + это + ... + нар[….,:;!?—]
 if ( (q(-2,gl_nemn)||q(-2,gl_pnmn)||q(-2,gl_pemn)||q(-2,gl_in)) &&
        q(-1,mest_mn) &&
        (q(1,prl_kred_sr)||q(1,prl_edsrim)) && s(-2,0) && p(1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[108]++; print "R108"}; continue;};
 if ( (q(-1,gl_nemn)||q(-1,gl_pnmn)||q(-1,gl_pemn)) &&
       (q(1,prl_kred_sr)||q(1,prl_edsrim)) && s(-1,0) && p(1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[108]++; print "R108"}; continue;};
 if ( (q(1,prl_kred_sr)||q(1,prl_edsrim)) && s(0,0) && p(1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[109]++; print "R109"}; continue;};
 # все + это + ... + нар[….,:;!?—]
 if ( q(-2,gl_vzmn) &&
      (q(-1,prl_kred_sr)||q(-1,nar_opka)) && s(-2,-1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[110]++; print "R110"}; continue;};
 # все + это + ... + нар[….,:;!?—]
 if ( (q(-1,prl_kred_sr)||q(-1,nar_opka)) &&
        w(1,"кто|кого|кому|кем") && sc(0,",") && s(-1,-1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[111]++; print "R111"}; continue;};
 if ( (q(-1,prl_kred_sr)||q(-1,nar_opka)) &&
        q(1,pre_ro) &&
        (q(2,suw_edro)||q(2,suw_odmnro)||q(2,suw_nomnvr)) && s(-1,-1) && p(2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[112]++; print "R112"}; continue;};
 if ( (q(-1,prl_kred_sr)||q(-1,nar_opka)) && s(-1,-1) && p(0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[113]++; print "R113"}; continue;};
 # все + это + ... + нар[….,:;!?—]
 if ( (q(1,mest_ed)||q(1,nar_opka)) &&
        (q(2,prl_kred_sr)||q(2,prl_edsrim)) && s(0,1) && p(2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[114]++; print "R114"}; continue;};
 # все + прл.мн и/или прл.мн
 if ( (q(1,prl_mniv)||q(1,prl_mnvr)) &&
        w(2,"и|или") &&
        (q(3,prl_mniv)||q(3,prl_mnvr)) && s(0,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[115]++; print "R115"}; continue;};
 # всё + прл.срав и/или прл.срав
 if ( (q(1,prl_srav)||q(1,nar_opst)||q(1,nar_opka)||q(1,nar_srav)) &&
        w(2,"и|или") &&
        (q(3,prl_srav)||q(3,nar_opst)||q(3,nar_opka)||q(3,nar_srav)) && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[116]++; print "R116"}; continue;};
 # всё прл.срав, прл.срав
 if ( q(1,prl_srav) && se(1,", ") &&
       q(2,prl_srav) && s(0,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[117]++; print "R117"}; continue;};
 # всё проще пареной репы
 if ( q(1,prl_srav) &&
      (q(2,prl_edro)||q(2,prl_edvr)) &&
        q(3,suw_edro) && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[118]++; print "R118"}; continue;};
 # всё проще пареной репы
 if ( q(1,prl_srav) &&
       (q(2,suw_odmnvr)||q(2,suw_nomniv)||q(2,suw_mnro)) && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[119]++; print "R119"}; continue;};

 # Все + ... + существительное =====================================
  if ( w(1,"нет") &&
       (q(2,suw_odmnvr)||q(2,suw_edro)||q(2,suw_mnro)) && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[120]++; print "R120"}; continue;};
 # все + ... + сущ.мн.
 if ( (q(1,mest_ed)||q(1,mest_mn)) &&
       (q(2,suw_odmnim)||q(2,suw_nomniv)) && s(0,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[121]++; print "R121"}; continue;};
 # все + [...]-сущ.мн.
 if ( q(1,suw_edim) && se(1,"-") &&
      (q(2,suw_odmnim)||q(2,suw_nomniv)) && s(0,0) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[122]++; print "R122"}; continue;};
 # всё + мест + прл + сущ.ед.
 if ( (q(1,mest_ed)||q(1,mest_mn)) &&
       (q(2,prl_mniv)||q(2,prq_mniv)||q(2,prl_mnvr)||q(2,prq_mnvr)) &&
        (q(3,suw_odmnim)||q(3,suw_nomniv)) && s(0,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[123]++; print "R123"}; continue;};
 # все + сущ.мн.
 if ( (q(1,suw_odmnim)||q(1,suw_nomniv)) &&
       (q(2,gl_nemn)||q(2,gl_pemn)||q(2,gl_pnmn)) && s(0,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[124]++; print "R124"}; continue;};
 # все + сущ.мн.
 if ( (q(-1,suw_odmnim)||q(-1,suw_nomniv)) &&
        q(1,prl_krmn) && s(-1,0) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[125]++; print "R125"}; continue;};
 # все + сущ.мн.
 if ( (q(1,suw_odmnim)||q(1,suw_nomniv)) && Q(1,prl_mniv) && Q(1,prl_mnvr) && s(0,0) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[126]++; print "R126"}; continue;};
 # всё + мест + част+ сущ.ед.
 if ( (q(1,mest_ed)||q(1,mest_mn)||q(1,nar_opka)) &&
       (q(2,prl_mniv)||q(2,prq_mniv)||q(2,prl_mnvr)||q(2,prq_mnvr)) &&
         q(3,suw_edim) && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[127]++; print "R127"}; continue;};
 # всё + мест + сущ.ед.
 if ( (q(1,mest_ed)||q(1,mest_mn)) &&
        q(2,suw_edsrim) && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[128]++; print "R128"}; continue;};
 # все + его + метр + восемьдесят
 if ( (q(1,mest_ed)||q(1,mest_mn)) &&
        q(2,suw_edim) &&
         q(3,qisl) && s(0,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[129]++; print "R129"}; continue;};
 # всё + мест + част+ сущ.ед.
 if ( q(1,mest_ed) &&
       q(2,qast) &&
        q(3,suw_edim) && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[130]++; print "R130"}; continue;};
 # всё + сущ.ед.
 if ( (q(1,suw_edsrim)||q(1,suw_edsrvi)) && s(0,0)  )
 { sub(/е/, "ё", l[i]); if(dbg){r[131]++; print "R131"}; continue;};
 # всё + сущ.ед.
 if ( q(1,suw_edim) && s(0,0) && p(1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[132]++; print "R132"}; continue;};
 # всё + сущ.ед.
 if ( q(1,suw_edim) &&
      (q(2,suw_edro)||q(2,suw_mnro)) && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[133]++; print "R133"}; continue;};
 # всё + сущ.мн.
 if ( q(1,pre_ro) && qb(-4,mest_mn) &&
      (q(2,suw_edro)||q(2,suw_mnro)||q(2,suw_odmnvr)) && s(0,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[134]++; print "R134"}; continue;};


 # Нар =============================================
 # всё гораздо проще[….,:;!?—]
 if ( q(1,nar_opst) &&
       q(2,nar_srav) && s(0,1) && p(2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[135]++; print "R135"}; continue;};
 # всё гораздо проще[….,:;!?—]
 if ( q(1,nar_srav) && s(0,0) && p(1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[136]++; print "R136"}; continue;};
 # все  + нар[….,:;!?—]
 if ( (q(1,nar_opka)||q(1,nar_obvr)||q(1,mest_ed)) && s(0,0) && p(1) && cap(0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[137]++; print "R137"}; continue;};
 # все  + нар[….,:;!?—]
 if ( (q(-1,gl_vzmn)||q(-1,gl_nemn)) &&
        q(1,prl_srav) &&
         (q(2,prl_mniv)||q(2,prl_mntv)) && s(-1,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[138]++; print "R138"}; continue;};
 if ( q(1,nar_opst) &&
      (q(2,prl_mntv)||q(2,prl_edtv)) && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[139]++; print "R139"}; continue;};
 # все  + нар[….,:;!?—]
 if ( (q(-1,gl_vzmn)||q(-1,gl_nemn)) &&
       (q(1,nar_opsp)||q(1,nar_obna)||q(1,nar_opst)) && s(-1,0) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[140]++; print "R140"}; continue;};
 # все  + нар[….,:;!?—]
 if ( (q(1,nar_opsp)||q(1,nar_obna)||q(1,nar_opst)) && s(0,0) && p(1) && cap(0) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[141]++; print "R141"}; continue;};
 # все  + нар[….,:;!?—]
 if ( (q(1,nar_opsp)||q(1,nar_obna)||q(1,nar_opst)) && s(0,0) && p(1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[142]++; print "R142"}; continue;};
 # все + более + 
 if ( q(1,nar_opst) &&
      (q(2,prl_mniv)||q(prl_edim)) &&
       (q(3,suw_odmnvr)||q(3,suw_nomniv)) && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[143]++; print "R143"}; continue;};
 # все + ... + нар[….,:;!?—]
 if ( (q(1,qast)||q(1,nar_opst)) &&
        q(2,nar_opka) && s(0,1) && p(2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[144]++; print "R144"}; continue;};
 # все + это + ... + нар[….,:;!?—]
 if ( q(-1,mest_da) &&
       q(1,mest_nar) && s(-1,0) && p(1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[145]++; print "R145"}; continue;};
 # всё не так плохо
 if ( w(1,"не") &&
       w(2,"так") &&
       (q(3,nar_obvr)||q(3,nar_obme)||q(3,nar_opsp)||q(3,nar_srav)||q(3,nar_opka)||q(3,suw_edvi)||q(3,mest_ed)) && s(0,2) && p(3) )
 { sub(/е/, "ё", l[i]); if(dbg){r[146]++; print "R146"}; continue;};

 # Все + ... + числительное =====================================
 # все + числ.
 if ( (q(1,qisl)||l[i+1]~/^[0-9]+$/) && s(0,0) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[147]++; print "R147"}; continue;};

 # Все + ... + глагол ============================================
 # все + ... + гл.мн.
 if ( (q(1,qast)||q(1,nar_obme)||q(1,nar_opka)||q(1,nar_obvr)||q(1,nar_opsp)) &&
       (q(2,gl_vzmn)||q(2,gl_nemn)) && s(0,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[148]++; print "R148"}; continue;};
 # все + гл.мн
 if ( (q(-1,gl_vzmn)||q(-1,gl_nemn)) &&
        q(1,prl_srav) && s(-1,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[149]++; print "R149"}; continue;};
 # все + гл.мн
 if ( q(1,nar_srav) &&
      (q(2,gl_vzmn)||q(2,gl_nemn)||q(2,gl_pemn)) && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[150]++; print "R150"}; continue;};
 # все + гл.мн
 if ( (q(1,gl_vzmn)||q(1,gl_nemn)) && s(0,0) && p(1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[151]++; print "R151"}; continue;};

 # все + местоимения =============================================
 # все + мест.мн
 if ( phs(-1,"как и") &&
       (q(1,mest_im)||q(1,prl_mniv)) && s(-2,0) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[152]++; print "R152"}; continue;};
 if ( qb(-7,mest_im) &&
       phs(-1,"как и") && s(-2,-1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[153]++; print "R153"}; continue;};
 if ( q(1,mest_mn) &&
       q(2,qast) &&
       (q(3,gl_vzmn)||q(3,gl_nemn)) && s(0,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[154]++; print "R154"}; continue;};
 # все + мест.мн
 if ( q(1,mest_mn) &&
       phf(2,"друг друга") && s(0,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[155]++; print "R155"}; continue;};
 if ( q(1,mest_im) &&
       (q(2,gl_vzmn)||q(2,gl_nemn)||q(2,prl_krmn)) && s(0,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[155]++; print "R155"}; continue;};
 # все + мест.мн + [….,;:!?]
 if ( q(1,mest_ed) &&
      (q(2,mest_nar)||q(2,nar_obpr)) && s(0,1) && p(2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[156]++; print "R156"}; continue;};
 # все + это (мест.ед) + ..
 if ( q(1,mest_ed) &&
       q(2,nar_opst) &&
        q(3,nar_opka) && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[157]++; print "R157"}; continue;};
 # все + это (мест.ед) + .. + гл
 if ( q(1,mest_ed) &&
      (q(2,nar_opka)||q(2,nar_opst)||q(2,nar_opsp)) &&
       (q(3,gl_ed)||q(3,gl_in)) && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[158]++; print "R158"}; continue;};
 # все + это (мест.ед) + .. + не гл
 if ( q(1,mest_ed) &&
      (q(2,nar_opka) || q(2,nar_opst)) &&
        q(3,qast) &&
        (q(4,gl_ed)||q(4,gl_in)) && s(0,3) )
 { sub(/е/, "ё", l[i]); if(dbg){r[159]++; print "R159"}; continue;};

 # Местоимения + все
 # мест.да
 if ( q(-1,mest_da) &&
       q(1,mest_nar) && s(-1,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[160]++; print "R160"}; continue;};

 # Мест + все + ... + глагол ============================================
 # все + ... + гл.мн.
 if ( q(-1,mest_mn) &&
      (q(1,qast)||q(1,nar_obme)||q(1,nar_opka)||q(1,nar_obvr)||q(1,nar_opsp)||q(1,mest_mn)) &&
       (q(2,gl_pnmn)||q(2,gl_pemn)) && s(-1,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[161]++; print "R161"}; continue;};
 # все + гл.мн + сущ
 if ( q(-1,mest_mn) &&
      (q(1,gl_pnmn)||q(1,gl_pemn)) &&
       (q(2,suw_nomniv)||q(2,suw_odmnvr)) && s(-1,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[162]++; print "R162"}; continue;};
 # все + гл.мн + сущ
 if ( q(1,mest_mn) &&
      (q(2,gl_pnmn)||q(2,gl_pemn)) &&
       (q(3,suw_nomniv)||q(3,suw_odmnvr)) && s(0,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[163]++; print "R163"}; continue;};
 # все + гл.мн
 if ( (q(1,gl_pnmn)||q(1,gl_pemn)) &&
       (q(2,prl_mniv)||q(2,prq_mniv)||q(2,prl_mnvr)||q(2,prq_mnvr)||q(2,prl_ediv)||q(2,prl_edvr)) &&
        (q(3,suw_nomniv)||q(3,suw_odmnvr)) && s(0,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[164]++; print "R164"}; continue;};
 # оглядывающий + все + вокруг + всех
 if ( (q(-1,prq_ediv)||q(-1,prq_mniv)) &&
        q(1,pre_ro) &&
        (q(2,mest_ro)||q(2,suw_edro)||q(2,suw_mnro)||q(2,prl_edro)||q(2,prl_mnvr)||q(2,prq_edro)||q(2,prq_mnvr)) && s(-1,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[165]++; print "R165"}; continue;};
 # все + против + всех
 if ( w(1,"для|ради") && Q(-1,gl_edvz) &&
      (q(2,mest_ro)||q(2,suw_edro)||q(2,suw_mnro)||q(2,prl_edro)||q(2,prl_mnvr)||q(2,prq_edro)||q(2,prq_mnvr)) && s(-1,1) && p(2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[166]++; print "R166"}; continue;};
 if ( q(1,pre_ro) && Q(-1,gl_edvz) &&
      (q(2,mest_ro)||q(2,suw_edro)||q(2,suw_mnro)||q(2,prl_edro)||q(2,prl_mnvr)||q(2,prq_edro)||q(2,prq_mnvr)) && s(-1,1) && p(2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[167]++; print "R167"}; continue;};


 # дееп =============================================================
 # всё + дееп.
 if ( (q(1,prl_srav)||q(1,nar_opst)) &&
        q(2,deep) && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[168]++; print "R168"}; continue;};
 # все + дееп.
 if ( q(1,deep) &&
      (q(2,gl_nemn)||q(2,gl_pnmn)||q(2,gl_pemn)) && s(0,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[169]++; print "R169"}; continue;};
 # дееп + всё
 if ( q(-2,deep) &&
       q(-1,mest_vi) &&
        q(1,prl_srav) && s(-2,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[170]++; print "R170"}; continue;};
 # дееп + всё
 if ( q(-1,deep) && s(-1,-1))
 { sub(/е/, "ё", l[i]); if(dbg){r[171]++; print "R171"}; continue;};
 # всё + дееп.
 if ( q(1,deep) && s(0,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[172]++; print "R172"}; continue;};
 # гл.мн + все + прл.
 if ( q(-1,gl_nemn) && 
      (q(1,prl_mniv)||q(1,prq_mniv)||q(1,prl_mnvr)||q(1,prq_mnvr)||q(1,prl_krmn)) &&
        q(2,deep) && s(-1,0) && sc(1,",") )
 { sub(/е/, "ё", l[i]); if(dbg){r[173]++; print "R173"}; continue;};


 # Всё + ... + глагол.мн + дополнение ============================
 if ( (q(1,gl_pemn)||q(1,gl_pnmn)) &&
       (q(2,suw_edro)||q(2,suw_mnro)||q(2,suw_odmnvr)) && s(0,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[174]++; print "R174"}; continue;};

 if ( (q(1,gl_pemn)||q(1,gl_pnmn)) &&
       (q(2,suw_edtv)||q(2,suw_mntv)||q(2,suw_edda)||q(2,suw_mnda)) && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[175]++; print "R175"}; continue;};

 # все + гл.мн и/или гл.мн
 if ( (q(1,gl_pemn)||q(1,gl_nemn)||q(1,gl_pnmn)||q(1,gl_vzmn)) &&
        w(2,"и") &&
        (q(3,gl_pemn)||q(3,gl_nemn)||q(3,gl_pnmn)||q(3,gl_vzmn)) && s(0,2) qq(1,3) )
 { sub(/е/, "ё", l[i]); if(dbg){r[176]++; print "R176"}; continue;};

 # гл.ед + ... + всё
 if ( (q(-1,gl_ed)||q(-1,gl_in)) &&
       (q(1,qast)||q(1,nar_obvr)||q(1,nar_obme)||q(1,nar_opsp)||q(1,nar_srav)||q(1,nar_opka)||q(1,suw_edvi)) && s(-1,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[177]++; print "R177"}; continue;};
 # гл.ед + всё
 if ( (q(-2,gl_ed)||q(-2,gl_in)) &&
        q(-1,mest_da) &&
         q(1,pre_pr) &&
         (q(2,prl_edpr)||q(2,prl_mnvr)||q(2,suw_edpr)||q(2,suw_mnpr)) && s(-2,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[178]++; print "R178"}; continue;};
 # гл.ед + всё
 if ( (q(-1,gl_ed)||q(-1,gl_in)) &&
       (q(1,suw_nomniv)||q(1,suw_odmnvr)) && s(-1,0) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[179]++; print "R179"}; continue;};

 # Всё + ... + глагол.ед ============================================
 # всё + ... + гл.ед.ср
 #if ( (q(1,nar_obvr)||q(1,nar_obme)||q(1,nar_opsp)||q(1,nar_srav)||q(1,nar_opka)||q(3,nar_opst)) &&
 #       q(2,gl_edsr) && s(0,1) )
 #{ sub(/е/, "ё", l[i]); if(dbg){r[180]++; print "R180"}; continue;};
 ## всё + ... + гл.ед.ср
 #if ( q(1,gl_edsr) && s(0,0) )
 #{ sub(/е/, "ё", l[i]); if(dbg){r[181]++; print "R181"}; continue;};
 # всё + гл.ед
 if ( q(1,gl_edvz) && s(0,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[182]++; print "R182"}; continue;};
 # всё + гл.ед
 if ( q(1,prl_kred_sr) &&
       q(2,gl_in) && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[183]++; print "R183"}; continue;};
 # началось всё,
 if ( q(-1,gl_edvz) &&
      (q(1,pre_vi)||q(1,pre_ro)||q(1,pre_tv)) && s(-1,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[184]++; print "R184"}; continue;};
 # началось всё,
 if ( sc(0,",") &&
       q(-1,gl_edvz) && s(-1,-1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[185]++; print "R185"}; continue;};
 # всё + ... + гл.ед
 if ( q(1,qast) &&
       q(2,qast) &&
       (q(3,nar_obvr)||q(3,nar_obme)||q(3,nar_opsp)||q(3,nar_srav)||q(3,nar_opka)||q(3,suw_edvi)||q(3,mest_ed)) &&
        (q(4,gl_ed)||q(4,gl_in)) && s(0,3) )
 { sub(/е/, "ё", l[i]); if(dbg){r[186]++; print "R186"}; continue;};
 # всё + ... + гл.ед
 if ( q(1,qast) &&
       q(2,qast) &&
       (q(3,nar_obvr)||q(3,nar_obme)||q(3,nar_opsp)||q(3,nar_srav)||q(3,nar_opka)||q(3,suw_edvi)||q(3,mest_ed)) &&
         q(4,qast) &&
         (q(5,gl_ed)||q(5,gl_in)) && s(0,4) )
 { sub(/е/, "ё", l[i]); if(dbg){r[187]++; print "R187"}; continue;};
 # всё + ... + гл.ед
 if ( q(1,qast) &&
      (q(2,nar_obvr)||q(2,nar_obme)||q(2,nar_opsp)||q(2,nar_srav)||q(2,nar_opka)||q(2,suw_edvi)||q(2,mest_ed)) &&
       (q(3,gl_ed)||q(3,gl_in)) && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[188]++; print "R188"}; continue;};
 # всё + ... + гл.ед
 if ( q(1,qast) &&
      (q(2,nar_obvr)||q(2,nar_obme)||q(2,nar_opsp)||q(2,nar_srav)||q(2,nar_opka)||q(2,suw_edvi)||q(2,mest_ed)) &&
        q(3,qast) &&
        (q(4,gl_ed)||q(4,gl_in)) && s(0,3) )
 { sub(/е/, "ё", l[i]); if(dbg){r[189]++; print "R189"}; continue;};
 # всё + ... + гл.ед
 if ( q(-2,mest_mnim) &&
      (q(-1,gl_pnmn)) &&
       (q(1,nar_obvr)||q(1,nar_obme)||q(1,nar_opsp)||q(1,nar_srav)||q(1,nar_opka)||q(1,suw_edvi)||q(1,mest_ed)) && s(-2,0) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[190]++; print "R190"}; continue;};
 # всё + ... + гл.ед
 if ( (q(1,nar_obvr)||q(1,nar_obme)||q(1,nar_opsp)||q(1,nar_srav)||q(1,nar_opka)||q(1,suw_edvi)||q(1,mest_ed)) &&
        q(2,qast) &&
        (q(3,gl_ed)||q(3,gl_in)) && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[191]++; print "R191"}; continue;};
 # гл + все + гл.инф
 if ( q(-1,gl_nemn) &&
       q(1,gl_in) && s(-1,0) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[192]++; print "R192"}; continue;};
 # гл + все + гл.инф
 if ( q(-1,gl_nemn) &&
       q(1,qast) &&
        q(2,gl_in) && s(-1,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[193]++; print "R193"}; continue;};
 # всё + мест + сущ.ед.
 if ( q(1,nar_obme) &&
       q(2,mest_da) &&
        q(3,gl_ed) && s(0,2) )
 { sub(/е/, "ё", l[i]); if(dbg){r[194]++; print "R194"}; continue;};
 # всё + мест + сущ.ед.
 if ( q(1,nar_obme) &&
       q(2,mest_da) &&
        q(3,qast) &&
         q(4,gl_ed) && s(0,3) )
 { sub(/е/, "ё", l[i]); if(dbg){r[195]++; print "R195"}; continue;};
 # все + гл.мн + гл.инф
 if ( q(1,nar_obme) &&
       q(2,gl_pnmn) &&
        q(3,gl_in) && s(0,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[196]++; print "R196"}; continue;};
 # все + гл.мн + гл.инф
 if ( q(1,nar_obme) &&
       q(2,gl_pnmn) &&
        q(3,qast) &&
         q(4,gl_in) && s(0,3) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[197]++; print "R197"}; continue;};
 # все + гл.мн + гл.инф
 if ( (q(1,gl_pnmn)||q(1,gl_pemn)) &&
       q(2,gl_in) && s(0,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[198]++; print "R198"}; continue;};
 # все + гл.мн + гл.инф
 if ( (q(1,gl_pnmn)||q(1,gl_pemn)) &&
       q(2,qast) &&
        q(3,gl_in) && s(0,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[199]++; print "R199"}; continue;};
 # всё + гл.ед
 if ( (q(1,gl_ed)||q(1,gl_in)) && s(0,0) && cap(0) && p(1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[200]++; print "R200"}; continue;};
 # всё + гл.ед
 if ( q(-2,pre_ro) &&
       q(-1,mest_ro) &&
       (q(1,gl_ed)||q(1,gl_in)) && s(-2,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[201]++; print "R201"}; continue;};
 # всё + гл.ед
 if ( q(1,qast) &&
      (q(2,gl_ed)||q(2,gl_in)) && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[202]++; print "R202"}; continue;};
 # их все + гл.ед
 if ( q(-1,mest_mnvi) &&
      (q(1,gl_ed)||q(1,gl_in)) && s(0,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[203]++; print "R203"}; continue;};
 # всё + гл.ед
 if ( (q(1,gl_ed)||q(1,gl_in)) && s(0,0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[204]++; print "R204"}; continue;};
 # всё + гл.ед
 if (  (q(1,nar_obvr)||q(1,nar_obme)||q(1,nar_opsp)||q(1,nar_opst)||q(1,nar_srav)||q(1,nar_opka)) &&
        (q(2,gl_ed)||q(2,gl_in)) && s(0,1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[205]++; print "R205"}; continue;};


 # все + ... + перех глагол ============================================
 # все вас знают
 if ( (q(1,gl_pemn)||q(1,gl_pnmn)) &&
        w(2,"о|об") &&
        (q(3,mest_pr)||q(3,suw_edtv)||q(3,suw_mntv)) && s(0,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[206]++; print "R206"}; continue;};
 # все вас знают
 if ( q(1,mest_vi) &&
      (q(2,gl_pemn)||q(2,gl_pnmn)) && s(0,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[207]++; print "R207"}; continue;};
 # все вас знают
 if ( q(1,mest_vi) &&
       q(2,qast) &&
       (q(3,gl_pemn)||q(3,gl_pnmn)) && s(0,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[208]++; print "R208"}; continue;};
 # все получили такие бумаги
 if (q(1,gl_pemn) &&
     (q(2,prl_ediv)||q(2,prl_edvr)||q(2,prl_mniv)||q(2,prq_mniv)||q(2,prl_mnvr)||q(2,prq_mnvr)) &&
      (q(3,suw_edvi)||q(3,suw_odmnvr)||q(3,suw_nomniv)) && s(0,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[209]++; print "R209"}; continue;};
 # все получили такие бумаги
 if (q(1,qast) &&
      q(2,gl_pemn) &&
      (q(3,prl_ediv)||q(3,prl_edvr)||q(3,prl_mniv)||q(3,prq_mniv)||q(3,prl_mnvr)||q(3,prq_mnvr)) &&
       (q(4,suw_edvi)||q(4,suw_odmnvr)||q(4,suw_nomniv)) && s(0,3) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[210]++; print "R210"}; continue;};
 # все мы получили такие бумаги
 if (q(1,mest_mnim) &&
     (q(2,gl_pemn)||q(2,gl_pnmn)) &&
      (q(3,prl_ediv)||q(3,prl_edvr)||q(3,prl_mniv)||q(3,prq_mniv)||q(3,prl_mnvr)||q(3,prq_mnvr)) &&
       (q(4,suw_edvi)||q(4,suw_odmnvr)||q(4,suw_nomniv)) && s(0,3) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[211]++; print "R211"}; continue;};
 # все мы получили такие бумаги
 if (q(1,mest_mnim) &&
     (q(2,gl_pemn)||q(2,gl_pnmn)) &&
      (q(3,prl_ediv)||q(3,prl_edvr)||q(3,prl_mniv)||q(3,prq_mniv)||q(3,prl_mnvr)||q(3,prq_mnvr)) &&
       (q(4,prl_ediv)||q(4,prl_edvr)||q(4,prl_mniv)||q(4,prq_mniv)||q(4,prl_mnvr)||q(4,prq_mnvr)) && s(0,3) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[212]++; print "R212"}; continue;};
 # все мы получили такие бумаги
 if (q(1,mest_mnim) &&
      q(2,qast) &&
      (q(3,gl_pemn)||q(3,gl_pnmn)) &&
       (q(4,prl_ediv)||q(4,prl_edvr)||q(4,prl_mniv)||q(4,prq_mniv)||q(4,prl_mnvr)||q(4,prq_mnvr)) &&
        (q(5,suw_edvi)||q(5,suw_odmnvr)||q(5,suw_nomniv)) && s(0,4) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[213]++; print "R213"}; continue;};
 # все посмотрели в
 if (q(1,gl_pnmn) &&
      q(2,pre_vi) &&
       q(3,suw_edvi) && s(0,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[214]++; print "R214"}; continue;};
 # все посмотрели в
 if ( (q(1,gl_nemn)||q(1,gl_pnmn)||q(1,gl_pemn)) &&
        q(2,pre_pr) &&
        (q(3,suw_edpr)||q(3,suw_edme)) && s(0,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[215]++; print "R215"}; continue;};
 # все посмотрели в
 if (q(1,qast) &&
      q(2,gl_pnmn) &&
       q(3,pre_vi) &&
        q(4,suw_edvi) && s(0,3) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[216]++; print "R216"}; continue;};
 # все посмотрели в его
 if (q(1,gl_pnmn) &&
      q(2,pre_vi) &&
       q(3,mest_vi) &&
        q(4,suw_edvi) && s(0,3) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[217]++; print "R217"}; continue;};
 # все посмотрели в его
 if (q(1,qast) &&
      q(2,gl_pnmn) &&
       q(3,pre_vi) &&
        q(4,mest_vi) &&
         q(5,suw_edvi) && s(0,4) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[218]++; print "R218"}; continue;};
 # все переживали за него
 if (q(1,gl_pnmn) &&
      q(2,pre_vi) &&
       q(3,mest_vi) && s(0,2) && p(3) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[219]++; print "R219"}; continue;};
 # все на него посмотрели
 if (q(1,pre_vi) &&
      q(2,mest_vi) &&
       q(3,gl_pnmn) && s(0,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[220]++; print "R220"}; continue;};
 # все на него посмотрели
 if (q(1,pre_vi) &&
      q(2,mest_vi) &&
       q(3,qast) &&
        q(4,gl_pnmn) && s(0,3) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[221]++; print "R221"}; continue;};
 # все на него посмотрели
 if (q(1,pre_tv) &&
      q(2,mest_tv) &&
       q(3,mest_nar) &&
        q(4,gl_vzmn) && s(0,3) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[222]++; print "R222"}; continue;};
 # все на него посмотрели
 if (q(1,pre_pr) &&
     (q(2,prl_edpr)||q(2,prl_mnvr)) &&
      (q(3,suw_edpr)||q(3,suw_mnpr)) &&
       (q(4,gl_vzmn)||q(4,gl_nemn)) && s(0,3) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[223]++; print "R223"}; continue;};

 # Дополнени в вин.п.
 if ( (q(1,gl_pemn)||q(1,gl_pnmn)) &&
        q(2,mest_vi) &&
        (q(3,prl_ediv)||q(3,prl_edvr)||q(3,prl_mniv)||q(3,prq_mniv)||q(3,prl_mnvr)||q(3,prq_mnvr)||q(3,suw_edvi)||q(3,suw_nomniv)||q(3,suw_odmnvr)) && s(0,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[224]++; print "R224"}; continue;};
 # Дополнени в вин.п.
 if (q(1,qast) &&
     (q(2,gl_pemn)||q(2,gl_pnmn)) &&
       q(3,mest_vi) &&
       (q(4,prl_ediv)||q(4,prl_edvr)||q(4,prl_mniv)||q(4,prq_mniv)||q(4,prl_mnvr)||q(4,prq_mnvr)||q(4,suw_edvi)||q(4,suw_nomniv)||q(4,suw_odmnvr)) && s(0,3) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[225]++; print "R225"}; continue;};
 # Дополнени в вин.п.
 if ( (q(1,gl_pemn)||q(1,gl_pnmn)) &&
       (q(2,suw_edvi)||q(2,suw_nomniv)||q(2,suw_odmnvr)||q(2,mest_vi)) && s(0,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[226]++; print "R226"}; continue;};
 # Дополнени в вин.п.
 if (q(-1,mest_da) &&
     (q(1,suw_edvi)||q(1,suw_nomniv)||q(1,suw_odmnvr)) &&
      (q(2,gl_pemn)||q(2,gl_pnmn)) && s(-1,1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[227]++; print "R227"}; continue;};
 # Дополнени в вин.п.
 if ((q(1,qast)||q(1,mest_da)) &&
      (q(2,gl_pemn)||q(2,gl_pnmn)) &&
       (q(3,suw_edvi)||q(3,suw_nomniv)||q(3,suw_odmnvr)||q(3,mest_vi)) && s(0,2) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[228]++; print "R228"}; continue;};



 # всё то, что
 if ( w(1,"то") && sc(1,",") &&
       q(2,mest_edsr) )
 { sub(/е/, "ё", l[i]); if(dbg){r[229]++; print "R229"}; continue;};
 # всё, что
 if ( sc(0,",") &&
       q(1,mest_edsr) && W(2,"есть") )
 { sub(/е/, "ё", l[i]); if(dbg){r[230]++; print "R230"}; continue;};
 # все те, кто
 if ( w(1,"те") && sc(1,",") &&
       (q(1,mest_edmu)||q(1,mest_edze)) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[231]++; print "R231"}; continue;};
 # все, кто
 if ( sc(0,",") &&
       (q(1,mest_edmu)||q(1,mest_edze)) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[232]++; print "R232"}; continue;};
 # учитывало всё, кроме
 if ( q(-1,gl_ed) && s(-1,-1) &&
       sc(0,",") &&
        w(1,"кроме") )
 { sub(/е/, "ё", l[i]); if(dbg){r[233]++; print "R233"}; continue;};

 # все, которые
 if ( sc(0,",") &&
      (q(1,mest_im)||q(1,mest_mn)||q(1,prq_mniv)) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[234]++; print "R234"}; continue;};

 # Ну всё,
 if ( w(-1,"ну") && s(-1,-1) )
 { sub(/е/, "ё", l[i]); if(dbg){r[235]++; print "R235"}; continue;};


 # гл.мн + все + ...  ============================================
 # гл.мн + все + ... + доп.
 if ( (q(-1,gl_vzmn)||q(-1,gl_nemn)) &&
        sc(0,",") &&
        (q(1,nar_obme)||q(1,nar_opka)||q(1,nar_obvr)||q(1,nar_opsp)||q(1,mest_mn)||q(1,suw_edda)) && s(-1,-1) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[236]++; print "R236"}; continue;};
 # гл.мн + все
 if ( (q(-1,gl_vzmn)||q(-1,gl_nemn)) && s(-1,-1) &&
        sc(0,",") )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[237]++; print "R237"}; continue;};
          

 # ... + всё[;.?!]
 if ( (w(-1,"и")||q(-1,mest_ed)||q(-1,nar_obvr)) && s(-1,-1) && cap(-1) && p(0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[238]++; print "R238"}; continue;};

 if ( (q(-1,gl_vzmn)||q(-1,gl_nemn)) && s(-1,-1) && p(0) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[239]++; print "R239"}; continue;};

 if ( (q(-1,gl_ed)||q(-1,gl_in)) && s(-1,-1) && p(0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[240]++; print "R240"}; continue;};

 # гл.ед + всё
 if ( (q(-1,gl_ed)||q(-1,gl_in)) && s(-1,-1) && p(0) )
 { sub(/е/, "ё", l[i]); if(dbg){r[241]++; print "R241"}; continue;};


 # Конечное подбирание хвостов
 if ( (q(1,suw_odmnim)||q(1,suw_nomniv)) && (q(1,prl_mniv)||q(1,prl_mnvr)) && s(0,0) )
 { sub(/е/, "<_je_>", l[i]); if(dbg){r[242]++; print "R242"}; continue;};

             }; delete wpos;

 $0 = joinpat(l, sep, nf)
 gsub("<_je_>", "е́", $0)
 print $0

 }

 END {
 #dbg = 1
 #dbgstat = 1
 if (dbgstat==1) {for (i=1; i<=242; i++) { printf ("%s%s %s %s\n", "R", i, "=", r[i]) }; };

#for (i in mest_im) print i;


#dbgarr = 1;

 if (dbgarr==1) { 

 printf ("%s %s %s\n", "deep         ", length(  deep         ), typeof(deep         ) );
 printf ("%s %s %s\n", "gl_ed        ", length(  gl_ed        ), typeof(gl_ed        ) );
 printf ("%s %s %s\n", "gl_edsr      ", length(  gl_edsr      ), typeof(gl_edsr      ) );
 printf ("%s %s %s\n", "gl_edvz      ", length(  gl_edvz      ), typeof(gl_edvz      ) );
 printf ("%s %s %s\n", "gl_in        ", length(  gl_in        ), typeof(gl_in        ) );
 printf ("%s %s %s\n", "gl_nemn      ", length(  gl_nemn      ), typeof(gl_nemn      ) );
 printf ("%s %s %s\n", "gl_pemn      ", length(  gl_pemn      ), typeof(gl_pemn      ) );
 printf ("%s %s %s\n", "gl_pnmn      ", length(  gl_pnmn      ), typeof(gl_pnmn      ) );
 printf ("%s %s %s\n", "gl_vzmn      ", length(  gl_vzmn      ), typeof(gl_vzmn      ) );
 printf ("%s %s %s\n", "mest_ed      ", length(  mest_ed      ), typeof(mest_ed      ) );
 printf ("%s %s %s\n", "mest_mn      ", length(  mest_mn      ), typeof(mest_mn      ) );
 printf ("%s %s %s\n", "mest_mnim    ", length(  mest_mnim    ), typeof(mest_mnim    ) );
 printf ("%s %s %s\n", "mest_nar     ", length(  mest_nar     ), typeof(mest_nar     ) );
 printf ("%s %s %s\n", "mest_suw     ", length(  mest_suw     ), typeof(mest_suw     ) );
 printf ("%s %s %s\n", "mest_da     ", length(  mest_da     ), typeof(mest_da     ) );
 printf ("%s %s %s\n", "mest_im     ", length(  mest_im     ), typeof(mest_im     ) );
 printf ("%s %s %s\n", "mest_pr     ", length(  mest_pr     ), typeof(mest_pr     ) );
 printf ("%s %s %s\n", "mest_ro     ", length(  mest_ro     ), typeof(mest_ro     ) );
 printf ("%s %s %s\n", "mest_tv     ", length(  mest_tv     ), typeof(mest_tv     ) );
 printf ("%s %s %s\n", "mest_vi     ", length(  mest_vi     ), typeof(mest_vi     ) );
 printf ("%s %s %s\n", "nar_obce     ", length(  nar_obce     ), typeof(nar_obce     ) );
 printf ("%s %s %s\n", "nar_obme     ", length(  nar_obme     ), typeof(nar_obme     ) );
 printf ("%s %s %s\n", "nar_obna     ", length(  nar_obna     ), typeof(nar_obna     ) );
 printf ("%s %s %s\n", "nar_obpr     ", length(  nar_obpr     ), typeof(nar_obpr     ) );
 printf ("%s %s %s\n", "nar_obvr     ", length(  nar_obvr     ), typeof(nar_obvr     ) );
 printf ("%s %s %s\n", "nar_opka     ", length(  nar_opka     ), typeof(nar_opka     ) );
 printf ("%s %s %s\n", "nar_opsp     ", length(  nar_opsp     ), typeof(nar_opsp     ) );
 printf ("%s %s %s\n", "nar_opst     ", length(  nar_opst     ), typeof(nar_opst     ) );
 printf ("%s %s %s\n", "nar_prev     ", length(  nar_prev     ), typeof(nar_prev     ) );
 printf ("%s %s %s\n", "nar_srav     ", length(  nar_srav     ), typeof(nar_srav     ) );
 printf ("%s %s %s\n", "nar_vop      ", length(  nar_vop      ), typeof(nar_vop      ) );
 printf ("%s %s %s\n", "pre_da       ", length(  pre_da       ), typeof(pre_da       ) );
 printf ("%s %s %s\n", "pre_im       ", length(  pre_im       ), typeof(pre_im       ) );
 printf ("%s %s %s\n", "pre_pr       ", length(  pre_pr       ), typeof(pre_pr       ) );
 printf ("%s %s %s\n", "pre_ro       ", length(  pre_ro       ), typeof(pre_ro       ) );
 printf ("%s %s %s\n", "pre_tv       ", length(  pre_tv       ), typeof(pre_tv       ) );
 printf ("%s %s %s\n", "pre_vi       ", length(  pre_vi       ), typeof(pre_vi       ) );
 printf ("%s %s %s\n", "predik       ", length(  predik       ), typeof(predik       ) );
 printf ("%s %s %s\n", "prl_edda     ", length(  prl_edda     ), typeof(prl_edda     ) );
 printf ("%s %s %s\n", "prl_ediv     ", length(  prl_ediv     ), typeof(prl_ediv     ) );
 printf ("%s %s %s\n", "prl_edmsda   ", length(  prl_edmsda   ), typeof(prl_edmsda   ) );
 printf ("%s %s %s\n", "prl_edpr     ", length(  prl_edpr     ), typeof(prl_edpr     ) );
 printf ("%s %s %s\n", "prl_edro     ", length(  prl_edro     ), typeof(prl_edro     ) );
 printf ("%s %s %s\n", "prl_edvr     ", length(  prl_edvr     ), typeof(prl_edvr     ) );
 printf ("%s %s %s\n", "prl_edsrim   ", length(  prl_edsrim   ), typeof(prl_edsrim   ) );
 printf ("%s %s %s\n", "prl_edsrvi   ", length(  prl_edsrvi   ), typeof(prl_edsrvi   ) );
 printf ("%s %s %s\n", "prl_edtv     ", length(  prl_edtv     ), typeof(prl_edtv     ) );
 printf ("%s %s %s\n", "prl_kred     ", length(  prl_kred     ), typeof(prl_kred     ) );
 printf ("%s %s %s\n", "prl_kred_mu  ", length(  prl_kred_mu  ), typeof(prl_kred_mu  ) );
 printf ("%s %s %s\n", "prl_kred_sr  ", length(  prl_kred_sr  ), typeof(prl_kred_sr  ) );
 printf ("%s %s %s\n", "prl_kred_ze  ", length(  prl_kred_ze  ), typeof(prl_kred_ze  ) );
 printf ("%s %s %s\n", "prl_krmn     ", length(  prl_krmn     ), typeof(prl_krmn     ) );
 printf ("%s %s %s\n", "prl_mnda     ", length(  prl_mnda     ), typeof(prl_mnda     ) );
 printf ("%s %s %s\n", "prl_mniv     ", length(  prl_mniv     ), typeof(prl_mniv     ) );
 printf ("%s %s %s\n", "prl_mntv     ", length(  prl_mntv     ), typeof(prl_mntv     ) );
 printf ("%s %s %s\n", "prl_mnvr     ", length(  prl_mnvr     ), typeof(prl_mnvr     ) );
 printf ("%s %s %s\n", "prl_neiz     ", length(  prl_neiz     ), typeof(prl_neiz     ) );
 printf ("%s %s %s\n", "prl_srav     ", length(  prl_srav     ), typeof(prl_srav     ) );
 printf ("%s %s %s\n", "prq_edda     ", length(  prq_edda     ), typeof(prq_edda     ) );
 printf ("%s %s %s\n", "prq_ediv     ", length(  prq_ediv     ), typeof(prq_ediv     ) );
 printf ("%s %s %s\n", "prq_edpr     ", length(  prq_edpr     ), typeof(prq_edpr     ) );
 printf ("%s %s %s\n", "prq_edro     ", length(  prq_edro     ), typeof(prq_edro     ) );
 printf ("%s %s %s\n", "prq_edvr     ", length(  prq_edvr     ), typeof(prq_edvr     ) );
 printf ("%s %s %s\n", "prq_edtv     ", length(  prq_edtv     ), typeof(prq_edtv     ) );
 printf ("%s %s %s\n", "prq_kred     ", length(  prq_kred     ), typeof(prq_kred     ) );
 printf ("%s %s %s\n", "prq_kred_mu  ", length(  prq_kred_mu  ), typeof(prq_kred_mu  ) );
 printf ("%s %s %s\n", "prq_kred_sr  ", length(  prq_kred_sr  ), typeof(prq_kred_sr  ) );
 printf ("%s %s %s\n", "prq_kred_ze  ", length(  prq_kred_ze  ), typeof(prq_kred_ze  ) );
 printf ("%s %s %s\n", "prq_krmn     ", length(  prq_krmn     ), typeof(prq_krmn     ) );
 printf ("%s %s %s\n", "prq_mnda     ", length(  prq_mnda     ), typeof(prq_mnda     ) );
 printf ("%s %s %s\n", "prq_mniv     ", length(  prq_mniv     ), typeof(prq_mniv     ) );
 printf ("%s %s %s\n", "prq_mnvr     ", length(  prq_mnvr     ), typeof(prq_mnvr     ) );
 printf ("%s %s %s\n", "prq_mvtv     ", length(  prq_mvtv     ), typeof(prq_mvtv     ) );
 printf ("%s %s %s\n", "qast         ", length(  qast         ), typeof(qast         ) );
 printf ("%s %s %s\n", "qisl         ", length(  qisl         ), typeof(qisl         ) );
 printf ("%s %s %s\n", "qisl_ed      ", length(  qisl_ed      ), typeof(qisl_ed      ) );
 printf ("%s %s %s\n", "souz         ", length(  souz         ), typeof(souz         ) );
 printf ("%s %s %s\n", "suw_edda     ", length(  suw_edda     ), typeof(suw_edda     ) );
 printf ("%s %s %s\n", "suw_edim     ", length(  suw_edim     ), typeof(suw_edim     ) );
 printf ("%s %s %s\n", "suw_edmuim   ", length(  suw_edmuim   ), typeof(suw_edmuim   ) );
 printf ("%s %s %s\n", "suw_edmuvi   ", length(  suw_edmuvi   ), typeof(suw_edmuvi   ) );
 printf ("%s %s %s\n", "suw_edne     ", length(  suw_edne     ), typeof(suw_edne     ) );
 printf ("%s %s %s\n", "suw_edpr     ", length(  suw_edpr     ), typeof(suw_edpr     ) );
 printf ("%s %s %s\n", "suw_edro     ", length(  suw_edro     ), typeof(suw_edro     ) );
 printf ("%s %s %s\n", "suw_edsq     ", length(  suw_edsq     ), typeof(suw_edsq     ) );
 printf ("%s %s %s\n", "suw_edsrim   ", length(  suw_edsrim   ), typeof(suw_edsrim   ) );
 printf ("%s %s %s\n", "suw_edsrvi   ", length(  suw_edsrvi   ), typeof(suw_edsrvi   ) );
 printf ("%s %s %s\n", "suw_edtv     ", length(  suw_edtv     ), typeof(suw_edtv     ) );
 printf ("%s %s %s\n", "suw_edvi     ", length(  suw_edvi     ), typeof(suw_edvi     ) );
 printf ("%s %s %s\n", "suw_edzeim   ", length(  suw_edzeim   ), typeof(suw_edzeim   ) );
 printf ("%s %s %s\n", "suw_edzevi   ", length(  suw_edzevi   ), typeof(suw_edzevi   ) );
 printf ("%s %s %s\n", "suw_edzv     ", length(  suw_edzv     ), typeof(suw_edzv     ) );
 printf ("%s %s %s\n", "suw_mnda     ", length(  suw_mnda     ), typeof(suw_mnda     ) );
 printf ("%s %s %s\n", "suw_mnne     ", length(  suw_mnne     ), typeof(suw_mnne     ) );
 printf ("%s %s %s\n", "suw_mnpr     ", length(  suw_mnpr     ), typeof(suw_mnpr     ) );
 printf ("%s %s %s\n", "suw_mnro     ", length(  suw_mnro     ), typeof(suw_mnro     ) );
 printf ("%s %s %s\n", "suw_mnsq     ", length(  suw_mnsq     ), typeof(suw_mnsq     ) );
 printf ("%s %s %s\n", "suw_mntv     ", length(  suw_mntv     ), typeof(suw_mntv     ) );
 printf ("%s %s %s\n", "suw_nomniv   ", length(  suw_nomniv   ), typeof(suw_nomniv   ) );
 printf ("%s %s %s\n", "suw_odmnim   ", length(  suw_odmnim   ), typeof(suw_odmnim   ) );
 printf ("%s %s %s\n", "suw_odmnvr   ", length(  suw_odmnvr   ), typeof(suw_odmnvr   ) );
 printf ("%s %s %s\n", "vvod         ", length(  vvod         ), typeof(vvod         ) );

      };

#dbg_arr_infile=1 

  if (dbg_arr_infile==1) { 

 printf ("%s %s %s\n", "deep         ", length(  deep          ), typeof(deep          ) );
 printf ("%s %s %s\n", "gl_ed        ", length(  gl_ed         ), typeof(gl_ed         ) );
 printf ("%s %s %s\n", "gl_edsr      ", length(  gl_edsr       ), typeof(gl_edsr       ) );
 printf ("%s %s %s\n", "gl_edvz      ", length(  gl_edvz       ), typeof(gl_edvz       ) );
 printf ("%s %s %s\n", "gl_in        ", length(  gl_in         ), typeof(gl_in         ) );
 printf ("%s %s %s\n", "gl_nemn      ", length(  gl_nemn       ), typeof(gl_nemn       ) );
 printf ("%s %s %s\n", "gl_pemn      ", length(  gl_pemn       ), typeof(gl_pemn       ) );
 printf ("%s %s %s\n", "gl_pnmn      ", length(  gl_pnmn       ), typeof(gl_pnmn       ) );
 printf ("%s %s %s\n", "gl_vzmn      ", length(  gl_vzmn       ), typeof(gl_vzmn       ) );
 printf ("%s %s %s\n", "hyp1         ", length(  hyp1          ), typeof(hyp1          ) );
 printf ("%s %s %s\n", "hyp2         ", length(  hyp2          ), typeof(hyp2          ) );
 printf ("%s %s %s\n", "mest_ed      ", length(  mest_ed       ), typeof(mest_ed       ) );
 printf ("%s %s %s\n", "mest_it      ", length(  mest_it       ), typeof(mest_it       ) );
 printf ("%s %s %s\n", "mest_mn      ", length(  mest_mn       ), typeof(mest_mn       ) );
 printf ("%s %s %s\n", "mest_mnim    ", length(  mest_mnim     ), typeof(mest_mnim     ) );
 printf ("%s %s %s\n", "mest_nar     ", length(  mest_nar      ), typeof(mest_nar      ) );
 printf ("%s %s %s\n", "mest_da      ", length(  mest_da       ), typeof(mest_da       ) );
 printf ("%s %s %s\n", "mest_im      ", length(  mest_im       ), typeof(mest_im       ) );
 printf ("%s %s %s\n", "mest_ro      ", length(  mest_ro       ), typeof(mest_ro       ) );
 printf ("%s %s %s\n", "mest_vi      ", length(  mest_vi       ), typeof(mest_vi       ) );
 printf ("%s %s %s\n", "nar_obme     ", length(  nar_obme      ), typeof(nar_obme      ) );
 printf ("%s %s %s\n", "nar_obna     ", length(  nar_obna      ), typeof(nar_obna      ) );
 printf ("%s %s %s\n", "nar_obpr     ", length(  nar_obpr      ), typeof(nar_obpr      ) );
 printf ("%s %s %s\n", "nar_obvr     ", length(  nar_obvr      ), typeof(nar_obvr      ) );
 printf ("%s %s %s\n", "nar_opka     ", length(  nar_opka      ), typeof(nar_opka      ) );
 printf ("%s %s %s\n", "nar_opsp     ", length(  nar_opsp      ), typeof(nar_opsp      ) );
 printf ("%s %s %s\n", "nar_opst     ", length(  nar_opst      ), typeof(nar_opst      ) );
 printf ("%s %s %s\n", "nar_srav     ", length(  nar_srav      ), typeof(nar_srav      ) );
 printf ("%s %s %s\n", "pre_da       ", length(  pre_da        ), typeof(pre_da        ) );
 printf ("%s %s %s\n", "pre_pr       ", length(  pre_pr        ), typeof(pre_pr        ) );
 printf ("%s %s %s\n", "pre_ro       ", length(  pre_ro        ), typeof(pre_ro        ) );
 printf ("%s %s %s\n", "pre_vi       ", length(  pre_vi        ), typeof(pre_vi        ) );
 printf ("%s %s %s\n", "predik       ", length(  predik        ), typeof(predik        ) );
 printf ("%s %s %s\n", "prl_ediv     ", length(  prl_ediv      ), typeof(prl_ediv      ) );
 printf ("%s %s %s\n", "prl_edmsda   ", length(  prl_edmsda    ), typeof(prl_edmsda    ) );
 printf ("%s %s %s\n", "prl_edpr     ", length(  prl_edpr      ), typeof(prl_edpr      ) );
 printf ("%s %s %s\n", "prl_edro     ", length(  prl_edro      ), typeof(prl_edro      ) );
 printf ("%s %s %s\n", "prl_edsrim   ", length(  prl_edsrim    ), typeof(prl_edsrim    ) );
 printf ("%s %s %s\n", "prl_edsrvi   ", length(  prl_edsrvi    ), typeof(prl_edsrvi    ) );
 printf ("%s %s %s\n", "prl_edvr     ", length(  prl_edvr      ), typeof(prl_edvr      ) );
 printf ("%s %s %s\n", "prl_kred     ", length(  prl_kred      ), typeof(prl_kred      ) );
 printf ("%s %s %s\n", "prl_kred_sr  ", length(  prl_kred_sr   ), typeof(prl_kred_sr   ) );
 printf ("%s %s %s\n", "prl_krmn     ", length(  prl_krmn      ), typeof(prl_krmn      ) );
 printf ("%s %s %s\n", "prl_mniv     ", length(  prl_mniv      ), typeof(prl_mniv      ) );
 printf ("%s %s %s\n", "prl_mnvr     ", length(  prl_mnvr      ), typeof(prl_mnvr      ) );
 printf ("%s %s %s\n", "prl_srav     ", length(  prl_srav      ), typeof(prl_srav      ) );
 printf ("%s %s %s\n", "prq_ediv     ", length(  prq_ediv      ), typeof(prq_ediv      ) );
 printf ("%s %s %s\n", "prq_edro     ", length(  prq_edro      ), typeof(prq_edro      ) );
 printf ("%s %s %s\n", "prq_kred     ", length(  prq_kred      ), typeof(prq_kred      ) );
 printf ("%s %s %s\n", "prq_krmn     ", length(  prq_krmn      ), typeof(prq_krmn      ) );
 printf ("%s %s %s\n", "prq_mniv     ", length(  prq_mniv      ), typeof(prq_mniv      ) );
 printf ("%s %s %s\n", "prq_mnvr     ", length(  prq_mnvr      ), typeof(prq_mnvr      ) );
 printf ("%s %s %s\n", "qast         ", length(  qast          ), typeof(qast          ) );
 printf ("%s %s %s\n", "qisl         ", length(  qisl          ), typeof(qisl          ) );
 printf ("%s %s %s\n", "souz         ", length(  souz          ), typeof(souz          ) );
 printf ("%s %s %s\n", "suw_edda     ", length(  suw_edda      ), typeof(suw_edda      ) );
 printf ("%s %s %s\n", "suw_edim     ", length(  suw_edim      ), typeof(suw_edim      ) );
 printf ("%s %s %s\n", "suw_edpr     ", length(  suw_edpr      ), typeof(suw_edpr      ) );
 printf ("%s %s %s\n", "suw_edro     ", length(  suw_edro      ), typeof(suw_edro      ) );
 printf ("%s %s %s\n", "suw_edsrim   ", length(  suw_edsrim    ), typeof(suw_edsrim    ) );
 printf ("%s %s %s\n", "suw_edsrvi   ", length(  suw_edsrvi    ), typeof(suw_edsrvi    ) );
 printf ("%s %s %s\n", "suw_edtv     ", length(  suw_edtv      ), typeof(suw_edtv      ) );
 printf ("%s %s %s\n", "suw_edvi     ", length(  suw_edvi      ), typeof(suw_edvi      ) );
 printf ("%s %s %s\n", "suw_mnda     ", length(  suw_mnda      ), typeof(suw_mnda      ) );
 printf ("%s %s %s\n", "suw_mnpr     ", length(  suw_mnpr      ), typeof(suw_mnpr      ) );
 printf ("%s %s %s\n", "suw_mnro     ", length(  suw_mnro      ), typeof(suw_mnro      ) );
 printf ("%s %s %s\n", "suw_mntv     ", length(  suw_mntv      ), typeof(suw_mntv      ) );
 printf ("%s %s %s\n", "suw_nomniv   ", length(  suw_nomniv    ), typeof(suw_nomniv    ) );
 printf ("%s %s %s\n", "suw_odmnim   ", length(  suw_odmnim    ), typeof(suw_odmnim    ) );
 printf ("%s %s %s\n", "suw_odmnvr   ", length(  suw_odmnvr    ), typeof(suw_odmnvr    ) );

      };
 
  }
 
