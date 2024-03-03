#!/bin/bash
# Скрипт сбора новых слов и простановки ударений в именах собственных; генерирует списки-отчёты слов для ручной обработки
# Актуальная расшифровка ключей ниже в блоке case $key in.

# ручная обработка имён-омографов через дискретные скрипты работает только с установленным плагинами vim:
# 1) vim-ingo-library, брать тут https://github.com/inkarkat/vim-ingo-library
# 2) vim-PatternsOnText, брать тут https://github.com/inkarkat/vim-PatternsOnText

# Обязательно: после завершения обработки каждого файла нужно выполнить следующую последовательность команд:
# ./addname.sh -a (или ./addname.sh, затем ./add2lexx.sh, затем ./check-lexx.sh) - это внесёт изменения в базы
# ./all-in-one.sh -g book.fb2

# Файлы-списки вида 01_nom_surlex_234.list имею имена, которые состоят из нескольких элементов:
# 1) 2 цифры в начале названия - порядковый номер. Предпочтительно обрабатывать их в этом порядке.
# 2) wrd - слово в нижнем регистре, кандидат на внесение в словарь
# 3) nam - слово, встреченное с начальной буквой в верхнем регистре, возможно - имя собственное.
# 4) new - (=newdic) слово не найдено ни в одной базе, возможный кандидат на включение либо в словарь lexx, либо в базы имён. 
# 5) sur - (от sure - "наверняка"), слова с Заглавной, которые были найдены в середине предложения, скорее всего имена
# 6) any - (от any - "любой"), слова с Заглавной, которые были найдены НЕ в середине предложения, могут быть именами
# 7) bas - слово содержится в базовом проверочном словаре (почти полный эквивалент словаря Хагена), там имён относительно мало
# 8) lex - слово НЕ содержится в базовом проверочном словаре, но обрабатывается словарем lexx, может имя, а может и нет
# 9) dq  - (от double quotes = двойные кавычки) слово обработано шаблоном с кавычками, т.е. срабатывание на начальную часть слова
# 10) si - (от simple = простой) слово обработано простым шаблоном, т.е. срабатывание на всё слово целиком
# 11) nl - (от no lexx) слово не обрабатывается lexx, т.е. его нет ни в одной из баз
# 12) перед суффиксом отчётов ".list" указано количество строк/слов в данном файле.

# После завершения работы на файлами *.list можно запустить скрипт обработки книги ./all-in-one.sh с ключом по вкусу или просто
# ./get-words.sh -gg book.fb2

# Имена собственные, являющиеся также омографами выделены для ручной обработки отдельно в виде набора скриптов в папке nomo-book.fb2

# Подробности см. в файлах README стандартной поставки (может быть устаревшим).

# При добавлении ключа -ld скрипт формирует частный словарь для обрабатываемой книги. Например:
# Команда ./get-words.sh -ld book.fb2 : обработает книгу и ДОПОЛНИТЕЛЬНО сформирует частный словарь book.fb2.lexx
# Команда ./get-words.sh -old book.fb2 : сформирует ТОЛЬКО частный словарь book.fb2.lexx
# При обработке больших списков имён, можно отключить часть операций ключом -bl
# При обработке очень больших файлов с текстом, можно использовать ключ -wo, чтобы только собрать слова, но не расставлять ударения.

# Книга должна быть в кодировке UTF-8
# Последняя версия файла тут: https://github.com/Balamoote/gtts-scripts 
# Для работы модуля дискретных скриптов обработки именных омографов в nomo-$book нужны следующие плагины vim
# 1) https://github.com/inkarkat/vim-PatternsOnText
# 2) https://github.com/inkarkat/vim-ingo-library (чтобы работал п. 1)
# модуль для ручной работы с омографами идентичен для скриптов get-words.sh (имена), yofik.sh (ёфикатор), momo.sh (омографы)
#set -e
export LC_COLLATE=C
gw_time0=$(date +%s.%N);
key="$1"
book="$2"
bookwrkdir=nomo-"$book"
tmpdir=gwt-"$book"
suf=nam
backup="$book".$suf

# Установка редактора: vim или neovim
edi=$(sed -rn 's/^\s*editor\s*=\s*(vim|nvim)\s*$/\1/ p' scriptdb/settings.ini)

# Установка корректировки ширины вывода превью в дискретных скриптах
termcor=$(sed -rn 's/^\s*termcorrection\s*=\s*([-0-9]*)\s*$/\1/ p' scriptdb/settings.ini)

# Переменные алфавита и служебных
RUUC=АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ
rulc=абвгдеёжзийклмнопрстуфхцчшщъыьэюя
RVUC=АЕЁИОУЫЭЮЯ
rvlc=аеёиоуыэюя
unxe=X13456780Ъ # Составные части спецсимволов в gwt-текстах 
unxc=$(printf "\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0")
unxs=$(printf "\xe2\x80\xa4\xe2\x80\xa7")
fkdt=$(printf "\xe2\x80\xa4")
qtsd=$(printf "\x22\x27")
inc=50	  # Количество строк для для обработки файла за один проход для скриптов sed

