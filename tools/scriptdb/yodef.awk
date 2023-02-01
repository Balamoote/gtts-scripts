# Скрипт ёфикации однозначных случаев
# Последняя версия файла тут: https://github.com/Balamoote/gtts-scripts
@load "rwarray"
@include "scriptdb/functions.awk"

BEGIN {
    PROCINFO["sorted_in"]="@ind_num_asc"

    patword = "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb00-9]+"
    fsword  = "[^АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
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
   cmd = "cat " indb "yolc.txt | sed -r 's/^_//g; s/=/ /g'";
   while ((cmd|getline) > 0) {

        yodef[$1]=$2;

   } close(cmd);

 # Записать состояние словарных массивов
  if (gawk52 == 1) { writeall(yocache) };
  cmd = "md5sum " indb "yodef.awk " inax "yodef.bin " indb "yodef0.txt.gz " indb "yodef1.txt.gz " indb "yolc.txt > " inax "yodef.md5"
  system(cmd); close(cmd);
   } #gnuawk

       # Всё с регистрами
       vsyo["все"]="всё";vsyo["Все"]="Всё";vsyo["ВСЕ"]="ВСЁ";

       # Омографы с относительно простыми правилами
       omoz["таки"];omoz["всем"]="всём";omoz["моем"]="моём";omoz["нем"]="нём";omoz["сем"]="сём";omoz["чем"]="чём";omoz["е"]="ё";omoz["припеку"]="припёку";omoz["черт"]="чёрт";
       omoz["Таки"];omoz["Всем"]="Всём";omoz["Моем"]="Моём";omoz["Нем"]="Нём";omoz["Сем"]="Сём";omoz["Чем"]="Чём";omoz["Е"]="Ё";omoz["Припеку"]="Припёку";omoz["Черт"]="Чёрт";
       omoz["ТАКИ"];omoz["ВСЕМ"]="ВСЁМ";omoz["МОЕМ"]="МОЁМ";omoz["НЕМ"]="НЁМ";omoz["СЕМ"]="СЁМ";omoz["ЧЕМ"]="ЧЁМ";omoz["Е"]="Ё";omoz["ПРИПЕКУ"]="ПРИПЁКУ";omoz["ЧЕРТ"]="ЧЁРТ";

       # Компоненты составных слов с ё
       cmpy["варено"]="варёно";cmpy["желто"]="жёлто";cmpy["зелено"]="зелёно";cmpy["пестро"]="пёстро";cmpy["твердо"]="твёрдо";cmpy["тепло"]="тёпло";cmpy["темно"]="тёмно";cmpy["черно"]="чёрно";
       cmpy["Варено"]="Варёно";cmpy["Желто"]="Жёлто";cmpy["Зелено"]="Зелёно";cmpy["Пестро"]="Пёстро";cmpy["Твердо"]="Твёрдо";cmpy["Тепло"]="Тёпло";cmpy["Темно"]="Тёмно";cmpy["Черно"]="Чёрно";
       cmpy["ВАРЕНО"]="ВАРЁНО";cmpy["ЖЕЛТО"]="ЖЁЛТО";cmpy["ЗЕЛЕНО"]="ЗЕЛЁНО";cmpy["ПЕСТРО"]="ПЁСТРО";cmpy["ТВЕРДО"]="ТВЁРДО";cmpy["ТЕПЛО"]="ТЁПЛО";cmpy["ТЕМНО"]="ТЁМНО";cmpy["ЧЕРНО"]="ЧЁРНО";

       trex["трех"]   ="трёх"   ;trex["Трех"]   ="Трёх"   ;trex["ТРЕХ"]   ="ТРЁХ"  ;
       qtrx["четырех"]="четырёх";qtrx["Четырех"]="Четырёх";qtrx["ЧЕТЫРЕХ"]="ЧЕТЫРЁХ";

   savefs = FS;
   FS = fsword;
} {
    num++; book[num] = $0;

    for ( i=1; i<=NF; i++ ) { ci = tolower($i);
        if ( ci in yodef && num != num00[$i] ) { yods[$i] = yods[$i] " " num; num00[$i] = num; continue };
        if ( $i in omoz  && num != num01[$i] ) { omos[$i] = omos[$i] " " num; num01[$i] = num; continue };
        if ( $i in cmpy  && num != num02[$i] ) { cmps[$i] = cmps[$i] " " num; num02[$i] = num; continue };
        if ( $i ~ /(^|десяти|дцати|сорока|исяти|ста|тысяче)трех\S/    && num != num03[$i] ) { Trex[$i] = Trex[$i] " " num; num03[$i] = num; continue };
        if ( $i ~ /(^|десяти|дцати|сорока|исяти|ста|тысяче)четырех\S/ && num != num04[$i] ) { qTrx[$i] = qTrx[$i] " " num; num04[$i] = num; continue };
        };
   }
