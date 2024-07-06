#!/bin/bash
# Скрипт ручной обработки текста
# Создает в директории mano-$book дискретные скрипты для обработки каждого из найденных омографов.
# Последняя версия файла тут: https://github.com/Balamoote/gtts-scripts
# Ручная обработка омографов через дискретные скрипты работает только с установленным плагинами vim:
# 1) vim-ingo-library, брать тут https://github.com/inkarkat/vim-ingo-library
# 2) vim-PatternsOnText, брать тут https://github.com/inkarkat/vim-PatternsOnText
#set -e
# Ключи запуска: -f, -x, -p или их комбинация. Например: ./momo.sh -xp book.fb2 или ./momo.fb2 book.fb2 или ./momo.fb2 -gg book.fb2
export LC_COLLATE=C
mo_time0=$(date +%s.%N); mo_prev=$mo_time0
key="$1"
book="$2"
somo="$3"
bookwrkdir=mano-"$book"
bookstadir=mano-"$book".stat
suf=man
backup="$book".$suf

#repper="grep -Fnf"
repper="rg -Fnf"

debug=0   # Если 1, то сделать отладку скриптов омографов: поиск искажений текста в "пастеризованных" версиях исходника и результата 
nocaps=0  # Если 1, то капсов в "пастеризованных" не будет
locdic=1
morphy_is=1   # 1 = SpaCy; 2 = Natasha
morphy_yo=0   # 1 = скрипт vsevso.awk использует только данные SpaCy или Natasha; 0 = только "подбирает хвосты"
morphy_do=0   # 1 = некоторые скрипты могут использовать только данные SpaCy или Natasha; 0 = только "подбирает хвосты" (не сделано)

do_parallel=1     # включить GNU Parallel. ВНИМАНИЕ: подобрать параметры по реальной производительности
   pblock_a=500K  # awk: размер куска текста на 1 задачу: постфиксы K, M, G, T, P, k, m, g, t, p. "-1" = авто
   pblock_s=-1    # sed: размер куска текста на 1 задачу: постфиксы K, M, G, T, P, k, m, g, t, p. "-1" = авто
   pjobs=8        # задать макс. кол-во задач. 100% = кол-ву потоков (threads). 4 = 4 задачи. Подсказка: $ parallel --number-of-cores
   pload=200%     # макс загрузка отдельного процессора: вывод $ parallel --number-of-threads делённый на $ parallel --number-of-cores : 16/8 = 2 * 100% = 200%
   pmem=1G        # мин. память, перед началом следующей задачи, если памяти менее 50% от значения, завершить самую свежую задачу.
   pnice=0        # приоритет

   paraopts_awk="--jobs=$pjobs --load=$pload --block=$pblock_a --memfree $pmem --nice=$pnice --noswap --eta --bar --pipe-part -ka"
   paraopts_sed="--jobs=$pjobs --load=$pload --block=$pblock_s --memfree $pmem --nice=$pnice --noswap --pipe-part -ka"

# Установка редактора: vim или neovim
edi=$(sed -rn 's/^\s*editor\s*=\s*(vim|nvim)\s*$/\1/ p' scriptdb/settings.ini)

# Установка корректировки ширины вывода превью в дискретных скриптах
termcor=$(sed -rn 's/^\s*termcorrection\s*=\s*([-0-9]*)\s*$/\1/ p' scriptdb/settings.ini)

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


ms2sec () { awk -vms=$duration 'BEGIN {
                   D=int(ms/86400); Dr=ms%86400; if(D) { D=D " д " } else { D="" };
                   H=int(Dr/3600);  Hr=Dr%3600;  if(H) { Hs=sprintf("%d", H) ":" } else { Hs="" };
                   M=int(Hr/60);    Mr=Hr%60;    if(M) { if(H) {Ms=sprintf("%02d", M) ":"} else {Ms=sprintf("%d", M) ":" } } else { Ms="" };
                   if(M>=1) {S=sprintf("%05.2f %s", Mr, ".") } else { S=sprintf("%.2f %s", Mr, "сек.") };
#                  if(!M) {S=S " сек."} else { S=S " ."};
                   durhum=D Hs Ms S; printf("%s", durhum) }'; }

cdata=$(date)
printf '\e[32m%s \e[32;4;1m%s\e[0m \e[93m%s\e[0m\n' "Скрипт" "\"Ручные омографы\"" "$cdata"

if [[ -s "$1" ]]; then book=$1; backup="$book".$suf; key="-xp"; printf '\e[33m%s \e[93m%s\e[0m\n' "Ключи не заданы, но книга указана. Используем ключ:" "-xp"
elif [[ -e "$2" ]]; then printf '\e[36m%s \e[33m%s\e[0m\n' "Обрабатывается книга:" "$book"
else printf '\e[35m%s \e[93m%s\e[0m\n' "Книга не задана или не существует. Использование:" "./momo.sh [ключ] book.fb2"; exit 1; fi