d2u () { if [[ -e "$backup" ]]; then printf '\e[36m%s \e[33m%s\e[0m\n' "Найден и восстановлен бэкап:" "$backup"; crlf=$(file $backup | grep -o "CRLF"; );
            if [[ -n $crlf ]]; then dos2unix "$backup" &>/dev/null; fi; cp "$backup" "$book";
        else crlf=$(file "$book" | grep -o "CRLF"); if [[ -n $crlf ]]; then dos2unix "$book" &>/dev/null; fi; cp "$book" "$backup"; fi; }
sedroll () { local lico=$(wc -l < "$1"); local i=0; local j=0; for i in $(seq 1 $inc $lico); do j=$(($i+$(($inc-1)))); sed -i -rf <(sed -n "$i,$j p" < "$1") "$2"; done; }

printf '\e[32m%s \e[32;4;1m%s\e[0m\n' "Скрипт" "\"Имена\""

if [[ -s "$1" ]]; then book=$1; backup="$book".$suf; key="-xp"; printf '\e[33m%s \e[93m%s\e[0m\n' "Ключи не заданы, но книга указана. Используем ключ:" "-xp"
elif [[ -s "$2" ]]; then printf '\e[33m%s \e[93m%s\e[0m\n' "Обрабатывается книга:" "$book"
else printf '\e[33m%s \e[93m%s\e[0m\n' "Книга не задана или не существует. Использование:" "./get-words.sh [ключ] book.fb2"; exit 1; fi

# Обработка омографов производится в файле, который задан переменной obook
obook="$book" # омографы пишутся в $book, т.е. в результат после одного из других скриптов
#obook="$book".nam # омографы пишутся в $book.nam, т.е. в файл ДО работы скрипта ./get-words.sh

if [[ ! -d scriptaux ]]; then mkdir scriptaux; fi

case $key in 
	-f) # удалить директорию nomo-book
		if [[ -d "nomo-$book" ]]; then rm -rf "nomo-$book"; printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директория" $bookwrkdir "удалена."; exit 1
		else printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директории" $bookwrkdir "не существует. Используйте другой ключ."; exit 1; fi ;;
	-old) # Сделать частный словарь для книги и НИЧЕГО БОЛЬШЕ НЕ ДЕЛАТЬ
		preview=0; printf '\e[32m%s\e[0m\n' "Только создать локальный словарь." ;;
	-wo) # Большой файл. Собрать слова, текст не обрабатывать, списки 00 - 10
		wonly=1; preview=0; printf '\e[32m%s\e[0m\n' "Превью текста и дискретные скрипты." ;;
	-bl) # Очень большой файл. Собрать слова, текст не обрабатывать. Только списки 00, 01, 02
		biglist=1; preview=0; printf '\e[32m%s\e[0m\n' "Превью текста и дискретные скрипты." ;;
	-px | -xp | -g | -n) # Обработать имена, собрать слова, директорию namo- не удалять (если хотим продолжить работу)
		preview=1; printf '\e[32m%s\e[0m\n' "Однозначные омографы, превью и дискретные скрипты." ;;
	-fpx | -fg | -fn | -gg) # Обработать имена, собрать слова, директорию namo- удалить и создать заново
		preview=1; if [[ -d "nomo-$book" ]]; then rm -rf $bookwrkdir; printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директория" $bookwrkdir "удалена."; fi ;;
	-ld ) # Обработать имена, собрать слова, директорию namo- удалить и создать заново + создать локальный словарь
		preview=1; if [[ -d "nomo-$book" ]]; then rm -rf $bookwrkdir; printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директория" $bookwrkdir "удалена."; fi ;;
	*) # Нечто другое
		printf '\e[32m%s \e[93m%s \e[32m%s \e[93m%s\e[0m\n' "Задайте ключ или книгу. Например:" "./get-words.sh -xp book.fb2" "или" "./get-words.fb2 book.fb2"; exit 0 ;;
esac

if [[ $key != "-old" ]]; then # Выключить всё, кроме создания локального словаря oldchk 0

# Служебный список поисковых строк из базы имён
if [[ -s scriptaux/zwdb.md5 ]] && md5sum -c --status scriptaux/zwdb.md5 >/dev/null 2>&1; then
	printf '\e[36m%s \e[33m%-8s \e[32m%s \e[0m' "Файлы" scriptaux/zwdb.md5 "OK!"; znl=1
else clxx=1; fi

if [[ -s scriptaux/zndb.md5 ]] && md5sum -c --status scriptaux/zndb.md5 >/dev/null 2>&1; then
	printf '\e[36m%s \e[33m%-8s \e[32m%s \e[0m' "Файлы" scriptaux/zndb.md5 "OK!"; znl=1
