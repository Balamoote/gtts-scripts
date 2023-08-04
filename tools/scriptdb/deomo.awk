# Деомографизатор
# Читает файл(ы) словаря с морфологической информацией и заменяет омографы согласно правилам

# Перенумеровать правила в vim:
# let @a=1|%s/"R\zs\d\+\ze"/\=''.(@a+setreg('a',@a+1))/g|%s/ R\[\zs\d\+\ze\]++; if(dbg){print "R\(\d\+\)"/\1/g|%s/{system(cmd); for (i=1; i<=\zs\d\+\ze;/\=''.(@a-1)/g
#
# NB: во всех функциях поле указывается относительно 0, 0 - это позиция поискового слова.
# если задана переменные indb при запуске, то искать словари в директории "indb/", иначе по месту запуска
# если задана переменные inax при запуске, то писать служебные файлы в директории "inax/", иначе по месту запуска (имеет смысл только для gawk>=5.2.1)
# Последняя версия файла тут: https://github.com/Balamoote/gtts-scripts

@include "scriptdb/functions.awk"
@include "scriptdb/classes.awk"
@include "scriptdb/class_cst.awk"
@include "scriptdb/defunct.awk"
@include "scriptdb/despacy.awk"
@include "scriptdb/vsevso.awk"
@include "scriptdb/zamok.awk"