# Дискретные скрипты пишутся в файл, который задан переменной obook
# Эта переменная имеет смысл ТОЛЬКО, если заново создаются скрипты в mano-$book, т.е. перед запуском скрипта её нужно удалить вручную. Если нужно.
obook="$book" # омографы пишутся в $book, т.е. в основной файл книги
#obook="$book".man # омографы пишутся в $book.man, т.е. в бэкап скрипта ./momo.sh
#obook="$book".yoy # омографы пишутся в $book.yoy, т.е. в бэкап скрипта ./yofik.sh
#obook="$book".nam # омографы пишутся в $book.nam, т.е. в бэкап скрипта ./get-words.sh.

case $key in 
	-f) # удалить директорию mano-book
		if [[ -d "mano-$book" ]]; then rm -rf "mano-$book"; printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директория" "mano-$book" "удалена."; exit 1
		else printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директории" $bookwrkdir "не существует. Используйте другой ключ."; exit 1; fi ;;
	-x) # Однозначные омографы+дискретные скрипты; существующую директорию mano- не удалять
		fixomo=1; preview=0; morphy=0; progs=0; printf '\e[36m%s\e[0m\n' "Однозначные омографы и дискретные скрипты." ;;
	-p) # Превью текста и дискретные скрипты; существующую директорию mano- не удалять
		fixomo=0; preview=1; morphy=0; progs=0; printf '\e[36m%s\e[0m\n' "Превью текста и дискретные скрипты." ;;
	-px | -xp | -g) # Однозначные омографы, превью и дискретные скрипты; существующую директорию mano- не удалять
		fixomo=1; preview=1; morphy=0; progs=0; printf '\e[36m%s\e[0m\n' "Однозначные омографы, превью и дискретные скрипты." ;;
	-fpx | -fxp | -fg | -gg ) # Однозначные омографы, превью и дискретные скрипты; существующую директорию mano- удалить; +morphy (!!!)
		fixomo=1; preview=1; morphy=1; progs=0; if [[ -d "mano-$book" ]]; then rm -rf $bookwrkdir; printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директория" "mano-$book" "удалена."; fi ;;
	-fpxo | -fxpo | -fgo | -ggo ) # Однозначные омографы, превью и дискретные скрипты; существующую директорию mano- удалить; +morphy (!!!) + список в слов консоль
		fixomo=1; preview=1; morphy=1; progs=1; if [[ -d "mano-$book" ]]; then rm -rf $bookwrkdir; printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директория" "mano-$book" "удалена."; fi ;;
	-fpc | -ggc ) # Однозначные омографы, превью и дискретные скрипты; существующую директорию mano- удалить; без morphy (!!!)
		fixomo=1; preview=1; morphy=0; progs=0; if [[ -d "mano-$book" ]]; then rm -rf $bookwrkdir; printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директория" "mano-$book" "удалена."; fi ;;
	-fps | -sw ) # один омограф, превью и дискретные скрипты; существующую директорию mano- удалить; без morphy (!!!)
		fixomo=1; preview=1; morphy=0; progs=0; swrd=1; single=1
		if [[ -z somo ]]; then printf '\e[36m%s\e[0m\n' "Отдельный омограф не задан."; exit 1; fi; 
		if [[ -d "mano-$book" ]]; then rm -rf $bookwrkdir; printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директория" "mano-$book" "удалена."; fi ;;
	-fpg | -sg ) # группа омографов, превью и дискретные скрипты; существующую директорию mano- удалить; без morphy (!!!)
		fixomo=1; preview=0; morphy=0; progs=0; sgrp=1; single=1
		if [[ -z somo ]]; then printf '\e[36m%s\e[0m\n' "Отдельная группа омографов не задана."; exit 1; fi; 
		if [[ -d "mano-$book" ]]; then rm -rf $bookwrkdir; printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директория" "mano-$book" "удалена."; fi ;;
	-fpe | -se ) # омограф = "все", превью и дискретные скрипты; существующую директорию mano- удалить; без morphy (!!!)
		fixomo=1; preview=1; morphy=1; progs=0; vse=1; single=1
		if [[ -z somo ]]; then printf '\e[36m%s\e[0m\n' "Отдельный омограф не задан."; exit 1; fi; 
		if [[ -d "mano-$book" ]]; then rm -rf $bookwrkdir; printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директория" "mano-$book" "удалена."; fi ;;
	-xf | -fx) # Превью текста и дискретные скрипты; существующую директорию mano- удалить
		fixomo=1; preview=0; morphy=0; progs=0; if [[ -d "mano-$book" ]]; then rm -rf $bookwrkdir; printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директория" "mano-$book" "удалена."; fi ;;
	-fp | -pf) # Однозначные омографы Не делать, дискретные скрипты; существующую директорию mano- удалить
		fixomo=0; preview=1; morphy=0; progs=0; if [[ -d "mano-$book" ]]; then rm -rf $bookwrkdir; printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директория" "mano-$book" "удалена."; fi ;;
	*) # Нечто другое
		printf '\e[32m%s \e[93m%s \e[32m%s \e[93m%s\e[0m\n' "Задайте ключ или книгу. Например:" "./momo.sh -xp book.fb2" "или" "./momo.fb2 book.fb2"; exit 0 ;;
