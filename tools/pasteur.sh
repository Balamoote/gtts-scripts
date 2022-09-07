#!/bin/bash
# Скрипт для ручной пастеризации файлов. Отдельно исходная книга, отдельная обработанная

key=$1
nocaps=0

if [[ $key == "-i" ]] || [[ $key == "-o" ]]; then
	if [[ -s "$2" ]]; then book=$2; printf '\e[36m%s \e[33m%s\e[0m\n' "Обрабатывается книга:" $book
	else printf '\e[35m%s\e[0m\n' "Книга не задана или не существует. Использование:"; fi
else  printf '\e[35m%s\e[0m\n' "Возможные ключи: -i -o"; fi

case $key in
	-i)
		dos2unix "$book" &>/dev/null
		sed -r 's=\.\.\.=…=g
		s=\xc2\xa0= =g
		s=(\S)\s+=\1 =g
		s=(<p>)\s+=\1=gI
		s=\s+(<\/p>)=\1=gI
		s=ё=е=gI
		s=\xcc\x81+==g' "$book" > "$book".0
		printf '\e[36m%s \e[33m%s\e[0m\n' "Пастеризованный исходный файл:" $book.0
		if [[ $nocaps -eq 1 ]]; then sed -ri 's=^.*$=\L\0=g' $book.0; fi
	;;
	-o)
		dos2unix "$book" &>/dev/null
		sed -r 's=ё=е=g
		s=\xc2\xa0= =g
		s=\xe2\x80\xa4=.=g
		s=\xe2\x80\xa7==g
		s=\xcc\xa0==g
		s=\xcc\xa3==g
		s=\xcc\xa4==g
		s=\xcc\xad==g
		s=\xcc\xb0==g
		s=\xcc\x81+==g
		s=\t+= =g' "$book" > "$book".1
		printf '\e[36m%s \e[33m%s\e[0m\n' "Пастеризованный обработанный файл:" $book.1
		if [[ $nocaps -eq 1 ]]; then sed -ri 's=^.*$=\L\0=g' $book.1; fi
	;;
esac

exit 0


