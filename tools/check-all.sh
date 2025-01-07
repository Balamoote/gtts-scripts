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
			"Использование:" "./check-all.sh" "или" "./check-lexx.sh [fa|fg|fy|fm]"; fi ;;
esac; fi

# Массив со списком обязательных файлов
pack="scriptdb/automo.gz scriptdb/awx/beautify.awk scriptdb/class.list.gz scriptdb/classes.awk scriptdb/cstauto.awk scriptdb/cstring.awk scriptdb/defunct.awk \
      scriptdb/deomo.awk scriptdb/demorphy.awk scriptdb/dic_cust.gz scriptdb/dic_gl.gz scriptdb/dic_prl.gz scriptdb/dic_prq.gz scriptdb/dic_rest.gz \
      scriptdb/dic_suw.gz scriptdb/exclusion.pat.gz scriptdb/fb2 scriptdb/functions.awk scriptdb/gw_caplists.awk scriptdb/hclean.sh scriptdb/ist.gz \
      scriptdb/main.awk scriptdb/mano-lc.txt.gz scriptdb/mano-uc.txt.gz scriptdb/namebase.txt.gz scriptdb/namedef.awk scriptdb/stress_a.gz scriptdb/stress_yo.gz \
      scriptdb/nomo.txt.gz scriptdb/omo-index.sed scriptdb/omo_list.phy.gz scriptdb/omoid.me scriptdb/omoid_auto.gz scriptdb/omoid_flat.gz scriptdb/omoid_ini.gz \
      scriptdb/omoid_pa_ini.gz scriptdb/preview.awk scriptdb/ruac.py scriptdb/rulg_all.py scriptdb/rulg_omo.py scriptdb/settings.ini scriptdb/dix_prq.gz \
      scriptdb/vsevso.awk scriptdb/stress_uni.gz scriptdb/yodef.awk scriptdb/yodef.txt.gz scriptdb/yolc.txt.gz scriptdb/yomo-lc.txt.gz \
      scriptdb/yomo-uc.txt.gz scriptdb/ext/x4707.awk scriptdb/ext/x4709.awk scriptdb/dik_prop.gz scriptdb/cstrings.gz scriptdb/stress_b.gz"
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


# Выполняем проверку вспомогательных файлов из ./get-words.sh
if [[ $stu -eq 1 ]]; then
	printf '\e[36m%s \e[32m%s ' "STU:" "старый" 
else
	sed -r 's/=.+$/=/g' <(zcat scriptdb/stress_uni.gz scriptdb/stress_a.gz scriptdb/stress_b.gz scriptdb/stress_yo.gz) |sort -u| gzip > scriptaux/stress.pat.gz
	printf '\e[36m%s \e[93m%s ' "STU:" "новый" 
	md5sum scriptdb/stress_uni.gz scriptdb/stress_a.gz scriptdb/stress_b.gz scriptdb/stress_yo.gz scriptaux/stress.pat.gz > scriptaux/zstu.md5; fi

if [[ $ndb -eq 1 ]]; then
       	printf '\e[36m%s \e[32m%s ' "NDB:" "старые"
else
	sed -r 's/=.+$/=/g' <(zcat scriptdb/namebase.txt.gz) | gzip > scriptaux/namebase.pat.gz
	sed -r 's/_(.+)=.+$/_\l\1=/g' <(zcat scriptdb/nomo.txt.gz) | sort -u | gzip > scriptaux/nomo.pat.gz
	zcat scriptaux/namebase.pat.gz scriptaux/nomo.pat.gz | sort -u | gzip > scriptaux/names-all.pat.gz
  md5sum scriptdb/namebase.txt.gz scriptdb/nomo.txt.gz scriptaux/namebase.pat.gz scriptaux/nomo.pat.gz scriptaux/names-all.pat.gz > scriptaux/zndb.md5
  printf '\e[36m%s \e[93m%s ' "NDB:" "новые"
fi

if [[ $dic -eq 1 ]]; then
       	printf '\e[36m%s \e[32m%s ' "DIC:" "старые"
