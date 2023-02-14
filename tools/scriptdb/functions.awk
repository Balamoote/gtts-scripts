# Библиотека различных функций обработки текста
# Последняя версия файла тут: https://github.com/Balamoote/gtts-scripts
# служебные фунции
function readfile(file,  tmp, save_rs)            # Функция чтения файла в скаляр
                { save_rs = RS; RS = "^$"; getline tmp < file; close(file); RS = save_rs; return tmp }
function joinpat(array, seps, nuf,    rett, i, k) # Склеить строку обратно
                { rett = seps [0]; for (i=1; i<= nuf; i++) {rett = rett array[i] seps[i]}; return rett }
function pusha(arr, arrto,    k)                  # добывать массив выдать 1-й символ строки-сеператора
                { for (k in arr) {arrto[k]}; }
function stoar(string, arrto, sepr,    i,arrt)    # добывать массив выдать 1-й символ строки-сеператора
                { split(string, arrt, sepr); for (i in arrt) {arrto[arrt[i]]}; delete arrt; }
function hyphback(hystring,  hyw)                 # Склеить слова с дефисом, присутствующие в словаре
                {if (hystring ~ hysnip) { for (i=1; i<=nf-1; i++) { if ( se(0,"-") ) { hyw = lc(0) sep[i] lc(1); if ( hyw in dichyph )
                { l[i] = l[i] sep[i] l[i+1]; delete sep[i]; delete l[i+1]; nf=arrpack(i+1, l); arrpack(i, sep) }; }; }; };}
function splitline(instring,    rett)             # Разбить строку на слова
                { rett=patsplit(instring,l,patword,sep); return rett }
function regwpart(word, part,    rett)            # Получить заменяемую часть слова в нужном регистре
                { rett=substr(word,index(tolower(word),part),length(part)); return rett }
function getwpos(word,    n)                      # Получить адрес слова в строке, Без учёта регистра
                { for(n=1;n<=nf;n++) {if(tolower(l[n])==word) wpos[n]} }
function regwpos(word,    n)                      # Получить адрес слова в строке, с учётом регистра
                { for(n=1;n<=nf;n++) {if(l[n]==word) wpos[n]} }
function arrpack(n, array,   i, rett)             # устранить пропуск в массиве
                { rett = length(array); for (i=n; i<=rett; i++) {array[i] = array[i+1]}; delete array[rett+1]; return rett }
function omakevars(basearr,xklass)                # определить переменные iwrd, winfo, somo
                { iwrd=tolower(wrd);winfo=basearr["info"][iwrd];wln=split(omap[xklass][wrd],omlin," ");
                  omo1=basearr[xclass[xklass][1]][wrd];omo2=basearr[xclass[xklass][2]][wrd];omo3=basearr[xclass[xklass][3]][wrd] }
function makebookvars()                           # определить переменные iwrd, winfo, somo
                { b=strtonum(omlin[y]);nf=splitline(book[b]);hyphback(book[b]);regwpos(wrd); prex="" }
function makebookvars_nohyphback()                # определить переменные iwrd, winfo, somo
                { b=strtonum(omlin[y]);nf=splitline(book[b]);regwpos(wrd); prex="" }

# функции обработки слов
function s1(n,wl,    rett)                        # выдать 1-й символ строки-сеператора
                { if( substr(sep[i+n],1,1) == wl ) {rett=1} else {rett=0}; return rett }
function lc(n,   rett)                            # перевести в нижний гегистр
                { rett = gensub(unxy,"","g",tolower(l[i+n])); return rett }
function q_(n, array,    el, rett)                # слово в БАЗОВОМ массиве?
                { if(lc(n) in array) {rett=1} else {rett=0}; return rett}
function qq(m, n,    rett)                        # слово m равно слово n?
                { if ( lc(m) == lc(n) ) {rett=1} else {rett=0}; return rett}
function qb(n, isclass,    k, rett)               # поиск на n шагов назад наличия слова в классе
                { rett=qbn=""; for (k=-1; k>=n; k--) { if ( @isclass(k) ) {rett=1; qbn=k; break}; }; return rett }
function qf(n, isclass,    k, rett)               # поиск на n шагов вперёд наличия слова в классе
                { rett=qfn=""; for (k= 1; k<=n; k++) { if ( @isclass(k) ) {rett=1; qfn=k; break}; }; return rett }
function Qb(n, isclass,    k, rett)               # поиск на n шагов назад отсутствия слова в слассе
                { rett=1; for (k=-1; k>=n; k--)   { if ( @isclass(k) ) {rett=0; break}; }; return rett }
function Qf(n, isclass,    k, rett)               # поиск на n шагов вперёд отсутствия слова в классе
                { rett=1; for (k= 1; k<=n; k++)   { if ( @isclass(k) ) {rett=0; break}; }; return rett }
function Q(n, isclass,    rett)                   # слово НЕ в классе?
                { if ( @isclass(n) ) {rett=0} else {rett=1}; return rett }
function qb_(n, array,    k, rett)                # поиск на n шагов назад наличия слова в БАЗОВОМ массиве
                { rett=0; qbn=""; for (k=-1; k>=n; k--) { if (lc(k) in array) {rett=1; qbn=k; break}; }; return rett }
function qf_(n, array,    k, rett)                # поиск на n шагов вперёд наличия слова в БАЗОВОМ массиве
                { rett=0; qfn=""; for (k= 1; k<=n; k++) { if (lc(k) in array) {rett=1; qfn=k; break}; }; return rett }
function Qb_(n, array,    k, rett)                # поиск на n шагов назад отсутствия слова в БАЗОВОМ массиве
                { rett=1; for (k=-1; k>=n; k--)   { if (lc(k) in array) {rett=0; break}; }; return rett }
function Qf_(n, array,    k, rett)                # поиск на n шагов вперёд отсутствия слова в БАЗОВОМ массиве
                { rett=1; for (k= 1; k<=n; k++)   { if (lc(k) in array) {rett=0; break}; }; return rett }
function Q_(n, array,    rett)                    # слово НЕ в БАЗОВОМ массиве?
                { if (lc(n) in array) {rett=0} else {rett=1}; return rett }
function p(n,wl,    rett)                         # разделитель содержит препинания, кроме указанных wl?
                { if(length(wl)) {if(sep[i+n]~"[p…,.:;!?—]" && sep[i+n]!~wl){rett=1} else {rett=0}} else {if( sep[i+n]~"[p…,.:;!?—]"){rett=1} else {rett=0}}; return rett}
function cap(n,    el, rett)                      # Слово с заглавной буквы?
                { el = l[i+n]; if ( substr(el,1,1) ~ RUUC ) {rett=1} else {rett=0}; return rett }
function m(wl,    wrds, k, el, lk, rett)          # нахождение в списке? = "одно из слов"
                { lk=split(wl, wrds, "[ |]"); for (k=1; k<=lk; k++) { el = "_" wrds[k] "_"; if (fi3 ~ el) {rett=1; break} else {rett=0};}; return rett }
function w(n, wl,    wrds, rett)                  # нахождение в списке? = "одно из слов"
                { stoar(wl, wrds, "[ |]"); if (lc(n) in wrds) {rett=1} else {rett=0}; return rett }
function wist(n, wl,    wrds, rett)               # нахождение в списке? = "одно из слов" ist = слово со всеми правками
                { stoar(wl, wrds, "[ |]"); if (tolower(l[i+n]) in wrds) {rett=1} else {rett=0}; return rett }
function isw(n, wl,    rett)                      # слово = "слово"
                { if (tolower(l[i+n]) == wl) {rett=1} else {rett=0}; return rett }
function we(n, wl,    rett)                       # слово = "слово" с очисткой
                { if (lc(n) == wl) {rett=1} else {rett=0}; return rett }
function wc(n, wl,    wrds, k, lk, rett)          # нахождение части слова в списке? = "один из набора"
                { lk=split(wl, wrds, "[ |]"); for (k=1; k<=lk; k++) { if (lc(n)~wrds[k]) {rett=1; break} else {rett=0};}; return rett }
function wv(n, wl,    wrds, k, lk, rett)          # НЕ нахождение части слова в списке? = "один из набора"
                { lk=split(wl, wrds, "[ |]"); for (k=1; k<=lk; k++) { if (lc(n)~wrds[k]) {rett=0; break} else {rett=1};}; return rett }
function W(n, wl,    wrds, rett)                  # НЕнахождение в списке? != "одно из слов"
                { stoar(wl, wrds, "[ |]"); if (lc(n) in wrds) {rett=0} else {rett=1}; return rett }
function wb(n, wl,    wrds, k, rett)              # поиск на n шагов назад слова из списка
                { rett=0; wbn=""; stoar(wl, wrds, "[ |]"); for (k=-1; k>=n; k--) { if (lc(k) in wrds) {rett=1; wbn=k; break};}; return rett }
function wb_raw(n, wl,    wrds, k, rett)          # поиск на n шагов назад слова из списка
                { rett=0; wbn=""; stoar(wl, wrds, "[ |]"); for (k=-1; k>=n; k--) { if (tolower(l[i+k]) in wrds) {rett=1; wbn=k; break};}; return rett }
function wf(n, wl,    wrds, k, rett)              # поиск на n шагов вперёд наличия слова в массиве
                { rett=0; wfn=""; stoar(wl, wrds, "[ |]"); for (k= 1; k<=n; k++) { if (lc(k) in wrds) {rett=1; wfn=k; break};}; return rett }
function s(m, n,    k, rett)                      # разделители в диапазоне НЕ содержат препинаний? = пробел (не видит дефис)
                { for (k=m; k<=n; k++) { if (sep[i+k] ~ "[…,.:;!?—]" ) {rett=0; break} else {rett=1}; }; return rett }
function sc(n, sym,    el, k, rett)               # поиск символа в разделителе: "содержит"
                { el = sep[i+n]; if (el ~ sym)    {rett=1} else {rett=0}; return rett }
function se(n, sym,    el, k, rett)               # разделитель "равен"
                { el = sep[i+n]; if (el == sym)   {rett=1} else {rett=0}; return rett }
function sv(m, n, pu,    k, rett)                 # разделители в диапазоне НЕ содержат препинания pu
                { for (k=m; k<=n; k++) { if (sep[i+k] ~ pu) {rett=0; break} else {rett=1}; }; return rett }
function vv(n,    k, rett)                        # выдать границы вводного предложения: , и —, n= первая запятая
                {vvn="";rett=0; if(sep[i+n]~vvpat) {for(k=++n;k<=n+7;k++) {if(sep[i+k] !~ "[….:;!?]") {if(sep[i+k]~vvpat) {rett=1;vvn=k;break};};};}; return rett}
function vvb(n,    k, rett)                       # выдать границы вводного предложения: , и —, n= первая запятая
                {vvn="";rett=0; if(sep[i+n]~vvpat) {for(k=--n;k>=n-7;k--) {if(sep[i+k] !~ "[….:;!?]") {if(sep[i+k]~vvpat) {rett=1;vvn=k;break};};};}; return rett}
