#!/bin/bash
# Скрипт анализа файла tts.txt, полученного из tts.lexx. Аргументов не требует.
# Последняя версия файла тут: https://github.com/Balamoote/gtts-scripts 
# Требует: bash, sed, grep, awk, uniq, sort, т.е. стандартный набор утилит, который присутствует на большинстве linux-систем.

# Варианты запуска: в консоли Linux/Mac, Cygwin под Windows, Termux под Android

# После завершения работы скрипта выдается отчет, подробности о ошибках можно посмотреть в файлах _*.txt

# Если выполнить команду: ./check-lexx.sh book.fb2 , где book.fb2 - книга в кодировке UTF-8, то будет сформирован частный словарь book.fb2.lexx, с шаблонами только для этой книги.
# Если выполнить команду: ./check-lexx.sh -f или ./check-lexx.sh --recheck , то анализ словаря будет сделан принудительно, а также созданы вспомогательные файлы для скриптов.
# Выполнять эту команду только на "начальной" книге, еще не обработанной скриптом ./get-words.sh. Иначе этот скрипт сформирует неполные базы добавления слов.
#set -e
export LC_COLLATE=C

if [[ ! -d scriptaux ]]; then mkdir scriptaux; fi

if [[ ! -z "$1" ]]; then
case "$1" in
	-r  | -f |--recheck ) # Принудительно перепроверить словарь и заново создать все вспомогательные файлы для скриптов
	       [[ -d scriptaux ]] && rm -rf scriptaux/ && mkdir scriptaux;;
	-a  | --rawk ) # Полная проверка "кавычных" шаблонов
		rawk="1" ;;
	-fc | -fa | --chawk ) # Перепроверить словарь, создать вспомогательные файлы и сделать полную проверку "кавычных" шаблонов
		if [[ -s scriptaux/zlexxdb.md5 ]]; then rm scriptaux/zlexxdb.md5; rawk="1"; fi ;;
	-fg | --fgword ) # Перепроверить вспомогательные файлы get-words.sh
		if [[ -s scriptaux/zndb.md5 ]]; then rm scriptaux/zndb.md5; fi; if [[ -s scriptaux/zlexxdb.md5 ]]; then rm scriptaux/zlexxdb.md5; fi ;;
	-fy | --fyofik ) # Перепроверить вспомогательные файлы yofik.sh
		if [[ -s scriptaux/zjofik.md5 ]]; then rm scriptaux/zjofik.md5; fi ;;
	-fm | --fmomo ) # Перепроверить вспомогательные файлы momo.sh
		if [[ -s scriptaux/zaomo.md5 ]]; then rm scriptaux/zaomo.md5; fi ;;
	*) # Проверить, существует ли файл книги
		if [[ -s "$1" ]]; then book="$1"
		else printf '\e[35m%s \e[93m%s \e[35m%s \e[93m%s \e[93m%s \e[35m%s\e[0m\n' \
			"Использование:" "./check-lexx.sh" "или" "./check-lexx.sh -f" "или" "./check-lexx.sh book.fb2"; fi ;;
esac; fi

# Массив со списком обязательных файлов
pack="add2lexx.sh addnames.sh all-in-one.sh check-lexx.sh dic.sh get-words.sh lexx2txt.sh momo.sh omofix.sh scriptdb/omo-index.sed scriptdb/exclusion.pat.gz scriptdb/mano-lc0.txt.gz scriptdb/mano-uc0.txt.gz scriptdb/namebase0.txt.gz scriptdb/nameoverride.txt.gz scriptdb/nomo.txt.gz scriptdb/omopick.awk scriptdb/preview.awk scriptdb/deomo.awk scriptdb/gw_caplists.awk scriptdb/yodef.awk scriptdb/wordbase0.gz scriptdb/yodef0.txt.gz scriptdb/yodef1.txt.gz scriptdb/yomo-lc0.txt.gz scriptdb/yomo-uc0.txt.gz scriptomo/00-on.sed scriptomo/01-yo.sed scriptomo/11-num.sed scriptomo/20-index.sed scriptomo/41-1_eo-ast.sed scriptomo/41-2_eo.sed scriptomo/99-fin.sed stripper.sh txt2lexx.sh yofik.sh"
read -a minpack <<< $pack