END {
FS = savefs
    for(wrd in yods ){wln=split(yods[wrd],yolin," ");for(y=1;y<=wln;y++){b=strtonum(yolin[y]);nf=splitline(book[b]);
    for (i=1; i<=nf; i++) {
    
       if ( l[i] ~ capword ) { lcf=tolower(l[i]); if ( lcf in yodef ) { l[i]=toupper(yodef[lcf]) }; }
       else { if ( l[i] in yodef ) { l[i]=yodef[l[i]] }; }; };

    book[b]=joinpat(l,sep,nf)};};


### трех- !_#_!
    for(wrd in Trex ){wln=split(Trex[wrd],omlin," ");rexa=regwpart(wrd,"трех");somo=trex[rexa];for(y=1;y<=wln;y++)                 # header1
    {b=strtonum(omlin[y]);nf=splitline(book[b]);regwpos(wrd);for(i in wpos){i=strtonum(i);if(tolower(l[i])!=tolower(wrd))continue; # header2

      sub(rexa,somo,l[i]); r[2]++; if(dbg){print "R2"}; continue;
  
    }; delete wpos; book[b]=joinpat(l,sep,nf);};}; # footer
### четырех- !_#_!
    for(wrd in qTrx ){wln=split(qTrx[wrd],omlin," ");rexa=regwpart(wrd,"четырех");somo=qtrx[rexa];for(y=1;y<=wln;y++)              # header1
    {b=strtonum(omlin[y]);nf=splitline(book[b]);regwpos(wrd);for(i in wpos){i=strtonum(i);if(tolower(l[i])!=tolower(wrd))continue; # header2

      sub(rexa,somo,l[i]); r[2]++; if(dbg){print "R2"}; continue;
  
    }; delete wpos; book[b]=joinpat(l,sep,nf);};}; # footer
### cmpy !_#_!
    for(wrd in cmps){wln=split(cmps[wrd],omlin," ");somo=cmpy[wrd];for(y=1;y<=wln;y++)     # header1
    {b=strtonum(omlin[y]);nf=splitline(book[b]);regwpos(wrd);for(i in wpos){i=strtonum(i); # header2

      if ( s1(0,"-")||s1(-1,"-") )
      { l[i]=somo; r[10]++; if(dbg){print "R10"}; continue;};
           
    }; delete wpos; book[b]=joinpat(l,sep,nf)};}; # footer

# Различные слова из omoz
    for(wrd in omos){wln=split(omos[wrd],omlin," ");somo=omoz[wrd];for(y=1;y<=wln;y++){b=strtonum(omlin[y]);nf=splitline(book[b]); # wrd in omos

### всем !_#_!
    if(tolower(wrd)== "всем" ){regwpos(wrd);for(i in wpos){i=strtonum(i); # header

      if ( w(-1,"во о обо на при") && s(-1,-1) )
      { l[i]=somo; r[2]++; if(dbg){print "R2"}; continue;};
  
    }; delete wpos; book[b]=joinpat(l,sep,nf);}; # footer

### моем !_#_!
    if(tolower(wrd)== "моем" ){regwpos(wrd);for(i in wpos){i=strtonum(i); # header

      if ( w(-1,"в о об на при") && s(-1,-1) )
      { l[i]=somo; r[3]++; if(dbg){print "R3"}; continue;};
   
    }; delete wpos; book[b]=joinpat(l,sep,nf)}; # footer

### нем !_#_!
    if(tolower(wrd)== "нем" ){regwpos(wrd);for(i in wpos){i=strtonum(i); # header

      if ( w(-1,"в о об на при по") && s(-1,-1) )
      { l[i]=somo; r[4]++; if(dbg){print "R4"}; continue;};
   
    }; delete wpos; book[b]=joinpat(l,sep,nf)}; # footer

### припеку !_#_!
    if(tolower(wrd)== "припеку" ){regwpos(wrd);for(i in wpos){i=strtonum(i); # header

      if ( w(-1,"сбоку") && se(-1,"-") )
      { l[i]=somo; r[13]++; if(dbg){print "R13"}; continue;};
   
    }; delete wpos; book[b]=joinpat(l,sep,nf)}; # footer

### сем !_#_!
    if(tolower(wrd)== "сем" ){regwpos(wrd);for(i in wpos){i=strtonum(i); # header

      if ( w(-1,"в о об на при по") && s(-1,-1) )
      { l[i]=somo; r[5]++; if(dbg){print "R5"}; continue;};

    }; delete wpos; book[b]=joinpat(l,sep,nf)}; # footer

### чем !_#_!
    if(tolower(wrd)== "чем" ){regwpos(wrd);for(i in wpos){i=strtonum(i); # header

      if ( !(w(-2,"не") && s(-2,-2)) && 
              w(-1,"в о об на при по") && s(-1,-1) )
      { l[i]=somo; r[7]++; if(dbg){print "R7"}; continue;};
   
    }; delete wpos; book[b]=joinpat(l,sep,nf)}; # footer

### таки !_#_!
    if(tolower(wrd)== "таки" ){regwpos(wrd);for(i in wpos){i=strtonum(i); # header

      if ( w(-1,"все") && se(-1,"-") )
      { somo=vsyo[l[i-1]];l[i-1]=somo; r[8]++; if(dbg){print "R8"}; continue;};
   
    }; delete wpos; book[b]=joinpat(l,sep,nf)}; # footer

### е !_#_!
    if(tolower(wrd)== "е" ){regwpos(wrd);for(i in wpos){i=strtonum(i); # header

       if ( se(0,"-") && w(1,"моё") )
       { l[i]=somo; r[9]++; if(dbg){print "R9"}; continue;};
   
    }; delete wpos; book[b]=joinpat(l,sep,nf)}; # footer

### черт !_#_!
    if(tolower(wrd)== "черт" ){for(i=1; i<=nf; i++){if(l[i]==wrd)wpos[i];};for(i in wpos){i=strtonum(i); # header

       if ( se(0,"-") && w(-1,"те") )
       { l[i]=somo; r[18]++; if(dbg){print "R18"}; continue;};

    }; delete wpos; book[b]=joinpat(l,sep,nf)}; # footer

       }; # b in omos
   }; # omos

### END_SECTION !_#_!
 # вывести изменённую строку

 for (i=1; i<=num; i++) { print book[i] }


#dbgstat = 1;
 cmd = "rm _stat.txt _yods.txt _omos.txt"
 if (dbgstat==1) {system(cmd);
     for (i=1; i<=572; i++) { printf ("%s%s %s %s\n", "R", i, "=", r[i]) >> "_stat.txt"};
     for (i in yods) { print i, yods[i] >> "_yods.txt"}
     for (i in omos) { print i, omos[i] >> "_omos.txt" }
                 };
}