else clxx=1; fi

if [[ -s scriptaux/zlexxdb.md5 ]] && md5sum -c --status scriptaux/zlexxdb.md5 >/dev/null 2>&1; then
	printf '\e[36m%s \e[33m%-11s \e[32m%s \e[0m' "Файлы" scriptaux/zlexxdb.md5 "OK!"; znl=1
else clxx=1; fi

if [[ $znl -eq 1 ]]; then echo; fi

if [[ $clxx -eq "1" ]]; then
	if ./check-lexx.sh -fg; then printf '\e[32m%s\e[0m\n' "Проверка файлов завершена успешно…"
	else printf '\e[31;1m%s\e[0m \e[93m%s \e[31;1m%s\e[0m\n' "Выполнение скрипта" "./get-words.sh" "прервано! Исправьте ошибки в базах и повторите действие!"; exit 1; fi; fi

if [[ -d $tmpdir ]]; then rm -rf $tmpdir/ && mkdir $tmpdir; else mkdir $tmpdir; fi; d2u

# Удалить старые отчёты 00 - 10
find . -type f -name "[01][0-9]_*\.list" -exec rm '{}'  \;

# gw_m00=$(date +%s.%N); duration=$( echo $gw_m00 - $gw_time0 | bc ) #dbgtime
# LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Метка 00:" $duration "сек" #dbgtime

# Конвертация в UTF-8, если нужно
#vim -c "set nobomb | set fenc=utf8 | x" "$book"

[[ -e "$book".omo ]] && rm "$book".omo
[[ -n $(ls [01][0-9]_*.list_* >/dev/null 2>&1) ]] && rm [01][0-9]_*.list_*

# gw_m01=$(date +%s.%N); duration=$( echo $gw_m01 - $gw_m00 | bc ) #dbgtime
# LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Метка 01:" $duration "сек" #dbgtime

sed "/<binary/Q" "$book" | sed -r "s/\xc2\xa0/ /g; s/\x09/ /g
s=([АБВГДЕЁЖЗИЙКЛМНОПРСТУФЦЧШЩЪЫЬЭЮЯ])ХХ([АБВГДЕЁЖЗИЙКЛМНОПРСТУФЦЧШЩЪЫЬЭЮЯ])=\1хх\2=g
	s=\xcc\x81=X1Ъ=g
	s=\xcc\xa0=X0Ъ=g
	s=\xcc\xa3=X3Ъ=g
	s=\xcc\xa4=X4Ъ=g
	s=\xcc\xad=X5Ъ=g
	s=\xcc\xb0=X6Ъ=g
	s=\xe2\x80\xa4=X8Ъ=g
	s=\xe2\x80\xa7=X7Ъ=g
	" > $tmpdir/text-book.txt
sed -n '/<binary/,$p' "$book" > $tmpdir/binary-book.txt

# gw_m02=$(date +%s.%N); duration=$( echo $gw_m02 - $gw_m01 | bc ) #dbgtime
# LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Метка 02:" $duration "сек" #dbgtime

# Фикс римских цифр, записанных кириллицей
latcyr=1
while [ $latcyr != "0" ]
do	sed -ri "s=Х([CILMVX])=X\1=g
		 s=([CILMVX])Х=\1X=g
		 s=І([CILMVX])=I\1=g
		 s=([CILMVX])І=\1I=g
		 s=С([CILMVX])=C\1=g
		 s=([CILMVX])С=\1C=g
		 s=ХХ=XX=g
		 s=ІІ=II=g
		 " $tmpdir/text-book.txt

latcyr=$(grep -e "[ХІС][CILMVX]" -e "[CILMVX][ХІС]" -e "ХХ" -e "ІІ" $tmpdir/text-book.txt | wc -l)
done

sed -ri "s=([АБВГДЕЁЖЗИЙКЛМНОПРСТУФЦЧШЩЪЫЬЭЮЯ])хх([АБВГДЕЁЖЗИЙКЛМНОПРСТУФЦЧШЩЪЫЬЭЮЯ])=\1ХХ\2=g" $tmpdir/text-book.txt

# gw_m03=$(date +%s.%N); duration=$( echo $gw_m03 - $gw_m02 | bc ) #dbgtime
# LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Метка 03:" $duration "сек" #dbgtime

# Список обычных слов (только с маленькой буквы)
 sed -r 's/^/ /g' $tmpdir/text-book.txt | grep -Po "(?<![$RUUC$rulc$unxe])[$rulc$unxe]+" | grep -Ev "[$unxe]" | sed -r "s/^.+$/_\0=/g" | \
 	grep -Fvf <(zcat scriptaux/lexx.pat.gz) | sort -u | sed -r "s/^_(.+)=$/_\1=\1=/g" > 00_wrd_newdic_nl.list

# gw_m04=$(date +%s.%N); duration=$( echo $gw_m04 - $gw_m03 | bc ) #dbgtime
# LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Метка 04:" $duration "сек" #dbgtime