function phs(n, wl,    wrds, k, lk, cnt, rett)    # кусок фразы ДО слова
                {hsn="";lk=split(wl,wrds," "); for(k=1;k<=lk;k++) {if(lc(k+n-lk)==wrds[k]) {cnt++} else {cnt=0; break};};
                    if(cnt==lk) {rett=1; hsn=n-lk} else {rett=0}; return rett}
function phf(n, wl,    wrds, k, lk, cnt, rett)    # кусок фразы ПОСЛЕ слова
                {hfn="";lk=split(wl,wrds," "); for(k=1;k<=lk;k++) {if(lc(n+k-1)==wrds[k]) {cnt++} else {cnt=0; break};};
                    if(cnt==lk) {rett=1;hfn=n+lk} else {rett=0}; return rett}
function ismark(n,mrk,    k, el, marka, rett)     # нахождение слова в метке, начинающейся с mrk (переменная winfo): для управления омонимами из automo.gz
                { el="_" tolower(l[i+n]) "_";marka= "^" mrk;split(winfo,wrds,"#");for(k in wrds){if(wrds[k]~marka&&wrds[k]~el){rett=1;break}else{rett=0};}; return rett }
function notmark(n,mrk,    k, el, marka, rett)    # НЕ нахождение слова в метке, начинающейся с mrk (переменная winfo): для управления омонимами из automo.gz
                { el="_" tolower(l[i+n]) "_";marka= "^" mrk;split(winfo,wrds,"#");for(k in wrds){if(wrds[k]~marka&&wrds[k]~el){rett=0;break}else{rett=1};}; return rett }
function notsym(n,sym,    rett)                   # НЕ нахождение символа в слове
                { if (l[i+n] !~ sym) {rett=1} else {rett=0}; return rett }


# функции проверки принадлежности к классам. "Классы" собираются из "базовых массивов", которые формируются при чтении словаря посредством classes.awk
# география
function geo_sr(n,        wd,rett) { wd = lc(n); if (wd in geo_edsrim)                                                                        {rett=1} else {rett=0};  return rett}
function geo_mn(n,        wd,rett) { wd = lc(n); if (wd in geo_mnim)                                                                          {rett=1} else {rett=0};  return rett}
                                                                                                                                              
# глаголы кастомных классов                                                                                                                   
function glc_mn(n,wl,     el,k,wrds,wd,rett) { if(wl=="") { wd = lc(n); if (wd in gc_mn)                                                      {rett=1} else {rett=0}}  else
                                             { stoar(wl,wrds," ");for(k in wrds){el="_" k "_"; wd=lc(n); if(wd in gc_mn && gc_mn[wd]~el){rett=1;break} else {rett=0}}};return rett}
function glc_in(n,wl,     el,k,wrds,wd,rett) { if(wl=="") { wd = lc(n); if (wd in gc_in)                                                      {rett=1} else {rett=0}}  else
                                             { stoar(wl,wrds," ");for(k in wrds){el="_" k "_"; wd=lc(n); if(wd in gc_in && gc_in[wd]~el){rett=1;break} else {rett=0}}};return rett}
function glc_po(n,wl,     el,k,wrds,wd,rett) { if(wl=="") { wd = lc(n); if (wd in gc_po)                                                      {rett=1} else {rett=0}}  else
                                             { stoar(wl,wrds," ");for(k in wrds){el="_" k "_"; wd=lc(n); if(wd in gc_po && gc_po[wd]~el){rett=1;break} else {rett=0}}};return rett}
                          
# модальные слова         
function mod_bz(n,wl,     el,k,wrds,wd,rett) { if(wl=="") { wd = lc(n); if (wd in md_bz)                                                      {rett=1} else {rett=0}}  else
                                             { stoar(wl,wrds," ");for(k in wrds){el="_" k "_"; wd=lc(n); if(wd in md_bz && md_bz[wd]~el){rett=1;break} else {rett=0}}};return rett}
function mod_ed(n,wl,     el,k,wrds,wd,rett) { if(wl=="") { wd = lc(n); if (wd in md_ed)                                                      {rett=1} else {rett=0}}  else
                                             { stoar(wl,wrds," ");for(k in wrds){el="_" k "_"; wd=lc(n); if(wd in md_ed && md_ed[wd]~el){rett=1;break} else {rett=0}}};return rett}
function mod_mn(n,wl,     el,k,wrds,wd,rett) { if(wl=="") { wd = lc(n); if (wd in md_mn)                                                      {rett=1} else {rett=0}}  else
                                             { stoar(wl,wrds," ");for(k in wrds){el="_" k "_"; wd=lc(n); if(wd in md_mn && md_mn[wd]~el){rett=1;break} else {rett=0}}};return rett}
#function mod_bz(n,        wd,rett) { fi3 =""; wd = lc(n); if (wd in md_bz)                                                      {fi3=md_bz[wd]; rett=1} else {rett=0}; return rett}
#function mod_ed(n,        wd,rett) { fi3 =""; wd = lc(n); if (wd in md_ed)                                                      {fi3=md_ed[wd]; rett=1} else {rett=0}; return rett}
#function mod_mn(n,        wd,rett) { fi3 =""; wd = lc(n); if (wd in md_mn)                                                      {fi3=md_mn[wd]; rett=1} else {rett=0}; return rett}
                          
# кастомные наречия       
function narc_srav(n,     wd,rett) { wd = lc(n); if (wd in nrc_srv)                                                                            {rett=1} else {rett=0}; return rett}
function narc_kaq(n,      wd,rett) { wd = lc(n); if (wd in nrc_opka)                                                                           {rett=1} else {rett=0}; return rett}
function narc_spos(n,     wd,rett) { wd = lc(n); if (wd in nrc_opsp)                                                                           {rett=1} else {rett=0}; return rett}
function narc_step(n,     wd,rett) { wd = lc(n); if (wd in nrc_opst)                                                                           {rett=1} else {rett=0}; return rett}
function narc_vrem(n,     wd,rett) { wd = lc(n); if (wd in nrc_obvr)                                                                           {rett=1} else {rett=0}; return rett}
function narc_mest(n,     wd,rett) { wd = lc(n); if (wd in nrc_obme||wd in nrc_mest)                                                           {rett=1} else {rett=0}; return rett}
function narc_napr(n,     wd,rett) { wd = lc(n); if (wd in nrc_obna)                                                                           {rett=1} else {rett=0}; return rett}
function narc_priq(n,     wd,rett) { wd = lc(n); if (wd in nrc_obpr)                                                                           {rett=1} else {rett=0}; return rett}
function narc_cel(n,      wd,rett) { wd = lc(n); if (wd in nrc_obce)                                                                           {rett=1} else {rett=0}; return rett}
function narc_vopr(n,     wd,rett) { wd = lc(n); if (wd in nrc_vopr)                                                                           {rett=1} else {rett=0}; return rett}
function narc_prev(n,     wd,rett) { wd = lc(n); if (wd in nrc_pv)                                                                             {rett=1} else {rett=0}; return rett}
function narc_nar(n,      wd,rett) { wd = lc(n); if (wd in nrc_nar)                                                                            {rett=1} else {rett=0}; return rett}

# принадлежность к классам существительных-омографов по падежам (например, для prem_vi и т.д.)
function omsw_im(n,       wd,rett) { wd = lc(n); if (wd in osw_edmu_im||wd in osw_edze_im||wd in osw_edsr_im||wd in osw_mn_im||
	                                             wd in osw_edmu_ne||wd in osw_edze_ne||wd in osw_edsr_ne)                                  {rett=1} else {rett=0}; return rett}
function omsw_vi(n,       wd,rett) { wd = lc(n); if (wd in osw_edmu_vi||wd in osw_edze_vi||wd in osw_edsr_vi||wd in osw_mn_vi||
                                                     wd in osw_edmu_ne||wd in osw_edze_ne||wd in osw_edsr_ne)                                  {rett=1} else {rett=0}; return rett}
function omsw_ro(n,       wd,rett) { wd = lc(n); if (wd in osw_edmu_ro||wd in osw_edze_ro||wd in osw_edsr_ro||wd in osw_mn_ro||
                                                     wd in osw_edmu_ne||wd in osw_edze_ne||wd in osw_edsr_ne)                                  {rett=1} else {rett=0}; return rett}
function omsw_da(n,       wd,rett) { wd = lc(n); if (wd in osw_edmu_da||wd in osw_edze_da||wd in osw_edsr_da||wd in osw_mn_da||
                                                     wd in osw_edmu_ne||wd in osw_edze_ne||wd in osw_edsr_ne)                                  {rett=1} else {rett=0}; return rett}
function omsw_tv(n,       wd,rett) { wd = lc(n); if (wd in osw_edmu_tv||wd in osw_edze_tv||wd in osw_edsr_tv||wd in osw_mn_tv||
                                                     wd in osw_edmu_ne||wd in osw_edze_ne||wd in osw_edsr_ne)                                  {rett=1} else {rett=0}; return rett}
function omsw_pr(n,       wd,rett) { wd = lc(n); if (wd in osw_edmu_pr||wd in osw_edze_pr||wd in osw_edsr_pr||wd in osw_mn_pr||
                                                     wd in osw_edmu_ne||wd in osw_edze_ne||wd in osw_edsr_ne)                                  {rett=1} else {rett=0}; return rett}

# указательные местоимения
function muk_edim(n,      wd,rett) { wd = lc(n); if (wd in muc_edmuim||wd in muc_edzeim||wd in muc_edsrim)                                     {rett=1} else {rett=0}; return rett}
function muk_edvi(n,      wd,rett) { wd = lc(n); if (wd in muc_edmuvi||wd in muc_edzevi||wd in muc_edsrvi)                                     {rett=1} else {rett=0}; return rett}
function muk_edda(n,      wd,rett) { wd = lc(n); if (wd in muc_edmuda||wd in muc_edzeda||wd in muc_edsrda)                                     {rett=1} else {rett=0}; return rett}
function muk_edro(n,      wd,rett) { wd = lc(n); if (wd in muc_edmuro||wd in muc_edzero||wd in muc_edsrro)                                     {rett=1} else {rett=0}; return rett}
function muk_edtv(n,      wd,rett) { wd = lc(n); if (wd in muc_edmutv||wd in muc_edzetv||wd in muc_edsrtv)                                     {rett=1} else {rett=0}; return rett}
function muk_edpr(n,      wd,rett) { wd = lc(n); if (wd in muc_edmupr||wd in muc_edzepr||wd in muc_edsrpr)                                     {rett=1} else {rett=0}; return rett}
function muk_ed(n,        wd,rett) { if (muk_edim(n)||muk_edvi(n)||muk_edda(n)||muk_edro(n)||muk_edtv(n)||muk_edpr(n))                         {rett=1} else {rett=0}; return rett}
function muk_mnim(n,      wd,rett) { wd = lc(n); if (wd in muc_mnim)                                                                           {rett=1} else {rett=0}; return rett}
function muk_mnvi(n,      wd,rett) { wd = lc(n); if (wd in muc_mnvi)                                                                           {rett=1} else {rett=0}; return rett}
function muk_mnda(n,      wd,rett) { wd = lc(n); if (wd in muc_mnda)                                                                           {rett=1} else {rett=0}; return rett}
function muk_mnro(n,      wd,rett) { wd = lc(n); if (wd in muc_mnro)                                                                           {rett=1} else {rett=0}; return rett}
function muk_mntv(n,      wd,rett) { wd = lc(n); if (wd in muc_mntv)                                                                           {rett=1} else {rett=0}; return rett}
function muk_mnpr(n,      wd,rett) { wd = lc(n); if (wd in muc_mnpr)                                                                           {rett=1} else {rett=0}; return rett}
function muk_mn(n,        wd,rett) { wd = lc(n); if (wd in muc_mnim||wd in muc_mnvi||wd in muc_mnda||wd in muc_mnro||wd in muc_mntv||
                                                     wd in muc_mnpr)                                                                           {rett=1} else {rett=0}; return rett}

