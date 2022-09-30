#!/bin/bash
# Скрипт ручно обработки текста
# Создает в директории mano-$book дискретные скрипты для обработки каждого из найденных омографов.
# Можно использовать вместо omofix или совместно с ним.
# Последняя версия файла тут: https://github.com/Balamoote/gtts-scripts
# Ручная обрабока омографов через дискретные скрипты работает только с установленным плагинами vim:
# 1) vim-ingo-library, брать тут https://github.com/inkarkat/vim-ingo-library
# 2) vim-PatternsOnText, брать тут https://github.com/inkarkat/vim-PatternsOnText
#set -e
# Ключи запуска: -f, -x, -p или их комбинация. Например: ./momo.sh -xp book.fb2 или ./momo.fb2 book.fb2
export LC_COLLATE=C
mo_time0=$(date +%s.%N);
key="$1"
book="$2"
suf=man
backup="$book".$suf
debug=1   # Если 1, то сделать отладку скриптов омографов: поиск искажений текста в "пастеризованных" версиях исходника и результата 
nocaps=0  # Если 1, то капсов в "пастеризованых" не будет

# Установка редактора: vim или neovim
edi=$(sed -rn 's/^editor\s*=\s*(vim|nvim)$/\1/ p' scriptdb/settings.ini)

# Установка корректировки ширины вывода превью в дискретных скриптах
termcor=$(sed -rn 's/^termcorrection\s*=\s*([-0-9]*)$/\1/ p' scriptdb/settings.ini)

# Переменные алфавита и служебных
RUUC=АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ
rulc=абвгдеёжзийклмнопрстуфхцчшщъыьэюя
RVUC=АЕЁИОУЫЭЮЯ
rvlc=аеёиоуыэюя
unxc=$(printf "\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0")
unxs=$(printf "\xe2\x80\xa4\xe2\x80\xa7")
inc=50	  # Количество строк для для обработки файла за один проход для скриптов sed

d2u () { if [[ -e "$backup" ]]; then printf '\e[36m%s \e[33m%s\e[0m\n' "Найден и восстановлен бэкап:" "$backup"; crlf=$(file $backup | grep -o "CRLF"; );
            if [[ -n $crlf ]]; then dos2unix "$backup" &>/dev/null; fi; cp "$backup" "$book";
        else crlf=$(file "$book" | grep -o "CRLF"); if [[ -n $crlf ]]; then dos2unix "$book" &>/dev/null; fi; cp "$book" "$backup"; fi; }
sedroll () { local lico=$(wc -l < "$1"); local i=0; local j=0; for i in $(seq 1 $inc $lico); do j=$(($i+$(($inc-1))));	sed -i -rf <(sed -n "$i,$j p" < "$1") "$2"; done; }

printf '\e[32m%s \e[32;4;1m%s\e[0m\n' "Скрипт" "\"Ручные омографы\""

if [[ -s "$1" ]]; then book=$1; backup="$book".$suf; key="-xp"; printf '\e[33m%s \e[93m%s\e[0m\n' "Ключи не заданы, но книга указана. Используем ключ:" "-xp"
elif [[ -s "$2" ]]; then printf '\e[36m%s \e[33m%s\e[0m\n' "Обрабатывается книга:" "$book"
else printf '\e[35m%s \e[93m%s\e[0m\n' "Книга не задана или не существует. Использование:" "./momo.sh [ключ] book.fb2"; exit 1; fi

# Дискретные скрипты пишутся в файл, который задан переменной obook
# Эта переменная имеет смысл ТОЛЬКО, если заново содаются скрипты в mano-$book, т.е. перед запуском скрипта её нужно удалить вручную. Если нужно.
obook="$book" # ё-омографы пишутся в $book, т.е. в основной файл книги
#obook="$book".man # ё-омографы пишутся в $book.man, т.е. в бэкап скрипта ./momo.sh
#obook="$book".yoy # ё-омографы пишутся в $book.yoy, т.е. в бэкап скрипта ./yofik.sh
#obook="$book".nam # ё-омографы пишутся в $book.nam, т.е. в бэкап скрипта ./get-words.sh.