# Список слов с заглавной буквы НЕ в начале предложения
grep -Po "(?<=[A-Za-zА-Яа-яёЁ0-9,}):;$unxe$unxs])[ ’(«$qtsd–—-]+[$unxe]?[$RUUC][$rulc$unxe]+" $tmpdir/text-book.txt | grep -Ev "[$unxe]" | \
	sed -r "s/^[ ’(«\x22\x27–—-]+(.*)$/_\l\1=/g" | sort -u > $tmpdir/surcap-all.pat

# gw_m05=$(date +%s.%N); duration=$( echo $gw_m05 - $gw_m04 | bc ) #dbgtime
# LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Метка 05:" $duration "сек" #dbgtime

# Фамилия после инициала
grep -Po "\b(?<=[$RUUC][$fkdt.])\s*[$RUUC$unxe][$rulc$unxe]+" $tmpdir/text-book.txt| grep -Ev "[$unxe]" | sed -r "s/^\s*(.*)$/_\l\1=/g" | \
	sort -u >> $tmpdir/surcap-all.pat

# gw_m06=$(date +%s.%N); duration=$( echo $gw_m06 - $gw_m05 | bc ) #dbgtime
# LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Метка 06:" $duration "сек" #dbgtime

# Список всех слов с заглавной буквы, без учёта позиции
sed -r 's/^/ /g' $tmpdir/text-book.txt | grep -Po "(?<![$RUUC$rulc$unxe])[$RUUC$unxe][$rulc$unxe]+" | grep -Ev "[$unxe]" | sed -r "s/^.+$/_\l\0=/g" | \
	sort -u > $tmpdir/anycap-all.pat

# gw_m07=$(date +%s.%N); duration=$( echo $gw_m07 - $gw_m06 | bc ) #dbgtime
# LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Метка 07:" $duration "сек" #dbgtime

# Отсеиваем уже известные имена в базах, а также омографы
grep -Fvf <(zcat scriptaux/names-all.pat.gz) $tmpdir/anycap-all.pat | grep -Fvf <(zcat scriptaux/nomo.pat.gz) > $tmpdir/anycap-raw.pat
grep -Fvf <(zcat scriptaux/names-all.pat.gz) $tmpdir/surcap-all.pat | grep -Fvf <(zcat scriptaux/nomo.pat.gz) > $tmpdir/surcap-raw.pat

# gw_m08=$(date +%s.%N); duration=$( echo $gw_m08 - $gw_m07 | bc ) #dbgtime
# LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Метка 08:" $duration "сек" #dbgtime

# Выделяем из "списка всех" часть со словами в начале предложения и т.п.
grep -Fvf $tmpdir/surcap-raw.pat $tmpdir/anycap-raw.pat > $tmpdir/anycap-may.pat

# gw_m09=$(date +%s.%N); duration=$( echo $gw_m09 - $gw_m08 | bc ) #dbgtime
# LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Метка 09:" $duration "сек" #dbgtime

# Отсеиваем слова из базового словаря scriptdb/wordbase0.gz
#grep -Fvf <(zcat scriptaux/wdb0.gz) $tmpdir/anycap-may.pat > $tmpdir/anycap-lex.pat
#grep -Ff  <(zcat scriptaux/wdb0.gz) $tmpdir/anycap-may.pat > $tmpdir/anycap-bas.pat
#grep -Fvf <(zcat scriptaux/wdb0.gz) $tmpdir/surcap-raw.pat > $tmpdir/surcap-lex.pat
#grep -Ff  <(zcat scriptaux/wdb0.gz) $tmpdir/surcap-raw.pat > $tmpdir/surcap-bas.pat

 awk -vindb="scriptdb/" -vinax="scriptaux/" -vbook=$book -f scriptdb/gw_caplists.awk

# gw_m10=$(date +%s.%N); duration=$( echo $gw_m10 - $gw_m09 | bc ) #dbgtime
# LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Метка 10:" $duration "сек" #dbgtime

# Список неизвестных имён
 grep -Fvf <(zcat scriptaux/lexx.pat.gz) $tmpdir/surcap-lex.pat | sed -r 's/^_(.*=)$/_\1\1g/g' > 01_nom_newsur_nl.list
 grep -Fvf <(zcat scriptaux/lexx.pat.gz) $tmpdir/anycap-lex.pat | sed -r 's/^_(.*=)$/_\1\1g/g' > 02_nom_newany_nl.list

# gw_m11=$(date +%s.%N); duration=$( echo $gw_m11 - $gw_m10 | bc ) #dbgtime
# LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Метка 11:" $duration "сек" #dbgtime