# кастомные местоимения
function mest_it(n,       wd,rett) { wd = lc(n); if (wd in mst_it && sep[i+n-1]!="-")                                                          {rett=1} else {rett=0}; return rett}
function mest_pedmuim(n,  wd,rett) { wd = lc(n); if (wd in mstc_edmupr && sep[i+n-1]!="-")                                                     {rett=1} else {rett=0}; return rett}
function mest_pedmuro(n,  wd,rett) { wd = lc(n); if (wd in mstc_edmuro && sep[i+n-1]!="-")                                                     {rett=1} else {rett=0}; return rett}
function mest_pedmuda(n,  wd,rett) { wd = lc(n); if (wd in mstc_edmuda && sep[i+n-1]!="-")                                                     {rett=1} else {rett=0}; return rett}
function mest_pedmutv(n,  wd,rett) { wd = lc(n); if (wd in mstc_edmutv && sep[i+n-1]!="-")                                                     {rett=1} else {rett=0}; return rett}
function mest_pedmupr(n,  wd,rett) { wd = lc(n); if (wd in mstc_edmupr && sep[i+n-1]!="-")                                                     {rett=1} else {rett=0}; return rett}
function mest_pmnim(n,    wd,rett) { wd = lc(n); if (wd in mstc_mnim   && sep[i+n-1]!="-")                                                     {rett=1} else {rett=0}; return rett}

# двойственное число
function qi_duom(n,       wd,rett) { wd = lc(n); if (wd in qd_duom)                                                                            {rett=1} else {rett=0}; return rett}
function qi_duoz(n,       wd,rett) { wd = lc(n); if (wd in qd_duoz)                                                                            {rett=1} else {rett=0}; return rett}

# кастомные предлоги
# возможен однин падеж
function prex_im(n,       wd,rett) { wd = lc(n); if (wd in predc_im)                                                                           {rett=1} else {rett=0}; return rett}
function prex_vi(n,       wd,rett) { wd = lc(n); if (wd in predc_vi)                                                                           {rett=1} else {rett=0}; return rett}
function prex_ro(n,       wd,rett) { wd = lc(n); if (wd in predc_ro)                                                                           {rett=1} else {rett=0}; return rett}
function prex_da(n,       wd,rett) { wd = lc(n); if (wd in predc_da)                                                                           {rett=1} else {rett=0}; return rett}
function prex_tv(n,       wd,rett) { wd = lc(n); if (wd in predc_tv)                                                                           {rett=1} else {rett=0}; return rett}
function prex_pr(n,       wd,rett) { wd = lc(n); if (wd in predc_pr)                                                                           {rett=1} else {rett=0}; return rett}
# возможны несколько падежей
function prem_imvipr(n,   wd,rett) { wd = lc(n); if (wd in predc_imvipr)                                                                       {rett=1} else {rett=0}; return rett}
function prem_vipr(n,     wd,rett) { wd = lc(n); if (wd in predc_vipr)                                                                         {rett=1} else {rett=0}; return rett}
function prem_vitv(n,     wd,rett) { wd = lc(n); if (wd in predc_vitv)                                                                         {rett=1} else {rett=0}; return rett}
function prem_rotv(n,     wd,rett) { wd = lc(n); if (wd in predc_rotv)                                                                         {rett=1} else {rett=0}; return rett}
function prem_virotv(n,   wd,rett) { wd = lc(n); if (wd in predc_virotv)                                                                       {rett=1} else {rett=0}; return rett}
function prem_vidapr(n,   wd,rett) { wd = lc(n); if (wd in predc_vidapr)                                                                       {rett=1} else {rett=0}; return rett}

# прилагательные                                                                                                                              
function prl_kred_mu(n,   wd,rett) { wd = lc(n); if (wd in pl_kred_mu)                                                                         {rett=1} else {rett=0}; return rett}
function prl_kred_ze(n,   wd,rett) { wd = lc(n); if (wd in pl_kred_ze)                                                                         {rett=1} else {rett=0}; return rett}
function prl_kred_sr(n,   wd,rett) { wd = lc(n); if (wd in pl_kred_sr)                                                                         {rett=1} else {rett=0}; return rett}
function prl_kred(n,      wd,rett) { wd = lc(n); if (wd in pl_kred_mu||wd in pl_kred_ze||wd in pl_kred_sr)                                     {rett=1} else {rett=0}; return rett}
function prl_krmn(n,      wd,rett) { wd = lc(n); if (wd in pl_krmn)                                                                            {rett=1} else {rett=0}; return rett}
function prl_srav(n,      wd,rett) { wd = lc(n); if (wd in pl_srv)                                                                             {rett=1} else {rett=0}; return rett}
function prl_neiz(n,      wd,rett) { wd = lc(n); if (wd in pl_neiz)                                                                            {rett=1} else {rett=0}; return rett}
function prl_edmuim(n,    wd,rett) { wd = lc(n); if (wd in pl_edmu_im||wd in pl_pv_edmu_im)                                                    {rett=1} else {rett=0}; return rett}
function prl_edmuvi(n,    wd,rett) { wd = lc(n); if (wd in pl_edmu_im||wd in pl_pv_edmu_im||wd in pl_edmu_ro||wd in pl_pv_edmu_ro)             {rett=1} else {rett=0}; return rett}
function prl_edmuro(n,    wd,rett) { wd = lc(n); if (wd in pl_edmu_ro||wd in pl_pv_edmu_ro)                                                    {rett=1} else {rett=0}; return rett}
function prl_edmuda(n,    wd,rett) { wd = lc(n); if (wd in pl_edmu_da||wd in pl_pv_edmu_da)                                                    {rett=1} else {rett=0}; return rett}
function prl_edmutv(n,    wd,rett) { wd = lc(n); if (wd in pl_edmu_tv||wd in pl_pv_edmu_tv)                                                    {rett=1} else {rett=0}; return rett}
function prl_edmupr(n,    wd,rett) { wd = lc(n); if (wd in pl_edmu_pr||wd in pl_pv_edmu_pr)                                                    {rett=1} else {rett=0}; return rett}
function prl_edsrim(n,    wd,rett) { wd = lc(n); if (wd in pl_edsr_im||wd in pl_pv_edsr_im)                                                    {rett=1} else {rett=0}; return rett}
function prl_edsrvi(n,    wd,rett) { wd = lc(n); if (wd in pl_edsr_im||wd in pl_pv_edsr_im)                                                    {rett=1} else {rett=0}; return rett}
function prl_edsrro(n,    wd,rett) { wd = lc(n); if (wd in pl_edsr_ro||wd in pl_pv_edsr_ro)                                                    {rett=1} else {rett=0}; return rett}
function prl_edsrda(n,    wd,rett) { wd = lc(n); if (wd in pl_edsr_da||wd in pl_pv_edsr_da)                                                    {rett=1} else {rett=0}; return rett}
function prl_edsrtv(n,    wd,rett) { wd = lc(n); if (wd in pl_edsr_tv||wd in pl_pv_edsr_tv)                                                    {rett=1} else {rett=0}; return rett}
function prl_edsrpr(n,    wd,rett) { wd = lc(n); if (wd in pl_edsr_pr||wd in pl_pv_edsr_pr)                                                    {rett=1} else {rett=0}; return rett}
function prl_edzeim(n,    wd,rett) { wd = lc(n); if (wd in pl_edze_im||wd in pl_pv_edze_im)                                                    {rett=1} else {rett=0}; return rett}
function prl_edzevi(n,    wd,rett) { wd = lc(n); if (wd in pl_edze_dr||wd in pl_pv_edze_dr)                                                    {rett=1} else {rett=0}; return rett}
function prl_edzero(n,    wd,rett) { wd = lc(n); if (wd in pl_edze_dr||wd in pl_pv_edze_dr)                                                    {rett=1} else {rett=0}; return rett}
function prl_edzeda(n,    wd,rett) { wd = lc(n); if (wd in pl_edze_dr||wd in pl_pv_edze_dr)                                                    {rett=1} else {rett=0}; return rett}
function prl_edzetv(n,    wd,rett) { wd = lc(n); if (wd in pl_edze_tv||wd in pl_pv_edze_tv||wd in pl_edze_dr||wd in pl_pv_edze_dr)             {rett=1} else {rett=0}; return rett}
function prl_edzepr(n,    wd,rett) { wd = lc(n); if (wd in pl_edze_dr||wd in pl_pv_edze_dr)                                                    {rett=1} else {rett=0}; return rett}
function prl_edim(n,                                                                                                                           wd,rett) { wd = lc(n);
                      if (wd in pl_edmu_im||wd in pl_edsr_im||wd in pl_edze_im||wd in pl_pv_edmu_im||wd in pl_pv_edsr_im||wd in pl_pv_edze_im) {rett=1} else {rett=0}; return rett}
function prl_edvi(n,                                                                                                                           wd,rett) { wd = lc(n);
                      if (wd in pl_edmu_im||wd in pl_edmu_ro||wd in pl_edsr_im||wd in pl_edze_dr||wd in pl_pv_edmu_im||wd in pl_pv_edmu_ro||    
                          wd in pl_pv_edsr_im||wd in pl_pv_edze_dr)                                                                            {rett=1} else {rett=0}; return rett}
function prl_edro(n,                                                                                                                           wd,rett) { wd = lc(n);
                      if (wd in pl_edmu_ro||wd in pl_edsr_ro||wd in pl_edze_dr||wd in pl_pv_edmu_ro||wd in pl_pv_edsr_ro||wd in pl_pv_edze_dr) {rett=1} else {rett=0}; return rett}
function prl_edda(n,                                                                                                                           wd,rett) { wd = lc(n);
                      if (wd in pl_edmu_da||wd in pl_edsr_da||wd in pl_edze_dr||wd in pl_pv_edmu_da||wd in pl_pv_edsr_da||wd in pl_pv_edze_dr) {rett=1} else {rett=0}; return rett}