esac

if [[ ! -d $bookwrkdir ]]; then mkdir $bookwrkdir
else printf '\e[35m%s \e[93m%s \e[35m%s \e[93m%s\e[0m\n' "Директория для дискретных скриптов" "mano-$book" "существует. Удалите ее или запустите скрипт с ключом" "-f"; exit 1; fi

printf '\e[36m%s \e[93m%s\e[36m%s \e[93m%s\e[0m ' "В словаре Омографов:" $(zgrep -c ^ scriptdb/mano-uc0.txt.gz) ", омографов:" $(zgrep -c ^ scriptdb/mano-lc0.txt.gz)
if [[ ! -d scriptaux ]]; then mkdir scriptaux; fi
if [[ -s scriptaux/zaomo.md5 ]] && md5sum -c --status scriptaux/zaomo.md5 >/dev/null 2>&1; then
	printf '\e[36m%s \e[33m%-8s \e[32m%s\e[0m\n' "Файлы" scriptaux/zaomo.md5 "OK!";
else printf '\n'; clxx=1; fi

if [[ $clxx -eq "1" ]]; then
	if ./check-lexx.sh -fm; then printf '\e[32m%s\e[0m\n' "Проверка файлов завершена успешно…";
	else printf '\e[1;31m%s \e[93m%s \e[1;31m%s\e[0m\n' "Выполнение скрипта" "./momo.sh" "прервано! Исправьте ошибки в базах и повторите действие!"; exit 1; fi; fi

# Массив со списком обязательных файлов
pack="scriptdb/automo.gz scriptdb/beautify.awk scriptdb/class.list.gz scriptdb/classes.awk scriptdb/cstauto.awk scriptdb/cstring.awk scriptdb/defunct.awk scriptdb/deomo.awk scriptdb/demorphy.awk scriptdb/dic_cust.gz scriptdb/dic_gl.gz scriptdb/dic_prl.gz scriptdb/dic_prq.gz scriptdb/dic_rest.gz scriptdb/dic_suw.gz scriptdb/exclusion.pat.gz scriptdb/fb2 scriptdb/functions.awk scriptdb/gw_caplists.awk scriptdb/hclean.sh scriptdb/ist.gz scriptdb/main.awk scriptdb/mano-lc0.txt.gz scriptdb/mano-uc0.txt.gz scriptdb/namebase0.txt.gz scriptdb/namedef.awk scriptdb/nameoverride.txt.gz scriptdb/nomo.txt.gz scriptdb/omo-index.sed scriptdb/omo_list.phy.gz scriptdb/omoid.me scriptdb/omoid_auto.gz scriptdb/omoid_flat.gz scriptdb/omoid_ini.gz scriptdb/omoid_pa_ini.gz scriptdb/omopick.awk scriptdb/preview.awk scriptdb/rulg_all.py scriptdb/rulg_omo.py scriptdb/settings.ini scriptdb/sort_opt.awk scriptdb/vsevso.awk scriptdb/wordbase0.gz scriptdb/yodef.awk scriptdb/yodef0.txt.gz scriptdb/yodef1.txt.gz scriptdb/yolc.txt scriptdb/yomo-lc0.txt.gz scriptdb/yomo-uc0.txt.gz scriptdb/zamok.awk"
read -a minpack <<< $pack

# Проверка не потерялось ли чего
for f in "${minpack[@]}"; do
	if [[ ! -s $f ]]; then
	if [[ -e scriptaux/zaomo.md5 ]]; then rm scriptaux/zaomo.md5; fi
	printf '\e[1;31;5m%s \e[0;93m%s \e[1;31;5m%s\e[0m\n' "Отсутствует файл:" $f "Запустите еще раз или найдите потерянный файл."; exit 1; fi; done

d2u;

# Конвертация в UTF-8, если нужно
#$edi -c "set nobomb | set fenc=utf8 | x" "$book"

sed -r  "/^\s*<binary/Q" "$book" | sed -r "s/\xc2\xa0/ /g" > $bookwrkdir/text-book.txt
sed -rn '/^\s*<binary/,$p' "$book" > $bookwrkdir/binary-book.txt
#booklico=$(wc -l < $bookwrkdir/binary-book.txt)

# Замены однозначных
mo_cur=$(date +%s.%N); duration=$( echo $mo_cur - $mo_prev | bc ); mo_prev=$mo_cur; durhum=$(ms2sec);
if [[ $fixomo == "1" ]]; then

if [[ $morphy == "1" ]] || [[ $locdic == "1" ]]; then
# Создать директорию статических файлов для текущей книги
 if [[ ! -d $bookstadir ]]; then mkdir $bookstadir
 else printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Директория статических файлов для текущей книги" $bookstadir "существует."; fi; fi