# Делаем списки слов, обработанных словарем lexx blchk 0
if [[ "$2" != "biglist" ]]; then
	
  sedz-dp () { zgrep -Ff <(grep -Fof <(zcat "$1") "$2" | sort -u) scriptaux/tts0.txt.gz | sed -nr 's/^_(.+)\"=\"\s(.+)\"$/s=_\1=_\1\\\=\2=gp/gp'; }
  sedz-si () { zgrep -Ff <(grep -Fof <(zcat "$1") "$2" | sort -u) scriptaux/tts0.txt.gz | sed -nr 's/^_(.+)=(.+)$/s=_\1\\\b=_\1\\\=\2=gp/gp'    ; }

  sedz-dp scriptaux/tts-dq.pat.gz $tmpdir/anycap-bas.pat > $tmpdir/anybas-in-dq.sed
  sedz-si scriptaux/tts-si.pat.gz $tmpdir/anycap-bas.pat > $tmpdir/anybas-in-si.sed
  sedz-dp scriptaux/tts-dq.pat.gz $tmpdir/anycap-lex.pat > $tmpdir/anylex-in-dq.sed
  sedz-si scriptaux/tts-si.pat.gz $tmpdir/anycap-lex.pat > $tmpdir/anylex-in-si.sed
  sedz-dp scriptaux/tts-dq.pat.gz $tmpdir/surcap-bas.pat > $tmpdir/surbas-in-dq.sed
  sedz-si scriptaux/tts-si.pat.gz $tmpdir/surcap-bas.pat > $tmpdir/surbas-in-si.sed
  sedz-dp scriptaux/tts-dq.pat.gz $tmpdir/surcap-lex.pat > $tmpdir/surlex-in-dq.sed
  sedz-si scriptaux/tts-si.pat.gz $tmpdir/surcap-lex.pat > $tmpdir/surlex-in-si.sed

# gw_m12=$(date +%s.%N); duration=$( echo $gw_m12 - $gw_m11 | bc ) #dbgtime
# LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Метка 12:" $duration "сек" #dbgtime

  touch 03_nom_surlex_dq.list 04_nom_surlex_si.list 05_nom_anylex_dq.list 06_nom_anylex_si.list 07_nom_surbas_dq.list 08_nom_surbas_si.list 09_nom_anybas_dq.list 10_nom_anybas_si.list
  inc=50
  sedrnf () { local lico=$(wc -l < "$1"); local i=0; local j=0; for i in $(seq 1 $inc $lico); do j=$(($i+$(($inc-1)))); sed -rnf <(sed -n "$i,$j p" < "$1") "$2"; done; }

  sedrnf $tmpdir/anybas-in-dq.sed $tmpdir/anycap-raw.pat >> 09_nom_anybas_dq.list
  sedrnf $tmpdir/anybas-in-si.sed $tmpdir/anycap-raw.pat >> 10_nom_anybas_si.list
  sedrnf $tmpdir/anylex-in-dq.sed $tmpdir/anycap-lex.pat >> 05_nom_anylex_dq.list
  sedrnf $tmpdir/anylex-in-si.sed $tmpdir/anycap-lex.pat >> 06_nom_anylex_si.list
  sedrnf $tmpdir/surbas-in-dq.sed $tmpdir/surcap-raw.pat >> 07_nom_surbas_dq.list
  sedrnf $tmpdir/surbas-in-si.sed $tmpdir/surcap-raw.pat >> 08_nom_surbas_si.list
  sedrnf $tmpdir/surlex-in-dq.sed $tmpdir/surcap-raw.pat >> 03_nom_surlex_dq.list
  sedrnf $tmpdir/surlex-in-si.sed $tmpdir/surcap-raw.pat >> 04_nom_surlex_si.list

# gw_m13=$(date +%s.%N); duration=$( echo $gw_m13 - $gw_m12 | bc ) #dbgtime
# LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Метка 13:" $duration "сек" #dbgtime

# Генерируем скрипт sed для обработки текста книги wochk 0
if [[ $key != "wonly" ]]; then

# Некоторые выделяют ударения тэгами… по умолчанию выключено: лучше обработать руками
#s=(\w)<emphasis>([$RVUC$rvlc])<\/emphasis>=\1\2\xcc\x81=g
#s=<emphasis>([$RVUC$rvlc])<\/emphasis>(\w)=\1\xcc\x81\2=g
#s=(\w)<strong>([$RVUC$rvlc])<\/strong>=\1\2\xcc\x81=g
#s=<strong>([$RVUC$rvlc])<\/strong>(\w)=\1\xcc\x81\2=g

sed -ri "
         s=(\S)\s+=\1 =g
         s=(<p>)\s+=\1=gI
         s=\s+(<\/p>)=\1=gI
         s=X1Ъ=\xcc\x81=g
         s=X0Ъ=\xcc\xa0=g
         s=X3Ъ=\xcc\xa3=g
         s=X4Ъ=\xcc\xa4=g
         s=X5Ъ=\xcc\xad=g
         s=X6Ъ=\xcc\xb0=g
         s=X8Ъ=\xe2\x80\xa4=g
         s=X7Ъ=\xe2\x80\xa7=g
         s=(\xcc\x81)+=\xcc\x81=g
        " $tmpdir/text-book.txt