function prl_edtv(n,                                                                                                                           wd,rett) { wd = lc(n);
                      if (wd in pl_edmu_tv||wd in pl_edsr_tv||wd in pl_edze_tv||wd in pl_edze_dr||wd in pl_pv_edmu_tv||wd in pl_pv_edsr_tv||    
                          wd in pl_pv_edze_tv||wd in pl_pv_edze_dr)                                                                            {rett=1} else {rett=0}; return rett}
function prl_edpr(n,                                                                                                                           wd,rett) { wd = lc(n);
                      if (wd in pl_edmu_pr||wd in pl_edsr_pr||wd in pl_edze_dr||wd in pl_pv_edmu_pr||wd in pl_pv_edsr_pr||wd in pl_pv_edze_dr) {rett=1} else {rett=0}; return rett}
function prl_mnim(n,      wd,rett) { wd = lc(n); if (wd in pl_mn_im||wd in pl_pv_mn_im)                                                        {rett=1} else {rett=0}; return rett}
function prl_mnvi(n,      wd,rett) { wd = lc(n); if (wd in pl_mn_im||wd in pl_mn_ro||wd in pl_pv_mn_im||wd in pl_pv_mn_ro)                     {rett=1} else {rett=0}; return rett}
function prl_mnro(n,      wd,rett) { wd = lc(n); if (wd in pl_mn_ro||wd in pl_pv_mn_ro)                                                        {rett=1} else {rett=0}; return rett}
function prl_mnda(n,      wd,rett) { wd = lc(n); if (wd in pl_mn_da||wd in pl_pv_mn_da)                                                        {rett=1} else {rett=0}; return rett}
function prl_mntv(n,      wd,rett) { wd = lc(n); if (wd in pl_mn_tv||wd in pl_pv_mn_tv)                                                        {rett=1} else {rett=0}; return rett}
function prl_mnpr(n,      wd,rett) { wd = lc(n); if (wd in pl_mn_ro||wd in pl_pv_mn_pr)                                                        {rett=1} else {rett=0}; return rett}
function prl_pvedtv(n,    wd,rett) { wd = lc(n); if (wd in pl_pv_edmu_tv||wd in pl_pv_edsr_tv||wd in pl_pv_edze_tv)                            {rett=1} else {rett=0}; return rett}
function prl_pvmntv(n,    wd,rett) { wd = lc(n); if (wd in pl_pv_mn_tv)                                                                        {rett=1} else {rett=0}; return rett}
                                                                                                                                              
# причастия                                                                                                                                   
function prq_kred_mu(n,   wd,rett) { wd = lc(n); if (wd in pq_kred_mu)                                                                         {rett=1} else {rett=0}; return rett}
function prq_kred_ze(n,   wd,rett) { wd = lc(n); if (wd in pq_kred_ze)                                                                         {rett=1} else {rett=0}; return rett}
function prq_kred_sr(n,   wd,rett) { wd = lc(n); if (wd in pq_kred_sr)                                                                         {rett=1} else {rett=0}; return rett}
function prq_kred(n,      wd,rett) { wd = lc(n); if (wd in pq_kred_mu||wd in pq_kred_ze||wd in pq_kred_sr)                                     {rett=1} else {rett=0}; return rett}
function prq_krmn(n,      wd,rett) { wd = lc(n); if (wd in pq_krmn)                                                                            {rett=1} else {rett=0}; return rett}
function prq_edmuim(n,    wd,rett) { wd = lc(n); if (wd in pq_edmu_im)                                                                         {rett=1} else {rett=0}; return rett}
function prq_edsrim(n,    wd,rett) { wd = lc(n); if (wd in pq_edsr_im)                                                                         {rett=1} else {rett=0}; return rett}
function prq_edzeim(n,    wd,rett) { wd = lc(n); if (wd in pq_edze_im)                                                                         {rett=1} else {rett=0}; return rett}
function prq_edmuvi(n,    wd,rett) { wd = lc(n); if (wd in pq_edmu_vi)                                                                         {rett=1} else {rett=0}; return rett}
function prq_edsrvi(n,    wd,rett) { wd = lc(n); if (wd in pq_edsr_vi)                                                                         {rett=1} else {rett=0}; return rett}
function prq_edzevi(n,    wd,rett) { wd = lc(n); if (wd in pq_edze_vi)                                                                         {rett=1} else {rett=0}; return rett}
function prq_edmuro(n,    wd,rett) { wd = lc(n); if (wd in pq_edmu_ro)                                                                         {rett=1} else {rett=0}; return rett}
function prq_edsrro(n,    wd,rett) { wd = lc(n); if (wd in pq_edsr_ro)                                                                         {rett=1} else {rett=0}; return rett}
function prq_edzero(n,    wd,rett) { wd = lc(n); if (wd in pq_edze_ro)                                                                         {rett=1} else {rett=0}; return rett}
function prq_edmuda(n,    wd,rett) { wd = lc(n); if (wd in pq_edmu_da)                                                                         {rett=1} else {rett=0}; return rett}
function prq_edsrda(n,    wd,rett) { wd = lc(n); if (wd in pq_edsr_da)                                                                         {rett=1} else {rett=0}; return rett}
function prq_edzeda(n,    wd,rett) { wd = lc(n); if (wd in pq_edze_da)                                                                         {rett=1} else {rett=0}; return rett}
function prq_edmutv(n,    wd,rett) { wd = lc(n); if (wd in pq_edmu_tv)                                                                         {rett=1} else {rett=0}; return rett}
function prq_edsrtv(n,    wd,rett) { wd = lc(n); if (wd in pq_edsr_tv)                                                                         {rett=1} else {rett=0}; return rett}
function prq_edzetv(n,    wd,rett) { wd = lc(n); if (wd in pq_edze_tv)                                                                         {rett=1} else {rett=0}; return rett}
function prq_edmupr(n,    wd,rett) { wd = lc(n); if (wd in pq_edmu_pr)                                                                         {rett=1} else {rett=0}; return rett}
function prq_edsrpr(n,    wd,rett) { wd = lc(n); if (wd in pq_edsr_pr)                                                                         {rett=1} else {rett=0}; return rett}
function prq_edzepr(n,    wd,rett) { wd = lc(n); if (wd in pq_edze_pr)                                                                         {rett=1} else {rett=0}; return rett}
function prq_edim(n,      wd,rett) { wd = lc(n); if (wd in pq_edmu_im||wd in pq_edsr_im||wd in pq_edze_im)                                     {rett=1} else {rett=0}; return rett}
function prq_edvi(n,      wd,rett) { wd = lc(n); if (wd in pq_edmu_im||wd in pq_edmu_ro||wd in pq_edsr_im||wd in pq_edze_dr)                   {rett=1} else {rett=0}; return rett}
function prq_edro(n,      wd,rett) { wd = lc(n); if (wd in pq_edmu_ro||wd in pq_edsr_ro||wd in pq_edze_dr)                                     {rett=1} else {rett=0}; return rett}
function prq_edda(n,      wd,rett) { wd = lc(n); if (wd in pq_edmu_da||wd in pq_edsr_da||wd in pq_edze_dr)                                     {rett=1} else {rett=0}; return rett}
function prq_edtv(n,      wd,rett) { wd = lc(n); if (wd in pq_edmu_tv||wd in pq_edsr_tv||wd in pq_edze_tv||wd in pq_edze_dr)                   {rett=1} else {rett=0}; return rett}
function prq_edpr(n,      wd,rett) { wd = lc(n); if (wd in pq_edmu_pr||wd in pq_edsr_pr||wd in pq_edze_dr)                                     {rett=1} else {rett=0}; return rett}
function prq_mnim(n,      wd,rett) { wd = lc(n); if (wd in pq_mn_im)                                                                           {rett=1} else {rett=0}; return rett}
function prq_mnvi(n,      wd,rett) { wd = lc(n); if (wd in pq_mn_im||wd in pq_mn_ro)                                                           {rett=1} else {rett=0}; return rett}
function prq_mnro(n,      wd,rett) { wd = lc(n); if (wd in pq_mn_ro)                                                                           {rett=1} else {rett=0}; return rett}
function prq_mnda(n,      wd,rett) { wd = lc(n); if (wd in pq_mn_da)                                                                           {rett=1} else {rett=0}; return rett}
function prq_mntv(n,      wd,rett) { wd = lc(n); if (wd in pq_mn_tv)                                                                           {rett=1} else {rett=0}; return rett}
function prq_mnpr(n,      wd,rett) { wd = lc(n); if (wd in pq_mn_ro)                                                                           {rett=1} else {rett=0}; return rett}
function prq_any(n,       wd,rett) {if (prq_edim(n)||prq_edvi(n)||prq_edro(n)||prq_edda(n)||prq_edtv(n)||prq_edpr(n)||prq_mnim(n)||             
                                     prq_mnvi(n)||prq_mnro(n)||prq_mnda(n)||prq_mntv(n)||prq_mnpr(n))                                          {rett=1} else {rett=0}; return rett}
                                                                                                                                              
# деепричастия                                                                                                                                
function deep(n,                                                                                                                                wd,rett) { wd = lc(n);
                      if (wd in dps_pe_pa||wd in dps_vz_ne_pa||wd in dpn_vz_ne_na||wd in dpn_pe_na||wd in dps_ne_pa||wd in dps_pn_pa||          
                          wd in dpn_ne_na||wd in dpn_pn_na||wd in dpn_pe_pa||wd in dpn_pn_pa||wd in dpn_ne_pa)                                  {rett=1} else {rett=0}; return rett}