else
  zcat scriptdb/dic_*.gz | awk '{ print "_" $1 "=" }' | sort -u | gzip > scriptaux/dic.pat.gz
  md5sum scriptaux/dic.pat.gz > scriptaux/zdic.md5
  printf '\e[36m%s \e[93m%s ' "DIC:" "новые"
fi

# Выполняем проверку вспомогательных файлов из ./momo.sh

if [[ $aomo -eq 1 ]] && [[ $tst -eq 1 ]]; then
       	printf '\e[36m%s \e[32m%s ' "MOM:" "старые"
else
	sed -r "s/=.+$/=/g"                  <(zcat scriptdb/mano-lc.txt.gz)                                 |gzip > scriptaux/mano-lc.pat.gz
  sed -r "s/_(.)([^=]+=).+$/_\u\1\2/g" <(zcat scriptdb/mano-lc.txt.gz scriptdb/mano-uc.txt.gz) |sort -u|gzip > scriptaux/mano-uc.pat.gz
  sed -r "s/^(_[^=]+=).+$/\U\1/g"      <(zcat scriptdb/mano-lc.txt.gz scriptdb/mano-uc.txt.gz) |sort -u|gzip > scriptaux/mano-cc.pat.gz
  awk -f scriptdb/awx/capomo.awk       <(zcat scriptdb/mano-lc.txt.gz scriptdb/mano-uc.txt.gz) |sort -u|gzip > scriptaux/mano-ca.pat.gz

  ./testrule.sh > /dev/null

  printf '\e[36m%s \e[93m%s ' "MOM:" "новые"
  md5sum scriptdb/mano-uc.txt.gz scriptaux/mano-uc.pat.gz scriptdb/mano-lc.txt.gz scriptaux/mano-lc.pat.gz \
         scriptdb/omo-index.sed scriptaux/mano-cc.pat.gz scriptaux/mano-ca.pat.gz > scriptaux/zaomo.md5
fi

# Выполняем проверку вспомогательных файлов из ./yofik.sh

if [[ $jofik -eq 1 ]] && [[ $yod -eq 1 ]]; then
       	printf '\e[36m%s \e[32m%s ' "YOF:" "старые"
else
	sed -r "s/=.+$/=/g" <(zcat scriptdb/yodef.txt.gz)  | gzip > scriptaux/yodef.pat.gz
	sed -r "s/=.+$/=/g" <(zcat scriptdb/yomo-lc.txt.gz) | gzip > scriptaux/yomo-lc.pat.gz
  sed -r "s/=.+$/=/g" <(zcat scriptdb/yomo-lc.txt.gz scriptdb/yomo-uc.txt.gz) | sed -r "s/_(.)/_\u\1/g" |sort -u| gzip > scriptaux/yomo-uc.pat.gz
  sed -r "s/=.+$/=/g" <(zcat scriptdb/yolc.txt.gz)    | gzip > scriptaux/yolc.pat.gz
  sed -r "s/^(_[^=]+=).+$/\U\1/g" <(zcat scriptdb/yomo-lc.txt.gz scriptdb/yomo-uc.txt.gz) |sort -u| gzip > scriptaux/yomo-cc.pat.gz

  echo "" | awk -vindb="scriptdb/" -vinax="scriptaux/" -f scriptdb/yodef.awk >/dev/null

  printf '\e[36m%s \e[93m%s ' "YOF:" "новые"
	md5sum scriptdb/yodef.txt.gz scriptaux/yodef.pat.gz scriptdb/yomo-lc.txt.gz scriptaux/yomo-lc.pat.gz scriptdb/yodef.awk scriptdb/yomo-uc.txt.gz \
         scriptaux/yomo-uc.pat.gz scriptdb/yolc.txt.gz scriptaux/yolc.pat.gz scriptaux/yomo-cc.pat.gz > scriptaux/zjofik.md5
fi

printf '\e[32;4;1m%s\e[0m\n' "Всё ОК!"


