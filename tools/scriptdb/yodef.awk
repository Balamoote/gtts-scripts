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
   cmd = "cat " indb "yolc.txt | sed -r 's/[_=]/ /g'";
   while ((cmd|getline) > 0) {

        yodef[$1]=$2;

   } close(cmd);

 # Записать состояние словарных массивов
  if (gawk52 == 1) { writeall(yocache) };
  cmd = "md5sum " indb "yodef.awk " inax "yodef.bin " indb "yodef0.txt.gz " indb "yodef1.txt.gz " indb "yolc.txt > " inax "yodef.md5"
  system(cmd); close(cmd);
   } #gnuawk


       cst = "таки всем моем нем сем чем е желто зелено пестро припеку твердо тепло темно черно черт";
           stoar(cst,omoz," ");


   savefs = FS;
   FS = fsword;
} {

    num++; 
    for ( i=1; i<=NF; i++ ) { curfi = tolower($i);
        if ( curfi in yodef && num != prevnum0[$i] ) { yods[$i] = yods[$i] " " num; prevnum0[$i] = num; continue };
        if ( curfi in omoz  && num != prevnum1[$i] ) { omos[$i] = omos[$i] " " num; prevnum1[$i] = num; continue };
        if ( curfi ~ /^(трех|четырех)\S/ && num != prevnum2[$i] ) { trex[$i] = trex[$i] " " num; prevnum2[$i] = num; continue  };
        };

    book[num] = $0;
}
END {
FS = savefs
    for (wrd in yods ) {wln=split(yods[wrd],yolin," ");for(y=1;y<=wln;y++){b=strtonum(yolin[y]);

    nf=patsplit(book[b], l, patword, sep);

    for (i=1; i<=nf; i++) {
    
       if ( l[i] ~ capword ) { lcf=tolower(l[i]); if ( lcf in yodef ) { l[i]=toupper(yodef[lcf]) }; }
       else { if ( l[i] in yodef ) { l[i]=yodef[l[i]] }; }; };

    book[b] = joinpat(l, sep, nf)

   };};


### трех-  !_#_!
    for (wrd in trex ) {wln=split(trex[wrd],omlin," ");for(y=1;y<=wln;y++){b=strtonum(omlin[y]); nf=patsplit(book[b],l,patword,sep);
    for(i=1;i<=nf;i++){if(l[i]==wrd)wpos[i];};for(i in wpos){i=strtonum(i);

      sub(/рех/, "рёх", l[i]); r[2]++; if(dbg){print "R2"}; continue;
  
    }; delete wpos; book[b]=joinpat(l,sep,nf);};};

# Различные слова из omoz
    for(wrd in omos){wln=split(omos[wrd],omlin," ");for(y=1;y<=wln;y++){b=strtonum(omlin[y]); nf=patsplit(book[b],l,patword,sep);

### всем !_#_!
    if(tolower(wrd)== "всем" ){for(i=1;i<=nf;i++){if(l[i]==wrd)wpos[i];};for(i in wpos){i=strtonum(i);

      if ( w(-1,"во о обо на при") && s(-1,-1) )
      { sub(/[Ее]/, "ё", l[i]); r[2]++; if(dbg){print "R2"}; continue;};
  
    }; delete wpos; book[b]=joinpat(l,sep,nf);};

 ### моем !_#_!
    if(tolower(wrd)== "моем" ){for(i=1;i<=nf;i++){if(l[i]==wrd)wpos[i];};for(i in wpos){i=strtonum(i);

      if ( w(-1,"в о об на при") && s(-1,-1) )
      { sub(/[Ее]/, "ё", l[i]); r[3]++; if(dbg){print "R3"}; continue;};
   
    }; delete wpos; book[b]=joinpat(l,sep,nf)};

 ### нем !_#_!
    if(tolower(wrd)== "нем" ){for(i=1;i<=nf;i++){if(l[i]==wrd)wpos[i];};for(i in wpos){i=strtonum(i);

      if ( w(-1,"в о об на при по") && s(-1,-1) )
      { sub(/[Ее]/, "ё", l[i]); r[4]++; if(dbg){print "R4"}; continue;};
   
    }; delete wpos; book[b]=joinpat(l,sep,nf)};

 ### сем !_#_!
    if(tolower(wrd)== "сем" ){for(i=1;i<=nf;i++){if(l[i]==wrd)wpos[i];};for(i in wpos){i=strtonum(i);

      if ( w(-1,"в о об на при по") && s(-1,-1) )
      { sub(/[Ее]/, "ё", l[i]); r[5]++; if(dbg){print "R5"}; continue;};

    }; delete wpos; book[b]=joinpat(l,sep,nf)};

 ### чем !_#_!
    if(tolower(wrd)== "чем" ){for(i=1;i<=nf;i++){if(l[i]==wrd)wpos[i];};for(i in wpos){i=strtonum(i);

      if ( !(w(-2,"не") && s(-2,-2)) && 
              w(-1,"в о об на при по") && s(-1,-1) )
      { sub(/[Ее]/, "ё", l[i]); r[7]++; if(dbg){print "R7"}; continue;};
   
    }; delete wpos; book[b]=joinpat(l,sep,nf)};

 ### таки !_#_!
    if(tolower(wrd)== "таки" ){for(i=1;i<=nf;i++){if(l[i]==wrd)wpos[i];};for(i in wpos){i=strtonum(i);

      if ( w(-1,"все") && se(-1,"-") )
      { sub(/[Ее]/, "ё", l[i-1]); r[8]++; if(dbg){print "R8"}; continue;};
   
    }; delete wpos; book[b]=joinpat(l,sep,nf)};

 ### е !_#_!
    if(tolower(wrd)== "е" ){for(i=1;i<=nf;i++){if(l[i]==wrd)wpos[i];};for(i in wpos){i=strtonum(i);

       if ( se(0,"-") && w(1,"мое") )
       { sub(/Е/, "Ё", l[i]); sub(/е/, "ё", l[i]); sub(/[Ее]/, "ё", l[i+1]); r[9]++; if(dbg){print "R9"}; continue;};
   
    }; delete wpos; book[b]=joinpat(l,sep,nf)};

 ### желто !_#_!
    if(tolower(wrd)== "желто" ){for(i=1;i<=nf;i++){if(l[i]==wrd)wpos[i];};for(i in wpos){i=strtonum(i);

      if ( s1(0,"-") )
      { sub(/[Ее]/, "ё", l[i]); r[10]++; if(dbg){print "R10"}; continue;};
           
    }; delete wpos; book[b]=joinpat(l,sep,nf)};

 ### зелено !_#_!
    if(tolower(wrd)== "зелено" ){for(i=1;i<=nf;i++){if(l[i]==wrd)wpos[i];};for(i in wpos){i=strtonum(i);

      if ( s1(0,"-") )
      { l[i] = gensub(/[Ее]([Нн])/, "ё\\1", "g", l[i]); r[11]++; if(dbg){print "R11"}; continue;};
          
    }; delete wpos; book[b]=joinpat(l,sep,nf)};

 ### пестро !_#_!
    if(tolower(wrd)== "пестро" ){for(i=1;i<=nf;i++){if(l[i]==wrd)wpos[i];};for(i in wpos){i=strtonum(i);

      if ( s1(0,"-") )
      { sub(/[Ее]/, "ё", l[i]); r[12]++; if(dbg){print "R12"}; continue;};
   
    }; delete wpos; book[b]=joinpat(l,sep,nf)};

 ### припеку !_#_!
    if(tolower(wrd)== "припеку" ){for(i=1;i<=nf;i++){if(l[i]==wrd)wpos[i];};for(i in wpos){i=strtonum(i);

      if ( w(-1,"сбоку") && se(-1,"-") )
      { sub(/[Ее]/, "ё", l[i]); r[13]++; if(dbg){print "R13"}; continue;};
   
    }; delete wpos; book[b]=joinpat(l,sep,nf)};

 ### твердо !_#_!
    if(tolower(wrd)== "твердо" ){for(i=1;i<=nf;i++){if(l[i]==wrd)wpos[i];};for(i in wpos){i=strtonum(i);

      if ( s1(0,"-") )
      { sub(/[Ее]/, "ё", l[i]); r[14]++; if(dbg){print "R14"}; continue;};
   
    }; delete wpos; book[b]=joinpat(l,sep,nf)};

 ### темно !_#_!
    if(tolower(wrd)== "темно" ){for(i=1;i<=nf;i++){if(l[i]==wrd)wpos[i];};for(i in wpos){i=strtonum(i);

       if ( s1(0,"-") )
       { sub(/[Ее]/, "ё", l[i]); r[15]++; if(dbg){print "R15"}; continue;};
   
    }; delete wpos; book[b]=joinpat(l,sep,nf)};

 ### тепло !_#_!
    if(tolower(wrd)== "тепло" ){for(i=1;i<=nf;i++){if(l[i]==wrd)wpos[i];};for(i in wpos){i=strtonum(i);

      if ( s1(0,"-") )
      { sub(/[Ее]/, "ё", l[i]); r[16]++; if(dbg){print "R16"}; continue;};
   
    }; delete wpos; book[b]=joinpat(l,sep,nf)};

 ### черно !_#_!
    if(tolower(wrd)== "черно" ){for(i=1;i<=nf;i++){if(l[i]==wrd)wpos[i];};for(i in wpos){i=strtonum(i);

       if ( s1(0,"-") )
       { sub(/[Ее]/, "ё", l[i]); r[17]++; if(dbg){print "R17"}; continue;};

    }; delete wpos; book[b]=joinpat(l,sep,nf)};

 ### черт !_#_!
    if(tolower(wrd)== "черт" ){for(i=1; i<=nf; i++){if(l[i]==wrd)wpos[i];};for(i in wpos){i=strtonum(i);

       if ( se(0,"-") && w(-1,"те") )
       { sub(/[Ее]/, "ё", l[i]); r[18]++; if(dbg){print "R18"}; continue;};

    }; delete wpos; book[b]=joinpat(l,sep,nf)};

    book[b] = gensub(/<_([Ее])_>/, "\\1\xcc\x81", "g", book[b])

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