# глаголы
function gl_ed(n,         wd,rett) { wd = lc(n);
                      if (wd in gn_vz_nena_e1||wd in gn_vz_nena_e2||wd in gn_vz_nena_e3||wd in gn_vz_nepa_edze||wd in gn_vz_nepa_edmu||
                          wd in gn_vz_nepa_edsr||wd in gn_nena_e1||wd in gn_nena_e2||wd in gn_nena_e3||wd in gn_nepa_edze||wd in gn_nepa_edmu||
                          wd in gn_nepa_edsr||wd in gn_pena_e1||wd in gn_pena_e2||wd in gn_pena_e3||wd in gn_pepa_edze||wd in gn_pepa_edmu||
                          wd in gn_pepa_edsr||wd in gn_pnna_e1||wd in gn_pnna_e2||wd in gn_pnna_e3||wd in gn_pnpa_edze||wd in gn_pnpa_edmu||
                          wd in gn_pnpa_edsr||wd in gs_nebu_e1||wd in gs_nebu_e2||wd in gs_nebu_e3||wd in gs_vz_nebu_e1||wd in gs_vz_nebu_e2||
                          wd in gs_vz_nebu_e3||wd in gs_vz_nepa_edze||wd in gs_vz_nepa_edmu||wd in gs_vz_nepa_edsr||wd in gs_nepa_edze||
                          wd in gs_nepa_edmu||wd in gs_nepa_edsr||wd in gs_pebu_e1||wd in gs_pebu_e2||wd in gs_pebu_e3||wd in gs_pepa_edze||
                          wd in gs_pepa_edmu||wd in gs_pepa_edsr||wd in gs_pnbu_e1||wd in gs_pnbu_e2||wd in gs_pnbu_e3||wd in gs_pnpa_edze||
                          wd in gs_pnpa_edmu||wd in gs_pnpa_edsr||wd in g2_pebu_e1||wd in g2_pebu_e2||wd in g2_pebu_e3||wd in g2_pena_e1||
                          wd in g2_pena_e2||wd in g2_pena_e3||wd in g2_pepa_edze||wd in g2_pepa_edmu||wd in g2_pepa_edsr||wd in g2_nebu_e1||
                          wd in g2_nebu_e2||wd in g2_nebu_e3||wd in g2_vz_nebu_e1||wd in g2_vz_nebu_e2||wd in g2_vz_nebu_e3||
                          wd in g2_vz_nena_e1||wd in g2_vz_nena_e2||wd in g2_vz_nena_e3||wd in g2_vz_nepa_edze||wd in g2_vz_nepa_edmu||
                          wd in g2_vz_nepa_edsr||wd in g2_nena_e1||wd in g2_nena_e2||wd in g2_nena_e3||wd in g2_nepa_edze||wd in g2_nepa_edmu||
                          wd in g2_nepa_edsr||wd in g2_pnbu_e1||wd in g2_pnbu_e2||wd in g2_pnbu_e3||wd in g2_pnna_e1||wd in g2_pnna_e2||
                          wd in g2_pnna_e3||wd in g2_pnpa_edze||wd in g2_pnpa_edmu||wd in g2_pnpa_edsr )                                        {rett=1} else {rett=0}; return rett}
function gl_in(n,         wd,rett) { wd = lc(n);
                      if (wd in gn_vz_ne_in||wd in gn_nein||wd in gn_nein_bz||wd in gn_vz_nein_bz||wd in gn_pein||wd in gn_pein_bz||
                          wd in gn_pnin||wd in gs_vz_nein||wd in gs_nein||wd in gs_vz_nein_bz||wd in gs_nein_bz||wd in gs_pein||
                          wd in gs_pein_bz||wd in gs_pnin||wd in g2_pein||wd in g2_vz_nein||wd in g2_nein||wd in g2_pnin )                      {rett=1} else {rett=0}; return rett}
function gl_vzed(n,                                                                                                                             wd,rett) { wd = lc(n);
                      if (wd in gn_vz_nena_e1||wd in gn_vz_nena_e2||wd in gn_vz_nena_e3||wd in gn_vz_nepo_ed||wd in gn_vz_nepa_edze||
                          wd in gn_vz_nepa_edmu||wd in gn_vz_nepa_edsr||wd in gs_vz_nebu_e1||wd in gs_vz_nebu_e2||wd in gs_vz_nebu_e3||
                          wd in gs_vz_nepo_ed||wd in gs_vz_nepa_edze||wd in gs_vz_nepa_edmu||wd in gs_vz_nepa_edsr||wd in g2_vz_nebu_e1||
                          wd in g2_vz_nebu_e2||wd in g2_vz_nebu_e3||wd in g2_vz_nena_e1||wd in g2_vz_nena_e2||wd in g2_vz_nena_e3||
                          wd in g2_vz_nepo_ed||wd in g2_vz_nepa_edze||wd in g2_vz_nepa_edmu||wd in g2_vz_nepa_edsr )                            {rett=1} else {rett=0}; return rett}
function gl_edsr(n,                                                                                                                             wd,rett) { wd = lc(n);
                      if (wd in gn_vz_nepa_edsr||wd in gn_nepa_edsr||wd in gn_pepa_edsr||wd in gn_pnpa_edsr||wd in gs_vz_nepa_edsr||
                          wd in gs_nepa_edsr||wd in gs_pepa_edsr||wd in gs_pnpa_edsr||wd in g2_pepa_edsr||wd in g2_vz_nepa_edsr||
                          wd in g2_nepa_edsr||wd in g2_pnpa_edsr )                                                                              {rett=1} else {rett=0}; return rett}
function gl_poed(n,                                                                                                                             wd,rett) { wd = lc(n);
                      if (wd in gn_vz_nepo_ed||wd in gn_nepo_ed||wd in gn_pepo_ed||wd in gn_pnpo_ed||wd in gs_vz_nepo_ed||wd in gs_nepo_ed||
                          wd in gs_pepo_ed||wd in gs_pnpo_ed||wd in g2_pepo_ed||wd in g2_vz_nepo_ed||wd in g2_nepo_ed||wd in g2_pnpo_ed )       {rett=1} else {rett=0}; return rett}
function gl_vzmn(n,                                                                                                                             wd,rett) { wd = lc(n);
                      if (wd in gn_vz_nena_m1||wd in gn_vz_nena_m2||wd in gn_vz_nena_m3||wd in gn_vz_nepa_mn||wd in g2_vz_nena_m1||
                          wd in gs_vz_nebu_m1||wd in gs_vz_nebu_m2||wd in gs_vz_nebu_m3||wd in gs_vz_nepa_mn||wd in g2_vz_nena_m2||
                          wd in g2_vz_nebu_m1||wd in g2_vz_nebu_m2||wd in g2_vz_nebu_m3||wd in g2_vz_nepa_mn||wd in g2_vz_nena_m3 )             {rett=1} else {rett=0}; return rett}
function gl_povzmn(n,                                                                                                                           wd,rett) { wd = lc(n);
                      if (wd in gn_vz_nepo_mn||wd in gs_vz_nepo_mn||wd in g2_vz_nepo_mn )                                                       {rett=1} else {rett=0}; return rett}
function gl_pomn(n,                                                                                                                             wd,rett) { wd = lc(n);
                      if (wd in gn_nepo_mn||wd in gn_pepo_mn||wd in gn_pnpo_mn||wd in gs_nepo_mn||wd in gs_pepo_mn||wd in gs_pnpo_mn||
                          wd in g2_pepo_mn||wd in g2_nepo_mn||wd in g2_pnpo_mn )                                                                {rett=1} else {rett=0}; return rett}
function gl_nemn(n,                                                                                                                             wd,rett) { wd = lc(n);
                      if (wd in gn_nena_m1||wd in gn_nena_m2||wd in gn_nena_m3||wd in gn_nepa_mn||wd in gs_nebu_m1||wd in gs_nebu_m2||
                          wd in gs_nebu_m3||wd in gs_nepa_mn||wd in g2_nebu_m1||wd in g2_nebu_m2||wd in g2_nebu_m3||wd in g2_nena_m1||
                          wd in g2_nena_m2||wd in g2_nena_m3||wd in g2_nepa_mn)                                                                 {rett=1} else {rett=0}; return rett}
function gl_pnmn(n,                                                                                                                             wd,rett) { wd = lc(n);
                      if (wd in gn_pnna_m1||wd in gn_pnna_m2||wd in gn_pnna_m3||wd in gn_pnpa_mn||wd in gs_pnbu_m1||wd in gs_pnbu_m2||
                          wd in gs_pnbu_m3||wd in gs_pnpa_mn||wd in g2_pnbu_m1||wd in g2_pnbu_m2||wd in g2_pnbu_m3||wd in g2_pnna_m1||
                          wd in g2_pnna_m2||wd in g2_pnna_m3||wd in g2_pnpa_mn)                                                                 {rett=1} else {rett=0}; return rett}
function gl_pemn(n,                                                                                                                             wd,rett) { wd = lc(n);
                      if (wd in gn_pena_m1||wd in gn_pena_m2||wd in gn_pena_m3||wd in gn_pepa_mn||wd in gs_pebu_m1||wd in gs_pebu_m2||
                          wd in gs_pebu_m3||wd in gs_pepa_mn||wd in g2_pebu_m1||wd in g2_pebu_m2||wd in g2_pebu_m3||wd in g2_pena_m1||
                          wd in g2_pena_m2||wd in g2_pena_m3||wd in g2_pepa_mn)                                                                 {rett=1} else {rett=0}; return rett}

# существительные
function suw_edmuim(n,                                                                                                                          wd,rett) { wd = lc(n);
                      if (wd in sw_edmu_im||wd in sw_edob_im||wd in swn_edmu_im||wd in swn_edob_im||wd in swo_edmu_im||wd in swo_edob_im)       {rett=1} else {rett=0}; return rett}
function suw_edmuvi(n,                                                                                                                          wd,rett) { wd = lc(n);
                      if (wd in sw_edmu_vi||wd in sw_edmu_vi||wd in sw_edob_vi||wd in swn_edmu_im||wd in swn_edob_vi||wd in swo_edmu_ro||
                          wd in swo_edob_vi)                                                                                                    {rett=1} else {rett=0}; return rett}
function suw_edmuda(n,                                                                                                                          wd,rett) { wd = lc(n);
                      if (wd in sw_edmu_da||wd in sw_edob_da||wd in swn_edmu_da||wd in swn_edob_da||wd in swo_edmu_da||wd in swo_edob_da)       {rett=1} else {rett=0}; return rett}
function suw_edmuro(n,                                                                                                                          wd,rett) { wd = lc(n);
                      if (wd in sw_edmu_ro||wd in sw_edob_ro||wd in swn_edmu_ro||wd in swn_edob_ro||wd in swo_edmu_ro||wd in swo_edob_ro)       {rett=1} else {rett=0}; return rett}
function suw_edsrim(n,    wd,rett) { wd = lc(n); if (wd in sw_edsr_im||wd in swn_edsr_im||wd in swo_edsr_im)                                    {rett=1} else {rett=0}; return rett}
function suw_edsrvi(n,    wd,rett) { wd = lc(n); if (wd in sw_edsr_vi||wd in swn_edsr_vi||wd in swo_edsr_vi)                                    {rett=1} else {rett=0}; return rett}
function suw_edsrda(n,                                                                                                                          wd,rett) { wd = lc(n);
                      if (wd in sw_edob_da||wd in sw_edsr_da||wd in swn_edob_da||wd in swn_edsr_da||wd in swo_edob_da||wd in swo_edsr_da)       {rett=1} else {rett=0}; return rett}
function suw_edsrro(n,                                                                                                                          wd,rett) { wd = lc(n);
                      if (wd in sw_edob_ro||wd in sw_edsr_ro||wd in swn_edob_ro||wd in swn_edsr_ro||wd in swo_edob_ro||wd in swo_edsr_ro)       {rett=1} else {rett=0}; return rett}
function suw_edzeim(n,    wd,rett) { wd = lc(n); if (wd in swn_edze_im||wd in sw_edze_im||wd in swo_edze_im)                                    {rett=1} else {rett=0}; return rett}
function suw_edim(n,                                                                                                                            wd,rett) { wd = lc(n);
                      if (wd in sw_edmu_im||wd in sw_edob_im||wd in sw_edsr_im||wd in sw_edze_im||wd in swn_edmu_im||wd in swn_edob_im||
                          wd in swn_edsr_im||wd in swn_edze_im||wd in swo_edmu_im||wd in swo_edob_im||wd in swo_edsr_im||wd in swo_edze_im)     {rett=1} else {rett=0}; return rett}
