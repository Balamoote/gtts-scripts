#!/bin/bash
# Скрипт обработки омографов в книге. Включает скрипты:
# - все --> всё (включается переменной vsevso)
# - обработка чисел (включается переменной chisla)
# - массовая обработка известных омографов (включается переменной omoall).
# Последняя версия файла тут: https://github.com/Balamoote/gtts-scripts 

# Требования: bash, grep, sed, awk, dos2unix, файл книги в кодировке UTF-8
# Запуск: ./omofix.sh book.fb2 или bash omofix.sh book.fb2 или через ./all-in-one.sh
# ВНИМАНИЕ: рекомендуется запускать ПОСЛЕ запуска скрипта ./get-words.sh (очень желательно, но не обязательно)

#set -e
export LC_COLLATE=C

vsevso=1  # Включить ёфикацию пары "все <-> всё". Если не равен 1, то будет выключен.
chisla=0  # Включить скрипт 11-nim.sed - обработку числительных. Если не равен 1, то будет выключен.
omoall=1  # Включить скрипт 20-index.sed - обработку омографов. Если не равен 1, то будет выключен.
suf=omo

debug=0   # Если 1, то сделать отладку скриптов омографов: поиск искажений текста в "пастеризованных" версиях исходника и результата 
nocaps=0  # Если 1, то капсы в "пастеризованых" будут убраны
inc=50	  # Количество строк для для обработки файла за один проход для скриптов sed

sedroll () { local lico=$(wc -l < "$1"); local i=0; local j=0; for i in $(seq 1 $inc $lico); do j=$(($i+$(($inc-1)))); sed -i -rf <(sed -n "$i,$j p" < "$1") "$2"; done; }

if [[ $vsevso -ne 1 && $chisla -ne 1 && $omoall -ne 1 ]]; then
printf '\e[35m%s\e[0m\n' "Все скрипты выключены, работают только скрипты 00 и 99. Установите переменные!"; fi

if [ -z "$1" ]; then
printf '\e[35m%s \e[93m%s \e[35m%s \e[93m%s\e[0m\n' "Не задан файл книги! Запуск:" "./omo_fix book.fb2" "или" "bash omo_fix book.fb2"; exit 0; fi

start_time=$(date +%s.%N)
book="$1"
backup="$book".$suf
if [[ -d oft-"$book" ]]; then rm -rf oft-"$book"/ && mkdir oft-"$book"
else mkdir oft-"$book"; fi

printf '\e[32;4;1m%s\e[0m \e[33m%s \e[33m%s\e[0m\n' "\"Омографы…\"" "Обработка книги:" "$book"

printf '\e[36;1m%s\e[0m\n' "Используемые скрипты:"
if [[ vsevso -eq 1 ]]; then
	printf '\e[36m%s \e[32m%s \e[32m%s\e[0m\n' "Скрипты все --> всё" "vsevso=1" ": ДА"
	else printf '\e[36m%s \e[35m%s \e[35m%s\e[0m\n' "Скрипты все --> всё" "vsevso≠1 :" "НЕТ"; fi
if [[ chisla -eq 1 ]]; then
	printf '\e[36m%s \e[32m%s \e[33m%s \e[32m%s\e[0m\n' "Скрипт обработки чисел" "chisla=1" "11-num.sed:" "ДА"
	else printf '\e[36m%s \e[35m%s \e[33m%s \e[35m%s\e[0m\n' "Скрипт обработки чисел" "chisla≠1" "11-num.sed:" "НЕТ"; fi
if [[ omoall -eq 1 ]]; then
	printf '\e[36m%s \e[32m%s \e[33m%s \e[32m%s\e[0m\n' "Скрипт массовой обработки омографов" "omoall=1" "20-index.sed:" "ДА"
	else printf '\e[36m%s \e[35m%s \e[33m%s \e[35m%s\e[0m\n' "Скрипт массовой обработки омографов" "omoall≠1" "20-index.sed:" "НЕТ"; fi

[[ -e "$book".nam && ! -e "$backup" && -e "$book" ]] && bks=n1o0
[[ -e "$book".nam && -e "$backup" ]] && bks=n1o1
[[ ! -e "$book".nam && -e "$backup" ]] && bks=n0o1
[[ ! -e "$book".nam && ! -e "$backup" && -e "$book" ]] && bks=n0o0
[[ ! -e "$book" && -e "$book".nam ]] && bks=n100