# gw_m14=$(date +%s.%N); duration=$( echo $gw_m14 - $gw_m13 | bc ) #dbgtime
# LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Метка 14:" $duration "сек" #dbgtime

gw_pre=$(date +%s.%N); duration=$( echo $gw_pre - $gw_time0 | bc )
LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Предварительная подготовка заняла:" $duration "сек"

# Применяем шаблоны
printf '\e[36m%s\e[0m ' "Расстановка ударений в именах собственных …"

# gw_m15=$(date +%s.%N); duration=$( echo $gw_m15 - $gw_pre | bc ) #dbgtime
# LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Метка 15:" $duration "сек" #dbgtime

awk -v indb="scriptdb/" -v inax="scriptaux/" -f scriptdb/namedef.awk $tmpdir/text-book.txt > $tmpdir/text-book.awk.txt
mv $tmpdir/text-book.awk.txt $tmpdir/text-book.txt

gw_sed=$(date +%s.%N); duration=$( echo $gw_sed - $gw_pre | bc )
LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "выполнена за" $duration "сек"

fi; fi # blchk 1 wochk 1

# Выводим отчет
printf '\e[32m%s \e[33m%s \e[32m%s \e[33m%s \e[32m%s\n' "Отчёты:" "00,01,02" "– новые слова," "03-10" "– слова в lexx:"
printf '\e[33m%s \e[93m%-6s \e[33m%s \e[93m%-6s \e[33m%s \e[93m%-6s \e[32m%s\e[0m\n' "00_WRDs:" $(wc -l < 00_wrd_newdic_nl.list) \
	"01_NOMS:" $(wc -l < 01_nom_newsur_nl.list) "02_NOMA:" $(wc -l < 02_nom_newany_nl.list) "<= Новые слова"
printf '\e[33m%s \e[93m%-6s \e[33m%s \e[93m%-6s \e[33m%s \e[93m%-6s \e[33m%s \e[93m%-6s\e[0m\n' "03_SLdq:" $(wc -l < 03_nom_surlex_dq.list) \
	"04_SLsi:" $(wc -l < 04_nom_surlex_si.list) "07_SBdq:" $(wc -l < 07_nom_surbas_dq.list) "08_SBsi:" $(wc -l < 08_nom_surbas_si.list)
printf '\e[33m%s \e[93m%-6s \e[33m%s \e[93m%-6s \e[33m%s \e[93m%-6s \e[33m%s \e[93m%-6s\e[0m\n' "05_ALdq:" $(wc -l < 05_nom_anylex_dq.list)  \
	"06_ALsi:" $(wc -l < 06_nom_anylex_si.list) "09_ABdq:" $(wc -l < 09_nom_anybas_dq.list) "10_ABsi:" $(wc -l < 10_nom_anybas_si.list)

# Пишем кол-во слов в каждом из номерных файлов в их имя
for i in [01][0-9]_*.list; do nb=$(wc -l < $i); nu=$(echo $i | sed -r "s/^(.+)(\.list)$/\1_"$nb"\2/g" ); mv $i $nu; done

# Возвращаем служебные символы назад, если из-за wonly они еще не восстановлены
if [[ $key = "wonly" ]]; then sed -ri "
	s=X1Ъ=\xcc\x81=g
	s=X0Ъ=\xcc\xa0=g
	s=X3Ъ=\xcc\xa3=g
	s=X4Ъ=\xcc\xa4=g
	s=X5Ъ=\xcc\xad=g
	s=X6Ъ=\xcc\xb0=g
	s=X8Ъ=\xe2\x80\xa4=g
	s=X7Ъ=\xe2\x80\xa7=g
    " $tmpdir/text-book.txt; fi

# --------------------- Блок формирования дискретных скриптов для омографов --------------------------------------
# Создаем папку для "именных" омографов для конкретной книги. Только, если ее еще нет.
if [[ ! -d $bookwrkdir ]]; then
	printf '\e[36m%s \e[33m%s\e[0m\n' "Найденные имена омографы и скрипты для их обработки сохранены в" $bookwrkdir
	mkdir $bookwrkdir
	grep -Ff <(zcat scriptaux/nomo.pat.gz) $tmpdir/anycap-all.pat >  $bookwrkdir/nomo-all.pat
	grep -Ff <(zcat scriptaux/nomo.pat.gz) $tmpdir/surcap-all.pat >> $bookwrkdir/nomo-all.pat
	sort -u -o $bookwrkdir/nomo-all.pat $bookwrkdir/nomo-all.pat

	zgrep -Fif $bookwrkdir/nomo-all.pat <(zcat scriptdb/nomo.txt.gz) | sed -r "
		s/^_(.+)=/\1/g
		s/([АЕЁИОУЫЭЮЯаеёиоуыэюя])\x27/\1\xcc\x81/g
		s/\\\xcc\\\xa0/\xcc\xa0/g
		s/\\\xcc\\\xa3/\xcc\xa3/g
		s/\\\xcc\\\xa4/\xcc\xa4/g
		s/\\\xcc\\\xad/\xcc\xad/g
		s/\\\xcc\\\xb0/\xcc\xb0/g
        " | sort -u > $bookwrkdir/omo-luc.lst
	rm $bookwrkdir/nomo-all.pat
