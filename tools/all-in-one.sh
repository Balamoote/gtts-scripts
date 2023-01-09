#!/bin/bash
# Модульный скрипт автоматической простановки ударений в книге. Только для голосового движка Гугл.
# Последняя версия файла тут: https://github.com/Balamoote/gtts-scripts 

# Использование: ./all-in-one.sh [1 ключ из списка ниже] book.fb2

# Cлужебные ключи ( --полный_ключ | -краткий_синоним = --test | -t )
# ----------------------------------------------------------------------------------------------------------------------------------------------
#  --test | -t  = выполнить проверку комплектности сборки: наличие всех необходимых файлов. (см. примечание 1)
#  --envi | -e  = проверка наличия всех необходимых пакетов системе
#  --help | -h  = вывести рекомендацию прочитать этот текст в этом скрипте

# Ключи обработки книги для чтения со словарем lexx (полным или частным) при помощи TTSLexx. Рекомендовано выбрать себе один из них.
# ----------------------------------------------------------------------------------------------------------------------------------------------
#  --chck | -c  = выполнить проверку основного словаря lexx (TTS.lexx) в формате txt (tts.txt)
#  --ldic | -l  = создать частный словарь lexx для книги book.fb2, шаблоны regex отсутствуют частично или полностью! (см. примечание 2)
#  --word | -g  = Собрать неизвестные слова и имена, словарь lexx НЕ проверять (см. примечание 3)
#  --name | -n  = проставить ударения в именах собственных, собрать неизвестные слова и имена, проверить словарь lexx (см. примечание 3)
#  --nald | -nl = проставить ударения в именах собственных, собрать неизвестные слова и имена, создать частный словарь, проверить lexx (ldic+name=nald)
#  --omog | -o  = проставить ударения в омографах в book.fb2 (включение скриптов внутри ./omofix.sh, см. примечание 4)
#  --naom | -no = проставить ударения в именах собственных и омографах в book.fb2 (name+omog=naom)
#  --ldon | -na = проставить ударения в именах собственных и омографах в book.fb2 и создать частный словарь (name+omog+ldic=ldon)

# Ключи обработки книги для чтения БЕЗ словаря lexx на стоковом движке гугла. Ключи ниже позволят книгу слушать, но читать ее будет еще сложно!
# ----------------------------------------------------------------------------------------------------------------------------------------------
#  --alna | -an = проставить ударения во всех известных из lexx словах книги, именах собственных и создать частный словарь lexx (all+name+ldic=alna)
#  --alin | -al = проставить ударения во всех известныз из lexx словах книги, именах собственных, омографах, и создать частный словарь (all+name+omog+ldic=alin)
#   (см. примечание 5) -- частный словарь создается автоматически, хотя использовать на обработанной книге смысла нет.

# Примеры использования:
#	./all-in-one.sh --test			или	./all-in-one.sh -t
#	./all-in-one.sh --name book.fb2		или	./all-in-one.sh -n book.fb2
#	./all-in-one.sh --alin book.fb2		или	./all-in-one.sh -ali book.fb2

#Примечания:
#Смотри файл README.all-in-one
#set -e
key="$1"
book="$2"
sedbook="$book".regex

#массив со списком ключей
#p="--test --envi --help --chck --ldic --word --name --nald --omog --naom --ldon --alna --alin -t -e -h -c -l -g -wo -n -nl -o -no -an -al"
#read -a param <<< $p

# Массив со списком обязательных файлов
pack="add2lexx.sh addnames.sh all-in-one.sh check-lexx.sh dic.sh get-words.sh lexx2txt.sh momo.sh omofix.sh scriptdb/omo-index.sed scriptdb/exclusion.pat.gz scriptdb/mano-lc0.txt.gz scriptdb/mano-uc0.txt.gz scriptdb/namebase0.txt.gz scriptdb/nameoverride.txt.gz scriptdb/omopick.awk scriptdb/preview.awk scriptdb/nomo.txt.gz scriptdb/vse.sed scriptdb/wordbase0.gz scriptdb/yodef0.txt.gz scriptdb/yodef1.txt.gz scriptdb/yomo-lc0.txt.gz scriptdb/yomo-uc0.txt.gz scriptdb/yomodef.sed scriptomo/00-on.sed scriptomo/01-yo.sed scriptomo/11-num.sed scriptomo/20-index.sed scriptomo/41-1_eo-ast.sed scriptomo/41-2_eo.sed scriptomo/99-fin.sed stripper.sh txt2lexx.sh yofik.sh"
read -a minpack <<< $pack

# Массив со списком системных утилит
ut="bash grep sed awk uniq sort dos2unix md5sum vim zcat zgrep gzip file tput bc"
read -a utils <<< $ut

# Проверка, не потерялось ли чего
for f in "${minpack[@]}"; do
	if [[ ! -s $f ]]; then 	key="--test"
	printf '\e[35m%s \e[93m%s\e[0m\n' "Чего-то не хватает! Запускаем:" "./all-in-one.sh --test"; fi; done

# Проверка, всё ли установлено
for u in "${utils[@]}"; do uu=$(command -v $u)
	if [[ -z $uu ]]; then key="--envi"
	printf '\e[35m%s \e[93m%s\e[0m\n' "Что-то не установлено! Запускаем:" "./all-in-one.sh --envi"; fi; done

# Проверка наличия tts.txt, отдельная!
if [[ ! -s tts.txt ]]; then printf '\e[35m%s \e[33m%s \e[35m%s \e[93m%s \e[35m%s\e[0m\n' \
	"Отсутствует файл" "tts.txt" "Дайте каманду" "./lexx2txt.sh TTS.lexx" ", чтобы его создать"; exit 0; fi

