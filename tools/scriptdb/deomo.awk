# Деомографизатор
# Читает файл(ы) словаря с морфологической информацией и заменяет омографы согласно правилам

# Перенумеровать правила в vim:
# let @a=1|%s/"R\zs\d\+\ze"/\=''.(@a+setreg('a',@a+1))/g|%s/ r\[\zs\d\+\ze\]++; if(dbg){print "R\(\d\+\)"/\1/g|%s/{system(cmd); for (i=1; i<=\zs\d\+\ze;/\=''.(@a-1)/g
#
# NB: во всех функциях поле указывается относительно 0, 0 - это позиция поискового слова.
# если задана переменные indb при запуске, то искать словари в директории "indb/", иначе по месту запуска
# если задана переменные inax при запуске, то писать служебные файлы в директории "inax/", иначе по месту запуска (имеет смысл только для gawk>=5.2.1)
# Последняя версия файла тут: https://github.com/Balamoote/gtts-scripts

@include "scriptdb/functions.awk"
@include "scriptdb/classes.awk"
@include "scriptdb/defunct.awk"
@include "scriptdb/despacy.awk"
@include "scriptdb/vsevso.awk"

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
#_#_#txtmppra
        if($i in vse  && num!=o000    ) {vseT [ci]           = vseT [ci]           num " "; o000     = num}; # "все" (но не вСЕ,вСе,всЕ)   #_#_# vsez !_#_!
        if($i in almo && num!=o001[$i]) {omap [almo[$i]][$i] = omap [almo[$i]][$i] num " "; o001[$i] = num}; # 
