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
                { hystring = gensub(/unxyp/,"","g",tolower(hystring));
                  if (hystring ~ hysnip) { for (i=1; i<=nf-1; i++) { if ( se(0,"-") ) { hyw = lc(0) sep[i] lc(1); if ( hyw in dichyph )
                { l[i] = l[i] sep[i] l[i+1]; delete sep[i]; delete l[i+1]; nf=arrpack(i+1, l); arrpack(i, sep) }; }; }; };}
function hyphbscy(hystring,  hyw)                 # Склеить слова с дефисом, присутствующие в словаре
                { hystring = gensub(/<#@_[^@]+@#>/,"","g",tolower(hystring));
                  if (hystring ~ hysnip) { for (i=1; i<=nf-1; i++) {
                  if ( sepscy[i] == "-" ) { hyw = tolower(lscy[i]) "-" tolower(lscy[i+1]); if ( hyw in dichyph )
                  { lscy[i] = lscy[i] sepscy[i] lscy[i+1]; delete sepscy[i]; delete lscy[i+1]; nfscy=arrpack(i+1, lscy); arrpack(i, sepscy) }; };
                  if ( sepscy[i] ~ /-<#@_[^@]+@#>|<#@_[^@]+@#>-/ ) { hyw = tolower(lscy[i]) "-" tolower(lscy[i+1]); if ( hyw in dichyph )
                  { lscy[i] = lscy[i] "-" lscy[i+1]; sepscy[i+1] = sepscy[i] sepscy[i+1]; delete sepscy[i]; delete lscy[i+1]; nfscy=arrpack(i+1, lscy); arrpack(i, sepscy) }; };
                 };};}
function splitline(instring,    rett)             # Разбить строку на слова
                { rett=patsplit(instring,l,patword,sep); return rett }
function splitlinescy(instring,    rett)             # Разбить строку на слова
                { rett=patsplit(instring,lscy,patword,sepscy); return rett }
function regwpart(word, part,    rett)            # Получить заменяемую часть слова в нужном регистре
                { rett=substr(word,index(tolower(word),part),length(part)); return rett }
function getwpos(word,    n)                      # Получить адрес слова в строке, Без учёта регистра
                { for(n=1;n<=nf;n++) {if(tolower(l[n])==word) wpos[n]} }
function regwpos(word,    n)                      # Получить адрес слова в строке, с учётом регистра
                { for(n=1;n<=nf;n++) {if(l[n]==word) wpos[n]} }
function arrpack(n, array,   i, rett)             # устранить пропуск в массиве
                { rett = length(array); for (i=n; i<=rett; i++) {array[i] = array[i+1]}; delete array[rett+1]; return rett }
function omakevars(basearr,xklass)                # определить переменные iwrd, winfo, omoX
                { iwrd=tolower(wrd);winfo=basearr["info"][iwrd];wln=split(omap[xklass][wrd],omlin," ");
                  omo1=basearr[xclass[xklass][1]][wrd];omo2=basearr[xclass[xklass][2]][wrd];omo3=basearr[xclass[xklass][3]][wrd] }
function makebookvars()                           # разбить строку, но склеить словарные слова с дефисом
                { b=strtonum(omlin[y]);nf=splitline(book[b]);splitlinescy(bscy[b]);hyphback(book[b]);hyphbscy(bscy[b]);regwpos(wrd); }
function makebookvars_nohyphback()                # разбить строку, но словарные слова с дефисом не склеивать
                { b=strtonum(omlin[y]);nf=splitline(book[b]);splitlinescy(bscy[b]);regwpos(wrd); }
function makewposvars()                           # определить переменные внутри цикла для слова в позиции i
                { i=strtonum(i); prex=edro2mnim=edro2mnvi=nizm=mn2e2pomn=loc2emd=loc2ezd=NORULE="" }

# функции обработки слов
function s1(n,wl,    rett)                        # выдать 1-й символ строки-сеператора
                { if( substr(sep[i+n],1,1) == wl ) {rett=1} else {rett=0}; return rett }
function lc(n,   rett)                            # перевести в нижний гегистр
                { rett = gensub(unxy,"","g",tolower(l[i+n])); return rett }
function q_(n, array,    el, rett)                # слово в БАЗОВОМ массиве?
                { if(lc(n) in array) {rett=1} else {rett=0}; return rett}
function q(n, alist,    k,wd, rett)               # обертка для нескольких функций
                { rett=0; wd=lc(n); split(alist,itmz," "); for(k in itmz) { afun=itmz[k]; if(@afun(n,wd)) {rett=1; break} }; return rett}
function q_w(n, alist,    k,wd, rett)              # обертка для нескольких функций - НЕ нахождение + пробел до
                { rett=0; wd=lc(n); split(alist,itmz," "); for(k in itmz) { afun=itmz[k]; if(@afun(n,wd) && s(n-1) && sv(n-1,"-") ) {rett=1; break} }; return rett}
function qw_(n, alist,    k,wd, rett)              # обертка для нескольких функций - НЕ нахождение + пробел после
                { rett=0; wd=lc(n); split(alist,itmz," "); for(k in itmz) { afun=itmz[k]; if(@afun(n,wd) && s(n) && sv(n,"-") ) {rett=1; break} }; return rett}
function Qist(n, alist,    k,wd, rett)               # обертка для нескольких функций
                { rett=1; split(alist,itmz," "); for(k in itmz) { afun=itmz[k]; if(@afun(n)) {rett=0; break} }; return rett}
function Q(n, alist,    k,wd, rett)              # обертка для нескольких функций - НЕ нахождение
                { rett=1; wd=lc(n); split(alist,itmz," "); for(k in itmz) { afun=itmz[k]; if(@afun(n,wd)) {rett=0; break} }; return rett}
function Qw_(n, alist,    k,wd, rett)              # обертка для нескольких функций - НЕ нахождение + пробел после
                { rett=1; wd=lc(n); split(alist,itmz," "); for(k in itmz) { afun=itmz[k]; if(@afun(n,wd) && s(n) && sv(n,"-") ) {rett=0; break} }; return rett}
function Q_w(n, alist,    k,wd, rett)              # обертка для нескольких функций - НЕ нахождение + пробел до
                { rett=1; wd=lc(n); split(alist,itmz," "); for(k in itmz) { afun=itmz[k]; if(@afun(n,wd) && s(n-1) && sv(n-1,"-") ) {rett=0; break} }; return rett}
function id(n, wl,    rett)                       # связанное слово в позиции и с морфорлогической функцией wl
                { if ( wl in omoid[iwrd][lc(n)] ) {rett=1} else {rett=0}; return rett }
function idf(n, wl,    k, rett)                   # связанное слово в позиции и с морфорлогической функцией на n позиций вперёд
                { rett=idn=""; for (k= 1; k<=n; k++) { if ( wl in omoid[iwrd][lc(k)] ) {rett=1; idn=k; break}; }; return rett }
function idb(n, wl,    k, rett)                   # связанное слово в позиции и с морфорлогической функцией на n позиций назад
                { rett=idn=""; for (k=-1; k>=n; k--) { if ( wl in omoid[iwrd][lc(k)] ) {rett=1; idn=k; break}; }; return rett }
function qm(n, isclass, mrk, mlist,    k,wd, rett)# обертка для нескольких функций и nmark
                { if ( q(n,isclass) && nmark(n,mrk,mlist) ) {rett=1} else {rett=0}; return rett}
function qq(m, n,    rett)                        # слово m равно слово n?
                { if ( lc(m) == lc(n) ) {rett=1} else {rett=0}; return rett}
function qb(n,m, isclass,    k, rett)               # поиск на n шагов назад наличия слова в классе
                { rett=qbn=""; for (k=m; k>=n; k--) { if ( q(k,isclass) ) {rett=1; qbn=k; break}; }; return rett }
function qB(n,m, isclass, notclass,    k, rett)     # поиск на n шагов назад наличия слова в классе и отсутсвия его же в другом классе
                { rett=qbn=""; for (k=m; k>=n; k--) { if ( q(k,isclass) && Q(k,notclass) ) {rett=1; qbn=k; break}; }; return rett }
function seek(n,m, isclass, notclass,    k, rett) # поиск на n шагов наличия слова в классах и отсутсвия слов в интервале в других классах, прервать, если найден notclass
                { rett=skn="";                    # SLOW?
                if (n < 0){for(k=m;k>=n;k--){if( q(k,isclass )){rett=1; skn=k; break} else {if( q(k,notclass )&& k>=n &&k<m ){rett=0; break};};};}
                else      {for(k=n;k<=m;k++){if( q(k,isclass )){rett=1; skn=k; break} else {if( q(k,notclass) && k>=n &&k<m ){rett=0; break};};};}; return rett}
#               if (n < 0){for(k=m;k>=n;k--){if(q(k,isclass)){rett=1;skn=k;if(q(k,notclass)&&k>skn&&k<m){rett=0;break};break}else{if(q(k,notclass)&&k>n&&k<m){rett=0;break};};};}
#               else      {for(k=n;k<=m;k++){if(q(k,isclass)){rett=1;skn=k;if(q(k,notclass)&&k<skn&&k<m){rett=0;break};break}else{if(q(k,notclass)&&k>n&&k<m){rett=0;break};};};return rett}
function qf(n,m, isclass,    k, rett)               # поиск на n шагов вперёд наличия слова в классе
                { rett=qfn=""; if(n<=m){for (k=n; k<=m; k++) { if ( q(k,isclass) ) {rett=1; qfn=k; break}; };}; return rett }
function qF(n,m, isclass, notclass,    k, rett)     # поиск на n шагов вперёд наличия слова в классе и отсутсвия его же в другом классе
                { rett=qfn=""; if(n<=m){for (k=n; k<=m; k++) { if ( q(k,isclass) && Q(k,notclass) ) {rett=1; qfn=k; break}; };}; return rett }
function Qb(n,m, isclass,    k, rett)               # поиск на n шагов назад отсутствия слова в слассе
                { rett=1; if(n<=m){for (k=m; k>=n; k--)   { if ( q(k,isclass) && s(k) ) {rett=0; break}; };}; return rett }
function Qf(n,m, isclass,    k, rett)               # поиск на n шагов вперёд отсутствия слова в классе
                { rett=1; if(n<=m){for (k=n; k<=m; k++)   { if ( q(k,isclass) && s(k-1) ) {rett=0; break}; };}; return rett }
function Q1f(n,m, isclass,    k, rett)               # поиск на n шагов вперёд отсутствия слова в классе
                { rett=1; for (k= 1; k<=n; k++)   { if ( @isclass(k) ) {rett=0; break}; }; return rett }
function qb_(n, array,    k, rett)                  # поиск на n шагов назад наличия слова в БАЗОВОМ массиве
                { rett=0; qbn=""; for (k=-1; k>=n; k--) { if (lc(k) in array) {rett=1; qbn=k; break}; }; return rett }
function qf_(n, array,    k, rett)                  # поиск на n шагов вперёд наличия слова в БАЗОВОМ массиве
                { rett=0; qfn=""; for (k= 1; k<=n; k++) { if (lc(k) in array) {rett=1; qfn=k; break}; }; return rett }
function Qb_(n, array,    k, rett)                  # поиск на n шагов назад отсутствия слова в БАЗОВОМ массиве
                { rett=1; for (k=-1; k>=n; k--)   { if (lc(k) in array) {rett=0; break}; }; return rett }
function Qf_(n, array,    k, rett)                  # поиск на n шагов вперёд отсутствия слова в БАЗОВОМ массиве
                { rett=1; for (k= 1; k<=n; k++)   { if (lc(k) in array) {rett=0; break}; }; return rett }
function Q_(n, array,    rett)                      # слово НЕ в БАЗОВОМ массиве?
                { if (lc(n) in array) {rett=0} else {rett=1}; return rett }
function p(n,wl,    rett)                           # разделитель содержит препинания, кроме указанных wl?
                { if(length(wl)) {if( (sep[i+n]~/([…,.:;!?—]|<\/?[pv]>|<\/?subtitle>)/ || ( i+n<0 || i+n>nf ) ) && sep[i+n] !~ wl ) {rett=1} else {rett=0}}
                  else {          if( (sep[i+n]~/([…,.:;!?—]|<\/?[pv]>|<\/?subtitle>)/ || ( i+n<0 || i+n>nf ) )                   ) {rett=1} else {rett=0}}; return rett}
function isname(n,    el, rett)                     # Слово с заглавной буквы?
                { el = "^" RUUC_ rulc "$"; if ( l[i+n] ~ el ) {rett=1} else {rett=0}; return rett }
function isacro(n,    el, rett)                     # Слово с заглавной буквы?
                { el = "^" RUUC "$"; if ( l[i+n] ~ el ) {rett=1} else {rett=0}; return rett }
function cap(n,    rett)                            # Слово с заглавной буквы?
                { if ( substr(l[i+n],1,1) ~ RUUC_ ) {rett=1} else {rett=0}; return rett }
function wmark(mrk,wl,    k, el, vmrk, rett)        # нахождение в подстроке #xxx (mrk) метки wl -- метка основного слова (winfo)
                { vmrk= "^" mrk;el="_" wl "_";split(winfo,itmz,"#"); for(k in itmz){if(itmz[k]~vmrk&&itmz[k]~el){rett=1;break}else{rett=0};}; return rett }
function nmark(n,mrk,wl,    k, el, rett)            # нахождение в подстроке #xxx (mrk) метки wl -- метка слова по адресу n -- общая функция
                { vmrk= "^" mrk; el="_" gensub(" ","_|_","g",wl) "_";split(wordmark(n),itmz,"#");for(k in itmz){if(itmz[k]~vmrk&&itmz[k]~el){rett=1;break}else{rett=0};}; return rett }
function base(n,wl,    k, el, rett)                 # нахождение в подстроке BF (базовая форма слова) заданных слов в базовой же форме (wl) для n -- частная функция
                { el="_" gensub(" ","_|_","g",wl) "_";split(wordmark(n),itmz,"#");for(k in itmz){if(itmz[k]~"^BF"&&itmz[k]~el){rett=1;break}else{rett=0};}; return rett }
function bf(m,n,wl,   j,k,el, rett)                 # нахождение ВПЕРЁД в подстроке BF (базовая форма слова) заданных слов в базовой же форме (wl) для n -- частная функция
                {bfn=rett="";el="_" gensub(" ","_|_","g",wl) "_";for(j=m;j<=n;j++){if(rett){break};split(wordmark(j),itmz,"#");
                 for(k in itmz){if(itmz[k]~"^BF"&&itmz[k]~el){rett=1;bfn=j;break};};}; return rett }
function bb(m,n,wl,    k, el, rett)                   # нахождение ВПЕРЁД в подстроке BF (базовая форма слова) заданных слов в базовой же форме (wl) для n -- частная функция
                {bbn=rett="";el="_" gensub(" ","_|_","g",wl) "_";for(j=n;j>=m;j--){if(rett){break};split(wordmark(j),itmz,"#");
                 for(k in itmz){if(itmz[k]~"^BF"&&itmz[k]~el){rett=1;bbn=j;break};};}; return rett }
function type(n,wl,    k, el, rett)                 # принадлежность слова в n к типу TY (тип/класс слова) -- частная функция
                { el="_" gensub(" ","_|_","g",wl) "_";split(wordmark(n),itmz,"#");for(k in itmz){if(itmz[k]~"^TY"&&itmz[k]~el){rett=1;break}else{rett=0};}; return rett }
function tf(m,n,wl,   j,k,el, rett)                 # нахождение ВПЕРЁД в подстроке BF (базовая форма слова) заданных слов в базовой же форме (wl) для n -- частная функция
                {bfn=rett="";el="_" gensub(" ","_|_","g",wl) "_";for(j=m;j<=n;j++){if(rett){break};split(wordmark(j),itmz,"#");
                 for(k in itmz){if(itmz[k]~"^TY"&&itmz[k]~el){rett=1;tfn=j;break};};}; return rett }
function tb(m,n,wl,    k, el, rett)                   # нахождение ВПЕРЁД в подстроке BF (базовая форма слова) заданных слов в базовой же форме (wl) для n -- частная функция
                {bfn=rett="";el="_" gensub(" ","_|_","g",wl) "_";for(j=n;j>=m;j--){if(rett){break};split(wordmark(j),itmz,"#");
                 for(k in itmz){if(itmz[k]~"^TY"&&itmz[k]~el){rett=1;tbn=j;break};};}; return rett }
function regn(n,wl,    k, el, rett)                 # принадлежность слова в n к типу GG (падежное управление) -- частная функция
                { el="_" gensub(" ","_|_","g",wl) "_";split(wordmark(n),itmz,"#");for(k in itmz){if(itmz[k]~"^GG"&&itmz[k]~el){rett=1;break}else{rett=0};}; return rett }
function w(n, wl,    itmz, rett)                    # нахождение в списке? = "одно из слов"
                { stoar(wl, itmz, "[ |]"); if (lc(n) in itmz) {rett=1} else {rett=0}; return rett }
function ww_(n, wl,    itmz, rett)                  # НЕнахождение в списке? != "одно из слов"
                { stoar(wl, itmz, "[ |]"); if (lc(n) in itmz && s(n)  ) {rett=1} else {rett=0}; return rett }
function w_w(n, wl,    itmz, rett)                  # НЕнахождение в списке? != "одно из слов"
                { stoar(wl, itmz, "[ |]"); if (lc(n) in itmz && s(n-1)) {rett=1} else {rett=0}; return rett }
function wist(n, wl,    itmz, rett)               # нахождение в списке? = "одно из слов" ist = слово со всеми правками
                { stoar(wl, itmz, "[ |]"); if (tolower(l[i+n]) in itmz) {rett=1} else {rett=0}; return rett }
function isw(n, wl,    rett)                      # слово = "слово"
                { if (tolower(l[i+n]) == wl) {rett=1} else {rett=0}; return rett }
function we(n, wl,    rett)                       # слово = "слово" с очисткой
                { if (lc(n) == wl) {rett=1} else {rett=0}; return rett }
function wc(n, wl,    itmz, k, lk, rett)          # нахождение части слова в списке? = "один из набора"
                { lk=split(wl, itmz, "[ |]"); for (k=1; k<=lk; k++) { if (lc(n)~itmz[k]) {rett=1; break} else {rett=0};}; return rett }
function Wc(n, wl,    itmz, k, lk, rett)          # НЕнахождение части слова в списке? = "один из набора"
                { lk=split(wl, itmz, "[ |]"); for (k=1; k<=lk; k++) { if (lc(n)~itmz[k]) {rett=0; break} else {rett=1};}; return rett }
function W(n, wl,    itmz, rett)                  # НЕнахождение в списке? != "одно из слов"
                { stoar(wl, itmz, "[ |]"); if (lc(n) in itmz) {rett=0} else {rett=1}; return rett }
function Ww_(n, wl,    itmz, rett)                  # НЕнахождение в списке? != "одно из слов"
                { stoar(wl, itmz, "[ |]"); if (lc(n) in itmz && s(n)  ) {rett=0} else {rett=1}; return rett }
function W_w(n, wl,    itmz, rett)                  # НЕнахождение в списке? != "одно из слов"
                { stoar(wl, itmz, "[ |]"); if (lc(n) in itmz && s(n-1)) {rett=0} else {rett=1}; return rett }
function wb(n,m, wl,    itmz, k, rett)            # поиск на n шагов назад слова из списка
                { rett=0; wbn=""; if(n<=m){stoar(wl, itmz, "[ |]"); for (k=m; k>=n; k--) { if (lc(k) in itmz) {rett=1; wbn=k; break};};}; return rett }
function wb_raw(n,m, wl,    itmz, k, rett)        # поиск на n шагов назад НЕОЧИЩЕННОГО слова из списка
                { rett=0; wbn=""; if(n<=m){stoar(wl, itmz, "[ |]"); for (k=m; k>=n; k--) { if (tolower(l[i+k]) in itmz) {rett=1; wbn=k; break};};}; return rett }
function wf(n,m, wl,    itmz, k, rett)            # поиск на n шагов вперёд наличия слова в массиве
                { rett=0; wfn=""; stoar(wl, itmz, "[ |]"); for (k=n; k<=m; k++) { if (lc(k) in itmz) {rett=1; wfn=k; break};}; return rett }
function s(m, n,    k, rett)  {                   # разделители в диапазоне НЕ содержат препинаний? = пробел (не видит дефис)
                if (n!=""&&m<n) { for (k=m; k<=n; k++) { if (sep[i+k] ~ "[…,.:;!?—]" ) {rett=0; break} else {rett=1}; };}
                else { if (sep[i+m] ~ "[…,.:;!?—]" ) {rett=0} else {rett=1}; }; return rett }
function sc(n, sym,    el, k, rett)               # поиск символа в разделителе: "содержит"
                { el = sep[i+n]; if (el ~ sym)    {rett=1} else {rett=0}; return rett }
function sv(n, sym,    el, k, rett)               # поиск символа в разделителе: "НЕ содержит"
                { el = sep[i+n]; if (el !~ sym)    {rett=1} else {rett=0}; return rett }
function se(n, sym,    el, k, rett)               # разделитель "равен"
                { el = sep[i+n]; if (el == sym)   {rett=1} else {rett=0}; return rett }
function sq(m, n, sym,   k, rett)                 # ВСЕ разделители в диапазоне m-n содержат содержит sym
                { k=m; while (k<=n){ if (sep[i+k] ~ sym ) {rett=1} else {rett=0; break}; k++}; return rett }
function sQ(m, n, pu,    k, rett)                 # разделители в диапазоне НЕ содержат препинания pu
                { for (k=m; k<=n; k++) { if (sep[i+k] ~ pu ) {rett=0; break} else {rett=1}; }; return rett }
function qsf(m, n, sym,   k, stps, rett)          # поиск ВПЕРЕД разделителя в диапазоне m-n, который содержыт содержит sym и выдать его адрес в qsn
                { qsn=rett=""; stps="[….,:;!?—]"; gsub(sym,"",stps); for(k=m; k<=n; k++) { if(sep[i+k] !~ stps) {if(sep[i+k] ~ sym) {rett=1; qsn=k; break};}else{break};}; return rett }
function qsb(m, n, sym,   k, rett)                # поиск НАЗАД разделителя в диапазоне m-n, который содержыт содержит sym и выдать его адрес в qsn
                { qsn=rett=""; stps="[….,:;!?—]"; gsub(sym,"",stps); for(k=n; k>=m; k--) { if(sep[i+k] !~ stps) {if(sep[i+k] ~ sym) {rett=1; qsn=k; break};}else{break};}; return rett }
function sos(m, n,   stps,k,rett)                # найти адрес разделителя до начала текущего предложения, и выдать его адрес в son
                { son=rett=""; stps="[….:;!?]"; for(k=n; k>=m; k--) { if(sep[i+k]~stps||sep[i+k]~/<[pv]>/||sep[i+k]=="") {rett=1; son=k; break};}; return rett }
function vv(n,m,    k, rett)                      # выдать границы вводного предложения: , и —, n= первая запятая (vvpat задана в шапке основного скрипта)
                { vvn=rett=""; if(sep[i+n]~vvpat && sep[i+n]!~/[….:;!?]/) {for(k=++n;k<=m;k++) {if(sep[i+k] !~ "[….:;!?]") {if(sep[i+k]~vvpat)
                  {rett=1;vvn=k;break};}else{break};};}; return rett}
function vvb(m,n,    k, rett)                     # выдать границы вводного предложения: , и —, n= первая запятая
                { vvn=rett=""; if(sep[i+n]~vvpat && sep[i+n]!~/[….:;!?]/) {for(k=--n;k>=m;k--) {if(sep[i+k] !~ "[….:;!?]") {if(sep[i+k]~vvpat)
                  {rett=1;vvn=k;break};}else{break};};}; return rett}
function phs(n, wl,    itmz, k, lk, cnt, rett)    # фраза от адреса влево, проверка пробелов отдельно! определяет глобальную переменную = адрес первого слова фразы
                { hsn="";lk=split(wl,itmz," "); for(k=1;k<=lk;k++) {if(lc(k+n-lk)==itmz[k]) {cnt++} else {cnt=0; break};};
                  if(cnt==lk) {rett=1; hsn=n-lk} else {rett=0}; return rett}
function phf(n, wl,    itmz, k, lk, cnt, rett)    # фраза от адреса вправо, проверка пробелов отдельно! определяет глобальную переменную = адрес последнего слова фразы
                { hfn="";lk=split(wl,itmz," "); for(k=1;k<=lk;k++) {if(lc(n+k-1)==itmz[k]) {cnt++} else {cnt=0; break};};
                  if(cnt==lk) {rett=1;hfn=n+lk} else {rett=0}; return rett}
function ismark(n,mrk,    k, el, vmrk, rett)     # нахождение СЛОВА в метке основного слова winfo, начинающейся с mrk (переменная winfo): для управления омонимами из automo.gz
                { el="_" tolower(l[i+n]) "_";vmrk= "^" mrk;split(winfo,itmz,"#");for(k in itmz){if(itmz[k]~vmrk&&itmz[k]~el){rett=1;break}else{rett=0};}; return rett }
function notmark(n,mrk,    k, el, vmrk, rett)    # НЕ нахождение СЛОВА в метке, начинающейся с mrk (переменная winfo): для управления омонимами из automo.gz
                { el="_" tolower(l[i+n]) "_";vmrk= "^" mrk;split(winfo,itmz,"#");for(k in itmz){if(itmz[k]~vmrk&&itmz[k]~el){rett=0;break}else{rett=1};}; return rett }
function notsym(n,sym,    rett)                   # НЕ нахождение подстроки sym в слове
                { if (l[i+n] !~ sym) {rett=1} else {rett=0}; return rett }
function qxs(n,a0,b0,c0,d0,e0,      a_,b_,c_,d_,e_,asu,rett) # фраза от адреса, составленная из 1-5 переменных элементов, проверка пробелов, xsn=адрес первого слова
                { if(a0) a_=1; if(b0) b_=1; if(c0) c_=1; if(d0) d_=1; if(e0) e_=1; asu=a_+b_+c_+d_+e_; xsn=""
                  if (n < 0) { switch (asu) {
                      case "1": if( s(n  ,n  ) && w(n  ,a0)                                                     ) {xsn=n        ;rett=1} else {rett=0}; break
                      case "2": if( s(n-1,n  ) && w(n-1,a0) && w(n  ,b0)                                        ) {xsn=n-(asu-1);rett=1} else {rett=0}; break
                      case "3": if( s(n-2,n  ) && w(n-2,a0) && w(n-1,b0) && w(n  ,c0)                           ) {xsn=n-(asu-1);rett=1} else {rett=0}; break
                      case "4": if( s(n-3,n  ) && w(n-3,a0) && w(n-2,b0) && w(n-1,c0) && w(n  ,d0)              ) {xsn=n-(asu-1);rett=1} else {rett=0}; break
                      case "5": if( s(n-4,n  ) && w(n-4,a0) && w(n-3,b0) && w(n-2,c0) && w(n-1,d0) && w(n  ,e0) ) {xsn=n-(asu-1);rett=1} else {rett=0}; break
                      default: rett=xsn=""; break }
                  } else { switch (asu) {
                      case "1": if( s(n-1,n-1) && w(n,  a0)                                                     ) {xsn=n+(asu-1);rett=1} else {rett=0}; break
                      case "2": if( s(n-1,n  ) && w(n  ,a0) && w(n+1,b0)                                        ) {xsn=n+(asu-1);rett=1} else {rett=0}; break
                      case "3": if( s(n-1,n+1) && w(n  ,a0) && w(n+1,b0) && w(n+2,c0)                           ) {xsn=n+(asu-1);rett=1} else {rett=0}; break
                      case "4": if( s(n-1,n+2) && w(n  ,a0) && w(n+1,b0) && w(n+2,c0) && w(n+3,d0)              ) {xsn=n+(asu-1);rett=1} else {rett=0}; break
                      case "5": if( s(n-1,n+3) && w(n  ,a0) && w(n+1,b0) && w(n+2,c0) && w(n+4,d0) && w(n+5,e0) ) {xsn=n+(asu-1);rett=1} else {rett=0}; break
                      default: rett=xfn=""; break };}; return rett}
function qxd(n,a0,b0,c0,      a_,b_,c_,asu,rett) # фраза от адреса, составленная из 1-5 переменных элементов, проверка дефисов, xsn=адрес первого слова
                { if(a0) a_=1; if(b0) b_=1; if(c0) c_=1; asu=a_+b_+c_; xsn=""
                  if (n < 0) { switch (asu) {
                      case "2": if( se(n-1,"-") &&  w(n-1,a0 ) && w(n  ,b0)                                     ) {xsn=n-(asu-1);rett=1} else {rett=0}; break
                      case "3": if( se(n-2,"-") && se(n-1,"-") && w(n-2,a0) && w(n-1,b0) && w(n  ,c0)           ) {xsn=n-(asu-1);rett=1} else {rett=0}; break
                      default: rett=xsn=""; break }
                  } else { switch (asu) {
                      case "2": if( se(n  ,"-") &&  w(n  ,a0 ) && w(n+1,b0)                                     ) {xsn=n+(asu-1);rett=1} else {rett=0}; break
                      case "3": if( se(n  ,"-") && se(n+1,"-") && w(n  ,a0) && w(n+1,b0) && w(n+2,c0)           ) {xsn=n+(asu-1);rett=1} else {rett=0}; break
                      default: rett=xfn=""; break };}; return rett}



# функции проверки принадлежности к классам. "Классы" собираются из "базовых массивов", которые формируются при чтении словаря посредством classes.awk
# география
function geo_sr(n,        wd,rett) { wd = lc(n); if (wd in geo_edsrim)                                                                        {rett=1} else {rett=0};  return rett}
function geo_mn(n,        wd,rett) { wd = lc(n); if (wd in geo_mnim)                                                                          {rett=1} else {rett=0};  return rett}

# глаголы кастомных классов
function glc_mn(n,wl,     el,k,itmz,wd,rett) { if(wl=="") { wd = lc(n); if (wd in gc_mn)                                                      {rett=1} else {rett=0}}  else
                                             { stoar(wl,itmz," ");for(k in itmz){el="_" k "_"; wd=lc(n); if(wd in gc_mn && gc_mn[wd]~el){rett=1;break} else {rett=0}}};return rett}
function glc_in(n,wl,     el,k,itmz,wd,rett) { if(wl=="") { wd = lc(n); if (wd in gc_in)                                                      {rett=1} else {rett=0}}  else
                                             { stoar(wl,itmz," ");for(k in itmz){el="_" k "_"; wd=lc(n); if(wd in gc_in && gc_in[wd]~el){rett=1;break} else {rett=0}}};return rett}
function glc_po(n,wl,     el,k,itmz,wd,rett) { if(wl=="") { wd = lc(n); if (wd in gc_po)                                                      {rett=1} else {rett=0}}  else
                                             { stoar(wl,itmz," ");for(k in itmz){el="_" k "_"; wd=lc(n); if(wd in gc_po && gc_po[wd]~el){rett=1;break} else {rett=0}}};return rett}

# модальные слова
function mod_bz(n,        wd,rett) { if(!(wd))wd=lc(n); if (wd in md_bz)                                                                       {rett=1} else {rett=0}; return rett}
function mod_ed(n,        wd,rett) { if(!(wd))wd=lc(n); if (wd in md_ed)                                                                       {rett=1} else {rett=0}; return rett}
function mod_mn(n,        wd,rett) { if(!(wd))wd=lc(n); if (wd in md_mn)                                                                       {rett=1} else {rett=0}; return rett}

# указательные местоимения
function muk_edmuim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edmuim)                                                                  {rett=1} else {rett=0}; return rett}
function muk_edzeim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edzeim)                                                                  {rett=1} else {rett=0}; return rett}
function muk_edsrim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edsrim)                                                                  {rett=1} else {rett=0}; return rett}
function muk_edmuvi(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edmuvi)                                                                  {rett=1} else {rett=0}; return rett}
function muk_edzevi(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edzevi)                                                                  {rett=1} else {rett=0}; return rett}
function muk_edsrvi(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edsrvi)                                                                  {rett=1} else {rett=0}; return rett}
function muk_edmuda(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edmuda)                                                                  {rett=1} else {rett=0}; return rett}
function muk_edzeda(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edzeda)                                                                  {rett=1} else {rett=0}; return rett}
function muk_edsrda(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edsrda)                                                                  {rett=1} else {rett=0}; return rett}
function muk_edmuro(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edmuro)                                                                  {rett=1} else {rett=0}; return rett}
function muk_edzero(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edzero)                                                                  {rett=1} else {rett=0}; return rett}
function muk_edsrro(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edsrro)                                                                  {rett=1} else {rett=0}; return rett}
function muk_edmutv(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edmutv)                                                                  {rett=1} else {rett=0}; return rett}
function muk_edzetv(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edzetv)                                                                  {rett=1} else {rett=0}; return rett}
function muk_edsrtv(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edsrtv)                                                                  {rett=1} else {rett=0}; return rett}
function muk_edmupr(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edmupr)                                                                  {rett=1} else {rett=0}; return rett}
function muk_edzepr(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edzepr)                                                                  {rett=1} else {rett=0}; return rett}
function muk_edsrpr(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edsrpr)                                                                  {rett=1} else {rett=0}; return rett}
function muk_edim(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edmuim||wd in muc_edzeim||wd in muc_edsrim)                              {rett=1} else {rett=0}; return rett}
function muk_edvi(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edmuvi||wd in muc_edzevi||wd in muc_edsrvi)                              {rett=1} else {rett=0}; return rett}
function muk_edda(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edmuda||wd in muc_edzeda||wd in muc_edsrda)                              {rett=1} else {rett=0}; return rett}
function muk_edro(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edmuro||wd in muc_edzero||wd in muc_edsrro)                              {rett=1} else {rett=0}; return rett}
function muk_edtv(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edmutv||wd in muc_edzetv||wd in muc_edsrtv)                              {rett=1} else {rett=0}; return rett}
function muk_edpr(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edmupr||wd in muc_edzepr||wd in muc_edsrpr)                              {rett=1} else {rett=0}; return rett}
function muk_mnim(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_mnim)                                                                    {rett=1} else {rett=0}; return rett}
function muk_mnvi(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_mnvi)                                                                    {rett=1} else {rett=0}; return rett}
function muk_mnda(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_mnda)                                                                    {rett=1} else {rett=0}; return rett}
function muk_mnro(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_mnro)                                                                    {rett=1} else {rett=0}; return rett}
function muk_mntv(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_mntv)                                                                    {rett=1} else {rett=0}; return rett}
function muk_mnpr(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_mnpr)                                                                    {rett=1} else {rett=0}; return rett}
function muk_im(n,        wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edmuim||wd in muc_edzeim||wd in muc_edsrim||wd in muc_mnim)              {rett=1} else {rett=0}; return rett}
function muk_vi(n,        wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edmuvi||wd in muc_edzevi||wd in muc_edsrvi||wd in muc_mnvi)              {rett=1} else {rett=0}; return rett}
function muk_da(n,        wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edmuda||wd in muc_edzeda||wd in muc_edsrda||wd in muc_mnda)              {rett=1} else {rett=0}; return rett}
function muk_ro(n,        wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edmuro||wd in muc_edzero||wd in muc_edsrro||wd in muc_mnro)              {rett=1} else {rett=0}; return rett}
function muk_tv(n,        wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edmutv||wd in muc_edzetv||wd in muc_edsrtv||wd in muc_mntv)              {rett=1} else {rett=0}; return rett}
function muk_pr(n,        wd,rett) { if(!(wd))wd=lc(n); if (wd in muc_edmupr||wd in muc_edzepr||wd in muc_edsrpr||wd in muc_mnpr)              {rett=1} else {rett=0}; return rett}
function muk_ed(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in muc_edmuim||wd in muc_edzeim||wd in muc_edsrim||wd in muc_edmuvi||wd in muc_edzevi||wd in muc_edsrvi||
                          wd in muc_edmuda||wd in muc_edzeda||wd in muc_edsrda||wd in muc_edmuro||wd in muc_edzero||wd in muc_edsrro||
                          wd in muc_edmutv||wd in muc_edzetv||wd in muc_edsrtv||wd in muc_edmupr||wd in muc_edzepr||wd in muc_edsrpr)          {rett=1} else {rett=0}; return rett}
function muk_mn(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in muc_mnim||wd in muc_mnvi||wd in muc_mnda||wd in muc_mnro||wd in muc_mntv||wd in muc_mnpr)                      {rett=1} else {rett=0}; return rett}

# кастомные местоимения
function mest_it(n,       wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_it && sep[i+n-1]!="-")                                                   {rett=1} else {rett=0}; return rett}
function mest_pedmuim(n,  wd,rett) { if(!(wd))wd=lc(n); if (wd in mstc_edmuim && sep[i+n-1]!="-")                                              {rett=1} else {rett=0}; return rett}
function mest_pedmuro(n,  wd,rett) { if(!(wd))wd=lc(n); if (wd in mstc_edmuro && sep[i+n-1]!="-")                                              {rett=1} else {rett=0}; return rett}
function mest_pedmuda(n,  wd,rett) { if(!(wd))wd=lc(n); if (wd in mstc_edmuda && sep[i+n-1]!="-")                                              {rett=1} else {rett=0}; return rett}
function mest_pedmutv(n,  wd,rett) { if(!(wd))wd=lc(n); if (wd in mstc_edmutv && sep[i+n-1]!="-")                                              {rett=1} else {rett=0}; return rett}
function mest_pedmupr(n,  wd,rett) { if(!(wd))wd=lc(n); if (wd in mstc_edmupr && sep[i+n-1]!="-")                                              {rett=1} else {rett=0}; return rett}
function mest_pedsrim(n,  wd,rett) { if(!(wd))wd=lc(n); if (wd in mstc_edsrim && sep[i+n-1]!="-")                                              {rett=1} else {rett=0}; return rett}
function mest_pedzeim(n,  wd,rett) { if(!(wd))wd=lc(n); if (wd in mstc_edzeim && sep[i+n-1]!="-")                                              {rett=1} else {rett=0}; return rett}
function mest_pedzevi(n,  wd,rett) { if(!(wd))wd=lc(n); if (wd in mstc_edzevi && sep[i+n-1]!="-")                                              {rett=1} else {rett=0}; return rett}
function mest_pedzeda(n,  wd,rett) { if(!(wd))wd=lc(n); if (wd in mstc_edzero && sep[i+n-1]!="-")                                              {rett=1} else {rett=0}; return rett}
function mest_pedzero(n,  wd,rett) { if(!(wd))wd=lc(n); if (wd in mstc_edzero && sep[i+n-1]!="-")                                              {rett=1} else {rett=0}; return rett}
function mest_pmnim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in mstc_mnim   && sep[i+n-1]!="-")                                              {rett=1} else {rett=0}; return rett}
function mest_pmnro(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in mstc_mnro   && sep[i+n-1]!="-")                                              {rett=1} else {rett=0}; return rett}
function mest_pmnda(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in mstc_mnda   && sep[i+n-1]!="-")                                              {rett=1} else {rett=0}; return rett}
function mest_pmntv(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in mstc_mntv   && sep[i+n-1]!="-")                                              {rett=1} else {rett=0}; return rett}
function mest_pmnpr(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in mstc_mnpr   && sep[i+n-1]!="-")                                              {rett=1} else {rett=0}; return rett}

function mest_3e(n,       wd,rett) { if(!(wd))wd=lc(n); if (wd in mstc_3e)                                                                     {rett=1} else {rett=0}; return rett}

# относительные прилагательные/местоимения в роли союза
function otnsouz_edmuim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edmuim)                                                              {rett=1} else {rett=0}; return rett}
function otnsouz_edzeim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edzeim)                                                              {rett=1} else {rett=0}; return rett}
function otnsouz_edsrim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edsrim)                                                              {rett=1} else {rett=0}; return rett}
function otnsouz_edmuvi(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edmuvi)                                                              {rett=1} else {rett=0}; return rett}
function otnsouz_edzevi(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edzevi)                                                              {rett=1} else {rett=0}; return rett}
function otnsouz_edsrvi(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edsrvi)                                                              {rett=1} else {rett=0}; return rett}
function otnsouz_edmuda(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edmuda)                                                              {rett=1} else {rett=0}; return rett}
function otnsouz_edzeda(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edzeda)                                                              {rett=1} else {rett=0}; return rett}
function otnsouz_edsrda(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edsrda)                                                              {rett=1} else {rett=0}; return rett}
function otnsouz_edmuro(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edmuro)                                                              {rett=1} else {rett=0}; return rett}
function otnsouz_edzero(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edzero)                                                              {rett=1} else {rett=0}; return rett}
function otnsouz_edsrro(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edsrro)                                                              {rett=1} else {rett=0}; return rett}
function otnsouz_edmutv(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edmutv)                                                              {rett=1} else {rett=0}; return rett}
function otnsouz_edzetv(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edzetv)                                                              {rett=1} else {rett=0}; return rett}
function otnsouz_edsrtv(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edsrtv)                                                              {rett=1} else {rett=0}; return rett}
function otnsouz_edmupr(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edmupr)                                                              {rett=1} else {rett=0}; return rett}
function otnsouz_edzepr(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edzepr)                                                              {rett=1} else {rett=0}; return rett}
function otnsouz_edsrpr(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edsrpr)                                                              {rett=1} else {rett=0}; return rett}
function otnsouz_edim(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edmuim||wd in otm_edzeim||wd in otm_edsrim)                          {rett=1} else {rett=0}; return rett}
function otnsouz_edvi(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edmuvi||wd in otm_edzevi||wd in otm_edsrvi)                          {rett=1} else {rett=0}; return rett}
function otnsouz_edda(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edmuda||wd in otm_edzeda||wd in otm_edsrda)                          {rett=1} else {rett=0}; return rett}
function otnsouz_edro(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edmuro||wd in otm_edzero||wd in otm_edsrro)                          {rett=1} else {rett=0}; return rett}
function otnsouz_edtv(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edmutv||wd in otm_edzetv||wd in otm_edsrtv)                          {rett=1} else {rett=0}; return rett}
function otnsouz_edpr(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edmupr||wd in otm_edzepr||wd in otm_edsrpr)                          {rett=1} else {rett=0}; return rett}
function otnsouz_mnim(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_mnim)                                                                {rett=1} else {rett=0}; return rett}
function otnsouz_mnvi(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_mnvi)                                                                {rett=1} else {rett=0}; return rett}
function otnsouz_mnda(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_mnda)                                                                {rett=1} else {rett=0}; return rett}
function otnsouz_mnro(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_mnro)                                                                {rett=1} else {rett=0}; return rett}
function otnsouz_mntv(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_mntv)                                                                {rett=1} else {rett=0}; return rett}
function otnsouz_mnpr(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_mnpr)                                                                {rett=1} else {rett=0}; return rett}
function otnsouz_im(n,        wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edmuim||wd in otm_edzeim||wd in otm_edsrim||wd in otm_mnim)          {rett=1} else {rett=0}; return rett}
function otnsouz_vi(n,        wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edmuvi||wd in otm_edzevi||wd in otm_edsrvi||wd in otm_mnvi)          {rett=1} else {rett=0}; return rett}
function otnsouz_da(n,        wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edmuda||wd in otm_edzeda||wd in otm_edsrda||wd in otm_mnda)          {rett=1} else {rett=0}; return rett}
function otnsouz_ro(n,        wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edmuro||wd in otm_edzero||wd in otm_edsrro||wd in otm_mnro)          {rett=1} else {rett=0}; return rett}
function otnsouz_tv(n,        wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edmutv||wd in otm_edzetv||wd in otm_edsrtv||wd in otm_mntv)          {rett=1} else {rett=0}; return rett}
function otnsouz_pr(n,        wd,rett) { if(!(wd))wd=lc(n); if (wd in otm_edmupr||wd in otm_edzepr||wd in otm_edsrpr||wd in otm_mnpr)          {rett=1} else {rett=0}; return rett}
function otnsouz_ed(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in otm_edmuim||wd in otm_edzeim||wd in otm_edsrim||wd in otm_edmuvi||wd in otm_edzevi||wd in otm_edsrvi||
                          wd in otm_edmuda||wd in otm_edzeda||wd in otm_edsrda||wd in otm_edmuro||wd in otm_edzero||wd in otm_edsrro||
                          wd in otm_edmutv||wd in otm_edzetv||wd in otm_edsrtv||wd in otm_edmupr||wd in otm_edzepr||wd in otm_edsrpr)          {rett=1} else {rett=0}; return rett}
function otnsouz_mn(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in otm_mnim||wd in otm_mnvi||wd in otm_mnda||wd in otm_mnro||wd in otm_mntv||wd in otm_mnpr)                      {rett=1} else {rett=0}; return rett}


# двойственное число
function qi_duom(n,       wd,rett) { if(!(wd))wd=lc(n); if (wd in qd_duom)                                                                     {rett=1} else {rett=0}; return rett}
function qi_duoz(n,       wd,rett) { if(!(wd))wd=lc(n); if (wd in qd_duoz)                                                                     {rett=1} else {rett=0}; return rett}

# кастомные предлоги
# возможен однин падеж
function prex_im(n,       wd,rett) { if(!(wd))wd=lc(n); if (wd in predc_im)                                                                    {rett=1} else {rett=0}; return rett}
function prex_vi(n,       wd,rett) { if(!(wd))wd=lc(n); if (wd in predc_vi)                                                                    {rett=1} else {rett=0}; return rett}
function prex_ro(n,       wd,rett) { if(!(wd))wd=lc(n); if (wd in predc_ro)                                                                    {rett=1} else {rett=0}; return rett}
function prex_da(n,       wd,rett) { if(!(wd))wd=lc(n); if (wd in predc_da)                                                                    {rett=1} else {rett=0}; return rett}
function prex_tv(n,       wd,rett) { if(!(wd))wd=lc(n); if (wd in predc_tv)                                                                    {rett=1} else {rett=0}; return rett}
function prex_pr(n,       wd,rett) { if(!(wd))wd=lc(n); if (wd in predc_pr)                                                                    {rett=1} else {rett=0}; return rett}
# возможны несколько падежей
function prem_imvipr(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in predc_imvipr)                                                                {rett=1} else {rett=0}; return rett}
function prem_vipr(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in predc_vipr)                                                                  {rett=1} else {rett=0}; return rett}
function prem_vitv(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in predc_vitv)                                                                  {rett=1} else {rett=0}; return rett}
function prem_rotv(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in predc_rotv)                                                                  {rett=1} else {rett=0}; return rett}
function prem_virotv(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in predc_virotv)                                                                {rett=1} else {rett=0}; return rett}
function prem_vidapr(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in predc_vidapr)                                                                {rett=1} else {rett=0}; return rett}

# предлоги квази-предлоги из нескольких слов
function preph_vi(n,                                                                                                                           rett) {
                     if ( qxs(n,"без","оглядки согласия","на")||
                          qxs(n,"в","обмен ответ расчете","на")||
                          qxs(n,"глядя невзирая несмотря","на")||
                          qxs(n,"в","порядок") )                                                                                               {rett=1} else {rett=0}; return rett}
function preph_da(n,                                                                                                                           rett) {
                     if ( qxs(n,"в","дополнение направлении приложение приложении применении","к ко") ||
                          qxs(n,"в","память","о об") ||
                          qxs(n,"в","замену противность противовес противоположность тон угоду ущерб") ||
                          qxs(n,"боком вдобавок вплотную вплоть лицом плюс применительно","к ко") ||
                          qxs(n,"вдоль вниз вверх глядя смотря судя","по") ||
                          qxs(n,"на","пути путях","к ко") ||
                          qxs(n,"на","радость пользу смену") ||
                          qxs(n,"не","в","пример") ||
                          qxs(n,"по","направлению отношению","к ко")||
                          qxs(n,"под","стать"))                                                                                                {rett=1} else {rett=0}; return rett}
function preph_ro(n,                                                                                                                           rett) {
                     if ( qxs(n,"без","согласования","с со") ||
                          qxs(n,"без","ведома помощи согласия указания") ||
                          qxs(n,"в","близи далеке дали зависимости отдалении отличие отрыве стороне сторону шаге","от") ||
                          qxs(n,"в","авангард авангарде адрес аспекте видах виде возрасте границах глазах глубине глубь гуще деле довершение доказательство должности духе завершение заключение зачёт защиту знак ипостаси истории исходе интересах качестве количестве компании конец конце круге кругу курс курсе лице меру мире направлении нарушение начале области область обстановке обход ознаменование ожидании окружении основе отношении отмену отсутствие память плане поисках пользу порядке предвидении предвкушении преддверии преддверье пределах пределы присутствии продолжение процессе разгар разрезе размере районе рамках рамки распоряжение распоряжении середине рассуждении расцвете результате роли русле ряде ряду свете силу случае смысле сопровождении составе стенах сторону сумме сфере счет течение торце условиях форме форму формулировке центр центре характере ходе целях части честь честь числе число") ||
                          qxs(n,"вне","зависимости","от") ||
                          qxs(n,"вне","границ пределов рамок сферы") ||
                          qxs(n,"во","вкусе власти времена время главе здравие избежание изменение имя исполнение славу спасение") ||
                          qxs(n,"вплоть впредь задолго незадолго что","до") ||
                          qxs(n,"до","выяснения глубины завершения истечения конца наступления начала прихода окончания середины") ||
                          qxs(n,"за","вычетом границами границы исключением неимением пределами пределы счет") ||
                          qxs(n,"из","расчета среды числа") ||
                          qxs(n,"именем имени конец конца конце концу начало начала начале началу середина середине середину несть") ||
                          qxs(n,"исходя","из") ||
                          qxs(n,"к","довершению завершению исходу концу краю началу окончанию помощи прибытию приезду приходу расцвету середине чести числу") ||
                          qxs(n,"ко","времени") ||
                          qxs(n,"на","глазах виду совести","у") ||
                          qxs(n,"на","переднем","крае") ||
                          qxs(n,"на","базе берег берегу бок боку благо вершине волне вопрос высоте глазах грани дне имя заре краю манер месте начало ниве окраине опушке основании основе поверхности порог пороге потребу почве правах предмет примере произвол протяжении пути путях случай склон склоне склонах совести срок стороне сторону страже стыке счету тему углу уровне фоне") ||
                          qxs(n,"над","краем уровнем") ||
                          qxs(n,"вблизи вдалеке вдали влево вправо наискосок наискось налево направо начиная невдалеке недалеко независимо неподалеку поблизости поодаль прочь сбоку сверху слева снизу справа","от") ||
                          qxs(n,"начиная","с со") ||
                          qxs(n,"не","без до доходя считая") ||
                          qxs(n,"перед","концом лицом началом") ||
                          qxs(n,"по","адресу бокам вине вопросам вопросу выражению долгу истечении линии мановению мере милости миновани имнению направлению наущению неимению поводу поручению праву примеру принципу причине прошествии пути образу окончании сведениям склону случаю стопам сути уполномочию части ходу") ||
                          qxs(n,"по","образу","и","подобию") ||
                          qxs(n,"под","видом гнётом знаком знамёна знамёнами знаменем знамя командованием личиной маркой названием началом номером покровом предлогом председательством сенью стенами тон тяжестью углом эгидой") ||
                          qxs(n,"при","помощи посредстве указании условии") ||
                          qxs(n,"от","имени рук руки лица") ||
                          qxs(n,"с","ведома внешностью лишением момента подачи помощью начала началом наступлением прибытием приходом отделением учетом уходом целью") ||
                          qxs(n,"с","лёгкой","руки") ||
                          qxs(n,"сквозь","призму") ||
                          qxs(n,"со","знанием слов стороны") ||
                          qxs(n,"через","посредство призму") )                                                                                 {rett=1} else {rett=0}; return rett}
function preph_tv(n,                                                                                                                           rett) {
                     if ( qxs(n,"в","ногу компании мире вровень связи связи согласии сообществе соответствии сопоставлении сравнении унисон уровень","с со") ||
                          qxs(n,"в","бытность") ||
                          qxs(n,"вкупе одновременно","с со") ||
                          qxs(n,"во","главе","с со") ||
                          qxs(n,"по","аналогии согласованию сравнению","с со") ||
                          qxs(n,"о","бок","с со") ||
                          qxs(n,"вдогонку вслед далеко следом","за") ||
                          qxs(n,"вместе наравне наряду рядом совместно совокупно согласно сообразно сообща соответственно соразмерно сравнительно","с со") )
                                                                                                                                               {rett=1} else {rett=0}; return rett}
function preph_any(n,   rett) { if ( preph_vi(n)||preph_da(n)||preph_ro(n)||preph_tv(n) )                                                      {rett=1} else {rett=0}; return rett }

# прилагательные
function prl_kred_mu(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_kred_mu)                                                                  {rett=1} else {rett=0}; return rett}
function prl_kred_ze(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_kred_ze)                                                                  {rett=1} else {rett=0}; return rett}
function prl_kred_sr(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_kred_sr)                                                                  {rett=1} else {rett=0}; return rett}
function prl_kred(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_kred_mu||wd in pl_kred_ze||wd in pl_kred_sr)                              {rett=1} else {rett=0}; return rett}
function prl_krmn(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_krmn)                                                                     {rett=1} else {rett=0}; return rett}
function prl_srav(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_srv)                                                                      {rett=1} else {rett=0}; return rett}
function prl_neiz(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_neiz)                                                                     {rett=1} else {rett=0}; return rett}
function prl_edmuim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_edmu_im||wd in pl_pv_edmu_im)                                             {rett=1} else {rett=0}; return rett}
function prl_edmuvi(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_edmu_im||wd in pl_pv_edmu_im||wd in pl_edmu_ro||wd in pl_pv_edmu_ro)      {rett=1} else {rett=0}; return rett}
function prl_edmuro(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_edmu_ro||wd in pl_pv_edmu_ro)                                             {rett=1} else {rett=0}; return rett}
function prl_edmuda(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_edmu_da||wd in pl_pv_edmu_da)                                             {rett=1} else {rett=0}; return rett}
function prl_edmutv(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_edmu_tv||wd in pl_pv_edmu_tv)                                             {rett=1} else {rett=0}; return rett}
function prl_edmupr(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_edmu_pr||wd in pl_pv_edmu_pr)                                             {rett=1} else {rett=0}; return rett}
function prl_edsrim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_edsr_im||wd in pl_pv_edsr_im)                                             {rett=1} else {rett=0}; return rett}
function prl_edsrvi(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_edsr_im||wd in pl_pv_edsr_im)                                             {rett=1} else {rett=0}; return rett}
function prl_edsrro(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_edsr_ro||wd in pl_pv_edsr_ro)                                             {rett=1} else {rett=0}; return rett}
function prl_edsrda(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_edsr_da||wd in pl_pv_edsr_da)                                             {rett=1} else {rett=0}; return rett}
function prl_edsrtv(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_edsr_tv||wd in pl_pv_edsr_tv)                                             {rett=1} else {rett=0}; return rett}
function prl_edsrpr(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_edsr_pr||wd in pl_pv_edsr_pr)                                             {rett=1} else {rett=0}; return rett}
function prl_edzeim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_edze_im||wd in pl_pv_edze_im)                                             {rett=1} else {rett=0}; return rett}
function prl_edzevi(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_edze_vi||wd in pl_pv_edze_vi)                                             {rett=1} else {rett=0}; return rett}
function prl_edzero(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_edze_dr||wd in pl_pv_edze_dr)                                             {rett=1} else {rett=0}; return rett}
function prl_edzeda(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_edze_dr||wd in pl_pv_edze_dr)                                             {rett=1} else {rett=0}; return rett}
function prl_edzetv(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_edze_tv||wd in pl_pv_edze_tv||wd in pl_edze_dr||wd in pl_pv_edze_dr)      {rett=1} else {rett=0}; return rett}
function prl_edzepr(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_edze_dr||wd in pl_pv_edze_dr)                                             {rett=1} else {rett=0}; return rett}
function prl_edim(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pl_edmu_im||wd in pl_edsr_im||wd in pl_edze_im||wd in pl_pv_edmu_im||wd in pl_pv_edsr_im||wd in pl_pv_edze_im) {rett=1} else {rett=0}; return rett}
function prl_edvi(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pl_edmu_im||wd in pl_edmu_ro||wd in pl_edsr_im||wd in pl_edze_vi||wd in pl_pv_edmu_im||wd in pl_pv_edmu_ro||
                          wd in pl_pv_edsr_im||wd in pl_pv_edze_vi)                                                                            {rett=1} else {rett=0}; return rett}
function prl_edro(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pl_edmu_ro||wd in pl_edsr_ro||wd in pl_edze_dr||wd in pl_pv_edmu_ro||wd in pl_pv_edsr_ro||wd in pl_pv_edze_dr) {rett=1} else {rett=0}; return rett}
function prl_edda(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pl_edmu_da||wd in pl_edsr_da||wd in pl_edze_dr||wd in pl_pv_edmu_da||wd in pl_pv_edsr_da||wd in pl_pv_edze_dr) {rett=1} else {rett=0}; return rett}
function prl_edtv(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pl_edmu_tv||wd in pl_edsr_tv||wd in pl_edze_tv||wd in pl_edze_dr||wd in pl_pv_edmu_tv||wd in pl_pv_edsr_tv||
                          wd in pl_pv_edze_tv||wd in pl_pv_edze_dr)                                                                            {rett=1} else {rett=0}; return rett}
function prl_edpr(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pl_edmu_pr||wd in pl_edsr_pr||wd in pl_edze_dr||wd in pl_pv_edmu_pr||wd in pl_pv_edsr_pr||wd in pl_pv_edze_dr) {rett=1} else {rett=0}; return rett}
function prl_mnim(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_mn_im||wd in pl_pv_mn_im)                                                 {rett=1} else {rett=0}; return rett}
function prl_mnvi(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_mn_im||wd in pl_mn_ro||wd in pl_pv_mn_im||wd in pl_pv_mn_ro)              {rett=1} else {rett=0}; return rett}
function prl_mnro(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_mn_ro||wd in pl_pv_mn_ro)                                                 {rett=1} else {rett=0}; return rett}
function prl_mnda(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_mn_da||wd in pl_pv_mn_da)                                                 {rett=1} else {rett=0}; return rett}
function prl_mntv(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_mn_tv||wd in pl_pv_mn_tv)                                                 {rett=1} else {rett=0}; return rett}
function prl_mnpr(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_mn_ro||wd in pl_pv_mn_pr)                                                 {rett=1} else {rett=0}; return rett}
function prl_pvedtv(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_pv_edmu_tv||wd in pl_pv_edsr_tv||wd in pl_pv_edze_tv)                     {rett=1} else {rett=0}; return rett}
function prl_pvmntv(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in pl_pv_mn_tv)                                                                 {rett=1} else {rett=0}; return rett}
function prl_ed(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pl_edmu_im||wd in pl_edsr_im||wd in pl_edze_im||wd in pl_pv_edmu_im||wd in pl_pv_edsr_im||wd in pl_edmu_da||
                          wd in pl_edze_vi||wd in pl_pv_edze_vi||wd in pl_edmu_ro||wd in pl_pv_edmu_ro|| wd in pl_edsr_ro||wd in pl_edze_dr||
                          wd in pl_pv_edsr_ro||wd in pl_pv_edze_dr||wd in pl_edsr_da||wd in pl_pv_edmu_da||wd in pl_pv_edze_im||
                          wd in pl_pv_edsr_da||wd in pl_edmu_tv||wd in pl_edsr_tv||wd in pl_edze_tv||wd in pl_pv_edmu_tv||wd in pl_edmu_pr||
                          wd in pl_pv_edsr_tv||wd in pl_pv_edze_tv||wd in pl_edsr_pr||wd in pl_pv_edmu_pr||wd in pl_pv_edsr_pr)                {rett=1} else {rett=0}; return rett}
function prl_mn(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pl_mn_im||wd in pl_pv_mn_im||wd in pl_mn_ro||wd in pl_pv_mn_ro||wd in pl_mn_da||wd in pl_pv_mn_da||
                          wd in pl_mn_tv||wd in pl_pv_mn_tv||wd in pl_pv_mn_pr||wd in pl_pv_edmu_tv||wd in pl_pv_edsr_tv||wd in pl_pv_edze_tv) {rett=1} else {rett=0}; return rett}
function prl_any(n,                                                                                                                            wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pl_edmu_im||wd in pl_edsr_im||wd in pl_edze_im||wd in pl_pv_edmu_im||wd in pl_pv_edsr_im||wd in pl_edmu_da||
                          wd in pl_edze_vi||wd in pl_pv_edze_vi||wd in pl_edmu_ro||wd in pl_pv_edmu_ro|| wd in pl_edsr_ro||wd in pl_edze_dr||
                          wd in pl_pv_edsr_ro||wd in pl_pv_edze_dr||wd in pl_edsr_da||wd in pl_pv_edmu_da||wd in pl_pv_edze_im||
                          wd in pl_pv_edsr_da||wd in pl_edmu_tv||wd in pl_edsr_tv||wd in pl_edze_tv||wd in pl_pv_edmu_tv||wd in pl_edmu_pr||
                          wd in pl_pv_edsr_tv||wd in pl_pv_edze_tv||wd in pl_edsr_pr||wd in pl_pv_edmu_pr||wd in pl_pv_edsr_pr||
                          wd in pl_mn_im||wd in pl_pv_mn_im||wd in pl_mn_ro||wd in pl_pv_mn_ro||wd in pl_mn_da||wd in pl_pv_mn_da||
                          wd in pl_mn_tv||wd in pl_pv_mn_tv||wd in pl_pv_mn_pr||wd in pl_pv_edmu_tv||wd in pl_pv_edsr_tv||wd in pl_pv_edze_tv) {rett=1} else {rett=0}; return rett}

# причастия
function prq_kred_mu(n,                                                                                                                        wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_na_kred_mu||wd in pq2_pa_kred_mu||wd in pqn_na_kred_mu||wd in pqn_pa_kred_mu||wd in pqs_pa_kred_mu)        {rett=1} else {rett=0}; return rett}
function prq_kred_ze(n,                                                                                                                        wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_na_kred_ze||wd in pq2_pa_kred_ze||wd in pqn_na_kred_ze||wd in pqn_pa_kred_ze||wd in pqs_pa_kred_ze)        {rett=1} else {rett=0}; return rett}
function prq_kred_sr(n,                                                                                                                        wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_na_kred_sr||wd in pq2_pa_kred_sr||wd in pqn_na_kred_sr||wd in pqn_pa_kred_sr||wd in pqs_pa_kred_sr)        {rett=1} else {rett=0}; return rett}
function prq_kred(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_na_kred_mu||wd in pq2_pa_kred_mu||wd in pqn_na_kred_mu||wd in pqn_pa_kred_mu||wd in pqs_pa_kred_mu||
                          wd in pq2_na_kred_ze||wd in pq2_pa_kred_ze||wd in pqn_na_kred_ze||wd in pqn_pa_kred_ze||wd in pqs_pa_kred_ze||
                          wd in pq2_na_kred_sr||wd in pq2_pa_kred_sr||wd in pqn_na_kred_sr||wd in pqn_pa_kred_sr||wd in pqs_pa_kred_sr)        {rett=1} else {rett=0}; return rett}
function prq_krmn(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_na_krmn||wd in pq2_pa_krmn||wd in pqn_na_krmn||wd in pqn_pa_krmn||wd in pqs_pa_krmn)                       {rett=1} else {rett=0}; return rett}
function prq_edmuim(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_mu_im||wd in pq2_ne_vz_pa_ed_mu_im||wd in pq2_ne_na_ed_mu_im||wd in pq2_ne_pa_ed_mu_im||
                          wd in pq2_pe_na_ed_mu_im||wd in pq2_pe_pa_ed_mu_im||wd in pq2_pe_sd_na_ed_mu_im||wd in pq2_pe_sd_pa_ed_mu_im||
                          wd in pq2_pn_na_ed_mu_im||wd in pq2_pn_pa_ed_mu_im||wd in pqn_ne_vz_na_ed_mu_im||wd in pqn_ne_vz_pa_ed_mu_im||
                          wd in pqn_ne_na_ed_mu_im||wd in pqn_ne_pa_ed_mu_im||wd in pqn_pe_na_ed_mu_im||wd in pqn_pe_pa_ed_mu_im||
                          wd in pqn_pe_sd_na_ed_mu_im||wd in pqn_pe_sd_pa_ed_mu_im||wd in pqn_pn_na_ed_mu_im||wd in pqn_pn_pa_ed_mu_im||
                          wd in pqs_ne_vz_pa_ed_mu_im||wd in pqs_ne_pa_ed_mu_im||wd in pqs_pe_pa_ed_mu_im||wd in pqs_pe_sd_pa_ed_mu_im||
                          wd in pqs_pn_pa_ed_mu_im)                                                                                            {rett=1} else {rett=0}; return rett}
function prq_edsrim(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_sr_im||wd in pq2_ne_vz_pa_ed_sr_im||wd in pq2_ne_na_ed_sr_im||wd in pq2_ne_pa_ed_sr_im||
                          wd in pq2_pe_na_ed_sr_im||wd in pq2_pe_pa_ed_sr_im||wd in pq2_pe_sd_na_ed_sr_im||wd in pq2_pe_sd_pa_ed_sr_im||
                          wd in pq2_pn_na_ed_sr_im||wd in pq2_pn_pa_ed_sr_im||wd in pqn_ne_vz_na_ed_sr_im||wd in pqn_ne_vz_pa_ed_sr_im||
                          wd in pqn_ne_na_ed_sr_im||wd in pqn_ne_pa_ed_sr_im||wd in pqn_pe_na_ed_sr_im||wd in pqn_pe_pa_ed_sr_im||
                          wd in pqn_pe_sd_na_ed_sr_im||wd in pqn_pe_sd_pa_ed_sr_im||wd in pqn_pn_na_ed_sr_im||wd in pqn_pn_pa_ed_sr_im||
                          wd in pqs_ne_vz_pa_ed_sr_im||wd in pqs_ne_pa_ed_sr_im||wd in pqs_pe_pa_ed_sr_im||wd in pqs_pe_sd_pa_ed_sr_im||
                          wd in pqs_pn_pa_ed_sr_im)                                                                                            {rett=1} else {rett=0}; return rett}
function prq_edzeim(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
	              if (wd in pq2_ne_vz_na_ed_ze_im||wd in pq2_ne_vz_pa_ed_ze_im||wd in pq2_ne_na_ed_ze_im||wd in pq2_ne_pa_ed_ze_im||
                          wd in pq2_pe_na_ed_ze_im||wd in pq2_pe_pa_ed_ze_im||wd in pq2_pe_sd_na_ed_ze_im||wd in pq2_pe_sd_pa_ed_ze_im||
                          wd in pq2_pn_na_ed_ze_im||wd in pq2_pn_pa_ed_ze_im||wd in pqn_ne_vz_na_ed_ze_im||wd in pqn_ne_vz_pa_ed_ze_im||
                          wd in pqn_ne_na_ed_ze_im||wd in pqn_ne_pa_ed_ze_im||wd in pqn_pe_na_ed_ze_im||wd in pqn_pe_pa_ed_ze_im||
                          wd in pqn_pe_sd_na_ed_ze_im||wd in pqn_pe_sd_pa_ed_ze_im||wd in pqn_pn_na_ed_ze_im||wd in pqn_pn_pa_ed_ze_im||
                          wd in pqs_ne_vz_pa_ed_ze_im||wd in pqs_ne_pa_ed_ze_im||wd in pqs_pe_pa_ed_ze_im||wd in pqs_pe_sd_pa_ed_ze_im||
                          wd in pqs_pn_pa_ed_ze_im)                                                                                            {rett=1} else {rett=0}; return rett}
function prq_edmuvi(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_mu_im||wd in pq2_ne_vz_pa_ed_mu_im||wd in pq2_ne_na_ed_mu_im||wd in pq2_ne_pa_ed_mu_im||
                          wd in pq2_pe_na_ed_mu_im||wd in pq2_pe_pa_ed_mu_im||wd in pq2_pe_sd_na_ed_mu_im||wd in pq2_pe_sd_pa_ed_mu_im||
                          wd in pq2_pn_na_ed_mu_im||wd in pq2_pn_pa_ed_mu_im||wd in pqn_ne_vz_na_ed_mu_im||wd in pqn_ne_vz_pa_ed_mu_im||
                          wd in pqn_ne_na_ed_mu_im||wd in pqn_ne_pa_ed_mu_im||wd in pqn_pe_na_ed_mu_im||wd in pqn_pe_pa_ed_mu_im||
                          wd in pqn_pe_sd_na_ed_mu_im||wd in pqn_pe_sd_pa_ed_mu_im||wd in pqn_pn_na_ed_mu_im||wd in pqn_pn_pa_ed_mu_im||
                          wd in pqs_ne_vz_pa_ed_mu_im||wd in pqs_ne_pa_ed_mu_im||wd in pqs_pe_pa_ed_mu_im||wd in pqs_pe_sd_pa_ed_mu_im||
                          wd in pqs_pn_pa_ed_mu_im||wd in pq2_ne_vz_na_ed_mu_ro||wd in pq2_ne_vz_pa_ed_mu_ro||wd in pq2_ne_na_ed_mu_ro||
                          wd in pq2_ne_pa_ed_mu_ro||wd in pq2_pe_na_ed_mu_ro||wd in pq2_pe_pa_ed_mu_ro||wd in pq2_pe_sd_na_ed_mu_ro||
                          wd in pq2_pe_sd_pa_ed_mu_ro||wd in pq2_pn_na_ed_mu_ro||wd in pq2_pn_pa_ed_mu_ro||wd in pqn_ne_vz_na_ed_mu_ro||
                          wd in pqn_ne_vz_pa_ed_mu_ro||wd in pqn_ne_na_ed_mu_ro||wd in pqn_ne_pa_ed_mu_ro||wd in pqn_pe_na_ed_mu_ro||
                          wd in pqn_pe_pa_ed_mu_ro||wd in pqn_pe_sd_na_ed_mu_ro||wd in pqn_pe_sd_pa_ed_mu_ro||wd in pqn_pn_na_ed_mu_ro||
                          wd in pqn_pn_pa_ed_mu_ro||wd in pqs_ne_vz_pa_ed_mu_ro||wd in pqs_ne_pa_ed_mu_ro||wd in pqs_pe_pa_ed_mu_ro||
                          wd in pqs_pe_sd_pa_ed_mu_ro||wd in pqs_pn_pa_ed_mu_ro)                                                               {rett=1} else {rett=0}; return rett}
function prq_edsrvi(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_sr_im||wd in pq2_ne_vz_pa_ed_sr_im||wd in pq2_ne_na_ed_sr_im||wd in pq2_ne_pa_ed_sr_im||
                          wd in pq2_pe_na_ed_sr_im||wd in pq2_pe_pa_ed_sr_im||wd in pq2_pe_sd_na_ed_sr_im||wd in pq2_pe_sd_pa_ed_sr_im||
                          wd in pq2_pn_na_ed_sr_im||wd in pq2_pn_pa_ed_sr_im||wd in pqn_ne_vz_na_ed_sr_im||wd in pqn_ne_vz_pa_ed_sr_im||
                          wd in pqn_ne_na_ed_sr_im||wd in pqn_ne_pa_ed_sr_im||wd in pqn_pe_na_ed_sr_im||wd in pqn_pe_pa_ed_sr_im||
                          wd in pqn_pe_sd_na_ed_sr_im||wd in pqn_pe_sd_pa_ed_sr_im||wd in pqn_pn_na_ed_sr_im||wd in pqn_pn_pa_ed_sr_im||
                          wd in pqs_ne_vz_pa_ed_sr_im||wd in pqs_ne_pa_ed_sr_im||wd in pqs_pe_pa_ed_sr_im||wd in pqs_pe_sd_pa_ed_sr_im||
                          wd in pqs_pn_pa_ed_sr_im)                                                                                            {rett=1} else {rett=0}; return rett}
function prq_edzevi(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
	              if (wd in pq2_ne_vz_na_ed_ze_vi||wd in pq2_ne_vz_pa_ed_ze_vi||wd in pq2_ne_na_ed_ze_vi||wd in pq2_ne_pa_ed_ze_vi||
                          wd in pq2_pe_na_ed_ze_vi||wd in pq2_pe_pa_ed_ze_vi||wd in pq2_pe_sd_na_ed_ze_vi||wd in pq2_pe_sd_pa_ed_ze_vi||
                          wd in pq2_pn_na_ed_ze_vi||wd in pq2_pn_pa_ed_ze_vi||wd in pqn_ne_vz_na_ed_ze_vi||wd in pqn_ne_vz_pa_ed_ze_vi||
                          wd in pqn_ne_na_ed_ze_vi||wd in pqn_ne_pa_ed_ze_vi||wd in pqn_pe_na_ed_ze_vi||wd in pqn_pe_pa_ed_ze_vi||
                          wd in pqn_pe_sd_na_ed_ze_vi||wd in pqn_pe_sd_pa_ed_ze_vi||wd in pqn_pn_na_ed_ze_vi||wd in pqn_pn_pa_ed_ze_vi||
                          wd in pqs_ne_vz_pa_ed_ze_vi||wd in pqs_ne_pa_ed_ze_vi||wd in pqs_pe_pa_ed_ze_vi||wd in pqs_pe_sd_pa_ed_ze_vi||
                          wd in pqs_pn_pa_ed_ze_vi)                                                                                            {rett=1} else {rett=0}; return rett}
function prq_edmuro(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_mu_ro||wd in pq2_ne_vz_pa_ed_mu_ro||wd in pq2_ne_na_ed_mu_ro||wd in pq2_ne_pa_ed_mu_ro||
                          wd in pq2_pe_na_ed_mu_ro||wd in pq2_pe_pa_ed_mu_ro||wd in pq2_pe_sd_na_ed_mu_ro||wd in pq2_pe_sd_pa_ed_mu_ro||
                          wd in pq2_pn_na_ed_mu_ro||wd in pq2_pn_pa_ed_mu_ro||wd in pqn_ne_vz_na_ed_mu_ro||wd in pqn_ne_vz_pa_ed_mu_ro||
                          wd in pqn_ne_na_ed_mu_ro||wd in pqn_ne_pa_ed_mu_ro||wd in pqn_pe_na_ed_mu_ro||wd in pqn_pe_pa_ed_mu_ro||
                          wd in pqn_pe_sd_na_ed_mu_ro||wd in pqn_pe_sd_pa_ed_mu_ro||wd in pqn_pn_na_ed_mu_ro||wd in pqn_pn_pa_ed_mu_ro||
                          wd in pqs_ne_vz_pa_ed_mu_ro||wd in pqs_ne_pa_ed_mu_ro||wd in pqs_pe_pa_ed_mu_ro||wd in pqs_pe_sd_pa_ed_mu_ro||
                          wd in pqs_pn_pa_ed_mu_ro)                                                                                            {rett=1} else {rett=0}; return rett}
function prq_sdedmuro(n,                                                                                                                       wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_pe_sd_na_ed_mu_ro||wd in pq2_pe_sd_pa_ed_mu_ro||wd in pqn_pe_sd_na_ed_mu_ro||
			  wd in pqn_pe_sd_pa_ed_mu_ro||wd in pqs_pe_sd_pa_ed_mu_ro)                                                            {rett=1} else {rett=0}; return rett}
function prq_edsrro(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_sr_ro||wd in pq2_ne_vz_pa_ed_sr_ro||wd in pq2_ne_na_ed_sr_ro||wd in pq2_ne_pa_ed_sr_ro||
                          wd in pq2_pe_na_ed_sr_ro||wd in pq2_pe_pa_ed_sr_ro||wd in pq2_pe_sd_na_ed_sr_ro||wd in pq2_pe_sd_pa_ed_sr_ro||
                          wd in pq2_pn_na_ed_sr_ro||wd in pq2_pn_pa_ed_sr_ro||wd in pqn_ne_vz_na_ed_sr_ro||wd in pqn_ne_vz_pa_ed_sr_ro||
                          wd in pqn_ne_na_ed_sr_ro||wd in pqn_ne_pa_ed_sr_ro||wd in pqn_pe_na_ed_sr_ro||wd in pqn_pe_pa_ed_sr_ro||
                          wd in pqn_pe_sd_na_ed_sr_ro||wd in pqn_pe_sd_pa_ed_sr_ro||wd in pqn_pn_na_ed_sr_ro||wd in pqn_pn_pa_ed_sr_ro||
                          wd in pqs_ne_vz_pa_ed_sr_ro||wd in pqs_ne_pa_ed_sr_ro||wd in pqs_pe_pa_ed_sr_ro||wd in pqs_pe_sd_pa_ed_sr_ro||
                          wd in pqs_pn_pa_ed_sr_ro)                                                                                            {rett=1} else {rett=0}; return rett}
function prq_sdedsrro(n,                                                                                                                       wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_pe_sd_na_ed_sr_ro||wd in pq2_pe_sd_pa_ed_sr_ro||wd in pqn_pe_sd_na_ed_sr_ro||
			  wd in pqn_pe_sd_pa_ed_sr_ro||wd in pqs_pe_sd_pa_ed_sr_ro)                                                            {rett=1} else {rett=0}; return rett}
function prq_edzero(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
	              if (wd in pq2_ne_vz_na_ed_ze_dr||wd in pq2_ne_vz_pa_ed_ze_dr||wd in pq2_ne_na_ed_ze_dr||wd in pq2_ne_pa_ed_ze_dr||
                          wd in pq2_pe_na_ed_ze_dr||wd in pq2_pe_pa_ed_ze_dr||wd in pq2_pe_sd_na_ed_ze_dr||wd in pq2_pe_sd_pa_ed_ze_dr||
                          wd in pq2_pn_na_ed_ze_dr||wd in pq2_pn_pa_ed_ze_dr||wd in pqn_ne_vz_na_ed_ze_dr||wd in pqn_ne_vz_pa_ed_ze_dr||
                          wd in pqn_ne_na_ed_ze_dr||wd in pqn_ne_pa_ed_ze_dr||wd in pqn_pe_na_ed_ze_dr||wd in pqn_pe_pa_ed_ze_dr||
                          wd in pqn_pe_sd_na_ed_ze_dr||wd in pqn_pe_sd_pa_ed_ze_dr||wd in pqn_pn_na_ed_ze_dr||wd in pqn_pn_pa_ed_ze_dr||
                          wd in pqs_ne_vz_pa_ed_ze_dr||wd in pqs_ne_pa_ed_ze_dr||wd in pqs_pe_pa_ed_ze_dr||wd in pqs_pe_sd_pa_ed_ze_dr||
                          wd in pqs_pn_pa_ed_ze_dr)                                                                                            {rett=1} else {rett=0}; return rett}
function prq_edmuda(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
                     if (wd in pq2_ne_vz_na_ed_mu_da||wd in pq2_ne_vz_pa_ed_mu_da||wd in pq2_ne_na_ed_mu_da||wd in pq2_ne_pa_ed_mu_da||
                         wd in pq2_pe_na_ed_mu_da||wd in pq2_pe_pa_ed_mu_da||wd in pq2_pe_sd_na_ed_mu_da||wd in pq2_pe_sd_pa_ed_mu_da||
                         wd in pq2_pn_na_ed_mu_da||wd in pq2_pn_pa_ed_mu_da||wd in pqn_ne_vz_na_ed_mu_da||wd in pqn_ne_vz_pa_ed_mu_da||
                         wd in pqn_ne_na_ed_mu_da||wd in pqn_ne_pa_ed_mu_da||wd in pqn_pe_na_ed_mu_da||wd in pqn_pe_pa_ed_mu_da||
                         wd in pqn_pe_sd_na_ed_mu_da||wd in pqn_pe_sd_pa_ed_mu_da||wd in pqn_pn_na_ed_mu_da||wd in pqn_pn_pa_ed_mu_da||
                         wd in pqs_ne_vz_pa_ed_mu_da||wd in pqs_ne_pa_ed_mu_da||wd in pqs_pe_pa_ed_mu_da||wd in pqs_pe_sd_pa_ed_mu_da||
                         wd in pqs_pn_pa_ed_mu_da)                                                                                             {rett=1} else {rett=0}; return rett}
function prq_edsrda(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
                     if (wd in pq2_ne_vz_na_ed_sr_da||wd in pq2_ne_vz_pa_ed_sr_da||wd in pq2_ne_na_ed_sr_da||wd in pq2_ne_pa_ed_sr_da||
                         wd in pq2_pe_na_ed_sr_da||wd in pq2_pe_pa_ed_sr_da||wd in pq2_pe_sd_na_ed_sr_da||wd in pq2_pe_sd_pa_ed_sr_da||
                         wd in pq2_pn_na_ed_sr_da||wd in pq2_pn_pa_ed_sr_da||wd in pqn_ne_vz_na_ed_sr_da||wd in pqn_ne_vz_pa_ed_sr_da||
                         wd in pqn_ne_na_ed_sr_da||wd in pqn_ne_pa_ed_sr_da||wd in pqn_pe_na_ed_sr_da||wd in pqn_pe_pa_ed_sr_da||
                         wd in pqn_pe_sd_na_ed_sr_da||wd in pqn_pe_sd_pa_ed_sr_da||wd in pqn_pn_na_ed_sr_da||wd in pqn_pn_pa_ed_sr_da||
                         wd in pqs_ne_vz_pa_ed_sr_da||wd in pqs_ne_pa_ed_sr_da||wd in pqs_pe_pa_ed_sr_da||wd in pqs_pe_sd_pa_ed_sr_da||
                         wd in pqs_pn_pa_ed_sr_da)                                                                                             {rett=1} else {rett=0}; return rett}
function prq_edzeda(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_ze_dr||wd in pq2_ne_vz_pa_ed_ze_dr||wd in pq2_ne_na_ed_ze_dr||wd in pq2_ne_pa_ed_ze_dr||
                          wd in pq2_pe_na_ed_ze_dr||wd in pq2_pe_pa_ed_ze_dr||wd in pq2_pe_sd_na_ed_ze_dr||wd in pq2_pe_sd_pa_ed_ze_dr||
                          wd in pq2_pn_na_ed_ze_dr||wd in pq2_pn_pa_ed_ze_dr||wd in pqn_ne_vz_na_ed_ze_dr||wd in pqn_ne_vz_pa_ed_ze_dr||
                          wd in pqn_ne_na_ed_ze_dr||wd in pqn_ne_pa_ed_ze_dr||wd in pqn_pe_na_ed_ze_dr||wd in pqn_pe_pa_ed_ze_dr||
                          wd in pqn_pe_sd_na_ed_ze_dr||wd in pqn_pe_sd_pa_ed_ze_dr||wd in pqn_pn_na_ed_ze_dr||wd in pqn_pn_pa_ed_ze_dr||
                          wd in pqs_ne_vz_pa_ed_ze_dr||wd in pqs_ne_pa_ed_ze_dr||wd in pqs_pe_pa_ed_ze_dr||wd in pqs_pe_sd_pa_ed_ze_dr||
                          wd in pqs_pn_pa_ed_ze_dr)                                                                                            {rett=1} else {rett=0}; return rett}
function prq_edmutv(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_mu_tv||wd in pq2_ne_vz_pa_ed_mu_tv||wd in pq2_ne_na_ed_mu_tv||wd in pq2_ne_pa_ed_mu_tv||
                          wd in pq2_pe_na_ed_mu_tv||wd in pq2_pe_pa_ed_mu_tv||wd in pq2_pe_sd_na_ed_mu_tv||wd in pq2_pe_sd_pa_ed_mu_tv||
                          wd in pq2_pn_na_ed_mu_tv||wd in pq2_pn_pa_ed_mu_tv||wd in pqn_ne_vz_na_ed_mu_tv||wd in pqn_ne_vz_pa_ed_mu_tv||
                          wd in pqn_ne_na_ed_mu_tv||wd in pqn_ne_pa_ed_mu_tv||wd in pqn_pe_na_ed_mu_tv||wd in pqn_pe_pa_ed_mu_tv||
                          wd in pqn_pe_sd_na_ed_mu_tv||wd in pqn_pe_sd_pa_ed_mu_tv||wd in pqn_pn_na_ed_mu_tv||wd in pqn_pn_pa_ed_mu_tv||
                          wd in pqs_ne_vz_pa_ed_mu_tv||wd in pqs_ne_pa_ed_mu_tv||wd in pqs_pe_pa_ed_mu_tv||wd in pqs_pe_sd_pa_ed_mu_tv||
                          wd in pqs_pn_pa_ed_mu_tv)                                                                                            {rett=1} else {rett=0}; return rett}
function prq_edsrtv(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_sr_tv||wd in pq2_ne_vz_pa_ed_sr_tv||wd in pq2_ne_na_ed_sr_tv||wd in pq2_ne_pa_ed_sr_tv||
                          wd in pq2_pe_na_ed_sr_tv||wd in pq2_pe_pa_ed_sr_tv||wd in pq2_pe_sd_na_ed_sr_tv||wd in pq2_pe_sd_pa_ed_sr_tv||
                          wd in pq2_pn_na_ed_sr_tv||wd in pq2_pn_pa_ed_sr_tv||wd in pqn_ne_vz_na_ed_sr_tv||wd in pqn_ne_vz_pa_ed_sr_tv||
                          wd in pqn_ne_na_ed_sr_tv||wd in pqn_ne_pa_ed_sr_tv||wd in pqn_pe_na_ed_sr_tv||wd in pqn_pe_pa_ed_sr_tv||
                          wd in pqn_pe_sd_na_ed_sr_tv||wd in pqn_pe_sd_pa_ed_sr_tv||wd in pqn_pn_na_ed_sr_tv||wd in pqn_pn_pa_ed_sr_tv||
                          wd in pqs_ne_vz_pa_ed_sr_tv||wd in pqs_ne_pa_ed_sr_tv||wd in pqs_pe_pa_ed_sr_tv||wd in pqs_pe_sd_pa_ed_sr_tv||
                          wd in pqs_pn_pa_ed_sr_tv)                                                                                            {rett=1} else {rett=0}; return rett}
function prq_edzetv(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_ze_tv||wd in pq2_ne_vz_pa_ed_ze_tv||wd in pq2_ne_na_ed_ze_tv||wd in pq2_ne_pa_ed_ze_tv||
                          wd in pq2_pe_na_ed_ze_tv||wd in pq2_pe_pa_ed_ze_tv||wd in pq2_pe_sd_na_ed_ze_tv||wd in pq2_pe_sd_pa_ed_ze_tv||
                          wd in pq2_pn_na_ed_ze_tv||wd in pq2_pn_pa_ed_ze_tv||wd in pqn_ne_vz_na_ed_ze_tv||wd in pqn_ne_vz_pa_ed_ze_tv||
                          wd in pqn_ne_na_ed_ze_tv||wd in pqn_ne_pa_ed_ze_tv||wd in pqn_pe_na_ed_ze_tv||wd in pqn_pe_pa_ed_ze_tv||
                          wd in pqn_pe_sd_na_ed_ze_tv||wd in pqn_pe_sd_pa_ed_ze_tv||wd in pqn_pn_na_ed_ze_tv||wd in pqn_pn_pa_ed_ze_tv||
                          wd in pqs_ne_vz_pa_ed_ze_tv||wd in pqs_ne_pa_ed_ze_tv||wd in pqs_pe_pa_ed_ze_tv||wd in pqs_pe_sd_pa_ed_ze_tv||
                          wd in pqs_pn_pa_ed_ze_tv||wd in pq2_ne_vz_na_ed_ze_dr||wd in pq2_ne_vz_pa_ed_ze_dr||wd in pq2_ne_na_ed_ze_dr||
                          wd in pq2_ne_pa_ed_ze_dr||wd in pq2_pe_na_ed_ze_dr||wd in pq2_pe_pa_ed_ze_dr||wd in pq2_pe_sd_na_ed_ze_dr||
                          wd in pq2_pe_sd_pa_ed_ze_dr||wd in pq2_pn_na_ed_ze_dr||wd in pq2_pn_pa_ed_ze_dr||wd in pqn_ne_vz_na_ed_ze_dr||
                          wd in pqn_ne_vz_pa_ed_ze_dr||wd in pqn_ne_na_ed_ze_dr||wd in pqn_ne_pa_ed_ze_dr||wd in pqn_pe_na_ed_ze_dr||
                          wd in pqn_pe_pa_ed_ze_dr||wd in pqn_pe_sd_na_ed_ze_dr||wd in pqn_pe_sd_pa_ed_ze_dr||wd in pqn_pn_na_ed_ze_dr||
                          wd in pqn_pn_pa_ed_ze_dr||wd in pqs_ne_vz_pa_ed_ze_dr||wd in pqs_ne_pa_ed_ze_dr||wd in pqs_pe_pa_ed_ze_dr||
                          wd in pqs_pe_sd_pa_ed_ze_dr||wd in pqs_pn_pa_ed_ze_dr)                                                               {rett=1} else {rett=0}; return rett}
function prq_edmupr(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_mu_pr||wd in pq2_ne_vz_pa_ed_mu_pr||wd in pq2_ne_na_ed_mu_pr||wd in pq2_ne_pa_ed_mu_pr||
                          wd in pq2_pe_na_ed_mu_pr||wd in pq2_pe_pa_ed_mu_pr||wd in pq2_pe_sd_na_ed_mu_pr||wd in pq2_pe_sd_pa_ed_mu_pr||
                          wd in pq2_pn_na_ed_mu_pr||wd in pq2_pn_pa_ed_mu_pr||wd in pqn_ne_vz_na_ed_mu_pr||wd in pqn_ne_vz_pa_ed_mu_pr||
                          wd in pqn_ne_na_ed_mu_pr||wd in pqn_ne_pa_ed_mu_pr||wd in pqn_pe_na_ed_mu_pr||wd in pqn_pe_pa_ed_mu_pr||
                          wd in pqn_pe_sd_na_ed_mu_pr||wd in pqn_pe_sd_pa_ed_mu_pr||wd in pqn_pn_na_ed_mu_pr||wd in pqn_pn_pa_ed_mu_pr||
                          wd in pqs_ne_vz_pa_ed_mu_pr||wd in pqs_ne_pa_ed_mu_pr||wd in pqs_pe_pa_ed_mu_pr||wd in pqs_pe_sd_pa_ed_mu_pr||
                          wd in pqs_pn_pa_ed_mu_pr)                                                                                            {rett=1} else {rett=0}; return rett}
function prq_edsrpr(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_sr_pr||wd in pq2_ne_vz_pa_ed_sr_pr||wd in pq2_ne_na_ed_sr_pr||wd in pq2_ne_pa_ed_sr_pr||
                          wd in pq2_pe_na_ed_sr_pr||wd in pq2_pe_pa_ed_sr_pr||wd in pq2_pe_sd_na_ed_sr_pr||wd in pq2_pe_sd_pa_ed_sr_pr||
                          wd in pq2_pn_na_ed_sr_pr||wd in pq2_pn_pa_ed_sr_pr||wd in pqn_ne_vz_na_ed_sr_pr||wd in pqn_ne_vz_pa_ed_sr_pr||
                          wd in pqn_ne_na_ed_sr_pr||wd in pqn_ne_pa_ed_sr_pr||wd in pqn_pe_na_ed_sr_pr||wd in pqn_pe_pa_ed_sr_pr||
                          wd in pqn_pe_sd_na_ed_sr_pr||wd in pqn_pe_sd_pa_ed_sr_pr||wd in pqn_pn_na_ed_sr_pr||wd in pqn_pn_pa_ed_sr_pr||
                          wd in pqs_ne_vz_pa_ed_sr_pr||wd in pqs_ne_pa_ed_sr_pr||wd in pqs_pe_pa_ed_sr_pr||wd in pqs_pe_sd_pa_ed_sr_pr||
                          wd in pqs_pn_pa_ed_sr_pr)                                                                                            {rett=1} else {rett=0}; return rett}
function prq_edzepr(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_ze_dr||wd in pq2_ne_vz_pa_ed_ze_dr||wd in pq2_ne_na_ed_ze_dr||wd in pq2_ne_pa_ed_ze_dr||
                          wd in pq2_pe_na_ed_ze_dr||wd in pq2_pe_pa_ed_ze_dr||wd in pq2_pe_sd_na_ed_ze_dr||wd in pq2_pe_sd_pa_ed_ze_dr||
                          wd in pq2_pn_na_ed_ze_dr||wd in pq2_pn_pa_ed_ze_dr||wd in pqn_ne_vz_na_ed_ze_dr||wd in pqn_ne_vz_pa_ed_ze_dr||
                          wd in pqn_ne_na_ed_ze_dr||wd in pqn_ne_pa_ed_ze_dr||wd in pqn_pe_na_ed_ze_dr||wd in pqn_pe_pa_ed_ze_dr||
                          wd in pqn_pe_sd_na_ed_ze_dr||wd in pqn_pe_sd_pa_ed_ze_dr||wd in pqn_pn_na_ed_ze_dr||wd in pqn_pn_pa_ed_ze_dr||
                          wd in pqs_ne_vz_pa_ed_ze_dr||wd in pqs_ne_pa_ed_ze_dr||wd in pqs_pe_pa_ed_ze_dr||wd in pqs_pe_sd_pa_ed_ze_dr||
                          wd in pqs_pn_pa_ed_ze_dr)                                                                                            {rett=1} else {rett=0}; return rett}
function prq_edim(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n); 
                      if (wd in pq2_ne_vz_na_ed_mu_im||wd in pq2_ne_vz_pa_ed_mu_im||wd in pq2_ne_na_ed_mu_im||wd in pq2_ne_pa_ed_mu_im||
                          wd in pq2_pe_na_ed_mu_im||wd in pq2_pe_pa_ed_mu_im||wd in pq2_pe_sd_na_ed_mu_im||wd in pq2_pe_sd_pa_ed_mu_im||
                          wd in pq2_pn_na_ed_mu_im||wd in pq2_pn_pa_ed_mu_im||wd in pqn_ne_vz_na_ed_mu_im||wd in pqn_ne_vz_pa_ed_mu_im||
                          wd in pqn_ne_na_ed_mu_im||wd in pqn_ne_pa_ed_mu_im||wd in pqn_pe_na_ed_mu_im||wd in pqn_pe_pa_ed_mu_im||
                          wd in pqn_pe_sd_na_ed_mu_im||wd in pqn_pe_sd_pa_ed_mu_im||wd in pqn_pn_na_ed_mu_im||wd in pqn_pn_pa_ed_mu_im||
                          wd in pqs_ne_vz_pa_ed_mu_im||wd in pqs_ne_pa_ed_mu_im||wd in pqs_pe_pa_ed_mu_im||wd in pqs_pe_sd_pa_ed_mu_im||
                          wd in pqs_pn_pa_ed_mu_im||wd in pq2_ne_vz_na_ed_sr_im||wd in pq2_ne_vz_pa_ed_sr_im||wd in pq2_ne_na_ed_sr_im||
                          wd in pq2_ne_pa_ed_sr_im||wd in pq2_pe_na_ed_sr_im||wd in pq2_pe_pa_ed_sr_im||wd in pq2_pe_sd_na_ed_sr_im||
                          wd in pq2_pe_sd_pa_ed_sr_im||wd in pq2_pn_na_ed_sr_im||wd in pq2_pn_pa_ed_sr_im||wd in pqn_ne_vz_na_ed_sr_im||
                          wd in pqn_ne_vz_pa_ed_sr_im||wd in pqn_ne_na_ed_sr_im||wd in pqn_ne_pa_ed_sr_im||wd in pqn_pe_na_ed_sr_im||
                          wd in pqn_pe_pa_ed_sr_im||wd in pqn_pe_sd_na_ed_sr_im||wd in pqn_pe_sd_pa_ed_sr_im||wd in pqn_pn_na_ed_sr_im||
                          wd in pqn_pn_pa_ed_sr_im||wd in pqs_ne_vz_pa_ed_sr_im||wd in pqs_ne_pa_ed_sr_im||wd in pqs_pe_pa_ed_sr_im||
                          wd in pqs_pe_sd_pa_ed_sr_im||wd in pqs_pn_pa_ed_sr_im||wd in pq2_ne_vz_na_ed_ze_im||wd in pq2_ne_vz_pa_ed_ze_im||
                          wd in pq2_ne_na_ed_ze_im||wd in pq2_ne_pa_ed_ze_im||wd in pq2_pe_na_ed_ze_im||wd in pq2_pe_pa_ed_ze_im||
                          wd in pq2_pe_sd_na_ed_ze_im||wd in pq2_pe_sd_pa_ed_ze_im||wd in pq2_pn_na_ed_ze_im||wd in pq2_pn_pa_ed_ze_im||
                          wd in pqn_ne_vz_na_ed_ze_im||wd in pqn_ne_vz_pa_ed_ze_im||wd in pqn_ne_na_ed_ze_im||wd in pqn_ne_pa_ed_ze_im||
                          wd in pqn_pe_na_ed_ze_im||wd in pqn_pe_pa_ed_ze_im||wd in pqn_pe_sd_na_ed_ze_im||wd in pqn_pe_sd_pa_ed_ze_im||
                          wd in pqn_pn_na_ed_ze_im||wd in pqn_pn_pa_ed_ze_im||wd in pqs_ne_vz_pa_ed_ze_im||wd in pqs_ne_pa_ed_ze_im||
                          wd in pqs_pe_pa_ed_ze_im||wd in pqs_pe_sd_pa_ed_ze_im||wd in pqs_pn_pa_ed_ze_im)                                     {rett=1} else {rett=0}; return rett}
function prq_edvi(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_mu_im||wd in pq2_ne_vz_pa_ed_mu_im||wd in pq2_ne_na_ed_mu_im||wd in pq2_ne_pa_ed_mu_im||
                          wd in pq2_pe_na_ed_mu_im||wd in pq2_pe_pa_ed_mu_im||wd in pq2_pe_sd_na_ed_mu_im||wd in pq2_pe_sd_pa_ed_mu_im||
                          wd in pq2_pn_na_ed_mu_im||wd in pq2_pn_pa_ed_mu_im||wd in pqn_ne_vz_na_ed_mu_im||wd in pqn_ne_vz_pa_ed_mu_im||
                          wd in pqn_ne_na_ed_mu_im||wd in pqn_ne_pa_ed_mu_im||wd in pqn_pe_na_ed_mu_im||wd in pqn_pe_pa_ed_mu_im||
                          wd in pqn_pe_sd_na_ed_mu_im||wd in pqn_pe_sd_pa_ed_mu_im||wd in pqn_pn_na_ed_mu_im||wd in pqn_pn_pa_ed_mu_im||
                          wd in pqs_ne_vz_pa_ed_mu_im||wd in pqs_ne_pa_ed_mu_im||wd in pqs_pe_pa_ed_mu_im||wd in pqs_pe_sd_pa_ed_mu_im||
                          wd in pqs_pn_pa_ed_mu_im||wd in pq2_ne_vz_na_ed_mu_ro||wd in pq2_ne_vz_pa_ed_mu_ro||wd in pq2_ne_na_ed_mu_ro||
                          wd in pq2_ne_pa_ed_mu_ro||wd in pq2_pe_na_ed_mu_ro||wd in pq2_pe_pa_ed_mu_ro||wd in pq2_pe_sd_na_ed_mu_ro||
                          wd in pq2_pe_sd_pa_ed_mu_ro||wd in pq2_pn_na_ed_mu_ro||wd in pq2_pn_pa_ed_mu_ro||wd in pqn_ne_vz_na_ed_mu_ro||
                          wd in pqn_ne_vz_pa_ed_mu_ro||wd in pqn_ne_na_ed_mu_ro||wd in pqn_ne_pa_ed_mu_ro||wd in pqn_pe_na_ed_mu_ro||
                          wd in pqn_pe_pa_ed_mu_ro||wd in pqn_pe_sd_na_ed_mu_ro||wd in pqn_pe_sd_pa_ed_mu_ro||wd in pqn_pn_na_ed_mu_ro||
                          wd in pqn_pn_pa_ed_mu_ro||wd in pqs_ne_vz_pa_ed_mu_ro||wd in pqs_ne_pa_ed_mu_ro||wd in pqs_pe_pa_ed_mu_ro||
                          wd in pqs_pe_sd_pa_ed_mu_ro||wd in pqs_pn_pa_ed_mu_ro||wd in pq2_ne_vz_na_ed_sr_im||wd in pq2_ne_vz_pa_ed_sr_im||
                          wd in pq2_ne_na_ed_sr_im||wd in pq2_ne_pa_ed_sr_im||wd in pq2_pe_na_ed_sr_im||wd in pq2_pe_pa_ed_sr_im||
                          wd in pq2_pe_sd_na_ed_sr_im||wd in pq2_pe_sd_pa_ed_sr_im||wd in pq2_pn_na_ed_sr_im||wd in pq2_pn_pa_ed_sr_im||
                          wd in pqn_ne_vz_na_ed_sr_im||wd in pqn_ne_vz_pa_ed_sr_im||wd in pqn_ne_na_ed_sr_im||wd in pqn_ne_pa_ed_sr_im||
                          wd in pqn_pe_na_ed_sr_im||wd in pqn_pe_pa_ed_sr_im||wd in pqn_pe_sd_na_ed_sr_im||wd in pqn_pe_sd_pa_ed_sr_im||
                          wd in pqn_pn_na_ed_sr_im||wd in pqn_pn_pa_ed_sr_im||wd in pqs_ne_vz_pa_ed_sr_im||wd in pqs_ne_pa_ed_sr_im||
                          wd in pqs_pe_pa_ed_sr_im||wd in pqs_pe_sd_pa_ed_sr_im||wd in pqs_pn_pa_ed_sr_im||wd in pq2_ne_vz_na_ed_ze_vi||
                          wd in pq2_ne_vz_pa_ed_ze_vi||wd in pq2_ne_na_ed_ze_vi||wd in pq2_ne_pa_ed_ze_vi||wd in pq2_pe_na_ed_ze_vi||
                          wd in pq2_pe_pa_ed_ze_vi||wd in pq2_pe_sd_na_ed_ze_vi||wd in pq2_pe_sd_pa_ed_ze_vi||wd in pq2_pn_na_ed_ze_vi||
                          wd in pq2_pn_pa_ed_ze_vi||wd in pqn_ne_vz_na_ed_ze_vi||wd in pqn_ne_vz_pa_ed_ze_vi||wd in pqn_ne_na_ed_ze_vi||
                          wd in pqn_ne_pa_ed_ze_vi||wd in pqn_pe_na_ed_ze_vi||wd in pqn_pe_pa_ed_ze_vi||wd in pqn_pe_sd_na_ed_ze_vi||
                          wd in pqn_pe_sd_pa_ed_ze_vi||wd in pqn_pn_na_ed_ze_vi||wd in pqn_pn_pa_ed_ze_vi||wd in pqs_ne_vz_pa_ed_ze_vi||
                          wd in pqs_ne_pa_ed_ze_vi||wd in pqs_pe_pa_ed_ze_vi||wd in pqs_pe_sd_pa_ed_ze_vi||wd in pqs_pn_pa_ed_ze_vi)           {rett=1} else {rett=0}; return rett}
function prq_edro(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_mu_ro||wd in pq2_ne_vz_pa_ed_mu_ro||wd in pq2_ne_na_ed_mu_ro||wd in pq2_ne_pa_ed_mu_ro||
                          wd in pq2_pe_na_ed_mu_ro||wd in pq2_pe_pa_ed_mu_ro||wd in pq2_pe_sd_na_ed_mu_ro||wd in pq2_pe_sd_pa_ed_mu_ro||
                          wd in pq2_pn_na_ed_mu_ro||wd in pq2_pn_pa_ed_mu_ro||wd in pqn_ne_vz_na_ed_mu_ro||wd in pqn_ne_vz_pa_ed_mu_ro||
                          wd in pqn_ne_na_ed_mu_ro||wd in pqn_ne_pa_ed_mu_ro||wd in pqn_pe_na_ed_mu_ro||wd in pqn_pe_pa_ed_mu_ro||
                          wd in pqn_pe_sd_na_ed_mu_ro||wd in pqn_pe_sd_pa_ed_mu_ro||wd in pqn_pn_na_ed_mu_ro||wd in pqn_pn_pa_ed_mu_ro||
                          wd in pqs_ne_vz_pa_ed_mu_ro||wd in pqs_ne_pa_ed_mu_ro||wd in pqs_pe_pa_ed_mu_ro||wd in pqs_pe_sd_pa_ed_mu_ro||
                          wd in pqs_pn_pa_ed_mu_ro||wd in pq2_ne_vz_na_ed_sr_ro||wd in pq2_ne_vz_pa_ed_sr_ro||wd in pq2_ne_na_ed_sr_ro||
                          wd in pq2_ne_pa_ed_sr_ro||wd in pq2_pe_na_ed_sr_ro||wd in pq2_pe_pa_ed_sr_ro||wd in pq2_pe_sd_na_ed_sr_ro||
                          wd in pq2_pe_sd_pa_ed_sr_ro||wd in pq2_pn_na_ed_sr_ro||wd in pq2_pn_pa_ed_sr_ro||wd in pqn_ne_vz_na_ed_sr_ro||
                          wd in pqn_ne_vz_pa_ed_sr_ro||wd in pqn_ne_na_ed_sr_ro||wd in pqn_ne_pa_ed_sr_ro||wd in pqn_pe_na_ed_sr_ro||
                          wd in pqn_pe_pa_ed_sr_ro||wd in pqn_pe_sd_na_ed_sr_ro||wd in pqn_pe_sd_pa_ed_sr_ro||wd in pqn_pn_na_ed_sr_ro||
                          wd in pqn_pn_pa_ed_sr_ro||wd in pqs_ne_vz_pa_ed_sr_ro||wd in pqs_ne_pa_ed_sr_ro||wd in pqs_pe_pa_ed_sr_ro||
                          wd in pqs_pe_sd_pa_ed_sr_ro||wd in pqs_pn_pa_ed_sr_ro||wd in pq2_ne_vz_na_ed_ze_dr||wd in pq2_ne_vz_pa_ed_ze_dr||
                          wd in pq2_ne_na_ed_ze_dr||wd in pq2_ne_pa_ed_ze_dr||wd in pq2_pe_na_ed_ze_dr||wd in pq2_pe_pa_ed_ze_dr||
                          wd in pq2_pe_sd_na_ed_ze_dr||wd in pq2_pe_sd_pa_ed_ze_dr||wd in pq2_pn_na_ed_ze_dr||wd in pq2_pn_pa_ed_ze_dr||
                          wd in pqn_ne_vz_na_ed_ze_dr||wd in pqn_ne_vz_pa_ed_ze_dr||wd in pqn_ne_na_ed_ze_dr||wd in pqn_ne_pa_ed_ze_dr||
                          wd in pqn_pe_na_ed_ze_dr||wd in pqn_pe_pa_ed_ze_dr||wd in pqn_pe_sd_na_ed_ze_dr||wd in pqn_pe_sd_pa_ed_ze_dr||
                          wd in pqn_pn_na_ed_ze_dr||wd in pqn_pn_pa_ed_ze_dr||wd in pqs_ne_vz_pa_ed_ze_dr||wd in pqs_ne_pa_ed_ze_dr||
                          wd in pqs_pe_pa_ed_ze_dr||wd in pqs_pe_sd_pa_ed_ze_dr||wd in pqs_pn_pa_ed_ze_dr)                                     {rett=1} else {rett=0}; return rett}
function prq_sdedro(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_pe_sd_na_ed_mu_ro||wd in pq2_pe_sd_pa_ed_mu_ro||wd in pqn_pe_sd_na_ed_mu_ro||wd in pqn_pe_sd_pa_ed_mu_ro||
                          wd in pqs_pe_sd_pa_ed_mu_ro||wd in pq2_pe_sd_na_ed_sr_ro||wd in pq2_pe_sd_pa_ed_sr_ro||wd in pqn_pe_sd_na_ed_sr_ro||
                          wd in pqn_pe_sd_pa_ed_sr_ro||wd in pqs_pe_sd_pa_ed_sr_ro||wd in pq2_pe_sd_na_ed_ze_dr||wd in pq2_pe_sd_pa_ed_ze_dr||
                          wd in pqn_pe_sd_na_ed_ze_dr||wd in pqn_pe_sd_pa_ed_ze_dr||wd in pqs_pe_sd_pa_ed_ze_dr)                               {rett=1} else {rett=0}; return rett}
function prq_edda(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_mu_da||wd in pq2_ne_vz_pa_ed_mu_da||wd in pq2_ne_na_ed_mu_da||wd in pq2_ne_pa_ed_mu_da||
                          wd in pq2_pe_na_ed_mu_da||wd in pq2_pe_pa_ed_mu_da||wd in pq2_pe_sd_na_ed_mu_da||wd in pq2_pe_sd_pa_ed_mu_da||
                          wd in pq2_pn_na_ed_mu_da||wd in pq2_pn_pa_ed_mu_da||wd in pqn_ne_vz_na_ed_mu_da||wd in pqn_ne_vz_pa_ed_mu_da||
                          wd in pqn_ne_na_ed_mu_da||wd in pqn_ne_pa_ed_mu_da||wd in pqn_pe_na_ed_mu_da||wd in pqn_pe_pa_ed_mu_da||
                          wd in pqn_pe_sd_na_ed_mu_da||wd in pqn_pe_sd_pa_ed_mu_da||wd in pqn_pn_na_ed_mu_da||wd in pqn_pn_pa_ed_mu_da||
                          wd in pqs_ne_vz_pa_ed_mu_da||wd in pqs_ne_pa_ed_mu_da||wd in pqs_pe_pa_ed_mu_da||wd in pqs_pe_sd_pa_ed_mu_da||
                          wd in pqs_pn_pa_ed_mu_da||wd in pq2_ne_vz_na_ed_sr_da||wd in pq2_ne_vz_pa_ed_sr_da||wd in pq2_ne_na_ed_sr_da||
                          wd in pq2_ne_pa_ed_sr_da||wd in pq2_pe_na_ed_sr_da||wd in pq2_pe_pa_ed_sr_da||wd in pq2_pe_sd_na_ed_sr_da||
                          wd in pq2_pe_sd_pa_ed_sr_da||wd in pq2_pn_na_ed_sr_da||wd in pq2_pn_pa_ed_sr_da||wd in pqn_ne_vz_na_ed_sr_da||
                          wd in pqn_ne_vz_pa_ed_sr_da||wd in pqn_ne_na_ed_sr_da||wd in pqn_ne_pa_ed_sr_da||wd in pqn_pe_na_ed_sr_da||
                          wd in pqn_pe_pa_ed_sr_da||wd in pqn_pe_sd_na_ed_sr_da||wd in pqn_pe_sd_pa_ed_sr_da||wd in pqn_pn_na_ed_sr_da||
                          wd in pqn_pn_pa_ed_sr_da||wd in pqs_ne_vz_pa_ed_sr_da||wd in pqs_ne_pa_ed_sr_da||wd in pqs_pe_pa_ed_sr_da||
                          wd in pqs_pe_sd_pa_ed_sr_da||wd in pqs_pn_pa_ed_sr_da||wd in pq2_ne_vz_na_ed_ze_dr||wd in pq2_ne_vz_pa_ed_ze_dr||
                          wd in pq2_ne_na_ed_ze_dr||wd in pq2_ne_pa_ed_ze_dr||wd in pq2_pe_na_ed_ze_dr||wd in pq2_pe_pa_ed_ze_dr||
                          wd in pq2_pe_sd_na_ed_ze_dr||wd in pq2_pe_sd_pa_ed_ze_dr||wd in pq2_pn_na_ed_ze_dr||wd in pq2_pn_pa_ed_ze_dr||
                          wd in pqn_ne_vz_na_ed_ze_dr||wd in pqn_ne_vz_pa_ed_ze_dr||wd in pqn_ne_na_ed_ze_dr||wd in pqn_ne_pa_ed_ze_dr||
                          wd in pqn_pe_na_ed_ze_dr||wd in pqn_pe_pa_ed_ze_dr||wd in pqn_pe_sd_na_ed_ze_dr||wd in pqn_pe_sd_pa_ed_ze_dr||
                          wd in pqn_pn_na_ed_ze_dr||wd in pqn_pn_pa_ed_ze_dr||wd in pqs_ne_vz_pa_ed_ze_dr||wd in pqs_ne_pa_ed_ze_dr||
                          wd in pqs_pe_pa_ed_ze_dr||wd in pqs_pe_sd_pa_ed_ze_dr||wd in pqs_pn_pa_ed_ze_dr)                                     {rett=1} else {rett=0}; return rett}
function prq_edtv(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_mu_tv||wd in pq2_ne_vz_pa_ed_mu_tv||wd in pq2_ne_na_ed_mu_tv||wd in pq2_ne_pa_ed_mu_tv||
                          wd in pq2_pe_na_ed_mu_tv||wd in pq2_pe_pa_ed_mu_tv||wd in pq2_pe_sd_na_ed_mu_tv||wd in pq2_pe_sd_pa_ed_mu_tv||
                          wd in pq2_pn_na_ed_mu_tv||wd in pq2_pn_pa_ed_mu_tv||wd in pqn_ne_vz_na_ed_mu_tv||wd in pqn_ne_vz_pa_ed_mu_tv||
                          wd in pqn_ne_na_ed_mu_tv||wd in pqn_ne_pa_ed_mu_tv||wd in pqn_pe_na_ed_mu_tv||wd in pqn_pe_pa_ed_mu_tv||
                          wd in pqn_pe_sd_na_ed_mu_tv||wd in pqn_pe_sd_pa_ed_mu_tv||wd in pqn_pn_na_ed_mu_tv||wd in pqn_pn_pa_ed_mu_tv||
                          wd in pqs_ne_vz_pa_ed_mu_tv||wd in pqs_ne_pa_ed_mu_tv||wd in pqs_pe_pa_ed_mu_tv||wd in pqs_pe_sd_pa_ed_mu_tv||
                          wd in pqs_pn_pa_ed_mu_tv||wd in pq2_ne_vz_na_ed_sr_tv||wd in pq2_ne_vz_pa_ed_sr_tv||wd in pq2_ne_na_ed_sr_tv||
                          wd in pq2_ne_pa_ed_sr_tv||wd in pq2_pe_na_ed_sr_tv||wd in pq2_pe_pa_ed_sr_tv||wd in pq2_pe_sd_na_ed_sr_tv||
                          wd in pq2_pe_sd_pa_ed_sr_tv||wd in pq2_pn_na_ed_sr_tv||wd in pq2_pn_pa_ed_sr_tv||wd in pqn_ne_vz_na_ed_sr_tv||
                          wd in pqn_ne_vz_pa_ed_sr_tv||wd in pqn_ne_na_ed_sr_tv||wd in pqn_ne_pa_ed_sr_tv||wd in pqn_pe_na_ed_sr_tv||
                          wd in pqn_pe_pa_ed_sr_tv||wd in pqn_pe_sd_na_ed_sr_tv||wd in pqn_pe_sd_pa_ed_sr_tv||wd in pqn_pn_na_ed_sr_tv||
                          wd in pqn_pn_pa_ed_sr_tv||wd in pqs_ne_vz_pa_ed_sr_tv||wd in pqs_ne_pa_ed_sr_tv||wd in pqs_pe_pa_ed_sr_tv||
                          wd in pqs_pe_sd_pa_ed_sr_tv||wd in pqs_pn_pa_ed_sr_tv||wd in pq2_ne_vz_na_ed_ze_tv||wd in pq2_ne_vz_pa_ed_ze_tv||
                          wd in pq2_ne_na_ed_ze_tv||wd in pq2_ne_pa_ed_ze_tv||wd in pq2_pe_na_ed_ze_tv||wd in pq2_pe_pa_ed_ze_tv||
                          wd in pq2_pe_sd_na_ed_ze_tv||wd in pq2_pe_sd_pa_ed_ze_tv||wd in pq2_pn_na_ed_ze_tv||wd in pq2_pn_pa_ed_ze_tv||
                          wd in pqn_ne_vz_na_ed_ze_tv||wd in pqn_ne_vz_pa_ed_ze_tv||wd in pqn_ne_na_ed_ze_tv||wd in pqn_ne_pa_ed_ze_tv||
                          wd in pqn_pe_na_ed_ze_tv||wd in pqn_pe_pa_ed_ze_tv||wd in pqn_pe_sd_na_ed_ze_tv||wd in pqn_pe_sd_pa_ed_ze_tv||
                          wd in pqn_pn_na_ed_ze_tv||wd in pqn_pn_pa_ed_ze_tv||wd in pqs_ne_vz_pa_ed_ze_tv||wd in pqs_ne_pa_ed_ze_tv||
                          wd in pqs_pe_pa_ed_ze_tv||wd in pqs_pe_sd_pa_ed_ze_tv||wd in pqs_pn_pa_ed_ze_tv||wd in pq2_ne_vz_na_ed_ze_dr||
                          wd in pq2_ne_vz_pa_ed_ze_dr||wd in pq2_ne_na_ed_ze_dr||wd in pq2_ne_pa_ed_ze_dr||wd in pq2_pe_na_ed_ze_dr||
                          wd in pq2_pe_pa_ed_ze_dr||wd in pq2_pe_sd_na_ed_ze_dr||wd in pq2_pe_sd_pa_ed_ze_dr||wd in pq2_pn_na_ed_ze_dr||
                          wd in pq2_pn_pa_ed_ze_dr||wd in pqn_ne_vz_na_ed_ze_dr||wd in pqn_ne_vz_pa_ed_ze_dr||wd in pqn_ne_na_ed_ze_dr||
                          wd in pqn_ne_pa_ed_ze_dr||wd in pqn_pe_na_ed_ze_dr||wd in pqn_pe_pa_ed_ze_dr||wd in pqn_pe_sd_na_ed_ze_dr||
                          wd in pqn_pe_sd_pa_ed_ze_dr||wd in pqn_pn_na_ed_ze_dr||wd in pqn_pn_pa_ed_ze_dr||wd in pqs_ne_vz_pa_ed_ze_dr||
                          wd in pqs_ne_pa_ed_ze_dr||wd in pqs_pe_pa_ed_ze_dr||wd in pqs_pe_sd_pa_ed_ze_dr||wd in pqs_pn_pa_ed_ze_dr)           {rett=1} else {rett=0}; return rett}
function prq_edpr(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_mu_pr||wd in pq2_ne_vz_pa_ed_mu_pr||wd in pq2_ne_na_ed_mu_pr||wd in pq2_ne_pa_ed_mu_pr||
                          wd in pq2_pe_na_ed_mu_pr||wd in pq2_pe_pa_ed_mu_pr||wd in pq2_pe_sd_na_ed_mu_pr||wd in pq2_pe_sd_pa_ed_mu_pr||
                          wd in pq2_pn_na_ed_mu_pr||wd in pq2_pn_pa_ed_mu_pr||wd in pqn_ne_vz_na_ed_mu_pr||wd in pqn_ne_vz_pa_ed_mu_pr||
                          wd in pqn_ne_na_ed_mu_pr||wd in pqn_ne_pa_ed_mu_pr||wd in pqn_pe_na_ed_mu_pr||wd in pqn_pe_pa_ed_mu_pr||
                          wd in pqn_pe_sd_na_ed_mu_pr||wd in pqn_pe_sd_pa_ed_mu_pr||wd in pqn_pn_na_ed_mu_pr||wd in pqn_pn_pa_ed_mu_pr||
                          wd in pqs_ne_vz_pa_ed_mu_pr||wd in pqs_ne_pa_ed_mu_pr||wd in pqs_pe_pa_ed_mu_pr||wd in pqs_pe_sd_pa_ed_mu_pr||
                          wd in pqs_pn_pa_ed_mu_pr||wd in pq2_ne_vz_na_ed_sr_pr||wd in pq2_ne_vz_pa_ed_sr_pr||wd in pq2_ne_na_ed_sr_pr||
                          wd in pq2_ne_pa_ed_sr_pr||wd in pq2_pe_na_ed_sr_pr||wd in pq2_pe_pa_ed_sr_pr||wd in pq2_pe_sd_na_ed_sr_pr||
                          wd in pq2_pe_sd_pa_ed_sr_pr||wd in pq2_pn_na_ed_sr_pr||wd in pq2_pn_pa_ed_sr_pr||wd in pqn_ne_vz_na_ed_sr_pr||
                          wd in pqn_ne_vz_pa_ed_sr_pr||wd in pqn_ne_na_ed_sr_pr||wd in pqn_ne_pa_ed_sr_pr||wd in pqn_pe_na_ed_sr_pr||
                          wd in pqn_pe_pa_ed_sr_pr||wd in pqn_pe_sd_na_ed_sr_pr||wd in pqn_pe_sd_pa_ed_sr_pr||wd in pqn_pn_na_ed_sr_pr||  
                          wd in pqn_pn_pa_ed_sr_pr||wd in pqs_ne_vz_pa_ed_sr_pr||wd in pqs_ne_pa_ed_sr_pr||wd in pqs_pe_pa_ed_sr_pr||
                          wd in pqs_pe_sd_pa_ed_sr_pr||wd in pqs_pn_pa_ed_sr_pr||wd in pq2_ne_vz_na_ed_ze_dr||wd in pq2_ne_vz_pa_ed_ze_dr||
                          wd in pq2_ne_na_ed_ze_dr||wd in pq2_ne_pa_ed_ze_dr||wd in pq2_pe_na_ed_ze_dr||wd in pq2_pe_pa_ed_ze_dr||
                          wd in pq2_pe_sd_na_ed_ze_dr||wd in pq2_pe_sd_pa_ed_ze_dr||wd in pq2_pn_na_ed_ze_dr||wd in pq2_pn_pa_ed_ze_dr||
                          wd in pqn_ne_vz_na_ed_ze_dr||wd in pqn_ne_vz_pa_ed_ze_dr||wd in pqn_ne_na_ed_ze_dr||wd in pqn_ne_pa_ed_ze_dr||
                          wd in pqn_pe_na_ed_ze_dr||wd in pqn_pe_pa_ed_ze_dr||wd in pqn_pe_sd_na_ed_ze_dr||wd in pqn_pe_sd_pa_ed_ze_dr||
                          wd in pqn_pn_na_ed_ze_dr||wd in pqn_pn_pa_ed_ze_dr||wd in pqs_ne_vz_pa_ed_ze_dr||wd in pqs_ne_pa_ed_ze_dr||
                          wd in pqs_pe_pa_ed_ze_dr||wd in pqs_pe_sd_pa_ed_ze_dr||wd in pqs_pn_pa_ed_ze_dr)                                     {rett=1} else {rett=0}; return rett}
function prq_mnim(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_mn_im||wd in pq2_ne_vz_pa_mn_im||wd in pq2_ne_na_mn_im||wd in pq2_ne_pa_mn_im||wd in pq2_pe_na_mn_im||
                          wd in pq2_pe_pa_mn_im||wd in pq2_pe_sd_na_mn_im||wd in pq2_pe_sd_pa_mn_im||wd in pq2_pn_na_mn_im||wd in pq2_pn_pa_mn_im||
                          wd in pqn_ne_vz_na_mn_im||wd in pqn_ne_vz_pa_mn_im||wd in pqn_ne_na_mn_im||wd in pqn_ne_pa_mn_im||wd in pqn_pe_na_mn_im||
                          wd in pqn_pe_pa_mn_im||wd in pqn_pe_sd_na_mn_im||wd in pqn_pe_sd_pa_mn_im||wd in pqn_pn_na_mn_im||wd in pqn_pn_pa_mn_im||
                          wd in pqs_ne_vz_pa_mn_im||wd in pqs_ne_pa_mn_im||wd in pqs_pe_pa_mn_im||wd in pqs_pe_sd_pa_mn_im||wd in pqs_pn_pa_mn_im) {rett=1} else {rett=0}; return rett}
function prq_sdmnim(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_pe_sd_na_mn_im||wd in pq2_pe_sd_pa_mn_im||wd in pqn_pe_sd_na_mn_im||wd in pqn_pe_sd_pa_mn_im||
                          wd in pqs_pe_sd_pa_mn_im)                                                                                                {rett=1} else {rett=0}; return rett}
function prq_mnvi(n,                                                                                                                               wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_mn_im||wd in pq2_ne_vz_pa_mn_im||wd in pq2_ne_na_mn_im||wd in pq2_ne_pa_mn_im||wd in pq2_pe_na_mn_im||
                          wd in pq2_pe_pa_mn_im||wd in pq2_pe_sd_na_mn_im||wd in pq2_pe_sd_pa_mn_im||wd in pq2_pn_na_mn_im||wd in pq2_pn_pa_mn_im||
                          wd in pqn_ne_vz_na_mn_im||wd in pqn_ne_vz_pa_mn_im||wd in pqn_ne_na_mn_im||wd in pqn_ne_pa_mn_im||wd in pqn_pe_na_mn_im||
                          wd in pqn_pe_pa_mn_im||wd in pqn_pe_sd_na_mn_im||wd in pqn_pe_sd_pa_mn_im||wd in pqn_pn_na_mn_im||wd in pqn_pn_pa_mn_im||
                          wd in pqs_ne_vz_pa_mn_im||wd in pqs_ne_pa_mn_im||wd in pqs_pe_pa_mn_im||wd in pqs_pe_sd_pa_mn_im||wd in pqs_pn_pa_mn_im||
                          wd in pq2_ne_vz_na_mn_ro||wd in pq2_ne_vz_pa_mn_ro||wd in pq2_ne_na_mn_ro||wd in pq2_ne_pa_mn_ro||wd in pq2_pe_na_mn_ro||
                          wd in pq2_pe_pa_mn_ro||wd in pq2_pe_sd_na_mn_ro||wd in pq2_pe_sd_pa_mn_ro||wd in pq2_pn_na_mn_ro||wd in pq2_pn_pa_mn_ro||
                          wd in pqn_ne_vz_na_mn_ro||wd in pqn_ne_vz_pa_mn_ro||wd in pqn_ne_na_mn_ro||wd in pqn_ne_pa_mn_ro||wd in pqn_pe_na_mn_ro||
                          wd in pqn_pe_pa_mn_ro||wd in pqn_pe_sd_na_mn_ro||wd in pqn_pe_sd_pa_mn_ro||wd in pqn_pn_na_mn_ro||wd in pqn_pn_pa_mn_ro||
                          wd in pqs_ne_vz_pa_mn_ro||wd in pqs_ne_pa_mn_ro||wd in pqs_pe_pa_mn_ro||wd in pqs_pe_sd_pa_mn_ro||wd in pqs_pn_pa_mn_ro) {rett=1} else {rett=0}; return rett}
function prq_mnro(n,                                                                                                                               wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_mn_ro||wd in pq2_ne_vz_pa_mn_ro||wd in pq2_ne_na_mn_ro||wd in pq2_ne_pa_mn_ro||wd in pq2_pe_na_mn_ro||
                          wd in pq2_pe_pa_mn_ro||wd in pq2_pe_sd_na_mn_ro||wd in pq2_pe_sd_pa_mn_ro||wd in pq2_pn_na_mn_ro||wd in pq2_pn_pa_mn_ro||
                          wd in pqn_ne_vz_na_mn_ro||wd in pqn_ne_vz_pa_mn_ro||wd in pqn_ne_na_mn_ro||wd in pqn_ne_pa_mn_ro||wd in pqn_pe_na_mn_ro||
                          wd in pqn_pe_pa_mn_ro||wd in pqn_pe_sd_na_mn_ro||wd in pqn_pe_sd_pa_mn_ro||wd in pqn_pn_na_mn_ro||wd in pqn_pn_pa_mn_ro||
                          wd in pqs_ne_vz_pa_mn_ro||wd in pqs_ne_pa_mn_ro||wd in pqs_pe_pa_mn_ro||wd in pqs_pe_sd_pa_mn_ro||wd in pqs_pn_pa_mn_ro) {rett=1} else {rett=0}; return rett}
function prq_mnda(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_mn_da||wd in pq2_ne_vz_pa_mn_da||wd in pq2_ne_na_mn_da||wd in pq2_ne_pa_mn_da||wd in pq2_pe_na_mn_da||
                          wd in pq2_pe_pa_mn_da||wd in pq2_pe_sd_na_mn_da||wd in pq2_pe_sd_pa_mn_da||wd in pq2_pn_na_mn_da||wd in pq2_pn_pa_mn_da||
                          wd in pqn_ne_vz_na_mn_da||wd in pqn_ne_vz_pa_mn_da||wd in pqn_ne_na_mn_da||wd in pqn_ne_pa_mn_da||wd in pqn_pe_na_mn_da||
                          wd in pqn_pe_pa_mn_da||wd in pqn_pe_sd_na_mn_da||wd in pqn_pe_sd_pa_mn_da||wd in pqn_pn_na_mn_da||wd in pqn_pn_pa_mn_da||
                          wd in pqs_ne_vz_pa_mn_da||wd in pqs_ne_pa_mn_da||wd in pqs_pe_pa_mn_da||wd in pqs_pe_sd_pa_mn_da||wd in pqs_pn_pa_mn_da) {rett=1} else {rett=0}; return rett}
function prq_mntv(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_mn_tv||wd in pq2_ne_vz_pa_mn_tv||wd in pq2_ne_na_mn_tv||wd in pq2_ne_pa_mn_tv||wd in pq2_pe_na_mn_tv||
                          wd in pq2_pe_pa_mn_tv||wd in pq2_pe_sd_na_mn_tv||wd in pq2_pe_sd_pa_mn_tv||wd in pq2_pn_na_mn_tv||wd in pq2_pn_pa_mn_tv||
                          wd in pqn_ne_vz_na_mn_tv||wd in pqn_ne_vz_pa_mn_tv||wd in pqn_ne_na_mn_tv||wd in pqn_ne_pa_mn_tv||wd in pqn_pe_na_mn_tv||
                          wd in pqn_pe_pa_mn_tv||wd in pqn_pe_sd_na_mn_tv||wd in pqn_pe_sd_pa_mn_tv||wd in pqn_pn_na_mn_tv||wd in pqn_pn_pa_mn_tv||
                          wd in pqs_ne_vz_pa_mn_tv||wd in pqs_ne_pa_mn_tv||wd in pqs_pe_pa_mn_tv||wd in pqs_pe_sd_pa_mn_tv||wd in pqs_pn_pa_mn_tv) {rett=1} else {rett=0}; return rett}
function prq_mnpr(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_mn_ro||wd in pq2_ne_vz_pa_mn_ro||wd in pq2_ne_na_mn_ro||wd in pq2_ne_pa_mn_ro||wd in pq2_pe_na_mn_ro||
                          wd in pq2_pe_pa_mn_ro||wd in pq2_pe_sd_na_mn_ro||wd in pq2_pe_sd_pa_mn_ro||wd in pq2_pn_na_mn_ro||wd in pq2_pn_pa_mn_ro||
                          wd in pqn_ne_vz_na_mn_ro||wd in pqn_ne_vz_pa_mn_ro||wd in pqn_ne_na_mn_ro||wd in pqn_ne_pa_mn_ro||wd in pqn_pe_na_mn_ro||
                          wd in pqn_pe_pa_mn_ro||wd in pqn_pe_sd_na_mn_ro||wd in pqn_pe_sd_pa_mn_ro||wd in pqn_pn_na_mn_ro||wd in pqn_pn_pa_mn_ro||
                          wd in pqs_ne_vz_pa_mn_ro||wd in pqs_ne_pa_mn_ro||wd in pqs_pe_pa_mn_ro||wd in pqs_pe_sd_pa_mn_ro||wd in pqs_pn_pa_mn_ro) {rett=1} else {rett=0}; return rett}
function prq_ed(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_mu_im||wd in pq2_ne_vz_pa_ed_mu_im||wd in pq2_ne_na_ed_mu_im||wd in pq2_ne_pa_ed_mu_im||
                          wd in pq2_pe_na_ed_mu_im||wd in pq2_pe_pa_ed_mu_im||wd in pq2_pe_sd_na_ed_mu_im||wd in pq2_pe_sd_pa_ed_mu_im||
                          wd in pq2_pn_na_ed_mu_im||wd in pq2_pn_pa_ed_mu_im||wd in pqn_ne_vz_na_ed_mu_im||wd in pqn_ne_vz_pa_ed_mu_im||
                          wd in pqn_ne_na_ed_mu_im||wd in pqn_ne_pa_ed_mu_im||wd in pqn_pe_na_ed_mu_im||wd in pqn_pe_pa_ed_mu_im||
                          wd in pqn_pe_sd_na_ed_mu_im||wd in pqn_pe_sd_pa_ed_mu_im||wd in pqn_pn_na_ed_mu_im||wd in pqn_pn_pa_ed_mu_im||
                          wd in pqs_ne_vz_pa_ed_mu_im||wd in pqs_ne_pa_ed_mu_im||wd in pqs_pe_pa_ed_mu_im||wd in pqs_pe_sd_pa_ed_mu_im||
                          wd in pqs_pn_pa_ed_mu_im||wd in pq2_ne_vz_na_ed_sr_im||wd in pq2_ne_vz_pa_ed_sr_im||wd in pq2_ne_na_ed_sr_im||
                          wd in pq2_ne_pa_ed_sr_im||wd in pq2_pe_na_ed_sr_im||wd in pq2_pe_pa_ed_sr_im||wd in pq2_pe_sd_na_ed_sr_im||
                          wd in pq2_pe_sd_pa_ed_sr_im||wd in pq2_pn_na_ed_sr_im||wd in pq2_pn_pa_ed_sr_im||wd in pqn_ne_vz_na_ed_sr_im||
                          wd in pqn_ne_vz_pa_ed_sr_im||wd in pqn_ne_na_ed_sr_im||wd in pqn_ne_pa_ed_sr_im||wd in pqn_pe_na_ed_sr_im||
                          wd in pqn_pe_pa_ed_sr_im||wd in pqn_pe_sd_na_ed_sr_im||wd in pqn_pe_sd_pa_ed_sr_im||wd in pqn_pn_na_ed_sr_im||
                          wd in pqn_pn_pa_ed_sr_im||wd in pqs_ne_vz_pa_ed_sr_im||wd in pqs_ne_pa_ed_sr_im||wd in pqs_pe_pa_ed_sr_im||
                          wd in pqs_pe_sd_pa_ed_sr_im||wd in pqs_pn_pa_ed_sr_im||wd in pq2_ne_vz_na_ed_ze_im||wd in pq2_ne_vz_pa_ed_ze_im||
                          wd in pq2_ne_na_ed_ze_im||wd in pq2_ne_pa_ed_ze_im||wd in pq2_pe_na_ed_ze_im||wd in pq2_pe_pa_ed_ze_im||
                          wd in pq2_pe_sd_na_ed_ze_im||wd in pq2_pe_sd_pa_ed_ze_im||wd in pq2_pn_na_ed_ze_im||wd in pq2_pn_pa_ed_ze_im||
                          wd in pqn_ne_vz_na_ed_ze_im||wd in pqn_ne_vz_pa_ed_ze_im||wd in pqn_ne_na_ed_ze_im||wd in pqn_ne_pa_ed_ze_im||
                          wd in pqn_pe_na_ed_ze_im||wd in pqn_pe_pa_ed_ze_im||wd in pqn_pe_sd_na_ed_ze_im||wd in pqn_pe_sd_pa_ed_ze_im||
                          wd in pqn_pn_na_ed_ze_im||wd in pqn_pn_pa_ed_ze_im||wd in pqs_ne_vz_pa_ed_ze_im||wd in pqs_ne_pa_ed_ze_im||
                          wd in pqs_pe_pa_ed_ze_im||wd in pqs_pe_sd_pa_ed_ze_im||wd in pqs_pn_pa_ed_ze_im||wd in pq2_ne_vz_na_ed_mu_ro||
                          wd in pq2_ne_vz_pa_ed_mu_ro||wd in pq2_ne_na_ed_mu_ro||wd in pq2_ne_pa_ed_mu_ro||wd in pq2_pe_na_ed_mu_ro||
                          wd in pq2_pe_pa_ed_mu_ro||wd in pq2_pe_sd_na_ed_mu_ro||wd in pq2_pe_sd_pa_ed_mu_ro||wd in pq2_pn_na_ed_mu_ro||
                          wd in pq2_pn_pa_ed_mu_ro||wd in pqn_ne_vz_na_ed_mu_ro||wd in pqn_ne_vz_pa_ed_mu_ro||wd in pqn_ne_na_ed_mu_ro||
                          wd in pqn_ne_pa_ed_mu_ro||wd in pqn_pe_na_ed_mu_ro||wd in pqn_pe_pa_ed_mu_ro||wd in pqn_pe_sd_na_ed_mu_ro||
                          wd in pqn_pe_sd_pa_ed_mu_ro||wd in pqn_pn_na_ed_mu_ro||wd in pqn_pn_pa_ed_mu_ro||wd in pqs_ne_vz_pa_ed_mu_ro||
                          wd in pqs_ne_pa_ed_mu_ro||wd in pqs_pe_pa_ed_mu_ro||wd in pqs_pe_sd_pa_ed_mu_ro||wd in pqs_pn_pa_ed_mu_ro||
                          wd in pq2_ne_vz_na_ed_ze_vi||wd in pq2_ne_vz_pa_ed_ze_vi||wd in pq2_ne_na_ed_ze_vi||wd in pq2_ne_pa_ed_ze_vi||
                          wd in pq2_pe_na_ed_ze_vi||wd in pq2_pe_pa_ed_ze_vi||wd in pq2_pe_sd_na_ed_ze_vi||wd in pq2_pe_sd_pa_ed_ze_vi||
                          wd in pq2_pn_na_ed_ze_vi||wd in pq2_pn_pa_ed_ze_vi||wd in pqn_ne_vz_na_ed_ze_vi||wd in pqn_ne_vz_pa_ed_ze_vi||
                          wd in pqn_ne_na_ed_ze_vi||wd in pqn_ne_pa_ed_ze_vi||wd in pqn_pe_na_ed_ze_vi||wd in pqn_pe_pa_ed_ze_vi||
                          wd in pqn_pe_sd_na_ed_ze_vi||wd in pqn_pe_sd_pa_ed_ze_vi||wd in pqn_pn_na_ed_ze_vi||wd in pqn_pn_pa_ed_ze_vi||
                          wd in pqs_ne_vz_pa_ed_ze_vi||wd in pqs_ne_pa_ed_ze_vi||wd in pqs_pe_pa_ed_ze_vi||wd in pqs_pe_sd_pa_ed_ze_vi||
                          wd in pqs_pn_pa_ed_ze_vi||wd in pq2_ne_vz_na_ed_sr_ro||wd in pq2_ne_vz_pa_ed_sr_ro||wd in pq2_ne_na_ed_sr_ro||
                          wd in pq2_ne_pa_ed_sr_ro||wd in pq2_pe_na_ed_sr_ro||wd in pq2_pe_pa_ed_sr_ro||wd in pq2_pe_sd_na_ed_sr_ro||
                          wd in pq2_pe_sd_pa_ed_sr_ro||wd in pq2_pn_na_ed_sr_ro||wd in pq2_pn_pa_ed_sr_ro||wd in pqn_ne_vz_na_ed_sr_ro||
                          wd in pqn_ne_vz_pa_ed_sr_ro||wd in pqn_ne_na_ed_sr_ro||wd in pqn_ne_pa_ed_sr_ro||wd in pqn_pe_na_ed_sr_ro||
                          wd in pqn_pe_pa_ed_sr_ro||wd in pqn_pe_sd_na_ed_sr_ro||wd in pqn_pe_sd_pa_ed_sr_ro||wd in pqn_pn_na_ed_sr_ro||
                          wd in pqn_pn_pa_ed_sr_ro||wd in pqs_ne_vz_pa_ed_sr_ro||wd in pqs_ne_pa_ed_sr_ro||wd in pqs_pe_pa_ed_sr_ro||
                          wd in pqs_pe_sd_pa_ed_sr_ro||wd in pqs_pn_pa_ed_sr_ro||wd in pq2_ne_vz_na_ed_ze_dr||wd in pq2_ne_vz_pa_ed_ze_dr||
                          wd in pq2_ne_na_ed_ze_dr||wd in pq2_ne_pa_ed_ze_dr||wd in pq2_pe_na_ed_ze_dr||wd in pq2_pe_pa_ed_ze_dr||
                          wd in pq2_pe_sd_na_ed_ze_dr||wd in pq2_pe_sd_pa_ed_ze_dr||wd in pq2_pn_na_ed_ze_dr||wd in pq2_pn_pa_ed_ze_dr||
                          wd in pqn_ne_vz_na_ed_ze_dr||wd in pqn_ne_vz_pa_ed_ze_dr||wd in pqn_ne_na_ed_ze_dr||wd in pqn_ne_pa_ed_ze_dr||
                          wd in pqn_pe_na_ed_ze_dr||wd in pqn_pe_pa_ed_ze_dr||wd in pqn_pe_sd_na_ed_ze_dr||wd in pqn_pe_sd_pa_ed_ze_dr||
                          wd in pqn_pn_na_ed_ze_dr||wd in pqn_pn_pa_ed_ze_dr||wd in pqs_ne_vz_pa_ed_ze_dr||wd in pqs_ne_pa_ed_ze_dr||
                          wd in pqs_pe_pa_ed_ze_dr||wd in pqs_pe_sd_pa_ed_ze_dr||wd in pqs_pn_pa_ed_ze_dr||wd in pq2_ne_vz_na_ed_mu_da||
                          wd in pq2_ne_vz_pa_ed_mu_da||wd in pq2_ne_na_ed_mu_da||wd in pq2_ne_pa_ed_mu_da||wd in pq2_pe_na_ed_mu_da||
                          wd in pq2_pe_pa_ed_mu_da||wd in pq2_pe_sd_na_ed_mu_da||wd in pq2_pe_sd_pa_ed_mu_da||wd in pq2_pn_na_ed_mu_da||
                          wd in pq2_pn_pa_ed_mu_da||wd in pqn_ne_vz_na_ed_mu_da||wd in pqn_ne_vz_pa_ed_mu_da||wd in pqn_ne_na_ed_mu_da||
                          wd in pqn_ne_pa_ed_mu_da||wd in pqn_pe_na_ed_mu_da||wd in pqn_pe_pa_ed_mu_da||wd in pqn_pe_sd_na_ed_mu_da||
                          wd in pqn_pe_sd_pa_ed_mu_da||wd in pqn_pn_na_ed_mu_da||wd in pqn_pn_pa_ed_mu_da||wd in pqs_ne_vz_pa_ed_mu_da||
                          wd in pqs_ne_pa_ed_mu_da||wd in pqs_pe_pa_ed_mu_da||wd in pqs_pe_sd_pa_ed_mu_da||wd in pqs_pn_pa_ed_mu_da||
                          wd in pq2_ne_vz_na_ed_sr_da||wd in pq2_ne_vz_pa_ed_sr_da||wd in pq2_ne_na_ed_sr_da||wd in pq2_ne_pa_ed_sr_da||
                          wd in pq2_pe_na_ed_sr_da||wd in pq2_pe_pa_ed_sr_da||wd in pq2_pe_sd_na_ed_sr_da||wd in pq2_pe_sd_pa_ed_sr_da||
                          wd in pq2_pn_na_ed_sr_da||wd in pq2_pn_pa_ed_sr_da||wd in pqn_ne_vz_na_ed_sr_da||wd in pqn_ne_vz_pa_ed_sr_da||
                          wd in pqn_ne_na_ed_sr_da||wd in pqn_ne_pa_ed_sr_da||wd in pqn_pe_na_ed_sr_da||wd in pqn_pe_pa_ed_sr_da||
                          wd in pqn_pe_sd_na_ed_sr_da||wd in pqn_pe_sd_pa_ed_sr_da||wd in pqn_pn_na_ed_sr_da||wd in pqn_pn_pa_ed_sr_da||
                          wd in pqs_ne_vz_pa_ed_sr_da||wd in pqs_ne_pa_ed_sr_da||wd in pqs_pe_pa_ed_sr_da||wd in pqs_pe_sd_pa_ed_sr_da||
                          wd in pqs_pn_pa_ed_sr_da||wd in pq2_ne_vz_na_ed_mu_tv||wd in pq2_ne_vz_pa_ed_mu_tv||wd in pq2_ne_na_ed_mu_tv||
                          wd in pq2_ne_pa_ed_mu_tv||wd in pq2_pe_na_ed_mu_tv||wd in pq2_pe_pa_ed_mu_tv||wd in pq2_pe_sd_na_ed_mu_tv||
                          wd in pq2_pe_sd_pa_ed_mu_tv||wd in pq2_pn_na_ed_mu_tv||wd in pq2_pn_pa_ed_mu_tv||wd in pqn_ne_vz_na_ed_mu_tv||
                          wd in pqn_ne_vz_pa_ed_mu_tv||wd in pqn_ne_na_ed_mu_tv||wd in pqn_ne_pa_ed_mu_tv||wd in pqn_pe_na_ed_mu_tv||
                          wd in pqn_pe_pa_ed_mu_tv||wd in pqn_pe_sd_na_ed_mu_tv||wd in pqn_pe_sd_pa_ed_mu_tv||wd in pqn_pn_na_ed_mu_tv||
                          wd in pqn_pn_pa_ed_mu_tv||wd in pqs_ne_vz_pa_ed_mu_tv||wd in pqs_ne_pa_ed_mu_tv||wd in pqs_pe_pa_ed_mu_tv||
                          wd in pqs_pe_sd_pa_ed_mu_tv||wd in pqs_pn_pa_ed_mu_tv||wd in pq2_ne_vz_na_ed_sr_tv||wd in pq2_ne_vz_pa_ed_sr_tv||
                          wd in pq2_ne_na_ed_sr_tv||wd in pq2_ne_pa_ed_sr_tv||wd in pq2_pe_na_ed_sr_tv||wd in pq2_pe_pa_ed_sr_tv||
                          wd in pq2_pe_sd_na_ed_sr_tv||wd in pq2_pe_sd_pa_ed_sr_tv||wd in pq2_pn_na_ed_sr_tv||wd in pq2_pn_pa_ed_sr_tv||
                          wd in pqn_ne_vz_na_ed_sr_tv||wd in pqn_ne_vz_pa_ed_sr_tv||wd in pqn_ne_na_ed_sr_tv||wd in pqn_ne_pa_ed_sr_tv||
                          wd in pqn_pe_na_ed_sr_tv||wd in pqn_pe_pa_ed_sr_tv||wd in pqn_pe_sd_na_ed_sr_tv||wd in pqn_pe_sd_pa_ed_sr_tv||
                          wd in pqn_pn_na_ed_sr_tv||wd in pqn_pn_pa_ed_sr_tv||wd in pqs_ne_vz_pa_ed_sr_tv||wd in pqs_ne_pa_ed_sr_tv||
                          wd in pqs_pe_pa_ed_sr_tv||wd in pqs_pe_sd_pa_ed_sr_tv||wd in pqs_pn_pa_ed_sr_tv||wd in pq2_ne_vz_na_ed_ze_tv||
                          wd in pq2_ne_vz_pa_ed_ze_tv||wd in pq2_ne_na_ed_ze_tv||wd in pq2_ne_pa_ed_ze_tv||wd in pq2_pe_na_ed_ze_tv||
                          wd in pq2_pe_pa_ed_ze_tv||wd in pq2_pe_sd_na_ed_ze_tv||wd in pq2_pe_sd_pa_ed_ze_tv||wd in pq2_pn_na_ed_ze_tv||
                          wd in pq2_pn_pa_ed_ze_tv||wd in pqn_ne_vz_na_ed_ze_tv||wd in pqn_ne_vz_pa_ed_ze_tv||wd in pqn_ne_na_ed_ze_tv||
                          wd in pqn_ne_pa_ed_ze_tv||wd in pqn_pe_na_ed_ze_tv||wd in pqn_pe_pa_ed_ze_tv||wd in pqn_pe_sd_na_ed_ze_tv||
                          wd in pqn_pe_sd_pa_ed_ze_tv||wd in pqn_pn_na_ed_ze_tv||wd in pqn_pn_pa_ed_ze_tv||wd in pqs_ne_vz_pa_ed_ze_tv||
                          wd in pqs_ne_pa_ed_ze_tv||wd in pqs_pe_pa_ed_ze_tv||wd in pqs_pe_sd_pa_ed_ze_tv||wd in pqs_pn_pa_ed_ze_tv||
                          wd in pq2_ne_vz_na_ed_mu_pr||wd in pq2_ne_vz_pa_ed_mu_pr||wd in pq2_ne_na_ed_mu_pr||wd in pq2_ne_pa_ed_mu_pr||
                          wd in pq2_pe_na_ed_mu_pr||wd in pq2_pe_pa_ed_mu_pr||wd in pq2_pe_sd_na_ed_mu_pr||wd in pq2_pe_sd_pa_ed_mu_pr||
                          wd in pq2_pn_na_ed_mu_pr||wd in pq2_pn_pa_ed_mu_pr||wd in pqn_ne_vz_na_ed_mu_pr||wd in pqn_ne_vz_pa_ed_mu_pr||
                          wd in pqn_ne_na_ed_mu_pr||wd in pqn_ne_pa_ed_mu_pr||wd in pqn_pe_na_ed_mu_pr||wd in pqn_pe_pa_ed_mu_pr||
                          wd in pqn_pe_sd_na_ed_mu_pr||wd in pqn_pe_sd_pa_ed_mu_pr||wd in pqn_pn_na_ed_mu_pr||wd in pqn_pn_pa_ed_mu_pr||
                          wd in pqs_ne_vz_pa_ed_mu_pr||wd in pqs_ne_pa_ed_mu_pr||wd in pqs_pe_pa_ed_mu_pr||wd in pqs_pe_sd_pa_ed_mu_pr||
                          wd in pqs_pn_pa_ed_mu_pr||wd in pq2_ne_vz_na_ed_sr_pr||wd in pq2_ne_vz_pa_ed_sr_pr||wd in pq2_ne_na_ed_sr_pr||
                          wd in pq2_ne_pa_ed_sr_pr||wd in pq2_pe_na_ed_sr_pr||wd in pq2_pe_pa_ed_sr_pr||wd in pq2_pe_sd_na_ed_sr_pr||
                          wd in pq2_pe_sd_pa_ed_sr_pr||wd in pq2_pn_na_ed_sr_pr||wd in pq2_pn_pa_ed_sr_pr||wd in pqn_ne_vz_na_ed_sr_pr||
                          wd in pqn_ne_vz_pa_ed_sr_pr||wd in pqn_ne_na_ed_sr_pr||wd in pqn_ne_pa_ed_sr_pr||wd in pqn_pe_na_ed_sr_pr||
                          wd in pqn_pe_pa_ed_sr_pr||wd in pqn_pe_sd_na_ed_sr_pr||wd in pqn_pe_sd_pa_ed_sr_pr||wd in pqn_pn_na_ed_sr_pr||
                          wd in pqn_pn_pa_ed_sr_pr||wd in pqs_ne_vz_pa_ed_sr_pr||wd in pqs_ne_pa_ed_sr_pr||wd in pqs_pe_pa_ed_sr_pr||
                          wd in pqs_pe_sd_pa_ed_sr_pr||wd in pqs_pn_pa_ed_sr_pr)                                                               {rett=1} else {rett=0}; return rett}
function prq_mn(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_mn_im||wd in pq2_ne_vz_pa_mn_im||wd in pq2_ne_na_mn_im||wd in pq2_ne_pa_mn_im||wd in pq2_pe_na_mn_im||
                          wd in pq2_pe_pa_mn_im||wd in pq2_pe_sd_na_mn_im||wd in pq2_pe_sd_pa_mn_im||wd in pq2_pn_na_mn_im||wd in pq2_pn_pa_mn_im||
                          wd in pqn_ne_vz_na_mn_im||wd in pqn_ne_vz_pa_mn_im||wd in pqn_ne_na_mn_im||wd in pqn_ne_pa_mn_im||wd in pqn_pe_na_mn_im||
                          wd in pqn_pe_pa_mn_im||wd in pqn_pe_sd_na_mn_im||wd in pqn_pe_sd_pa_mn_im||wd in pqn_pn_na_mn_im||wd in pqn_pn_pa_mn_im||
                          wd in pqs_ne_vz_pa_mn_im||wd in pqs_ne_pa_mn_im||wd in pqs_pe_pa_mn_im||wd in pqs_pe_sd_pa_mn_im||wd in pqs_pn_pa_mn_im||
                          wd in pq2_ne_vz_na_mn_ro||wd in pq2_ne_vz_pa_mn_ro||wd in pq2_ne_na_mn_ro||wd in pq2_ne_pa_mn_ro||wd in pq2_pe_na_mn_ro||
                          wd in pq2_pe_pa_mn_ro||wd in pq2_pe_sd_na_mn_ro||wd in pq2_pe_sd_pa_mn_ro||wd in pq2_pn_na_mn_ro||wd in pq2_pn_pa_mn_ro||
                          wd in pqn_ne_vz_na_mn_ro||wd in pqn_ne_vz_pa_mn_ro||wd in pqn_ne_na_mn_ro||wd in pqn_ne_pa_mn_ro||wd in pqn_pe_na_mn_ro||
                          wd in pqn_pe_pa_mn_ro||wd in pqn_pe_sd_na_mn_ro||wd in pqn_pe_sd_pa_mn_ro||wd in pqn_pn_na_mn_ro||wd in pqn_pn_pa_mn_ro||
                          wd in pqs_ne_vz_pa_mn_ro||wd in pqs_ne_pa_mn_ro||wd in pqs_pe_pa_mn_ro||wd in pqs_pe_sd_pa_mn_ro||wd in pqs_pn_pa_mn_ro||
                          wd in pq2_ne_vz_na_mn_da||wd in pq2_ne_vz_pa_mn_da||wd in pq2_ne_na_mn_da||wd in pq2_ne_pa_mn_da||wd in pq2_pe_na_mn_da||
                          wd in pq2_pe_pa_mn_da||wd in pq2_pe_sd_na_mn_da||wd in pq2_pe_sd_pa_mn_da||wd in pq2_pn_na_mn_da||wd in pq2_pn_pa_mn_da||
                          wd in pqn_ne_vz_na_mn_da||wd in pqn_ne_vz_pa_mn_da||wd in pqn_ne_na_mn_da||wd in pqn_ne_pa_mn_da||wd in pqn_pe_na_mn_da||
                          wd in pqn_pe_pa_mn_da||wd in pqn_pe_sd_na_mn_da||wd in pqn_pe_sd_pa_mn_da||wd in pqn_pn_na_mn_da||wd in pqn_pn_pa_mn_da||
                          wd in pqs_ne_vz_pa_mn_da||wd in pqs_ne_pa_mn_da||wd in pqs_pe_pa_mn_da||wd in pqs_pe_sd_pa_mn_da||wd in pqs_pn_pa_mn_da||
                          wd in pq2_ne_vz_na_mn_tv||wd in pq2_ne_vz_pa_mn_tv||wd in pq2_ne_na_mn_tv||wd in pq2_ne_pa_mn_tv||wd in pq2_pe_na_mn_tv||
                          wd in pq2_pe_pa_mn_tv||wd in pq2_pe_sd_na_mn_tv||wd in pq2_pe_sd_pa_mn_tv||wd in pq2_pn_na_mn_tv||wd in pq2_pn_pa_mn_tv||
                          wd in pqn_ne_vz_na_mn_tv||wd in pqn_ne_vz_pa_mn_tv||wd in pqn_ne_na_mn_tv||wd in pqn_ne_pa_mn_tv||wd in pqn_pe_na_mn_tv||
                          wd in pqn_pe_pa_mn_tv||wd in pqn_pe_sd_na_mn_tv||wd in pqn_pe_sd_pa_mn_tv||wd in pqn_pn_na_mn_tv||wd in pqn_pn_pa_mn_tv||
                          wd in pqs_ne_vz_pa_mn_tv||wd in pqs_ne_pa_mn_tv||wd in pqs_pe_pa_mn_tv||wd in pqs_pe_sd_pa_mn_tv||wd in pqs_pn_pa_mn_tv) {rett=1} else {rett=0}; return rett}
function prq_any(n,                                                                                                                            wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_ne_vz_na_ed_ze_tv||wd in pq2_ne_vz_pa_ed_ze_tv||wd in pq2_ne_na_ed_ze_tv||wd in pq2_ne_pa_ed_ze_tv||
                          wd in pq2_pe_na_ed_ze_tv||wd in pq2_pe_pa_ed_ze_tv||wd in pq2_pe_sd_na_ed_ze_tv||wd in pq2_pe_sd_pa_ed_ze_tv||
                          wd in pq2_pn_na_ed_ze_tv||wd in pq2_pn_pa_ed_ze_tv||wd in pqn_ne_vz_na_ed_ze_tv||wd in pqn_ne_vz_pa_ed_ze_tv||
                          wd in pqn_ne_na_ed_ze_tv||wd in pqn_ne_pa_ed_ze_tv||wd in pqn_pe_na_ed_ze_tv||wd in pqn_pe_pa_ed_ze_tv||
                          wd in pqn_pe_sd_na_ed_ze_tv||wd in pqn_pe_sd_pa_ed_ze_tv||wd in pqn_pn_na_ed_ze_tv||wd in pqn_pn_pa_ed_ze_tv||
                          wd in pqs_ne_vz_pa_ed_ze_tv||wd in pqs_ne_pa_ed_ze_tv||wd in pqs_pe_pa_ed_ze_tv||wd in pqs_pe_sd_pa_ed_ze_tv||
                          wd in pqs_pn_pa_ed_ze_tv||wd in pq2_ne_vz_na_ed_ze_dr||wd in pq2_ne_vz_pa_ed_ze_dr||wd in pq2_ne_na_ed_ze_dr||
                          wd in pq2_ne_pa_ed_ze_dr||wd in pq2_pe_na_ed_ze_dr||wd in pq2_pe_pa_ed_ze_dr||wd in pq2_pe_sd_na_ed_ze_dr||
                          wd in pq2_pe_sd_pa_ed_ze_dr||wd in pq2_pn_na_ed_ze_dr||wd in pq2_pn_pa_ed_ze_dr||wd in pqn_ne_vz_na_ed_ze_dr||
                          wd in pqn_ne_vz_pa_ed_ze_dr||wd in pqn_ne_na_ed_ze_dr||wd in pqn_ne_pa_ed_ze_dr||wd in pqn_pe_na_ed_ze_dr||
                          wd in pqn_pe_pa_ed_ze_dr||wd in pqn_pe_sd_na_ed_ze_dr||wd in pqn_pe_sd_pa_ed_ze_dr||wd in pqn_pn_na_ed_ze_dr||
                          wd in pqn_pn_pa_ed_ze_dr||wd in pqs_ne_vz_pa_ed_ze_dr||wd in pqs_ne_pa_ed_ze_dr||wd in pqs_pe_pa_ed_ze_dr||
                          wd in pqs_pe_sd_pa_ed_ze_dr||wd in pqs_pn_pa_ed_ze_dr||wd in pq2_ne_vz_na_ed_ze_dr||wd in pq2_ne_vz_pa_ed_ze_dr||
                          wd in pq2_ne_na_ed_ze_dr||wd in pq2_ne_pa_ed_ze_dr||wd in pq2_pe_na_ed_ze_dr||wd in pq2_pe_pa_ed_ze_dr||
                          wd in pq2_pe_sd_na_ed_ze_dr||wd in pq2_pe_sd_pa_ed_ze_dr||wd in pq2_pn_na_ed_ze_dr||wd in pq2_pn_pa_ed_ze_dr||
                          wd in pqn_ne_vz_na_ed_ze_dr||wd in pqn_ne_vz_pa_ed_ze_dr||wd in pqn_ne_na_ed_ze_dr||wd in pqn_ne_pa_ed_ze_dr||
                          wd in pqn_pe_na_ed_ze_dr||wd in pqn_pe_pa_ed_ze_dr||wd in pqn_pe_sd_na_ed_ze_dr||wd in pqn_pe_sd_pa_ed_ze_dr||
                          wd in pqn_pn_na_ed_ze_dr||wd in pqn_pn_pa_ed_ze_dr||wd in pqs_ne_vz_pa_ed_ze_dr||wd in pqs_ne_pa_ed_ze_dr||
                          wd in pqs_pe_pa_ed_ze_dr||wd in pqs_pe_sd_pa_ed_ze_dr||wd in pqs_pn_pa_ed_ze_dr||wd in pq2_ne_vz_na_ed_ze_dr||
                          wd in pq2_ne_vz_pa_ed_ze_dr||wd in pq2_ne_na_ed_ze_dr||wd in pq2_ne_pa_ed_ze_dr||wd in pq2_pe_na_ed_ze_dr||
                          wd in pq2_pe_pa_ed_ze_dr||wd in pq2_pe_sd_na_ed_ze_dr||wd in pq2_pe_sd_pa_ed_ze_dr||wd in pq2_pn_na_ed_ze_dr||
                          wd in pq2_pn_pa_ed_ze_dr||wd in pqn_ne_vz_na_ed_ze_dr||wd in pqn_ne_vz_pa_ed_ze_dr||wd in pqn_ne_na_ed_ze_dr||
                          wd in pqn_ne_pa_ed_ze_dr||wd in pqn_pe_na_ed_ze_dr||wd in pqn_pe_pa_ed_ze_dr||wd in pqn_pe_sd_na_ed_ze_dr||
                          wd in pqn_pe_sd_pa_ed_ze_dr||wd in pqn_pn_na_ed_ze_dr||wd in pqn_pn_pa_ed_ze_dr||wd in pqs_ne_vz_pa_ed_ze_dr||
                          wd in pqs_ne_pa_ed_ze_dr||wd in pqs_pe_pa_ed_ze_dr||wd in pqs_pe_sd_pa_ed_ze_dr||wd in pqs_pn_pa_ed_ze_dr||
                          wd in pq2_ne_vz_na_ed_ze_dr||wd in pq2_ne_vz_pa_ed_ze_dr||wd in pq2_ne_na_ed_ze_dr||wd in pq2_ne_pa_ed_ze_dr||
                          wd in pq2_pe_na_ed_ze_dr||wd in pq2_pe_pa_ed_ze_dr||wd in pq2_pe_sd_na_ed_ze_dr||wd in pq2_pe_sd_pa_ed_ze_dr||
                          wd in pq2_pn_na_ed_ze_dr||wd in pq2_pn_pa_ed_ze_dr||wd in pqn_ne_vz_na_ed_ze_dr||wd in pqn_ne_vz_pa_ed_ze_dr||
                          wd in pqn_ne_na_ed_ze_dr||wd in pqn_ne_pa_ed_ze_dr||wd in pqn_pe_na_ed_ze_dr||wd in pqn_pe_pa_ed_ze_dr||
                          wd in pqn_pe_sd_na_ed_ze_dr||wd in pqn_pe_sd_pa_ed_ze_dr||wd in pqn_pn_na_ed_ze_dr||wd in pqn_pn_pa_ed_ze_dr||
                          wd in pqs_ne_vz_pa_ed_ze_dr||wd in pqs_ne_pa_ed_ze_dr||wd in pqs_pe_pa_ed_ze_dr||wd in pqs_pe_sd_pa_ed_ze_dr||
                          wd in pqs_pn_pa_ed_ze_dr||wd in pq2_ne_vz_na_ed_ze_im||wd in pq2_ne_vz_pa_ed_ze_im||wd in pq2_ne_na_ed_ze_im||
                          wd in pq2_ne_pa_ed_ze_im||wd in pq2_pe_na_ed_ze_im||wd in pq2_pe_pa_ed_ze_im||wd in pq2_pe_sd_na_ed_ze_im||
                          wd in pq2_pe_sd_pa_ed_ze_im||wd in pq2_pn_na_ed_ze_im||wd in pq2_pn_pa_ed_ze_im||wd in pqn_ne_vz_na_ed_ze_im||
                          wd in pqn_ne_vz_pa_ed_ze_im||wd in pqn_ne_na_ed_ze_im||wd in pqn_ne_pa_ed_ze_im||wd in pqn_pe_na_ed_ze_im||
                          wd in pqn_pe_pa_ed_ze_im||wd in pqn_pe_sd_na_ed_ze_im||wd in pqn_pe_sd_pa_ed_ze_im||wd in pqn_pn_na_ed_ze_im||
                          wd in pqn_pn_pa_ed_ze_im||wd in pqs_ne_vz_pa_ed_ze_im||wd in pqs_ne_pa_ed_ze_im||wd in pqs_pe_pa_ed_ze_im||
                          wd in pqs_pe_sd_pa_ed_ze_im||wd in pqs_pn_pa_ed_ze_im||wd in pq2_ne_vz_na_ed_ze_vi||wd in pq2_ne_vz_pa_ed_ze_vi||
                          wd in pq2_ne_na_ed_ze_vi||wd in pq2_ne_pa_ed_ze_vi||wd in pq2_pe_na_ed_ze_vi||wd in pq2_pe_pa_ed_ze_vi||
                          wd in pq2_pe_sd_na_ed_ze_vi||wd in pq2_pe_sd_pa_ed_ze_vi||wd in pq2_pn_na_ed_ze_vi||wd in pq2_pn_pa_ed_ze_vi||
                          wd in pqn_ne_vz_na_ed_ze_vi||wd in pqn_ne_vz_pa_ed_ze_vi||wd in pqn_ne_na_ed_ze_vi||wd in pqn_ne_pa_ed_ze_vi||
                          wd in pqn_pe_na_ed_ze_vi||wd in pqn_pe_pa_ed_ze_vi||wd in pqn_pe_sd_na_ed_ze_vi||wd in pqn_pe_sd_pa_ed_ze_vi||
                          wd in pqn_pn_na_ed_ze_vi||wd in pqn_pn_pa_ed_ze_vi||wd in pqs_ne_vz_pa_ed_ze_vi||wd in pqs_ne_pa_ed_ze_vi||
                          wd in pqs_pe_pa_ed_ze_vi||wd in pqs_pe_sd_pa_ed_ze_vi||wd in pqs_pn_pa_ed_ze_vi||wd in pq2_ne_vz_na_ed_mu_im||
                          wd in pq2_ne_vz_pa_ed_mu_im||wd in pq2_ne_na_ed_mu_im||wd in pq2_ne_pa_ed_mu_im||wd in pq2_pe_na_ed_mu_im||
                          wd in pq2_pe_pa_ed_mu_im||wd in pq2_pe_sd_na_ed_mu_im||wd in pq2_pe_sd_pa_ed_mu_im||wd in pq2_pn_na_ed_mu_im||
                          wd in pq2_pn_pa_ed_mu_im||wd in pqn_ne_vz_na_ed_mu_im||wd in pqn_ne_vz_pa_ed_mu_im||wd in pqn_ne_na_ed_mu_im||
                          wd in pqn_ne_pa_ed_mu_im||wd in pqn_pe_na_ed_mu_im||wd in pqn_pe_pa_ed_mu_im||wd in pqn_pe_sd_na_ed_mu_im||
                          wd in pqn_pe_sd_pa_ed_mu_im||wd in pqn_pn_na_ed_mu_im||wd in pqn_pn_pa_ed_mu_im||wd in pqs_ne_vz_pa_ed_mu_im||
                          wd in pqs_ne_pa_ed_mu_im||wd in pqs_pe_pa_ed_mu_im||wd in pqs_pe_sd_pa_ed_mu_im||wd in pqs_pn_pa_ed_mu_im||
                          wd in pq2_ne_vz_na_ed_mu_ro||wd in pq2_ne_vz_pa_ed_mu_ro||wd in pq2_ne_na_ed_mu_ro||wd in pq2_ne_pa_ed_mu_ro||
                          wd in pq2_pe_na_ed_mu_ro||wd in pq2_pe_pa_ed_mu_ro||wd in pq2_pe_sd_na_ed_mu_ro||wd in pq2_pe_sd_pa_ed_mu_ro||
                          wd in pq2_pn_na_ed_mu_ro||wd in pq2_pn_pa_ed_mu_ro||wd in pqn_ne_vz_na_ed_mu_ro||wd in pqn_ne_vz_pa_ed_mu_ro||
                          wd in pqn_ne_na_ed_mu_ro||wd in pqn_ne_pa_ed_mu_ro||wd in pqn_pe_na_ed_mu_ro||wd in pqn_pe_pa_ed_mu_ro||
                          wd in pqn_pe_sd_na_ed_mu_ro||wd in pqn_pe_sd_pa_ed_mu_ro||wd in pqn_pn_na_ed_mu_ro||wd in pqn_pn_pa_ed_mu_ro||
                          wd in pqs_ne_vz_pa_ed_mu_ro||wd in pqs_ne_pa_ed_mu_ro||wd in pqs_pe_pa_ed_mu_ro||wd in pqs_pe_sd_pa_ed_mu_ro||
                          wd in pqs_pn_pa_ed_mu_ro||wd in pq2_ne_vz_na_ed_mu_da||wd in pq2_ne_vz_pa_ed_mu_da||wd in pq2_ne_na_ed_mu_da||
                          wd in pq2_ne_pa_ed_mu_da||wd in pq2_pe_na_ed_mu_da||wd in pq2_pe_pa_ed_mu_da||wd in pq2_pe_sd_na_ed_mu_da||
                          wd in pq2_pe_sd_pa_ed_mu_da||wd in pq2_pn_na_ed_mu_da||wd in pq2_pn_pa_ed_mu_da||wd in pqn_ne_vz_na_ed_mu_da||
                          wd in pqn_ne_vz_pa_ed_mu_da||wd in pqn_ne_na_ed_mu_da||wd in pqn_ne_pa_ed_mu_da||wd in pqn_pe_na_ed_mu_da||
                          wd in pqn_pe_pa_ed_mu_da||wd in pqn_pe_sd_na_ed_mu_da||wd in pqn_pe_sd_pa_ed_mu_da||wd in pqn_pn_na_ed_mu_da||
                          wd in pqn_pn_pa_ed_mu_da||wd in pqs_ne_vz_pa_ed_mu_da||wd in pqs_ne_pa_ed_mu_da||wd in pqs_pe_pa_ed_mu_da||
                          wd in pqs_pe_sd_pa_ed_mu_da||wd in pqs_pn_pa_ed_mu_da||wd in pq2_ne_vz_na_ed_mu_im||wd in pq2_ne_vz_pa_ed_mu_im||
                          wd in pq2_ne_na_ed_mu_im||wd in pq2_ne_pa_ed_mu_im||wd in pq2_pe_na_ed_mu_im||wd in pq2_pe_pa_ed_mu_im||
                          wd in pq2_pe_sd_na_ed_mu_im||wd in pq2_pe_sd_pa_ed_mu_im||wd in pq2_pn_na_ed_mu_im||wd in pq2_pn_pa_ed_mu_im||
                          wd in pqn_ne_vz_na_ed_mu_im||wd in pqn_ne_vz_pa_ed_mu_im||wd in pqn_ne_na_ed_mu_im||wd in pqn_ne_pa_ed_mu_im||
                          wd in pqn_pe_na_ed_mu_im||wd in pqn_pe_pa_ed_mu_im||wd in pqn_pe_sd_na_ed_mu_im||wd in pqn_pe_sd_pa_ed_mu_im||
                          wd in pqn_pn_na_ed_mu_im||wd in pqn_pn_pa_ed_mu_im||wd in pqs_ne_vz_pa_ed_mu_im||wd in pqs_ne_pa_ed_mu_im||
                          wd in pqs_pe_pa_ed_mu_im||wd in pqs_pe_sd_pa_ed_mu_im||wd in pqs_pn_pa_ed_mu_im||wd in pq2_ne_vz_na_ed_mu_pr||
                          wd in pq2_ne_vz_pa_ed_mu_pr||wd in pq2_ne_na_ed_mu_pr||wd in pq2_ne_pa_ed_mu_pr||wd in pq2_pe_na_ed_mu_pr||
                          wd in pq2_pe_pa_ed_mu_pr||wd in pq2_pe_sd_na_ed_mu_pr||wd in pq2_pe_sd_pa_ed_mu_pr||wd in pq2_pn_na_ed_mu_pr||
                          wd in pq2_pn_pa_ed_mu_pr||wd in pqn_ne_vz_na_ed_mu_pr||wd in pqn_ne_vz_pa_ed_mu_pr||wd in pqn_ne_na_ed_mu_pr||
                          wd in pqn_ne_pa_ed_mu_pr||wd in pqn_pe_na_ed_mu_pr||wd in pqn_pe_pa_ed_mu_pr||wd in pqn_pe_sd_na_ed_mu_pr||
                          wd in pqn_pe_sd_pa_ed_mu_pr||wd in pqn_pn_na_ed_mu_pr||wd in pqn_pn_pa_ed_mu_pr||wd in pqs_ne_vz_pa_ed_mu_pr||
                          wd in pqs_ne_pa_ed_mu_pr||wd in pqs_pe_pa_ed_mu_pr||wd in pqs_pe_sd_pa_ed_mu_pr||wd in pqs_pn_pa_ed_mu_pr||
                          wd in pq2_ne_vz_na_ed_mu_ro||wd in pq2_ne_vz_pa_ed_mu_ro||wd in pq2_ne_na_ed_mu_ro||wd in pq2_ne_pa_ed_mu_ro||
                          wd in pq2_pe_na_ed_mu_ro||wd in pq2_pe_pa_ed_mu_ro||wd in pq2_pe_sd_na_ed_mu_ro||wd in pq2_pe_sd_pa_ed_mu_ro||
                          wd in pq2_pn_na_ed_mu_ro||wd in pq2_pn_pa_ed_mu_ro||wd in pqn_ne_vz_na_ed_mu_ro||wd in pqn_ne_vz_pa_ed_mu_ro||
                          wd in pqn_ne_na_ed_mu_ro||wd in pqn_ne_pa_ed_mu_ro||wd in pqn_pe_na_ed_mu_ro||wd in pqn_pe_pa_ed_mu_ro||
                          wd in pqn_pe_sd_na_ed_mu_ro||wd in pqn_pe_sd_pa_ed_mu_ro||wd in pqn_pn_na_ed_mu_ro||wd in pqn_pn_pa_ed_mu_ro||
                          wd in pqs_ne_vz_pa_ed_mu_ro||wd in pqs_ne_pa_ed_mu_ro||wd in pqs_pe_pa_ed_mu_ro||wd in pqs_pe_sd_pa_ed_mu_ro||
                          wd in pqs_pn_pa_ed_mu_ro||wd in pq2_ne_vz_na_ed_mu_tv||wd in pq2_ne_vz_pa_ed_mu_tv||wd in pq2_ne_na_ed_mu_tv||
                          wd in pq2_ne_pa_ed_mu_tv||wd in pq2_pe_na_ed_mu_tv||wd in pq2_pe_pa_ed_mu_tv||wd in pq2_pe_sd_na_ed_mu_tv||
                          wd in pq2_pe_sd_pa_ed_mu_tv||wd in pq2_pn_na_ed_mu_tv||wd in pq2_pn_pa_ed_mu_tv||wd in pqn_ne_vz_na_ed_mu_tv||
                          wd in pqn_ne_vz_pa_ed_mu_tv||wd in pqn_ne_na_ed_mu_tv||wd in pqn_ne_pa_ed_mu_tv||wd in pqn_pe_na_ed_mu_tv||
                          wd in pqn_pe_pa_ed_mu_tv||wd in pqn_pe_sd_na_ed_mu_tv||wd in pqn_pe_sd_pa_ed_mu_tv||wd in pqn_pn_na_ed_mu_tv||
                          wd in pqn_pn_pa_ed_mu_tv||wd in pqs_ne_vz_pa_ed_mu_tv||wd in pqs_ne_pa_ed_mu_tv||wd in pqs_pe_pa_ed_mu_tv||
                          wd in pqs_pe_sd_pa_ed_mu_tv||wd in pqs_pn_pa_ed_mu_tv||wd in pq2_ne_vz_na_ed_sr_im||wd in pq2_ne_vz_pa_ed_sr_im||
                          wd in pq2_ne_na_ed_sr_im||wd in pq2_ne_pa_ed_sr_im||wd in pq2_pe_na_ed_sr_im||wd in pq2_pe_pa_ed_sr_im||
                          wd in pq2_pe_sd_na_ed_sr_im||wd in pq2_pe_sd_pa_ed_sr_im||wd in pq2_pn_na_ed_sr_im||wd in pq2_pn_pa_ed_sr_im||
                          wd in pqn_ne_vz_na_ed_sr_im||wd in pqn_ne_vz_pa_ed_sr_im||wd in pqn_ne_na_ed_sr_im||wd in pqn_ne_pa_ed_sr_im||
                          wd in pqn_pe_na_ed_sr_im||wd in pqn_pe_pa_ed_sr_im||wd in pqn_pe_sd_na_ed_sr_im||wd in pqn_pe_sd_pa_ed_sr_im||
                          wd in pqn_pn_na_ed_sr_im||wd in pqn_pn_pa_ed_sr_im||wd in pqs_ne_vz_pa_ed_sr_im||wd in pqs_ne_pa_ed_sr_im||
                          wd in pqs_pe_pa_ed_sr_im||wd in pqs_pe_sd_pa_ed_sr_im||wd in pqs_pn_pa_ed_sr_im||wd in pq2_ne_vz_na_ed_sr_da||
                          wd in pq2_ne_vz_pa_ed_sr_da||wd in pq2_ne_na_ed_sr_da||wd in pq2_ne_pa_ed_sr_da||wd in pq2_pe_na_ed_sr_da||
                          wd in pq2_pe_pa_ed_sr_da||wd in pq2_pe_sd_na_ed_sr_da||wd in pq2_pe_sd_pa_ed_sr_da||wd in pq2_pn_na_ed_sr_da||
                          wd in pq2_pn_pa_ed_sr_da||wd in pqn_ne_vz_na_ed_sr_da||wd in pqn_ne_vz_pa_ed_sr_da||wd in pqn_ne_na_ed_sr_da||
                          wd in pqn_ne_pa_ed_sr_da||wd in pqn_pe_na_ed_sr_da||wd in pqn_pe_pa_ed_sr_da||wd in pqn_pe_sd_na_ed_sr_da||
                          wd in pqn_pe_sd_pa_ed_sr_da||wd in pqn_pn_na_ed_sr_da||wd in pqn_pn_pa_ed_sr_da||wd in pqs_ne_vz_pa_ed_sr_da||
                          wd in pqs_ne_pa_ed_sr_da||wd in pqs_pe_pa_ed_sr_da||wd in pqs_pe_sd_pa_ed_sr_da||wd in pqs_pn_pa_ed_sr_da||
                          wd in pq2_ne_vz_na_ed_sr_im||wd in pq2_ne_vz_pa_ed_sr_im||wd in pq2_ne_na_ed_sr_im||wd in pq2_ne_pa_ed_sr_im||
                          wd in pq2_pe_na_ed_sr_im||wd in pq2_pe_pa_ed_sr_im||wd in pq2_pe_sd_na_ed_sr_im||wd in pq2_pe_sd_pa_ed_sr_im||
                          wd in pq2_pn_na_ed_sr_im||wd in pq2_pn_pa_ed_sr_im||wd in pqn_ne_vz_na_ed_sr_im||wd in pqn_ne_vz_pa_ed_sr_im||
                          wd in pqn_ne_na_ed_sr_im||wd in pqn_ne_pa_ed_sr_im||wd in pqn_pe_na_ed_sr_im||wd in pqn_pe_pa_ed_sr_im||
                          wd in pqn_pe_sd_na_ed_sr_im||wd in pqn_pe_sd_pa_ed_sr_im||wd in pqn_pn_na_ed_sr_im||wd in pqn_pn_pa_ed_sr_im||
                          wd in pqs_ne_vz_pa_ed_sr_im||wd in pqs_ne_pa_ed_sr_im||wd in pqs_pe_pa_ed_sr_im||wd in pqs_pe_sd_pa_ed_sr_im||
                          wd in pqs_pn_pa_ed_sr_im||wd in pq2_ne_vz_na_ed_sr_pr||wd in pq2_ne_vz_pa_ed_sr_pr||wd in pq2_ne_na_ed_sr_pr||
                          wd in pq2_ne_pa_ed_sr_pr||wd in pq2_pe_na_ed_sr_pr||wd in pq2_pe_pa_ed_sr_pr||wd in pq2_pe_sd_na_ed_sr_pr||
                          wd in pq2_pe_sd_pa_ed_sr_pr||wd in pq2_pn_na_ed_sr_pr||wd in pq2_pn_pa_ed_sr_pr||wd in pqn_ne_vz_na_ed_sr_pr||
                          wd in pqn_ne_vz_pa_ed_sr_pr||wd in pqn_ne_na_ed_sr_pr||wd in pqn_ne_pa_ed_sr_pr||wd in pqn_pe_na_ed_sr_pr||
                          wd in pqn_pe_pa_ed_sr_pr||wd in pqn_pe_sd_na_ed_sr_pr||wd in pqn_pe_sd_pa_ed_sr_pr||wd in pqn_pn_na_ed_sr_pr||
                          wd in pqn_pn_pa_ed_sr_pr||wd in pqs_ne_vz_pa_ed_sr_pr||wd in pqs_ne_pa_ed_sr_pr||wd in pqs_pe_pa_ed_sr_pr||
                          wd in pqs_pe_sd_pa_ed_sr_pr||wd in pqs_pn_pa_ed_sr_pr||wd in pq2_ne_vz_na_ed_sr_ro||wd in pq2_ne_vz_pa_ed_sr_ro||
                          wd in pq2_ne_na_ed_sr_ro||wd in pq2_ne_pa_ed_sr_ro||wd in pq2_pe_na_ed_sr_ro||wd in pq2_pe_pa_ed_sr_ro||
                          wd in pq2_pe_sd_na_ed_sr_ro||wd in pq2_pe_sd_pa_ed_sr_ro||wd in pq2_pn_na_ed_sr_ro||wd in pq2_pn_pa_ed_sr_ro||
                          wd in pqn_ne_vz_na_ed_sr_ro||wd in pqn_ne_vz_pa_ed_sr_ro||wd in pqn_ne_na_ed_sr_ro||wd in pqn_ne_pa_ed_sr_ro||
                          wd in pqn_pe_na_ed_sr_ro||wd in pqn_pe_pa_ed_sr_ro||wd in pqn_pe_sd_na_ed_sr_ro||wd in pqn_pe_sd_pa_ed_sr_ro||
                          wd in pqn_pn_na_ed_sr_ro||wd in pqn_pn_pa_ed_sr_ro||wd in pqs_ne_vz_pa_ed_sr_ro||wd in pqs_ne_pa_ed_sr_ro||
                          wd in pqs_pe_pa_ed_sr_ro||wd in pqs_pe_sd_pa_ed_sr_ro||wd in pqs_pn_pa_ed_sr_ro||wd in pq2_ne_vz_na_ed_sr_tv||
                          wd in pq2_ne_vz_pa_ed_sr_tv||wd in pq2_ne_na_ed_sr_tv||wd in pq2_ne_pa_ed_sr_tv||wd in pq2_pe_na_ed_sr_tv||
                          wd in pq2_pe_pa_ed_sr_tv||wd in pq2_pe_sd_na_ed_sr_tv||wd in pq2_pe_sd_pa_ed_sr_tv||wd in pq2_pn_na_ed_sr_tv||
                          wd in pq2_pn_pa_ed_sr_tv||wd in pqn_ne_vz_na_ed_sr_tv||wd in pqn_ne_vz_pa_ed_sr_tv||wd in pqn_ne_na_ed_sr_tv||
                          wd in pqn_ne_pa_ed_sr_tv||wd in pqn_pe_na_ed_sr_tv||wd in pqn_pe_pa_ed_sr_tv||wd in pqn_pe_sd_na_ed_sr_tv||
                          wd in pqn_pe_sd_pa_ed_sr_tv||wd in pqn_pn_na_ed_sr_tv||wd in pqn_pn_pa_ed_sr_tv||wd in pqs_ne_vz_pa_ed_sr_tv||
                          wd in pqs_ne_pa_ed_sr_tv||wd in pqs_pe_pa_ed_sr_tv||wd in pqs_pe_sd_pa_ed_sr_tv||wd in pqs_pn_pa_ed_sr_tv||
                          wd in pq2_ne_vz_na_mn_im||wd in pq2_ne_vz_pa_mn_im||wd in pq2_ne_na_mn_im||wd in pq2_ne_pa_mn_im||wd in pq2_pe_na_mn_im||
                          wd in pq2_pe_pa_mn_im||wd in pq2_pe_sd_na_mn_im||wd in pq2_pe_sd_pa_mn_im||wd in pq2_pn_na_mn_im||wd in pq2_pn_pa_mn_im||
                          wd in pqn_ne_vz_na_mn_im||wd in pqn_ne_vz_pa_mn_im||wd in pqn_ne_na_mn_im||wd in pqn_ne_pa_mn_im||wd in pqn_pe_na_mn_im||
                          wd in pqn_pe_pa_mn_im||wd in pqn_pe_sd_na_mn_im||wd in pqn_pe_sd_pa_mn_im||wd in pqn_pn_na_mn_im||wd in pqn_pn_pa_mn_im||
                          wd in pqs_ne_vz_pa_mn_im||wd in pqs_ne_pa_mn_im||wd in pqs_pe_pa_mn_im||wd in pqs_pe_sd_pa_mn_im||wd in pqs_pn_pa_mn_im||
                          wd in pq2_ne_vz_na_mn_ro||wd in pq2_ne_vz_pa_mn_ro||wd in pq2_ne_na_mn_ro||wd in pq2_ne_pa_mn_ro||wd in pq2_pe_na_mn_ro||
                          wd in pq2_pe_pa_mn_ro||wd in pq2_pe_sd_na_mn_ro||wd in pq2_pe_sd_pa_mn_ro||wd in pq2_pn_na_mn_ro||wd in pq2_pn_pa_mn_ro||
                          wd in pqn_ne_vz_na_mn_ro||wd in pqn_ne_vz_pa_mn_ro||wd in pqn_ne_na_mn_ro||wd in pqn_ne_pa_mn_ro||wd in pqn_pe_na_mn_ro||
                          wd in pqn_pe_pa_mn_ro||wd in pqn_pe_sd_na_mn_ro||wd in pqn_pe_sd_pa_mn_ro||wd in pqn_pn_na_mn_ro||wd in pqn_pn_pa_mn_ro||
                          wd in pqs_ne_vz_pa_mn_ro||wd in pqs_ne_pa_mn_ro||wd in pqs_pe_pa_mn_ro||wd in pqs_pe_sd_pa_mn_ro||wd in pqs_pn_pa_mn_ro||
                          wd in pq2_ne_vz_na_mn_da||wd in pq2_ne_vz_pa_mn_da||wd in pq2_ne_na_mn_da||wd in pq2_ne_pa_mn_da||wd in pq2_pe_na_mn_da||
                          wd in pq2_pe_pa_mn_da||wd in pq2_pe_sd_na_mn_da||wd in pq2_pe_sd_pa_mn_da||wd in pq2_pn_na_mn_da||wd in pq2_pn_pa_mn_da||
                          wd in pqn_ne_vz_na_mn_da||wd in pqn_ne_vz_pa_mn_da||wd in pqn_ne_na_mn_da||wd in pqn_ne_pa_mn_da||wd in pqn_pe_na_mn_da||
                          wd in pqn_pe_pa_mn_da||wd in pqn_pe_sd_na_mn_da||wd in pqn_pe_sd_pa_mn_da||wd in pqn_pn_na_mn_da||wd in pqn_pn_pa_mn_da||
                          wd in pqs_ne_vz_pa_mn_da||wd in pqs_ne_pa_mn_da||wd in pqs_pe_pa_mn_da||wd in pqs_pe_sd_pa_mn_da||wd in pqs_pn_pa_mn_da||
                          wd in pq2_ne_vz_na_mn_im||wd in pq2_ne_vz_pa_mn_im||wd in pq2_ne_na_mn_im||wd in pq2_ne_pa_mn_im||wd in pq2_pe_na_mn_im||
                          wd in pq2_pe_pa_mn_im||wd in pq2_pe_sd_na_mn_im||wd in pq2_pe_sd_pa_mn_im||wd in pq2_pn_na_mn_im||wd in pq2_pn_pa_mn_im||
                          wd in pqn_ne_vz_na_mn_im||wd in pqn_ne_vz_pa_mn_im||wd in pqn_ne_na_mn_im||wd in pqn_ne_pa_mn_im||wd in pqn_pe_na_mn_im||
                          wd in pqn_pe_pa_mn_im||wd in pqn_pe_sd_na_mn_im||wd in pqn_pe_sd_pa_mn_im||wd in pqn_pn_na_mn_im||wd in pqn_pn_pa_mn_im||
                          wd in pqs_ne_vz_pa_mn_im||wd in pqs_ne_pa_mn_im||wd in pqs_pe_pa_mn_im||wd in pqs_pe_sd_pa_mn_im||wd in pqs_pn_pa_mn_im||
                          wd in pq2_ne_vz_na_mn_ro||wd in pq2_ne_vz_pa_mn_ro||wd in pq2_ne_na_mn_ro||wd in pq2_ne_pa_mn_ro||wd in pq2_pe_na_mn_ro||
                          wd in pq2_pe_pa_mn_ro||wd in pq2_pe_sd_na_mn_ro||wd in pq2_pe_sd_pa_mn_ro||wd in pq2_pn_na_mn_ro||wd in pq2_pn_pa_mn_ro||
                          wd in pqn_ne_vz_na_mn_ro||wd in pqn_ne_vz_pa_mn_ro||wd in pqn_ne_na_mn_ro||wd in pqn_ne_pa_mn_ro||wd in pqn_pe_na_mn_ro||
                          wd in pqn_pe_pa_mn_ro||wd in pqn_pe_sd_na_mn_ro||wd in pqn_pe_sd_pa_mn_ro||wd in pqn_pn_na_mn_ro||wd in pqn_pn_pa_mn_ro||
                          wd in pqs_ne_vz_pa_mn_ro||wd in pqs_ne_pa_mn_ro||wd in pqs_pe_pa_mn_ro||wd in pqs_pe_sd_pa_mn_ro||wd in pqs_pn_pa_mn_ro||
                          wd in pq2_ne_vz_na_mn_ro||wd in pq2_ne_vz_pa_mn_ro||wd in pq2_ne_na_mn_ro||wd in pq2_ne_pa_mn_ro||wd in pq2_pe_na_mn_ro||
                          wd in pq2_pe_pa_mn_ro||wd in pq2_pe_sd_na_mn_ro||wd in pq2_pe_sd_pa_mn_ro||wd in pq2_pn_na_mn_ro||wd in pq2_pn_pa_mn_ro||
                          wd in pqn_ne_vz_na_mn_ro||wd in pqn_ne_vz_pa_mn_ro||wd in pqn_ne_na_mn_ro||wd in pqn_ne_pa_mn_ro||wd in pqn_pe_na_mn_ro||
                          wd in pqn_pe_pa_mn_ro||wd in pqn_pe_sd_na_mn_ro||wd in pqn_pe_sd_pa_mn_ro||wd in pqn_pn_na_mn_ro||wd in pqn_pn_pa_mn_ro||
                          wd in pqs_ne_vz_pa_mn_ro||wd in pqs_ne_pa_mn_ro||wd in pqs_pe_pa_mn_ro||wd in pqs_pe_sd_pa_mn_ro||wd in pqs_pn_pa_mn_ro||
                          wd in pq2_ne_vz_na_mn_tv||wd in pq2_ne_vz_pa_mn_tv||wd in pq2_ne_na_mn_tv||wd in pq2_ne_pa_mn_tv||wd in pq2_pe_na_mn_tv||
                          wd in pq2_pe_pa_mn_tv||wd in pq2_pe_sd_na_mn_tv||wd in pq2_pe_sd_pa_mn_tv||wd in pq2_pn_na_mn_tv||wd in pq2_pn_pa_mn_tv||
                          wd in pqn_ne_vz_na_mn_tv||wd in pqn_ne_vz_pa_mn_tv||wd in pqn_ne_na_mn_tv||wd in pqn_ne_pa_mn_tv||wd in pqn_pe_na_mn_tv||
                          wd in pqn_pe_pa_mn_tv||wd in pqn_pe_sd_na_mn_tv||wd in pqn_pe_sd_pa_mn_tv||wd in pqn_pn_na_mn_tv||wd in pqn_pn_pa_mn_tv||
                          wd in pqs_ne_vz_pa_mn_tv||wd in pqs_ne_pa_mn_tv||wd in pqs_pe_pa_mn_tv||wd in pqs_pe_sd_pa_mn_tv||wd in pqs_pn_pa_mn_tv||
                          wd in pq2_na_kred_ze||wd in pq2_pa_kred_ze||wd in pqn_na_kred_ze||wd in pqn_pa_kred_ze||wd in pqs_pa_kred_ze||
                          wd in pq2_na_kred_mu||wd in pq2_pa_kred_mu||wd in pqn_na_kred_mu||wd in pqn_pa_kred_mu||wd in pqs_pa_kred_mu||
                          wd in pq2_na_kred_sr||wd in pq2_pa_kred_sr||wd in pqn_na_kred_sr||wd in pqn_pa_kred_sr||wd in pqs_pa_kred_sr||
                          wd in pq2_na_krmn||wd in pq2_pa_krmn||wd in pqn_na_krmn||wd in pqn_pa_krmn||wd in pqs_pa_krmn)                                {rett=1} else {rett=0}; return rett}

function prq_pe(n,                                                                                                                                      wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_pe_na_ed_mu_da||wd in pq2_pe_na_ed_mu_im||wd in pq2_pe_na_ed_mu_pr||wd in pq2_pe_na_ed_mu_ro||wd in pq2_pe_na_ed_mu_tv||
                          wd in pq2_pe_na_ed_sr_da||wd in pq2_pe_na_ed_sr_im||wd in pq2_pe_na_ed_sr_pr||wd in pq2_pe_na_ed_sr_ro||wd in pq2_pe_na_ed_sr_tv||
                          wd in pq2_pe_na_ed_ze_dr||wd in pq2_pe_na_ed_ze_im||wd in pq2_pe_na_ed_ze_tv||wd in pq2_pe_na_ed_ze_vi||wd in pq2_pe_na_mn_da||
                          wd in pq2_pe_na_mn_im||wd in pq2_pe_na_mn_ro||wd in pq2_pe_na_mn_tv||wd in pq2_pe_pa_ed_mu_da||wd in pq2_pe_pa_ed_mu_im||
                          wd in pq2_pe_pa_ed_mu_pr||wd in pq2_pe_pa_ed_mu_ro||wd in pq2_pe_pa_ed_mu_tv||wd in pq2_pe_pa_ed_sr_da||wd in pq2_pe_pa_ed_sr_im||
                          wd in pq2_pe_pa_ed_sr_pr||wd in pq2_pe_pa_ed_sr_ro||wd in pq2_pe_pa_ed_sr_tv||wd in pq2_pe_pa_ed_ze_dr||wd in pq2_pe_pa_ed_ze_im||
                          wd in pq2_pe_pa_ed_ze_tv||wd in pq2_pe_pa_ed_ze_vi||wd in pq2_pe_pa_mn_da||wd in pq2_pe_pa_mn_im||wd in pq2_pe_pa_mn_ro||
                          wd in pq2_pe_pa_mn_tv||wd in pq2_pe_sd_na_ed_mu_da||wd in pq2_pe_sd_na_ed_mu_im||wd in pq2_pe_sd_na_ed_mu_pr||
                          wd in pq2_pe_sd_na_ed_mu_ro||wd in pq2_pe_sd_na_ed_mu_tv||wd in pq2_pe_sd_na_ed_sr_da||wd in pq2_pe_sd_na_ed_sr_im||
                          wd in pq2_pe_sd_na_ed_sr_pr||wd in pq2_pe_sd_na_ed_sr_ro||wd in pq2_pe_sd_na_ed_sr_tv||wd in pq2_pe_sd_na_ed_ze_dr||
                          wd in pq2_pe_sd_na_ed_ze_im||wd in pq2_pe_sd_na_ed_ze_tv||wd in pq2_pe_sd_na_ed_ze_vi||wd in pq2_pe_sd_na_mn_da||
                          wd in pq2_pe_sd_na_mn_im||wd in pq2_pe_sd_na_mn_ro||wd in pq2_pe_sd_na_mn_tv||wd in pq2_pe_sd_pa_ed_mu_da||
                          wd in pq2_pe_sd_pa_ed_mu_im||wd in pq2_pe_sd_pa_ed_mu_pr||wd in pq2_pe_sd_pa_ed_mu_ro||wd in pq2_pe_sd_pa_ed_mu_tv||
                          wd in pq2_pe_sd_pa_ed_sr_da||wd in pq2_pe_sd_pa_ed_sr_im||wd in pq2_pe_sd_pa_ed_sr_pr||wd in pq2_pe_sd_pa_ed_sr_ro||
                          wd in pq2_pe_sd_pa_ed_sr_tv||wd in pq2_pe_sd_pa_ed_ze_dr||wd in pq2_pe_sd_pa_ed_ze_im||wd in pq2_pe_sd_pa_ed_ze_tv||
                          wd in pq2_pe_sd_pa_ed_ze_vi||wd in pq2_pe_sd_pa_mn_da||wd in pq2_pe_sd_pa_mn_im||wd in pq2_pe_sd_pa_mn_ro||
                          wd in pq2_pe_sd_pa_mn_tv||wd in pqn_pe_na_ed_mu_da||wd in pqn_pe_na_ed_mu_im||wd in pqn_pe_na_ed_mu_pr||wd in pqn_pe_na_ed_mu_ro||
                          wd in pqn_pe_na_ed_mu_tv||wd in pqn_pe_na_ed_sr_da||wd in pqn_pe_na_ed_sr_im||wd in pqn_pe_na_ed_sr_pr||wd in pqn_pe_na_ed_sr_ro||
                          wd in pqn_pe_na_ed_sr_tv||wd in pqn_pe_na_ed_ze_dr||wd in pqn_pe_na_ed_ze_im||wd in pqn_pe_na_ed_ze_tv||wd in pqn_pe_na_ed_ze_vi||
                          wd in pqn_pe_na_mn_da||wd in pqn_pe_na_mn_im||wd in pqn_pe_na_mn_ro||wd in pqn_pe_na_mn_tv||wd in pqn_pe_pa_ed_mu_da||
                          wd in pqn_pe_pa_ed_mu_im||wd in pqn_pe_pa_ed_mu_pr||wd in pqn_pe_pa_ed_mu_ro||wd in pqn_pe_pa_ed_mu_tv||wd in pqn_pe_pa_ed_sr_da||
                          wd in pqn_pe_pa_ed_sr_im||wd in pqn_pe_pa_ed_sr_pr||wd in pqn_pe_pa_ed_sr_ro||wd in pqn_pe_pa_ed_sr_tv||wd in pqn_pe_pa_ed_ze_dr||
                          wd in pqn_pe_pa_ed_ze_im||wd in pqn_pe_pa_ed_ze_tv||wd in pqn_pe_pa_ed_ze_vi||wd in pqn_pe_pa_mn_da||wd in pqn_pe_pa_mn_im||
                          wd in pqn_pe_pa_mn_ro||wd in pqn_pe_pa_mn_tv||wd in pqn_pe_sd_na_ed_mu_da||wd in pqn_pe_sd_na_ed_mu_im||wd in pqn_pe_sd_na_ed_mu_pr||
                          wd in pqn_pe_sd_na_ed_mu_ro||wd in pqn_pe_sd_na_ed_mu_tv||wd in pqn_pe_sd_na_ed_sr_da||wd in pqn_pe_sd_na_ed_sr_im||
                          wd in pqn_pe_sd_na_ed_sr_pr||wd in pqn_pe_sd_na_ed_sr_ro||wd in pqn_pe_sd_na_ed_sr_tv||wd in pqn_pe_sd_na_ed_ze_dr||
                          wd in pqn_pe_sd_na_ed_ze_im||wd in pqn_pe_sd_na_ed_ze_tv||wd in pqn_pe_sd_na_ed_ze_vi||wd in pqn_pe_sd_na_mn_da||
                          wd in pqn_pe_sd_na_mn_im||wd in pqn_pe_sd_na_mn_ro||wd in pqn_pe_sd_na_mn_tv||wd in pqn_pe_sd_pa_ed_mu_da||
                          wd in pqn_pe_sd_pa_ed_mu_im||wd in pqn_pe_sd_pa_ed_mu_pr||wd in pqn_pe_sd_pa_ed_mu_ro||wd in pqn_pe_sd_pa_ed_mu_tv||
                          wd in pqn_pe_sd_pa_ed_sr_da||wd in pqn_pe_sd_pa_ed_sr_im||wd in pqn_pe_sd_pa_ed_sr_pr||wd in pqn_pe_sd_pa_ed_sr_ro||
                          wd in pqn_pe_sd_pa_ed_sr_tv||wd in pqn_pe_sd_pa_ed_ze_dr||wd in pqn_pe_sd_pa_ed_ze_im||wd in pqn_pe_sd_pa_ed_ze_tv||
                          wd in pqn_pe_sd_pa_ed_ze_vi||wd in pqn_pe_sd_pa_mn_da||wd in pqn_pe_sd_pa_mn_im||wd in pqn_pe_sd_pa_mn_ro||wd in pqn_pe_sd_pa_mn_tv||
                          wd in pqs_pe_pa_ed_mu_da||wd in pqs_pe_pa_ed_mu_im||wd in pqs_pe_pa_ed_mu_pr||wd in pqs_pe_pa_ed_mu_ro||wd in pqs_pe_pa_ed_mu_tv||
                          wd in pqs_pe_pa_ed_sr_da||wd in pqs_pe_pa_ed_sr_im||wd in pqs_pe_pa_ed_sr_pr||wd in pqs_pe_pa_ed_sr_ro||wd in pqs_pe_pa_ed_sr_tv||
                          wd in pqs_pe_pa_ed_ze_dr||wd in pqs_pe_pa_ed_ze_im||wd in pqs_pe_pa_ed_ze_tv||wd in pqs_pe_pa_ed_ze_vi||wd in pqs_pe_pa_mn_da||
                          wd in pqs_pe_pa_mn_im||wd in pqs_pe_pa_mn_ro||wd in pqs_pe_pa_mn_tv||wd in pqs_pe_sd_pa_ed_mu_da||wd in pqs_pe_sd_pa_ed_mu_im||
                          wd in pqs_pe_sd_pa_ed_mu_pr||wd in pqs_pe_sd_pa_ed_mu_ro||wd in pqs_pe_sd_pa_ed_mu_tv||wd in pqs_pe_sd_pa_ed_sr_da||
                          wd in pqs_pe_sd_pa_ed_sr_im||wd in pqs_pe_sd_pa_ed_sr_pr||wd in pqs_pe_sd_pa_ed_sr_ro||wd in pqs_pe_sd_pa_ed_sr_tv||
                          wd in pqs_pe_sd_pa_ed_ze_dr||wd in pqs_pe_sd_pa_ed_ze_im||wd in pqs_pe_sd_pa_ed_ze_tv||wd in pqs_pe_sd_pa_ed_ze_vi||
                          wd in pqs_pe_sd_pa_mn_da||wd in pqs_pe_sd_pa_mn_im||wd in pqs_pe_sd_pa_mn_ro||wd in pqs_pe_sd_pa_mn_tv||wd in pq2_na_kred_mu||
                          wd in pq2_pa_kred_mu||wd in pqn_na_kred_mu||wd in pqn_pa_kred_mu||wd in pqs_pa_kred_mu||wd in pq2_na_kred_ze||wd in pq2_pa_kred_ze||
                          wd in pqn_na_kred_ze||wd in pqn_pa_kred_ze||wd in pqs_pa_kred_ze||wd in pq2_na_kred_sr||wd in pq2_pa_kred_sr||wd in pqn_na_kred_sr||
                          wd in pqn_pa_kred_sr||wd in pqs_pa_kred_sr||wd in pq2_na_krmn||wd in pq2_pa_krmn||wd in pqn_na_krmn||wd in pqn_pa_krmn||
                          wd in pqs_pa_krmn)                                                                                                         {rett=1} else {rett=0}; return rett}
function prq_pn(n,                                                                                                                                   wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in pq2_pn_na_ed_mu_da||wd in pq2_pn_na_ed_mu_im||wd in pq2_pn_na_ed_mu_pr||wd in pq2_pn_na_ed_mu_ro||wd in pq2_pn_na_ed_mu_tv||
                          wd in pq2_pn_na_ed_sr_da||wd in pq2_pn_na_ed_sr_im||wd in pq2_pn_na_ed_sr_pr||wd in pq2_pn_na_ed_sr_ro||wd in pq2_pn_na_ed_sr_tv||
                          wd in pq2_pn_na_ed_ze_dr||wd in pq2_pn_na_ed_ze_im||wd in pq2_pn_na_ed_ze_tv||wd in pq2_pn_na_ed_ze_vi||wd in pq2_pn_na_mn_da||
                          wd in pq2_pn_na_mn_im||wd in pq2_pn_na_mn_ro||wd in pq2_pn_na_mn_tv||wd in pq2_pn_pa_ed_mu_da||wd in pq2_pn_pa_ed_mu_im||
                          wd in pq2_pn_pa_ed_mu_pr||wd in pq2_pn_pa_ed_mu_ro||wd in pq2_pn_pa_ed_mu_tv||wd in pq2_pn_pa_ed_sr_da||wd in pq2_pn_pa_ed_sr_im||
                          wd in pq2_pn_pa_ed_sr_pr||wd in pq2_pn_pa_ed_sr_ro||wd in pq2_pn_pa_ed_sr_tv||wd in pq2_pn_pa_ed_ze_dr||wd in pq2_pn_pa_ed_ze_im||
                          wd in pq2_pn_pa_ed_ze_tv||wd in pq2_pn_pa_ed_ze_vi||wd in pq2_pn_pa_mn_da||wd in pq2_pn_pa_mn_im||wd in pq2_pn_pa_mn_ro||
                          wd in pq2_pn_pa_mn_tv||wd in pqn_pn_na_ed_mu_da||wd in pqn_pn_na_ed_mu_im||wd in pqn_pn_na_ed_mu_pr||wd in pqn_pn_na_ed_mu_ro||
                          wd in pqn_pn_na_ed_mu_tv||wd in pqn_pn_na_ed_sr_da||wd in pqn_pn_na_ed_sr_im||wd in pqn_pn_na_ed_sr_pr||wd in pqn_pn_na_ed_sr_ro||
                          wd in pqn_pn_na_ed_sr_tv||wd in pqn_pn_na_ed_ze_dr||wd in pqn_pn_na_ed_ze_im||wd in pqn_pn_na_ed_ze_tv||wd in pqn_pn_na_ed_ze_vi||
                          wd in pqn_pn_na_mn_da||wd in pqn_pn_na_mn_im||wd in pqn_pn_na_mn_ro||wd in pqn_pn_na_mn_tv||wd in pqn_pn_pa_ed_mu_da||
                          wd in pqn_pn_pa_ed_mu_im||wd in pqn_pn_pa_ed_mu_pr||wd in pqn_pn_pa_ed_mu_ro||wd in pqn_pn_pa_ed_mu_tv||wd in pqn_pn_pa_ed_sr_da||
                          wd in pqn_pn_pa_ed_sr_im||wd in pqn_pn_pa_ed_sr_pr||wd in pqn_pn_pa_ed_sr_ro||wd in pqn_pn_pa_ed_sr_tv||wd in pqn_pn_pa_ed_ze_dr||
                          wd in pqn_pn_pa_ed_ze_im||wd in pqn_pn_pa_ed_ze_tv||wd in pqn_pn_pa_ed_ze_vi||wd in pqn_pn_pa_mn_da||wd in pqn_pn_pa_mn_im||
                          wd in pqn_pn_pa_mn_ro||wd in pqn_pn_pa_mn_tv||wd in pqs_pn_pa_ed_mu_da||wd in pqs_pn_pa_ed_mu_im||wd in pqs_pn_pa_ed_mu_pr||
                          wd in pqs_pn_pa_ed_mu_ro||wd in pqs_pn_pa_ed_mu_tv||wd in pqs_pn_pa_ed_sr_da||wd in pqs_pn_pa_ed_sr_im||wd in pqs_pn_pa_ed_sr_pr||
                          wd in pqs_pn_pa_ed_sr_ro||wd in pqs_pn_pa_ed_sr_tv||wd in pqs_pn_pa_ed_ze_dr||wd in pqs_pn_pa_ed_ze_im||wd in pqs_pn_pa_ed_ze_tv||
                          wd in pqs_pn_pa_ed_ze_vi||wd in pqs_pn_pa_mn_da||wd in pqs_pn_pa_mn_im||wd in pqs_pn_pa_mn_ro||wd in pqs_pn_pa_mn_tv)  {rett=1} else {rett=0}; return rett}


# деепричастия
function deep(n,                                                                                                                               wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in dps_pe_pa||wd in dps_vz_ne_pa||wd in dpn_vz_ne_na||wd in dpn_pe_na||wd in dps_ne_pa||wd in dps_pn_pa||
                          wd in dpn_ne_na||wd in dpn_pn_na||wd in dpn_pe_pa||wd in dpn_pn_pa||wd in dpn_ne_pa)                                 {rett=1} else {rett=0}; return rett}
function deep_ne(n,       wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in dps_vz_ne_pa||wd in dpn_vz_ne_na||wd in dps_ne_pa||wd in dpn_ne_na||wd in dpn_ne_pa)                           {rett=1} else {rett=0}; return rett}
function deep_pe(n,       wd,rett) { if(!(wd))wd=lc(n); if (wd in dps_pe_pa||wd in dpn_pe_na||wd in dpn_pe_pa)                                 {rett=1} else {rett=0}; return rett}
function deep_pn(n,       wd,rett) { if(!(wd))wd=lc(n); if (wd in dps_pn_pa||wd in dpn_pn_na||wd in dpn_pn_pa)                                 {rett=1} else {rett=0}; return rett}
function deep_pa(n,       wd,rett) { if(!(wd))wd=lc(n); if (wd in dps_pe_pa||wd in dps_pn_pa||wd in dpn_pe_pa||wd in dpn_pn_pa)                {rett=1} else {rett=0}; return rett}
function deep_na(n,       wd,rett) { if(!(wd))wd=lc(n); if (wd in dpn_pe_na||wd in dpn_pn_na)                                                  {rett=1} else {rett=0}; return rett}

# глаголы
function gl_ed(n,                                                                                                                              wd,rett) { if(!(wd))wd=lc(n);
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
                          wd in g2_pnna_e3||wd in g2_pnpa_edze||wd in g2_pnpa_edmu||wd in g2_pnpa_edsr)                                         {rett=1} else {rett=0}; return rett}
function gl_naed(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nena_e1||wd in gn_vz_nena_e2||wd in gn_vz_nena_e3||wd in gn_nena_e1||wd in gn_nena_e2||wd in gn_nena_e3||
                          wd in gn_pena_e1||wd in gn_pena_e2||wd in gn_pena_e3||wd in gn_pnna_e1||wd in gn_pnna_e2||wd in gn_pnna_e3||
                          wd in g2_pena_e1||wd in g2_pena_e2||wd in g2_pena_e3||wd in g2_vz_nena_e1||wd in g2_vz_nena_e2||wd in g2_vz_nena_e3||
                          wd in g2_nena_e1||wd in g2_nena_e2||wd in g2_nena_e3||wd in g2_pnna_e1||wd in g2_pnna_e2||wd in g2_pnna_e3)           {rett=1} else {rett=0}; return rett}
function gl_naneed(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nena_e1||wd in gn_vz_nena_e2||wd in gn_vz_nena_e3||wd in gn_nena_e1||wd in gn_nena_e2||wd in gn_nena_e3||
                          wd in g2_vz_nena_e1||wd in g2_vz_nena_e2||wd in g2_vz_nena_e3||wd in g2_nena_e1||wd in g2_nena_e2||wd in g2_nena_e3)  {rett=1} else {rett=0}; return rett}
function gl_paed(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nepa_edze||wd in gn_vz_nepa_edmu||wd in gn_vz_nepa_edsr||wd in gn_nepa_edze||wd in gn_nepa_edmu||
                          wd in gn_nepa_edsr||wd in gn_pepa_edze||wd in gn_pepa_edmu||wd in gn_pepa_edsr||wd in gn_pnpa_edze||
                          wd in gn_pnpa_edmu||wd in gn_pnpa_edsr||wd in gs_vz_nepa_edze||wd in gs_vz_nepa_edmu||wd in gs_vz_nepa_edsr||
                          wd in gs_nepa_edze||wd in gs_nepa_edmu||wd in gs_nepa_edsr||wd in gs_pepa_edze||wd in gs_pepa_edmu||
                          wd in gs_pepa_edsr||wd in gs_pnpa_edze||wd in gs_pnpa_edmu||wd in gs_pnpa_edsr||wd in g2_pepa_edze||
                          wd in g2_pepa_edmu||wd in g2_pepa_edsr||wd in g2_vz_nepa_edze||wd in g2_vz_nepa_edmu||wd in g2_vz_nepa_edsr||
                          wd in g2_nepa_edze||wd in g2_nepa_edmu||wd in g2_nepa_edsr||wd in g2_pnpa_edze||wd in g2_pnpa_edmu||
                          wd in g2_pnpa_edsr)                                                                                                   {rett=1} else {rett=0}; return rett}
function gl_paneed(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_pepa_edze||wd in gn_pepa_edmu||wd in gn_pepa_edsr||wd in gs_pepa_edze||wd in gs_pepa_edmu||
                          wd in gs_pepa_edsr||wd in g2_pepa_edze||wd in g2_pepa_edmu||wd in g2_pepa_edsr)                                       {rett=1} else {rett=0}; return rett}
function gl_bued(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gs_nebu_e1||wd in gs_nebu_e2||wd in gs_nebu_e3||wd in gs_vz_nebu_e1||wd in gs_vz_nebu_e2||wd in gs_vz_nebu_e3||
                          wd in gs_pebu_e1||wd in gs_pebu_e2||wd in gs_pebu_e3||wd in gs_pnbu_e1||wd in gs_pnbu_e2||wd in gs_pnbu_e3||
                          wd in g2_pebu_e1||wd in g2_pebu_e2||wd in g2_pebu_e3||wd in g2_nebu_e1||wd in g2_nebu_e2||wd in g2_nebu_e3||
                          wd in g2_vz_nebu_e1||wd in g2_vz_nebu_e2||wd in g2_vz_nebu_e3||wd in g2_pnbu_e1||wd in g2_pnbu_e2||wd in g2_pnbu_e3)  {rett=1} else {rett=0}; return rett}
function gl_paedmu(n,     wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nepa_edmu||wd in gn_nepa_edmu||wd in gn_pepa_edmu||wd in gn_pnpa_edmu||wd in gs_vz_nepa_edmu||
                          wd in gs_nepa_edmu||wd in gs_pepa_edmu||wd in gs_pnpa_edmu||wd in g2_pepa_edmu||wd in g2_vz_nepa_edmu||
                          wd in g2_nepa_edmu||wd in g2_pnpa_edmu)                                                                               {rett=1} else {rett=0}; return rett}
function gl_paedsr(n,     wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nepa_edsr||wd in gn_nepa_edsr||wd in gn_pepa_edsr||wd in gn_pnpa_edsr||wd in gs_vz_nepa_edsr||
                          wd in gs_nepa_edsr||wd in gs_pepa_edsr||wd in gs_pnpa_edsr||wd in g2_pepa_edsr||wd in g2_vz_nepa_edsr||
                          wd in g2_nepa_edsr||wd in g2_pnpa_edsr)                                                                               {rett=1} else {rett=0}; return rett}
function gl_paedze(n,     wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nepa_edze||wd in gn_nepa_edze||wd in gn_pepa_edze||wd in gn_pnpa_edze||wd in gs_vz_nepa_edze||
                          wd in gs_nepa_edze||wd in gs_pepa_edze||wd in gs_pnpa_edze||wd in g2_pepa_edze||wd in g2_vz_nepa_edze||
                          wd in g2_nepa_edze||wd in g2_pnpa_edze)                                                                               {rett=1} else {rett=0}; return rett}
function gl_peed(n,       wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_pena_e1||wd in gn_pena_e2||wd in gn_pena_e3||wd in gn_pepa_edze||wd in gn_pepa_edmu||wd in gn_pepa_edsr||
                          wd in gs_pebu_e1||wd in gs_pebu_e2||wd in gs_pebu_e3||wd in gs_pepa_edze||wd in gs_pepa_edmu||wd in gs_pepa_edsr||
                          wd in g2_pebu_e1||wd in g2_pebu_e2||wd in g2_pebu_e3||wd in g2_pena_e1||wd in g2_pena_e2||wd in g2_pena_e3||
                          wd in g2_pepa_edze||wd in g2_pepa_edmu||wd in g2_pepa_edsr)                                                           {rett=1} else {rett=0}; return rett}
function gl_pned(n,       wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_pnna_e1||wd in gn_pnna_e2||wd in gn_pnna_e3||wd in gn_pnpa_edze||wd in gn_pnpa_edmu||wd in gn_pnpa_edsr||
                          wd in gs_pnbu_e1||wd in gs_pnbu_e2||wd in gs_pnbu_e3||wd in gs_pnpa_edze||wd in gs_pnpa_edmu||wd in gs_pnpa_edsr||
                          wd in g2_pnbu_e1||wd in g2_pnbu_e2||wd in g2_pnbu_e3||wd in g2_pnna_e1||wd in g2_pnna_e2||wd in g2_pnna_e3||
                          wd in g2_pnpa_edze||wd in g2_pnpa_edmu||wd in g2_pnpa_edsr)                                                           {rett=1} else {rett=0}; return rett}
function gl_need(n,       wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nena_e1||wd in gn_vz_nena_e2||wd in gn_vz_nena_e3||wd in gn_vz_nepa_edze||wd in gn_vz_nepa_edmu||
                          wd in gn_vz_nepa_edsr||wd in gn_nena_e1||wd in gn_nena_e2||wd in gn_nena_e3||wd in gn_nepa_edze||wd in gn_nepa_edmu||
                          wd in gn_nepa_edsr||wd in gs_nebu_e1||wd in gs_nebu_e2||wd in gs_nebu_e3||wd in gs_vz_nebu_e1||wd in gs_vz_nebu_e2||
                          wd in gs_vz_nebu_e3||wd in gs_vz_nepa_edze||wd in gs_vz_nepa_edmu||wd in gs_vz_nepa_edsr||wd in gs_nepa_edze||
                          wd in gs_nepa_edmu||wd in gs_nepa_edsr||wd in g2_nebu_e1||wd in g2_nebu_e2||wd in g2_nebu_e3||wd in g2_vz_nebu_e1||
                          wd in g2_vz_nebu_e2||wd in g2_vz_nebu_e3||wd in g2_vz_nena_e1||wd in g2_vz_nena_e2||wd in g2_vz_nena_e3||
                          wd in g2_vz_nepa_edze||wd in g2_vz_nepa_edmu||wd in g2_vz_nepa_edsr||wd in g2_nena_e1||wd in g2_nena_e2||
                          wd in g2_nena_e3||wd in g2_nepa_edze||wd in g2_nepa_edmu||wd in g2_nepa_edsr)                                         {rett=1} else {rett=0}; return rett}
function gl_in(n,         wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_ne_in||wd in gn_nein||wd in gn_nein_bz||wd in gn_vz_nein_bz||wd in gn_pein||wd in gn_pein_bz||
                          wd in gn_pnin||wd in gs_vz_nein||wd in gs_nein||wd in gs_vz_nein_bz||wd in gs_nein_bz||wd in gs_pein||
                          wd in gs_pein_bz||wd in gs_pnin||wd in g2_pein||wd in g2_vz_nein||wd in g2_nein||wd in g2_pnin)                       {rett=1} else {rett=0}; return rett}
function gl_pein(n,       wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_pein||wd in gn_pein_bz||wd in gs_pein||wd in gs_pein_bz||wd in g2_pein)                                      {rett=1} else {rett=0}; return rett}
function gl_pnin(n,       wd,rett) { if(!(wd))wd=lc(n); if (wd in gn_pnin||wd in gs_pnin||wd in g2_pnin)                                        {rett=1} else {rett=0}; return rett}
function gl_nein(n,       wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_ne_in||wd in gn_nein||wd in gn_nein_bz||wd in gn_vz_nein_bz||wd in gs_vz_nein||wd in gs_nein||
                          wd in gs_vz_nein_bz||wd in gs_nein_bz||wd in g2_vz_nein||wd in g2_nein)                                               {rett=1} else {rett=0}; return rett}
function gl_vzed(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nena_e1||wd in gn_vz_nena_e2||wd in gn_vz_nena_e3||wd in gn_vz_nepo_ed||wd in gn_vz_nepa_edze||
                          wd in gn_vz_nepa_edmu||wd in gn_vz_nepa_edsr||wd in gs_vz_nebu_e1||wd in gs_vz_nebu_e2||wd in gs_vz_nebu_e3||
                          wd in gs_vz_nepo_ed||wd in gs_vz_nepa_edze||wd in gs_vz_nepa_edmu||wd in gs_vz_nepa_edsr||wd in g2_vz_nebu_e1||
                          wd in g2_vz_nebu_e2||wd in g2_vz_nebu_e3||wd in g2_vz_nena_e1||wd in g2_vz_nena_e2||wd in g2_vz_nena_e3||
                          wd in g2_vz_nepo_ed||wd in g2_vz_nepa_edze||wd in g2_vz_nepa_edmu||wd in g2_vz_nepa_edsr)                             {rett=1} else {rett=0}; return rett}
function gl_needge(n,     wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nena_e1||wd in gn_vz_nena_e2||wd in gn_vz_nena_e3||wd in gn_nena_e1||wd in gn_nena_e2||wd in gn_nena_e3||
                          wd in gs_nebu_e1||wd in gs_nebu_e2||wd in gs_nebu_e3||wd in gs_vz_nebu_e1||wd in gs_vz_nebu_e2||wd in gs_vz_nebu_e3||
                          wd in g2_nebu_e1||wd in g2_nebu_e2||wd in g2_nebu_e3||wd in g2_vz_nebu_e1||wd in g2_vz_nebu_e2||wd in g2_vz_nebu_e3||
                          wd in g2_vz_nena_e1||wd in g2_vz_nena_e2||wd in g2_vz_nena_e3||wd in g2_nena_e1||wd in g2_nena_e2||wd in g2_nena_e3)  {rett=1} else {rett=0}; return rett}
function gl_peedge(n,     wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_pena_e1||wd in gn_pena_e2||wd in gn_pena_e3||wd in gs_pebu_e1||wd in gs_pebu_e2||wd in gs_pebu_e3||
                          wd in g2_pebu_e1||wd in g2_pebu_e2||wd in g2_pebu_e3||wd in g2_pena_e1||wd in g2_pena_e2||wd in g2_pena_e3)           {rett=1} else {rett=0}; return rett}
function gl_needmu(n,     wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nepa_edmu||wd in gn_nepa_edmu||wd in gs_vz_nepa_edmu||wd in gs_nepa_edmu||wd in g2_vz_nepa_edmu||
                          wd in g2_nepa_edmu)                                                                                                   {rett=1} else {rett=0}; return rett}
function gl_peedmu(n,     wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_pepa_edmu||wd in gs_pepa_edmu||wd in g2_pepa_edmu)                                                           {rett=1} else {rett=0}; return rett}
function gl_needze(n,     wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nepa_edze||wd in gn_nepa_edze||wd in gs_vz_nepa_edze||wd in gs_nepa_edze||wd in g2_vz_nepa_edze||
                          wd in g2_nepa_edze)                                                                                                   {rett=1} else {rett=0}; return rett}
function gl_peedze(n,     wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_pepa_edze||wd in gs_pepa_edze||wd in g2_pepa_edze)                                                           {rett=1} else {rett=0}; return rett}
function gl_needsr(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nepa_edsr||wd in gn_nepa_edsr||wd in gs_vz_nepa_edsr||wd in gs_nepa_edsr||wd in g2_vz_nepa_edsr||
                          wd in g2_nepa_edsr)                                                                                                   {rett=1} else {rett=0}; return rett}
function gl_peedsr(n,     wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_pepa_edsr||wd in gs_pepa_edsr||wd in g2_pepa_edsr)                                                           {rett=1} else {rett=0}; return rett}
function gl_edsr(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nepa_edsr||wd in gn_nepa_edsr||wd in gn_pepa_edsr||wd in gn_pnpa_edsr||wd in gs_vz_nepa_edsr||
                          wd in gs_nepa_edsr||wd in gs_pepa_edsr||wd in gs_pnpa_edsr||wd in g2_pepa_edsr||wd in g2_vz_nepa_edsr||
                          wd in g2_nepa_edsr||wd in g2_pnpa_edsr)                                                                               {rett=1} else {rett=0}; return rett}
function gl_poed(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nepo_ed||wd in gn_nepo_ed||wd in gn_pepo_ed||wd in gn_pnpo_ed||wd in gs_vz_nepo_ed||wd in gs_nepo_ed||
                          wd in gs_pepo_ed||wd in gs_pnpo_ed||wd in g2_pepo_ed||wd in g2_vz_nepo_ed||wd in g2_nepo_ed||wd in g2_pnpo_ed)        {rett=1} else {rett=0}; return rett}
function gl_popeed(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in gn_pepo_ed||wd in gs_pepo_ed||wd in g2_pepo_ed)                               {rett=1} else {rett=0}; return rett}
function gl_popned(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in gn_pnpo_ed||wd in gs_pnpo_ed||wd in g2_pnpo_ed)                               {rett=1} else {rett=0}; return rett}
function gl_poneed(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nepo_ed||wd in gn_nepo_ed||wd in gs_vz_nepo_ed||wd in gs_nepo_ed||wd in g2_vz_nepo_ed||wd in g2_nepo_ed)  {rett=1} else {rett=0}; return rett}
function gl_bue3(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gs_nebu_e3||wd in gs_vz_nebu_e3||wd in gs_pebu_e3||wd in gs_pnbu_e3||wd in g2_pebu_e3||wd in g2_nebu_e3||
                          wd in g2_vz_nebu_e3||wd in g2_pnbu_e3)                                                                                {rett=1} else {rett=0}; return rett}
function gl_vzmn(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nena_m1||wd in gn_vz_nena_m2||wd in gn_vz_nena_m3||wd in gn_vz_nepa_mn||wd in g2_vz_nena_m1||
                          wd in gs_vz_nebu_m1||wd in gs_vz_nebu_m2||wd in gs_vz_nebu_m3||wd in gs_vz_nepa_mn||wd in g2_vz_nena_m2||
                          wd in g2_vz_nebu_m1||wd in g2_vz_nebu_m2||wd in g2_vz_nebu_m3||wd in g2_vz_nepa_mn||wd in g2_vz_nena_m3)              {rett=1} else {rett=0}; return rett}
function gl_navzmn(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nena_m1||wd in gn_vz_nena_m2||wd in gn_vz_nena_m3||wd in g2_vz_nena_m1||wd in g2_vz_nena_m2||
                         wd in g2_vz_nena_m3)                                                                                                   {rett=1} else {rett=0}; return rett}
function gl_pavzmn(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nepa_mn||wd in gs_vz_nepa_mn||wd in g2_vz_nepa_mn)                                                        {rett=1} else {rett=0}; return rett}
function gl_buvzmn(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gs_vz_nebu_m1||wd in gs_vz_nebu_m2||wd in gs_vz_nebu_m3||wd in g2_vz_nebu_m1||wd in g2_vz_nebu_m2||
                          wd in g2_vz_nebu_m3)                                                                                                  {rett=1} else {rett=0}; return rett}
function gl_povzmn(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nepo_mn||wd in gs_vz_nepo_mn||wd in g2_vz_nepo_mn)                                                        {rett=1} else {rett=0}; return rett}
function gl_pomn(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_nepo_mn||wd in gn_pepo_mn||wd in gn_pnpo_mn||wd in gs_nepo_mn||wd in gs_pepo_mn||wd in gs_pnpo_mn||
                          wd in g2_pepo_mn||wd in g2_nepo_mn||wd in g2_pnpo_mn)                                                                 {rett=1} else {rett=0}; return rett}
function gl_popemn(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in gn_pepo_mn||wd in gs_pepo_mn||wd in g2_pepo_mn)                               {rett=1} else {rett=0}; return rett}
function gl_popnmn(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in gn_pnpo_mn||wd in gs_pnpo_mn||wd in g2_pnpo_mn)                               {rett=1} else {rett=0}; return rett}
function gl_ponemn(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in gn_nepo_mn||wd in gs_nepo_mn||wd in g2_nepo_mn)                               {rett=1} else {rett=0}; return rett}
function gl_po(n,                                                                                                                               wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_vz_nepo_ed||wd in gn_nepo_ed||wd in gn_pepo_ed||wd in gn_pnpo_ed||wd in gs_vz_nepo_ed||wd in gs_nepo_ed||  
                          wd in gs_pepo_ed||wd in gs_pnpo_ed||wd in g2_pepo_ed||wd in g2_vz_nepo_ed||wd in g2_nepo_ed||wd in g2_pnpo_edi||      
                          wd in gn_vz_nepo_mn||wd in gs_vz_nepo_mn||wd in g2_vz_nepo_mn||wd in gn_nepo_mn||wd in gn_pepo_mn||wd in gn_pnpo_mn||
                          wd in gs_nepo_mn||wd in gs_pepo_mn||wd in gs_pnpo_mn||wd in g2_pepo_mn||wd in g2_nepo_mn||wd in g2_pnpo_mn)           {rett=1} else {rett=0}; return rett}
function gl_nemn(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_nena_m1||wd in gn_nena_m2||wd in gn_nena_m3||wd in gn_nepa_mn||wd in gs_nebu_m1||wd in gs_nebu_m2||
                          wd in gs_nebu_m3||wd in gs_nepa_mn||wd in g2_nebu_m1||wd in g2_nebu_m2||wd in g2_nebu_m3||wd in g2_nena_m1||
                          wd in g2_nena_m2||wd in g2_nena_m3||wd in g2_nepa_mn)                                                                 {rett=1} else {rett=0}; return rett}
function gl_pnmn(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_pnna_m1||wd in gn_pnna_m2||wd in gn_pnna_m3||wd in gn_pnpa_mn||wd in gs_pnbu_m1||wd in gs_pnbu_m2||
                          wd in gs_pnbu_m3||wd in gs_pnpa_mn||wd in g2_pnbu_m1||wd in g2_pnbu_m2||wd in g2_pnbu_m3||wd in g2_pnna_m1||
                          wd in g2_pnna_m2||wd in g2_pnna_m3||wd in g2_pnpa_mn)                                                                 {rett=1} else {rett=0}; return rett}
function gl_pemn(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_pena_m1||wd in gn_pena_m2||wd in gn_pena_m3||wd in gn_pepa_mn||wd in gs_pebu_m1||wd in gs_pebu_m2||
                          wd in gs_pebu_m3||wd in gs_pepa_mn||wd in g2_pebu_m1||wd in g2_pebu_m2||wd in g2_pebu_m3||wd in g2_pena_m1||
                          wd in g2_pena_m2||wd in g2_pena_m3||wd in g2_pepa_mn)                                                                 {rett=1} else {rett=0}; return rett}
function gl_bum3(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gs_nebu_m3||wd in g2_nebu_m3||wd in gs_pnbu_m3||wd in g2_pnbu_m3||wd in gs_pebu_m3||wd in g2_pebu_m3)           {rett=1} else {rett=0}; return rett}
function gl_mn(n,                                                                                                                               wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_nena_m1||wd in gn_nena_m2||wd in gn_nena_m3||wd in gn_nepa_mn||wd in gs_nebu_m1||wd in gs_nebu_m2||
                          wd in gs_nebu_m3||wd in gs_nepa_mn||wd in g2_nebu_m1||wd in g2_nebu_m2||wd in g2_nebu_m3||wd in g2_nena_m1||
                          wd in g2_nena_m2||wd in g2_nena_m3||wd in g2_nepa_mn||wd in gn_pnna_m1||wd in gn_pnna_m2||wd in gn_pnna_m3||
                          wd in gn_pnpa_mn||wd in gs_pnbu_m1||wd in gs_pnbu_m2||wd in gs_pnbu_m3||wd in gs_pnpa_mn||wd in g2_pnbu_m1||
                          wd in g2_pnbu_m2||wd in g2_pnbu_m3||wd in g2_pnna_m1||wd in g2_pnna_m2||wd in g2_pnna_m3||wd in g2_pnpa_mn||
                          wd in gn_pena_m1||wd in gn_pena_m2||wd in gn_pena_m3||wd in gn_pepa_mn||wd in gs_pebu_m1||wd in gs_pebu_m2||
                          wd in gs_pebu_m3||wd in gs_pepa_mn||wd in g2_pebu_m1||wd in g2_pebu_m2||wd in g2_pebu_m3||wd in g2_pena_m1||
                          wd in g2_pena_m2||wd in g2_pena_m3||wd in g2_pepa_mn)                                                                 {rett=1} else {rett=0}; return rett}
function gl_namn(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_nena_m1||wd in gn_nena_m2||wd in gn_nena_m3||wd in g2_nena_m1||wd in g2_nena_m2||wd in g2_nena_m3||
                          wd in gn_pnna_m1||wd in gn_pnna_m2||wd in gn_pnna_m3||wd in g2_pnna_m1||wd in g2_pnna_m2||wd in g2_pnna_m3||
                          wd in gn_pena_m1||wd in gn_pena_m2||wd in gn_pena_m3||wd in g2_pena_m1||wd in g2_pena_m2||wd in g2_pena_m3)           {rett=1} else {rett=0}; return rett}
function gl_pamn(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gn_nepa_mn||wd in gs_nepa_mn||wd in g2_nepa_mn||wd in gn_pnpa_mn||wd in gs_pnpa_mn||wd in g2_pnpa_mn||
                          wd in gn_pepa_mn||wd in gs_pepa_mn||wd in g2_pepa_mn)                                                                 {rett=1} else {rett=0}; return rett}
function gl_bumn(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in gs_nebu_m1||wd in gs_nebu_m2||wd in gs_nebu_m3||wd in g2_nebu_m1||wd in g2_nebu_m2||wd in g2_nebu_m3||
                          wd in gs_pnbu_m1||wd in gs_pnbu_m2||wd in gs_pnbu_m3||wd in g2_pnbu_m1||wd in g2_pnbu_m2||wd in g2_pnbu_m3||
                          wd in gs_pebu_m1||wd in gs_pebu_m2||wd in gs_pebu_m3||wd in g2_pebu_m1||wd in g2_pebu_m2||wd in g2_pebu_m3)           {rett=1} else {rett=0}; return rett}

# существительные
function suw_edmuim(n,                                                                                                                          wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in sw_edmu_im||wd in sw_edob_im||wd in swn_edmu_im||wd in swn_edob_im||wd in swo_edmu_im||wd in swo_edob_im)       {rett=1} else {rett=0}; return rett}
function suw_edmuvi(n,                                                                                                                          wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in sw_edmu_vi||wd in sw_edmu_vi||wd in sw_edob_vi||wd in swn_edmu_im||wd in swn_edob_vi||wd in swo_edmu_ro||
                          wd in swo_edob_vi)                                                                                                    {rett=1} else {rett=0}; return rett}
function suw_edmuda(n,                                                                                                                          wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in sw_edmu_da||wd in sw_edob_da||wd in swn_edmu_da||wd in swn_edob_da||wd in swo_edmu_da||wd in swo_edob_da)       {rett=1} else {rett=0}; return rett}
function suw_edmuro(n,                                                                                                                          wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in sw_edmu_ro||wd in sw_edob_ro||wd in swn_edmu_ro||wd in swn_edob_ro||wd in swo_edmu_ro||wd in swo_edob_ro)       {rett=1} else {rett=0}; return rett}
function suw_edmupr(n,                                                                                                                          wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in sw_edmu_pr||wd in sw_edob_pr||wd in swn_edmu_pr||wd in swn_edob_pr||wd in swo_edmu_pr||wd in swo_edob_pr)       {rett=1} else {rett=0}; return rett}

function suw_edsrim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in sw_edsr_im||wd in swn_edsr_im||wd in swo_edsr_im)                             {rett=1} else {rett=0}; return rett}
function suw_edsrvi(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in sw_edsr_vi||wd in swn_edsr_vi||wd in swo_edsr_vi)                             {rett=1} else {rett=0}; return rett}
function suw_edsrda(n,                                                                                                                          wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in sw_edob_da||wd in sw_edsr_da||wd in swn_edob_da||wd in swn_edsr_da||wd in swo_edob_da||wd in swo_edsr_da)       {rett=1} else {rett=0}; return rett}
function suw_edsrro(n,                                                                                                                          wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in sw_edob_ro||wd in sw_edsr_ro||wd in swn_edob_ro||wd in swn_edsr_ro||wd in swo_edob_ro||wd in swo_edsr_ro)       {rett=1} else {rett=0}; return rett}
function suw_edsrpr(n,                                                                                                                          wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in sw_edob_pr||wd in sw_edsr_pr||wd in swn_edob_pr||wd in swn_edsr_pr||wd in swo_edob_pr||wd in swo_edsr_pr)       {rett=1} else {rett=0}; return rett}

function suw_edzeim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in swn_edze_im||wd in swo_edze_im||wd in sw_edze_im)                             {rett=1} else {rett=0}; return rett}
function suw_edzevi(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in swn_edze_vi||wd in swo_edze_vi||wd in sw_edze_vi)                             {rett=1} else {rett=0}; return rett}
function suw_edzero(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in swn_edze_ro||wd in swo_edze_ro||wd in sw_edze_ro)                             {rett=1} else {rett=0}; return rett}
function suw_edzeda(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in swn_edze_da||wd in swo_edze_da||wd in sw_edze_da)                             {rett=1} else {rett=0}; return rett}
function suw_edzetv(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in swn_edze_tv||wd in swo_edze_tv||wd in sw_edze_tv)                             {rett=1} else {rett=0}; return rett}
function suw_edzepr(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in swn_edze_pr||wd in swo_edze_pr||wd in sw_edze_pr)                             {rett=1} else {rett=0}; return rett}

function suw_edim(n,                                                                                                                            wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in sw_edmu_im||wd in sw_edob_im||wd in sw_edsr_im||wd in sw_edze_im||wd in swn_edmu_im||wd in swn_edob_im||
                          wd in swn_edsr_im||wd in swn_edze_im||wd in swo_edmu_im||wd in swo_edob_im||wd in swo_edsr_im||wd in swo_edze_im)     {rett=1} else {rett=0}; return rett}
function suw_edvi(n,                                                                                                                            wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in sw_edmu_vi||wd in sw_edob_vi||wd in sw_edsr_vi||wd in sw_edze_vi||wd in swn_edmu_im||wd in swn_edob_vi||
                          wd in swn_edsr_vi||wd in swn_edze_vi||wd in swo_edmu_ro||wd in swo_edob_vi||wd in swo_edsr_vi||wd in swo_edze_vi)     {rett=1} else {rett=0}; return rett}
function suw_edro(n,                                                                                                                            wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in sw_edmu_ro||wd in sw_edob_ro||wd in sw_edsr_ro||wd in sw_edze_ro||wd in swn_edmu_ro||wd in swn_edob_ro||
                          wd in swn_edsr_ro||wd in swn_edze_ro||wd in swo_edmu_ro||wd in swo_edob_ro||wd in swo_edsr_ro||wd in swo_edze_ro)     {rett=1} else {rett=0}; return rett}
function suw_edda(n,                                                                                                                            wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in sw_edmu_da||wd in sw_edob_da||wd in sw_edsr_da||wd in sw_edze_da||wd in swn_edmu_da||wd in swn_edob_da||
                          wd in swn_edsr_da||wd in swn_edze_da||wd in swo_edmu_da||wd in swo_edob_da||wd in swo_edsr_da||wd in swo_edze_da)     {rett=1} else {rett=0}; return rett}
function suw_edtv(n,                                                                                                                            wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in sw_edmu_tv||wd in sw_edob_tv||wd in sw_edsr_tv||wd in sw_edze_tv||wd in swn_edmu_tv||wd in swn_edob_tv||
                          wd in swn_edsr_tv||wd in swn_edze_tv||wd in swo_edmu_tv||wd in swo_edob_tv||wd in swo_edsr_tv||wd in swo_edze_tv)     {rett=1} else {rett=0}; return rett}
function suw_edpr(n,                                                                                                                            wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in sw_edmu_pr||wd in sw_edob_pr||wd in sw_edsr_pr||wd in sw_edze_pr||wd in swn_edmu_pr||wd in swn_edob_pr||
                          wd in swn_edsr_pr||wd in swn_edze_pr||wd in swo_edmu_pr||wd in swo_edob_pr||wd in swo_edsr_pr||wd in swo_edze_pr)     {rett=1} else {rett=0}; return rett}
function suw_mnim(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in swn_mn_im||wd in swo_mn_im||wd in sw_mn_im)                                   {rett=1} else {rett=0}; return rett}
function suw_mnvi(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in sw_mn_vi||wd in swn_mn_im||wd in swo_mn_ro)                                   {rett=1} else {rett=0}; return rett}
function suw_mnro(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in sw_mn_ro||wd in swn_mn_ro||wd in swo_mn_ro)                                   {rett=1} else {rett=0}; return rett}
function suw_mnda(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in sw_mn_da||wd in swn_mn_da||wd in swo_mn_da)                                   {rett=1} else {rett=0}; return rett}
function suw_mntv(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in sw_mn_tv||wd in swn_mn_tv||wd in swo_mn_tv)                                   {rett=1} else {rett=0}; return rett}
function suw_mnpr(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in sw_mn_pr||wd in swn_mn_pr||wd in swo_mn_pr)                                   {rett=1} else {rett=0}; return rett}
function suw_oded(n,                                                                                                                            wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in swo_edmu_da||wd in swo_edmu_im||wd in swo_edmu_ne||wd in swo_edmu_pr||wd in swo_edmu_ro||wd in swo_edmu_tv||
                          wd in swo_edmu_zv||wd in swo_edob_da||wd in swo_edob_im||wd in swo_edob_ne||wd in swo_edob_pr||wd in swo_edob_ro||
                          wd in swo_edob_tv||wd in swo_edob_vi||wd in swo_edsr_da||wd in swo_edsr_im||wd in swo_edsr_pr||wd in swo_edsr_ro||
                          wd in swo_edsr_tv||wd in swo_edsr_vi||wd in swo_edze_da||wd in swo_edze_im||wd in swo_edze_ne||wd in swo_edze_pr||
                          wd in swo_edze_ro||wd in swo_edze_tv||wd in swo_edze_vi||wd in swo_edze_zv)                                           {rett=1} else {rett=0}; return rett}
function suw_odedim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in swo_edmu_im||wd in swo_edob_im||wd in swo_edsr_im||wd in swo_edze_im)         {rett=1} else {rett=0}; return rett}
function suw_odedvi(n,                                                                                                                          wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in swo_edob_vi||wd in swo_edsr_vi||wd in swo_edze_vi||wd in swo_edmu_ro||wd in swo_edob_ro||wd in swo_edsr_ro)     {rett=1} else {rett=0}; return rett}
function suw_odedro(n,                                                                                                                          wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in swo_edmu_ro||wd in swo_edob_ro||wd in swo_edsr_ro||wd in swo_edze_ro)                                           {rett=1} else {rett=0}; return rett}
function suw_odedda(n,                                                                                                                          wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in swo_edmu_da||wd in swo_edob_da||wd in swo_edsr_da||wd in swo_edze_da)                                           {rett=1} else {rett=0}; return rett}
function suw_odedmuda(n,  wd,rett) { if(!(wd))wd=lc(n); if (wd in swo_edmu_da||wd in swo_edob_da)                                               {rett=1} else {rett=0}; return rett}
function suw_odedsrda(n,  wd,rett) { if(!(wd))wd=lc(n); if (wd in swo_edob_da||wd in swo_edsr_da)                                               {rett=1} else {rett=0}; return rett}
function suw_odedtv(n,                                                                                                                          wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in swo_edmu_tv||wd in swo_edob_tv||wd in swo_edsr_tv||wd in swo_edze_tv)                                           {rett=1} else {rett=0}; return rett}
function suw_odedpr(n,                                                                                                                          wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in swo_edmu_pr||wd in swo_edob_pr||wd in swo_edsr_pr||wd in swo_edze_pr)                                           {rett=1} else {rett=0}; return rett}
function suw_odmnvi(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in swo_mn_ro)                                                                    {rett=1} else {rett=0}; return rett}
function suw_odmnim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in swo_mn_im||wd in swo_mn_ne)                                                   {rett=1} else {rett=0}; return rett}
function suw_odmn(n,                                                                                                                            wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in swo_mn_da||wd in swo_mn_im||wd in swo_mn_ne||wd in swo_mn_pr||wd in swo_mn_ro||wd in swo_mn_sq||wd in swo_mn_tv){rett=1} else {rett=0}; return rett}
function suw_odmnda(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in swo_mn_da||wd in swo_mn_ne)                                                   {rett=1} else {rett=0}; return rett}
function suw_noed(n,                                                                                                                            wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in swn_edmu_da||wd in swn_edmu_im||wd in swn_edmu_me||wd in swn_edmu_ne||wd in swn_edmu_pr||wd in swn_edmu_pt||
                          wd in swn_edmu_ro||wd in swn_edmu_sq||wd in swn_edmu_tv||wd in swn_edob_da||wd in swn_edob_im||wd in swn_edob_ne||
                          wd in swn_edob_pr||wd in swn_edob_ro||wd in swn_edob_tv||wd in swn_edob_vi||wd in swn_edsr_da||wd in swn_edsr_im||
                          wd in swn_edsr_ne||wd in swn_edsr_pr||wd in swn_edsr_ro||wd in swn_edsr_tv||wd in swn_edsr_vi||wd in swn_edze_da||
                          wd in swn_edze_im||wd in swn_edze_me||wd in swn_edze_ne||wd in swn_edze_pr||wd in swn_edze_ro||wd in swn_edze_tv||
                          wd in swn_edze_vi)                                                                                                    {rett=1} else {rett=0}; return rett}
function suw_noedim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in swn_edmu_im||wd in swn_edob_im||wd in swn_edsr_im||wd in swn_edze_im)         {rett=1} else {rett=0}; return rett}
function suw_noedmuim(n,  wd,rett) { if(!(wd))wd=lc(n); if (wd in swn_edmu_im||wd in swn_edob_im)                                               {rett=1} else {rett=0}; return rett}
function suw_noedmuda(n,  wd,rett) { if(!(wd))wd=lc(n); if (wd in swn_edmu_da||wd in swn_edob_da||wd in sw_edmu_da||wd in sw_edob_da)           {rett=1} else {rett=0}; return rett}
function suw_noedsrda(n,  wd,rett) { if(!(wd))wd=lc(n); if (wd in swn_edsr_da||wd in swn_edob_da||wd in sw_edsr_da||wd in sw_edob_da)           {rett=1} else {rett=0}; return rett}
function suw_noedvi(n,                                                                                                                          wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in swn_edmu_im||wd in swn_edob_im||wd in swn_edob_vi||wd in swn_edsr_im||wd in swn_edsr_vi||wd in swn_edze_im||
                          wd in swn_edze_vi)                                                                                                    {rett=1} else {rett=0}; return rett}
function suw_noedro(n,                                                                                                                          wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in swn_edmu_ro||wd in swn_edob_ro||wd in swn_edsr_ro||wd in swn_edze_ro||wd in sw_edob_ro)                         {rett=1} else {rett=0}; return rett}
function suw_noedtv(n,                                                                                                                          wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in swn_edmu_tv||wd in swn_edob_tv||wd in swn_edsr_tv||wd in swn_edze_tv)                                           {rett=1} else {rett=0}; return rett}
function suw_noedpr(n,                                                                                                                          wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in swn_edmu_pr||wd in swn_edob_pr||wd in swn_edsr_pr||wd in swn_edze_pr)                                           {rett=1} else {rett=0}; return rett}
function suw_nomnim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in swn_mn_im)                                                                    {rett=1} else {rett=0}; return rett}
function suw_nomn(n,                                                                                                                            wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in swn_mn_da||wd in swn_mn_im||wd in swn_mn_ne||wd in swn_mn_pr||wd in swn_mn_ro||wd in swn_mn_sq||wd in swn_mn_tv){rett=1} else {rett=0}; return rett}
function suw_nomnvi(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in swn_mn_im||wd in swn_mn_ne)                                                   {rett=1} else {rett=0}; return rett}
function suw_nomnro(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in sw_mn_ro||wd in swn_mn_ro)                                                    {rett=1} else {rett=0}; return rett}
function suw_nomntv(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in swn_mn_tv)                                                                    {rett=1} else {rett=0}; return rett}
function suw_nomnpr(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in swn_mn_pr)                                                                    {rett=1} else {rett=0}; return rett}
function suw_edme(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in swn_edmu_me||wd in swn_edze_me)                                               {rett=1} else {rett=0}; return rett}
function suw_edmume(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in swn_edmu_me)                                                                  {rett=1} else {rett=0}; return rett}
function suw_edzeme(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in swn_edze_me)                                                                  {rett=1} else {rett=0}; return rett}
function suw_edne(n,                                                                                                                            wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in sw_edmu_ne||wd in sw_edob_ne||wd in swn_edmu_ne||wd in swn_edob_ne||wd in swn_edsr_ne||wd in swn_edze_ne||
                          wd in swo_edmu_ne||wd in swo_edob_ne||wd in swo_edze_ne)                                                              {rett=1} else {rett=0}; return rett}
function suw_edzene(n,                                                                                                                          wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in swn_edze_ne||wd in swo_edze_ne||wd in sw_edob_ne||wd in swn_edob_ne)                                            {rett=1} else {rett=0}; return rett}
function suw_mnne(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in sw_mn_ne||wd in swn_mn_ne||wd in swo_mn_ne)                                   {rett=1} else {rett=0}; return rett}
function suw_mnsq(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in swn_mn_sq||wd in swo_mn_sq)                                                   {rett=1} else {rett=0}; return rett}
function suw_ed(n,                                                                                                                              wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in sw_edmu_da||wd in sw_edmu_im||wd in sw_edmu_ne||wd in sw_edmu_pr||wd in sw_edmu_ro||wd in sw_edmu_tv||
                          wd in sw_edmu_vi||wd in sw_edob_da||wd in sw_edob_im||wd in sw_edob_ne||wd in sw_edob_pr||wd in sw_edob_ro||
                          wd in sw_edob_tv||wd in sw_edob_vi||wd in sw_edsr_da||wd in sw_edsr_im||wd in sw_edsr_pr||wd in sw_edsr_ro||
                          wd in sw_edsr_tv||wd in sw_edsr_vi||wd in sw_edze_da||wd in sw_edze_im||wd in sw_edze_pr||wd in sw_edze_ro||
                          wd in sw_edze_tv||wd in sw_edze_vi||wd in swn_edmu_da||wd in swn_edmu_im||wd in swn_edmu_me||wd in swn_edmu_ne||
                          wd in swn_edmu_pr||wd in swn_edmu_pt||wd in swn_edmu_ro||wd in swn_edmu_sq||wd in swn_edmu_tv||wd in swn_edob_da||
                          wd in swn_edob_im||wd in swn_edob_ne||wd in swn_edob_pr||wd in swn_edob_ro||wd in swn_edob_tv||wd in swn_edob_vi||
                          wd in swn_edsr_da||wd in swn_edsr_im||wd in swn_edsr_ne||wd in swn_edsr_pr||wd in swn_edsr_ro||wd in swn_edsr_tv||
                          wd in swn_edsr_vi||wd in swn_edze_da||wd in swn_edze_im||wd in swn_edze_me||wd in swn_edze_ne||wd in swn_edze_pr||
                          wd in swn_edze_ro||wd in swn_edze_tv||wd in swn_edze_vi||wd in swo_edmu_da||wd in swo_edmu_im||wd in swo_edmu_ne||
                          wd in swo_edmu_pr||wd in swo_edmu_ro||wd in swo_edmu_tv||wd in swo_edmu_zv||wd in swo_edob_da||wd in swo_edob_im||
                          wd in swo_edob_ne||wd in swo_edob_pr||wd in swo_edob_ro||wd in swo_edob_tv||wd in swo_edob_vi||wd in swo_edsr_da||
                          wd in swo_edsr_im||wd in swo_edsr_pr||wd in swo_edsr_ro||wd in swo_edsr_tv||wd in swo_edsr_vi||wd in swo_edze_da||
                          wd in swo_edze_im||wd in swo_edze_ne||wd in swo_edze_pr||wd in swo_edze_ro||wd in swo_edze_tv||wd in swo_edze_vi||
                          wd in swo_edze_zv)                                                                                                    {rett=1} else {rett=0}; return rett}
function suw_any(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in sw_edmu_da||wd in sw_edmu_im||wd in sw_edmu_ne||wd in sw_edmu_pr||wd in sw_edmu_ro||wd in sw_edmu_tv||
                          wd in sw_edmu_vi||wd in sw_edob_da||wd in sw_edob_im||wd in sw_edob_ne||wd in sw_edob_pr||wd in sw_edob_ro||
                          wd in sw_edob_tv||wd in sw_edob_vi||wd in sw_edsr_da||wd in sw_edsr_im||wd in sw_edsr_pr||wd in sw_edsr_ro||
                          wd in sw_edsr_tv||wd in sw_edsr_vi||wd in sw_edze_da||wd in sw_edze_im||wd in sw_edze_pr||wd in sw_edze_ro||
                          wd in sw_edze_tv||wd in sw_edze_vi||wd in sw_mn_da||wd in sw_mn_im||wd in sw_mn_ne||wd in sw_mn_pr||wd in sw_mn_ro||
                          wd in sw_mn_tv||wd in sw_mn_vi||wd in swn_edmu_da||wd in swn_edmu_im||wd in swn_edmu_me||wd in swn_edmu_ne||
                          wd in swn_edmu_pr||wd in swn_edmu_pt||wd in swn_edmu_ro||wd in swn_edmu_sq||wd in swn_edmu_tv||wd in swn_edob_da||
                          wd in swn_edob_im||wd in swn_edob_ne||wd in swn_edob_pr||wd in swn_edob_ro||wd in swn_edob_tv||wd in swn_edob_vi||
                          wd in swn_edsr_da||wd in swn_edsr_im||wd in swn_edsr_ne||wd in swn_edsr_pr||wd in swn_edsr_ro||wd in swn_edsr_tv||
                          wd in swn_edsr_vi||wd in swn_edze_da||wd in swn_edze_im||wd in swn_edze_me||wd in swn_edze_ne||wd in swn_edze_pr||
                          wd in swn_edze_ro||wd in swn_edze_tv||wd in swn_edze_vi||wd in swn_mn_da||wd in swn_mn_im||wd in swn_mn_ne||
                          wd in swn_mn_pr||wd in swn_mn_ro||wd in swn_mn_sq||wd in swn_mn_tv||wd in swo_edmu_da||wd in swo_edmu_im||
                          wd in swo_edmu_ne||wd in swo_edmu_pr||wd in swo_edmu_ro||wd in swo_edmu_tv||wd in swo_edmu_zv||wd in swo_edob_da||
                          wd in swo_edob_im||wd in swo_edob_ne||wd in swo_edob_pr||wd in swo_edob_ro||wd in swo_edob_tv||wd in swo_edob_vi||
                          wd in swo_edsr_da||wd in swo_edsr_im||wd in swo_edsr_pr||wd in swo_edsr_ro||wd in swo_edsr_tv||wd in swo_edsr_vi||
                          wd in swo_edze_da||wd in swo_edze_im||wd in swo_edze_ne||wd in swo_edze_pr||wd in swo_edze_ro||wd in swo_edze_tv||
                          wd in swo_edze_vi||wd in swo_edze_zv||wd in swo_mn_da||wd in swo_mn_im||wd in swo_mn_ne||wd in swo_mn_pr||
                          wd in swo_mn_ro||wd in swo_mn_sq||wd in swo_mn_tv)                                                                    {rett=1} else {rett=0}; return rett}

# Омографы-партитивы: все, абстрактные, газы, еда, жидкости=питьё, сыпучие, твёрдные
function ipa_any(n,       wd,rett) { if(!(wd))wd=lc(n); if (wd in ispa_any)                                                                     {rett=1} else {rett=0}; return rett}
function ipa_abst(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in ispa_abst)                                                                    {rett=1} else {rett=0}; return rett}  
function ipa_gas(n,       wd,rett) { if(!(wd))wd=lc(n); if (wd in ispa_gas)                                                                     {rett=1} else {rett=0}; return rett}
function ipa_food(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in ispa_food)                                                                    {rett=1} else {rett=0}; return rett}
function ipa_liquid(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in ispa_liquid)                                                                  {rett=1} else {rett=0}; return rett}
function ipa_loose(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in ispa_loose)                                                                   {rett=1} else {rett=0}; return rett}
function ipa_solid(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in ispa_solid)                                                                   {rett=1} else {rett=0}; return rett}

# местоимения
function mest_any(n,                                                                                                                            wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in mst_ed_da||wd in mst_ed_im||wd in mst_ed_mu||wd in mst_ed_mu_da||wd in mst_ed_mu_im||wd in mst_ed_mu_pr||
                          wd in mst_ed_mu_ro||wd in mst_ed_mu_tv||wd in mst_ed_mu_vi||wd in mst_ed_pr||wd in mst_ed_ro||wd in mst_ed_sr||
                          wd in mst_ed_sr_da||wd in mst_ed_sr_im||wd in mst_ed_sr_pr||wd in mst_ed_sr_ro||wd in mst_ed_sr_tv||
                          wd in mst_ed_sr_vi||wd in mst_ed_tv||wd in mst_ed_vi||wd in mst_ed_ze||wd in mst_ed_ze_da||wd in mst_ed_ze_im||
                          wd in mst_ed_ze_pr||wd in mst_ed_ze_ro||wd in mst_ed_ze_tv||wd in mst_ed_ze_vi||wd in mst_im||wd in mst_ro||
                          wd in mst_da||wd in mst_tv||wd in mst_pr||wd in mst_mn_im||wd in mst_mn_ro||wd in mst_mn_vi||wd in mst_mn_da||
                          wd in mst_mn_pr||wd in mst_mn_tv||wd in mst_mn)                                                                       {rett=1} else {rett=0}; return rett}
function mest_ed(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in mst_ed_da||wd in mst_ed_im||wd in mst_ed_mu||wd in mst_ed_mu_da||wd in mst_ed_mu_im||wd in mst_ed_mu_pr||
                          wd in mst_ed_mu_ro||wd in mst_ed_mu_tv||wd in mst_ed_mu_vi||wd in mst_ed_pr||wd in mst_ed_ro||wd in mst_ed_sr||
                          wd in mst_ed_sr_da||wd in mst_ed_sr_im||wd in mst_ed_sr_pr||wd in mst_ed_sr_ro||wd in mst_ed_sr_tv||
                          wd in mst_ed_sr_vi||wd in mst_ed_tv||wd in mst_ed_vi||wd in mst_ed_ze||wd in mst_ed_ze_da||wd in mst_ed_ze_im||
                          wd in mst_ed_ze_pr||wd in mst_ed_ze_ro||wd in mst_ed_ze_tv||wd in mst_ed_ze_vi||wd in mst_im||wd in mst_ro||
                          wd in mst_da||wd in mst_tv||wd in mst_pr)                                                                             {rett=1} else {rett=0}; return rett}
function mest_mn(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in mst_mn_im||wd in mst_mn_ro||wd in mst_mn_vi||wd in mst_mn_da||wd in mst_mn_pr||wd in mst_mn_tv||wd in mst_mn)   {rett=1} else {rett=0}; return rett}
function mest_edmuim(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_ed_mu_im||wd in mst_ed_im||wd in mst_im)                                  {rett=1} else {rett=0}; return rett}
function mest_edmuvi(n,                                                                                                                         wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in mst_ed_mu_vi||wd in mst_ed_mu_im||wd in mst_ed_mu_ro||wd in mst_mn_ro||wd in mst_ed_vi||wd in mst_vi)           {rett=1} else {rett=0}; return rett}
function mest_edmuro(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_ed_mu_ro||wd in mst_ed_ro||wd in mst_ro)                                  {rett=1} else {rett=0}; return rett}
function mest_edmuda(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_ed_mu_da||wd in mst_ed_da||wd in mst_da)                                  {rett=1} else {rett=0}; return rett}
function mest_edmutv(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_ed_mu_tv||wd in mst_ed_tv||wd in mst_tv)                                  {rett=1} else {rett=0}; return rett}
function mest_edmupr(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_ed_mu_pr||wd in mst_ed_pr||wd in mst_pr)                                  {rett=1} else {rett=0}; return rett}
function mest_edsrim(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_ed_sr_im||wd in mst_ed_sr)                                                {rett=1} else {rett=0}; return rett}
function mest_edsrvi(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_ed_sr_im||wd in mst_ed_sr_vi||wd in mst_ed_sr_ro||wd in mst_ed_sr)        {rett=1} else {rett=0}; return rett}
function mest_edsrro(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_ed_sr_ro||wd in mst_ed_ro||wd in mst_ro)                                  {rett=1} else {rett=0}; return rett}
function mest_edsrda(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_ed_sr_da||wd in mst_ed_da||wd in mst_da)                                  {rett=1} else {rett=0}; return rett}
function mest_edsrtv(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_ed_sr_tv||wd in mst_ed_tv||wd in mst_tv)                                  {rett=1} else {rett=0}; return rett}
function mest_edsrpr(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_ed_sr_pr||wd in mst_ed_pr||wd in mst_pr)                                  {rett=1} else {rett=0}; return rett}
function mest_edzeim(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_ed_ze_im)                                                                 {rett=1} else {rett=0}; return rett}
function mest_edzevi(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_ed_ze_vi)                                                                 {rett=1} else {rett=0}; return rett}
function mest_edzero(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_ed_ze_ro)                                                                 {rett=1} else {rett=0}; return rett}
function mest_edzeda(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_ed_ze_da)                                                                 {rett=1} else {rett=0}; return rett}
function mest_edzetv(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_ed_ze_tv)                                                                 {rett=1} else {rett=0}; return rett}
function mest_edzepr(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_ed_ze_pr)                                                                 {rett=1} else {rett=0}; return rett}
function mest_edmu(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in mst_ed_mu||wd in mst_ed_mu_da||wd in mst_ed_mu_im||wd in mst_ed_mu_pr||wd in mst_ed_mu_ro||
                          wd in mst_ed_mu_tv||wd in mst_ed_mu_vi)                                                                               {rett=1} else {rett=0}; return rett}
function mest_edze(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in mst_ed_ze_vi||wd in mst_ed_ze_da||wd in mst_ed_ze_im||wd in mst_ed_ze_pr||wd in mst_ed_ze_ro||
                          wd in mst_ed_ze_tv||wd in mst_ed_ze)                                                                                  {rett=1} else {rett=0}; return rett}
function mest_edsr(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in mst_ed_sr_vi||wd in mst_ed_sr_da||wd in mst_ed_sr_im||wd in mst_ed_sr_pr||wd in mst_ed_sr_ro||
                          wd in mst_ed_sr_tv||wd in mst_ed_sr)                                                                                  {rett=1} else {rett=0}; return rett}
function mest_edim(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in mst_ed_mu_im||wd in mst_ed_ze_im||wd in mst_ed_sr_im||wd in mst_ed_im||wd in mst_im)                            {rett=1} else {rett=0}; return rett}
function mest_edvi(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in mst_ed_mu_vi||wd in mst_ed_sr_vi||wd in mst_ed_vi||wd in mst_ed_ze_vi||wd in mst_vi)                            {rett=1} else {rett=0}; return rett}
function mest_im(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in mst_ed_mu_im||wd in mst_ed_ze_im||wd in mst_ed_sr_im||wd in mst_mn_im||wd in mst_ed_mu||wd in mst_ed_ze||
                          wd in mst_ed_im||wd in mst_im)                                                                                        {rett=1} else {rett=0}; return rett}
function mest_vi(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in mst_ed_mu_vi||wd in mst_ed_mu_im||wd in mst_ed_mu_ro||wd in mst_ed_ze_vi||wd in mst_ed_sr_vi||
                          wd in mst_mn_im||wd in mst_mn_ro||wd in mst_mn_vi||wd in mst_ed_vi||wd in mst_vi)                                     {rett=1} else {rett=0}; return rett}
function mest_ro(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in mst_ed_mu_ro||wd in mst_ed_ze_ro||wd in mst_ed_sr_ro||wd in mst_mn_ro||wd in mst_ed_ro||wd in mst_ro)           {rett=1} else {rett=0}; return rett}
function mest_da(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in mst_ed_mu_da||wd in mst_ed_ze_da||wd in mst_ed_sr_da||wd in mst_mn_da||wd in mst_ed_da||wd in mst_da)           {rett=1} else {rett=0}; return rett}
function mest_tv(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in mst_ed_mu_tv||wd in mst_ed_ze_tv||wd in mst_ed_sr_tv||wd in mst_mn_tv||wd in mst_ed_tv||wd in mst_tv)           {rett=1} else {rett=0}; return rett}
function mest_pr(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in mst_ed_mu_pr||wd in mst_ed_ze_pr||wd in mst_ed_sr_pr||wd in mst_mn_pr||wd in mst_ed_pr||wd in mst_pr)           {rett=1} else {rett=0}; return rett}
function mest_edro(n,                                                                                                                           wd,rett) { if(!(wd))wd=lc(n);
                      if (wd in mst_ed_mu_ro||wd in mst_ed_sr_ro||wd in mst_ed_ze_ro||wd in mst_ed_ro||wd in mst_ro)                            {rett=1} else {rett=0}; return rett}
function mest_mnim(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_mn_im)                                                                    {rett=1} else {rett=0}; return rett}
function mest_mnvi(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_mn_im||wd in mst_mn_ro||wd in mst_mn_vi)                                  {rett=1} else {rett=0}; return rett}
function mest_mnro(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_mn_ro)                                                                    {rett=1} else {rett=0}; return rett}
function mest_mnda(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_mn_da)                                                                    {rett=1} else {rett=0}; return rett}
function mest_mntv(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_mn_tv)                                                                    {rett=1} else {rett=0}; return rett}
function mest_mnpr(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in mst_mn_pr)                                                                    {rett=1} else {rett=0}; return rett}

# наречия
function nar_srav(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in nr_srv)                                                                         {rett=1} else {rett=0}; return rett}
function nar_kaq(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in nr_opka)                                                                        {rett=1} else {rett=0}; return rett}
function nar_spos(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in nr_opsp)                                                                        {rett=1} else {rett=0}; return rett}
function nar_step(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in nr_opst)                                                                        {rett=1} else {rett=0}; return rett}
function nar_vrem(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in nr_obvr)                                                                        {rett=1} else {rett=0}; return rett}
function nar_mest(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in nr_obme||wd in nr_mest)                                                         {rett=1} else {rett=0}; return rett}
function nar_napr(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in nr_obna)                                                                        {rett=1} else {rett=0}; return rett}
function nar_priq(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in nr_obpr)                                                                        {rett=1} else {rett=0}; return rett}
function nar_cel(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in nr_obce)                                                                        {rett=1} else {rett=0}; return rett}
function nar_vopr(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in nr_vopr)                                                                        {rett=1} else {rett=0}; return rett}
#function nar_pron(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in nr_mest)                                                                        {rett=1} else {rett=0}; return rett}
function nar_prev(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in nr_pv)                                                                          {rett=1} else {rett=0}; return rett}
function nar_nar(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in nr_nar)                                                                         {rett=1} else {rett=0}; return rett}
function nar_any(n,                                                                                                                             wd,rett) { if(!(wd))wd=lc(n);
                    if (wd in nr_srv||wd in nr_opka||wd in nr_opsp||wd in nr_opst||wd in nr_obvr||wd in nr_obme||wd in nr_mest||wd in nr_obna||
                        wd in nr_obpr||wd in nr_obce||wd in nr_vopr||wd in nr_pv||wd in nr_nar)                                                 {rett=1} else {rett=0}; return rett}

# предлоги
function pre_im(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in pred_im)                                                                        {rett=1} else {rett=0}; return rett}
function pre_vi(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in pred_vi)                                                                        {rett=1} else {rett=0}; return rett}
function pre_da(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in pred_da)                                                                        {rett=1} else {rett=0}; return rett}
function pre_pr(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in pred_pr)                                                                        {rett=1} else {rett=0}; return rett}
function pre_ro(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in pred_ro)                                                                        {rett=1} else {rett=0}; return rett}
function pre_tv(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in pred_tv)                                                                        {rett=1} else {rett=0}; return rett}
function pre_any(n,     wd,rett) { if(!(wd))wd=lc(n); if (wd in pred_im||wd in pred_vi||wd in pred_da||wd in pred_pr||wd in pred_ro||
	                wd in pred_tv)                                                                                                          {rett=1} else {rett=0}; return rett}

# Одиночные классы
function predik(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in predk)                                                                          {rett=1} else {rett=0}; return rett}
function mezd(n,        wd,rett) { if(!(wd))wd=lc(n); if (wd in mzd)                                                                            {rett=1} else {rett=0}; return rett}
function qast(n,        wd,rett) { if(!(wd))wd=lc(n); if (wd in qst)                                                                            {rett=1} else {rett=0}; return rett}
function vvod(n,        wd,rett) { if(!(wd))wd=lc(n); if (wd in vvodn)                                                                          {rett=1} else {rett=0}; return rett}
function souz(n,        wd,rett) { if(!(wd))wd=lc(n); if (wd in soyz)                                                                           {rett=1} else {rett=0}; return rett}
function souz_iili(n,   wd,rett) { if(!(wd))wd=lc(n); if (wd in soyz_iili)                                                                      {rett=1} else {rett=0}; return rett}
function titul(n,       wd,rett) { if(!(wd))wd=lc(n); if (wd in titl)                                                                           {rett=1} else {rett=0}; return rett}

# Числительные
function qik_im(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in qko_im||wd in qko_ze_im)                                                        {rett=1} else {rett=0}; return rett}
function qik_vi(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in qko_vi||wd in qko_ze_vi)                                                        {rett=1} else {rett=0}; return rett}
function qik_ro(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in qko_ro)                                                                         {rett=1} else {rett=0}; return rett}
function qik_da(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in qko_da)                                                                         {rett=1} else {rett=0}; return rett}
function qik_tv(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in qko_tv)                                                                         {rett=1} else {rett=0}; return rett}
function qik_pr(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in qko_pr)                                                                         {rett=1} else {rett=0}; return rett}
function qik_edim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qko_ed_ze_im||wd in qko_ed_mu_im||wd in qko_ed_sr_im||wd in qko_im)             {rett=1} else {rett=0}; return rett}
function qik_edvi(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qko_ed_ze_vi||wd in qko_ed_mu_vi||wd in qko_ed_sr_vi||wd in qko_vi)             {rett=1} else {rett=0}; return rett}
function qik_edro(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qko_ed_ze_ro||wd in qko_ed_mu_ro||wd in qko_ed_sr_ro||wd in qko_ro)             {rett=1} else {rett=0}; return rett}
function qik_edda(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qko_ed_ze_da||wd in qko_ed_mu_da||wd in qko_ed_sr_da||wd in qko_da)             {rett=1} else {rett=0}; return rett}
function qik_edtv(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qko_ed_ze_tv||wd in qko_ed_mu_tv||wd in qko_ed_sr_tv||wd in qko_tv)             {rett=1} else {rett=0}; return rett}
function qik_edpr(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qko_ed_ze_pr||wd in qko_ed_mu_pr||wd in qko_ed_sr_pr||wd in qko_pr)             {rett=1} else {rett=0}; return rett}
function qik_mnim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qko_mn_im)                                                                      {rett=1} else {rett=0}; return rett}
function qik_mnvi(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qko_mn_vi)                                                                      {rett=1} else {rett=0}; return rett}
function qik_mnro(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qko_mn_ro)                                                                      {rett=1} else {rett=0}; return rett}
function qik_mnda(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qko_mn_da)                                                                      {rett=1} else {rett=0}; return rett}
function qik_mntv(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qko_mn_tv)                                                                      {rett=1} else {rett=0}; return rett}
function qik_mnpr(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qko_mn_pr)                                                                      {rett=1} else {rett=0}; return rett}
function qip_edim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qpo_ed_ze_im||wd in qpo_ed_mu_im||wd in qpo_ed_sr_im)                           {rett=1} else {rett=0}; return rett}
function qip_edvi(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qpo_ed_ze_vi||wd in qpo_ed_mu_im||wd in qpo_ed_mu_ro||wd in qpo_ed_sr_vi)       {rett=1} else {rett=0}; return rett}
function qip_edro(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qpo_ed_ze_ro||wd in qpo_ed_mu_ro||wd in qpo_ed_sr_ro)                           {rett=1} else {rett=0}; return rett}
function qip_edda(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qpo_ed_ze_da||wd in qpo_ed_mu_da||wd in qpo_ed_sr_da)                           {rett=1} else {rett=0}; return rett}
function qip_edtv(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qpo_ed_ze_tv||wd in qpo_ed_mu_tv||wd in qpo_ed_sr_tv)                           {rett=1} else {rett=0}; return rett}
function qip_edpr(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qpo_ed_ze_pr||wd in qpo_ed_mu_pr||wd in qpo_ed_sr_pr)                           {rett=1} else {rett=0}; return rett}
function qip_mnim(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qpo_mn_im)                                                                      {rett=1} else {rett=0}; return rett}
function qip_mnvi(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qpo_mn_im||wd in qpo_mn_ro)                                                     {rett=1} else {rett=0}; return rett}
function qip_mnro(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qpo_mn_ro)                                                                      {rett=1} else {rett=0}; return rett}
function qip_mnda(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qpo_mn_da)                                                                      {rett=1} else {rett=0}; return rett}
function qip_mntv(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qpo_mn_tv)                                                                      {rett=1} else {rett=0}; return rett}
function qip_mnpr(n,    wd,rett) { if(!(wd))wd=lc(n); if (wd in qpo_mn_pr)                                                                      {rett=1} else {rett=0}; return rett}
function qin_im(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in qne_im)                                                                         {rett=1} else {rett=0}; return rett}
function qin_vi(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in qne_vi)                                                                         {rett=1} else {rett=0}; return rett}
function qin_ro(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in qne_ro)                                                                         {rett=1} else {rett=0}; return rett}
function qin_da(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in qne_da)                                                                         {rett=1} else {rett=0}; return rett}
function qin_tv(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in qne_tv)                                                                         {rett=1} else {rett=0}; return rett}
function qin_pr(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in qne_pr)                                                                         {rett=1} else {rett=0}; return rett}
function qis_im(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in qso_ze_im||wd in qso_im||wd in qso_mu_im||wd in qso_sr_im)                      {rett=1} else {rett=0}; return rett}
function qis_vi(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in qso_vi||wd in qso_ze_vi||wd in qso_mu_vi||wd in qso_sr_vi)                      {rett=1} else {rett=0}; return rett}
function qis_ro(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in qso_ze_ro||wd in qso_mu_ro||wd in qso_ro||wd in qso_sr_ro)                      {rett=1} else {rett=0}; return rett}
function qis_da(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in qso_da||wd in qso_ze_da||wd in qso_mu_da||wd in qso_sr_da)                      {rett=1} else {rett=0}; return rett}
function qis_tv(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in qso_ze_tv||wd in qso_mu_tv||wd in qso_sr_tv||wd in qso_tv)                      {rett=1} else {rett=0}; return rett}
function qis_pr(n,      wd,rett) { if(!(wd))wd=lc(n); if (wd in qso_ze_pr||wd in qso_mu_pr||wd in qso_pr||wd in qso_sr_pr)                      {rett=1} else {rett=0}; return rett}
function qi_ed(n,                                                                                                                               wd,rett) { if(!(wd))wd=lc(n);
                    if (wd in qko_ed_mu_da||wd in qko_ed_mu_im||wd in qko_ed_mu_pr||wd in qko_ed_mu_ro||wd in qko_ed_mu_tv||wd in qko_im||
                        wd in qko_ed_mu_vi||wd in qko_ed_sr_da||wd in qko_ed_sr_im||wd in qko_ed_sr_pr||wd in qko_ed_sr_ro||wd in qko_vi||
                        wd in qko_ed_sr_tv||wd in qko_ed_sr_vi||wd in qko_ed_ze_da||wd in qko_ed_ze_im||wd in qko_ed_ze_pr||wd in qko_ro||
                        wd in qko_ed_ze_ro||wd in qko_ed_ze_tv||wd in qko_ed_ze_vi||wd in qpo_ed_mu_da||wd in qpo_ed_mu_im||wd in qko_da||
                        wd in qpo_ed_mu_pr||wd in qpo_ed_mu_ro||wd in qpo_ed_mu_tv||wd in qpo_ed_sr_da||wd in qpo_ed_sr_im||wd in qko_tv||
                        wd in qpo_ed_sr_pr||wd in qpo_ed_sr_ro||wd in qpo_ed_sr_tv||wd in qpo_ed_sr_vi||wd in qpo_ed_ze_da||wd in qko_pr||
                        wd in qpo_ed_ze_im||wd in qpo_ed_ze_pr||wd in qpo_ed_ze_ro||wd in qpo_ed_ze_tv||wd in qpo_ed_ze_vi)                     {rett=1} else {rett=0}; return rett}
function qi_mn(n,                                                                                                                               wd,rett) { if(!(wd))wd=lc(n);
                    if (wd in qko_mn_vi||wd in qko_mn_da||wd in qko_mn_im||wd in qko_mn_pr||wd in qko_mn_ro||wd in qko_mn_tv||
                        wd in qpo_mn_im||wd in qpo_mn_ro||wd in qpo_mn_da||wd in qpo_mn_im||wd in qpo_mn_pr||wd in qpo_mn_ro||
                        wd in qpo_mn_tv||wd in qko_ze_im||wd in qko_ze_vi||wd in qne_im||wd in qne_vi||wd in qne_ro||wd in qne_da||
                        wd in qne_tv||wd in qne_pr)                                                                                             {rett=1} else {rett=0}; return rett}

# Обработанные омографы
function ist_any(n,                                                                                                                             wd,rett) { wd=tolower(l[i+n]);
                    if (wd in is_nar_mest||wd in is_nar_napr||wd in is_nar_spos||wd in is_nar_vrem||wd in is_prl_edmuim||
			wd in is_prl_edmupr||wd in is_prl_edmuvi||wd in is_prl_edsrpr||wd in is_prl_edzeda||wd in is_prl_edzeim||
			wd in is_prl_edzepr||wd in is_prl_edzero||wd in is_prl_edzetv||wd in is_prl_kred_mu||wd in is_prl_kred_ze||
			wd in is_prl_krmn||wd in is_suw_edmuda||wd in is_suw_edmuim||wd in is_suw_edmulo||wd in is_suw_edmune||
			wd in is_suw_edmupa||wd in is_suw_edmupr||wd in is_suw_edmuro||wd in is_suw_edmusq||wd in is_suw_edmutv||
			wd in is_suw_edmuvi||wd in is_suw_edsrda||wd in is_suw_edsrim||wd in is_suw_edsrne||wd in is_suw_edsrpr||
			wd in is_suw_edsrro||wd in is_suw_edsrtv||wd in is_suw_edsrvi||wd in is_suw_edsrzv||wd in is_suw_edzeda||
			wd in is_suw_edzeim||wd in is_suw_edzelo||wd in is_suw_edzepr||wd in is_suw_edzero||wd in is_suw_edzetv||
			wd in is_suw_edzevi||wd in is_suw_mnda||wd in is_suw_mnim||wd in is_suw_mnpr||wd in is_suw_mnro||
			wd in is_suw_mnvi||wd in is_suw_edmuro||wd in is_suw_edmuzv||wd in is_suw_edzero)                                       {rett=1} else {rett=0}; return rett}
function ist_nar_mest   (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_nar_mest    )                                                        {rett=1} else {rett=0}; return rett}
function ist_nar_napr   (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_nar_napr    )                                                        {rett=1} else {rett=0}; return rett}
function ist_nar_spos   (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_nar_spos    )                                                        {rett=1} else {rett=0}; return rett}
function ist_nar_vrem   (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_nar_vrem    )                                                        {rett=1} else {rett=0}; return rett}
function ist_prl_edmuim (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_prl_edmuim  )                                                        {rett=1} else {rett=0}; return rett}
function ist_prl_edmupr (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_prl_edmupr  )                                                        {rett=1} else {rett=0}; return rett}
function ist_prl_edmuvi (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_prl_edmuvi  )                                                        {rett=1} else {rett=0}; return rett}
function ist_prl_edsrpr (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_prl_edsrpr  )                                                        {rett=1} else {rett=0}; return rett}
function ist_prl_edzeda (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_prl_edzeda  )                                                        {rett=1} else {rett=0}; return rett}
function ist_prl_edzeim (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_prl_edzeim  )                                                        {rett=1} else {rett=0}; return rett}
function ist_prl_edzepr (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_prl_edzepr  )                                                        {rett=1} else {rett=0}; return rett}
function ist_prl_edzero (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_prl_edzero  )                                                        {rett=1} else {rett=0}; return rett}
function ist_prl_edzetv (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_prl_edzetv  )                                                        {rett=1} else {rett=0}; return rett}
function ist_prl_kred_mu(n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_prl_kred_mu )                                                        {rett=1} else {rett=0}; return rett}
function ist_prl_kred_ze(n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_prl_kred_ze )                                                        {rett=1} else {rett=0}; return rett}
function ist_prl_krmn   (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_prl_krmn    )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edmuda (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edmuda  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edmuim (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edmuim  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edmulo (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edmulo  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edmune (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edmune  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edmupa (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edmupa  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edmupr (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edmupr  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edmuro (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edmuro  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edmusq (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edmusq  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edmutv (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edmutv  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edmuvi (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edmuvi  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edmuzv (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edmuzv  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edsrda (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edsrda  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edsrim (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edsrim  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edsrne (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edsrne  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edsrpr (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edsrpr  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edsrro (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edsrro  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edsrtv (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edsrtv  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edsrvi (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edsrvi  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edsrzv (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edsrzv  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edzeda (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edzeda  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edzeim (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edzeim  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edzelo (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edzelo  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edzepr (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edzepr  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edzero (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edzero  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edzetv (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edzetv  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_edzevi (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edzevi  )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_mnda   (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_mnda    )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_mnim   (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_mnim    )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_mnpr   (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_mnpr    )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_mnro   (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_mnro    )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_mnvi   (n,    wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_mnvi    )                                                        {rett=1} else {rett=0}; return rett}
function ist_suw_im(n,   wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edmuim||wd in is_suw_edsrim||wd in is_suw_edzeim||wd in is_suw_mnim)   {rett=1} else {rett=0}; return rett}
function ist_suw_vi(n,   wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edmuvi||wd in is_suw_edsrvi||wd in is_suw_edzevi||wd in is_suw_mnvi)   {rett=1} else {rett=0}; return rett}
function ist_suw_ro(n,                                                                                                                          wd,rett) { wd=tolower(l[i+n]);
                    if (wd in is_suw_edmuro||wd in is_suw_edsrro||wd in is_suw_edzero||wd in is_suw_mnro||wd in is_suw_edmuro||
                        wd in is_suw_edzero)                                                                                                    {rett=1} else {rett=0}; return rett}
function ist_suw_da(n,  wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edmuda||wd in is_suw_edsrda||wd in is_suw_edzeda||wd in is_suw_mnda)    {rett=1} else {rett=0}; return rett}
function ist_suw_tv(n,  wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edmutv||wd in is_suw_edsrtv||wd in is_suw_edzetv)                       {rett=1} else {rett=0}; return rett}
function ist_suw_pr(n,  wd,rett) { wd=tolower(l[i+n]); if (wd in is_suw_edmupr||wd in is_suw_edsrpr||wd in is_suw_edzepr||wd in is_suw_mnpr)    {rett=1} else {rett=0}; return rett}

# наречные обороты
function narph_vrem(n,                                                                                                                          rett) {
                     if ( qxs(n,"на","мгновение")||
                          qxs(n,"время","от","времени")||
                          qxs(n,"в","этот тот","момент")||
                          qxs(n,"вчера завтра сегодня","утром днём вечером ночью")||
                          qxs(n,"до","сих тех этих","пор") )                                                                                    {rett=1} else {rett=0}; return rett }
function narph_napr(n,                                                                                                                          rett) {
                     if ( qxs(n,"во","все","стороны")||
                          qxs(n,"со","всех","направлений сторон")||
                          qxs(n,"перед передо","мной тобой вами нами ним ней ними собой") )                                                     {rett=1} else {rett=0}; return rett }
function narph_priq(n,                                                                                                                          rett) {
                     if ( qxs(n,"от","боли изумления радости страха удивления") )                                                               {rett=1} else {rett=0}; return rett }
function narph_kaq(n,                                                                                                                           rett) {
                     if ( qxs(n,"вовсе","не","нужно обязательно больно")||
                          qxs(n,"по","крайней меньшей","мере")||
                          qxs(n,"по","большому","счёту счету")||
                          qxs(n,"первым","делом")||
                          qxs(n,"не","нужно обязательно")  )                                                                                    {rett=1} else {rett=0}; return rett }
function narph_spos(n,                                                                                                                          rett) {
                     if ( qxs(n,"близко","к","сердцу")||
                          qxs(n,"в","общем","и","целом")||
                          qxs(n,"в","общем основном штыки целом")||
                          qxs(n,"друг","другу дружке")||
                          qxs(n,"друг","с","другом дружкой")||
                          qxs(n,"на","веру")||
                          qxs(n,"со","мной")||
                          qxs(n,"с","ходу тобой собой ней ним ними вами нами") )                                                                {rett=1} else {rett=0}; return rett }

function narph_any(n,   rett) { if ( narph_vrem(n)||narph_spos(n)||narph_kaq(n)||narph_napr(n)||narph_priq(n) )                                 {rett=1} else {rett=0}; return rett }

# составные "существительные" - обороты
function swc_edtv(n,                                                                                                                            rett) {
                     if ( qxs(n,"друг","другу дружке") )                                                                                        {rett=1} else {rett=0}; return rett }

function wordmark(n,   el, stopp, rett) { el=lc(n);
   if(el in dpn_ne_na              ) { rett = rett "#" dpn_ne_na              [el]; };
   if(el in dpn_ne_pa              ) { rett = rett "#" dpn_ne_pa              [el]; };
   if(el in dpn_pe_na              ) { rett = rett "#" dpn_pe_na              [el]; };
   if(el in dpn_pe_pa              ) { rett = rett "#" dpn_pe_pa              [el]; };
   if(el in dpn_pn_na              ) { rett = rett "#" dpn_pn_na              [el]; };
   if(el in dpn_pn_pa              ) { rett = rett "#" dpn_pn_pa              [el]; };
   if(el in dpn_vz_ne_na           ) { rett = rett "#" dpn_vz_ne_na           [el]; };
   if(el in dps_ne_pa              ) { rett = rett "#" dps_ne_pa              [el]; };
   if(el in dps_pe_pa              ) { rett = rett "#" dps_pe_pa              [el]; };
   if(el in dps_pn_pa              ) { rett = rett "#" dps_pn_pa              [el]; };
   if(el in dps_vz_ne_pa           ) { rett = rett "#" dps_vz_ne_pa           [el]; };
   if(el in g2_nebu_e1             ) { rett = rett "#" g2_nebu_e1             [el]; };
   if(el in g2_nebu_e2             ) { rett = rett "#" g2_nebu_e2             [el]; };
   if(el in g2_nebu_e3             ) { rett = rett "#" g2_nebu_e3             [el]; };
   if(el in g2_nebu_m1             ) { rett = rett "#" g2_nebu_m1             [el]; };
   if(el in g2_nebu_m2             ) { rett = rett "#" g2_nebu_m2             [el]; };
   if(el in g2_nebu_m3             ) { rett = rett "#" g2_nebu_m3             [el]; };
   if(el in g2_nein                ) { rett = rett "#" g2_nein                [el]; };
   if(el in g2_nena_e1             ) { rett = rett "#" g2_nena_e1             [el]; };
   if(el in g2_nena_e2             ) { rett = rett "#" g2_nena_e2             [el]; };
   if(el in g2_nena_e3             ) { rett = rett "#" g2_nena_e3             [el]; };
   if(el in g2_nena_m1             ) { rett = rett "#" g2_nena_m1             [el]; };
   if(el in g2_nena_m2             ) { rett = rett "#" g2_nena_m2             [el]; };
   if(el in g2_nena_m3             ) { rett = rett "#" g2_nena_m3             [el]; };
   if(el in g2_nepa_edmu           ) { rett = rett "#" g2_nepa_edmu           [el]; };
   if(el in g2_nepa_edsr           ) { rett = rett "#" g2_nepa_edsr           [el]; };
   if(el in g2_nepa_edze           ) { rett = rett "#" g2_nepa_edze           [el]; };
   if(el in g2_nepa_mn             ) { rett = rett "#" g2_nepa_mn             [el]; };
   if(el in g2_nepo_ed             ) { rett = rett "#" g2_nepo_ed             [el]; };
   if(el in g2_nepo_mn             ) { rett = rett "#" g2_nepo_mn             [el]; };
   if(el in g2_pebu_e1             ) { rett = rett "#" g2_pebu_e1             [el]; };
   if(el in g2_pebu_e2             ) { rett = rett "#" g2_pebu_e2             [el]; };
   if(el in g2_pebu_e3             ) { rett = rett "#" g2_pebu_e3             [el]; };
   if(el in g2_pebu_m1             ) { rett = rett "#" g2_pebu_m1             [el]; };
   if(el in g2_pebu_m2             ) { rett = rett "#" g2_pebu_m2             [el]; };
   if(el in g2_pebu_m3             ) { rett = rett "#" g2_pebu_m3             [el]; };
   if(el in g2_pein                ) { rett = rett "#" g2_pein                [el]; };
   if(el in g2_pena_e1             ) { rett = rett "#" g2_pena_e1             [el]; };
   if(el in g2_pena_e2             ) { rett = rett "#" g2_pena_e2             [el]; };
   if(el in g2_pena_e3             ) { rett = rett "#" g2_pena_e3             [el]; };
   if(el in g2_pena_m1             ) { rett = rett "#" g2_pena_m1             [el]; };
   if(el in g2_pena_m2             ) { rett = rett "#" g2_pena_m2             [el]; };
   if(el in g2_pena_m3             ) { rett = rett "#" g2_pena_m3             [el]; };
   if(el in g2_pepa_edmu           ) { rett = rett "#" g2_pepa_edmu           [el]; };
   if(el in g2_pepa_edsr           ) { rett = rett "#" g2_pepa_edsr           [el]; };
   if(el in g2_pepa_edze           ) { rett = rett "#" g2_pepa_edze           [el]; };
   if(el in g2_pepa_mn             ) { rett = rett "#" g2_pepa_mn             [el]; };
   if(el in g2_pepo_ed             ) { rett = rett "#" g2_pepo_ed             [el]; };
   if(el in g2_pepo_mn             ) { rett = rett "#" g2_pepo_mn             [el]; };
   if(el in g2_pnbu_e1             ) { rett = rett "#" g2_pnbu_e1             [el]; };
   if(el in g2_pnbu_e2             ) { rett = rett "#" g2_pnbu_e2             [el]; };
   if(el in g2_pnbu_e3             ) { rett = rett "#" g2_pnbu_e3             [el]; };
   if(el in g2_pnbu_m1             ) { rett = rett "#" g2_pnbu_m1             [el]; };
   if(el in g2_pnbu_m2             ) { rett = rett "#" g2_pnbu_m2             [el]; };
   if(el in g2_pnbu_m3             ) { rett = rett "#" g2_pnbu_m3             [el]; };
   if(el in g2_pnin                ) { rett = rett "#" g2_pnin                [el]; };
   if(el in g2_pnna_e1             ) { rett = rett "#" g2_pnna_e1             [el]; };
   if(el in g2_pnna_e2             ) { rett = rett "#" g2_pnna_e2             [el]; };
   if(el in g2_pnna_e3             ) { rett = rett "#" g2_pnna_e3             [el]; };
   if(el in g2_pnna_m1             ) { rett = rett "#" g2_pnna_m1             [el]; };
   if(el in g2_pnna_m2             ) { rett = rett "#" g2_pnna_m2             [el]; };
   if(el in g2_pnna_m3             ) { rett = rett "#" g2_pnna_m3             [el]; };
   if(el in g2_pnpa_edmu           ) { rett = rett "#" g2_pnpa_edmu           [el]; };
   if(el in g2_pnpa_edsr           ) { rett = rett "#" g2_pnpa_edsr           [el]; };
   if(el in g2_pnpa_edze           ) { rett = rett "#" g2_pnpa_edze           [el]; };
   if(el in g2_pnpa_mn             ) { rett = rett "#" g2_pnpa_mn             [el]; };
   if(el in g2_pnpo_ed             ) { rett = rett "#" g2_pnpo_ed             [el]; };
   if(el in g2_pnpo_mn             ) { rett = rett "#" g2_pnpo_mn             [el]; };
   if(el in g2_vz_nebu_e1          ) { rett = rett "#" g2_vz_nebu_e1          [el]; };
   if(el in g2_vz_nebu_e2          ) { rett = rett "#" g2_vz_nebu_e2          [el]; };
   if(el in g2_vz_nebu_e3          ) { rett = rett "#" g2_vz_nebu_e3          [el]; };
   if(el in g2_vz_nebu_m1          ) { rett = rett "#" g2_vz_nebu_m1          [el]; };
   if(el in g2_vz_nebu_m2          ) { rett = rett "#" g2_vz_nebu_m2          [el]; };
   if(el in g2_vz_nebu_m3          ) { rett = rett "#" g2_vz_nebu_m3          [el]; };
   if(el in g2_vz_nein             ) { rett = rett "#" g2_vz_nein             [el]; };
   if(el in g2_vz_nena_e1          ) { rett = rett "#" g2_vz_nena_e1          [el]; };
   if(el in g2_vz_nena_e2          ) { rett = rett "#" g2_vz_nena_e2          [el]; };
   if(el in g2_vz_nena_e3          ) { rett = rett "#" g2_vz_nena_e3          [el]; };
   if(el in g2_vz_nena_m1          ) { rett = rett "#" g2_vz_nena_m1          [el]; };
   if(el in g2_vz_nena_m2          ) { rett = rett "#" g2_vz_nena_m2          [el]; };
   if(el in g2_vz_nena_m3          ) { rett = rett "#" g2_vz_nena_m3          [el]; };
   if(el in g2_vz_nepa_edmu        ) { rett = rett "#" g2_vz_nepa_edmu        [el]; };
   if(el in g2_vz_nepa_edsr        ) { rett = rett "#" g2_vz_nepa_edsr        [el]; };
   if(el in g2_vz_nepa_edze        ) { rett = rett "#" g2_vz_nepa_edze        [el]; };
   if(el in g2_vz_nepa_mn          ) { rett = rett "#" g2_vz_nepa_mn          [el]; };
   if(el in g2_vz_nepo_ed          ) { rett = rett "#" g2_vz_nepo_ed          [el]; };
   if(el in g2_vz_nepo_mn          ) { rett = rett "#" g2_vz_nepo_mn          [el]; };
   if(el in gn_nein                ) { rett = rett "#" gn_nein                [el]; };
   if(el in gn_nein_bz             ) { rett = rett "#" gn_nein_bz             [el]; };
   if(el in gn_nena_e1             ) { rett = rett "#" gn_nena_e1             [el]; };
   if(el in gn_nena_e2             ) { rett = rett "#" gn_nena_e2             [el]; };
   if(el in gn_nena_e3             ) { rett = rett "#" gn_nena_e3             [el]; };
   if(el in gn_nena_m1             ) { rett = rett "#" gn_nena_m1             [el]; };
   if(el in gn_nena_m2             ) { rett = rett "#" gn_nena_m2             [el]; };
   if(el in gn_nena_m3             ) { rett = rett "#" gn_nena_m3             [el]; };
   if(el in gn_nepa_edmu           ) { rett = rett "#" gn_nepa_edmu           [el]; };
   if(el in gn_nepa_edsr           ) { rett = rett "#" gn_nepa_edsr           [el]; };
   if(el in gn_nepa_edze           ) { rett = rett "#" gn_nepa_edze           [el]; };
   if(el in gn_nepa_mn             ) { rett = rett "#" gn_nepa_mn             [el]; };
   if(el in gn_nepo_ed             ) { rett = rett "#" gn_nepo_ed             [el]; };
   if(el in gn_nepo_mn             ) { rett = rett "#" gn_nepo_mn             [el]; };
   if(el in gn_pein                ) { rett = rett "#" gn_pein                [el]; };
   if(el in gn_pein_bz             ) { rett = rett "#" gn_pein_bz             [el]; };
   if(el in gn_pena_e1             ) { rett = rett "#" gn_pena_e1             [el]; };
   if(el in gn_pena_e2             ) { rett = rett "#" gn_pena_e2             [el]; };
   if(el in gn_pena_e3             ) { rett = rett "#" gn_pena_e3             [el]; };
   if(el in gn_pena_m1             ) { rett = rett "#" gn_pena_m1             [el]; };
   if(el in gn_pena_m2             ) { rett = rett "#" gn_pena_m2             [el]; };
   if(el in gn_pena_m3             ) { rett = rett "#" gn_pena_m3             [el]; };
   if(el in gn_pepa_edmu           ) { rett = rett "#" gn_pepa_edmu           [el]; };
   if(el in gn_pepa_edsr           ) { rett = rett "#" gn_pepa_edsr           [el]; };
   if(el in gn_pepa_edze           ) { rett = rett "#" gn_pepa_edze           [el]; };
   if(el in gn_pepa_mn             ) { rett = rett "#" gn_pepa_mn             [el]; };
   if(el in gn_pepo_ed             ) { rett = rett "#" gn_pepo_ed             [el]; };
   if(el in gn_pepo_mn             ) { rett = rett "#" gn_pepo_mn             [el]; };
   if(el in gn_pnin                ) { rett = rett "#" gn_pnin                [el]; };
   if(el in gn_pnna_e1             ) { rett = rett "#" gn_pnna_e1             [el]; };
   if(el in gn_pnna_e2             ) { rett = rett "#" gn_pnna_e2             [el]; };
   if(el in gn_pnna_e3             ) { rett = rett "#" gn_pnna_e3             [el]; };
   if(el in gn_pnna_m1             ) { rett = rett "#" gn_pnna_m1             [el]; };
   if(el in gn_pnna_m2             ) { rett = rett "#" gn_pnna_m2             [el]; };
   if(el in gn_pnna_m3             ) { rett = rett "#" gn_pnna_m3             [el]; };
   if(el in gn_pnpa_edmu           ) { rett = rett "#" gn_pnpa_edmu           [el]; };
   if(el in gn_pnpa_edsr           ) { rett = rett "#" gn_pnpa_edsr           [el]; };
   if(el in gn_pnpa_edze           ) { rett = rett "#" gn_pnpa_edze           [el]; };
   if(el in gn_pnpa_mn             ) { rett = rett "#" gn_pnpa_mn             [el]; };
   if(el in gn_pnpo_ed             ) { rett = rett "#" gn_pnpo_ed             [el]; };
   if(el in gn_pnpo_mn             ) { rett = rett "#" gn_pnpo_mn             [el]; };
   if(el in gn_vz_ne_in            ) { rett = rett "#" gn_vz_ne_in            [el]; };
   if(el in gn_vz_nein_bz          ) { rett = rett "#" gn_vz_nein_bz          [el]; };
   if(el in gn_vz_nena_e1          ) { rett = rett "#" gn_vz_nena_e1          [el]; };
   if(el in gn_vz_nena_e2          ) { rett = rett "#" gn_vz_nena_e2          [el]; };
   if(el in gn_vz_nena_e3          ) { rett = rett "#" gn_vz_nena_e3          [el]; };
   if(el in gn_vz_nena_m1          ) { rett = rett "#" gn_vz_nena_m1          [el]; };
   if(el in gn_vz_nena_m2          ) { rett = rett "#" gn_vz_nena_m2          [el]; };
   if(el in gn_vz_nena_m3          ) { rett = rett "#" gn_vz_nena_m3          [el]; };
   if(el in gn_vz_nepa_edmu        ) { rett = rett "#" gn_vz_nepa_edmu        [el]; };
   if(el in gn_vz_nepa_edsr        ) { rett = rett "#" gn_vz_nepa_edsr        [el]; };
   if(el in gn_vz_nepa_edze        ) { rett = rett "#" gn_vz_nepa_edze        [el]; };
   if(el in gn_vz_nepa_mn          ) { rett = rett "#" gn_vz_nepa_mn          [el]; };
   if(el in gn_vz_nepo_ed          ) { rett = rett "#" gn_vz_nepo_ed          [el]; };
   if(el in gn_vz_nepo_mn          ) { rett = rett "#" gn_vz_nepo_mn          [el]; };
   if(el in gs_nebu_e1             ) { rett = rett "#" gs_nebu_e1             [el]; };
   if(el in gs_nebu_e2             ) { rett = rett "#" gs_nebu_e2             [el]; };
   if(el in gs_nebu_e3             ) { rett = rett "#" gs_nebu_e3             [el]; };
   if(el in gs_nebu_m1             ) { rett = rett "#" gs_nebu_m1             [el]; };
   if(el in gs_nebu_m2             ) { rett = rett "#" gs_nebu_m2             [el]; };
   if(el in gs_nebu_m3             ) { rett = rett "#" gs_nebu_m3             [el]; };
   if(el in gs_nein                ) { rett = rett "#" gs_nein                [el]; };
   if(el in gs_nein_bz             ) { rett = rett "#" gs_nein_bz             [el]; };
   if(el in gs_nepa_edmu           ) { rett = rett "#" gs_nepa_edmu           [el]; };
   if(el in gs_nepa_edsr           ) { rett = rett "#" gs_nepa_edsr           [el]; };
   if(el in gs_nepa_edze           ) { rett = rett "#" gs_nepa_edze           [el]; };
   if(el in gs_nepa_mn             ) { rett = rett "#" gs_nepa_mn             [el]; };
   if(el in gs_nepo_ed             ) { rett = rett "#" gs_nepo_ed             [el]; };
   if(el in gs_nepo_mn             ) { rett = rett "#" gs_nepo_mn             [el]; };
   if(el in gs_pebu_e1             ) { rett = rett "#" gs_pebu_e1             [el]; };
   if(el in gs_pebu_e2             ) { rett = rett "#" gs_pebu_e2             [el]; };
   if(el in gs_pebu_e3             ) { rett = rett "#" gs_pebu_e3             [el]; };
   if(el in gs_pebu_m1             ) { rett = rett "#" gs_pebu_m1             [el]; };
   if(el in gs_pebu_m2             ) { rett = rett "#" gs_pebu_m2             [el]; };
   if(el in gs_pebu_m3             ) { rett = rett "#" gs_pebu_m3             [el]; };
   if(el in gs_pein                ) { rett = rett "#" gs_pein                [el]; };
   if(el in gs_pein_bz             ) { rett = rett "#" gs_pein_bz             [el]; };
   if(el in gs_pepa_edmu           ) { rett = rett "#" gs_pepa_edmu           [el]; };
   if(el in gs_pepa_edsr           ) { rett = rett "#" gs_pepa_edsr           [el]; };
   if(el in gs_pepa_edze           ) { rett = rett "#" gs_pepa_edze           [el]; };
   if(el in gs_pepa_mn             ) { rett = rett "#" gs_pepa_mn             [el]; };
   if(el in gs_pepo_ed             ) { rett = rett "#" gs_pepo_ed             [el]; };
   if(el in gs_pepo_mn             ) { rett = rett "#" gs_pepo_mn             [el]; };
   if(el in gs_pnbu_e1             ) { rett = rett "#" gs_pnbu_e1             [el]; };
   if(el in gs_pnbu_e2             ) { rett = rett "#" gs_pnbu_e2             [el]; };
   if(el in gs_pnbu_e3             ) { rett = rett "#" gs_pnbu_e3             [el]; };
   if(el in gs_pnbu_m1             ) { rett = rett "#" gs_pnbu_m1             [el]; };
   if(el in gs_pnbu_m2             ) { rett = rett "#" gs_pnbu_m2             [el]; };
   if(el in gs_pnbu_m3             ) { rett = rett "#" gs_pnbu_m3             [el]; };
   if(el in gs_pnin                ) { rett = rett "#" gs_pnin                [el]; };
   if(el in gs_pnpa_edmu           ) { rett = rett "#" gs_pnpa_edmu           [el]; };
   if(el in gs_pnpa_edsr           ) { rett = rett "#" gs_pnpa_edsr           [el]; };
   if(el in gs_pnpa_edze           ) { rett = rett "#" gs_pnpa_edze           [el]; };
   if(el in gs_pnpa_mn             ) { rett = rett "#" gs_pnpa_mn             [el]; };
   if(el in gs_pnpo_ed             ) { rett = rett "#" gs_pnpo_ed             [el]; };
   if(el in gs_pnpo_mn             ) { rett = rett "#" gs_pnpo_mn             [el]; };
   if(el in gs_vz_nebu_e1          ) { rett = rett "#" gs_vz_nebu_e1          [el]; };
   if(el in gs_vz_nebu_e2          ) { rett = rett "#" gs_vz_nebu_e2          [el]; };
   if(el in gs_vz_nebu_e3          ) { rett = rett "#" gs_vz_nebu_e3          [el]; };
   if(el in gs_vz_nebu_m1          ) { rett = rett "#" gs_vz_nebu_m1          [el]; };
   if(el in gs_vz_nebu_m2          ) { rett = rett "#" gs_vz_nebu_m2          [el]; };
   if(el in gs_vz_nebu_m3          ) { rett = rett "#" gs_vz_nebu_m3          [el]; };
   if(el in gs_vz_nein             ) { rett = rett "#" gs_vz_nein             [el]; };
   if(el in gs_vz_nein_bz          ) { rett = rett "#" gs_vz_nein_bz          [el]; };
   if(el in gs_vz_nepa_edmu        ) { rett = rett "#" gs_vz_nepa_edmu        [el]; };
   if(el in gs_vz_nepa_edsr        ) { rett = rett "#" gs_vz_nepa_edsr        [el]; };
   if(el in gs_vz_nepa_edze        ) { rett = rett "#" gs_vz_nepa_edze        [el]; };
   if(el in gs_vz_nepa_mn          ) { rett = rett "#" gs_vz_nepa_mn          [el]; };
   if(el in gs_vz_nepo_ed          ) { rett = rett "#" gs_vz_nepo_ed          [el]; };
   if(el in gs_vz_nepo_mn          ) { rett = rett "#" gs_vz_nepo_mn          [el]; };
   if(el in mst_da                 ) { rett = rett "#" mst_da                 [el]; };
   if(el in mst_ed_da              ) { rett = rett "#" mst_ed_da              [el]; };
   if(el in mst_ed_im              ) { rett = rett "#" mst_ed_im              [el]; };
   if(el in mst_ed_mu              ) { rett = rett "#" mst_ed_mu              [el]; };
   if(el in mst_ed_mu_da           ) { rett = rett "#" mst_ed_mu_da           [el]; };
   if(el in mst_ed_mu_im           ) { rett = rett "#" mst_ed_mu_im           [el]; };
   if(el in mst_ed_mu_pr           ) { rett = rett "#" mst_ed_mu_pr           [el]; };
   if(el in mst_ed_mu_ro           ) { rett = rett "#" mst_ed_mu_ro           [el]; };
   if(el in mst_ed_mu_tv           ) { rett = rett "#" mst_ed_mu_tv           [el]; };
   if(el in mst_ed_mu_vi           ) { rett = rett "#" mst_ed_mu_vi           [el]; };
   if(el in mst_ed_pr              ) { rett = rett "#" mst_ed_pr              [el]; };
   if(el in mst_ed_ro              ) { rett = rett "#" mst_ed_ro              [el]; };
   if(el in mst_ed_sr              ) { rett = rett "#" mst_ed_sr              [el]; };
   if(el in mst_ed_sr_da           ) { rett = rett "#" mst_ed_sr_da           [el]; };
   if(el in mst_ed_sr_im           ) { rett = rett "#" mst_ed_sr_im           [el]; };
   if(el in mst_ed_sr_pr           ) { rett = rett "#" mst_ed_sr_pr           [el]; };
   if(el in mst_ed_sr_ro           ) { rett = rett "#" mst_ed_sr_ro           [el]; };
   if(el in mst_ed_sr_tv           ) { rett = rett "#" mst_ed_sr_tv           [el]; };
   if(el in mst_ed_sr_vi           ) { rett = rett "#" mst_ed_sr_vi           [el]; };
   if(el in mst_ed_tv              ) { rett = rett "#" mst_ed_tv              [el]; };
   if(el in mst_ed_vi              ) { rett = rett "#" mst_ed_vi              [el]; };
   if(el in mst_ed_ze              ) { rett = rett "#" mst_ed_ze              [el]; };
   if(el in mst_ed_ze_da           ) { rett = rett "#" mst_ed_ze_da           [el]; };
   if(el in mst_ed_ze_im           ) { rett = rett "#" mst_ed_ze_im           [el]; };
   if(el in mst_ed_ze_pr           ) { rett = rett "#" mst_ed_ze_pr           [el]; };
   if(el in mst_ed_ze_ro           ) { rett = rett "#" mst_ed_ze_ro           [el]; };
   if(el in mst_ed_ze_tv           ) { rett = rett "#" mst_ed_ze_tv           [el]; };
   if(el in mst_ed_ze_vi           ) { rett = rett "#" mst_ed_ze_vi           [el]; };
   if(el in mst_im                 ) { rett = rett "#" mst_im                 [el]; };
   if(el in mst_mn                 ) { rett = rett "#" mst_mn                 [el]; };
   if(el in mst_mn_da              ) { rett = rett "#" mst_mn_da              [el]; };
   if(el in mst_mn_im              ) { rett = rett "#" mst_mn_im              [el]; };
   if(el in mst_mn_pr              ) { rett = rett "#" mst_mn_pr              [el]; };
   if(el in mst_mn_ro              ) { rett = rett "#" mst_mn_ro              [el]; };
   if(el in mst_mn_tv              ) { rett = rett "#" mst_mn_tv              [el]; };
   if(el in mst_mn_vi              ) { rett = rett "#" mst_mn_vi              [el]; };
   if(el in mst_pr                 ) { rett = rett "#" mst_pr                 [el]; };
   if(el in mst_ro                 ) { rett = rett "#" mst_ro                 [el]; };
   if(el in mst_suw                ) { rett = rett "#" mst_suw                [el]; };
   if(el in mst_tv                 ) { rett = rett "#" mst_tv                 [el]; };
   if(el in mst_vi                 ) { rett = rett "#" mst_vi                 [el]; };
   if(el in mzd                    ) { rett = rett "#" mzd                    [el]; };
   if(el in nr_mest                ) { rett = rett "#" nr_mest                [el]; };
   if(el in nr_nar                 ) { rett = rett "#" nr_nar                 [el]; };
   if(el in nr_obce                ) { rett = rett "#" nr_obce                [el]; };
   if(el in nr_obme                ) { rett = rett "#" nr_obme                [el]; };
   if(el in nr_obna                ) { rett = rett "#" nr_obna                [el]; };
   if(el in nr_obpr                ) { rett = rett "#" nr_obpr                [el]; };
   if(el in nr_obvr                ) { rett = rett "#" nr_obvr                [el]; };
   if(el in nr_opka                ) { rett = rett "#" nr_opka                [el]; };
   if(el in nr_opsp                ) { rett = rett "#" nr_opsp                [el]; };
   if(el in nr_opst                ) { rett = rett "#" nr_opst                [el]; };
   if(el in nr_pv                  ) { rett = rett "#" nr_pv                  [el]; };
   if(el in nr_srv                 ) { rett = rett "#" nr_srv                 [el]; };
   if(el in nr_vopr                ) { rett = rett "#" nr_vopr                [el]; };
   if(el in pl_edmu_da             ) { rett = rett "#" pl_edmu_da             [el]; };
   if(el in pl_edmu_im             ) { rett = rett "#" pl_edmu_im             [el]; };
   if(el in pl_edmu_pr             ) { rett = rett "#" pl_edmu_pr             [el]; };
   if(el in pl_edmu_ro             ) { rett = rett "#" pl_edmu_ro             [el]; };
   if(el in pl_edmu_tv             ) { rett = rett "#" pl_edmu_tv             [el]; };
   if(el in pl_edsr_da             ) { rett = rett "#" pl_edsr_da             [el]; };
   if(el in pl_edsr_im             ) { rett = rett "#" pl_edsr_im             [el]; };
   if(el in pl_edsr_pr             ) { rett = rett "#" pl_edsr_pr             [el]; };
   if(el in pl_edsr_ro             ) { rett = rett "#" pl_edsr_ro             [el]; };
   if(el in pl_edsr_tv             ) { rett = rett "#" pl_edsr_tv             [el]; };
   if(el in pl_edze_dr             ) { rett = rett "#" pl_edze_dr             [el]; };
   if(el in pl_edze_im             ) { rett = rett "#" pl_edze_im             [el]; };
   if(el in pl_edze_tv             ) { rett = rett "#" pl_edze_tv             [el]; };
   if(el in pl_edze_vi             ) { rett = rett "#" pl_edze_vi             [el]; };
   if(el in pl_kred_mu             ) { rett = rett "#" pl_kred_mu             [el]; };
   if(el in pl_kred_sr             ) { rett = rett "#" pl_kred_sr             [el]; };
   if(el in pl_kred_ze             ) { rett = rett "#" pl_kred_ze             [el]; };
   if(el in pl_krmn                ) { rett = rett "#" pl_krmn                [el]; };
   if(el in pl_mn_da               ) { rett = rett "#" pl_mn_da               [el]; };
   if(el in pl_mn_im               ) { rett = rett "#" pl_mn_im               [el]; };
   if(el in pl_mn_ro               ) { rett = rett "#" pl_mn_ro               [el]; };
   if(el in pl_mn_tv               ) { rett = rett "#" pl_mn_tv               [el]; };
   if(el in pl_neiz                ) { rett = rett "#" pl_neiz                [el]; };
   if(el in pl_pv_edmu_da          ) { rett = rett "#" pl_pv_edmu_da          [el]; };
   if(el in pl_pv_edmu_im          ) { rett = rett "#" pl_pv_edmu_im          [el]; };
   if(el in pl_pv_edmu_pr          ) { rett = rett "#" pl_pv_edmu_pr          [el]; };
   if(el in pl_pv_edmu_ro          ) { rett = rett "#" pl_pv_edmu_ro          [el]; };
   if(el in pl_pv_edmu_tv          ) { rett = rett "#" pl_pv_edmu_tv          [el]; };
   if(el in pl_pv_edsr_da          ) { rett = rett "#" pl_pv_edsr_da          [el]; };
   if(el in pl_pv_edsr_im          ) { rett = rett "#" pl_pv_edsr_im          [el]; };
   if(el in pl_pv_edsr_pr          ) { rett = rett "#" pl_pv_edsr_pr          [el]; };
   if(el in pl_pv_edsr_ro          ) { rett = rett "#" pl_pv_edsr_ro          [el]; };
   if(el in pl_pv_edsr_tv          ) { rett = rett "#" pl_pv_edsr_tv          [el]; };
   if(el in pl_pv_edze_dr          ) { rett = rett "#" pl_pv_edze_dr          [el]; };
   if(el in pl_pv_edze_im          ) { rett = rett "#" pl_pv_edze_im          [el]; };
   if(el in pl_pv_edze_tv          ) { rett = rett "#" pl_pv_edze_tv          [el]; };
   if(el in pl_pv_edze_vi          ) { rett = rett "#" pl_pv_edze_vi          [el]; };
   if(el in pl_pv_mn_da            ) { rett = rett "#" pl_pv_mn_da            [el]; };
   if(el in pl_pv_mn_im            ) { rett = rett "#" pl_pv_mn_im            [el]; };
   if(el in pl_pv_mn_pr            ) { rett = rett "#" pl_pv_mn_pr            [el]; };
   if(el in pl_pv_mn_ro            ) { rett = rett "#" pl_pv_mn_ro            [el]; };
   if(el in pl_pv_mn_tv            ) { rett = rett "#" pl_pv_mn_tv            [el]; };
   if(el in pl_srv                 ) { rett = rett "#" pl_srv                 [el]; };
   if(el in pq2_ne_na_ed_mu_da     ) { rett = rett "#" pq2_ne_na_ed_mu_da     [el]; };
   if(el in pq2_ne_na_ed_mu_im     ) { rett = rett "#" pq2_ne_na_ed_mu_im     [el]; };
   if(el in pq2_ne_na_ed_mu_pr     ) { rett = rett "#" pq2_ne_na_ed_mu_pr     [el]; };
   if(el in pq2_ne_na_ed_mu_ro     ) { rett = rett "#" pq2_ne_na_ed_mu_ro     [el]; };
   if(el in pq2_ne_na_ed_mu_tv     ) { rett = rett "#" pq2_ne_na_ed_mu_tv     [el]; };
   if(el in pq2_ne_pa_ed_mu_da     ) { rett = rett "#" pq2_ne_pa_ed_mu_da     [el]; };
   if(el in pq2_ne_pa_ed_mu_im     ) { rett = rett "#" pq2_ne_pa_ed_mu_im     [el]; };
   if(el in pq2_ne_pa_ed_mu_pr     ) { rett = rett "#" pq2_ne_pa_ed_mu_pr     [el]; };
   if(el in pq2_ne_pa_ed_mu_ro     ) { rett = rett "#" pq2_ne_pa_ed_mu_ro     [el]; };
   if(el in pq2_ne_pa_ed_mu_tv     ) { rett = rett "#" pq2_ne_pa_ed_mu_tv     [el]; };
   if(el in pq2_ne_vz_na_ed_mu_da  ) { rett = rett "#" pq2_ne_vz_na_ed_mu_da  [el]; };
   if(el in pq2_ne_vz_na_ed_mu_im  ) { rett = rett "#" pq2_ne_vz_na_ed_mu_im  [el]; };
   if(el in pq2_ne_vz_na_ed_mu_pr  ) { rett = rett "#" pq2_ne_vz_na_ed_mu_pr  [el]; };
   if(el in pq2_ne_vz_na_ed_mu_ro  ) { rett = rett "#" pq2_ne_vz_na_ed_mu_ro  [el]; };
   if(el in pq2_ne_vz_na_ed_mu_tv  ) { rett = rett "#" pq2_ne_vz_na_ed_mu_tv  [el]; };
   if(el in pq2_ne_vz_pa_ed_mu_da  ) { rett = rett "#" pq2_ne_vz_pa_ed_mu_da  [el]; };
   if(el in pq2_ne_vz_pa_ed_mu_im  ) { rett = rett "#" pq2_ne_vz_pa_ed_mu_im  [el]; };
   if(el in pq2_ne_vz_pa_ed_mu_pr  ) { rett = rett "#" pq2_ne_vz_pa_ed_mu_pr  [el]; };
   if(el in pq2_ne_vz_pa_ed_mu_ro  ) { rett = rett "#" pq2_ne_vz_pa_ed_mu_ro  [el]; };
   if(el in pq2_ne_vz_pa_ed_mu_tv  ) { rett = rett "#" pq2_ne_vz_pa_ed_mu_tv  [el]; };
   if(el in pq2_pe_na_ed_mu_da     ) { rett = rett "#" pq2_pe_na_ed_mu_da     [el]; };
   if(el in pq2_pe_na_ed_mu_im     ) { rett = rett "#" pq2_pe_na_ed_mu_im     [el]; };
   if(el in pq2_pe_na_ed_mu_pr     ) { rett = rett "#" pq2_pe_na_ed_mu_pr     [el]; };
   if(el in pq2_pe_na_ed_mu_ro     ) { rett = rett "#" pq2_pe_na_ed_mu_ro     [el]; };
   if(el in pq2_pe_na_ed_mu_tv     ) { rett = rett "#" pq2_pe_na_ed_mu_tv     [el]; };
   if(el in pq2_pe_pa_ed_mu_da     ) { rett = rett "#" pq2_pe_pa_ed_mu_da     [el]; };
   if(el in pq2_pe_pa_ed_mu_im     ) { rett = rett "#" pq2_pe_pa_ed_mu_im     [el]; };
   if(el in pq2_pe_pa_ed_mu_pr     ) { rett = rett "#" pq2_pe_pa_ed_mu_pr     [el]; };
   if(el in pq2_pe_pa_ed_mu_ro     ) { rett = rett "#" pq2_pe_pa_ed_mu_ro     [el]; };
   if(el in pq2_pe_pa_ed_mu_tv     ) { rett = rett "#" pq2_pe_pa_ed_mu_tv     [el]; };
   if(el in pq2_pe_sd_na_ed_mu_da  ) { rett = rett "#" pq2_pe_sd_na_ed_mu_da  [el]; };
   if(el in pq2_pe_sd_na_ed_mu_im  ) { rett = rett "#" pq2_pe_sd_na_ed_mu_im  [el]; };
   if(el in pq2_pe_sd_na_ed_mu_pr  ) { rett = rett "#" pq2_pe_sd_na_ed_mu_pr  [el]; };
   if(el in pq2_pe_sd_na_ed_mu_ro  ) { rett = rett "#" pq2_pe_sd_na_ed_mu_ro  [el]; };
   if(el in pq2_pe_sd_na_ed_mu_tv  ) { rett = rett "#" pq2_pe_sd_na_ed_mu_tv  [el]; };
   if(el in pq2_pe_sd_pa_ed_mu_da  ) { rett = rett "#" pq2_pe_sd_pa_ed_mu_da  [el]; };
   if(el in pq2_pe_sd_pa_ed_mu_im  ) { rett = rett "#" pq2_pe_sd_pa_ed_mu_im  [el]; };
   if(el in pq2_pe_sd_pa_ed_mu_pr  ) { rett = rett "#" pq2_pe_sd_pa_ed_mu_pr  [el]; };
   if(el in pq2_pe_sd_pa_ed_mu_ro  ) { rett = rett "#" pq2_pe_sd_pa_ed_mu_ro  [el]; };
   if(el in pq2_pe_sd_pa_ed_mu_tv  ) { rett = rett "#" pq2_pe_sd_pa_ed_mu_tv  [el]; };
   if(el in pq2_pn_na_ed_mu_da     ) { rett = rett "#" pq2_pn_na_ed_mu_da     [el]; };
   if(el in pq2_pn_na_ed_mu_im     ) { rett = rett "#" pq2_pn_na_ed_mu_im     [el]; };
   if(el in pq2_pn_na_ed_mu_pr     ) { rett = rett "#" pq2_pn_na_ed_mu_pr     [el]; };
   if(el in pq2_pn_na_ed_mu_ro     ) { rett = rett "#" pq2_pn_na_ed_mu_ro     [el]; };
   if(el in pq2_pn_na_ed_mu_tv     ) { rett = rett "#" pq2_pn_na_ed_mu_tv     [el]; };
   if(el in pq2_pn_pa_ed_mu_da     ) { rett = rett "#" pq2_pn_pa_ed_mu_da     [el]; };
   if(el in pq2_pn_pa_ed_mu_im     ) { rett = rett "#" pq2_pn_pa_ed_mu_im     [el]; };
   if(el in pq2_pn_pa_ed_mu_pr     ) { rett = rett "#" pq2_pn_pa_ed_mu_pr     [el]; };
   if(el in pq2_pn_pa_ed_mu_ro     ) { rett = rett "#" pq2_pn_pa_ed_mu_ro     [el]; };
   if(el in pq2_pn_pa_ed_mu_tv     ) { rett = rett "#" pq2_pn_pa_ed_mu_tv     [el]; };
   if(el in pqn_ne_na_ed_mu_da     ) { rett = rett "#" pqn_ne_na_ed_mu_da     [el]; };
   if(el in pqn_ne_na_ed_mu_im     ) { rett = rett "#" pqn_ne_na_ed_mu_im     [el]; };
   if(el in pqn_ne_na_ed_mu_pr     ) { rett = rett "#" pqn_ne_na_ed_mu_pr     [el]; };
   if(el in pqn_ne_na_ed_mu_ro     ) { rett = rett "#" pqn_ne_na_ed_mu_ro     [el]; };
   if(el in pqn_ne_na_ed_mu_tv     ) { rett = rett "#" pqn_ne_na_ed_mu_tv     [el]; };
   if(el in pqn_ne_pa_ed_mu_da     ) { rett = rett "#" pqn_ne_pa_ed_mu_da     [el]; };
   if(el in pqn_ne_pa_ed_mu_im     ) { rett = rett "#" pqn_ne_pa_ed_mu_im     [el]; };
   if(el in pqn_ne_pa_ed_mu_pr     ) { rett = rett "#" pqn_ne_pa_ed_mu_pr     [el]; };
   if(el in pqn_ne_pa_ed_mu_ro     ) { rett = rett "#" pqn_ne_pa_ed_mu_ro     [el]; };
   if(el in pqn_ne_pa_ed_mu_tv     ) { rett = rett "#" pqn_ne_pa_ed_mu_tv     [el]; };
   if(el in pqn_ne_vz_na_ed_mu_da  ) { rett = rett "#" pqn_ne_vz_na_ed_mu_da  [el]; };
   if(el in pqn_ne_vz_na_ed_mu_im  ) { rett = rett "#" pqn_ne_vz_na_ed_mu_im  [el]; };
   if(el in pqn_ne_vz_na_ed_mu_pr  ) { rett = rett "#" pqn_ne_vz_na_ed_mu_pr  [el]; };
   if(el in pqn_ne_vz_na_ed_mu_ro  ) { rett = rett "#" pqn_ne_vz_na_ed_mu_ro  [el]; };
   if(el in pqn_ne_vz_na_ed_mu_tv  ) { rett = rett "#" pqn_ne_vz_na_ed_mu_tv  [el]; };
   if(el in pqn_ne_vz_pa_ed_mu_da  ) { rett = rett "#" pqn_ne_vz_pa_ed_mu_da  [el]; };
   if(el in pqn_ne_vz_pa_ed_mu_im  ) { rett = rett "#" pqn_ne_vz_pa_ed_mu_im  [el]; };
   if(el in pqn_ne_vz_pa_ed_mu_pr  ) { rett = rett "#" pqn_ne_vz_pa_ed_mu_pr  [el]; };
   if(el in pqn_ne_vz_pa_ed_mu_ro  ) { rett = rett "#" pqn_ne_vz_pa_ed_mu_ro  [el]; };
   if(el in pqn_ne_vz_pa_ed_mu_tv  ) { rett = rett "#" pqn_ne_vz_pa_ed_mu_tv  [el]; };
   if(el in pqn_pe_na_ed_mu_da     ) { rett = rett "#" pqn_pe_na_ed_mu_da     [el]; };
   if(el in pqn_pe_na_ed_mu_im     ) { rett = rett "#" pqn_pe_na_ed_mu_im     [el]; };
   if(el in pqn_pe_na_ed_mu_pr     ) { rett = rett "#" pqn_pe_na_ed_mu_pr     [el]; };
   if(el in pqn_pe_na_ed_mu_ro     ) { rett = rett "#" pqn_pe_na_ed_mu_ro     [el]; };
   if(el in pqn_pe_na_ed_mu_tv     ) { rett = rett "#" pqn_pe_na_ed_mu_tv     [el]; };
   if(el in pqn_pe_pa_ed_mu_da     ) { rett = rett "#" pqn_pe_pa_ed_mu_da     [el]; };
   if(el in pqn_pe_pa_ed_mu_im     ) { rett = rett "#" pqn_pe_pa_ed_mu_im     [el]; };
   if(el in pqn_pe_pa_ed_mu_pr     ) { rett = rett "#" pqn_pe_pa_ed_mu_pr     [el]; };
   if(el in pqn_pe_pa_ed_mu_ro     ) { rett = rett "#" pqn_pe_pa_ed_mu_ro     [el]; };
   if(el in pqn_pe_pa_ed_mu_tv     ) { rett = rett "#" pqn_pe_pa_ed_mu_tv     [el]; };
   if(el in pqn_pe_sd_na_ed_mu_da  ) { rett = rett "#" pqn_pe_sd_na_ed_mu_da  [el]; };
   if(el in pqn_pe_sd_na_ed_mu_im  ) { rett = rett "#" pqn_pe_sd_na_ed_mu_im  [el]; };
   if(el in pqn_pe_sd_na_ed_mu_pr  ) { rett = rett "#" pqn_pe_sd_na_ed_mu_pr  [el]; };
   if(el in pqn_pe_sd_na_ed_mu_ro  ) { rett = rett "#" pqn_pe_sd_na_ed_mu_ro  [el]; };
   if(el in pqn_pe_sd_na_ed_mu_tv  ) { rett = rett "#" pqn_pe_sd_na_ed_mu_tv  [el]; };
   if(el in pqn_pe_sd_pa_ed_mu_da  ) { rett = rett "#" pqn_pe_sd_pa_ed_mu_da  [el]; };
   if(el in pqn_pe_sd_pa_ed_mu_im  ) { rett = rett "#" pqn_pe_sd_pa_ed_mu_im  [el]; };
   if(el in pqn_pe_sd_pa_ed_mu_pr  ) { rett = rett "#" pqn_pe_sd_pa_ed_mu_pr  [el]; };
   if(el in pqn_pe_sd_pa_ed_mu_ro  ) { rett = rett "#" pqn_pe_sd_pa_ed_mu_ro  [el]; };
   if(el in pqn_pe_sd_pa_ed_mu_tv  ) { rett = rett "#" pqn_pe_sd_pa_ed_mu_tv  [el]; };
   if(el in pqn_pn_na_ed_mu_da     ) { rett = rett "#" pqn_pn_na_ed_mu_da     [el]; };
   if(el in pqn_pn_na_ed_mu_im     ) { rett = rett "#" pqn_pn_na_ed_mu_im     [el]; };
   if(el in pqn_pn_na_ed_mu_pr     ) { rett = rett "#" pqn_pn_na_ed_mu_pr     [el]; };
   if(el in pqn_pn_na_ed_mu_ro     ) { rett = rett "#" pqn_pn_na_ed_mu_ro     [el]; };
   if(el in pqn_pn_na_ed_mu_tv     ) { rett = rett "#" pqn_pn_na_ed_mu_tv     [el]; };
   if(el in pqn_pn_pa_ed_mu_da     ) { rett = rett "#" pqn_pn_pa_ed_mu_da     [el]; };
   if(el in pqn_pn_pa_ed_mu_im     ) { rett = rett "#" pqn_pn_pa_ed_mu_im     [el]; };
   if(el in pqn_pn_pa_ed_mu_pr     ) { rett = rett "#" pqn_pn_pa_ed_mu_pr     [el]; };
   if(el in pqn_pn_pa_ed_mu_ro     ) { rett = rett "#" pqn_pn_pa_ed_mu_ro     [el]; };
   if(el in pqn_pn_pa_ed_mu_tv     ) { rett = rett "#" pqn_pn_pa_ed_mu_tv     [el]; };
   if(el in pqs_ne_pa_ed_mu_da     ) { rett = rett "#" pqs_ne_pa_ed_mu_da     [el]; };
   if(el in pqs_ne_pa_ed_mu_im     ) { rett = rett "#" pqs_ne_pa_ed_mu_im     [el]; };
   if(el in pqs_ne_pa_ed_mu_pr     ) { rett = rett "#" pqs_ne_pa_ed_mu_pr     [el]; };
   if(el in pqs_ne_pa_ed_mu_ro     ) { rett = rett "#" pqs_ne_pa_ed_mu_ro     [el]; };
   if(el in pqs_ne_pa_ed_mu_tv     ) { rett = rett "#" pqs_ne_pa_ed_mu_tv     [el]; };
   if(el in pqs_ne_vz_pa_ed_mu_da  ) { rett = rett "#" pqs_ne_vz_pa_ed_mu_da  [el]; };
   if(el in pqs_ne_vz_pa_ed_mu_im  ) { rett = rett "#" pqs_ne_vz_pa_ed_mu_im  [el]; };
   if(el in pqs_ne_vz_pa_ed_mu_pr  ) { rett = rett "#" pqs_ne_vz_pa_ed_mu_pr  [el]; };
   if(el in pqs_ne_vz_pa_ed_mu_ro  ) { rett = rett "#" pqs_ne_vz_pa_ed_mu_ro  [el]; };
   if(el in pqs_ne_vz_pa_ed_mu_tv  ) { rett = rett "#" pqs_ne_vz_pa_ed_mu_tv  [el]; };
   if(el in pqs_pe_pa_ed_mu_da     ) { rett = rett "#" pqs_pe_pa_ed_mu_da     [el]; };
   if(el in pqs_pe_pa_ed_mu_im     ) { rett = rett "#" pqs_pe_pa_ed_mu_im     [el]; };
   if(el in pqs_pe_pa_ed_mu_pr     ) { rett = rett "#" pqs_pe_pa_ed_mu_pr     [el]; };
   if(el in pqs_pe_pa_ed_mu_ro     ) { rett = rett "#" pqs_pe_pa_ed_mu_ro     [el]; };
   if(el in pqs_pe_pa_ed_mu_tv     ) { rett = rett "#" pqs_pe_pa_ed_mu_tv     [el]; };
   if(el in pqs_pe_sd_pa_ed_mu_da  ) { rett = rett "#" pqs_pe_sd_pa_ed_mu_da  [el]; };
   if(el in pqs_pe_sd_pa_ed_mu_im  ) { rett = rett "#" pqs_pe_sd_pa_ed_mu_im  [el]; };
   if(el in pqs_pe_sd_pa_ed_mu_pr  ) { rett = rett "#" pqs_pe_sd_pa_ed_mu_pr  [el]; };
   if(el in pqs_pe_sd_pa_ed_mu_ro  ) { rett = rett "#" pqs_pe_sd_pa_ed_mu_ro  [el]; };
   if(el in pqs_pe_sd_pa_ed_mu_tv  ) { rett = rett "#" pqs_pe_sd_pa_ed_mu_tv  [el]; };
   if(el in pqs_pn_pa_ed_mu_da     ) { rett = rett "#" pqs_pn_pa_ed_mu_da     [el]; };
   if(el in pqs_pn_pa_ed_mu_im     ) { rett = rett "#" pqs_pn_pa_ed_mu_im     [el]; };
   if(el in pqs_pn_pa_ed_mu_pr     ) { rett = rett "#" pqs_pn_pa_ed_mu_pr     [el]; };
   if(el in pqs_pn_pa_ed_mu_ro     ) { rett = rett "#" pqs_pn_pa_ed_mu_ro     [el]; };
   if(el in pqs_pn_pa_ed_mu_tv     ) { rett = rett "#" pqs_pn_pa_ed_mu_tv     [el]; };
   if(el in pq2_ne_na_ed_sr_da     ) { rett = rett "#" pq2_ne_na_ed_sr_da     [el]; };
   if(el in pq2_ne_na_ed_sr_im     ) { rett = rett "#" pq2_ne_na_ed_sr_im     [el]; };
   if(el in pq2_ne_na_ed_sr_pr     ) { rett = rett "#" pq2_ne_na_ed_sr_pr     [el]; };
   if(el in pq2_ne_na_ed_sr_ro     ) { rett = rett "#" pq2_ne_na_ed_sr_ro     [el]; };
   if(el in pq2_ne_na_ed_sr_tv     ) { rett = rett "#" pq2_ne_na_ed_sr_tv     [el]; };
   if(el in pq2_ne_pa_ed_sr_da     ) { rett = rett "#" pq2_ne_pa_ed_sr_da     [el]; };
   if(el in pq2_ne_pa_ed_sr_im     ) { rett = rett "#" pq2_ne_pa_ed_sr_im     [el]; };
   if(el in pq2_ne_pa_ed_sr_pr     ) { rett = rett "#" pq2_ne_pa_ed_sr_pr     [el]; };
   if(el in pq2_ne_pa_ed_sr_ro     ) { rett = rett "#" pq2_ne_pa_ed_sr_ro     [el]; };
   if(el in pq2_ne_pa_ed_sr_tv     ) { rett = rett "#" pq2_ne_pa_ed_sr_tv     [el]; };
   if(el in pq2_ne_vz_na_ed_sr_da  ) { rett = rett "#" pq2_ne_vz_na_ed_sr_da  [el]; };
   if(el in pq2_ne_vz_na_ed_sr_im  ) { rett = rett "#" pq2_ne_vz_na_ed_sr_im  [el]; };
   if(el in pq2_ne_vz_na_ed_sr_pr  ) { rett = rett "#" pq2_ne_vz_na_ed_sr_pr  [el]; };
   if(el in pq2_ne_vz_na_ed_sr_ro  ) { rett = rett "#" pq2_ne_vz_na_ed_sr_ro  [el]; };
   if(el in pq2_ne_vz_na_ed_sr_tv  ) { rett = rett "#" pq2_ne_vz_na_ed_sr_tv  [el]; };
   if(el in pq2_ne_vz_pa_ed_sr_da  ) { rett = rett "#" pq2_ne_vz_pa_ed_sr_da  [el]; };
   if(el in pq2_ne_vz_pa_ed_sr_im  ) { rett = rett "#" pq2_ne_vz_pa_ed_sr_im  [el]; };
   if(el in pq2_ne_vz_pa_ed_sr_pr  ) { rett = rett "#" pq2_ne_vz_pa_ed_sr_pr  [el]; };
   if(el in pq2_ne_vz_pa_ed_sr_ro  ) { rett = rett "#" pq2_ne_vz_pa_ed_sr_ro  [el]; };
   if(el in pq2_ne_vz_pa_ed_sr_tv  ) { rett = rett "#" pq2_ne_vz_pa_ed_sr_tv  [el]; };
   if(el in pq2_pe_na_ed_sr_da     ) { rett = rett "#" pq2_pe_na_ed_sr_da     [el]; };
   if(el in pq2_pe_na_ed_sr_im     ) { rett = rett "#" pq2_pe_na_ed_sr_im     [el]; };
   if(el in pq2_pe_na_ed_sr_pr     ) { rett = rett "#" pq2_pe_na_ed_sr_pr     [el]; };
   if(el in pq2_pe_na_ed_sr_ro     ) { rett = rett "#" pq2_pe_na_ed_sr_ro     [el]; };
   if(el in pq2_pe_na_ed_sr_tv     ) { rett = rett "#" pq2_pe_na_ed_sr_tv     [el]; };
   if(el in pq2_pe_pa_ed_sr_da     ) { rett = rett "#" pq2_pe_pa_ed_sr_da     [el]; };
   if(el in pq2_pe_pa_ed_sr_im     ) { rett = rett "#" pq2_pe_pa_ed_sr_im     [el]; };
   if(el in pq2_pe_pa_ed_sr_pr     ) { rett = rett "#" pq2_pe_pa_ed_sr_pr     [el]; };
   if(el in pq2_pe_pa_ed_sr_ro     ) { rett = rett "#" pq2_pe_pa_ed_sr_ro     [el]; };
   if(el in pq2_pe_pa_ed_sr_tv     ) { rett = rett "#" pq2_pe_pa_ed_sr_tv     [el]; };
   if(el in pq2_pe_sd_na_ed_sr_da  ) { rett = rett "#" pq2_pe_sd_na_ed_sr_da  [el]; };
   if(el in pq2_pe_sd_na_ed_sr_im  ) { rett = rett "#" pq2_pe_sd_na_ed_sr_im  [el]; };
   if(el in pq2_pe_sd_na_ed_sr_pr  ) { rett = rett "#" pq2_pe_sd_na_ed_sr_pr  [el]; };
   if(el in pq2_pe_sd_na_ed_sr_ro  ) { rett = rett "#" pq2_pe_sd_na_ed_sr_ro  [el]; };
   if(el in pq2_pe_sd_na_ed_sr_tv  ) { rett = rett "#" pq2_pe_sd_na_ed_sr_tv  [el]; };
   if(el in pq2_pe_sd_pa_ed_sr_da  ) { rett = rett "#" pq2_pe_sd_pa_ed_sr_da  [el]; };
   if(el in pq2_pe_sd_pa_ed_sr_im  ) { rett = rett "#" pq2_pe_sd_pa_ed_sr_im  [el]; };
   if(el in pq2_pe_sd_pa_ed_sr_pr  ) { rett = rett "#" pq2_pe_sd_pa_ed_sr_pr  [el]; };
   if(el in pq2_pe_sd_pa_ed_sr_ro  ) { rett = rett "#" pq2_pe_sd_pa_ed_sr_ro  [el]; };
   if(el in pq2_pe_sd_pa_ed_sr_tv  ) { rett = rett "#" pq2_pe_sd_pa_ed_sr_tv  [el]; };
   if(el in pq2_pn_na_ed_sr_da     ) { rett = rett "#" pq2_pn_na_ed_sr_da     [el]; };
   if(el in pq2_pn_na_ed_sr_im     ) { rett = rett "#" pq2_pn_na_ed_sr_im     [el]; };
   if(el in pq2_pn_na_ed_sr_pr     ) { rett = rett "#" pq2_pn_na_ed_sr_pr     [el]; };
   if(el in pq2_pn_na_ed_sr_ro     ) { rett = rett "#" pq2_pn_na_ed_sr_ro     [el]; };
   if(el in pq2_pn_na_ed_sr_tv     ) { rett = rett "#" pq2_pn_na_ed_sr_tv     [el]; };
   if(el in pq2_pn_pa_ed_sr_da     ) { rett = rett "#" pq2_pn_pa_ed_sr_da     [el]; };
   if(el in pq2_pn_pa_ed_sr_im     ) { rett = rett "#" pq2_pn_pa_ed_sr_im     [el]; };
   if(el in pq2_pn_pa_ed_sr_pr     ) { rett = rett "#" pq2_pn_pa_ed_sr_pr     [el]; };
   if(el in pq2_pn_pa_ed_sr_ro     ) { rett = rett "#" pq2_pn_pa_ed_sr_ro     [el]; };
   if(el in pq2_pn_pa_ed_sr_tv     ) { rett = rett "#" pq2_pn_pa_ed_sr_tv     [el]; };
   if(el in pqn_ne_na_ed_sr_da     ) { rett = rett "#" pqn_ne_na_ed_sr_da     [el]; };
   if(el in pqn_ne_na_ed_sr_im     ) { rett = rett "#" pqn_ne_na_ed_sr_im     [el]; };
   if(el in pqn_ne_na_ed_sr_pr     ) { rett = rett "#" pqn_ne_na_ed_sr_pr     [el]; };
   if(el in pqn_ne_na_ed_sr_ro     ) { rett = rett "#" pqn_ne_na_ed_sr_ro     [el]; };
   if(el in pqn_ne_na_ed_sr_tv     ) { rett = rett "#" pqn_ne_na_ed_sr_tv     [el]; };
   if(el in pqn_ne_pa_ed_sr_da     ) { rett = rett "#" pqn_ne_pa_ed_sr_da     [el]; };
   if(el in pqn_ne_pa_ed_sr_im     ) { rett = rett "#" pqn_ne_pa_ed_sr_im     [el]; };
   if(el in pqn_ne_pa_ed_sr_pr     ) { rett = rett "#" pqn_ne_pa_ed_sr_pr     [el]; };
   if(el in pqn_ne_pa_ed_sr_ro     ) { rett = rett "#" pqn_ne_pa_ed_sr_ro     [el]; };
   if(el in pqn_ne_pa_ed_sr_tv     ) { rett = rett "#" pqn_ne_pa_ed_sr_tv     [el]; };
   if(el in pqn_ne_vz_na_ed_sr_da  ) { rett = rett "#" pqn_ne_vz_na_ed_sr_da  [el]; };
   if(el in pqn_ne_vz_na_ed_sr_im  ) { rett = rett "#" pqn_ne_vz_na_ed_sr_im  [el]; };
   if(el in pqn_ne_vz_na_ed_sr_pr  ) { rett = rett "#" pqn_ne_vz_na_ed_sr_pr  [el]; };
   if(el in pqn_ne_vz_na_ed_sr_ro  ) { rett = rett "#" pqn_ne_vz_na_ed_sr_ro  [el]; };
   if(el in pqn_ne_vz_na_ed_sr_tv  ) { rett = rett "#" pqn_ne_vz_na_ed_sr_tv  [el]; };
   if(el in pqn_ne_vz_pa_ed_sr_da  ) { rett = rett "#" pqn_ne_vz_pa_ed_sr_da  [el]; };
   if(el in pqn_ne_vz_pa_ed_sr_im  ) { rett = rett "#" pqn_ne_vz_pa_ed_sr_im  [el]; };
   if(el in pqn_ne_vz_pa_ed_sr_pr  ) { rett = rett "#" pqn_ne_vz_pa_ed_sr_pr  [el]; };
   if(el in pqn_ne_vz_pa_ed_sr_ro  ) { rett = rett "#" pqn_ne_vz_pa_ed_sr_ro  [el]; };
   if(el in pqn_ne_vz_pa_ed_sr_tv  ) { rett = rett "#" pqn_ne_vz_pa_ed_sr_tv  [el]; };
   if(el in pqn_pe_na_ed_sr_da     ) { rett = rett "#" pqn_pe_na_ed_sr_da     [el]; };
   if(el in pqn_pe_na_ed_sr_im     ) { rett = rett "#" pqn_pe_na_ed_sr_im     [el]; };
   if(el in pqn_pe_na_ed_sr_pr     ) { rett = rett "#" pqn_pe_na_ed_sr_pr     [el]; };
   if(el in pqn_pe_na_ed_sr_ro     ) { rett = rett "#" pqn_pe_na_ed_sr_ro     [el]; };
   if(el in pqn_pe_na_ed_sr_tv     ) { rett = rett "#" pqn_pe_na_ed_sr_tv     [el]; };
   if(el in pqn_pe_pa_ed_sr_da     ) { rett = rett "#" pqn_pe_pa_ed_sr_da     [el]; };
   if(el in pqn_pe_pa_ed_sr_im     ) { rett = rett "#" pqn_pe_pa_ed_sr_im     [el]; };
   if(el in pqn_pe_pa_ed_sr_pr     ) { rett = rett "#" pqn_pe_pa_ed_sr_pr     [el]; };
   if(el in pqn_pe_pa_ed_sr_ro     ) { rett = rett "#" pqn_pe_pa_ed_sr_ro     [el]; };
   if(el in pqn_pe_pa_ed_sr_tv     ) { rett = rett "#" pqn_pe_pa_ed_sr_tv     [el]; };
   if(el in pqn_pe_sd_na_ed_sr_da  ) { rett = rett "#" pqn_pe_sd_na_ed_sr_da  [el]; };
   if(el in pqn_pe_sd_na_ed_sr_im  ) { rett = rett "#" pqn_pe_sd_na_ed_sr_im  [el]; };
   if(el in pqn_pe_sd_na_ed_sr_pr  ) { rett = rett "#" pqn_pe_sd_na_ed_sr_pr  [el]; };
   if(el in pqn_pe_sd_na_ed_sr_ro  ) { rett = rett "#" pqn_pe_sd_na_ed_sr_ro  [el]; };
   if(el in pqn_pe_sd_na_ed_sr_tv  ) { rett = rett "#" pqn_pe_sd_na_ed_sr_tv  [el]; };
   if(el in pqn_pe_sd_pa_ed_sr_da  ) { rett = rett "#" pqn_pe_sd_pa_ed_sr_da  [el]; };
   if(el in pqn_pe_sd_pa_ed_sr_im  ) { rett = rett "#" pqn_pe_sd_pa_ed_sr_im  [el]; };
   if(el in pqn_pe_sd_pa_ed_sr_pr  ) { rett = rett "#" pqn_pe_sd_pa_ed_sr_pr  [el]; };
   if(el in pqn_pe_sd_pa_ed_sr_ro  ) { rett = rett "#" pqn_pe_sd_pa_ed_sr_ro  [el]; };
   if(el in pqn_pe_sd_pa_ed_sr_tv  ) { rett = rett "#" pqn_pe_sd_pa_ed_sr_tv  [el]; };
   if(el in pqn_pn_na_ed_sr_da     ) { rett = rett "#" pqn_pn_na_ed_sr_da     [el]; };
   if(el in pqn_pn_na_ed_sr_im     ) { rett = rett "#" pqn_pn_na_ed_sr_im     [el]; };
   if(el in pqn_pn_na_ed_sr_pr     ) { rett = rett "#" pqn_pn_na_ed_sr_pr     [el]; };
   if(el in pqn_pn_na_ed_sr_ro     ) { rett = rett "#" pqn_pn_na_ed_sr_ro     [el]; };
   if(el in pqn_pn_na_ed_sr_tv     ) { rett = rett "#" pqn_pn_na_ed_sr_tv     [el]; };
   if(el in pqn_pn_pa_ed_sr_da     ) { rett = rett "#" pqn_pn_pa_ed_sr_da     [el]; };
   if(el in pqn_pn_pa_ed_sr_im     ) { rett = rett "#" pqn_pn_pa_ed_sr_im     [el]; };
   if(el in pqn_pn_pa_ed_sr_pr     ) { rett = rett "#" pqn_pn_pa_ed_sr_pr     [el]; };
   if(el in pqn_pn_pa_ed_sr_ro     ) { rett = rett "#" pqn_pn_pa_ed_sr_ro     [el]; };
   if(el in pqn_pn_pa_ed_sr_tv     ) { rett = rett "#" pqn_pn_pa_ed_sr_tv     [el]; };
   if(el in pqs_ne_pa_ed_sr_da     ) { rett = rett "#" pqs_ne_pa_ed_sr_da     [el]; };
   if(el in pqs_ne_pa_ed_sr_im     ) { rett = rett "#" pqs_ne_pa_ed_sr_im     [el]; };
   if(el in pqs_ne_pa_ed_sr_pr     ) { rett = rett "#" pqs_ne_pa_ed_sr_pr     [el]; };
   if(el in pqs_ne_pa_ed_sr_ro     ) { rett = rett "#" pqs_ne_pa_ed_sr_ro     [el]; };
   if(el in pqs_ne_pa_ed_sr_tv     ) { rett = rett "#" pqs_ne_pa_ed_sr_tv     [el]; };
   if(el in pqs_ne_vz_pa_ed_sr_da  ) { rett = rett "#" pqs_ne_vz_pa_ed_sr_da  [el]; };
   if(el in pqs_ne_vz_pa_ed_sr_im  ) { rett = rett "#" pqs_ne_vz_pa_ed_sr_im  [el]; };
   if(el in pqs_ne_vz_pa_ed_sr_pr  ) { rett = rett "#" pqs_ne_vz_pa_ed_sr_pr  [el]; };
   if(el in pqs_ne_vz_pa_ed_sr_ro  ) { rett = rett "#" pqs_ne_vz_pa_ed_sr_ro  [el]; };
   if(el in pqs_ne_vz_pa_ed_sr_tv  ) { rett = rett "#" pqs_ne_vz_pa_ed_sr_tv  [el]; };
   if(el in pqs_pe_pa_ed_sr_da     ) { rett = rett "#" pqs_pe_pa_ed_sr_da     [el]; };
   if(el in pqs_pe_pa_ed_sr_im     ) { rett = rett "#" pqs_pe_pa_ed_sr_im     [el]; };
   if(el in pqs_pe_pa_ed_sr_pr     ) { rett = rett "#" pqs_pe_pa_ed_sr_pr     [el]; };
   if(el in pqs_pe_pa_ed_sr_ro     ) { rett = rett "#" pqs_pe_pa_ed_sr_ro     [el]; };
   if(el in pqs_pe_pa_ed_sr_tv     ) { rett = rett "#" pqs_pe_pa_ed_sr_tv     [el]; };
   if(el in pqs_pe_sd_pa_ed_sr_da  ) { rett = rett "#" pqs_pe_sd_pa_ed_sr_da  [el]; };
   if(el in pqs_pe_sd_pa_ed_sr_im  ) { rett = rett "#" pqs_pe_sd_pa_ed_sr_im  [el]; };
   if(el in pqs_pe_sd_pa_ed_sr_pr  ) { rett = rett "#" pqs_pe_sd_pa_ed_sr_pr  [el]; };
   if(el in pqs_pe_sd_pa_ed_sr_ro  ) { rett = rett "#" pqs_pe_sd_pa_ed_sr_ro  [el]; };
   if(el in pqs_pe_sd_pa_ed_sr_tv  ) { rett = rett "#" pqs_pe_sd_pa_ed_sr_tv  [el]; };
   if(el in pqs_pn_pa_ed_sr_da     ) { rett = rett "#" pqs_pn_pa_ed_sr_da     [el]; };
   if(el in pqs_pn_pa_ed_sr_im     ) { rett = rett "#" pqs_pn_pa_ed_sr_im     [el]; };
   if(el in pqs_pn_pa_ed_sr_pr     ) { rett = rett "#" pqs_pn_pa_ed_sr_pr     [el]; };
   if(el in pqs_pn_pa_ed_sr_ro     ) { rett = rett "#" pqs_pn_pa_ed_sr_ro     [el]; };
   if(el in pqs_pn_pa_ed_sr_tv     ) { rett = rett "#" pqs_pn_pa_ed_sr_tv     [el]; };
   if(el in pq2_ne_na_ed_ze_dr     ) { rett = rett "#" pq2_ne_na_ed_ze_dr     [el]; };
   if(el in pq2_ne_na_ed_ze_im     ) { rett = rett "#" pq2_ne_na_ed_ze_im     [el]; };
   if(el in pq2_ne_na_ed_ze_tv     ) { rett = rett "#" pq2_ne_na_ed_ze_tv     [el]; };
   if(el in pq2_ne_na_ed_ze_vi     ) { rett = rett "#" pq2_ne_na_ed_ze_vi     [el]; };
   if(el in pq2_ne_pa_ed_ze_dr     ) { rett = rett "#" pq2_ne_pa_ed_ze_dr     [el]; };
   if(el in pq2_ne_pa_ed_ze_im     ) { rett = rett "#" pq2_ne_pa_ed_ze_im     [el]; };
   if(el in pq2_ne_pa_ed_ze_tv     ) { rett = rett "#" pq2_ne_pa_ed_ze_tv     [el]; };
   if(el in pq2_ne_pa_ed_ze_vi     ) { rett = rett "#" pq2_ne_pa_ed_ze_vi     [el]; };
   if(el in pq2_ne_vz_na_ed_ze_dr  ) { rett = rett "#" pq2_ne_vz_na_ed_ze_dr  [el]; };
   if(el in pq2_ne_vz_na_ed_ze_im  ) { rett = rett "#" pq2_ne_vz_na_ed_ze_im  [el]; };
   if(el in pq2_ne_vz_na_ed_ze_tv  ) { rett = rett "#" pq2_ne_vz_na_ed_ze_tv  [el]; };
   if(el in pq2_ne_vz_na_ed_ze_vi  ) { rett = rett "#" pq2_ne_vz_na_ed_ze_vi  [el]; };
   if(el in pq2_ne_vz_pa_ed_ze_dr  ) { rett = rett "#" pq2_ne_vz_pa_ed_ze_dr  [el]; };
   if(el in pq2_ne_vz_pa_ed_ze_im  ) { rett = rett "#" pq2_ne_vz_pa_ed_ze_im  [el]; };
   if(el in pq2_ne_vz_pa_ed_ze_tv  ) { rett = rett "#" pq2_ne_vz_pa_ed_ze_tv  [el]; };
   if(el in pq2_ne_vz_pa_ed_ze_vi  ) { rett = rett "#" pq2_ne_vz_pa_ed_ze_vi  [el]; };
   if(el in pq2_pe_na_ed_ze_dr     ) { rett = rett "#" pq2_pe_na_ed_ze_dr     [el]; };
   if(el in pq2_pe_na_ed_ze_im     ) { rett = rett "#" pq2_pe_na_ed_ze_im     [el]; };
   if(el in pq2_pe_na_ed_ze_tv     ) { rett = rett "#" pq2_pe_na_ed_ze_tv     [el]; };
   if(el in pq2_pe_na_ed_ze_vi     ) { rett = rett "#" pq2_pe_na_ed_ze_vi     [el]; };
   if(el in pq2_pe_pa_ed_ze_dr     ) { rett = rett "#" pq2_pe_pa_ed_ze_dr     [el]; };
   if(el in pq2_pe_pa_ed_ze_im     ) { rett = rett "#" pq2_pe_pa_ed_ze_im     [el]; };
   if(el in pq2_pe_pa_ed_ze_tv     ) { rett = rett "#" pq2_pe_pa_ed_ze_tv     [el]; };
   if(el in pq2_pe_pa_ed_ze_vi     ) { rett = rett "#" pq2_pe_pa_ed_ze_vi     [el]; };
   if(el in pq2_pe_sd_na_ed_ze_dr  ) { rett = rett "#" pq2_pe_sd_na_ed_ze_dr  [el]; };
   if(el in pq2_pe_sd_na_ed_ze_im  ) { rett = rett "#" pq2_pe_sd_na_ed_ze_im  [el]; };
   if(el in pq2_pe_sd_na_ed_ze_tv  ) { rett = rett "#" pq2_pe_sd_na_ed_ze_tv  [el]; };
   if(el in pq2_pe_sd_na_ed_ze_vi  ) { rett = rett "#" pq2_pe_sd_na_ed_ze_vi  [el]; };
   if(el in pq2_pe_sd_pa_ed_ze_dr  ) { rett = rett "#" pq2_pe_sd_pa_ed_ze_dr  [el]; };
   if(el in pq2_pe_sd_pa_ed_ze_im  ) { rett = rett "#" pq2_pe_sd_pa_ed_ze_im  [el]; };
   if(el in pq2_pe_sd_pa_ed_ze_tv  ) { rett = rett "#" pq2_pe_sd_pa_ed_ze_tv  [el]; };
   if(el in pq2_pe_sd_pa_ed_ze_vi  ) { rett = rett "#" pq2_pe_sd_pa_ed_ze_vi  [el]; };
   if(el in pq2_pn_na_ed_ze_dr     ) { rett = rett "#" pq2_pn_na_ed_ze_dr     [el]; };
   if(el in pq2_pn_na_ed_ze_im     ) { rett = rett "#" pq2_pn_na_ed_ze_im     [el]; };
   if(el in pq2_pn_na_ed_ze_tv     ) { rett = rett "#" pq2_pn_na_ed_ze_tv     [el]; };
   if(el in pq2_pn_na_ed_ze_vi     ) { rett = rett "#" pq2_pn_na_ed_ze_vi     [el]; };
   if(el in pq2_pn_pa_ed_ze_dr     ) { rett = rett "#" pq2_pn_pa_ed_ze_dr     [el]; };
   if(el in pq2_pn_pa_ed_ze_im     ) { rett = rett "#" pq2_pn_pa_ed_ze_im     [el]; };
   if(el in pq2_pn_pa_ed_ze_tv     ) { rett = rett "#" pq2_pn_pa_ed_ze_tv     [el]; };
   if(el in pq2_pn_pa_ed_ze_vi     ) { rett = rett "#" pq2_pn_pa_ed_ze_vi     [el]; };
   if(el in pqn_ne_na_ed_ze_dr     ) { rett = rett "#" pqn_ne_na_ed_ze_dr     [el]; };
   if(el in pqn_ne_na_ed_ze_im     ) { rett = rett "#" pqn_ne_na_ed_ze_im     [el]; };
   if(el in pqn_ne_na_ed_ze_tv     ) { rett = rett "#" pqn_ne_na_ed_ze_tv     [el]; };
   if(el in pqn_ne_na_ed_ze_vi     ) { rett = rett "#" pqn_ne_na_ed_ze_vi     [el]; };
   if(el in pqn_ne_pa_ed_ze_dr     ) { rett = rett "#" pqn_ne_pa_ed_ze_dr     [el]; };
   if(el in pqn_ne_pa_ed_ze_im     ) { rett = rett "#" pqn_ne_pa_ed_ze_im     [el]; };
   if(el in pqn_ne_pa_ed_ze_tv     ) { rett = rett "#" pqn_ne_pa_ed_ze_tv     [el]; };
   if(el in pqn_ne_pa_ed_ze_vi     ) { rett = rett "#" pqn_ne_pa_ed_ze_vi     [el]; };
   if(el in pqn_ne_vz_na_ed_ze_dr  ) { rett = rett "#" pqn_ne_vz_na_ed_ze_dr  [el]; };
   if(el in pqn_ne_vz_na_ed_ze_im  ) { rett = rett "#" pqn_ne_vz_na_ed_ze_im  [el]; };
   if(el in pqn_ne_vz_na_ed_ze_tv  ) { rett = rett "#" pqn_ne_vz_na_ed_ze_tv  [el]; };
   if(el in pqn_ne_vz_na_ed_ze_vi  ) { rett = rett "#" pqn_ne_vz_na_ed_ze_vi  [el]; };
   if(el in pqn_ne_vz_pa_ed_ze_dr  ) { rett = rett "#" pqn_ne_vz_pa_ed_ze_dr  [el]; };
   if(el in pqn_ne_vz_pa_ed_ze_im  ) { rett = rett "#" pqn_ne_vz_pa_ed_ze_im  [el]; };
   if(el in pqn_ne_vz_pa_ed_ze_tv  ) { rett = rett "#" pqn_ne_vz_pa_ed_ze_tv  [el]; };
   if(el in pqn_ne_vz_pa_ed_ze_vi  ) { rett = rett "#" pqn_ne_vz_pa_ed_ze_vi  [el]; };
   if(el in pqn_pe_na_ed_ze_dr     ) { rett = rett "#" pqn_pe_na_ed_ze_dr     [el]; };
   if(el in pqn_pe_na_ed_ze_im     ) { rett = rett "#" pqn_pe_na_ed_ze_im     [el]; };
   if(el in pqn_pe_na_ed_ze_tv     ) { rett = rett "#" pqn_pe_na_ed_ze_tv     [el]; };
   if(el in pqn_pe_na_ed_ze_vi     ) { rett = rett "#" pqn_pe_na_ed_ze_vi     [el]; };
   if(el in pqn_pe_pa_ed_ze_dr     ) { rett = rett "#" pqn_pe_pa_ed_ze_dr     [el]; };
   if(el in pqn_pe_pa_ed_ze_im     ) { rett = rett "#" pqn_pe_pa_ed_ze_im     [el]; };
   if(el in pqn_pe_pa_ed_ze_tv     ) { rett = rett "#" pqn_pe_pa_ed_ze_tv     [el]; };
   if(el in pqn_pe_pa_ed_ze_vi     ) { rett = rett "#" pqn_pe_pa_ed_ze_vi     [el]; };
   if(el in pqn_pe_sd_na_ed_ze_dr  ) { rett = rett "#" pqn_pe_sd_na_ed_ze_dr  [el]; };
   if(el in pqn_pe_sd_na_ed_ze_im  ) { rett = rett "#" pqn_pe_sd_na_ed_ze_im  [el]; };
   if(el in pqn_pe_sd_na_ed_ze_tv  ) { rett = rett "#" pqn_pe_sd_na_ed_ze_tv  [el]; };
   if(el in pqn_pe_sd_na_ed_ze_vi  ) { rett = rett "#" pqn_pe_sd_na_ed_ze_vi  [el]; };
   if(el in pqn_pe_sd_pa_ed_ze_dr  ) { rett = rett "#" pqn_pe_sd_pa_ed_ze_dr  [el]; };
   if(el in pqn_pe_sd_pa_ed_ze_im  ) { rett = rett "#" pqn_pe_sd_pa_ed_ze_im  [el]; };
   if(el in pqn_pe_sd_pa_ed_ze_tv  ) { rett = rett "#" pqn_pe_sd_pa_ed_ze_tv  [el]; };
   if(el in pqn_pe_sd_pa_ed_ze_vi  ) { rett = rett "#" pqn_pe_sd_pa_ed_ze_vi  [el]; };
   if(el in pqn_pn_na_ed_ze_dr     ) { rett = rett "#" pqn_pn_na_ed_ze_dr     [el]; };
   if(el in pqn_pn_na_ed_ze_im     ) { rett = rett "#" pqn_pn_na_ed_ze_im     [el]; };
   if(el in pqn_pn_na_ed_ze_tv     ) { rett = rett "#" pqn_pn_na_ed_ze_tv     [el]; };
   if(el in pqn_pn_na_ed_ze_vi     ) { rett = rett "#" pqn_pn_na_ed_ze_vi     [el]; };
   if(el in pqn_pn_pa_ed_ze_dr     ) { rett = rett "#" pqn_pn_pa_ed_ze_dr     [el]; };
   if(el in pqn_pn_pa_ed_ze_im     ) { rett = rett "#" pqn_pn_pa_ed_ze_im     [el]; };
   if(el in pqn_pn_pa_ed_ze_tv     ) { rett = rett "#" pqn_pn_pa_ed_ze_tv     [el]; };
   if(el in pqn_pn_pa_ed_ze_vi     ) { rett = rett "#" pqn_pn_pa_ed_ze_vi     [el]; };
   if(el in pqs_ne_pa_ed_ze_dr     ) { rett = rett "#" pqs_ne_pa_ed_ze_dr     [el]; };
   if(el in pqs_ne_pa_ed_ze_im     ) { rett = rett "#" pqs_ne_pa_ed_ze_im     [el]; };
   if(el in pqs_ne_pa_ed_ze_tv     ) { rett = rett "#" pqs_ne_pa_ed_ze_tv     [el]; };
   if(el in pqs_ne_pa_ed_ze_vi     ) { rett = rett "#" pqs_ne_pa_ed_ze_vi     [el]; };
   if(el in pqs_ne_vz_pa_ed_ze_dr  ) { rett = rett "#" pqs_ne_vz_pa_ed_ze_dr  [el]; };
   if(el in pqs_ne_vz_pa_ed_ze_im  ) { rett = rett "#" pqs_ne_vz_pa_ed_ze_im  [el]; };
   if(el in pqs_ne_vz_pa_ed_ze_tv  ) { rett = rett "#" pqs_ne_vz_pa_ed_ze_tv  [el]; };
   if(el in pqs_ne_vz_pa_ed_ze_vi  ) { rett = rett "#" pqs_ne_vz_pa_ed_ze_vi  [el]; };
   if(el in pqs_pe_pa_ed_ze_dr     ) { rett = rett "#" pqs_pe_pa_ed_ze_dr     [el]; };
   if(el in pqs_pe_pa_ed_ze_im     ) { rett = rett "#" pqs_pe_pa_ed_ze_im     [el]; };
   if(el in pqs_pe_pa_ed_ze_tv     ) { rett = rett "#" pqs_pe_pa_ed_ze_tv     [el]; };
   if(el in pqs_pe_pa_ed_ze_vi     ) { rett = rett "#" pqs_pe_pa_ed_ze_vi     [el]; };
   if(el in pqs_pe_sd_pa_ed_ze_dr  ) { rett = rett "#" pqs_pe_sd_pa_ed_ze_dr  [el]; };
   if(el in pqs_pe_sd_pa_ed_ze_im  ) { rett = rett "#" pqs_pe_sd_pa_ed_ze_im  [el]; };
   if(el in pqs_pe_sd_pa_ed_ze_tv  ) { rett = rett "#" pqs_pe_sd_pa_ed_ze_tv  [el]; };
   if(el in pqs_pe_sd_pa_ed_ze_vi  ) { rett = rett "#" pqs_pe_sd_pa_ed_ze_vi  [el]; };
   if(el in pqs_pn_pa_ed_ze_dr     ) { rett = rett "#" pqs_pn_pa_ed_ze_dr     [el]; };
   if(el in pqs_pn_pa_ed_ze_im     ) { rett = rett "#" pqs_pn_pa_ed_ze_im     [el]; };
   if(el in pqs_pn_pa_ed_ze_tv     ) { rett = rett "#" pqs_pn_pa_ed_ze_tv     [el]; };
   if(el in pqs_pn_pa_ed_ze_vi     ) { rett = rett "#" pqs_pn_pa_ed_ze_vi     [el]; };
   if(el in pq2_na_kred_mu         ) { rett = rett "#" pq2_na_kred_mu         [el]; };
   if(el in pq2_na_kred_sr         ) { rett = rett "#" pq2_na_kred_sr         [el]; };
   if(el in pq2_na_kred_ze         ) { rett = rett "#" pq2_na_kred_ze         [el]; };
   if(el in pq2_na_krmn            ) { rett = rett "#" pq2_na_krmn            [el]; };
   if(el in pq2_pa_kred_mu         ) { rett = rett "#" pq2_pa_kred_mu         [el]; };
   if(el in pq2_pa_kred_sr         ) { rett = rett "#" pq2_pa_kred_sr         [el]; };
   if(el in pq2_pa_kred_ze         ) { rett = rett "#" pq2_pa_kred_ze         [el]; };
   if(el in pq2_pa_krmn            ) { rett = rett "#" pq2_pa_krmn            [el]; };
   if(el in pqn_na_kred_mu         ) { rett = rett "#" pqn_na_kred_mu         [el]; };
   if(el in pqn_na_kred_sr         ) { rett = rett "#" pqn_na_kred_sr         [el]; };
   if(el in pqn_na_kred_ze         ) { rett = rett "#" pqn_na_kred_ze         [el]; };
   if(el in pqn_na_krmn            ) { rett = rett "#" pqn_na_krmn            [el]; };
   if(el in pqn_pa_kred_mu         ) { rett = rett "#" pqn_pa_kred_mu         [el]; };
   if(el in pqn_pa_kred_sr         ) { rett = rett "#" pqn_pa_kred_sr         [el]; };
   if(el in pqn_pa_kred_ze         ) { rett = rett "#" pqn_pa_kred_ze         [el]; };
   if(el in pqn_pa_krmn            ) { rett = rett "#" pqn_pa_krmn            [el]; };
   if(el in pqs_pa_kred_mu         ) { rett = rett "#" pqs_pa_kred_mu         [el]; };
   if(el in pqs_pa_kred_sr         ) { rett = rett "#" pqs_pa_kred_sr         [el]; };
   if(el in pqs_pa_kred_ze         ) { rett = rett "#" pqs_pa_kred_ze         [el]; };
   if(el in pqs_pa_krmn            ) { rett = rett "#" pqs_pa_krmn            [el]; };
   if(el in pq2_ne_na_mn_da        ) { rett = rett "#" pq2_ne_na_mn_da        [el]; };
   if(el in pq2_ne_na_mn_im        ) { rett = rett "#" pq2_ne_na_mn_im        [el]; };
   if(el in pq2_ne_na_mn_ro        ) { rett = rett "#" pq2_ne_na_mn_ro        [el]; };
   if(el in pq2_ne_na_mn_tv        ) { rett = rett "#" pq2_ne_na_mn_tv        [el]; };
   if(el in pq2_ne_pa_mn_da        ) { rett = rett "#" pq2_ne_pa_mn_da        [el]; };
   if(el in pq2_ne_pa_mn_im        ) { rett = rett "#" pq2_ne_pa_mn_im        [el]; };
   if(el in pq2_ne_pa_mn_ro        ) { rett = rett "#" pq2_ne_pa_mn_ro        [el]; };
   if(el in pq2_ne_pa_mn_tv        ) { rett = rett "#" pq2_ne_pa_mn_tv        [el]; };
   if(el in pq2_ne_vz_na_mn_da     ) { rett = rett "#" pq2_ne_vz_na_mn_da     [el]; };
   if(el in pq2_ne_vz_na_mn_im     ) { rett = rett "#" pq2_ne_vz_na_mn_im     [el]; };
   if(el in pq2_ne_vz_na_mn_ro     ) { rett = rett "#" pq2_ne_vz_na_mn_ro     [el]; };
   if(el in pq2_ne_vz_na_mn_tv     ) { rett = rett "#" pq2_ne_vz_na_mn_tv     [el]; };
   if(el in pq2_ne_vz_pa_mn_da     ) { rett = rett "#" pq2_ne_vz_pa_mn_da     [el]; };
   if(el in pq2_ne_vz_pa_mn_im     ) { rett = rett "#" pq2_ne_vz_pa_mn_im     [el]; };
   if(el in pq2_ne_vz_pa_mn_ro     ) { rett = rett "#" pq2_ne_vz_pa_mn_ro     [el]; };
   if(el in pq2_ne_vz_pa_mn_tv     ) { rett = rett "#" pq2_ne_vz_pa_mn_tv     [el]; };
   if(el in pq2_pe_na_mn_da        ) { rett = rett "#" pq2_pe_na_mn_da        [el]; };
   if(el in pq2_pe_na_mn_im        ) { rett = rett "#" pq2_pe_na_mn_im        [el]; };
   if(el in pq2_pe_na_mn_ro        ) { rett = rett "#" pq2_pe_na_mn_ro        [el]; };
   if(el in pq2_pe_na_mn_tv        ) { rett = rett "#" pq2_pe_na_mn_tv        [el]; };
   if(el in pq2_pe_pa_mn_da        ) { rett = rett "#" pq2_pe_pa_mn_da        [el]; };
   if(el in pq2_pe_pa_mn_im        ) { rett = rett "#" pq2_pe_pa_mn_im        [el]; };
   if(el in pq2_pe_pa_mn_ro        ) { rett = rett "#" pq2_pe_pa_mn_ro        [el]; };
   if(el in pq2_pe_pa_mn_tv        ) { rett = rett "#" pq2_pe_pa_mn_tv        [el]; };
   if(el in pq2_pe_sd_na_mn_da     ) { rett = rett "#" pq2_pe_sd_na_mn_da     [el]; };
   if(el in pq2_pe_sd_na_mn_im     ) { rett = rett "#" pq2_pe_sd_na_mn_im     [el]; };
   if(el in pq2_pe_sd_na_mn_ro     ) { rett = rett "#" pq2_pe_sd_na_mn_ro     [el]; };
   if(el in pq2_pe_sd_na_mn_tv     ) { rett = rett "#" pq2_pe_sd_na_mn_tv     [el]; };
   if(el in pq2_pe_sd_pa_mn_da     ) { rett = rett "#" pq2_pe_sd_pa_mn_da     [el]; };
   if(el in pq2_pe_sd_pa_mn_im     ) { rett = rett "#" pq2_pe_sd_pa_mn_im     [el]; };
   if(el in pq2_pe_sd_pa_mn_ro     ) { rett = rett "#" pq2_pe_sd_pa_mn_ro     [el]; };
   if(el in pq2_pe_sd_pa_mn_tv     ) { rett = rett "#" pq2_pe_sd_pa_mn_tv     [el]; };
   if(el in pq2_pn_na_mn_da        ) { rett = rett "#" pq2_pn_na_mn_da        [el]; };
   if(el in pq2_pn_na_mn_im        ) { rett = rett "#" pq2_pn_na_mn_im        [el]; };
   if(el in pq2_pn_na_mn_ro        ) { rett = rett "#" pq2_pn_na_mn_ro        [el]; };
   if(el in pq2_pn_na_mn_tv        ) { rett = rett "#" pq2_pn_na_mn_tv        [el]; };
   if(el in pq2_pn_pa_mn_da        ) { rett = rett "#" pq2_pn_pa_mn_da        [el]; };
   if(el in pq2_pn_pa_mn_im        ) { rett = rett "#" pq2_pn_pa_mn_im        [el]; };
   if(el in pq2_pn_pa_mn_ro        ) { rett = rett "#" pq2_pn_pa_mn_ro        [el]; };
   if(el in pq2_pn_pa_mn_tv        ) { rett = rett "#" pq2_pn_pa_mn_tv        [el]; };
   if(el in pqn_ne_na_mn_da        ) { rett = rett "#" pqn_ne_na_mn_da        [el]; };
   if(el in pqn_ne_na_mn_im        ) { rett = rett "#" pqn_ne_na_mn_im        [el]; };
   if(el in pqn_ne_na_mn_ro        ) { rett = rett "#" pqn_ne_na_mn_ro        [el]; };
   if(el in pqn_ne_na_mn_tv        ) { rett = rett "#" pqn_ne_na_mn_tv        [el]; };
   if(el in pqn_ne_pa_mn_da        ) { rett = rett "#" pqn_ne_pa_mn_da        [el]; };
   if(el in pqn_ne_pa_mn_im        ) { rett = rett "#" pqn_ne_pa_mn_im        [el]; };
   if(el in pqn_ne_pa_mn_ro        ) { rett = rett "#" pqn_ne_pa_mn_ro        [el]; };
   if(el in pqn_ne_pa_mn_tv        ) { rett = rett "#" pqn_ne_pa_mn_tv        [el]; };
   if(el in pqn_ne_vz_na_mn_da     ) { rett = rett "#" pqn_ne_vz_na_mn_da     [el]; };
   if(el in pqn_ne_vz_na_mn_im     ) { rett = rett "#" pqn_ne_vz_na_mn_im     [el]; };
   if(el in pqn_ne_vz_na_mn_ro     ) { rett = rett "#" pqn_ne_vz_na_mn_ro     [el]; };
   if(el in pqn_ne_vz_na_mn_tv     ) { rett = rett "#" pqn_ne_vz_na_mn_tv     [el]; };
   if(el in pqn_ne_vz_pa_mn_da     ) { rett = rett "#" pqn_ne_vz_pa_mn_da     [el]; };
   if(el in pqn_ne_vz_pa_mn_im     ) { rett = rett "#" pqn_ne_vz_pa_mn_im     [el]; };
   if(el in pqn_ne_vz_pa_mn_ro     ) { rett = rett "#" pqn_ne_vz_pa_mn_ro     [el]; };
   if(el in pqn_ne_vz_pa_mn_tv     ) { rett = rett "#" pqn_ne_vz_pa_mn_tv     [el]; };
   if(el in pqn_pe_na_mn_da        ) { rett = rett "#" pqn_pe_na_mn_da        [el]; };
   if(el in pqn_pe_na_mn_im        ) { rett = rett "#" pqn_pe_na_mn_im        [el]; };
   if(el in pqn_pe_na_mn_ro        ) { rett = rett "#" pqn_pe_na_mn_ro        [el]; };
   if(el in pqn_pe_na_mn_tv        ) { rett = rett "#" pqn_pe_na_mn_tv        [el]; };
   if(el in pqn_pe_pa_mn_da        ) { rett = rett "#" pqn_pe_pa_mn_da        [el]; };
   if(el in pqn_pe_pa_mn_im        ) { rett = rett "#" pqn_pe_pa_mn_im        [el]; };
   if(el in pqn_pe_pa_mn_ro        ) { rett = rett "#" pqn_pe_pa_mn_ro        [el]; };
   if(el in pqn_pe_pa_mn_tv        ) { rett = rett "#" pqn_pe_pa_mn_tv        [el]; };
   if(el in pqn_pe_sd_na_mn_da     ) { rett = rett "#" pqn_pe_sd_na_mn_da     [el]; };
   if(el in pqn_pe_sd_na_mn_im     ) { rett = rett "#" pqn_pe_sd_na_mn_im     [el]; };
   if(el in pqn_pe_sd_na_mn_ro     ) { rett = rett "#" pqn_pe_sd_na_mn_ro     [el]; };
   if(el in pqn_pe_sd_na_mn_tv     ) { rett = rett "#" pqn_pe_sd_na_mn_tv     [el]; };
   if(el in pqn_pe_sd_pa_mn_da     ) { rett = rett "#" pqn_pe_sd_pa_mn_da     [el]; };
   if(el in pqn_pe_sd_pa_mn_im     ) { rett = rett "#" pqn_pe_sd_pa_mn_im     [el]; };
   if(el in pqn_pe_sd_pa_mn_ro     ) { rett = rett "#" pqn_pe_sd_pa_mn_ro     [el]; };
   if(el in pqn_pe_sd_pa_mn_tv     ) { rett = rett "#" pqn_pe_sd_pa_mn_tv     [el]; };
   if(el in pqn_pn_na_mn_da        ) { rett = rett "#" pqn_pn_na_mn_da        [el]; };
   if(el in pqn_pn_na_mn_im        ) { rett = rett "#" pqn_pn_na_mn_im        [el]; };
   if(el in pqn_pn_na_mn_ro        ) { rett = rett "#" pqn_pn_na_mn_ro        [el]; };
   if(el in pqn_pn_na_mn_tv        ) { rett = rett "#" pqn_pn_na_mn_tv        [el]; };
   if(el in pqn_pn_pa_mn_da        ) { rett = rett "#" pqn_pn_pa_mn_da        [el]; };
   if(el in pqn_pn_pa_mn_im        ) { rett = rett "#" pqn_pn_pa_mn_im        [el]; };
   if(el in pqn_pn_pa_mn_ro        ) { rett = rett "#" pqn_pn_pa_mn_ro        [el]; };
   if(el in pqn_pn_pa_mn_tv        ) { rett = rett "#" pqn_pn_pa_mn_tv        [el]; };
   if(el in pqs_ne_pa_mn_da        ) { rett = rett "#" pqs_ne_pa_mn_da        [el]; };
   if(el in pqs_ne_pa_mn_im        ) { rett = rett "#" pqs_ne_pa_mn_im        [el]; };
   if(el in pqs_ne_pa_mn_ro        ) { rett = rett "#" pqs_ne_pa_mn_ro        [el]; };
   if(el in pqs_ne_pa_mn_tv        ) { rett = rett "#" pqs_ne_pa_mn_tv        [el]; };
   if(el in pqs_ne_vz_pa_mn_da     ) { rett = rett "#" pqs_ne_vz_pa_mn_da     [el]; };
   if(el in pqs_ne_vz_pa_mn_im     ) { rett = rett "#" pqs_ne_vz_pa_mn_im     [el]; };
   if(el in pqs_ne_vz_pa_mn_ro     ) { rett = rett "#" pqs_ne_vz_pa_mn_ro     [el]; };
   if(el in pqs_ne_vz_pa_mn_tv     ) { rett = rett "#" pqs_ne_vz_pa_mn_tv     [el]; };
   if(el in pqs_pe_pa_mn_da        ) { rett = rett "#" pqs_pe_pa_mn_da        [el]; };
   if(el in pqs_pe_pa_mn_im        ) { rett = rett "#" pqs_pe_pa_mn_im        [el]; };
   if(el in pqs_pe_pa_mn_ro        ) { rett = rett "#" pqs_pe_pa_mn_ro        [el]; };
   if(el in pqs_pe_pa_mn_tv        ) { rett = rett "#" pqs_pe_pa_mn_tv        [el]; };
   if(el in pqs_pe_sd_pa_mn_da     ) { rett = rett "#" pqs_pe_sd_pa_mn_da     [el]; };
   if(el in pqs_pe_sd_pa_mn_im     ) { rett = rett "#" pqs_pe_sd_pa_mn_im     [el]; };
   if(el in pqs_pe_sd_pa_mn_ro     ) { rett = rett "#" pqs_pe_sd_pa_mn_ro     [el]; };
   if(el in pqs_pe_sd_pa_mn_tv     ) { rett = rett "#" pqs_pe_sd_pa_mn_tv     [el]; };
   if(el in pqs_pn_pa_mn_da        ) { rett = rett "#" pqs_pn_pa_mn_da        [el]; };
   if(el in pqs_pn_pa_mn_im        ) { rett = rett "#" pqs_pn_pa_mn_im        [el]; };
   if(el in pqs_pn_pa_mn_ro        ) { rett = rett "#" pqs_pn_pa_mn_ro        [el]; };
   if(el in pqs_pn_pa_mn_tv        ) { rett = rett "#" pqs_pn_pa_mn_tv        [el]; };
   if(el in pred_da                ) { rett = rett "#" pred_da                [el]; };
   if(el in pred_im                ) { rett = rett "#" pred_im                [el]; };
   if(el in pred_pr                ) { rett = rett "#" pred_pr                [el]; };
   if(el in pred_ro                ) { rett = rett "#" pred_ro                [el]; };
   if(el in pred_tv                ) { rett = rett "#" pred_tv                [el]; };
   if(el in pred_vi                ) { rett = rett "#" pred_vi                [el]; };
   if(el in predk                  ) { rett = rett "#" predk                  [el]; };
   if(el in qall                   ) { rett = rett "#" qall                   [el]; };
   if(el in qko_da                 ) { rett = rett "#" qko_da                 [el]; };
   if(el in qko_ed_mu_da           ) { rett = rett "#" qko_ed_mu_da           [el]; };
   if(el in qko_ed_mu_im           ) { rett = rett "#" qko_ed_mu_im           [el]; };
   if(el in qko_ed_mu_pr           ) { rett = rett "#" qko_ed_mu_pr           [el]; };
   if(el in qko_ed_mu_ro           ) { rett = rett "#" qko_ed_mu_ro           [el]; };
   if(el in qko_ed_mu_tv           ) { rett = rett "#" qko_ed_mu_tv           [el]; };
   if(el in qko_ed_mu_vi           ) { rett = rett "#" qko_ed_mu_vi           [el]; };
   if(el in qko_ed_sr_da           ) { rett = rett "#" qko_ed_sr_da           [el]; };
   if(el in qko_ed_sr_im           ) { rett = rett "#" qko_ed_sr_im           [el]; };
   if(el in qko_ed_sr_pr           ) { rett = rett "#" qko_ed_sr_pr           [el]; };
   if(el in qko_ed_sr_ro           ) { rett = rett "#" qko_ed_sr_ro           [el]; };
   if(el in qko_ed_sr_tv           ) { rett = rett "#" qko_ed_sr_tv           [el]; };
   if(el in qko_ed_sr_vi           ) { rett = rett "#" qko_ed_sr_vi           [el]; };
   if(el in qko_ed_ze_da           ) { rett = rett "#" qko_ed_ze_da           [el]; };
   if(el in qko_ed_ze_im           ) { rett = rett "#" qko_ed_ze_im           [el]; };
   if(el in qko_ed_ze_pr           ) { rett = rett "#" qko_ed_ze_pr           [el]; };
   if(el in qko_ed_ze_ro           ) { rett = rett "#" qko_ed_ze_ro           [el]; };
   if(el in qko_ed_ze_tv           ) { rett = rett "#" qko_ed_ze_tv           [el]; };
   if(el in qko_ed_ze_vi           ) { rett = rett "#" qko_ed_ze_vi           [el]; };
   if(el in qko_im                 ) { rett = rett "#" qko_im                 [el]; };
   if(el in qko_mn_da              ) { rett = rett "#" qko_mn_da              [el]; };
   if(el in qko_mn_im              ) { rett = rett "#" qko_mn_im              [el]; };
   if(el in qko_mn_pr              ) { rett = rett "#" qko_mn_pr              [el]; };
   if(el in qko_mn_ro              ) { rett = rett "#" qko_mn_ro              [el]; };
   if(el in qko_mn_tv              ) { rett = rett "#" qko_mn_tv              [el]; };
   if(el in qko_mn_vi              ) { rett = rett "#" qko_mn_vi              [el]; };
   if(el in qko_pr                 ) { rett = rett "#" qko_pr                 [el]; };
   if(el in qko_ro                 ) { rett = rett "#" qko_ro                 [el]; };
   if(el in qko_tv                 ) { rett = rett "#" qko_tv                 [el]; };
   if(el in qko_vi                 ) { rett = rett "#" qko_vi                 [el]; };
   if(el in qko_ze_im              ) { rett = rett "#" qko_ze_im              [el]; };
   if(el in qko_ze_vi              ) { rett = rett "#" qko_ze_vi              [el]; };
   if(el in qne_da                 ) { rett = rett "#" qne_da                 [el]; };
   if(el in qne_im                 ) { rett = rett "#" qne_im                 [el]; };
   if(el in qne_pr                 ) { rett = rett "#" qne_pr                 [el]; };
   if(el in qne_ro                 ) { rett = rett "#" qne_ro                 [el]; };
   if(el in qne_tv                 ) { rett = rett "#" qne_tv                 [el]; };
   if(el in qne_vi                 ) { rett = rett "#" qne_vi                 [el]; };
   if(el in qpo_ed_mu_da           ) { rett = rett "#" qpo_ed_mu_da           [el]; };
   if(el in qpo_ed_mu_im           ) { rett = rett "#" qpo_ed_mu_im           [el]; };
   if(el in qpo_ed_mu_pr           ) { rett = rett "#" qpo_ed_mu_pr           [el]; };
   if(el in qpo_ed_mu_ro           ) { rett = rett "#" qpo_ed_mu_ro           [el]; };
   if(el in qpo_ed_mu_tv           ) { rett = rett "#" qpo_ed_mu_tv           [el]; };
   if(el in qpo_ed_sr_da           ) { rett = rett "#" qpo_ed_sr_da           [el]; };
   if(el in qpo_ed_sr_im           ) { rett = rett "#" qpo_ed_sr_im           [el]; };
   if(el in qpo_ed_sr_pr           ) { rett = rett "#" qpo_ed_sr_pr           [el]; };
   if(el in qpo_ed_sr_ro           ) { rett = rett "#" qpo_ed_sr_ro           [el]; };
   if(el in qpo_ed_sr_tv           ) { rett = rett "#" qpo_ed_sr_tv           [el]; };
   if(el in qpo_ed_sr_vi           ) { rett = rett "#" qpo_ed_sr_vi           [el]; };
   if(el in qpo_ed_ze_da           ) { rett = rett "#" qpo_ed_ze_da           [el]; };
   if(el in qpo_ed_ze_im           ) { rett = rett "#" qpo_ed_ze_im           [el]; };
   if(el in qpo_ed_ze_pr           ) { rett = rett "#" qpo_ed_ze_pr           [el]; };
   if(el in qpo_ed_ze_ro           ) { rett = rett "#" qpo_ed_ze_ro           [el]; };
   if(el in qpo_ed_ze_tv           ) { rett = rett "#" qpo_ed_ze_tv           [el]; };
   if(el in qpo_ed_ze_vi           ) { rett = rett "#" qpo_ed_ze_vi           [el]; };
   if(el in qpo_mn_da              ) { rett = rett "#" qpo_mn_da              [el]; };
   if(el in qpo_mn_im              ) { rett = rett "#" qpo_mn_im              [el]; };
   if(el in qpo_mn_pr              ) { rett = rett "#" qpo_mn_pr              [el]; };
   if(el in qpo_mn_ro              ) { rett = rett "#" qpo_mn_ro              [el]; };
   if(el in qpo_mn_tv              ) { rett = rett "#" qpo_mn_tv              [el]; };
   if(el in qso_da                 ) { rett = rett "#" qso_da                 [el]; };
   if(el in qso_im                 ) { rett = rett "#" qso_im                 [el]; };
   if(el in qso_mu_da              ) { rett = rett "#" qso_mu_da              [el]; };
   if(el in qso_mu_im              ) { rett = rett "#" qso_mu_im              [el]; };
   if(el in qso_mu_pr              ) { rett = rett "#" qso_mu_pr              [el]; };
   if(el in qso_mu_ro              ) { rett = rett "#" qso_mu_ro              [el]; };
   if(el in qso_mu_tv              ) { rett = rett "#" qso_mu_tv              [el]; };
   if(el in qso_mu_vi              ) { rett = rett "#" qso_mu_vi              [el]; };
   if(el in qso_pr                 ) { rett = rett "#" qso_pr                 [el]; };
   if(el in qso_ro                 ) { rett = rett "#" qso_ro                 [el]; };
   if(el in qso_sr_da              ) { rett = rett "#" qso_sr_da              [el]; };
   if(el in qso_sr_im              ) { rett = rett "#" qso_sr_im              [el]; };
   if(el in qso_sr_pr              ) { rett = rett "#" qso_sr_pr              [el]; };
   if(el in qso_sr_ro              ) { rett = rett "#" qso_sr_ro              [el]; };
   if(el in qso_sr_tv              ) { rett = rett "#" qso_sr_tv              [el]; };
   if(el in qso_sr_vi              ) { rett = rett "#" qso_sr_vi              [el]; };
   if(el in qso_tv                 ) { rett = rett "#" qso_tv                 [el]; };
   if(el in qso_vi                 ) { rett = rett "#" qso_vi                 [el]; };
   if(el in qso_ze_da              ) { rett = rett "#" qso_ze_da              [el]; };
   if(el in qso_ze_im              ) { rett = rett "#" qso_ze_im              [el]; };
   if(el in qso_ze_pr              ) { rett = rett "#" qso_ze_pr              [el]; };
   if(el in qso_ze_ro              ) { rett = rett "#" qso_ze_ro              [el]; };
   if(el in qso_ze_tv              ) { rett = rett "#" qso_ze_tv              [el]; };
   if(el in qso_ze_vi              ) { rett = rett "#" qso_ze_vi              [el]; };
   if(el in qst                    ) { rett = rett "#" qst                    [el]; };
   if(el in suyz                   ) { rett = rett "#" suyz                   [el]; };
   if(el in sw_edmu_da             ) { rett = rett "#" sw_edmu_da             [el]; };
   if(el in sw_edmu_im             ) { rett = rett "#" sw_edmu_im             [el]; };
   if(el in sw_edmu_ne             ) { rett = rett "#" sw_edmu_ne             [el]; };
   if(el in sw_edmu_pr             ) { rett = rett "#" sw_edmu_pr             [el]; };
   if(el in sw_edmu_ro             ) { rett = rett "#" sw_edmu_ro             [el]; };
   if(el in sw_edmu_tv             ) { rett = rett "#" sw_edmu_tv             [el]; };
   if(el in sw_edmu_vi             ) { rett = rett "#" sw_edmu_vi             [el]; };
   if(el in sw_edob_da             ) { rett = rett "#" sw_edob_da             [el]; };
   if(el in sw_edob_im             ) { rett = rett "#" sw_edob_im             [el]; };
   if(el in sw_edob_ne             ) { rett = rett "#" sw_edob_ne             [el]; };
   if(el in sw_edob_pr             ) { rett = rett "#" sw_edob_pr             [el]; };
   if(el in sw_edob_ro             ) { rett = rett "#" sw_edob_ro             [el]; };
   if(el in sw_edob_tv             ) { rett = rett "#" sw_edob_tv             [el]; };
   if(el in sw_edob_vi             ) { rett = rett "#" sw_edob_vi             [el]; };
   if(el in sw_edsr_da             ) { rett = rett "#" sw_edsr_da             [el]; };
   if(el in sw_edsr_im             ) { rett = rett "#" sw_edsr_im             [el]; };
   if(el in sw_edsr_pr             ) { rett = rett "#" sw_edsr_pr             [el]; };
   if(el in sw_edsr_ro             ) { rett = rett "#" sw_edsr_ro             [el]; };
   if(el in sw_edsr_tv             ) { rett = rett "#" sw_edsr_tv             [el]; };
   if(el in sw_edsr_vi             ) { rett = rett "#" sw_edsr_vi             [el]; };
   if(el in sw_edze_da             ) { rett = rett "#" sw_edze_da             [el]; };
   if(el in sw_edze_im             ) { rett = rett "#" sw_edze_im             [el]; };
   if(el in sw_edze_pr             ) { rett = rett "#" sw_edze_pr             [el]; };
   if(el in sw_edze_ro             ) { rett = rett "#" sw_edze_ro             [el]; };
   if(el in sw_edze_tv             ) { rett = rett "#" sw_edze_tv             [el]; };
   if(el in sw_edze_vi             ) { rett = rett "#" sw_edze_vi             [el]; };
   if(el in sw_mn_da               ) { rett = rett "#" sw_mn_da               [el]; };
   if(el in sw_mn_im               ) { rett = rett "#" sw_mn_im               [el]; };
   if(el in sw_mn_ne               ) { rett = rett "#" sw_mn_ne               [el]; };
   if(el in sw_mn_pr               ) { rett = rett "#" sw_mn_pr               [el]; };
   if(el in sw_mn_ro               ) { rett = rett "#" sw_mn_ro               [el]; };
   if(el in sw_mn_tv               ) { rett = rett "#" sw_mn_tv               [el]; };
   if(el in sw_mn_vi               ) { rett = rett "#" sw_mn_vi               [el]; };
   if(el in swn_edmu_da            ) { rett = rett "#" swn_edmu_da            [el]; };
   if(el in swn_edmu_im            ) { rett = rett "#" swn_edmu_im            [el]; };
   if(el in swn_edmu_me            ) { rett = rett "#" swn_edmu_me            [el]; };
   if(el in swn_edmu_ne            ) { rett = rett "#" swn_edmu_ne            [el]; };
   if(el in swn_edmu_pr            ) { rett = rett "#" swn_edmu_pr            [el]; };
   if(el in swn_edmu_pt            ) { rett = rett "#" swn_edmu_pt            [el]; };
   if(el in swn_edmu_ro            ) { rett = rett "#" swn_edmu_ro            [el]; };
   if(el in swn_edmu_sq            ) { rett = rett "#" swn_edmu_sq            [el]; };
   if(el in swn_edmu_tv            ) { rett = rett "#" swn_edmu_tv            [el]; };
   if(el in swn_edob_da            ) { rett = rett "#" swn_edob_da            [el]; };
   if(el in swn_edob_im            ) { rett = rett "#" swn_edob_im            [el]; };
   if(el in swn_edob_ne            ) { rett = rett "#" swn_edob_ne            [el]; };
   if(el in swn_edob_pr            ) { rett = rett "#" swn_edob_pr            [el]; };
   if(el in swn_edob_ro            ) { rett = rett "#" swn_edob_ro            [el]; };
   if(el in swn_edob_tv            ) { rett = rett "#" swn_edob_tv            [el]; };
   if(el in swn_edob_vi            ) { rett = rett "#" swn_edob_vi            [el]; };
   if(el in swn_edsr_da            ) { rett = rett "#" swn_edsr_da            [el]; };
   if(el in swn_edsr_im            ) { rett = rett "#" swn_edsr_im            [el]; };
   if(el in swn_edsr_ne            ) { rett = rett "#" swn_edsr_ne            [el]; };
   if(el in swn_edsr_pr            ) { rett = rett "#" swn_edsr_pr            [el]; };
   if(el in swn_edsr_ro            ) { rett = rett "#" swn_edsr_ro            [el]; };
   if(el in swn_edsr_tv            ) { rett = rett "#" swn_edsr_tv            [el]; };
   if(el in swn_edsr_vi            ) { rett = rett "#" swn_edsr_vi            [el]; };
   if(el in swn_edze_da            ) { rett = rett "#" swn_edze_da            [el]; };
   if(el in swn_edze_im            ) { rett = rett "#" swn_edze_im            [el]; };
   if(el in swn_edze_me            ) { rett = rett "#" swn_edze_me            [el]; };
   if(el in swn_edze_ne            ) { rett = rett "#" swn_edze_ne            [el]; };
   if(el in swn_edze_pr            ) { rett = rett "#" swn_edze_pr            [el]; };
   if(el in swn_edze_ro            ) { rett = rett "#" swn_edze_ro            [el]; };
   if(el in swn_edze_tv            ) { rett = rett "#" swn_edze_tv            [el]; };
   if(el in swn_edze_vi            ) { rett = rett "#" swn_edze_vi            [el]; };
   if(el in swn_mn_da              ) { rett = rett "#" swn_mn_da              [el]; };
   if(el in swn_mn_im              ) { rett = rett "#" swn_mn_im              [el]; };
   if(el in swn_mn_ne              ) { rett = rett "#" swn_mn_ne              [el]; };
   if(el in swn_mn_pr              ) { rett = rett "#" swn_mn_pr              [el]; };
   if(el in swn_mn_ro              ) { rett = rett "#" swn_mn_ro              [el]; };
   if(el in swn_mn_sq              ) { rett = rett "#" swn_mn_sq              [el]; };
   if(el in swn_mn_tv              ) { rett = rett "#" swn_mn_tv              [el]; };
   if(el in swo_edmu_da            ) { rett = rett "#" swo_edmu_da            [el]; };
   if(el in swo_edmu_im            ) { rett = rett "#" swo_edmu_im            [el]; };
   if(el in swo_edmu_ne            ) { rett = rett "#" swo_edmu_ne            [el]; };
   if(el in swo_edmu_pr            ) { rett = rett "#" swo_edmu_pr            [el]; };
   if(el in swo_edmu_ro            ) { rett = rett "#" swo_edmu_ro            [el]; };
   if(el in swo_edmu_tv            ) { rett = rett "#" swo_edmu_tv            [el]; };
   if(el in swo_edmu_zv            ) { rett = rett "#" swo_edmu_zv            [el]; };
   if(el in swo_edob_da            ) { rett = rett "#" swo_edob_da            [el]; };
   if(el in swo_edob_im            ) { rett = rett "#" swo_edob_im            [el]; };
   if(el in swo_edob_ne            ) { rett = rett "#" swo_edob_ne            [el]; };
   if(el in swo_edob_pr            ) { rett = rett "#" swo_edob_pr            [el]; };
   if(el in swo_edob_ro            ) { rett = rett "#" swo_edob_ro            [el]; };
   if(el in swo_edob_tv            ) { rett = rett "#" swo_edob_tv            [el]; };
   if(el in swo_edob_vi            ) { rett = rett "#" swo_edob_vi            [el]; };
   if(el in swo_edsr_da            ) { rett = rett "#" swo_edsr_da            [el]; };
   if(el in swo_edsr_im            ) { rett = rett "#" swo_edsr_im            [el]; };
   if(el in swo_edsr_pr            ) { rett = rett "#" swo_edsr_pr            [el]; };
   if(el in swo_edsr_ro            ) { rett = rett "#" swo_edsr_ro            [el]; };
   if(el in swo_edsr_tv            ) { rett = rett "#" swo_edsr_tv            [el]; };
   if(el in swo_edsr_vi            ) { rett = rett "#" swo_edsr_vi            [el]; };
   if(el in swo_edze_da            ) { rett = rett "#" swo_edze_da            [el]; };
   if(el in swo_edze_im            ) { rett = rett "#" swo_edze_im            [el]; };
   if(el in swo_edze_ne            ) { rett = rett "#" swo_edze_ne            [el]; };
   if(el in swo_edze_pr            ) { rett = rett "#" swo_edze_pr            [el]; };
   if(el in swo_edze_ro            ) { rett = rett "#" swo_edze_ro            [el]; };
   if(el in swo_edze_tv            ) { rett = rett "#" swo_edze_tv            [el]; };
   if(el in swo_edze_vi            ) { rett = rett "#" swo_edze_vi            [el]; };
   if(el in swo_edze_zv            ) { rett = rett "#" swo_edze_zv            [el]; };
   if(el in swo_mn_da              ) { rett = rett "#" swo_mn_da              [el]; };
   if(el in swo_mn_im              ) { rett = rett "#" swo_mn_im              [el]; };
   if(el in swo_mn_ne              ) { rett = rett "#" swo_mn_ne              [el]; };
   if(el in swo_mn_pr              ) { rett = rett "#" swo_mn_pr              [el]; };
   if(el in swo_mn_ro              ) { rett = rett "#" swo_mn_ro              [el]; };
   if(el in swo_mn_sq              ) { rett = rett "#" swo_mn_sq              [el]; };
   if(el in swo_mn_tv              ) { rett = rett "#" swo_mn_tv              [el]; };
   if(el in vvodn                  ) { rett = rett "#" vvodn                  [el]; };
                                                                              
#  if(el in gc_ed                  ) { rett = rett "#" gc_ed                  [el]; };
#  if(el in gc_in                  ) { rett = rett "#" gc_in                  [el]; };
#  if(el in gc_mn                  ) { rett = rett "#" gc_mn                  [el]; };
#  if(el in gc_po                  ) { rett = rett "#" gc_po                  [el]; };
#  if(el in geo_edsrim             ) { rett = rett "#" geo_edsrim             [el]; };
#  if(el in geo_mnim               ) { rett = rett "#" geo_mnim               [el]; };
   if(el in md_bz                  ) { rett = rett "#" md_bz                  [el]; };
   if(el in md_ed                  ) { rett = rett "#" md_ed                  [el]; };
   if(el in md_mn                  ) { rett = rett "#" md_mn                  [el]; };
   if(el in titl                   ) { rett = rett "#" titl                   [el]; };
#  if(el in muc_edmuda             ) { rett = rett "#" muc_edmuda             [el]; };
#  if(el in muc_edmuim             ) { rett = rett "#" muc_edmuim             [el]; };
#  if(el in muc_edmupr             ) { rett = rett "#" muc_edmupr             [el]; };
#  if(el in muc_edmuro             ) { rett = rett "#" muc_edmuro             [el]; };
#  if(el in muc_edmutv             ) { rett = rett "#" muc_edmutv             [el]; };
#  if(el in muc_edmuvi             ) { rett = rett "#" muc_edmuvi             [el]; };
#  if(el in muc_edsrda             ) { rett = rett "#" muc_edsrda             [el]; };
#  if(el in muc_edsrim             ) { rett = rett "#" muc_edsrim             [el]; };
#  if(el in muc_edsrpr             ) { rett = rett "#" muc_edsrpr             [el]; };
#  if(el in muc_edsrro             ) { rett = rett "#" muc_edsrro             [el]; };
#  if(el in muc_edsrtv             ) { rett = rett "#" muc_edsrtv             [el]; };
#  if(el in muc_edsrvi             ) { rett = rett "#" muc_edsrvi             [el]; };
#  if(el in muc_edzeda             ) { rett = rett "#" muc_edzeda             [el]; };
#  if(el in muc_edzeim             ) { rett = rett "#" muc_edzeim             [el]; };
#  if(el in muc_edzepr             ) { rett = rett "#" muc_edzepr             [el]; };
#  if(el in muc_edzero             ) { rett = rett "#" muc_edzero             [el]; };
#  if(el in muc_edzetv             ) { rett = rett "#" muc_edzetv             [el]; };
#  if(el in muc_edzevi             ) { rett = rett "#" muc_edzevi             [el]; };
#  if(el in muc_mnda               ) { rett = rett "#" muc_mnda               [el]; };
#  if(el in muc_mnim               ) { rett = rett "#" muc_mnim               [el]; };
#  if(el in muc_mnpr               ) { rett = rett "#" muc_mnpr               [el]; };
#  if(el in muc_mnro               ) { rett = rett "#" muc_mnro               [el]; };
#  if(el in muc_mntv               ) { rett = rett "#" muc_mntv               [el]; };
#  if(el in muc_mnvi               ) { rett = rett "#" muc_mnvi               [el]; };
return rett }