case $bks in
	n1o0)	printf '\e[36m%s\e[0m\n' "Используется файл с ударениями в именах!"
		cp "$book" "$backup"; printf '\e[36m%s \e[33m%s\e[0m\n' "Файл с ударениями в именах сохранён в БЭКАП-файл:" "$backup" ;;
	n1o1)	printf '\e[36m%s \e[33m%s\e[0m\n' "Найден и восстановлен бэкап:" "$backup"
		cp "$backup" "$book" ;;
	n0o1)	printf '\e[36m%s \e[93m%s \e[36m%s \e[33m%s\e[0m\n' "Скприт" "./get-words.sh" "не запускался! Найден и восстановлен бэкап:" "$backup"
		cp "$backup" "$book" ;;
	n0o0)	printf '\e[36m%s \e[93m%s \e[36m%s \e[33m%s\e[0m\n' "Скприт" "./get-words.sh" "не запускался! Файл книги сохранён в бэкап:" "$backup"
		cp "$book" "$backup" ;;
	n100)	printf '\e[36m%s \e[33m%s\e[0m\n' "Файл книги не найден, найден и восстановлен первичный бэкап:" "$backup"
		cp "$backup" "$book" ;;
	*)	printf '\e[35m%s \e[33m%s \e[35m%s \e[33m%s \e[35m%s\e[0m\n' "Не найдены ни файл книги," "$book" "ни ее первичный бэкап" "$backup" "!!!"; exit 0 ;;
esac

# Закомментировано, т.к. скорее всего уже было в ./get-words.sh
#dos2unix "$book" &>/dev/null

if [[ $(grep -o "<body" "$book"| sort -u) == "<body" ]]; then
	printf '\e[36m%s \e[93m%s \e[36m%s \e[93m%s\e[0m\n' "Книга содержит тэг" "<body>" "Предполагаем формат" "fb2"
	sed '/<body/Q' "$book" | sed -r 's/\xc2\xa0/ /g; s=(\S)\s+=\1 =gI' > oft-"$book"/head-book.txt
	sed -n '/<body/,/<binary/{/<binary/!p}' "$book" | sed -r 's/\xc2\xa0/ /g; s=(\S)\s+=\1 =gI' > oft-"$book"/text-book.txt
	touch oft-"$book"/binary-book.txt
	sed -n '/<binary/,$p' "$book" > oft-"$book"/binary-book.txt
else
	printf '\e[36m%s \e[93m%s \e[36m%s \e[93m%s \e[36m%s\e[0m\n' "В книге нет тэга" "<body>" "Предполагаем" "plain text" "файл."
	touch oft-"$book"/head-book.txt
       	cp "$book" oft-"$book"/text-book.txt
	touch oft-"$book"/binary-book.txt
fi

maxline=$(wc -l < oft-"$book"/text-book.txt)
printf '\e[36m%s \e[93m%s \e[36m%s\e[0m\n' "Количество строк в книге:" $maxline "(без графики)"

# генерируем список омографов для книги из словаря 20-index.sed
if [[ omoall -eq 1 ]]; then

rexsed="scriptomo/20-index.sed"

awk -v tmpdir=oft-"$book" -v rexfile=$rexsed -f scriptdb/omopick.awk oft-"$book"/text-book.txt >/dev/null 2>&1

omon=$(grep "### " < oft-"$book"/book-index.sed | wc -l)
printf '\e[36m%s \e[93m%s\e[0m\n' "Омографов в книге:" $omon
fi

sed -i -rf scriptomo/00-on.sed oft-"$book"/text-book.txt

pre_time=$(date +%s.%N); duration=$( echo $pre_time - $start_time | bc )
LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Предварительная подготовка заняла:" $duration "сек"

printf '\e[36m%s\e[0m\n' "Работа скриптов. Подождите..."

