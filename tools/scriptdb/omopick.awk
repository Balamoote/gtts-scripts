# Подпрограмма отбора омографов из общего списка регулярок для конктретной книги.
# При вызове требует задания переменных:
#   tmpdir - путь, куда пишется локальный sed-скрипт
#   rexfile - путь к базе регексов (списку регулярок)
# Последняя версия файла находится тут: https://github.com/Balamoote/gtts-scripts
function readfile(file,    tmp, save_rs) { # Читаем файл целиком в скаляр
         save_rs = RS; RS = "^$"; getline tmp < file; close(file); RS = save_rs; return tmp }

BEGIN {	sedfile = tmpdir"/book-index.sed"
    rexlen = split(readfile(rexfile), rexrules, "### ");
    muniq = "[\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
    RS = save_rs;
    RS = "[^АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]" } {

    wrd = tolower($0);
    if ( gsub( muniq, "", wrd) == 0 ) { bookwords[wrd]++ };

} END { RS = save_rs;
mu       = "#_MULTI_#"; bookwords[mu]="";		             # добавление мультислова
startsed = sprintf("%s%s", "### ", rexrules[2]) ; 	     # заголовок
endsed   = sprintf("%s%s", "### ", rexrules[rexlen-1]) ; # завершающие

delete rexrules[1]; delete rexrules[2]; delete rexrules[rexlen]; delete rexrules[rexlen-1]

for ( r in rexrules )	{
    split(rexrules[r], rexentry, " !_#_!");
    if ( rexentry[1] in bookwords ) { booksed[sprintf("%s%s", "### ", rexrules[r])]++ };
}
for (i in booksed) { mainsed = mainsed sprintf( "%s", i ) }; 

outblock = startsed mainsed endsed;
printf outblock > sedfile;
for (j in bookwords) { printf ( "%s\n", j ) > "wrd-list.txt" }; 
}