function suw_edvi(n,                                                                                                                            wd,rett) { wd = lc(n);
                      if (wd in sw_edmu_vi||wd in sw_edob_vi||wd in sw_edsr_vi||wd in sw_edze_vi||wd in swn_edmu_im||wd in swn_edob_vi||
                          wd in swn_edsr_vi||wd in swn_edze_vi||wd in swo_edmu_ro||wd in swo_edob_vi||wd in swo_edsr_vi||wd in swo_edze_vi)     {rett=1} else {rett=0}; return rett}
function suw_edro(n,                                                                                                                            wd,rett) { wd = lc(n);
                      if (wd in sw_edmu_ro||wd in sw_edob_ro||wd in sw_edsr_ro||wd in sw_edze_ro||wd in swn_edmu_ro||wd in swn_edob_ro||
                          wd in swn_edsr_ro||wd in swn_edze_ro||wd in swo_edmu_ro||wd in swo_edob_ro||wd in swo_edsr_ro||wd in swo_edze_ro)     {rett=1} else {rett=0}; return rett}
function suw_edda(n,                                                                                                                            wd,rett) { wd = lc(n);
                      if (wd in sw_edmu_da||wd in sw_edob_da||wd in sw_edsr_da||wd in sw_edze_da||wd in swn_edmu_da||wd in swn_edob_da||
                          wd in swn_edsr_da||wd in swn_edze_da||wd in swo_edmu_da||wd in swo_edob_da||wd in swo_edsr_da||wd in swo_edze_da)     {rett=1} else {rett=0}; return rett}
function suw_edtv(n,                                                                                                                            wd,rett) { wd = lc(n);
                      if (wd in sw_edmu_tv||wd in sw_edob_tv||wd in sw_edsr_tv||wd in sw_edze_tv||wd in swn_edmu_tv||wd in swn_edob_tv||
                          wd in swn_edsr_tv||wd in swn_edze_tv||wd in swo_edmu_tv||wd in swo_edob_tv||wd in swo_edsr_tv||wd in swo_edze_tv)     {rett=1} else {rett=0}; return rett}
function suw_edpr(n,                                                                                                                            wd,rett) { wd = lc(n);
                      if (wd in sw_edmu_pr||wd in sw_edob_pr||wd in sw_edsr_pr||wd in sw_edze_pr||wd in swn_edmu_pr||wd in swn_edob_pr||
                          wd in swn_edsr_pr||wd in swn_edze_pr||wd in swo_edmu_pr||wd in swo_edob_pr||wd in swo_edsr_pr||wd in swo_edze_pr)     {rett=1} else {rett=0}; return rett}
function suw_mnim(n,      wd,rett) { wd = lc(n); if (wd in swn_mn_im||wd in swo_mn_im||wd in sw_mn_im)                                          {rett=1} else {rett=0}; return rett}
function suw_mnvi(n,      wd,rett) { wd = lc(n); if (wd in sw_mn_vi||wd in swn_mn_im||wd in swo_mn_ro)                                          {rett=1} else {rett=0}; return rett}
function suw_mnro(n,      wd,rett) { wd = lc(n); if (wd in sw_mn_ro||wd in swn_mn_ro||wd in swo_mn_ro)                                          {rett=1} else {rett=0}; return rett}
function suw_mnda(n,      wd,rett) { wd = lc(n); if (wd in sw_mn_da||wd in swn_mn_da||wd in swo_mn_da)                                          {rett=1} else {rett=0}; return rett}
function suw_mntv(n,      wd,rett) { wd = lc(n); if (wd in sw_mn_tv||wd in swn_mn_tv||wd in swo_mn_tv)                                          {rett=1} else {rett=0}; return rett}
function suw_mnpr(n,      wd,rett) { wd = lc(n); if (wd in sw_mn_pr||wd in swn_mn_pr||wd in swo_mn_pr)                                          {rett=1} else {rett=0}; return rett}
function suw_oded(n,                                                                                                                            wd,rett) { wd = lc(n);
                      if (wd in swo_edmu_da||wd in swo_edmu_im||wd in swo_edmu_ne||wd in swo_edmu_pr||wd in swo_edmu_ro||wd in swo_edmu_tv||
                          wd in swo_edmu_zv||wd in swo_edob_da||wd in swo_edob_im||wd in swo_edob_ne||wd in swo_edob_pr||wd in swo_edob_ro||
                          wd in swo_edob_tv||wd in swo_edob_vi||wd in swo_edsr_da||wd in swo_edsr_im||wd in swo_edsr_pr||wd in swo_edsr_ro||
                          wd in swo_edsr_tv||wd in swo_edsr_vi||wd in swo_edze_da||wd in swo_edze_im||wd in swo_edze_ne||wd in swo_edze_pr||
                          wd in swo_edze_ro||wd in swo_edze_tv||wd in swo_edze_vi||wd in swo_edze_zv)                                           {rett=1} else {rett=0}; return rett}
function suw_odedim(n,                                                                                                                          wd,rett) { wd = lc(n);
                      if (wd in swo_edmu_im||wd in swo_edob_im||wd in swo_edsr_im||wd in swo_edze_im)                                           {rett=1} else {rett=0}; return rett}
function suw_odmn(n,                                                                                                                            wd,rett) { wd = lc(n);
                      if (wd in swo_mn_da||wd in swo_mn_im||wd in swo_mn_ne||wd in swo_mn_pr||wd in swo_mn_ro||wd in swo_mn_sq||
                          wd in swo_mn_tv)                                                                                                      {rett=1} else {rett=0}; return rett}
function suw_noed(n,                                                                                                                            wd,rett) { wd = lc(n);
                      if (wd in swn_edmu_da||wd in swn_edmu_im||wd in swn_edmu_me||wd in swn_edmu_ne||wd in swn_edmu_pr||wd in swn_edmu_pt||
                          wd in swn_edmu_ro||wd in swn_edmu_sq||wd in swn_edmu_tv||wd in swn_edob_da||wd in swn_edob_im||wd in swn_edob_ne||
                          wd in swn_edob_pr||wd in swn_edob_ro||wd in swn_edob_tv||wd in swn_edob_vi||wd in swn_edsr_da||wd in swn_edsr_im||
                          wd in swn_edsr_ne||wd in swn_edsr_pr||wd in swn_edsr_ro||wd in swn_edsr_tv||wd in swn_edsr_vi||wd in swn_edze_da||
                          wd in swn_edze_im||wd in swn_edze_me||wd in swn_edze_ne||wd in swn_edze_pr||wd in swn_edze_ro||wd in swn_edze_tv||
                          wd in swn_edze_vi)                                                                                                    {rett=1} else {rett=0}; return rett}
function suw_noedim(n,                                                                                                                          wd,rett) { wd = lc(n);
                      if (wd in swn_edmu_im||wd in swn_edob_im||wd in swn_edsr_im||wd in swn_edze_im)                                           {rett=1} else {rett=0}; return rett}
function suw_nomnim(n,    wd,rett) { wd = lc(n); if (wd in swn_mn_im)                                                                           {rett=1} else {rett=0}; return rett}
function suw_nomn(n,                                                                                                                            wd,rett) { wd = lc(n);
                      if (wd in swn_mn_da||wd in swn_mn_im||wd in swn_mn_ne||wd in swn_mn_pr||wd in swn_mn_ro||wd in swn_mn_sq||wd in swn_mn_tv){rett=1} else {rett=0}; return rett}
function suw_edme(n,      wd,rett) { wd = lc(n); if (wd in swn_edmu_me||wd in swn_edze_me)                                                      {rett=1} else {rett=0}; return rett}
function suw_edne(n,                                                                                                                            wd,rett) { wd = lc(n);
                      if (wd in sw_edmu_ne||wd in sw_edob_ne||wd in swn_edmu_ne||wd in swn_edob_ne||wd in swn_edsr_ne||wd in swn_edze_ne||      
                          wd in swo_edmu_ne||wd in swo_edob_ne||wd in swo_edze_ne)                                                              {rett=1} else {rett=0}; return rett}
function suw_mnne(n,      wd,rett) { wd = lc(n); if (wd in sw_mn_ne||wd in swn_mn_ne||wd in swo_mn_ne)                                          {rett=1} else {rett=0}; return rett}
function suw_mnsq(n,      wd,rett) { wd = lc(n); if (wd in swn_mn_sq||wd in swo_mn_sq)                                                          {rett=1} else {rett=0}; return rett}
                                                                                                                                                
# местоимения                                                                                                                                   
function mest_ed(n,                                                                                                                             wd,rett) { wd = lc(n);
                      if (wd in mst_ed_da||wd in mst_ed_im||wd in mst_ed_mu||wd in mst_ed_mu_da||wd in mst_ed_mu_im||wd in mst_ed_mu_pr||       
                          wd in mst_ed_mu_ro||wd in mst_ed_mu_tv||wd in mst_ed_mu_vi||wd in mst_ed_pr||wd in mst_ed_ro||wd in mst_ed_sr||       
                          wd in mst_ed_sr_da||wd in mst_ed_sr_im||wd in mst_ed_sr_pr||wd in mst_ed_sr_ro||wd in mst_ed_sr_tv||                  
                          wd in mst_ed_sr_vi||wd in mst_ed_tv||wd in mst_ed_vi||wd in mst_ed_ze||wd in mst_ed_ze_da||wd in mst_ed_ze_im||       
                          wd in mst_ed_ze_pr||wd in mst_ed_ze_ro||wd in mst_ed_ze_tv||wd in mst_ed_ze_vi)                                       {rett=1} else {rett=0}; return rett}
function mest_mn(n,       wd,rett) { wd = lc(n); if (wd in mst_mn_im||wd in mst_mn_ro||wd in mst_mn_vi||wd in mst_mn_da||wd in mst_mn_pr||                
                          wd in mst_mn_tv||wd in mst_mn)                                                                                        {rett=1} else {rett=0}; return rett}
function mest_edmu(n,                                                                                                                           wd,rett) { wd = lc(n);
                      if (wd in mst_ed_mu||wd in mst_ed_mu_da||wd in mst_ed_mu_im||wd in mst_ed_mu_pr||wd in mst_ed_mu_ro||                     
                          wd in mst_ed_mu_tv||wd in mst_ed_mu_vi)                                                                               {rett=1} else {rett=0}; return rett}
function mest_edmuim(n,   wd,rett) { wd = lc(n); if (wd in mst_ed_mu_im||wd in mst_ed_im||wd in mst_im)                                         {rett=1} else {rett=0}; return rett}
function mest_edmuvi(n,                                                                                                                         wd,rett) { wd = lc(n);
                      if (wd in mst_ed_mu_vi||wd in mst_ed_mu_im||wd in mst_ed_mu_ro||wd in mst_mn_ro||wd in mst_ed_vi||wd in mst_vi)           {rett=1} else {rett=0}; return rett}