case $key in 
	-f) # удалить директорию mano-book
		if [[ -d "mano-$book" ]]; then rm -rf "mano-$book"; printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директория" "mano-$book" "удалена."; exit 1
		else printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директории" mano-"$book" "не существует. Используйте другой ключ."; exit 1; fi ;;
	-x) # Однозначние омографы+дискретные скрипты; существующую директорию mano- не удалять
		fixomo=1; preview=0; printf '\e[36m%s\e[0m\n' "Однозначные омографы и дискретные скрипты." ;;
	-p) # Превью текста и дискретные скрипты; существующую директорию mano- не удалять
		fixomo=0; preview=1; printf '\e[36m%s\e[0m\n' "Превью текста и дискретные скрипты." ;;
	-px | -xp | -g) # Однозначные омографы, превью и дискретные скрипты; существующую директорию mano- не удалять
		fixomo=1; preview=1; printf '\e[36m%s\e[0m\n' "Однозначные омографы, превью и дискретные скрипты." ;;
	-fpx | -fxp | -fg | -gg ) # Однозначные омографы, превью и дискретные скрипты; существующую директорию mano- удалить
		fixomo=1; preview=1; if [[ -d "mano-$book" ]]; then rm -rf mano-"$book"; printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директория" "mano-$book" "удалена."; fi ;;
	-xf | -fx) # Превью текста и дискретные скрипты; существующую директорию mano- удалить
		fixomo=1; preview=0; if [[ -d "mano-$book" ]]; then rm -rf mano-"$book"; printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директория" "mano-$book" "удалена."; fi ;;
	-fp | -pf) # Однозначные омографы Не делать, дискретные скрипты; существующую директорию mano- удалить
		fixomo=0; preview=1; if [[ -d "mano-$book" ]]; then rm -rf mano-"$book"; printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директория" "mano-$book" "удалена."; fi ;;
	*) # Нечто другое
		printf '\e[32m%s \e[93m%s \e[32m%s \e[93m%s\e[0m\n' "Задайте ключ или книгу. Например:" "./momo.sh -xp book.fb2" "или" "./momo.fb2 book.fb2"; exit 0 ;;
esac

if [[ ! -d mano-"$book" ]]; then mkdir mano-"$book"
else printf '\e[35m%s \e[93m%s \e[35m%s \e[93m%s\e[0m\n' "Директория для дискретных скриптов" "mano-$book" "существует. Удалите ее или запустите скрипт с ключом" "-f"; exit 1; fi

printf '\e[36m%s \e[93m%s\e[36m%s \e[93m%s\e[0m ' "В словаре Омографов:" $(zgrep -c ^ scriptdb/mano-uc0.txt.gz) ", омографов:" $(zgrep -c ^ scriptdb/mano-lc0.txt.gz)
if [[ ! -d scriptaux ]]; then mkdir scriptaux; fi
#if [[ -s zaomo.md5 ]] && [[ -z $(grep "momo.sh" zaomo.md5) ]]; then clxx=1; fi
if [[ -s zaomo.md5 ]] && md5sum -c --status zaomo.md5 >/dev/null 2>&1; then
	printf '\e[36m%s \e[33m%-8s \e[32m%s\e[0m\n' "Файлы" zndb.md5 "OK!";
else printf '\n'; clxx=1; fi

if [[ $clxx -eq "1" ]]; then
	if ./check-lexx.sh -fm; then printf '\e[32m%s\e[0m\n' "Проверка файлов завершена успешно…";
	else printf '\e[1;31m%s \e[93m%s \e[1;31m%s\e[0m\n' "Выполнение скрипта" "./momo.sh" "прервано! Исправьте ошибки в базах и повторите действие!"; exit 1; fi; fi

# Массив со списком обязательных файлов
pack="momo.sh tts.txt scriptdb/mano-uc0.txt.gz scriptaux/mano-uc.pat.gz scriptdb/mano-lc0.txt.gz scriptaux/mano-lc.pat.gz scriptaux/ttspat.man.gz scriptaux/tts0.man.gz scriptdb/omo-index.sed scriptdb/vse.sed"
read -a minpack <<< $pack