if [[ chisla -eq 1 ]]; then
	num_time0=$(date +%s.%N);

	sedroll scriptomo/11-num.sed oft-"$book"/text-book.txt

	num11_time=$(date +%s.%N); duration=$( echo $num11_time - $nume_time0 | bc )
	LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[33m%s \e[32m%s \e[93m%.2f \e[36m%s\e[0m\n' "Скрипт Числа:" "11-num.sed" "ОК:" $duration "сек"
fi

if [[ vsevso -eq 1 ]]; then
	yo_time0=$(date +%s.%N);

	sedroll scriptomo/01-yo.sed oft-"$book"/text-book.txt

	yo1_time=$(date +%s.%N); duration=$( echo $yo1_time - $yo_time0 | bc )
	LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[33m%s \e[32m%s \e[93m%.2f \e[36m%s\e[0m\n' "все --> всё:" "01-yo.sed" "ОК:" $duration "сек"

	sedroll scriptomo/41-1_eo-ast.sed oft-"$book"/text-book.txt

	yo411_time=$(date +%s.%N); duration=$( echo $yo411_time - $yo1_time | bc )
	LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[33m%s \e[32m%s \e[93m%.2f \e[36m%s\e[0m\n' "все --> всё:" "41-1_eo-ast.sed" "ОК:" $duration "сек"
fi


# Работа с основным словарём омографов.
if [[ omoall -eq 1 ]]; then
	printf '\e[32m%s\e[0m\n' "Омографы. Обработка основным скриптом."
	omo20_time0=$(date +%s.%N)

	sedroll oft-"$book"/book-index.sed oft-"$book"/text-book.txt

    whole20_time=$(date +%s.%N); duration=$( echo $whole20_time - $omo20_time0 | bc )
	LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[32m%s \e[93m%.2f \e[36m%s\e[0m\n' "Обработка омографов." "OK:" $duration "сек"
fi

sed -i -rf scriptomo/99-fin.sed oft-"$book"/text-book.txt

cat oft-"$book"/head-book.txt oft-"$book"/text-book.txt oft-"$book"/binary-book.txt > "$book"

rm -rf oft-"$book"

# Отладка: поиск искажений текста в пастеризованных версиях исходника и результата
if [[ debug -eq 1 ]]; then
	sed -r '
		s=\.\.\.=…=g
		s=\xc2\xa0= =g
		s=(\S)\s+=\1 =g
		s=(<p>)\s+=\1=gI
		s=\s+(<\/p>)=\1=gI
		s=\xe2\x80\xa4=.=g
		s=\xe2\x80\xa7==g
		s=\xcc\xa0==g
		s=\xcc\xa3==g
		s=\xcc\xa4==g
		s=\xcc\xad==g
		s=\xcc\xb0==g
		s=\xcc\x81+==g
		s=Ё=Е=g
		s=ё=е=g
		' "$book".$suf > "$book".0
		if [[ $nocaps -eq 1 ]]; then sed -ri 's=^.*$=\L\0=g' "$book".0; fi

	sed -r '
		s=\xe2\x80\xa4=.=g
		s=\xe2\x80\xa7==g
		s=\xcc\xa0==g
		s=\xcc\xa3==g
		s=\xcc\xa4==g
		s=\xcc\xad==g
		s=\xcc\xb0==g
		s=\xcc\x81+==g
		s=Ё=Е=g
		s=ё=е=g
		s=\t+= =g
		' "$book" > "$book".1
		if [[ $nocaps -eq 1 ]]; then sed -ri 's=^.*$=\L\0=g' "$book".1; fi

	diff "$book".0 "$book".1 > "$book".diff


	if [[ -s "$book".diff ]]; then 	vim -d "$book".0 "$book".1;
	else rm "$book".0 "$book".1 "$book".diff ; printf '\e[32;1m%s\e[0m \e[32m%s\e[0m\n' "DEBUG:" "пастеризованные файлы идентичны."; fi
fi

end_time=$(date +%s.%N)

duration=$( echo $end_time - $start_time | bc )

LC_ALL="en_US.UTF-8" printf '\e[32;1m%s\e[0m \e[32m%s \e[93m%.2f \e[32m%s\e[0m\n' "\"Омографы…\"" "Общее время обработки:" $duration "сек. ОБРАБОТКА ЗАВЕРШЕНА!"
printf '\e[35m%s \e[93m%s\e[0m\n' "Готовая книга в файле:" "$book"

