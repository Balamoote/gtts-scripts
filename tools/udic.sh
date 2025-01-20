#/bin/bash
# Скрипт для поиска по словарю. Требует наличия в директории файла словаря.
# https://github.com/Balamoote/gtts-dic 
# Истользование:
#	./dic.sh ^дерево де - искать по слову и ДОПОЛНИТЕЛЬНО вывести словоформы, где ударение НЕ падает на "де"
#	./dic.sh дерево  - поиски по части слова, без поиска по ударению
# Последняя версия файла тут: https://github.com/Balamoote/gtts-scripts 

grepper="rg -z"
#grepper="zgrep"
wrd=$1
str=$2
twid=$(tput cols)
if [[ $twid -lt 67 ]]; then
	pad=$((($twid/2)-1))
else
	pad=31
fi

printf '\e[32m%s \e[96m%s \e[93m%s \e[96m%s\e[0m\n' "Looking up:" ">>>" $wrd "<<<"

# Ударения отмечены знаком ударения и цветом или только цветом

if [[ -z "$str" ]]; then
$grepper "$wrd" scriptdb/stress_uni.gz scriptdb/stress_x.gz scriptdb/stress_yo.gz |\
  sed -r "s/:_/ /;
          s:scriptdb/::g" |\
    sed "s/.'/`printf "\e[32m&\e[0m"`/g" | sed "s/'/\xcc\x81/g" | \
	awk -v pad=$pad -F"[ =]" '{format = "%-" pad "s %-" pad "s %s\n"; printf(format, $2, $3, $1)}';
	printf '\e[91m%s\e[0m\n' "==>> No variants args passed."
else
	printf '\e[91m%s \e[96m%s \e[92m%s \e[96m%s \e[93m%s \e[96m%s\e[0m\n' "Variants:" "NOT >>>" $str\' "<<< IN >>>" $wrd "<<<"

$grepper "$wrd" scriptdb/stress_uni.gz scriptdb/stress_x.gz scriptdb/stress_yo.gz |\
  sed "s/:_/ /;
          s:scriptdb/::g" |\
  grep -v $str\' | sed "s/.'/`printf "\e[91m&\e[0m"`/g" | sed "s/'/\xcc\x81/g" | \
	awk -v pad=$pad -F "[ =]" '{format = "%-" pad "s %-" pad "s %s\n"; printf(format, $2, $3, $1)}';

	printf '\e[95m%s\e[0m\n' "==>> end of variants!"
fi


