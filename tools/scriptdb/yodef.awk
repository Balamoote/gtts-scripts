# Скрипт ёфикации однозначных случаев
# Последняя версия файла тут: https://github.com/Balamoote/gtts-scripts
@load "rwarray"

function joinpat(array, seps, nuf,    rett, i, k) # Склеить строку обратно
                { rett = seps [0]; for (i=1; i<= nuf; i++) {rett = rett array[i] seps[i]}; return rett }

BEGIN {

    patword = "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb00-9]+"
    capword = "^[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ]+$"

 # Проверяем версию gawk, если меньше 5.2.1, то выключаем функции сохранения и восстановления массивов и переменных: базы тогда читаются всегда заново.
    redix=gawk52="42"
    cmd = "awk -Wversion | head -1"
    cmd|getline verheader; close(cmd)
    split(verheader, gnuawk, "[ .,]")
    if (gnuawk[1] == "GNU" && gnuawk[2] == "Awk" && gnuawk[3] >= 5 && gnuawk[4] >= 2 && gnuawk[5] >= 1) { gawk52 = 1 };
 # Если словари и этот скрипт не изменились и gawk>=5.2.1, восстановить состояние, иначе прочитать всё заново.
   if ( gawk52 == 1 ) {
    cmd   = "md5sum -c --status " inax "yodef.md5 >/dev/null 2>&1"
    redix = system(cmd); close(cmd);};

   yocache = inax "yodef.bin"

   if (redix == 0 && gawk52 == 1) { readall(yocache) } else {

   cmd = "zcat " indb "yodef0.txt.gz " indb "yodef1.txt.gz | sed -r 's/_(.)(.+)=(.)(.+)\\b/\\1\\2 \\3\\4 \\u\\1\\2 \\u\\3\\4/g'";
   while ((cmd|getline) > 0) {

         yodef[$1]=$2; yodef[$3]=$4;

   } close(cmd);
   cmd = "cat " indb "yolc.txt | sed -r 's/[_=]/ /g'";
   while ((cmd|getline) > 0) {

        yodef[$1]=$2;

   } close(cmd);

 # Записать состояние словарных массивов
  if (gawk52 == 1) { writeall(yocache) };
  cmd = "md5sum " indb "yodef.awk " inax "yodef.bin " indb "yodef0.txt.gz " indb "yodef1.txt.gz " indb "yolc.txt > " inax "yodef.md5"
  system(cmd); close(cmd);
   } #gnuawk

} {

 nf=patsplit($0, l, patword, sep);

 for (i=1; i<=nf; i++) {
    
    if ( l[i] ~ capword ) { lcf=tolower(l[i]); if ( lcf in yodef ) { l[i]=toupper(yodef[lcf]) }; }
    else { if ( l[i] in yodef ) { l[i]=yodef[l[i]] }; };
        
        }

 # вывести изменённую строку
 $0 = joinpat(l, sep, nf)
 print $0


}

