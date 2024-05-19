#!/bin/bash
# Последняя версия тут https://github.com/Balamoote/fb2-scripts
#export LC_ALL=ru_RU.UTF-8
export LC_COLLATE=C
mo_time0=$(date +%s.%N);
key=$1
book=$2

# Установка редактора: vim или neovim
edi=$(sed -rn 's/^\s*editor\s*=\s*(vim|nvim)\s*$/\1/ p' scriptdb/settings.ini)

#массив со списком ключей
p="-gc -06 -stal -st0 -ston -st1 -stln -st2 -stim -st3"
read -a param <<< $p

makebk () { if [[ ! -d $suf-"$book" ]]; then mkdir $suf-"$book"; else rm -rf  $suf-"$book" && mkdir $suf-"$book"; fi; }

d2u () { if [[ -e "$backup" ]]; then printf '\e[36m%s \e[33m%s\e[0m\n' "Найден и восстановлен бэкап:" "$backup"; crlf=$(file $backup | grep -o "CRLF"; );
            if [[ -n $crlf ]]; then dos2unix "$backup" &>/dev/null; fi; cp "$backup" "$book";
        else crlf=$(file "$book" | grep -o "CRLF"); if [[ -n $crlf ]]; then dos2unix "$book" &>/dev/null; fi; sed -r 's/\xc2\xa0/ /g' "$book" > "$backup"; fi; }