fi
# Создать дискретные скрипты обработки омографов в nomo-$book
# Дискретные скрипты запускаются из директории nomo-$book по отдельности каждый.
# ВНИМАНИЕ: для этой операции необходимо иметь навыки работы в редакторе vim !!!
# Работает только при установленном плагине vim PatternsOnText (https://github.com/inkarkat/vim-PatternsOnText)

if [[ -s $bookwrkdir/omo-luc.lst ]]; then # Проверка найдены ли имена-омографы для ручной обработки. maomchk 0 

# Формируем дискретные скрипты пословно
printf '\e[32m%s\n' "Создание дискретных скриптов обработки имён-омографов:"
twd=$(tput cols)

zgrep -Ff <(grep -Fof <(zcat scriptaux/ttspat.$suf.gz) <(sed -r 's/^([^ ]+) .*/_\l\1=/g' $bookwrkdir/omo-luc.lst | sort -u)) scriptaux/tts0.$suf.gz |\
       	sed -r 's/_([^"=]+)(\"=\"\s.+\")$/\1#\" \1\2/' | sed -r 's/_([^=]+)(=.+)$/\1=#\1\2/'| sed "s/\x27/\xcc\x81/" > $bookwrkdir/omo-lexx.txt

sed -r "s/\xe2\x80\xa4/./g; s/\xe2\x80\xa7//g" $tmpdir/text-book.txt | \
    awk -vobook=$obook -vtwd=$twd -vpreview=$preview -vtermcor=$termcor -veditor=$edi -vindb="scriptdb/" -vbkwrkdir="$bookwrkdir/" -f scriptdb/preview.awk