# Проверка не потерялось ли чего
for f in "${minpack[@]}"; do
	if [[ ! -s $f ]]; then
	if [[ -e zaomo.md5 ]]; then rm zaomo.md5; fi
	printf '\e[1;31;5m%s \e[0;93m%s \e[1;31;5m%s\e[0m\n' "Отсутствует файл:" $f "Запустите еще раз или найдите потерянный файл."; exit 1; fi; done

d2u;

# Конвертация в UTF-8, если нужно
#$edi -c "set nobomb | set fenc=utf8 | x" "$book"

sed "/<binary/Q" "$book" | sed -r "s/\xc2\xa0/ /g" > mano-"$book"/text-book.txt
sed -n '/<binary/,$p' "$book" > mano-"$book"/binary-book.txt

# Замены однозначных
mo_uni=$(date +%s.%N); duration=$( echo $mo_uni - $mo_time0 | bc )
if [[ $fixomo == "1" ]]; then

rexsed="scriptdb/omo-index.sed"

awk -v tmpdir=mano-"$book" -v rexfile=$rexsed -f scriptdb/omopick.awk mano-"$book"/text-book.txt >/dev/null 2>&1

# При подсчете блоков омографов вычитаем стационарные блоки шаблонов
statblock=4
locomo=$(( $( grep -c "###" mano-"$book"/book-index.sed ) - $statblock ))
printf '\e[36m%s \e[93m%s %s%s%s\e[0m … ' "Омографов для автообработки:" $locomo "(" $statblock ")"

sedroll mano-"$book"/book-index.sed mano-"$book"/text-book.txt

mo_uni1=$(date +%s.%N); duration=$( echo $mo_uni1 - $mo_uni | bc )
LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "обработано за" $duration "сек"

# Проверить наличие необработанных "все" и подключить vse в полном объёме
yop=$(grep -io "[^$unxc]\bвсе\b[^$unxc]" mano-"$book"/text-book.txt| wc -l)
if [[ ! $yop -eq 0 ]]; then
	printf '\e[36m%s \e[93m%s \e[36m%s\e[0m … ' "Все (" $yop ") ==> Все́/Всё"
	sed -r '/##START_END##/q' scriptdb/omo-index.sed > "mano-"$book"/vsex.sed"
	cat scriptdb/vse.sed >> mano-"$book"/vsex.sed
	sed -rn '/###\sTHE_x_END\s!_#_!/,/#::end::/p' scriptdb/omo-index.sed >> mano-"$book"/vsex.sed
	
	sedroll mano-"$book"/vsex.sed mano-"$book"/text-book.txt