case $key in 
    -gc | -06) # Запустить скрипт "генеральная уборка" (без функции паддинга тэгов)
        export LC_ALL=ru_RU.UTF-8
        suf=06 
        sed_pre="scriptdb/fb2/06_gc_pre.sed"
        sed_main="scriptdb/fb2/06_gc_main.sed"
        sed_post="scriptdb/fb2/06_gc_post.sed"
        sed_latcyr="scriptdb/fb2/06_latcyr.sed"
        awk_cleaner="scriptdb/fb2/cleaner.awk"
        awk_indent="scriptdb/fb2/indent.awk"
        backup="$book".$suf
        export sib="<emphasis>|<strong>|<emphasis><strong>|<strong><emphasis>"
        export fib="</emphasis>|</strong>|</emphasis></strong>|</strong></emphasis>"
        export aib="<emphasis>|<strong>|<emphasis><strong>|<strong><emphasis>|</emphasis>|</strong>|</emphasis></strong>|</strong></emphasis>"

        makebk; d2u; 

        sed -ri "s=(<binary\s)=\n\1=1" "$book"

        sed "/<binary/Q; s=<code>.*</code>=\x00\n\0\x00\n=g" "$book" | sed -rf "$sed_pre" | sed -r '/^[ \t]*$/d' | sed -rf <(envsubst '$sib $fib $aib' <"$sed_main") | \
            sed -rf "$sed_post" | awk -f "$awk_cleaner" | awk -f "$awk_indent" > $suf-"$book"/text-book.txt

        sed -n '/<binary/,$p' "$book" | sed -r 's/^\s*//' | tr -d '\n' | sed -r 's=(</binary>)=\n\1\n=g' | sed -r 's=(.{72})=\1\n=g' > $suf-"$book"/binary-book.txt

        # Фикс римских цифр, записанных кириллицей
	if grep -q -m 1 "[CILMVX]" $suf-"$book"/text-book.txt; then latcyr=1
        while [ $latcyr != "0" ]
        do sed -ri "s=Х([CILMVX])=X\1=g
                    s=([CILMVX])Х=\1X=g
                    s=І([CILMVX])=I\1=g
                    s=([CILMVX])І=\1I=g
                    s=С([CILMVX])=C\1=g
                    s=([CILMVX])С=\1C=g
                    s=М([CILMVX])=M\1=g
                    s=([CILMVX])М=\1M=g
                    s=ХХ=XX=g
                    s=ІІ=II=g
                    " $suf-"$book"/text-book.txt

            latcyr=$(grep -e "[ХІСМ][CILMVX]" -e "[CILMVX][ХІС]" -e "ХХ" -e "ІІ" $suf-"$book"/text-book.txt | wc -l)
        done; fi

	# Кириллица в латинице: искать до упора
    if grep -q -m 1 "[аА-ԯЀЁЂЃЄЅІЇЈЉ]" $suf-"$book"/text-book.txt; then mdchk0="foo"
	    until [ "$mdchk0" == "$mdchk1" ]; do
            mdchk0=$(md5sum $suf-"$book"/text-book.txt | awk '{print $1}')
            sed -i -rf "$sed_latcyr" $suf-"$book"/text-book.txt;
            mdchk1=$(md5sum $suf-"$book"/text-book.txt | awk '{print $1}')
        done
	fi

        cat $suf-"$book"/text-book.txt $suf-"$book"/binary-book.txt > "$book"
        rm -rf $suf-"$book"
	# Валидация и раскраска отчёта
	xmllint --nonet --noout --schema "scriptdb/fb2/schema/FictionBook.xsd" "$book" 2>&1 | \
            sed -r "s=\{http://www\.gribuser\.ru/xml/fictionbook/2\.0\}==gI
	                  s=^.*\svalidates$=`printf "\e[32m&\e[0m"`=g
                    s=^.*\sfails to validate.*$=`printf "\e[31m&\e[0m"`=g
                    s=^.*\sSchemas validity error.*$=`printf "\e[93m&\e[0m"`=g
                    s=^.*\sparser error.*$=`printf "\e[93m&\e[0m"`=g
                    "
       # Сравнение исходного и обработанного файлов, если не нужно - закомментировать следующие 3 строки. 
        sed -r 's/\xc2\xa0/ /g' "$book" > "$book".gc
        $edi -d "$book".gc "$backup"
        rm "$book".gc
        ;;

    -lnun | -lu) # Сквозная сортировка сносок типа n_[0-9]+ и их <section id=, базовая проверка ссылок
        export LC_ALL=ru_RU.UTF-8
        suf=01 
        sed_links_uni="scriptdb/fb2/01_links_uni.sed"
        awk_links_n="scriptdb/fb2/links-n.awk"
        backup="$book".$suf

        d2u;
	sed -i -rf "$sed_links_uni" "$book"
	awk -v ofile="$book" -f $awk_links_n "$book"
        ;;
    -stal | -st0) # Вывести структуру fb2: основные тэги + заголовки + сноски тексте + картинки
        awk -v maintags=1 -v titltags=1 -v linktags=1 -v imgstags=1 -f scriptdb/fb2/structure.awk "$book"
        ;;
    -ston | -st1) # Вывести структуру fb2: основные тэги + заголовки
        awk -v maintags=1 -v titltags=1 -f scriptdb/fb2/structure.awk "$book"
        ;;
    -stln | -st3) # Вывести структуру fb2: только сноски в тексте
        awk -v linktags=1 -f scriptdb/fb2/structure.awk "$book"
        ;;
    -stim | -st4) # Вывести структуру fb2: только тэги картинок
        awk -v imgstags=1 -f scriptdb/fb2/structure.awk "$book"
        ;;

    -ch | -char) # Вывести список всех символов в файле
        charlist=$(awk '{for (i=1; i<=NF; i++) {a[$i]++}} END{for (i in a) print i}' FS="" ORS="\n" "$book" | sort -u | tr -d "\n")
        printf '\e[32m%s\e[0m\n' "$charlist"
        #    echo "$charlist" | iconv -f utf8 -t utf32le | hexdump -v -e '20/4 "%04x " "\n"'
        wrp=16
        printf '%s' "$charlist" |while IFS= read -d $'\000' -n 1 x; do r=$(($r+1));
            unc=$(printf '%s' "$x" | sed 's=[\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]=multibit=')
            if [[ "$unc" == "multibit" ]]; then printf '\e[92m %s \e[33m%4x\e[0m|' "$x" "'$x"; else printf '\e[36m%s \e[33m%4x\e[0m|' "$x" "'$x"; fi
            if [[ $r -eq $wrp ]]; then r=0; printf "\n"; fi; done; printf "\n"
        ;;
    -ch0 | -chnc) # Вывести список всех символов в файле (без цвета)
        charlist=$(awk '{for (i=1; i<=NF; i++) {a[$i]++}} END{for (i in a) print i}' FS="" ORS="\n" "$book" | sort -u | tr -d "\n")
        wrp=30
        printf '%s' "$charlist" |while IFS= read -d $'\000' -n 1 x; do r=$(($r+1));
            printf ' %2s ' "$x"; if [[ $r -eq $wrp ]]; then r=0; printf "\n"; fi; done; printf "\n"
        #    echo "$charlist" | iconv -f utf8 -t utf32le | hexdump -v -e '20/4 "%04x " "\n"'
        wrp=16
        printf '%s' "$charlist" |while IFS= read -d $'\000' -n 1 x; do r=$(($r+1));
            unc=$(printf '%s' "$x" | sed 's=[\x00-\x1f\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]=multibit=')
            if [[ "$unc" == "multibit" ]]; then printf ' %s %4x|' "$x" "'$x"; else printf '%s %4x|' "$x" "'$x"; fi
            if [[ $r -eq $wrp ]]; then r=0; printf "\n"; fi; done;
        ;;
    *) # Нечто другое
        printf '\e[32m%s\e[0m\n' "Задайте правильный ключ!"; exit 0 ;;
esac