if [[ $morphy == "1" ]]; then
# Создать копию текст книги и морфологией с помощью morphy << начало блока morphy

   if [[ $morphy_is == "1" ]]; then

     if [[ -s $bookstadir/text-book.scy ]] && md5sum -c --status $bookstadir/text.phy.md5 >/dev/null 2>&1; then
            printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Файлы в" $bookstadir/text.phy.md5 "OK: файл с разметкой SpaCy уже создан.";
     else
        sed -r "s/[$unxc]+//g;
                s/[$unxs]/./g;
                s/([$RUUC])([$RUUC]+)/\1\L\2/g;
                s/<[-a-zA-Z_/.,;:#?! ]+>//g" $bookwrkdir/text-book.txt | \
        python3 scriptdb/rulg_omo.py scriptdb/omo_list.phy.gz > $bookstadir/text-book.scy
        #python3 scriptdb/rulg_all.py scriptdb/omo_list.phy > $bookstadir/text-book.scy
    
        md5sum $bookstadir/text-book.scy $bookwrkdir/text-book.txt scriptdb/rulg_omo.py scriptdb/rulg_all.py > $bookstadir/text.phy.md5
        mo_cur=$(date +%s.%N); duration=$( echo $mo_cur - $mo_prev | bc ); mo_prev=$mo_cur; durhum=$(ms2sec);
        LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%s \e[36m%s\e[0m\n' "Создана копия книги с морфологией строк по SpaCy:" $durhum ; fi
  fi;
  if [[ $morphy_is == "2" ]]; then

     if [[ -s $bookstadir/text-book.nat ]] && md5sum -c --status $bookstadir/text.phy.md5 >/dev/null 2>&1; then
            printf '\e[36m%s \e[33m%s \e[36m%s\e[0m\n' "Файлы в" $bookstadir/text.phy.md5 "OK: файл с разметкой Natasha уже создан.";
     else
        sed -r "s/[$unxc]+//g;
                s/[$unxs]/./g;
                s/([$RUUC])([$RUUC]+)/\1\L\2/g;
                s/<[-a-zA-Z_/.,;:#?! ]+>//g" $bookwrkdir/text-book.txt | \
        python3 scriptdb/natru_omo.py scriptdb/omo_list.phy.gz > $bookstadir/text-book.nat
    
        md5sum $bookstadir/text-book.nat $bookwrkdir/text-book.txt scriptdb/natru_omo.py > $bookstadir/text.phy.md5
        mo_cur=$(date +%s.%N); duration=$( echo $mo_cur - $mo_prev | bc ); mo_prev=$mo_cur; durhum=$(ms2sec);
        LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%s \e[36m%s\e[0m\n' "Создана копия книги с морфологией строк по Natasha:" $durhum ; fi
  fi;
fi;
# << Конец блока morphy

# 
case $morphy_is in

  1) if [[ -s $bookstadir/text-book.scy ]]; then
       awk '{if (FNR==NR) { a[FNR]=$0 } else { b[FNR]=$0 } }; END { for(i in a) print a[i] "<@##@##@>" b[i] }' \
       $bookwrkdir/text-book.txt $bookstadir/text-book.scy > $bookwrkdir/text-book.bas
     else
       cp -fu $bookwrkdir/text-book.txt $bookwrkdir/text-book.bas
     fi; ;;
  2) if [[ -s $bookstadir/text-book.scy ]]; then
       awk '{if (FNR==NR) { a[FNR]=$0 } else { b[FNR]=$0 } }; END { for(i in a) print a[i] "<@##@##@>" b[i] }' \
       $bookwrkdir/text-book.txt $bookstadir/text-book.nat > $bookwrkdir/text-book.bas
     else
       cp -fu $bookwrkdir/text-book.txt $bookwrkdir/text-book.bas
     fi; ;;
   *)  cp -fu $bookwrkdir/text-book.txt $bookwrkdir/text-book.bas ;;
esac

if [[ $locdic == "1" ]]; then
# Создать локальные для книги локальные словари для уменьшения используемой памяти << locdic

 # Список слов
 if [[ -s $bookstadir/bookwords.list ]] && md5sum -c --status $bookstadir/locdic.md5 >/dev/null 2>&1; then
	locdicsize=$(cat $bookstadir/bookwords.list | wc -l)
        printf '\e[36m%s \e[33m%s \e[36m%s \e[93m%s\e[0m\n' "Файлы в" $bookstadir/locdic.md5 "OK: файлы локальных словарей уже созданы. Словоформ:" $locdicsize;
 else
 sed -r 's/^/ /g' $bookwrkdir/text-book.txt | grep -Eo "[$RUUC$rulc$unxc-]+" |\
     sed -r "s/[$unxc]+//g;
             s/^.*$/\L\0/g;
             s/ё/е/g;
             s/^.*$/_\0=/g;
             s/^(.*)-(.*)$/\0\n\1=\n_\2/g
             s/^(.*)-(.*)$/\0\n\1=\n_\2/g
             s/^(.*)-(.*)$/\0\n\1=\n_\2/g" | sed -r "s/^_-/_/; s/-=$/=/" | sort -u > $bookstadir/bookwords.list
    locdicsize=$(cat $bookstadir/bookwords.list | wc -l )

 grep -Ff $bookstadir/bookwords.list <(zcat scriptdb/dic_gl.gz   | sed -r "s/^([^ ]+)/_\1=/") | sed -r "s/^_([^=]+)=/\1/" | gzip > $bookstadir/dic_gl.gz
 grep -Ff $bookstadir/bookwords.list <(zcat scriptdb/dic_prl.gz  | sed -r "s/^([^ ]+)/_\1=/") | sed -r "s/^_([^=]+)=/\1/" | gzip > $bookstadir/dic_prl.gz
 grep -Ff $bookstadir/bookwords.list <(zcat scriptdb/dic_prq.gz  | sed -r "s/^([^ ]+)/_\1=/") | sed -r "s/^_([^=]+)=/\1/" | gzip > $bookstadir/dic_prq.gz
 grep -Ff $bookstadir/bookwords.list <(zcat scriptdb/dic_rest.gz | sed -r "s/^([^ ]+)/_\1=/") | sed -r "s/^_([^=]+)=/\1/" | gzip > $bookstadir/dic_rest.gz
 grep -Ff $bookstadir/bookwords.list <(zcat scriptdb/dic_suw.gz  | sed -r "s/^([^ ]+)/_\1=/") | sed -r "s/^_([^=]+)=/\1/" | gzip > $bookstadir/dic_suw.gz

    md5sum $bookstadir/bookwords.list $bookwrkdir/text-book.txt scriptdb/dic_gl.gz scriptdb/dic_prl.gz scriptdb/dic_prq.gz scriptdb/dic_rest.gz scriptdb/dic_suw.gz \
           $bookstadir/dic_gl.gz $bookstadir/dic_prl.gz $bookstadir/dic_prq.gz $bookstadir/dic_rest.gz $bookstadir/dic_suw.gz > $bookstadir/locdic.md5

    mo_cur=$(date +%s.%N); duration=$( echo $mo_cur - $mo_prev | bc ); mo_prev=$mo_cur; durhum=$(ms2sec);
    LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%s \e[36m%s \e[36m%s \e[93m%s\e[0m\n' "Подготовка локальных словарей из словоформ в книге:" $durhum "Словоформ:" $locdicsize; fi
fi;
# << Конец блока создания локальных словарей

# Обработка некондиционных фраз из scriptdb/rawstuff.gz
# Получить номера строк файла, где найдены эскейпы
 eSCAN=$($repper <(zcat scriptdb/rawstuff.gz | sed -r 's/^.[^#]+# \"(.+)\"$/\1/g') $bookwrkdir/text-book.bas|\
        awk 'BEGIN{FS=":"}{a=a "_" $1}END{ print substr(a,2)}');

  if [[ -n $eSCAN ]]; then
    sed -r '/^#_#_#txtmppra/,/^#_#_#txtmpprb/ {
            s/^#(.+#_#_# escomo !_#_!)$/\1/g;
            s/^(.+#_#_# foricycle !_#_!)$/#\1/g;
            s/^(.+#_#_# vsez !_#_!)$/#\1/g;
            s/^(.+#_#_# all_omos !_#_!)$/#\1/g}' scriptdb/main.awk > $bookstadir/main_esc.awk

    awk -vindb="scriptdb/" -vinax="scriptaux/" -vbkphydir="$bookstadir/" -vlocdic="$bookstadir/" -vmorphy_on="$morphy" -vmorphy_yo="$morphy_yo" \
        -vescan="$eSCAN" -f $bookstadir/main_esc.awk $bookwrkdir/text-book.bas > $bookwrkdir/text-book.awk.txt

    mv $bookwrkdir/text-book.awk.txt $bookwrkdir/text-book.bas
    mo_cur=$(date +%s.%N); duration=$( echo $mo_cur - $mo_prev | bc ); mo_prev=$mo_cur; durhum=$(ms2sec);
    LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%s \e[36m%s\e[0m\n' "Обработка словаря исключений:" $durhum
  fi # 

# Проверить наличие необработанных "все": если есть, применить все правила, иначе выключить пару "все/всё"
yops=$(grep -io "[^$unxc]\bвсе\b[^$unxc]" $bookwrkdir/text-book.txt | wc -l)

if [[ ! $single -eq 1 ]]; then
  if [[ ! $yops -eq 0 ]]; then
     if [[ $do_parallel -eq 1 ]]; then
       printf '\e[32m%s \e[33m%s\e[0m\n' "GNU Parallel:" "$paraopts_awk"
       parallel --env $paraopts_awk $bookwrkdir/text-book.bas \
       awk -vindb="scriptdb/" -vinax="scriptaux/" -vbkphydir="$bookstadir/" -vlocdic="$bookstadir/" -vmorphy_on="$morphy" -vmorphy_yo="$morphy_yo" \
           -f scriptdb/main.awk > $bookwrkdir/text-book.awk.txt
     else
       awk -vindb="scriptdb/" -vinax="scriptaux/" -vbkphydir="$bookstadir/" -vlocdic="$bookstadir/" -vmorphy_on="$morphy" -vmorphy_yo="$morphy_yo" \
           -f scriptdb/main.awk $bookwrkdir/text-book.bas > $bookwrkdir/text-book.awk.txt
     fi # do_parallel

     mv $bookwrkdir/text-book.awk.txt $bookwrkdir/text-book.txt

     yope=$(grep -io "[^$unxc]\bвсе\b[^$unxc]" $bookwrkdir/text-book.txt| wc -l)
     mo_cur=$(date +%s.%N); duration=$( echo $mo_cur - $mo_prev | bc ); mo_prev=$mo_cur; durhum=$(ms2sec);
     LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%s \e[36m%s \e[36m%s \e[93m%s \e[36m%s \e[93m%s \e[36m%s\e[0m\n' "Основная обработка:" $durhum "Остаток 'все':" $yope "из" $yops "."
  else
     sed -r '/^#_#_#txtmppra/,/^#_#_#txtmpprb/ s/^(.+#_#_# vsez !_#_!)$/#\1/g' scriptdb/main.awk > $bookstadir/main.awk

     if [[ $do_parallel -eq 1 ]]; then
       printf '\e[32m%s \e[33m%s\e[0m\n' "GNU Parallel:" "$paraopts_awk"
       parallel --env $paraopts_awk $bookwrkdir/text-book.bas \
       awk -vindb="scriptdb/" -vinax="scriptaux/" -vbkphydir="$bookstadir/" -vlocdic="$bookstadir/" -vmorphy_on="$morphy" -vmorphy_yo="$morphy_yo" \
           -f $bookstadir/main.awk > $bookwrkdir/text-book.awk.txt
     else
       awk -vindb="scriptdb/" -vinax="scriptaux/" -vbkphydir="$bookstadir/" -vlocdic="$bookstadir/" -vmorphy_on="$morphy" -vmorphy_yo="$morphy_yo" \
           -f $bookstadir/main.awk $bookwrkdir/text-book.bas > $bookwrkdir/text-book.awk.txt
     fi # do_parallel

     mv $bookwrkdir/text-book.awk.txt $bookwrkdir/text-book.txt

     mo_cur=$(date +%s.%N); duration=$( echo $mo_cur - $mo_prev | bc ); mo_prev=$mo_cur; durhum=$(ms2sec);
     printf '\e[36m%s\e[0m\n' "Необработанных 'все' не найдено."
  fi # все
else
  # обработка только одного омографа
  if [[ $swrd -eq 1 ]]; then
    sed -r '/^#_#_#txtmppra/,/^#_#_#txtmpprb/ {
            s/^(.+#_#_# vsez !_#_!)$/#\1/g;
            s/^(.+#_#_# all_omos !_#_!)$/#\1/g;
            s/^#([^"]+")dummy(".+#_#_# single_word !_#_!)$/\1'$somo'\2/g}' scriptdb/main.awk > $bookstadir/main.awk

    if [[ $do_parallel -eq 1 ]]; then
      printf '\e[32m%s \e[33m%s\e[0m\n' "GNU Parallel:" "$paraopts_awk"
      parallel --env $paraopts_awk $bookwrkdir/text-book.bas \
      awk -vindb="scriptdb/" -vinax="scriptaux/" -vbkphydir="$bookstadir/" -vlocdic="$bookstadir/" -vmorphy_on="$morphy" -vmorphy_yo="$morphy_yo" \
          -f $bookstadir/main.awk > $bookwrkdir/text-book.awk.txt
    else
      awk -vindb="scriptdb/" -vinax="scriptaux/" -vbkphydir="$bookstadir/" -vlocdic="$bookstadir/" -vmorphy_on="$morphy" -vmorphy_yo="$morphy_yo" \
          -f $bookstadir/main.awk $bookwrkdir/text-book.bas > $bookwrkdir/text-book.awk.txt
    fi # do_parallel

    mv $bookwrkdir/text-book.awk.txt $bookwrkdir/text-book.txt
    mo_cur=$(date +%s.%N); duration=$( echo $mo_cur - $mo_prev | bc ); mo_prev=$mo_cur; durhum=$(ms2sec);
  fi #

  # обработка только одной группы омографов
  if [[ $sgrp -eq 1 ]]; then
    sed -r '/^#_#_#txtmppra/,/^#_#_#txtmpprb/ {
            s/^(.+#_#_# vsez !_#_!)$/#\1/g;
            s/^(.+#_#_# all_omos !_#_!)$/#\1/g;
            s/^#([^"]+")dummy(".+#_#_# single_group !_#_!)$/\1'$somo'\2/g}' scriptdb/main.awk > $bookstadir/main.awk

    if [[ $do_parallel -eq 1 ]]; then
      printf '\e[32m%s \e[33m%s\e[0m\n' "GNU Parallel:" "$paraopts_awk"
      parallel --env $paraopts_awk $bookwrkdir/text-book.bas \
      awk -vindb="scriptdb/" -vinax="scriptaux/" -vbkphydir="$bookstadir/" -vlocdic="$bookstadir/" -vmorphy_on="$morphy" -vmorphy_yo="$morphy_yo" \
          -f $bookstadir/main.awk > $bookwrkdir/text-book.awk.txt
    else
      awk -vindb="scriptdb/" -vinax="scriptaux/" -vbkphydir="$bookstadir/" -vlocdic="$bookstadir/" -vmorphy_on="$morphy" -vmorphy_yo="$morphy_yo" \
          -f $bookstadir/main.awk $bookwrkdir/text-book.bas > $bookwrkdir/text-book.awk.txt
   fi # do_parallel

    mv $bookwrkdir/text-book.awk.txt $bookwrkdir/text-book.txt
    mo_cur=$(date +%s.%N); duration=$( echo $mo_cur - $mo_prev | bc ); mo_prev=$mo_cur; durhum=$(ms2sec);
#   printf '\e[36m%s\e[0m\n' "Необработанных 'все' не найдено."
  fi # 
  if [[ $vse -eq 1 ]]; then
    sed -r '/^#_#_#txtmppra/,/^#_#_#txtmpprb/ {
            s/^(.+#_#_# all_omos !_#_!)$/#\1/g}' scriptdb/main.awk > $bookstadir/main.awk

    if [[ $do_parallel -eq 1 ]]; then
      printf '\e[32m%s \e[33m%s\e[0m\n' "GNU Parallel:" "$paraopts_awk"
      parallel --env $paraopts_awk $bookwrkdir/text-book.bas \
      awk -vindb="scriptdb/" -vinax="scriptaux/" -vbkphydir="$bookstadir/" -vlocdic="$bookstadir/" -vmorphy_on="$morphy" -vmorphy_yo="$morphy_yo" \
          -f $bookstadir/main.awk > $bookwrkdir/text-book.awk.txt
    else
      awk -vindb="scriptdb/" -vinax="scriptaux/" -vbkphydir="$bookstadir/" -vlocdic="$bookstadir/" -vmorphy_on="$morphy" -vmorphy_yo="$morphy_yo" \
          -f $bookstadir/main.awk $bookwrkdir/text-book.bas > $bookwrkdir/text-book.awk.txt
    fi # do_parallel

    mv $bookwrkdir/text-book.awk.txt $bookwrkdir/text-book.txt
    mo_cur=$(date +%s.%N); duration=$( echo $mo_cur - $mo_prev | bc ); mo_prev=$mo_cur; durhum=$(ms2sec);
     yope=$(grep -io "[^$unxc]\bвсе\b[^$unxc]" $bookwrkdir/text-book.txt| wc -l)
     LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%s \e[36m%s \e[36m%s \e[93m%s \e[36m%s \e[93m%s \e[36m%s\e[0m\n' "Основная обработка:" $durhum "Остаток 'все':" $yope "из" $yops "."
#   printf '\e[36m%s\e[0m\n' "Необработанных 'все' не найдено."
  fi # 
fi

rexsed="scriptdb/omo-index.sed"

#awk -vtmpdir=$bookwrkdir -vrexfile=$rexsed -f scriptdb/omopick.awk $bookwrkdir/text-book.txt >/dev/null 2>&1

##При подсчете блоков омографов вычитаем стационарные блоки шаблонов
#statblock=4
#locomo=$(( $( grep -c "###" $bookwrkdir/book-index.sed ) - $statblock ))
#printf '\e[36m%s \e[93m%s %s%s%s\e[0m … ' "Омографов для sed-обработки:" $locomo "(" $statblock ")"

#sedroll $bookwrkdir/book-index.sed $bookwrkdir/text-book.txt
 
 if [[ $do_parallel -eq 1 ]]; then
   parallel --env $paraopts_sed $bookwrkdir/text-book.txt sed -rf $rexsed > $bookwrkdir/text-book.sed.txt
   mv $bookwrkdir/text-book.sed.txt $bookwrkdir/text-book.txt
 else
  sedroll $rexsed $bookwrkdir/text-book.txt
 fi # do_parallel

mo_cur=$(date +%s.%N); duration=$( echo $mo_cur - $mo_prev | bc ); mo_prev=$mo_cur; durhum=$(ms2sec);
LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%s \e[36m%s\e[0m\n' "Постобработка sed:" $durhum 

fi # fixomo?

# Списки слов всех омографов с маленькой и с Большой буквы

grep -Po "(?<=[^$RUUC$rulc$unxc])[$rulc$unxc]+" $bookwrkdir/text-book.txt | grep -Ev "[$unxc]" | sed -r 's/^.+$/_\0=/g' | grep -Ff <(zcat scriptaux/mano-lc.pat.gz) | \
	sort -u > $bookwrkdir/manofi-lc.pat

grep -Po "(?<=[^$RUUC$rulc$unxc])[$RUUC$unxc][$rulc$unxc]+" $bookwrkdir/text-book.txt | grep -Ev "[$unxc]" | sed -r 's/^.+$/_\0=/g' | grep -Ff <(zcat scriptaux/mano-uc.pat.gz) | \
	sort -u > $bookwrkdir/manofi-uc.pat

# Список всех омографов в обоих регистрах
zgrep -Ff $bookwrkdir/manofi-uc.pat scriptdb/mano-uc0.txt.gz >  $bookwrkdir/mano-luc.txt
zgrep -Ff $bookwrkdir/manofi-lc.pat scriptdb/mano-lc0.txt.gz >> $bookwrkdir/mano-luc.txt

if [[ -s $bookwrkdir/mano-luc.txt ]]; then # Проверяем найдено ли хоть что-то из омографов… discretchk 0
sed -r "
       s/^_(.+)=/\1/g
       s/\x27/\xcc\x81/g
       s/\\\xcc\\\xa0/\xcc\xa0/g
       s/\\\xcc\\\xa3/\xcc\xa3/g
       s/\\\xcc\\\xa4/\xcc\xa4/g
       s/\\\xcc\\\xad/\xcc\xad/g
       s/\\\xcc\\\xb0/\xcc\xb0/g
       " $bookwrkdir/mano-luc.txt > $bookwrkdir/omo-luc.lst

mo_cur=$(date +%s.%N); duration=$( echo $mo_cur - $mo_time0 | bc ); mo_prev=$mo_cur; durhum=$(ms2sec);
LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%s \e[36m%s\e[0m\n' "Всего обработка омографов заняла:" $durhum 

# Формируем дискретные скрипты пословно
printf '\e[32m%s ' "Идет поиск омографов … подождите."
if [[ $preview -eq 1 ]]; then printf '\e[32m%s' "Превью текста включено."
twd=$(tput cols)

zgrep -Ff <(grep -Fof <(zcat scriptaux/ttspat.$suf.gz) <(sed -r 's/^([^ ]+) .*/_\l\1=/g' $bookwrkdir/omo-luc.lst | sort -u)) scriptaux/tts0.$suf.gz |\
       	sed -r 's/_([^"=]+)(\"=\"\s.+\")$/\1#\" \1\2/' | sed -r 's/_([^=]+)(=.+)$/\1=#\1\2/'| sed "s/\x27/\xcc\x81/" > $bookwrkdir/omo-lexx.txt

sed -r "s/\xe2\x80\xa4/./g; s/\xe2\x80\xa7//g" $bookwrkdir/text-book.txt | \
    awk -vobook=$obook -vtwd=$twd -vpreview=$preview -vprogs=$progs -vtermcor=$termcor -veditor=$edi -vbkwrkdir="$bookwrkdir/" -vindb="scriptdb/" -f scriptdb/preview.awk 

totnum=$(cat $bookwrkdir/totnum)

printf '\e[36m%s \e[093m%s \e[36m%s \e[093m%s \e[0m' "Создано дискретных скриптов:" $(ls -l $bookwrkdir/*.sh | wc -l) "Всего остаток омографов:" $totnum

mo_cur=$(date +%s.%N); duration=$( echo $mo_cur - $mo_prev | bc ); mo_prev=$mo_cur; durhum=$(ms2sec);
LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%s \e[36m%s\e[0m\n' "Время:" $durhum 

chmod +x $bookwrkdir/*.sh
else printf '\e[36m%s\n' "Превью текста выключено."; fi
# Собираем книгу и удаляем временные файлы
cat $bookwrkdir/text-book.txt $bookwrkdir/binary-book.txt > "$book"
#rm $bookwrkdir/*.txt $bookwrkdir/*.pat $bookwrkdir/*.sed
#rm $bookwrkdir/*.txt $bookwrkdir/*.pat

else # Если не нашли омографов для ручной обработки discretchk 0
	noomo=1
	cat $bookwrkdir/text-book.txt $bookwrkdir/binary-book.txt > "$book"
	printf '\e[36m%s \e[093m%s \e[36m%s\e[0m\n' "Однозначные обработаны, омографов для ручной обработки" "НЕ" "найдено."
	rm -rf $bookwrkdir
fi # discretchk 0

# Отладка: поиск искажений текста в "пастеризованных" версиях исходника и результата dbgchk 0
if [[ debug -eq 1 ]]; then
	# "Пастеризация": всё в нижний регистр, ё -> е, удалить служебные и ударения
	sed -r "
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
		" "$book".$suf > "$book".0
		if [[ $nocaps -eq 1 ]]; then sed -ri 's=^.*$=\L\0=g' "$book".0; fi

	sed -r "
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
		" "$book" > "$book".1
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

mo_proc=$(date +%s.%N); duration=$( echo $mo_proc - $mo_time0 | bc ); durhum=$(ms2sec);

LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%s \e[36m%s\e[0m\n' "Общее время работы скрипта:" $durhum 
if [[ ! $noomo -eq 1 ]]; then printf '\e[36m%s \e[33m%s \e[36m%s \e[33m%s\e[0m\n' "Дискретные скрипты в" "mano-$book" "обрабатывают файл:" "$obook" ; fi
printf '\e[32;4;1m%s\e[0m \e[36m%s \e[33m%s \e[36m%s \e[36m%s \e[33m%s\e[0m\n' "\"Ручные омографы:\"" "Файл" "$book" "обработан." "Бэкап:" "$backup"