case $key in 
	--test | -t) # Проверка состава сборки
		printf '\e[32m%s\e[0m\n' "Проверка комплектности сборки:"; for f in "${minpack[@]}"; do if [[ -s $f ]]; then printf '\e[33m%-26s \e[32m%s%s\e[0m\n' $(ls -N $f) OK !
			else printf '\e[93;5;1m%s\e[0m \e[35m%s\e[0m\n' $f "Файл не найден или имеет нулевую длину! Восстановите его из архива!"; fi; done ;;
	--envi | -e) # Проверка системы
		for u in "${utils[@]}"; do uu=$(command -v $u); if [[ $uu != "" ]]; then printf '%s' $uu; printf ' \e[32m%s\e[0m\n' "OK!"
			else printf '\e[93;5;1m%s\e[0m \e[35m%s\e[0m\n' $u "Утилита не найдена. Установите её!"; fi; done ;;
	--help | -h) # Выводим краткую справку
		sed -n '2,36 s/^#//p' all-in-one.sh ;;
	--chck | -c) # Выполнить проверку словаря в формате txt
	    	if [[ -s tts.txt ]]; then ./check-lexx.sh
    		else printf '\e[35m%s \e[33m%s \e[35m%s \e[93m%s\e[35m%s\e[0m\n' "Отсутствует файл" "tts.txt" "Дайте каманду" "./lexx2txt.sh TTS.lexx" ", чтобы его создать."; fi ;;
	--ldic | -l) # Сделать частный словарь для книги
	    	if [[ -s "$book" ]]; then ./get-words.sh "$book" -ld
    		else printf '\e[35m%s \e[93m%s\e[0m\n' "Книга не задана или не существует. Использование:" "./all-in-one.sh --ldic book.fb2"; fi ;;
	--word | -w | -wo ) # Собрать неизвестные слова и имена
           	if [[ -s "$book" ]]; then ./check-lexx.sh && ./get-words.sh -wo "$book"
    		else printf '\e[35m%s \e[93m%s\e[0m\n' "Книга не задана или не существует. Использование:" "./all-in-one.sh --gena book.fb2"; fi ;;
	--name | -n | -g) # Проставить ударения в именах собственных, собрать неизвестные слова и имена
           	if [[ -s "$book" ]]; then ./check-lexx.sh && ./get-words.sh -fpx "$book"
    		else printf '\e[35m%s \e[93m%s\e[0m\n' "Книга не задана или не существует. Использование:" "./all-in-one.sh --name book.fb2"; fi ;;
	--nald | -nl) # =ldic+name вместе
           	if [[ -s "$book" ]]; then ./check-lexx.sh && ./get-words.sh -ld "$book"
    		else printf '\e[35m%s \e[93m%s\e[0m\n' "Книга не задана или не существует. Использование:" "./all-in-one.sh --nald book.fb2"; fi ;;
	--omog | -o) # Обработать омографы АВТОМАТИЧЕСКИ
    		if [[ -s "$book" ]]; then ./check-lexx.sh && ./omofix.sh "$book"
    		else printf '\e[35m%s \e[93m%s\e[0m\n' "Книга не задана или не существует. Использование:" "./all-in-one.sh --omog book.fb2"; fi ;;
	--naom | -no) # =omog+name вместе
    		if [[ -s "$book" ]]; then ./check-lexx.sh && ./get-words.sh "$book" && ./omofix.sh "$book"
    		else printf '\e[35m%s \e[93m%s\e[0m\n' "Книга не задана или не существует. Использование:" "./all-in-one.sh --naom book.fb2"; fi ;;
	--ldon | -na) # =ldic+name+omog вместе
           	if [[ -s "$book" ]]; then ./check-lexx.sh && ./get-words.sh "$book" -ld && ./omofix.sh "$book"
    		else printf '\e[35m%s \e[93m%s\e[0m\n' "Книга не задана или не существует. Использование:" "./all-in-one.sh --ldon book.fb2"; fi ;;
	--alna | -an) # =ldic+name+all_stress: частный словарь, имена с ударениями, ударения по всему тексту как в lexx, кроме омографов
           	if [[ -s "$book" ]]; then ./check-lexx.sh "$book" && ./get-words.sh "$book" -ld
    			printf '\e[32m%s\e[0m\n' "Расставляем ударения во всех словах книги..."
    			sed -i -rf "$book".sed "$book"; printf '\e[32m%s \e[33m%s\e[0m\n' "Обработка полностью закончена. Файл книги:" "$book"
    		else printf '\e[35m%s \e[93m%s\e[0m\n' "Книга не задана или не существует. Использование:" "./all-in-one.sh --alna book.fb2"; fi ;;
	--alin | -al) # =ldic+name+omog+all_stress вместе: частный словарь, имена с ударениями, ударения по всему тексту как в lexx, омографы
           	if [[ -s "$book" ]]; then ./check-lexx.sh "$book" && ./get-words.sh "$book" -ld && ./omofix.sh "$book"
		    	printf '\e[32m%s\e[0m\n' "\e[32mРасставляем ударения во всех словах книги...\e[0m"
			    sed -i -rf "$book".sed "$book"; printf '\e[32m%s \e[33m%s\e[0m\n' "Обработка полностью закончена. Файл книги:" "$book"
    		else printf '\e[35m%s \e[93m%s\e[0m\n' "Книга не задана или не существует. Использование:" "./all-in-one.sh --alin book.fb2"; fi ;;
	*)
    		printf '\e[36m%s \e[93m%s \e[36m%s \e[93m%s \e[36m%s\e[0m\n' \
			"Использование:" "./all-in-one.sh [параметр из списка] book.fb2" "или" "./all-in-one.sh -help" "-- справка."; exit 0; ;;
esac