#_#_#txtmpprb
#       if( ci == "виски" && num!=o001[$i]) {omap [almo[$i]][$i] = omap [almo[$i]][$i] num " "; o001[$i] = num}; # скан одиночного омографа

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
 { l[i-1]=gensub(/([АЕЁИОУЫЭЮЯаеёиоуыэюя])/,"\\1\xcc\x81",1,l[i-1]); l[i]=gensub(/^(.)/,"\xcc\xa0\\1\xcc\xad",1,l[i]); r[1]++; if(dbg){print "R1", "klitika"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1001 !_#_!
 #  x1001 gl_pomn_      zalt_
for(wrd in omap["x1001"]){omakevars(x1001,"x1001");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pomn_f() )
 { l[i]=omo1; r[2]++; if(dbg){print "R2", "gl_pomn_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1002 !_#_!
 #  x1002 pq_kr_em_     zalt_    ( zalt2_) по типу избе́га́ем
for(wrd in omap["x1002"]){omakevars(x1002,"x1002");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2

 if(iwrd=="избегаем") {
   if ( q(1,"suw_edro suw_mnro") && sc(0) )
   { l[i]=omo1; r[3]++; if(dbg){print "R3"}; continue};
 };

 #
 if ( pq_kr_em_f() )
 { l[i]=omo1; r[4]++; if(dbg){print "R4", "pq_kr_em_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1003 !_#_!
 #  x1003 sw_em_r_      zalt_
for(wrd in omap["x1003"]){omakevars(x1003,"x1003");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[5]++; if(dbg){print "R5", "sw_em_r_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1004 !_#_!
 #  x1004 sw_1em_vr_2mn_iv_   zalt_
for(wrd in omap["x1004"]){omakevars(x1004,"x1004");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[6]++; if(dbg){print "R6", "sw_em_v_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[7]++; if(dbg){print "R7", "sw_em_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[8]++; if(dbg){print "R8", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[9]++; if(dbg){print "R9", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1005 !_#_!
 #  x1005 sw_1ez_r_2mn_iv_    zalt_
for(wrd in omap["x1005"]){omakevars(x1005,"x1005");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[10]++; if(dbg){print "R10", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[11]++; if(dbg){print "R11", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[12]++; if(dbg){print "R12", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1006 !_#_!
 #  x1006 sw_em_d_      zalt_
for(wrd in omap["x1006"]){omakevars(x1006,"x1006");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[13]++; if(dbg){print "R13", "sw_em_d_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1007 !_#_!
 #  x1007 sw_em_i_      zalt_
for(wrd in omap["x1007"]){omakevars(x1007,"x1007");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[14]++; if(dbg){print "R14", "sw_em_i_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1008 !_#_!
 #  x1008 sw_em_iv_     zalt_
for(wrd in omap["x1008"]){omakevars(x1008,"x1008");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[15]++; if(dbg){print "R15", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[16]++; if(dbg){print "R16", "sw_em_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1009 !_#_!
 #  x1009 sw_es_iv_     zalt_
for(wrd in omap["x1009"]){omakevars(x1009,"x1009");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo1; r[17]++; if(dbg){print "R17", "sw_es_i_f"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo1; r[18]++; if(dbg){print "R18", "sw_es_v_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[19]++; if(dbg){print "R19", "sw_em_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1010 !_#_!
 #  x1010 sw_es_t_      zalt_
for(wrd in omap["x1010"]){omakevars(x1010,"x1010");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_t_f() )
 { l[i]=omo1; r[20]++; if(dbg){print "R20", "sw_es_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1011 !_#_!
 #  x1011 sw_ez_d_      zalt_
for(wrd in omap["x1011"]){omakevars(x1011,"x1011");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; r[21]++; if(dbg){print "R21", "sw_ez_d_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1012 !_#_!
 #  x1012 sw_ez_dp_     zalt_
for(wrd in omap["x1012"]){omakevars(x1012,"x1012");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; r[22]++; if(dbg){print "R22", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo1; r[23]++; if(dbg){print "R23", "sw_ez_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1013 !_#_!
 #  x1013 sw_ez_i_      zalt_
for(wrd in omap["x1013"]){omakevars(x1013,"x1013");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; r[24]++; if(dbg){print "R24", "sw_ez_i_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1014 !_#_!
 #  x1014 sw_ez_r_      zalt_  одуш.  казачки  каза́чки  казачки́
for(wrd in omap["x1014"]){omakevars(x1014,"x1014");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[25]++; if(dbg){print "R25", "sw_ez_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1015 !_#_!
 #  x1015 sw_ez_v_      zalt_  шлепку  шлёпку  шлепку́
for(wrd in omap["x1015"]){omakevars(x1015,"x1015");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; r[26]++; if(dbg){print "R26", "sw_ez_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1016 !_#_!
 #  x1016 sw_mn_iv_     zalt_  дельца тельца  
for(wrd in omap["x1016"]){omakevars(x1016,"x1016");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[27]++; if(dbg){print "R27", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[28]++; if(dbg){print "R28", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1017 !_#_!
 #  x1017 swn_mn_p_  swo_mn_p_  купчих  ку́пчих  купчи́х
for(wrd in omap["x1017"]){omakevars(x1017,"x1017");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_p_f() )
 { l[i]=omo1; r[29]++; if(dbg){print "R29", "sw_mn_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1018 !_#_!
 #  x1018 sw_em_v_      zalt_  парю  па́рю  парю́
for(wrd in omap["x1018"]){omakevars(x1018,"x1018");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[30]++; if(dbg){print "R30", "sw_em_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1019 !_#_!
 #  x1019 hyphdef_word_   default_
for(wrd in omap["x1019"]){omakevars(x1019,"x1019");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"Yhys") && se(-1,"-") )
 { l[i]=omo1; r[31]++; if(dbg){print "R31"}; continue};
 if ( !(sc(-1,"-")||s1(0,"-")) )
 { l[i]=omo2; r[32]++; if(dbg){print "R32"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1020 !_#_!
 #  x1020 hyphany_word_  (default_)
for(wrd in omap["x1020"]){omakevars(x1020,"x1020");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(-1,"-") )
 { l[i]=omo1; r[33]++; if(dbg){print "R33"}; continue};

 # l[i]=omo2; r[34]++; if(dbg){print "R34"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1021 !_#_!
 #  x1021 hyph1_word_hyph2_    word_
for(wrd in omap["x1021"]){omakevars(x1021,"x1021");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(-1,"-") && s1(0,"-") )
 { l[i]=omo1; r[35]++; if(dbg){print "R35"}; continue};
 if ( s1(0,"-") )
 { l[i]=omo1; r[36]++; if(dbg){print "R36"}; continue};

 l[i]=omo2; r[37]++; if(dbg){print "R37"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1022 !_#_!
 #  x1022 word_hyphdef_  (default_)
for(wrd in omap["x1022"]){omakevars(x1022,"x1022");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( s1(0,"-") && ismark(1,"Yhyf") && w(1,"то") )
 { l[i]=omo1; l[i+1]=gensub(/^(.+)$/,"\xcc\xa0\\1\xcc\xa0",1,l[i+1]); r[38]++; if(dbg){print "R38"}; continue};
 if ( s1(0,"-") && ismark(1,"Yhyf") )
 { l[i]=omo1; r[39]++; if(dbg){print "R39"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1023 !_#_!
 #  x1023 word_hyphany_  (default_)
for(wrd in omap["x1023"]){omakevars(x1023,"x1023");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( s1(0,"-") )
 { l[i]=omo1; r[40]++; if(dbg){print "R40"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1024 !_#_!
 #  x1024 sw_em_v_  (zalt_)
for(wrd in omap["x1024"]){omakevars(x1024,"x1024");for(y=1;y<=wln;y++)                    # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(-1,"pre_vi preph_vi") && s(-1) )
 { l[i]=omo1; r[41]++; if(dbg){print "R41"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1025 !_#_!
 #  x1025 tem_je_       тем  те́м
for(wrd in omap["x1025"]){omakevars(x1025,"x1025");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 l[i]=omo1; r[42]++; if(dbg){print "R42"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1026 !_#_!
 #  x1026 orgbody_      orgplay_ орган  о́рган ... орга́н ...
for(wrd in omap["x1026"]){omakevars(x1026,"x1026");for(y=1;y<=wln;y++)                    # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"власти дыхания здравоохранения зрения обоняния осязания порядка правопорядка самоуправления слуха управления чувств") && s(0) )
 { l[i]=omo1; r[43]++; if(dbg){print "R43"}; continue};
 #
 if(iwrd=="орган") {
   if ( w(-1,"внутренний государственный местный официальный полицейский половой руководящий советский союзный судебный федеральный хватательный чувствительный электровосприимчивый") && s(-1) )
   { l[i]=omo2; r[44]++; if(dbg){print "R44"}; continue};
 };
 if(iwrd=="органа") {
   if ( w(-1,"внутреннего государственного местного официального полицейского полового руководящего советского союзного судебного федерального хватательного чувствительного электровосприимчивого") && s(-1) )
   { l[i]=omo2; r[45]++; if(dbg){print "R45"}; continue};
 };
 if(iwrd=="органам") {
   if ( w(-1,"внутренним государственным местным официальным полицейским половым руководящим советским союзным судебным федеральным хватательным чувствительным электровосприимчивым") && s(-1) )
   { l[i]=omo2; r[46]++; if(dbg){print "R46"}; continue};
 };
 if(iwrd=="органами") {
   if ( w(-1,"внутренними государственными местными официальными полицейскими половыми руководящими советскими союзными судебными федеральными хватательными чувствительными электровосприимчивыми") && s(-1) )
   { l[i]=omo2; r[47]++; if(dbg){print "R47"}; continue};
 };
 if(iwrd=="органах") {
   if ( w(-1,"внутренних государственных местных официальных полицейских половых руководящих советских союзных судебных федеральных хватательных чувствительных электровосприимчивых") && s(-1) )
   { l[i]=omo2; r[48]++; if(dbg){print "R48"}; continue};
 };
 if(iwrd=="органе") {
   if ( w(-1,"внутреннем государственном местном официальном полицейском половом руководящем слоюзном советском судебном федеральном хватательном чувствительном электровосприимчивом") && s(-1) )
   { l[i]=omo2; r[49]++; if(dbg){print "R49"}; continue};
 };
 if(iwrd=="органов") {
   if ( w(-1,"внутренних государственных местных официальных полицейских половых руководящих советских союзных судебных федеральных хватательных чувствительных электровосприимчивых") && s(-1) )
   { l[i]=omo2; r[50]++; if(dbg){print "R50"}; continue};
 };
 if(iwrd=="органом") {
   if ( w(-1,"внутренним государственным местным официальным полицейским половым руководящим слоюзным советским судебным федеральным хватательным чувствительным электровосприимчивым") && s(-1) )
   { l[i]=omo2; r[51]++; if(dbg){print "R51"}; continue};
 };
 if(iwrd=="органу") {
   if ( w(-1,"внутреннему государственному местному официальному полицейскому половому руководящему слоюзному советскому судебному федеральному хватательному чувствительному электровосприимчивому") && s(-1) )
   { l[i]=omo2; r[52]++; if(dbg){print "R52"}; continue};
 };
 if(iwrd=="органы") {
   if ( w(-1,"внутренние государственные местные официальные полицейские половые руководящие слоюзные советские судебные федеральные хватательные чувствительные электровосприимчивые") && s(-1) )
   { l[i]=omo2; r[53]++; if(dbg){print "R53"}; continue};
 };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1027 !_#_!
 #  x1027 sw_1em_d_2ez_v_  zatl_sw_1em_d_     парку  па́рку  парку́
for(wrd in omap["x1027"]){omakevars(x1027,"x1027");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[54]++; if(dbg){print "R54", "sw_em_d_f"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; r[55]++; if(dbg){print "R55", "sw_ez_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1028 !_#_!
 #  x1028 pq_kr_em_     pl_kr_em_   проклят  про́клят  прокля́т
for(wrd in omap["x1028"]){omakevars(x1028,"x1028");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pq_kr_em_f() )
 { l[i]=omo1; r[56]++; if(dbg){print "R56", "pq_kr_em_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1029 !_#_!
 #  x1029 pq_kr_es_     pl_kr_es_   проклято  про́клято  прокля́то
for(wrd in omap["x1029"]){omakevars(x1029,"x1029");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"я оно ты будь буду будет было стало")||suw_edsrim(-1) && s(-1) )
 { l[i]=omo1; r[57]++; if(dbg){print "R57"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1030 !_#_!
 #  x1030 pq_kr_ez_     pl_kr_ez_   проклята  про́клята  прокля́та
for(wrd in omap["x1030"]){omakevars(x1030,"x1030");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"я она ты будь будет была стала")||suw_edmuim(-1) && s(-1) )
 { l[i]=omo1; r[58]++; if(dbg){print "R58"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1031 !_#_!
 #  x1031 pq_kr_mn_     pl_kr_mn_   прокляты  про́кляты  прокля́ты
for(wrd in omap["x1031"]){omakevars(x1031,"x1031");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"мы вы они будь будут были стали")||suw_edmuim(-1) && s(-1) )
 { l[i]=omo1; r[59]++; if(dbg){print "R59"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1032 !_#_!
 #  x1032 ghost_        parfume_   духами  ду́хами  духа́ми
for(wrd in omap["x1031"]){omakevars(x1031,"x1031");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"светлыми добрыми злыми лесными подземными тёмными") && s(-1) )
 { l[i]=omo1; r[60]++; if(dbg){print "R60"}; continue};
 #
 if ( base(-1,"запах запахнуть благоухать благоухание вонять вонь пользоваться") && s(-1) )
 { l[i]=omo2; r[61]++; if(dbg){print "R61"}; continue};
 if ( w(-1,"дешёвыми дорогими женскими модными мужскими тошнотворными") && s(-1) )
 { l[i]=omo2; r[62]++; if(dbg){print "R62"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1033 !_#_!
 #  x1033 ghost_        parfume_  духах  ду́хах  духа́х
for(wrd in omap["x1033"]){omakevars(x1033,"x1033");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"светлых добрых злых лесных подземных тысячи тёмных") && s(-1) )
 { l[i]=omo1; r[63]++; if(dbg){print "R63"}; continue};
 #
 if ( w(-1,"дешёвых дорогих женских модных мужских тошнотворных") && s(-1) )
 { l[i]=omo2; r[64]++; if(dbg){print "R64"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1034 !_#_!
 #  x1034 ghost_        parfume_  духи  ду́хи  духи́
for(wrd in omap["x1034"]){omakevars(x1034,"x1034");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"светлые добрые злые лесные подземные тёмные") && s(-1) )
 { l[i]=omo1; r[65]++; if(dbg){print "R65"}; continue};
 #
 if ( w(-1,"дешёвые дорогие женские модные мужские тошнотворные") && s(-1) )
 { l[i]=omo2; r[66]++; if(dbg){print "R66"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1035 !_#_!
 #  x1035 ghost_        parfume_  духов  ду́хов  духо́в
for(wrd in omap["x1035"]){omakevars(x1035,"x1035");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"светлых добрых злых лесных подземных тысяч тёмных вонь") && s(-1) )
 { l[i]=omo1; r[67]++; if(dbg){print "R67"}; continue};
 cst="впустить выпустить выпускать вызвать вызывать выпусть выпускать заклинать заклинатель призывать призвание укрощать укротить укротитель"
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo1; r[68]++; if(dbg){print "R68"}; continue};
 #
 if ( w(-1,"дешёвых дорогих женских модных мужских тошнотворных") && s(-1) )
 { l[i]=omo2; r[69]++; if(dbg){print "R69"}; continue};
 cst="аромат запах благоухание изготовление флакон шлейф вонь вонять пользоваться"
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo2; r[70]++; if(dbg){print "R70"}; continue};
 if ( wc(-2,cst) &&
       q(-1,"mest_ro prl_edro prl_mnro") && s(-2,-1) )
 { l[i]=omo2; r[71]++; if(dbg){print "R71"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1036 !_#_!
 #  x1036 dare_        sweep_  смели  сме́ли  смели́
for(wrd in omap["x1036"]){omakevars(x1036,"x1036");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_in(1) && s(0) )
 { l[i]=omo1; r[72]++; if(dbg){print "R72"}; continue};
 #
 if ( pre_ro(1) &&
       q(2,"suw_edro suw_mnro") && s(0,1) )
 { l[i]=omo2; r[73]++; if(dbg){print "R73"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1037 !_#_!
 #  x1037 sw_ez_r_      zalt_     одуш-неодуш (мн.ч. оба) белки  белки  белки
for(wrd in omap["x1037"]){omakevars(x1037,"x1037");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[74]++; if(dbg){print "R74", "sw_ez_r_f"}; continue};
 #
#if ( sw_mn_i_f() )
#{ l[i]=omo2; r[75]++; if(dbg){print "R75", "sw_mn_i_f"}; continue};
##
#if ( sw_mn_v_f() )
#{ l[i]=omo2; r[76]++; if(dbg){print "R76", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1038 !_#_!
 #  x1038 sw_ez_r_      zalt_    неодуш. дрючки  дрю́чки  дрючки́
for(wrd in omap["x1038"]){omakevars(x1038,"x1038");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if(iwrd=="дрючки") {
   if ( w(-1,"штучки") && sc(-1,"-") )
   { l[i]=omo1; r[77]++; if(dbg){print "R77"}; continue};
 };

 if ( sw_ez_r_f() )
 { l[i]=omo1; r[78]++; if(dbg){print "R78", "sw_ez_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1039 !_#_!
 #  x1039 sw_ez_r_      zalt_     лады  ла́ды  лады́
for(wrd in omap["x1039"]){omakevars(x1039,"x1039");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( qxs(-1,"на","все") )
 { l[i]=omo2; r[79]++; if(dbg){print "R79", "sw_ez_r_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[80]++; if(dbg){print "R80", "sw_ez_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1040 !_#_!
 #  x1040 sw_ez_r_      zalt_     заморозки  заморо́зки  за́морозки
for(wrd in omap["x1040"]){omakevars(x1040,"x1040");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[81]++; if(dbg){print "R81", "sw_ez_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1041 !_#_!
 #  x1041 pointer_      shooter_     стрелки  стре́лки  стрелки́ (формы мн.ч., морфологически неразличимые никак)
for(wrd in omap["x1041"]){omakevars(x1041,"x1041");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( base(1,"прибор детектор индикатор счётчик датчик") && s(0) )
 { l[i]=omo1; r[82]++; if(dbg){print "R82"}; continue};
 if ( pre_pr(1) &&
       base(2,"прибор детектор индикатор счётчик датчик") && s(0,1) )
 { l[i]=omo1; r[83]++; if(dbg){print "R83"}; continue};
 #
 if ( base(-1,"меткий") && s(-1) )
 { l[i]=omo2; r[84]++; if(dbg){print "R84"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[85]++; if(dbg){print "R85", "sw_ez_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1042 !_#_!
 #  x1042 sw_ez_r_      zalt_     стрелок  стре́лок  стрело́к
for(wrd in omap["x1042"]){omakevars(x1042,"x1042");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( name_im_sy(1) && s(0) )
 { l[i]=omo1; r[86]++; if(dbg){print "R86"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[87]++; if(dbg){print "R87", "sw_em_i_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[88]++; if(dbg){print "R88", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1043 !_#_!
 #  x1043 sw_ez_r_      zalt_     стрелка  стре́лка  стрелка́
for(wrd in omap["x1043"]){omakevars(x1043,"x1043");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[89]++; if(dbg){print "R89", "sw_ez_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[90]++; if(dbg){print "R90", "sw_em_v_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[91]++; if(dbg){print "R91", "sw_em_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1044 !_#_!
 #  x1044 sw_ez_r_      zalt_     стрелке  стре́лке  стрелке́
for(wrd in omap["x1044"]){omakevars(x1044,"x1044");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[92]++; if(dbg){print "R92", "sw_em_p_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[93]++; if(dbg){print "R93", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[94]++; if(dbg){print "R94", "sw_ez_p_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1045 !_#_!
 #  x1045 sw_ez_r_      zalt_     стрелку  стре́лку  стрелку́
for(wrd in omap["x1045"]){omakevars(x1045,"x1045");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[95]++; if(dbg){print "R95", "sw_em_d_f"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[96]++; if(dbg){print "R96", "sw_ez_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1046 !_#_!
 #  x1046 stola_      table_     стола  сто́ла  стола́
for(wrd in omap["x1046"]){omakevars(x1046,"x1046");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="стола") {
   if ( q(-1,"prl_edzeim prq_edzeim mest_pedzeim") && s(-1) )
   { l[i]=omo1; r[97]++; if(dbg){print "R97"}; continue};
 };
 if(iwrd=="столе") {
   if ( q(-1,"prl_edzeda prq_edzeda mest_pedzeda") && s(-1) )
   { l[i]=omo1; r[98]++; if(dbg){print "R98"}; continue};
 };
 if(iwrd=="столу") {
   if ( q(-1,"prl_edzevi prq_edzevi mest_pedzevi") && s(-1) )
   { l[i]=omo1; r[99]++; if(dbg){print "R99"}; continue};
 };
 if(iwrd=="столы") {
   if ( q(-1,"prl_edzero prq_edzero mest_pedzero") && s(-1) )
   { l[i]=omo1; r[100]++; if(dbg){print "R100"}; continue};
 };

 # стол - по дефолту, стола - "одежда" - добавлять при обнаружении
 l[i]=omo2; r[101]++; if(dbg){print "R101", "table_"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1047 !_#_!
 #  x1047 m2_1pl_kr_es_2nar_     nar_     полно  по́лно  полно́
for(wrd in omap["x1047"]){omakevars(x1047,"x1047");for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"полным") && sc(-1,"-") )
 { l[i]=omo2; r[102]++; if(dbg){print "R102", "sw_em_d_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1048 !_#_!
 #  x1048 mest_ems_p_     pl_kr_em_     нем  нём  не́м
for(wrd in omap["x1048"]){omakevars(x1048,"x1048");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"в о об на при по") && s(-1) )
 { l[i]=omo1; r[103]++; if(dbg){print "R103"}; continue;};

 l[i]=omo2; r[104]++; if(dbg){print "R104"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1049 !_#_!
 #  x1049 aufrenn_  einrenn_   забегать забе́гать забега́ть и производные
for(wrd in omap["x1049"]){omakevars(x1049,"x1049");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"вперёд вниз вверх вбок влево вправо") && s(0) )
 { l[i]=omo2; r[105]++; if(dbg){print "R105"}; continue;};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1050 !_#_!
 #  x1050 disappear_  divide_   делись  де́лись  дели́сь
for(wrd in omap["x1050"]){omakevars(x1050,"x1050");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( wb(-5,-1,"куда никуда они вы мы") && s(wbn,-1) )
 { l[i]=omo1; r[106]++; if(dbg){print "R106"}; continue;};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1051 !_#_!
 #  x1051 hday_  noon_   полудне  полудне́  полу́дне
for(wrd in omap["x1051"]){omakevars(x1051,"x1051");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"езды пути ходьбы лёту лету") && s(0) )
 { l[i]=omo1; r[107]++; if(dbg){print "R107"}; continue;};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1052 !_#_!
 #  x1052 hday_  noon_   полудню  полудню́  полу́дню
for(wrd in omap["x1052"]){omakevars(x1052,"x1052");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"езды пути ходьбы лёту лету") && s(0) )
 { l[i]=omo1; r[108]++; if(dbg){print "R108"}; continue;};
 if ( w(-1,"к") && s(-1) )
 { l[i]=omo2; r[109]++; if(dbg){print "R109"}; continue;};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1053 !_#_!
 #  x1053 hday_  noon_   полудня  полудня́  полу́дня
for(wrd in omap["x1053"]){omakevars(x1053,"x1053");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(1,"suw_edro suw_mnro") && s(0) )
 { l[i]=omo1; r[110]++; if(dbg){print "R110"}; continue;};
 if ( q(-1,"pre_ro preph_ro") && s(-1) )
 { l[i]=omo2; r[111]++; if(dbg){print "R111"}; continue;};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1054 !_#_!
 #  x1054 gl_bued1e_  gl_naed1e_   признаюсь  призна́юсь  признаю́сь
for(wrd in omap["x1054"]){omakevars(x1054,"x1054");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( p(-1) && p(0) )
 { l[i]=omo1; r[112]++; if(dbg){print "R112"}; continue;};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1055 !_#_!
 #  x1055 mill_  wind_  ветряная  ветряна́я  ве́тряная
for(wrd in omap["x1055"]){omakevars(x1055,"x1055");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( base(1,"мельница двигатель турбина установка") && s(0) )
 { l[i]=omo1; r[113]++; if(dbg){print "R113"}; continue;};
 if ( base(1,"оспа") && s(0) )
 { l[i]=omo2; r[114]++; if(dbg){print "R114"}; continue;};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1056 !_#_!
 #  x1056 mehl_  pain_  мука  мука́  му́ка
for(wrd in omap["x1056"]){omakevars(x1056,"x1056");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="пшеничный ржаной каменный овсяный косный солёный сырой качественный низносортный белая серая"
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo1; r[115]++; if(dbg){print "R115"}; continue;};

 cst="настоящий подлинный сильный острый мучительный невыносимый ужасающий душевный звенящий нестерпимый немыслимый истинный страшный сущий внутренний"
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo2; r[116]++; if(dbg){print "R116"}; continue;};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1057 !_#_!
 #  x1057 mehl_  pain_  (sw_ez_rz_  sw_mn_iv_)  муки  муки́  му́ки
for(wrd in omap["x1057"]){omakevars(x1057,"x1057");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="пшеничный ржаной каменный овсяный косный солёный сырой качественный низносортный белая серая"
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo1; r[117]++; if(dbg){print "R117"}; continue;};

 cst="настоящий подлинный сильный острый мучительный изнурительный невыносимый ужасающий душевный звенящий нестерпимый немыслимый истинный страшный сущий внутренний"
 if ( base(-1,cst) && s(-1) )
 { l[i]=omo2; r[118]++; if(dbg){print "R118"}; continue;};
 #
 if ( sw_ez_z_f() )
 { l[i]=omo1; r[119]++; if(dbg){print "R119", "sw_ez_z_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[120]++; if(dbg){print "R120", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[121]++; if(dbg){print "R121", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[122]++; if(dbg){print "R122", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1058 !_#_!
 #  x1058 atmen_  croak_  дохнуть  дохну́ть  до́хнуть 
for(wrd in omap["x1058"]){omakevars(x1058,"x1058");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="перегар холод смрад вонь тепло холод"
 if ( q(1,"suw_edtv suw_mntv") && base(1,cst) && s(0) )
 { l[i]=omo1; r[123]++; if(dbg){print "R123"}; continue;};

#cst=""
#if ( base(-1,cst) && s(-1) )
#{ l[i]=omo2; r[124]++; if(dbg){print "R124"}; continue;};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1059 !_#_!
 #  x1059 cowards_  trunks_  трусы  тру́сы  трусы́
for(wrd in omap["x1059"]){omakevars(x1059,"x1059");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
#cst="перегар холод смрад вонь тепло холод"
#if ( q(1,"suw_edtv suw_mntv") && base(1,cst) && s(-1) )
#{ l[i]=omo1; r[125]++; if(dbg){print "R125"}; continue;};

#cst=""
#if ( base(-1,cst) && s(-1) )
#{ l[i]=omo2; r[126]++; if(dbg){print "R126"}; continue;};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1060 !_#_!
 #  x1060 afraid_  shake_  трусить  тру́сить  труси́ть
for(wrd in omap["x1060"]){omakevars(x1060,"x1060");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
#cst="перегар холод смрад вонь тепло холод"
#if ( q(1,"suw_edtv suw_mntv") && base(1,cst) && s(-1) )
#{ l[i]=omo1; r[127]++; if(dbg){print "R127"}; continue;};

#cst=""
#if ( base(-1,cst) && s(-1) )
#{ l[i]=omo2; r[128]++; if(dbg){print "R128"}; continue;};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1061 !_#_!
 #  x1061 circum_  okrug_  окружной  окру́жной  окружно́й
for(wrd in omap["x1061"]){omakevars(x1061,"x1061");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
#cst="перегар холод смрад вонь тепло холод"
#if ( q(1,"suw_edtv suw_mntv") && base(1,cst) && s(-1) )
#{ l[i]=omo1; r[129]++; if(dbg){print "R129"}; continue;};

#cst=""
#if ( base(-1,cst) && s(-1) )
#{ l[i]=omo2; r[130]++; if(dbg){print "R130"}; continue;};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1062 !_#_!
 #  x1062 domain_  furnace_  доменный  доме́нный  до́менный
for(wrd in omap["x1062"]){omakevars(x1062,"x1062");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2

 cst="печь производство технология"
 if ( base(1,cst) && s(0) )
 { l[i]=omo2; r[131]++; if(dbg){print "R131"}; continue;};
 #
 cst="структура владение организация"
 if ( q(1,"prl_any") && base(1,cst) && s(0) )
 { l[i]=omo1; r[132]++; if(dbg){print "R132"}; continue;};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1063 !_#_!
 #  x1063 word_hyphdef_  (default_)
for(wrd in omap["x1063"]){omakevars(x1063,"x1063");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(0,"-") && w(1,"полна полно полны") )
 { l[i]=omo1; r[133]++; if(dbg){print "R133"}; continue};

 l[i]=omo2; r[134]++; if(dbg){print "R134"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1064 !_#_!
 #  x1064 poduwam_  zalt_  душам  душа́м  ду́шам
for(wrd in omap["x1064"]){omakevars(x1064,"x1064");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="говорить поговорить беседовать побеседовать"
 if ( w(-1,"по") && qb(-5,-2,"gl_in gl_ed gl_mn deep gl_poed gl_pomn prq_any") &&
      base(qbn,cst) && s(qbn,-1) )
 { l[i]=omo1; r[135]++; if(dbg){print "R135"}; continue};
 if ( w(-1,"по") && vvb(-5,-2) && qb(vvn-5,vvn,"gl_in gl_ed gl_mn deep gl_poed gl_pomn prq_any") &&
      base(qbn,cst) && s(-1) )
 { l[i]=omo1; r[136]++; if(dbg){print "R136"}; continue};

 l[i]=omo2; r[137]++; if(dbg){print "R137"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1065 !_#_!
 #  x1065 pore_  time_  порах  по́рах  пора́х
for(wrd in omap["x1065"]){omakevars(x1065,"x1065");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qxs(-1,"на","первых") )
 { l[i]=omo2; r[138]++; if(dbg){print "R138"}; continue};

 l[i]=omo1; r[139]++; if(dbg){print "R139"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1066 !_#_!
 #  x1066 regiment_  shelf_  полках  полка́х  по́лках
for(wrd in omap["x1066"]){omakevars(x1066,"x1066");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if(iwrd=="полках") {
   if ( w(-2,"на") &&
	 q(-1,"prl_mnpr prq_mnpr") && s(-2,-1) )
   { l[i]=omo2; r[140]++; if(dbg){print "R140"}; continue};
   if ( w(-1,"на") && s(-1) )
   { l[i]=omo2; r[141]++; if(dbg){print "R141"}; continue};
 };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1067 !_#_!
 #  x1067 sw_ez_r_      zalt_    пары  па́ры  пары́
for(wrd in omap["x1067"]){omakevars(x1067,"x1067");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"супружеские влюблённые крепкие") && s(-1) )
 { l[i]=omo1; r[142]++; if(dbg){print "R142"}; continue};
 if ( base(-1,"танцевать кружиться гулять идти") && s(-1) )
 { l[i]=omo1; r[143]++; if(dbg){print "R143"}; continue};
 #
 if ( w(-1,"ядовитые зловонные химические серные") && s(-1) )
 { l[i]=omo2; r[144]++; if(dbg){print "R144"}; continue};

 if ( sw_ez_r_f() )
 { l[i]=omo1; r[145]++; if(dbg){print "R145", "sw_ez_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1068 !_#_!
 #  x1068 eye_    peephole_    глазки  гла́́зки  глазки́
for(wrd in omap["x1068"]){omakevars(x1068,"x1068");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( base(-1,"бегать блестеть маленький крошечный блестящий злой") && s(-1) )
 { l[i]=omo1; r[146]++; if(dbg){print "R146"}; continue};
 #
#if ( base(-1,"ядовитый зловонный") && s(-1) )
#{ l[i]=omo2; r[147]++; if(dbg){print "R147"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1069 !_#_!
 #  x1069 holey_    honst_    честной  честно́й  че́стной
for(wrd in omap["x1069"]){omakevars(x1069,"x1069");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="честная") {
   if ( w(-1,"мать") && s(-1) )
   { l[i]=omo1; r[148]++; if(dbg){print "R148"}; continue};
 };
 #
 if ( base(-1,"весь") &&
       base(1,"народ компания") && s(-1,0) )
 { l[i]=omo1; r[149]++; if(dbg){print "R149"}; continue};
 #
 l[i]=omo2; r[150]++; if(dbg){print "R150"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1070 !_#_!
 #  x1070 cursed_    damned_    проклятый  про́клятый  прокля́тый (полная форма)
for(wrd in omap["x1070"]){omakevars(x1070,"x1070");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( base(-1,"это этого") && s(-1) )
 { l[i]=omo2; r[151]++; if(dbg){print "R151"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1071 !_#_!
 #  x1071 cursed_    damned_    проклят  про́клят  прокля́т (краткая форма)
for(wrd in omap["x1071"]){omakevars(x1071,"x1071");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( base(-1,"быть") && s(-1) )
 { l[i]=omo1; r[152]++; if(dbg){print "R152"}; continue};
 if ( base(-2,"быть") &&
       q(-1,"mest_im") && s(-2,-1) )
 { l[i]=omo1; r[153]++; if(dbg){print "R153"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2001 !_#_! #NOSPACY
 #  x2001 deep_na_      mest_ez_i_   моя  мо́я  моя́
for(wrd in omap["x2001"]){omakevars(x2001,"x2001");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( suw_edzeim(1) && Q(1,"suw_edzevi") && s(0) )
 { l[i]=omo2; r[154]++; if(dbg){print "R154"}; continue};
 if ( p(-1) && sc(1,"—") )
 { l[i]=omo2; r[155]++; if(dbg){print "R155"}; continue};
 if ( suw_edzeim(1) && s(0) && p(1,",") )
 { l[i]=omo2; r[156]++; if(dbg){print "R156"}; continue};
 if ( suw_edzeim(1) && s(0) && sc(-1,"—") )
 { l[i]=omo2; r[157]++; if(dbg){print "R157"}; continue};
 if ( name_im_sy(1) && s(0) )
 { l[i]=omo2; r[158]++; if(dbg){print "R158"}; continue};
 if ( q(1,"suw_edzeim nar_spos") &&
       qf(2,6,"gl_ed prl_kred_ze gl_paedze") && s(0,qfn-1) )
 { l[i]=omo2; r[159]++; if(dbg){print "R159"}; continue};
 if ( p(-1) && p(0) )
 { l[i]=omo2; r[160]++; if(dbg){print "R160"}; continue};
 if ( q(-2,"mest_im suw_edim suw_mnim") && s(-2,-1) &&
       w(-1,"и или да да") &&
        suw_edzeim(1) && s(-2,0) )
 { l[i]=omo2; r[161]++; if(dbg){print "R161"}; continue};
 if ( p(-3) &&
       nar_step(-2) && s(-2,-1) &&
        w(-1,"не") && p(0) )
 { l[i]=omo2; r[162]++; if(dbg){print "R162"}; continue};
 if ( p(-2) && suw_edzeim(-1) && p(0) && s(-1) )
 { l[i]=omo2; r[163]++; if(dbg){print "R163"}; continue};
 if ( suw_edzeim(-1) &&
       qf(1,5,"gl_ed prl_kred_ze gl_paedze") && s(-1,qfn-1) )
 { l[i]=omo2; r[164]++; if(dbg){print "R164"}; continue};
 if ( q(-1,"prl_edzeim prq_edzeim prl_kred_ze gl_ed mest_im") &&
       suw_edzeim(1) && s(-1,0) )
 { l[i]=omo2; r[165]++; if(dbg){print "R165"}; continue};
 if ( q(1,"prl_edzeim prq_edzeim prl_kred_ze") && s(0) )
 { l[i]=omo2; r[166]++; if(dbg){print "R166"}; continue};
 if ( prl_edzeim(-1) && s(-1) && p(0) )
 { l[i]=omo2; r[167]++; if(dbg){print "R167"}; continue};

 cst="она это вот как и но не"

 if ( w(-1,cst) &&
       suw_edzeim(1) && s(0) && p(1) )
 { l[i]=omo2; r[168]++; if(dbg){print "R168"}; continue};
 if ( p(-2) &&  w(-1,cst) && s(-1) && p(0) )
 { l[i]=omo2; r[169]++; if(dbg){print "R169"}; continue};

 cst=""

 if ( mest_im(-2) && q(-1,"suw_edim suw_mnim") && s(-2) && sc(-1,",") &&
       suw_edim(1) && s(0) && p(1) )
 { l[i]=omo2; r[170]++; if(dbg){print "R170"}; continue};
 if ( suw_edim(1) && s(0) && p(1) &&
       mest_im(2) && q(3,"suw_edim suw_mnim") && s(2) && p(3) )
 { l[i]=omo2; r[171]++; if(dbg){print "R171"}; continue};
 #
 if ( p(-1) && q(1,"mest_vi prl_edvi prl_mnvi prq_edvi prq_mnvi") &&
       q(2,"suw_edvi suw_mnvi") && s(0,1) )
 { l[i]=omo1; r[172]++; if(dbg){print "R172"}; continue};
 if ( p(-1) && q(1,"suw_edvi suw_mnvi mest_vi") && s(0) )
 { l[i]=omo1; r[173]++; if(dbg){print "R173"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2002 !_#_! #NOSPACY
 #  x2002 deep_na_      sw_1em_r_2ez_i_  туша  туша́  ту́ша
for(wrd in omap["x2002"]){omakevars(x2002,"x2002");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[174]++; if(dbg){print "R174", "sw_ez_i_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[175]++; if(dbg){print "R175", "sw_em_r_f"}; continue};
 #
 if ( p(-1) && q(1,"mest_vi prl_edvi prl_mnvi prq_edvi prq_mnvi") &&
       q(2,"suw_edvi suw_mnvi") && s(0,1) )
 { l[i]=omo1; r[176]++; if(dbg){print "R176"}; continue};
 if ( p(-1) && q(1,"suw_edvi suw_mnvi mest_vi") && s(0) )
 { l[i]=omo1; r[177]++; if(dbg){print "R177"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2003 !_#_!
 #  x2003 deep_na_      sw_em_r_
for(wrd in omap["x2003"]){omakevars(x2003,"x2003");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[178]++; if(dbg){print "R178", "sw_em_r_f"}; continue};
 #
 if ( p(-1) && q(1,"mest_vi prl_edvi prl_mnvi prq_edvi prq_mnvi") &&
       q(2,"suw_edvi suw_mnvi") && s(0,1) )
 { l[i]=omo1; r[179]++; if(dbg){print "R179"}; continue};
 if ( p(-1) && q(1,"suw_edvi suw_mnvi mest_vi") && s(0) )
 { l[i]=omo1; r[180]++; if(dbg){print "R180"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2004 !_#_!
 #  x2004 deep_na_      sw_em_vr_
for(wrd in omap["x2004"]){omakevars(x2004,"x2004");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[181]++; if(dbg){print "R181", "sw_em_v_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[182]++; if(dbg){print "R182", "sw_em_r_f"}; continue};
 #
 if ( p(-1) && q(1,"mest_vi prl_edvi prl_mnvi prq_edvi prq_mnvi") &&
       q(2,"suw_edvi suw_mnvi") && s(0,1) )
 { l[i]=omo1; r[183]++; if(dbg){print "R183"}; continue};
 if ( p(-1) && q(1,"suw_edvi suw_mnvi mest_vi") && s(0) )
 { l[i]=omo1; r[184]++; if(dbg){print "R184"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2005 !_#_!
 #  x2005 deep_na_      sw_es_r_   горя  горя́  го́ря
for(wrd in omap["x2005"]){omakevars(x2005,"x2005");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[185]++; if(dbg){print "R185", "sw_es_r_f"}; continue};
 #
 if ( p(-1) && q(1,"mest_vi prl_edvi prl_mnvi prq_edvi prq_mnvi") &&
       q(2,"suw_edvi suw_mnvi") && s(0,1) )
 { l[i]=omo1; r[186]++; if(dbg){print "R186"}; continue};
 if ( p(-1) && q(1,"suw_edvi suw_mnvi mest_vi") && s(0) )
 { l[i]=omo1; r[187]++; if(dbg){print "R187"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2006 !_#_!
 #  x2006 deep_na_      sw_ez_i_
for(wrd in omap["x2006"]){omakevars(x2006,"x2006");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[188]++; if(dbg){print "R188", "sw_ez_i_f"}; continue};
 #
 if ( p(-1) && q(1,"mest_vi prl_edvi prl_mnvi prq_edvi prq_mnvi") &&
       q(2,"suw_edvi suw_mnvi") && s(0,1) )
 { l[i]=omo1; r[189]++; if(dbg){print "R189"}; continue};
 if ( p(-1) && q(1,"suw_edvi suw_mnvi mest_vi") && s(0) )
 { l[i]=omo1; r[190]++; if(dbg){print "R190"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2007 !_#_!
 #  x2007 deep_pa_      sw_em_iv_
for(wrd in omap["x2007"]){omakevars(x2007,"x2007");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[191]++; if(dbg){print "R191", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[192]++; if(dbg){print "R192", "sw_em_v_f"}; continue};
 #
 if ( p(-1) && q(1,"mest_vi prl_edvi prl_mnvi prq_edvi prq_mnvi") &&
       q(2,"suw_edvi suw_mnvi") && s(0,1) )
 { l[i]=omo1; r[193]++; if(dbg){print "R193"}; continue};
 if ( p(-1) && q(1,"suw_edvi suw_mnvi mest_vi") && s(0) )
 { l[i]=omo1; r[194]++; if(dbg){print "R194"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2008 !_#_!
 #  x2008 deep_pa_      sw_em_r_
for(wrd in omap["x2008"]){omakevars(x2008,"x2008");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[195]++; if(dbg){print "R195", "sw_em_r_f"}; continue};
 #
 if ( p(-1) && q(1,"mest_vi prl_edvi prl_mnvi prq_edvi prq_mnvi") &&
       q(2,"suw_edvi suw_mnvi") && s(0,1) )
 { l[i]=omo1; r[196]++; if(dbg){print "R196"}; continue};
 if ( p(-1) && q(1,"suw_edvi suw_mnvi mest_vi") && s(0) )
 { l[i]=omo1; r[197]++; if(dbg){print "R197"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2009 !_#_!
 #  x2009 deep_pa_      sw_ez_i_
for(wrd in omap["x2009"]){omakevars(x2009,"x2009");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[198]++; if(dbg){print "R198", "sw_ez_i_f"}; continue};
 #
 if ( p(-1) && q(1,"mest_vi prl_edvi prl_mnvi prq_edvi prq_mnvi") &&
       q(2,"suw_edvi suw_mnvi") && s(0,1) )
 { l[i]=omo1; r[199]++; if(dbg){print "R199"}; continue};
 if ( p(-1) && q(1,"suw_edvi suw_mnvi mest_vi") && s(0) )
 { l[i]=omo1; r[200]++; if(dbg){print "R200"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2010 !_#_!
 #  x2010 deep_pa_      sw_mn_r_
for(wrd in omap["x2010"]){omakevars(x2010,"x2010");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[201]++; if(dbg){print "R201", "sw_mn_r_f"}; continue};
 #
 if ( p(-1) && q(1,"mest_vi prl_edvi prl_mnvi prq_edvi prq_mnvi") &&
       q(2,"suw_edvi suw_mnvi") && s(0,1) )
 { l[i]=omo1; r[202]++; if(dbg){print "R202"}; continue};
 if ( p(-1) && q(1,"suw_edvi suw_mnvi mest_vi") && s(0) )
 { l[i]=omo1; r[203]++; if(dbg){print "R203"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2011 !_#_!
 #  x2011 gl_ed1e_      m2_1sw_em_d_2pl_ez_t_
for(wrd in omap["x2011"]){omakevars(x2011,"x2011");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[204]++; if(dbg){print "R204", "sw_em_d_f"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[205]++; if(dbg){print "R205", "gl_ed1e_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2012 !_#_!
 #  x2012 gl_ed1e_      mest_ez_v_  мою  мо́ю  мою́
for(wrd in omap["x2012"]){omakevars(x2012,"x2012");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pre_vi(-1) &&
      q(1,"prl_edvi prq_edvi") &&
        suw_edvi(2) && s(-1,1) )
 { l[i]=omo2; r[206]++; if(dbg){print "R206"}; continue};
 if ( pre_vi(-1) &&
       suw_edvi(1) && s(-1,0) )
 { l[i]=omo2; r[207]++; if(dbg){print "R207"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[208]++; if(dbg){print "R208", "gl_ed1e_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2013 !_#_!
 #  x2013 gl_ed1e_      qip_ez_v_
for(wrd in omap["x2013"]){omakevars(x2013,"x2013");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[209]++; if(dbg){print "R209", "gl_ed1e_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2014 !_#_!
 #  x2014 gl_ed1e_      sw_1em_d_2ez_v_
for(wrd in omap["x2014"]){omakevars(x2014,"x2014");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[210]++; if(dbg){print "R210", "sw_em_d_f"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[211]++; if(dbg){print "R211", "sw_ez_v_f"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[212]++; if(dbg){print "R212", "gl_ed1e_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2015 !_#_!
 #  x2015 gl_ed1e_      sw_1em_v_2ez_vd_
for(wrd in omap["x2015"]){omakevars(x2015,"x2015");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[213]++; if(dbg){print "R213", "sw_ez_d_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[214]++; if(dbg){print "R214", "sw_em_v_f"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[215]++; if(dbg){print "R215", "sw_ez_v_f"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[216]++; if(dbg){print "R216", "gl_ed1e_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2016 !_#_!
 #  x2016 gl_ed1e_      sw_em_d_
for(wrd in omap["x2016"]){omakevars(x2016,"x2016");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( gl_in(1) && s(0) )
 { l[i]=omo1; r[217]++; if(dbg){print "R217"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[218]++; if(dbg){print "R218", "sw_em_d_f"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[219]++; if(dbg){print "R219", "gl_ed1e_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2017 !_#_!
 #  x2017 gl_ed1e_      sw_em_dr_
for(wrd in omap["x2017"]){omakevars(x2017,"x2017");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[220]++; if(dbg){print "R220", "sw_em_d_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[221]++; if(dbg){print "R221", "sw_em_r_f"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[222]++; if(dbg){print "R222", "gl_ed1e_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2018 !_#_!
 #  x2018 gl_ed1e_      sw_em_iv_
for(wrd in omap["x2018"]){omakevars(x2018,"x2018");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[223]++; if(dbg){print "R223", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[224]++; if(dbg){print "R224", "sw_em_v_f"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[225]++; if(dbg){print "R225", "gl_ed1e_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2019 !_#_!
 #  x2019 gl_ed1e_      sw_ems_d_
for(wrd in omap["x2019"]){omakevars(x2019,"x2019");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[226]++; if(dbg){print "R226", "sw_em_d_f"}; continue};
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; r[227]++; if(dbg){print "R227", "sw_es_d_f"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[228]++; if(dbg){print "R228", "gl_ed1e_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2020 !_#_!
 #  x2020 gl_ed1e_      sw_em_t_
for(wrd in omap["x2020"]){omakevars(x2020,"x2020");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[229]++; if(dbg){print "R229", "sw_em_t_f"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[230]++; if(dbg){print "R230", "gl_ed1e_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2021 !_#_!
 #  x2021 gl_ed1e_      sw_es_d_
for(wrd in omap["x2021"]){omakevars(x2021,"x2021");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; r[231]++; if(dbg){print "R231", "sw_es_d_f"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[232]++; if(dbg){print "R232", "gl_ed1e_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2022 !_#_!
 #  x2022 gl_ed1e_      sw_ez_t_
for(wrd in omap["x2022"]){omakevars(x2022,"x2022");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[233]++; if(dbg){print "R233", "sw_ez_t_f"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[234]++; if(dbg){print "R234", "gl_ed1e_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2023 !_#_!
 #  x2023 gl_ed1e_      sw_ez_v_
for(wrd in omap["x2023"]){omakevars(x2023,"x2023");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="веду") {
   if ( w(-1,"себя") && s(-1) )
   { l[i]=omo1; r[252]++; if(dbg){print "R252"}; continue};
   if ( w(1,"себя") && s(0) )
   { l[i]=omo1; r[252]++; if(dbg){print "R252"}; continue};
   if ( qxs(1,"я","вот","к")||
        qxs(1,"я","к") )
   { l[i]=omo1; r[252]++; if(dbg){print "R252"}; continue};
 };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[235]++; if(dbg){print "R235", "sw_ez_v_f"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[236]++; if(dbg){print "R236", "gl_ed1e_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2024 !_#_!
 #  x2024 gl_ed1e_      sw_mn_d_
for(wrd in omap["x2024"]){omakevars(x2024,"x2024");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_d_f() )
 { l[i]=omo2; r[237]++; if(dbg){print "R237", "sw_mn_d_f"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[238]++; if(dbg){print "R238", "gl_ed1e_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2025 !_#_!
 #  x2025 gl_ed3e_      pl_kr_em_
for(wrd in omap["x2025"]){omakevars(x2025,"x2025");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
#if ( gl_ed3e_f() )
#{ l[i]=omo1; r[239]++; if(dbg){print "R239"}; continue};
 #
 if ( pl_kr_em_f() )
 { l[i]=omo2; r[240]++; if(dbg){print "R240", "pl_kr_em_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2026 !_#_!
 #  x2026 gl_ed3e_      sw_em_iv_
for(wrd in omap["x2026"]){omakevars(x2026,"x2026");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_ed3e_f() )
 { l[i]=omo1; r[241]++; if(dbg){print "R241", "gl_ed3e_f"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[242]++; if(dbg){print "R242", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[243]++; if(dbg){print "R243", "sw_em_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2027 !_#_!
 #  x2027 gl_ed3e_      sw_mn_r_
for(wrd in omap["x2027"]){omakevars(x2027,"x2027");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_ed3e_f() )
 { l[i]=omo1; r[244]++; if(dbg){print "R244", "gl_ed3e_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[245]++; if(dbg){print "R245", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2028 !_#_!
 #  x2028 gl_inf_       sw_1ez_dpr_2mn_iv_
for(wrd in omap["x2028"]){omakevars(x2028,"x2028");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="вести") {
   if ( w(-1,"себя") && s(-1) )
   { l[i]=omo1; r[252]++; if(dbg){print "R252"}; continue};
   if ( w(1,"себя") && s(0) )
   { l[i]=omo1; r[252]++; if(dbg){print "R252"}; continue};
 };
 #
 if ( gl_inf_f() )
 { l[i]=omo1; r[246]++; if(dbg){print "R246", "gl_inf_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[247]++; if(dbg){print "R247", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[248]++; if(dbg){print "R248", "sw_ez_p_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[249]++; if(dbg){print "R249", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[250]++; if(dbg){print "R250", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[251]++; if(dbg){print "R251", "sw_mn_v_f"}; continue};


 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2029 !_#_!
 #  x2029 gl_inf_       sw_ez_iv_
for(wrd in omap["x2029"]){omakevars(x2029,"x2029");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="подать") {
   if ( w(-1,"рукой") && s(-1) )
   { l[i]=omo1; r[252]++; if(dbg){print "R252"}; continue};
 };
 #
 if ( gl_inf_f() )
 { l[i]=omo1; r[253]++; if(dbg){print "R253", "sw_ez_i_f"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[254]++; if(dbg){print "R254", "sw_ez_i_f"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[255]++; if(dbg){print "R255", "sw_ez_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2030 !_#_!
 #  x2030 gl_mn1e_      mest_ems_p_
for(wrd in omap["x2030"]){omakevars(x2030,"x2030");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; r[256]++; if(dbg){print "R256", "gl_mn1e_f"}; continue};
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2031 !_#_!
 #  x2031 gl_mn1e_      pl_ems_p_
for(wrd in omap["x2031"]){omakevars(x2031,"x2031");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; r[257]++; if(dbg){print "R257", "gl_mn1e_f"}; continue};
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo2; r[258]++; if(dbg){print "R258", "pl_em_p_f()||pl_es_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2032 !_#_!
 #  x2032 gl_mn1e_      pl_kr_em_
for(wrd in omap["x2032"]){omakevars(x2032,"x2032");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; r[259]++; if(dbg){print "R259", "gl_mn1e_f"}; continue};
 #
 if ( pl_kr_em_f() )
 { l[i]=omo2; r[260]++; if(dbg){print "R260", "pl_kr_em_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2033 !_#_!
 #  x2033 gl_mn1e_      pq_kr_em_
for(wrd in omap["x2033"]){omakevars(x2033,"x2033");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; r[261]++; if(dbg){print "R261", "gl_mn1e_f"}; continue};
 #
 if ( pq_kr_em_f() )
 { l[i]=omo2; r[262]++; if(dbg){print "R262", "pq_kr_em_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2034 !_#_!
 #  x2034 gl_mn1e_      sw_em_iv_
for(wrd in omap["x2034"]){omakevars(x2034,"x2034");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; r[263]++; if(dbg){print "R263", "gl_mn1e_f"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[264]++; if(dbg){print "R264", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[265]++; if(dbg){print "R265", "sw_em_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2035 !_#_!
 #  x2035 gl_mn1e_      sw_em_t_
for(wrd in omap["x2035"]){omakevars(x2035,"x2035");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; r[266]++; if(dbg){print "R266", "gl_mn1e_f"}; continue};
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[267]++; if(dbg){print "R267", "sw_em_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2036 !_#_!
 #  x2036 gl_mn1e_      sw_es_t_
for(wrd in omap["x2036"]){omakevars(x2036,"x2036");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; r[268]++; if(dbg){print "R268", "gl_mn1e_f"}; continue};
 #
 if ( sw_es_t_f() )
 { l[i]=omo2; r[269]++; if(dbg){print "R269", "sw_es_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2037 !_#_!
 #  x2037 gl_mn1e_      sw_mn_r_
for(wrd in omap["x2037"]){omakevars(x2037,"x2037");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; r[270]++; if(dbg){print "R270", "gl_mn1e_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[271]++; if(dbg){print "R271", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2038 !_#_!
 #  x2038 gl_mn2e_      gl_pomn_
for(wrd in omap["x2038"]){omakevars(x2038,"x2038");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; r[272]++; if(dbg){print "R272", "gl_mn2e_f"}; continue};
 #
 if ( gl_pomn_f() )
 { l[i]=omo2; r[273]++; if(dbg){print "R273", "gl_pomn_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2039 !_#_!
 #  x2039 gl_mn2e_      m2_1sw_em_p_2gl_pomn_
for(wrd in omap["x2039"]){omakevars(x2039,"x2039");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; r[274]++; if(dbg){print "R274", "gl_mn2e_f"}; continue};
 #
 if ( gl_pomn_f() )
 { l[i]=omo2; r[275]++; if(dbg){print "R275", "gl_pomn_f"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; r[276]++; if(dbg){print "R276", "sw_em_p_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2040 !_#_!
 #  x2040 gl_mn2e_      sw_em_p_
for(wrd in omap["x2040"]){omakevars(x2040,"x2040");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; r[277]++; if(dbg){print "R277", "gl_mn2e_f"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; r[278]++; if(dbg){print "R278", "sw_em_p_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2041 !_#_!
 #  x2041 gl_mn2e_      sw_ez_dp_
for(wrd in omap["x2041"]){omakevars(x2041,"x2041");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[279]++; if(dbg){print "R279", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[280]++; if(dbg){print "R280", "sw_ez_p_f"}; continue};
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; r[281]++; if(dbg){print "R281", "gl_mn2e_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2042 !_#_!
 #  x2042 gl_mn3e_      pq_kr_em_
for(wrd in omap["x2042"]){omakevars(x2042,"x2042");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pq_kr_em_f() )
 { l[i]=omo2; r[282]++; if(dbg){print "R282", "pq_kr_em_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2043 !_#_!
 #  x2043 gl_mn3e_      sw_mn_r_
for(wrd in omap["x2043"]){omakevars(x2043,"x2043");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[283]++; if(dbg){print "R283", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2044 !_#_!
 #  x2044 gl_mn3e_      sw_mn_vr_
for(wrd in omap["x2044"]){omakevars(x2044,"x2044");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[284]++; if(dbg){print "R284", "sw_mn_v_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[285]++; if(dbg){print "R285", "sw_mn_r_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2045 !_#_!
 #  x2045 gl_paedmu_pe_	  m2_1pl_kr_em_2gl_paedmu_ne_  умел  умёл  уме́л
for(wrd in omap["x2045"]){omakevars(x2045,"x2045");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(1,"prl_kred_sr nar_spos") &&
       gl_in(2) && s(0,1) )
 { l[i]=omo2; r[286]++; if(dbg){print "R286"}; continue};
 if ( gl_in(1) && s(0) )
 { l[i]=omo2; r[287]++; if(dbg){print "R287"}; continue};
 if ( pl_kr_em_f() )
 { l[i]=omo2; r[288]++; if(dbg){print "R288", "pl_kr_em_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2046 !_#_!
 #  x2046 gl_paedmu_    pl_kr_em_  смел  смёл  сме́л
for(wrd in omap["x2046"]){omakevars(x2046,"x2046");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"не") &&
       qf(1,3,"gl_in") && s(-1,qfn-1) )
 { l[i]=omo2; r[289]++; if(dbg){print "R289"}; continue};
 #
 if ( pl_kr_em_f() )
 { l[i]=omo2; r[290]++; if(dbg){print "R290", "pl_kr_em_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2047 !_#_!
 #  x2047 gl_paedmu_    sw_1em_i_2mn_r_
for(wrd in omap["x2047"]){omakevars(x2047,"x2047");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; r[291]++; if(dbg){print "R291", "gl_paedmu_f"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[292]++; if(dbg){print "R292", "sw_em_i_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[293]++; if(dbg){print "R293", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2048 !_#_!
 #  x2048 gl_paedmu_    sw_1em_iv_2mn_r_
for(wrd in omap["x2048"]){omakevars(x2048,"x2048");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; r[294]++; if(dbg){print "R294", "gl_paedmu_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[295]++; if(dbg){print "R295", "sw_mn_r_f"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[296]++; if(dbg){print "R296", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[297]++; if(dbg){print "R297", "sw_em_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2049 !_#_!
 #  x2049 gl_paedmu_    sw_em_i_
for(wrd in omap["x2049"]){omakevars(x2049,"x2049");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; r[298]++; if(dbg){print "R298", "gl_paedmu_f"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[299]++; if(dbg){print "R299", "sw_em_i_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2050 !_#_!
 #  x2050 gl_paedmu_    sw_em_iv_
for(wrd in omap["x2050"]){omakevars(x2050,"x2050");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[300]++; if(dbg){print "R300", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[301]++; if(dbg){print "R301", "sw_em_v_f"}; continue};
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; r[302]++; if(dbg){print "R302", "gl_paedmu_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2051 !_#_!
 #  x2051 gl_paedmu_	sw_mn_r_
for(wrd in omap["x2051"]){omakevars(x2051,"x2051");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[303]++; if(dbg){print "R303", "sw_mn_r_f"}; continue};
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; r[304]++; if(dbg){print "R304", "gl_paedmu_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2052 !_#_!
 #  x2052 gl_paedmu_    sw_mn_vr_
for(wrd in omap["x2052"]){omakevars(x2052,"x2052");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; r[305]++; if(dbg){print "R305", "gl_paedmu_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[306]++; if(dbg){print "R306", "sw_mn_v_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[307]++; if(dbg){print "R307", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2053 !_#_!
 #  x2053 gl_paedsr_    sw_es_iv_
for(wrd in omap["x2053"]){omakevars(x2053,"x2053");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="начало") {
   if ( gl_in(1) && s(0) )
   { l[i]=omo1; r[308]++; if(dbg){print "R308"}; continue};
 };
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; r[309]++; if(dbg){print "R309", "sw_es_i_f"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; r[310]++; if(dbg){print "R310", "sw_es_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2054 !_#_!
 #  x2054 m2_1sw_es_r_2gl_paedze_  sw_mn_iv_  дела   де́ла   дела́
for(wrd in omap["x2054"]){omakevars(x2054,"x2054");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qxs(-1,"для","пользы") )
 { l[i]=omo1; r[311]++; if(dbg){print "R311"}; continue};
 if ( wb(-5,-1,"как") && s(wbn,-1) )
 { l[i]=omo2; r[312]++; if(dbg){print "R312"}; continue};
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; r[313]++; if(dbg){print "R313", "sw_es_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[314]++; if(dbg){print "R314", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[315]++; if(dbg){print "R315", "sw_mn_v_f"}; continue};
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; r[316]++; if(dbg){print "R316", "gl_paedze_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2055 !_#_!
 #  x2055 gl_paedze_    sw_1es_r_2mn_iv_
for(wrd in omap["x2055"]){omakevars(x2055,"x2055");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="начала") {
   if ( w(-2,"с до") &&
         w(-1,"самого") && s(-2,-1) )
   { l[i]=omo2; r[317]++; if(dbg){print "R317"}; continue};
   if ( gl_in(1) && s(0) )
   { l[i]=omo1; r[318]++; if(dbg){print "R318"}; continue};
   if ( (suw_edzeim(1)||w(1,"она")) && s(0) )
   { l[i]=omo1; r[319]++; if(dbg){print "R319"}; continue};
 };
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[320]++; if(dbg){print "R320", "sw_es_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[321]++; if(dbg){print "R321", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[322]++; if(dbg){print "R322", "sw_mn_v_f"}; continue};
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; r[323]++; if(dbg){print "R323", "gl_paedze_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2056 !_#_!
 #  x2056 gl_paedze_    sw_em_i_
for(wrd in omap["x2056"]){omakevars(x2056,"x2056");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[324]++; if(dbg){print "R324", "sw_em_i_f"}; continue};
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; r[325]++; if(dbg){print "R325", "gl_paedze_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2057 !_#_!
 #  x2057 gl_paedze_    sw_em_r_
for(wrd in omap["x2057"]){omakevars(x2057,"x2057");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[326]++; if(dbg){print "R326", "sw_em_r_f"}; continue};
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; r[327]++; if(dbg){print "R327", "gl_paedze_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2058 !_#_!
 #  x2058 gl_pamn_      gl_poed_
for(wrd in omap["x2058"]){omakevars(x2058,"x2058");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="попали") {
   if ( wb(-5,-1,"как куда никуда они вы мы") && s(wbn,-1) )
   { l[i]=omo1; r[328]++; if(dbg){print "R328"}; continue};
   if ( q(1,"pre_vi") && s(0) )
   { l[i]=omo1; r[329]++; if(dbg){print "R329", "gl_pamn_f"}; continue};
 };
 if(iwrd=="дели") {
   if ( wb(-5,-1,"куда никуда они вы мы") && s(wbn,-1) )
   { l[i]=omo1; r[330]++; if(dbg){print "R330"}; continue};
 };
 #
 if ( w(1,"под") && s(0) )
 { l[i]=omo1; r[331]++; if(dbg){print "R331", "gl_pamn_f"}; continue};
 if ( q(-1,"mest_da suw_edda suw_mnda") && s(-1) )
 { l[i]=omo1; r[332]++; if(dbg){print "R332", "gl_pamn_f"}; continue};
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; r[333]++; if(dbg){print "R333", "gl_pamn_f"}; continue};
 #
 if ( gl_poed_f() )
 { l[i]=omo2; r[334]++; if(dbg){print "R334", "gl_poed_f"}; continue};
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2059 !_#_!
 #  x2059 gl_pamn_      nar_mest_
for(wrd in omap["x2059"]){omakevars(x2059,"x2059");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; r[335]++; if(dbg){print "R335", "gl_pamn_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2060 !_#_!
 #  x2060 gl_pamn_      sw_1ez_dpr_2mn_iv_
for(wrd in omap["x2060"]){omakevars(x2060,"x2060");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; r[336]++; if(dbg){print "R336", "gl_pamn_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[337]++; if(dbg){print "R337", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[338]++; if(dbg){print "R338", "sw_ez_p_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[339]++; if(dbg){print "R339", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[340]++; if(dbg){print "R340", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[341]++; if(dbg){print "R341", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2061 !_#_!
 #  x2061 gl_pamn_      sw_1ez_r_2mn_iv_
for(wrd in omap["x2061"]){omakevars(x2061,"x2061");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; r[342]++; if(dbg){print "R342", "gl_pamn_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[343]++; if(dbg){print "R343", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[344]++; if(dbg){print "R344", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[345]++; if(dbg){print "R345", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2062 !_#_!
 #  x2062 gl_pamn_      sw_ez_dpr_  устали  уста́ли  у́стали
for(wrd in omap["x2062"]){omakevars(x2062,"x2062");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"без") && s(-1) )
 { l[i]=omo2; r[346]++; if(dbg){print "R346"}; continue};
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; r[347]++; if(dbg){print "R347", "gl_pamn_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2063 !_#_!
 #  x2063 gl_poed_      mest_ez_dprt_  нашей  наше́й  на́шей
for(wrd in omap["x2063"]){omakevars(x2063,"x2063");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[348]++; if(dbg){print "R348", "gl_poed_f"}; continue};
 #
 if ( q(-1,"pre_da pre_pr pre_ro pre_tv") &&
       q(1,"suw_edzeda suw_edzepr suw_edzero suw_edzetv prl_edzeda prl_edzepr prl_edzero prl_edzetv") && s(-1,0) )
 { l[i]=omo2; r[349]++; if(dbg){print "R349"}; continue};
 if ( q(-1,"pre_da pre_pr pre_ro pre_tv prl_srav prl_edzevi") && s(-1) && (p(0)||q_w(1,"pre_any souz_iili name_ro_sy isname")) )
 { l[i]=omo2; r[350]++; if(dbg){print "R350"}; continue};
 if ( q(1,"suw_edzeda suw_edzepr suw_edzero suw_edzetv prl_edzeda prl_edzepr prl_edzero prl_edzetv") && s(0) )
 { l[i]=omo2; r[351]++; if(dbg){print "R351"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2064 !_#_!
 #  x2064 gl_poed_pamn_	sw_1ez_dpr_2mn_iv_  отмели  отмели́  о́тмели
for(wrd in omap["x2064"]){omakevars(x2064,"x2064");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[352]++; if(dbg){print "R352", "gl_poed_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[353]++; if(dbg){print "R353", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[354]++; if(dbg){print "R354", "sw_ez_p_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[355]++; if(dbg){print "R355", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[356]++; if(dbg){print "R356", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[357]++; if(dbg){print "R357", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2065 !_#_!
 #  x2065 gl_poed_      sw_1em_n_2ez_dpr_3mn_iv_
for(wrd in omap["x2065"]){omakevars(x2065,"x2065");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[358]++; if(dbg){print "R358", "gl_poed_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[359]++; if(dbg){print "R359", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[360]++; if(dbg){print "R360", "sw_ez_p_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[361]++; if(dbg){print "R361", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[362]++; if(dbg){print "R362", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[363]++; if(dbg){print "R363", "sw_mn_v_f"}; continue};


 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2066 !_#_!
 #  x2066 gl_poed_      sw_1ez_dpr_2mn_iv_
for(wrd in omap["x2066"]){omakevars(x2066,"x2066");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( p(-1) && sc(0,"!") && w(0,"гати грани дрожи заводи копи крепи моли пади топи") )
 { l[i]=omo1; r[364]++; if(dbg){print "R364"}; continue};
 
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[365]++; if(dbg){print "R365", "gl_poed_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[366]++; if(dbg){print "R366", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[367]++; if(dbg){print "R367", "sw_ez_p_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[368]++; if(dbg){print "R368", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[369]++; if(dbg){print "R369", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[370]++; if(dbg){print "R370", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2067 !_#_!
 #  x2067 gl_poed_      sw_1ez_r_2mn_iv_3es_n_  суши  суши́  су́ши
for(wrd in omap["x2067"]){omakevars(x2067,"x2067");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[371]++; if(dbg){print "R371", "gl_poed_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[372]++; if(dbg){print "R372", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[373]++; if(dbg){print "R373", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[374]++; if(dbg){print "R374", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2068 !_#_!
 #  x2068 gl_poed_      sw_1ez_dprv_2mn_iv_
for(wrd in omap["x2068"]){omakevars(x2068,"x2068");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[375]++; if(dbg){print "R375", "gl_poed_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[376]++; if(dbg){print "R376", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[377]++; if(dbg){print "R377", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2069 !_#_!
 #  x2069 gl_poed_      sw_1ez_r_2mn_iv_
for(wrd in omap["x2069"]){omakevars(x2069,"x2069");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="пищи") {
   if ( base(-1,"запас") && s(-1) )
   { l[i]=omo2; r[378]++; if(dbg){print "R378"}; continue};
 };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[379]++; if(dbg){print "R379", "gl_poed_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[380]++; if(dbg){print "R380", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[381]++; if(dbg){print "R381", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[382]++; if(dbg){print "R382", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2070 !_#_!
 #  x2070 gl_poed_      sw_1mn_iv_2gl_pamn_
for(wrd in omap["x2070"]){omakevars(x2070,"x2070");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[383]++; if(dbg){print "R383", "gl_poed_f"}; continue};
 #
 if ( gl_pamn_f() )
 { l[i]=omo2; r[384]++; if(dbg){print "R384", "gl_pamn_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[385]++; if(dbg){print "R385", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[386]++; if(dbg){print "R386", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2071 !_#_!
 #  x2071 gl_poed_      sw_em_i_
for(wrd in omap["x2071"]){omakevars(x2071,"x2071");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[387]++; if(dbg){print "R387", "gl_poed_f"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[388]++; if(dbg){print "R388", "sw_em_i_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2072 !_#_!
 #  x2072 gl_poed_      sw_es_dpr_
for(wrd in omap["x2072"]){omakevars(x2072,"x2072");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[389]++; if(dbg){print "R389", "gl_poed_f"}; continue};
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; r[390]++; if(dbg){print "R390", "sw_es_d_f"}; continue};
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; r[391]++; if(dbg){print "R391", "sw_es_p_f"}; continue};
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[392]++; if(dbg){print "R392", "sw_es_r_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2073 !_#_!
 #  x2073 gl_poed_      sw_es_n_  веди  веди́  ве́ди
for(wrd in omap["x2073"]){omakevars(x2073,"x2073");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(1,"mest_vi") &&
       q(2,"nar_spos prl_kred_sr") && s(0,1) )
 { l[i]=omo1; r[393]++; if(dbg){print "R393", "gl_poed_f"}; continue};
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[394]++; if(dbg){print "R394", "gl_poed_f"}; continue};
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2074 !_#_!
 #  x2074 gl_poed_	sw_ez_dpr_
for(wrd in omap["x2074"]){omakevars(x2074,"x2074");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[395]++; if(dbg){print "R395", "gl_poed_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[396]++; if(dbg){print "R396", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[397]++; if(dbg){print "R397", "sw_ez_p_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[398]++; if(dbg){print "R398", "sw_ez_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2075 !_#_!
 #  x2075 gl_poed_      sw_ez_iv_  казни  казни́  ка́зни
for(wrd in omap["x2075"]){omakevars(x2075,"x2075");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[399]++; if(dbg){print "R399", "gl_poed_f"}; continue};
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2076 !_#_!
 #  x2076 gl_poed_      sw_ez_r_
for(wrd in omap["x2076"]){omakevars(x2076,"x2076");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[400]++; if(dbg){print "R400", "gl_poed_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[401]++; if(dbg){print "R401", "sw_ez_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2077 !_#_!
 #  x2077 gl_poed_      sw_ez_t_
for(wrd in omap["x2077"]){omakevars(x2077,"x2077");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[402]++; if(dbg){print "R402", "gl_poed_f"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[403]++; if(dbg){print "R403", "sw_ez_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2078 !_#_!
 #  x2078 gl_poed_      sw_mn_i_
for(wrd in omap["x2078"]){omakevars(x2078,"x2078");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[404]++; if(dbg){print "R404", "gl_poed_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[405]++; if(dbg){print "R405", "sw_mn_i_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2079 !_#_!
 #  x2079 gl_poed_      sw_mn_iv_
for(wrd in omap["x2079"]){omakevars(x2079,"x2079");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[406]++; if(dbg){print "R406", "gl_poed_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[407]++; if(dbg){print "R407", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[408]++; if(dbg){print "R408", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2080 !_#_!
 #  x2080 gl_poed_      sw_mn_r_
for(wrd in omap["x2080"]){omakevars(x2080,"x2080");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[409]++; if(dbg){print "R409", "gl_poed_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[410]++; if(dbg){print "R410", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2081 !_#_!
 #  x2081 gl_pomn_      sw_em_p_
for(wrd in omap["x2081"]){omakevars(x2081,"x2081");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pomn_f() )
 { l[i]=omo1; r[411]++; if(dbg){print "R411", "gl_pomn_f"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; r[412]++; if(dbg){print "R412", "sw_em_p_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2082 !_#_!
 #  x2082 m2_1gl_mn1e_2pq_kr_em_   sw_em_t_
for(wrd in omap["x2082"]){omakevars(x2082,"x2082");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; r[413]++; if(dbg){print "R413", "gl_mn1e_f"}; continue};
 #
 if ( pq_kr_em_f() )
 { l[i]=omo1; r[414]++; if(dbg){print "R414", "pq_kr_em_f"}; continue};
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[415]++; if(dbg){print "R415", "sw_em_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2083 !_#_!
 #  x2083 m2_1gl_mn1e_2qik_d_      sw_mn_r_
for(wrd in omap["x2083"]){omakevars(x2083,"x2083");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; r[416]++; if(dbg){print "R416", "gl_mn1e_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[417]++; if(dbg){print "R417", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2084 !_#_!
 #  x2084 m2_1gl_poed_2nar_spos_   sw_ez_t_  порой  поро́й  по́рой
for(wrd in omap["x2084"]){omakevars(x2084,"x2084");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[418]++; if(dbg){print "R418", "gl_poed_f"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[419]++; if(dbg){print "R419", "sw_ez_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2085 !_#_!
 #  x2085 m2_1nar_kaq_2pred_ro_	   sw_em_t_
for(wrd in omap["x2085"]){omakevars(x2085,"x2085");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[420]++; if(dbg){print "R420", "sw_em_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2086 !_#_!
 #  x2086 m2_1nar_vrem_2pred_ro_   sw_em_p_     после   по́сле   после́
for(wrd in omap["x2086"]){omakevars(x2086,"x2086");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sos(-20,-2) && Qb(son+1,-1,"pre_pr") )
 { l[i]=omo1; r[421]++; if(dbg){print "R421"}; continue};

 if ( p(-1) )
 { l[i]=omo1; r[422]++; if(dbg){print "R422"}; continue};
 if ( q(-1,"gl_in") && s(-1) )
 { l[i]=omo1; r[423]++; if(dbg){print "R423"}; continue};
 if ( w(-1,"а и по но однако уж ну") && s(-1) )
 { l[i]=omo1; r[424]++; if(dbg){print "R424"}; continue};
 if ( q(1,"qik_ro") &&
       q(2,"qik_ro suw_mnro") && s(0,1) )
 { l[i]=omo1; r[425]++; if(dbg){print "R425"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; r[426]++; if(dbg){print "R426", "sw_em_p_f"}; continue};
 #
 if ( q(1,"suw_edro suw_mnro prl_edro prl_mnro mest_ro") )
 { l[i]=omo1; r[427]++; if(dbg){print "R427"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2087 !_#_!
 #  x2087 m2_1pl_srav_2gl_poed_	   pl_ez_dprt_  свежей  свеже́й  све́жей
for(wrd in omap["x2087"]){omakevars(x2087,"x2087");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[428]++; if(dbg){print "R428", "gl_poed_f"}; continue};
 #
 if ( pl_srav_f() )
 { l[i]=omo1; r[429]++; if(dbg){print "R429", "pl_srav_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2088 !_#_!
 #  x2088 m2_1pl_srav_2gl_poed_	   sw_ez_t_  бурей  буре́й  бу́рей
for(wrd in omap["x2088"]){omakevars(x2088,"x2088");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[430]++; if(dbg){print "R430", "gl_poed_f"}; continue};
 #
 if ( pl_srav_f() )
 { l[i]=omo1; r[431]++; if(dbg){print "R431", "pl_srav_f"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[432]++; if(dbg){print "R432", "sw_ez_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2089 !_#_!
 #  x2089 m2_1sw_em_d_2gl_ed1e_	   pl_ez_dprt_
for(wrd in omap["x2089"]){omakevars(x2089,"x2089");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[433]++; if(dbg){print "R433", "sw_em_d_f"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[434]++; if(dbg){print "R434", "gl_ed1e_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2090 !_#_!
 #  x2090 m2_1sw_em_d_2gl_ed1e_	   sw_em_l_
for(wrd in omap["x2090"]){omakevars(x2090,"x2090");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; r[435]++; if(dbg){print "R435", "sw_em_l_f"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[436]++; if(dbg){print "R436", "sw_em_d_f"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[437]++; if(dbg){print "R437", "gl_ed1e_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2091 !_#_!
 #  x2091 m2_1sw_em_d_2gl_poed_	   pl_ez_dprt_
for(wrd in omap["x2091"]){omakevars(x2091,"x2091");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[438]++; if(dbg){print "R438", "gl_poed_f"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[439]++; if(dbg){print "R439", "sw_em_d_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2092 !_#_!
 #  x2092 m2_1sw_em_l_2gl_ed1e_	   sw_em_dz_
for(wrd in omap["x2092"]){omakevars(x2092,"x2092");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_z_f() )
 { l[i]=omo2; r[440]++; if(dbg){print "R440", "sw_em_z_f"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; r[441]++; if(dbg){print "R441", "sw_em_l_f"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[442]++; if(dbg){print "R442", "sw_em_d_f"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[443]++; if(dbg){print "R443", "gl_ed1e_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2093 !_#_!
 #  x2093 gl_poed_	   sw_1ez_dprz_2mn_iv_
for(wrd in omap["x2093"]){omakevars(x2093,"x2093");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_z_f() )
 { l[i]=omo2; r[444]++; if(dbg){print "R444", "sw_em_z_f"}; continue};
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[445]++; if(dbg){print "R445", "gl_poed_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[446]++; if(dbg){print "R446", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[447]++; if(dbg){print "R447", "sw_ez_p_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[448]++; if(dbg){print "R448", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[449]++; if(dbg){print "R449", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[450]++; if(dbg){print "R450", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2094 !_#_!
 #  x2094 m2_1sw_em_p_2nar_vrem_   pl_srav_  уже  уже́  у́же
for(wrd in omap["x2094"]){omakevars(x2094,"x2094");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qxs(1,"в","плечах талии обхвате окружности диаметре") )
 { l[i]=omo2; r[451]++; if(dbg){print "R451", "pl_srav_f"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[452]++; if(dbg){print "R452", "sw_em_p_f"}; continue};
 #
 if ( pl_srav_f() )
 { l[i]=omo2; r[453]++; if(dbg){print "R453", "pl_srav_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2095 !_#_!
 #  x2095 m2_1sw_em_p_2pl_ems_p_   sw_es_t_
for(wrd in omap["x2095"]){omakevars(x2095,"x2095");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; r[454]++; if(dbg){print "R454", "pl_em_p_f()||pl_es_p_f"}; continue};
 #
 if ( sw_es_t_f() )
 { l[i]=omo2; r[455]++; if(dbg){print "R455", "sw_es_t_f"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[456]++; if(dbg){print "R456", "sw_em_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2096 !_#_!
 #  x2096 m2_1sw_em_r_2pl_kr_em_r_   pl_kr_ez_  бела бе́ла бела́
for(wrd in omap["x2096"]){omakevars(x2096,"x2096");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[457]++; if(dbg){print "R457", "sw_em_r_f"}; continue};
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo2; r[458]++; if(dbg){print "R458", "pl_kr_ez_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2097 !_#_!
 #  x2097 m2_1sw_em_t_2pl_ems_p_   sw_em_iv_
for(wrd in omap["x2097"]){omakevars(x2097,"x2097");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; r[459]++; if(dbg){print "R459", "pl_em_p_f()||pl_es_p_f"}; continue};
 #
 if ( sw_em_t_f() )
 { l[i]=omo1; r[460]++; if(dbg){print "R460", "sw_em_t_f"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[461]++; if(dbg){print "R461", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[462]++; if(dbg){print "R462", "sw_em_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2098 !_#_!
 #  x2098 m2_1sw_es_p_2pl_ems_p_   sw_es_t_
for(wrd in omap["x2098"]){omakevars(x2098,"x2098");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; r[463]++; if(dbg){print "R463", "pl_em_p_f()||pl_es_p_f"}; continue};
 #
 if ( sw_es_t_f() )
 { l[i]=omo2; r[464]++; if(dbg){print "R464", "sw_es_t_f"}; continue};
 #
 if ( sw_es_p_f() )
 { l[i]=omo1; r[465]++; if(dbg){print "R465", "sw_es_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2099 !_#_!
 #  x2099 m2_1sw_ez_dp_2nar_napr_  sw_es_ivp_  горе  горе́  го́ре
for(wrd in omap["x2099"]){omakevars(x2099,"x2099");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"на") && s(-1) && p(-2) && p(0) )
 { r[466]++; if(dbg){print "R466", "stopper"}; continue};
 if ( w(-1,"на") && s(-1) && p(-2) && tf(1,3,"dvi") )
 { r[467]++; if(dbg){print "R467", "stopper"}; continue};

 if ( base(-2,"воздеть") && w(-1,"руки") && s(-2,-1) )
 { l[i]=omo1; r[468]++; if(dbg){print "R468"}; continue};
 if ( w(-1,"на") && s(-1) && (qw_(-2,"mest_da suw_edda suw_mnda")||q_w(1,"mest_da suw_edda suw_mnda")) )
 { l[i]=omo2; r[469]++; if(dbg){print "R469"}; continue};
 if ( sw_es_i_f() )
 { l[i]=omo2; r[470]++; if(dbg){print "R470", "sw_es_i_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; r[471]++; if(dbg){print "R471", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo1; r[472]++; if(dbg){print "R472", "sw_ez_p_f"}; continue};
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; r[473]++; if(dbg){print "R473", "sw_es_p_f"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; r[474]++; if(dbg){print "R474", "sw_es_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2100 !_#_!
 #  x2100 m2_1sw_ez_l_2gl_poed_pamn_      sw_1ez_dpr_2mn_iv_
for(wrd in omap["x2100"]){omakevars(x2100,"x2100");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[475]++; if(dbg){print "R475", "gl_poed_f"}; continue};
 #
 if ( sw_ez_l_f() )
 { l[i]=omo1; r[476]++; if(dbg){print "R476", "sw_ez_l_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[477]++; if(dbg){print "R477", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[478]++; if(dbg){print "R478", "sw_ez_p_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[479]++; if(dbg){print "R479", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[480]++; if(dbg){print "R480", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[481]++; if(dbg){print "R481", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2101 !_#_!
 #  x2101 m2_1sw_ez_l_2gl_poed_    sw_1ez_dprz_2mn_iv_
for(wrd in omap["x2101"]){omakevars(x2101,"x2101");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="кости") {
   if ( w(-1,"в") && base(-2,"выиграть проиграть играть игра проиграться") && s(-2,-1) )
   { l[i]=omo2; r[482]++; if(dbg){print "R482"}; continue};
 };
 if ( pre_any(-1) && W(-1,"в на") && s(-1) )
 { l[i]=omo2; r[483]++; if(dbg){print "R483"}; continue};
 if ( pre_any(-3) && W(-3,"в на") &&
       suw_any(-2) &&
        souz_iili(-1) && s(-3,-1) )
 { l[i]=omo2; r[484]++; if(dbg){print "R484"}; continue};
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[485]++; if(dbg){print "R485", "gl_poed_f"}; continue};
 #
 if ( sw_ez_l_f() )
 { l[i]=omo1; r[486]++; if(dbg){print "R486", "sw_ez_l_f"}; continue};
 #
 if ( sw_ez_z_f() )
 { l[i]=omo2; r[487]++; if(dbg){print "R487", "sw_ez_z_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[488]++; if(dbg){print "R488", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[489]++; if(dbg){print "R489", "sw_ez_p_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[490]++; if(dbg){print "R490", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[491]++; if(dbg){print "R491", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[492]++; if(dbg){print "R492", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2102 !_#_!
 #  x2102 m2_1sw_ez_r_2gl_poed_	   sw_mn_iv_
for(wrd in omap["x2102"]){omakevars(x2102,"x2102");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="души") {
   if ( w(1,"не") && base(2,"чаять") && s(0,1) )
   { l[i]=omo1; r[493]++; if(dbg){print "R493"}; continue};
   if ( w(1,"в") && q(2,"mest_pr suw_edpr suw_mnpr name_pr_sy") && w(3,"не") && namrk(4,"BF","чаять") && s(0,3) )
   { l[i]=omo1; r[494]++; if(dbg){print "R494"}; continue};
 };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[495]++; if(dbg){print "R495", "gl_poed_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[496]++; if(dbg){print "R496", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[497]++; if(dbg){print "R497", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[498]++; if(dbg){print "R498", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2103 !_#_!
 #  x2103 m2_1sw_ez_t_2nar_spos_   pl_1em_iv_2dprt_ez_  дорогой  доро́гой  дорого́й
for(wrd in omap["x2103"]){omakevars(x2103,"x2103");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( p(-1) && p(0) )
 { l[i]=omo2; r[499]++; if(dbg){print "R499"}; continue};
 if ( (w(-1,"мой наш ваш твой свой")||q(-1,"prl_edmuim") ) && s(-1) )
 { l[i]=omo2; r[500]++; if(dbg){print "R500"}; continue};
 if ( q(1,"titul name_im_sy isname") && s(0) && p(1) )
 { l[i]=omo2; r[501]++; if(dbg){print "R501"}; continue};
 if ( (w(1,"мой наш")||q(1,"titul")) &&
       q(2,"titul name_im_sy isname") && s(0,1) )
 { l[i]=omo2; r[502]++; if(dbg){print "R502"}; continue};
 if ( suw_edim(1) && s(0) && p(1) )
 { l[i]=omo2; r[503]++; if(dbg){print "R503"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo1; r[504]++; if(dbg){print "R504", "sw_ez_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2104 !_#_!
 #  x2104 m2_1sw_mn_iv_2deep_na_   sw_es_r_  моря  моря́  мо́ря
for(wrd in omap["x2104"]){omakevars(x2104,"x2104");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[505]++; if(dbg){print "R505", "sw_es_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[506]++; if(dbg){print "R506", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[507]++; if(dbg){print "R507", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2105 !_#_!
 #  x2105 gl_paedze_    sw_es_r_
for(wrd in omap["x2105"]){omakevars(x2105,"x2105");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[508]++; if(dbg){print "R508", "sw_es_r_f"}; continue};
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; r[509]++; if(dbg){print "R509", "gl_paedze_f"}; continue};
 
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2106 !_#_!
 #  x2106 m2_1sw_mn_iv_2gl_poed_+(sw_ez_r_)      sw_ez_dpr_  мочи  мочи́  мо́чи
for(wrd in omap["x2106"]){omakevars(x2106,"x2106");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qxs(-1,"что","было есть") )
 { l[i]=omo2; r[510]++; if(dbg){print "R510"}; continue};
 if ( qxs(-1,"изо со","всей") )
 { l[i]=omo2; r[511]++; if(dbg){print "R511"}; continue};
 if ( w(1,"нет") && s(0) && p(1) )
 { l[i]=omo2; r[512]++; if(dbg){print "R512"}; continue};
 if ( w(-1,"не") &&
       q(1,"suw_edro suw_mnro") && s(-1,0) )
 { l[i]=omo1; r[513]++; if(dbg){print "R513"}; continue};
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[514]++; if(dbg){print "R514", "gl_poed_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[515]++; if(dbg){print "R515", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[516]++; if(dbg){print "R516", "sw_mn_v_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[517]++; if(dbg){print "R517", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[518]++; if(dbg){print "R518", "sw_ez_p_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[519]++; if(dbg){print "R519", "sw_ez_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2107 !_#_!
 #  x2107 m2_1sw_mn_iv_2pl_ez_i_   sw_es_r_
for(wrd in omap["x2107"]){omakevars(x2107,"x2107");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[520]++; if(dbg){print "R520", "sw_es_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[521]++; if(dbg){print "R521", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[522]++; if(dbg){print "R522", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2108 !_#_!
 #  x2108 m2_1sw_mn_iv_2pl_kr_mn_  sw_ez_r_
for(wrd in omap["x2108"]){omakevars(x2108,"x2108");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[523]++; if(dbg){print "R523", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[524]++; if(dbg){print "R524", "sw_mn_v_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[525]++; if(dbg){print "R525", "sw_ez_r_f"}; continue};
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; r[526]++; if(dbg){print "R526", "pl_krmn_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2109 !_#_!
 #  x2109 m2_1sw_mn_r_2gl_poed_    sw_ez_t_
for(wrd in omap["x2109"]){omakevars(x2109,"x2109");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[527]++; if(dbg){print "R527", "gl_poed_f"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[528]++; if(dbg){print "R528", "sw_ez_t_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo1; r[529]++; if(dbg){print "R529", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2110 !_#_!
 #  x2110 m2_1sw_mn_r_2pl_kr_em_   sw_em_iv_
for(wrd in omap["x2110"]){omakevars(x2110,"x2110");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo1; r[530]++; if(dbg){print "R530", "sw_mn_r_f"}; continue};
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[531]++; if(dbg){print "R531", "pl_kr_em_f"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[532]++; if(dbg){print "R532", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[533]++; if(dbg){print "R533", "sw_em_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2111 !_#_!
 #  x2111 m3_1sw_em_i_2pl_em_iv_3pl_ez_dprt_     sw_ez_t_
for(wrd in omap["x2111"]){omakevars(x2111,"x2111");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[534]++; if(dbg){print "R534", "sw_em_i_f"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[535]++; if(dbg){print "R535", "sw_ez_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2112 !_#_!
 #  x2112 m3_1sw_ez_dpr_2sw_mn_iv_3gl_pamn_	 sw_ez_l_   да'ли дали'
for(wrd in omap["x2112"]){omakevars(x2112,"x2112");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"в") && (-1) )
 { l[i]=omo2; r[536]++; if(dbg){print "R536"}; continue};
 #
 if ( w(-2,"в") &&
       q(-1,"prl_edpr") && s(-2,-1) )
 { l[i]=omo2; r[537]++; if(dbg){print "R537"}; continue};
 #
 if ( name_any_sy(0) )
 { l[i]=omo2; r[538]++; if(dbg){print "R538"}; continue};
 #
 l[i]=omo1; r[539]++; if(dbg){print "R539"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2113 !_#_!
 #  x2113 mest_d_       sw_ez_v_   кому +дефис
for(wrd in omap["x2113"]){omakevars(x2113,"x2113");for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( s1(0,"-") && w(1,"то либо нибудь никому") )
 { l[i]=gensub(/(.)$/,"\\1\xcc\x81",1,l[i]); sep[i]=gensub(/-/,"-\xcc\xa0",1,sep[i]); r[540]++; if(dbg){print "R540"}; continue};
 if ( s1(-1,"-") && w(-1,"кое") )
 { l[i]=gensub(/(.)$/,"\\1\xcc\x81",1,l[i]); r[541]++; if(dbg){print "R541"}; continue};
 if ( sc(0,"?") )
 { l[i]=omo1; r[542]++; if(dbg){print "R542"}; continue};

 #
 if ( w(-1,"в") && s(-1) )
 { l[i]=omo2; r[543]++; if(dbg){print "R543"}; continue};
 if ( q(-1,"prl_edzevi prq_edzevi mest_edzevi") && s(-1) )
 { l[i]=omo2; r[544]++; if(dbg){print "R544"}; continue};

 # всё остальное 
 l[i]=omo1; r[545]++; if(dbg){print "R545"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2114 !_#_!
 #  x2114 mezd_	        sw_mn_p_
for(wrd in omap["x2114"]){omakevars(x2114,"x2114");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_p_f() )
 { l[i]=omo2; r[546]++; if(dbg){print "R546", "sw_mn_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2115 !_#_!
 #  x2115 nar_pre_combo_  sw_1ez_r_2mn_iv_
for(wrd in omap["x2115"]){omakevars(x2115,"x2115");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[547]++; if(dbg){print "R547", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[548]++; if(dbg){print "R548", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[549]++; if(dbg){print "R549", "sw_mn_v_f"}; continue};

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
 { l[i]=omo2; r[550]++; if(dbg){print "R550", "sw_em_d_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2118 !_#_!
 #  x2118 nar_spos_     sw_em_t_
for(wrd in omap["x2118"]){omakevars(x2118,"x2118");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[551]++; if(dbg){print "R551", "sw_em_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2119 !_#_!
 #  x2119 nar_vrem_     pl_ez_dprt_
for(wrd in omap["x2119"]){omakevars(x2119,"x2119");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2120 !_#_!
 #  x2120 nar_vrem_     sw_em_t_   потом  пото́м  по́том
for(wrd in omap["x2120"]){omakevars(x2120,"x2120");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="истекать пахнуть пропахнуть вонять провонять провоняться пропитать пропитаться пропитывать пропитываться обливаться"
 if ( base(-1,cst) && q(-1,"gl_ed gl_mn gl_vzmn deep prq_any") && s(-1) )
 { l[i]=omo2; r[552]++; if(dbg){print "R552"}; continue};
 if ( base(-1,cst) && prq_any(-1) && s(-1) )
 { l[i]=omo2; r[553]++; if(dbg){print "R553"}; continue};
 if ( p(-2) &&
       w(-1,"а и но однако") && s(-1) )
 { l[i]=omo1; r[554]++; if(dbg){print "R554"}; continue};
 if ( p(-1) )
 { l[i]=omo1; r[555]++; if(dbg){print "R555"}; continue};
 if ( qxs(1,"и","кровью") )
 { l[i]=omo2; r[556]++; if(dbg){print "R556"}; continue};

 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[557]++; if(dbg){print "R557", "sw_em_t_f"}; continue};
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
 { l[i]=omo1; r[558]++; if(dbg){print "R558"}; continue};
 if ( w(-3,"не") &&
       (q(-2,"gl_ed gl_in gl_mn gl_poed gl_pomn deep")||w(-2,"нет")) &&
         w(-1,"и никакого") && s(-3,-1) )
 { l[i]=omo1; d[30]++; if(dbg){print "D30"}; continue };
 #
  l[i]=omo2; r[559]++; if(dbg){print "R559"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2123 !_#_!
 #  x2123 phrase_       sw_em_vr_    < хера хрена >
for(wrd in omap["x2123"]){omakevars(x2123,"x2123");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"ни на") && s(-1) )
 { l[i]=omo1; r[560]++; if(dbg){print "R560"}; continue};
 if ( w(-1,"с") && w(1,"ли") s(-1,0) )
 { l[i]=omo1; r[561]++; if(dbg){print "R561"}; continue};
 #
 l[i]=omo2; r[562]++; if(dbg){print "R562"}; continue;
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2124 !_#_!
 #  x2124 phrase_		sw_mn_iv_
for(wrd in omap["x2124"]){omakevars(x2124,"x2124");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[563]++; if(dbg){print "R563", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[564]++; if(dbg){print "R564", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2125 !_#_!
 #  x2125 pl_1em_iv_2ez_dprt_    sw_ez_t_
for(wrd in omap["x2125"]){omakevars(x2125,"x2125");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(-1,"-") )
 { l[i]=omo1; r[565]++; if(dbg){print "R565"}; continue};
 if ( q(1,"suw_edzeda suw_edzero suw_edzetv suw_edzepr suw_edmuim suw_edmuvi") && s(0) )
 { l[i]=omo1; r[566]++; if(dbg){print "R566"}; continue};

 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[567]++; if(dbg){print "R567", "sw_ez_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2126 !_#_!
 #  x2126 pl_em_iv_		sw_mn_r_
for(wrd in omap["x2126"]){omakevars(x2126,"x2126");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[568]++; if(dbg){print "R568", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2127 !_#_!
 #  x2127 pl_em_iv_		sw_mn_vr_
for(wrd in omap["x2127"]){omakevars(x2127,"x2127");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[569]++; if(dbg){print "R569", "sw_mn_v_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[570]++; if(dbg){print "R570", "sw_mn_r_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2128 !_#_!
 #  x2128 pl_em_p_		sw_em_t_
for(wrd in omap["x2128"]){omakevars(x2128,"x2128");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[571]++; if(dbg){print "R571", "sw_em_p_f"}; continue};
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[572]++; if(dbg){print "R572", "sw_em_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2129 !_#_!
 #  x2129 pl_ems_d_		sw_em_d_
for(wrd in omap["x2129"]){omakevars(x2129,"x2129");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[573]++; if(dbg){print "R573", "sw_em_d_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2130 !_#_!
 #  x2130 pl_ems_p_		sw_em_iv_
for(wrd in omap["x2130"]){omakevars(x2130,"x2130");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; r[574]++; if(dbg){print "R574", "pl_em_p_f()||pl_es_p_f"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[575]++; if(dbg){print "R575", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[576]++; if(dbg){print "R576", "sw_em_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2131 !_#_!
 #  x2131 pl_ems_p_		sw_ems_t_
for(wrd in omap["x2131"]){omakevars(x2131,"x2131");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; r[577]++; if(dbg){print "R577", "pl_em_p_f()||pl_es_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2132 !_#_!
 #  x2132 pl_ems_p_		sw_em_t_
for(wrd in omap["x2132"]){omakevars(x2132,"x2132");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; r[578]++; if(dbg){print "R578", "pl_em_p_f()||pl_es_p_f"}; continue};
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[579]++; if(dbg){print "R579", "sw_em_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2133 !_#_!
 #  x2133 pl_ems_p_		sw_es_t_
for(wrd in omap["x2133"]){omakevars(x2133,"x2133");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; r[580]++; if(dbg){print "R580", "pl_em_p_f()||pl_es_p_f"}; continue};
 #
 if ( sw_es_t_f() )
 { l[i]=omo2; r[581]++; if(dbg){print "R581", "sw_es_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2134 !_#_!
 #  x2134 pl_ems_t_		sw_em_t_
for(wrd in omap["x2134"]){omakevars(x2134,"x2134");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[582]++; if(dbg){print "R582", "sw_em_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2135 !_#_!
 #  x2135 pl_es_iv_		pl_srav_
for(wrd in omap["x2135"]){omakevars(x2135,"x2135");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_srav_f() )
 { l[i]=omo2; r[583]++; if(dbg){print "R583", "pl_srav_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2136 !_#_!
 #  x2136 pl_ez_dprt_   sw_1em_iv_2ez_t_
for(wrd in omap["x2136"]){omakevars(x2136,"x2136");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[584]++; if(dbg){print "R584", "sw_ez_t_f"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[585]++; if(dbg){print "R585", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[586]++; if(dbg){print "R586", "sw_em_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2137 !_#_!
 #  x2137 pl_ez_dprt_   sw_ez_t_
for(wrd in omap["x2137"]){omakevars(x2137,"x2137");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[587]++; if(dbg){print "R587", "sw_ez_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2138 !_#_!
 #  x2138 pl_ez_dprt_   sw_mn_r_
for(wrd in omap["x2138"]){omakevars(x2138,"x2138");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[588]++; if(dbg){print "R588", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2139 !_#_!
 #  x2139 pl_ez_i_		sw_1es_r_2mn_iv_
for(wrd in omap["x2139"]){omakevars(x2139,"x2139");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[589]++; if(dbg){print "R589", "sw_es_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[590]++; if(dbg){print "R590", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[591]++; if(dbg){print "R591", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2140 !_#_!
 #  x2140 pl_ez_i_		sw_es_r_
for(wrd in omap["x2140"]){omakevars(x2140,"x2140");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[592]++; if(dbg){print "R592", "sw_es_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2141 !_#_!
 #  x2141 pl_ez_i_		sw_mn_i_
for(wrd in omap["x2141"]){omakevars(x2141,"x2141");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[593]++; if(dbg){print "R593", "sw_mn_i_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2142 !_#_!
 #  x2142 pl_ez_t_		sw_1em_d_2ez_t_
for(wrd in omap["x2142"]){omakevars(x2142,"x2142");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[594]++; if(dbg){print "R594", "sw_em_d_f"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[595]++; if(dbg){print "R595", "sw_ez_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2143 !_#_!
 #  x2143 pl_ez_v_		sw_es_d_
for(wrd in omap["x2143"]){omakevars(x2143,"x2143");for(y=1;y<=wln;y++)         # header1
 #
 if ( pl_ez_v_f() )
 { l[i]=omo1; r[596]++; if(dbg){print "R596", "pl_ez_v_f"}; continue};
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; r[597]++; if(dbg){print "R597", "sw_es_d_f"}; continue};
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2144 !_#_!
 #  x2144 pl_kr_em_		sw_em_i_
for(wrd in omap["x2144"]){omakevars(x2144,"x2144");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[598]++; if(dbg){print "R598", "pl_kr_em_f"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[599]++; if(dbg){print "R599", "sw_em_i_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2145 !_#_!
 #  x2145 pl_kr_em_		sw_em_iv_
for(wrd in omap["x2145"]){omakevars(x2145,"x2145");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[600]++; if(dbg){print "R600", "pl_kr_em_f"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[601]++; if(dbg){print "R601", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[602]++; if(dbg){print "R602", "sw_em_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2146 !_#_!
 #  x2146 pl_kr_em_		sw_em_t_  знаком  знако́м  зна́ком
for(wrd in omap["x2146"]){omakevars(x2146,"x2146");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pre_tv(-2) &&
       q(-1,"mest_tv suw_edtv suw_mntv") && s(-2,-1) )
 { l[i]=omo1; r[603]++; if(dbg){print "R603", "pl_kr_em_f"}; continue};
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[604]++; if(dbg){print "R604", "sw_em_t_f"}; continue};
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[605]++; if(dbg){print "R605", "pl_kr_em_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2147 !_#_!
 #  x2147 pl_kr_em_		sw_mn_r_
for(wrd in omap["x2147"]){omakevars(x2147,"x2147");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[606]++; if(dbg){print "R606", "pl_kr_em_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[607]++; if(dbg){print "R607", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2148 !_#_!
 #  x2148 pl_kr_em_		sw_mn_vr_ готов  гото́в  го́тов
for(wrd in omap["x2148"]){omakevars(x2148,"x2148");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( bb(-5,-1,"быть") && s(bbn,-1) )
 { l[i]=omo1; r[608]++; if(dbg){print "R608"}; continue};
 if ( qf(1,3,"gl_in") && s(0,qfn-1) )
 { l[i]=omo1; r[609]++; if(dbg){print "R609"}; continue};
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[610]++; if(dbg){print "R610", "pl_kr_em_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[611]++; if(dbg){print "R611", "sw_mn_v_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[612]++; if(dbg){print "R612", "sw_mn_r_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2149 !_#_!
 #  x2149 pl_kr_es_		sw_es_iv_
for(wrd in omap["x2149"]){omakevars(x2149,"x2149");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="добро") {
   if ( w(1,"пожаловать") && s(0) )
   { l[i]=omo2; r[613]++; if(dbg){print "R613"}; continue};
 };

 #
 if ( sw_es_i_f() )
 { l[i]=omo2; r[614]++; if(dbg){print "R614", "sw_es_i_f"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; r[615]++; if(dbg){print "R615", "sw_es_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2150 !_#_!
 #  x2150 pl_kr_ez_		sw_1es_r_2mn_iv_
for(wrd in omap["x2150"]){omakevars(x2150,"x2150");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[616]++; if(dbg){print "R616", "sw_es_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[617]++; if(dbg){print "R617", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[618]++; if(dbg){print "R618", "sw_mn_v_f"}; continue};
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; r[619]++; if(dbg){print "R619", "pl_kr_ez_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2151 !_#_!
 #  x2151 pl_kr_ez_		sw_em_r_
for(wrd in omap["x2151"]){omakevars(x2151,"x2151");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[620]++; if(dbg){print "R620", "sw_em_r_f"}; continue};
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; r[621]++; if(dbg){print "R621", "pl_kr_ez_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2152 !_#_!
 #  x2152 pl_kr_ez_		sw_em_vr_
for(wrd in omap["x2152"]){omakevars(x2152,"x2152");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[622]++; if(dbg){print "R622", "sw_em_v_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[623]++; if(dbg){print "R623", "sw_em_r_f"}; continue};
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; r[624]++; if(dbg){print "R624", "pl_kr_ez_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2153 !_#_!
 #  x2153 pl_kr_ez_		sw_es_r_
for(wrd in omap["x2153"]){omakevars(x2153,"x2153");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[625]++; if(dbg){print "R625", "sw_es_r_f"}; continue};
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; r[626]++; if(dbg){print "R626", "pl_kr_ez_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2154 !_#_!
 #  x2154 pl_kr_ez_		sw_ez_i_
for(wrd in omap["x2154"]){omakevars(x2154,"x2154");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[627]++; if(dbg){print "R627", "sw_ez_i_f"}; continue};
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; r[628]++; if(dbg){print "R628", "pl_kr_ez_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2155 !_#_!
 #  x2155 pl_kr_mn_		sw_1ez_r_2mn_iv_  дороги  дороги́  дороги́
for(wrd in omap["x2155"]){omakevars(x2155,"x2155");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; r[629]++; if(dbg){print "R629", "pl_krmn_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[630]++; if(dbg){print "R630", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[631]++; if(dbg){print "R631", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[632]++; if(dbg){print "R632", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2156 !_#_!
 #  x2156 pl_kr_mn_		sw_ez_r_
for(wrd in omap["x2156"]){omakevars(x2156,"x2156");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[633]++; if(dbg){print "R633", "sw_ez_r_f"}; continue};
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; r[634]++; if(dbg){print "R634", "pl_krmn_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2157 !_#_!
 #  x2157 pl_kr_mn_		sw_mn_i_
for(wrd in omap["x2157"]){omakevars(x2157,"x2157");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[635]++; if(dbg){print "R635", "sw_mn_i_f"}; continue};
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; r[636]++; if(dbg){print "R636", "pl_krmn_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2158 !_#_!
 #  x2158 pl_kr_mn_		sw_mn_iv_
for(wrd in omap["x2158"]){omakevars(x2158,"x2158");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; r[637]++; if(dbg){print "R637", "pl_krmn_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[638]++; if(dbg){print "R638", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[639]++; if(dbg){print "R639", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2159 !_#_!
 #  x2159 pl_srav_		sw_1ez_t_2mn_r_
for(wrd in omap["x2159"]){omakevars(x2159,"x2159");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_srav_f() )
 { l[i]=omo1; r[640]++; if(dbg){print "R640", "pl_srav_f"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[641]++; if(dbg){print "R641", "sw_ez_t_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[642]++; if(dbg){print "R642", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2160 !_#_!
 #  x2160 pl_srav_		sw_em_p_
for(wrd in omap["x2160"]){omakevars(x2160,"x2160");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_srav_f() )
 { l[i]=omo1; r[643]++; if(dbg){print "R643", "pl_srav_f"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; r[644]++; if(dbg){print "R644", "sw_em_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2161 !_#_!
 #  x2161 pl_srav_		sw_ez_t_
for(wrd in omap["x2161"]){omakevars(x2161,"x2161");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_srav_f() )
 { l[i]=omo1; r[645]++; if(dbg){print "R645", "pl_srav_f"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[646]++; if(dbg){print "R646", "sw_ez_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2162 !_#_!
 #  x2162 pl_srav_		sw_mn_r_
for(wrd in omap["x2162"]){omakevars(x2162,"x2162");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_srav_f() )
 { l[i]=omo1; r[647]++; if(dbg){print "R647", "pl_srav_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[648]++; if(dbg){print "R648", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2163 !_#_!
 #  x2163 pq_ems_p_		sw_em_t_
for(wrd in omap["x2163"]){omakevars(x2163,"x2163");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[649]++; if(dbg){print "R649", "sw_em_t_f"}; continue};
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
 { l[i]=omo2; r[650]++; if(dbg){print "R650", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[651]++; if(dbg){print "R651", "sw_em_v_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[652]++; if(dbg){print "R652", "sw_mn_v_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[653]++; if(dbg){print "R653", "sw_mn_r_f"}; continue};
 #
 if ( pq_kr_em_f() )
 { l[i]=omo1; r[654]++; if(dbg){print "R654", "pq_kr_em_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2166 !_#_!
 #  x2166 pq_kr_em_		sw_em_iv_
for(wrd in omap["x2166"]){omakevars(x2166,"x2166");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pq_kr_em_f() )
 { l[i]=omo1; r[655]++; if(dbg){print "R655", "pq_kr_em_f"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[656]++; if(dbg){print "R656", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[657]++; if(dbg){print "R657", "sw_em_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2167 !_#_!
 #  x2167 pq_kr_em_		sw_mn_r_
for(wrd in omap["x2167"]){omakevars(x2167,"x2167");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pq_kr_em_f() )
 { l[i]=omo1; r[658]++; if(dbg){print "R658", "pq_kr_em_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[659]++; if(dbg){print "R659", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2168 !_#_!
 #  x2168 pq_kr_ez_		sw_em_r_
for(wrd in omap["x2168"]){omakevars(x2168,"x2168");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; r[660]++; if(dbg){print "R660", "pl_kr_ez_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[661]++; if(dbg){print "R661", "sw_em_r_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2169 !_#_!
 #  x2169 pq_kr_ez_		sw_ez_i_
for(wrd in omap["x2169"]){omakevars(x2169,"x2169");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; r[662]++; if(dbg){print "R662", "pl_kr_ez_f"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[663]++; if(dbg){print "R663", "sw_ez_i_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2170 !_#_!
 #  x2170 pq_kr_mn_		sw_1ez_r_2mn_i_
for(wrd in omap["x2170"]){omakevars(x2170,"x2170");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[664]++; if(dbg){print "R664", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[665]++; if(dbg){print "R665", "sw_mn_i_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2171 !_#_!
 #  x2171 pq_kr_mn_		sw_1ez_r_2mn_iv_
for(wrd in omap["x2171"]){omakevars(x2171,"x2171");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[666]++; if(dbg){print "R666", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[667]++; if(dbg){print "R667", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[668]++; if(dbg){print "R668", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2172 !_#_!
 #  x2172 pq_kr_mn_		sw_mn_iv_
for(wrd in omap["x2172"]){omakevars(x2172,"x2172");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[669]++; if(dbg){print "R669", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[670]++; if(dbg){print "R670", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2173 !_#_!
 #  x2173 pre_combo_     sw_mn_d_
for(wrd in omap["x2173"]){omakevars(x2173,"x2173");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"Yco") && s(-1) && p(0) )
 { l[i]=omo1; r[671]++; if(dbg){print "R671", "sw_mn_d_f"}; continue};
 #
 if ( sw_mn_d_f() )
 { l[i]=omo2; r[672]++; if(dbg){print "R672", "sw_mn_d_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2174 !_#_!
 #  x2174 predik_		sw_ez_dp_
for(wrd in omap["x2174"]){omakevars(x2174,"x2174");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[673]++; if(dbg){print "R673", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[674]++; if(dbg){print "R674", "sw_ez_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2175 !_#_!
 #  x2175 pred_tv_		sw_em_iv_   пере́д    перёд
for(wrd in omap["x2175"]){omakevars(x2175,"x2175");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( name_tv_sy(1) && s(0) )
 { l[i]=omo1; r[675]++; if(dbg){print "R675"}; continue};
 if ( isname(1) && wc(1,"им$ ом$ ой$ ами$ ими$ ыми$") && s(0) )
 { l[i]=omo1; r[676]++; if(dbg){print "R676"}; continue};
 if ( isname(1) &&
       isname(2) && wc(2,"им$ ом$ ой$ ами$ ими$ ыми$") && s(0,1) )
 { l[i]=omo1; r[677]++; if(dbg){print "R677"}; continue};
 
 #
 if ( q(1,"prl_edtv prl_mntv prq_edtv prq_mntv mest_tv mest_mn mest_3e") &&
       q(2,"suw_edtv suw_mntv prl_edtv prl_mntv prq_edtv prq_mntv mest_tv") && s(0,1) )
 { l[i]=omo1; r[678]++; if(dbg){print "R678"}; continue};
 if ( q(1,"suw_edtv suw_mntv prl_edtv prl_mntv mest_tv") && s(0) )
 { l[i]=omo1; r[679]++; if(dbg){print "R679"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[680]++; if(dbg){print "R680", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[681]++; if(dbg){print "R681", "sw_em_v_f"}; continue};
 
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2176 !_#_!
 #  x2176 qast_		sw_es_p_
for(wrd in omap["x2176"]){omakevars(x2176,"x2176");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; r[682]++; if(dbg){print "R682", "sw_es_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2177 !_#_!
 #  x2177 qip_ez_dprt_		sw_ez_t_    пятой  пя́той  пято́й
for(wrd in omap["x2177"]){omakevars(x2177,"x2177");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pre_pr(-2) &&
       q(-1,"prl_edzepr qik_im") &&
        q(1,"suw_edzepr") && s(-2,0) )
 { l[i]=omo1; r[683]++; if(dbg){print "R683"}; continue};
 if ( pre_pr(-1) &&
       q(1,"suw_edzepr suw_edzene") && s(-1,0) )
 { l[i]=omo1; r[684]++; if(dbg){print "R684"}; continue};
 if ( pre_pr(-1) && s(-1) && (p(0)||q_w(1,"pre_any")) )
 { l[i]=omo1; r[685]++; if(dbg){print "R685"}; continue};
 if ( q(-1,"qik_im") && s(-1) )
 { l[i]=omo1; r[686]++; if(dbg){print "R686"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[687]++; if(dbg){print "R687", "sw_ez_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2178 !_#_!
 #  x2178 sw_1em_d_2ez_v_		sw_em_l_
for(wrd in omap["x2178"]){omakevars(x2178,"x2178");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if(iwrd=="ладу") {
   if ( w(-1,"в") && s(-1) )
   { l[i]=omo2; r[688]++; if(dbg){print "R688"}; continue};
 };
 if(iwrd=="пару") {
   if ( q(1,"suw_edne") && s(0) )
   { l[i]=omo1; r[689]++; if(dbg){print "R689"}; continue};
 };
 #
 if ( suw_mnro(1) && s(0) )
 { l[i]=omo1; r[690]++; if(dbg){print "R690"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[691]++; if(dbg){print "R691", "sw_em_d_f"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; r[692]++; if(dbg){print "R692", "sw_ez_v_f"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; r[693]++; if(dbg){print "R693", "sw_em_l_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2179 !_#_!
 #  x2179 sw_1em_d_2ez_v_		sw_es_n_
for(wrd in omap["x2179"]){omakevars(x2179,"x2179");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[694]++; if(dbg){print "R694", "sw_em_d_f"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; r[695]++; if(dbg){print "R695", "sw_ez_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2180 !_#_!
 #  x2180 sw_1em_l_2ez_v_		sw_em_d_
for(wrd in omap["x2180"]){omakevars(x2180,"x2180");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="полу") {
   if ( sc(0,"-") )
   { l[i]=omo2; r[696]++; if(dbg){print "R696"}; continue};
   if ( w(-1,"до по с") && s(-1) )
   { l[i]=omo2; r[697]++; if(dbg){print "R697"}; continue};
 };
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; r[698]++; if(dbg){print "R698", "sw_em_l_f"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[699]++; if(dbg){print "R699", "sw_em_d_f"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; r[700]++; if(dbg){print "R700", "sw_ez_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2181 !_#_!
 #  x2181 sw_1em_l_2ez_v_		sw_em_dz_
for(wrd in omap["x2181"]){omakevars(x2181,"x2181");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"с") && s(-1) )
 { l[i]=omo2; r[701]++; if(dbg){print "R701", "sw_em_z_f"}; continue};
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; r[702]++; if(dbg){print "R702", "sw_em_z_f"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[703]++; if(dbg){print "R703", "sw_em_d_f"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; r[704]++; if(dbg){print "R704", "sw_em_l_f"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; r[705]++; if(dbg){print "R705", "sw_ez_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2182 !_#_!
 #  x2182 sw_1em_p_2es_ivp_		sw_ez_dp_
for(wrd in omap["x2182"]){omakevars(x2182,"x2182");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo1; r[706]++; if(dbg){print "R706", "sw_es_i_f"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo1; r[707]++; if(dbg){print "R707", "sw_es_v_f"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[708]++; if(dbg){print "R708", "sw_em_p_f"}; continue};
 #
 if ( sw_es_p_f() )
 { l[i]=omo1; r[709]++; if(dbg){print "R709", "sw_es_p_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[710]++; if(dbg){print "R710", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[711]++; if(dbg){print "R711", "sw_ez_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2183 !_#_!
 #  x2183 sw_1em_p_2ez_dp_		sw_es_n_
for(wrd in omap["x2183"]){omakevars(x2183,"x2183");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[712]++; if(dbg){print "R712", "sw_em_p_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; r[713]++; if(dbg){print "R713", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo1; r[714]++; if(dbg){print "R714", "sw_ez_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2184 !_#_!
 #  x2184 sw_1em_p_2ez_d_		sw_ez_p_
for(wrd in omap["x2184"]){omakevars(x2184,"x2184");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[715]++; if(dbg){print "R715", "sw_em_p_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; r[716]++; if(dbg){print "R716", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[717]++; if(dbg){print "R717", "sw_ez_p_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2185 !_#_!
 #  x2185 sw_1em_r_2ez_i_		sw_mn_iv_
for(wrd in omap["x2185"]){omakevars(x2185,"x2185");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; r[718]++; if(dbg){print "R718", "sw_ez_i_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[719]++; if(dbg){print "R719", "sw_em_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[720]++; if(dbg){print "R720", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[721]++; if(dbg){print "R721", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2186 !_#_!
 #  x2186 sw_1em_r_2phrase_		sw_mn_i_
for(wrd in omap["x2186"]){omakevars(x2186,"x2186");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[722]++; if(dbg){print "R722", "sw_em_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[723]++; if(dbg){print "R723", "sw_mn_i_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2187 !_#_!
 #  x2187 sw_1ems_d_2ez_v_		sw_em_l_  миру  ми́ру  миру́
for(wrd in omap["x2187"]){omakevars(x2187,"x2187");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_l_f() && wmark("Yme",lc(-1)) )
 { l[i]=omo2; r[724]++; if(dbg){print "R724"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[725]++; if(dbg){print "R725", "sw_em_d_f"}; continue};
 #
 if ( sw_es_d_f() )
 { l[i]=omo1; r[726]++; if(dbg){print "R726", "sw_es_d_f"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; r[727]++; if(dbg){print "R727", "sw_ez_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2188 !_#_!
 #  x2188 sw_1ems_n_2ez_r_	sw_mn_iv_   виски  ви́ски  виски́
for(wrd in omap["x2188"]){omakevars(x2188,"x2188");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1

 if ( q(-3,"gl_peed gl_pemn deep_pe") &&
       q(-2,"mest_vi suw_odedvi suw_odmnvi") &&
        pre_vi(-1) && s(-3,-1) )
 { l[i]=omo2; r[728]++; if(dbg){print "R728"}; continue};
 if ( p(-1) && p(0) )
 { l[i]=omo1; r[729]++; if(dbg){print "R729"}; continue};
 if ( idb(-5,"gl4whisky") && s(idn,-1) )
 { l[i]=omo1; r[730]++; if(dbg){print "R730"}; continue};
 if ( idf(5,"sw4whisky") &&
       pre_tv(1) && s(0,idn-1) )
 { l[i]=omo1; r[731]++; if(dbg){print "R731"}; continue};

 if ( idb(-5,"gl4viski") && s(idn,-1) )
 { l[i]=omo2; r[732]++; if(dbg){print "R732"}; continue};
 if ( idf(5,"gl4viski") && s(0,idn-1) )
 { l[i]=omo2; r[733]++; if(dbg){print "R733"}; continue};
 if ( q(1,"gl_vzmn") && s(0) )
 { l[i]=omo2; r[734]++; if(dbg){print "R734"}; continue};
#if ( idf(5,"sw4viski") && s(0,idn) )
#{ l[i]=omo2; r[735]++; if(dbg){print "R735"}; continue};
#if ( idb(-5,"pl4viski") && s(0,idn) )
#{ l[i]=omo2; r[736]++; if(dbg){print "R736"}; continue};

 #
 if ( sw_es_z_f()||sw_em_i_f()||sw_es_i_f()||sw_em_v_f()||sw_es_v_f()||sw_em_r_f()||sw_es_r_f()||
      sw_em_d_f()||sw_es_d_f()||sw_em_t_f()||sw_es_t_f()||sw_em_p_f()||sw_es_p_f()||sw_ez_r_f() )
 { l[i]=omo1; r[737]++; if(dbg){print "R737"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[738]++; if(dbg){print "R738", "sw_mn_i_f"}; continue};
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[739]++; if(dbg){print "R739", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2189 !_#_!
 #  x2189 sw_1em_vr_2ez_i_		sw_mn_iv_
for(wrd in omap["x2189"]){omakevars(x2189,"x2189");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; r[740]++; if(dbg){print "R740", "sw_ez_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[741]++; if(dbg){print "R741", "sw_em_v_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[742]++; if(dbg){print "R742", "sw_em_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[743]++; if(dbg){print "R743", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[744]++; if(dbg){print "R744", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2190 !_#_!
 #  x2190 sw_emz_r_		sw_mn_iv_  главы головы  главы́ головы́  гла́вы го́ловы
for(wrd in omap["x2190"]){omakevars(x2190,"x2190");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[745]++; if(dbg){print "R745", "sw_em_r_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[747]++; if(dbg){print "R747", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[748]++; if(dbg){print "R748", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2191 !_#_!
 #  x2191 sw_1es_n_2ez_r_		sw_mn_iv_
for(wrd in omap["x2191"]){omakevars(x2191,"x2191");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_z_f()||sw_es_i_f()||sw_es_v_f()||sw_es_r_f()||sw_es_d_f()||sw_es_t_f()||sw_es_p_f()||sw_ez_r_f() )
 { l[i]=omo1; r[749]++; if(dbg){print "R749", "sw_es_z_f()||sw_es_i_f()||sw_es_v_f()||sw_es_r_f()||sw_es_d_f()||sw_es_t_f()||sw_es_p_f()||sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[750]++; if(dbg){print "R750", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[751]++; if(dbg){print "R751", "sw_mn_v_f"}; continue};


 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2192 !_#_!
 #  x2192 sw_1es_rz_2mn_iv_		sw_ez_i_
for(wrd in omap["x2192"]){omakevars(x2192,"x2192");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[752]++; if(dbg){print "R752", "sw_ez_i_f"}; continue};
 #
 if ( sw_es_z_f() )
 { l[i]=omo1; r[753]++; if(dbg){print "R753", "sw_es_z_f"}; continue};
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; r[754]++; if(dbg){print "R754", "sw_es_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[755]++; if(dbg){print "R755", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[756]++; if(dbg){print "R756", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2193 !_#_!
 #  x2193 sw_1ez_dp_2mn_iv_		sw_ez_rl_
for(wrd in omap["x2193"]){omakevars(x2193,"x2193");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[757]++; if(dbg){print "R757", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[758]++; if(dbg){print "R758", "sw_ez_p_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[759]++; if(dbg){print "R759", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[760]++; if(dbg){print "R760", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2194 !_#_!
 #  x2194 sw_1ez_dpr_2mn_iv_	        sw_ez_l_
for(wrd in omap["x2194"]){omakevars(x2194,"x2194");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="связи") {
   if ( w(-1,"в") && w(1,"с") && s(-1,0) )
   { l[i]=omo2; r[761]++; if(dbg){print "R761"}; continue}
   else
   { l[i]=omo1; r[762]++; if(dbg){print "R762"}; continue};
 };
 #
 if ( sw_ez_l_f() )
 { l[i]=omo2; r[763]++; if(dbg){print "R763", "sw_ez_l_f"}; continue};

 #
 l[i]=omo1; r[764]++; if(dbg){print "R764"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2195 !_#_!
 #  x2195 sw_1ez_dr_2mn_iv_		sw_ez_p_
for(wrd in omap["x2195"]){omakevars(x2195,"x2195");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[765]++; if(dbg){print "R765", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[766]++; if(dbg){print "R766", "sw_mn_v_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[767]++; if(dbg){print "R767", "sw_ez_p_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2196 !_#_!
 #  x2196 sw_1ez_drp_2mn_iv_		sw_ez_l_
for(wrd in omap["x2196"]){omakevars(x2196,"x2196");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_l_f() )
 { l[i]=omo2; r[768]++; if(dbg){print "R768", "sw_ez_l_f"}; continue};

 #
 l[i]=omo1; r[769]++; if(dbg){print "R769"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2197 !_#_!
 #  x2197 sw_1ez_i_2mn_iv_		sw_em_r_
for(wrd in omap["x2197"]){omakevars(x2197,"x2197");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[770]++; if(dbg){print "R770", "sw_em_r_f"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; r[771]++; if(dbg){print "R771", "sw_ez_i_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[772]++; if(dbg){print "R772", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[773]++; if(dbg){print "R773", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2198 !_#_!
 #  x2198 sw_1ez_i_2mn_iv_		sw_es_r_
for(wrd in omap["x2198"]){omakevars(x2198,"x2198");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[774]++; if(dbg){print "R774", "sw_es_r_f"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; r[775]++; if(dbg){print "R775", "sw_ez_i_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[776]++; if(dbg){print "R776", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[777]++; if(dbg){print "R777", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2199 !_#_!
 #  x2199 sw_1ez_p_2mn_iv_		sw_ez_drl_  груди  гру́ди  груди́
for(wrd in omap["x2199"]){omakevars(x2199,"x2199");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"его") && s(-1) )
 { l[i]=omo2; r[778]++; if(dbg){print "R778"}; continue};
 #
 if ( sw_ez_l_f() )
 { l[i]=omo2; r[779]++; if(dbg){print "R779", "sw_ez_l_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[780]++; if(dbg){print "R780", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[781]++; if(dbg){print "R781", "sw_ez_r_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo1; r[782]++; if(dbg){print "R782", "sw_ez_p_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[783]++; if(dbg){print "R783", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[784]++; if(dbg){print "R784", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2200 !_#_!
 #  x2200 sw_1mn_r_2pl_kr_em_		sw_em_iv_
for(wrd in omap["x2200"]){omakevars(x2200,"x2200");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[785]++; if(dbg){print "R785", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[786]++; if(dbg){print "R786", "sw_em_v_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo1; r[787]++; if(dbg){print "R787", "sw_mn_r_f"}; continue};
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[788]++; if(dbg){print "R788", "pl_kr_em_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2201 !_#_!
 #  x2201 sw_em_iv_		sw_mn_d_
for(wrd in omap["x2201"]){omakevars(x2201,"x2201");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_d_f() )
 { l[i]=omo2; r[789]++; if(dbg){print "R789", "sw_mn_d_f"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[790]++; if(dbg){print "R790", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[791]++; if(dbg){print "R791", "sw_em_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2202 !_#_!
 #  x2202 sw_em_dl_		sw_ez_v_
for(wrd in omap["x2202"]){omakevars(x2202,"x2202");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[792]++; if(dbg){print "R792", "sw_ez_v_f"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[793]++; if(dbg){print "R793", "sw_em_d_f"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; r[794]++; if(dbg){print "R794", "sw_em_l_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2203 !_#_!
 #  x2203 sw_em_dp_		sw_em_l_
for(wrd in omap["x2203"]){omakevars(x2203,"x2203");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"Ykl") && notsym(-1,unxy) && s(-1) )
 { l[i-1]=gensub(/([АЕЁИОУЫЭЮЯаеёиоуыэюя])/,"\\1\xcc\x81",1,l[i-1]); l[i]=gensub(/^(.)/,"\xcc\xa0\\1\xcc\xad",1,l[i]); r[795]++; if(dbg){print "R795"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; r[796]++; if(dbg){print "R796", "sw_em_l_f"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[797]++; if(dbg){print "R797", "sw_em_d_f"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[798]++; if(dbg){print "R798", "sw_em_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2204 !_#_!
 #  x2204 sw_em_dr_		sw_em_l_
for(wrd in omap["x2204"]){omakevars(x2204,"x2204");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"Ykl") && notsym(-1,unxy) && s(-1) )
 { l[i-1]=gensub(/([АЕЁИОУЫЭЮЯаеёиоуыэюя])/,"\\1\xcc\x81",1,l[i-1]); l[i]=gensub(/^(.)/,"\xcc\xa0\\1\xcc\xad",1,l[i]); r[799]++; if(dbg){print "R799"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; r[800]++; if(dbg){print "R800", "sw_em_l_f"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[801]++; if(dbg){print "R801", "sw_em_d_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[802]++; if(dbg){print "R802", "sw_em_r_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2205 !_#_!
 #  x2205 sw_em_d_		sw_em_k_
for(wrd in omap["x2205"]){omakevars(x2205,"x2205");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[803]++; if(dbg){print "R803", "sw_em_d_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2206 !_#_!
 #  x2206 sw_em_d_		sw_em_l_
for(wrd in omap["x2206"]){omakevars(x2206,"x2206");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"Ykl") && notsym(-1,unxy) && s(-1) )
 { l[i-1]=gensub(/([АЕЁИОУЫЭЮЯаеёиоуыэюя])/,"\\1\xcc\x81",1,l[i-1]); l[i]=gensub(/^(.)/,"\xcc\xa0\\1\xcc\xad",1,l[i]); r[804]++; if(dbg){print "R804"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; r[805]++; if(dbg){print "R805", "sw_em_l_f"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[806]++; if(dbg){print "R806", "sw_em_d_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2207 !_#_!
 #  x2207 sw_em_d_		sw_em_p_
for(wrd in omap["x2207"]){omakevars(x2207,"x2207");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; r[807]++; if(dbg){print "R807", "sw_em_p_f"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[808]++; if(dbg){print "R808", "sw_em_d_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2208 !_#_!
 #  x2208 sw_em_d_		sw_em_v_
for(wrd in omap["x2208"]){omakevars(x2208,"x2208");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[809]++; if(dbg){print "R809", "sw_em_v_f"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[810]++; if(dbg){print "R810", "sw_em_d_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2209 !_#_!
 #  x2209 sw_em_d_		sw_ez_d_
for(wrd in omap["x2209"]){omakevars(x2209,"x2209");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[811]++; if(dbg){print "R811", "sw_em_d_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[812]++; if(dbg){print "R812", "sw_ez_d_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2210 !_#_!
 #  x2210 sw_em_d_		sw_ez_v_
for(wrd in omap["x2210"]){omakevars(x2210,"x2210");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[813]++; if(dbg){print "R813", "sw_em_d_f"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[814]++; if(dbg){print "R814", "sw_ez_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2211 !_#_!
 #  x2211 sw_em_dv_		sw_em_l_
for(wrd in omap["x2211"]){omakevars(x2211,"x2211");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; r[815]++; if(dbg){print "R815", "sw_em_z_f"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[816]++; if(dbg){print "R816", "sw_em_d_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[817]++; if(dbg){print "R817", "sw_em_v_f"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; r[818]++; if(dbg){print "R818", "sw_em_l_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2212 !_#_!
 #  x2212 sw_em_dz_		sw_em_l_
for(wrd in omap["x2212"]){omakevars(x2212,"x2212");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; r[819]++; if(dbg){print "R819", "sw_em_z_f"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[820]++; if(dbg){print "R820", "sw_em_d_f"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; r[821]++; if(dbg){print "R821", "sw_em_l_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2213 !_#_!
 #  x2213 sw_em_dz_		sw_ez_v_
for(wrd in omap["x2213"]){omakevars(x2213,"x2213");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; r[822]++; if(dbg){print "R822", "sw_em_z_f"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[823]++; if(dbg){print "R823", "sw_em_d_f"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[824]++; if(dbg){print "R824", "sw_ez_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2214 !_#_!
 #  x2214 sw_em_i_		sw_em_t_
for(wrd in omap["x2214"]){omakevars(x2214,"x2214");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[825]++; if(dbg){print "R825", "sw_em_i_f"}; continue};
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[826]++; if(dbg){print "R826", "sw_em_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2215 !_#_!
 #  x2215 sw_em_i_		sw_em_vr_
for(wrd in omap["x2215"]){omakevars(x2215,"x2215");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[827]++; if(dbg){print "R827", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[828]++; if(dbg){print "R828", "sw_em_v_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[829]++; if(dbg){print "R829", "sw_em_r_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2216 !_#_!
 #  x2216 sw_em_i_		sw_mn_r_   одушевленные
for(wrd in omap["x2216"]){omakevars(x2216,"x2216");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( name_im_sy(1) && s(0) )
 { l[i]=omo1; r[830]++; if(dbg){print "R830"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[831]++; if(dbg){print "R831", "sw_em_i_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[832]++; if(dbg){print "R832", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2217 !_#_!
 #  x2217 sw_em_i_		sw_mn_vr_
for(wrd in omap["x2217"]){omakevars(x2217,"x2217");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( Q(-1,"suw_edro suw_mnro") && p(-1) && p(0) )
 { l[i]=omo1; r[833]++; if(dbg){print "R833"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[834]++; if(dbg){print "R834", "sw_em_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[835]++; if(dbg){print "R835", "sw_mn_v_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[836]++; if(dbg){print "R836", "sw_mn_r_f"}; continue};
    
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2218 !_#_!
 #  x2218 sw_em_iv_		sw_em_t_
for(wrd in omap["x2218"]){omakevars(x2218,"x2218");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[837]++; if(dbg){print "R837", "sw_em_t_f"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[838]++; if(dbg){print "R838", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[839]++; if(dbg){print "R839", "sw_em_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2219 !_#_!
 #  x2219 sw_em_iv_		sw_mn_p_
for(wrd in omap["x2219"]){omakevars(x2219,"x2219");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[840]++; if(dbg){print "R840", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[841]++; if(dbg){print "R841", "sw_em_v_f"}; continue};
 #
 if ( sw_mn_p_f() )
 { l[i]=omo2; r[842]++; if(dbg){print "R842", "sw_mn_p_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2220 !_#_!
 #  x2220 sw_em_iv_		sw_mn_r_
for(wrd in omap["x2220"]){omakevars(x2220,"x2220");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="округ") {
   if ( name_im_sy(1) && s(0) )
   { l[i]=omo1; r[843]++; if(dbg){print "R843"}; continue};
 };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[844]++; if(dbg){print "R844", "sw_mn_r_f"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[845]++; if(dbg){print "R845", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[846]++; if(dbg){print "R846", "sw_em_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2221 !_#_!
 #  x2221 sw_em_iv_		sw_mn_vr_
for(wrd in omap["x2221"]){omakevars(x2221,"x2221");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 if(iwrd=="белок") {
   if ( base(-2,"охота охотиться") &&
         pre_vi(-1) && s(-2,-1) )
   { l[i]=omo2; r[847]++; if(dbg){print "R847"}; continue};
 };
 if ( qxs(-1,"что","за") )
 { l[i]=omo1; r[848]++; if(dbg){print "R848"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[849]++; if(dbg){print "R849", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[850]++; if(dbg){print "R850", "sw_em_v_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[851]++; if(dbg){print "R851", "sw_mn_v_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[852]++; if(dbg){print "R852", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2222 !_#_!
 #  x2222 sw_em_l_		sw_ems_dz_
for(wrd in omap["x2222"]){omakevars(x2222,"x2222");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[853]++; if(dbg){print "R853", "sw_em_d_f"}; continue};
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; r[854]++; if(dbg){print "R854", "sw_es_d_f"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; r[855]++; if(dbg){print "R855", "sw_em_l_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2223 !_#_!
 #  x2223 sw_em_n_		sw_em_p_
for(wrd in omap["x2223"]){omakevars(x2223,"x2223");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; r[856]++; if(dbg){print "R856", "sw_em_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2224 !_#_!
 #  x2224 sw_em_n_		sw_mn_iv_
for(wrd in omap["x2224"]){omakevars(x2224,"x2224");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[857]++; if(dbg){print "R857", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[858]++; if(dbg){print "R858", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2225 !_#_!
 #  x2225 gl_paedze_	sw_1es_r_2mn_iv_   начала  начала́  нача́ла
for(wrd in omap["x2225"]){omakevars(x2225,"x2225");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( w(-2,"с до") &&
       w(-1,"самого") && s(-2,-1) )
 { l[i]=omo2; r[859]++; if(dbg){print "R859"}; continue};

 if ( gl_in(1) && s(0) )
 { l[i]=omo1; r[860]++; if(dbg){print "R860"}; continue};
 if ( w(1,"было") &&
       (q(2,"gl_in isname")||w(2,"он")) && s(0,1) )
 { l[i]=omo1; r[861]++; if(dbg){print "R861"}; continue};
 if ( sc(-1,"—") &&
       (isname(1)||suw_edmuim(1)||w(1,"он")) && s(0) )
 { l[i]=omo1; r[862]++; if(dbg){print "R862"}; continue};

 if ( q(1,"prl_kred_sr nar_spos") && Q(-1,"pre_ro preph_ro") &&
       gl_in(2) && s(0,1) )
 { l[i]=omo1; r[863]++; if(dbg){print "R863"}; continue};
 if ( (suw_edzeim(1)||w(1,"она")) && s(0) )
 { l[i]=omo1; r[864]++; if(dbg){print "R864"}; continue};
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[865]++; if(dbg){print "R865", "sw_es_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[866]++; if(dbg){print "R866", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[867]++; if(dbg){print "R867", "sw_mn_v_f"}; continue};
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; r[868]++; if(dbg){print "R868", "gl_paedze_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2226 !_#_!
 #  x2226 sw_em_p_		sw_em_t_
for(wrd in omap["x2226"]){omakevars(x2226,"x2226");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[869]++; if(dbg){print "R869", "sw_em_p_f"}; continue};
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[870]++; if(dbg){print "R870", "sw_em_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2227 !_#_!
 #  x2227 sw_em_p_		sw_es_iv_
for(wrd in omap["x2227"]){omakevars(x2227,"x2227");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; r[871]++; if(dbg){print "R871", "sw_es_i_f"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; r[872]++; if(dbg){print "R872", "sw_es_v_f"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[873]++; if(dbg){print "R873", "sw_em_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2228 !_#_!
 #  x2228 sw_em_p_		sw_es_n_
for(wrd in omap["x2228"]){omakevars(x2228,"x2228");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[874]++; if(dbg){print "R874", "sw_em_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2229 !_#_!
 #  x2229 sw_em_p_		sw_es_p_     сти́ле  стиле́
for(wrd in omap["x2229"]){omakevars(x2229,"x2229");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[875]++; if(dbg){print "R875", "sw_em_p_f"}; continue};
 #
#if ( sw_es_p_f() )
#{ l[i]=omo2; r[876]++; if(dbg){print "R876"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2230 !_#_!
 #  x2230 sw_em_p_		sw_ez_dp_
for(wrd in omap["x2230"]){omakevars(x2230,"x2230");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 if(iwrd=="дружке") {
   if ( qxs(-1,"друг")||
	qxs(-1,"друг","на по ко") )
   { l[i]=omo2; r[877]++; if(dbg){print "R877"}; continue};
 };

 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[878]++; if(dbg){print "R878", "sw_em_p_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[879]++; if(dbg){print "R879", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[880]++; if(dbg){print "R880", "sw_ez_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2231 !_#_!
 #  x2231 sw_em_q_		sw_em_r_
for(wrd in omap["x2231"]){omakevars(x2231,"x2231");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_q_f() )
 { l[i]=omo1; r[881]++; if(dbg){print "R881", "sw_em_q_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[882]++; if(dbg){print "R882", "sw_em_r_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2232 !_#_!
 #  x2232 sw_em_r_		sw_es_ivr_
for(wrd in omap["x2232"]){omakevars(x2232,"x2232");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; r[883]++; if(dbg){print "R883", "sw_es_i_f"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; r[884]++; if(dbg){print "R884", "sw_es_v_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[885]++; if(dbg){print "R885", "sw_em_r_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2233 !_#_!
 #  x2233 sw_em_r_		sw_ez_i_
for(wrd in omap["x2233"]){omakevars(x2233,"x2233");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[886]++; if(dbg){print "R886", "sw_em_r_f"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[887]++; if(dbg){print "R887", "sw_ez_i_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2234 !_#_!
 #  x2234 sw_em_r_		sw_mn_i_
for(wrd in omap["x2234"]){omakevars(x2234,"x2234");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[888]++; if(dbg){print "R888", "sw_em_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[889]++; if(dbg){print "R889", "sw_mn_i_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2235 !_#_!
 #  x2235 sw_em_r_		sw_mn_iv_
for(wrd in omap["x2235"]){omakevars(x2235,"x2235");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="вечера") {
   if ( (w(-1,"часов минут")||q(-1,"qi_ed qi_mn")) && s(-1) )
   { l[i]=omo1; r[890]++; if(dbg){print "R890"}; continue};
 };
 if(iwrd=="года") {
   if ( (q(1,"qi_duom")||wc(1,"[234][^0-9]*$")) && s(0) )
   { l[i]=omo1; d[360]++; if(dbg){print "D360"}; continue };
 };
 if(iwrd=="города") {
   if ( w(-1,"смелость") && w(1,"берёт") && s(-1,0) )
   { l[i]=omo2; r[891]++; if(dbg){print "R891"}; continue};
 };
 if(iwrd=="рода") {
   if ( w(1,"племени") && sc(0,"-") )
   { l[i]=omo1; r[892]++; if(dbg){print "R892"}; continue};
 };
 if(iwrd=="роста") {
   if ( w(1,"в") && q(2,"mest_pr suw_edpr suw_mnpr") && s(0,1) )
   { l[i]=omo1; r[893]++; if(dbg){print "R893"}; continue};
 };
 if(iwrd=="веса") {
   if ( w(1,"в") && q(2,"mest_pr suw_edpr suw_mnpr") && s(0,1) )
   { l[i]=omo1; r[894]++; if(dbg){print "R894"}; continue};
 };
 if(iwrd=="шенкеля") {
   if ( wb(-3,-1,"дать дал дала дав задать задал задала") && s(wbn,-1) )
   { l[i]=omo2; r[895]++; if(dbg){print "R895"}; continue};
 };
 #
 if ( pre_ro(-1) && Q(-1,"pre_im pre_vi") && s(-1) )
 { l[i]=omo1; r[896]++; if(dbg){print "R896"}; continue};
 if ( q(-1,"pre_im pre_vi") && Q(-1,"pre_ro") && s(-1) )
 { l[i]=omo2; r[897]++; if(dbg){print "R897"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[898]++; if(dbg){print "R898", "sw_em_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[899]++; if(dbg){print "R899", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[900]++; if(dbg){print "R900", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2236 !_#_!
 #  x2236 sw_ems_p_		sw_es_iv_
for(wrd in omap["x2236"]){omakevars(x2236,"x2236");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; r[901]++; if(dbg){print "R901", "sw_es_i_f"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; r[902]++; if(dbg){print "R902", "sw_es_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2237 !_#_!
 #  x2237 sw_ems_r_		sw_mn_iv_  века  ве́ка  века́
for(wrd in omap["x2237"]){omakevars(x2237,"x2237");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2

 if ( sc(-1,"[^-]\\s?[IVXLCM]+\\s$") && W(-1,"и или да") )
 { l[i]=omo1; r[903]++; if(dbg){print "R903"}; continue};
 if ( sc(-1,"[-]\\s?[IVXLCM]+\\s$") || souz_iili(-1) )
 { l[i]=omo2; r[904]++; if(dbg){print "R904"}; continue};

 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[905]++; if(dbg){print "R905", "sw_em_r_f"}; continue};
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; r[906]++; if(dbg){print "R906", "sw_es_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[907]++; if(dbg){print "R907", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[908]++; if(dbg){print "R908", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2238 !_#_!
 #  x2238 sw_em_t_		sw_ems_p_
for(wrd in omap["x2238"]){omakevars(x2238,"x2238");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; r[909]++; if(dbg){print "R909", "sw_em_p_f"}; continue};
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; r[910]++; if(dbg){print "R910", "sw_es_p_f"}; continue};
 #
 if ( sw_em_t_f() )
 { l[i]=omo1; r[911]++; if(dbg){print "R911", "sw_em_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2239 !_#_!
 #  x2239 sw_em_t_		sw_es_p_
for(wrd in omap["x2239"]){omakevars(x2239,"x2239");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo1; r[912]++; if(dbg){print "R912", "sw_em_t_f"}; continue};
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; r[913]++; if(dbg){print "R913", "sw_es_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2240 !_#_!
 #  x2240 m2_1nar_spos_2sw_em_t_		sw_mn_r_
for(wrd in omap["x2240"]){omakevars(x2240,"x2240");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if(iwrd=="хором") {
   if ( q(-1,"gl_mn gl_vzmn gl_pomn deep") && type(-1,"gov") && s(-1) )
   { l[i]=omo1; r[914]++; if(dbg){print "R914"}; continue};
   if ( q(1,"gl_mn gl_vzmn gl_pomn deep") && type(1,"gov") && s(0) )
   { l[i]=omo1; r[915]++; if(dbg){print "R915"}; continue};
 };
 #
 if ( nar_spos_f() )
 { l[i]=omo1; r[916]++; if(dbg){print "R916", "nar_spos_f"}; continue};
 #
 if ( sw_em_t_f() )
 { l[i]=omo1; r[917]++; if(dbg){print "R917", "sw_em_t_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[918]++; if(dbg){print "R918", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2241 !_#_!
 #  x2241 sw_em_vr_		sw_ez_i_
for(wrd in omap["x2241"]){omakevars(x2241,"x2241");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if(iwrd=="черта") {
   if ( w(-1,"ни") &&
       !(q(1,"suw_edro suw_mnro mest_ro") && s(0,1)) && s(-1) )
   { l[i]=omo2; r[919]++; if(dbg){print "R919"}; continue};
 };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[920]++; if(dbg){print "R920", "sw_ez_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[921]++; if(dbg){print "R921", "sw_em_v_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[922]++; if(dbg){print "R922", "sw_em_r_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2242 !_#_!
 #  x2242 sw_em_vr_		sw_mn_i_  < одушевленные! >
for(wrd in omap["x2242"]){omakevars(x2242,"x2242");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if(iwrd=="господа") {
   if ( p(-1) && p(0) )
   { l[i]=omo2; r[923]++; if(dbg){print "R923"}; continue};
   if ( w(1,"нашего бога") && s(0) )
   { l[i]=omo1; r[924]++; if(dbg){print "R924"}; continue};
   if ( suw_odmnim(1) && s(0) )
   { l[i]=omo2; r[925]++; if(dbg){print "R925"}; continue};
 };
 #
 if ( name_im_sy(1) &&
       souz_iili(2) &&
        name_im_sy(3) && s(0,2) )
 { l[i]=omo2; r[926]++; if(dbg){print "R926"}; continue};
 #
 if ( name_ro_sy(1) && s(0) )
 { l[i]=omo1; r[927]++; if(dbg){print "R927"}; continue};

 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[928]++; if(dbg){print "R928", "sw_em_r_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[929]++; if(dbg){print "R929", "sw_em_v_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[930]++; if(dbg){print "R930", "sw_mn_i_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2243 !_#_!
 #  x2243 sw_em_vr_		sw_mn_iv_
for(wrd in omap["x2243"]){omakevars(x2243,"x2243");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[931]++; if(dbg){print "R931", "sw_em_v_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[932]++; if(dbg){print "R932", "sw_em_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[933]++; if(dbg){print "R933", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[934]++; if(dbg){print "R934", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2244 !_#_!
 #  x2244 gl_paedmu_	sw_mn_r_  начал  на́чал  нача́л
for(wrd in omap["x2244"]){omakevars(x2244,"x2244");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
   if ( q(1,"mest_vi mest_3e") &&
         gl_in(2) && s(0,1) )
   { l[i]=omo1; r[935]++; if(dbg){print "R935"}; continue};
   if ( gl_in(1) && s(0) )
   { l[i]=omo1; r[935]++; if(dbg){print "R935"}; continue};
   if ( (w(1,"было")||q(1,"prl_kred_sr mest_da suw_edda suw_mnda")) &&
         (q(2,"gl_in name_im_sy isname")||w(2,"он")) && s(0,1) )
   { l[i]=omo1; r[936]++; if(dbg){print "R936"}; continue};
   if ( sc(-2,"—") &&
         q(-1,"nar_spos nar_kaq nar_vrem prl_kred_sr") &&
         (q(1,"suw_edmuim name_im_sy isname")||w(1,"он")) && s(-1,0) )
   { l[i]=omo1; r[937]++; if(dbg){print "R937"}; continue};
   if ( sc(-1,"—") &&
         (q(1,"suw_edmuim name_im_sy isname")||w(1,"он")) && s(0) )
   { l[i]=omo1; r[938]++; if(dbg){print "R938"}; continue};
   if ( q(1,"pre_vi preph_vi") &&
         q(2,"suw_edvi suw_mnvi prl_edvi prl_mnvi prq_edvi prq_mnvi mest_vi") && s(0,1) )
   { l[i]=omo1; r[939]++; if(dbg){print "R939"}; continue};
   if ( q(1,"pre_ro preph_ro") &&
         q(2,"suw_edro suw_mnro prl_edro prl_mnro prq_edro prq_mnro mest_ro") && s(0,1) )
   { l[i]=omo1; r[940]++; if(dbg){print "R940"}; continue};
   if ( q(1,"pre_tv preph_tv") &&
         q(2,"suw_edtv suw_mntv prl_edtv prl_mntv prq_edtv prq_mntv mest_tv") && s(0,1) )
   { l[i]=omo1; r[941]++; if(dbg){print "R941"}; continue};
   if ( pre_pr(1) &&
         q(2,"suw_edpr suw_mnpr prl_edpr prl_mnpr prq_edpr prq_mnpr mest_pr") && s(0,1) )
   { l[i]=omo1; r[942]++; if(dbg){print "R942"}; continue};
   if ( gl_in(1) && s(0) )
   { l[i]=omo1; r[943]++; if(dbg){print "R943"}; continue};
   if ( (q(-1,"suw_edmuim name_im_sy isname")||w(-1,"он")) &&
	  q(1,"suw_edvi suw_mnvi") && s(-1,0) )
   { l[i]=omo1; r[944]++; if(dbg){print "R944"}; continue};

 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; r[945]++; if(dbg){print "R945", "gl_paedmu_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[946]++; if(dbg){print "R946", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2245 !_#_!
 #  x2245 sw_es_d_		sw_ez_t_
for(wrd in omap["x2245"]){omakevars(x2245,"x2245");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_d_f() )
 { l[i]=omo1; r[947]++; if(dbg){print "R947", "sw_es_d_f"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[948]++; if(dbg){print "R948", "sw_ez_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2246 !_#_!
 #  x2246 sw_es_d_		sw_ez_v_
for(wrd in omap["x2246"]){omakevars(x2246,"x2246");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_d_f() )
 { l[i]=omo1; r[949]++; if(dbg){print "R949", "sw_es_d_f"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[950]++; if(dbg){print "R950", "sw_ez_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2247 !_#_!
 #  x2247 sw_es_i_		sw_es_v_
for(wrd in omap["x2247"]){omakevars(x2247,"x2247");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo1; r[951]++; if(dbg){print "R951", "sw_es_i_f"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; r[952]++; if(dbg){print "R952", "sw_es_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2248 !_#_!
 #  x2248 sw_es_iv_		sw_es_p_
for(wrd in omap["x2248"]){omakevars(x2248,"x2248");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 #
 if ( sw_es_i_f() )
 { l[i]=omo1; r[953]++; if(dbg){print "R953", "sw_es_i_f"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo1; r[954]++; if(dbg){print "R954", "sw_es_v_f"}; continue};
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; r[955]++; if(dbg){print "R955", "sw_es_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2249 !_#_!
 #  x2249 sw_es_n_		sw_ez_dp_
for(wrd in omap["x2249"]){omakevars(x2249,"x2249");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[956]++; if(dbg){print "R956", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[957]++; if(dbg){print "R957", "sw_ez_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2250 !_#_!
 #  x2250 sw_es_n_		sw_ez_p_
for(wrd in omap["x2250"]){omakevars(x2250,"x2250");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[958]++; if(dbg){print "R958", "sw_ez_p_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2251 !_#_!
 #  x2251 sw_es_n_		sw_ez_v_
for(wrd in omap["x2251"]){omakevars(x2251,"x2251");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[959]++; if(dbg){print "R959", "sw_ez_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2252 !_#_!
 #  x2252 sw_es_p_		sw_ez_dp_
for(wrd in omap["x2252"]){omakevars(x2252,"x2252");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_p_f() )
 { l[i]=omo1; r[960]++; if(dbg){print "R960", "sw_es_p_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[961]++; if(dbg){print "R961", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[962]++; if(dbg){print "R962", "sw_ez_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2253 !_#_!
 #  x2253 sw_es_rz_		sw_ez_i_
for(wrd in omap["x2253"]){omakevars(x2253,"x2253");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_z_f() )
 { l[i]=omo1; r[963]++; if(dbg){print "R963", "sw_es_z_f"}; continue};
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; r[964]++; if(dbg){print "R964", "sw_es_r_f"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[965]++; if(dbg){print "R965", "sw_ez_i_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2254 !_#_!
 #  x2254 sw_es_r_      sw_mn_iv_
for(wrd in omap["x2254"]){omakevars(x2254,"x2254");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="утра") {
   if ( (w(-1,"часов минут")||q(-1,"qi_ed qi_mn nar_vrem")) && s(-1) )
   { l[i]=omo1; r[966]++; if(dbg){print "R966"}; continue};
 };
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; r[967]++; if(dbg){print "R967", "sw_es_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[968]++; if(dbg){print "R968", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[969]++; if(dbg){print "R969", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2255 !_#_!
 #  x2255 sw_em_r_		sw_mn_iv_  цвета  цве́та  цвета́
for(wrd in omap["x2255"]){omakevars(x2255,"x2255");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( ( suw_mnim(-2)||(suw_mnim(-3) && q(-2,"name_ro_sy isname")) && s(-3)) &&
       w(-1,"были") &&
        q(1,"prl_edro suw_edro prq_edro prl_mnro suw_mnro prq_mnro suw_edne") && s(-2,0) )
 { l[i]=omo1; r[970]++; if(dbg){print "R970"}; continue};
 if ( (suw_any(-1)||w(-1,"был было была")) && Q(-1,"prl_mnim") &&
       q(1,"prl_edro suw_edro prq_edro prl_mnro suw_mnro prq_mnro suw_edne") && s(-1,0) )
 { l[i]=omo1; r[971]++; if(dbg){print "R971"}; continue};
 if ( (suw_any(-1)||w(-1,"был было была")) && Q(-1,"prl_mnim") &&
        qf(1,5,"suw_edro suw_mnro suw_edne") && s(-1,qfn-1) )
 { l[i]=omo1; r[972]++; if(dbg){print "R972"}; continue};
 if ( muk_edmuro(-2) &&
       q(-1,"mest_im suw_edim suw_mnim") && s(-2,-1) )
 { l[i]=omo1; d[195]++; if(dbg){print "D195"}; continue };
 if ( prl_any(-1) && sc(-1,",") &&
       q(1,"mest_ro prl_edro prl_mnro prq_edro prq_mnro") &&
        q(2,"suw_edro suw_mnro") && s(0,1) )
 { l[i]=omo1; d[195]++; if(dbg){print "D195"}; continue };
 if ( prl_any(-1) && sc(-1,",") &&
       q(1,"suw_edro suw_mnro") && s(0) )
 { l[i]=omo1; d[195]++; if(dbg){print "D195"}; continue };
 #
 if ( pre_ro(-1) && Q(-1,"pre_im pre_vi") && s(-1) )
 { l[i]=omo1; r[973]++; if(dbg){print "R973"}; continue};
 if ( q(-1,"pre_im pre_vi") && Q(-1,"pre_ro") && s(-1) )
 { l[i]=omo2; r[974]++; if(dbg){print "R974"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[975]++; if(dbg){print "R975", "sw_em_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[976]++; if(dbg){print "R976", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[977]++; if(dbg){print "R977", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2256 !_#_!
 #  x2256 sw_ez_iv_		sw_mn_r_
for(wrd in omap["x2256"]){omakevars(x2256,"x2256");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[978]++; if(dbg){print "R978", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2257 !_#_!
 #  x2257 sw_ez_r_		sw_mn_i_
for(wrd in omap["x2257"]){omakevars(x2257,"x2257");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[979]++; if(dbg){print "R979", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[980]++; if(dbg){print "R980", "sw_mn_i_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2258 !_#_!
 #  x2258 sw_ez_r_      sw_mn_iv_
for(wrd in omap["x2258"]){omakevars(x2258,"x2258");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="весны") {
   if ( base(-1,"гончая") && s(-1) )
   { l[i]=omo1; r[981]++; if(dbg){print "R981"}; continue};
 };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[982]++; if(dbg){print "R982", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[983]++; if(dbg){print "R983", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[984]++; if(dbg){print "R984", "sw_mn_v_f"}; continue};

#if ( wc(-1,"[ео]й$ [ео]йся$") && s(-1) )
#{ l[i]=omo1; r[985]++; if(dbg){print "R985"}; continue};
#if ( wc(-1,"[иы]е$ [иы]еся$") && s(-1) )
#{ l[i]=omo2; r[986]++; if(dbg){print "R986"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2259 !_#_!
 #  x2259 sw_ez_r_		sw_mn_v_
for(wrd in omap["x2259"]){omakevars(x2259,"x2259");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[987]++; if(dbg){print "R987", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[988]++; if(dbg){print "R988", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2260 !_#_!
 #  x2260 sw_ez_t_		sw_ez_v_
for(wrd in omap["x2260"]){omakevars(x2260,"x2260");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo1; r[989]++; if(dbg){print "R989", "sw_ez_t_f"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[990]++; if(dbg){print "R990", "sw_ez_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2261 !_#_!
 #  x2261 sw_ez_t_		sw_mn_r_
for(wrd in omap["x2261"]){omakevars(x2261,"x2261");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo1; r[991]++; if(dbg){print "R991", "sw_ez_t_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[992]++; if(dbg){print "R992", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2262 !_#_!
 #  x2262 sw_ez_t_		sw_mn_vr_
for(wrd in omap["x2262"]){omakevars(x2262,"x2262");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo1; r[993]++; if(dbg){print "R993", "sw_ez_t_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[994]++; if(dbg){print "R994", "sw_mn_v_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[995]++; if(dbg){print "R995", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2263 !_#_!
 #  x2263 sw_mn_p_		sw_mn_r_
for(wrd in omap["x2263"]){omakevars(x2263,"x2263");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_p_f() )
 { l[i]=omo1; r[996]++; if(dbg){print "R996", "sw_mn_p_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[997]++; if(dbg){print "R997", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2264 !_#_!
 #  x2264 sw_mn_p_      sw_mn_vr_
for(wrd in omap["x2264"]){omakevars(x2264,"x2264");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_p_f() )
 { l[i]=omo1; r[998]++; if(dbg){print "R998", "sw_mn_p_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[999]++; if(dbg){print "R999", "sw_mn_v_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1000]++; if(dbg){print "R1000", "sw_mn_r_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2265 !_#_!
 #  x2265 mest_1ems_t_2mn_d_       mest_ems_p_
for(wrd in omap["x2265"]){omakevars(x2265,"x2265");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"во о обо на при") && s(-1) )
 { l[i]=omo2; r[1001]++; if(dbg){print "R1001"}; continue;};
 #
 if ( !(w(-1,"во о обо на при") && s(-1)) )
 { l[i]=omo1; r[1002]++; if(dbg){print "R1002"}; continue;};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2266 !_#_!
 #  x2266 m2_1mest_es_r_2souz_     mest_es_p_    чем  че́м  чём
for(wrd in omap["x2266"]){omakevars(x2266,"x2266");for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( !(w(-2,"не") && s(-2)) && 
         w(-1,"в о об на при по") && s(-1) )
 { l[i]=omo2; r[1003]++; if(dbg){print "R1003"}; continue;};
 #
 if ( tolower(l[i])==iwrd )
 { l[i]=omo1; r[1004]++; if(dbg){print "R1004"}; continue;};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2267 !_#_!
 #  x2267 qip_iv_       sw_mn_vr_    сорок  со́рок  соро́к
for(wrd in omap["x2267"]){omakevars(x2267,"x2267");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(1,"suw_mnro suw_mnsq qi_ed qi_mn") && s(0) )
 { l[i]=omo1; r[1005]++; if(dbg){print "R1005"}; continue;};
 if ( q(-1,"suw_mnro suw_mnsq qi_ed qi_mn") && s(-1) )
 { l[i]=omo1; r[1006]++; if(dbg){print "R1006"}; continue;};
 if ( q(-2,"qi_ed qi_mn") &&
        w(-1,"или") && s(-2,-1) )
 { l[i]=omo1; r[1007]++; if(dbg){print "R1007"}; continue;};
 if ( w(1,"или") &&
       q(2,"qi_ed qi_mn") && s(0,1) )
 { l[i]=omo1; r[1008]++; if(dbg){print "R1008"}; continue;};
 if ( w(-1,"за по под") && s(-1) )
 { l[i]=omo1; r[1009]++; if(dbg){print "R1009"}; continue;};
 if ( suw_mnro(-2) &&
       w(-1,"в на за под") && s(-2,-1) )
 { l[i]=omo1; r[1010]++; if(dbg){print "R1010"}; continue;};
 if ( qxs(1,"с","половиной четвертью небольшим") )
 { l[i]=omo1; r[1011]++; if(dbg){print "R1011"}; continue;};
 if ( q(-1,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") && s(-1) )
 { l[i]=omo1; d[738]++; if(dbg){print "D738"}; continue };

 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1012]++; if(dbg){print "R1012", "sw_mn_r_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1013]++; if(dbg){print "R1013", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2268 !_#_!
 #  x2268 qip_dprt_     sw_ez_i_   сорока  сорока́  соро́ка
for(wrd in omap["x2268"]){omakevars(x2268,"x2268");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2ш
 prex=1
 #
 if ( pre_pr(-1) &&
       q(1,"suw_mnpr qik_pr") && s(-1,0) )
 { l[i]=omo1; r[1014]++; if(dbg){print "R1014"}; continue};
 if ( q(-1,"suw_mnro suw_mnsq qik_ro") && s(-1) )
 { l[i]=omo1; r[1015]++; if(dbg){print "R1015"}; continue};
 if ( q(1,"suw_mnro suw_mnsq qik_ro") && s(0) )
 { l[i]=omo1; r[1016]++; if(dbg){print "R1016"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[1017]++; if(dbg){print "R1017", "sw_ez_i_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2269 !_#_!
 #  x2269 mest_ems_d_   sw_em_d_   тому  то́му  тому́
for(wrd in omap["x2269"]){omakevars(x2269,"x2269");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(0,",") &&
      (q(1,"muk_ed muk_mn mest_ed mest_mn")||w(1,"что чтоб чтобы как")) )
 { l[i]=omo1; r[1018]++; if(dbg){print "R1018"}; continue};
 if ( souz_iili(1) &&
      q(2,"mest_da") && s(0,1) )
 { l[i]=omo1; r[1019]++; if(dbg){print "R1019"}; continue};
 if ( pre_da(-1) &&
      (q(1,"suw_edmuda suw_edsrda")||w(1,"же")) && s(-1,0) )
 { l[i]=omo1; r[1020]++; if(dbg){print "R1020"}; continue};
 if ( pre_da(-1) &&
      (q(1,"suw_edmuda suw_edsrda")||w(1,"же")) && s(-1,0) )
 { l[i]=omo1; r[1021]++; if(dbg){print "R1021"}; continue};
 if ( w(1,"же") &&
       q(2,"suw_edmuda suw_edsrda") && s(0,1) )
 { l[i]=omo1; r[1022]++; if(dbg){print "R1022"}; continue};
 if ( q(-1,"suw_edro suw_mnro qik_im") &&
       w(1,"назад") && s(-1) )
 { l[i]=omo1; r[1023]++; if(dbg){print "R1023"}; continue};

 cst="подобна подобная подобнее подобней подобно подобного подобное подобной подобном подобному подобною подобную подобны подобные подобный подобным подобными подобных"
 if ( w(-1,"а и но") &&
       w(1,cst) && s(-1) )
 { l[i]=omo1; r[1024]++; if(dbg){print "R1024"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[1025]++; if(dbg){print "R1025", "sw_em_d_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2270 !_#_!
 #  x2270	deep_na_    pre_combo_  судя судя́ су́дя
for(wrd in omap["x2270"]){omakevars(x2270,"x2270");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"по") && s(0) )
 { l[i]=omo2; r[1026]++; if(dbg){print "R1026"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2271 !_#_!
 #  x2271 m2_1sw_ez_i_2predik_     sw_ez_i_  пора  пора́  по́ра
for(wrd in omap["x2271"]){omakevars(x2271,"x2271");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qf(1,3,"gl_in") && s(0,qfn-1) )
 { l[i]=omo1; r[1027]++; if(dbg){print "R1027"}; continue};
 if ( mest_da(-1) )
 { l[i]=omo1; r[1028]++; if(dbg){print "R1028"}; continue};
 if ( p(-1)||p(0) )
 { l[i]=omo1; r[1029]++; if(dbg){print "R1029"}; continue};
 if ( q(-1,"gl_paedze") )
 { l[i]=omo1; r[1030]++; if(dbg){print "R1030"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2272 !_#_!
 #  x2272 m2_1pl_kr_ez_2sw_mn_iv_  sw_es_r_  права  права́  пра́ва
for(wrd in omap["x2272"]){omakevars(x2272,"x2272");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-4,"gl_pein gl_peed gl_pemn deep_pe prq_pe gl_pnin gl_pned gl_pnmn deep_pn prq_pn") &&
       q(-3,"suw_edvi suw_mnvi") &&
        suw_edro(-2) && souz_iili(-1) && s(-4,-1) )
 { l[i]=omo1; d[180]++; if(dbg){print "D180"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[1031]++; if(dbg){print "R1031", "sw_es_r_f"}; continue};
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; r[1032]++; if(dbg){print "R1032", "pl_kr_ez_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[1033]++; if(dbg){print "R1033", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[1034]++; if(dbg){print "R1034", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2273 !_#_!
 #  x2273 samogo1_ samogo2_   самого  са́мого  самого́
for(wrd in omap["x2273"]){omakevars(x2273,"x2273");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"лучшего худшего левого правого верхнего нижнего") && p(1) && s(0) )
 { l[i]=omo1; r[1035]++; if(dbg){print "R1035"}; continue};
 if ( w(-3,"у") &&
       q(-2,"mest_ro") &&
        w(-1,"у") && s(-3,-1) )
 { l[i]=omo2; r[1036]++; if(dbg){print "R1036"}; continue};
 if ( qxs(-1,"того этого","же")||
      ww_(-1,"того этого") )
 { l[i]=omo1; r[1037]++; if(dbg){print "R1037"}; continue};
 #
 if ( (w(1,"себя тебя меня")||q(1,"gl_mn gl_ed muk_edmuro")) && s(0) && Q(1,"suw_any") )
 { l[i]=omo2; r[1038]++; if(dbg){print "R1038"}; continue};
 if ( w(1,"его") && p(1) && s(0) )
 { l[i]=omo2; r[1039]++; if(dbg){print "R1039"}; continue};
 if ( (w(-1,"себя тебя меня него")||muk_edmuro(-1)) && s(-1) )
 { l[i]=omo2; r[1040]++; if(dbg){print "R1040"}; continue};
 if ( (w(-1,"его")||muk_edmuro(-1)) && (p(0)||q_w(1,"souz_iili pre_any")) && s(-1) )
 { l[i]=omo2; r[1041]++; if(dbg){print "R1041"}; continue};
 #
 if ( q(1,"prl_edmuro prl_edsrro prq_edmuro prq_edsrro prl_edsrro mest_vi mest_ro") &&
       q(2,"name_ro_sy isname") && s(0,1) )
 { l[i]=omo2; r[1042]++; if(dbg){print "R1042"}; continue};
 if ( q(1,"name_ro_sy isname") && s(0) )
 { l[i]=omo2; r[1043]++; if(dbg){print "R1043"}; continue};
 if ( q(1,"suw_odedro") && s(0) && Q(1,"prl_edro") )
 { l[i]=omo2; r[1044]++; if(dbg){print "R1044"}; continue};
 if ( q(1,"prl_edmuro prl_edsrro") && sc(1,",") && s(0) &&
       w(2,"самого") &&
        q(3,"prl_edmuro prl_edsrro") && s(2,3) )
 { l[i]=omo1; r[1045]++; if(dbg){print "R1045"}; continue};
 if ( q(1,"prl_edmuro prl_edsrro prq_edmuro prq_edsrro") &&
       souz_iili(2) &&
        q(3,"prl_edmuro prl_edsrro prq_edmuro prq_edsrro") && s(0,2) )
 { l[i]=omo1; r[1046]++; if(dbg){print "R1046"}; continue};
 if ( q(-2,"prl_edmuro prl_edsrro prq_edmuro prq_edsrro") &&
       souz_iili(-1) &&
        q(1,"prl_edmuro prl_edsrro prq_edmuro prq_edsrro") && s(-2,0) )
 { l[i]=omo1; r[1047]++; if(dbg){print "R1047"}; continue};
 if ( q(1,"prl_edmuro prl_edsrro prq_edmuro prq_edsrro mest_vi mest_ro") &&
       q(2,"suw_edmuro suw_edsrro pre_any prl_edmuro prl_edsrro") && s(0,1) )
 { l[i]=omo1; r[1048]++; if(dbg){print "R1048"}; continue};
 if ( q(1,"prl_edmuro prl_edsrro mest_vi mest_ro") && s(0) && (p(1)||q_w(2,"souz_iili pre_any")) && Q(1,"suw_odedro") )
 { l[i]=omo1; r[1049]++; if(dbg){print "R1049"}; continue};
 if ( q(1,"prq_edmuro prq_edsrro") && s(0) && (p(1)||q_w(2,"pre_any")) )
 { l[i]=omo2; r[1050]++; if(dbg){print "R1050"}; continue};
 #
 if ( mest_vi(1) && s(0) )
 { l[i]=omo2; r[1051]++; if(dbg){print "R1051"}; continue};
 if ( pre_ro(-2) && W(-2,"с") &&
       mest_ro(-1) && s(-2,-1) && !(q(1,"suw_edro suw_mnro") && s(0)) )
 { l[i]=omo2; r[1052]++; if(dbg){print "R1052"}; continue};
 if ( pre_ro(-1) &&
      (q_(1,swn_edmu_ro)||q_(1,swn_edsr_ro)||mest_ro(1)) && s(-1,0) )
 { l[i]=omo1; r[1053]++; if(dbg){print "R1053"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2274 !_#_!
 #  x2274 samoe1_ samoe2_     самое  са́мое  самоё
for(wrd in omap["x2274"]){omakevars(x2274,"x2274");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qxs(-1,"то это","же")||
      ww_(-1,"то это") )
 { l[i]=omo1; r[1054]++; if(dbg){print "R1054"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer
### x2275 !_#_!
 #  x2275 samoy1_ samoy2_     самой  са́мой  само́й
for(wrd in omap["x2275"]){omakevars(x2275,"x2275");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"до у возле") &&
       q(1,"suw_noedro suw_nomnro") && s(-1,0) )
 { l[i]=omo1; r[1055]++; if(dbg){print "R1055"}; continue};
 
 if ( w(1,"лучшей худшей левой правой верхней нижней") && p(1) && s(0) )
 { l[i]=omo1; r[1035]++; if(dbg){print "R1035"}; continue};
 if ( w(-3,"у") &&
       q(-2,"mest_ro") &&
        w(-1,"у") && s(-3,-1) )
 { l[i]=omo2; r[1036]++; if(dbg){print "R1036"}; continue};
 if ( qxs(-1,"той этой","же")||
      ww_(-1,"той этой") )
 { l[i]=omo1; r[1037]++; if(dbg){print "R1037"}; continue};
 #
 if ( (w(1,"себе себя ей тебе")||q(1,"gl_mn gl_ed muk_edzeda")) && s(0) && Q(1,"suw_any") )
 { l[i]=omo2; r[1038]++; if(dbg){print "R1038"}; continue};
 if ( w(1,"её") && p(1) && s(0) )
 { l[i]=omo2; r[1039]++; if(dbg){print "R1039"}; continue};
 if ( (w(-1,"себя тебя меня неё себе мне ей тебе")||muk_edzeda(-1)) && s(-1) )
 { l[i]=omo2; r[1040]++; if(dbg){print "R1040"}; continue};
 if ( (w(-1,"её")||muk_edzeda(-1)) && (p(0)||q_w(1,"souz_iili pre_any")) && s(-1) )
 { l[i]=omo2; r[1041]++; if(dbg){print "R1041"}; continue};

   
 #
 if ( q(-2,"muk_edzeda muk_edzero muk_edzetv muk_edzepr") &&
       w(-1,"же") && s(-2,-1) )
 { l[i]=omo1; r[1058]++; if(dbg){print "R1058"}; continue};
 if ( muk_edzeda(-1) && s(-1) )
 { l[i]=omo1; r[1059]++; if(dbg){print "R1059"}; continue};
 if ( w(-1,"по и") &&
       w(1,"своей твоей его её их нашей вашей") &&
        q(2,"suw_edzeda suw_edzero suw_edzetv suw_edzepr") && s(-1,1) )
 { l[i]=omo2; r[1060]++; if(dbg){print "R1060"}; continue};
 #
 if ( q(1,"prl_edzeda prl_edzero prl_edzetv") && sc(1,",") && s(0) &&
       w(2,"самой") &&
        q(3,"prl_edzeda prl_edzero prl_edzetv") && s(2,3) )
 { l[i]=omo1; r[1061]++; if(dbg){print "R1061"}; continue};
 if ( q(1,"prl_edzeda prl_edzero prl_edzetv qik_tv") &&
       q(2,"prl_edzeda prl_edzero prl_edzetv") &&
        q(3,"suw_edzeda suw_edzero suw_edzetv suw_edzepr pre_any") && s(0,2) )
 { l[i]=omo1; r[1062]++; if(dbg){print "R1062"}; continue};
 if ( q(1,"prl_edzeda prl_edzero prl_edzetv mest_da") &&
       q(2,"suw_edzeda suw_edzero suw_edzetv suw_edzepr pre_any") && s(0,1) )
 { l[i]=omo1; r[1063]++; if(dbg){print "R1063"}; continue};
 if ( q(1,"prl_edzeda prl_edzero prl_edzetv") &&
       mest_3e(2) &&
        q(3,"suw_edzeda suw_edzero suw_edzetv suw_edzepr pre_any") && s(0,2) )
 { l[i]=omo1; r[1064]++; if(dbg){print "R1064"}; continue};
 if ( q(1,"prl_edzeda prl_edzero prl_edzetv") &&
       q(2,"gl_need gl_nemn gl_vzmn") &&
        q(3,"suw_edim suw_mnim") && s(0,2) )
 { l[i]=omo1; r[1065]++; if(dbg){print "R1065"}; continue};
 #
 if ( q(1,"prl_edzeda") &&
       souz_iili(2) &&
        w(3,"самой") &&
         q(4,"prl_edzeda") && s(0,3) )
 { l[i]=omo1; r[1066]++; if(dbg){print "R1066"}; continue};
 #
 if ( q(1,"name_pr_sy isname") && s(0) )
 { l[i]=omo2; r[1067]++; if(dbg){print "R1067"}; continue};
 if ( q(-1,"pre_da preph_da") &&
       q_(1,swn_edmze_pr) && s(-1,0) )
 { l[i]=omo1; r[1068]++; if(dbg){print "R1068"}; continue};

 if ( q(1,"prl_edzetv prq_edzetv") && s(0) && p(1) )
 { l[i]=omo1; r[1069]++; if(dbg){print "R1069"}; continue};


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
 { l[i]=omo1; r[1070]++; if(dbg){print "R1070"}; continue};
 if ( pre_pr(-1) &&
       q(1,"prl_edmupr prq_edmupr") &&
        w(2,cst) && s(-1,1) )
 { l[i]=omo1; r[1071]++; if(dbg){print "R1071"}; continue};
 if ( pre_pr(-1) && s(-1) &&
     ((w(1,"ли же") && s(0,1))||(w(1,"то") && se(0,"-") && s(1))) &&
        w(2,cst) )
 { l[i]=omo1; r[1072]++; if(dbg){print "R1072"}; continue};

 cst = "сигнале действии городе принципе путешествии селении селе смысле человечестве народе корабле шаттле"
 if ( pre_pr(-1) &&
       w(1,cst) && s(0) )
 { l[i]=omo2; r[1073]++; if(dbg){print "R1073"}; continue};

 if ( w(-1,"себе мне нём тебе") && s(-1) )
 { l[i]=omo2; r[1074]++; if(dbg){print "R1074"}; continue};
 if ( (w(1,"себе мне нём тебе")||muk_edmupr(1)) && s(0) )
 { l[i]=omo2; r[1075]++; if(dbg){print "R1075"}; continue};
 if ( q(1,"name_pr_sy isname") && s(0) )
 { l[i]=omo2; r[1076]++; if(dbg){print "R1076"}; continue};
 if ( muk_edmupr(-1) && s(-1) )
 { l[i]=omo1; r[1077]++; if(dbg){print "R1077"}; continue};
 #
 if ( q(1,"prl_edmupr prl_edsrpr") && sc(1,",") && s(0) &&
       w(2,"самом") &&
        q(3,"prl_edmupr prl_edsrpr") && s(2,3) )
 { l[i]=omo1; r[1078]++; if(dbg){print "R1078"}; continue};
 if ( q(1,"prl_edmupr prl_edsrpr") &&
       souz_iili(2) &&
        w(3,"самом") &&
         q(4,"prl_edmupr prl_edsrpr") && s(0,3) )
 { l[i]=omo1; r[1079]++; if(dbg){print "R1079"}; continue};
 if ( q(1,"prl_edmupr prl_edsrpr mest_vi mest_pr") &&
       q(2,"suw_edmupr suw_edsrpr pre_any") && s(0,1) )
 { l[i]=omo1; r[1080]++; if(dbg){print "R1080"}; continue};
 if ( q(1,"prl_edmupr prl_edsrpr mest_vi mest_pr") &&
       mest_3e(2) &&
        q(3,"suw_edmupr suw_edsrpr pre_any") && s(0,2) )
 { l[i]=omo1; r[1081]++; if(dbg){print "R1081"}; continue};
 #
 if ( pre_pr(-1) &&
      (q_(1,swn_edmu_pr)||q_(1,swn_edsr_pr)) && s(-1,0) )
 { l[i]=omo1; r[1082]++; if(dbg){print "R1082"}; continue};
 #
 if ( muk_edmupr(-2) &&
       w(-1,"же") && s(-2,-1) )
 { l[i]=omo1; r[1083]++; if(dbg){print "R1083"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2277 !_#_!
 #  x2277 samomu1_ samomu2_   самому  са́мому  самому́
for(wrd in omap["x2277"]){omakevars(x2277,"x2277");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( (w(1,"себе тебе мне ему")||muk_edmuda(1)) && s(0) )
 { l[i]=omo2; r[1084]++; if(dbg){print "R1084"}; continue};
 if ( (w(-1,"себе тебе мне ему")||muk_edmuda(-1)) &&
        suw_edda(1) && s(-1,0) )
 { l[i]=omo1; r[1085]++; if(dbg){print "R1085"}; continue};
 if ( (w(-1,"себе тебе мне ему")||muk_edmuda(-1)) && s(-1) )
 { l[i]=omo2; r[1086]++; if(dbg){print "R1086"}; continue};
 #
 if ( q(1,"prl_edmuda prl_edsrda") && sc(1,",") && s(0) &&
       w(2,"самому") &&
        q(3,"prl_edmuda prl_edsrda") && s(2,3) )
 { l[i]=omo1; r[1087]++; if(dbg){print "R1087"}; continue};
 if ( q(1,"prl_edmuda prl_edsrda mest_da") &&
       q(2,"suw_edmuda suw_edsrda pre_any") && s(0,1) )
 { l[i]=omo1; r[1088]++; if(dbg){print "R1088"}; continue};
 #
 if ( q(-1,"pre_da preph_da") &&
      (q_(1,swn_edmu_da)||q_(1,swn_edsr_da)) && s(-1,0) )
 { l[i]=omo1; r[1089]++; if(dbg){print "R1089"}; continue};
 #
 if ( muk_edmuda(-2) &&
       w(-1,"же") && s(-2,-1) )
 { l[i]=omo1; r[1090]++; if(dbg){print "R1090"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2278 !_#_!
 #  x2278 sw_1es_rz_2ez_i_   sw_mn_iv_  вина  вина́  ви́на
for(wrd in omap["x2278"]){omakevars(x2278,"x2278");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_z_f() )
 { l[i]=omo1; r[1091]++; if(dbg){print "R1091", "sw_es_z_f"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; r[1092]++; if(dbg){print "R1092", "sw_ez_i_f"}; continue};
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; r[1093]++; if(dbg){print "R1093", "sw_es_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1094]++; if(dbg){print "R1094", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1095]++; if(dbg){print "R1095", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2279 !_#_!
 #  x2279 m2_1nar_step_2qin_iv_  pl_kr_es_
for(wrd in omap["x2279"]){omakevars(x2279,"x2279");for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(0,"-") && w(1,"мал мало мальски маля помалу") )
 { l[i]=omo1; r[1096]++; if(dbg){print "R1096"}; continue};
 #
 if ( qxs(-1,"как и","будто") )
 { l[i]=omo1; r[1097]++; if(dbg){print "R1097"}; continue};
 if ( q(-1,"mest_da suw_edda suw_mnda") )
 { l[i]=omo1; r[1098]++; if(dbg){print "R1098"}; continue};
 #
 if ( w(1,"где как какой кого кто ли того что") && s(0) )
 { l[i]=omo1; r[1099]++; if(dbg){print "R1099"}; continue};
 #
 if ( base(1,"один какой") && s(0) )
 { l[i]=omo1; r[1100]++; if(dbg){print "R1100"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2280 !_#_!
 #  x2280 m2_1sw_ez_i_2deep_na_	sw_em_r_  душа  душа́  ду́ша
for(wrd in omap["x2280"]){omakevars(x2280,"x2280");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; r[1101]++; if(dbg){print "R1101", "sw_ez_i_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[1102]++; if(dbg){print "R1102", "sw_em_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2281 !_#_!
 #  x2281 gl_paedze_    sw_ez_i_  жила  жила́  жи́ла
for(wrd in omap["x2281"]){omakevars(x2281,"x2281");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[1103]++; if(dbg){print "R1103", "sw_ez_i_f"}; continue};
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; r[1104]++; if(dbg){print "R1104", "gl_paedze_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2282 !_#_!
 #  x2282 m2_1nar_vopr_2souz_	prl_ems_vr_  отчего  отчего́  о́тчего
for(wrd in omap["x2282"]){omakevars(x2282,"x2282");for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( !(suw_edro(1) && s(0)) )
 { l[i]=omo1; r[1105]++; if(dbg){print "R1105"}; continue};
 #
 if ( w(1,"дома") && s(0) )
 { l[i]=omo2; r[1106]++; if(dbg){print "R1106"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2283 !_#_!
 #  x2283 m2_1sw_em_r_2nar_mest_   sw_mn_iv_  дома  до́ма  дома́
for(wrd in omap["x2283"]){omakevars(x2283,"x2283");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( idb(5,"gl4dOma") && s(idn,-1) )
 { l[i]=omo1; r[1107]++; if(dbg){print "R1107"}; continue};
#if ( id(-1,"sw4dOma") && s(-1) )
#{ l[i]=omo1; r[1108]++; if(dbg){print "R1108"}; continue};
#if ( id(-2,"sw4dOma") &&
#      q(-1,"mest_ro prl_edro prl_mnro mest_3e") &&  s(-2,-1) )
#{ l[i]=omo1; r[1109]++; if(dbg){print "R1109"}; continue};

 if ( q(-1,"gl_in gl_ed gl_mn gl_po gl_vzed gl_vzmn deep") && type(-1,"sit gov") && s(-1) )
 { l[i]=omo1; d[51]++; if(dbg){print "D51"}; continue };
 if ( q(-1,"gl_nein gl_need gl_nemn gl_ponemn gl_poneed gl_povzmn gl_vzmn deep_ne") && s(-1) )
 { l[i]=omo1; d[51]++; if(dbg){print "D51"}; continue };
 if ( q(-2,"gl_nein gl_need gl_nemn gl_ponemn gl_poneed gl_povzmn gl_vzmn deep_ne") &&
       w(-1,"как") && s(-2,-1) )
 { l[i]=omo1; d[51]++; if(dbg){print "D51"}; continue };
 if ( q(-2,"mest_mnim suw_mnim") && Q(-2,"gl_mn") &&
       q(-1,"prl_krmn") && s(-2,-1) )
 { l[i]=omo1;; d[491]++; if(dbg){print "D491"}; continue };
 if ( q(1,"mest_im suw_edim suw_mnim") &&
       q(2,"gl_peed gl_pemn gl_popeed gl_popemn") &&
        q(3,"prl_edda prl_mnda mest_da") &&
         q(4,"prl_edvi prl_mnvi") &&
          q(5,"suw_edvi suw_mnvi name_vi_sy isname") && s(0,4) && p(-1) )
 { l[i]=omo1; d[383]++; if(dbg){print "D383"}; continue };
 if ( q(1,"mest_im suw_edim suw_mnim") &&
       q(2,"gl_peed gl_pemn gl_popeed gl_popemn") &&
        q(3,"prl_edda prl_mnda mest_da") &&
         q(4,"suw_edvi suw_mnvi name_vi_sy isname") && s(0,3) && p(-1) )
 { l[i]=omo1; d[383]++; if(dbg){print "D383"}; continue };
 if ( q(1,"mest_im suw_edim suw_mnim") &&
       q(2,"gl_peed gl_pemn gl_popeed gl_popemn") &&
        q(3,"prl_edvi prl_mnvi") &&
         q(4,"suw_edvi suw_mnvi name_vi_sy isname") && s(0,3) && p(-1) )
 { l[i]=omo1; d[383]++; if(dbg){print "D383"}; continue };
 if ( q(1,"mest_im suw_edim suw_mnim") &&
       q(2,"gl_peed gl_pemn gl_popeed gl_popemn") &&
        q(3,"suw_edvi suw_mnvi name_vi_sy isname") && s(0,2) && p(-1) )
 { l[i]=omo1; d[383]++; if(dbg){print "D383"}; continue };

 #
 if ( q(-2,"mest_im suw_edim suw_mnim name_im_sy isname") && Q(-2,"prl_edim prl_mnim") &&
       w(-1,"не же ведь") && s(-2,-1))
 { l[i]=omo1; r[1110]++; if(dbg){print "R1110"}; continue};
 #
 if ( prq_mnim(-3) &&
       pre_ro(-2) &&
        q(-1,"suw_edro suw_mnro mest_ro") && s(-3,-1))
 { l[i]=omo2; r[1111]++; if(dbg){print "R1111"}; continue};
 if ( pre_ro(-2) &&
      q(-1,"suw_edro suw_mnro mest_ro") && s(-2,-1))
 { l[i]=omo1; r[1112]++; if(dbg){print "R1112"}; continue};
 if ( w(1,"у") &&
       q(2,"suw_edro suw_mnro mest_ro") && s(0,1))
 { l[i]=omo1; r[1113]++; if(dbg){print "R1113"}; continue};
 #
 if ( ( w(-1,"я мы ты вы он она оно кто")||mest_edim(-1)||q_(-1,mst_ed_mu_im)) && s(-1))
 { l[i]=omo1; r[1114]++; if(dbg){print "R1114"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1115]++; if(dbg){print "R1115", "sw_em_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1116]++; if(dbg){print "R1116", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1117]++; if(dbg){print "R1117", "sw_mn_v_f"}; continue};

 if ( w(-1,"как") && s(-1) && p(0) )
 { l[i]=omo1; r[1118]++; if(dbg){print "R1118"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2284 !_#_!
 #  x2284   gl_ed1e     pl_ez_v_  целую  целу́ю  це́лую
for(wrd in omap["x2284"]){omakevars(x2284,"x2284");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"армию борозду бутылку вечность галактику горку гору группу деревню квартиру корзину кружку историю колонку колонну кучу неделю ночь пачку планету пригоршню расу свинью секунду стену страницу страну сумку тонну чашку цивилизацию эскадрилью") && s(0))
 { l[i]=omo2; r[1119]++; if(dbg){print "R1119"}; continue};
 #
 if ( pl_ez_v_f() )
 { l[i]=omo2; r[1120]++; if(dbg){print "R1120", "pl_ez_v_f"}; continue};
 #
 if ( suw_mnvi(1) && s(0) )
 { l[i]=omo1; r[1121]++; if(dbg){print "R1121"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[1122]++; if(dbg){print "R1122", "gl_ed1e_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2285 !_#_!
 #  x2285 bolshaya1_ bolshaya2_   большая  бо́льшая  больша́я
for(wrd in omap["x2285"]){omakevars(x2285,"x2285");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"значительно куда много намного несколько") && s(-1) )
 { l[i]=omo1; r[1123]++; if(dbg){print "R1123"}; continue};
 if ( w(1,"часть половина") && s(0) )
 { l[i]=omo1; r[1124]++; if(dbg){print "R1124"}; continue};
 if ( sc(0,",") && w(1,"чем") )
 { l[i]=omo1; r[1125]++; if(dbg){print "R1125"}; continue};
 #
 if ( w(-1,"весьма довольно достаточно очень самая слишком чересчур") && s(-1) )
 { l[i]=omo2; r[1126]++; if(dbg){print "R1126"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2286 !_#_!
 #  x2286 bolshie1_  bolshie2_   большие  бо́льшие  больши́е
for(wrd in omap["x2286"]){omakevars(x2286,"x2286");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"значительно куда много намного несколько") && s(-1) )
 { l[i]=omo1; r[1127]++; if(dbg){print "R1127"}; continue};
 if ( w(1,"части половины") && s(0) )
 { l[i]=omo1; r[1128]++; if(dbg){print "R1128"}; continue};
 if ( sc(0,",") && w(1,"чем") )
 { l[i]=omo1; r[1129]++; if(dbg){print "R1129"}; continue};
 #
 if ( w(-1,"весьма довольно достаточно очень самые слишком чересчур") && s(-1) )
 { l[i]=omo2; r[1130]++; if(dbg){print "R1130"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2287 !_#_!
 #  x2287 bolshim1_  bolshim2_   большим  бо́льшим  больши́м
for(wrd in omap["x2287"]){omakevars(x2287,"x2287");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"значительно куда много намного несколько") && s(-1) )
 { l[i]=omo1; r[1131]++; if(dbg){print "R1131"}; continue};
 if ( w(1,"частям половинам") && s(0) )
 { l[i]=omo1; r[1132]++; if(dbg){print "R1132"}; continue};
 if ( sc(0,",") && w(1,"чем") )
 { l[i]=omo1; r[1133]++; if(dbg){print "R1133"}; continue};
 if ( pre_tv(-2) &&
       w(-1"чем тем ещё") &&
        q(1,"suw_edtv suw_mntv") && s(-2,0) )
 { l[i]=omo1; r[1134]++; if(dbg){print "R1134"}; continue};
 #
 if ( w(-1,"весьма довольно достаточно очень самым слишком чересчур") && s(-1) )
 { l[i]=omo2; r[1135]++; if(dbg){print "R1135"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2288 !_#_!
 #  x2288 bolshimi1_  bolshimi2_   большими  бо́льшими  больши́ми
for(wrd in omap["x2288"]){omakevars(x2288,"x2288");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"значительно куда много намного несколько") && s(-1) )
 { l[i]=omo1; r[1136]++; if(dbg){print "R1136"}; continue};
 if ( w(1,"частями половинами") && s(0) )
 { l[i]=omo1; r[1137]++; if(dbg){print "R1137"}; continue};
 if ( sc(0,",") && w(1,"чем") )
 { l[i]=omo1; r[1138]++; if(dbg){print "R1138"}; continue};
 #
 if ( w(-1,"весьма довольно достаточно очень самыми слишком чересчур") && s(-1) )
 { l[i]=omo2; r[1139]++; if(dbg){print "R1139"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2289 !_#_!
 #  x2289 bolshih1_  bolshih2_   больших  бо́льших  больши́х
for(wrd in omap["x2289"]){omakevars(x2289,"x2289");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"значительно куда намного") && s(-1) )
 { l[i]=omo1; r[1140]++; if(dbg){print "R1140"}; continue};
 if ( w(1,"частей половин") && s(0) )
 { l[i]=omo1; r[1141]++; if(dbg){print "R1141"}; continue};
 if ( sc(0,",") && w(1,"чем") )
 { l[i]=omo1; r[1142]++; if(dbg){print "R1142"}; continue};
 #
 if ( w(-1,"весьма довольно достаточно очень самых слишком много несколько чересчур") && s(-1) )
 { l[i]=omo2; r[1143]++; if(dbg){print "R1143"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2290 !_#_!
 #  x2290 bolshuu1_  bolshuu2_   большую  бо́льшую  большу́ю
for(wrd in omap["x2290"]){omakevars(x2290,"x2290");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"значительно куда много намного несколько") && s(-1) )
 { l[i]=omo1; r[1144]++; if(dbg){print "R1144"}; continue};
 if ( w(1,"частю половину") && s(0) )
 { l[i]=omo1; r[1145]++; if(dbg){print "R1145"}; continue};
 if ( sc(0,",") && w(1,"чем") )
 { l[i]=omo1; r[1146]++; if(dbg){print "R1146"}; continue};
 #
 if ( w(-1,"весьма довольно достаточно очень самую слишком чересчур") && s(-1) )
 { l[i]=omo2; r[1147]++; if(dbg){print "R1147"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2291 !_#_!
 #  x2291 sw_ez_vr_      sw_mn_iv_  методы  мето́ды  ме́тоды
for(wrd in omap["x2291"]){omakevars(x2291,"x2291");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1148]++; if(dbg){print "R1148", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1149]++; if(dbg){print "R1149", "sw_mn_v_f"}; continue};
 prex=1
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[1150]++; if(dbg){print "R1150", "sw_ez_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2292 !_#_!
 #  x2292 gl_1poed_2inf_  sw_1ez_dpr_2mn_iv_  < извести повести > 
for(wrd in omap["x2292"]){omakevars(x2292,"x2292");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="извести") {
   if ( q(1,"mest_vi suw_edvi suw_mnvi") && s(0) )
   { l[i]=omo1; r[1151]++; if(dbg){print "R1151"}; continue};
 };
 if(iwrd=="повести") {
   if ( q(1,"gl_in mest_vi suw_edvi suw_mnvi") && s(0) )
   { l[i]=omo1; r[1152]++; if(dbg){print "R1152"}; continue};
 };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[1153]++; if(dbg){print "R1153", "gl_poed_f"}; continue};
 #
#if ( gl_in_f() )
#{ l[i]=omo1; r[1154]++; if(dbg){print "R1154"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[1155]++; if(dbg){print "R1155", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[1156]++; if(dbg){print "R1156", "sw_ez_p_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[1157]++; if(dbg){print "R1157", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1158]++; if(dbg){print "R1158", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1159]++; if(dbg){print "R1159", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2293 !_#_!
 #  x2293 sw_em_rz_		sw_mn_iv_  хлеба  хле́ба  хлеба́
for(wrd in omap["x2293"]){omakevars(x2293,"x2293");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pre_ro(-1) && Q(-1,"pre_im pre_vi") && s(-1) )
 { l[i]=omo1; r[1160]++; if(dbg){print "R1160"}; continue};
 if ( q(-1,"pre_im pre_vi") && Q(-1,"pre_ro") && s(-1) )
 { l[i]=omo2; r[1161]++; if(dbg){print "R1161"}; continue};
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; r[1162]++; if(dbg){print "R1162", "sw_em_z_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1163]++; if(dbg){print "R1163", "sw_em_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1164]++; if(dbg){print "R1164", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1165]++; if(dbg){print "R1165", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2294 !_#_!
 #  x2294 sw_es_rz_      sw_mn_iv_
for(wrd in omap["x2294"]){omakevars(x2294,"x2294");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_z_f() )
 { l[i]=omo1; r[1166]++; if(dbg){print "R1166", "sw_es_z_f"}; continue};
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; r[1167]++; if(dbg){print "R1167", "sw_es_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1168]++; if(dbg){print "R1168", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1169]++; if(dbg){print "R1169", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2295 !_#_!
 #  x2295 sw_es_r_		sw_ez_i_ уха  у́ха  уха́
for(wrd in omap["x2295"]){omakevars(x2295,"x2295");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( base(-1,"мочка") && s(-1) )
 { l[i]=omo1; r[1170]++; if(dbg){print "R1170", "sw_es_r_f"}; continue};
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; r[1170]++; if(dbg){print "R1170", "sw_es_r_f"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[1171]++; if(dbg){print "R1171", "sw_ez_i_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2296 !_#_!
 #  x2296 sw_ez_rz_      sw_mn_iv_
for(wrd in omap["x2296"]){omakevars(x2296,"x2296");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="колы") {
   if ( w(-1,"кока перри нюка") && se(-1,"-") )
   { l[i]=omo1; r[1172]++; if(dbg){print "R1172"}; continue};
 };
 if(iwrd=="земли") {
   if ( w(-1,"матери") && se(-1,"-") )
   { l[i]=omo1; r[1173]++; if(dbg){print "R1173"}; continue};
 };
 #
 if ( sw_ez_z_f() )
 { l[i]=omo1; r[1174]++; if(dbg){print "R1174", "sw_ez_z_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[1175]++; if(dbg){print "R1175", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1176]++; if(dbg){print "R1176", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1177]++; if(dbg){print "R1177", "sw_mn_v_f"}; continue};

 if ( wc(-1,"[ео]й$ [ео]йся$") && s(-1) )
 { l[i]=omo1; r[1178]++; if(dbg){print "R1178"}; continue};
 if ( wc(-1,"[иы]е$ [иы]еся$") && s(-1) )
 { l[i]=omo2; r[1179]++; if(dbg){print "R1179"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2297 !_#_!
 #  x2297 sw_em_i_		m3_sw_1em_iv_2mn_r_3deep_   пристав  при́став  приста́в
for(wrd in omap["x2297"]){omakevars(x2297,"x2297");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 # 3 сущ. им.п.: +при́став (од.), -приста́в (неод.), -приста́ва (неод.)
 #
 if ( w(1,"к как") && s(0) )
 { l[i]=omo2; r[1180]++; if(dbg){print "R1180"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[1181]++; if(dbg){print "R1181", "sw_em_i_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2298 !_#_!
 #  x2298 gl_paedmu_	sw_mn_r_
for(wrd in omap["x2298"]){omakevars(x2298,"x2298");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
   if ( gl_in(1) && s(0) )
   { l[i]=omo1; r[1182]++; if(dbg){print "R1182"}; continue};
   if ( w(1,"было") &&
         (q(2,"gl_in isname")||w(2,"он")) && s(0,1) )
   { l[i]=omo1; r[1183]++; if(dbg){print "R1183"}; continue};
   if ( sc(-1,"—") &&
         (isname(1)||suw_edmuim(1)||w(1,"он")) && s(0) )
   { l[i]=omo1; r[1184]++; if(dbg){print "R1184"}; continue};
   if ( q(1,"pre_vi preph_vi") &&
         q(2,"suw_edvi suw_mnvi prl_edvi prl_mnvi prq_edvi prq_mnvi mest_vi") && s(0,1) )
   { l[i]=omo1; r[1185]++; if(dbg){print "R1185"}; continue};
   if ( q(1,"pre_ro preph_ro") &&
         q(2,"suw_edro suw_mnro prl_edro prl_mnro prq_edro prq_mnro mest_ro") && s(0,1) )
   { l[i]=omo1; r[1186]++; if(dbg){print "R1186"}; continue};
   if ( q(1,"pre_tv preph_tv") &&
         q(2,"suw_edtv suw_mntv prl_edtv prl_mntv prq_edtv prq_mntv mest_tv") && s(0,1) )
   { l[i]=omo1; r[1187]++; if(dbg){print "R1187"}; continue};
   if ( pre_pr(1) &&
         q(2,"suw_edpr suw_mnpr prl_edpr prl_mnpr prq_edpr prq_mnpr mest_pr") && s(0,1) )
   { l[i]=omo1; r[1188]++; if(dbg){print "R1188"}; continue};
   if ( gl_in(1) && s(0) )
   { l[i]=omo1; r[1189]++; if(dbg){print "R1189"}; continue};

 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; r[1190]++; if(dbg){print "R1190", "gl_paedmu_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1191]++; if(dbg){print "R1191", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2299 !_#_!
 #  x2299 sw_em_rz_		sw_ez_i_   лука  лу́ка  лука́
for(wrd in omap["x2299"]){omakevars(x2299,"x2299");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; r[1192]++; if(dbg){print "R1192", "sw_em_z_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1193]++; if(dbg){print "R1193", "sw_em_r_f"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[1194]++; if(dbg){print "R1194", "sw_ez_i_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2300 !_#_!
 #  x2300 gl_poed_      sw_1ez_rz_2mn_iv_
for(wrd in omap["x2300"]){omakevars(x2300,"x2300");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="пищи") {
   if ( base(-1,"запас приём") && s(-1) )
   { l[i]=omo2; r[1195]++; if(dbg){print "R1195"}; continue};
 };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[1196]++; if(dbg){print "R1196", "gl_poed_f"}; continue};
 #
 if ( sw_ez_z_f() )
 { l[i]=omo2; r[1197]++; if(dbg){print "R1197", "sw_ez_z_f"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[1198]++; if(dbg){print "R1198", "sw_ez_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1199]++; if(dbg){print "R1199", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1200]++; if(dbg){print "R1200", "sw_mn_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2301 !_#_!
 #  x2301 gl_poed_   sw_1ez_rz_2mn_iv_  пошло  пошло́  по́шло
for(wrd in omap["x2301"]){omakevars(x2301,"x2301");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( base(-1,"звучать выглядеть смотреться быть") && s(-1) )
 { l[i]=omo2; r[1201]++; if(dbg){print "R1201", "gl_paedsr_f"}; continue};

 #
 if ( qxs(-1,"если","на","то")||
      qxs(-1,"если","бы","что-то")||
      qxs(-1,"если","уж","на","то") )
 { l[i]=omo1; r[1202]++; if(dbg){print "R1202"}; continue};
 if ( qxs(1,"не","так")||
      qxs(1,"на","перекосяк") )
 { l[i]=omo1; r[1203]++; if(dbg){print "R1203"}; continue};
 if ( q(1,"pre_vi preph_vi") &&
       q(2,"suw_edvi suw_mnvi") && s(0,1) )
 { l[i]=omo1; r[1204]++; if(dbg){print "R1204"}; continue};

 if ( gl_paedsr_f() )
 { l[i]=omo1; r[1205]++; if(dbg){print "R1205", "gl_paedsr_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2302 !_#_!
 #  x2302 sw_em_p_		sw_ez_dp_ одуш-неодуш.
for(wrd in omap["x2302"]){omakevars(x2302,"x2302");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 #
 if ( w(-1,"на") && s(-1) )
 { l[i]=omo2; r[1206]++; if(dbg){print "R1206", "sw_ez_d_f"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[1207]++; if(dbg){print "R1207", "sw_em_p_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[1208]++; if(dbg){print "R1208", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[1209]++; if(dbg){print "R1209", "sw_ez_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2303 !_#_!
 #  x2303 sw_em_p_		sw_ez_dp_ неодуш.
for(wrd in omap["x2303"]){omakevars(x2303,"x2303");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 if(iwrd=="кружке") {
   if ( w(1,"воды пива вина сока молока жидкости эля") && s(0) )
   { l[i]=omo2; r[1210]++; if(dbg){print "R1210"}; continue};
 };
 if(iwrd=="полке") {
   if ( w(-1,"на") && s(-1) )
   { l[i]=omo2; r[1211]++; if(dbg){print "R1211"}; continue};
 };
 if(iwrd=="спине") {
   prex=0
   if ( sw_em_p_f() )
   { l[i]=omo2; r[1212]++; if(dbg){print "R1212", "sw_em_p_f"}; continue};
   prex=1
 };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[1213]++; if(dbg){print "R1213", "sw_em_p_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[1214]++; if(dbg){print "R1214", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[1215]++; if(dbg){print "R1215", "sw_ez_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2304 !_#_!
 #  x2304 sw_em_d_		sw_ez_v_
for(wrd in omap["x2304"]){omakevars(x2304,"x2304");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[1216]++; if(dbg){print "R1216", "sw_em_d_f"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[1217]++; if(dbg){print "R1217", "sw_ez_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2305 !_#_!
 #  x2305 sw_em_d_		sw_ez_v_
for(wrd in omap["x2305"]){omakevars(x2305,"x2305");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[1218]++; if(dbg){print "R1218", "sw_em_d_f"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[1219]++; if(dbg){print "R1219", "sw_ez_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2306 !_#_!
 #  x2306 sw_em_r_		sw_ez_i_
for(wrd in omap["x2306"]){omakevars(x2306,"x2306");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1220]++; if(dbg){print "R1220", "sw_em_r_f"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[1221]++; if(dbg){print "R1221", "sw_ez_i_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2307 !_#_!
 #  x2307 pl_ems_p_		sw_em_t_   другом  друго́м  дру́гом
for(wrd in omap["x2307"]){omakevars(x2307,"x2307");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2

 if ( base(-1,"быть стать являться") && s(-1) )
 { l[i]=omo2; d[429]++; if(dbg){print "D429"}; continue };
 if ( base(-2,"быть стать являться") &&
       q(-1,"mest_3e") && s(-1) )
 { l[i]=omo2; d[429]++; if(dbg){print "D429"}; continue };

 #
 if ( w(-1,"друг") && s(-1) )
 { l[i]=omo2; r[1222]++; if(dbg){print "R1222", "sw_em_t_f"}; continue};
 if ( q(-2,"suw_edtv suw_mntv") &&
       souz_iili(-1) && s(-2,-1) )
 { l[i]=omo2; r[1223]++; if(dbg){print "R1223", "sw_em_t_f"}; continue};
 #
 if ( sw_em_p_f()||sw_es_p_f()||pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; r[1224]++; if(dbg){print "R1224", "sw_em_p_f||sw_es_p_f||pl_em_p_f||pl_es_p_f"}; continue};
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[1225]++; if(dbg){print "R1225", "sw_em_t_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2308 !_#_!
 #  x2308 m3_nar_1srav_2vrem_3pre_ro_  pl_es_iv_  позднее  поздне́е  по́зднее
for(wrd in omap["x2308"]){omakevars(x2308,"x2308");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_srav_f() )
 { l[i]=omo1; r[1226]++; if(dbg){print "R1226", "pl_srav_f"}; continue};
 #
 if ( w(-1,"значительно куда много намного несколько лишь") && s(-1) )
 { l[i]=omo1; r[1227]++; if(dbg){print "R1227"}; continue};
 if ( nar_vrem_f() )
 { l[i]=omo1; r[1228]++; if(dbg){print "R1228", "nar_vrem_f"}; continue};
#if ( pl_es_v_f() )
#{ l[i]=omo2; r[1229]++; if(dbg){print "R1229", "pl_em_p_f()||pl_es_p_f"}; continue};
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2309 !_#_!
 #  x2309 sw_ems_p_  sw_es_n_  пике  пи́ке  пике́
for(wrd in omap["x2309"]){omakevars(x2309,"x2309");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(-2,"pre_pr") &&
       q(-1,"prl_edsrpr prq_edsrpr") && s(-2,-1) )
 { l[i]=omo1; r[1230]++; if(dbg){print "R1230", "sw_em_p_f||sw_es_p_f"}; continue};
 #
 if ( sw_em_p_f()||sw_es_p_f() )
 { l[i]=omo1; r[1231]++; if(dbg){print "R1231", "sw_em_p_f||sw_es_p_f"}; continue};

 if ( sw_es_i_f()|| sw_es_v_f()||sw_es_v_f()||sw_es_t_f() )
 { l[i]=omo2; r[1232]++; if(dbg){print "R1232", "pl_em_p_f()||pl_es_p_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2310 !_#_!
 #  x2310 sw_emz_dp_	sw_ez_dp_  буре  бу́ре  буре́
for(wrd in omap["x2310"]){omakevars(x2310,"x2310");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; r[1233]++; if(dbg){print "R1233", "sw_ez_d_f"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[1234]++; if(dbg){print "R1234", "sw_em_p_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[1235]++; if(dbg){print "R1235", "sw_ez_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2311 !_#_!
 #  x2311 nar_spos_	 pl_ems_p_  добром  добро́м  до́бром
for(wrd in omap["x2311"]){omakevars(x2311,"x2311");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"прошу") && s(-1) )
 { l[i]=omo1; r[1236]++; if(dbg){print "R1236", "sw_ez_d_f"}; continue};
 #
 if ( pl_em_p_f() )
 { l[i]=omo2; r[1237]++; if(dbg){print "R1237", "sw_ez_d_f"}; continue};
 #
 if ( pl_es_p_f() )
 { l[i]=omo2; r[1238]++; if(dbg){print "R1238", "sw_em_p_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2312 !_#_!
 #  x2312 pl_ez_dprt_	pl_srav_  горячей  горя́чей  горяче́й
for(wrd in omap["x2312"]){omakevars(x2312,"x2312");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_ez_d_f()||pl_ez_p_f()||pl_ez_p_f()||pl_ez_t_f() )
 { l[i]=omo1; r[1239]++; if(dbg){print "R1239", "sw_ez_d_f"}; continue};
 #
 if ( pl_srav_f() )
 { l[i]=omo2; r[1240]++; if(dbg){print "R1240", "sw_em_p_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3001 !_#_!
 #  x3001 gl_paedze_    sw_em_r_   sw_mn_iv_
for(wrd in omap["x3001"]){omakevars(x3001,"x3001");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[1241]++; if(dbg){print "R1241", "sw_em_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo3; r[1242]++; if(dbg){print "R1242", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo3; r[1243]++; if(dbg){print "R1243", "sw_mn_v_f"}; continue};
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; r[1244]++; if(dbg){print "R1244", "gl_paedze_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3002 !_#_!
 #  x3002 gl_paedze_    sw_es_r_   sw_mn_iv_
for(wrd in omap["x3002"]){omakevars(x3002,"x3002");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[1245]++; if(dbg){print "R1245", "sw_es_r_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo3; r[1246]++; if(dbg){print "R1246", "sw_mn_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo3; r[1247]++; if(dbg){print "R1247", "sw_mn_v_f"}; continue};
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; r[1248]++; if(dbg){print "R1248", "gl_paedze_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3003 !_#_!
 #  x3003 nar_napr_     sw_ez_t_   sw_mn_r_
for(wrd in omap["x3003"]){omakevars(x3003,"x3003");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[1249]++; if(dbg){print "R1249", "sw_ez_t_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo3; r[1250]++; if(dbg){print "R1250", "sw_mn_r_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3004 !_#_!
 #  x3004 m2_1sw_mn_i_2deep_na_    sw_em_vr_     sw_ez_i_
for(wrd in omap["x3004"]){omakevars(x3004,"x3004");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[1251]++; if(dbg){print "R1251", "sw_mn_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[1252]++; if(dbg){print "R1252", "sw_em_v_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[1253]++; if(dbg){print "R1253", "sw_em_r_f"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo3; r[1254]++; if(dbg){print "R1254", "sw_ez_i_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3005 !_#_!
 #  x3005 gl_ed1e_      sw_em_d_   sw_ez_v_
for(wrd in omap["x3005"]){omakevars(x3005,"x3005");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[1255]++; if(dbg){print "R1255", "sw_em_d_f"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo3; r[1256]++; if(dbg){print "R1256", "sw_ez_v_f"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[1257]++; if(dbg){print "R1257", "gl_ed1e_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3006 !_#_!
 #  x3006 pl_es_iv_     sw_es_iv_  sw_es_p_
for(wrd in omap["x3006"]){omakevars(x3006,"x3006");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; r[1258]++; if(dbg){print "R1258", "sw_es_i_f"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; r[1259]++; if(dbg){print "R1259", "sw_es_v_f"}; continue};
 #
 if ( sw_es_p_f() )
 { l[i]=omo3; r[1260]++; if(dbg){print "R1260", "sw_es_p_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3007 !_#_!
 #  x3007 sw_em_r_      sw_ez_i_   sw_mn_v_  округа  о́круга  окру́га  округа́
for(wrd in omap["x3007"]){omakevars(x3007,"x3007");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( base(-1,"совет") && s(-1) )
 { l[i]=omo1; r[1261]++; if(dbg){print "R1261"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1262]++; if(dbg){print "R1262", "sw_em_r_f"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[1263]++; if(dbg){print "R1263", "sw_ez_i_f"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo3; r[1264]++; if(dbg){print "R1264", "sw_mn_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3008 !_#_!
 #  x3008 sw_em_l_    sw_em_r_     sw_ez_v_
for(wrd in omap["x3008"]){omakevars(x3008,"x3008");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; r[1265]++; if(dbg){print "R1265", "sw_em_l_f"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[1266]++; if(dbg){print "R1266", "sw_em_r_f"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo3; r[1267]++; if(dbg){print "R1267", "sw_ez_v_f"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3009 !_#_!
 #  x3009 gl_ed3e_  sw_em_iv_  sw_mn_r_
for(wrd in omap["x3009"]){omakevars(x3009,"x3009");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_ed3e_f() )
 { l[i]=omo1; r[1268]++; if(dbg){print "R1268", "gl_ed3e_f"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo3; r[1269]++; if(dbg){print "R1269", "sw_mn_r_f"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[1270]++; if(dbg){print "R1270", "sw_em_i_f"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[1271]++; if(dbg){print "R1271", "sw_em_v_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3010 !_#_!
 #  x3010 gl_mn2e_      sw_em_p_   sw_ez_dp_
for(wrd in omap["x3010"]){omakevars(x3010,"x3010");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; r[1272]++; if(dbg){print "R1272", "sw_em_p_f"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo3; r[1273]++; if(dbg){print "R1273", "sw_ez_d_f"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo3; r[1274]++; if(dbg){print "R1274", "sw_ez_p_f"}; continue};
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; r[1275]++; if(dbg){print "R1275", "gl_mn2e_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3011 !_#_!
 #  x3011 heal_1bud_2pov_  gl_pomn_ gl_mn2e_  выходите  вы́ходите  выходи́те  выхо́дите
for(wrd in omap["x3011"]){omakevars(x3011,"x3011");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn2e_f() )
 { l[i]=omo3; r[1276]++; if(dbg){print "R1276", "gl_mn2e_f"}; continue};
 #
 if ( gl_pomn_f() )
 { l[i]=omo2; r[1277]++; if(dbg){print "R1277", "gl_pomn_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3012 !_#_!
 #  x3012 sw_mn_iv_  sw_es_r_  sw_em_r_  лета  лета́  ле́та  лёта
for(wrd in omap["x3012"]){omakevars(x3012,"x3012");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"жаркого прошлого этого засушливого долгого короткого") && s(-1) )
 { l[i]=omo2; r[1278]++; if(dbg){print "R1278", "gl_pomn_f"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[1279]++; if(dbg){print "R1279", "gl_pomn_f"}; continue};
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[1280]++; if(dbg){print "R1280", "gl_pomn_f"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3013 !_#_!
 #  x3013 sw_1ez_r_2ez_mn_iv_  sw_mn_iv_number_  sw_mn_iv_troop_  четы  четы́  чёты  че́ты
for(wrd in omap["x3013"]){omakevars(x3013,"x3013");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[1281]++; if(dbg){print "R1281", "sw_ez_r_f"}; continue};

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
 { l[i]=omo1; r[1282]++; if(dbg){print "R1282"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x4700 !_#_!
 #  x4700 cost_         stand_   стоит  стОит   стоИт
for(wrd in omap["x4700"]){omakevars(x4700,"x4700");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"того") && sc(1,",") &&
       w(2,"чтобы") )
 { l[i]=omo1; r[1283]++; if(dbg){print "R1283"}; continue};
 #
 if (  qxs(-1,"один","другого")||
       qxs(-1,"мало","что")||
       qxs(-1,"ничего","не")||
       qxs(-1,"друг","друга")  )
 { l[i]=omo1; r[1284]++; if(dbg){print "R1284"}; continue};
 #
 if (  qxs(1,"один","другого")||
       qxs(1,"в","зависимости","от")||
       qxs(1,"мало","что")||
       qxs(1,"ничего","не")||
       qxs(1,"друг","друга")  )
 { l[i]=omo1; r[1285]++; if(dbg){print "R1285"}; continue};
 #
 if ( w(-1,"чего-то") && s(-1) )
 { l[i]=omo1; r[1286]++; if(dbg){print "R1286"}; continue};
 #
 if ( w(1,"дёшево денег дорого недорого немало мало") && s(0) )
 { l[i]=omo1; r[1287]++; if(dbg){print "R1287"}; continue};
 #
 if ( w(-1,"дёшево денег дорого недорого немало мало") && s(-1) )
 { l[i]=omo1; r[1288]++; if(dbg){print "R1288"}; continue};
 #
 if ( qb(-5,-1,"gl_in") && s(qbn,-1) )
 { l[i]=omo1; r[1289]++; if(dbg){print "R1289"}; continue};
 #
 if ( qf(1,5,"gl_in") && s(0,qfn-1) )
 { l[i]=omo1; r[1290]++; if(dbg){print "R1290"}; continue};
 #
 if ( q(-1,"nar_mest nar_spos nar_kaq") && s(-1) )
 { l[i]=omo2; r[1291]++; if(dbg){print "R1291"}; continue};
 if ( q(1,"nar_mest nar_spos nar_kaq") && s(0) )
 { l[i]=omo2; r[1292]++; if(dbg){print "R1292"}; continue};
 #
 if ( pre_ro(1) &&
       q(2,"suw_edro suw_mnro prl_edro prl_mnro prq_edro prq_mnro mest_ro") && s(0,1) )
 { l[i]=omo2; r[1293]++; if(dbg){print "R1293"}; continue};
 #
 if ( pre_pr(1) &&
       q(2,"suw_edpr suw_mnpr prl_edpr prl_mnpr prq_edpr prq_mnpr mest_pr") && s(0,1) )
 { l[i]=omo2; r[1294]++; if(dbg){print "R1294"}; continue};
 #
 if ( pre_tv(1) &&
       q(2,"suw_edtv suw_mntv prl_edtv prl_mntv prq_edtv prq_mntv mest_tv") && s(0,1) )
 { l[i]=omo2; r[1295]++; if(dbg){print "R1295"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4701 !_#_!
 #  x4701 comeout_    heal_    выходить  выходи́ть  вы́ходить
for(wrd in omap["x4701"]){omakevars(x4701,"x4701");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(1,"pre_vi") &&
       q(2,"suw_edvi suw_mnvi prl_edvi prl_mnvi prq_edvi prq_mnvi mest_vi") && s(0,1) )
 { l[i]=omo1; r[1296]++; if(dbg){print "R1296"}; continue};
 if ( q(1,"pre_ro") &&
       q(2,"suw_edro suw_edda suw_mnro prl_edro prl_mnro prq_edro prq_mnro mest_ro") && s(0,1) )
 { l[i]=omo1; r[1297]++; if(dbg){print "R1297"}; continue};
 if ( q(1,"pre_da") &&
       q(2,"suw_edda suw_mnda prl_edda prl_mnda prq_edda prq_mnda mest_da") && s(0,1) )
 { l[i]=omo1; r[1298]++; if(dbg){print "R1298"}; continue};
 if ( pre_pr(1) &&
       q(2,"suw_edpr suw_edme suw_mnpr prl_edpr prl_mnpr prq_edpr prq_mnpr mest_pr") && s(0,1) )
 { l[i]=omo1; r[1299]++; if(dbg){print "R1299"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4702 !_#_!
 #  x4702 know_    lead_    введение  ве́дение  веде́ние
for(wrd in omap["x4702"]){omakevars(x4702,"x4702");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="находиться передать передавать передаваться быть"
 if ( w(-2,"в") &&
      q(-1,"mest_vi mest_pr") &&
       q(0,"suw_edvi suw_mnvi suw_edpr suw_mnpr") &&
	    q(1,"suw_edro suw_mnro") &&
	     base(2,cst) && s(-2,1) )
 { l[i]=omo1; r[1300]++; if(dbg){print "R1300"}; continue};
 if ( w(-2,"в") &&
      q(-1,"mest_vi mest_pr") &&
       q(0,"suw_edvi suw_mnvi suw_edpr suw_mnpr") &&
	    base(1,cst) && s(-2,0) )
 { l[i]=omo1; r[1301]++; if(dbg){print "R1301"}; continue};
 #
 if ( prl_kred_sr(1) &&
      q(2,"prl_edro prl_mnro prq_edro prq_mnro mest_ro") &&
       q(3,"prl_edro prl_mnro prq_edro prq_mnro mest_ro suw_edro suw_mnro") && s(0,2) )
 { l[i]=omo2; r[1302]++; if(dbg){print "R1302"}; continue};
 if ( q(1,"prl_edro prl_mnro prq_edro prq_mnro mest_ro") &&
       q(2,"suw_edro suw_mnro") && s(0,1) )
 { l[i]=omo2; r[1303]++; if(dbg){print "R1303"}; continue};
 if ( q(1,"suw_edro suw_mnro") && s(0) )
 { l[i]=omo2; r[1304]++; if(dbg){print "R1304"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4703 !_#_!
 #  x4703 temp_    time_    временной  вре́менной  временно́й
for(wrd in omap["x4703"]){omakevars(x4703,"x4703");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"пространственно") && se(-1,"-") )
 { l[i]=omo2; r[1305]++; if(dbg){print "R1305"}; continue};
 #
 if(iwrd=="временной") {
   if ( q(1,"suw_edmuim suw_edmuvi") && s(0) )
   { l[i]=omo2; r[1306]++; if(dbg){print "R1306"}; continue};
 };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4704 !_#_!
 #  x4704 disperse_  herumlauf_    разбегаться  разбега́ться  разбе́гаться
for(wrd in omap["x4704"]){omakevars(x4704,"x4704");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(0,"gl_in") && q(-1,"mod_ed mod_bz mod_mn") && s(-1) )
 { l[i]=omo1; r[1307]++; if(dbg){print "R1307"}; continue};
 if ( q(0,"gl_navzmn") && q(1,"gl_namn gl_navzmn") && sc(0,",") )
 { l[i]=omo1; r[1308]++; if(dbg){print "R1308"}; continue};
 if ( q(0,"gl_pavzmn") && q(1,"gl_pamn") && sc(0,",") )
 { l[i]=omo1; r[1309]++; if(dbg){print "R1309"}; continue};
 if ( q(0,"gl_buvzmn") && q(1,"gl_bumn") && sc(0,",") )
 { l[i]=omo1; r[1310]++; if(dbg){print "R1310"}; continue};
 if ( q(0,"gl_povzmn") )
 { l[i]=omo1; r[1311]++; if(dbg){print "R1311"}; continue};
 if ( pre_pr(1) &&
       q(2,"prl_edro suw_mnro prq_edro prq_mnro") &&
        q(3,"suw_edro suw_mnro") && s(0,2) )
 { l[i]=omo1; r[1312]++; if(dbg){print "R1312"}; continue};
 if ( pre_ro(1) &&
       q(2,"suw_edro suw_mnro") && s(0,1) )
 { l[i]=omo1; r[1313]++; if(dbg){print "R1313"}; continue};
 if ( pre_pr(1) &&
       q(2,"prl_edpr suw_mnpr prq_edpr prq_mnpr") &&
        q(3,"suw_edpr suw_mnpr") && s(0,2) )
 { l[i]=omo1; r[1314]++; if(dbg){print "R1314"}; continue};
 if ( pre_pr(1) &&
       q(2,"suw_edpr suw_mnpr") && s(0,1) )
 { l[i]=omo1; r[1315]++; if(dbg){print "R1315"}; continue};
 if ( pre_pr(-2) &&
       q(-1,"suw_edpr suw_mnpr") && s(-2,-1) )
 { l[i]=omo1; r[1316]++; if(dbg){print "R1316"}; continue};
 if ( sc(0,",") &&
       w(1,"как словно") &&
        q(2,"suw_edim suw_mnim") && s(1) )
 { l[i]=omo1; r[1317]++; if(dbg){print "R1317"}; continue};
 if ( sc(0,",") &&
       w(1,"как словно") &&
        q(2,"prl_edim prl_mnim") &&
         q(3,"suw_edim suw_mnim") && s(1,2) )
 { l[i]=omo1; r[1318]++; if(dbg){print "R1318"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4777 !_#_!
 #  x4777 forced_       none_
for(wrd in omap["x4777"]){omakevars(x4777,"x4777");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 l[i]=omo1; r[1319]++; if(dbg){print "R1319"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer


### THE_x_END !_#_!

# вывести изменённую строку

for (i in book) { print book[i] }

#dbg = 1
#dbgstat = 1;
#cmd = "rm _stat.txt _yo.txt _vsez.txt"
#if (dbgstat==1) {system(cmd); for (i=1; i<=1319; i++) { printf ("%s%s %s %s\n", "R", i, "=", r[i]) >> "_stat.txt"};
#for (i in prevyo) {print i, prevyo[i] >> "_yo.txt"}
#for (i in vsez) { print i, vsez[i] >> "_vsez.txt" }
#                }
#
# for (var in SYMTAB) { if (var ~ /^[a-zA-Z_]/) print var };

  }
###_END_###