yop=$(grep -io "[^$unxc]\bвсе\b[^$unxc]" mano-"$book"/text-book.txt| wc -l)
mo_uni2=$(date +%s.%N); duration=$( echo $mo_uni2 - $mo_uni1 | bc )
LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s \e[93m%s\e[0m\n' "обработано за" $duration "сек. Остаток:" $yop
fi

fi

# Списки слов всех омографов с маленькой и с Большой буквы

grep -Po "(?<=[^$RUUC$rulc$unxc])[$rulc$unxc]+" mano-"$book"/text-book.txt | grep -Ev "[$unxc]" | sed -r 's/^.+$/_\0=/g' | grep -Ff <(zcat scriptaux/mano-lc.pat.gz) | \
	sort -u > mano-"$book"/manofi-lc.pat

grep -Po "(?<=[^$RUUC$rulc$unxc])[$RUUC$unxc][$rulc$unxc]+" mano-"$book"/text-book.txt | grep -Ev "[$unxc]" | sed -r 's/^.+$/_\0=/g' | grep -Ff <(zcat scriptaux/mano-uc.pat.gz) | \
	sort -u > mano-"$book"/manofi-uc.pat

# Список всех омографов в обоих регистрах
zgrep -Ff mano-"$book"/manofi-uc.pat scriptdb/mano-uc0.txt.gz > mano-"$book"/mano-luc.txt
zgrep -Ff mano-"$book"/manofi-lc.pat scriptdb/mano-lc0.txt.gz >> mano-"$book"/mano-luc.txt

cd mano-"$book"/
if [[ -s mano-luc.txt ]]; then # Проверяем найдено ли хоть что-то… discretchk 0
sed -r "s/^_(.+)=/\1/g
	s/\x27/\xcc\x81/g
	s/\\\xcc\\\xa0/\xcc\xa0/g
	s/\\\xcc\\\xa3/\xcc\xa3/g
	s/\\\xcc\\\xa4/\xcc\xa4/g
	s/\\\xcc\\\xad/\xcc\xad/g
	s/\\\xcc\\\xb0/\xcc\xb0/g" mano-luc.txt > omo-luc.lst


mo_pre=$(date +%s.%N); duration=$( echo $mo_pre - $mo_time0 | bc )
LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Всего предварительная подготовка:" $duration "сек"

# Формируем дискретные скрипты пословно
printf '\e[32m%s ' "Идет поиск омографов … подождите."
if [[ $preview -eq 1 ]]; then printf '\e[32m%s\n' "Превью текста включено."
else printf '\e[36m%s\n' "Превью текста выключено."; fi
twd=$(tput cols)

zgrep -Ff <(grep -Fof <(zcat ../scriptaux/ttspat.$suf.gz) <(sed -r 's/^([^ ]+) .*/_\l\1=/g' omo-luc.lst | sort -u)) ../scriptaux/tts0.$suf.gz |\
       	sed -r 's/_([^"=]+)(\"=\"\s.+\")$/\1#\" \1\2/' | sed -r 's/_([^=]+)(=.+)$/\1=#\1\2/'| sed "s/\x27/\xcc\x81/" > omo-lexx.txt

sed -r "s/\xe2\x80\xa4/./g; s/\xe2\x80\xa7//g" text-book.txt | \
    awk -v obook=$obook -v twd=$twd -v preview=$preview -v termcor=$termcor -v editor=$edi -f ../scriptdb/preview.awk

printf '\e[36m%s \e[093m%s\e[36m%s\e[0m ' "Создано дискретных скриптов:" $(ls -l *.sh | wc -l)

mo_disc=$(date +%s.%N); duration=$( echo $mo_disc - $mo_pre | bc )
LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Создание дискретных скриптов:" $duration "сек"

chmod +x *.sh
# Собираем книгу и удаляем временные файлы
cat text-book.txt binary-book.txt > ../"$book"
rm *.txt *.pat *.sed
cd ..


else # Если не нашли омографов для ручной обработки discretchk 0
	noomo=1
	cat text-book.txt binary-book.txt > ../"$book"
	printf '\e[36m%s \e[093m%s \e[36m%s\e[0m\n' "Однозначные обработаны, омографов для ручной обработки" "НЕ" "найдено."
	cd ..
	rm -rf mano-"$book"
fi # discretchk 0

# Отладка: поиск искажений текста в "пастеризованных" версиях исходника и результата dbgchk 0
if [[ debug -eq 1 ]]; then
	# "Пастеризация": всё в нижний регистр, ё -> е, удалить служебные и ударения
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
	end=$(date +%s.%N)

	if [[ -s "$book".diff ]]; then $edi -d "$book".0 "$book".1;
	else rm "$book".0 "$book".1 "$book".diff ;
		if [[ $nocaps -eq 1 ]]; then
			printf '\e[1;4;32m%s\e[0m \e[32m%s \e[93m%s\e[0m\n' "DEBUG:" "пастеризованные файлы идентичны." "Капсы убраны";
  		else
			printf '\e[1;4;32m%s\e[0m \e[32m%s \e[36m%s\e[0m\n' "DEBUG:" "пастеризованные файлы идентичны." "Капсы оставлены";
		fi
	fi
fi # dbgchk 0

mo_proc=$(date +%s.%N); tot_dur=$( echo $mo_proc - $mo_time0 | bc )

LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Общее время работы скрипта:" $tot_dur "сек"
if [[ ! $noomo -eq 1 ]]; then printf '\e[36m%s \e[33m%s \e[36m%s \e[33m%s\e[0m\n' "Дискретные скрипты в" "mano-$book" "обрабатывают файл:" "$obook" ; fi
printf '\e[32;4;1m%s\e[0m \e[36m%s \e[33m%s \e[36m%s \e[36m%s \e[33m%s\e[0m\n' "\"Ручные омографы:\"" "Файл" "$book" "обработан." "Бэкап:" "$backup"

