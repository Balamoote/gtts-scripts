#!/bin/bash
# Скрипт проверки целостности пакета и подготовки вспомогательных файлов.
# Последняя версия файла тут: https://github.com/Balamoote/gtts-scripts 
# Требует: bash, sed, grep, awk, uniq, sort, bc т.е. стандартный набор утилит, который присутствует на большинстве linux-систем.

# Варианты запуска: в консоли Linux/Mac, Cygwin под Windows, Termux под Android

# После завершения работы скрипта выдается отчет, подробности о ошибках можно посмотреть в файлах _*.txt

# Использование: запустить ./check-all.sh 
#set -e
export LC_COLLATE=C


if [[ ! -d scriptaux ]]; then mkdir scriptaux; fi

if [[ ! -z "$1" ]]; then
case "$1" in
	fa |--fall ) # Принудительно заново создать все вспомогательные файлы для скриптов
       [[ -d scriptaux ]] && rm -rf scriptaux/ && mkdir scriptaux;;
	fg | --fgwrd ) # Перепроверить вспомогательные файлы get-words.sh
		if [[ -s scriptaux/zndb.md5 ]]; then rm scriptaux/zndb.md5; fi ;;
	fy | --fyofik ) # Перепроверить вспомогательные файлы yofik.sh
		if [[ -s scriptaux/zjofik.md5 ]]; then rm scriptaux/zjofik.md5; fi ;;
	fm | --fmomo ) # Перепроверить вспомогательные файлы momo.sh
		if [[ -s scriptaux/zaomo.md5 ]]; then rm scriptaux/zaomo.md5; fi ;;
	*) # Проверить, существует ли файл книги
		if [[ -s "$1" ]]; then book="$1"
		else printf '\e[35m%s \e[93m%s \e[35m%s \e[93m%s \e[93m%s \e[35m%s\e[0m\n' \
			"Использование:" "./check-all.sh" "или" "./check-all.sh [fa|fg|fy|fm]"; fi ;;
esac; fi

# Массив со списком обязательных файлов
pack="scriptdb/automo.gz scriptdb/awx/beautify.awk scriptdb/class.list.gz scriptdb/classes.awk scriptdb/cstauto.awk scriptdb/cstring.awk scriptdb/defunct.awk \
      scriptdb/deomo.awk scriptdb/demorphy.awk scriptdb/dic_cust.gz scriptdb/dic_gl.gz scriptdb/dic_prl.gz scriptdb/dic_prq.gz scriptdb/dic_rest.gz \
      scriptdb/dic_suw.gz scriptdb/fb2 scriptdb/functions.awk scriptdb/awx/gw_caplists.awk scriptdb/hclean.sh scriptdb/ist.gz \
      scriptdb/main.awk scriptdb/mano-lc.gz scriptdb/mano-uc.gz scriptdb/namebase.gz scriptdb/namedef.awk scriptdb/stress_x.gz scriptdb/yoyo_alt.gz \
      scriptdb/omo-index.sed scriptdb/omo_list.phy.gz scriptdb/omoid.me scriptdb/omoid_auto.gz scriptdb/omoid_flat.gz scriptdb/omoid_ini.gz \
      scriptdb/omoid_pa_ini.gz scriptdb/preview.awk scriptdb/ruac.py scriptdb/rulg_all.py scriptdb/rulg_omo.py scriptdb/settings.ini scriptdb/dix_prq.gz \
      scriptdb/vsevso.awk scriptdb/unistress.gz scriptdb/yodef.awk scriptdb/yodef.gz \
      scriptdb/ext/x4707.awk scriptdb/ext/x4709.awk scriptdb/dik_prop.gz scriptdb/cstrings.gz"
read -a minpack <<< $pack

# Проверка не потерялось ли чего
for f in "${minpack[@]}"; do
	if [[ ! -s $f ]]; then printf '\e[31;5;1m%s\e[0m \e[93m%s\e[0m\n' "Отсутствует файл:" $f; exit 1; fi; done

# Проверка по md5: zaomo.md5 zjofik.md5 zndb.md5 zstu.md5 . Назначаем "1", если ОК, и "0"", если нужно пересоздать.
if [[ -s scriptaux/zaomo.md5   ]] && md5sum -c --status scriptaux/zaomo.md5   >/dev/null 2>&1; then aomo=1;  else aomo=0  ; fi
if [[ -s scriptaux/zjofik.md5  ]] && md5sum -c --status scriptaux/zjofik.md5  >/dev/null 2>&1; then jofik=1; else jofik=0 ; fi
if [[ -s scriptaux/zndb.md5    ]] && md5sum -c --status scriptaux/zndb.md5    >/dev/null 2>&1; then ndb=1;   else ndb=0   ; fi
if [[ -s scriptaux/zstu.md5    ]] && md5sum -c --status scriptaux/zstu.md5    >/dev/null 2>&1; then stu=1;   else stu=0   ; fi
if [[ -s scriptaux/zdic.md5    ]] && md5sum -c --status scriptaux/zdic.md5    >/dev/null 2>&1; then dic=1;   else dic=0   ; fi
if [[ -s scriptaux/yodef.md5   ]] && md5sum -c --status scriptaux/yodef.md5   >/dev/null 2>&1; then yod=1;   else yod=0   ; fi
if [[ -s scriptaux/classes.md5 ]] && md5sum -c --status scriptaux/classes.md5 >/dev/null 2>&1; then tst=1;   else tst=0   ; fi


# Выполняем проверку вспомогательных файлов из ./momo.sh

if [[ $aomo -eq 1 ]] && [[ $tst -eq 1 ]]; then
       	printf '\e[36m%s \e[32m%s ' "MOM:" "старые"