function mest_edmuro(n,   wd,rett) { wd = lc(n); if (wd in mst_ed_mu_ro||wd in mst_ed_ro||wd in mst_ro)                                         {rett=1} else {rett=0}; return rett}
function mest_edmuda(n,   wd,rett) { wd = lc(n); if (wd in mst_ed_mu_da||wd in mst_ed_da||wd in mst_da)                                         {rett=1} else {rett=0}; return rett}
function mest_edmutv(n,   wd,rett) { wd = lc(n); if (wd in mst_ed_mu_tv||wd in mst_ed_tv||wd in mst_tv)                                         {rett=1} else {rett=0}; return rett}
function mest_edmupr(n,   wd,rett) { wd = lc(n); if (wd in mst_ed_mu_pr||wd in mst_ed_pr||wd in mst_pr)                                         {rett=1} else {rett=0}; return rett}
function mest_edsrim(n,   wd,rett) { wd = lc(n); if (wd in mst_ed_sr_im||wd in mst_ed_sr)                                                       {rett=1} else {rett=0}; return rett}
function mest_edsrvi(n,   wd,rett) { wd = lc(n); if (wd in mst_ed_sr_im||wd in mst_ed_sr_vi||wd in mst_ed_sr_ro||wd in mst_ed_sr)               {rett=1} else {rett=0}; return rett}
function mest_edsrro(n,   wd,rett) { wd = lc(n); if (wd in mst_ed_sr_ro||wd in mst_ed_ro||wd in mst_ro)                                         {rett=1} else {rett=0}; return rett}
function mest_edsrda(n,   wd,rett) { wd = lc(n); if (wd in mst_ed_sr_da||wd in mst_ed_da||wd in mst_da)                                         {rett=1} else {rett=0}; return rett}
function mest_edsrtv(n,   wd,rett) { wd = lc(n); if (wd in mst_ed_sr_tv||wd in mst_ed_tv||wd in mst_tv)                                         {rett=1} else {rett=0}; return rett}
function mest_edsrpr(n,   wd,rett) { wd = lc(n); if (wd in mst_ed_sr_pr||wd in mst_ed_pr||wd in mst_pr)                                         {rett=1} else {rett=0}; return rett}
function mest_edzeim(n,   wd,rett) { wd = lc(n); if (wd in mst_ed_ze_im)                                                                        {rett=1} else {rett=0}; return rett}
function mest_edzevi(n,   wd,rett) { wd = lc(n); if (wd in mst_ed_ze_vi)                                                                        {rett=1} else {rett=0}; return rett}
function mest_edzero(n,   wd,rett) { wd = lc(n); if (wd in mst_ed_ze_ro)                                                                        {rett=1} else {rett=0}; return rett}
function mest_edzeda(n,   wd,rett) { wd = lc(n); if (wd in mst_ed_ze_da)                                                                        {rett=1} else {rett=0}; return rett}
function mest_edzetv(n,   wd,rett) { wd = lc(n); if (wd in mst_ed_ze_tv)                                                                        {rett=1} else {rett=0}; return rett}
function mest_edzepr(n,   wd,rett) { wd = lc(n); if (wd in mst_ed_ze_pr)                                                                        {rett=1} else {rett=0}; return rett}
function mest_edze(n,                                                                                                                           wd,rett) { wd = lc(n);
                      if (wd in mst_ed_ze_vi||wd in mst_ed_ze_da||wd in mst_ed_ze_im||wd in mst_ed_ze_pr||wd in mst_ed_ze_ro||                  
                          wd in mst_ed_ze_tv||wd in mst_ed_ze)                                                                                  {rett=1} else {rett=0}; return rett}
function mest_edsr(n,                                                                                                                           wd,rett) { wd = lc(n);
                      if (wd in mst_ed_sr_vi||wd in mst_ed_sr_da||wd in mst_ed_sr_im||wd in mst_ed_sr_pr||wd in mst_ed_sr_ro||                  
                          wd in mst_ed_sr_tv||wd in mst_ed_sr)                                                                                  {rett=1} else {rett=0}; return rett}
function mest_edim(n,                                                                                                                           wd,rett) { wd = lc(n);
                      if (wd in mst_ed_mu_im||wd in mst_ed_ze_im||wd in mst_ed_sr_im||wd in mst_ed_im||wd in mst_im)                            {rett=1} else {rett=0}; return rett}
function mest_im(n,                                                                                                                             wd,rett) { wd = lc(n);
                      if (wd in mst_ed_mu_im||wd in mst_ed_ze_im||wd in mst_ed_sr_im||wd in mst_mn_im||wd in mst_ed_im||wd in mst_im)           {rett=1} else {rett=0}; return rett}
function mest_vi(n,                                                                                                                             wd,rett) { wd = lc(n);
                      if (wd in mst_ed_mu_vi||wd in mst_ed_mu_im||wd in mst_ed_mu_ro||wd in mst_ed_ze_vi||wd in mst_ed_sr_vi||                  
                          wd in mst_mn_im||wd in mst_mn_ro||wd in mst_mn_vi||wd in mst_ed_vi||wd in mst_vi)                                     {rett=1} else {rett=0}; return rett}
function mest_ro(n,                                                                                                                             wd,rett) { wd = lc(n);
                      if (wd in mst_ed_mu_ro||wd in mst_ed_ze_ro||wd in mst_ed_sr_ro||wd in mst_mn_ro||wd in mst_ed_ro||wd in mst_ro)           {rett=1} else {rett=0}; return rett}
function mest_da(n,                                                                                                                             wd,rett) { wd = lc(n);
                      if (wd in mst_ed_mu_da||wd in mst_ed_ze_da||wd in mst_ed_sr_da||wd in mst_mn_da||wd in mst_ed_da||wd in mst_da)           {rett=1} else {rett=0}; return rett}
function mest_tv(n,                                                                                                                             wd,rett) { wd = lc(n);
                      if (wd in mst_ed_mu_tv||wd in mst_ed_ze_tv||wd in mst_ed_sr_tv||wd in mst_mn_tv||wd in mst_ed_tv||wd in mst_tv)           {rett=1} else {rett=0}; return rett}
function mest_pr(n,                                                                                                                             wd,rett) { wd = lc(n);
                      if (wd in mst_ed_mu_pr||wd in mst_ed_ze_pr||wd in mst_ed_sr_pr||wd in mst_mn_pr||wd in mst_ed_pr||wd in mst_pr)           {rett=1} else {rett=0}; return rett}
function mest_mnim(n,     wd,rett) { wd = lc(n); if (wd in mst_mn_im)                                                                           {rett=1} else {rett=0}; return rett}
function mest_mnvi(n,     wd,rett) { wd = lc(n); if (wd in mst_mn_im||wd in mst_mn_ro||wd in mst_mn_vi)                                         {rett=1} else {rett=0}; return rett}
function mest_mnro(n,     wd,rett) { wd = lc(n); if (wd in mst_mn_ro)                                                                           {rett=1} else {rett=0}; return rett}
function mest_mnda(n,     wd,rett) { wd = lc(n); if (wd in mst_mn_da)                                                                           {rett=1} else {rett=0}; return rett}
function mest_mntv(n,     wd,rett) { wd = lc(n); if (wd in mst_mn_tv)                                                                           {rett=1} else {rett=0}; return rett}
function mest_mnpr(n,     wd,rett) { wd = lc(n); if (wd in mst_mn_pr)                                                                           {rett=1} else {rett=0}; return rett}
                                                                                                                                                
# наречия                                                                                                                                       
function nar_srav(n,    wd,rett) { wd = lc(n); if (wd in nr_srv)                                                                                {rett=1} else {rett=0}; return rett}
function nar_kaq(n,     wd,rett) { wd = lc(n); if (wd in nr_opka)                                                                               {rett=1} else {rett=0}; return rett}
function nar_spos(n,    wd,rett) { wd = lc(n); if (wd in nr_opsp)                                                                               {rett=1} else {rett=0}; return rett}
function nar_step(n,    wd,rett) { wd = lc(n); if (wd in nr_opst)                                                                               {rett=1} else {rett=0}; return rett}
function nar_vrem(n,    wd,rett) { wd = lc(n); if (wd in nr_obvr)                                                                               {rett=1} else {rett=0}; return rett}
function nar_mest(n,    wd,rett) { wd = lc(n); if (wd in nr_obme||wd in nr_mest)                                                                {rett=1} else {rett=0}; return rett}
function nar_napr(n,    wd,rett) { wd = lc(n); if (wd in nr_obna)                                                                               {rett=1} else {rett=0}; return rett}
function nar_priq(n,    wd,rett) { wd = lc(n); if (wd in nr_obpr)                                                                               {rett=1} else {rett=0}; return rett}
function nar_cel(n,     wd,rett) { wd = lc(n); if (wd in nr_obce)                                                                               {rett=1} else {rett=0}; return rett}
function nar_vopr(n,    wd,rett) { wd = lc(n); if (wd in nr_vopr)                                                                               {rett=1} else {rett=0}; return rett}
#function nar_pron(n,    wd,rett) { wd = lc(n); if (wd in nr_mest)                                                                               {rett=1} else {rett=0}; return rett}
function nar_prev(n,    wd,rett) { wd = lc(n); if (wd in nr_pv)                                                                                 {rett=1} else {rett=0}; return rett}
function nar_nar(n,     wd,rett) { wd = lc(n); if (wd in nr_nar)                                                                                {rett=1} else {rett=0}; return rett}
                                                                                                                                                
# предлоги                                                                                                                                      
function pre_im(n,      wd,rett) { wd = lc(n); if (wd in pred_im)                                                                               {rett=1} else {rett=0}; return rett}
function pre_vi(n,      wd,rett) { wd = lc(n); if (wd in pred_vi)                                                                               {rett=1} else {rett=0}; return rett}
function pre_da(n,      wd,rett) { wd = lc(n); if (wd in pred_da)                                                                               {rett=1} else {rett=0}; return rett}
function pre_pr(n,      wd,rett) { wd = lc(n); if (wd in pred_pr)                                                                               {rett=1} else {rett=0}; return rett}
function pre_ro(n,      wd,rett) { wd = lc(n); if (wd in pred_ro)                                                                               {rett=1} else {rett=0}; return rett}
function pre_tv(n,      wd,rett) { wd = lc(n); if (wd in pred_tv)                                                                               {rett=1} else {rett=0}; return rett}
function pre_any(n,     wd,rett) { wd = lc(n); if (wd in pred_im||wd in pred_vi||wd in pred_da||wd in pred_pr||wd in pred_ro||wd in pred_tv)    {rett=1} else {rett=0}; return rett}
                                                                                                                                                