# Проверка не потерялось ли чего
for f in "${minpack[@]}"; do
	if [[ ! -s $f ]]; then printf '\e[31;5;1m%s\e[0m \e[93m%s\e[0m\n' "Отсутствует файл:" $f; exit 1; fi; done

# Проверка наличия tts.txt, отдельная чтобы пользователь конфертировал lexx, если он забыл это сделать
if [[ ! -s tts.txt ]]; then printf '\e[35m%s \e[33m%s \e[35m%s \e[93m%s\e[35m%s\e[0m\n' "Отсутствует файл" "tts.txt" "Дайте команду" "./lexx2txt.sh TTS.lexx" ", чтобы его создать"; exit 1; fi

# Проверяем, изменялся ли дефектный tts.txt после последней проверки
if [[ -s _err-msg.md5 ]]; then
		if [[ -s scriptaux/zlexxdb.md5 ]] && md5sum -c --status _err-msg.md5 >/dev/null 2>&1; then
		rm scriptaux/zlexxdb.md5 _err-msg.md5; printf '\e[31;5;1m%s\e[0m \e[33m%s \e[31;5;1m%s\e[0m\n' "Исправьте ошибки в" "tts.txt" "!"; exit 1; fi
	else
	    [[ -s _err-msg.md5        ]] && rm _err-msg.md5
		[[ -s _lost.txt           ]] && rm _lost.txt
		[[ -s _2x-left.txt        ]] && rm _2x-left.txt
		[[ -s _2x-right-quick.txt ]] && rm _2x-right-quick.txt
		[[ -s _2x-right-full.txt  ]] && rm _2x-right-full.txt
		[[ -s _pat-error.txt      ]] && rm _pat-error.txt
	fi

# Проверка по md5: zlexxdb.md5 zaomo.md5 zjofik.md5 zndb.md5 zwdb.md5 . Назначаем "1", если ОК, и "0"", если нужно пересоздать.
if [[ -s scriptaux/zlexxdb.md5 ]] && md5sum -c --status scriptaux/zlexxdb.md5 >/dev/null 2>&1; then lexxdb=1
	printf '\e[32m%s \e[33m%s \e[32m%s \e[33m%s\e[0m\n' "Файл" "tts.txt" "не изменён. Строк в словаре:" $(wc -l < tts.txt);
	else lexxdb=0 ; fi
if [[ -s scriptaux/zaomo.md5  ]] && md5sum -c --status scriptaux/zaomo.md5  >/dev/null 2>&1; then aomo=1;  else aomo=0  ; fi
if [[ -s scriptaux/zjofik.md5 ]] && md5sum -c --status scriptaux/zjofik.md5 >/dev/null 2>&1; then jofik=1; else jofik=0 ; fi
if [[ -s scriptaux/zndb.md5   ]] && md5sum -c --status scriptaux/zndb.md5   >/dev/null 2>&1; then ndb=1;   else ndb=0   ; fi
if [[ -s scriptaux/zwdb.md5   ]] && md5sum -c --status scriptaux/zwdb.md5   >/dev/null 2>&1; then wdb=1;   else wdb=0   ; fi

# Если файлы lexx, сопутсвующих и производных не изменены, ничего неделать
if [[ $lexxdb -eq "0" ]]; then # lexxchk 0

