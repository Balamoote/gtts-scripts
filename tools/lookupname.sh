#!/bin/bash
# Скрипт для поиска имён во всех первичных базах (lexx и базы имён) и результатах работы скрипта ./get-names.sh
# ИСПОЛЬЗОВАНИЕ: ./lookupnames.sh имя
# Особенности: начало слова = _имя, ударение = и\'мя

zgrep -i "$1" [01][0-9]_*.list scriptdb/namebase.gz scriptdb/mano-uc.gz | \
	sed -r "s/^.+:/`printf "\e[33m&\e[0m"` /g" | sed -r "s/$1/`printf "\e[32;4m&\e[0m"`/g"