# Одиночные классы                                                                                                                              
function predik(n,      wd,rett) { wd = lc(n); if (wd in predk)                                                                                 {rett=1} else {rett=0}; return rett}
function mezd(n,        wd,rett) { wd = lc(n); if (wd in mzd)                                                                                   {rett=1} else {rett=0}; return rett}
function qast(n,        wd,rett) { wd = lc(n); if (wd in qst)                                                                                   {rett=1} else {rett=0}; return rett}
function vvod(n,        wd,rett) { wd = lc(n); if (wd in vvodn)                                                                                 {rett=1} else {rett=0}; return rett}
function souz(n,        wd,rett) { wd = lc(n); if (wd in soyz)                                                                                  {rett=1} else {rett=0}; return rett}
function zvat(n,        wd,rett) { wd = lc(n); if (wd in zvt)                                                                                   {rett=1} else {rett=0}; return rett}
                                                                                                                                                
# Числительные                                                                                                                                  
function qik_im(n,      wd,rett) { wd = lc(n); if (wd in qko_im)                                                                                {rett=1} else {rett=0}; return rett}
function qik_vi(n,      wd,rett) { wd = lc(n); if (wd in qko_vi)                                                                                {rett=1} else {rett=0}; return rett}
function qik_ro(n,      wd,rett) { wd = lc(n); if (wd in qko_ro)                                                                                {rett=1} else {rett=0}; return rett}
function qik_da(n,      wd,rett) { wd = lc(n); if (wd in qko_da)                                                                                {rett=1} else {rett=0}; return rett}
function qik_tv(n,      wd,rett) { wd = lc(n); if (wd in qko_tv)                                                                                {rett=1} else {rett=0}; return rett}
function qik_pr(n,      wd,rett) { wd = lc(n); if (wd in qko_pr)                                                                                {rett=1} else {rett=0}; return rett}
function qik_edim(n,    wd,rett) { wd = lc(n); if (wd in qko_ed_ze_im||wd in qko_ed_mu_im||wd in qko_ed_sr_im||wd in qko_im)                    {rett=1} else {rett=0}; return rett}
function qik_edvi(n,    wd,rett) { wd = lc(n); if (wd in qko_ed_ze_vi||wd in qko_ed_mu_vi||wd in qko_ed_sr_vi||wd in qko_vi)                    {rett=1} else {rett=0}; return rett}
function qik_edro(n,    wd,rett) { wd = lc(n); if (wd in qko_ed_ze_ro||wd in qko_ed_mu_ro||wd in qko_ed_sr_ro||wd in qko_ro)                    {rett=1} else {rett=0}; return rett}
function qik_edda(n,    wd,rett) { wd = lc(n); if (wd in qko_ed_ze_da||wd in qko_ed_mu_da||wd in qko_ed_sr_da||wd in qko_da)                    {rett=1} else {rett=0}; return rett}
function qik_edtv(n,    wd,rett) { wd = lc(n); if (wd in qko_ed_ze_tv||wd in qko_ed_mu_tv||wd in qko_ed_sr_tv||wd in qko_tv)                    {rett=1} else {rett=0}; return rett}
function qik_edpr(n,    wd,rett) { wd = lc(n); if (wd in qko_ed_ze_pr||wd in qko_ed_mu_pr||wd in qko_ed_sr_pr||wd in qko_pr)                    {rett=1} else {rett=0}; return rett}
function qik_mnim(n,    wd,rett) { wd = lc(n); if (wd in qko_mn_im)                                                                             {rett=1} else {rett=0}; return rett}
function qik_mnvi(n,    wd,rett) { wd = lc(n); if (wd in qko_mn_vi)                                                                             {rett=1} else {rett=0}; return rett}
function qik_mnro(n,    wd,rett) { wd = lc(n); if (wd in qko_mn_ro)                                                                             {rett=1} else {rett=0}; return rett}
function qik_mnda(n,    wd,rett) { wd = lc(n); if (wd in qko_mn_da)                                                                             {rett=1} else {rett=0}; return rett}
function qik_mntv(n,    wd,rett) { wd = lc(n); if (wd in qko_mn_tv)                                                                             {rett=1} else {rett=0}; return rett}
function qik_mnpr(n,    wd,rett) { wd = lc(n); if (wd in qko_mn_pr)                                                                             {rett=1} else {rett=0}; return rett}
function qip_edim(n,    wd,rett) { wd = lc(n); if (wd in qpo_ed_ze_im||wd in qpo_ed_mu_im||wd in qpo_ed_sr_im)                                  {rett=1} else {rett=0}; return rett}
function qip_edvi(n,    wd,rett) { wd = lc(n); if (wd in qpo_ed_ze_vi||wd in qpo_ed_mu_im||wd in qpo_ed_mu_ro||wd in qpo_ed_sr_vi)              {rett=1} else {rett=0}; return rett}
function qip_edro(n,    wd,rett) { wd = lc(n); if (wd in qpo_ed_ze_ro||wd in qpo_ed_mu_ro||wd in qpo_ed_sr_ro)                                  {rett=1} else {rett=0}; return rett}
function qip_edda(n,    wd,rett) { wd = lc(n); if (wd in qpo_ed_ze_da||wd in qpo_ed_mu_da||wd in qpo_ed_sr_da)                                  {rett=1} else {rett=0}; return rett}
function qip_edtv(n,    wd,rett) { wd = lc(n); if (wd in qpo_ed_ze_tv||wd in qpo_ed_mu_tv||wd in qpo_ed_sr_tv)                                  {rett=1} else {rett=0}; return rett}
function qip_edpr(n,    wd,rett) { wd = lc(n); if (wd in qpo_ed_ze_pr||wd in qpo_ed_mu_pr||wd in qpo_ed_sr_pr)                                  {rett=1} else {rett=0}; return rett}
function qip_mnim(n,    wd,rett) { wd = lc(n); if (wd in qpo_mn_im)                                                                             {rett=1} else {rett=0}; return rett}
function qip_mnvi(n,    wd,rett) { wd = lc(n); if (wd in qpo_mn_im||qpo_mn_ro)                                                                  {rett=1} else {rett=0}; return rett}
function qip_mnro(n,    wd,rett) { wd = lc(n); if (wd in qpo_mn_ro)                                                                             {rett=1} else {rett=0}; return rett}
function qip_mnda(n,    wd,rett) { wd = lc(n); if (wd in qpo_mn_da)                                                                             {rett=1} else {rett=0}; return rett}
function qip_mntv(n,    wd,rett) { wd = lc(n); if (wd in qpo_mn_tv)                                                                             {rett=1} else {rett=0}; return rett}
function qip_mnpr(n,    wd,rett) { wd = lc(n); if (wd in qpo_mn_pr)                                                                             {rett=1} else {rett=0}; return rett}
function qin_im(n,      wd,rett) { wd = lc(n); if (wd in qne_im)                                                                                {rett=1} else {rett=0}; return rett}
function qin_vi(n,      wd,rett) { wd = lc(n); if (wd in qne_vi)                                                                                {rett=1} else {rett=0}; return rett}
function qin_ro(n,      wd,rett) { wd = lc(n); if (wd in qne_ro)                                                                                {rett=1} else {rett=0}; return rett}
function qin_da(n,      wd,rett) { wd = lc(n); if (wd in qne_da)                                                                                {rett=1} else {rett=0}; return rett}
function qin_tv(n,      wd,rett) { wd = lc(n); if (wd in qne_tv)                                                                                {rett=1} else {rett=0}; return rett}
function qin_pr(n,      wd,rett) { wd = lc(n); if (wd in qne_pr)                                                                                {rett=1} else {rett=0}; return rett}
function qis_im(n,      wd,rett) { wd = lc(n); if (wd in qso_ze_im||wd in qso_im||wd in qso_mu_im||wd in qso_sr_im)                             {rett=1} else {rett=0}; return rett}
function qis_vi(n,      wd,rett) { wd = lc(n); if (wd in qso_vi||wd in qso_ze_vi||wd in qso_mu_vi||wd in qso_sr_vi)                             {rett=1} else {rett=0}; return rett}
function qis_ro(n,      wd,rett) { wd = lc(n); if (wd in qso_ze_ro||wd in qso_mu_ro||wd in qso_ro||wd in qso_sr_ro)                             {rett=1} else {rett=0}; return rett}
function qis_da(n,      wd,rett) { wd = lc(n); if (wd in qso_da||wd in qso_ze_da||wd in qso_mu_da||wd in qso_sr_da)                             {rett=1} else {rett=0}; return rett}
function qis_tv(n,      wd,rett) { wd = lc(n); if (wd in qso_ze_tv||wd in qso_mu_tv||wd in qso_sr_tv||wd in qso_tv)                             {rett=1} else {rett=0}; return rett}
function qis_pr(n,      wd,rett) { wd = lc(n); if (wd in qso_ze_pr||wd in qso_mu_pr||wd in qso_pr||wd in qso_sr_pr)                             {rett=1} else {rett=0}; return rett}
function qi_ed(n,                                                                                                                               wd,rett) { wd = lc(n);
                    if (wd in qko_ed_mu_da||wd in qko_ed_mu_im||wd in qko_ed_mu_pr||wd in qko_ed_mu_ro||wd in qko_ed_mu_tv||                    
                        wd in qko_ed_mu_vi||wd in qko_ed_sr_da||wd in qko_ed_sr_im||wd in qko_ed_sr_pr||wd in qko_ed_sr_ro||                    
                        wd in qko_ed_sr_tv||wd in qko_ed_sr_vi||wd in qko_ed_ze_da||wd in qko_ed_ze_im||wd in qko_ed_ze_pr||                    
                        wd in qko_ed_ze_ro||wd in qko_ed_ze_tv||wd in qko_ed_ze_vi||wd in qpo_ed_mu_da||wd in qpo_ed_mu_im||                    
                        wd in qpo_ed_mu_pr||wd in qpo_ed_mu_ro||wd in qpo_ed_mu_tv||wd in qpo_ed_sr_da||wd in qpo_ed_sr_im||                    
                        wd in qpo_ed_sr_pr||wd in qpo_ed_sr_ro||wd in qpo_ed_sr_tv||wd in qpo_ed_sr_vi||wd in qpo_ed_ze_da||                    
                        wd in qpo_ed_ze_im||wd in qpo_ed_ze_pr||wd in qpo_ed_ze_ro||wd in qpo_ed_ze_tv||wd in qpo_ed_ze_vi)                     {rett=1} else {rett=0}; return rett}
function qi_mn(n,                                                                                                                               wd,rett) { wd = lc(n);
                    if (wd in qko_mn_vi||wd in qko_mn_da||wd in qko_mn_im||wd in qko_mn_pr||wd in qko_mn_ro||wd in qko_mn_tv||                  
                        wd in qpo_mn_im||wd in qpo_mn_ro||wd in qpo_mn_da||wd in qpo_mn_im||wd in qpo_mn_pr||wd in qpo_mn_ro||                  
                        wd in qpo_mn_tv)                                                                                                        {rett=1} else {rett=0}; return rett}