printf '\e[32;4;1m%s\e[0m \e[33m%s\e[0m\n' "Анализ файла словаря" "tts.txt"
printf '\e[32m%s \e[93m%s ' "Regex:" $(grep "regex" tts.txt| wc -l)
printf '\e[32m%s \e[93m%s ' "DoQuo:" $(grep '^"' tts.txt| wc -l)
printf '\e[32m%s \e[93m%s ' "Simpl:" $(grep -v \" tts.txt| wc -l)
printf '\e[32m%s \e[93m%s\e[0m\n' "Строк:" $(wc -l < tts.txt)

# Создание паттернов _.*= для grep -F; ниже выдается ошибка на нестандартые шаблоны
sed -r '/^regex.+$/d
	s/^\"\s([^ ]*)\"=\"\s[^ ]*\"$/_\1/g
	s/^\"\s(.*)\s\"=\"\s.*\s\"$/_\1=/g
	s/^\"([^ ].*)\s\"=\"[^ ].*\s\"$/\1=/g
	s/^\"\s(.*[^ ])\"=\"\s.*[^ ]\"$/_\1/g
	s/^\"(\S+)\"=\"\S+\"$/\1/g
	s/^\"([^ ]*)\s\"=\"[^ ]*\s\"$/\1=/g
	s/^([^\" ]+)=[^\" ]+$/_\1=/g
	s/^\"\s([^ ]*)\-\"=\"\s[^ ]*\s\"$/_\1=/g
	s/^\"\-([^ ]*)\"=\"\s[^ ]*\"$/_\1/g' tts.txt | sort -u | gzip > scriptaux/tts.pat.gz

	# Описание шаблонов в команде выше

	# Удалить regex'ы 		/^regex.+$/d
	# " слово"=" сло'во"		s/^"\s([^ ]*)"="\s[^ ]*"$/_\1/g
	# " два слова "=" два сло'ва "	s/^"\s(.*)\s"="\s.*\s"$/_\1=/g
	# "два слова "="два сло'ва "	s/^"([^ ].*)\s"="[^ ].*\s"$/\1=/g
	# " два слова"=" два сло'ва"	s/^"\s(.*[^ ])"="\s.*[^ ]"$/_\1/g
	# "слово"="сло'во"		s/^"(\S+)"="\S+"$/\1/g
	# "слово "="сло'во "		s/^"([^ ]*)\s"="[^ ]*\s"$/\1=/g
	# слово=сло'во			s/^([^" ]+)=[^" ]+$/_\1=/g
	# " слово-"=" сло'во "		s/^"\s([^ ]*)\-"="\s[^ ]*\s"$/_\1=/g
	# "-слово"=" сло'во"		s/^"\-([^ ]*)"="\s[^ ]*"$/_\1/g

# поиск потерянных слов в базовом списке и наложение списка исключений
zgrep -Fvf <(zcat scriptaux/tts.pat.gz) scriptdb/wordbase0.gz | grep -Fvf <(zcat scriptdb/exclusion.pat.gz) > _lost.txt

# создание списка "двойных кавычек" с 1-м полем из правой части шаблона
sed -nr 's/(^"[^"]+)("=" )([^"]+)(")$/_\3=\1\2\3\4/gp' tts.txt > scriptaux/_quo2.tmp

# находим строки совпадений/поиска: срабатывания на правую часть шаблонов, сортируем
grep -Fof <(zcat scriptaux/tts.pat.gz) scriptaux/_quo2.tmp | sort > scriptaux/_tts-o.tmp

# Если не удается настроить сортировку в локали, то вариант с vim
#vim -E -s -c "sort u" -c "wq" scriptaux/_tts-o.tmp

# выводим сроки поиска, сработавшие 2 и более раз; все срабатывания
uniq -D scriptaux/_tts-o.tmp > scriptaux/_tts-od.tmp

# Выводим полные конфликтные шаблоны по строке поиска (конфликт правой части шаблонов)
# НЕ работает на всех шаблонах, но быстро! Для полного сканирования использовать ./check-lexx.sh -a
grep -Ff scriptaux/_tts-od.tmp scriptaux/_quo2.tmp | sed -r 's/_([^=]+)=/\1 /g' > _2x-right-quick.txt

# создаем сортированный по первой букве список шаблонов, первая кавычка удалена
sed -r 's/^" //g' tts.txt | sort | gzip > scriptaux/_tts-noq.txt.gz
# Если не удается настроить сортировку в локали, то вариант с vim
#vim -E -s -c "sort u" -c "wq" scriptaux/_tts-noq.txt

# Выводим список двойных срабатываний на слово (конфликт левой части шаблонов) в _2x-left.txt
# Ищет только конфликты "шаблонов с кавычками" между собой и с простыми и дубли простых
awk 'BEGIN { RS = "\n" } {
dblen++ ; dbase[dblen] = $0 ; }
END {	for ( i in dbase ) { c5 = substr ( dbase[i], 1, 5 ); if ( c5 == "regex" ) { continue };
cqp = index ( dbase[i], "\"" ) ; if ( cqp == 1 ) { continue }; nqp = index ( dbase[i+1], "\"" );
# Поиск конфликтных "ковычных" шаблонов
if ( cqp > 1 ) { cword = substr ( dbase[i], 1, cqp - 1 ); nword = substr ( dbase[i+1], 1, cqp - 1 );
	if ( cword == nword && i != dblen ) print ( dbase[i], "#" ); else print ( dbase[i] ); }
# Поиск дублей левой части простых шаблонов
if ( cqp == 0 && nqp == 0 ) { cep = index ( dbase[i], "=" ) ; nep = index ( dbase[i+1], "=" ) ; cword = substr ( dbase[i], 1, cep - 1 ); nword = substr ( dbase[i+1], 1, nep - 1 );
	if ( cword == nword && i != dblen ) print ( dbase[i], "#" ); else print ( dbase[i] ); } } }' <(zcat scriptaux/_tts-noq.txt.gz) | grep "#" > _2x-left.txt

# Получение служебного файла для поштучной проверки правой части "кавычных" через awk
sed -nr 's/^\" ([^ ]*)\"=\" ([^ ]*)\"$/\1 \2/gp' tts.txt | gzip > scriptaux/_4awk-dq-rules.txt.gz

# Выводим отчеты об ошибках, если они найдены
if [[ -s _lost.txt ]]; then printf '\e[36m%s\e[36m%7s \e[93m%s \e[33m%s\e[0m\n' "Потеряно слов" ":" $(wc -l _lost.txt); md5sum tts.txt > _err-msg.md5; lexxerr=1; else rm _lost.txt; fi
if [[ -s _2x-left.txt ]]; then printf '\e[36m%s\e[36m%3s \e[93m%s \e[33m%s\e[0m\n' \
	"Конфликтных слева" ":" $(wc -l _2x-left.txt); md5sum tts.txt > _err-msg.md5; lexxerr=1; else rm _2x-left.txt; fi
if [[ -s _2x-right-quick.txt ]]; then printf '\e[36m%s\e[36m%s \e[93m%s \e[33m%s\e[0m\n' \
	"Конфликтных справа, быстро" ":" $(wc -l _2x-right-quick.txt); md5sum tts.txt > _err-msg.md5; lexxerr=1
else rm _2x-right-quick.txt; fi

# Проверка ошибок шаблонов, если найдена "двойная ковычка", то в шаблоне ошибка…
zgrep -e \" -e "=[^=]*=" scriptaux/tts.pat.gz | grep -v "^regex" > _pat-error.txt
awk '{q=0; split($0,quo,""); for(i in quo) {if(quo[i]=="\x22") q++}; if(q!=0 && q!=4) {print $0, q};}' tts.txt >> _pat-error.txt
if [[ -s _pat-error.txt ]]; then printf '\e[31;5;1m%s\e[0m \e[93m%s \e[33m%s\e[0m\n' "Шаблоны с ошибками :" $(wc -l _pat-error.txt); md5sum tts.txt > _err-msg.md5; lexxerr=1
else rm _pat-error.txt; fi 

# удаляем временные файлы
rm scriptaux/_*.tmp

fi # lexxchk 1

# Полная проверка конфликных "кавычных" справа, только вида " слово"=" сло'во"
# Работает медленно: результат может быть получен через несколько минут.
# Включается переменной rawk=1, ключом -a или -f 
if [[ $rawk -eq 1 ]]; then 
if [[ -z $lexxerr ]]; then cl_rawk0=$(date +%s.%N); # rawkchk 0

printf '\e[36m%s\e[0m\n' "Запущена полная проверка правой части шаблонов. Это может занять несколько минут … "

if [[ -s _2x-right-full.txt ]]; then rm _2x-right-full.txt; fi
awk 'BEGIN { RS = "\n"; plog = "scriptaux/_awk_doubles-right.log"; rep = "_2x-right-full.txt"; 	err = 0  } {
num++; ls = substr($1, 1, 3); rs = substr($2, 1, 3); llist[ls][num] = $1; rlist[rs][num] = $2; }
END { for ( li in llist ) { for ( ri in rlist ) { if ( li == ri ) { for ( lj in llist[li]) { # Для наблюдения за процессом, раскомментировать следующую строку
# printf "%s %s %s %s\n", li, lj, "из", num,  llist[li][lj] >> plog; fflush();
for ( rj in rlist[ri]) { if ( lj != rj && rlist[ri][rj] ~ "^"llist[li][lj] ) {
printf "%s %s \" %s\"=\" %s\"\n", llist[li][lj], ">>>", llist[ri][rj], rlist[ri][rj] >> rep; fflush(); err = err + 1 ; } } } } } };
if ( err > 0 ) printf "\033[1;31m%s \033[1;31;5m%s \033[0;93m%s \033[1;31;5m%s\033[0m \033[1;31m%s \033[0;93m%s\033[0m ",
	"Полная проверка правой части:", "найдено", err, "ошибок!", "Информация в файле:",  rep 
else printf "\033[36m%s \033[32m%s \033[32;4;1m%s\033[0m ", "Полная проверка правой части шаблонов.", "Ошибок не найдено -", "ОК!" }' <(zcat scriptaux/_4awk-dq-rules.txt.gz)

cl_rawk1=$(date +%s.%N); duration=$( echo $cl_rawk1 - $cl_rawk0 | bc )
LC_ALL="en_US.UTF-8" printf '\e[36m%s \e[93m%.2f \e[36m%s\e[0m\n' "Проверка заняла:" $duration "сек"

if [[ -e scriptaux/_awk_doubles-right.log ]]; then rm scriptaux/_awk_doubles-right.log ; fi
else printf '\e[93m%s \e[33m%s\e[0m\n' "Полная проверка правой части шаблонов невозможна. Сначала исправьте ошибки в" "tts.txt" ;fi; fi # rawkchk 1

if [[ -s _2x-right-full.txt ]]; then printf '\e[36m%s \e[93m%s \e[33m%s\e[0m\n' "Конфликтных справа, по́лно :" $(wc -l _2x-right-full.txt); md5sum tts.txt > _err-msg.md5; lexxerr=1
elif [[ -e _2x-right-full.txt ]]; then rm _2x-right-full.txt; fi

if [[ $lexxerr -eq 1 ]]; then
       	printf '\e[31;1m%s\e[0m \e[33m%s \e[31;1m%s\e[0m \e[33m%s\e[0m\n' "Обнаружены ошибки словаря lexx! Исправьте файл:" "tts.txt" "и снова запустите" "./check-lexx.sh!";	exit 1;
elif [[ -s _err-msg.md5 ]]; then rm _err-msg.md5; fi;

# Выполняем проверку вспомогательных файлов из ./get-words.sh
if [[ $wdb -eq 1 ]]; then
	printf '\e[36m%s \e[32m%s ' "WDB:" "старый" 
else
   #zcat scriptdb/wordbase0.gz | sed -r "s/([^_]=).+$/\1/g; s/^.+-.+\n//g" | gzip > scriptaux/wdb0.gz
	printf '\e[36m%s \e[93m%s ' "WDB:" "новый" 
	md5sum scriptdb/wordbase0.gz > scriptaux/zwdb.md5; fi

if [[ $lexxdb -eq 1 ]]; then
	printf '\e[36m%s \e[32m%s ' "GW:" "старые"
else
        # Служебный список поисковых строк из базы lexx
        zgrep -Pv "_.+=$" scriptaux/tts.pat.gz | gzip > scriptaux/tts-dq.pat.gz
        zgrep -P "_.+=$"  scriptaux/tts.pat.gz | gzip > scriptaux/tts-si.pat.gz
        sed -r 's/^\" /_/g; s/^([^_r"]+)/_\1/g; s/^\"//g' tts.txt | gzip > scriptaux/tts0.txt.gz
        ## паттерны известных и исключений в lexx
        cat scriptaux/tts.pat.gz scriptdb/exclusion.pat.gz > scriptaux/lexx.pat.gz
       	printf '%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n' X1Ъ X0Ъ X3Ъ X4Ъ X5Ъ X6Ъ X8Ъ X7Ъ ъъъ ЪЪЪ | gzip -c >> scriptaux/lexx.pat.gz

	md5sum tts.txt scriptdb/exclusion.pat.gz scriptaux/tts.pat.gz scriptaux/tts-dq.pat.gz scriptaux/tts-si.pat.gz \
		scriptaux/tts0.txt.gz scriptaux/lexx.pat.gz scriptaux/_tts-noq.txt.gz scriptaux/_4awk-dq-rules.txt.gz > scriptaux/zlexxdb.md5
	printf '\e[36m%s \e[93m%s ' "GW:" "новые"
fi

#if [[ -s zndb.md5 ]] && [[ -z $(grep "get-words.sh" zndb.md5) ]]; then rm zndb.md5 ; fi
if [[ $ndb -eq 1 ]]; then
       	printf '\e[36m%s \e[32m%s ' "NDB:" "старые"
else
	sed -r 's/=.+$/=/g' <(zcat scriptdb/namebase0.txt.gz)      | gzip > scriptaux/namebase0.pat.gz
	sed -r 's/=.+$/=/g' <(zcat scriptdb/nameoverride.txt.gz)   | gzip > scriptaux/override.pat.gz
	sed -r 's/_(.+)=.+$/_\l\1=/g' <(zcat scriptdb/nomo.txt.gz) | sort -u | gzip > scriptaux/nomo.pat.gz
	zcat scriptaux/namebase0.pat.gz scriptaux/override.pat.gz scriptaux/nomo.pat.gz | sort -u | gzip > scriptaux/names-all.pat.gz
	zgrep -Fof <(zcat scriptaux/tts.pat.gz) scriptaux/nomo.pat.gz    | sort -u | gzip > scriptaux/ttspat.nam.gz
	zgrep -Ff  <(zcat scriptaux/ttspat.nam.gz) scriptaux/tts0.txt.gz | sort -u | gzip > scriptaux/tts0.nam.gz
        md5sum tts.txt scriptdb/namebase0.txt.gz scriptdb/nameoverride.txt.gz scriptdb/nomo.txt.gz scriptaux/namebase0.pat.gz \
		scriptaux/override.pat.gz scriptaux/nomo.pat.gz scriptaux/names-all.pat.gz scriptaux/ttspat.nam.gz scriptaux/tts0.nam.gz > scriptaux/zndb.md5
       	printf '\e[36m%s \e[93m%s ' "NDB:" "новые"
fi

# Выполняем проверку вспомогательных файлов из ./momo.sh

#if [[ -s zaomo.md5 ]] && [[ -z $(grep "momo.sh" zaomo.md5) ]]; then rm zaomo.md5; fi
if [[ $aomo -eq 1 ]]; then
       	printf '\e[36m%s \e[32m%s ' "MOM:" "старые"
else
	sed -r "s/=.+$/=/g" <(zcat scriptdb/mano-uc0.txt.gz) | gzip > scriptaux/mano-uc.pat.gz
	sed -r "s/=.+$/=/g" <(zcat scriptdb/mano-lc0.txt.gz) | gzip > scriptaux/mano-lc.pat.gz
	zgrep -Fof <(zcat scriptaux/tts.pat.gz) scriptaux/mano-lc.pat.gz | gzip > scriptaux/ttspat.mant.gz
	sed -r 's/_(.)/_\l\1/' <(zcat scriptaux/mano-uc.pat.gz) | grep -Fof <(zcat scriptaux/tts.pat.gz) | gzip >> scriptaux/ttspat.mant.gz
	zcat scriptaux/ttspat.mant.gz | sort -u | gzip > scriptaux/ttspat.man.gz
	rm scriptaux/ttspat.mant.gz
	zgrep -Ff <(zcat scriptaux/ttspat.man.gz) scriptaux/tts0.txt.gz | sort -u | gzip > scriptaux/tts0.man.gz

       	printf '\e[36m%s \e[93m%s ' "MOM:" "новые"
	md5sum tts.txt scriptdb/mano-uc0.txt.gz scriptaux/mano-uc.pat.gz scriptdb/mano-lc0.txt.gz scriptaux/mano-lc.pat.gz scriptaux/ttspat.man.gz \
	       scriptaux/tts0.man.gz scriptdb/omo-index.sed > scriptaux/zaomo.md5
fi

# Выполняем проверку вспомогательных файлов из ./yofik.sh

#if [[ -s zjofik.md5 ]] && [[ -z $(grep "yofik.sh" zjofik.md5) ]]; then rm zjofik.md5; fi
if [[ $jofik -eq 1 ]]; then
       	printf '\e[36m%s \e[32m%s ' "YOF:" "старые"
else
	sed -r "s/=.+$/=/g" <(zcat scriptdb/yodef0.txt.gz)   | gzip > scriptaux/yodef0.pat.gz
	sed -r "s/=.+$/=/g" <(zcat scriptdb/yodef1.txt.gz)   | gzip > scriptaux/yodef1.pat.gz
	sed -r "s/=.+$/=/g" <(zcat scriptdb/yomo-lc0.txt.gz) | gzip > scriptaux/yomo-lc0.pat.gz
	sed -r "s/=.+$/=/g" <(zcat scriptdb/yomo-uc0.txt.gz) | gzip > scriptaux/yomo-uc0.pat.gz
	sed -r "s/=.+$/=/g" scriptdb/yolc.txt > scriptaux/yolc.pat
	zgrep -Fof <(zcat scriptaux/tts.pat.gz) scriptaux/yomo-lc0.pat.gz > scriptaux/ttspat.yoyt
	sed -r 's/_(.)/_\l\1/' <(zcat scriptaux/yomo-uc0.pat.gz) | grep -Fof <(zcat scriptaux/tts.pat.gz) >> scriptaux/ttspat.yoyt
	grep -Fof <(zcat scriptaux/tts.pat.gz) scriptaux/yolc.pat >> scriptaux/ttspat.yoyt
    sort -u scriptaux/ttspat.yoyt | gzip > scriptaux/ttspat.yoy.gz
	rm scriptaux/ttspat.yoyt
	zgrep -Ff <(zcat scriptaux/ttspat.yoy.gz) scriptaux/tts0.txt.gz | sort -u | gzip > scriptaux/tts0.yoy.gz
       	printf '\e[36m%s \e[93m%s ' "YOF:" "новые"
	md5sum tts.txt scriptdb/yodef0.txt.gz scriptaux/yodef0.pat.gz scriptdb/yodef1.txt.gz scriptaux/yodef1.pat.gz scriptdb/yomo-lc0.txt.gz scriptaux/yomo-lc0.pat.gz \
           scriptdb/yodef.awk scriptdb/yomo-uc0.txt.gz scriptaux/yomo-uc0.pat.gz scriptaux/tts.pat.gz scriptaux/tts0.txt.gz scriptaux/ttspat.yoy.gz scriptaux/tts0.yoy.gz \
           scriptdb/yolc.txt scriptaux/yolc.pat > scriptaux/zjofik.md5
fi

printf '\e[32;4;1m%s\e[0m\n' "Всё ОК!"

# Проверка баз имён на обрабатываемость основным словарём

zgrep -Ff  <(zcat scriptaux/tts.pat.gz) scriptdb/namebase0.txt.gz    | sort > _err_namebase0.txt
zgrep -Fvf <(zcat scriptaux/tts.pat.gz) scriptdb/nameoverride.txt.gz | sort > _err_nameoverride.txt
zgrep "'" scriptaux/namebase0.pat.gz >> _err_namebase0.txt
zgrep "'" scriptaux/override.pat.gz  >> _err_nameoverride.txt

zgrep -Ff <(zcat scriptaux/mano-uc.pat.gz  | sed -r "s/_(.)/_\l\1/g") scriptdb/namebase0.txt.gz | grep -Fvf <(zcat scriptaux/nomo.pat.gz) >  _omo_namebase0_err.txt
zgrep -Ff <(zcat scriptaux/yomo-uc0.pat.gz | sed -r "s/_(.)/_\l\1/g") scriptdb/namebase0.txt.gz | grep -Fvf <(zcat scriptaux/nomo.pat.gz) >> _omo_namebase0_err.txt
zgrep -Ff <(zcat scriptaux/nomo.pat.gz) scriptdb/namebase0.txt.gz | sort >> _omo_namebase0_err.txt

if [[ -s _omo_namebase0_err.txt ]]; then sort -u -o _omo_namebase0_err.txt _omo_namebase0_err.txt; fi

zgrep -Ff <(zcat scriptaux/mano-uc.pat.gz  | sed -r "s/_(.)/_\l\1/g") scriptdb/nameoverride.txt.gz | grep -Fvf <(zcat scriptaux/nomo.pat.gz) >  _omo_nameoverride_err.txt
zgrep -Ff <(zcat scriptaux/yomo-uc0.pat.gz | sed -r "s/_(.)/_\l\1/g") scriptdb/nameoverride.txt.gz | grep -Fvf <(zcat scriptaux/nomo.pat.gz) >> _omo_nameoverride_err.txt
zgrep -Ff <(zcat scriptaux/nomo.pat.gz) scriptdb/nameoverride.txt.gz | sort >> _omo_nameoverride_err.txt

if [[  -s _omo_nameoverride_err.txt ]]; then sort -u -o _omo_nameoverride_err.txt _omo_nameoverride_err.txt; fi

if [[ -s _err_namebase0.txt ]]; then printf '\e[93m%s \e[36m%3s \e[93m%s \e[33m%s\e[0m\n' \
	"ВНИМАНИЕ:" "имена в базе обрабатываются словарём lexx:" $(wc -l _err_namebase0.txt); else rm _err_namebase0.txt; fi
if [[ -s _err_nameoverride.txt ]]; then printf '\e[93m%s \e[36m%3s \e[93m%s \e[33m%s\e[0m\n' \
	"ВНИМАНИЕ:" "в базе override слов, не в словаре lexx:" $(wc -l _err_nameoverride.txt); else rm _err_nameoverride.txt; fi
if [[ -s _omo_namebase0_err.txt ]]; then printf '\e[93m%s \e[36m%3s \e[93m%s \e[33m%s\e[0m\n' \
	"ВНИМАНИЕ:" "в базе имён найдены омографы:" $(wc -l _omo_namebase0_err.txt); else rm _omo_namebase0_err.txt; fi
if [[ -s _omo_nameoverride_err.txt ]]; then printf '\e[93m%s \e[36m%3s \e[93m%s \e[33m%s\e[0m\n' \
	"ВНИМАНИЕ:" "в базе override найдены омографы:" $(wc -l _omo_nameoverride_err.txt); else rm _omo_nameoverride_err.txt; fi

# Cозданиe локального словаря. Работает только при сообщении скрипту имени файла книги. Например:
# ./check-lexx.sh book.fb2

if [[ -s "$book" ]]; then
	./get-words.sh "$book" -old
fi