else
  yod=0
  sed -r "s/=.+$/=/g" <(zcat scriptdb/malc.gz) | gzip > scriptaux/malc.pat.gz
  # Формируем в scriptaux/ файлы mano-lc.pat.gz mano-uc.pat.gz mano-cc.pat.gz mano-ca.pat.gz
  awk -vomtype="mano" -f scriptdb/awx/omopat.awk

  ./testrule.sh > /dev/null

  md5sum scriptdb/mano-uc.gz scriptaux/mano-uc.pat.gz scriptdb/mano-lc.gz scriptaux/mano-lc.pat.gz scriptdb/malc.gz \
         scriptdb/omo-index.sed scriptaux/mano-cc.pat.gz scriptaux/mano-ca.pat.gz scriptaux/malc.pat.gz > scriptaux/zaomo.md5
  printf '\e[36m%s \e[93m%s ' "MOM:" "новые"
fi

# Выполняем проверку вспомогательных файлов из ./get-words.sh
if [[ $stu -eq 1 ]]; then
	printf '\e[36m%s \e[32m%s ' "STU:" "старый" 
else
# sed -r 's/=.+$/=/g' <(zcat scriptdb/unistress.gz scriptdb/stress_x.gz scriptdb/yoyo_alt.gz) |sort -u| gzip > scriptaux/unistress.pat.gz
  sed -r 's/=.+$/=/g' <(zcat scriptdb/unistress.gz scriptdb/yoyo.gz scriptdb/yoyo_alt.gz) |sort -u| gzip > scriptaux/unistress.pat.gz
  printf '\e[36m%s \e[93m%s ' "STU:" "новый" 
  md5sum scriptdb/unistress.gz scriptdb/stress_x.gz scriptdb/yoyo.gz scriptdb/yoyo_alt.gz scriptaux/unistress.pat.gz > scriptaux/zstu.md5; fi

if [[ $ndb -eq 1 ]]; then
       	printf '\e[36m%s \e[32m%s ' "NDB:" "старые"
else
	sed -r 's/=.+$/=/g' <(zcat scriptdb/namebase.gz) | gzip > scriptaux/namebase.pat.gz
# sed -r 's/(_.+=).+$/\1/g' <(zcat scriptdb/mano-uc.gz) | sort -u | gzip > scriptaux/mano-uc.pat.gz
	zcat scriptaux/namebase.pat.gz scriptaux/mano-uc.pat.gz | sort -u | gzip > scriptaux/names-all.pat.gz
  md5sum scriptdb/namebase.gz scriptaux/namebase.pat.gz scriptaux/names-all.pat.gz > scriptaux/zndb.md5
  printf '\e[36m%s \e[93m%s ' "NDB:" "новые"
fi

if [[ $dic -eq 1 ]]; then
       	printf '\e[36m%s \e[32m%s ' "DIC:" "старые"
else
  zcat scriptdb/dic_*.gz | awk '{ print "_" $1 "=" }' | sort -u | gzip > scriptaux/dic.pat.gz
  md5sum scriptaux/dic.pat.gz > scriptaux/zdic.md5
  printf '\e[36m%s \e[93m%s ' "DIC:" "новые"
fi

# Выполняем проверку вспомогательных файлов из ./yofik.sh

if [[ $jofik -eq 1 ]] && [[ $yod -eq 1 ]]; then
       	printf '\e[36m%s \e[32m%s ' "YOF:" "старые"
else
	zcat scriptdb/yodef.gz | sed -r "s/=.+$/=/g" | gzip > scriptaux/yodef.pat.gz
  zgrep "ё"      scriptdb/mano-lc.gz           | gzip > scriptdb/yomo-lc.gz
  zgrep "ё"      scriptdb/mano-uc.gz           | gzip > scriptdb/yomo-uc.gz
# sed -r "s/=.+$/=/g" <(zcat scriptdb/yolc.gz)    | gzip > scriptaux/yolc.pat.gz

  # Формируем в scriptaux/ файлы yomo-lc.pat.gz yomo-uc.pat.gz yomo-cc.pat.gz yomo-ca.pat.gz
  awk -vomtype="yomo" -f scriptdb/awx/omopat.awk

  # Формируем в scriptdb/  : yoyo.gz yoyo_lc.gz
  #           в scriptaux/ : yoyo.pat.gz yoyo_lc.pat.gz yoye.pat.gz yoye_lc.pat.gz
  awk -f scriptdb/awx/yopat.awk
  sed -r "s/=.+$/=/g" <(zcat scriptdb/yoyo_lc.gz) | gzip >> scriptaux/yolc.pat.gz

  # Создаём yodef.bin
  echo "" | awk -vindb="scriptdb/" -vinax="scriptaux/" -f scriptdb/yodef.awk >/dev/null

  printf '\e[36m%s \e[93m%s ' "YOF:" "новые"
	md5sum scriptdb/yodef.gz scriptaux/yodef.pat.gz scriptdb/yomo-lc.gz scriptaux/yomo-lc.pat.gz scriptdb/yodef.awk scriptdb/yomo-uc.gz \
         scriptaux/yomo-uc.pat.gz scriptdb/yolc.gz scriptaux/yolc.pat.gz scriptaux/yomo-cc.pat.gz scriptdb/yoyo.gz scriptdb/yoyo.gz \
         scriptaux/yoyo.pat.gz scriptaux/yoyo_lc.pat.gz scriptaux/yoye.pat.gz scriptaux/yoye_lc.pat.gz \
         > scriptaux/zjofik.md5
fi

printf '\e[32;4;1m%s\e[0m\n' "Всё ОК!"


