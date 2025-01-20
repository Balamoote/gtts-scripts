#/bin/bash
# Скрипт для поиска по словарю. Требует наличия в директории файла словаря.
# https://github.com/Balamoote/gtts-dic 
# Истользование:
#	./dic.sh ^дерево де - искать по слову и ДОПОЛНИТЕЛЬНО вывести словоформы, где ударение НЕ падает на "де"
#	./dic.sh дерево  - поиски по части слова, без поиска по ударению
# Последняя версия файла тут: https://github.com/Balamoote/gtts-scripts 

wrd=$1
str=$2
twid=$(tput cols)

#diccat="zcat scriptdb/wordbase0.gz"
diccat="zcat scriptdb/stress_uni.gz scriptdb/stress_x.gz"

if [[ $twid -lt 67 ]]; then
	pad=$((($twid/2)-1))
else
	pad=31
fi

printf '\e[32m%s \e[96m%s \e[93m%s \e[96m%s\e[0m\n' "Looking up:" ">>>" $wrd "<<<"

# Ударения отмечены знаком ударения и цветом или только цветом
$diccat | sed "s/^_//" | grep $wrd | sed "s/.'/`printf "\e[32m&\e[0m"`/g" | sed "s/'/\xcc\x81/g" | \
#zcat scriptdb/wordbase0.gz | sed "s/^_//" | grep $wrd | sed "s/.'/`printf "\e[32m&\e[0m"`/g" | sed "s/'//g" | \
	awk -v pad=$pad -F "[ =]" '{format = "%-" pad "s %s\n"; printf(format, $1, $2)}';

if [[ -z "$str" ]]; then
	printf '\e[91m%s\e[0m\n' "==>> No variants args passed."
else
	printf '\e[91m%s \e[96m%s \e[92m%s \e[96m%s \e[93m%s \e[96m%s\e[0m\n' "Variants:" "NOT >>>" $str\' "<<< IN >>>" $wrd "<<<"

# Ударения отмечены знаком ударения и цветом или только цветом
$diccat | sed "s/^_//" | grep $wrd | grep -v $str\' | sed "s/.'/`printf "\e[91m&\e[0m"`/g" | sed "s/'/\xcc\x81/g" | \
#zcat scriptdb/wordbase0.gz | sed "s/^_//" | grep $wrd | grep -v $str\' | sed "s/.'/`printf "\e[91m&\e[0m"`/g" | sed "s/'//g" | \
	awk -v pad=$pad -F "[ =]" '{format = "%-" pad "s %s\n"; printf(format, $1, $2)}';

	printf '\e[95m%s\e[0m\n' "==>> end of variants!"
fi