printf '\e[36m%s \e[93m%s \e[36m%s\e[0m\n' "Найдено имён-омографов         :" $(ls -l $bookwrkdir/*.sh | wc -l) "шт."

	chmod +x $bookwrkdir/*.sh

else # Если не нашли имён-омографов для ручной обработки maomchk 1
	printf '\e[36m%s\e[0m\n' "Омографов для ручной обработки не найдено."
	rm -rf $bookwrkdir
fi # maomchk 2


# Возвращаем графику назад
cat $tmpdir/text-book.txt $tmpdir/binary-book.txt > "$book"

# Удаляем временные файлы
 rm -rf $tmpdir

gw_proc=$(date +%s.%N); duration=$( echo $gw_proc - $gw_sed | bc ); tot_dur=$( echo $gw_proc - $gw_time0 | bc )

LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Создание дискретных скриптов   :" $duration "сек"
LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Общее время работы скрипта имён:" $tot_dur "сек"
printf '\e[32;4;1m%s\e[0m \e[32m%s \e[33m%s \e[32m%s \e[36m%s \e[33m%s\e[0m\n' "\"Имена:\"" "Обработка книги" "$book" "завершена." "Бэкап:" "$backup"


# -------------------------- Блок локального словаря ----------------------------------------
# Блок создания локального словаря. Работает только при сообщении скрипту ключа -ld. Например:
# ./get-words.sh -ld book.fb2, ключ -old выполнит ТОЛЬКО эту операцию
fi # oldchk 1
if [[ $key = "-ld" ]] || [[ $key = "-old" ]] ; then
# Подготовка текста книги к обработке
	printf '\e[32m%s \e[93m%s\e[0m\n' "Создание частного словаря для файла книги:" "$book"
	dos2unix "$book" &>/dev/null
	if [[ -d $tmpdir ]]; then rm -rf $tmpdir && mkdir $tmpdir
	else mkdir $tmpdir; fi

	sed '/<binary/Q' "$book" | sed -r 's/\xc2\xa0/ /g' > $tmpdir/text-book.txt
#	sed -n '/<binary/,$p' "$book" > $tmpdir/binary-book.txt

# Создание списка обрабатываемых шаблонов: " слово"=" сло'во" и слово=сло'во, шаблоны других типов могут добавляться без обработки
	sed -nr 's/^(\" )([^ "]+)(\"=.+)$/_\2 #\1\2\3/gp' tts.txt > $tmpdir/q_wq.txt
	sed -nr 's/^([^"=]+)(=.+)$/_\1= #\1\2/gp'         tts.txt > $tmpdir/w.txt

# Создаем список слов в книге
	grep -Po "(?<=[^$RUUC$rulc])[$RUUC$rulc]+" $tmpdir/text-book.txt | sed -r 's/^.+$/_\L\0=/g' | sort -u > $tmpdir/book-words.txt
	printf '\e[36m%s \e[93m%s \e[36m%s \e[93m%s \e[36%s\e[0m\n' "Книга" "$book" "содержит" $(wc -l < $tmpdir/book-words.txt) "словоформ."
# Находим сработавшие шаблоны
	grep -Fof <(zcat scriptaux/tts.pat.gz) $tmpdir/book-words.txt > $tmpdir/book-words-o.pat

# Формируем локальный словарь lexx, 2 типа шаблонов на основе списка слов из книги
	grep -Ff $tmpdir/book-words-o.pat $tmpdir/q_wq.txt | sed -r 's/_.+#//g' >  $tmpdir/booklexx.txt
	grep -Ff $tmpdir/book-words-o.pat $tmpdir/w.txt    | sed -r 's/_.+#//g' >> $tmpdir/booklexx.txt
	printf '\e[36m%s \e[93m%s \e[36m%s\e[0m\n' "Найдено сработавших шаблонов" $(wc -l < $tmpdir/booklexx.txt) "Добавляем опциональные шаблоны."	


# Добавляем необрабатываемые секции "полного" словаря. ЛИШНИЕ МОЖНО ЗАКОММЕНТИРОВАТЬ!!!
	grep "regex"               tts.txt >> $tmpdir/booklexx.txt		# Секция regex
	grep -P '\^"[^ ]+\"='      tts.txt >> $tmpdir/booklexx.txt		# Секция "слово"="сло'во"
	grep -P '^\" .+ \"='       tts.txt >> $tmpdir/booklexx.txt		# " два слова "=" два сло'ва "
	grep -P '^\"[^ ].+ \"='    tts.txt >> $tmpdir/booklexx.txt		# "два слова "="два сло'ва "
	grep -P '^\" .+ .+[^ ]\"=' tts.txt >> $tmpdir/booklexx.txt		# " два слова"=" два сло'ва"
	grep -P '^\"[^ ]+ "='      tts.txt >> $tmpdir/booklexx.txt		# "слово "="сло'во "
	grep -P '^\" [^ ]+\-"='    tts.txt >> $tmpdir/booklexx.txt		# " слово-"=" сло'во "
	grep -P '^\"\-[^ ]+\"='    tts.txt >> $tmpdir/booklexx.txt		# "-слово"=" сло'во"

# Сортируем и преобразуем словарь в lexx
	sed -r "s/([$rvlc])\x27/\1\xcc\x81/g" $tmpdir/booklexx.txt | sort -u > "$book".lexx

	printf '\e[36m%s \e[93m%s \e[36m%s \e[93m%s \e[36m%s \e[93m%s \e[36m%s\e[0m\n' \
		"Для книги" "$book" "сформирован локальный словарь" "$book".lexx ", который содержит" $(wc -l < "$book".lexx) "строк."
# Создание скрипта для простановки ударений во всех словах текста. Используется для скрипта ./all-in-one.sh с ключами --alna и --alin
	sed -r "
	s='=ЪЪЪ=g
	s/^([^\" ]+)=([^\" ]+)$/\\\b\1\\\b=\2/g
	s/^\"\s([^ ]*)\-\"=\"\s([^ ]*)\s\"$/\\\b\1\\\b\\\-=\2 /g
	s/^\"\-([^ ]*)\"=\"\s([^ ]*)\"$/\\\-\\\b\1= \2/g
	s/^\"\s([^ ]+)\"=\"\s([^ ]+)\"$/\\\b\1=\2/g
	s/^\"\s(.*)\s\"=\"\s(.*)\s\"$/\\\b\1\\\b=\2/g
	s/^\"([^ ].*)\s\"=\"([^ ].*)\s\"$/\1\\\b=\2/g
	s/^\"\s(.*[^ ])\"=\"\s(.*[^ ])\"$/\\\b\1=\2/g
	s/^\"([^\"]+)\"=\"([^\"]+)\"$/\1=\2/g
	s/^\"([^ ]*)\s\"=\"([^ ]*)\s\"$/\1\\\b=\2/g
	s/^/s=/g
	s/$/=gI/g
    " $tmpdir/booklexx.txt | sort -u > $tmpdir/booksed-main.txt

	echo "s=\xcc\x81=ЪЪЪ=g" | cat - $tmpdir/booksed-main.txt > "$book".sed
	echo "s=ЪЪЪ=\xcc\x81=g" >> "$book".sed
	
	printf '\e[32;4;1m%s\e[0m \e[32m%s \e[93m%s \e[32m%s \e[93m%s \e[36m%s\e[0m\n' \
		"\"Имена:\"" "Для книги" "$book" "сформирован служебный скрипт" "$book.sed" "простановки ударений во всех известных словах книги."

	rm -rf $tmpdir/
fi

