# Деомографизатор
# Читает файл(ы) словаря с морфологической информацией и заменяет омографы согласно правилам

# Перенумеровать правила в vim:
# let @a=1|%s/"R\zs\d\+\ze"/\=''.(@a+setreg('a',@a+1))/g|%s/ R\[\zs\d\+\ze\]++; if(dbg){print "R\(\d\+\)"/\1/g|%s/{system(cmd); for (i=1; i<=\zs\d\+\ze;/\=''.(@a-1)/g
#
# NB: во всех функциях поле указывается относительно 0, 0 - это позиция поискового слова.
# если задана переменные indb при запуске, то искать словари в директории "indb/", иначе по месту запуска
# если задана переменные inax при запуске, то писать служебные файлы в директории "inax/", иначе по месту запуска (имеет смысл только для gawk>=5.2.1)
# Последняя версия файла тут: https://github.com/Balamoote/gtts-scripts

@include "scriptdb/functions.awk"
@include "scriptdb/cstauto.awk"
@include "scriptdb/classes.awk"
@include "scriptdb/cstring.awk"
@include "scriptdb/defunct.awk"
@include "scriptdb/demorphy.awk"
@include "scriptdb/vsevso.awk"
@include "scriptdb/zamok.awk"
@include "scriptdb/deomo.awk"

BEGIN { PROCINFO["sorted_in"]="@ind_num_asc"

  #dbg = 0
   dbgstat = 0 # имя дебажного массива установить при вызове функции DO_DEBUG() в deomo.awk

   unxy    = "[\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
   unxyp   = "[\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]+"
   unxn    = "[^\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
   RUUC    = "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ]+"
   RUUC_   = "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ]"
   rulc    = "[абвгдеёжзийклмнопрстуфхцчшщъыьэюя]+"
   rulc_   = "[абвгдеёжзийклмнопрстуфхцчшщъыьэюя]"
   LAUC_   = "[A-ZÀÁÂÃÄÅĀĂÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝ]"
   lalc    = "[a-zàáâãäåāăæçèéêëìíîïðñòóôõöøùúûüýß]+"
   patword = "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb00-9]+"
   regword = "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
   fsword  = "[^АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
   capword = "^[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ]+$"
   vvpat   = "[,—]"
   hysnip  = regword "[-]" regword

   savefs = FS;
   FS = fsword;
} {
    num++;
    split($0,currline,"<@##@##@>");
    if ( morphy_on == "1" ) { bphy[num] = currline[2] };
    $0 = book[num] = currline[1];

    for (i=1; i<=NF; i++) { ci=tolower($i);
 # Сканируем текст на омографы.
 #   Для сканирования 1 омографа:       ./momo.sh -sw book.fb2 замок
 #   Для сканирования группы омографов: ./momo.sh -sg book.fb2 x4707
#_#_#txtmppra
        if($i in vse  && num!=o000    ) {vseT [ci]           = vseT [ci]           num " "; o000     = num}; # "все" (но не вСЕ,вСе,всЕ)   #_#_# vsez !_#_!
        if($i in almo && num!=o001[$i]) {omap [almo[$i]][$i] = omap [almo[$i]][$i] num " "; o001[$i] = num}; # омографы кроме "все"        #_#_# all_omos !_#_!
#       if(ci=="dummy"&& num!=o001[$i]) {omap [almo[$i]][$i] = omap [almo[$i]][$i] num " "; o001[$i] = num}; # отдельное слово             #_#_# single_word !_#_!
#       if(almo[$i]=="dummy"&& num!=o001[$i]) {omap [almo[$i]][$i] = omap [almo[$i]][$i] num " "; o001[$i] = num}; # отдельное слово       #_#_# single_group !_#_!
#_#_#txtmpprb

  };
}