BEGIN { PROCINFO["sorted_in"]="@ind_num_asc"

   #dbg = 0
   #dbgstat = 0

   unxy    = "[\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
   unxyp   = "[\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]+"
   unxn    = "[^\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
   RUUC    = "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ]+"
   RUUC_   = "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ]"
   rulc    = "[абвгдеёжзийклмнопрстуфхцчшщъыьэюя]+"
   rulc_   = "[абвгдеёжзийклмнопрстуфхцчшщъыьэюя]"
   patword = "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb00-9]+"
   regword = "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
   fsword  = "[^АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
   capword = "^[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ]+$"
   vvpat   = "[,—]"
   hysnip  = regword "[-]" regword

   savefs = FS;
   FS = fsword;
} {
    num++; book[num] = $0;

    for (i=1; i<=NF; i++) { ci=tolower($i);
 # Сканируем текст на омографы. Для сканирования 1 омографа: ./momo.sh -si book.fb2 замок
#_#_#txtmppra
        if($i in vse  && num!=o000    ) {vseT [ci]           = vseT [ci]           num " "; o000     = num}; # "все" (но не вСЕ,вСе,всЕ)   #_#_# vsez !_#_!
        if($i in almo && num!=o001[$i]) {omap [almo[$i]][$i] = omap [almo[$i]][$i] num " "; o001[$i] = num}; # омографы кроме "все"        #_#_# all_omos !_#_!
#       if(ci=="dummy"&& num!=o001[$i]) {omap [almo[$i]][$i] = omap [almo[$i]][$i] num " "; o001[$i] = num}; # отдельное слово             #_#_# single_word !_#_!
#       if(almo[$i]=="dummy"&& num!=o001[$i]) {omap [almo[$i]][$i] = omap [almo[$i]][$i] num " "; o001[$i] = num}; # отдельное слово       #_#_# single_group !_#_!
#_#_#txtmpprb

  };
} END { FS = savefs
 # Загрузить копию текста, предварительно обработанного SpaCy
 cmd = "cat " bkscydir "text-book.scy 2>/dev/null"; while ((cmd|getline) > 0) { scy++; bscy[scy]=$0; } close(cmd);

### все !_#_!

 VSEVSO_F() # <<< правила находятся в файле vsevso.awk

### x1000 !_#_!
 #  x1000 klitika_  none_
for(wrd in omap["x1000"]){omakevars(x1000,"x1000");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"Ykl") && notsym(-1,unxy) && s(-1) )
 { l[i-1]=gensub(/([АЕЁИОУЫЭЮЯаеёиоуыэюя])/,"\\1\xcc\x81",1,l[i-1]); l[i]=gensub(/^(.)/,"\xcc\xa0\\1\xcc\xad",1,l[i]); R[1]++; if(dbg){print "R1", "klitika"}; continue };

 l[i]=omo2; R[2]++; if(dbg){print "R2", "def"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1001 !_#_!
 #  x1001 gl_pomn_      zalt_
for(wrd in omap["x1001"]){omakevars(x1001,"x1001");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pomn_f() )
 { l[i]=omo1; R[3]++; if(dbg){print "R3", "gl_pomn_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1002 !_#_!
 #  x1002 pq_kr_em_     zalt_    ( zalt2_) по типу избе́га́ем
for(wrd in omap["x1002"]){omakevars(x1002,"x1002");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2

 if(iwrd=="избегаем") {
   if ( q(1,"suw_ro") && sc(0) )
   { l[i]=omo1; R[4]++; if(dbg){print "R4"}; continue };
 };

 #
 if ( pq_kr_em_f() )
 { l[i]=omo1; R[5]++; if(dbg){print "R5", "pq_kr_em_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1003 !_#_!
 #  x1003 sw_em_r_      zalt_
for(wrd in omap["x1003"]){omakevars(x1003,"x1003");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[6]++; if(dbg){print "R6", "sw_em_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1004 !_#_!
 #  x1004 sw_1em_vr_2mn_iv_   zalt_
for(wrd in omap["x1004"]){omakevars(x1004,"x1004");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[7]++; if(dbg){print "R7", "sw_em_v_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[8]++; if(dbg){print "R8", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[9]++; if(dbg){print "R9", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[10]++; if(dbg){print "R10", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1005 !_#_!
 #  x1005 sw_1ez_r_2mn_iv_    zalt_
for(wrd in omap["x1005"]){omakevars(x1005,"x1005");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[11]++; if(dbg){print "R11", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[12]++; if(dbg){print "R12", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[13]++; if(dbg){print "R13", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1006 !_#_!
 #  x1006 sw_em_d_      zalt_
for(wrd in omap["x1006"]){omakevars(x1006,"x1006");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[14]++; if(dbg){print "R14", "sw_em_d_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1007 !_#_!
 #  x1007 sw_em_i_      zalt_
for(wrd in omap["x1007"]){omakevars(x1007,"x1007");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[15]++; if(dbg){print "R15", "sw_em_i_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1008 !_#_!
 #  x1008 sw_em_iv_     zalt_
for(wrd in omap["x1008"]){omakevars(x1008,"x1008");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[16]++; if(dbg){print "R16", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[17]++; if(dbg){print "R17", "sw_em_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1009 !_#_!
 #  x1009 sw_es_iv_     zalt_
for(wrd in omap["x1009"]){omakevars(x1009,"x1009");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo1; R[18]++; if(dbg){print "R18", "sw_es_i_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo1; R[19]++; if(dbg){print "R19", "sw_es_v_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[20]++; if(dbg){print "R20", "sw_em_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1010 !_#_!
 #  x1010 sw_es_t_      zalt_
for(wrd in omap["x1010"]){omakevars(x1010,"x1010");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_t_f() )
 { l[i]=omo1; R[21]++; if(dbg){print "R21", "sw_es_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1011 !_#_!
 #  x1011 sw_ez_d_      zalt_
for(wrd in omap["x1011"]){omakevars(x1011,"x1011");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; R[22]++; if(dbg){print "R22", "sw_ez_d_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1012 !_#_!
 #  x1012 sw_ez_dp_     zalt_
for(wrd in omap["x1012"]){omakevars(x1012,"x1012");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; R[23]++; if(dbg){print "R23", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo1; R[24]++; if(dbg){print "R24", "sw_ez_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1013 !_#_!
 #  x1013 sw_ez_i_      zalt_
for(wrd in omap["x1013"]){omakevars(x1013,"x1013");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; R[25]++; if(dbg){print "R25", "sw_ez_i_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1014 !_#_!
 #  x1014 sw_ez_r_      zalt_  одуш.  казачки  каза́чки  казачки́
for(wrd in omap["x1014"]){omakevars(x1014,"x1014");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[26]++; if(dbg){print "R26", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1015 !_#_!
 #  x1015 sw_ez_v_      zalt_  шлепку  шлёпку  шлепку́
for(wrd in omap["x1015"]){omakevars(x1015,"x1015");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; R[27]++; if(dbg){print "R27", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1016 !_#_!
 #  x1016 sw_mn_iv_     zalt_  дельца тельца
for(wrd in omap["x1016"]){omakevars(x1016,"x1016");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[28]++; if(dbg){print "R28", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[29]++; if(dbg){print "R29", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1017 !_#_!
 #  x1017 swn_mn_p_  swo_mn_p_  купчих  ку́пчих  купчи́х
for(wrd in omap["x1017"]){omakevars(x1017,"x1017");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_p_f() )
 { l[i]=omo1; R[30]++; if(dbg){print "R30", "sw_mn_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1018 !_#_!
 #  x1018 sw_em_v_      zalt_  парю  па́рю  парю́
for(wrd in omap["x1018"]){omakevars(x1018,"x1018");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[31]++; if(dbg){print "R31", "sw_em_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1019 !_#_!
 #  x1019 hyphdef_word_   default_
for(wrd in omap["x1019"]){omakevars(x1019,"x1019");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"YHYS") && se(-1,"-") )
 { l[i]=omo1; R[32]++; if(dbg){print "R32"}; continue };
 if ( !(sc(-1,"-")||s1(0,"-")) )
 { l[i]=omo2; R[33]++; if(dbg){print "R33"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1020 !_#_!
 #  x1020 hyphany_word_  (default_)
for(wrd in omap["x1020"]){omakevars(x1020,"x1020");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(-1,"-") )
 { l[i]=omo1; R[34]++; if(dbg){print "R34"}; continue };

 # l[i]=omo2; R[35]++; if(dbg){print "R35"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1021 !_#_!
 #  x1021 hyph1_word_hyph2_    word_
for(wrd in omap["x1021"]){omakevars(x1021,"x1021");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(-1,"-") && s1(0,"-") )
 { l[i]=omo1; R[36]++; if(dbg){print "R36"}; continue };
 if ( s1(0,"-") )
 { l[i]=omo1; R[37]++; if(dbg){print "R37"}; continue };

 l[i]=omo2; R[38]++; if(dbg){print "R38"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1022 !_#_!
 #  x1022 word_hyphdef_  sw_ez_t_  какой  како́й  ка́кой
for(wrd in omap["x1022"]){omakevars(x1022,"x1022");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( s1(0,"-") && ismark(1,"YHYF") && w(1,"то") )
 { l[i]=omo1; l[i+1]=gensub(/^(.+)$/,"\xcc\xa0\\1\xcc\xa0",1,l[i+1]); R[39]++; if(dbg){print "R39"}; continue };
 if ( s1(0,"-") && ismark(1,"YHYF") )
 { l[i]=omo1; R[40]++; if(dbg){print "R40"}; continue };
 #
 if ( pl_em_i_f()||pl_em_v_f()||pl_ez_d_f()||pl_ez_p_f()||pl_ez_r_f()||pl_ez_t_f() )
 { l[i]=omo1; R[41]++; if(dbg){print "R41", "pl_eX_X_f"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[42]++; if(dbg){print "R42", "sw_ez_t_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1023 !_#_!
 #  x1023 word_hyphany_  (default_)
for(wrd in omap["x1023"]){omakevars(x1023,"x1023");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( s1(0,"-") )
 { l[i]=omo1; R[43]++; if(dbg){print "R43"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1024 !_#_!
 #  x1024 sw_em_v_  (zalt_)
for(wrd in omap["x1024"]){omakevars(x1024,"x1024");for(y=1;y<=wln;y++)                    # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(-1,"pre_vi preph_vi") && s(-1) )
 { l[i]=omo1; R[44]++; if(dbg){print "R44"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1025 !_#_!
 #  x1025 tem_je_       тем  те́м
for(wrd in omap["x1025"]){omakevars(x1025,"x1025");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 l[i]=omo1; R[45]++; if(dbg){print "R45"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1026 !_#_!
 #  x1026 orgbody_      orgplay_ орган  о́рган ... орга́н ...
for(wrd in omap["x1026"]){omakevars(x1026,"x1026");for(y=1;y<=wln;y++)                    # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="власти дыхания здравоохранения зрения обоняния осязания порядка правопорядка самоуправления слуха управления чувств";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[46]++; if(dbg){print "R46"}; continue };
 #
 cst="внутренний государственный местный официальный полицейский половой руководящий советский союзный судебный федеральный хватательный чувствительный \
      электровосприимчивый";
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo1; R[47]++; if(dbg){print "R47"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1027 !_#_!
 #  x1027 sw_1em_d_2ez_v_  zatl_sw_1em_d_     парку  па́рку  парку́
for(wrd in omap["x1027"]){omakevars(x1027,"x1027");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[48]++; if(dbg){print "R48", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; R[49]++; if(dbg){print "R49", "sw_ez_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1028 !_#_!
 #  x1028 pq_kr_em_     pl_kr_em_   проклят  про́клят  прокля́т
for(wrd in omap["x1028"]){omakevars(x1028,"x1028");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pq_kr_em_f() )
 { l[i]=omo1; R[50]++; if(dbg){print "R50", "pq_kr_em_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1029 !_#_!
 #  x1029 pq_kr_es_     pl_kr_es_   проклято  про́клято  прокля́то
for(wrd in omap["x1029"]){omakevars(x1029,"x1029");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="будет буду будь было оно стало ты я";
 if ( w(-1,cst)||suw_edsrim(-1) && s(-1) )
 { l[i]=omo1; R[51]++; if(dbg){print "R51"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1030 !_#_!
 #  x1030 pq_kr_ez_     pl_kr_ez_   проклята  про́клята  прокля́та
for(wrd in omap["x1030"]){omakevars(x1030,"x1030");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="будет будь была она стала ты я";
 if ( w(-1,cst)||suw_edmuim(-1) && s(-1) )
 { l[i]=omo1; R[52]++; if(dbg){print "R52"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1031 !_#_!
 #  x1031 pq_kr_mn_     pl_kr_mn_   прокляты  про́кляты  прокля́ты
for(wrd in omap["x1031"]){omakevars(x1031,"x1031");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="будут будь были вы мы они стали";
 if ( w(-1,cst)||suw_edmuim(-1) && s(-1) )
 { l[i]=omo1; R[53]++; if(dbg){print "R53"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1032 !_#_!
 #  x1032 ghost_        parfume_   духами  ду́хами  духа́ми
for(wrd in omap["x1031"]){omakevars(x1031,"x1031");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="добрыми злыми лесными подземными светлыми темными тёмными";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[54]++; if(dbg){print "R54"}; continue };
 #
 cst="благоухание благоухать вонь вонять запах запахнуть пользоваться";
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo2; R[55]++; if(dbg){print "R55"}; continue };
 cst="дешевыми дешёвыми дорогими женскими модными мужскими тошнотворными";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[56]++; if(dbg){print "R56"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1033 !_#_!
 #  x1033 ghost_        parfume_  духах  ду́хах  духа́х
for(wrd in omap["x1033"]){omakevars(x1033,"x1033");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="добрых злых лесных подземных светлых темных тысячи тёмных";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[57]++; if(dbg){print "R57"}; continue };
 #
 cst="дешевых дешёвых дорогих женских модных мужских тошнотворных";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[58]++; if(dbg){print "R58"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1034 !_#_!
 #  x1034 ghost_        parfume_  духи  ду́хи  духи́
for(wrd in omap["x1034"]){omakevars(x1034,"x1034");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="добрые злые лесные подземные светлые темные тёмные";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[59]++; if(dbg){print "R59"}; continue };
 #
 cst="дешевые дешёвые дорогие женские модные мужские тошнотворные";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[60]++; if(dbg){print "R60"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1035 !_#_!
 #  x1035 ghost_        parfume_  духов  ду́хов  духо́в
for(wrd in omap["x1035"]){omakevars(x1035,"x1035");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="вонь добрых злых лесных подземных светлых темных тысяч тёмных";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[61]++; if(dbg){print "R61"}; continue };
 cst="впустить вызвать вызывать выпускать выпустить выпусть заклинатель заклинать призвание призывать укротитель укротить укрощать";
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo1; R[62]++; if(dbg){print "R62"}; continue };
 #
 cst="дешевых дешёвых дорогих женских модных мужских тошнотворных";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[63]++; if(dbg){print "R63"}; continue };
 cst="аромат благоухание вонь вонять запах изготовление пользоваться флакон шлейф";
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo2; R[64]++; if(dbg){print "R64"}; continue };
 if ( wc(-2,cst) &&
       q(-1,"mest_ro prl_ro") && s(-2,-1) )
 { l[i]=omo2; R[65]++; if(dbg){print "R65"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1036 !_#_!
 #  x1036 dare_        sweep_  смели  сме́ли  смели́
for(wrd in omap["x1036"]){omakevars(x1036,"x1036");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_in(-2) &&
          w(-1,"не") && s(-2,-1) )
 { l[i]=omo1; R[66]++; if(dbg){print "R66"}; continue };
 if ( gl_in(1) && s(0) )
 { l[i]=omo1; R[67]++; if(dbg){print "R67"}; continue };
 cst="даже лишь";
 if ( w(1,cst) &&
  gl_in(2) && s(0,1) )
 { l[i]=omo1; R[68]++; if(dbg){print "R68"}; continue };
 #
 if ( pre_ro(1) &&
           q(2,"suw_ro") && s(0,1) )
 { l[i]=omo2; R[69]++; if(dbg){print "R69"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1037 !_#_!
 #  x1037 sw_ez_r_      zalt_     одуш-неодуш (мн.ч. оба) белки  белки  белки
for(wrd in omap["x1037"]){omakevars(x1037,"x1037");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[70]++; if(dbg){print "R70", "sw_ez_r_f"}; continue };
 #
#if ( sw_mn_i_f() )
#{ l[i]=omo2; R[71]++; if(dbg){print "R71", "sw_mn_i_f"}; continue };
##
#if ( sw_mn_v_f() )
#{ l[i]=omo2; R[72]++; if(dbg){print "R72", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1038 !_#_!
 #  x1038 sw_ez_r_      zalt_    неодуш. дрючки  дрю́чки  дрючки́
for(wrd in omap["x1038"]){omakevars(x1038,"x1038");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if(iwrd=="дрючки") {
   if ( w(-1,"штучки") && sc(-1,"-") )
   { l[i]=omo1; R[73]++; if(dbg){print "R73"}; continue };
 };

 if ( sw_ez_r_f() )
 { l[i]=omo1; R[74]++; if(dbg){print "R74", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1039 !_#_!
 #  x1039 sw_ez_r_      zalt_     лады  ла́ды  лады́
for(wrd in omap["x1039"]){omakevars(x1039,"x1039");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( qxs(-1,"на","все") )
 { l[i]=omo2; R[75]++; if(dbg){print "R75", "sw_ez_r_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[76]++; if(dbg){print "R76", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1040 !_#_!
 #  x1040 sw_ez_r_      zalt_     заморозки  заморо́зки  за́морозки
for(wrd in omap["x1040"]){omakevars(x1040,"x1040");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[77]++; if(dbg){print "R77", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1041 !_#_!
 #  x1041 pointer_      shooter_     стрелки  стре́лки  стрелки́ (формы мн.ч., морфологически неразличимые никак)
for(wrd in omap["x1041"]){omakevars(x1041,"x1041");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="датчик детектор диск индикатор прибор счетчик счётчик циферблат часы";
 if ( base(1,cst) && s(0) )
 { l[i]=omo1; R[78]++; if(dbg){print "R78"}; continue };
 if ( pre_pr(1) &&
        base(2,cst) && s(0,1) )
 { l[i]=omo1; R[79]++; if(dbg){print "R79"}; continue };
 if ( (q(1,"qik_ro")||type(1,"qis")) &&
    base(2,cst) && s(0,1) )
 { l[i]=omo1; R[80]++; if(dbg){print "R80"}; continue };
 #
 if ( base(-1,"меткий") && s(-1) )
 { l[i]=omo2; R[81]++; if(dbg){print "R81"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[82]++; if(dbg){print "R82", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1042 !_#_!
 #  x1042 sw_ez_r_      zalt_     стрелок  стре́лок  стрело́к
for(wrd in omap["x1042"]){omakevars(x1042,"x1042");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( name_im_sy(1) && s(0) )
 { l[i]=omo1; R[83]++; if(dbg){print "R83"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[84]++; if(dbg){print "R84", "sw_em_i_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[85]++; if(dbg){print "R85", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1043 !_#_!
 #  x1043 sw_ez_r_      zalt_     стрелка  стре́лка  стрелка́
for(wrd in omap["x1043"]){omakevars(x1043,"x1043");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[86]++; if(dbg){print "R86", "sw_ez_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[87]++; if(dbg){print "R87", "sw_em_v_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[88]++; if(dbg){print "R88", "sw_em_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1044 !_#_!
 #  x1044 sw_ez_r_      zalt_     стрелке  стре́лке  стрелке́
for(wrd in omap["x1044"]){omakevars(x1044,"x1044");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[89]++; if(dbg){print "R89", "sw_em_p_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[90]++; if(dbg){print "R90", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[91]++; if(dbg){print "R91", "sw_ez_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1045 !_#_!
 #  x1045 sw_ez_r_      zalt_     стрелку  стре́лку  стрелку́
for(wrd in omap["x1045"]){omakevars(x1045,"x1045");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[92]++; if(dbg){print "R92", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[93]++; if(dbg){print "R93", "sw_ez_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1046 !_#_!
 #  x1046 stola_      table_     стола  сто́ла  стола́
for(wrd in omap["x1046"]){omakevars(x1046,"x1046");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="стола") {
   if ( q(-1,"prl_edzeim prq_edzeim mest_pedzeim") && s(-1) )
   { l[i]=omo1; R[94]++; if(dbg){print "R94"}; continue };
 };
 if(iwrd=="столе") {
   if ( q(-1,"prl_edzeda prq_edzeda mest_pedzeda") && s(-1) )
   { l[i]=omo1; R[95]++; if(dbg){print "R95"}; continue };
 };
 if(iwrd=="столу") {
   if ( q(-1,"prl_edzevi prq_edzevi mest_pedzevi") && s(-1) )
   { l[i]=omo1; R[96]++; if(dbg){print "R96"}; continue };
 };
 if(iwrd=="столы") {
   if ( q(-1,"prl_edzero prq_edzero mest_pedzero") && s(-1) )
   { l[i]=omo1; R[97]++; if(dbg){print "R97"}; continue };
 };

 # стол - по дефолту, стола - "одежда" - добавлять при обнаружении
 l[i]=omo2; R[98]++; if(dbg){print "R98", "table_"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1047 !_#_!
 #  x1047 m2_1pl_kr_es_2nar_     nar_     полно  по́лно  полно́
for(wrd in omap["x1047"]){omakevars(x1047,"x1047");for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"полным") && sc(-1,"-") )
 { l[i]=omo2; R[99]++; if(dbg){print "R99", "sw_em_d_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1048 !_#_!
 #  x1048 mest_ems_p_     pl_kr_em_     нем  нём  не́м
for(wrd in omap["x1048"]){omakevars(x1048,"x1048");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="в на о об по при";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[100]++; if(dbg){print "R100"}; continue };

 l[i]=omo2; R[101]++; if(dbg){print "R101"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1049 !_#_!
 #  x1049 aufrenn_  einrenn_   забегать забе́гать забега́ть и производные
for(wrd in omap["x1049"]){omakevars(x1049,"x1049");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="вбок вверх влево вниз вперед вперёд вправо";
 if ( w(1,cst) && s(0) )
 { l[i]=omo2; R[102]++; if(dbg){print "R102"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1050 !_#_!
 #  x1050 disappear_  divide_   делись  де́лись  дели́сь
for(wrd in omap["x1050"]){omakevars(x1050,"x1050");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( wb(-5,-1,"куда никуда они вы мы") && s(wbn,-1) )
 { l[i]=omo1; R[103]++; if(dbg){print "R103"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1051 !_#_!
 #  x1051 hday_  noon_   полудне  полудне́  полу́дне
for(wrd in omap["x1051"]){omakevars(x1051,"x1051");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="езды лету лёту пути ходьбы";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[104]++; if(dbg){print "R104"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1052 !_#_!
 #  x1052 hday_  noon_   полудню  полудню́  полу́дню
for(wrd in omap["x1052"]){omakevars(x1052,"x1052");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="езды лету лёту пути ходьбы";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[105]++; if(dbg){print "R105"}; continue };
 if ( w(-1,"к") && s(-1) )
 { l[i]=omo2; R[106]++; if(dbg){print "R106"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1053 !_#_!
 #  x1053 hday_  noon_   полудня  полудня́  полу́дня
for(wrd in omap["x1053"]){omakevars(x1053,"x1053");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(1,"suw_ro") && s(0) )
 { l[i]=omo1; R[107]++; if(dbg){print "R107"}; continue };
 if ( q(-1,"pre_ro preph_ro") && s(-1) )
 { l[i]=omo2; R[108]++; if(dbg){print "R108"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1054 !_#_!
 #  x1054 gl_bued1e_  gl_naed1e_   признаюсь  призна́юсь  признаю́сь
for(wrd in omap["x1054"]){omakevars(x1054,"x1054");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( p(-1) && p(0) )
 { l[i]=omo1; R[109]++; if(dbg){print "R109"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1055 !_#_!
 #  x1055 mill_  wind_  ветряная  ветряна́я  ве́тряная
for(wrd in omap["x1055"]){omakevars(x1055,"x1055");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="двигатель мельница турбина установка";
 if ( base(1,cst) && s(0) )
 { l[i]=omo1; R[110]++; if(dbg){print "R110"}; continue };
 if ( base(1,"оспа") && s(0) )
 { l[i]=omo2; R[111]++; if(dbg){print "R111"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1056 !_#_!
 #  x1056 mehl_  pain_  мука  мука́  му́ка
for(wrd in omap["x1056"]){omakevars(x1056,"x1056");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="белая каменный качественный косный низносортный овсяный пшеничный ржаной серая соленый солёный сырой";
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo1; R[112]++; if(dbg){print "R112"}; continue };

 cst="внутренний душевный звенящий истинный мучительный настоящий невыносимый немыслимый нестерпимый острый подлинный сильный страшный сущий ужасающий";
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo2; R[113]++; if(dbg){print "R113"}; continue };
 if ( q(1,"mest_da suw_da") &&
      w(2,"с") &&
      q(3,"mest_tv suw_tv") && s(0,2) )
 { l[i]=omo2; R[114]++; if(dbg){print "R114"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1057 !_#_!
 #  x1057 mehl_  pain_  (sw_ez_rz_  sw_mn_iv_)  муки  муки́  му́ки
for(wrd in omap["x1057"]){omakevars(x1057,"x1057");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="белая каменный качественный косный низносортный овсяный пшеничный ржаной серая соленый солёный сырой";
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo1; R[115]++; if(dbg){print "R115"}; continue };

 cst="внутренний душевный звенящий изнурительный истинный мучительный настоящий невыносимый немыслимый нестерпимый острый подлинный сильный страшный сущий \
      ужасающий";
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo2; R[116]++; if(dbg){print "R116"}; continue };
 #
 if ( sw_ez_z_f() )
 { l[i]=omo1; R[117]++; if(dbg){print "R117", "sw_ez_z_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[118]++; if(dbg){print "R118", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[119]++; if(dbg){print "R119", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[120]++; if(dbg){print "R120", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1058 !_#_!
 #  x1058 atmen_  croak_  дохнуть  дохну́ть  до́хнуть
for(wrd in omap["x1058"]){omakevars(x1058,"x1058");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="вонь перегар смрад тепло холод";
 if ( q(1,"suw_tv") && base(1,cst) && s(0) )
 { l[i]=omo1; R[121]++; if(dbg){print "R121"}; continue };

#cst="";
#if ( base(-1,cst) && s(-1) )
#{ l[i]=omo2; R[122]++; if(dbg){print "R122"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1059 !_#_!
 #  x1059 cowards_  trunks_  трусы  тру́сы  трусы́
for(wrd in omap["x1059"]){omakevars(x1059,"x1059");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
#cst="вонь перегар смрад тепло холод";
#if ( q(1,"suw_tv") && base(1,cst) && s(-1) )
#{ l[i]=omo1; R[123]++; if(dbg){print "R123"}; continue };

#cst="";
#if ( base(-1,cst) && s(-1) )
#{ l[i]=omo2; R[124]++; if(dbg){print "R124"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1060 !_#_!
 #  x1060 afraid_  shake_  трусить  тру́сить  труси́ть
for(wrd in omap["x1060"]){omakevars(x1060,"x1060");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
#cst="вонь перегар смрад тепло холод";
#if ( q(1,"suw_tv") && base(1,cst) && s(-1) )
#{ l[i]=omo1; R[125]++; if(dbg){print "R125"}; continue };

#cst="";
#if ( base(-1,cst) && s(-1) )
#{ l[i]=omo2; R[126]++; if(dbg){print "R126"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1061 !_#_!
 #  x1061 circum_  okrug_  окружной  окру́жной  окружно́й
for(wrd in omap["x1061"]){omakevars(x1061,"x1061");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="администратор инспектор начальник прокурор совет суд";
 if ( base(1,cst) && s(0) )
 { l[i]=omo2; R[127]++; if(dbg){print "R127"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1062 !_#_!
 #  x1062 domain_  furnace_  доменный  доме́нный  до́менный
for(wrd in omap["x1062"]){omakevars(x1062,"x1062");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2

 cst="печь производство технология";
 if ( base(1,cst) && s(0) )
 { l[i]=omo2; R[128]++; if(dbg){print "R128"}; continue };
 #
 cst="владение организация структура";
 if ( q(1,"prl_any") && base(1,cst) && s(0) )
 { l[i]=omo1; R[129]++; if(dbg){print "R129"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1063 !_#_!
 #  x1063 word_hyphdef_  (default_)
for(wrd in omap["x1063"]){omakevars(x1063,"x1063");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="полна полно полны";
 if ( sc(0,"-") && w(1,cst) )
 { l[i]=omo1; R[130]++; if(dbg){print "R130"}; continue };

 l[i]=omo2; R[131]++; if(dbg){print "R131"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1064 !_#_!
 #  x1064 poduwam_  zalt_  душам  душа́м  ду́шам
for(wrd in omap["x1064"]){omakevars(x1064,"x1064");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="беседовать говорить побеседовать поговорить";
 if ( w(-1,"по") && qb(-5,-2,"gl_in gl_ed gl_mn deep gl_poed gl_pomn prq_any") &&
   base(qbn,cst) && s(qbn,-1) )
 { l[i]=omo1; R[132]++; if(dbg){print "R132"}; continue };
 if ( w(-1,"по") && vvb(-5,-2) && qb(vvn-5,vvn,"gl_in gl_ed gl_mn deep gl_poed gl_pomn prq_any") &&
   base(qbn,cst) && s(-1) )
 { l[i]=omo1; R[133]++; if(dbg){print "R133"}; continue };

 l[i]=omo2; R[134]++; if(dbg){print "R134"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1065 !_#_!
 #  x1065 pore_  time_  порах  по́рах  пора́х
for(wrd in omap["x1065"]){omakevars(x1065,"x1065");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qxs(-1,"на","первых") )
 { l[i]=omo2; R[135]++; if(dbg){print "R135"}; continue };

 l[i]=omo1; R[136]++; if(dbg){print "R136"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1066 !_#_!
 #  x1066 regiment_  shelf_  полках  полка́х  по́лках
for(wrd in omap["x1066"]){omakevars(x1066,"x1066");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if(iwrd=="полках") {
   if ( w(-2,"на") &&
        q(-1,"prl_mnpr prq_mnpr") && s(-2,-1) )
   { l[i]=omo2; R[137]++; if(dbg){print "R137"}; continue };
   if ( w(-1,"на") && s(-1) )
   { l[i]=omo2; R[138]++; if(dbg){print "R138"}; continue };
 };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1067 !_#_!
 #  x1067 sw_ez_r_      zalt_    пары  па́ры  пары́
for(wrd in omap["x1067"]){omakevars(x1067,"x1067");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="влюбленные влюблённые крепкие супружеские";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[139]++; if(dbg){print "R139"}; continue };
 cst="гулять идти кружиться танцевать";
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo1; R[140]++; if(dbg){print "R140"}; continue };
 #
 cst="зловонные серные химические ядовитые";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[141]++; if(dbg){print "R141"}; continue };

 if ( sw_ez_r_f() )
 { l[i]=omo1; R[142]++; if(dbg){print "R142", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1068 !_#_!
 #  x1068 eye_    peephole_    глазки  гла́́зки  глазки́
for(wrd in omap["x1068"]){omakevars(x1068,"x1068");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="бегать блестеть";
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo1; R[143]++; if(dbg){print "R143"}; continue };
 cst="блестящий голубой злобный злой красный крошечный маленький поросячий свиной сонный цепкий";
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo1; R[144]++; if(dbg){print "R144"}; continue };
 #
 cst="пуговка щелочка щёлочка";
 if ( sc(0,"-") &&
    base(1,cst) )
 { l[i]=omo1; R[145]++; if(dbg){print "R145"}; continue };

 if ( q(1,"isname") && s(0) )
 { l[i]=omo1; R[146]++; if(dbg){print "R146"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1069 !_#_!
 #  x1069 holey_    honst_    честной  честно́й  че́стной
for(wrd in omap["x1069"]){omakevars(x1069,"x1069");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="честная") {
   if ( w(-1,"мать") && s(-1) )
   { l[i]=omo1; R[147]++; if(dbg){print "R147"}; continue };
 };
 #
 if ( base(-1,"весь") &&
      base(1,"народ компания") && s(-1,0) )
 { l[i]=omo1; R[148]++; if(dbg){print "R148"}; continue };
 #
 l[i]=omo2; R[149]++; if(dbg){print "R149"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1070 !_#_!
 #  x1070 cursed_    damned_    проклятый  про́клятый  прокля́тый (полная форма)
for(wrd in omap["x1070"]){omakevars(x1070,"x1070");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( base(1,"душа") && s(0) )
 { l[i]=omo1; R[150]++; if(dbg){print "R150"}; continue };

 if(iwrd=="проклятого") {
   if ( q(1,"suw_edmuro suw_edsrro name_ro_sy") && s(0) )
   { l[i]=omo2; R[151]++; if(dbg){print "R151"}; continue };
 };
 if(iwrd=="проклятое") {
   if ( q(1,"suw_edsrim") && s(0) )
   { l[i]=omo2; R[152]++; if(dbg){print "R152"}; continue };
 };
 if(iwrd=="проклятом") {
   if ( q(1,"suw_edmupr suw_edsrpr") && s(0) )
   { l[i]=omo2; R[153]++; if(dbg){print "R153"}; continue };
 };
 if(iwrd=="проклятому") {
   if ( q(1,"suw_edmuda suw_edsrda") && s(0) )
   { l[i]=omo2; R[154]++; if(dbg){print "R154"}; continue };
 };
 if(iwrd=="проклятой") {
   if ( q(1,"suw_edzeda suw_edzero suw_edzetv suw_edzepr") && s(0) )
   { l[i]=omo2; R[155]++; if(dbg){print "R155"}; continue };
 };
 if(iwrd=="проклятою") {
   if ( q(1,"suw_edzetv") && s(0) )
   { l[i]=omo2; R[156]++; if(dbg){print "R156"}; continue };
 };
 if(iwrd=="проклятую") {
   if ( q(1,"suw_edzeim") && s(0) )
   { l[i]=omo2; R[157]++; if(dbg){print "R157"}; continue };
 };
 if(iwrd=="проклятые") {
   if ( w(-1,"как") && s(-1) && (p(0)||q_w(1,"pre_any")) )
   { l[i]=omo2; R[158]++; if(dbg){print "R158"}; continue };
   if ( q(1,"suw_mnim") && s(0) )
   { l[i]=omo2; R[159]++; if(dbg){print "R159"}; continue };
 };
 if(iwrd=="проклятый") {
   if ( q(1,"suw_edmuim") && s(0) )
   { l[i]=omo2; R[160]++; if(dbg){print "R160"}; continue };
 };
 if(iwrd=="проклятым") {
   if ( q(1,"suw_mnda") && s(0) )
   { l[i]=omo2; R[161]++; if(dbg){print "R161"}; continue };
 };
 if(iwrd=="проклятыми") {
   if ( q(1,"suw_mntv") && s(0) )
   { l[i]=omo2; R[162]++; if(dbg){print "R162"}; continue };
 };
 if(iwrd=="проклятых") {
   if ( q(1,"suw_mnro") && s(0) )
   { l[i]=omo2; R[163]++; if(dbg){print "R163"}; continue };
 };
 #
 if ( base(-1,"это этого") && s(-1) )
 { l[i]=omo2; R[164]++; if(dbg){print "R164"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1071 !_#_!
 #  x1071 cursed_    damned_    проклят  про́клят  прокля́т (краткая форма)
for(wrd in omap["x1071"]){omakevars(x1071,"x1071");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( base(-1,"быть") && s(-1) )
 { l[i]=omo1; R[165]++; if(dbg){print "R165"}; continue };
 if ( base(-2,"быть") &&
         q(-1,"mest_im") && s(-2,-1) )
 { l[i]=omo1; R[166]++; if(dbg){print "R166"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1072 !_#_!
 #  x1072 pincer_    tick_    клещи  кле́щи  клещи́
for(wrd in omap["x1072"]){omakevars(x1072,"x1072");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="железные стальные";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[167]++; if(dbg){print "R167"}; continue };
#if ( base(-2,cst) &&
#      q(-1,"pre_vi") && s(-2,-1) )
#{ l[i]=omo1; R[168]++; if(dbg){print "R168"}; continue };

 if ( sw_em_v_f() )
 { l[i]=omo1; R[169]++; if(dbg){print "R169", "sw_em_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1073 !_#_!
 #  x1073 combo_   deep_na_   попадя   по́падя  попадя́
for(wrd in omap["x1073"]){omakevars(x1073,"x1073");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #

 if ( qxs(-1,"кто где что когда","ни") )
 { l[i]=omo1; R[170]++; if(dbg){print "R170"}; continue };

 if ( q(1,"pre_vi") )
 { l[i]=omo2; R[171]++; if(dbg){print "R171"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1074 !_#_!
 #  x1074 must_     needs_  должно  должно́  до́лжно
for(wrd in omap["x1074"]){omakevars(x1074,"x1074");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(-2,"gl_poed gl_pomn") &&
      w(-1,"как что") && s(-2,-1) )
 { l[i]=omo2; R[172]++; if(dbg){print "R172"}; continue };
 if ( q(-2,"mest_da suw_da") &&
      q(-1,"gl_in") && s(-2,-1) && p(1) )
 { l[i]=omo2; R[173]++; if(dbg){print "R173"}; continue };

 l[i]=omo1; R[174]++; if(dbg){print "R174"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1075 !_#_!
 #  x1075 knead_     remember_  помните  помни́те  по́мните
for(wrd in omap["x1075"]){omakevars(x1075,"x1075");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(1,"pre_any") && s(0) )
 { l[i]=omo2; R[175]++; if(dbg){print "R175"}; continue };
 if ( p(-1) && p(0) )
 { l[i]=omo2; R[176]++; if(dbg){print "R176"}; continue };
 if ( w(-1,"не") && s(-1) && p(0) )
 { l[i]=omo2; R[177]++; if(dbg){print "R177"}; continue };
 if ( w(1,"же") && s(0) && p(-1) && p(1) )
 { l[i]=omo2; R[178]++; if(dbg){print "R178"}; continue };
 if ( q(1,"mest_3e") && s(0) && p(-1) && p(1) )
 { l[i]=omo2; R[179]++; if(dbg){print "R179"}; continue };
 #
 if ( q(-4,"gl_poed gl_pomn gl_povzmn") &&
      w(-3,"что") &&
      q(-2,"gl_ed gl_nemn gl_vzmn gl_pemn gl_pnmn") &&
      w(-1,"и") && s(-4,-1) )
 { l[i]=omo2; R[180]++; if(dbg){print "R180"}; continue };
 #
 if ( qxs(-1,"так","что вот") )
 { l[i]=omo2; R[181]++; if(dbg){print "R181"}; continue };
 if ( w(-2,"а да") &&
      w(-1,"вы") && s(-2,-1) && Q_w(1,"mest_da suw_da") )
 { l[i]=omo2; R[182]++; if(dbg){print "R182"}; continue };
 if ( w(-2,"вы") &&
      w(-1,"только лучше") && s(-2,-1) )
 { l[i]=omo2; R[183]++; if(dbg){print "R183"}; continue };
 if ( w(-3,"вы") &&
      q(-2,"mest_vi suw_vi") &&
      w(-1,"не") && s(-3,-1) && p(0,"?") )
 { l[i]=omo2; R[184]++; if(dbg){print "R184"}; continue };

 if ( wb(-5,-1,"будто где если зачем когда коли которого которую которые который которых куда насколько небось откуда пока почему пошто сколько что") &&
      (q(wbn-1,"sz qast")||p(wbn-1)||sc(wbn-1,"[pv]")) && s(wbn,-1) )
 { l[i]=omo2; R[185]++; if(dbg){print "R185"}; continue };
 #
 if ( wb(-5,-2,"как") &&
       w(wbn-1,"бы долго же") && s(wbn,-1) )
 { l[i]=omo2; R[186]++; if(dbg){print "R186"}; continue };
 #
 if ( wb(-5,-1,"вы") && s(wbn,-1) )
 { l[i]=omo2; R[187]++; if(dbg){print "R187"}; continue };
 #
 if ( sc(0,"?") )
 { l[i]=omo2; R[188]++; if(dbg){print "R188"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1076 !_#_!
 #  x1076 equals_    zalt_  равно  равно́  ра́вно
for(wrd in omap["x1076"]){omakevars(x1076,"x1076");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"а") && w(1,"и") && s(-1,0) )
 { l[i]=omo2; R[189]++; if(dbg){print "R189"}; continue };
 if ( qxs(1,"как","и") )
 { l[i]=omo2; R[190]++; if(dbg){print "R190"}; continue };

 l[i]=omo1; R[191]++; if(dbg){print "R191"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1077 !_#_!
 #  x1077 settled_    universe_  вселенная  вселённая  вселе́нная
for(wrd in omap["x1077"]){omakevars(x1077,"x1077");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="город дом квартира комната тело хата человек";
 if ( w(1,"в") && p(-1) &&
   base(2,cst) &&
suw_any(3) && s(0,2) )
 { l[i]=omo1; R[192]++; if(dbg){print "R192"}; continue };

 l[i]=omo2; R[193]++; if(dbg){print "R193"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1078 !_#_!
 #  x1078 poop_    which_  каком  ка́ком  како́м
for(wrd in omap["x1078"]){omakevars(x1078,"x1078");for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"кверху") && s(0) )
 { l[i]=omo1; R[194]++; if(dbg){print "R194"}; continue };

 if ( s1(0,"-") && w(1,"то") )
 { l[i]=omo2; l[i+1]=gensub(/^(.+)$/,"\xcc\xa0\\1\xcc\xa0",1,l[i+1]); R[195]++; if(dbg){print "R195"}; continue };

 l[i]=omo2; R[196]++; if(dbg){print "R196"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2001 !_#_! #NOSPACY
 #  x2001 deep_na_      mest_ez_i_   моя  мо́я  моя́
for(wrd in omap["x2001"]){omakevars(x2001,"x2001");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( suw_edzeim(1) && Q(1,"suw_edzevi") && s(0) )
 { l[i]=omo2; R[197]++; if(dbg){print "R197"}; continue };
 if ( p(-1) && sc(1,"—") )
 { l[i]=omo2; R[198]++; if(dbg){print "R198"}; continue };
 if ( suw_edzeim(1) && s(0) && p(1,",") )
 { l[i]=omo2; R[199]++; if(dbg){print "R199"}; continue };
 if ( suw_edzeim(1) && s(0) && sc(-1,"—") )
 { l[i]=omo2; R[200]++; if(dbg){print "R200"}; continue };
 if ( name_im_sy(1) && s(0) )
 { l[i]=omo2; R[201]++; if(dbg){print "R201"}; continue };
 if ( q(1,"suw_edzeim nar_spos") &&
     qf(2,6,"gl_ed prl_kred_ze gl_paedze") && s(0,qfn-1) )
 { l[i]=omo2; R[202]++; if(dbg){print "R202"}; continue };
 if ( p(-1) && p(0) )
 { l[i]=omo2; R[203]++; if(dbg){print "R203"}; continue };
 if ( q(-2,"mest_im suw_im") && s(-2,-1) &&
      w(-1,"и или да да") &&
           suw_edzeim(1) && s(-2,0) )
 { l[i]=omo2; R[204]++; if(dbg){print "R204"}; continue };
 if ( p(-3) &&
         nar_step(-2) && s(-2,-1) &&
      w(-1,"не") && p(0) )
 { l[i]=omo2; R[205]++; if(dbg){print "R205"}; continue };
 if ( p(-2) && suw_edzeim(-1) && p(0) && s(-1) )
 { l[i]=omo2; R[206]++; if(dbg){print "R206"}; continue };
 if ( suw_edzeim(-1) &&
              qf(1,5,"gl_ed prl_kred_ze gl_paedze") && s(-1,qfn-1) )
 { l[i]=omo2; R[207]++; if(dbg){print "R207"}; continue };
 if ( q(-1,"prl_edzeim prq_edzeim prl_kred_ze gl_ed mest_im") &&
           suw_edzeim(1) && s(-1,0) )
 { l[i]=omo2; R[208]++; if(dbg){print "R208"}; continue };
 if ( q(1,"prl_edzeim prq_edzeim prl_kred_ze") && s(0) )
 { l[i]=omo2; R[209]++; if(dbg){print "R209"}; continue };
 if ( p(0)||q_w(1,"pre_any") )
 { l[i]=omo2; R[210]++; if(dbg){print "R210"}; continue };

 cst="вот и как не но она это";

 if ( w(-1,cst) &&
           suw_edzeim(1) && s(0) && p(1) )
 { l[i]=omo2; R[211]++; if(dbg){print "R211"}; continue };
 if ( p(-2) &&  w(-1,cst) && s(-1) && p(0) )
 { l[i]=omo2; R[212]++; if(dbg){print "R212"}; continue };

 cst="";

 if ( mest_im(-2) && q(-1,"suw_im") && s(-2) && sc(-1,",") &&
     suw_edim(1) && s(0) && p(1) )
 { l[i]=omo2; R[213]++; if(dbg){print "R213"}; continue };
 if ( suw_edim(1) && s(0) && p(1) &&
       mest_im(2) && q(3,"suw_im") && s(2) && p(3) )
 { l[i]=omo2; R[214]++; if(dbg){print "R214"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[215]++; if(dbg){print "R215"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[216]++; if(dbg){print "R216"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2002 !_#_! #NOSPACY
 #  x2002 deep_na_      sw_1em_r_2ez_i_  туша  туша́  ту́ша
for(wrd in omap["x2002"]){omakevars(x2002,"x2002");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[217]++; if(dbg){print "R217", "sw_ez_i_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[218]++; if(dbg){print "R218", "sw_em_r_f"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[219]++; if(dbg){print "R219"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[220]++; if(dbg){print "R220"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2003 !_#_!
 #  x2003 deep_na_      sw_em_r_
for(wrd in omap["x2003"]){omakevars(x2003,"x2003");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[221]++; if(dbg){print "R221", "sw_em_r_f"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[222]++; if(dbg){print "R222"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[223]++; if(dbg){print "R223"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2004 !_#_!
 #  x2004 deep_na_      sw_em_vr_
for(wrd in omap["x2004"]){omakevars(x2004,"x2004");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[224]++; if(dbg){print "R224", "sw_em_v_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[225]++; if(dbg){print "R225", "sw_em_r_f"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[226]++; if(dbg){print "R226"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[227]++; if(dbg){print "R227"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2005 !_#_!
 #  x2005 deep_na_      sw_es_r_   горя  горя́  го́ря
for(wrd in omap["x2005"]){omakevars(x2005,"x2005");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[228]++; if(dbg){print "R228", "sw_es_r_f"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[229]++; if(dbg){print "R229"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[230]++; if(dbg){print "R230"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2006 !_#_!
 #  x2006 deep_na_      sw_ez_i_
for(wrd in omap["x2006"]){omakevars(x2006,"x2006");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[231]++; if(dbg){print "R231", "sw_ez_i_f"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[232]++; if(dbg){print "R232"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[233]++; if(dbg){print "R233"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2007 !_#_!
 #  x2007 deep_pa_      sw_em_iv_
for(wrd in omap["x2007"]){omakevars(x2007,"x2007");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[234]++; if(dbg){print "R234", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[235]++; if(dbg){print "R235", "sw_em_v_f"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[236]++; if(dbg){print "R236"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[237]++; if(dbg){print "R237"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2008 !_#_!
 #  x2008 deep_pa_      sw_em_r_
for(wrd in omap["x2008"]){omakevars(x2008,"x2008");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[238]++; if(dbg){print "R238", "sw_em_r_f"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[239]++; if(dbg){print "R239"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[240]++; if(dbg){print "R240"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2009 !_#_!
 #  x2009 deep_pa_      sw_ez_i_
for(wrd in omap["x2009"]){omakevars(x2009,"x2009");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[241]++; if(dbg){print "R241", "sw_ez_i_f"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[242]++; if(dbg){print "R242"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[243]++; if(dbg){print "R243"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2010 !_#_!
 #  x2010 deep_pa_      sw_mn_r_
for(wrd in omap["x2010"]){omakevars(x2010,"x2010");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[244]++; if(dbg){print "R244", "sw_mn_r_f"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[245]++; if(dbg){print "R245"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[246]++; if(dbg){print "R246"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2011 !_#_!
 #  x2011 gl_ed1e_      m2_1sw_em_d_2pl_ez_t_
for(wrd in omap["x2011"]){omakevars(x2011,"x2011");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[247]++; if(dbg){print "R247", "sw_em_d_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[248]++; if(dbg){print "R248", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2012 !_#_!
 #  x2012 gl_ed1e_      mest_ez_v_  мою  мо́ю  мою́
for(wrd in omap["x2012"]){omakevars(x2012,"x2012");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pre_vi(-1) &&
           q(1,"prl_edvi prq_edvi") &&
    suw_edvi(2) && s(-1,1) )
 { l[i]=omo2; R[249]++; if(dbg){print "R249"}; continue };
 if ( pre_vi(-1) &&
    suw_edvi(1) && s(-1,0) )
 { l[i]=omo2; R[250]++; if(dbg){print "R250"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[251]++; if(dbg){print "R251", "gl_ed1e_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2013 !_#_!
 #  x2013 gl_ed1e_      qip_ez_v_
for(wrd in omap["x2013"]){omakevars(x2013,"x2013");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[252]++; if(dbg){print "R252", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2014 !_#_!
 #  x2014 gl_ed1e_      sw_1em_d_2ez_v_
for(wrd in omap["x2014"]){omakevars(x2014,"x2014");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[253]++; if(dbg){print "R253", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[254]++; if(dbg){print "R254", "sw_ez_v_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[255]++; if(dbg){print "R255", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2015 !_#_!
 #  x2015 gl_ed1e_      sw_1em_v_2ez_vd_
for(wrd in omap["x2015"]){omakevars(x2015,"x2015");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(1,"suw_ro") && s(0) )
 { l[i]=omo2; R[256]++; if(dbg){print "R256"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[257]++; if(dbg){print "R257", "sw_ez_d_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[258]++; if(dbg){print "R258", "sw_em_v_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[259]++; if(dbg){print "R259", "sw_ez_v_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[260]++; if(dbg){print "R260", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2016 !_#_!
 #  x2016 gl_ed1e_      sw_em_d_
for(wrd in omap["x2016"]){omakevars(x2016,"x2016");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="тону") {
   if ( q(1,"suw_ro") && s(0) )
   { l[i]=omo2; R[261]++; if(dbg){print "R261"}; continue };
 };
 if ( gl_in(1) && s(0) )
 { l[i]=omo1; R[262]++; if(dbg){print "R262"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[263]++; if(dbg){print "R263", "sw_em_d_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[264]++; if(dbg){print "R264", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2017 !_#_!
 #  x2017 gl_ed1e_      sw_em_dr_
for(wrd in omap["x2017"]){omakevars(x2017,"x2017");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="толку") {
   if ( w(-1,"что") && s(-1) )
   { l[i]=omo2; R[265]++; if(dbg){print "R265"}; continue };
   if ( w(1,"от") &&
        q(2,"mest_vi suw_vi") && s(0,1) )
   { l[i]=omo2; R[266]++; if(dbg){print "R266"}; continue };
 };
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[267]++; if(dbg){print "R267", "sw_em_d_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[268]++; if(dbg){print "R268", "sw_em_r_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[269]++; if(dbg){print "R269", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2018 !_#_!
 #  x2018 gl_ed1e_      sw_em_iv_
for(wrd in omap["x2018"]){omakevars(x2018,"x2018");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[270]++; if(dbg){print "R270", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[271]++; if(dbg){print "R271", "sw_em_v_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[272]++; if(dbg){print "R272", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2019 !_#_!
 #  x2019 gl_ed1e_      sw_ems_d_
for(wrd in omap["x2019"]){omakevars(x2019,"x2019");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[273]++; if(dbg){print "R273", "sw_em_d_f"}; continue };
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; R[274]++; if(dbg){print "R274", "sw_es_d_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[275]++; if(dbg){print "R275", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2020 !_#_!
 #  x2020 gl_ed1e_      sw_em_t_
for(wrd in omap["x2020"]){omakevars(x2020,"x2020");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[276]++; if(dbg){print "R276", "sw_em_t_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[277]++; if(dbg){print "R277", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2021 !_#_!
 #  x2021 gl_ed1e_      sw_es_d_
for(wrd in omap["x2021"]){omakevars(x2021,"x2021");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="утру") {
   if ( w(-1,"к") && s(-1) )
   { l[i]=omo1; R[278]++; if(dbg){print "R278"}; continue };
 };
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; R[279]++; if(dbg){print "R279", "sw_es_d_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[280]++; if(dbg){print "R280", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2022 !_#_!
 #  x2022 gl_ed1e_      sw_ez_t_
for(wrd in omap["x2022"]){omakevars(x2022,"x2022");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[281]++; if(dbg){print "R281", "sw_ez_t_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[282]++; if(dbg){print "R282", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2023 !_#_!
 #  x2023 gl_ed1e_      sw_ez_v_
for(wrd in omap["x2023"]){omakevars(x2023,"x2023");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="веду") {
   if ( w(-1,"себя") && s(-1) )
   { l[i]=omo1; R[283]++; if(dbg){print "R283"}; continue };
   if ( w(1,"себя") && s(0) )
   { l[i]=omo1; R[284]++; if(dbg){print "R284"}; continue };
   if ( qxs(1,"я","вот","к")||
        qxs(1,"я","к") )
   { l[i]=omo1; R[285]++; if(dbg){print "R285"}; continue };
 };
 if(iwrd=="уйму") {
   if ( q(1,"suw_ro") && s(0) )
   { l[i]=omo2; R[286]++; if(dbg){print "R286"}; continue };
 };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[287]++; if(dbg){print "R287", "sw_ez_v_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[288]++; if(dbg){print "R288", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2024 !_#_!
 #  x2024 gl_ed1e_      sw_mn_d_
for(wrd in omap["x2024"]){omakevars(x2024,"x2024");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_d_f() )
 { l[i]=omo2; R[289]++; if(dbg){print "R289", "sw_mn_d_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[290]++; if(dbg){print "R290", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2025 !_#_!
 #  x2025 gl_ed3e_      pl_kr_em_
for(wrd in omap["x2025"]){omakevars(x2025,"x2025");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
#if ( gl_ed3e_f() )
#{ l[i]=omo1; R[291]++; if(dbg){print "R291"}; continue };
 #
 if ( pl_kr_em_f() )
 { l[i]=omo2; R[292]++; if(dbg){print "R292", "pl_kr_em_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2026 !_#_!
 #  x2026 gl_ed3e_      sw_em_iv_
for(wrd in omap["x2026"]){omakevars(x2026,"x2026");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_ed3e_f() )
 { l[i]=omo1; R[293]++; if(dbg){print "R293", "gl_ed3e_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[294]++; if(dbg){print "R294", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[295]++; if(dbg){print "R295", "sw_em_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2027 !_#_!
 #  x2027 gl_ed3e_      sw_mn_r_
for(wrd in omap["x2027"]){omakevars(x2027,"x2027");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_ed3e_f() )
 { l[i]=omo1; R[296]++; if(dbg){print "R296", "gl_ed3e_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[297]++; if(dbg){print "R297", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2028 !_#_!
 #  x2028 gl_inf_       sw_1ez_dpr_2mn_iv_
for(wrd in omap["x2028"]){omakevars(x2028,"x2028");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="вести") {
   if ( w(-1,"себя") && s(-1) )
   { l[i]=omo1; R[298]++; if(dbg){print "R298"}; continue };
   if ( w(1,"себя") && s(0) )
   { l[i]=omo1; R[299]++; if(dbg){print "R299"}; continue };
   if ( w(1,"о об") && s(0) )
   { l[i]=omo2; R[300]++; if(dbg){print "R300"}; continue };
 };
 #
 if ( gl_inf_f() )
 { l[i]=omo1; R[301]++; if(dbg){print "R301", "gl_inf_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[302]++; if(dbg){print "R302", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[303]++; if(dbg){print "R303", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[304]++; if(dbg){print "R304", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[305]++; if(dbg){print "R305", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[306]++; if(dbg){print "R306", "sw_mn_v_f"}; continue };


 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2029 !_#_!
 #  x2029 gl_inf_       sw_ez_iv_
for(wrd in omap["x2029"]){omakevars(x2029,"x2029");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="подать") {
   if ( w(-1,"рукой") && s(-1) )
   { l[i]=omo1; R[307]++; if(dbg){print "R307"}; continue };
 };
 #
 if ( gl_inf_f() )
 { l[i]=omo1; R[308]++; if(dbg){print "R308", "sw_ez_i_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[309]++; if(dbg){print "R309", "sw_ez_i_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[310]++; if(dbg){print "R310", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2030 !_#_!
 #  x2030 gl_mn1e_      mest_ems_p_
for(wrd in omap["x2030"]){omakevars(x2030,"x2030");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[311]++; if(dbg){print "R311", "gl_mn1e_f"}; continue };
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2031 !_#_!
 #  x2031 gl_mn1e_      pl_ems_p_
for(wrd in omap["x2031"]){omakevars(x2031,"x2031");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[312]++; if(dbg){print "R312", "gl_mn1e_f"}; continue };
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo2; R[313]++; if(dbg){print "R313", "pl_em_p_f()||pl_es_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2032 !_#_!
 #  x2032 gl_mn1e_      pl_kr_em_
for(wrd in omap["x2032"]){omakevars(x2032,"x2032");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[314]++; if(dbg){print "R314", "gl_mn1e_f"}; continue };
 #
 if ( pl_kr_em_f() )
 { l[i]=omo2; R[315]++; if(dbg){print "R315", "pl_kr_em_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2033 !_#_!
 #  x2033 gl_mn1e_      pq_kr_em_
for(wrd in omap["x2033"]){omakevars(x2033,"x2033");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="переходим") {
   cst="в из на под через";
   if ( w(1,cst) && s(0) )
   { l[i]=omo1; R[316]++; if(dbg){print "R316"}; continue };
 };
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[317]++; if(dbg){print "R317", "gl_mn1e_f"}; continue };
 #
 if ( pq_kr_em_f() )
 { l[i]=omo2; R[318]++; if(dbg){print "R318", "pq_kr_em_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2034 !_#_!
 #  x2034 gl_mn1e_      sw_em_iv_
for(wrd in omap["x2034"]){omakevars(x2034,"x2034");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[319]++; if(dbg){print "R319", "gl_mn1e_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[320]++; if(dbg){print "R320", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[321]++; if(dbg){print "R321", "sw_em_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2035 !_#_!
 #  x2035 gl_mn1e_      sw_em_t_
for(wrd in omap["x2035"]){omakevars(x2035,"x2035");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[322]++; if(dbg){print "R322", "gl_mn1e_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[323]++; if(dbg){print "R323", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2036 !_#_!
 #  x2036 gl_mn1e_      sw_es_t_
for(wrd in omap["x2036"]){omakevars(x2036,"x2036");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[324]++; if(dbg){print "R324", "gl_mn1e_f"}; continue };
 #
 if ( sw_es_t_f() )
 { l[i]=omo2; R[325]++; if(dbg){print "R325", "sw_es_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2037 !_#_!
 #  x2037 gl_mn1e_      sw_mn_r_
for(wrd in omap["x2037"]){omakevars(x2037,"x2037");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[326]++; if(dbg){print "R326", "gl_mn1e_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[327]++; if(dbg){print "R327", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2038 !_#_!
 #  x2038 gl_mn2e_      gl_pomn_
for(wrd in omap["x2038"]){omakevars(x2038,"x2038");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; R[328]++; if(dbg){print "R328", "gl_mn2e_f"}; continue };
 #
 if ( gl_pomn_f() )
 { l[i]=omo2; R[329]++; if(dbg){print "R329", "gl_pomn_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2039 !_#_!
 #  x2039 gl_mn2e_      m2_1sw_em_p_2gl_pomn_
for(wrd in omap["x2039"]){omakevars(x2039,"x2039");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; R[330]++; if(dbg){print "R330", "gl_mn2e_f"}; continue };
 #
 if ( gl_pomn_f() )
 { l[i]=omo2; R[331]++; if(dbg){print "R331", "gl_pomn_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; R[332]++; if(dbg){print "R332", "sw_em_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2040 !_#_!
 #  x2040 gl_mn2e_      sw_em_p_
for(wrd in omap["x2040"]){omakevars(x2040,"x2040");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; R[333]++; if(dbg){print "R333", "gl_mn2e_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; R[334]++; if(dbg){print "R334", "sw_em_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2041 !_#_!
 #  x2041 gl_mn2e_      sw_ez_dp_
for(wrd in omap["x2041"]){omakevars(x2041,"x2041");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[335]++; if(dbg){print "R335", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[336]++; if(dbg){print "R336", "sw_ez_p_f"}; continue };
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; R[337]++; if(dbg){print "R337", "gl_mn2e_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2042 !_#_!
 #  x2042 gl_mn3e_      pq_kr_em_
for(wrd in omap["x2042"]){omakevars(x2042,"x2042");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pq_kr_em_f() )
 { l[i]=omo2; R[338]++; if(dbg){print "R338", "pq_kr_em_f"}; continue };
 #
 if ( gl_mn3e_f() )
 { l[i]=omo1; R[339]++; if(dbg){print "R339", "gl_mn1e_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2043 !_#_!
 #  x2043 gl_mn3e_      sw_mn_r_
for(wrd in omap["x2043"]){omakevars(x2043,"x2043");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[340]++; if(dbg){print "R340", "sw_mn_r_f"}; continue };
 #
 if ( gl_mn3e_f() )
 { l[i]=omo1; R[341]++; if(dbg){print "R341", "gl_mn1e_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2044 !_#_!
 #  x2044 gl_mn3e_      sw_mn_vr_
for(wrd in omap["x2044"]){omakevars(x2044,"x2044");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[342]++; if(dbg){print "R342", "sw_mn_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[343]++; if(dbg){print "R343", "sw_mn_r_f"}; continue };
 #
 if ( gl_mn3e_f() )
 { l[i]=omo1; R[344]++; if(dbg){print "R344", "gl_mn1e_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2045 !_#_!
 #  x2045 gl_paedmu_pe_	  m2_1pl_kr_em_2gl_paedmu_ne_  умел  умёл  уме́л
for(wrd in omap["x2045"]){omakevars(x2045,"x2045");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(1,"prl_kred_sr nar_spos") &&
  gl_in(2) && s(0,1) )
 { l[i]=omo2; R[345]++; if(dbg){print "R345"}; continue };
 if ( gl_in(1) && s(0) )
 { l[i]=omo2; R[346]++; if(dbg){print "R346"}; continue };
 if ( pl_kr_em_f() )
 { l[i]=omo2; R[347]++; if(dbg){print "R347", "pl_kr_em_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2046 !_#_!
 #  x2046 gl_paedmu_    pl_kr_em_  смел  смёл  сме́л
for(wrd in omap["x2046"]){omakevars(x2046,"x2046");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"не") &&
     qf(1,3,"gl_in") && s(-1,qfn-1) )
 { l[i]=omo2; R[348]++; if(dbg){print "R348"}; continue };
 #
 if ( pl_kr_em_f() )
 { l[i]=omo2; R[349]++; if(dbg){print "R349", "pl_kr_em_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2047 !_#_!
 #  x2047 gl_paedmu_    sw_1em_i_2mn_r_
for(wrd in omap["x2047"]){omakevars(x2047,"x2047");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; R[350]++; if(dbg){print "R350", "gl_paedmu_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[351]++; if(dbg){print "R351", "sw_em_i_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[352]++; if(dbg){print "R352", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2048 !_#_!
 #  x2048 gl_paedmu_    sw_1em_iv_2mn_r_
for(wrd in omap["x2048"]){omakevars(x2048,"x2048");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; R[353]++; if(dbg){print "R353", "gl_paedmu_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[354]++; if(dbg){print "R354", "sw_mn_r_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[355]++; if(dbg){print "R355", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[356]++; if(dbg){print "R356", "sw_em_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2049 !_#_!
 #  x2049 gl_paedmu_    sw_em_i_
for(wrd in omap["x2049"]){omakevars(x2049,"x2049");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="осел") {
   if ( q(1,"suw_ro") && s(0) )
   { l[i]=omo2; R[357]++; if(dbg){print "R357"}; continue };
 };
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; R[358]++; if(dbg){print "R358", "gl_paedmu_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[359]++; if(dbg){print "R359", "sw_em_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2050 !_#_!
 #  x2050 gl_paedmu_    sw_em_iv_
for(wrd in omap["x2050"]){omakevars(x2050,"x2050");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="запах") {
   if ( q(1,"suw_ro") && s(0) )
   { l[i]=omo2; R[360]++; if(dbg){print "R360"}; continue };
 };
 if(iwrd=="замер") {
   if ( q(1,"suw_ro") && s(0) )
   { l[i]=omo2; R[361]++; if(dbg){print "R361"}; continue };
 };
 if(iwrd=="обмер") {
   if ( q(1,"suw_ro") && s(0) )
   { l[i]=omo2; R[362]++; if(dbg){print "R362"}; continue };
 };
 if(iwrd=="перемер") {
   if ( q(1,"suw_ro") && s(0) )
   { l[i]=omo2; R[363]++; if(dbg){print "R363"}; continue };
 };
 if(iwrd=="погреб") {
   if ( q(1,"suw_ro") && s(0) )
   { l[i]=omo2; R[364]++; if(dbg){print "R364"}; continue };
 };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[365]++; if(dbg){print "R365", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[366]++; if(dbg){print "R366", "sw_em_v_f"}; continue };
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; R[367]++; if(dbg){print "R367", "gl_paedmu_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2051 !_#_!
 #  x2051 gl_paedmu_	sw_mn_r_
for(wrd in omap["x2051"]){omakevars(x2051,"x2051");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[368]++; if(dbg){print "R368", "sw_mn_r_f"}; continue };
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; R[369]++; if(dbg){print "R369", "gl_paedmu_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2052 !_#_!
 #  x2052 gl_paedmu_    sw_mn_vr_
for(wrd in omap["x2052"]){omakevars(x2052,"x2052");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; R[370]++; if(dbg){print "R370", "gl_paedmu_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[371]++; if(dbg){print "R371", "sw_mn_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[372]++; if(dbg){print "R372", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2053 !_#_!
 #  x2053 gl_paedsr_    sw_es_iv_
for(wrd in omap["x2053"]){omakevars(x2053,"x2053");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="начало") {
   if ( gl_in(1) && s(0) )
   { l[i]=omo1; R[373]++; if(dbg){print "R373"}; continue };
   if ( q(1,"prl_kred_sr prq_kred_sr") && s(0) && Q_w(2,"gl_in") )
   { l[i]=omo2; R[374]++; if(dbg){print "R374"}; continue };
   if ( q(1,"suw_ro") && s(0) )
   { l[i]=omo2; R[375]++; if(dbg){print "R375"}; continue };
 };
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; R[376]++; if(dbg){print "R376", "sw_es_i_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; R[377]++; if(dbg){print "R377", "sw_es_v_f"}; continue };
 #
 if ( gl_paedsr_f() )
 { l[i]=omo1; R[378]++; if(dbg){print "R378", "gl_paedsr_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2054 !_#_!
 #  x2054 m2_1sw_es_r_2gl_paedze_  sw_mn_iv_  дела   де́ла   дела́
for(wrd in omap["x2054"]){omakevars(x2054,"x2054");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qxs(-1,"для","пользы") )
 { l[i]=omo1; R[379]++; if(dbg){print "R379"}; continue };
 if ( wb(-5,-1,"как") && s(wbn,-1) )
 { l[i]=omo2; R[380]++; if(dbg){print "R380"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; R[381]++; if(dbg){print "R381", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[382]++; if(dbg){print "R382", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[383]++; if(dbg){print "R383", "sw_mn_v_f"}; continue };
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; R[384]++; if(dbg){print "R384", "gl_paedze_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2055 !_#_!
 #  x2055 gl_paedze_    sw_1es_r_2mn_iv_
for(wrd in omap["x2055"]){omakevars(x2055,"x2055");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="начала") {
   if ( w(-2,"с до") &&
        w(-1,"самого") && s(-2,-1) )
   { l[i]=omo2; R[385]++; if(dbg){print "R385"}; continue };
   if ( gl_in(1) && s(0) )
   { l[i]=omo1; R[386]++; if(dbg){print "R386"}; continue };
   if ( (suw_edzeim(1)||w(1,"она")) && s(0) )
   { l[i]=omo1; R[387]++; if(dbg){print "R387"}; continue };
 };
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[388]++; if(dbg){print "R388", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[389]++; if(dbg){print "R389", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[390]++; if(dbg){print "R390", "sw_mn_v_f"}; continue };
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; R[391]++; if(dbg){print "R391", "gl_paedze_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2056 !_#_!
 #  x2056 gl_paedze_    sw_em_i_
for(wrd in omap["x2056"]){omakevars(x2056,"x2056");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[392]++; if(dbg){print "R392", "sw_em_i_f"}; continue };
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; R[393]++; if(dbg){print "R393", "gl_paedze_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2057 !_#_!
 #  x2057 gl_paedze_    sw_em_r_
for(wrd in omap["x2057"]){omakevars(x2057,"x2057");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[394]++; if(dbg){print "R394", "sw_em_r_f"}; continue };
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; R[395]++; if(dbg){print "R395", "gl_paedze_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2058 !_#_!
 #  x2058 gl_pamn_      gl_poed_
for(wrd in omap["x2058"]){omakevars(x2058,"x2058");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="попали") {
   if ( wb(-5,-1,"как куда никуда они вы мы") && s(wbn,-1) )
   { l[i]=omo1; R[396]++; if(dbg){print "R396"}; continue };
   if ( q(1,"pre_vi") && s(0) )
   { l[i]=omo1; R[397]++; if(dbg){print "R397", "gl_pamn_f"}; continue };
 };
 if(iwrd=="дели") {
   if ( wb(-5,-1,"куда никуда они вы мы") && s(wbn,-1) )
   { l[i]=omo1; R[398]++; if(dbg){print "R398"}; continue };
 };
 if(iwrd=="пили") {
   cst="вино виски водки воду какао кофе минералку пиво самогон сок чай";
   if ( w(1,cst) && s(0) )
   { l[i]=omo1; R[399]++; if(dbg){print "R399"}; continue };
 };
 #
 if ( w(1,"под") && s(0) )
 { l[i]=omo1; R[400]++; if(dbg){print "R400", "gl_pamn_f"}; continue };
 if ( q(-1,"mest_da suw_da") && s(-1) )
 { l[i]=omo1; R[401]++; if(dbg){print "R401", "gl_pamn_f"}; continue };

 if ( wb(-5,-1,"пока если когда") && s(wbn,-1) )
 { l[i]=omo1; R[402]++; if(dbg){print "R402"}; continue };
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; R[403]++; if(dbg){print "R403", "gl_pamn_f"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo2; R[404]++; if(dbg){print "R404", "gl_poed_f"}; continue };
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2059 !_#_!
 #  x2059 gl_pamn_      nar_mest_
for(wrd in omap["x2059"]){omakevars(x2059,"x2059");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; R[405]++; if(dbg){print "R405", "gl_pamn_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2060 !_#_!
 #  x2060 gl_pamn_      sw_1ez_dpr_2mn_iv_
for(wrd in omap["x2060"]){omakevars(x2060,"x2060");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; R[406]++; if(dbg){print "R406", "gl_pamn_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[407]++; if(dbg){print "R407", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[408]++; if(dbg){print "R408", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[409]++; if(dbg){print "R409", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[410]++; if(dbg){print "R410", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[411]++; if(dbg){print "R411", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2061 !_#_!
 #  x2061 gl_pamn_      sw_1ez_r_2mn_iv_
for(wrd in omap["x2061"]){omakevars(x2061,"x2061");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; R[412]++; if(dbg){print "R412", "gl_pamn_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[413]++; if(dbg){print "R413", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[414]++; if(dbg){print "R414", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[415]++; if(dbg){print "R415", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2062 !_#_!
 #  x2062 gl_pamn_      sw_ez_dpr_  устали  уста́ли  у́стали
for(wrd in omap["x2062"]){omakevars(x2062,"x2062");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"без") && s(-1) )
 { l[i]=omo2; R[416]++; if(dbg){print "R416"}; continue };
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; R[417]++; if(dbg){print "R417", "gl_pamn_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2063 !_#_!
 #  x2063 gl_poed_      mest_ez_dprt_  нашей  наше́й  на́шей
for(wrd in omap["x2063"]){omakevars(x2063,"x2063");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[418]++; if(dbg){print "R418"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[419]++; if(dbg){print "R419", "gl_poed_f"}; continue };
 #
 if ( q(-1,"pre_da pre_pr pre_ro pre_tv") &&
      q(1,"suw_edzeda suw_edzepr suw_edzero suw_edzetv prl_edzeda prl_edzepr prl_edzero prl_edzetv") && s(-1,0) )
 { l[i]=omo2; R[420]++; if(dbg){print "R420"}; continue };
 if ( q(-1,"pre_da pre_pr pre_ro pre_tv prl_srav prl_edzevi") && s(-1) && (p(0)||q_w(1,"pre_any sz_iili name_ro_sy isname")) )
 { l[i]=omo2; R[421]++; if(dbg){print "R421"}; continue };
 if ( q(1,"suw_edzeda suw_edzepr suw_edzero suw_edzetv prl_edzeda prl_edzepr prl_edzero prl_edzetv") && s(0) )
 { l[i]=omo2; R[422]++; if(dbg){print "R422"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2064 !_#_!
 #  x2064 gl_poed_pamn_	sw_1ez_dpr_2mn_iv_  отмели  отмели́  о́тмели
for(wrd in omap["x2064"]){omakevars(x2064,"x2064");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[423]++; if(dbg){print "R423"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[424]++; if(dbg){print "R424", "gl_poed_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[425]++; if(dbg){print "R425", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[426]++; if(dbg){print "R426", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[427]++; if(dbg){print "R427", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[428]++; if(dbg){print "R428", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[429]++; if(dbg){print "R429", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2065 !_#_!
 #  x2065 gl_poed_      sw_1em_n_2ez_dpr_3mn_iv_
for(wrd in omap["x2065"]){omakevars(x2065,"x2065");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[430]++; if(dbg){print "R430"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[431]++; if(dbg){print "R431", "gl_poed_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[432]++; if(dbg){print "R432", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[433]++; if(dbg){print "R433", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[434]++; if(dbg){print "R434", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[435]++; if(dbg){print "R435", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[436]++; if(dbg){print "R436", "sw_mn_v_f"}; continue };


 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2066 !_#_!
 #  x2066 gl_poed_      sw_1ez_dpr_2mn_iv_
for(wrd in omap["x2066"]){omakevars(x2066,"x2066");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 cst="гати грани дрожи заводи копи крепи моли пади топи";
 if ( p(-1) && sc(0,"!") && w(0,cst) )
 { l[i]=omo1; R[437]++; if(dbg){print "R437"}; continue };
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[438]++; if(dbg){print "R438"}; continue };

 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[439]++; if(dbg){print "R439", "gl_poed_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[440]++; if(dbg){print "R440", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[441]++; if(dbg){print "R441", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[442]++; if(dbg){print "R442", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[443]++; if(dbg){print "R443", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[444]++; if(dbg){print "R444", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2067 !_#_!
 #  x2067 gl_poed_      sw_1ez_r_2mn_iv_3es_n_  суши  суши́  су́ши
for(wrd in omap["x2067"]){omakevars(x2067,"x2067");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[445]++; if(dbg){print "R445"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[446]++; if(dbg){print "R446", "gl_poed_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[447]++; if(dbg){print "R447", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[448]++; if(dbg){print "R448", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[449]++; if(dbg){print "R449", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2068 !_#_!
 #  x2068 gl_poed_      sw_1ez_dprv_2mn_iv_
for(wrd in omap["x2068"]){omakevars(x2068,"x2068");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[450]++; if(dbg){print "R450"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[451]++; if(dbg){print "R451", "gl_poed_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[452]++; if(dbg){print "R452", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[453]++; if(dbg){print "R453", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2069 !_#_!
 #  x2069 gl_poed_      sw_1ez_r_2mn_iv_
for(wrd in omap["x2069"]){omakevars(x2069,"x2069");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[454]++; if(dbg){print "R454"}; continue };
 if(iwrd=="пищи") {
   if ( base(-1,"запас") && s(-1) )
   { l[i]=omo2; R[455]++; if(dbg){print "R455"}; continue };
 };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[456]++; if(dbg){print "R456", "gl_poed_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[457]++; if(dbg){print "R457", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[458]++; if(dbg){print "R458", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[459]++; if(dbg){print "R459", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2070 !_#_!
 #  x2070 gl_poed_      sw_1mn_iv_2gl_pamn_
for(wrd in omap["x2070"]){omakevars(x2070,"x2070");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[460]++; if(dbg){print "R460"}; continue };
 if ( wb(-5,-1,"пока если когда") && s(wbn,-1) )
 { l[i]=omo2; R[461]++; if(dbg){print "R461"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[462]++; if(dbg){print "R462", "gl_poed_f"}; continue };
 #
 if ( gl_pamn_f() )
 { l[i]=omo2; R[463]++; if(dbg){print "R463", "gl_pamn_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[464]++; if(dbg){print "R464", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[465]++; if(dbg){print "R465", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2071 !_#_!
 #  x2071 gl_poed_      sw_em_i_
for(wrd in omap["x2071"]){omakevars(x2071,"x2071");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[466]++; if(dbg){print "R466"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[467]++; if(dbg){print "R467", "gl_poed_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[468]++; if(dbg){print "R468", "sw_em_i_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2072 !_#_!
 #  x2072 gl_poed_      sw_es_dpr_
for(wrd in omap["x2072"]){omakevars(x2072,"x2072");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[469]++; if(dbg){print "R469"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[470]++; if(dbg){print "R470", "gl_poed_f"}; continue };
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; R[471]++; if(dbg){print "R471", "sw_es_d_f"}; continue };
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; R[472]++; if(dbg){print "R472", "sw_es_p_f"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[473]++; if(dbg){print "R473", "sw_es_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2073 !_#_!
 #  x2073 gl_poed_      sw_es_n_  веди  веди́  ве́ди
for(wrd in omap["x2073"]){omakevars(x2073,"x2073");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[474]++; if(dbg){print "R474"}; continue };
 if ( q(1,"mest_vi") &&
      q(2,"nar_spos prl_kred_sr") && s(0,1) )
 { l[i]=omo1; R[475]++; if(dbg){print "R475", "gl_poed_f"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[476]++; if(dbg){print "R476", "gl_poed_f"}; continue };
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2074 !_#_!
 #  x2074 gl_poed_	sw_ez_dpr_
for(wrd in omap["x2074"]){omakevars(x2074,"x2074");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[477]++; if(dbg){print "R477"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[478]++; if(dbg){print "R478", "gl_poed_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[479]++; if(dbg){print "R479", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[480]++; if(dbg){print "R480", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[481]++; if(dbg){print "R481", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2075 !_#_!
 #  x2075 gl_poed_      sw_ez_iv_  казни  казни́  ка́зни
for(wrd in omap["x2075"]){omakevars(x2075,"x2075");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[482]++; if(dbg){print "R482"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[483]++; if(dbg){print "R483", "gl_poed_f"}; continue };
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2076 !_#_!
 #  x2076 gl_poed_      sw_ez_r_
for(wrd in omap["x2076"]){omakevars(x2076,"x2076");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[484]++; if(dbg){print "R484"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[485]++; if(dbg){print "R485", "gl_poed_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[486]++; if(dbg){print "R486", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2077 !_#_!
 #  x2077 gl_poed_      sw_ez_t_
for(wrd in omap["x2077"]){omakevars(x2077,"x2077");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[487]++; if(dbg){print "R487"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[488]++; if(dbg){print "R488", "gl_poed_f"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[489]++; if(dbg){print "R489", "sw_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2078 !_#_!
 #  x2078 gl_poed_      sw_mn_i_
for(wrd in omap["x2078"]){omakevars(x2078,"x2078");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[490]++; if(dbg){print "R490"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[491]++; if(dbg){print "R491", "gl_poed_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[492]++; if(dbg){print "R492", "sw_mn_i_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2079 !_#_!
 #  x2079 gl_poed_      sw_mn_iv_
for(wrd in omap["x2079"]){omakevars(x2079,"x2079");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[493]++; if(dbg){print "R493"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[494]++; if(dbg){print "R494", "gl_poed_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[495]++; if(dbg){print "R495", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[496]++; if(dbg){print "R496", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2080 !_#_!
 #  x2080 gl_poed_      sw_mn_r_
for(wrd in omap["x2080"]){omakevars(x2080,"x2080");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[497]++; if(dbg){print "R497"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[498]++; if(dbg){print "R498", "gl_poed_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[499]++; if(dbg){print "R499", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2081 !_#_!
 #  x2081 gl_pomn_      sw_em_p_
for(wrd in omap["x2081"]){omakevars(x2081,"x2081");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[500]++; if(dbg){print "R500"}; continue };
 #
 if ( gl_pomn_f() )
 { l[i]=omo1; R[501]++; if(dbg){print "R501", "gl_pomn_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; R[502]++; if(dbg){print "R502", "sw_em_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2082 !_#_!
 #  x2082 m2_1gl_mn1e_2pq_kr_em_   sw_em_t_
for(wrd in omap["x2082"]){omakevars(x2082,"x2082");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[503]++; if(dbg){print "R503", "gl_mn1e_f"}; continue };
 #
 if ( pq_kr_em_f() )
 { l[i]=omo1; R[504]++; if(dbg){print "R504", "pq_kr_em_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[505]++; if(dbg){print "R505", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2083 !_#_!
 #  x2083 m2_1gl_mn1e_2qik_d_      sw_mn_r_
for(wrd in omap["x2083"]){omakevars(x2083,"x2083");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[506]++; if(dbg){print "R506", "gl_mn1e_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[507]++; if(dbg){print "R507", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2084 !_#_!
 #  x2084 m2_1gl_poed_2nar_spos_   sw_ez_t_  порой  поро́й  по́рой
for(wrd in omap["x2084"]){omakevars(x2084,"x2084");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[508]++; if(dbg){print "R508", "gl_poed_f"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[509]++; if(dbg){print "R509", "sw_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2085 !_#_!
 #  x2085 m2_1nar_kaq_2pred_ro_	   sw_em_t_
for(wrd in omap["x2085"]){omakevars(x2085,"x2085");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(-2,"suw_im") &&
   base(-1,"идти") && s(-2,-1) )
 { l[i]=omo2; R[510]++; if(dbg){print "R510", "sw_em_t_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[511]++; if(dbg){print "R511", "sw_em_t_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2086 !_#_!
 #  x2086 m2_1nar_vrem_2pred_ro_   sw_em_p_     после   по́сле   после́
for(wrd in omap["x2086"]){omakevars(x2086,"x2086");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sos(-20,-2) && Qb(son+1,-1,"pre_pr") )
 { l[i]=omo1; R[512]++; if(dbg){print "R512"}; continue };

 if ( w(-2,"самого") &&
      q(-1,"prl_edmuro") &&
      q(1,"suw_edro name_ro_sy isname") && s(-2,0) )
 { l[i]=omo1; R[513]++; if(dbg){print "R513"}; continue };
 if ( w(-2,"самой") &&
      q(-1,"prl_edzeda") &&
      q(1,"suw_edro name_ro_sy isname") && s(-2,0) )
 { l[i]=omo1; R[514]++; if(dbg){print "R514"}; continue };
 if ( p(-1) )
 { l[i]=omo1; R[515]++; if(dbg){print "R515"}; continue };
 if ( q(-1,"gl_in") && s(-1) )
 { l[i]=omo1; R[516]++; if(dbg){print "R516"}; continue };
 cst="а и но ну однако по уж";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[517]++; if(dbg){print "R517"}; continue };
 if ( q(1,"qik_ro") &&
      q(2,"qik_ro suw_mnro") && s(0,1) )
 { l[i]=omo1; R[518]++; if(dbg){print "R518"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; R[519]++; if(dbg){print "R519", "sw_em_p_f"}; continue };
 #
 if ( q(1,"suw_ro prl_ro mest_ro") )
 { l[i]=omo1; R[520]++; if(dbg){print "R520"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2087 !_#_!
 #  x2087 m2_1pl_srav_2gl_poed_	   pl_ez_dprt_  свежей  свеже́й  све́жей
for(wrd in omap["x2087"]){omakevars(x2087,"x2087");for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(-1,"-" ) )
 { l[i]=omo2; R[521]++; if(dbg){print "R521"}; continue };
 if ( sc(0,"-" ) )
 { l[i]=omo2; R[522]++; if(dbg){print "R522"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[523]++; if(dbg){print "R523", "gl_poed_f"}; continue };
 #
 if ( pl_srav_f() )
 { l[i]=omo1; R[524]++; if(dbg){print "R524", "pl_srav_f"}; continue };
 #
 if ( pl_ez_d_f() )
 { l[i]=omo2; R[525]++; if(dbg){print "R525", "pl_ez_d_f"}; continue };
 #
 if ( pl_ez_p_f() )
 { l[i]=omo2; R[526]++; if(dbg){print "R526", "pl_ez_p_f"}; continue };
 #
 if ( pl_ez_r_f() )
 { l[i]=omo2; R[527]++; if(dbg){print "R527", "pl_ez_r_f"}; continue };
 #
 if ( pl_ez_t_f() )
 { l[i]=omo2; R[528]++; if(dbg){print "R528", "pl_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2088 !_#_!
 #  x2088 m2_1pl_srav_2gl_poed_	   sw_ez_t_  бурей  буре́й  бу́рей
for(wrd in omap["x2088"]){omakevars(x2088,"x2088");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[529]++; if(dbg){print "R529", "gl_poed_f"}; continue };
 #
 if ( pl_srav_f() )
 { l[i]=omo1; R[530]++; if(dbg){print "R530", "pl_srav_f"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[531]++; if(dbg){print "R531", "sw_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2089 !_#_!
 #  x2089 m2_1sw_em_d_2gl_ed1e_	   pl_ez_dprt_
for(wrd in omap["x2089"]){omakevars(x2089,"x2089");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[532]++; if(dbg){print "R532", "sw_em_d_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[533]++; if(dbg){print "R533", "gl_ed1e_f"}; continue };
 #
 if ( pl_ez_d_f() )
 { l[i]=omo2; R[534]++; if(dbg){print "R534", "pl_ez_d_f"}; continue };
 #
 if ( pl_ez_p_f() )
 { l[i]=omo2; R[535]++; if(dbg){print "R535", "pl_ez_p_f"}; continue };
 #
 if ( pl_ez_r_f() )
 { l[i]=omo2; R[536]++; if(dbg){print "R536", "pl_ez_r_f"}; continue };
 #
 if ( pl_ez_t_f() )
 { l[i]=omo2; R[537]++; if(dbg){print "R537", "pl_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2090 !_#_!
 #  x2090 m2_1sw_em_d_2gl_ed1e_	   sw_em_l_
for(wrd in omap["x2090"]){omakevars(x2090,"x2090");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; R[538]++; if(dbg){print "R538", "sw_em_l_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[539]++; if(dbg){print "R539", "sw_em_d_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[540]++; if(dbg){print "R540", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2091 !_#_!
 #  x2091 m2_1sw_em_d_2gl_poed_	   pl_ez_dprt_
for(wrd in omap["x2091"]){omakevars(x2091,"x2091");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[541]++; if(dbg){print "R541", "gl_poed_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[542]++; if(dbg){print "R542", "sw_em_d_f"}; continue };
 #
 if ( pl_ez_d_f() )
 { l[i]=omo2; R[543]++; if(dbg){print "R543", "pl_ez_d_f"}; continue };
 #
 if ( pl_ez_p_f() )
 { l[i]=omo2; R[544]++; if(dbg){print "R544", "pl_ez_p_f"}; continue };
 #
 if ( pl_ez_r_f() )
 { l[i]=omo2; R[545]++; if(dbg){print "R545", "pl_ez_r_f"}; continue };
 #
 if ( pl_ez_t_f() )
 { l[i]=omo2; R[546]++; if(dbg){print "R546", "pl_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2092 !_#_!
 #  x2092 m2_1sw_em_l_2gl_ed1e_	   sw_em_dz_
for(wrd in omap["x2092"]){omakevars(x2092,"x2092");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_z_f() )
 { l[i]=omo2; R[547]++; if(dbg){print "R547", "sw_em_z_f"}; continue };
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; R[548]++; if(dbg){print "R548", "sw_em_l_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[549]++; if(dbg){print "R549", "sw_em_d_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[550]++; if(dbg){print "R550", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2093 !_#_!
 #  x2093 gl_poed_	   sw_1ez_dprz_2mn_iv_
for(wrd in omap["x2093"]){omakevars(x2093,"x2093");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qw_(-1,"pre_any sz_iili")||q_w(1,"pre_any sz_iili") )
 { l[i]=omo2; R[551]++; if(dbg){print "R551"}; continue };
 #
 if ( sw_em_z_f() )
 { l[i]=omo2; R[552]++; if(dbg){print "R552", "sw_em_z_f"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[553]++; if(dbg){print "R553", "gl_poed_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[554]++; if(dbg){print "R554", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[555]++; if(dbg){print "R555", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[556]++; if(dbg){print "R556", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[557]++; if(dbg){print "R557", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[558]++; if(dbg){print "R558", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2094 !_#_!
 #  x2094 m2_1sw_em_p_2nar_vrem_   pl_srav_  уже  уже́  у́же
for(wrd in omap["x2094"]){omakevars(x2094,"x2094");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qxs(1,"в","плечах талии обхвате окружности диаметре") )
 { l[i]=omo2; R[559]++; if(dbg){print "R559"}; continue };
 if ( w(-3,"на") &&
      q(-2,"qin_im qik_im") &&
      q(-1,"suw_ro") &&
      q(1,"suw_ro") && s(-3,0) )
 { l[i]=omo2; R[560]++; if(dbg){print "R560"}; continue };
 #
 cst="о об обо про с со через";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[561]++; if(dbg){print "R561"}; continue };
 cst="некуда нельзя нет никого никому никто ничего ничто";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[562]++; if(dbg){print "R562"}; continue };
 if ( q(1,"nar_vrem nar_step nar_mest nar_spos nar_nar") && s(0) )
 { l[i]=omo1; R[563]++; if(dbg){print "R563"}; continue };
 if ( w(1,"не") &&
      q(2,"prl_im prq_im mest_im") &&
      q(3,"suw_im prl_im") && s(0,2) )
 { l[i]=omo1; R[564]++; if(dbg){print "R564"}; continue };
 if ( w(1,"не") &&
      q(2,"suw_im") && s(0,1) )
 { l[i]=omo1; R[565]++; if(dbg){print "R565"}; continue };
 if ( q(1,"prl_im prq_im mest_im") &&
      q(2,"suw_im prl_im") && s(0,1) )
 { l[i]=omo1; R[566]++; if(dbg){print "R566"}; continue };
 if ( q(1,"suw_im prl_srav") && s(0) )
 { l[i]=omo1; R[567]++; if(dbg){print "R567"}; continue };
 if ( q(1,"prl_vi prq_vi mest_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[568]++; if(dbg){print "R568"}; continue };
 if ( q(1,"prl_tv prq_tv mest_tv") &&
      q(2,"suw_tv prl_tv") && s(0,1) )
 { l[i]=omo1; R[569]++; if(dbg){print "R569"}; continue };
 if ( q(1,"suw_tv") && s(0) )
 { l[i]=omo1; R[570]++; if(dbg){print "R570"}; continue };
 if ( (w(1,"не всё все")||q(1,"prl_kred_sr")) &&
       q(2,"gl_in gl_ed gl_mn gl_vzmn deep prq_kred prq_krmn prl_kred prl_krmn") && s(0,1) )
 { l[i]=omo1; R[571]++; if(dbg){print "R571"}; continue };
 if ( q(1,"gl_in gl_ed gl_mn gl_vzmn deep prq_kred prq_krmn prl_kred prl_krmn") && s(0) )
 { l[i]=omo1; R[572]++; if(dbg){print "R572"}; continue };
 if ( q(1,"qik_im qin_im") &&
      q(2,"suw_mnro qik_im qik_vi qip_edvi qip_mnvi") && s(0,1) )
 { l[i]=omo1; R[573]++; if(dbg){print "R573"}; continue };
 if ( q(1,"qi_duom qi_duoz") &&
      q(2,"suw_edro") && s(0,1) )
 { l[i]=omo1; R[574]++; if(dbg){print "R574"}; continue };
 if ( q(1,"pre_pr") &&
      q(2,"prl_pr mest_pr prq_pr") &&
      q(3,"suw_pr suw_edme") && s(0,2) )
 { l[i]=omo1; R[575]++; if(dbg){print "R575"}; continue };
 if ( q(1,"pre_pr") &&
      q(2,"suw_pr suw_edme") && s(0,1) )
 { l[i]=omo1; R[576]++; if(dbg){print "R576"}; continue };
 if ( q(-1,"mest_im suw_im") &&
      q(1,"mest_da suw_da mest_vi suw_vi mest_3e") &&
      q(2,"gl_in gl_ed gl_mn gl_vzmn deep") && s(-1,1) )
 { l[i]=omo1; R[577]++; if(dbg){print "R577"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[578]++; if(dbg){print "R578", "sw_em_p_f"}; continue };
 #
 if ( pl_srav_f() )
 { l[i]=omo2; R[579]++; if(dbg){print "R579", "pl_srav_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2095 !_#_!
 #  x2095 m2_1sw_em_p_2pl_ems_p_   sw_es_t_
for(wrd in omap["x2095"]){omakevars(x2095,"x2095");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; R[580]++; if(dbg){print "R580", "pl_em_p_f()||pl_es_p_f"}; continue };
 #
 if ( sw_es_t_f() )
 { l[i]=omo2; R[581]++; if(dbg){print "R581", "sw_es_t_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[582]++; if(dbg){print "R582", "sw_em_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2096 !_#_!
 #  x2096 m2_1sw_em_r_2pl_kr_em_r_   pl_kr_ez_  бела бе́ла бела́
for(wrd in omap["x2096"]){omakevars(x2096,"x2096");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[583]++; if(dbg){print "R583", "sw_em_r_f"}; continue };
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo2; R[584]++; if(dbg){print "R584", "pl_kr_ez_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2097 !_#_!
 #  x2097 m2_1sw_em_t_2pl_ems_p_   sw_em_iv_
for(wrd in omap["x2097"]){omakevars(x2097,"x2097");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; R[585]++; if(dbg){print "R585", "pl_em_p_f()||pl_es_p_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo1; R[586]++; if(dbg){print "R586", "sw_em_t_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[587]++; if(dbg){print "R587", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[588]++; if(dbg){print "R588", "sw_em_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2098 !_#_!
 #  x2098 m2_1sw_es_p_2pl_ems_p_   sw_es_t_
for(wrd in omap["x2098"]){omakevars(x2098,"x2098");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; R[589]++; if(dbg){print "R589", "pl_em_p_f()||pl_es_p_f"}; continue };
 #
 if ( sw_es_t_f() )
 { l[i]=omo2; R[590]++; if(dbg){print "R590", "sw_es_t_f"}; continue };
 #
 if ( sw_es_p_f() )
 { l[i]=omo1; R[591]++; if(dbg){print "R591", "sw_es_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2099 !_#_!
 #  x2099 m2_1sw_ez_dp_2nar_napr_  sw_es_ivp_  горе  горе́  го́ре
for(wrd in omap["x2099"]){omakevars(x2099,"x2099");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"на") && s(-1) && p(-2) && p(0) )
 { R[592]++; if(dbg){print "R592", "stopper"}; continue };
 if ( w(-1,"на") && s(-1) && p(-2) && tf(1,3,"dvi") )
 { R[593]++; if(dbg){print "R593", "stopper"}; continue };

 if ( base(-2,"воздеть") && w(-1,"руки") && s(-2,-1) )
 { l[i]=omo1; R[594]++; if(dbg){print "R594"}; continue };
 if ( w(-1,"на") && s(-1) && (qw_(-2,"mest_da suw_da")||q_w(1,"mest_da suw_da")) )
 { l[i]=omo2; R[595]++; if(dbg){print "R595"}; continue };
 if ( sw_es_i_f() )
 { l[i]=omo2; R[596]++; if(dbg){print "R596", "sw_es_i_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; R[597]++; if(dbg){print "R597", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo1; R[598]++; if(dbg){print "R598", "sw_ez_p_f"}; continue };
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; R[599]++; if(dbg){print "R599", "sw_es_p_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; R[600]++; if(dbg){print "R600", "sw_es_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2100 !_#_!
 #  x2100 m2_1sw_ez_l_2gl_poed_pamn_      sw_1ez_dpr_2mn_iv_
for(wrd in omap["x2100"]){omakevars(x2100,"x2100");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[601]++; if(dbg){print "R601", "gl_poed_f"}; continue };
 #
 if ( sw_ez_l_f() )
 { l[i]=omo1; R[602]++; if(dbg){print "R602", "sw_ez_l_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[603]++; if(dbg){print "R603", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[604]++; if(dbg){print "R604", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[605]++; if(dbg){print "R605", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[606]++; if(dbg){print "R606", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[607]++; if(dbg){print "R607", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2101 !_#_!
 #  x2101 m2_1sw_ez_l_2gl_poed_    sw_1ez_dprz_2mn_iv_
for(wrd in omap["x2101"]){omakevars(x2101,"x2101");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="кости") {
   cst="выиграть игра играть проиграть проиграться";
   if ( w(-1,"в") && base(-2,cst) && s(-2,-1) )
   { l[i]=omo2; R[608]++; if(dbg){print "R608"}; continue };
 };
 if ( pre_any(-1) && W(-1,"в на") && s(-1) )
 { l[i]=omo2; R[609]++; if(dbg){print "R609"}; continue };
 if ( pre_any(-3) && W(-3,"в на") &&
      suw_any(-2) &&
      sz_iili(-1) && s(-3,-1) )
 { l[i]=omo2; R[610]++; if(dbg){print "R610"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[611]++; if(dbg){print "R611", "gl_poed_f"}; continue };
 #
 if ( sw_ez_l_f() )
 { l[i]=omo1; R[612]++; if(dbg){print "R612", "sw_ez_l_f"}; continue };
 #
 if ( sw_ez_z_f() )
 { l[i]=omo2; R[613]++; if(dbg){print "R613", "sw_ez_z_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[614]++; if(dbg){print "R614", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[615]++; if(dbg){print "R615", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[616]++; if(dbg){print "R616", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[617]++; if(dbg){print "R617", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[618]++; if(dbg){print "R618", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2102 !_#_!
 #  x2102 m2_1sw_ez_r_2gl_poed_	   sw_mn_iv_
for(wrd in omap["x2102"]){omakevars(x2102,"x2102");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="души") {
   if ( w(1,"не") && base(2,"чаять") && s(0,1) )
   { l[i]=omo1; R[619]++; if(dbg){print "R619"}; continue };
   if ( w(1,"в") && q(2,"mest_pr suw_pr name_pr_sy") && w(3,"не") && base(4,"чаять") && s(0,3) )
   { l[i]=omo1; R[620]++; if(dbg){print "R620"}; continue };
 };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[621]++; if(dbg){print "R621", "gl_poed_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[622]++; if(dbg){print "R622", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[623]++; if(dbg){print "R623", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[624]++; if(dbg){print "R624", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2103 !_#_!
 #  x2103 m2_1sw_ez_t_2nar_spos_   pl_1em_iv_2dprt_ez_  дорогой  доро́гой  дорого́й
for(wrd in omap["x2103"]){omakevars(x2103,"x2103");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( p(-1) && p(0) )
 { l[i]=omo2; R[625]++; if(dbg){print "R625"}; continue };
 cst="ваш мой наш свой твой";
 if ( (w(-1,cst)||q(-1,"prl_edmuim") ) && s(-1) )
 { l[i]=omo2; R[626]++; if(dbg){print "R626"}; continue };
 cst="очень слишком черезчур";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[627]++; if(dbg){print "R627"}; continue };
 if ( q(1,"titul name_im_sy isname") && s(0) && p(1) )
 { l[i]=omo2; R[628]++; if(dbg){print "R628"}; continue };
 cst="мой наш";
 if ( (w(1,cst)||q(1,"titul")) &&
       q(2,"titul name_im_sy isname") && s(0,1) )
 { l[i]=omo2; R[629]++; if(dbg){print "R629"}; continue };
 if ( q(1,"suw_edmuim suw_noedmuim suw_edzeda suw_edzero suw_edzetv") && s(0) && p(1) )
 { l[i]=omo2; R[630]++; if(dbg){print "R630"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo1; R[631]++; if(dbg){print "R631", "sw_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2104 !_#_!
 #  x2104 m2_1sw_mn_iv_2deep_na_   sw_es_r_  моря  моря́  мо́ря
for(wrd in omap["x2104"]){omakevars(x2104,"x2104");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[632]++; if(dbg){print "R632", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[633]++; if(dbg){print "R633", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[634]++; if(dbg){print "R634", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2105 !_#_!
 #  x2105 gl_paedze_    sw_es_r_
for(wrd in omap["x2105"]){omakevars(x2105,"x2105");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[635]++; if(dbg){print "R635", "sw_es_r_f"}; continue };
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; R[636]++; if(dbg){print "R636", "gl_paedze_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2106 !_#_!
 #  x2106 m2_1sw_mn_iv_2gl_poed_+(sw_ez_r_)      sw_ez_dpr_  мочи  мочи́  мо́чи
for(wrd in omap["x2106"]){omakevars(x2106,"x2106");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qxs(-1,"что","было есть") )
 { l[i]=omo2; R[637]++; if(dbg){print "R637"}; continue };
 if ( qxs(-1,"изо со","всей") )
 { l[i]=omo2; R[638]++; if(dbg){print "R638"}; continue };
 if ( w(1,"нет") && s(0) && p(1) )
 { l[i]=omo2; R[639]++; if(dbg){print "R639"}; continue };
 if ( w(-1,"не") &&
      q(1,"suw_ro") && s(-1,0) )
 { l[i]=omo1; R[640]++; if(dbg){print "R640"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[641]++; if(dbg){print "R641", "gl_poed_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[642]++; if(dbg){print "R642", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[643]++; if(dbg){print "R643", "sw_mn_v_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[644]++; if(dbg){print "R644", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[645]++; if(dbg){print "R645", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[646]++; if(dbg){print "R646", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2107 !_#_!
 #  x2107 m2_1sw_mn_iv_2pl_ez_i_   sw_es_r_
for(wrd in omap["x2107"]){omakevars(x2107,"x2107");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[647]++; if(dbg){print "R647", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[648]++; if(dbg){print "R648", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[649]++; if(dbg){print "R649", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2108 !_#_!
 #  x2108 m2_1sw_mn_iv_2pl_kr_mn_  sw_ez_r_
for(wrd in omap["x2108"]){omakevars(x2108,"x2108");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[650]++; if(dbg){print "R650", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[651]++; if(dbg){print "R651", "sw_mn_v_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[652]++; if(dbg){print "R652", "sw_ez_r_f"}; continue };
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; R[653]++; if(dbg){print "R653", "pl_krmn_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2109 !_#_!
 #  x2109 m2_1sw_mn_r_2gl_poed_    sw_ez_t_
for(wrd in omap["x2109"]){omakevars(x2109,"x2109");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[654]++; if(dbg){print "R654", "gl_poed_f"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[655]++; if(dbg){print "R655", "sw_ez_t_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo1; R[656]++; if(dbg){print "R656", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2110 !_#_!
 #  x2110 m2_1sw_mn_r_2pl_kr_em_   sw_em_iv_
for(wrd in omap["x2110"]){omakevars(x2110,"x2110");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo1; R[657]++; if(dbg){print "R657", "sw_mn_r_f"}; continue };
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; R[658]++; if(dbg){print "R658", "pl_kr_em_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[659]++; if(dbg){print "R659", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[660]++; if(dbg){print "R660", "sw_em_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2111 !_#_!
 #  x2111 m3_1sw_em_i_2pl_em_iv_3pl_ez_dprt_     sw_ez_t_
for(wrd in omap["x2111"]){omakevars(x2111,"x2111");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[661]++; if(dbg){print "R661", "sw_em_i_f"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[662]++; if(dbg){print "R662", "sw_ez_t_f"}; continue };
 #
 if ( pl_ez_d_f() )
 { l[i]=omo1; R[663]++; if(dbg){print "R663", "pl_ez_d_f"}; continue };
 #
 if ( pl_ez_p_f() )
 { l[i]=omo1; R[664]++; if(dbg){print "R664", "pl_ez_p_f"}; continue };
 #
 if ( pl_ez_r_f() )
 { l[i]=omo1; R[665]++; if(dbg){print "R665", "pl_ez_r_f"}; continue };
 #
 if ( pl_ez_t_f() )
 { l[i]=omo1; R[666]++; if(dbg){print "R666", "pl_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2112 !_#_!
 #  x2112 m3_1sw_ez_dpr_2sw_mn_iv_3gl_pamn_	 sw_ez_l_   да'ли дали'
for(wrd in omap["x2112"]){omakevars(x2112,"x2112");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"в") && (-1) )
 { l[i]=omo2; R[667]++; if(dbg){print "R667"}; continue };
 #
 if ( w(-2,"в") &&
      q(-1,"prl_edpr") && s(-2,-1) )
 { l[i]=omo2; R[668]++; if(dbg){print "R668"}; continue };
 #
 if ( name_any_sy(0) )
 { l[i]=omo2; R[669]++; if(dbg){print "R669"}; continue };
 #
 l[i]=omo1; R[670]++; if(dbg){print "R670"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2113 !_#_!
 #  x2113 mest_d_       sw_ez_v_   кому +дефис
for(wrd in omap["x2113"]){omakevars(x2113,"x2113");for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="либо нибудь никому то";
 if ( s1(0,"-") && w(1,cst) )
 { l[i]=gensub(/(.)$/,"\\1\xcc\x81",1,l[i]); sep[i]=gensub(/-/,"-\xcc\xa0",1,sep[i]); R[671]++; if(dbg){print "R671"}; continue };
 if ( s1(-1,"-") && w(-1,"кое") )
 { l[i]=gensub(/(.)$/,"\\1\xcc\x81",1,l[i]); R[672]++; if(dbg){print "R672"}; continue };
 if ( sc(0,"?") )
 { l[i]=omo1; R[673]++; if(dbg){print "R673"}; continue };

 #
 if ( w(-1,"в") && s(-1) )
 { l[i]=omo2; R[674]++; if(dbg){print "R674"}; continue };
 if ( q(-1,"prl_edzevi prq_edzevi mest_edzevi") && s(-1) )
 { l[i]=omo2; R[675]++; if(dbg){print "R675"}; continue };

 # всё остальное
 l[i]=omo1; R[676]++; if(dbg){print "R676"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2114 !_#_!
 #  x2114 mezd_	        sw_mn_p_
for(wrd in omap["x2114"]){omakevars(x2114,"x2114");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_p_f() )
 { l[i]=omo2; R[677]++; if(dbg){print "R677", "sw_mn_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2115 !_#_!
 #  x2115 nar_pre_combo_  sw_1ez_r_2mn_iv_
for(wrd in omap["x2115"]){omakevars(x2115,"x2115");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[678]++; if(dbg){print "R678", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[679]++; if(dbg){print "R679", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[680]++; if(dbg){print "R680", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2116 !_#_!
 #  x2116 nar_spos_     pl_kr_es_
for(wrd in omap["x2116"]){omakevars(x2116,"x2116");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2117 !_#_!
 #  x2117 nar_spos_     sw_em_d_
for(wrd in omap["x2117"]){omakevars(x2117,"x2117");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[681]++; if(dbg){print "R681", "sw_em_d_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2118 !_#_!
 #  x2118 nar_spos_     sw_em_t_
for(wrd in omap["x2118"]){omakevars(x2118,"x2118");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[682]++; if(dbg){print "R682", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2119 !_#_!
 #  x2119 nar_vrem_     pl_ez_dprt_
for(wrd in omap["x2119"]){omakevars(x2119,"x2119");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 #
 if ( pl_ez_d_f() )
 { l[i]=omo2; R[683]++; if(dbg){print "R683", "pl_ez_d_f"}; continue };
 #
 if ( pl_ez_p_f() )
 { l[i]=omo2; R[684]++; if(dbg){print "R684", "pl_ez_p_f"}; continue };
 #
 if ( pl_ez_r_f() )
 { l[i]=omo2; R[685]++; if(dbg){print "R685", "pl_ez_r_f"}; continue };
 #
 if ( pl_ez_t_f() )
 { l[i]=omo2; R[686]++; if(dbg){print "R686", "pl_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2120 !_#_!
 #  x2120 nar_vrem_     sw_em_t_   потом  пото́м  по́том
for(wrd in omap["x2120"]){omakevars(x2120,"x2120");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="вонять истекать обливаться пахнуть провонять провоняться пропахнуть пропитать пропитаться пропитывать пропитываться";
 if ( base(-1,cst) && q(-1,"gl_ed gl_mn gl_vzmn deep prq_any") && s(-1) )
 { l[i]=omo2; R[687]++; if(dbg){print "R687"}; continue };
 if ( base(-1,cst) && prq_any(-1) && s(-1) )
 { l[i]=omo2; R[688]++; if(dbg){print "R688"}; continue };
 if ( p(-2) &&
      w(-1,"а и но однако") && s(-1) )
 { l[i]=omo1; R[689]++; if(dbg){print "R689"}; continue };
 if ( p(-1) )
 { l[i]=omo1; R[690]++; if(dbg){print "R690"}; continue };
 if ( qxs(1,"и","кровью") )
 { l[i]=omo2; R[691]++; if(dbg){print "R691"}; continue };

 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[692]++; if(dbg){print "R692", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2121 !_#_!
 #  x2121 phrase_       pl_1ems_t_2mn_d_
for(wrd in omap["x2121"]){omakevars(x2121,"x2121");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2122 !_#_!
 #  x2122 phrase_       sw_em_r_   следа  следа́  сле́да
for(wrd in omap["x2122"]){omakevars(x2122,"x2122");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"без ни") && s(-1) )
 { l[i]=omo1; R[693]++; if(dbg){print "R693"}; continue };
 if ( w(-3,"не") &&
     (q(-2,"gl_ed gl_in gl_mn gl_poed gl_pomn deep")||w(-2,"нет")) &&
      w(-1,"и никакого") && s(-3,-1) )
 { l[i]=omo1; R[694]++; if(dbg){print "R694"}; continue };
 #
  l[i]=omo2; R[695]++; if(dbg){print "R695"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2123 !_#_!
 #  x2123 phrase_       sw_em_vr_    < хера хрена >
for(wrd in omap["x2123"]){omakevars(x2123,"x2123");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"ни на") && s(-1) )
 { l[i]=omo1; R[696]++; if(dbg){print "R696"}; continue };
 if ( w(-1,"с") && w(1,"ли") s(-1,0) )
 { l[i]=omo1; R[697]++; if(dbg){print "R697"}; continue };
 #
 l[i]=omo2; R[698]++; if(dbg){print "R698"}; continue;
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2124 !_#_!
 #  x2124 phrase_		sw_mn_iv_
for(wrd in omap["x2124"]){omakevars(x2124,"x2124");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[699]++; if(dbg){print "R699", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[700]++; if(dbg){print "R700", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2125 !_#_!
 #  x2125 pl_1em_iv_2ez_dprt_    sw_ez_t_
for(wrd in omap["x2125"]){omakevars(x2125,"x2125");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(-1,"-") )
 { l[i]=omo1; R[701]++; if(dbg){print "R701"}; continue };
 if ( q(1,"suw_edzeda suw_edzero suw_edzetv suw_edzepr suw_edmuim suw_edmuvi") && s(0) )
 { l[i]=omo1; R[702]++; if(dbg){print "R702"}; continue };

 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[703]++; if(dbg){print "R703", "sw_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2126 !_#_!
 #  x2126 pl_em_iv_		sw_mn_r_
for(wrd in omap["x2126"]){omakevars(x2126,"x2126");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[704]++; if(dbg){print "R704", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2127 !_#_!
 #  x2127 pl_em_iv_		sw_mn_vr_
for(wrd in omap["x2127"]){omakevars(x2127,"x2127");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[705]++; if(dbg){print "R705", "sw_mn_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[706]++; if(dbg){print "R706", "sw_mn_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2128 !_#_!
 #  x2128 pl_em_p_		sw_em_t_
for(wrd in omap["x2128"]){omakevars(x2128,"x2128");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[707]++; if(dbg){print "R707", "sw_em_p_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[708]++; if(dbg){print "R708", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2129 !_#_!
 #  x2129 pl_ems_d_		sw_em_d_
for(wrd in omap["x2129"]){omakevars(x2129,"x2129");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[709]++; if(dbg){print "R709", "sw_em_d_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2130 !_#_!
 #  x2130 pl_ems_p_		sw_em_iv_
for(wrd in omap["x2130"]){omakevars(x2130,"x2130");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; R[710]++; if(dbg){print "R710", "pl_em_p_f()||pl_es_p_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[711]++; if(dbg){print "R711", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[712]++; if(dbg){print "R712", "sw_em_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2131 !_#_!
 #  x2131 pl_ems_p_		sw_ems_t_
for(wrd in omap["x2131"]){omakevars(x2131,"x2131");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; R[713]++; if(dbg){print "R713", "pl_em_p_f()||pl_es_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2132 !_#_!
 #  x2132 pl_ems_p_		sw_em_t_
for(wrd in omap["x2132"]){omakevars(x2132,"x2132");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; R[714]++; if(dbg){print "R714", "pl_em_p_f()||pl_es_p_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[715]++; if(dbg){print "R715", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2133 !_#_!
 #  x2133 pl_ems_p_		sw_es_t_
for(wrd in omap["x2133"]){omakevars(x2133,"x2133");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; R[716]++; if(dbg){print "R716", "pl_em_p_f()||pl_es_p_f"}; continue };
 #
 if ( sw_es_t_f() )
 { l[i]=omo2; R[717]++; if(dbg){print "R717", "sw_es_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2134 !_#_!
 #  x2134 pl_ems_t_		sw_em_t_
for(wrd in omap["x2134"]){omakevars(x2134,"x2134");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[718]++; if(dbg){print "R718", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2135 !_#_!
 #  x2135 pl_es_iv_		pl_srav_
for(wrd in omap["x2135"]){omakevars(x2135,"x2135");for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(-1,"-" ) )
 { l[i]=omo2; R[719]++; if(dbg){print "R719"}; continue };
 if ( sc(0,"-" ) )
 { l[i]=omo2; R[720]++; if(dbg){print "R720"}; continue };
 #
 if ( pl_es_i_f() )
 { l[i]=omo1; R[721]++; if(dbg){print "R721", "pl_es_i_f"}; continue };
 #
 if ( pl_es_v_f() )
 { l[i]=omo1; R[722]++; if(dbg){print "R722", "pl_es_v_f"}; continue };
 #
 if ( pl_srav_f() )
 { l[i]=omo2; R[723]++; if(dbg){print "R723", "pl_srav_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2136 !_#_!
 #  x2136 pl_ez_dprt_   sw_1em_iv_2ez_t_
for(wrd in omap["x2136"]){omakevars(x2136,"x2136");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[724]++; if(dbg){print "R724", "sw_ez_t_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[725]++; if(dbg){print "R725", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[726]++; if(dbg){print "R726", "sw_em_v_f"}; continue };
 #
 if ( pl_ez_d_f() )
 { l[i]=omo1; R[727]++; if(dbg){print "R727", "pl_ez_d_f"}; continue };
 #
 if ( pl_ez_p_f() )
 { l[i]=omo1; R[728]++; if(dbg){print "R728", "pl_ez_p_f"}; continue };
 #
 if ( pl_ez_r_f() )
 { l[i]=omo1; R[729]++; if(dbg){print "R729", "pl_ez_r_f"}; continue };
 #
 if ( pl_ez_t_f() )
 { l[i]=omo1; R[730]++; if(dbg){print "R730", "pl_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2137 !_#_!
 #  x2137 pl_ez_dprt_   sw_ez_t_
for(wrd in omap["x2137"]){omakevars(x2137,"x2137");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[731]++; if(dbg){print "R731", "sw_ez_t_f"}; continue };
 #
 if ( pl_ez_d_f() )
 { l[i]=omo1; R[732]++; if(dbg){print "R732", "pl_ez_d_f"}; continue };
 #
 if ( pl_ez_p_f() )
 { l[i]=omo1; R[733]++; if(dbg){print "R733", "pl_ez_p_f"}; continue };
 #
 if ( pl_ez_r_f() )
 { l[i]=omo1; R[734]++; if(dbg){print "R734", "pl_ez_r_f"}; continue };
 #
 if ( pl_ez_t_f() )
 { l[i]=omo1; R[735]++; if(dbg){print "R735", "pl_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2138 !_#_!
 #  x2138 pl_ez_dprt_   sw_mn_r_
for(wrd in omap["x2138"]){omakevars(x2138,"x2138");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[736]++; if(dbg){print "R736", "sw_mn_r_f"}; continue };
 #
 if ( pl_ez_d_f() )
 { l[i]=omo1; R[737]++; if(dbg){print "R737", "pl_ez_d_f"}; continue };
 #
 if ( pl_ez_p_f() )
 { l[i]=omo1; R[738]++; if(dbg){print "R738", "pl_ez_p_f"}; continue };
 #
 if ( pl_ez_r_f() )
 { l[i]=omo1; R[739]++; if(dbg){print "R739", "pl_ez_r_f"}; continue };
 #
 if ( pl_ez_t_f() )
 { l[i]=omo1; R[740]++; if(dbg){print "R740", "pl_ez_t_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2139 !_#_!
 #  x2139 pl_ez_i_		sw_1es_r_2mn_iv_
for(wrd in omap["x2139"]){omakevars(x2139,"x2139");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[741]++; if(dbg){print "R741", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[742]++; if(dbg){print "R742", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[743]++; if(dbg){print "R743", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2140 !_#_!
 #  x2140 pl_ez_i_		sw_es_r_
for(wrd in omap["x2140"]){omakevars(x2140,"x2140");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[744]++; if(dbg){print "R744", "sw_es_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2141 !_#_!
 #  x2141 pl_ez_i_		sw_mn_i_
for(wrd in omap["x2141"]){omakevars(x2141,"x2141");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[745]++; if(dbg){print "R745", "sw_mn_i_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2142 !_#_!
 #  x2142 pl_ez_t_		sw_1em_d_2ez_t_
for(wrd in omap["x2142"]){omakevars(x2142,"x2142");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[746]++; if(dbg){print "R746", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[747]++; if(dbg){print "R747", "sw_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2143 !_#_!
 #  x2143 pl_ez_v_		sw_es_d_
for(wrd in omap["x2143"]){omakevars(x2143,"x2143");for(y=1;y<=wln;y++)         # header1
 #
 if ( pl_ez_v_f() )
 { l[i]=omo1; R[748]++; if(dbg){print "R748", "pl_ez_v_f"}; continue };
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; R[749]++; if(dbg){print "R749", "sw_es_d_f"}; continue };
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2144 !_#_!
 #  x2144 pl_kr_em_		sw_em_i_
for(wrd in omap["x2144"]){omakevars(x2144,"x2144");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; R[750]++; if(dbg){print "R750", "pl_kr_em_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[751]++; if(dbg){print "R751", "sw_em_i_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2145 !_#_!
 #  x2145 pl_kr_em_		sw_em_iv_
for(wrd in omap["x2145"]){omakevars(x2145,"x2145");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; R[752]++; if(dbg){print "R752", "pl_kr_em_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[753]++; if(dbg){print "R753", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[754]++; if(dbg){print "R754", "sw_em_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2146 !_#_!
 #  x2146 pl_kr_em_		sw_em_t_  знаком  знако́м  зна́ком
for(wrd in omap["x2146"]){omakevars(x2146,"x2146");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="быть оказаться стать";
 if ( base(-1,cst) &&
         q(1,"prl_ro") &&
         q(2,"suw_ro") && s(-1,1) )
 { l[i]=omo2; R[755]++; if(dbg){print "R755"}; continue };
 if ( base(-1,cst) &&
         q(1,"suw_ro") && s(-1,0) )
 { l[i]=omo2; R[756]++; if(dbg){print "R756"}; continue };

 if (q(1,"gl_in gl_ed gl_mn deep") && s(0) )
 { l[i]=omo2; R[757]++; if(dbg){print "R757"}; continue };
 if ( pre_tv(-2) &&
           q(-1,"mest_tv suw_tv") && s(-2,-1) )
 { l[i]=omo1; R[758]++; if(dbg){print "R758"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[759]++; if(dbg){print "R759", "sw_em_t_f"}; continue };
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; R[760]++; if(dbg){print "R760", "pl_kr_em_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2147 !_#_!
 #  x2147 pl_kr_em_		sw_mn_r_
for(wrd in omap["x2147"]){omakevars(x2147,"x2147");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="дорог") {
   cst="перекресток перекрёсток прокладка";
   if ( base(-1,cst) && s(-1) )
   { l[i]=omo2; R[761]++; if(dbg){print "R761"}; continue };
 };
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; R[762]++; if(dbg){print "R762", "pl_kr_em_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[763]++; if(dbg){print "R763", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2148 !_#_!
 #  x2148 pl_kr_em_		sw_mn_vr_ готов  гото́в  го́тов
for(wrd in omap["x2148"]){omakevars(x2148,"x2148");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( bb(-5,-1,"быть") && s(bbn,-1) )
 { l[i]=omo1; R[764]++; if(dbg){print "R764"}; continue };
 if ( qf(1,3,"gl_in") && s(0,qfn-1) )
 { l[i]=omo1; R[765]++; if(dbg){print "R765"}; continue };
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; R[766]++; if(dbg){print "R766", "pl_kr_em_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[767]++; if(dbg){print "R767", "sw_mn_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[768]++; if(dbg){print "R768", "sw_mn_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2149 !_#_!
 #  x2149 pl_kr_es_		sw_es_iv_
for(wrd in omap["x2149"]){omakevars(x2149,"x2149");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="добро") {
   if ( w(1,"пожаловать") && s(0) )
   { l[i]=omo2; R[769]++; if(dbg){print "R769"}; continue };
 };

 #
 if ( sw_es_i_f() )
 { l[i]=omo2; R[770]++; if(dbg){print "R770", "sw_es_i_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; R[771]++; if(dbg){print "R771", "sw_es_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2150 !_#_!
 #  x2150 pl_kr_ez_		sw_1es_r_2mn_iv_
for(wrd in omap["x2150"]){omakevars(x2150,"x2150");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[772]++; if(dbg){print "R772", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[773]++; if(dbg){print "R773", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[774]++; if(dbg){print "R774", "sw_mn_v_f"}; continue };
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; R[775]++; if(dbg){print "R775", "pl_kr_ez_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2151 !_#_!
 #  x2151 pl_kr_ez_		sw_em_r_
for(wrd in omap["x2151"]){omakevars(x2151,"x2151");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[776]++; if(dbg){print "R776", "sw_em_r_f"}; continue };
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; R[777]++; if(dbg){print "R777", "pl_kr_ez_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2152 !_#_!
 #  x2152 pl_kr_ez_		sw_em_vr_
for(wrd in omap["x2152"]){omakevars(x2152,"x2152");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[778]++; if(dbg){print "R778", "sw_em_v_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[779]++; if(dbg){print "R779", "sw_em_r_f"}; continue };
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; R[780]++; if(dbg){print "R780", "pl_kr_ez_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2153 !_#_!
 #  x2153 pl_kr_ez_		sw_es_r_
for(wrd in omap["x2153"]){omakevars(x2153,"x2153");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[781]++; if(dbg){print "R781", "sw_es_r_f"}; continue };
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; R[782]++; if(dbg){print "R782", "pl_kr_ez_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2154 !_#_!
 #  x2154 pl_kr_ez_		sw_ez_i_
for(wrd in omap["x2154"]){omakevars(x2154,"x2154");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[783]++; if(dbg){print "R783", "sw_ez_i_f"}; continue };
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; R[784]++; if(dbg){print "R784", "pl_kr_ez_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2155 !_#_!
 #  x2155 pl_kr_mn_		sw_1ez_r_2mn_iv_  дороги  дороги́  дороги́
for(wrd in omap["x2155"]){omakevars(x2155,"x2155");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; R[785]++; if(dbg){print "R785", "pl_krmn_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[786]++; if(dbg){print "R786", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[787]++; if(dbg){print "R787", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[788]++; if(dbg){print "R788", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2156 !_#_!
 #  x2156 pl_kr_mn_		sw_ez_r_
for(wrd in omap["x2156"]){omakevars(x2156,"x2156");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[789]++; if(dbg){print "R789", "sw_ez_r_f"}; continue };
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; R[790]++; if(dbg){print "R790", "pl_krmn_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2157 !_#_!
 #  x2157 pl_kr_mn_		sw_mn_i_
for(wrd in omap["x2157"]){omakevars(x2157,"x2157");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[791]++; if(dbg){print "R791", "sw_mn_i_f"}; continue };
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; R[792]++; if(dbg){print "R792", "pl_krmn_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2158 !_#_!
 #  x2158 pl_kr_mn_		sw_mn_iv_
for(wrd in omap["x2158"]){omakevars(x2158,"x2158");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; R[793]++; if(dbg){print "R793", "pl_krmn_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[794]++; if(dbg){print "R794", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[795]++; if(dbg){print "R795", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2159 !_#_!
 #  x2159 pl_srav_		sw_1ez_t_2mn_r_
for(wrd in omap["x2159"]){omakevars(x2159,"x2159");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_srav_f() )
 { l[i]=omo1; R[796]++; if(dbg){print "R796", "pl_srav_f"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[797]++; if(dbg){print "R797", "sw_ez_t_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[798]++; if(dbg){print "R798", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2160 !_#_!
 #  x2160 pl_srav_		sw_em_p_
for(wrd in omap["x2160"]){omakevars(x2160,"x2160");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_srav_f() )
 { l[i]=omo1; R[799]++; if(dbg){print "R799", "pl_srav_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; R[800]++; if(dbg){print "R800", "sw_em_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2161 !_#_!
 #  x2161 pl_srav_		sw_ez_t_
for(wrd in omap["x2161"]){omakevars(x2161,"x2161");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_srav_f() )
 { l[i]=omo1; R[801]++; if(dbg){print "R801", "pl_srav_f"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[802]++; if(dbg){print "R802", "sw_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2162 !_#_!
 #  x2162 pl_srav_		sw_mn_r_
for(wrd in omap["x2162"]){omakevars(x2162,"x2162");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_srav_f() )
 { l[i]=omo1; R[803]++; if(dbg){print "R803", "pl_srav_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[804]++; if(dbg){print "R804", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2163 !_#_!
 #  x2163 pq_ems_p_		sw_em_t_
for(wrd in omap["x2163"]){omakevars(x2163,"x2163");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[805]++; if(dbg){print "R805", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2164 !_#_!
 #  x2164 pq_kr_em_		pq_kr_em_
for(wrd in omap["x2164"]){omakevars(x2164,"x2164");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2165 !_#_!
 #  x2165 pq_kr_em_		sw_1em_iv_2mn_vr_
for(wrd in omap["x2165"]){omakevars(x2165,"x2165");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[806]++; if(dbg){print "R806", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[807]++; if(dbg){print "R807", "sw_em_v_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[808]++; if(dbg){print "R808", "sw_mn_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[809]++; if(dbg){print "R809", "sw_mn_r_f"}; continue };
 #
 if ( pq_kr_em_f() )
 { l[i]=omo1; R[810]++; if(dbg){print "R810", "pq_kr_em_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2166 !_#_!
 #  x2166 pq_kr_em_		sw_em_iv_
for(wrd in omap["x2166"]){omakevars(x2166,"x2166");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pq_kr_em_f() )
 { l[i]=omo1; R[811]++; if(dbg){print "R811", "pq_kr_em_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[812]++; if(dbg){print "R812", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[813]++; if(dbg){print "R813", "sw_em_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2167 !_#_!
 #  x2167 pq_kr_em_		sw_mn_r_
for(wrd in omap["x2167"]){omakevars(x2167,"x2167");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pq_kr_em_f() )
 { l[i]=omo1; R[814]++; if(dbg){print "R814", "pq_kr_em_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[815]++; if(dbg){print "R815", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2168 !_#_!
 #  x2168 pq_kr_ez_		sw_em_r_
for(wrd in omap["x2168"]){omakevars(x2168,"x2168");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; R[816]++; if(dbg){print "R816", "pl_kr_ez_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[817]++; if(dbg){print "R817", "sw_em_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2169 !_#_!
 #  x2169 pq_kr_ez_		sw_ez_i_
for(wrd in omap["x2169"]){omakevars(x2169,"x2169");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; R[818]++; if(dbg){print "R818", "pl_kr_ez_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[819]++; if(dbg){print "R819", "sw_ez_i_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2170 !_#_!
 #  x2170 pq_kr_mn_		sw_1ez_r_2mn_i_
for(wrd in omap["x2170"]){omakevars(x2170,"x2170");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[820]++; if(dbg){print "R820", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[821]++; if(dbg){print "R821", "sw_mn_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2171 !_#_!
 #  x2171 pq_kr_mn_		sw_1ez_r_2mn_iv_
for(wrd in omap["x2171"]){omakevars(x2171,"x2171");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[822]++; if(dbg){print "R822", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[823]++; if(dbg){print "R823", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[824]++; if(dbg){print "R824", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2172 !_#_!
 #  x2172 pq_kr_mn_		sw_mn_iv_
for(wrd in omap["x2172"]){omakevars(x2172,"x2172");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[825]++; if(dbg){print "R825", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[826]++; if(dbg){print "R826", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2173 !_#_!
 #  x2173 pre_combo_    sw_mn_d_
for(wrd in omap["x2173"]){omakevars(x2173,"x2173");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"Yco") && s(-1) && p(0) )
 { l[i]=omo1; R[827]++; if(dbg){print "R827", "sw_mn_d_f"}; continue };
 #
 if ( sw_mn_d_f() )
 { l[i]=omo2; R[828]++; if(dbg){print "R828", "sw_mn_d_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2174 !_#_!
 #  x2174 predik_       sw_ez_dp_
for(wrd in omap["x2174"]){omakevars(x2174,"x2174");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[829]++; if(dbg){print "R829", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[830]++; if(dbg){print "R830", "sw_ez_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2175 !_#_!
 #  x2175 pred_tv_      sw_em_iv_   перед  пе́ред  перёд
for(wrd in omap["x2175"]){omakevars(x2175,"x2175");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( name_tv_sy(1) && s(0) )
 { l[i]=omo1; R[831]++; if(dbg){print "R831"}; continue };
 if ( wc(1,"им$ ом$ ой$ ами$ ими$ ыми$ ями$") && s(0) )
 { l[i]=omo1; R[832]++; if(dbg){print "R832"}; continue };
 if ( q(-1,"suw_im") && wc(1,"им$ ом$ ой$ ами$ ими$ ыми$") && s(-1,0) )
 { l[i]=omo1; R[833]++; if(dbg){print "R833"}; continue };
 if ( isname(1) &&
      isname(2) && wc(2,"им$ ом$ ой$ ами$ ими$ ыми$") && s(0,1) )
 { l[i]=omo1; R[834]++; if(dbg){print "R834"}; continue };

 #
 if ( q(1,"prl_tv prq_tv mest_tv mest_mn mest_3e") &&
      q(2,"suw_tv prl_tv prq_tv mest_tv") && s(0,1) )
 { l[i]=omo1; R[835]++; if(dbg){print "R835"}; continue };
 if ( q(1,"suw_tv prl_tv mest_tv") && s(0) )
 { l[i]=omo1; R[836]++; if(dbg){print "R836"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[837]++; if(dbg){print "R837", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[838]++; if(dbg){print "R838", "sw_em_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2176 !_#_!
 #  x2176 qast_		sw_es_p_
for(wrd in omap["x2176"]){omakevars(x2176,"x2176");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; R[839]++; if(dbg){print "R839", "sw_es_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2177 !_#_!
 #  x2177 qip_ez_dprt_		sw_ez_t_    пятой  пя́той  пято́й
for(wrd in omap["x2177"]){omakevars(x2177,"x2177");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pre_pr(-2) &&
           q(-1,"prl_edzepr qik_im") &&
           q(1,"suw_edzepr") && s(-2,0) )
 { l[i]=omo1; R[840]++; if(dbg){print "R840"}; continue };
 if ( pre_pr(-1) &&
           q(1,"suw_edzepr suw_edzene") && s(-1,0) )
 { l[i]=omo1; R[841]++; if(dbg){print "R841"}; continue };
 if ( pre_pr(-1) && s(-1) && (p(0)||q_w(1,"pre_any")) )
 { l[i]=omo1; R[842]++; if(dbg){print "R842"}; continue };
 if ( q(-1,"qik_im") && s(-1) )
 { l[i]=omo1; R[843]++; if(dbg){print "R843"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[844]++; if(dbg){print "R844", "sw_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2178 !_#_!
 #  x2178 sw_1em_d_2ez_v_		sw_em_l_
for(wrd in omap["x2178"]){omakevars(x2178,"x2178");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if(iwrd=="ладу") {
   if ( w(-1,"в") && s(-1) )
   { l[i]=omo2; R[845]++; if(dbg){print "R845"}; continue };
 };
 if(iwrd=="пару") {
   if ( q(1,"suw_edne") && s(0) )
   { l[i]=omo1; R[846]++; if(dbg){print "R846"}; continue };
 };
 #
 if ( suw_mnro(1) && s(0) )
 { l[i]=omo1; R[847]++; if(dbg){print "R847"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[848]++; if(dbg){print "R848", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; R[849]++; if(dbg){print "R849", "sw_ez_v_f"}; continue };
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; R[850]++; if(dbg){print "R850", "sw_em_l_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2179 !_#_!
 #  x2179 sw_1em_d_2ez_v_		sw_es_n_
for(wrd in omap["x2179"]){omakevars(x2179,"x2179");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[851]++; if(dbg){print "R851", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; R[852]++; if(dbg){print "R852", "sw_ez_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2180 !_#_!
 #  x2180 sw_1em_l_2ez_v_		sw_em_d_
for(wrd in omap["x2180"]){omakevars(x2180,"x2180");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="полу") {
   if ( sc(0,"-") )
   { l[i]=omo2; R[853]++; if(dbg){print "R853"}; continue };
   if ( w(-1,"до по с") && s(-1) )
   { l[i]=omo2; R[854]++; if(dbg){print "R854"}; continue };
 };
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; R[855]++; if(dbg){print "R855", "sw_em_l_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[856]++; if(dbg){print "R856", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; R[857]++; if(dbg){print "R857", "sw_ez_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2181 !_#_!
 #  x2181 sw_1em_l_2ez_v_		sw_em_dz_
for(wrd in omap["x2181"]){omakevars(x2181,"x2181");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"с") && s(-1) )
 { l[i]=omo2; R[858]++; if(dbg){print "R858", "sw_em_z_f"}; continue };
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; R[859]++; if(dbg){print "R859", "sw_em_z_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[860]++; if(dbg){print "R860", "sw_em_d_f"}; continue };
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; R[861]++; if(dbg){print "R861", "sw_em_l_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; R[862]++; if(dbg){print "R862", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2182 !_#_!
 #  x2182 sw_1em_p_2es_ivp_		sw_ez_dp_
for(wrd in omap["x2182"]){omakevars(x2182,"x2182");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo1; R[863]++; if(dbg){print "R863", "sw_es_i_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo1; R[864]++; if(dbg){print "R864", "sw_es_v_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[865]++; if(dbg){print "R865", "sw_em_p_f"}; continue };
 #
 if ( sw_es_p_f() )
 { l[i]=omo1; R[866]++; if(dbg){print "R866", "sw_es_p_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[867]++; if(dbg){print "R867", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[868]++; if(dbg){print "R868", "sw_ez_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2183 !_#_!
 #  x2183 sw_1em_p_2ez_dp_		sw_es_n_
for(wrd in omap["x2183"]){omakevars(x2183,"x2183");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="пике") {
   if ( q(-2,"pre_pr") &&
        q(-1,"prl_edsrpr prq_edsrpr") && s(-2,-1) )
   { l[i]=omo2; R[869]++; if(dbg){print "R869"}; continue };
   if ( q(-2,"pre_vi preph_vi") &&
        q(-1,"prl_edsrvi prq_edsrvi") && s(-2,-1) )
   { l[i]=omo2; R[870]++; if(dbg){print "R870"}; continue };
   cst="войти входить вывести выйти выходить";
   if ( base(-3,cst) &&
           q(-2,"suw_vi") &&
           w(-1,"в из") && s(-3,-1) )
   { l[i]=omo2; r[1230]++; if(dbg){print "r1230"}; continue };
   if ( base(-2,cst) &&
           w(-1,"в из") && s(-2,-1) )
   { l[i]=omo2; r[1230]++; if(dbg){print "r1230"}; continue };
 };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[871]++; if(dbg){print "R871", "sw_em_p_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; R[872]++; if(dbg){print "R872", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo1; R[873]++; if(dbg){print "R873", "sw_ez_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2184 !_#_!
 #  x2184 sw_1em_p_2ez_d_		sw_ez_p_
for(wrd in omap["x2184"]){omakevars(x2184,"x2184");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[874]++; if(dbg){print "R874", "sw_em_p_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; R[875]++; if(dbg){print "R875", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[876]++; if(dbg){print "R876", "sw_ez_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2185 !_#_!
 #  x2185 sw_1em_r_2ez_i_		sw_mn_iv_
for(wrd in omap["x2185"]){omakevars(x2185,"x2185");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; R[877]++; if(dbg){print "R877", "sw_ez_i_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[878]++; if(dbg){print "R878", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[879]++; if(dbg){print "R879", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[880]++; if(dbg){print "R880", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2186 !_#_!
 #  x2186 sw_1em_r_2phrase_		sw_mn_i_
for(wrd in omap["x2186"]){omakevars(x2186,"x2186");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[881]++; if(dbg){print "R881", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[882]++; if(dbg){print "R882", "sw_mn_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2187 !_#_!
 #  x2187 sw_1ems_d_2ez_v_		sw_em_l_  миру  ми́ру  миру́
for(wrd in omap["x2187"]){omakevars(x2187,"x2187");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_l_f() && wmark("Yme",lc(-1)) )
 { l[i]=omo2; R[883]++; if(dbg){print "R883"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[884]++; if(dbg){print "R884", "sw_em_d_f"}; continue };
 #
 if ( sw_es_d_f() )
 { l[i]=omo1; R[885]++; if(dbg){print "R885", "sw_es_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; R[886]++; if(dbg){print "R886", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2188 !_#_!
 #  x2188 sw_1ems_n_2ez_r_	sw_mn_iv_   виски  ви́ски  виски́
for(wrd in omap["x2188"]){omakevars(x2188,"x2188");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1

 if ( q(-3,"gl_peed gl_pemn deep_pe") &&
      q(-2,"mest_vi suw_odedvi suw_odmnvi") &&
 pre_vi(-1) && s(-3,-1) )
 { l[i]=omo2; R[887]++; if(dbg){print "R887"}; continue };
 if ( p(-1) && p(0) )
 { l[i]=omo1; R[888]++; if(dbg){print "R888"}; continue };
 if ( idb(-5,"gl4whisky") && s(idn,-1) )
 { l[i]=omo1; R[889]++; if(dbg){print "R889"}; continue };
 if ( idf(5,"sw4whisky") &&
   pre_tv(1) && s(0,idn-1) )
 { l[i]=omo1; R[890]++; if(dbg){print "R890"}; continue };

 if ( idb(-5,"gl4viski") && s(idn,-1) )
 { l[i]=omo2; R[891]++; if(dbg){print "R891"}; continue };
 if ( idf(5,"gl4viski") && s(0,idn-1) )
 { l[i]=omo2; R[892]++; if(dbg){print "R892"}; continue };
 if ( q(1,"gl_vzmn") && s(0) )
 { l[i]=omo2; R[893]++; if(dbg){print "R893"}; continue };
#if ( idf(5,"sw4viski") && s(0,idn) )
#{ l[i]=omo2; R[894]++; if(dbg){print "R894"}; continue };
#if ( idb(-5,"pl4viski") && s(0,idn) )
#{ l[i]=omo2; R[895]++; if(dbg){print "R895"}; continue };

 #
 if ( sw_es_z_f()||sw_em_i_f()||sw_es_i_f()||sw_em_v_f()||sw_es_v_f()||sw_em_r_f()||sw_es_r_f()||
      sw_em_d_f()||sw_es_d_f()||sw_em_t_f()||sw_es_t_f()||sw_em_p_f()||sw_es_p_f()||sw_ez_r_f() )
 { l[i]=omo1; R[896]++; if(dbg){print "R896"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[897]++; if(dbg){print "R897", "sw_mn_i_f"}; continue };
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[898]++; if(dbg){print "R898", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2189 !_#_!
 #  x2189 sw_1em_vr_2ez_i_		sw_mn_iv_
for(wrd in omap["x2189"]){omakevars(x2189,"x2189");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; R[899]++; if(dbg){print "R899", "sw_ez_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[900]++; if(dbg){print "R900", "sw_em_v_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[901]++; if(dbg){print "R901", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[902]++; if(dbg){print "R902", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[903]++; if(dbg){print "R903", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2190 !_#_!
 #  x2190 sw_emz_r_		sw_mn_iv_  главы головы  главы́ головы́  гла́вы го́ловы
for(wrd in omap["x2190"]){omakevars(x2190,"x2190");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[904]++; if(dbg){print "R904", "sw_em_r_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[905]++; if(dbg){print "R905", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[906]++; if(dbg){print "R906", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[907]++; if(dbg){print "R907", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2191 !_#_!
 #  x2191 sw_1es_n_2ez_r_		sw_mn_iv_
for(wrd in omap["x2191"]){omakevars(x2191,"x2191");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_z_f()||sw_es_i_f()||sw_es_v_f()||sw_es_r_f()||sw_es_d_f()||sw_es_t_f()||sw_es_p_f()||sw_ez_r_f() )
 { l[i]=omo1; R[908]++; if(dbg){print "R908", "sw_es_z_f()||sw_es_i_f()||sw_es_v_f()||sw_es_r_f()||sw_es_d_f()||sw_es_t_f()||sw_es_p_f()||sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[909]++; if(dbg){print "R909", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[910]++; if(dbg){print "R910", "sw_mn_v_f"}; continue };


 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2192 !_#_!
 #  x2192 sw_1es_rz_2mn_iv_		sw_ez_i_
for(wrd in omap["x2192"]){omakevars(x2192,"x2192");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[911]++; if(dbg){print "R911", "sw_ez_i_f"}; continue };
 #
 if ( sw_es_z_f() )
 { l[i]=omo1; R[912]++; if(dbg){print "R912", "sw_es_z_f"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; R[913]++; if(dbg){print "R913", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[914]++; if(dbg){print "R914", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[915]++; if(dbg){print "R915", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2193 !_#_!
 #  x2193 sw_1ez_dp_2mn_iv_		sw_ez_rl_
for(wrd in omap["x2193"]){omakevars(x2193,"x2193");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[916]++; if(dbg){print "R916", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[917]++; if(dbg){print "R917", "sw_ez_p_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[918]++; if(dbg){print "R918", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[919]++; if(dbg){print "R919", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2194 !_#_!
 #  x2194 sw_1ez_dpr_2mn_iv_	        sw_ez_l_
for(wrd in omap["x2194"]){omakevars(x2194,"x2194");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="связи") {
   if ( w(-1,"в") && w(1,"с") && s(-1,0) )
   { l[i]=omo2; R[920]++; if(dbg){print "R920"}; continue }
   else
   { l[i]=omo1; R[921]++; if(dbg){print "R921"}; continue };
 };
 #
 if ( sw_ez_l_f() )
 { l[i]=omo2; R[922]++; if(dbg){print "R922", "sw_ez_l_f"}; continue };

 #
 l[i]=omo1; R[923]++; if(dbg){print "R923"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2195 !_#_!
 #  x2195 sw_1ez_dr_2mn_iv_		sw_ez_p_
for(wrd in omap["x2195"]){omakevars(x2195,"x2195");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[924]++; if(dbg){print "R924", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[925]++; if(dbg){print "R925", "sw_mn_v_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[926]++; if(dbg){print "R926", "sw_ez_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2196 !_#_!
 #  x2196 sw_1ez_drp_2mn_iv_		sw_ez_l_
for(wrd in omap["x2196"]){omakevars(x2196,"x2196");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_l_f() )
 { l[i]=omo2; R[927]++; if(dbg){print "R927", "sw_ez_l_f"}; continue };

 #
 l[i]=omo1; R[928]++; if(dbg){print "R928"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2197 !_#_!
 #  x2197 sw_1ez_i_2mn_iv_		sw_em_r_
for(wrd in omap["x2197"]){omakevars(x2197,"x2197");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[929]++; if(dbg){print "R929", "sw_em_r_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; R[930]++; if(dbg){print "R930", "sw_ez_i_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[931]++; if(dbg){print "R931", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[932]++; if(dbg){print "R932", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2198 !_#_!
 #  x2198 sw_1ez_i_2mn_iv_		sw_es_r_
for(wrd in omap["x2198"]){omakevars(x2198,"x2198");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[933]++; if(dbg){print "R933", "sw_es_r_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; R[934]++; if(dbg){print "R934", "sw_ez_i_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[935]++; if(dbg){print "R935", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[936]++; if(dbg){print "R936", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2199 !_#_!
 #  x2199 sw_1ez_p_2mn_iv_		sw_ez_drl_  груди  гру́ди  груди́
for(wrd in omap["x2199"]){omakevars(x2199,"x2199");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"его") && s(-1) )
 { l[i]=omo2; R[937]++; if(dbg){print "R937"}; continue };
 #
 if ( sw_ez_l_f() )
 { l[i]=omo2; R[938]++; if(dbg){print "R938", "sw_ez_l_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[939]++; if(dbg){print "R939", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[940]++; if(dbg){print "R940", "sw_ez_r_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo1; R[941]++; if(dbg){print "R941", "sw_ez_p_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[942]++; if(dbg){print "R942", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[943]++; if(dbg){print "R943", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2200 !_#_!
 #  x2200 sw_1mn_r_2pl_kr_em_		sw_em_iv_
for(wrd in omap["x2200"]){omakevars(x2200,"x2200");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[944]++; if(dbg){print "R944", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[945]++; if(dbg){print "R945", "sw_em_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo1; R[946]++; if(dbg){print "R946", "sw_mn_r_f"}; continue };
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; R[947]++; if(dbg){print "R947", "pl_kr_em_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2201 !_#_!
 #  x2201 sw_em_iv_		sw_mn_d_
for(wrd in omap["x2201"]){omakevars(x2201,"x2201");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_d_f() )
 { l[i]=omo2; R[948]++; if(dbg){print "R948", "sw_mn_d_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[949]++; if(dbg){print "R949", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[950]++; if(dbg){print "R950", "sw_em_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2202 !_#_!
 #  x2202 sw_em_dl_		sw_ez_v_
for(wrd in omap["x2202"]){omakevars(x2202,"x2202");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[951]++; if(dbg){print "R951", "sw_ez_v_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[952]++; if(dbg){print "R952", "sw_em_d_f"}; continue };
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; R[953]++; if(dbg){print "R953", "sw_em_l_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2203 !_#_!
 #  x2203 sw_em_dp_		sw_em_l_
for(wrd in omap["x2203"]){omakevars(x2203,"x2203");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"Ykl") && notsym(-1,unxy) && s(-1) )
 { l[i-1]=gensub(/([АЕЁИОУЫЭЮЯаеёиоуыэюя])/,"\\1\xcc\x81",1,l[i-1]); l[i]=gensub(/^(.)/,"\xcc\xa0\\1\xcc\xad",1,l[i]); R[954]++; if(dbg){print "R954"}; continue };
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; R[955]++; if(dbg){print "R955", "sw_em_l_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[956]++; if(dbg){print "R956", "sw_em_d_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[957]++; if(dbg){print "R957", "sw_em_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2204 !_#_!
 #  x2204 sw_em_dr_		sw_em_l_
for(wrd in omap["x2204"]){omakevars(x2204,"x2204");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="мозгу") {
   if ( w(-1,"за") && s(-1) )
   { l[i]=omo2; R[958]++; if(dbg){print "R958"}; continue };
 };
 #
 if ( ismark(-1,"Ykl") && notsym(-1,unxy) && s(-1) )
 { l[i-1]=gensub(/([АЕЁИОУЫЭЮЯаеёиоуыэюя])/,"\\1\xcc\x81",1,l[i-1]); l[i]=gensub(/^(.)/,"\xcc\xa0\\1\xcc\xad",1,l[i]); R[959]++; if(dbg){print "R959"}; continue };
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; R[960]++; if(dbg){print "R960", "sw_em_l_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[961]++; if(dbg){print "R961", "sw_em_d_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[962]++; if(dbg){print "R962", "sw_em_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2205 !_#_!
 #  x2205 sw_em_d_		sw_em_k_
for(wrd in omap["x2205"]){omakevars(x2205,"x2205");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[963]++; if(dbg){print "R963", "sw_em_d_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2206 !_#_!
 #  x2206 sw_em_d_		sw_em_l_
for(wrd in omap["x2206"]){omakevars(x2206,"x2206");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"Ykl") && notsym(-1,unxy) && s(-1) )
 { l[i-1]=gensub(/([АЕЁИОУЫЭЮЯаеёиоуыэюя])/,"\\1\xcc\x81",1,l[i-1]); l[i]=gensub(/^(.)/,"\xcc\xa0\\1\xcc\xad",1,l[i]); R[964]++; if(dbg){print "R964"}; continue };
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; R[965]++; if(dbg){print "R965", "sw_em_l_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[966]++; if(dbg){print "R966", "sw_em_d_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2207 !_#_!
 #  x2207 sw_em_d_		sw_em_p_
for(wrd in omap["x2207"]){omakevars(x2207,"x2207");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; R[967]++; if(dbg){print "R967", "sw_em_p_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[968]++; if(dbg){print "R968", "sw_em_d_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2208 !_#_!
 #  x2208 sw_em_d_		sw_em_v_
for(wrd in omap["x2208"]){omakevars(x2208,"x2208");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[969]++; if(dbg){print "R969", "sw_em_v_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[970]++; if(dbg){print "R970", "sw_em_d_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2209 !_#_!
 #  x2209 sw_em_d_		sw_ez_d_
for(wrd in omap["x2209"]){omakevars(x2209,"x2209");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[971]++; if(dbg){print "R971", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[972]++; if(dbg){print "R972", "sw_ez_d_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2210 !_#_!
 #  x2210 sw_em_d_		sw_ez_v_
for(wrd in omap["x2210"]){omakevars(x2210,"x2210");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[973]++; if(dbg){print "R973", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[974]++; if(dbg){print "R974", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2211 !_#_!
 #  x2211 sw_em_dv_		sw_em_l_
for(wrd in omap["x2211"]){omakevars(x2211,"x2211");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; R[975]++; if(dbg){print "R975", "sw_em_z_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[976]++; if(dbg){print "R976", "sw_em_d_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[977]++; if(dbg){print "R977", "sw_em_v_f"}; continue };
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; R[978]++; if(dbg){print "R978", "sw_em_l_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2212 !_#_!
 #  x2212 sw_em_dz_		sw_em_l_
for(wrd in omap["x2212"]){omakevars(x2212,"x2212");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; R[979]++; if(dbg){print "R979", "sw_em_l_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[980]++; if(dbg){print "R980", "sw_em_d_f"}; continue };
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; R[981]++; if(dbg){print "R981", "sw_em_z_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2213 !_#_!
 #  x2213 sw_em_dz_		sw_ez_v_
for(wrd in omap["x2213"]){omakevars(x2213,"x2213");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; R[982]++; if(dbg){print "R982", "sw_em_z_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[983]++; if(dbg){print "R983", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[984]++; if(dbg){print "R984", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2214 !_#_!
 #  x2214 sw_em_i_		sw_em_t_
for(wrd in omap["x2214"]){omakevars(x2214,"x2214");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[985]++; if(dbg){print "R985", "sw_em_i_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[986]++; if(dbg){print "R986", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2215 !_#_!
 #  x2215 sw_em_i_		sw_em_vr_
for(wrd in omap["x2215"]){omakevars(x2215,"x2215");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[987]++; if(dbg){print "R987", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[988]++; if(dbg){print "R988", "sw_em_v_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[989]++; if(dbg){print "R989", "sw_em_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2216 !_#_!
 #  x2216 sw_em_i_		sw_mn_r_   одушевленные
for(wrd in omap["x2216"]){omakevars(x2216,"x2216");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( name_im_sy(1) && s(0) )
 { l[i]=omo1; R[990]++; if(dbg){print "R990"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[991]++; if(dbg){print "R991", "sw_em_i_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[992]++; if(dbg){print "R992", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2217 !_#_!
 #  x2217 sw_em_i_		sw_mn_vr_
for(wrd in omap["x2217"]){omakevars(x2217,"x2217");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( Q(-1,"suw_ro") && p(-1) && p(0) )
 { l[i]=omo1; R[993]++; if(dbg){print "R993"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[994]++; if(dbg){print "R994", "sw_em_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[995]++; if(dbg){print "R995", "sw_mn_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[996]++; if(dbg){print "R996", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2218 !_#_!
 #  x2218 sw_em_iv_		sw_em_t_
for(wrd in omap["x2218"]){omakevars(x2218,"x2218");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[997]++; if(dbg){print "R997", "sw_em_t_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[998]++; if(dbg){print "R998", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[999]++; if(dbg){print "R999", "sw_em_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2219 !_#_!
 #  x2219 sw_em_iv_		sw_mn_p_
for(wrd in omap["x2219"]){omakevars(x2219,"x2219");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[1000]++; if(dbg){print "R1000", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[1001]++; if(dbg){print "R1001", "sw_em_v_f"}; continue };
 #
 if ( sw_mn_p_f() )
 { l[i]=omo2; R[1002]++; if(dbg){print "R1002", "sw_mn_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2220 !_#_!
 #  x2220 sw_em_iv_		sw_mn_r_
for(wrd in omap["x2220"]){omakevars(x2220,"x2220");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="округ") {
   if ( name_im_sy(1) && s(0) )
   { l[i]=omo1; R[1003]++; if(dbg){print "R1003"}; continue };
 };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1004]++; if(dbg){print "R1004", "sw_mn_r_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[1005]++; if(dbg){print "R1005", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[1006]++; if(dbg){print "R1006", "sw_em_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2221 !_#_!
 #  x2221 sw_em_iv_		sw_mn_vr_
for(wrd in omap["x2221"]){omakevars(x2221,"x2221");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 if(iwrd=="белок") {
   cst="охота охотиться";
   if ( base(-2,cst) &&
      pre_vi(-1) && s(-2,-1) )
   { l[i]=omo2; R[1007]++; if(dbg){print "R1007"}; continue };
 };
 if ( qxs(-1,"что","за") )
 { l[i]=omo1; R[1008]++; if(dbg){print "R1008"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[1009]++; if(dbg){print "R1009", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[1010]++; if(dbg){print "R1010", "sw_em_v_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1011]++; if(dbg){print "R1011", "sw_mn_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1012]++; if(dbg){print "R1012", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2222 !_#_!
 #  x2222 sw_em_l_		sw_ems_dz_
for(wrd in omap["x2222"]){omakevars(x2222,"x2222");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[1013]++; if(dbg){print "R1013", "sw_em_d_f"}; continue };
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; R[1014]++; if(dbg){print "R1014", "sw_es_d_f"}; continue };
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; R[1015]++; if(dbg){print "R1015", "sw_em_l_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2223 !_#_!
 #  x2223 sw_em_n_		sw_em_p_
for(wrd in omap["x2223"]){omakevars(x2223,"x2223");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; R[1016]++; if(dbg){print "R1016", "sw_em_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2224 !_#_!
 #  x2224 sw_em_n_		sw_mn_iv_
for(wrd in omap["x2224"]){omakevars(x2224,"x2224");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1017]++; if(dbg){print "R1017", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1018]++; if(dbg){print "R1018", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2225 !_#_!
 #  x2225 gl_paedze_	sw_1es_r_2mn_iv_   начала  начала́  нача́ла
for(wrd in omap["x2225"]){omakevars(x2225,"x2225");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( w(-2,"с до") &&
      w(-1,"самого") && s(-2,-1) )
 { l[i]=omo2; R[1019]++; if(dbg){print "R1019"}; continue };

 if ( gl_in(1) && s(0) )
 { l[i]=omo1; R[1020]++; if(dbg){print "R1020"}; continue };
 if ( w(1,"было") &&
     (q(2,"gl_in isname")||w(2,"он")) && s(0,1) )
 { l[i]=omo1; R[1021]++; if(dbg){print "R1021"}; continue };
 if ( sc(-1,"—") &&
 (isname(1)||suw_edmuim(1)||w(1,"он")) && s(0) )
 { l[i]=omo1; R[1022]++; if(dbg){print "R1022"}; continue };

 if ( q(1,"prl_kred_sr nar_spos") && Q(-1,"pre_ro preph_ro") &&
  gl_in(2) && s(0,1) )
 { l[i]=omo1; R[1023]++; if(dbg){print "R1023"}; continue };
 if ( (suw_edzeim(1)||w(1,"она")) && s(0) )
 { l[i]=omo1; R[1024]++; if(dbg){print "R1024"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[1025]++; if(dbg){print "R1025", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1026]++; if(dbg){print "R1026", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1027]++; if(dbg){print "R1027", "sw_mn_v_f"}; continue };
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; R[1028]++; if(dbg){print "R1028", "gl_paedze_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2226 !_#_!
 #  x2226 sw_em_p_		sw_em_t_
for(wrd in omap["x2226"]){omakevars(x2226,"x2226");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[1029]++; if(dbg){print "R1029", "sw_em_p_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[1030]++; if(dbg){print "R1030", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2227 !_#_!
 #  x2227 sw_em_p_		sw_es_iv_
for(wrd in omap["x2227"]){omakevars(x2227,"x2227");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; R[1031]++; if(dbg){print "R1031", "sw_es_i_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; R[1032]++; if(dbg){print "R1032", "sw_es_v_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[1033]++; if(dbg){print "R1033", "sw_em_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2228 !_#_!
 #  x2228 sw_em_p_		sw_es_n_
for(wrd in omap["x2228"]){omakevars(x2228,"x2228");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[1034]++; if(dbg){print "R1034", "sw_em_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2229 !_#_!
 #  x2229 sw_em_p_		sw_es_p_     сти́ле  стиле́
for(wrd in omap["x2229"]){omakevars(x2229,"x2229");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[1035]++; if(dbg){print "R1035", "sw_em_p_f"}; continue };
 #
#if ( sw_es_p_f() )
#{ l[i]=omo2; R[1036]++; if(dbg){print "R1036"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2230 !_#_!
 #  x2230 sw_em_p_		sw_ez_dp_
for(wrd in omap["x2230"]){omakevars(x2230,"x2230");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 if(iwrd=="дружке") {
   if ( qxs(-1,"друг")||
        qxs(-1,"друг","на по ко") )
   { l[i]=omo2; R[1037]++; if(dbg){print "R1037"}; continue };
 };

 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[1038]++; if(dbg){print "R1038", "sw_em_p_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[1039]++; if(dbg){print "R1039", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[1040]++; if(dbg){print "R1040", "sw_ez_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2231 !_#_!
 #  x2231 sw_em_q_		sw_em_r_
for(wrd in omap["x2231"]){omakevars(x2231,"x2231");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_q_f() )
 { l[i]=omo1; R[1041]++; if(dbg){print "R1041", "sw_em_q_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[1042]++; if(dbg){print "R1042", "sw_em_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2232 !_#_!
 #  x2232 sw_em_r_		sw_es_ivr_
for(wrd in omap["x2232"]){omakevars(x2232,"x2232");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; R[1043]++; if(dbg){print "R1043", "sw_es_i_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; R[1044]++; if(dbg){print "R1044", "sw_es_v_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1045]++; if(dbg){print "R1045", "sw_em_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2233 !_#_!
 #  x2233 sw_em_r_		sw_ez_i_
for(wrd in omap["x2233"]){omakevars(x2233,"x2233");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1046]++; if(dbg){print "R1046", "sw_em_r_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[1047]++; if(dbg){print "R1047", "sw_ez_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2234 !_#_!
 #  x2234 sw_em_r_		sw_mn_i_
for(wrd in omap["x2234"]){omakevars(x2234,"x2234");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1048]++; if(dbg){print "R1048", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1049]++; if(dbg){print "R1049", "sw_mn_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2235 !_#_!
 #  x2235 sw_em_r_		sw_mn_iv_
for(wrd in omap["x2235"]){omakevars(x2235,"x2235");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="бока") {
   cst="намять отлёживать поцарапать";
   if ( base(1,cst) && s(0) )
   { l[i]=omo2; R[1050]++; if(dbg){print "R1050"}; continue };
 };
 if(iwrd=="вечера") {
   cst="минут часов";
   if ( (w(-1,cst)||q(-1,"qi_ed qi_mn")) && s(-1) )
   { l[i]=omo1; R[1051]++; if(dbg){print "R1051"}; continue };
 };
 if(iwrd=="года") {
   if ( (q(1,"qi_duom")||wc(1,"[234][^0-9]*$")) && s(0) )
   { l[i]=omo1; R[1052]++; if(dbg){print "R1052"}; continue };
 };
 if(iwrd=="города") {
   if ( w(-1,"смелость") && w(1,"берёт берет") && s(-1,0) )
   { l[i]=omo2; R[1053]++; if(dbg){print "R1053"}; continue };
 };
 if(iwrd=="рода") {
   if ( w(1,"племени") && sc(0,"-") )
   { l[i]=omo1; R[1054]++; if(dbg){print "R1054"}; continue };
 };
 if(iwrd=="роста") {
   if ( w(1,"в") && q(2,"mest_pr suw_pr") && s(0,1) )
   { l[i]=omo1; R[1055]++; if(dbg){print "R1055"}; continue };
 };
 if(iwrd=="веса") {
   if ( w(1,"в") && q(2,"mest_pr suw_pr") && s(0,1) )
   { l[i]=omo1; R[1056]++; if(dbg){print "R1056"}; continue };
 };
 if(iwrd=="шенкеля") {
   if ( wb(-3,-1,"дать дал дала дав задать задал задала") && s(wbn,-1) )
   { l[i]=omo2; R[1057]++; if(dbg){print "R1057"}; continue };
 };
 #
 if ( pre_ro(-1) && Q(-1,"pre_im pre_vi") && s(-1) )
 { l[i]=omo1; R[1058]++; if(dbg){print "R1058"}; continue };
 if ( q(-1,"pre_im pre_vi") && Q(-1,"pre_ro") && s(-1) )
 { l[i]=omo2; R[1059]++; if(dbg){print "R1059"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1060]++; if(dbg){print "R1060", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1061]++; if(dbg){print "R1061", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1062]++; if(dbg){print "R1062", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2236 !_#_!
 #  x2236 sw_ems_p_		sw_es_iv_
for(wrd in omap["x2236"]){omakevars(x2236,"x2236");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; R[1063]++; if(dbg){print "R1063", "sw_es_i_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; R[1064]++; if(dbg){print "R1064", "sw_es_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2237 !_#_!
 #  x2237 sw_ems_r_		sw_mn_iv_  века  ве́ка  века́
for(wrd in omap["x2237"]){omakevars(x2237,"x2237");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2

 if ( sc(-1,"[^-]\\s?[IVXLCM]+\\s$") && W(-1,"и или да") )
 { l[i]=omo1; R[1065]++; if(dbg){print "R1065"}; continue };
 if ( sc(-1,"[-]\\s?[IVXLCM]+\\s$") || sz_iili(-1) )
 { l[i]=omo2; R[1066]++; if(dbg){print "R1066"}; continue };

 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1067]++; if(dbg){print "R1067", "sw_em_r_f"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; R[1068]++; if(dbg){print "R1068", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1069]++; if(dbg){print "R1069", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1070]++; if(dbg){print "R1070", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2238 !_#_!
 #  x2238 sw_em_t_		sw_ems_p_
for(wrd in omap["x2238"]){omakevars(x2238,"x2238");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; R[1071]++; if(dbg){print "R1071", "sw_em_p_f"}; continue };
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; R[1072]++; if(dbg){print "R1072", "sw_es_p_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo1; R[1073]++; if(dbg){print "R1073", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2239 !_#_!
 #  x2239 sw_em_t_		sw_es_p_
for(wrd in omap["x2239"]){omakevars(x2239,"x2239");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo1; R[1074]++; if(dbg){print "R1074", "sw_em_t_f"}; continue };
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; R[1075]++; if(dbg){print "R1075", "sw_es_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2240 !_#_!
 #  x2240 m2_1nar_spos_2sw_em_t_		sw_mn_r_
for(wrd in omap["x2240"]){omakevars(x2240,"x2240");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if(iwrd=="хором") {
   if ( q(-1,"gl_mn gl_vzmn gl_pomn deep") && type(-1,"gov") && s(-1) )
   { l[i]=omo1; R[1076]++; if(dbg){print "R1076"}; continue };
   if ( q(1,"gl_mn gl_vzmn gl_pomn deep") && type(1,"gov") && s(0) )
   { l[i]=omo1; R[1077]++; if(dbg){print "R1077"}; continue };
 };
 #
 if ( nar_spos_f() )
 { l[i]=omo1; R[1078]++; if(dbg){print "R1078", "nar_spos_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo1; R[1079]++; if(dbg){print "R1079", "sw_em_t_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1080]++; if(dbg){print "R1080", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2241 !_#_!
 #  x2241 sw_em_vr_		sw_ez_i_
for(wrd in omap["x2241"]){omakevars(x2241,"x2241");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if(iwrd=="черта") {
   if ( w(-1,"ни") &&
      Q_w(1,"suw_ro mest_ro") && s(-1) )
   { l[i]=omo2; R[1081]++; if(dbg){print "R1081"}; continue };
   if ( w(-1,"ни") &&
        q(1,"prl_edro") && s(-1) )
   { l[i]=omo2; R[1082]++; if(dbg){print "R1082"}; continue };
   if ( w(-1,"на") &&
        q(1,"mest_da suw_da") && s(-1,0) )
   { l[i]=omo2; R[1083]++; if(dbg){print "R1083"}; continue };
 };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[1084]++; if(dbg){print "R1084", "sw_ez_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[1085]++; if(dbg){print "R1085", "sw_em_v_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1086]++; if(dbg){print "R1086", "sw_em_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2242 !_#_!
 #  x2242 sw_em_vr_		sw_mn_i_  < одушевленные! >
for(wrd in omap["x2242"]){omakevars(x2242,"x2242");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if(iwrd=="господа") {
   if ( p(-1) && p(0) )
   { l[i]=omo2; R[1087]++; if(dbg){print "R1087"}; continue };
   cst="бога нашего";
   if ( w(1,cst) && s(0) )
   { l[i]=omo1; R[1088]++; if(dbg){print "R1088"}; continue };
   if ( suw_odmnim(1) && s(0) )
   { l[i]=omo2; R[1089]++; if(dbg){print "R1089"}; continue };
 };
 #
 if ( name_im_sy(1) &&
         sz_iili(2) &&
      name_im_sy(3) && s(0,2) )
 { l[i]=omo2; R[1090]++; if(dbg){print "R1090"}; continue };
 #
 if ( name_ro_sy(1) && s(0) )
 { l[i]=omo1; R[1091]++; if(dbg){print "R1091"}; continue };

 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1092]++; if(dbg){print "R1092", "sw_em_r_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[1093]++; if(dbg){print "R1093", "sw_em_v_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1094]++; if(dbg){print "R1094", "sw_mn_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2243 !_#_!
 #  x2243 sw_em_vr_		sw_mn_iv_
for(wrd in omap["x2243"]){omakevars(x2243,"x2243");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[1095]++; if(dbg){print "R1095", "sw_em_v_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1096]++; if(dbg){print "R1096", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1097]++; if(dbg){print "R1097", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1098]++; if(dbg){print "R1098", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2244 !_#_!
 #  x2244 gl_paedmu_	sw_mn_r_  начал  на́чал  нача́л
for(wrd in omap["x2244"]){omakevars(x2244,"x2244");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
   if ( q(1,"mest_vi mest_3e") &&
    gl_in(2) && s(0,1) )
   { l[i]=omo1; R[1099]++; if(dbg){print "R1099"}; continue };
   if ( gl_in(1) && s(0) )
   { l[i]=omo1; R[1100]++; if(dbg){print "R1100"}; continue };
   if ( (w(1,"было")||q(1,"prl_kred_sr mest_da suw_da")) &&
        (q(2,"gl_in name_im_sy isname")||w(2,"он")) && s(0,1) )
   { l[i]=omo1; R[1101]++; if(dbg){print "R1101"}; continue };
   if ( sc(-2,"—") &&
         q(-1,"nar_spos nar_kaq nar_vrem prl_kred_sr") &&
        (q(1,"suw_edmuim name_im_sy isname")||w(1,"он")) && s(-1,0) )
   { l[i]=omo1; R[1102]++; if(dbg){print "R1102"}; continue };
   if ( sc(-1,"—") &&
        (q(1,"suw_edmuim name_im_sy isname prl_edmuim")||w(1,"он")||wc(1,"[A-Za-z0-9]+")) && s(0) )
   { l[i]=omo1; R[1103]++; if(dbg){print "R1103"}; continue };
   if ( q(1,"pre_vi preph_vi") &&
        q(2,"suw_vi prl_vi prq_vi mest_vi") && s(0,1) )
   { l[i]=omo1; R[1104]++; if(dbg){print "R1104"}; continue };
   if ( q(1,"pre_ro preph_ro") &&
        q(2,"suw_ro prl_ro prq_ro mest_ro") && s(0,1) )
   { l[i]=omo1; R[1105]++; if(dbg){print "R1105"}; continue };
   if ( q(1,"pre_tv preph_tv") &&
        q(2,"suw_tv prl_tv prq_tv mest_tv") && s(0,1) )
   { l[i]=omo1; R[1106]++; if(dbg){print "R1106"}; continue };
   if ( pre_pr(1) &&
             q(2,"suw_pr prl_pr prq_pr mest_pr") && s(0,1) )
   { l[i]=omo1; R[1107]++; if(dbg){print "R1107"}; continue };
   if ( gl_in(1) && s(0) )
   { l[i]=omo1; R[1108]++; if(dbg){print "R1108"}; continue };
   if ( (q(-1,"suw_edmuim name_im_sy isname")||w(-1,"он")) &&
         q(1,"suw_vi") && s(-1,0) )
   { l[i]=omo1; R[1109]++; if(dbg){print "R1109"}; continue };

 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; R[1110]++; if(dbg){print "R1110", "gl_paedmu_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1111]++; if(dbg){print "R1111", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2245 !_#_!
 #  x2245 sw_es_d_		sw_ez_t_
for(wrd in omap["x2245"]){omakevars(x2245,"x2245");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_d_f() )
 { l[i]=omo1; R[1112]++; if(dbg){print "R1112", "sw_es_d_f"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[1113]++; if(dbg){print "R1113", "sw_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2246 !_#_!
 #  x2246 sw_es_d_		sw_ez_v_
for(wrd in omap["x2246"]){omakevars(x2246,"x2246");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_d_f() )
 { l[i]=omo1; R[1114]++; if(dbg){print "R1114", "sw_es_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[1115]++; if(dbg){print "R1115", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2247 !_#_!
 #  x2247 sw_es_i_		sw_es_v_
for(wrd in omap["x2247"]){omakevars(x2247,"x2247");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo1; R[1116]++; if(dbg){print "R1116", "sw_es_i_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; R[1117]++; if(dbg){print "R1117", "sw_es_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2248 !_#_!
 #  x2248 sw_es_iv_		sw_es_p_
for(wrd in omap["x2248"]){omakevars(x2248,"x2248");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1

 if(iwrd=="крыльце") {
   if ( w(-1,"на") && s(-1) )
   { l[i]=omo2; R[1118]++; if(dbg){print "R1118"}; continue };
 };
 #
 if ( sw_es_i_f() )
 { l[i]=omo1; R[1119]++; if(dbg){print "R1119", "sw_es_i_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo1; R[1120]++; if(dbg){print "R1120", "sw_es_v_f"}; continue };
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; R[1121]++; if(dbg){print "R1121", "sw_es_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2249 !_#_!
 #  x2249 sw_es_n_		sw_ez_dp_
for(wrd in omap["x2249"]){omakevars(x2249,"x2249");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[1122]++; if(dbg){print "R1122", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[1123]++; if(dbg){print "R1123", "sw_ez_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2250 !_#_!
 #  x2250 sw_es_n_		sw_ez_p_
for(wrd in omap["x2250"]){omakevars(x2250,"x2250");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[1124]++; if(dbg){print "R1124", "sw_ez_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2251 !_#_!
 #  x2251 sw_es_n_		sw_ez_v_
for(wrd in omap["x2251"]){omakevars(x2251,"x2251");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[1125]++; if(dbg){print "R1125", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2252 !_#_!
 #  x2252 sw_es_p_		sw_ez_dp_
for(wrd in omap["x2252"]){omakevars(x2252,"x2252");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_p_f() )
 { l[i]=omo1; R[1126]++; if(dbg){print "R1126", "sw_es_p_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[1127]++; if(dbg){print "R1127", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[1128]++; if(dbg){print "R1128", "sw_ez_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2253 !_#_!
 #  x2253 sw_es_rz_		sw_ez_i_
for(wrd in omap["x2253"]){omakevars(x2253,"x2253");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_z_f() )
 { l[i]=omo1; R[1129]++; if(dbg){print "R1129", "sw_es_z_f"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; R[1130]++; if(dbg){print "R1130", "sw_es_r_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[1131]++; if(dbg){print "R1131", "sw_ez_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2254 !_#_!
 #  x2254 sw_es_r_      sw_mn_iv_
for(wrd in omap["x2254"]){omakevars(x2254,"x2254");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="утра") {
   cst="до минут от с часов";
   if ( (w(-1,cst)||q(-1,"qi_ed qi_mn nar_vrem")) && s(-1) )
   { l[i]=omo1; R[1132]++; if(dbg){print "R1132"}; continue };
 };
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; R[1133]++; if(dbg){print "R1133", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1134]++; if(dbg){print "R1134", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1135]++; if(dbg){print "R1135", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2255 !_#_!
 #  x2255 sw_em_r_		sw_mn_iv_  цвета  цве́та  цвета́
for(wrd in omap["x2255"]){omakevars(x2255,"x2255");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( ( suw_mnim(-2)||(suw_mnim(-3) && q(-2,"name_ro_sy isname")) && s(-3)) &&
               w(-1,"были") &&
               q(1,"prl_ro suw_ro prq_ro suw_edne") && s(-2,0) )
 { l[i]=omo1; R[1136]++; if(dbg){print "R1136"}; continue };
 cst="был была было";
 if ( (suw_any(-1)||w(-1,cst)) && Q(-1,"prl_mnim") &&
             q(1,"prl_ro suw_ro prq_ro suw_edne") && s(-1,0) )
 { l[i]=omo1; R[1137]++; if(dbg){print "R1137"}; continue };
 cst="был была было";
 if ( (suw_any(-1)||w(-1,cst)) && Q(-1,"prl_mnim") &&
            qf(1,5,"suw_ro suw_edne") && s(-1,qfn-1) )
 { l[i]=omo1; R[1138]++; if(dbg){print "R1138"}; continue };
 if ( muk_edmuro(-2) &&
               q(-1,"mest_im suw_im") && s(-2,-1) )
 { l[i]=omo1; R[1139]++; if(dbg){print "R1139"}; continue };
 if ( prl_any(-1) && sc(-1,",") &&
            q(1,"mest_ro prl_ro prq_ro") &&
            q(2,"suw_ro") && s(0,1) )
 { l[i]=omo1; R[1140]++; if(dbg){print "R1140"}; continue };
 if ( prl_any(-1) && sc(-1,",") &&
            q(1,"suw_ro") && s(0) )
 { l[i]=omo1; R[1141]++; if(dbg){print "R1141"}; continue };
 #
 if ( pre_ro(-1) && Q(-1,"pre_im pre_vi") && s(-1) )
 { l[i]=omo1; R[1142]++; if(dbg){print "R1142"}; continue };
 if ( q(-1,"pre_im pre_vi") && Q(-1,"pre_ro") && s(-1) )
 { l[i]=omo2; R[1143]++; if(dbg){print "R1143"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1144]++; if(dbg){print "R1144", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1145]++; if(dbg){print "R1145", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1146]++; if(dbg){print "R1146", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2256 !_#_!
 #  x2256 sw_ez_iv_		sw_mn_r_
for(wrd in omap["x2256"]){omakevars(x2256,"x2256");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1147]++; if(dbg){print "R1147", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2257 !_#_!
 #  x2257 sw_ez_r_		sw_mn_i_
for(wrd in omap["x2257"]){omakevars(x2257,"x2257");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[1148]++; if(dbg){print "R1148", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1149]++; if(dbg){print "R1149", "sw_mn_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2258 !_#_!
 #  x2258 sw_ez_r_      sw_mn_iv_
for(wrd in omap["x2258"]){omakevars(x2258,"x2258");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="весны") {
   if ( base(-1,"гончая") && s(-1) )
   { l[i]=omo1; R[1150]++; if(dbg){print "R1150"}; continue };
 };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[1151]++; if(dbg){print "R1151", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1152]++; if(dbg){print "R1152", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1153]++; if(dbg){print "R1153", "sw_mn_v_f"}; continue };

#if ( wc(-1,"[ео]й$ [ео]йся$") && s(-1) )
#{ l[i]=omo1; R[1154]++; if(dbg){print "R1154"}; continue };
#if ( wc(-1,"[иы]е$ [иы]еся$") && s(-1) )
#{ l[i]=omo2; R[1155]++; if(dbg){print "R1155"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2259 !_#_!
 #  x2259 sw_ez_r_		sw_mn_v_
for(wrd in omap["x2259"]){omakevars(x2259,"x2259");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[1156]++; if(dbg){print "R1156", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1157]++; if(dbg){print "R1157", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2260 !_#_!
 #  x2260 sw_ez_t_		sw_ez_v_
for(wrd in omap["x2260"]){omakevars(x2260,"x2260");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo1; R[1158]++; if(dbg){print "R1158", "sw_ez_t_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[1159]++; if(dbg){print "R1159", "sw_ez_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2261 !_#_!
 #  x2261 sw_ez_t_		sw_mn_r_
for(wrd in omap["x2261"]){omakevars(x2261,"x2261");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo1; R[1160]++; if(dbg){print "R1160", "sw_ez_t_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1161]++; if(dbg){print "R1161", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2262 !_#_!
 #  x2262 sw_ez_t_		sw_mn_vr_
for(wrd in omap["x2262"]){omakevars(x2262,"x2262");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo1; R[1162]++; if(dbg){print "R1162", "sw_ez_t_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1163]++; if(dbg){print "R1163", "sw_mn_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1164]++; if(dbg){print "R1164", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2263 !_#_!
 #  x2263 sw_mn_p_		sw_mn_r_
for(wrd in omap["x2263"]){omakevars(x2263,"x2263");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_p_f() )
 { l[i]=omo1; R[1165]++; if(dbg){print "R1165", "sw_mn_p_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1166]++; if(dbg){print "R1166", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2264 !_#_!
 #  x2264 sw_mn_p_      sw_mn_vr_
for(wrd in omap["x2264"]){omakevars(x2264,"x2264");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_p_f() )
 { l[i]=omo1; R[1167]++; if(dbg){print "R1167", "sw_mn_p_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1168]++; if(dbg){print "R1168", "sw_mn_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1169]++; if(dbg){print "R1169", "sw_mn_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2265 !_#_!
 #  x2265 mest_1ems_t_2mn_d_       mest_ems_p_
for(wrd in omap["x2265"]){omakevars(x2265,"x2265");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="во на о обо при";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1170]++; if(dbg){print "R1170"}; continue };
 #
 cst="во на о обо при";
 if ( !(w(-1,cst) && s(-1)) )
 { l[i]=omo1; R[1171]++; if(dbg){print "R1171"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2266 !_#_!
 #  x2266 m2_1mest_es_r_2souz_     mest_es_p_    чем  че́м  чём
for(wrd in omap["x2266"]){omakevars(x2266,"x2266");for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="в на о об по при";
 if ( !(w(-2,"не") && s(-2)) &&
        w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1172]++; if(dbg){print "R1172"}; continue };
 #
 if ( tolower(l[i])==iwrd )
 { l[i]=omo1; R[1173]++; if(dbg){print "R1173"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2267 !_#_!
 #  x2267 qip_iv_       sw_mn_vr_    сорок  со́рок  соро́к
for(wrd in omap["x2267"]){omakevars(x2267,"x2267");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(1,"suw_mnro suw_mnsq qi_ed qi_mn") && s(0) )
 { l[i]=omo1; R[1174]++; if(dbg){print "R1174"}; continue };
 if ( q(-1,"suw_mnro suw_mnsq qi_ed qi_mn") && s(-1) )
 { l[i]=omo1; R[1175]++; if(dbg){print "R1175"}; continue };
 if ( q(-2,"qi_ed qi_mn") &&
      w(-1,"или") && s(-2,-1) )
 { l[i]=omo1; R[1176]++; if(dbg){print "R1176"}; continue };
 if ( w(1,"или") &&
      q(2,"qi_ed qi_mn") && s(0,1) )
 { l[i]=omo1; R[1177]++; if(dbg){print "R1177"}; continue };
 cst="за по под";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1178]++; if(dbg){print "R1178"}; continue };

 cst="в за на под";
 if ( suw_mnro(-2) &&
             w(-1,cst) && s(-2,-1) )
 { l[i]=omo1; R[1179]++; if(dbg){print "R1179"}; continue };

 if ( qxs(1,"с","половиной четвертью небольшим") )
 { l[i]=omo1; R[1180]++; if(dbg){print "R1180"}; continue };
 if ( q(-1,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") && s(-1) )
 { l[i]=omo1; R[1181]++; if(dbg){print "R1181"}; continue };

 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1182]++; if(dbg){print "R1182", "sw_mn_r_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1183]++; if(dbg){print "R1183", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2268 !_#_!
 #  x2268 qip_dprt_     sw_ez_i_   сорока  сорока́  соро́ка
for(wrd in omap["x2268"]){omakevars(x2268,"x2268");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2ш
 prex=1
 #
 cst="более менее около";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1184]++; if(dbg){print "R1184"}; continue };
 if ( pre_pr(-1) &&
           q(1,"suw_mnpr qik_pr") && s(-1,0) )
 { l[i]=omo1; R[1185]++; if(dbg){print "R1185"}; continue };
 if ( q(-2,"qik_ro") &&
      q(-1,"sz_iili") && s(-2,-1) )
 { l[i]=omo1; R[1186]++; if(dbg){print "R1186"}; continue };
 if ( q(-1,"suw_mnro suw_mnsq qik_ro") && s(-1) )
 { l[i]=omo1; R[1187]++; if(dbg){print "R1187"}; continue };
 if ( q(1,"suw_mnro suw_mnsq qik_ro") && s(0) )
 { l[i]=omo1; R[1188]++; if(dbg){print "R1188"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[1189]++; if(dbg){print "R1189", "sw_ez_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2269 !_#_!
 #  x2269 mest_ems_d_   sw_em_d_   тому  то́му  тому́
for(wrd in omap["x2269"]){omakevars(x2269,"x2269");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="как что чтоб чтобы";
 if ( sc(0,",") &&
      (q(1,"muk_ed muk_mn mest_ed mest_mn")||w(1,cst)) )
 { l[i]=omo1; R[1190]++; if(dbg){print "R1190"}; continue };

 if ( q(-1,"mod_ed mod_mn mod_bz gl_in") &&
      q(1,"gl_in") && s(-1,0) )
 { l[i]=omo1; R[1191]++; if(dbg){print "R1191"}; continue };

 if ( prl_any(-2) &&
       pre_da(-1) &&
           sc(0,",") && s(-2,-1) )
 { l[i]=omo1; R[1192]++; if(dbg){print "R1192"}; continue };
 if ( sz_iili(1) &&
            q(2,"mest_da") && s(0,1) )
 { l[i]=omo1; R[1193]++; if(dbg){print "R1193"}; continue };
 if ( pre_da(-1) &&
          (q(1,"suw_edmuda suw_edsrda")||w(1,"же")) && s(-1,0) )
 { l[i]=omo1; R[1194]++; if(dbg){print "R1194"}; continue };
 if ( pre_da(-1) &&
          (q(1,"suw_edmuda suw_edsrda")||w(1,"же")) && s(-1,0) )
 { l[i]=omo1; R[1195]++; if(dbg){print "R1195"}; continue };
 if ( w(1,"же") &&
      q(2,"suw_edmuda suw_edsrda") && s(0,1) )
 { l[i]=omo1; R[1196]++; if(dbg){print "R1196"}; continue };
 if ( q(-1,"suw_ro qik_im") &&
      w(1,"назад") && s(-1) )
 { l[i]=omo1; R[1197]++; if(dbg){print "R1197"}; continue };

 cst="подобна подобная подобнее подобней подобно подобного подобное подобной подобном подобному подобною подобную подобны подобные подобный подобным подобными \
      подобных";
 if ( w(-1,"а и но") &&
      w(1,cst) && s(-1) )
 { l[i]=omo1; R[1198]++; if(dbg){print "R1198"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[1199]++; if(dbg){print "R1199", "sw_em_d_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2270 !_#_!
 #  x2270	deep_na_    pre_combo_  судя судя́ су́дя
for(wrd in omap["x2270"]){omakevars(x2270,"x2270");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"по") && s(0) )
 { l[i]=omo2; R[1200]++; if(dbg){print "R1200"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2271 !_#_!
 #  x2271 m2_1sw_ez_i_2predik_     sw_ez_i_  пора  пора́  по́ра
for(wrd in omap["x2271"]){omakevars(x2271,"x2271");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qf(1,3,"gl_in") && s(0,qfn-1) )
 { l[i]=omo1; R[1201]++; if(dbg){print "R1201"}; continue };
 if ( mest_da(-1) )
 { l[i]=omo1; R[1202]++; if(dbg){print "R1202"}; continue };
 if ( p(-1)||p(0) )
 { l[i]=omo1; R[1203]++; if(dbg){print "R1203"}; continue };
 if ( q(-1,"gl_paedze") )
 { l[i]=omo1; R[1204]++; if(dbg){print "R1204"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2272 !_#_!
 #  x2272 m2_1pl_kr_ez_2sw_mn_iv_  sw_es_r_  права  права́  пра́ва
for(wrd in omap["x2272"]){omakevars(x2272,"x2272");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-4,"gl_pein gl_peed gl_pemn deep_pe prq_pe gl_pnin gl_pned gl_pnmn deep_pn prq_pn") &&
      q(-3,"suw_vi") &&
         suw_edro(-2) && sz_iili(-1) && s(-4,-1) )
 { l[i]=omo1; R[1205]++; if(dbg){print "R1205"}; continue };
 if ( qxs(-1,"как","при","этом") )
 { l[i]=omo1; R[1206]++; if(dbg){print "R1206"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[1207]++; if(dbg){print "R1207", "sw_es_r_f"}; continue };
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; R[1208]++; if(dbg){print "R1208", "pl_kr_ez_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[1209]++; if(dbg){print "R1209", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[1210]++; if(dbg){print "R1210", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2273 !_#_!
 #  x2273 samogo1_ samogo2_   самого  са́мого  самого́
for(wrd in omap["x2273"]){omakevars(x2273,"x2273");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="посыльного";
 if (  w(1,cst) && s(0) )
 { l[i]=omo2; R[1211]++; if(dbg){print "R1211"}; continue };

 if ( q(1,"prl_edmuro") && s(0) && (p(1)||q_w(2,"pre_any sz_iili")) && Q(1,"suw_odedro") )
 { l[i]=omo1; R[1212]++; if(dbg){print "R1212"}; continue };
 if ( w(-3,"у") &&
      q(-2,"mest_ro") &&
      w(-1,"у") && s(-3,-1) )
 { l[i]=omo2; R[1213]++; if(dbg){print "R1213"}; continue };
 if ( qxs(-1,"того этого","же")||
      ww_(-1,"того этого") )
 { l[i]=omo1; R[1214]++; if(dbg){print "R1214"}; continue };
 #
 cst="меня себя тебя";
 if ( (w(1,cst)||q(1,"gl_mn gl_ed muk_edmuro")) && s(0) && Q(1,"suw_any") )
 { l[i]=omo2; R[1215]++; if(dbg){print "R1215"}; continue };
 if ( w(1,"не") &&
     (w(2,cst)||q(2,"gl_mn gl_ed muk_edmuro")) && s(0,1) && Q(2,"suw_any") )
 { l[i]=omo2; R[1216]++; if(dbg){print "R1216"}; continue };

 if ( w(1,"его") && s(0) && p(1) )
 { l[i]=omo2; R[1217]++; if(dbg){print "R1217"}; continue };

 cst="меня него себя тебя";
 if ( (w(-1,cst)||muk_edmuro(-1)) && s(-1) )
 { l[i]=omo2; R[1218]++; if(dbg){print "R1218"}; continue };
 if ( (w(-1,"его")||muk_edmuro(-1)) && (p(0)||q_w(1,"sz_iili pre_any")) && s(-1) )
 { l[i]=omo2; R[1219]++; if(dbg){print "R1219"}; continue };
 #
 cst="высокого низкого толстого тонкого умного хитрого храброго худого";
 if ( w(1,cst) &&
      q(2,"name_ro_sy isname") && s(0,1) )
 { l[i]=omo1; R[1220]++; if(dbg){print "R1220"}; continue };
 if ( q(1,"prl_edmuro prl_edsrro prq_edmuro prq_edsrro prl_edsrro mest_vi mest_ro") &&
      q(2,"name_ro_sy isname") && s(0,1) )
 { l[i]=omo2; R[1221]++; if(dbg){print "R1221"}; continue };
 if ( q(1,"name_ro_sy isname") && s(0) )
 { l[i]=omo2; R[1222]++; if(dbg){print "R1222"}; continue };
 if ( q(1,"suw_odedro") && s(0) && Q(1,"prl_edro") )
 { l[i]=omo2; R[1223]++; if(dbg){print "R1223"}; continue };
 if ( q(1,"prl_edmuro prl_edsrro") && sc(1,",") && s(0) &&
      w(2,"самого") &&
      q(3,"prl_edmuro prl_edsrro") && s(2,3) )
 { l[i]=omo1; R[1224]++; if(dbg){print "R1224"}; continue };
 if ( q(1,"prl_edmuro prl_edsrro prq_edmuro prq_edsrro") &&
sz_iili(2) &&
      q(3,"prl_edmuro prl_edsrro prq_edmuro prq_edsrro") && s(0,2) )
 { l[i]=omo1; R[1225]++; if(dbg){print "R1225"}; continue };
 if ( q(-2,"prl_edmuro prl_edsrro prq_edmuro prq_edsrro") &&
sz_iili(-1) &&
      q(1,"prl_edmuro prl_edsrro prq_edmuro prq_edsrro") && s(-2,0) )
 { l[i]=omo1; R[1226]++; if(dbg){print "R1226"}; continue };
 if ( q(1,"prl_edmuro prl_edsrro prq_edmuro prq_edsrro mest_vi mest_ro") &&
      q(2,"suw_edmuro suw_edsrro pre_any prl_edmuro prl_edsrro") && s(0,1) && Q(2,"isname") )
 { l[i]=omo1; R[1227]++; if(dbg){print "R1227"}; continue };
 if ( q(1,"prl_edmuro prl_edsrro mest_vi mest_ro") && s(0) && (p(1)||q_w(2,"sz_iili pre_any")) && Q(1,"suw_odedro") )
 { l[i]=omo1; R[1228]++; if(dbg){print "R1228"}; continue };
 if ( q(1,"prq_edmuro prq_edsrro") && s(0) && (p(1)||q_w(2,"pre_any")) )
 { l[i]=omo2; R[1229]++; if(dbg){print "R1229"}; continue };
 #
 if ( mest_vi(1) && s(0) )
 { l[i]=omo2; R[1230]++; if(dbg){print "R1230"}; continue };
 if ( pre_ro(-2) && W(-2,"с") &&
     mest_ro(-1) && s(-2,-1) && !(q(1,"suw_ro") && s(0)) )
 { l[i]=omo2; R[1231]++; if(dbg){print "R1231"}; continue };
 if ( pre_ro(-1) &&
         (q_(1,swn_edmu_ro)||q_(1,swn_edsr_ro)||mest_ro(1)) && s(-1,0) )
 { l[i]=omo1; R[1232]++; if(dbg){print "R1232"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2274 !_#_!
 #  x2274 samoe1_ samoe2_     самое  са́мое  самоё
for(wrd in omap["x2274"]){omakevars(x2274,"x2274");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qxs(-1,"то это","же")||
      ww_(-1,"то это") )
 { l[i]=omo1; R[1233]++; if(dbg){print "R1233"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer
### x2275 !_#_!
 #  x2275 samoy1_ samoy2_     самой  са́мой  само́й
for(wrd in omap["x2275"]){omakevars(x2275,"x2275");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
#cst="природе стуже сути форме";
#if ( w(-1,"по") &&
#      w(1,cst) && s(-1,0) )
#{ l[i]=omo2; R[1234]++; if(dbg){print "R1234"}; continue };
 cst="высоте глубине глубинке гуще середине середке серёдке чаще";
 if ( w(-1,"в") &&
      w(1,cst) && s(-1,0) )
 { l[i]=omo1; R[1235]++; if(dbg){print "R1235"}; continue };

 #
 cst="возле до у";
 if ( w(-1,cst) &&
      q(1,"suw_noedro suw_nomnro") && s(-1,0) )
 { l[i]=omo1; R[1236]++; if(dbg){print "R1236"}; continue };
 cst="в о по";
 if ( w(-1,cst) &&
      q(1,"suw_noedpr suw_nomnpr") && s(-1,0) )
 { l[i]=omo2; R[1237]++; if(dbg){print "R1237"}; continue };
 if ( w(-1,"перед") &&
      q(1,"suw_noedtv suw_nomntv") && s(-1,0) )
 { l[i]=omo1; R[1238]++; if(dbg){print "R1238"}; continue };

 if ( q(1,"prl_edzeda") && s(0) && (p(1)||q_w(2,"pre_any sz_iili")) && Q(1,"suw_odedda") )
 { l[i]=omo1; R[1239]++; if(dbg){print "R1239"}; continue };
 if ( w(-3,"у") &&
      q(-2,"mest_ro") &&
      w(-1,"у") && s(-3,-1) )
 { l[i]=omo2; R[1240]++; if(dbg){print "R1240"}; continue };
 if ( qxs(-1,"той этой","же")||
      ww_(-1,"той этой") )
 { l[i]=omo1; R[1241]++; if(dbg){print "R1241"}; continue };
 #
 cst="ей себе себя тебе";
 if ( (w(1,cst)||q(1,"gl_mn gl_ed muk_edzeda")) && s(0) && Q(1,"suw_any") )
 { l[i]=omo2; R[1242]++; if(dbg){print "R1242"}; continue };
 if ( w(1,"ее её") && p(1) && s(0) )
 { l[i]=omo2; R[1243]++; if(dbg){print "R1243"}; continue };
 cst="ей меня мне нее неё себе себя тебе тебя";
 if ( (w(-1,cst)||muk_edzeda(-1)) && s(-1) )
 { l[i]=omo2; R[1244]++; if(dbg){print "R1244"}; continue };
 if ( (w(-1,"ее её")||muk_edzeda(-1)) && (p(0)||q_w(1,"sz_iili pre_any")) && s(-1) )
 { l[i]=omo2; R[1245]++; if(dbg){print "R1245"}; continue };


 #
 if ( q(-2,"muk_edzeda muk_edzero muk_edzetv muk_edzepr") &&
      w(-1,"же") && s(-2,-1) )
 { l[i]=omo1; R[1246]++; if(dbg){print "R1246"}; continue };
 if ( muk_edzeda(-1) && s(-1) )
 { l[i]=omo1; R[1247]++; if(dbg){print "R1247"}; continue };

 cst="вашей его ее её их нашей своей твоей";
 if ( w(-1,"по и") &&
      w(1,cst) &&
      q(2,"suw_edzeda suw_edzero suw_edzetv suw_edzepr") && s(-1,1) )
 { l[i]=omo2; R[1248]++; if(dbg){print "R1248"}; continue };
 #
 if ( q(1,"prl_edzeda prl_edzero prl_edzetv") && sc(1,",") && s(0) &&
      w(2,"самой") &&
      q(3,"prl_edzeda prl_edzero prl_edzetv") && s(2,3) )
 { l[i]=omo1; R[1249]++; if(dbg){print "R1249"}; continue };
 if ( q(1,"prl_edzeda prl_edzero prl_edzetv qik_tv") &&
      q(2,"prl_edzeda prl_edzero prl_edzetv") &&
      q(3,"suw_edzeda suw_edzero suw_edzetv suw_edzepr pre_any") && s(0,2) )
 { l[i]=omo1; R[1250]++; if(dbg){print "R1250"}; continue };
 if ( q(1,"prl_edzeda prl_edzero prl_edzetv mest_da") &&
      q(2,"suw_edzeda suw_edzero suw_edzetv suw_edzepr pre_any") && s(0,1) )
 { l[i]=omo1; R[1251]++; if(dbg){print "R1251"}; continue };
 if ( q(1,"prl_edzeda prl_edzero prl_edzetv") &&
mest_3e(2) &&
      q(3,"suw_edzeda suw_edzero suw_edzetv suw_edzepr pre_any") && s(0,2) )
 { l[i]=omo1; R[1252]++; if(dbg){print "R1252"}; continue };
 if ( q(1,"prl_edzeda prl_edzero prl_edzetv") &&
      q(2,"gl_need gl_nemn gl_vzmn") &&
      q(3,"suw_im") && s(0,2) )
 { l[i]=omo1; R[1253]++; if(dbg){print "R1253"}; continue };
 #
 if ( q(1,"prl_edzeda") &&
sz_iili(2) &&
      w(3,"самой") &&
      q(4,"prl_edzeda") && s(0,3) )
 { l[i]=omo1; R[1254]++; if(dbg){print "R1254"}; continue };
 #
 if ( q(1,"name_pr_sy isname") && s(0) )
 { l[i]=omo2; R[1255]++; if(dbg){print "R1255"}; continue };
 if ( q(-1,"pre_da preph_da") &&
     q_(1,swn_edmze_pr) && s(-1,0) )
 { l[i]=omo1; R[1256]++; if(dbg){print "R1256"}; continue };

 if ( q(1,"prl_edzetv prq_edzetv") && s(0) && p(1) )
 { l[i]=omo1; R[1257]++; if(dbg){print "R1257"}; continue };
 if ( q(1,"suw_tv") &&
      q(2,"gl_pein gl_peed gl_pemn deep_pe prq_pe") && s(0,1) )
 { l[i]=omo2; R[1258]++; if(dbg){print "R1258"}; continue };
 if ( q(1,"suw_tv") &&
   base(2,"быть") &&
      q(3,"prq_pe") && s(0,2) )
 { l[i]=omo2; R[1259]++; if(dbg){print "R1259"}; continue };


 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2276 !_#_!
 #  x2276 samom1_ samom2_     самом  са́мом  само́м
for(wrd in omap["x2276"]){omakevars(x2276,"x2276");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 # индивидуальные слова
 cst = "верху виду деле зените конце краю начале низу носу разгаре расцвете сердце центре углу"
 if ( pre_pr(-1) &&
           w(1,cst) && s(-1,0) )
 { l[i]=omo1; R[1260]++; if(dbg){print "R1260"}; continue };
 if ( pre_pr(-1) &&
           q(1,"prl_edmupr prq_edmupr") &&
           w(2,cst) && s(-1,1) )
 { l[i]=omo1; R[1261]++; if(dbg){print "R1261"}; continue };
 if ( pre_pr(-1) && s(-1) &&
         ((w(1,"ли же") && s(0,1))||(w(1,"то") && se(0,"-") && s(1))) &&
           w(2,cst) )
 { l[i]=omo1; R[1262]++; if(dbg){print "R1262"}; continue };

 cst = "сигнале действии городе принципе путешествии селении селе смысле человечестве народе корабле шаттле"
 if ( pre_pr(-1) &&
           w(1,cst) && s(0) )
 { l[i]=omo2; R[1263]++; if(dbg){print "R1263"}; continue };

 if ( q(1,"prl_edmupr") && s(0) && (p(1)||q_w(2,"pre_any sz_iili")) && Q(1,"suw_odedpr") )
 { l[i]=omo1; R[1264]++; if(dbg){print "R1264"}; continue };
 cst="мне нем нём себе тебе";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1265]++; if(dbg){print "R1265"}; continue };
 if ( (w(1,cst)||muk_edmupr(1)) && s(0) )
 { l[i]=omo2; R[1266]++; if(dbg){print "R1266"}; continue };

 if ( q(1,"name_pr_sy isname") && s(0) )
 { l[i]=omo2; R[1267]++; if(dbg){print "R1267"}; continue };
 if ( muk_edmupr(-1) && s(-1) )
 { l[i]=omo1; R[1268]++; if(dbg){print "R1268"}; continue };
 #
 if ( q(1,"prl_edmupr prl_edsrpr") && sc(1,",") && s(0) &&
      w(2,"самом") &&
      q(3,"prl_edmupr prl_edsrpr") && s(2,3) )
 { l[i]=omo1; R[1269]++; if(dbg){print "R1269"}; continue };
 if ( q(1,"prl_edmupr prl_edsrpr") &&
sz_iili(2) &&
      w(3,"самом") &&
      q(4,"prl_edmupr prl_edsrpr") && s(0,3) )
 { l[i]=omo1; R[1270]++; if(dbg){print "R1270"}; continue };
 if ( q(1,"prl_edmupr prl_edsrpr mest_vi mest_pr") &&
      q(2,"suw_edmupr suw_edsrpr pre_any") && s(0,1) )
 { l[i]=omo1; R[1271]++; if(dbg){print "R1271"}; continue };
 if ( q(1,"prl_edmupr prl_edsrpr mest_vi mest_pr") &&
mest_3e(2) &&
      q(3,"suw_edmupr suw_edsrpr pre_any") && s(0,2) )
 { l[i]=omo1; R[1272]++; if(dbg){print "R1272"}; continue };
 #
 if ( pre_pr(-1) &&
         (q_(1,swn_edmu_pr)||q_(1,swn_edsr_pr)) && s(-1,0) )
 { l[i]=omo1; R[1273]++; if(dbg){print "R1273"}; continue };
 #
 if ( muk_edmupr(-2) &&
               w(-1,"же") && s(-2,-1) )
 { l[i]=omo1; R[1274]++; if(dbg){print "R1274"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2277 !_#_!
 #  x2277 samomu1_ samomu2_   самому  са́мому  самому́
for(wrd in omap["x2277"]){omakevars(x2277,"x2277");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="обществу";
 if ( q(1,"mest_3e") &&
      w(2,cst) && s(0) )
 { l[i]=omo2; R[1275]++; if(dbg){print "R1275"}; continue };
 if ( w(1,cst) && s(0) )
 { l[i]=omo2; R[1276]++; if(dbg){print "R1276"}; continue };
 #
 if ( w(-1,"к") &&
      q(1,"suw_noedmuda suw_noedsrda") && s(-1,0) )
 { l[i]=omo1; R[1277]++; if(dbg){print "R1277"}; continue };
 #
 if ( q(1,"prl_edmuda") && s(0) && (p(1)||q_w(2,"pre_any sz_iili")) && Q(1,"suw_odedda") )
 { l[i]=omo1; R[1278]++; if(dbg){print "R1278"}; continue };

 cst="ему мне себе тебе";
 if ( (w(1,cst)||muk_edmuda(1)) && s(0) )
 { l[i]=omo2; R[1279]++; if(dbg){print "R1279"}; continue };
 if ( (w(-1,cst)||muk_edmuda(-1)) &&
suw_edda(1) && s(-1,0) )
 { l[i]=omo1; R[1280]++; if(dbg){print "R1280"}; continue };
 if ( (w(-1,cst)||muk_edmuda(-1)) && s(-1) )
 { l[i]=omo2; R[1281]++; if(dbg){print "R1281"}; continue };

 #
 if ( q(1,"prl_edmuda prl_edsrda") && sc(1,",") && s(0) &&
      w(2,"самому") &&
      q(3,"prl_edmuda prl_edsrda") && s(2,3) )
 { l[i]=omo1; R[1282]++; if(dbg){print "R1282"}; continue };
 if ( q(1,"prl_edmuda prl_edsrda mest_da") &&
      q(2,"prl_edmuda prl_edsrda mest_da") &&
      q(3,"suw_edmuda suw_edsrda") && s(0,2) )
 { l[i]=omo1; R[1283]++; if(dbg){print "R1283"}; continue };
 if ( q(1,"prl_edmuda prl_edsrda mest_da") &&
      q(2,"suw_edmuda suw_edsrda pre_any") && s(0,1) )
 { l[i]=omo1; R[1284]++; if(dbg){print "R1284"}; continue };
 #
 if ( q(-1,"pre_da preph_da") &&
    (q_(1,swn_edmu_da)||q_(1,swn_edsr_da)) && s(-1,0) )
 { l[i]=omo1; R[1285]++; if(dbg){print "R1285"}; continue };
 #
 if ( muk_edmuda(-2) &&
               w(-1,"же") && s(-2,-1) )
 { l[i]=omo1; R[1286]++; if(dbg){print "R1286"}; continue };
 if ( q(1,"suw_odedmuda suw_odedsrda suw_odmnda name_da_sy isname") && s(0) && Q(1,"prl_da") )
 { l[i]=omo2; R[1287]++; if(dbg){print "R1287"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2278 !_#_!
 #  x2278 sw_1es_rz_2ez_i_   sw_mn_iv_  вина  вина́  ви́на
for(wrd in omap["x2278"]){omakevars(x2278,"x2278");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_z_f() )
 { l[i]=omo1; R[1288]++; if(dbg){print "R1288", "sw_es_z_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; R[1289]++; if(dbg){print "R1289", "sw_ez_i_f"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; R[1290]++; if(dbg){print "R1290", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1291]++; if(dbg){print "R1291", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1292]++; if(dbg){print "R1292", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2279 !_#_!
 #  x2279 m2_1nar_step_2qin_iv_  pl_kr_es_
for(wrd in omap["x2279"]){omakevars(x2279,"x2279");for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="мал мало мальски маля помалу";
 if ( sc(0,"-") && w(1,cst) )
 { l[i]=omo1; R[1293]++; if(dbg){print "R1293"}; continue };
 #
 if ( qxs(-1,"как и","будто") )
 { l[i]=omo1; R[1294]++; if(dbg){print "R1294"}; continue };
 if ( q(-1,"mest_da suw_da") )
 { l[i]=omo1; R[1295]++; if(dbg){print "R1295"}; continue };
 #
 cst="где как какой кого кто ли того что";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[1296]++; if(dbg){print "R1296"}; continue };
 #
 cst="какой один";
 if ( base(1,cst) && s(0) )
 { l[i]=omo1; R[1297]++; if(dbg){print "R1297"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2280 !_#_!
 #  x2280 m2_1sw_ez_i_2deep_na_	sw_em_r_  душа  душа́  ду́ша
for(wrd in omap["x2280"]){omakevars(x2280,"x2280");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; R[1298]++; if(dbg){print "R1298", "sw_ez_i_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[1299]++; if(dbg){print "R1299", "sw_em_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2281 !_#_!
 #  x2281 gl_paedze_    sw_ez_i_  жила  жила́  жи́ла
for(wrd in omap["x2281"]){omakevars(x2281,"x2281");for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"была") && sc(0,"-") )
 { l[i]=omo1; R[1300]++; if(dbg){print "R1300"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[1301]++; if(dbg){print "R1301", "sw_ez_i_f"}; continue };
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; R[1302]++; if(dbg){print "R1302", "gl_paedze_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2282 !_#_!
 #  x2282 m2_1nar_vopr_2souz_	prl_ems_vr_  отчего  отчего́  о́тчего
for(wrd in omap["x2282"]){omakevars(x2282,"x2282");for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( !(suw_edro(1) && s(0)) )
 { l[i]=omo1; R[1303]++; if(dbg){print "R1303"}; continue };
 #
 if ( w(1,"дома") && s(0) )
 { l[i]=omo2; R[1304]++; if(dbg){print "R1304"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2283 !_#_!
 #  x2283 m2_1sw_em_r_2nar_mest_   sw_mn_iv_  дома  до́ма  дома́
for(wrd in omap["x2283"]){omakevars(x2283,"x2283");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( idb(5,"gl4dOma") && s(idn,-1) )
 { l[i]=omo1; R[1305]++; if(dbg){print "R1305"}; continue };
 cst="быть находиться оставаться остаться пребывать проводить сидеть спать";
 if ( base(-1,cst) &&  s(-1) )
 { l[i]=omo1; R[1306]++; if(dbg){print "R1306"}; continue };

 if ( q(-2,"mest_vi mest_3e suw_vi") &&
      q(-1,"gl_pemn gl_pnmn") &&
      q(1,"mest_edvi suw_vi") && s(-2,0) )
 { l[i]=omo1; R[1307]++; if(dbg){print "R1307"}; continue };
 if ( q(1,"mest_vi mest_3e suw_vi") &&
      q(2,"mod_mn") &&
      q(3,"gl_in") && s(0,2) )
 { l[i]=omo1; R[1308]++; if(dbg){print "R1308"}; continue };
 if ( q(1,"mest_vi mest_3e suw_vi") &&
      q(2,"nar_vrem nar_spos") &&
      q(3,"mod_mn") &&
      q(4,"gl_in") && s(0,3) )
 { l[i]=omo1; R[1309]++; if(dbg){print "R1309"}; continue };

 if ( q(-1,"gl_in gl_ed gl_mn gl_po gl_vzed gl_vzmn deep") && type(-1,"sit gov") && s(-1) )
 { l[i]=omo1; R[1310]++; if(dbg){print "R1310"}; continue };
 if ( q(-1,"gl_nein gl_need gl_nemn gl_ponemn gl_poneed gl_povzmn gl_vzmn deep_ne") && s(-1) )
 { l[i]=omo1; R[1311]++; if(dbg){print "R1311"}; continue };
 if ( q(-2,"gl_nein gl_need gl_nemn gl_ponemn gl_poneed gl_povzmn gl_vzmn deep_ne") &&
      w(-1,"как") && s(-2,-1) )
 { l[i]=omo1; R[1312]++; if(dbg){print "R1312"}; continue };
 if ( q(-2,"mest_mnim suw_mnim") && Q(-2,"gl_mn") &&
      q(-1,"prl_krmn") && s(-2,-1) )
 { l[i]=omo1;; R[1313]++; if(dbg){print "R1313"}; continue };
 if ( q(1,"mest_im suw_im") &&
      q(2,"gl_peed gl_pemn gl_popeed gl_popemn") &&
      q(3,"prl_da mest_da") &&
      q(4,"prl_vi") &&
      q(5,"suw_vi name_vi_sy isname") && s(0,4) && p(-1) )
 { l[i]=omo1; R[1314]++; if(dbg){print "R1314"}; continue };
 if ( q(1,"mest_im suw_im") &&
      q(2,"gl_peed gl_pemn gl_popeed gl_popemn") &&
      q(3,"prl_da mest_da") &&
      q(4,"suw_vi name_vi_sy isname") && s(0,3) && p(-1) )
 { l[i]=omo1; R[1315]++; if(dbg){print "R1315"}; continue };
 if ( q(1,"mest_im suw_im") &&
      q(2,"gl_peed gl_pemn gl_popeed gl_popemn") &&
      q(3,"prl_vi") &&
      q(4,"suw_vi name_vi_sy isname") && s(0,3) && p(-1) )
 { l[i]=omo1; R[1316]++; if(dbg){print "R1316"}; continue };
 if ( q(1,"mest_im suw_im") &&
      q(2,"gl_peed gl_pemn gl_popeed gl_popemn") &&
      q(3,"suw_vi name_vi_sy isname") && s(0,2) && p(-1) )
 { l[i]=omo1; R[1317]++; if(dbg){print "R1317"}; continue };

 #
 if ( q(-2,"mest_im suw_im name_im_sy isname") && Q(-2,"prl_im") &&
      w(-1,"не же ведь") && s(-2,-1))
 { l[i]=omo1; R[1318]++; if(dbg){print "R1318"}; continue };
 #
 if ( prq_mnim(-3) &&
        pre_ro(-2) &&
             q(-1,"suw_ro mest_ro") && s(-3,-1))
 { l[i]=omo2; R[1319]++; if(dbg){print "R1319"}; continue };
 if ( pre_ro(-2) &&
           q(-1,"suw_ro mest_ro") && s(-2,-1))
 { l[i]=omo1; R[1320]++; if(dbg){print "R1320"}; continue };
 if ( w(1,"у") &&
      q(2,"suw_ro mest_ro") && s(0,1))
 { l[i]=omo1; R[1321]++; if(dbg){print "R1321"}; continue };
 #
 cst="вы кто мы он она оно ты я";
 if ( ( w(-1,cst)||mest_edim(-1)||q_(-1,mst_ed_mu_im)) && s(-1))
 { l[i]=omo1; R[1322]++; if(dbg){print "R1322"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1323]++; if(dbg){print "R1323", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1324]++; if(dbg){print "R1324", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1325]++; if(dbg){print "R1325", "sw_mn_v_f"}; continue };

 if ( w(-1,"как") && s(-1) && p(0) )
 { l[i]=omo1; R[1326]++; if(dbg){print "R1326"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2284 !_#_!
 #  x2284   gl_ed1e     pl_ez_v_  целую  целу́ю  це́лую
for(wrd in omap["x2284"]){omakevars(x2284,"x2284");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="армию борозду бутылку вечность галактику горку гору группу деревню историю квартиру колонку колонну корзину кружку кучу неделю ночь пачку планету пригоршню \
      расу свинью секунду стену страницу страну сумку тонну цивилизацию чашку эскадрилью";
 if ( w(1,cst) && s(0))
 { l[i]=omo2; R[1327]++; if(dbg){print "R1327"}; continue };
 #
 if ( pl_ez_v_f() )
 { l[i]=omo2; R[1328]++; if(dbg){print "R1328", "pl_ez_v_f"}; continue };
 #
 if ( suw_mnvi(1) && s(0) )
 { l[i]=omo1; R[1329]++; if(dbg){print "R1329"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[1330]++; if(dbg){print "R1330", "gl_ed1e_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2285 !_#_!
 #  x2285 bolshaya1_ bolshaya2_   большая  бо́льшая  больша́я
for(wrd in omap["x2285"]){omakevars(x2285,"x2285");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="значительно куда много намного несколько";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1331]++; if(dbg){print "R1331"}; continue };
 cst="половина часть";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[1332]++; if(dbg){print "R1332"}; continue };
 if ( sc(0,",") && w(1,"чем") )
 { l[i]=omo1; R[1333]++; if(dbg){print "R1333"}; continue };
 #
 cst="весьма довольно достаточно очень самая слишком чересчур";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1334]++; if(dbg){print "R1334"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2286 !_#_!
 #  x2286 bolshie1_  bolshie2_   большие  бо́льшие  больши́е
for(wrd in omap["x2286"]){omakevars(x2286,"x2286");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="значительно куда много намного несколько";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1335]++; if(dbg){print "R1335"}; continue };
 cst="половины части";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[1336]++; if(dbg){print "R1336"}; continue };
 if ( sc(0,",") && w(1,"чем") )
 { l[i]=omo1; R[1337]++; if(dbg){print "R1337"}; continue };
 #
 cst="весьма довольно достаточно очень самые слишком чересчур";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1338]++; if(dbg){print "R1338"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2287 !_#_!
 #  x2287 bolshim1_  bolshim2_   большим  бо́льшим  больши́м
for(wrd in omap["x2287"]){omakevars(x2287,"x2287");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="значительно куда много намного несколько";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1339]++; if(dbg){print "R1339"}; continue };
 cst="половинам частям";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[1340]++; if(dbg){print "R1340"}; continue };
 if ( sc(0,",") && w(1,"чем") )
 { l[i]=omo1; R[1341]++; if(dbg){print "R1341"}; continue };
 if ( pre_tv(-2) &&
           w(-1"чем тем ещё еще") &&
           q(1,"suw_tv") && s(-2,0) )
 { l[i]=omo1; R[1342]++; if(dbg){print "R1342"}; continue };
 #
 cst="весьма довольно достаточно очень самым слишком чересчур";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1343]++; if(dbg){print "R1343"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2288 !_#_!
 #  x2288 bolshimi1_  bolshimi2_   большими  бо́льшими  больши́ми
for(wrd in omap["x2288"]){omakevars(x2288,"x2288");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="значительно куда много намного несколько";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1344]++; if(dbg){print "R1344"}; continue };
 cst="половинами частями";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[1345]++; if(dbg){print "R1345"}; continue };
 if ( sc(0,",") && w(1,"чем") )
 { l[i]=omo1; R[1346]++; if(dbg){print "R1346"}; continue };
 #
 cst="весьма довольно достаточно очень самыми слишком чересчур";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1347]++; if(dbg){print "R1347"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2289 !_#_!
 #  x2289 bolshih1_  bolshih2_   больших  бо́льших  больши́х
for(wrd in omap["x2289"]){omakevars(x2289,"x2289");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="значительно куда намного";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1348]++; if(dbg){print "R1348"}; continue };
 cst="половин частей";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[1349]++; if(dbg){print "R1349"}; continue };
 if ( sc(0,",") && w(1,"чем") )
 { l[i]=omo1; R[1350]++; if(dbg){print "R1350"}; continue };
 #
 cst="весьма довольно достаточно много несколько очень самых слишком чересчур";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1351]++; if(dbg){print "R1351"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2290 !_#_!
 #  x2290 bolshuu1_  bolshuu2_   большую  бо́льшую  большу́ю
for(wrd in omap["x2290"]){omakevars(x2290,"x2290");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="значительно куда много намного несколько";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1352]++; if(dbg){print "R1352"}; continue };
 cst="половину частю";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[1353]++; if(dbg){print "R1353"}; continue };
 if ( sc(0,",") && w(1,"чем") )
 { l[i]=omo1; R[1354]++; if(dbg){print "R1354"}; continue };
 #
 cst="весьма довольно достаточно очень самую слишком чересчур";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1355]++; if(dbg){print "R1355"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2291 !_#_!
 #  x2291 sw_ez_vr_      sw_mn_iv_  методы  мето́ды  ме́тоды
for(wrd in omap["x2291"]){omakevars(x2291,"x2291");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1356]++; if(dbg){print "R1356", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1357]++; if(dbg){print "R1357", "sw_mn_v_f"}; continue };
 prex=1
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[1358]++; if(dbg){print "R1358", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2292 !_#_!
 #  x2292 gl_1poed_2inf_  sw_1ez_dpr_2mn_iv_  < извести повести >
for(wrd in omap["x2292"]){omakevars(x2292,"x2292");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="извести") {
   if ( q(1,"mest_vi suw_vi") && s(0) )
   { l[i]=omo1; R[1359]++; if(dbg){print "R1359"}; continue };
 };
 if(iwrd=="повести") {
   if ( q(1,"gl_in mest_vi suw_vi") && s(0) )
   { l[i]=omo1; R[1360]++; if(dbg){print "R1360"}; continue };
 };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[1361]++; if(dbg){print "R1361", "gl_poed_f"}; continue };
 #
#if ( gl_in_f() )
#{ l[i]=omo1; R[1362]++; if(dbg){print "R1362"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[1363]++; if(dbg){print "R1363", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[1364]++; if(dbg){print "R1364", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[1365]++; if(dbg){print "R1365", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1366]++; if(dbg){print "R1366", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1367]++; if(dbg){print "R1367", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2293 !_#_!
 #  x2293 sw_em_rz_		sw_mn_iv_  хлеба  хле́ба  хлеба́
for(wrd in omap["x2293"]){omakevars(x2293,"x2293");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pre_ro(-1) && Q(-1,"pre_im pre_vi") && s(-1) )
 { l[i]=omo1; R[1368]++; if(dbg){print "R1368"}; continue };
 if ( q(-1,"pre_im pre_vi") && Q(-1,"pre_ro") && s(-1) )
 { l[i]=omo2; R[1369]++; if(dbg){print "R1369"}; continue };
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; R[1370]++; if(dbg){print "R1370", "sw_em_z_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1371]++; if(dbg){print "R1371", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1372]++; if(dbg){print "R1372", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1373]++; if(dbg){print "R1373", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2294 !_#_!
 #  x2294 sw_es_rz_      sw_mn_iv_
for(wrd in omap["x2294"]){omakevars(x2294,"x2294");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_z_f() )
 { l[i]=omo1; R[1374]++; if(dbg){print "R1374", "sw_es_z_f"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; R[1375]++; if(dbg){print "R1375", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1376]++; if(dbg){print "R1376", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1377]++; if(dbg){print "R1377", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2295 !_#_!
 #  x2295 sw_es_r_		sw_ez_i_ уха  у́ха  уха́
for(wrd in omap["x2295"]){omakevars(x2295,"x2295");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( base(-1,"мочка") && s(-1) )
 { l[i]=omo1; R[1378]++; if(dbg){print "R1378", "sw_es_r_f"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; R[1379]++; if(dbg){print "R1379", "sw_es_r_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[1380]++; if(dbg){print "R1380", "sw_ez_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2296 !_#_!
 #  x2296 sw_ez_rz_      sw_mn_iv_
for(wrd in omap["x2296"]){omakevars(x2296,"x2296");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="колы") {
   cst="кока нюка перри";
   if ( w(-1,cst) && se(-1,"-") )
   { l[i]=omo1; R[1381]++; if(dbg){print "R1381"}; continue };
 };
 if(iwrd=="земли") {
   if ( w(-1,"матери") && se(-1,"-") )
   { l[i]=omo1; R[1382]++; if(dbg){print "R1382"}; continue };
 };
 #
 if ( sw_ez_z_f() )
 { l[i]=omo1; R[1383]++; if(dbg){print "R1383", "sw_ez_z_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[1384]++; if(dbg){print "R1384", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1385]++; if(dbg){print "R1385", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1386]++; if(dbg){print "R1386", "sw_mn_v_f"}; continue };

 if ( wc(-1,"[ео]й$ [ео]йся$") && s(-1) )
 { l[i]=omo1; R[1387]++; if(dbg){print "R1387"}; continue };
 if ( wc(-1,"[иы]е$ [иы]еся$") && s(-1) )
 { l[i]=omo2; R[1388]++; if(dbg){print "R1388"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2297 !_#_!
 #  x2297 sw_em_i_		m3_sw_1em_iv_2mn_r_3deep_   пристав  при́став  приста́в
for(wrd in omap["x2297"]){omakevars(x2297,"x2297");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 # 3 сущ. им.п.: +при́став (од.), -приста́в (неод.), -приста́ва (неод.)
 #
 if ( w(1,"к как") && s(0) )
 { l[i]=omo2; R[1389]++; if(dbg){print "R1389"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[1390]++; if(dbg){print "R1390", "sw_em_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2298 !_#_!
 #  x2298 gl_paedmu_	sw_mn_r_
for(wrd in omap["x2298"]){omakevars(x2298,"x2298");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
   if ( gl_in(1) && s(0) )
   { l[i]=omo1; R[1391]++; if(dbg){print "R1391"}; continue };
   if ( w(1,"было") &&
       (q(2,"gl_in isname")||w(2,"он")) && s(0,1) )
   { l[i]=omo1; R[1392]++; if(dbg){print "R1392"}; continue };
   if ( sc(-1,"—") &&
   (isname(1)||suw_edmuim(1)||w(1,"он")) && s(0) )
   { l[i]=omo1; R[1393]++; if(dbg){print "R1393"}; continue };
   if ( q(1,"pre_vi preph_vi") &&
        q(2,"suw_vi prl_vi prq_vi mest_vi") && s(0,1) )
   { l[i]=omo1; R[1394]++; if(dbg){print "R1394"}; continue };
   if ( q(1,"pre_ro preph_ro") &&
        q(2,"suw_ro prl_ro prq_ro mest_ro") && s(0,1) )
   { l[i]=omo1; R[1395]++; if(dbg){print "R1395"}; continue };
   if ( q(1,"pre_tv preph_tv") &&
        q(2,"suw_tv prl_tv prq_tv mest_tv") && s(0,1) )
   { l[i]=omo1; R[1396]++; if(dbg){print "R1396"}; continue };
   if ( pre_pr(1) &&
             q(2,"suw_pr prl_pr prq_pr mest_pr") && s(0,1) )
   { l[i]=omo1; R[1397]++; if(dbg){print "R1397"}; continue };
   if ( gl_in(1) && s(0) )
   { l[i]=omo1; R[1398]++; if(dbg){print "R1398"}; continue };

 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; R[1399]++; if(dbg){print "R1399", "gl_paedmu_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1400]++; if(dbg){print "R1400", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2299 !_#_!
 #  x2299 sw_em_rz_		sw_ez_i_   лука  лу́ка  лука́
for(wrd in omap["x2299"]){omakevars(x2299,"x2299");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; R[1401]++; if(dbg){print "R1401", "sw_em_z_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1402]++; if(dbg){print "R1402", "sw_em_r_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[1403]++; if(dbg){print "R1403", "sw_ez_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2300 !_#_!
 #  x2300 gl_poed_      sw_1ez_rz_2mn_iv_
for(wrd in omap["x2300"]){omakevars(x2300,"x2300");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="пищи") {
   cst="запас прием приём производство";
   if ( base(-1,cst) && s(-1) )
   { l[i]=omo2; R[1404]++; if(dbg){print "R1404"}; continue };
 };
 if ( q(-2,"pre_any preph_any") &&
      q(-1,"suw_any") && s(-2,-1) )
 { l[i]=omo2; R[1405]++; if(dbg){print "R1405"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[1406]++; if(dbg){print "R1406", "gl_poed_f"}; continue };
 #
 if ( sw_ez_z_f() )
 { l[i]=omo2; R[1407]++; if(dbg){print "R1407", "sw_ez_z_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[1408]++; if(dbg){print "R1408", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1409]++; if(dbg){print "R1409", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1410]++; if(dbg){print "R1410", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2301 !_#_!
 #  x2301 gl_poed_   sw_1ez_rz_2mn_iv_  пошло  пошло́  по́шло
for(wrd in omap["x2301"]){omakevars(x2301,"x2301");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="быть выглядеть звучать смотреться";
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo2; R[1411]++; if(dbg){print "R1411", "gl_paedsr_f"}; continue };
 cst="достаточнош немного слишком черезчур";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1412]++; if(dbg){print "R1412", "gl_paedsr_f"}; continue };
 if ( q(-2,"prl_kred_sr") &&
sz_iili(-1) && s(-2,-1) )
 { l[i]=omo2; R[1413]++; if(dbg){print "R1413", "gl_paedsr_f"}; continue };

 #
 if ( qxs(-1,"если","на","то")||
      qxs(-1,"если","бы","что-то")||
      qxs(-1,"если","уж","на","то") )
 { l[i]=omo1; R[1414]++; if(dbg){print "R1414"}; continue };
 if ( qxs(1,"не","так")||
      qxs(1,"на","перекосяк") )
 { l[i]=omo1; R[1415]++; if(dbg){print "R1415"}; continue };
 if ( q(1,"pre_vi preph_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[1416]++; if(dbg){print "R1416"}; continue };

 if ( gl_paedsr_f() )
 { l[i]=omo1; R[1417]++; if(dbg){print "R1417", "gl_paedsr_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2302 !_#_!
 #  x2302 sw_em_p_		sw_ez_dp_ одуш-неодуш.
for(wrd in omap["x2302"]){omakevars(x2302,"x2302");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 #
 if ( w(-1,"на") && s(-1) )
 { l[i]=omo2; R[1418]++; if(dbg){print "R1418", "sw_ez_d_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[1419]++; if(dbg){print "R1419", "sw_em_p_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[1420]++; if(dbg){print "R1420", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[1421]++; if(dbg){print "R1421", "sw_ez_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2303 !_#_!
 #  x2303 sw_em_p_		sw_ez_dp_ неодуш.
for(wrd in omap["x2303"]){omakevars(x2303,"x2303");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 if(iwrd=="кружке") {
   cst="вина воды жидкости молока пива сока эля";
   if ( w(1,cst) && s(0) )
   { l[i]=omo2; R[1422]++; if(dbg){print "R1422"}; continue };
 };
 if(iwrd=="полке") {
   if ( w(-1,"на") && s(-1) )
   { l[i]=omo2; R[1423]++; if(dbg){print "R1423"}; continue };
 };
 if(iwrd=="жаре") {
   if ( w(-1,"на по") && s(-1) )
   { l[i]=omo2; R[1424]++; if(dbg){print "R1424"}; continue };
 };
 if(iwrd=="носке") {
   if ( w(-1,"в на") && s(-1) )
   { l[i]=omo1; R[1425]++; if(dbg){print "R1425"}; continue };
 };
 if(iwrd=="спине") {
   prex=0
   if ( sw_em_p_f() )
   { l[i]=omo2; R[1426]++; if(dbg){print "R1426", "sw_em_p_f"}; continue };
   prex=1
 };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[1427]++; if(dbg){print "R1427", "sw_em_p_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[1428]++; if(dbg){print "R1428", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[1429]++; if(dbg){print "R1429", "sw_ez_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2304 !_#_!
 #  x2304 sw_em_d_		sw_ez_v_
for(wrd in omap["x2304"]){omakevars(x2304,"x2304");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[1430]++; if(dbg){print "R1430", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[1431]++; if(dbg){print "R1431", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2305 !_#_!
 #  x2305 sw_em_d_		sw_ez_v_
for(wrd in omap["x2305"]){omakevars(x2305,"x2305");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[1432]++; if(dbg){print "R1432", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[1433]++; if(dbg){print "R1433", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2306 !_#_!
 #  x2306 sw_em_r_		sw_ez_i_
for(wrd in omap["x2306"]){omakevars(x2306,"x2306");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1434]++; if(dbg){print "R1434", "sw_em_r_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[1435]++; if(dbg){print "R1435", "sw_ez_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2307 !_#_!
 #  x2307 pl_ems_p_		sw_em_t_   другом  друго́м  дру́гом
for(wrd in omap["x2307"]){omakevars(x2307,"x2307");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2

 cst="быть стать являться";
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo2; R[1436]++; if(dbg){print "R1436"}; continue };
 if ( base(-2,cst) &&
         q(-1,"mest_3e") && s(-1) )
 { l[i]=omo2; R[1437]++; if(dbg){print "R1437"}; continue };

 #
 if ( w(-1,"друг") && s(-1) )
 { l[i]=omo2; R[1438]++; if(dbg){print "R1438", "sw_em_t_f"}; continue };
 if ( q(-2,"suw_tv") &&
sz_iili(-1) && s(-2,-1) )
 { l[i]=omo2; R[1439]++; if(dbg){print "R1439", "sw_em_t_f"}; continue };
 #
 if ( sw_em_p_f()||sw_es_p_f()||pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; R[1440]++; if(dbg){print "R1440", "sw_em_p_f||sw_es_p_f||pl_em_p_f||pl_es_p_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[1441]++; if(dbg){print "R1441", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2308 !_#_!
 #  x2308 m3_nar_1srav_2vrem_3pre_ro_  pl_es_iv_  позднее  поздне́е  по́зднее
for(wrd in omap["x2308"]){omakevars(x2308,"x2308");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_srav_f() )
 { l[i]=omo1; R[1442]++; if(dbg){print "R1442", "pl_srav_f"}; continue };
 #
 cst="значительно куда лишь много намного немного несколько";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1443]++; if(dbg){print "R1443"}; continue };
 if ( nar_vrem_f() )
 { l[i]=omo1; R[1444]++; if(dbg){print "R1444", "nar_vrem_f"}; continue };
 #
 if ( pl_es_i_f() )
 { l[i]=omo2; R[1445]++; if(dbg){print "R1445", "pl_es_i_f"}; continue };
 #
 if ( pl_es_v_f() )
 { l[i]=omo2; R[1446]++; if(dbg){print "R1446", "pl_es_v_f"}; continue };
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2309 !_#_!
 #  x2309 m2_1sw_em_d_2gl_ed1e_  sw_em_l_  берегу  берегу́  бе́регу
for(wrd in omap["x2309"]){omakevars(x2309,"x2309");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; R[1447]++; if(dbg){print "R1447", "sw_em_l_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[1448]++; if(dbg){print "R1448", "sw_em_d_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[1449]++; if(dbg){print "R1449", "gl_ed1e_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2310 !_#_!
 #  x2310 sw_emz_dp_	sw_ez_dp_  буре  бу́ре  буре́
for(wrd in omap["x2310"]){omakevars(x2310,"x2310");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; R[1450]++; if(dbg){print "R1450", "sw_ez_d_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[1451]++; if(dbg){print "R1451", "sw_em_p_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[1452]++; if(dbg){print "R1452", "sw_ez_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2311 !_#_!
 #  x2311 nar_spos_	 pl_ems_p_  добром  добро́м  до́бром
for(wrd in omap["x2311"]){omakevars(x2311,"x2311");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"прошу") && s(-1) )
 { l[i]=omo1; R[1453]++; if(dbg){print "R1453"}; continue };
 #
 if ( pl_em_p_f() )
 { l[i]=omo2; R[1454]++; if(dbg){print "R1454", "sw_ez_d_f"}; continue };
 #
 if ( pl_es_p_f() )
 { l[i]=omo2; R[1455]++; if(dbg){print "R1455", "sw_em_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2312 !_#_!
 #  x2312 pl_ez_dprt_	pl_srav_  горячей  горя́чей  горяче́й
for(wrd in omap["x2312"]){omakevars(x2312,"x2312");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_ez_d_f()||pl_ez_p_f()||pl_ez_r_f()||pl_ez_t_f() )
 { l[i]=omo1; R[1456]++; if(dbg){print "R1456", "sw_ez_d_f"}; continue };
 #
 if ( pl_srav_f() )
 { l[i]=omo2; R[1457]++; if(dbg){print "R1457", "sw_em_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2313 !_#_!
 #  x2313 gl_paedmu_	sw_mn_r_
for(wrd in omap["x2313"]){omakevars(x2313,"x2313");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(1,"prl_ro") &&
      q(2,"suw_ro") && s(0) )
 { l[i]=omo2; R[1458]++; if(dbg){print "R1458"}; continue };
 if ( q(1,"suw_ro") && s(0) )
 { l[i]=omo2; R[1459]++; if(dbg){print "R1459"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1460]++; if(dbg){print "R1460", "sw_mn_r_f"}; continue };
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; R[1461]++; if(dbg){print "R1461", "gl_paedmu_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2314 !_#_!
 #  x2314 deep_na_     pl_ez_i_  такая  та́кая  така́я
for(wrd in omap["x2314"]){omakevars(x2314,"x2314");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(1,"suw_edzeim prl_edzeim") && s(0) )
 { l[i]=omo2; R[1462]++; if(dbg){print "R1462"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2315 !_#_!
 #  x2315 word_hyphdef_  deep_na_  какая  кака́я  ка́кая
for(wrd in omap["x2315"]){omakevars(x2315,"x2315");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( s1(0,"-") && ismark(1,"YHYF") && w(1,"то") )
 { l[i]=omo1; l[i+1]=gensub(/^(.+)$/,"\xcc\xa0\\1\xcc\xa0",1,l[i+1]); R[1463]++; if(dbg){print "R1463"}; continue };
 if ( s1(0,"-") && ismark(1,"YHYF") )
 { l[i]=omo1; R[1464]++; if(dbg){print "R1464"}; continue };
 #
 if ( pl_ez_i_f() )
 { l[i]=omo1; R[1465]++; if(dbg){print "R1465", "pl_ez_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x2316 !_#_!
 #  x2316 m2_1nar_kaq_2pl_kr_es_  sw_es_iv_  далеко  далеко́  далёко
for(wrd in omap["x2316"]){omakevars(x2316,"x2316");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="быть стать являться";
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo1; R[1466]++; if(dbg){print "R1466"}; continue };
 if ( q(-1,"nar_step") && s(-1) )
 { l[i]=omo1; R[1467]++; if(dbg){print "R1467"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x3001 !_#_!
 #  x3001 gl_paedze_    sw_em_r_   sw_mn_iv_
for(wrd in omap["x3001"]){omakevars(x3001,"x3001");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[1468]++; if(dbg){print "R1468", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo3; R[1469]++; if(dbg){print "R1469", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo3; R[1470]++; if(dbg){print "R1470", "sw_mn_v_f"}; continue };
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; R[1471]++; if(dbg){print "R1471", "gl_paedze_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3002 !_#_!
 #  x3002 gl_paedze_    sw_es_r_   sw_mn_iv_
for(wrd in omap["x3002"]){omakevars(x3002,"x3002");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[1472]++; if(dbg){print "R1472", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo3; R[1473]++; if(dbg){print "R1473", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo3; R[1474]++; if(dbg){print "R1474", "sw_mn_v_f"}; continue };
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; R[1475]++; if(dbg){print "R1475", "gl_paedze_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3003 !_#_!
 #  x3003 nar_napr_     sw_ez_t_   sw_mn_r_
for(wrd in omap["x3003"]){omakevars(x3003,"x3003");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[1476]++; if(dbg){print "R1476", "sw_ez_t_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo3; R[1477]++; if(dbg){print "R1477", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3004 !_#_!
 #  x3004 m2_1sw_mn_i_2deep_na_    sw_em_vr_     sw_ez_i_
for(wrd in omap["x3004"]){omakevars(x3004,"x3004");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[1478]++; if(dbg){print "R1478", "sw_mn_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[1479]++; if(dbg){print "R1479", "sw_em_v_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[1480]++; if(dbg){print "R1480", "sw_em_r_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo3; R[1481]++; if(dbg){print "R1481", "sw_ez_i_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3005 !_#_!
 #  x3005 gl_ed1e_      sw_em_d_   sw_ez_v_
for(wrd in omap["x3005"]){omakevars(x3005,"x3005");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[1482]++; if(dbg){print "R1482", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo3; R[1483]++; if(dbg){print "R1483", "sw_ez_v_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[1484]++; if(dbg){print "R1484", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3006 !_#_!
 #  x3006 pl_es_iv_     sw_es_iv_  sw_es_p_
for(wrd in omap["x3006"]){omakevars(x3006,"x3006");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; R[1485]++; if(dbg){print "R1485", "sw_es_i_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; R[1486]++; if(dbg){print "R1486", "sw_es_v_f"}; continue };
 #
 if ( sw_es_p_f() )
 { l[i]=omo3; R[1487]++; if(dbg){print "R1487", "sw_es_p_f"}; continue };
 #
 if ( pl_es_i_f() )
 { l[i]=omo1; R[1488]++; if(dbg){print "R1488", "pl_es_i_f"}; continue };
 #
 if ( pl_es_v_f() )
 { l[i]=omo1; R[1489]++; if(dbg){print "R1489", "pl_es_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3007 !_#_!
 #  x3007 sw_em_r_      sw_ez_i_   sw_mn_v_  округа  о́круга  окру́га  округа́
for(wrd in omap["x3007"]){omakevars(x3007,"x3007");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( base(-1,"совет") && s(-1) )
 { l[i]=omo1; R[1490]++; if(dbg){print "R1490"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1491]++; if(dbg){print "R1491", "sw_em_r_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[1492]++; if(dbg){print "R1492", "sw_ez_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo3; R[1493]++; if(dbg){print "R1493", "sw_mn_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3008 !_#_!
 #  x3008 sw_em_l_    sw_em_r_     sw_ez_v_
for(wrd in omap["x3008"]){omakevars(x3008,"x3008");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; R[1494]++; if(dbg){print "R1494", "sw_em_l_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[1495]++; if(dbg){print "R1495", "sw_em_r_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo3; R[1496]++; if(dbg){print "R1496", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3009 !_#_!
 #  x3009 gl_ed3e_  sw_em_iv_  sw_mn_r_
for(wrd in omap["x3009"]){omakevars(x3009,"x3009");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_ed3e_f() )
 { l[i]=omo1; R[1497]++; if(dbg){print "R1497", "gl_ed3e_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo3; R[1498]++; if(dbg){print "R1498", "sw_mn_r_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[1499]++; if(dbg){print "R1499", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[1500]++; if(dbg){print "R1500", "sw_em_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3010 !_#_!
 #  x3010 gl_mn2e_      sw_em_p_   sw_ez_dp_
for(wrd in omap["x3010"]){omakevars(x3010,"x3010");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; R[1501]++; if(dbg){print "R1501", "sw_em_p_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo3; R[1502]++; if(dbg){print "R1502", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo3; R[1503]++; if(dbg){print "R1503", "sw_ez_p_f"}; continue };
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; R[1504]++; if(dbg){print "R1504", "gl_mn2e_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3011 !_#_!
 #  x3011 heal_1bud_2pov_  gl_pomn_ gl_mn2e_  выходите  вы́ходите  выходи́те  выхо́дите
for(wrd in omap["x3011"]){omakevars(x3011,"x3011");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn2e_f() )
 { l[i]=omo3; R[1505]++; if(dbg){print "R1505", "gl_mn2e_f"}; continue };
 #
 if ( gl_pomn_f() )
 { l[i]=omo2; R[1506]++; if(dbg){print "R1506", "gl_pomn_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3012 !_#_!
 #  x3012 sw_mn_iv_  sw_es_r_  sw_em_r_  лета  лета́  ле́та  лёта
for(wrd in omap["x3012"]){omakevars(x3012,"x3012");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[1507]++; if(dbg){print "R1507", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[1508]++; if(dbg){print "R1508", "sw_mn_i_f"}; continue };
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[1509]++; if(dbg){print "R1509", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3013 !_#_!
 #  x3013 sw_1ez_r_2ez_mn_iv_  sw_mn_iv_number_  sw_mn_iv_troop_  четы  четы́  чёты  че́ты
for(wrd in omap["x3013"]){omakevars(x3013,"x3013");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[1510]++; if(dbg){print "R1510", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3014 !_#_!
 #  x3014 gl_export_  gl_smear_  pq_kr_em_  вывозим  выво́зим  вы́возим  вывози́м
for(wrd in omap["x3014"]){omakevars(x3014,"x3014");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer
### x3015 !_#_!
 #  x3015 gl_carryout_  gl_nurture_  pq_kr_em_  выносим  выно́сим  вы́носим  выноси́м
for(wrd in omap["x3015"]){omakevars(x3015,"x3015");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3016 !_#_!
 #  x3016 hyphany_word_  icon_  image_  образной  обра́зной  о́бразной  образно́й
for(wrd in omap["x3016"]){omakevars(x3016,"x3016");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(-1,"-") )
 { l[i]=omo1; R[1511]++; if(dbg){print "R1511"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x4700 !_#_!
 #  x4700 cost_         stand_   стоит  сто́ит  стои́т
for(wrd in omap["x4700"]){omakevars(x4700,"x4700");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="стоит") {
   if ( q(1,"prl_ro mest_ro") &&
        q(2,"suw_ro") && s(0,1) && Q(1,"suw_edim") )
   { l[i]=omo1; R[1512]++; if(dbg){print "R1512"}; continue };
   if ( q(1,"suw_ro") && s(0) && Q(1,"suw_edim") )
   { l[i]=omo1; R[1513]++; if(dbg){print "R1513"}; continue };
 };
 #
 if ( w(1,"того") && sc(1,",") &&
      w(2,"чтобы") )
 { l[i]=omo1; R[1514]++; if(dbg){print "R1514"}; continue };
 #
 if (  qxs(-1,"один одно","другого")||
       qxs(-1,"одна","другой")||
       qxs(-1,"мало","что")||
       qxs(-1,"чего-то кое-чего","и да")||
       qxs(-1,"ничего что столько лучше","не")||
       qxs(-1,"друг","друга") )
 { l[i]=omo1; R[1515]++; if(dbg){print "R1515"}; continue };
 #
 if (  qxs(1,"один","другого")||
       qxs(1,"в","зависимости","от")||
       qxs(1,"ни","копейки гроша цента")||
       qxs(1,"по","колено щиколотку пояс горло шею подбородок уши брови","в")||
       qxs(1,"мало","что")||
       qxs(1,"друг","друга")  )
 { l[i]=omo1; R[1516]++; if(dbg){print "R1516"}; continue };
 #
 if ( narph_kaq(1) &&
              q(xwn+1,"qik_im qik_edim") &&
              q(xwn+2,"suw_mnro") && type(xwn+2,"geld") && s(0,xwn+1) )
 { l[i]=omo1; R[1517]++; if(dbg){print "R1517"}; continue };
 if ( q(1,"qik_im qik_edim") &&
      q(2,"suw_ro") && type(2,"geld") && s(0,1) )
 { l[i]=omo1; R[1518]++; if(dbg){print "R1518"}; continue };
 if ( q(-1,"mest_it suw_im") &&
      q(1,"suw_im") && type(1,"geld") && s(-1,0) )
 { l[i]=omo1; R[1519]++; if(dbg){print "R1519"}; continue };
 if ( q(1,"prl_ro mest_ro") &&
      q(2,"suw_ro") && s(0,1) && Q(1,"suw_im") )
 { l[i]=omo1; R[1520]++; if(dbg){print "R1520"}; continue };
 if ( q(1,"suw_ro") && s(0) && Q(1,"suw_im") )
 { l[i]=omo1; R[1521]++; if(dbg){print "R1521"}; continue };
 if ( w(1,"по") &&
      q(2,"qik_im qik_edim") &&
      q(3,"suw_ro") && type(3,"geld") && s(0,3) )
 { l[i]=omo1; R[1522]++; if(dbg){print "R1522"}; continue };
 #
 if ( p(-2) && w(-1,"не") && s(-1) && p(0) )
 { l[i]=omo1; R[1523]++; if(dbg){print "R1523"}; continue };
 if ( p(-1) && w(1,"ли") && s(0) && p(1) )
 { l[i]=omo1; R[1524]++; if(dbg){print "R1524"}; continue };
 if ( p(-2) && w(-1,"а но не") &&
      w(1,"ли") && s(-1,0) && p(1) )
 { l[i]=omo1; R[1525]++; if(dbg){print "R1525"}; continue };
 cst="кое-чего чего чего-нибудь чего-то";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1526]++; if(dbg){print "R1526"}; continue };
 #
 cst="более больше денег дешево дорого дорогого дёшево мало менее меньше многого недорого немало немногого побольше поменьше того";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[1527]++; if(dbg){print "R1527"}; continue };
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1528]++; if(dbg){print "R1528"}; continue };
 if ( q(1,"mest_mnro prl_mnro") &&
      w(2,"денег") && s(0,1) )
 { l[i]=omo1; R[1529]++; if(dbg){print "R1529"}; continue };
 #
 if ( q(-1,"mest_it") &&
      w(1,"риска") && s(-1,0) )
 { l[i]=omo1; R[1530]++; if(dbg){print "R1530"}; continue };
 #
 cst="больше дешево дорого дёшево меньше";
 if ( q(1,"prl_kred_sr nar_step") &&
      w(2,cst) && s(0,1) )
 { l[i]=omo1; R[1531]++; if(dbg){print "R1531"}; continue };
 #
 cst="боком впереди выше лицом ниже позади сбоку сзади слева снизу спиной справа столбом";
 if ( w(1,cst) && s(0) )
 { l[i]=omo2; R[1532]++; if(dbg){print "R1532"}; continue };
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1533]++; if(dbg){print "R1533"}; continue };
 #
 if ( qb(-5,-1,"gl_in") && s(qbn,-1) )
 { l[i]=omo1; R[1534]++; if(dbg){print "R1534"}; continue };
 #
 if ( qf(1,5,"gl_in") && s(0,qfn-1) )
 { l[i]=omo1; R[1535]++; if(dbg){print "R1535"}; continue };
 #
 if ( q(-1,"nar_mest nar_spos nar_kaq") && s(-1) )
 { l[i]=omo2; R[1536]++; if(dbg){print "R1536"}; continue };
 if ( q(1,"nar_mest nar_spos nar_kaq") && s(0) )
 { l[i]=omo2; R[1537]++; if(dbg){print "R1537"}; continue };
 #
 if ( pre_ro(1) &&
           q(2,"suw_ro prl_ro prq_ro mest_ro") && s(0,1) )
 { l[i]=omo2; R[1538]++; if(dbg){print "R1538"}; continue };
 if ( pre_ro(-2) &&
           q(-1,"suw_ro") &&
           q(1,"suw_im") && s(-2,0) )
 { l[i]=omo2; R[1539]++; if(dbg){print "R1539"}; continue };
 if ( pre_ro(-2) &&
           q(-1,"suw_ro") &&
           q(1,"prl_im prq_im mest_im") &&
           q(2,"suw_im") && s(-2,1) )
 { l[i]=omo2; R[1540]++; if(dbg){print "R1540"}; continue };
 #
 if ( pre_pr(1) &&
           q(2,"suw_edme") && s(0,1) )
 { l[i]=omo2; R[1541]++; if(dbg){print "R1541"}; continue };
 if ( pre_pr(1) &&
           q(2,"prl_edpr") &&
           q(3,"suw_edme") && s(0,2) )
 { l[i]=omo2; R[1542]++; if(dbg){print "R1542"}; continue };
 #
 if ( pre_pr(1) &&
           q(2,"suw_pr prl_pr prq_pr mest_pr") && s(0,1) )
 { l[i]=omo2; R[1543]++; if(dbg){print "R1543"}; continue };
 if ( pre_pr(-2) &&
           q(-1,"suw_pr") &&
           q(1,"suw_im") && s(-2,0) )
 { l[i]=omo2; R[1544]++; if(dbg){print "R1544"}; continue };
 if ( pre_pr(-2) &&
           q(-1,"suw_pr") &&
           q(1,"prl_im prq_im mest_im") &&
           q(2,"suw_im") && s(-2,1) )
 { l[i]=omo2; R[1545]++; if(dbg){print "R1545"}; continue };
 #
 if ( pre_tv(1) &&
           q(2,"suw_tv prl_tv prq_tv mest_tv") && s(0,1) )
 { l[i]=omo2; R[1546]++; if(dbg){print "R1546"}; continue };
 if ( pre_tv(-2) &&
           q(-1,"suw_tv") &&
           q(1,"suw_im") && s(-2,0) )
 { l[i]=omo2; R[1547]++; if(dbg){print "R1547"}; continue };
 if ( pre_tv(-2) &&
           q(-1,"suw_tv") &&
           q(1,"prl_im prq_im mest_im") &&
           q(2,"suw_im") && s(-2,1) )
 { l[i]=omo2; R[1548]++; if(dbg){print "R1548"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4701 !_#_!
 #  x4701 comeout_    heal_    выходить  выходи́ть  вы́ходить
for(wrd in omap["x4701"]){omakevars(x4701,"x4701");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(1,"pre_vi") &&
      q(2,"suw_vi prl_vi prq_vi mest_vi") && s(0,1) )
 { l[i]=omo1; R[1549]++; if(dbg){print "R1549"}; continue };
 if ( q(1,"pre_ro") &&
      q(2,"suw_ro prl_ro prq_ro mest_ro") && s(0,1) )
 { l[i]=omo1; R[1550]++; if(dbg){print "R1550"}; continue };
 if ( q(1,"pre_da") &&
      q(2,"suw_da prl_da prq_da mest_da") && s(0,1) )
 { l[i]=omo1; R[1551]++; if(dbg){print "R1551"}; continue };
 if ( pre_pr(1) &&
           q(2,"suw_pr suw_edme prl_pr prq_pr mest_pr") && s(0,1) )
 { l[i]=omo1; R[1552]++; if(dbg){print "R1552"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4702 !_#_!
 #  x4702 know_    lead_    введение  ве́дение  веде́ние
for(wrd in omap["x4702"]){omakevars(x4702,"x4702");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="быть находиться передавать передаваться передать";
 if ( w(-2,"в") &&
      q(-1,"mest_vi mest_pr") &&
      q(0,"suw_vi suw_pr") &&
      q(1,"suw_ro") &&
   base(2,cst) && s(-2,1) )
 { l[i]=omo1; R[1553]++; if(dbg){print "R1553"}; continue };
 if ( w(-2,"в") &&
      q(-1,"mest_vi mest_pr") &&
      q(0,"suw_vi suw_pr") &&
   base(1,cst) && s(-2,0) )
 { l[i]=omo1; R[1554]++; if(dbg){print "R1554"}; continue };
 #
 if ( prl_kred_sr(1) &&
                q(2,"prl_ro prq_ro mest_ro") &&
                q(3,"prl_ro prq_ro mest_ro suw_ro") && s(0,2) )
 { l[i]=omo2; R[1555]++; if(dbg){print "R1555"}; continue };
 if ( q(1,"prl_ro prq_ro mest_ro") &&
      q(2,"suw_ro") && s(0,1) )
 { l[i]=omo2; R[1556]++; if(dbg){print "R1556"}; continue };
 if ( q(1,"suw_ro") && s(0) )
 { l[i]=omo2; R[1557]++; if(dbg){print "R1557"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4703 !_#_!
 #  x4703 temp_    time_    временной  вре́менной  временно́й
for(wrd in omap["x4703"]){omakevars(x4703,"x4703");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"пространственно") && se(-1,"-") )
 { l[i]=omo2; R[1558]++; if(dbg){print "R1558"}; continue };
 #
 if(iwrd=="временной") {
   if ( q(1,"suw_edmuim suw_edmuvi") && s(0) )
   { l[i]=omo2; R[1559]++; if(dbg){print "R1559"}; continue };
 };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4704 !_#_!
 #  x4704 disperse_  herumlauf_    разбегаться  разбега́ться  разбе́гаться
for(wrd in omap["x4704"]){omakevars(x4704,"x4704");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(0,"gl_in") && q(-1,"mod_ed mod_bz mod_mn") && s(-1) )
 { l[i]=omo1; R[1560]++; if(dbg){print "R1560"}; continue };
 if ( q(0,"gl_navzmn") && q(1,"gl_namn gl_navzmn") && sc(0,",") )
 { l[i]=omo1; R[1561]++; if(dbg){print "R1561"}; continue };
 if ( q(0,"gl_pavzmn") && q(1,"gl_pamn") && sc(0,",") )
 { l[i]=omo1; R[1562]++; if(dbg){print "R1562"}; continue };
 if ( q(0,"gl_buvzmn") && q(1,"gl_bumn") && sc(0,",") )
 { l[i]=omo1; R[1563]++; if(dbg){print "R1563"}; continue };
 if ( q(0,"gl_povzmn") )
 { l[i]=omo1; R[1564]++; if(dbg){print "R1564"}; continue };
 if ( pre_pr(1) &&
           q(2,"prl_ro prq_ro") &&
           q(3,"suw_ro") && s(0,2) )
 { l[i]=omo1; R[1565]++; if(dbg){print "R1565"}; continue };
 if ( pre_ro(1) &&
           q(2,"suw_ro") && s(0,1) )
 { l[i]=omo1; R[1566]++; if(dbg){print "R1566"}; continue };
 if ( pre_pr(1) &&
           q(2,"prl_pr prq_pr") &&
           q(3,"suw_pr") && s(0,2) )
 { l[i]=omo1; R[1567]++; if(dbg){print "R1567"}; continue };
 if ( pre_pr(1) &&
           q(2,"suw_pr") && s(0,1) )
 { l[i]=omo1; R[1568]++; if(dbg){print "R1568"}; continue };
 if ( pre_pr(-2) &&
           q(-1,"suw_pr") && s(-2,-1) )
 { l[i]=omo1; R[1569]++; if(dbg){print "R1569"}; continue };
 if ( sc(0,",") &&
       w(1,"как словно") &&
       q(2,"suw_im") && s(1) )
 { l[i]=omo1; R[1570]++; if(dbg){print "R1570"}; continue };
 if ( sc(0,",") &&
       w(1,"как словно") &&
       q(2,"prl_im") &&
       q(3,"suw_im") && s(1,2) )
 { l[i]=omo1; R[1571]++; if(dbg){print "R1571"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4705 !_#_!
 #  x4705 sink_   stomp_    упопать  упопа́ть  упо́пать
for(wrd in omap["x4705"]){omakevars(x4705,"x4705");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4706 !_#_!
 #  x4706 arrest_    drive_   привод   приво́д  при́вод
for(wrd in omap["x4706"]){omakevars(x4706,"x4706");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( base(-1,"главный") && s(-1) )
 { l[i]=omo2; R[1572]++; if(dbg){print "R1572"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4707 !_#_!
 #  x4707 castle_    lock_   замок  за́мок  замо́к
 #  замка  замкам  замками  замках  замке  замки  замков  замком  замку  замок

 ZAMOK_F() # <<< правила находятся в файле zamok.awk

### x4708 !_#_!
 #  x4708 castle_    lock_   замоковый  за́моковый  замо́ковый
for(wrd in omap["x4708"]){omakevars(x4708,"x4708");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
#if ( base(-1,"главный") && s(-1) )
#{ l[i]=omo2; R[1573]++; if(dbg){print "R1573"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4777 !_#_!
 #  x4777 forced_       none_
for(wrd in omap["x4777"]){omakevars(x4777,"x4777");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 l[i]=omo1; R[1574]++; if(dbg){print "R1574"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer


### THE_x_END !_#_!

# вывести изменённую строку

for (i in book) { print book[i] }

#dbg = 1
#dbgstat = 1;
#cmd = "rm _stat.txt _yo.txt _vsez.txt"
#if (dbgstat==1) {system(cmd); for (i=1; i<=1630; i++) { printf ("%s%s %s %s\n", "R", i, "=", r[i]) >> "_stat.txt"};
#for (i in prevyo) {print i, prevyo[i] >> "_yo.txt"}
#for (i in vsez) { print i, vsez[i] >> "_vsez.txt" }
#                }
#
# for (var in SYMTAB) { if (var ~ /^[a-zA-Z_]/) print var };

  }
###_END_###
