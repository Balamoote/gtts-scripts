END { FS = savefs

### все !_#_!

 VSEVSO_F() # <<< правила находятся в файле vsevso.awk

### x1000 !_#_!
 #  x1000 klitika_  none_
xgrp="x1000";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"Ykl") && notsym(-1,unxy) && s(-1) )
 { l[i-1]=gensub(/([АЕЁИОУЫЭЮЯаеёиоуыэюя])/,"\\1\xcc\x81",1,l[i-1]); l[i]=gensub(/^(.)/,"\xcc\xa0\\1\xcc\xad",1,l[i]); R[1]++; if(dbg){print "R1", "klitika"}; continue };

 l[i]=omo2; R[2]++; if(dbg){print "R2", "def"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1001 !_#_!
 #  x1001 gl_pomn_      zalt_
xgrp="x1001";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pomn_f() )
 { l[i]=omo1; R[3]++; if(dbg){print "R3", "gl_pomn_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1002 !_#_!
 #  x1002 pq_kr_em_     zalt_    ( zalt2_) по типу избе́га́ем
xgrp="x1002";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
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
xgrp="x1003";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[6]++; if(dbg){print "R6", "sw_em_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1004 !_#_!
 #  x1004 sw_1em_vr_2mn_iv_   zalt_
xgrp="x1004";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
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
xgrp="x1005";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
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
xgrp="x1006";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[14]++; if(dbg){print "R14", "sw_em_d_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1007 !_#_!
 #  x1007 sw_em_i_      zalt_
xgrp="x1007";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[15]++; if(dbg){print "R15", "sw_em_i_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1008 !_#_!
 #  x1008 sw_em_iv_     zalt_
xgrp="x1008";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
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
xgrp="x1009";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
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
xgrp="x1010";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_t_f() )
 { l[i]=omo1; R[21]++; if(dbg){print "R21", "sw_es_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1011 !_#_!
 #  x1011 sw_ez_d_      zalt_
xgrp="x1011";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; R[22]++; if(dbg){print "R22", "sw_ez_d_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1012 !_#_!
 #  x1012 sw_ez_dp_     zalt_
xgrp="x1012";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
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
xgrp="x1013";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; R[25]++; if(dbg){print "R25", "sw_ez_i_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1014 !_#_!
 #  x1014 sw_ez_r_      zalt_  одуш.  казачки  каза́чки  казачки́
xgrp="x1014";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[26]++; if(dbg){print "R26", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1015 !_#_!
 #  x1015 sw_ez_v_      zalt_  шлепку  шлёпку  шлепку́
xgrp="x1015";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; R[27]++; if(dbg){print "R27", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1016 !_#_!
 #  x1016 sw_mn_iv_     zalt_  дельца тельца
xgrp="x1016";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
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
xgrp="x1017";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_p_f() )
 { l[i]=omo1; R[30]++; if(dbg){print "R30", "sw_mn_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1018 !_#_!
 #  x1018 sw_em_v_      zalt_  парю  па́рю  парю́
xgrp="x1018";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[31]++; if(dbg){print "R31", "sw_em_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1019 !_#_!
 #  x1019 hyphdef_word_   default_
xgrp="x1019";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"YHYS") && se(-1,"-") )
 { l[i]=omo1; R[32]++; if(dbg){print "R32"}; continue };
 if ( !(sc(-1,"-")||s1(0,"-")) )
 { l[i]=omo2; R[33]++; if(dbg){print "R33"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1020 !_#_!
 #  x1020 hyphany_word_  (default_)
xgrp="x1020";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(-1,"-") )
 { l[i]=omo1; R[34]++; if(dbg){print "R34"}; continue };

 # l[i]=omo2; R[35]++; if(dbg){print "R35"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1021 !_#_!
 #  x1021 hyph1_word_hyph2_    word_
xgrp="x1021";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
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
xgrp="x1022";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
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
xgrp="x1023";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( s1(0,"-") )
 { l[i]=omo1; R[43]++; if(dbg){print "R43"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1024 !_#_!
 #  x1024 sw_em_v_  (zalt_)
xgrp="x1024";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(-1,"pre_vi preph_vi") && s(-1) )
 { l[i]=omo1; R[44]++; if(dbg){print "R44"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1025 !_#_!
 #  x1025 tem_je_       тем  те́м
xgrp="x1025";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 l[i]=omo1; R[45]++; if(dbg){print "R45"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1026 !_#_!
 #  x1026 orgbody_      orgplay_ орган  о́рган ... орга́н ...
xgrp="x1026";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="власти дыхания здравоохранения зрения обоняния осязания порядка правопорядка самоуправления слуха управления чувств";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[46]++; if(dbg){print "R46"}; continue };
 #
 cst="внутренний государственный местный официальный полицейский половой руководящий советский союзный судебный федеральный хватательный чувствительный \
      электровосприимчивый";
 if ( bw(-1,cst) && s(-1) )
 { l[i]=omo1; R[47]++; if(dbg){print "R47"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1027 !_#_!
 #  x1027 sw_1em_d_2ez_v_  sw_em_dz_     парку  па́рку  парку́
xgrp="x1027";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[48]++; if(dbg){print "R48", "sw_em_d_f"}; continue };
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; R[49]++; if(dbg){print "R49", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; R[50]++; if(dbg){print "R50", "sw_ez_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1028 !_#_!
 #  x1028 pq_kr_em_     pl_kr_em_   проклят  про́клят  прокля́т
xgrp="x1028";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pq_kr_em_f() )
 { l[i]=omo1; R[51]++; if(dbg){print "R51", "pq_kr_em_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1029 !_#_!
 #  x1029 pq_kr_es_     pl_kr_es_   проклято  про́клято  прокля́то
xgrp="x1029";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="будет буду будь было оно стало ты я";
 if ( w(-1,cst)||suw_edsrim(-1) && s(-1) )
 { l[i]=omo1; R[52]++; if(dbg){print "R52"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1030 !_#_!
 #  x1030 pq_kr_ez_     pl_kr_ez_   проклята  про́клята  прокля́та
xgrp="x1030";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="будет будь была она стала ты я";
 if ( w(-1,cst)||suw_edmuim(-1) && s(-1) )
 { l[i]=omo1; R[53]++; if(dbg){print "R53"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1031 !_#_!
 #  x1031 pq_kr_mn_     pl_kr_mn_   прокляты  про́кляты  прокля́ты
xgrp="x1031";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="будут будь были вы мы они стали";
 if ( w(-1,cst)||suw_edmuim(-1) && s(-1) )
 { l[i]=omo1; R[54]++; if(dbg){print "R54"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1032 !_#_!
 #  x1032 ghost_        parfume_   духами  ду́хами  духа́ми
xgrp="x1031";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="добрыми злыми лесными подземными светлыми темными";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[55]++; if(dbg){print "R55"}; continue };
 #
 cst="благоухание благоухать вонь вонять запах запахнуть пользоваться";
 if ( bw(-1,cst) && s(-1) )
 { l[i]=omo2; R[56]++; if(dbg){print "R56"}; continue };
 cst="дешевыми дорогими женскими модными мужскими тошнотворными";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[57]++; if(dbg){print "R57"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1033 !_#_!
 #  x1033 ghost_        parfume_  духах  ду́хах  духа́х
xgrp="x1033";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="добрых злых лесных подземных светлых темных тысячи";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[58]++; if(dbg){print "R58"}; continue };
 #
 cst="дешевых дорогих женских модных мужских тошнотворных";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[59]++; if(dbg){print "R59"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1034 !_#_!
 #  x1034 ghost_        parfume_  духи  ду́хи  духи́
xgrp="x1034";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="добрые злые лесные подземные светлые темные";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[60]++; if(dbg){print "R60"}; continue };
 #
 cst="дешевые дорогие женские модные мужские тошнотворные";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[61]++; if(dbg){print "R61"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1035 !_#_!
 #  x1035 ghost_        parfume_  духов  ду́хов  духо́в
xgrp="x1035";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="вонь добрых злых лесных подземных светлых темных тысяч";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[62]++; if(dbg){print "R62"}; continue };
 cst="впустить вызвать вызывать выпускать выпустить выпусть заклинатель заклинать призвание призывать укротитель укротить укрощать";
 if ( bw(-1,cst) && s(-1) )
 { l[i]=omo1; R[63]++; if(dbg){print "R63"}; continue };
 #
 cst="дешевых дорогих женских модных мужских тошнотворных";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[64]++; if(dbg){print "R64"}; continue };
 cst="аромат благоухание вонь вонять запах изготовление пользоваться флакон шлейф";
 if ( bw(-1,cst) && s(-1) )
 { l[i]=omo2; R[65]++; if(dbg){print "R65"}; continue };
 if ( wc(-2,cst) &&
       q(-1,"mest_ro prl_ro") && s(-2,-1) )
 { l[i]=omo2; R[66]++; if(dbg){print "R66"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1036 !_#_!
 #  x1036 dare_        sweep_  смели  сме́ли  смели́
xgrp="x1036";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_in(-2) &&
          w(-1,"не") && s(-2,-1) )
 { l[i]=omo1; R[67]++; if(dbg){print "R67"}; continue };
 if ( gl_in(1) && s(0) )
 { l[i]=omo1; R[68]++; if(dbg){print "R68"}; continue };
 cst="даже лишь";
 if ( w(1,cst) &&
  gl_in(2) && s(0,1) )
 { l[i]=omo1; R[69]++; if(dbg){print "R69"}; continue };
 #
 if ( pre_ro(1) &&
           q(2,"suw_ro") && s(0,1) )
 { l[i]=omo2; R[70]++; if(dbg){print "R70"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1037 !_#_!
 #  x1037 sw_ez_r_      zalt_     одуш-неодуш (мн.ч. оба) белки  белки  белки
xgrp="x1037";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[71]++; if(dbg){print "R71", "sw_ez_r_f"}; continue };
 #
#if ( sw_mn_i_f() )
#{ l[i]=omo2; R[72]++; if(dbg){print "R72", "sw_mn_i_f"}; continue };
##
#if ( sw_mn_v_f() )
#{ l[i]=omo2; R[73]++; if(dbg){print "R73", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1038 !_#_!
 #  x1038 sw_ez_r_      zalt_    неодуш. дрючки  дрю́чки  дрючки́
xgrp="x1038";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if(iwrd=="дрючки") {
   if ( w(-1,"штучки") && sc(-1,"-") )
   { l[i]=omo1; R[74]++; if(dbg){print "R74"}; continue };
 };

 if ( sw_ez_r_f() )
 { l[i]=omo1; R[75]++; if(dbg){print "R75", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1039 !_#_!
 #  x1039 sw_ez_r_      zalt_     лады  ла́ды  лады́
xgrp="x1039";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( qxs(-1,"на","все") )
 { l[i]=omo2; R[76]++; if(dbg){print "R76", "sw_ez_r_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[77]++; if(dbg){print "R77", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1040 !_#_!
 #  x1040 sw_ez_r_      zalt_     заморозки  заморо́зки  за́морозки
xgrp="x1040";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[78]++; if(dbg){print "R78", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1041 !_#_!
 #  x1041 pointer_      shooter_     стрелки  стре́лки  стрелки́ (формы мн.ч., морфологически неразличимые никак)
xgrp="x1041";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="датчик детектор диск индикатор прибор счётчик циферблат часы";
 if ( bw(1,cst) && s(0) )
 { l[i]=omo1; R[79]++; if(dbg){print "R79"}; continue };
 if ( pre_pr(1) &&
          bw(2,cst) && s(0,1) )
 { l[i]=omo1; R[80]++; if(dbg){print "R80"}; continue };
 if ( (q(1,"qik_ro")||ba(1,"_numeral")) &&
      bw(2,cst) && s(0,1) )
 { l[i]=omo1; R[81]++; if(dbg){print "R81"}; continue };
 #
 if ( bw(-1,"меткий") && s(-1) )
 { l[i]=omo2; R[82]++; if(dbg){print "R82"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[83]++; if(dbg){print "R83", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1042 !_#_!
 #  x1042 sw_ez_r_      zalt_     стрелок  стре́лок  стрело́к
xgrp="x1042";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( name_im_sy(1) && s(0) )
 { l[i]=omo1; R[84]++; if(dbg){print "R84"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[85]++; if(dbg){print "R85", "sw_em_i_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[86]++; if(dbg){print "R86", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1043 !_#_!
 #  x1043 sw_ez_r_      zalt_     стрелка  стре́лка  стрелка́
xgrp="x1043";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[87]++; if(dbg){print "R87", "sw_ez_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[88]++; if(dbg){print "R88", "sw_em_v_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[89]++; if(dbg){print "R89", "sw_em_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1044 !_#_!
 #  x1044 sw_ez_r_      zalt_     стрелке  стре́лке  стрелке́
xgrp="x1044";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[90]++; if(dbg){print "R90", "sw_em_p_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[91]++; if(dbg){print "R91", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[92]++; if(dbg){print "R92", "sw_ez_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1045 !_#_!
 #  x1045 sw_ez_r_      zalt_     стрелку  стре́лку  стрелку́
xgrp="x1045";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[93]++; if(dbg){print "R93", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[94]++; if(dbg){print "R94", "sw_ez_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1046 !_#_!
 #  x1046 stola_      table_     стола  сто́ла  стола́
xgrp="x1046";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="стола") {
   if ( q(-1,"prl_edzeim prq_edzeim mest_pedzeim") && s(-1) )
   { l[i]=omo1; R[95]++; if(dbg){print "R95"}; continue };
 };
 if(iwrd=="столе") {
   if ( q(-1,"prl_edzeda prq_edzeda mest_pedzeda") && s(-1) )
   { l[i]=omo1; R[96]++; if(dbg){print "R96"}; continue };
 };
 if(iwrd=="столу") {
   if ( q(-1,"prl_edzevi prq_edzevi mest_pedzevi") && s(-1) )
   { l[i]=omo1; R[97]++; if(dbg){print "R97"}; continue };
 };
 if(iwrd=="столы") {
   if ( q(-1,"prl_edzero prq_edzero mest_pedzero") && s(-1) )
   { l[i]=omo1; R[98]++; if(dbg){print "R98"}; continue };
 };

 # стол - по дефолту, стола - "одежда" - добавлять при обнаружении
 l[i]=omo2; R[99]++; if(dbg){print "R99", "table_"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1047 !_#_!
 #  x1047 m2_1pl_kr_es_2nar_     nar_     полно  по́лно  полно́
xgrp="x1047";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"полным") && sc(-1,"-") )
 { l[i]=omo2; R[100]++; if(dbg){print "R100", "sw_em_d_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1048 !_#_!
 #  x1048 mest_ems_p_     pl_kr_em_     нем  нём  не́м
xgrp="x1048";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="в на о об по при";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[101]++; if(dbg){print "R101"}; continue };

 l[i]=omo2; R[102]++; if(dbg){print "R102"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1049 !_#_!
 #  x1049 aufrenn_  einrenn_   забегать забе́гать забега́ть и производные
xgrp="x1049";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="вбок вверх влево вниз вперед вправо";
 if ( w(1,cst) && s(0) )
 { l[i]=omo2; R[103]++; if(dbg){print "R103"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1050 !_#_!
 #  x1050 disappear_  divide_   делись  де́лись  дели́сь
xgrp="x1050";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( wb(-5,-1,"куда никуда они вы мы") && s(wbn,-1) )
 { l[i]=omo1; R[104]++; if(dbg){print "R104"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1051 !_#_!
 #  x1051 hday_  noon_   полудне  полудне́  полу́дне
xgrp="x1051";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="езды лету пути ходьбы";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[105]++; if(dbg){print "R105"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1052 !_#_!
 #  x1052 hday_  noon_   полудню  полудню́  полу́дню
xgrp="x1052";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="езды лету пути ходьбы";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[106]++; if(dbg){print "R106"}; continue };
 if ( w(-1,"к") && s(-1) )
 { l[i]=omo2; R[107]++; if(dbg){print "R107"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1053 !_#_!
 #  x1053 hday_  noon_   полудня  полудня́  полу́дня
xgrp="x1053";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(1,"suw_ro") && s(0) )
 { l[i]=omo1; R[108]++; if(dbg){print "R108"}; continue };
 if ( q(-1,"pre_ro preph_ro") && s(-1) )
 { l[i]=omo2; R[109]++; if(dbg){print "R109"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1054 !_#_!
 #  x1054 gl_bued1e_  gl_naed1e_   признаюсь  призна́юсь  признаю́сь
xgrp="x1054";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( p(-1) && p(0) )
 { l[i]=omo1; R[110]++; if(dbg){print "R110"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1055 !_#_!
 #  x1055 mill_  wind_  ветряная  ветряна́я  ве́тряная
xgrp="x1055";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="двигатель мельница турбина установка";
 if ( bw(1,cst) && s(0) )
 { l[i]=omo1; R[111]++; if(dbg){print "R111"}; continue };
 if ( bw(1,"оспа") && s(0) )
 { l[i]=omo2; R[112]++; if(dbg){print "R112"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1056 !_#_!
 #  x1056 mehl_  pain_  мука  мука́  му́ка
xgrp="x1056";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="белая каменный качественный косный низносортный овсяный пшеничный ржаной серая солёный сырой";
 if ( bw(-1,cst) && s(-1) )
 { l[i]=omo1; R[113]++; if(dbg){print "R113"}; continue };

 cst="внутренний душевный звенящий истинный мучительный настоящий невыносимый немыслимый нестерпимый острый подлинный сильный страшный сущий ужасающий";
 if ( bw(-1,cst) && s(-1) )
 { l[i]=omo2; R[114]++; if(dbg){print "R114"}; continue };
 if ( q(1,"mest_da suw_da") &&
      w(2,"с") &&
      q(3,"mest_tv suw_tv") && s(0,2) )
 { l[i]=omo2; R[115]++; if(dbg){print "R115"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1057 !_#_!
 #  x1057 mehl_  pain_  (sw_ez_rz_  sw_mn_iv_)  муки  муки́  му́ки
xgrp="x1057";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="белая каменный качественный косный низносортный овсяный пшеничный ржаной серая солёный сырой";
 if ( bw(-1,cst) && s(-1) )
 { l[i]=omo1; R[116]++; if(dbg){print "R116"}; continue };

 cst="внутренний душевный звенящий изнурительный истинный мучительный настоящий невыносимый немыслимый нестерпимый острый подлинный сильный страшный сущий \
      ужасающий";
 if ( bw(-1,cst) && s(-1) )
 { l[i]=omo2; R[117]++; if(dbg){print "R117"}; continue };
 #
 if ( sw_ez_z_f() )
 { l[i]=omo1; R[118]++; if(dbg){print "R118", "sw_ez_z_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[119]++; if(dbg){print "R119", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[120]++; if(dbg){print "R120", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[121]++; if(dbg){print "R121", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1058 !_#_!
 #  x1058 atmen_  croak_  дохнуть  дохну́ть  до́хнуть
xgrp="x1058";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="вонь перегар смрад тепло холод";
 if ( q(1,"suw_tv") && bw(1,cst) && s(0) )
 { l[i]=omo1; R[122]++; if(dbg){print "R122"}; continue };

#cst="";
#if ( bw(-1,cst) && s(-1) )
#{ l[i]=omo2; R[123]++; if(dbg){print "R123"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1059 !_#_!
 #  x1059 cowards_  trunks_  трусы  тру́сы  трусы́
xgrp="x1059";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
#cst="вонь перегар смрад тепло холод";
#if ( q(1,"suw_tv") && bw(1,cst) && s(-1) )
#{ l[i]=omo1; R[124]++; if(dbg){print "R124"}; continue };

#cst="";
#if ( bw(-1,cst) && s(-1) )
#{ l[i]=omo2; R[125]++; if(dbg){print "R125"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1060 !_#_!
 #  x1060 afraid_  shake_  трусить  тру́сить  труси́ть
xgrp="x1060";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
#cst="вонь перегар смрад тепло холод";
#if ( q(1,"suw_tv") && bw(1,cst) && s(-1) )
#{ l[i]=omo1; R[126]++; if(dbg){print "R126"}; continue };

#cst="";
#if ( bw(-1,cst) && s(-1) )
#{ l[i]=omo2; R[127]++; if(dbg){print "R127"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1061 !_#_!
 #  x1061 circum_  okrug_  окружной  окру́жной  окружно́й
xgrp="x1061";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="администратор инспектор начальник прокурор совет суд";
 if ( bw(1,cst) && s(0) )
 { l[i]=omo2; R[128]++; if(dbg){print "R128"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1062 !_#_!
 #  x1062 domain_  furnace_  доменный  доме́нный  до́менный
xgrp="x1062";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2

 cst="печь производство технология";
 if ( bw(1,cst) && s(0) )
 { l[i]=omo2; R[129]++; if(dbg){print "R129"}; continue };
 #
 cst="владение организация структура";
 if ( q(1,"prl_any") && bw(1,cst) && s(0) )
 { l[i]=omo1; R[130]++; if(dbg){print "R130"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1063 !_#_!
 #  x1063 word_hyphdef_  (default_)
xgrp="x1063";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="полна полно полны";
 if ( sc(0,"-") && w(1,cst) )
 { l[i]=omo1; R[131]++; if(dbg){print "R131"}; continue };

 l[i]=omo2; R[132]++; if(dbg){print "R132"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1064 !_#_!
 #  x1064 poduwam_  zalt_  душам  душа́м  ду́шам
xgrp="x1064";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="беседовать говорить побеседовать поговорить";
 if ( w(-1,"по") && qb(-5,-2,"gl_in gl_ed gl_mn deep gl_poed gl_pomn prq_any") &&
     bw(qbn,cst) && s(qbn,-1) )
 { l[i]=omo1; R[133]++; if(dbg){print "R133"}; continue };
 if ( w(-1,"по") && vvb(-5,-2) && qb(vvn-5,vvn,"gl_in gl_ed gl_mn deep gl_poed gl_pomn prq_any") &&
     bw(qbn,cst) && s(-1) )
 { l[i]=omo1; R[134]++; if(dbg){print "R134"}; continue };

 l[i]=omo2; R[135]++; if(dbg){print "R135"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1065 !_#_!
 #  x1065 pore_  time_  порах  по́рах  пора́х
xgrp="x1065";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qxs(-1,"на","первых") )
 { l[i]=omo2; R[136]++; if(dbg){print "R136"}; continue };

 l[i]=omo1; R[137]++; if(dbg){print "R137"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1066 !_#_!
 #  x1066 regiment_  shelf_  полках  полка́х  по́лках
xgrp="x1066";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if(iwrd=="полках") {
   if ( w(-2,"на") &&
        q(-1,"prl_mnpr prq_mnpr") && s(-2,-1) )
   { l[i]=omo2; R[138]++; if(dbg){print "R138"}; continue };
   if ( w(-1,"на") && s(-1) )
   { l[i]=omo2; R[139]++; if(dbg){print "R139"}; continue };
 };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1067 !_#_!
 #  x1067 sw_ez_r_      zalt_    пары  па́ры  пары́
xgrp="x1067";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="влюбленные крепкие супружеские";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[140]++; if(dbg){print "R140"}; continue };
 cst="гулять идти кружиться танцевать";
 if ( bw(-1,cst) && s(-1) )
 { l[i]=omo1; R[141]++; if(dbg){print "R141"}; continue };
 #
 cst="зловонные серные химические ядовитые";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[142]++; if(dbg){print "R142"}; continue };

 if ( sw_ez_r_f() )
 { l[i]=omo1; R[143]++; if(dbg){print "R143", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1068 !_#_!
 #  x1068 eye_    peephole_    глазки  гла́́зки  глазки́
xgrp="x1068";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="бегать блестеть";
 if ( bw(-1,cst) && s(-1) )
 { l[i]=omo1; R[144]++; if(dbg){print "R144"}; continue };
 cst="блестящий голубой злобный злой красный крошечный маленький поросячий свиной сонный цепкий";
 if ( bw(-1,cst) && s(-1) )
 { l[i]=omo1; R[145]++; if(dbg){print "R145"}; continue };
 #
 cst="пуговка щёлочка";
 if ( sc(0,"-") &&
      bw(1,cst) )
 { l[i]=omo1; R[146]++; if(dbg){print "R146"}; continue };

 if ( q(1,"isname") && s(0) )
 { l[i]=omo1; R[147]++; if(dbg){print "R147"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1069 !_#_!
 #  x1069 holey_    honst_    честной  честно́й  че́стной
xgrp="x1069";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="честная") {
   if ( w(-1,"мать") && s(-1) )
   { l[i]=omo1; R[148]++; if(dbg){print "R148"}; continue };
 };
 #
 if ( bw(-1,"весь") &&
      bw(1,"народ компания") && s(-1,0) )
 { l[i]=omo1; R[149]++; if(dbg){print "R149"}; continue };
 #
 l[i]=omo2; R[150]++; if(dbg){print "R150"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1070 !_#_!
 #  x1070 cursed_    damned_    проклятый  про́клятый  прокля́тый (полная форма)
xgrp="x1070";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( bw(1,"душа") && s(0) )
 { l[i]=omo1; R[151]++; if(dbg){print "R151"}; continue };

 if(iwrd=="проклятого") {
   if ( q(1,"suw_edmuro suw_edsrro name_ro_sy") && s(0) )
   { l[i]=omo2; R[152]++; if(dbg){print "R152"}; continue };
 };
 if(iwrd=="проклятое") {
   if ( q(1,"suw_edsrim") && s(0) )
   { l[i]=omo2; R[153]++; if(dbg){print "R153"}; continue };
 };
 if(iwrd=="проклятом") {
   if ( q(1,"suw_edmupr suw_edsrpr") && s(0) )
   { l[i]=omo2; R[154]++; if(dbg){print "R154"}; continue };
 };
 if(iwrd=="проклятому") {
   if ( q(1,"suw_edmuda suw_edsrda") && s(0) )
   { l[i]=omo2; R[155]++; if(dbg){print "R155"}; continue };
 };
 if(iwrd=="проклятой") {
   if ( q(1,"suw_edzeda suw_edzero suw_edzetv suw_edzepr") && s(0) )
   { l[i]=omo2; R[156]++; if(dbg){print "R156"}; continue };
 };
 if(iwrd=="проклятою") {
   if ( q(1,"suw_edzetv") && s(0) )
   { l[i]=omo2; R[157]++; if(dbg){print "R157"}; continue };
 };
 if(iwrd=="проклятую") {
   if ( q(1,"suw_edzeim") && s(0) )
   { l[i]=omo2; R[158]++; if(dbg){print "R158"}; continue };
 };
 if(iwrd=="проклятые") {
   if ( w(-1,"как") && s(-1) && (p(0)||q_w(1,"pre_any")) )
   { l[i]=omo2; R[159]++; if(dbg){print "R159"}; continue };
   if ( q(1,"suw_mnim") && s(0) )
   { l[i]=omo2; R[160]++; if(dbg){print "R160"}; continue };
 };
 if(iwrd=="проклятый") {
   if ( q(1,"suw_edmuim") && s(0) )
   { l[i]=omo2; R[161]++; if(dbg){print "R161"}; continue };
 };
 if(iwrd=="проклятым") {
   if ( q(1,"suw_mnda") && s(0) )
   { l[i]=omo2; R[162]++; if(dbg){print "R162"}; continue };
 };
 if(iwrd=="проклятыми") {
   if ( q(1,"suw_mntv") && s(0) )
   { l[i]=omo2; R[163]++; if(dbg){print "R163"}; continue };
 };
 if(iwrd=="проклятых") {
   if ( q(1,"suw_mnro") && s(0) )
   { l[i]=omo2; R[164]++; if(dbg){print "R164"}; continue };
 };
 #
 if ( bw(-1,"это этого") && s(-1) )
 { l[i]=omo2; R[165]++; if(dbg){print "R165"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1071 !_#_!
 #  x1071 cursed_    damned_    проклят  про́клят  прокля́т (краткая форма)
xgrp="x1071";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( bw(-1,"быть") && s(-1) )
 { l[i]=omo1; R[166]++; if(dbg){print "R166"}; continue };
 if ( bw(-2,"быть") &&
       q(-1,"mest_im") && s(-2,-1) )
 { l[i]=omo1; R[167]++; if(dbg){print "R167"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1072 !_#_!
 #  x1072 pincer_    tick_    клещи  кле́щи  клещи́
xgrp="x1072";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="железные стальные";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[168]++; if(dbg){print "R168"}; continue };
#if ( bw(-2,cst) &&
#      q(-1,"pre_vi") && s(-2,-1) )
#{ l[i]=omo1; R[169]++; if(dbg){print "R169"}; continue };

 if ( sw_em_v_f() )
 { l[i]=omo1; R[170]++; if(dbg){print "R170", "sw_em_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1073 !_#_!
 #  x1073 combo_   deep_na_   попадя   по́падя  попадя́
xgrp="x1073";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #

 if ( qxs(-1,"кто где что когда","ни") )
 { l[i]=omo1; R[171]++; if(dbg){print "R171"}; continue };

 if ( q(1,"pre_vi") )
 { l[i]=omo2; R[172]++; if(dbg){print "R172"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1074 !_#_!
 #  x1074 must_     needs_  должно  должно́  до́лжно
xgrp="x1074";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(-2,"gl_poed gl_pomn") &&
      w(-1,"как что") && s(-2,-1) )
 { l[i]=omo2; R[173]++; if(dbg){print "R173"}; continue };
 if ( q(-2,"mest_da suw_da") &&
      q(-1,"gl_in") && s(-2,-1) && p(1) )
 { l[i]=omo2; R[174]++; if(dbg){print "R174"}; continue };

 l[i]=omo1; R[175]++; if(dbg){print "R175"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1075 !_#_!
 #  x1075 knead_     remember_  помните  помни́те  по́мните
xgrp="x1075";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(1,"pre_any") && s(0) )
 { l[i]=omo2; R[176]++; if(dbg){print "R176"}; continue };
 if ( p(-1) && p(0) )
 { l[i]=omo2; R[177]++; if(dbg){print "R177"}; continue };
 if ( w(-1,"не") && s(-1) && p(0) )
 { l[i]=omo2; R[178]++; if(dbg){print "R178"}; continue };
 if ( w(1,"же") && s(0) && p(-1) && p(1) )
 { l[i]=omo2; R[179]++; if(dbg){print "R179"}; continue };
 if ( q(1,"mest_3e") && s(0) && p(-1) && p(1) )
 { l[i]=omo2; R[180]++; if(dbg){print "R180"}; continue };
 #
 if ( q(-4,"gl_poed gl_pomn gl_povzmn") &&
      w(-3,"что") &&
      q(-2,"gl_ed gl_nemn gl_vzmn gl_pemn gl_pnmn") &&
      w(-1,"и") && s(-4,-1) )
 { l[i]=omo2; R[181]++; if(dbg){print "R181"}; continue };
 #
 if ( qxs(-1,"так","что вот") )
 { l[i]=omo2; R[182]++; if(dbg){print "R182"}; continue };
 if ( w(-2,"а да") &&
      w(-1,"вы") && s(-2,-1) && Q_w(1,"mest_da suw_da") )
 { l[i]=omo2; R[183]++; if(dbg){print "R183"}; continue };
 if ( w(-2,"вы") &&
      w(-1,"только лучше") && s(-2,-1) )
 { l[i]=omo2; R[184]++; if(dbg){print "R184"}; continue };
 if ( w(-3,"вы") &&
      q(-2,"mest_vi suw_vi") &&
      w(-1,"не") && s(-3,-1) && p(0,"?") )
 { l[i]=omo2; R[185]++; if(dbg){print "R185"}; continue };

 if ( wb(-5,-1,"будто где если зачем когда коли которого которую которые который которых куда насколько небось откуда пока почему пошто сколько что") &&
      (q(wbn-1,"sz qast")||p(wbn-1)||sc(wbn-1,"[pv]")) && s(wbn,-1) )
 { l[i]=omo2; R[186]++; if(dbg){print "R186"}; continue };
 #
 if ( wb(-5,-2,"как") &&
       w(wbn-1,"бы долго же") && s(wbn,-1) )
 { l[i]=omo2; R[187]++; if(dbg){print "R187"}; continue };
 #
 if ( wb(-5,-1,"вы") && s(wbn,-1) )
 { l[i]=omo2; R[188]++; if(dbg){print "R188"}; continue };
 #
 if ( sc(0,"?") )
 { l[i]=omo2; R[189]++; if(dbg){print "R189"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1076 !_#_!
 #  x1076 equals_    zalt_  равно  равно́  ра́вно
xgrp="x1076";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"а") && w(1,"и") && s(-1,0) )
 { l[i]=omo2; R[190]++; if(dbg){print "R190"}; continue };
 if ( qxs(1,"как","и") )
 { l[i]=omo2; R[191]++; if(dbg){print "R191"}; continue };

 l[i]=omo1; R[192]++; if(dbg){print "R192"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1077 !_#_!
 #  x1077 settled_    universe_  вселенная  вселённая  вселе́нная
xgrp="x1077";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="город дом квартира комната тело хата человек";
 if ( w(1,"в") && p(-1) &&
     bw(2,cst) &&
suw_any(3) && s(0,2) )
 { l[i]=omo1; R[193]++; if(dbg){print "R193"}; continue };

 l[i]=omo2; R[194]++; if(dbg){print "R194"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1078 !_#_!
 #  x1078 poop_    which_  каком  ка́ком  како́м
xgrp="x1078";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"кверху") && s(0) )
 { l[i]=omo1; R[195]++; if(dbg){print "R195"}; continue };

 if ( s1(0,"-") && w(1,"то") )
 { l[i]=omo2; l[i+1]=gensub(/^(.+)$/,"\xcc\xa0\\1\xcc\xa0",1,l[i+1]); R[196]++; if(dbg){print "R196"}; continue };

 l[i]=omo2; R[197]++; if(dbg){print "R197"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2001 !_#_! #NOSPACY
 #  x2001 deep_na_      mest_ez_i_   моя  мо́я  моя́
xgrp="x2001";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( suw_edzeim(1) && Q(1,"suw_edzevi") && s(0) )
 { l[i]=omo2; R[198]++; if(dbg){print "R198"}; continue };
 if ( p(-1) && sc(1,"—") )
 { l[i]=omo2; R[199]++; if(dbg){print "R199"}; continue };
 if ( suw_edzeim(1) && s(0) && p(1,",") )
 { l[i]=omo2; R[200]++; if(dbg){print "R200"}; continue };
 if ( suw_edzeim(1) && s(0) && sc(-1,"—") )
 { l[i]=omo2; R[201]++; if(dbg){print "R201"}; continue };
 if ( name_im_sy(1) && s(0) )
 { l[i]=omo2; R[202]++; if(dbg){print "R202"}; continue };
 if ( q(1,"suw_edzeim nar_spos") &&
     qf(2,6,"gl_ed prl_kred_ze gl_paedze") && s(0,qfn-1) )
 { l[i]=omo2; R[203]++; if(dbg){print "R203"}; continue };
 if ( p(-1) && p(0) )
 { l[i]=omo2; R[204]++; if(dbg){print "R204"}; continue };
 if ( q(-2,"mest_im suw_im") && s(-2,-1) &&
      w(-1,"и или да да") &&
           suw_edzeim(1) && s(-2,0) )
 { l[i]=omo2; R[205]++; if(dbg){print "R205"}; continue };
 if ( p(-3) &&
         nar_step(-2) && s(-2,-1) &&
      w(-1,"не") && p(0) )
 { l[i]=omo2; R[206]++; if(dbg){print "R206"}; continue };
 if ( p(-2) && suw_edzeim(-1) && p(0) && s(-1) )
 { l[i]=omo2; R[207]++; if(dbg){print "R207"}; continue };
 if ( suw_edzeim(-1) &&
              qf(1,5,"gl_ed prl_kred_ze gl_paedze") && s(-1,qfn-1) )
 { l[i]=omo2; R[208]++; if(dbg){print "R208"}; continue };
 if ( q(-1,"prl_edzeim prq_edzeim prl_kred_ze gl_ed mest_im") &&
           suw_edzeim(1) && s(-1,0) )
 { l[i]=omo2; R[209]++; if(dbg){print "R209"}; continue };
 if ( q(1,"prl_edzeim prq_edzeim prl_kred_ze") && s(0) )
 { l[i]=omo2; R[210]++; if(dbg){print "R210"}; continue };
 if ( p(0)||q_w(1,"pre_any") )
 { l[i]=omo2; R[211]++; if(dbg){print "R211"}; continue };

 cst="вот и как не но она это";

 if ( w(-1,cst) &&
           suw_edzeim(1) && s(0) && p(1) )
 { l[i]=omo2; R[212]++; if(dbg){print "R212"}; continue };
 if ( p(-2) &&  w(-1,cst) && s(-1) && p(0) )
 { l[i]=omo2; R[213]++; if(dbg){print "R213"}; continue };

 cst="";

 if ( mest_im(-2) && q(-1,"suw_im") && s(-2) && z(-1) &&
     suw_edim(1) && s(0) && p(1) )
 { l[i]=omo2; R[214]++; if(dbg){print "R214"}; continue };
 if ( suw_edim(1) && s(0) && p(1) &&
       mest_im(2) && q(3,"suw_im") && s(2) && p(3) )
 { l[i]=omo2; R[215]++; if(dbg){print "R215"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[216]++; if(dbg){print "R216"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[217]++; if(dbg){print "R217"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2002 !_#_! #NOSPACY
 #  x2002 deep_na_      sw_1em_r_2ez_i_  туша  туша́  ту́ша
xgrp="x2002";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[218]++; if(dbg){print "R218", "sw_ez_i_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[219]++; if(dbg){print "R219", "sw_em_r_f"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[220]++; if(dbg){print "R220"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[221]++; if(dbg){print "R221"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2003 !_#_!
 #  x2003 deep_na_      sw_em_r_
xgrp="x2003";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[222]++; if(dbg){print "R222", "sw_em_r_f"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[223]++; if(dbg){print "R223"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[224]++; if(dbg){print "R224"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2004 !_#_!
 #  x2004 deep_na_      sw_em_vr_
xgrp="x2004";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[225]++; if(dbg){print "R225", "sw_em_v_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[226]++; if(dbg){print "R226", "sw_em_r_f"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[227]++; if(dbg){print "R227"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[228]++; if(dbg){print "R228"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2005 !_#_!
 #  x2005 deep_na_      sw_es_r_   горя  горя́  го́ря
xgrp="x2005";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[229]++; if(dbg){print "R229", "sw_es_r_f"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[230]++; if(dbg){print "R230"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[231]++; if(dbg){print "R231"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2006 !_#_!
 #  x2006 deep_na_      sw_ez_i_
xgrp="x2006";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[232]++; if(dbg){print "R232", "sw_ez_i_f"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[233]++; if(dbg){print "R233"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[234]++; if(dbg){print "R234"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2007 !_#_!
 #  x2007 deep_pa_      sw_em_iv_
xgrp="x2007";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[235]++; if(dbg){print "R235", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[236]++; if(dbg){print "R236", "sw_em_v_f"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[237]++; if(dbg){print "R237"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[238]++; if(dbg){print "R238"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2008 !_#_!
 #  x2008 deep_pa_      sw_em_r_
xgrp="x2008";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[239]++; if(dbg){print "R239", "sw_em_r_f"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[240]++; if(dbg){print "R240"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[241]++; if(dbg){print "R241"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2009 !_#_!
 #  x2009 deep_pa_      sw_ez_i_
xgrp="x2009";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[242]++; if(dbg){print "R242", "sw_ez_i_f"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[243]++; if(dbg){print "R243"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[244]++; if(dbg){print "R244"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2010 !_#_!
 #  x2010 deep_pa_      sw_mn_r_
xgrp="x2010";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[245]++; if(dbg){print "R245", "sw_mn_r_f"}; continue };
 #
 if ( p(-1) && q(1,"mest_vi prl_vi prq_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[246]++; if(dbg){print "R246"}; continue };
 if ( p(-1) && q(1,"suw_vi mest_vi") && s(0) )
 { l[i]=omo1; R[247]++; if(dbg){print "R247"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2011 !_#_!
 #  x2011 gl_ed1e_      m2_1sw_em_d_2pl_ez_t_
xgrp="x2011";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[248]++; if(dbg){print "R248", "sw_em_d_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[249]++; if(dbg){print "R249", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2012 !_#_!
 #  x2012 gl_ed1e_      mest_ez_v_  мою  мо́ю  мою́
xgrp="x2012";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pre_vi(-1) &&
           q(1,"prl_edvi prq_edvi") &&
    suw_edvi(2) && s(-1,1) )
 { l[i]=omo2; R[250]++; if(dbg){print "R250"}; continue };
 if ( pre_vi(-1) &&
    suw_edvi(1) && s(-1,0) )
 { l[i]=omo2; R[251]++; if(dbg){print "R251"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[252]++; if(dbg){print "R252", "gl_ed1e_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2013 !_#_!
 #  x2013 gl_ed1e_      qip_ez_v_
xgrp="x2013";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[253]++; if(dbg){print "R253", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2014 !_#_!
 #  x2014 gl_ed1e_      sw_1em_d_2ez_v_
xgrp="x2014";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[254]++; if(dbg){print "R254", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[255]++; if(dbg){print "R255", "sw_ez_v_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[256]++; if(dbg){print "R256", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2015 !_#_!
 #  x2015 gl_ed1e_      sw_1em_v_2ez_vd_
xgrp="x2015";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(1,"suw_ro") && s(0) )
 { l[i]=omo2; R[257]++; if(dbg){print "R257"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[258]++; if(dbg){print "R258", "sw_ez_d_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[259]++; if(dbg){print "R259", "sw_em_v_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[260]++; if(dbg){print "R260", "sw_ez_v_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[261]++; if(dbg){print "R261", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2016 !_#_!
 #  x2016 gl_ed1e_      sw_em_d_
xgrp="x2016";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="тону") {
   if ( q(1,"suw_ro") && s(0) )
   { l[i]=omo2; R[262]++; if(dbg){print "R262"}; continue };
 };
 if ( gl_in(1) && s(0) )
 { l[i]=omo1; R[263]++; if(dbg){print "R263"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[264]++; if(dbg){print "R264", "sw_em_d_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[265]++; if(dbg){print "R265", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2017 !_#_!
 #  x2017 gl_ed1e_      sw_em_dr_
xgrp="x2017";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="толку") {
   if ( w(-1,"что") && s(-1) )
   { l[i]=omo2; R[266]++; if(dbg){print "R266"}; continue };
   if ( w(1,"от") &&
        q(2,"mest_vi suw_vi") && s(0,1) )
   { l[i]=omo2; R[267]++; if(dbg){print "R267"}; continue };
 };
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[268]++; if(dbg){print "R268", "sw_em_d_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[269]++; if(dbg){print "R269", "sw_em_r_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[270]++; if(dbg){print "R270", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2018 !_#_!
 #  x2018 gl_ed1e_      sw_em_iv_
xgrp="x2018";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[271]++; if(dbg){print "R271", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[272]++; if(dbg){print "R272", "sw_em_v_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[273]++; if(dbg){print "R273", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2019 !_#_!
 #  x2019 gl_ed1e_      sw_ems_d_
xgrp="x2019";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[274]++; if(dbg){print "R274", "sw_em_d_f"}; continue };
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; R[275]++; if(dbg){print "R275", "sw_es_d_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[276]++; if(dbg){print "R276", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2020 !_#_!
 #  x2020 gl_ed1e_      sw_em_t_
xgrp="x2020";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[277]++; if(dbg){print "R277", "sw_em_t_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[278]++; if(dbg){print "R278", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2021 !_#_!
 #  x2021 gl_ed1e_      sw_es_d_
xgrp="x2021";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="утру") {
   if ( w(-1,"к") && s(-1) )
   { l[i]=omo1; R[279]++; if(dbg){print "R279"}; continue };
 };
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; R[280]++; if(dbg){print "R280", "sw_es_d_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[281]++; if(dbg){print "R281", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2022 !_#_!
 #  x2022 gl_ed1e_      sw_ez_t_
xgrp="x2022";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[282]++; if(dbg){print "R282", "sw_ez_t_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[283]++; if(dbg){print "R283", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2023 !_#_!
 #  x2023 gl_ed1e_      sw_ez_v_
xgrp="x2023";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="веду") {
   if ( w(-1,"себя") && s(-1) )
   { l[i]=omo1; R[284]++; if(dbg){print "R284"}; continue };
   if ( w(1,"себя") && s(0) )
   { l[i]=omo1; R[285]++; if(dbg){print "R285"}; continue };
   if ( qxs(1,"я","вот","к")||
        qxs(1,"я","к") )
   { l[i]=omo1; R[286]++; if(dbg){print "R286"}; continue };
 };
 if(iwrd=="уйму") {
   if ( q(1,"suw_ro") && s(0) )
   { l[i]=omo2; R[287]++; if(dbg){print "R287"}; continue };
 };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[288]++; if(dbg){print "R288", "sw_ez_v_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[289]++; if(dbg){print "R289", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2024 !_#_!
 #  x2024 gl_ed1e_      sw_mn_d_
xgrp="x2024";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_d_f() )
 { l[i]=omo2; R[290]++; if(dbg){print "R290", "sw_mn_d_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[291]++; if(dbg){print "R291", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2025 !_#_!
 #  x2025 gl_ed3e_      pl_kr_em_
xgrp="x2025";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
#if ( gl_ed3e_f() )
#{ l[i]=omo1; R[292]++; if(dbg){print "R292"}; continue };
 #
 if ( pl_kr_em_f() )
 { l[i]=omo2; R[293]++; if(dbg){print "R293", "pl_kr_em_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2026 !_#_!
 #  x2026 gl_ed3e_      sw_em_iv_
xgrp="x2026";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_ed3e_f() )
 { l[i]=omo1; R[294]++; if(dbg){print "R294", "gl_ed3e_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[295]++; if(dbg){print "R295", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[296]++; if(dbg){print "R296", "sw_em_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2027 !_#_!
 #  x2027 gl_ed3e_      sw_mn_r_
xgrp="x2027";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_ed3e_f() )
 { l[i]=omo1; R[297]++; if(dbg){print "R297", "gl_ed3e_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[298]++; if(dbg){print "R298", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2028 !_#_!
 #  x2028 gl_inf_       sw_1ez_dpr_2mn_iv_
xgrp="x2028";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="вести") {
   if ( w(-1,"себя") && s(-1) )
   { l[i]=omo1; R[299]++; if(dbg){print "R299"}; continue };
   if ( w(1,"себя") && s(0) )
   { l[i]=omo1; R[300]++; if(dbg){print "R300"}; continue };
   if ( w(1,"о об") && s(0) )
   { l[i]=omo2; R[301]++; if(dbg){print "R301"}; continue };
 };
 #
 if ( gl_inf_f() )
 { l[i]=omo1; R[302]++; if(dbg){print "R302", "gl_inf_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[303]++; if(dbg){print "R303", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[304]++; if(dbg){print "R304", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[305]++; if(dbg){print "R305", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[306]++; if(dbg){print "R306", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[307]++; if(dbg){print "R307", "sw_mn_v_f"}; continue };


 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2029 !_#_!
 #  x2029 gl_inf_       sw_ez_iv_
xgrp="x2029";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="подать") {
   if ( w(-1,"рукой") && s(-1) )
   { l[i]=omo1; R[308]++; if(dbg){print "R308"}; continue };
 };
 #
 if ( gl_inf_f() )
 { l[i]=omo1; R[309]++; if(dbg){print "R309", "sw_ez_i_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[310]++; if(dbg){print "R310", "sw_ez_i_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[311]++; if(dbg){print "R311", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2030 !_#_!
 #  x2030 gl_mn1e_      mest_ems_p_
xgrp="x2030";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[312]++; if(dbg){print "R312", "gl_mn1e_f"}; continue };
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2031 !_#_!
 #  x2031 gl_mn1e_      pl_ems_p_
xgrp="x2031";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[313]++; if(dbg){print "R313", "gl_mn1e_f"}; continue };
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo2; R[314]++; if(dbg){print "R314", "pl_em_p_f()||pl_es_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2032 !_#_!
 #  x2032 gl_mn1e_      pl_kr_em_
xgrp="x2032";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[315]++; if(dbg){print "R315", "gl_mn1e_f"}; continue };
 #
 if ( pl_kr_em_f() )
 { l[i]=omo2; R[316]++; if(dbg){print "R316", "pl_kr_em_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2033 !_#_!
 #  x2033 gl_mn1e_      pq_kr_em_
xgrp="x2033";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="переходим") {
   cst="в из на под через";
   if ( w(1,cst) && s(0) )
   { l[i]=omo1; R[317]++; if(dbg){print "R317"}; continue };
 };
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[318]++; if(dbg){print "R318", "gl_mn1e_f"}; continue };
 #
 if ( pq_kr_em_f() )
 { l[i]=omo2; R[319]++; if(dbg){print "R319", "pq_kr_em_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2034 !_#_!
 #  x2034 gl_mn1e_      sw_em_iv_
xgrp="x2034";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[320]++; if(dbg){print "R320", "gl_mn1e_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[321]++; if(dbg){print "R321", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[322]++; if(dbg){print "R322", "sw_em_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2035 !_#_!
 #  x2035 gl_mn1e_      sw_em_t_
xgrp="x2035";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[323]++; if(dbg){print "R323", "gl_mn1e_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[324]++; if(dbg){print "R324", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2036 !_#_!
 #  x2036 gl_mn1e_      sw_es_t_
xgrp="x2036";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[325]++; if(dbg){print "R325", "gl_mn1e_f"}; continue };
 #
 if ( sw_es_t_f() )
 { l[i]=omo2; R[326]++; if(dbg){print "R326", "sw_es_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2037 !_#_!
 #  x2037 gl_mn1e_      sw_mn_r_
xgrp="x2037";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[327]++; if(dbg){print "R327", "gl_mn1e_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[328]++; if(dbg){print "R328", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2038 !_#_!
 #  x2038 gl_mn2e_      gl_pomn_
xgrp="x2038";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; R[329]++; if(dbg){print "R329", "gl_mn2e_f"}; continue };
 #
 if ( gl_pomn_f() )
 { l[i]=omo2; R[330]++; if(dbg){print "R330", "gl_pomn_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2039 !_#_!
 #  x2039 gl_mn2e_      m2_1sw_em_p_2gl_pomn_
xgrp="x2039";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; R[331]++; if(dbg){print "R331", "gl_mn2e_f"}; continue };
 #
 if ( gl_pomn_f() )
 { l[i]=omo2; R[332]++; if(dbg){print "R332", "gl_pomn_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; R[333]++; if(dbg){print "R333", "sw_em_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2040 !_#_!
 #  x2040 gl_mn2e_      sw_em_p_
xgrp="x2040";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; R[334]++; if(dbg){print "R334", "gl_mn2e_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; R[335]++; if(dbg){print "R335", "sw_em_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2041 !_#_!
 #  x2041 gl_mn2e_      sw_ez_dp_
xgrp="x2041";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[336]++; if(dbg){print "R336", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[337]++; if(dbg){print "R337", "sw_ez_p_f"}; continue };
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; R[338]++; if(dbg){print "R338", "gl_mn2e_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2042 !_#_!
 #  x2042 gl_mn3e_      pq_kr_em_
xgrp="x2042";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pq_kr_em_f() )
 { l[i]=omo2; R[339]++; if(dbg){print "R339", "pq_kr_em_f"}; continue };
 #
 if ( gl_mn3e_f() )
 { l[i]=omo1; R[340]++; if(dbg){print "R340", "gl_mn1e_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2043 !_#_!
 #  x2043 gl_mn3e_      sw_mn_r_
xgrp="x2043";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[341]++; if(dbg){print "R341", "sw_mn_r_f"}; continue };
 #
 if ( gl_mn3e_f() )
 { l[i]=omo1; R[342]++; if(dbg){print "R342", "gl_mn1e_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2044 !_#_!
 #  x2044 gl_mn3e_      sw_mn_vr_
xgrp="x2044";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[343]++; if(dbg){print "R343", "sw_mn_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[344]++; if(dbg){print "R344", "sw_mn_r_f"}; continue };
 #
 if ( gl_mn3e_f() )
 { l[i]=omo1; R[345]++; if(dbg){print "R345", "gl_mn1e_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2045 !_#_!
 #  x2045 gl_paedmu_pe_	  m2_1pl_kr_em_2gl_paedmu_ne_  умел  умёл  уме́л
xgrp="x2045";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(1,"prl_kred_sr nar_spos") &&
  gl_in(2) && s(0,1) )
 { l[i]=omo2; R[346]++; if(dbg){print "R346"}; continue };
 if ( gl_in(1) && s(0) )
 { l[i]=omo2; R[347]++; if(dbg){print "R347"}; continue };
 if ( pl_kr_em_f() )
 { l[i]=omo2; R[348]++; if(dbg){print "R348", "pl_kr_em_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2046 !_#_!
 #  x2046 gl_paedmu_    pl_kr_em_  смел  смёл  сме́л
xgrp="x2046";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"не") &&
     qf(1,3,"gl_in") && s(-1,qfn-1) )
 { l[i]=omo2; R[349]++; if(dbg){print "R349"}; continue };
 #
 if ( pl_kr_em_f() )
 { l[i]=omo2; R[350]++; if(dbg){print "R350", "pl_kr_em_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2047 !_#_!
 #  x2047 gl_paedmu_    sw_1em_i_2mn_r_
xgrp="x2047";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; R[351]++; if(dbg){print "R351", "gl_paedmu_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[352]++; if(dbg){print "R352", "sw_em_i_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[353]++; if(dbg){print "R353", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2048 !_#_!
 #  x2048 gl_paedmu_    sw_1em_iv_2mn_r_
xgrp="x2048";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; R[354]++; if(dbg){print "R354", "gl_paedmu_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[355]++; if(dbg){print "R355", "sw_mn_r_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[356]++; if(dbg){print "R356", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[357]++; if(dbg){print "R357", "sw_em_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2049 !_#_!
 #  x2049 gl_paedmu_    sw_em_i_
xgrp="x2049";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="осел") {
   if ( q(1,"suw_ro") && s(0) )
   { l[i]=omo2; R[358]++; if(dbg){print "R358"}; continue };
 };
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; R[359]++; if(dbg){print "R359", "gl_paedmu_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[360]++; if(dbg){print "R360", "sw_em_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2050 !_#_!
 #  x2050 gl_paedmu_    sw_em_iv_
xgrp="x2050";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="запах") {
   if ( q(1,"suw_ro") && s(0) )
   { l[i]=omo2; R[361]++; if(dbg){print "R361"}; continue };
 };
 if(iwrd=="замер") {
   if ( q(1,"suw_ro") && s(0) )
   { l[i]=omo2; R[362]++; if(dbg){print "R362"}; continue };
 };
 if(iwrd=="обмер") {
   if ( q(1,"suw_ro") && s(0) )
   { l[i]=omo2; R[363]++; if(dbg){print "R363"}; continue };
 };
 if(iwrd=="перемер") {
   if ( q(1,"suw_ro") && s(0) )
   { l[i]=omo2; R[364]++; if(dbg){print "R364"}; continue };
 };
 if(iwrd=="погреб") {
   if ( q(1,"suw_ro") && s(0) )
   { l[i]=omo2; R[365]++; if(dbg){print "R365"}; continue };
 };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[366]++; if(dbg){print "R366", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[367]++; if(dbg){print "R367", "sw_em_v_f"}; continue };
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; R[368]++; if(dbg){print "R368", "gl_paedmu_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2051 !_#_!
 #  x2051 gl_paedmu_	sw_mn_r_
xgrp="x2051";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[369]++; if(dbg){print "R369", "sw_mn_r_f"}; continue };
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; R[370]++; if(dbg){print "R370", "gl_paedmu_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2052 !_#_!
 #  x2052 gl_paedmu_    sw_mn_vr_
xgrp="x2052";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; R[371]++; if(dbg){print "R371", "gl_paedmu_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[372]++; if(dbg){print "R372", "sw_mn_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[373]++; if(dbg){print "R373", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2053 !_#_!
 #  x2053 gl_paedsr_    sw_es_iv_
xgrp="x2053";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="начало") {
   if ( gl_in(1) && s(0) )
   { l[i]=omo1; R[374]++; if(dbg){print "R374"}; continue };
   if ( q(1,"prl_kred_sr prq_kred_sr") && s(0) && Q_w(2,"gl_in") )
   { l[i]=omo2; R[375]++; if(dbg){print "R375"}; continue };
   if ( q(1,"suw_ro") && s(0) )
   { l[i]=omo2; R[376]++; if(dbg){print "R376"}; continue };
 };
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; R[377]++; if(dbg){print "R377", "sw_es_i_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; R[378]++; if(dbg){print "R378", "sw_es_v_f"}; continue };
 #
 if ( gl_paedsr_f() )
 { l[i]=omo1; R[379]++; if(dbg){print "R379", "gl_paedsr_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2054 !_#_!
 #  x2054 m2_1sw_es_r_2gl_paedze_  sw_mn_iv_  дела   де́ла   дела́
xgrp="x2054";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qxs(-1,"для","пользы") )
 { l[i]=omo1; R[380]++; if(dbg){print "R380"}; continue };
 if ( wb(-5,-1,"как") && s(wbn,-1) )
 { l[i]=omo2; R[381]++; if(dbg){print "R381"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; R[382]++; if(dbg){print "R382", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[383]++; if(dbg){print "R383", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[384]++; if(dbg){print "R384", "sw_mn_v_f"}; continue };
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; R[385]++; if(dbg){print "R385", "gl_paedze_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2055 !_#_!
 #  x2055 gl_paedze_    sw_1es_r_2mn_iv_
xgrp="x2055";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="начала") {
   if ( w(-2,"с до") &&
        w(-1,"самого") && s(-2,-1) )
   { l[i]=omo2; R[386]++; if(dbg){print "R386"}; continue };
   if ( gl_in(1) && s(0) )
   { l[i]=omo1; R[387]++; if(dbg){print "R387"}; continue };
   if ( (suw_edzeim(1)||w(1,"она")) && s(0) )
   { l[i]=omo1; R[388]++; if(dbg){print "R388"}; continue };
 };
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[389]++; if(dbg){print "R389", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[390]++; if(dbg){print "R390", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[391]++; if(dbg){print "R391", "sw_mn_v_f"}; continue };
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; R[392]++; if(dbg){print "R392", "gl_paedze_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2056 !_#_!
 #  x2056 gl_paedze_    sw_em_i_
xgrp="x2056";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[393]++; if(dbg){print "R393", "sw_em_i_f"}; continue };
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; R[394]++; if(dbg){print "R394", "gl_paedze_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2057 !_#_!
 #  x2057 gl_paedze_    sw_em_r_
xgrp="x2057";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[395]++; if(dbg){print "R395", "sw_em_r_f"}; continue };
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; R[396]++; if(dbg){print "R396", "gl_paedze_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2058 !_#_!
 #  x2058 gl_pamn_      gl_poed_
xgrp="x2058";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="попали") {
   if ( wb(-5,-1,"как куда никуда они вы мы") && s(wbn,-1) )
   { l[i]=omo1; R[397]++; if(dbg){print "R397"}; continue };
   if ( q(1,"pre_vi") && s(0) )
   { l[i]=omo1; R[398]++; if(dbg){print "R398", "gl_pamn_f"}; continue };
 };
 if(iwrd=="дели") {
   if ( wb(-5,-1,"куда никуда они вы мы") && s(wbn,-1) )
   { l[i]=omo1; R[399]++; if(dbg){print "R399"}; continue };
 };
 if(iwrd=="пили") {
   cst="вино виски водки воду какао кофе минералку пиво самогон сок чай";
   if ( w(1,cst) && s(0) )
   { l[i]=omo1; R[400]++; if(dbg){print "R400"}; continue };
 };
 #
 if ( w(1,"под") && s(0) )
 { l[i]=omo1; R[401]++; if(dbg){print "R401", "gl_pamn_f"}; continue };
 if ( q(-1,"mest_da suw_da") && s(-1) )
 { l[i]=omo1; R[402]++; if(dbg){print "R402", "gl_pamn_f"}; continue };

 if ( wb(-5,-1,"пока если когда") && s(wbn,-1) )
 { l[i]=omo1; R[403]++; if(dbg){print "R403"}; continue };
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; R[404]++; if(dbg){print "R404", "gl_pamn_f"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo2; R[405]++; if(dbg){print "R405", "gl_poed_f"}; continue };
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2059 !_#_!
 #  x2059 gl_pamn_      nar_mest_
xgrp="x2059";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; R[406]++; if(dbg){print "R406", "gl_pamn_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2060 !_#_!
 #  x2060 gl_pamn_      sw_1ez_dpr_2mn_iv_
xgrp="x2060";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; R[407]++; if(dbg){print "R407", "gl_pamn_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[408]++; if(dbg){print "R408", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[409]++; if(dbg){print "R409", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[410]++; if(dbg){print "R410", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[411]++; if(dbg){print "R411", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[412]++; if(dbg){print "R412", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2061 !_#_!
 #  x2061 gl_pamn_      sw_1ez_r_2mn_iv_
xgrp="x2061";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; R[413]++; if(dbg){print "R413", "gl_pamn_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[414]++; if(dbg){print "R414", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[415]++; if(dbg){print "R415", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[416]++; if(dbg){print "R416", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2062 !_#_!
 #  x2062 gl_pamn_      sw_ez_dpr_  устали  уста́ли  у́стали
xgrp="x2062";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"без") && s(-1) )
 { l[i]=omo2; R[417]++; if(dbg){print "R417"}; continue };
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; R[418]++; if(dbg){print "R418", "gl_pamn_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2063 !_#_!
 #  x2063 gl_poed_      mest_ez_dprt_  нашей  наше́й  на́шей
xgrp="x2063";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[419]++; if(dbg){print "R419"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[420]++; if(dbg){print "R420", "gl_poed_f"}; continue };
 #
 if ( q(-1,"pre_da pre_pr pre_ro pre_tv") &&
      q(1,"suw_edzeda suw_edzepr suw_edzero suw_edzetv prl_edzeda prl_edzepr prl_edzero prl_edzetv") && s(-1,0) )
 { l[i]=omo2; R[421]++; if(dbg){print "R421"}; continue };
 if ( q(-1,"pre_da pre_pr pre_ro pre_tv prl_srav prl_edzevi") && s(-1) && (p(0)||q_w(1,"pre_any sz_iili name_ro_sy isname")) )
 { l[i]=omo2; R[422]++; if(dbg){print "R422"}; continue };
 if ( q(1,"suw_edzeda suw_edzepr suw_edzero suw_edzetv prl_edzeda prl_edzepr prl_edzero prl_edzetv") && s(0) )
 { l[i]=omo2; R[423]++; if(dbg){print "R423"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2064 !_#_!
 #  x2064 gl_poed_pamn_	sw_1ez_dpr_2mn_iv_  отмели  отмели́  о́тмели
xgrp="x2064";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[424]++; if(dbg){print "R424"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[425]++; if(dbg){print "R425", "gl_poed_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[426]++; if(dbg){print "R426", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[427]++; if(dbg){print "R427", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[428]++; if(dbg){print "R428", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[429]++; if(dbg){print "R429", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[430]++; if(dbg){print "R430", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2065 !_#_!
 #  x2065 gl_poed_      sw_1em_n_2ez_dpr_3mn_iv_
xgrp="x2065";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[431]++; if(dbg){print "R431"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[432]++; if(dbg){print "R432", "gl_poed_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[433]++; if(dbg){print "R433", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[434]++; if(dbg){print "R434", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[435]++; if(dbg){print "R435", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[436]++; if(dbg){print "R436", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[437]++; if(dbg){print "R437", "sw_mn_v_f"}; continue };


 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2066 !_#_!
 #  x2066 gl_poed_      sw_1ez_dpr_2mn_iv_
xgrp="x2066";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 cst="гати грани дрожи заводи копи крепи моли пади топи";
 if ( p(-1) && sc(0,"!") && w(0,cst) )
 { l[i]=omo1; R[438]++; if(dbg){print "R438"}; continue };
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[439]++; if(dbg){print "R439"}; continue };

 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[440]++; if(dbg){print "R440", "gl_poed_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[441]++; if(dbg){print "R441", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[442]++; if(dbg){print "R442", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[443]++; if(dbg){print "R443", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[444]++; if(dbg){print "R444", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[445]++; if(dbg){print "R445", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2067 !_#_!
 #  x2067 gl_poed_      sw_1ez_r_2mn_iv_3es_n_  суши  суши́  су́ши
xgrp="x2067";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[446]++; if(dbg){print "R446"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[447]++; if(dbg){print "R447", "gl_poed_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[448]++; if(dbg){print "R448", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[449]++; if(dbg){print "R449", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[450]++; if(dbg){print "R450", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2068 !_#_!
 #  x2068 gl_poed_      sw_1ez_dprv_2mn_iv_
xgrp="x2068";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[451]++; if(dbg){print "R451"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[452]++; if(dbg){print "R452", "gl_poed_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[453]++; if(dbg){print "R453", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[454]++; if(dbg){print "R454", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2069 !_#_!
 #  x2069 gl_poed_      sw_1ez_r_2mn_iv_
xgrp="x2069";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[455]++; if(dbg){print "R455"}; continue };
 if(iwrd=="пищи") {
   if ( bw(-1,"запас") && s(-1) )
   { l[i]=omo2; R[456]++; if(dbg){print "R456"}; continue };
 };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[457]++; if(dbg){print "R457", "gl_poed_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[458]++; if(dbg){print "R458", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[459]++; if(dbg){print "R459", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[460]++; if(dbg){print "R460", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2070 !_#_!
 #  x2070 gl_poed_      sw_1mn_iv_2gl_pamn_
xgrp="x2070";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[461]++; if(dbg){print "R461"}; continue };
 if ( wb(-5,-1,"пока если когда") && s(wbn,-1) )
 { l[i]=omo2; R[462]++; if(dbg){print "R462"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[463]++; if(dbg){print "R463", "gl_poed_f"}; continue };
 #
 if ( gl_pamn_f() )
 { l[i]=omo2; R[464]++; if(dbg){print "R464", "gl_pamn_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[465]++; if(dbg){print "R465", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[466]++; if(dbg){print "R466", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2071 !_#_!
 #  x2071 gl_poed_      sw_em_i_
xgrp="x2071";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[467]++; if(dbg){print "R467"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[468]++; if(dbg){print "R468", "gl_poed_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[469]++; if(dbg){print "R469", "sw_em_i_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2072 !_#_!
 #  x2072 gl_poed_      sw_es_dpr_
xgrp="x2072";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[470]++; if(dbg){print "R470"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[471]++; if(dbg){print "R471", "gl_poed_f"}; continue };
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; R[472]++; if(dbg){print "R472", "sw_es_d_f"}; continue };
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; R[473]++; if(dbg){print "R473", "sw_es_p_f"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[474]++; if(dbg){print "R474", "sw_es_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2073 !_#_!
 #  x2073 gl_poed_      sw_es_n_  веди  веди́  ве́ди
xgrp="x2073";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[475]++; if(dbg){print "R475"}; continue };
 if ( q(1,"mest_vi") &&
      q(2,"nar_spos prl_kred_sr") && s(0,1) )
 { l[i]=omo1; R[476]++; if(dbg){print "R476", "gl_poed_f"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[477]++; if(dbg){print "R477", "gl_poed_f"}; continue };
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2074 !_#_!
 #  x2074 gl_poed_	sw_ez_dpr_
xgrp="x2074";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[478]++; if(dbg){print "R478"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[479]++; if(dbg){print "R479", "gl_poed_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[480]++; if(dbg){print "R480", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[481]++; if(dbg){print "R481", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[482]++; if(dbg){print "R482", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2075 !_#_!
 #  x2075 gl_poed_      sw_ez_iv_  казни  казни́  ка́зни
xgrp="x2075";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[483]++; if(dbg){print "R483"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[484]++; if(dbg){print "R484", "gl_poed_f"}; continue };
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2076 !_#_!
 #  x2076 gl_poed_      sw_ez_r_
xgrp="x2076";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[485]++; if(dbg){print "R485"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[486]++; if(dbg){print "R486", "gl_poed_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[487]++; if(dbg){print "R487", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2077 !_#_!
 #  x2077 gl_poed_      sw_ez_t_
xgrp="x2077";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[488]++; if(dbg){print "R488"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[489]++; if(dbg){print "R489", "gl_poed_f"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[490]++; if(dbg){print "R490", "sw_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2078 !_#_!
 #  x2078 gl_poed_      sw_mn_i_
xgrp="x2078";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[491]++; if(dbg){print "R491"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[492]++; if(dbg){print "R492", "gl_poed_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[493]++; if(dbg){print "R493", "sw_mn_i_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2079 !_#_!
 #  x2079 gl_poed_      sw_mn_iv_
xgrp="x2079";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[494]++; if(dbg){print "R494"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[495]++; if(dbg){print "R495", "gl_poed_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[496]++; if(dbg){print "R496", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[497]++; if(dbg){print "R497", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2080 !_#_!
 #  x2080 gl_poed_      sw_mn_r_
xgrp="x2080";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[498]++; if(dbg){print "R498"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[499]++; if(dbg){print "R499", "gl_poed_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[500]++; if(dbg){print "R500", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2081 !_#_!
 #  x2081 gl_pomn_      sw_em_p_
xgrp="x2081";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-1,"pre_any") && s(-1) )
 { l[i]=omo2; R[501]++; if(dbg){print "R501"}; continue };
 #
 if ( gl_pomn_f() )
 { l[i]=omo1; R[502]++; if(dbg){print "R502", "gl_pomn_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; R[503]++; if(dbg){print "R503", "sw_em_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2082 !_#_!
 #  x2082 m2_1gl_mn1e_2pq_kr_em_   sw_em_t_
xgrp="x2082";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[504]++; if(dbg){print "R504", "gl_mn1e_f"}; continue };
 #
 if ( pq_kr_em_f() )
 { l[i]=omo1; R[505]++; if(dbg){print "R505", "pq_kr_em_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[506]++; if(dbg){print "R506", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2083 !_#_!
 #  x2083 m2_1gl_mn1e_2qik_d_      sw_mn_r_
xgrp="x2083";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; R[507]++; if(dbg){print "R507", "gl_mn1e_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[508]++; if(dbg){print "R508", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2084 !_#_!
 #  x2084 m2_1gl_poed_2nar_spos_   sw_ez_t_  порой  поро́й  по́рой
xgrp="x2084";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[509]++; if(dbg){print "R509", "gl_poed_f"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[510]++; if(dbg){print "R510", "sw_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2085 !_#_!
 #  x2085 m2_1nar_kaq_2pred_ro_	   sw_em_t_
xgrp="x2085";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(-2,"suw_im") &&
     bw(-1,"идти") && s(-2,-1) )
 { l[i]=omo2; R[511]++; if(dbg){print "R511", "sw_em_t_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[512]++; if(dbg){print "R512", "sw_em_t_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2086 !_#_!
 #  x2086 m2_1nar_vrem_2pred_ro_   sw_em_p_     после   по́сле   после́
xgrp="x2086";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sos(-20,-2) && Qb(son+1,-1,"pre_pr") )
 { l[i]=omo1; R[513]++; if(dbg){print "R513"}; continue };

 if ( w(-2,"самого") &&
      q(-1,"prl_edmuro") &&
      q(1,"suw_edro name_ro_sy isname") && s(-2,0) )
 { l[i]=omo1; R[514]++; if(dbg){print "R514"}; continue };
 if ( w(-2,"самой") &&
      q(-1,"prl_edzeda") &&
      q(1,"suw_edro name_ro_sy isname") && s(-2,0) )
 { l[i]=omo1; R[515]++; if(dbg){print "R515"}; continue };
 if ( p(-1) )
 { l[i]=omo1; R[516]++; if(dbg){print "R516"}; continue };
 if ( q(-1,"gl_in") && s(-1) )
 { l[i]=omo1; R[517]++; if(dbg){print "R517"}; continue };
 cst="а и но ну однако по уж";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[518]++; if(dbg){print "R518"}; continue };
 if ( q(1,"qik_ro") &&
      q(2,"qik_ro suw_mnro") && s(0,1) )
 { l[i]=omo1; R[519]++; if(dbg){print "R519"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; R[520]++; if(dbg){print "R520", "sw_em_p_f"}; continue };
 #
 if ( q(1,"suw_ro prl_ro mest_ro") )
 { l[i]=omo1; R[521]++; if(dbg){print "R521"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2087 !_#_!
 #  x2087 m2_1pl_srav_2gl_poed_	   pl_ez_dprt_  свежей  свеже́й  све́жей
xgrp="x2087";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(-1,"-" ) )
 { l[i]=omo2; R[522]++; if(dbg){print "R522"}; continue };
 if ( sc(0,"-" ) )
 { l[i]=omo2; R[523]++; if(dbg){print "R523"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[524]++; if(dbg){print "R524", "gl_poed_f"}; continue };
 #
 if ( pl_srav_f() )
 { l[i]=omo1; R[525]++; if(dbg){print "R525", "pl_srav_f"}; continue };
 #
 if ( pl_ez_d_f() )
 { l[i]=omo2; R[526]++; if(dbg){print "R526", "pl_ez_d_f"}; continue };
 #
 if ( pl_ez_p_f() )
 { l[i]=omo2; R[527]++; if(dbg){print "R527", "pl_ez_p_f"}; continue };
 #
 if ( pl_ez_r_f() )
 { l[i]=omo2; R[528]++; if(dbg){print "R528", "pl_ez_r_f"}; continue };
 #
 if ( pl_ez_t_f() )
 { l[i]=omo2; R[529]++; if(dbg){print "R529", "pl_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2088 !_#_!
 #  x2088 m2_1pl_srav_2gl_poed_	   sw_ez_t_  бурей  буре́й  бу́рей
xgrp="x2088";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[530]++; if(dbg){print "R530", "gl_poed_f"}; continue };
 #
 if ( pl_srav_f() )
 { l[i]=omo1; R[531]++; if(dbg){print "R531", "pl_srav_f"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[532]++; if(dbg){print "R532", "sw_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2089 !_#_!
 #  x2089 m2_1sw_em_d_2gl_ed1e_	   pl_ez_dprt_
xgrp="x2089";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[533]++; if(dbg){print "R533", "sw_em_d_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[534]++; if(dbg){print "R534", "gl_ed1e_f"}; continue };
 #
 if ( pl_ez_d_f() )
 { l[i]=omo2; R[535]++; if(dbg){print "R535", "pl_ez_d_f"}; continue };
 #
 if ( pl_ez_p_f() )
 { l[i]=omo2; R[536]++; if(dbg){print "R536", "pl_ez_p_f"}; continue };
 #
 if ( pl_ez_r_f() )
 { l[i]=omo2; R[537]++; if(dbg){print "R537", "pl_ez_r_f"}; continue };
 #
 if ( pl_ez_t_f() )
 { l[i]=omo2; R[538]++; if(dbg){print "R538", "pl_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2090 !_#_!
 #  x2090 m2_1sw_em_d_2gl_ed1e_	   sw_em_l_
xgrp="x2090";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; R[539]++; if(dbg){print "R539", "sw_em_l_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[540]++; if(dbg){print "R540", "sw_em_d_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[541]++; if(dbg){print "R541", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2091 !_#_!
 #  x2091 m2_1sw_em_d_2gl_poed_	   pl_ez_dprt_
xgrp="x2091";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[542]++; if(dbg){print "R542", "gl_poed_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[543]++; if(dbg){print "R543", "sw_em_d_f"}; continue };
 #
 if ( pl_ez_d_f() )
 { l[i]=omo2; R[544]++; if(dbg){print "R544", "pl_ez_d_f"}; continue };
 #
 if ( pl_ez_p_f() )
 { l[i]=omo2; R[545]++; if(dbg){print "R545", "pl_ez_p_f"}; continue };
 #
 if ( pl_ez_r_f() )
 { l[i]=omo2; R[546]++; if(dbg){print "R546", "pl_ez_r_f"}; continue };
 #
 if ( pl_ez_t_f() )
 { l[i]=omo2; R[547]++; if(dbg){print "R547", "pl_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2092 !_#_!
 #  x2092 m2_1sw_em_l_2gl_ed1e_	   sw_em_dz_
xgrp="x2092";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_z_f() )
 { l[i]=omo2; R[548]++; if(dbg){print "R548", "sw_em_z_f"}; continue };
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; R[549]++; if(dbg){print "R549", "sw_em_l_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[550]++; if(dbg){print "R550", "sw_em_d_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[551]++; if(dbg){print "R551", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2093 !_#_!
 #  x2093 gl_poed_	   sw_1ez_dprz_2mn_iv_
xgrp="x2093";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qw_(-1,"pre_any sz_iili")||q_w(1,"pre_any sz_iili") )
 { l[i]=omo2; R[552]++; if(dbg){print "R552"}; continue };
 #
 if ( sw_em_z_f() )
 { l[i]=omo2; R[553]++; if(dbg){print "R553", "sw_em_z_f"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[554]++; if(dbg){print "R554", "gl_poed_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[555]++; if(dbg){print "R555", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[556]++; if(dbg){print "R556", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[557]++; if(dbg){print "R557", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[558]++; if(dbg){print "R558", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[559]++; if(dbg){print "R559", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2094 !_#_!
 #  x2094 m2_1sw_em_p_2nar_vrem_   pl_srav_  уже  уже́  у́же
xgrp="x2094";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qxs(1,"в","плечах талии обхвате окружности диаметре") )
 { l[i]=omo2; R[560]++; if(dbg){print "R560"}; continue };
 if ( w(-3,"на") &&
      q(-2,"qin_im qik_im") &&
      q(-1,"suw_ro") &&
      q(1,"suw_ro") && s(-3,0) )
 { l[i]=omo2; R[561]++; if(dbg){print "R561"}; continue };
 #
 cst="о об обо про с со через";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[562]++; if(dbg){print "R562"}; continue };
 cst="некуда нельзя нет никого никому никто ничего ничто";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[563]++; if(dbg){print "R563"}; continue };
 if ( q(1,"nar_vrem nar_step nar_mest nar_spos nar_nar") && s(0) )
 { l[i]=omo1; R[564]++; if(dbg){print "R564"}; continue };
 if ( w(1,"не") &&
      q(2,"prl_im prq_im mest_im") &&
      q(3,"suw_im prl_im") && s(0,2) )
 { l[i]=omo1; R[565]++; if(dbg){print "R565"}; continue };
 if ( w(1,"не") &&
      q(2,"suw_im") && s(0,1) )
 { l[i]=omo1; R[566]++; if(dbg){print "R566"}; continue };
 if ( q(1,"prl_im prq_im mest_im") &&
      q(2,"suw_im prl_im") && s(0,1) )
 { l[i]=omo1; R[567]++; if(dbg){print "R567"}; continue };
 if ( q(1,"suw_im prl_srav") && s(0) )
 { l[i]=omo1; R[568]++; if(dbg){print "R568"}; continue };
 if ( q(1,"prl_vi prq_vi mest_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[569]++; if(dbg){print "R569"}; continue };
 if ( q(1,"prl_tv prq_tv mest_tv") &&
      q(2,"suw_tv prl_tv") && s(0,1) )
 { l[i]=omo1; R[570]++; if(dbg){print "R570"}; continue };
 if ( q(1,"suw_tv") && s(0) )
 { l[i]=omo1; R[571]++; if(dbg){print "R571"}; continue };
 if ( (w(1,"не все")||q(1,"prl_kred_sr")) &&
       q(2,"gl_in gl_ed gl_mn gl_vzmn deep prq_kred prq_krmn prl_kred prl_krmn") && s(0,1) )
 { l[i]=omo1; R[572]++; if(dbg){print "R572"}; continue };
 if ( q(1,"gl_in gl_ed gl_mn gl_vzmn deep prq_kred prq_krmn prl_kred prl_krmn") && s(0) )
 { l[i]=omo1; R[573]++; if(dbg){print "R573"}; continue };
 if ( q(1,"qik_im qin_im") &&
      q(2,"suw_mnro qik_im qik_vi qip_edvi qip_mnvi") && s(0,1) )
 { l[i]=omo1; R[574]++; if(dbg){print "R574"}; continue };
 if ( q(1,"qi_duom qi_duoz") &&
      q(2,"suw_edro") && s(0,1) )
 { l[i]=omo1; R[575]++; if(dbg){print "R575"}; continue };
 if ( q(1,"pre_pr") &&
      q(2,"prl_pr mest_pr prq_pr") &&
      q(3,"suw_pr suw_edme") && s(0,2) )
 { l[i]=omo1; R[576]++; if(dbg){print "R576"}; continue };
 if ( q(1,"pre_pr") &&
      q(2,"suw_pr suw_edme") && s(0,1) )
 { l[i]=omo1; R[577]++; if(dbg){print "R577"}; continue };
 if ( q(-1,"mest_im suw_im") &&
      q(1,"mest_da suw_da mest_vi suw_vi mest_3e") &&
      q(2,"gl_in gl_ed gl_mn gl_vzmn deep") && s(-1,1) )
 { l[i]=omo1; R[578]++; if(dbg){print "R578"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[579]++; if(dbg){print "R579", "sw_em_p_f"}; continue };
 #
 if ( pl_srav_f() )
 { l[i]=omo2; R[580]++; if(dbg){print "R580", "pl_srav_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2095 !_#_!
 #  x2095 m2_1sw_em_p_2pl_ems_p_   sw_es_t_
xgrp="x2095";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; R[581]++; if(dbg){print "R581", "pl_em_p_f()||pl_es_p_f"}; continue };
 #
 if ( sw_es_t_f() )
 { l[i]=omo2; R[582]++; if(dbg){print "R582", "sw_es_t_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[583]++; if(dbg){print "R583", "sw_em_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2096 !_#_!
 #  x2096 m2_1sw_em_r_2pl_kr_em_r_   pl_kr_ez_  бела бе́ла бела́
xgrp="x2096";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[584]++; if(dbg){print "R584", "sw_em_r_f"}; continue };
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo2; R[585]++; if(dbg){print "R585", "pl_kr_ez_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2097 !_#_!
 #  x2097 m2_1sw_em_t_2pl_ems_p_   sw_em_iv_
xgrp="x2097";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; R[586]++; if(dbg){print "R586", "pl_em_p_f()||pl_es_p_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo1; R[587]++; if(dbg){print "R587", "sw_em_t_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[588]++; if(dbg){print "R588", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[589]++; if(dbg){print "R589", "sw_em_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2098 !_#_!
 #  x2098 m2_1sw_es_p_2pl_ems_p_   sw_es_t_
xgrp="x2098";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; R[590]++; if(dbg){print "R590", "pl_em_p_f()||pl_es_p_f"}; continue };
 #
 if ( sw_es_t_f() )
 { l[i]=omo2; R[591]++; if(dbg){print "R591", "sw_es_t_f"}; continue };
 #
 if ( sw_es_p_f() )
 { l[i]=omo1; R[592]++; if(dbg){print "R592", "sw_es_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2099 !_#_!
 #  x2099 m2_1sw_ez_dp_2nar_napr_  sw_es_ivp_  горе  горе́  го́ре
xgrp="x2099";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 prex=1

 if ( w(-1,"на") && s(-1) && p(-2) && p(0) )
 { R[593]++; if(dbg){print "R593", "stopper"}; continue };
 if ( w(-1,"на") && s(-1) && p(-2) && bfa(1,3,"_gl_dvizh") && s(0,bfn-1) )
 { R[594]++; if(dbg){print "R594", "stopper"}; continue };

 if ( bw(-2,"воздеть") && w(-1,"руки") && s(-2,-1) )
 { l[i]=omo1; R[595]++; if(dbg){print "R595"}; continue };
 if ( w(-1,"на") && s(-1) && (qw_(-2,"mest_da suw_da")||q_w(1,"mest_da suw_da")) )
 { l[i]=omo2; R[596]++; if(dbg){print "R596"}; continue };

 if ( z(0) &&
      q(1,"otsz_edzevi otsz_edzero") )
 { l[i]=omo1; R[597]++; if(dbg){print "R597"}; continue };
 if ( z(0) &&
      q(1,"otsz_edsrvi") )
 { l[i]=omo2; R[598]++; if(dbg){print "R598"}; continue };
 if ( z(0) && s(1) && s(1) &&
      q(1,"pre_tv pre_ro pre_da pre_pr") &&
      q(2,"otsz_edzero") )
 { l[i]=omo1; R[599]++; if(dbg){print "R599"}; continue };
 if ( z(0) && s(1) && s(1) &&
      q(1,"pre_vi") &&
      q(2,"otsz_edzevi") )
 { l[i]=omo1; R[600]++; if(dbg){print "R600"}; continue };
 if ( z(0) && s(1) &&
      q(1,"pre_vi pre_ro") &&
      q(2,"otsz_edsrvi") )
 { l[i]=omo2; R[601]++; if(dbg){print "R601"}; continue };

 if ( sw_es_i_f() )
 { l[i]=omo2; R[602]++; if(dbg){print "R602", "sw_es_i_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; R[603]++; if(dbg){print "R603", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo1; R[604]++; if(dbg){print "R604", "sw_ez_p_f"}; continue };
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; R[605]++; if(dbg){print "R605", "sw_es_p_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; R[606]++; if(dbg){print "R606", "sw_es_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2100 !_#_!
 #  x2100 m2_1sw_ez_l_2gl_poed_pamn_      sw_1ez_dpr_2mn_iv_
xgrp="x2100";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[607]++; if(dbg){print "R607", "gl_poed_f"}; continue };
 #
 if ( sw_ez_l_f() )
 { l[i]=omo1; R[608]++; if(dbg){print "R608", "sw_ez_l_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[609]++; if(dbg){print "R609", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[610]++; if(dbg){print "R610", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[611]++; if(dbg){print "R611", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[612]++; if(dbg){print "R612", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[613]++; if(dbg){print "R613", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2101 !_#_!
 #  x2101 m2_1sw_ez_l_2gl_poed_    sw_1ez_dprz_2mn_iv_
xgrp="x2101";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="кости") {
   cst="выиграть игра играть проиграть проиграться";
   if ( w(-1,"в") && bw(-2,cst) && s(-2,-1) )
   { l[i]=omo2; R[614]++; if(dbg){print "R614"}; continue };
 };
 if ( pre_any(-1) && W(-1,"в на") && s(-1) )
 { l[i]=omo2; R[615]++; if(dbg){print "R615"}; continue };
 if ( pre_any(-3) && W(-3,"в на") &&
      suw_any(-2) &&
      sz_iili(-1) && s(-3,-1) )
 { l[i]=omo2; R[616]++; if(dbg){print "R616"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[617]++; if(dbg){print "R617", "gl_poed_f"}; continue };
 #
 if ( sw_ez_l_f() )
 { l[i]=omo1; R[618]++; if(dbg){print "R618", "sw_ez_l_f"}; continue };
 #
 if ( sw_ez_z_f() )
 { l[i]=omo2; R[619]++; if(dbg){print "R619", "sw_ez_z_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[620]++; if(dbg){print "R620", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[621]++; if(dbg){print "R621", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[622]++; if(dbg){print "R622", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[623]++; if(dbg){print "R623", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[624]++; if(dbg){print "R624", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2102 !_#_!
 #  x2102 m2_1sw_ez_r_2gl_poed_	   sw_mn_iv_
xgrp="x2102";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="души") {
   if ( w(1,"не") && bw(2,"чаять") && s(0,1) )
   { l[i]=omo1; R[625]++; if(dbg){print "R625"}; continue };
   if ( w(1,"в") && q(2,"mest_pr suw_pr name_pr_sy") && w(3,"не") && bw(4,"чаять") && s(0,3) )
   { l[i]=omo1; R[626]++; if(dbg){print "R626"}; continue };
 };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[627]++; if(dbg){print "R627", "gl_poed_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[628]++; if(dbg){print "R628", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[629]++; if(dbg){print "R629", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[630]++; if(dbg){print "R630", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2103 !_#_!
 #  x2103 m2_1sw_ez_t_2nar_spos_   pl_1em_iv_2dprt_ez_  дорогой  доро́гой  дорого́й
xgrp="x2103";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( p(-1) && p(0) )
 { l[i]=omo2; R[631]++; if(dbg){print "R631"}; continue };
 cst="ваш мой наш свой твой";
 if ( (w(-1,cst)||q(-1,"prl_edmuim") ) && s(-1) )
 { l[i]=omo2; R[632]++; if(dbg){print "R632"}; continue };
 if ( (w(1,cst)||q(1,"prl_edmuim isname") ) && s(0) && p(-1) && p(1) )
 { l[i]=omo2; R[633]++; if(dbg){print "R633"}; continue };
 cst="очень слишком черезчур";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[634]++; if(dbg){print "R634"}; continue };
 if ( q(1,"titul name_im_sy isname") && s(0) && p(1) )
 { l[i]=omo2; R[635]++; if(dbg){print "R635"}; continue };
 cst="мой наш";
 if ( (w(1,cst)||q(1,"titul")) &&
       q(2,"titul name_im_sy isname") && s(0,1) )
 { l[i]=omo2; R[636]++; if(dbg){print "R636"}; continue };
 if ( q(1,"suw_edmuim suw_noedmuim suw_edzeda suw_edzero suw_edzetv") && s(0) && p(1) )
 { l[i]=omo2; R[637]++; if(dbg){print "R637"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo1; R[638]++; if(dbg){print "R638", "sw_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2104 !_#_!
 #  x2104 m2_1sw_mn_iv_2deep_na_   sw_es_r_  моря  моря́  мо́ря
xgrp="x2104";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[639]++; if(dbg){print "R639", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[640]++; if(dbg){print "R640", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[641]++; if(dbg){print "R641", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2105 !_#_!
 #  x2105 gl_paedze_    sw_es_r_
xgrp="x2105";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[642]++; if(dbg){print "R642", "sw_es_r_f"}; continue };
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; R[643]++; if(dbg){print "R643", "gl_paedze_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2106 !_#_!
 #  x2106 m2_1sw_mn_iv_2gl_poed_+(sw_ez_r_)      sw_ez_dpr_  мочи  мочи́  мо́чи
xgrp="x2106";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qxs(-1,"что","было есть") )
 { l[i]=omo2; R[644]++; if(dbg){print "R644"}; continue };
 if ( qxs(-1,"изо со","всей") )
 { l[i]=omo2; R[645]++; if(dbg){print "R645"}; continue };
 if ( w(1,"нет") && s(0) && p(1) )
 { l[i]=omo2; R[646]++; if(dbg){print "R646"}; continue };
 if ( w(-1,"не") &&
      q(1,"suw_ro") && s(-1,0) )
 { l[i]=omo1; R[647]++; if(dbg){print "R647"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[648]++; if(dbg){print "R648", "gl_poed_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[649]++; if(dbg){print "R649", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[650]++; if(dbg){print "R650", "sw_mn_v_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[651]++; if(dbg){print "R651", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[652]++; if(dbg){print "R652", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[653]++; if(dbg){print "R653", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2107 !_#_!
 #  x2107 m2_1sw_mn_iv_2pl_ez_i_   sw_es_r_
xgrp="x2107";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[654]++; if(dbg){print "R654", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[655]++; if(dbg){print "R655", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[656]++; if(dbg){print "R656", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2108 !_#_!
 #  x2108 m2_1sw_mn_iv_2pl_kr_mn_  sw_ez_r_
xgrp="x2108";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[657]++; if(dbg){print "R657", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[658]++; if(dbg){print "R658", "sw_mn_v_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[659]++; if(dbg){print "R659", "sw_ez_r_f"}; continue };
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; R[660]++; if(dbg){print "R660", "pl_krmn_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2109 !_#_!
 #  x2109 m2_1sw_mn_r_2gl_poed_    sw_ez_t_
xgrp="x2109";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[661]++; if(dbg){print "R661", "gl_poed_f"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[662]++; if(dbg){print "R662", "sw_ez_t_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo1; R[663]++; if(dbg){print "R663", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2110 !_#_!
 #  x2110 m2_1sw_mn_r_2pl_kr_em_   sw_em_iv_
xgrp="x2110";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo1; R[664]++; if(dbg){print "R664", "sw_mn_r_f"}; continue };
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; R[665]++; if(dbg){print "R665", "pl_kr_em_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[666]++; if(dbg){print "R666", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[667]++; if(dbg){print "R667", "sw_em_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2111 !_#_!
 #  x2111 m3_1sw_em_i_2pl_em_iv_3pl_ez_dprt_     sw_ez_t_
xgrp="x2111";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[668]++; if(dbg){print "R668", "sw_em_i_f"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[669]++; if(dbg){print "R669", "sw_ez_t_f"}; continue };
 #
 if ( pl_ez_d_f() )
 { l[i]=omo1; R[670]++; if(dbg){print "R670", "pl_ez_d_f"}; continue };
 #
 if ( pl_ez_p_f() )
 { l[i]=omo1; R[671]++; if(dbg){print "R671", "pl_ez_p_f"}; continue };
 #
 if ( pl_ez_r_f() )
 { l[i]=omo1; R[672]++; if(dbg){print "R672", "pl_ez_r_f"}; continue };
 #
 if ( pl_ez_t_f() )
 { l[i]=omo1; R[673]++; if(dbg){print "R673", "pl_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2112 !_#_!
 #  x2112 m3_1sw_ez_dpr_2sw_mn_iv_3gl_pamn_	 sw_ez_l_   да'ли дали'
xgrp="x2112";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( isname(0) && isname(-1) && wc(-1,"^сальвадор") && s(-1) )
 { l[i]=omo2; R[674]++; if(dbg){print "R674"}; continue };
 #
 if ( w(-1,"в") && (-1) )
 { l[i]=omo2; R[675]++; if(dbg){print "R675"}; continue };
 #
 if ( w(-2,"в") &&
      q(-1,"prl_edpr") && s(-2,-1) )
 { l[i]=omo2; R[676]++; if(dbg){print "R676"}; continue };
 #
 if ( name_any_sy(0) )
 { l[i]=omo2; R[677]++; if(dbg){print "R677"}; continue };
 #
 l[i]=omo1; R[678]++; if(dbg){print "R678"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2113 !_#_!
 #  x2113 mest_d_       sw_ez_v_   кому +дефис
xgrp="x2113";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="либо нибудь никому то";
 if ( s1(0,"-") && w(1,cst) )
 { l[i]=gensub(/(.)$/,"\\1\xcc\x81",1,l[i]); sep[i]=gensub(/-/,"-\xcc\xa0",1,sep[i]); R[679]++; if(dbg){print "R679"}; continue };
 if ( s1(-1,"-") && w(-1,"кое") )
 { l[i]=gensub(/(.)$/,"\\1\xcc\x81",1,l[i]); R[680]++; if(dbg){print "R680"}; continue };
 if ( sc(0,"?") )
 { l[i]=omo1; R[681]++; if(dbg){print "R681"}; continue };

 #
 if ( w(-1,"в") && s(-1) )
 { l[i]=omo2; R[682]++; if(dbg){print "R682"}; continue };
 if ( q(-1,"prl_edzevi prq_edzevi mest_edzevi") && s(-1) )
 { l[i]=omo2; R[683]++; if(dbg){print "R683"}; continue };

 # всё остальное
 l[i]=omo1; R[684]++; if(dbg){print "R684"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2114 !_#_!
 #  x2114 mezd_	        sw_mn_p_
xgrp="x2114";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_p_f() )
 { l[i]=omo2; R[685]++; if(dbg){print "R685", "sw_mn_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2115 !_#_!
 #  x2115 nar_pre_combo_  sw_1ez_r_2mn_iv_
xgrp="x2115";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[686]++; if(dbg){print "R686", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[687]++; if(dbg){print "R687", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[688]++; if(dbg){print "R688", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2116 !_#_!
 #  x2116 nar_spos_     pl_kr_es_
xgrp="x2116";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2117 !_#_!
 #  x2117 nar_spos_     sw_em_d_
xgrp="x2117";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[689]++; if(dbg){print "R689", "sw_em_d_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2118 !_#_!
 #  x2118 nar_spos_     sw_em_t_
xgrp="x2118";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[690]++; if(dbg){print "R690", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2119 !_#_!
 #  x2119 nar_vrem_     pl_ez_dprt_
xgrp="x2119";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 #
 if ( pl_ez_d_f() )
 { l[i]=omo2; R[691]++; if(dbg){print "R691", "pl_ez_d_f"}; continue };
 #
 if ( pl_ez_p_f() )
 { l[i]=omo2; R[692]++; if(dbg){print "R692", "pl_ez_p_f"}; continue };
 #
 if ( pl_ez_r_f() )
 { l[i]=omo2; R[693]++; if(dbg){print "R693", "pl_ez_r_f"}; continue };
 #
 if ( pl_ez_t_f() )
 { l[i]=omo2; R[694]++; if(dbg){print "R694", "pl_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2120 !_#_!
 #  x2120 nar_vrem_     sw_em_t_   потом  пото́м  по́том
xgrp="x2120";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="вонять истекать обливаться пахнуть провонять провоняться пропахнуть пропитать пропитаться пропитывать пропитываться";
 if ( bw(-1,cst) && q(-1,"gl_ed gl_mn gl_vzmn deep prq_any") && s(-1) )
 { l[i]=omo2; R[695]++; if(dbg){print "R695"}; continue };
 if ( bw(-1,cst) && prq_any(-1) && s(-1) )
 { l[i]=omo2; R[696]++; if(dbg){print "R696"}; continue };
 if ( p(-2) &&
      w(-1,"а и но однако") && s(-1) )
 { l[i]=omo1; R[697]++; if(dbg){print "R697"}; continue };
 if ( p(-1) )
 { l[i]=omo1; R[698]++; if(dbg){print "R698"}; continue };
 if ( qxs(1,"и","кровью") )
 { l[i]=omo2; R[699]++; if(dbg){print "R699"}; continue };

 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[700]++; if(dbg){print "R700", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2121 !_#_!
 #  x2121 phrase_       pl_1ems_t_2mn_d_
xgrp="x2121";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2122 !_#_!
 #  x2122 phrase_       sw_em_r_   следа  следа́  сле́да
xgrp="x2122";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"без ни") && s(-1) )
 { l[i]=omo1; R[701]++; if(dbg){print "R701"}; continue };
 if ( w(-3,"не") &&
     (q(-2,"gl_ed gl_in gl_mn gl_poed gl_pomn deep")||w(-2,"нет")) &&
      w(-1,"и никакого") && s(-3,-1) )
 { l[i]=omo1; R[702]++; if(dbg){print "R702"}; continue };
 #
  l[i]=omo2; R[703]++; if(dbg){print "R703"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2123 !_#_!
 #  x2123 phrase_       sw_em_vr_    < хера хрена >
xgrp="x2123";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"ни на") && s(-1) )
 { l[i]=omo1; R[704]++; if(dbg){print "R704"}; continue };
 if ( w(-1,"с") && w(1,"ли") s(-1,0) )
 { l[i]=omo1; R[705]++; if(dbg){print "R705"}; continue };
 #
 l[i]=omo2; R[706]++; if(dbg){print "R706"}; continue;
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2124 !_#_!
 #  x2124 phrase_		sw_mn_iv_
xgrp="x2124";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[707]++; if(dbg){print "R707", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[708]++; if(dbg){print "R708", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2125 !_#_!
 #  x2125 pl_1em_iv_2ez_dprt_    sw_ez_t_
xgrp="x2125";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(-1,"-") )
 { l[i]=omo1; R[709]++; if(dbg){print "R709"}; continue };
 if ( q(1,"suw_edzeda suw_edzero suw_edzetv suw_edzepr suw_edmuim suw_edmuvi") && s(0) )
 { l[i]=omo1; R[710]++; if(dbg){print "R710"}; continue };

 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[711]++; if(dbg){print "R711", "sw_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2126 !_#_!
 #  x2126 pl_em_iv_		sw_mn_r_
xgrp="x2126";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[712]++; if(dbg){print "R712", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2127 !_#_!
 #  x2127 pl_em_iv_		sw_mn_vr_
xgrp="x2127";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[713]++; if(dbg){print "R713", "sw_mn_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[714]++; if(dbg){print "R714", "sw_mn_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2128 !_#_!
 #  x2128 pl_em_p_		sw_em_t_
xgrp="x2128";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[715]++; if(dbg){print "R715", "sw_em_p_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[716]++; if(dbg){print "R716", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2129 !_#_!
 #  x2129 pl_ems_d_		sw_em_d_
xgrp="x2129";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[717]++; if(dbg){print "R717", "sw_em_d_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2130 !_#_!
 #  x2130 pl_ems_p_		sw_em_iv_
xgrp="x2130";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; R[718]++; if(dbg){print "R718", "pl_em_p_f()||pl_es_p_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[719]++; if(dbg){print "R719", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[720]++; if(dbg){print "R720", "sw_em_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2131 !_#_!
 #  x2131 pl_ems_p_		sw_ems_t_
xgrp="x2131";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; R[721]++; if(dbg){print "R721", "pl_em_p_f()||pl_es_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2132 !_#_!
 #  x2132 pl_ems_p_		sw_em_t_
xgrp="x2132";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; R[722]++; if(dbg){print "R722", "pl_em_p_f()||pl_es_p_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[723]++; if(dbg){print "R723", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2133 !_#_!
 #  x2133 pl_ems_p_		sw_es_t_
xgrp="x2133";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; R[724]++; if(dbg){print "R724", "pl_em_p_f()||pl_es_p_f"}; continue };
 #
 if ( sw_es_t_f() )
 { l[i]=omo2; R[725]++; if(dbg){print "R725", "sw_es_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2134 !_#_!
 #  x2134 pl_ems_t_		sw_em_t_
xgrp="x2134";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[726]++; if(dbg){print "R726", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2135 !_#_!
 #  x2135 pl_es_iv_		pl_srav_
xgrp="x2135";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(-1,"-" ) )
 { l[i]=omo2; R[727]++; if(dbg){print "R727"}; continue };
 if ( sc(0,"-" ) )
 { l[i]=omo2; R[728]++; if(dbg){print "R728"}; continue };
 #
 if ( pl_es_i_f() )
 { l[i]=omo1; R[729]++; if(dbg){print "R729", "pl_es_i_f"}; continue };
 #
 if ( pl_es_v_f() )
 { l[i]=omo1; R[730]++; if(dbg){print "R730", "pl_es_v_f"}; continue };
 #
 if ( pl_srav_f() )
 { l[i]=omo2; R[731]++; if(dbg){print "R731", "pl_srav_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2136 !_#_!
 #  x2136 pl_ez_dprt_   sw_1em_iv_2ez_t_
xgrp="x2136";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[732]++; if(dbg){print "R732", "sw_ez_t_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[733]++; if(dbg){print "R733", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[734]++; if(dbg){print "R734", "sw_em_v_f"}; continue };
 #
 if ( pl_ez_d_f() )
 { l[i]=omo1; R[735]++; if(dbg){print "R735", "pl_ez_d_f"}; continue };
 #
 if ( pl_ez_p_f() )
 { l[i]=omo1; R[736]++; if(dbg){print "R736", "pl_ez_p_f"}; continue };
 #
 if ( pl_ez_r_f() )
 { l[i]=omo1; R[737]++; if(dbg){print "R737", "pl_ez_r_f"}; continue };
 #
 if ( pl_ez_t_f() )
 { l[i]=omo1; R[738]++; if(dbg){print "R738", "pl_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2137 !_#_!
 #  x2137 pl_ez_dprt_   sw_ez_t_
xgrp="x2137";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[739]++; if(dbg){print "R739", "sw_ez_t_f"}; continue };
 #
 if ( pl_ez_d_f() )
 { l[i]=omo1; R[740]++; if(dbg){print "R740", "pl_ez_d_f"}; continue };
 #
 if ( pl_ez_p_f() )
 { l[i]=omo1; R[741]++; if(dbg){print "R741", "pl_ez_p_f"}; continue };
 #
 if ( pl_ez_r_f() )
 { l[i]=omo1; R[742]++; if(dbg){print "R742", "pl_ez_r_f"}; continue };
 #
 if ( pl_ez_t_f() )
 { l[i]=omo1; R[743]++; if(dbg){print "R743", "pl_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2138 !_#_!
 #  x2138 pl_ez_dprt_   sw_mn_r_
xgrp="x2138";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[744]++; if(dbg){print "R744", "sw_mn_r_f"}; continue };
 #
 if ( pl_ez_d_f() )
 { l[i]=omo1; R[745]++; if(dbg){print "R745", "pl_ez_d_f"}; continue };
 #
 if ( pl_ez_p_f() )
 { l[i]=omo1; R[746]++; if(dbg){print "R746", "pl_ez_p_f"}; continue };
 #
 if ( pl_ez_r_f() )
 { l[i]=omo1; R[747]++; if(dbg){print "R747", "pl_ez_r_f"}; continue };
 #
 if ( pl_ez_t_f() )
 { l[i]=omo1; R[748]++; if(dbg){print "R748", "pl_ez_t_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2139 !_#_!
 #  x2139 pl_ez_i_		sw_1es_r_2mn_iv_
xgrp="x2139";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[749]++; if(dbg){print "R749", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[750]++; if(dbg){print "R750", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[751]++; if(dbg){print "R751", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2140 !_#_!
 #  x2140 pl_ez_i_		sw_es_r_
xgrp="x2140";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[752]++; if(dbg){print "R752", "sw_es_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2141 !_#_!
 #  x2141 pl_ez_i_		sw_mn_i_
xgrp="x2141";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[753]++; if(dbg){print "R753", "sw_mn_i_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2142 !_#_!
 #  x2142 pl_ez_t_		sw_1em_d_2ez_t_
xgrp="x2142";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[754]++; if(dbg){print "R754", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[755]++; if(dbg){print "R755", "sw_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2143 !_#_!
 #  x2143 pl_ez_v_		sw_es_d_
xgrp="x2143";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_ez_v_f() )
 { l[i]=omo1; R[756]++; if(dbg){print "R756", "pl_ez_v_f"}; continue };
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; R[757]++; if(dbg){print "R757", "sw_es_d_f"}; continue };
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2144 !_#_!
 #  x2144 pl_kr_em_		sw_em_i_
xgrp="x2144";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; R[758]++; if(dbg){print "R758", "pl_kr_em_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[759]++; if(dbg){print "R759", "sw_em_i_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2145 !_#_!
 #  x2145 pl_kr_em_		sw_em_iv_
xgrp="x2145";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; R[760]++; if(dbg){print "R760", "pl_kr_em_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[761]++; if(dbg){print "R761", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[762]++; if(dbg){print "R762", "sw_em_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2146 !_#_!
 #  x2146 pl_kr_em_		sw_em_t_  знаком  знако́м  зна́ком
xgrp="x2146";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="быть оказаться стать";
 if ( bw(-1,cst) &&
       q(1,"prl_ro") &&
       q(2,"suw_ro") && s(-1,1) )
 { l[i]=omo2; R[763]++; if(dbg){print "R763"}; continue };
 if ( bw(-1,cst) &&
       q(1,"suw_ro") && s(-1,0) )
 { l[i]=omo2; R[764]++; if(dbg){print "R764"}; continue };

 if (q(1,"gl_in gl_ed gl_mn deep") && s(0) )
 { l[i]=omo2; R[765]++; if(dbg){print "R765"}; continue };
 if ( pre_tv(-2) &&
           q(-1,"mest_tv suw_tv") && s(-2,-1) )
 { l[i]=omo1; R[766]++; if(dbg){print "R766"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[767]++; if(dbg){print "R767", "sw_em_t_f"}; continue };
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; R[768]++; if(dbg){print "R768", "pl_kr_em_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2147 !_#_!
 #  x2147 pl_kr_em_		sw_mn_r_
xgrp="x2147";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="дорог") {
   cst="перекрёсток прокладка";
   if ( bw(-1,cst) && s(-1) )
   { l[i]=omo2; R[769]++; if(dbg){print "R769"}; continue };
 };
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; R[770]++; if(dbg){print "R770", "pl_kr_em_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[771]++; if(dbg){print "R771", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2148 !_#_!
 #  x2148 pl_kr_em_		sw_mn_vr_ готов  гото́в  го́тов
xgrp="x2148";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( bb(-5,-1,"быть") && s(bbn,-1) )
 { l[i]=omo1; R[772]++; if(dbg){print "R772"}; continue };
 if ( qf(1,3,"gl_in") && s(0,qfn-1) )
 { l[i]=omo1; R[773]++; if(dbg){print "R773"}; continue };
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; R[774]++; if(dbg){print "R774", "pl_kr_em_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[775]++; if(dbg){print "R775", "sw_mn_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[776]++; if(dbg){print "R776", "sw_mn_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2149 !_#_!
 #  x2149 pl_kr_es_		sw_es_iv_
xgrp="x2149";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="добро") {
   if ( w(1,"пожаловать") && s(0) )
   { l[i]=omo2; R[777]++; if(dbg){print "R777"}; continue };
 };

 #
 if ( sw_es_i_f() )
 { l[i]=omo2; R[778]++; if(dbg){print "R778", "sw_es_i_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; R[779]++; if(dbg){print "R779", "sw_es_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2150 !_#_!
 #  x2150 pl_kr_ez_		sw_1es_r_2mn_iv_
xgrp="x2150";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[780]++; if(dbg){print "R780", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[781]++; if(dbg){print "R781", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[782]++; if(dbg){print "R782", "sw_mn_v_f"}; continue };
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; R[783]++; if(dbg){print "R783", "pl_kr_ez_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2151 !_#_!
 #  x2151 pl_kr_ez_		sw_em_r_
xgrp="x2151";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[784]++; if(dbg){print "R784", "sw_em_r_f"}; continue };
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; R[785]++; if(dbg){print "R785", "pl_kr_ez_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2152 !_#_!
 #  x2152 pl_kr_ez_		sw_em_vr_
xgrp="x2152";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[786]++; if(dbg){print "R786", "sw_em_v_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[787]++; if(dbg){print "R787", "sw_em_r_f"}; continue };
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; R[788]++; if(dbg){print "R788", "pl_kr_ez_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2153 !_#_!
 #  x2153 pl_kr_ez_		sw_es_r_
xgrp="x2153";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[789]++; if(dbg){print "R789", "sw_es_r_f"}; continue };
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; R[790]++; if(dbg){print "R790", "pl_kr_ez_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2154 !_#_!
 #  x2154 pl_kr_ez_		sw_ez_i_
xgrp="x2154";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[791]++; if(dbg){print "R791", "sw_ez_i_f"}; continue };
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; R[792]++; if(dbg){print "R792", "pl_kr_ez_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2155 !_#_!
 #  x2155 pl_kr_mn_		sw_1ez_r_2mn_iv_  дороги  дороги́  дороги́
xgrp="x2155";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; R[793]++; if(dbg){print "R793", "pl_krmn_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[794]++; if(dbg){print "R794", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[795]++; if(dbg){print "R795", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[796]++; if(dbg){print "R796", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2156 !_#_!
 #  x2156 pl_kr_mn_		sw_ez_r_
xgrp="x2156";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[797]++; if(dbg){print "R797", "sw_ez_r_f"}; continue };
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; R[798]++; if(dbg){print "R798", "pl_krmn_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2157 !_#_!
 #  x2157 pl_kr_mn_		sw_mn_i_
xgrp="x2157";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[799]++; if(dbg){print "R799", "sw_mn_i_f"}; continue };
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; R[800]++; if(dbg){print "R800", "pl_krmn_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2158 !_#_!
 #  x2158 pl_kr_mn_		sw_mn_iv_
xgrp="x2158";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; R[801]++; if(dbg){print "R801", "pl_krmn_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[802]++; if(dbg){print "R802", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[803]++; if(dbg){print "R803", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2159 !_#_!
 #  x2159 pl_srav_		sw_1ez_t_2mn_r_
xgrp="x2159";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_srav_f() )
 { l[i]=omo1; R[804]++; if(dbg){print "R804", "pl_srav_f"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[805]++; if(dbg){print "R805", "sw_ez_t_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[806]++; if(dbg){print "R806", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2160 !_#_!
 #  x2160 pl_srav_		sw_em_p_
xgrp="x2160";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_srav_f() )
 { l[i]=omo1; R[807]++; if(dbg){print "R807", "pl_srav_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; R[808]++; if(dbg){print "R808", "sw_em_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2161 !_#_!
 #  x2161 pl_srav_		sw_ez_t_
xgrp="x2161";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_srav_f() )
 { l[i]=omo1; R[809]++; if(dbg){print "R809", "pl_srav_f"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[810]++; if(dbg){print "R810", "sw_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2162 !_#_!
 #  x2162 pl_srav_		sw_mn_r_
xgrp="x2162";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_srav_f() )
 { l[i]=omo1; R[811]++; if(dbg){print "R811", "pl_srav_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[812]++; if(dbg){print "R812", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2163 !_#_!
 #  x2163 pq_ems_p_		sw_em_t_
xgrp="x2163";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[813]++; if(dbg){print "R813", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2164 !_#_!
 #  x2164 pq_kr_em_		pq_kr_em_
xgrp="x2164";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2165 !_#_!
 #  x2165 pq_kr_em_		sw_1em_iv_2mn_vr_
xgrp="x2165";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[814]++; if(dbg){print "R814", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[815]++; if(dbg){print "R815", "sw_em_v_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[816]++; if(dbg){print "R816", "sw_mn_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[817]++; if(dbg){print "R817", "sw_mn_r_f"}; continue };
 #
 if ( pq_kr_em_f() )
 { l[i]=omo1; R[818]++; if(dbg){print "R818", "pq_kr_em_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2166 !_#_!
 #  x2166 pq_kr_em_		sw_em_iv_
xgrp="x2166";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pq_kr_em_f() )
 { l[i]=omo1; R[819]++; if(dbg){print "R819", "pq_kr_em_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[820]++; if(dbg){print "R820", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[821]++; if(dbg){print "R821", "sw_em_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2167 !_#_!
 #  x2167 pq_kr_em_		sw_mn_r_
xgrp="x2167";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pq_kr_em_f() )
 { l[i]=omo1; R[822]++; if(dbg){print "R822", "pq_kr_em_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[823]++; if(dbg){print "R823", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2168 !_#_!
 #  x2168 pq_kr_ez_		sw_em_r_
xgrp="x2168";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; R[824]++; if(dbg){print "R824", "pl_kr_ez_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[825]++; if(dbg){print "R825", "sw_em_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2169 !_#_!
 #  x2169 pq_kr_ez_		sw_ez_i_
xgrp="x2169";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; R[826]++; if(dbg){print "R826", "pl_kr_ez_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[827]++; if(dbg){print "R827", "sw_ez_i_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2170 !_#_!
 #  x2170 pq_kr_mn_		sw_1ez_r_2mn_i_
xgrp="x2170";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[828]++; if(dbg){print "R828", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[829]++; if(dbg){print "R829", "sw_mn_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2171 !_#_!
 #  x2171 pq_kr_mn_		sw_1ez_r_2mn_iv_
xgrp="x2171";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[830]++; if(dbg){print "R830", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[831]++; if(dbg){print "R831", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[832]++; if(dbg){print "R832", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2172 !_#_!
 #  x2172 pq_kr_mn_		sw_mn_iv_
xgrp="x2172";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[833]++; if(dbg){print "R833", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[834]++; if(dbg){print "R834", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2173 !_#_!
 #  x2173 pre_combo_    sw_mn_d_
xgrp="x2173";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"Yco") && s(-1) && p(0) )
 { l[i]=omo1; R[835]++; if(dbg){print "R835", "sw_mn_d_f"}; continue };
 #
 if ( sw_mn_d_f() )
 { l[i]=omo2; R[836]++; if(dbg){print "R836", "sw_mn_d_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2174 !_#_!
 #  x2174 predik_       sw_ez_dp_
xgrp="x2174";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[837]++; if(dbg){print "R837", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[838]++; if(dbg){print "R838", "sw_ez_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2175 !_#_!
 #  x2175 pred_tv_      sw_em_iv_   перед  пе́ред  перёд
xgrp="x2175";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( name_tv_sy(1) && s(0) )
 { l[i]=omo1; R[839]++; if(dbg){print "R839"}; continue };
 if ( wc(1,"им$ ом$ ой$ ами$ ими$ ыми$ ями$") && s(0) )
 { l[i]=omo1; R[840]++; if(dbg){print "R840"}; continue };
 if ( q(-1,"suw_im") && wc(1,"им$ ом$ ой$ ами$ ими$ ыми$") && s(-1,0) )
 { l[i]=omo1; R[841]++; if(dbg){print "R841"}; continue };
 if ( isname(1) &&
      isname(2) && wc(2,"им$ ом$ ой$ ами$ ими$ ыми$") && s(0,1) )
 { l[i]=omo1; R[842]++; if(dbg){print "R842"}; continue };

 #
 if ( q(1,"prl_tv prq_tv mest_tv mest_mn mest_3e") &&
      q(2,"suw_tv prl_tv prq_tv mest_tv") && s(0,1) )
 { l[i]=omo1; R[843]++; if(dbg){print "R843"}; continue };
 if ( q(1,"suw_tv prl_tv mest_tv") && s(0) )
 { l[i]=omo1; R[844]++; if(dbg){print "R844"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[845]++; if(dbg){print "R845", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[846]++; if(dbg){print "R846", "sw_em_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2176 !_#_!
 #  x2176 qast_		sw_es_p_
xgrp="x2176";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; R[847]++; if(dbg){print "R847", "sw_es_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2177 !_#_!
 #  x2177 qip_ez_dprt_		sw_ez_t_    пятой  пя́той  пято́й
xgrp="x2177";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pre_pr(-2) &&
           q(-1,"prl_edzepr qik_im") &&
           q(1,"suw_edzepr") && s(-2,0) )
 { l[i]=omo1; R[848]++; if(dbg){print "R848"}; continue };
 if ( pre_pr(-1) &&
           q(1,"suw_edzepr suw_edzene") && s(-1,0) )
 { l[i]=omo1; R[849]++; if(dbg){print "R849"}; continue };
 if ( pre_pr(-1) && s(-1) && (p(0)||q_w(1,"pre_any")) )
 { l[i]=omo1; R[850]++; if(dbg){print "R850"}; continue };
 if ( q(-1,"qik_im") && s(-1) )
 { l[i]=omo1; R[851]++; if(dbg){print "R851"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[852]++; if(dbg){print "R852", "sw_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2178 !_#_!
 #  x2178 sw_1em_d_2ez_v_		sw_em_l_
xgrp="x2178";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if(iwrd=="ладу") {
   if ( w(-1,"в") && s(-1) )
   { l[i]=omo2; R[853]++; if(dbg){print "R853"}; continue };
 };
 if(iwrd=="пару") {
   if ( q(1,"suw_edne") && s(0) )
   { l[i]=omo1; R[854]++; if(dbg){print "R854"}; continue };
 };
 #
 if ( suw_mnro(1) && s(0) )
 { l[i]=omo1; R[855]++; if(dbg){print "R855"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[856]++; if(dbg){print "R856", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; R[857]++; if(dbg){print "R857", "sw_ez_v_f"}; continue };
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; R[858]++; if(dbg){print "R858", "sw_em_l_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2179 !_#_!
 #  x2179 sw_1em_d_2ez_v_		sw_es_n_
xgrp="x2179";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[859]++; if(dbg){print "R859", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; R[860]++; if(dbg){print "R860", "sw_ez_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2180 !_#_!
 #  x2180 sw_1em_l_2ez_v_		sw_em_d_
xgrp="x2180";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="полу") {
   if ( sc(0,"-") )
   { l[i]=omo2; R[861]++; if(dbg){print "R861"}; continue };
   if ( w(-1,"до по с") && s(-1) )
   { l[i]=omo2; R[862]++; if(dbg){print "R862"}; continue };
 };
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; R[863]++; if(dbg){print "R863", "sw_em_l_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[864]++; if(dbg){print "R864", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; R[865]++; if(dbg){print "R865", "sw_ez_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2181 !_#_!
 #  x2181 sw_1em_l_2ez_v_		sw_em_dz_
xgrp="x2181";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"с") && s(-1) )
 { l[i]=omo2; R[866]++; if(dbg){print "R866", "sw_em_z_f"}; continue };
 #
 if ( sw_em_z_f() )
 { l[i]=omo2; R[867]++; if(dbg){print "R867", "sw_em_z_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[868]++; if(dbg){print "R868", "sw_em_d_f"}; continue };
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; R[869]++; if(dbg){print "R869", "sw_em_l_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; R[870]++; if(dbg){print "R870", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2182 !_#_!
 #  x2182 sw_1em_p_2es_ivp_		sw_ez_dp_
xgrp="x2182";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo1; R[871]++; if(dbg){print "R871", "sw_es_i_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo1; R[872]++; if(dbg){print "R872", "sw_es_v_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[873]++; if(dbg){print "R873", "sw_em_p_f"}; continue };
 #
 if ( sw_es_p_f() )
 { l[i]=omo1; R[874]++; if(dbg){print "R874", "sw_es_p_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[875]++; if(dbg){print "R875", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[876]++; if(dbg){print "R876", "sw_ez_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2183 !_#_!
 #  x2183 sw_1em_p_2ez_dp_		sw_es_n_
xgrp="x2183";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="пике") {
   if ( q(-2,"pre_pr") &&
        q(-1,"prl_edsrpr prq_edsrpr") && s(-2,-1) )
   { l[i]=omo2; R[877]++; if(dbg){print "R877"}; continue };
   if ( q(-2,"pre_vi preph_vi") &&
        q(-1,"prl_edsrvi prq_edsrvi") && s(-2,-1) )
   { l[i]=omo2; R[878]++; if(dbg){print "R878"}; continue };
   cst="войти входить вывести выйти выходить";
   if ( bw(-3,cst) &&
         q(-2,"suw_vi") &&
         w(-1,"в из") && s(-3,-1) )
   { l[i]=omo2; r[1230]++; if(dbg){print "r1230"}; continue };
   if ( bw(-2,cst) &&
         w(-1,"в из") && s(-2,-1) )
   { l[i]=omo2; r[1230]++; if(dbg){print "r1230"}; continue };
 };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[879]++; if(dbg){print "R879", "sw_em_p_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; R[880]++; if(dbg){print "R880", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo1; R[881]++; if(dbg){print "R881", "sw_ez_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2184 !_#_!
 #  x2184 sw_1em_p_2ez_d_		sw_ez_p_
xgrp="x2184";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[882]++; if(dbg){print "R882", "sw_em_p_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; R[883]++; if(dbg){print "R883", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[884]++; if(dbg){print "R884", "sw_ez_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2185 !_#_!
 #  x2185 sw_1em_r_2ez_i_		sw_mn_iv_
xgrp="x2185";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; R[885]++; if(dbg){print "R885", "sw_ez_i_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[886]++; if(dbg){print "R886", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[887]++; if(dbg){print "R887", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[888]++; if(dbg){print "R888", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2186 !_#_!
 #  x2186 sw_1em_r_2phrase_		sw_mn_i_
xgrp="x2186";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[889]++; if(dbg){print "R889", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[890]++; if(dbg){print "R890", "sw_mn_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2187 !_#_!
 #  x2187 sw_1ems_d_2ez_v_		sw_em_l_  миру  ми́ру  миру́
xgrp="x2187";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 # && wmark("Yme",lc(-1)) -- глагол с меткой "включение локатива" _gl_yes_locative
 if ( sw_em_l_f() )
 { l[i]=omo2; R[891]++; if(dbg){print "R891"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[892]++; if(dbg){print "R892", "sw_em_d_f"}; continue };
 #
 if ( sw_es_d_f() )
 { l[i]=omo1; R[893]++; if(dbg){print "R893", "sw_es_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; R[894]++; if(dbg){print "R894", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2188 !_#_!
 #  x2188 sw_1ems_n_2ez_r_	sw_mn_iv_   виски  ви́ски  виски́
xgrp="x2188";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1

 if ( q(-3,"gl_peed gl_pemn deep_pe") &&
      q(-2,"mest_vi suw_odedvi suw_odmnvi") &&
 pre_vi(-1) && s(-3,-1) )
 { l[i]=omo2; R[895]++; if(dbg){print "R895"}; continue };
 if ( p(-1) && p(0) )
 { l[i]=omo1; R[896]++; if(dbg){print "R896"}; continue };
 if ( bba(-5,-1,"_gl_whisky") && s(bbn,-1) )
 { l[i]=omo1; R[897]++; if(dbg){print "R897"}; continue };
 if ( pre_tv(1) &&
           w(2,"льдом содовой") && s(0,1) )
 { l[i]=omo1; R[898]++; if(dbg){print "R898"}; continue };

 if ( bba(-5,-1,"_gl_viski") && s(bbn,-1) )
 { l[i]=omo2; R[899]++; if(dbg){print "R899"}; continue };
 if ( bfa(1,5,"_gl_viski") && s(0,bfn-1) )
 { l[i]=omo2; R[900]++; if(dbg){print "R900"}; continue };
 if ( q(1,"gl_vzmn") && s(0) )
 { l[i]=omo2; R[901]++; if(dbg){print "R901"}; continue };

 #
 if ( sw_es_z_f()||sw_em_i_f()||sw_es_i_f()||sw_em_v_f()||sw_es_v_f()||sw_em_r_f()||sw_es_r_f()||
      sw_em_d_f()||sw_es_d_f()||sw_em_t_f()||sw_es_t_f()||sw_em_p_f()||sw_es_p_f()||sw_ez_r_f() )
 { l[i]=omo1; R[902]++; if(dbg){print "R902"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[903]++; if(dbg){print "R903", "sw_mn_i_f"}; continue };
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[904]++; if(dbg){print "R904", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2189 !_#_!
 #  x2189 sw_1em_vr_2ez_i_		sw_mn_iv_
xgrp="x2189";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; R[905]++; if(dbg){print "R905", "sw_ez_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[906]++; if(dbg){print "R906", "sw_em_v_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[907]++; if(dbg){print "R907", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[908]++; if(dbg){print "R908", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[909]++; if(dbg){print "R909", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2190 !_#_!
 #  x2190 sw_emz_r_		sw_mn_iv_  главы головы  главы́ головы́  гла́вы го́ловы
xgrp="x2190";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[910]++; if(dbg){print "R910", "sw_em_r_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[911]++; if(dbg){print "R911", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[912]++; if(dbg){print "R912", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[913]++; if(dbg){print "R913", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2191 !_#_!
 #  x2191 sw_1es_n_2ez_r_		sw_mn_iv_
xgrp="x2191";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_z_f()||sw_es_i_f()||sw_es_v_f()||sw_es_r_f()||sw_es_d_f()||sw_es_t_f()||sw_es_p_f()||sw_ez_r_f() )
 { l[i]=omo1; R[914]++; if(dbg){print "R914", "sw_es_z_f()||sw_es_i_f()||sw_es_v_f()||sw_es_r_f()||sw_es_d_f()||sw_es_t_f()||sw_es_p_f()||sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[915]++; if(dbg){print "R915", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[916]++; if(dbg){print "R916", "sw_mn_v_f"}; continue };


 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2192 !_#_!
 #  x2192 sw_1es_rz_2mn_iv_		sw_ez_i_
xgrp="x2192";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[917]++; if(dbg){print "R917", "sw_ez_i_f"}; continue };
 #
 if ( sw_es_z_f() )
 { l[i]=omo1; R[918]++; if(dbg){print "R918", "sw_es_z_f"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; R[919]++; if(dbg){print "R919", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[920]++; if(dbg){print "R920", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[921]++; if(dbg){print "R921", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2193 !_#_!
 #  x2193 sw_1ez_dp_2mn_iv_		sw_ez_rl_
xgrp="x2193";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[922]++; if(dbg){print "R922", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[923]++; if(dbg){print "R923", "sw_ez_p_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[924]++; if(dbg){print "R924", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[925]++; if(dbg){print "R925", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2194 !_#_!
 #  x2194 sw_1ez_dpr_2mn_iv_	        sw_ez_l_
xgrp="x2194";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="связи") {
   if ( w(-1,"в") && w(1,"с") && s(-1,0) )
   { l[i]=omo2; R[926]++; if(dbg){print "R926"}; continue }
   else
   { l[i]=omo1; R[927]++; if(dbg){print "R927"}; continue };
 };
 #
 if ( sw_ez_l_f() )
 { l[i]=omo2; R[928]++; if(dbg){print "R928", "sw_ez_l_f"}; continue };

 #
 l[i]=omo1; R[929]++; if(dbg){print "R929"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2195 !_#_!
 #  x2195 sw_1ez_dr_2mn_iv_		sw_ez_p_
xgrp="x2195";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[930]++; if(dbg){print "R930", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[931]++; if(dbg){print "R931", "sw_mn_v_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[932]++; if(dbg){print "R932", "sw_ez_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2196 !_#_!
 #  x2196 sw_1ez_drp_2mn_iv_		sw_ez_l_
xgrp="x2196";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_l_f() )
 { l[i]=omo2; R[933]++; if(dbg){print "R933", "sw_ez_l_f"}; continue };

 #
 l[i]=omo1; R[934]++; if(dbg){print "R934"}; continue

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2197 !_#_!
 #  x2197 sw_1ez_i_2mn_iv_		sw_em_r_
xgrp="x2197";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[935]++; if(dbg){print "R935", "sw_em_r_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; R[936]++; if(dbg){print "R936", "sw_ez_i_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[937]++; if(dbg){print "R937", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[938]++; if(dbg){print "R938", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2198 !_#_!
 #  x2198 sw_1ez_i_2mn_iv_		sw_es_r_
xgrp="x2198";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[939]++; if(dbg){print "R939", "sw_es_r_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; R[940]++; if(dbg){print "R940", "sw_ez_i_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[941]++; if(dbg){print "R941", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[942]++; if(dbg){print "R942", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2199 !_#_!
 #  x2199 sw_1ez_p_2mn_iv_		sw_ez_drl_  груди  гру́ди  груди́
xgrp="x2199";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"его") && s(-1) )
 { l[i]=omo2; R[943]++; if(dbg){print "R943"}; continue };
 #
 if ( sw_ez_l_f() )
 { l[i]=omo2; R[944]++; if(dbg){print "R944", "sw_ez_l_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[945]++; if(dbg){print "R945", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[946]++; if(dbg){print "R946", "sw_ez_r_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo1; R[947]++; if(dbg){print "R947", "sw_ez_p_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[948]++; if(dbg){print "R948", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[949]++; if(dbg){print "R949", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2200 !_#_!
 #  x2200 sw_1mn_r_2pl_kr_em_		sw_em_iv_
xgrp="x2200";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[950]++; if(dbg){print "R950", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[951]++; if(dbg){print "R951", "sw_em_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo1; R[952]++; if(dbg){print "R952", "sw_mn_r_f"}; continue };
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; R[953]++; if(dbg){print "R953", "pl_kr_em_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2201 !_#_!
 #  x2201 sw_em_iv_		sw_mn_d_
xgrp="x2201";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_d_f() )
 { l[i]=omo2; R[954]++; if(dbg){print "R954", "sw_mn_d_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[955]++; if(dbg){print "R955", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[956]++; if(dbg){print "R956", "sw_em_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2202 !_#_!
 #  x2202 sw_em_dl_		sw_ez_v_
xgrp="x2202";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[957]++; if(dbg){print "R957", "sw_ez_v_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[958]++; if(dbg){print "R958", "sw_em_d_f"}; continue };
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; R[959]++; if(dbg){print "R959", "sw_em_l_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2203 !_#_!
 #  x2203 sw_em_dp_		sw_em_l_
xgrp="x2203";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"Ykl") && notsym(-1,unxy) && s(-1) )
 { l[i-1]=gensub(/([АЕЁИОУЫЭЮЯаеёиоуыэюя])/,"\\1\xcc\x81",1,l[i-1]); l[i]=gensub(/^(.)/,"\xcc\xa0\\1\xcc\xad",1,l[i]); R[960]++; if(dbg){print "R960"}; continue };
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; R[961]++; if(dbg){print "R961", "sw_em_l_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[962]++; if(dbg){print "R962", "sw_em_d_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[963]++; if(dbg){print "R963", "sw_em_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2204 !_#_!
 #  x2204 sw_em_dz_		sw_em_l_
xgrp="x2204";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"Ykl") && notsym(-1,unxy) && s(-1) )
 { l[i-1]=gensub(/([АЕЁИОУЫЭЮЯаеёиоуыэюя])/,"\\1\xcc\x81",1,l[i-1]); l[i]=gensub(/^(.)/,"\xcc\xa0\\1\xcc\xad",1,l[i]); R[964]++; if(dbg){print "R964"}; continue };
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; R[965]++; if(dbg){print "R965", "sw_em_z_f"}; continue };
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; R[966]++; if(dbg){print "R966", "sw_em_l_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[967]++; if(dbg){print "R967", "sw_em_d_f"}; continue };
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2205 !_#_!
 #  x2205 sw_em_d_		sw_em_k_
xgrp="x2205";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[968]++; if(dbg){print "R968", "sw_em_d_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2206 !_#_!
 #  x2206 sw_em_d_		sw_em_l_
xgrp="x2206";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="мозгу") {
   if ( w(-1,"за") && s(-1) )
   { l[i]=omo2; R[969]++; if(dbg){print "R969"}; continue };
 };
 #
 if ( ismark(-1,"Ykl") && notsym(-1,unxy) && s(-1) )
 { l[i-1]=gensub(/([АЕЁИОУЫЭЮЯаеёиоуыэюя])/,"\\1\xcc\x81",1,l[i-1]); l[i]=gensub(/^(.)/,"\xcc\xa0\\1\xcc\xad",1,l[i]); R[970]++; if(dbg){print "R970"}; continue };
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; R[971]++; if(dbg){print "R971", "sw_em_l_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[972]++; if(dbg){print "R972", "sw_em_d_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2207 !_#_!
 #  x2207 sw_em_d_		sw_em_p_
xgrp="x2207";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; R[973]++; if(dbg){print "R973", "sw_em_p_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[974]++; if(dbg){print "R974", "sw_em_d_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2208 !_#_!
 #  x2208 sw_em_d_		sw_em_v_
xgrp="x2208";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[975]++; if(dbg){print "R975", "sw_em_v_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[976]++; if(dbg){print "R976", "sw_em_d_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2209 !_#_!
 #  x2209 sw_em_d_		sw_ez_d_
xgrp="x2209";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[977]++; if(dbg){print "R977", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[978]++; if(dbg){print "R978", "sw_ez_d_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2210 !_#_!
 #  x2210 sw_em_d_		sw_ez_v_
xgrp="x2210";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[979]++; if(dbg){print "R979", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[980]++; if(dbg){print "R980", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2211 !_#_!
 #  x2211 sw_em_dv_		sw_em_l_
xgrp="x2211";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; R[981]++; if(dbg){print "R981", "sw_em_z_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[982]++; if(dbg){print "R982", "sw_em_d_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[983]++; if(dbg){print "R983", "sw_em_v_f"}; continue };
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; R[984]++; if(dbg){print "R984", "sw_em_l_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2212 !_#_!
 #  x2212 sw_em_dz_		sw_em_l_
xgrp="x2212";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; R[985]++; if(dbg){print "R985", "sw_em_l_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[986]++; if(dbg){print "R986", "sw_em_d_f"}; continue };
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; R[987]++; if(dbg){print "R987", "sw_em_z_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2213 !_#_!
 #  x2213 sw_em_dz_		sw_ez_v_
xgrp="x2213";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; R[988]++; if(dbg){print "R988", "sw_em_z_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[989]++; if(dbg){print "R989", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[990]++; if(dbg){print "R990", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2214 !_#_!
 #  x2214 sw_em_i_		sw_em_t_
xgrp="x2214";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[991]++; if(dbg){print "R991", "sw_em_i_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[992]++; if(dbg){print "R992", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2215 !_#_!
 #  x2215 sw_em_i_		sw_em_vr_
xgrp="x2215";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[993]++; if(dbg){print "R993", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[994]++; if(dbg){print "R994", "sw_em_v_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[995]++; if(dbg){print "R995", "sw_em_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2216 !_#_!
 #  x2216 sw_em_i_		sw_mn_r_   одушевленные
xgrp="x2216";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( name_im_sy(1) && s(0) )
 { l[i]=omo1; R[996]++; if(dbg){print "R996"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[997]++; if(dbg){print "R997", "sw_em_i_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[998]++; if(dbg){print "R998", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2217 !_#_!
 #  x2217 sw_em_i_		sw_mn_vr_
xgrp="x2217";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( Q(-1,"suw_ro") && p(-1) && p(0) )
 { l[i]=omo1; R[999]++; if(dbg){print "R999"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[1000]++; if(dbg){print "R1000", "sw_em_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1001]++; if(dbg){print "R1001", "sw_mn_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1002]++; if(dbg){print "R1002", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2218 !_#_!
 #  x2218 sw_em_iv_		sw_em_t_
xgrp="x2218";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[1003]++; if(dbg){print "R1003", "sw_em_t_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[1004]++; if(dbg){print "R1004", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[1005]++; if(dbg){print "R1005", "sw_em_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2219 !_#_!
 #  x2219 sw_em_iv_		sw_mn_p_
xgrp="x2219";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[1006]++; if(dbg){print "R1006", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[1007]++; if(dbg){print "R1007", "sw_em_v_f"}; continue };
 #
 if ( sw_mn_p_f() )
 { l[i]=omo2; R[1008]++; if(dbg){print "R1008", "sw_mn_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2220 !_#_!
 #  x2220 sw_em_iv_		sw_mn_r_
xgrp="x2220";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="округ") {
   if ( name_im_sy(1) && s(0) )
   { l[i]=omo1; R[1009]++; if(dbg){print "R1009"}; continue };
 };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1010]++; if(dbg){print "R1010", "sw_mn_r_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[1011]++; if(dbg){print "R1011", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[1012]++; if(dbg){print "R1012", "sw_em_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2221 !_#_!
 #  x2221 sw_em_iv_		sw_mn_vr_
xgrp="x2221";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 if(iwrd=="белок") {
   cst="охота охотиться";
   if ( bw(-2,cst) &&
    pre_vi(-1) && s(-2,-1) )
   { l[i]=omo2; R[1013]++; if(dbg){print "R1013"}; continue };
 };
 if ( qxs(-1,"что","за") )
 { l[i]=omo1; R[1014]++; if(dbg){print "R1014"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[1015]++; if(dbg){print "R1015", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[1016]++; if(dbg){print "R1016", "sw_em_v_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1017]++; if(dbg){print "R1017", "sw_mn_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1018]++; if(dbg){print "R1018", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2222 !_#_!
 #  x2222 sw_em_l_		sw_ems_dz_
xgrp="x2222";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[1019]++; if(dbg){print "R1019", "sw_em_d_f"}; continue };
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; R[1020]++; if(dbg){print "R1020", "sw_es_d_f"}; continue };
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; R[1021]++; if(dbg){print "R1021", "sw_em_l_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2223 !_#_!
 #  x2223 sw_em_n_		sw_em_p_
xgrp="x2223";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; R[1022]++; if(dbg){print "R1022", "sw_em_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2224 !_#_!
 #  x2224 sw_em_n_		sw_mn_iv_
xgrp="x2224";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1023]++; if(dbg){print "R1023", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1024]++; if(dbg){print "R1024", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2225 !_#_!
 #  x2225 gl_paedze_	sw_1es_r_2mn_iv_   начала  начала́  нача́ла
xgrp="x2225";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( w(-2,"с до") &&
      w(-1,"самого") && s(-2,-1) )
 { l[i]=omo2; R[1025]++; if(dbg){print "R1025"}; continue };

 if ( gl_in(1) && s(0) )
 { l[i]=omo1; R[1026]++; if(dbg){print "R1026"}; continue };
 if ( w(1,"было") &&
     (q(2,"gl_in isname")||w(2,"он")) && s(0,1) )
 { l[i]=omo1; R[1027]++; if(dbg){print "R1027"}; continue };
 if ( sc(-1,"—") &&
 (isname(1)||suw_edmuim(1)||w(1,"он")) && s(0) )
 { l[i]=omo1; R[1028]++; if(dbg){print "R1028"}; continue };

 if ( q(1,"prl_kred_sr nar_spos") && Q(-1,"pre_ro preph_ro") &&
  gl_in(2) && s(0,1) )
 { l[i]=omo1; R[1029]++; if(dbg){print "R1029"}; continue };
 if ( (suw_edzeim(1)||w(1,"она")) && s(0) )
 { l[i]=omo1; R[1030]++; if(dbg){print "R1030"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[1031]++; if(dbg){print "R1031", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1032]++; if(dbg){print "R1032", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1033]++; if(dbg){print "R1033", "sw_mn_v_f"}; continue };
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; R[1034]++; if(dbg){print "R1034", "gl_paedze_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2226 !_#_!
 #  x2226 sw_em_p_		sw_em_t_
xgrp="x2226";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[1035]++; if(dbg){print "R1035", "sw_em_p_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[1036]++; if(dbg){print "R1036", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2227 !_#_!
 #  x2227 sw_em_p_		sw_es_iv_
xgrp="x2227";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; R[1037]++; if(dbg){print "R1037", "sw_es_i_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; R[1038]++; if(dbg){print "R1038", "sw_es_v_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[1039]++; if(dbg){print "R1039", "sw_em_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2228 !_#_!
 #  x2228 sw_em_p_		sw_es_n_
xgrp="x2228";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[1040]++; if(dbg){print "R1040", "sw_em_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2229 !_#_!
 #  x2229 sw_em_p_		sw_es_p_     сти́ле  стиле́
xgrp="x2229";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[1041]++; if(dbg){print "R1041", "sw_em_p_f"}; continue };
 #
#if ( sw_es_p_f() )
#{ l[i]=omo2; R[1042]++; if(dbg){print "R1042"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2230 !_#_!
 #  x2230 sw_em_p_		sw_ez_dp_
xgrp="x2230";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 if(iwrd=="дружке") {
   if ( qxs(-1,"друг")||
        qxs(-1,"друг","на по ко") )
   { l[i]=omo2; R[1043]++; if(dbg){print "R1043"}; continue };
 };

 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[1044]++; if(dbg){print "R1044", "sw_em_p_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[1045]++; if(dbg){print "R1045", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[1046]++; if(dbg){print "R1046", "sw_ez_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2231 !_#_!
 #  x2231 sw_em_q_		sw_em_r_
xgrp="x2231";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_q_f() )
 { l[i]=omo1; R[1047]++; if(dbg){print "R1047", "sw_em_q_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[1048]++; if(dbg){print "R1048", "sw_em_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2232 !_#_!
 #  x2232 sw_em_r_		sw_es_ivr_
xgrp="x2232";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; R[1049]++; if(dbg){print "R1049", "sw_es_i_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; R[1050]++; if(dbg){print "R1050", "sw_es_v_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1051]++; if(dbg){print "R1051", "sw_em_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2233 !_#_!
 #  x2233 sw_em_r_		sw_ez_i_
xgrp="x2233";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1052]++; if(dbg){print "R1052", "sw_em_r_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[1053]++; if(dbg){print "R1053", "sw_ez_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2234 !_#_!
 #  x2234 sw_em_r_		sw_mn_i_
xgrp="x2234";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1054]++; if(dbg){print "R1054", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1055]++; if(dbg){print "R1055", "sw_mn_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2235 !_#_!
 #  x2235 sw_em_r_		sw_mn_iv_
xgrp="x2235";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="бока") {
   cst="намять отлёживать поцарапать";
   if ( bw(1,cst) && s(0) )
   { l[i]=omo2; R[1056]++; if(dbg){print "R1056"}; continue };
 };
 if(iwrd=="вечера") {
   cst="минут часов";
   if ( (w(-1,cst)||q(-1,"qi_ed qi_mn")) && s(-1) )
   { l[i]=omo1; R[1057]++; if(dbg){print "R1057"}; continue };
 };
 if(iwrd=="года") {
   if ( (q(1,"qi_duom")||wc(1,"[234][^0-9]*$")) && s(0) )
   { l[i]=omo1; R[1058]++; if(dbg){print "R1058"}; continue };
 };
 if(iwrd=="города") {
   if ( w(-1,"смелость") && w(1,"берёт берет") && s(-1,0) )
   { l[i]=omo2; R[1059]++; if(dbg){print "R1059"}; continue };
 };
 if(iwrd=="рода") {
   if ( w(1,"племени") && sc(0,"-") )
   { l[i]=omo1; R[1060]++; if(dbg){print "R1060"}; continue };
 };
 if(iwrd=="роста") {
   if ( w(1,"в") && q(2,"mest_pr suw_pr") && s(0,1) )
   { l[i]=omo1; R[1061]++; if(dbg){print "R1061"}; continue };
 };
 if(iwrd=="веса") {
   if ( w(1,"в") && q(2,"mest_pr suw_pr") && s(0,1) )
   { l[i]=omo1; R[1062]++; if(dbg){print "R1062"}; continue };
 };
 if(iwrd=="шенкеля") {
   if ( wb(-3,-1,"дать дал дала дав задать задал задала") && s(wbn,-1) )
   { l[i]=omo2; R[1063]++; if(dbg){print "R1063"}; continue };
 };
 #
 if ( pre_ro(-1) && Q(-1,"pre_im pre_vi") && s(-1) )
 { l[i]=omo1; R[1064]++; if(dbg){print "R1064"}; continue };
 if ( q(-1,"pre_im pre_vi") && Q(-1,"pre_ro") && s(-1) )
 { l[i]=omo2; R[1065]++; if(dbg){print "R1065"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1066]++; if(dbg){print "R1066", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1067]++; if(dbg){print "R1067", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1068]++; if(dbg){print "R1068", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2236 !_#_!
 #  x2236 sw_ems_p_		sw_es_iv_
xgrp="x2236";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; R[1069]++; if(dbg){print "R1069", "sw_es_i_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; R[1070]++; if(dbg){print "R1070", "sw_es_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2237 !_#_!
 #  x2237 sw_ems_r_		sw_mn_iv_  века  ве́ка  века́
xgrp="x2237";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2

 if ( sc(-1,"[^-]\\s?[IVXLCM]+\\s$") && W(-1,"и или да") )
 { l[i]=omo1; R[1071]++; if(dbg){print "R1071"}; continue };
 if ( sc(-1,"[-]\\s?[IVXLCM]+\\s$") || sz_iili(-1) )
 { l[i]=omo2; R[1072]++; if(dbg){print "R1072"}; continue };

 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1073]++; if(dbg){print "R1073", "sw_em_r_f"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; R[1074]++; if(dbg){print "R1074", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1075]++; if(dbg){print "R1075", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1076]++; if(dbg){print "R1076", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2238 !_#_!
 #  x2238 sw_em_t_		sw_ems_p_
xgrp="x2238";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; R[1077]++; if(dbg){print "R1077", "sw_em_p_f"}; continue };
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; R[1078]++; if(dbg){print "R1078", "sw_es_p_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo1; R[1079]++; if(dbg){print "R1079", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2239 !_#_!
 #  x2239 sw_em_t_		sw_es_p_
xgrp="x2239";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo1; R[1080]++; if(dbg){print "R1080", "sw_em_t_f"}; continue };
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; R[1081]++; if(dbg){print "R1081", "sw_es_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2240 !_#_!
 #  x2240 m2_1nar_spos_2sw_em_t_		sw_mn_r_
xgrp="x2240";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if(iwrd=="хором") {
   if ( q(-1,"gl_mn gl_vzmn gl_pomn deep") && ba(-1,"_gl_talk") && s(-1) )
   { l[i]=omo1; R[1082]++; if(dbg){print "R1082"}; continue };
   if ( q(1,"gl_mn gl_vzmn gl_pomn deep") && ba(1,"_gl_talk") && s(0) )
   { l[i]=omo1; R[1083]++; if(dbg){print "R1083"}; continue };
 };
 #
 if ( nar_spos_f() )
 { l[i]=omo1; R[1084]++; if(dbg){print "R1084", "nar_spos_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo1; R[1085]++; if(dbg){print "R1085", "sw_em_t_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1086]++; if(dbg){print "R1086", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2241 !_#_!
 #  x2241 sw_em_vr_		sw_ez_i_
xgrp="x2241";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if(iwrd=="черта") {
   if ( w(-1,"ни") &&
      Q_w(1,"suw_ro mest_ro") && s(-1) )
   { l[i]=omo2; R[1087]++; if(dbg){print "R1087"}; continue };
   if ( w(-1,"ни") &&
        q(1,"prl_edro") && s(-1) )
   { l[i]=omo2; R[1088]++; if(dbg){print "R1088"}; continue };
   if ( w(-1,"на") &&
        q(1,"mest_da suw_da") && s(-1,0) )
   { l[i]=omo2; R[1089]++; if(dbg){print "R1089"}; continue };
 };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[1090]++; if(dbg){print "R1090", "sw_ez_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[1091]++; if(dbg){print "R1091", "sw_em_v_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1092]++; if(dbg){print "R1092", "sw_em_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2242 !_#_!
 #  x2242 sw_em_vr_		sw_mn_i_  < одушевленные! >
xgrp="x2242";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if(iwrd=="господа") {
   if ( p(-1) && p(0) )
   { l[i]=omo2; R[1093]++; if(dbg){print "R1093"}; continue };
   cst="бога нашего";
   if ( w(1,cst) && s(0) )
   { l[i]=omo1; R[1094]++; if(dbg){print "R1094"}; continue };
   if ( suw_odmnim(1) && s(0) )
   { l[i]=omo2; R[1095]++; if(dbg){print "R1095"}; continue };
 };
 #
 if ( name_im_sy(1) &&
         sz_iili(2) &&
      name_im_sy(3) && s(0,2) )
 { l[i]=omo2; R[1096]++; if(dbg){print "R1096"}; continue };
 #
 if ( q(1,"name_vi_sy name_ro_sy") && s(0) )
 { l[i]=omo1; R[1097]++; if(dbg){print "R1097"}; continue };

 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1098]++; if(dbg){print "R1098", "sw_em_r_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[1099]++; if(dbg){print "R1099", "sw_em_v_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1100]++; if(dbg){print "R1100", "sw_mn_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2243 !_#_!
 #  x2243 sw_em_vr_		sw_mn_iv_
xgrp="x2243";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; R[1101]++; if(dbg){print "R1101", "sw_em_v_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1102]++; if(dbg){print "R1102", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1103]++; if(dbg){print "R1103", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1104]++; if(dbg){print "R1104", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2244 !_#_!
 #  x2244 gl_paedmu_	sw_mn_r_  начал  на́чал  нача́л
xgrp="x2244";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
   if ( q(1,"mest_vi mest_3e") &&
    gl_in(2) && s(0,1) )
   { l[i]=omo1; R[1105]++; if(dbg){print "R1105"}; continue };
   if ( gl_in(1) && s(0) )
   { l[i]=omo1; R[1106]++; if(dbg){print "R1106"}; continue };
   if ( (w(1,"было")||q(1,"prl_kred_sr mest_da suw_da")) &&
        (q(2,"gl_in name_im_sy isname")||w(2,"он")) && s(0,1) )
   { l[i]=omo1; R[1107]++; if(dbg){print "R1107"}; continue };
   if ( sc(-2,"—") &&
         q(-1,"nar_spos nar_kaq nar_vrem prl_kred_sr") &&
        (q(1,"suw_edmuim name_im_sy isname")||w(1,"он")) && s(-1,0) )
   { l[i]=omo1; R[1108]++; if(dbg){print "R1108"}; continue };
   if ( sc(-1,"—") &&
        (q(1,"suw_edmuim name_im_sy isname prl_edmuim")||w(1,"он")||wc(1,"[A-Za-z0-9]+")) && s(0) )
   { l[i]=omo1; R[1109]++; if(dbg){print "R1109"}; continue };
   if ( q(1,"pre_vi preph_vi") &&
        q(2,"suw_vi prl_vi prq_vi mest_vi") && s(0,1) )
   { l[i]=omo1; R[1110]++; if(dbg){print "R1110"}; continue };
   if ( q(1,"pre_ro preph_ro") &&
        q(2,"suw_ro prl_ro prq_ro mest_ro") && s(0,1) )
   { l[i]=omo1; R[1111]++; if(dbg){print "R1111"}; continue };
   if ( q(1,"pre_tv preph_tv") &&
        q(2,"suw_tv prl_tv prq_tv mest_tv") && s(0,1) )
   { l[i]=omo1; R[1112]++; if(dbg){print "R1112"}; continue };
   if ( pre_pr(1) &&
             q(2,"suw_pr prl_pr prq_pr mest_pr") && s(0,1) )
   { l[i]=omo1; R[1113]++; if(dbg){print "R1113"}; continue };
   if ( gl_in(1) && s(0) )
   { l[i]=omo1; R[1114]++; if(dbg){print "R1114"}; continue };
   if ( (q(-1,"suw_edmuim name_im_sy isname")||w(-1,"он")) &&
         q(1,"suw_vi") && s(-1,0) )
   { l[i]=omo1; R[1115]++; if(dbg){print "R1115"}; continue };

 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; R[1116]++; if(dbg){print "R1116", "gl_paedmu_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1117]++; if(dbg){print "R1117", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2245 !_#_!
 #  x2245 sw_es_d_		sw_ez_t_
xgrp="x2245";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_d_f() )
 { l[i]=omo1; R[1118]++; if(dbg){print "R1118", "sw_es_d_f"}; continue };
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[1119]++; if(dbg){print "R1119", "sw_ez_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2246 !_#_!
 #  x2246 sw_es_d_		sw_ez_v_
xgrp="x2246";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_d_f() )
 { l[i]=omo1; R[1120]++; if(dbg){print "R1120", "sw_es_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[1121]++; if(dbg){print "R1121", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2247 !_#_!
 #  x2247 sw_es_i_		sw_es_v_
xgrp="x2247";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo1; R[1122]++; if(dbg){print "R1122", "sw_es_i_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; R[1123]++; if(dbg){print "R1123", "sw_es_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2248 !_#_!
 #  x2248 sw_es_iv_		sw_es_p_
xgrp="x2248";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1

 if(iwrd=="крыльце") {
   if ( w(-1,"на") && s(-1) )
   { l[i]=omo2; R[1124]++; if(dbg){print "R1124"}; continue };
 };
 #
 if ( sw_es_i_f() )
 { l[i]=omo1; R[1125]++; if(dbg){print "R1125", "sw_es_i_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo1; R[1126]++; if(dbg){print "R1126", "sw_es_v_f"}; continue };
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; R[1127]++; if(dbg){print "R1127", "sw_es_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2249 !_#_!
 #  x2249 sw_es_n_		sw_ez_dp_
xgrp="x2249";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[1128]++; if(dbg){print "R1128", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[1129]++; if(dbg){print "R1129", "sw_ez_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2250 !_#_!
 #  x2250 sw_es_n_		sw_ez_p_
xgrp="x2250";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[1130]++; if(dbg){print "R1130", "sw_ez_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2251 !_#_!
 #  x2251 sw_es_n_		sw_ez_v_
xgrp="x2251";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[1131]++; if(dbg){print "R1131", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2252 !_#_!
 #  x2252 sw_es_p_		sw_ez_dp_
xgrp="x2252";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_p_f() )
 { l[i]=omo1; R[1132]++; if(dbg){print "R1132", "sw_es_p_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[1133]++; if(dbg){print "R1133", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[1134]++; if(dbg){print "R1134", "sw_ez_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2253 !_#_!
 #  x2253 sw_es_rz_		sw_ez_i_
xgrp="x2253";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_z_f() )
 { l[i]=omo1; R[1135]++; if(dbg){print "R1135", "sw_es_z_f"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; R[1136]++; if(dbg){print "R1136", "sw_es_r_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[1137]++; if(dbg){print "R1137", "sw_ez_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2254 !_#_!
 #  x2254 sw_es_r_      sw_mn_iv_
xgrp="x2254";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="утра") {
   cst="до минут от с часов";
   if ( (w(-1,cst)||q(-1,"qi_ed qi_mn nar_vrem")) && s(-1) )
   { l[i]=omo1; R[1138]++; if(dbg){print "R1138"}; continue };
 };
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; R[1139]++; if(dbg){print "R1139", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1140]++; if(dbg){print "R1140", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1141]++; if(dbg){print "R1141", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2255 !_#_!
 #  x2255 sw_em_r_		sw_mn_iv_  цвета  цве́та  цвета́
xgrp="x2255";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( ( suw_mnim(-2)||(suw_mnim(-3) && q(-2,"name_ro_sy isname")) && s(-3)) &&
               w(-1,"были") &&
               q(1,"prl_ro suw_ro prq_ro suw_edne") && s(-2,0) )
 { l[i]=omo1; R[1142]++; if(dbg){print "R1142"}; continue };
 cst="был была было";
 if ( (suw_any(-1)||w(-1,cst)) && Q(-1,"prl_mnim") &&
             q(1,"prl_ro suw_ro prq_ro suw_edne") && s(-1,0) )
 { l[i]=omo1; R[1143]++; if(dbg){print "R1143"}; continue };
 cst="был была было";
 if ( (suw_any(-1)||w(-1,cst)) && Q(-1,"prl_mnim") &&
            qf(1,5,"suw_ro suw_edne") && s(-1,qfn-1) )
 { l[i]=omo1; R[1144]++; if(dbg){print "R1144"}; continue };
 if ( muk_edmuro(-2) &&
               q(-1,"mest_im suw_im") && s(-2,-1) )
 { l[i]=omo1; R[1145]++; if(dbg){print "R1145"}; continue };
 if ( prl_any(-1) && z(-1) &&
            q(1,"mest_ro prl_ro prq_ro") &&
            q(2,"suw_ro") && s(0,1) )
 { l[i]=omo1; R[1146]++; if(dbg){print "R1146"}; continue };
 if ( prl_any(-1) && z(-1) &&
            q(1,"suw_ro") && s(0) )
 { l[i]=omo1; R[1147]++; if(dbg){print "R1147"}; continue };
 #
 if ( pre_ro(-1) && Q(-1,"pre_im pre_vi") && s(-1) )
 { l[i]=omo1; R[1148]++; if(dbg){print "R1148"}; continue };
 if ( q(-1,"pre_im pre_vi") && Q(-1,"pre_ro") && s(-1) )
 { l[i]=omo2; R[1149]++; if(dbg){print "R1149"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1150]++; if(dbg){print "R1150", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1151]++; if(dbg){print "R1151", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1152]++; if(dbg){print "R1152", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2256 !_#_!
 #  x2256 sw_ez_iv_		sw_mn_r_
xgrp="x2256";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1153]++; if(dbg){print "R1153", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2257 !_#_!
 #  x2257 sw_ez_r_		sw_mn_i_
xgrp="x2257";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[1154]++; if(dbg){print "R1154", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1155]++; if(dbg){print "R1155", "sw_mn_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2258 !_#_!
 #  x2258 sw_ez_r_      sw_mn_iv_
xgrp="x2258";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="весны") {
   if ( bw(-1,"гончая") && s(-1) )
   { l[i]=omo1; R[1156]++; if(dbg){print "R1156"}; continue };
 };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[1157]++; if(dbg){print "R1157", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1158]++; if(dbg){print "R1158", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1159]++; if(dbg){print "R1159", "sw_mn_v_f"}; continue };

#if ( wc(-1,"[ео]й$ [ео]йся$") && s(-1) )
#{ l[i]=omo1; R[1160]++; if(dbg){print "R1160"}; continue };
#if ( wc(-1,"[иы]е$ [иы]еся$") && s(-1) )
#{ l[i]=omo2; R[1161]++; if(dbg){print "R1161"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2259 !_#_!
 #  x2259 sw_ez_r_		sw_mn_v_
xgrp="x2259";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[1162]++; if(dbg){print "R1162", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1163]++; if(dbg){print "R1163", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2260 !_#_!
 #  x2260 sw_ez_t_		sw_ez_v_
xgrp="x2260";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo1; R[1164]++; if(dbg){print "R1164", "sw_ez_t_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[1165]++; if(dbg){print "R1165", "sw_ez_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2261 !_#_!
 #  x2261 sw_ez_t_		sw_mn_r_
xgrp="x2261";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo1; R[1166]++; if(dbg){print "R1166", "sw_ez_t_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1167]++; if(dbg){print "R1167", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2262 !_#_!
 #  x2262 sw_ez_t_		sw_mn_vr_
xgrp="x2262";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo1; R[1168]++; if(dbg){print "R1168", "sw_ez_t_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1169]++; if(dbg){print "R1169", "sw_mn_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1170]++; if(dbg){print "R1170", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2263 !_#_!
 #  x2263 sw_mn_p_		sw_mn_r_
xgrp="x2263";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_p_f() )
 { l[i]=omo1; R[1171]++; if(dbg){print "R1171", "sw_mn_p_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1172]++; if(dbg){print "R1172", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2264 !_#_!
 #  x2264 sw_mn_p_      sw_mn_vr_
xgrp="x2264";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_p_f() )
 { l[i]=omo1; R[1173]++; if(dbg){print "R1173", "sw_mn_p_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1174]++; if(dbg){print "R1174", "sw_mn_v_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1175]++; if(dbg){print "R1175", "sw_mn_r_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2265 !_#_!
 #  x2265 mest_1ems_t_2mn_d_       mest_ems_p_
xgrp="x2265";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="во на о обо при";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1176]++; if(dbg){print "R1176"}; continue };
 #
 cst="во на о обо при";
 if ( !(w(-1,cst) && s(-1)) )
 { l[i]=omo1; R[1177]++; if(dbg){print "R1177"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2266 !_#_!
 #  x2266 m2_1mest_es_r_2souz_     mest_es_p_    чем  че́м  чём
xgrp="x2266";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="в на о об по при";
 if ( !(w(-2,"не") && s(-2)) &&
        w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1178]++; if(dbg){print "R1178"}; continue };
 #
 if ( tolower(l[i])==iwrd )
 { l[i]=omo1; R[1179]++; if(dbg){print "R1179"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2267 !_#_!
 #  x2267 qip_iv_       sw_mn_vr_    сорок  со́рок  соро́к
xgrp="x2267";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(1,"suw_mnro suw_mnsq qi_ed qi_mn") && s(0) )
 { l[i]=omo1; R[1180]++; if(dbg){print "R1180"}; continue };
 if ( q(-1,"suw_mnro suw_mnsq qi_ed qi_mn") && s(-1) )
 { l[i]=omo1; R[1181]++; if(dbg){print "R1181"}; continue };
 if ( q(-2,"qi_ed qi_mn") &&
      w(-1,"или") && s(-2,-1) )
 { l[i]=omo1; R[1182]++; if(dbg){print "R1182"}; continue };
 if ( w(1,"или") &&
      q(2,"qi_ed qi_mn") && s(0,1) )
 { l[i]=omo1; R[1183]++; if(dbg){print "R1183"}; continue };
 cst="за по под";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1184]++; if(dbg){print "R1184"}; continue };

 cst="в за на под";
 if ( suw_mnro(-2) &&
             w(-1,cst) && s(-2,-1) )
 { l[i]=omo1; R[1185]++; if(dbg){print "R1185"}; continue };

 if ( qxs(1,"с","половиной четвертью небольшим") )
 { l[i]=omo1; R[1186]++; if(dbg){print "R1186"}; continue };
 if ( q(-1,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") && s(-1) )
 { l[i]=omo1; R[1187]++; if(dbg){print "R1187"}; continue };

 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1188]++; if(dbg){print "R1188", "sw_mn_r_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1189]++; if(dbg){print "R1189", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2268 !_#_!
 #  x2268 qip_dprt_     sw_ez_i_   сорока  сорока́  соро́ка
xgrp="x2268";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2ш
 prex=1
 #
 cst="более менее около";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1190]++; if(dbg){print "R1190"}; continue };
 if ( pre_pr(-1) &&
           q(1,"suw_mnpr qik_pr") && s(-1,0) )
 { l[i]=omo1; R[1191]++; if(dbg){print "R1191"}; continue };
 if ( q(-2,"qik_ro") &&
      q(-1,"sz_iili") && s(-2,-1) )
 { l[i]=omo1; R[1192]++; if(dbg){print "R1192"}; continue };
 if ( q(-1,"suw_mnro suw_mnsq qik_ro") && s(-1) )
 { l[i]=omo1; R[1193]++; if(dbg){print "R1193"}; continue };
 if ( q(1,"suw_mnro suw_mnsq qik_ro") && s(0) )
 { l[i]=omo1; R[1194]++; if(dbg){print "R1194"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[1195]++; if(dbg){print "R1195", "sw_ez_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2269 !_#_!
 #  x2269 mest_ems_d_   sw_em_d_   тому  то́му  тому́
xgrp="x2269";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="как что чтоб чтобы";
 if ( z(0) &&
     (q(1,"muk_ed muk_mn mest_ed mest_mn")||w(1,cst)) )
 { l[i]=omo1; R[1196]++; if(dbg){print "R1196"}; continue };

 if ( q(-1,"mod_ed mod_mn mod_bz gl_in") &&
      q(1,"gl_in") && s(-1,0) )
 { l[i]=omo1; R[1197]++; if(dbg){print "R1197"}; continue };

 if ( prl_any(-2) &&
       pre_da(-1) &&
            z(0) && s(-2,-1) )
 { l[i]=omo1; R[1198]++; if(dbg){print "R1198"}; continue };
 if ( sz_iili(1) &&
            q(2,"mest_da") && s(0,1) )
 { l[i]=omo1; R[1199]++; if(dbg){print "R1199"}; continue };
 if ( pre_da(-1) &&
          (q(1,"suw_edmuda suw_edsrda")||w(1,"же")) && s(-1,0) )
 { l[i]=omo1; R[1200]++; if(dbg){print "R1200"}; continue };
 if ( pre_da(-1) &&
          (q(1,"suw_edmuda suw_edsrda")||w(1,"же")) && s(-1,0) )
 { l[i]=omo1; R[1201]++; if(dbg){print "R1201"}; continue };
 if ( w(1,"же") &&
      q(2,"suw_edmuda suw_edsrda") && s(0,1) )
 { l[i]=omo1; R[1202]++; if(dbg){print "R1202"}; continue };
 if ( q(-1,"suw_ro qik_im") &&
      w(1,"назад") && s(-1) )
 { l[i]=omo1; R[1203]++; if(dbg){print "R1203"}; continue };

 cst="подобна подобная подобнее подобней подобно подобного подобное подобной подобном подобному подобною подобную подобны подобные подобный подобным подобными \
      подобных";
 if ( w(-1,"а и но") &&
      w(1,cst) && s(-1) )
 { l[i]=omo1; R[1204]++; if(dbg){print "R1204"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[1205]++; if(dbg){print "R1205", "sw_em_d_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2270 !_#_!
 #  x2270	deep_na_    pre_combo_  судя судя́ су́дя
xgrp="x2270";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"по") && s(0) )
 { l[i]=omo2; R[1206]++; if(dbg){print "R1206"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2271 !_#_!
 #  x2271 m2_1sw_ez_i_2predik_     sw_ez_i_  пора  пора́  по́ра
xgrp="x2271";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qf(1,3,"gl_in") && s(0,qfn-1) )
 { l[i]=omo1; R[1207]++; if(dbg){print "R1207"}; continue };
 if ( mest_da(-1) )
 { l[i]=omo1; R[1208]++; if(dbg){print "R1208"}; continue };
 if ( p(-1)||p(0) )
 { l[i]=omo1; R[1209]++; if(dbg){print "R1209"}; continue };
 if ( q(-1,"gl_paedze") )
 { l[i]=omo1; R[1210]++; if(dbg){print "R1210"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2272 !_#_!
 #  x2272 m2_1pl_kr_ez_2sw_mn_iv_  sw_es_r_  права  права́  пра́ва
xgrp="x2272";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if ( q(-4,"gl_pein gl_peed gl_pemn deep_pe prq_pe gl_pnin gl_pned gl_pnmn deep_pn prq_pn") &&
      q(-3,"suw_vi") &&
         suw_edro(-2) && sz_iili(-1) && s(-4,-1) )
 { l[i]=omo1; R[1211]++; if(dbg){print "R1211"}; continue };
 if ( qxs(-1,"как","при","этом") )
 { l[i]=omo1; R[1212]++; if(dbg){print "R1212"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[1213]++; if(dbg){print "R1213", "sw_es_r_f"}; continue };
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; R[1214]++; if(dbg){print "R1214", "pl_kr_ez_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[1215]++; if(dbg){print "R1215", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[1216]++; if(dbg){print "R1216", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2273 !_#_!
 #  x2273 samogo1_ samogo2_   самого  са́мого  самого́
xgrp="x2273";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="посыльного";
 if (  w(1,cst) && s(0) )
 { l[i]=omo2; R[1217]++; if(dbg){print "R1217"}; continue };

 if ( q(1,"prl_edmuro") && s(0) && (p(1)||q_w(2,"pre_any sz_iili")) && Q(1,"suw_odedro") )
 { l[i]=omo1; R[1218]++; if(dbg){print "R1218"}; continue };
 if ( w(-3,"у") &&
      q(-2,"mest_ro") &&
      w(-1,"у") && s(-3,-1) )
 { l[i]=omo2; R[1219]++; if(dbg){print "R1219"}; continue };
 if ( qxs(-1,"того этого","же")||
      ww_(-1,"того этого") )
 { l[i]=omo1; R[1220]++; if(dbg){print "R1220"}; continue };
 #
 cst="меня себя тебя";
 if ( (w(1,cst)||q(1,"gl_mn gl_ed muk_edmuro")) && s(0) && Q(1,"suw_any") )
 { l[i]=omo2; R[1221]++; if(dbg){print "R1221"}; continue };
 if ( w(1,"не") &&
     (w(2,cst)||q(2,"gl_mn gl_ed muk_edmuro")) && s(0,1) && Q(2,"suw_any") )
 { l[i]=omo2; R[1222]++; if(dbg){print "R1222"}; continue };

 if ( w(1,"его") && s(0) && p(1) )
 { l[i]=omo2; R[1223]++; if(dbg){print "R1223"}; continue };

 cst="меня него себя тебя";
 if ( (w(-1,cst)||muk_edmuro(-1)) && s(-1) )
 { l[i]=omo2; R[1224]++; if(dbg){print "R1224"}; continue };
 if ( (w(-1,"его")||muk_edmuro(-1)) && (p(0)||q_w(1,"sz_iili pre_any")) && s(-1) )
 { l[i]=omo2; R[1225]++; if(dbg){print "R1225"}; continue };
 #
 cst="высокого низкого толстого тонкого умного хитрого храброго худого";
 if ( w(1,cst) &&
      q(2,"name_ro_sy isname") && s(0,1) )
 { l[i]=omo1; R[1226]++; if(dbg){print "R1226"}; continue };
 if ( q(1,"prl_edmuro prl_edsrro prq_edmuro prq_edsrro prl_edsrro mest_vi mest_ro") &&
      q(2,"name_ro_sy isname") && s(0,1) )
 { l[i]=omo2; R[1227]++; if(dbg){print "R1227"}; continue };
 if ( q(1,"name_ro_sy isname") && s(0) )
 { l[i]=omo2; R[1228]++; if(dbg){print "R1228"}; continue };
 if ( q(1,"suw_odedro") && s(0) && Q(1,"prl_edro") )
 { l[i]=omo2; R[1229]++; if(dbg){print "R1229"}; continue };
 if ( q(1,"prl_edmuro prl_edsrro") && z(1) && s(0) &&
      w(2,"самого") &&
      q(3,"prl_edmuro prl_edsrro") && s(2,3) )
 { l[i]=omo1; R[1230]++; if(dbg){print "R1230"}; continue };
 if ( q(1,"prl_edmuro prl_edsrro prq_edmuro prq_edsrro") &&
sz_iili(2) &&
      q(3,"prl_edmuro prl_edsrro prq_edmuro prq_edsrro") && s(0,2) )
 { l[i]=omo1; R[1231]++; if(dbg){print "R1231"}; continue };
 if ( q(-2,"prl_edmuro prl_edsrro prq_edmuro prq_edsrro") &&
sz_iili(-1) &&
      q(1,"prl_edmuro prl_edsrro prq_edmuro prq_edsrro") && s(-2,0) )
 { l[i]=omo1; R[1232]++; if(dbg){print "R1232"}; continue };
 if ( q(1,"prl_edmuro prl_edsrro prq_edmuro prq_edsrro mest_vi mest_ro") &&
      q(2,"suw_edmuro suw_edsrro pre_any prl_edmuro prl_edsrro") && s(0,1) && Q(2,"isname") )
 { l[i]=omo1; R[1233]++; if(dbg){print "R1233"}; continue };
 if ( q(1,"prl_edmuro prl_edsrro mest_vi mest_ro") && s(0) && (p(1)||q_w(2,"sz_iili pre_any")) && Q(1,"suw_odedro") )
 { l[i]=omo1; R[1234]++; if(dbg){print "R1234"}; continue };
 if ( q(1,"prq_edmuro prq_edsrro") && s(0) && (p(1)||q_w(2,"pre_any")) )
 { l[i]=omo2; R[1235]++; if(dbg){print "R1235"}; continue };
 #
 if ( mest_vi(1) && s(0) )
 { l[i]=omo2; R[1236]++; if(dbg){print "R1236"}; continue };
 if ( pre_ro(-2) && W(-2,"с") &&
     mest_ro(-1) && s(-2,-1) && !(q(1,"suw_ro") && s(0)) )
 { l[i]=omo2; R[1237]++; if(dbg){print "R1237"}; continue };
 if ( pre_ro(-1) &&
         (q_(1,swn_edmu_ro)||q_(1,swn_edsr_ro)||mest_ro(1)) && s(-1,0) )
 { l[i]=omo1; R[1238]++; if(dbg){print "R1238"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2274 !_#_!
 #  x2274 samoe1_ samoe2_     самое  са́мое  самоё
xgrp="x2274";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qxs(-1,"то это","же")||
      ww_(-1,"то это") )
 { l[i]=omo1; R[1239]++; if(dbg){print "R1239"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer
### x2275 !_#_!
 #  x2275 samoy1_ samoy2_     самой  са́мой  само́й
xgrp="x2275";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
#cst="природе стуже сути форме";
#if ( w(-1,"по") &&
#      w(1,cst) && s(-1,0) )
#{ l[i]=omo2; R[1240]++; if(dbg){print "R1240"}; continue };
 cst="высоте глубине глубинке гуще середине середке чаще";
 if ( w(-1,"в") &&
      w(1,cst) && s(-1,0) )
 { l[i]=omo1; R[1241]++; if(dbg){print "R1241"}; continue };

 #
 cst="возле до у";
 if ( w(-1,cst) &&
      q(1,"suw_noedro suw_nomnro") && s(-1,0) )
 { l[i]=omo1; R[1242]++; if(dbg){print "R1242"}; continue };
 cst="в о по";
 if ( w(-1,cst) &&
      q(1,"suw_noedpr suw_nomnpr") && s(-1,0) )
 { l[i]=omo2; R[1243]++; if(dbg){print "R1243"}; continue };
 if ( w(-1,"перед") &&
      q(1,"suw_noedtv suw_nomntv") && s(-1,0) )
 { l[i]=omo1; R[1244]++; if(dbg){print "R1244"}; continue };

 if ( q(1,"prl_edzeda") && s(0) && (p(1)||q_w(2,"pre_any sz_iili")) && Q(1,"suw_odedda") )
 { l[i]=omo1; R[1245]++; if(dbg){print "R1245"}; continue };
 if ( w(-3,"у") &&
      q(-2,"mest_ro") &&
      w(-1,"у") && s(-3,-1) )
 { l[i]=omo2; R[1246]++; if(dbg){print "R1246"}; continue };
 if ( qxs(-1,"той этой","же")||
      ww_(-1,"той этой") )
 { l[i]=omo1; R[1247]++; if(dbg){print "R1247"}; continue };
 #
 cst="ей себе себя тебе";
 if ( (w(1,cst)||q(1,"gl_mn gl_ed muk_edzeda")) && s(0) && Q(1,"suw_any") )
 { l[i]=omo2; R[1248]++; if(dbg){print "R1248"}; continue };
 if ( w(1,"ее") && p(1) && s(0) )
 { l[i]=omo2; R[1249]++; if(dbg){print "R1249"}; continue };
 cst="ей меня мне нее себе себя тебе тебя";
 if ( (w(-1,cst)||muk_edzeda(-1)) && s(-1) )
 { l[i]=omo2; R[1250]++; if(dbg){print "R1250"}; continue };
 if ( (w(-1,"ее")||muk_edzeda(-1)) && (p(0)||q_w(1,"sz_iili pre_any")) && s(-1) )
 { l[i]=omo2; R[1251]++; if(dbg){print "R1251"}; continue };


 #
 if ( q(-2,"muk_edzeda muk_edzero muk_edzetv muk_edzepr") &&
      w(-1,"же") && s(-2,-1) )
 { l[i]=omo1; R[1252]++; if(dbg){print "R1252"}; continue };
 if ( muk_edzeda(-1) && s(-1) )
 { l[i]=omo1; R[1253]++; if(dbg){print "R1253"}; continue };

 cst="вашей его ее их нашей своей твоей";
 if ( w(-1,"по и") &&
      w(1,cst) &&
      q(2,"suw_edzeda suw_edzero suw_edzetv suw_edzepr") && s(-1,1) )
 { l[i]=omo2; R[1254]++; if(dbg){print "R1254"}; continue };
 #
 if ( q(1,"prl_edzeda prl_edzero prl_edzetv") && z(1) && s(0) &&
      w(2,"самой") &&
      q(3,"prl_edzeda prl_edzero prl_edzetv") && s(2,3) )
 { l[i]=omo1; R[1255]++; if(dbg){print "R1255"}; continue };
 if ( q(1,"prl_edzeda prl_edzero prl_edzetv qik_tv") &&
      q(2,"prl_edzeda prl_edzero prl_edzetv") &&
      q(3,"suw_edzeda suw_edzero suw_edzetv suw_edzepr pre_any") && s(0,2) )
 { l[i]=omo1; R[1256]++; if(dbg){print "R1256"}; continue };
 if ( q(1,"prl_edzeda prl_edzero prl_edzetv mest_da") &&
      q(2,"suw_edzeda suw_edzero suw_edzetv suw_edzepr pre_any") && s(0,1) )
 { l[i]=omo1; R[1257]++; if(dbg){print "R1257"}; continue };
 if ( q(1,"prl_edzeda prl_edzero prl_edzetv") &&
mest_3e(2) &&
      q(3,"suw_edzeda suw_edzero suw_edzetv suw_edzepr pre_any") && s(0,2) )
 { l[i]=omo1; R[1258]++; if(dbg){print "R1258"}; continue };
 if ( q(1,"prl_edzeda prl_edzero prl_edzetv") &&
      q(2,"gl_need gl_nemn gl_vzmn") &&
      q(3,"suw_im") && s(0,2) )
 { l[i]=omo1; R[1259]++; if(dbg){print "R1259"}; continue };
 #
 if ( q(1,"prl_edzeda") &&
sz_iili(2) &&
      w(3,"самой") &&
      q(4,"prl_edzeda") && s(0,3) )
 { l[i]=omo1; R[1260]++; if(dbg){print "R1260"}; continue };
 #
 if ( q(1,"name_pr_sy isname") && s(0) )
 { l[i]=omo2; R[1261]++; if(dbg){print "R1261"}; continue };
 if ( q(-1,"pre_da preph_da") &&
     q_(1,swn_edmze_pr) && s(-1,0) )
 { l[i]=omo1; R[1262]++; if(dbg){print "R1262"}; continue };

 if ( q(1,"prl_edzetv prq_edzetv") && s(0) && p(1) )
 { l[i]=omo1; R[1263]++; if(dbg){print "R1263"}; continue };
 if ( q(1,"suw_tv") &&
      q(2,"gl_pein gl_peed gl_pemn deep_pe prq_pe") && s(0,1) )
 { l[i]=omo2; R[1264]++; if(dbg){print "R1264"}; continue };
 if ( q(1,"suw_tv") &&
     bw(2,"быть") &&
      q(3,"prq_pe") && s(0,2) )
 { l[i]=omo2; R[1265]++; if(dbg){print "R1265"}; continue };


 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2276 !_#_!
 #  x2276 samom1_ samom2_     самом  са́мом  само́м
xgrp="x2276";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 # индивидуальные слова
 cst = "верху виду деле зените конце краю начале низу носу разгаре расцвете сердце центре углу"
 if ( pre_pr(-1) &&
           w(1,cst) && s(-1,0) )
 { l[i]=omo1; R[1266]++; if(dbg){print "R1266"}; continue };
 if ( pre_pr(-1) &&
           q(1,"prl_edmupr prq_edmupr") &&
           w(2,cst) && s(-1,1) )
 { l[i]=omo1; R[1267]++; if(dbg){print "R1267"}; continue };
 if ( pre_pr(-1) && s(-1) &&
         ((w(1,"ли же") && s(0,1))||(w(1,"то") && se(0,"-") && s(1))) &&
           w(2,cst) )
 { l[i]=omo1; R[1268]++; if(dbg){print "R1268"}; continue };

 cst = "сигнале действии городе принципе путешествии селении селе смысле человечестве народе корабле шаттле"
 if ( pre_pr(-1) &&
           w(1,cst) && s(0) )
 { l[i]=omo2; R[1269]++; if(dbg){print "R1269"}; continue };

 if ( q(1,"prl_edmupr") && s(0) && (p(1)||q_w(2,"pre_any sz_iili")) && Q(1,"suw_odedpr") )
 { l[i]=omo1; R[1270]++; if(dbg){print "R1270"}; continue };
 cst="мне нем себе тебе";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1271]++; if(dbg){print "R1271"}; continue };
 if ( (w(1,cst)||muk_edmupr(1)) && s(0) )
 { l[i]=omo2; R[1272]++; if(dbg){print "R1272"}; continue };

 if ( q(1,"name_pr_sy isname") && s(0) )
 { l[i]=omo2; R[1273]++; if(dbg){print "R1273"}; continue };
 if ( muk_edmupr(-1) && s(-1) )
 { l[i]=omo1; R[1274]++; if(dbg){print "R1274"}; continue };
 #
 if ( q(1,"prl_edmupr prl_edsrpr") && z(1) && s(0) &&
      w(2,"самом") &&
      q(3,"prl_edmupr prl_edsrpr") && s(2,3) )
 { l[i]=omo1; R[1275]++; if(dbg){print "R1275"}; continue };
 if ( q(1,"prl_edmupr prl_edsrpr") &&
sz_iili(2) &&
      w(3,"самом") &&
      q(4,"prl_edmupr prl_edsrpr") && s(0,3) )
 { l[i]=omo1; R[1276]++; if(dbg){print "R1276"}; continue };
 if ( q(1,"prl_edmupr prl_edsrpr mest_vi mest_pr") &&
      q(2,"suw_edmupr suw_edsrpr pre_any") && s(0,1) )
 { l[i]=omo1; R[1277]++; if(dbg){print "R1277"}; continue };
 if ( q(1,"prl_edmupr prl_edsrpr mest_vi mest_pr") &&
mest_3e(2) &&
      q(3,"suw_edmupr suw_edsrpr pre_any") && s(0,2) )
 { l[i]=omo1; R[1278]++; if(dbg){print "R1278"}; continue };
 #
 if ( pre_pr(-1) &&
         (q_(1,swn_edmu_pr)||q_(1,swn_edsr_pr)) && s(-1,0) )
 { l[i]=omo1; R[1279]++; if(dbg){print "R1279"}; continue };
 #
 if ( muk_edmupr(-2) &&
               w(-1,"же") && s(-2,-1) )
 { l[i]=omo1; R[1280]++; if(dbg){print "R1280"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2277 !_#_!
 #  x2277 samomu1_ samomu2_   самому  са́мому  самому́
xgrp="x2277";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="обществу";
 if ( q(1,"mest_3e") &&
      w(2,cst) && s(0) )
 { l[i]=omo2; R[1281]++; if(dbg){print "R1281"}; continue };
 if ( w(1,cst) && s(0) )
 { l[i]=omo2; R[1282]++; if(dbg){print "R1282"}; continue };
 #
 if ( w(-1,"к") &&
      q(1,"suw_noedmuda suw_noedsrda") && s(-1,0) )
 { l[i]=omo1; R[1283]++; if(dbg){print "R1283"}; continue };
 #
 if ( q(1,"prl_edmuda") && s(0) && (p(1)||q_w(2,"pre_any sz_iili")) && Q(1,"suw_odedda") )
 { l[i]=omo1; R[1284]++; if(dbg){print "R1284"}; continue };

 cst="ему мне себе тебе";
 if ( (w(1,cst)||muk_edmuda(1)) && s(0) )
 { l[i]=omo2; R[1285]++; if(dbg){print "R1285"}; continue };
 if ( (w(-1,cst)||muk_edmuda(-1)) &&
suw_edda(1) && s(-1,0) )
 { l[i]=omo1; R[1286]++; if(dbg){print "R1286"}; continue };
 if ( (w(-1,cst)||muk_edmuda(-1)) && s(-1) )
 { l[i]=omo2; R[1287]++; if(dbg){print "R1287"}; continue };

 #
 if ( q(1,"prl_edmuda prl_edsrda") && z(1) && s(0) &&
      w(2,"самому") &&
      q(3,"prl_edmuda prl_edsrda") && s(2,3) )
 { l[i]=omo1; R[1288]++; if(dbg){print "R1288"}; continue };
 if ( q(1,"prl_edmuda prl_edsrda mest_da") &&
      q(2,"prl_edmuda prl_edsrda mest_da") &&
      q(3,"suw_edmuda suw_edsrda") && s(0,2) )
 { l[i]=omo1; R[1289]++; if(dbg){print "R1289"}; continue };
 if ( q(1,"prl_edmuda prl_edsrda mest_da") &&
      q(2,"suw_edmuda suw_edsrda pre_any") && s(0,1) )
 { l[i]=omo1; R[1290]++; if(dbg){print "R1290"}; continue };
 #
 if ( q(-1,"pre_da preph_da") &&
    (q_(1,swn_edmu_da)||q_(1,swn_edsr_da)) && s(-1,0) )
 { l[i]=omo1; R[1291]++; if(dbg){print "R1291"}; continue };
 #
 if ( muk_edmuda(-2) &&
               w(-1,"же") && s(-2,-1) )
 { l[i]=omo1; R[1292]++; if(dbg){print "R1292"}; continue };
 if ( q(1,"suw_odedmuda suw_odedsrda suw_odmnda name_da_sy isname") && s(0) && Q(1,"prl_da") )
 { l[i]=omo2; R[1293]++; if(dbg){print "R1293"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2278 !_#_!
 #  x2278 sw_1es_rz_2ez_i_   sw_mn_iv_  вина  вина́  ви́на
xgrp="x2278";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_z_f() )
 { l[i]=omo1; R[1294]++; if(dbg){print "R1294", "sw_es_z_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; R[1295]++; if(dbg){print "R1295", "sw_ez_i_f"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; R[1296]++; if(dbg){print "R1296", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1297]++; if(dbg){print "R1297", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1298]++; if(dbg){print "R1298", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2279 !_#_!
 #  x2279 m2_1nar_step_2qin_iv_  pl_kr_es_
xgrp="x2279";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="мал мало мальски маля помалу";
 if ( sc(0,"-") && w(1,cst) )
 { l[i]=omo1; R[1299]++; if(dbg){print "R1299"}; continue };
 #
 if ( qxs(-1,"как и","будто") )
 { l[i]=omo1; R[1300]++; if(dbg){print "R1300"}; continue };
 if ( q(-1,"mest_da suw_da") )
 { l[i]=omo1; R[1301]++; if(dbg){print "R1301"}; continue };
 #
 cst="где как какой кого кто ли того что";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[1302]++; if(dbg){print "R1302"}; continue };
 #
 cst="какой один";
 if ( bw(1,cst) && s(0) )
 { l[i]=omo1; R[1303]++; if(dbg){print "R1303"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2280 !_#_!
 #  x2280 m2_1sw_ez_i_2deep_na_	sw_em_r_  душа  душа́  ду́ша
xgrp="x2280";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; R[1304]++; if(dbg){print "R1304", "sw_ez_i_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[1305]++; if(dbg){print "R1305", "sw_em_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2281 !_#_!
 #  x2281 gl_paedze_    sw_ez_i_  жила  жила́  жи́ла
xgrp="x2281";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"была") && sc(0,"-") )
 { l[i]=omo1; R[1306]++; if(dbg){print "R1306"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[1307]++; if(dbg){print "R1307", "sw_ez_i_f"}; continue };
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; R[1308]++; if(dbg){print "R1308", "gl_paedze_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2282 !_#_!
 #  x2282 m2_1nar_vopr_2souz_	prl_ems_vr_  отчего  отчего́  о́тчего
xgrp="x2282";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( !(suw_edro(1) && s(0)) )
 { l[i]=omo1; R[1309]++; if(dbg){print "R1309"}; continue };
 #
 if ( w(1,"дома") && s(0) )
 { l[i]=omo2; R[1310]++; if(dbg){print "R1310"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2283 !_#_!
 #  x2283 m2_1sw_em_r_2nar_mest_   sw_mn_iv_  дома  до́ма  дома́
xgrp="x2283";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( idb(1,5,"gl4dOma") && s(idn,-1) )
 { l[i]=omo1; R[1311]++; if(dbg){print "R1311"}; continue };
 cst="быть находиться оставаться остаться пребывать проводить сидеть спать";
 if ( bw(-1,cst) &&  s(-1) )
 { l[i]=omo1; R[1312]++; if(dbg){print "R1312"}; continue };

 if ( q(-2,"mest_vi mest_3e suw_vi") &&
      q(-1,"gl_pemn gl_pnmn") &&
      q(1,"mest_edvi suw_vi") && s(-2,0) )
 { l[i]=omo1; R[1313]++; if(dbg){print "R1313"}; continue };
 if ( q(1,"mest_vi mest_3e suw_vi") &&
      q(2,"mod_mn") &&
      q(3,"gl_in") && s(0,2) )
 { l[i]=omo1; R[1314]++; if(dbg){print "R1314"}; continue };
 if ( q(1,"mest_vi mest_3e suw_vi") &&
      q(2,"nar_vrem nar_spos") &&
      q(3,"mod_mn") &&
      q(4,"gl_in") && s(0,3) )
 { l[i]=omo1; R[1315]++; if(dbg){print "R1315"}; continue };

 if ( q(-1,"gl_in gl_ed gl_mn gl_po gl_vzed gl_vzmn deep") && bam(-1,"_gl_static _gl_talk") && s(-1) )
 { l[i]=omo1; R[1316]++; if(dbg){print "R1316"}; continue };
 if ( q(-1,"gl_nein gl_need gl_nemn gl_ponemn gl_poneed gl_povzmn gl_vzmn deep_ne") && s(-1) )
 { l[i]=omo1; R[1317]++; if(dbg){print "R1317"}; continue };
 if ( q(-2,"gl_nein gl_need gl_nemn gl_ponemn gl_poneed gl_povzmn gl_vzmn deep_ne") &&
      w(-1,"как") && s(-2,-1) )
 { l[i]=omo1; R[1318]++; if(dbg){print "R1318"}; continue };
 if ( q(-2,"mest_mnim suw_mnim") && Q(-2,"gl_mn") &&
      q(-1,"prl_krmn") && s(-2,-1) )
 { l[i]=omo1;; R[1319]++; if(dbg){print "R1319"}; continue };
 if ( q(1,"mest_im suw_im") &&
      q(2,"gl_peed gl_pemn gl_popeed gl_popemn") &&
      q(3,"prl_da mest_da") &&
      q(4,"prl_vi") &&
      q(5,"suw_vi name_vi_sy isname") && s(0,4) && p(-1) )
 { l[i]=omo1; R[1320]++; if(dbg){print "R1320"}; continue };
 if ( q(1,"mest_im suw_im") &&
      q(2,"gl_peed gl_pemn gl_popeed gl_popemn") &&
      q(3,"prl_da mest_da") &&
      q(4,"suw_vi name_vi_sy isname") && s(0,3) && p(-1) )
 { l[i]=omo1; R[1321]++; if(dbg){print "R1321"}; continue };
 if ( q(1,"mest_im suw_im") &&
      q(2,"gl_peed gl_pemn gl_popeed gl_popemn") &&
      q(3,"prl_vi") &&
      q(4,"suw_vi name_vi_sy isname") && s(0,3) && p(-1) )
 { l[i]=omo1; R[1322]++; if(dbg){print "R1322"}; continue };
 if ( q(1,"mest_im suw_im") &&
      q(2,"gl_peed gl_pemn gl_popeed gl_popemn") &&
      q(3,"suw_vi name_vi_sy isname") && s(0,2) && p(-1) )
 { l[i]=omo1; R[1323]++; if(dbg){print "R1323"}; continue };

 #
 if ( q(-2,"mest_im suw_im name_im_sy isname") && Q(-2,"prl_im") &&
      w(-1,"не же ведь") && s(-2,-1))
 { l[i]=omo1; R[1324]++; if(dbg){print "R1324"}; continue };
 #
 if ( prq_mnim(-3) &&
        pre_ro(-2) &&
             q(-1,"suw_ro mest_ro") && s(-3,-1))
 { l[i]=omo2; R[1325]++; if(dbg){print "R1325"}; continue };
 if ( pre_ro(-2) &&
           q(-1,"suw_ro mest_ro") && s(-2,-1))
 { l[i]=omo1; R[1326]++; if(dbg){print "R1326"}; continue };
 if ( w(1,"у") &&
      q(2,"suw_ro mest_ro") && s(0,1))
 { l[i]=omo1; R[1327]++; if(dbg){print "R1327"}; continue };
 #
 cst="вы кто мы он она оно ты я";
 if ( ( w(-1,cst)||mest_edim(-1)||q_(-1,mst_ed_mu_im)) && s(-1))
 { l[i]=omo1; R[1328]++; if(dbg){print "R1328"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1329]++; if(dbg){print "R1329", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1330]++; if(dbg){print "R1330", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1331]++; if(dbg){print "R1331", "sw_mn_v_f"}; continue };

 if ( w(-1,"как") && s(-1) && p(0) )
 { l[i]=omo1; R[1332]++; if(dbg){print "R1332"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2284 !_#_!
 #  x2284   gl_ed1e     pl_ez_v_  целую  целу́ю  це́лую
xgrp="x2284";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="армию борозду бутылку вечность галактику горку гору группу деревню историю квартиру колонку колонну корзину кружку кучу неделю ночь пачку планету пригоршню \
      расу свинью секунду стену страницу страну сумку тонну цивилизацию чашку эскадрилью";
 if ( w(1,cst) && s(0))
 { l[i]=omo2; R[1333]++; if(dbg){print "R1333"}; continue };
 #
 if ( pl_ez_v_f() )
 { l[i]=omo2; R[1334]++; if(dbg){print "R1334", "pl_ez_v_f"}; continue };
 #
 if ( suw_mnvi(1) && s(0) )
 { l[i]=omo1; R[1335]++; if(dbg){print "R1335"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[1336]++; if(dbg){print "R1336", "gl_ed1e_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2285 !_#_!
 #  x2285 bolshaya1_ bolshaya2_   большая  бо́льшая  больша́я
xgrp="x2285";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="значительно куда много намного несколько";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1337]++; if(dbg){print "R1337"}; continue };
 cst="половина часть";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[1338]++; if(dbg){print "R1338"}; continue };
 if ( z(0) && w(1,"чем") )
 { l[i]=omo1; R[1339]++; if(dbg){print "R1339"}; continue };
 #
 cst="весьма довольно достаточно очень самая слишком чересчур";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1340]++; if(dbg){print "R1340"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2286 !_#_!
 #  x2286 bolshie1_  bolshie2_   большие  бо́льшие  больши́е
xgrp="x2286";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="значительно куда много намного несколько";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1341]++; if(dbg){print "R1341"}; continue };
 cst="половины части";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[1342]++; if(dbg){print "R1342"}; continue };
 if ( z(0) && w(1,"чем") )
 { l[i]=omo1; R[1343]++; if(dbg){print "R1343"}; continue };
 #
 cst="весьма довольно достаточно очень самые слишком чересчур";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1344]++; if(dbg){print "R1344"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2287 !_#_!
 #  x2287 bolshim1_  bolshim2_   большим  бо́льшим  больши́м
xgrp="x2287";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="значительно куда много намного несколько";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1345]++; if(dbg){print "R1345"}; continue };
 cst="половинам частям";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[1346]++; if(dbg){print "R1346"}; continue };
 if ( z(0) && w(1,"чем") )
 { l[i]=omo1; R[1347]++; if(dbg){print "R1347"}; continue };
 if ( pre_tv(-2) &&
           w(-1"чем тем еще") &&
           q(1,"suw_tv") && s(-2,0) )
 { l[i]=omo1; R[1348]++; if(dbg){print "R1348"}; continue };
 #
 cst="весьма довольно достаточно очень самым слишком чересчур";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1349]++; if(dbg){print "R1349"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2288 !_#_!
 #  x2288 bolshimi1_  bolshimi2_   большими  бо́льшими  больши́ми
xgrp="x2288";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="значительно куда много намного несколько";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1350]++; if(dbg){print "R1350"}; continue };
 cst="половинами частями";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[1351]++; if(dbg){print "R1351"}; continue };
 if ( z(0) && w(1,"чем") )
 { l[i]=omo1; R[1352]++; if(dbg){print "R1352"}; continue };
 #
 cst="весьма довольно достаточно очень самыми слишком чересчур";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1353]++; if(dbg){print "R1353"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2289 !_#_!
 #  x2289 bolshih1_  bolshih2_   больших  бо́льших  больши́х
xgrp="x2289";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="значительно куда намного";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1354]++; if(dbg){print "R1354"}; continue };
 cst="половин частей";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[1355]++; if(dbg){print "R1355"}; continue };
 if ( z(0) && w(1,"чем") )
 { l[i]=omo1; R[1356]++; if(dbg){print "R1356"}; continue };
 #
 cst="весьма довольно достаточно много несколько очень самых слишком чересчур";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1357]++; if(dbg){print "R1357"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2290 !_#_!
 #  x2290 bolshuu1_  bolshuu2_   большую  бо́льшую  большу́ю
xgrp="x2290";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="значительно куда много намного несколько";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1358]++; if(dbg){print "R1358"}; continue };
 cst="половину частю";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[1359]++; if(dbg){print "R1359"}; continue };
 if ( z(0) && w(1,"чем") )
 { l[i]=omo1; R[1360]++; if(dbg){print "R1360"}; continue };
 #
 cst="весьма довольно достаточно очень самую слишком чересчур";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1361]++; if(dbg){print "R1361"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2291 !_#_!
 #  x2291 sw_ez_vr_      sw_mn_iv_  методы  мето́ды  ме́тоды
xgrp="x2291";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1362]++; if(dbg){print "R1362", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1363]++; if(dbg){print "R1363", "sw_mn_v_f"}; continue };
 prex=1
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[1364]++; if(dbg){print "R1364", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2292 !_#_!
 #  x2292 gl_1poed_2inf_  sw_1ez_dpr_2mn_iv_  < извести повести >
xgrp="x2292";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="извести") {
   if ( q(1,"mest_vi suw_vi") && s(0) )
   { l[i]=omo1; R[1365]++; if(dbg){print "R1365"}; continue };
 };
 if(iwrd=="повести") {
   if ( q(1,"gl_in mest_vi suw_vi") && s(0) )
   { l[i]=omo1; R[1366]++; if(dbg){print "R1366"}; continue };
 };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[1367]++; if(dbg){print "R1367", "gl_poed_f"}; continue };
 #
#if ( gl_in_f() )
#{ l[i]=omo1; R[1368]++; if(dbg){print "R1368"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[1369]++; if(dbg){print "R1369", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[1370]++; if(dbg){print "R1370", "sw_ez_p_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[1371]++; if(dbg){print "R1371", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1372]++; if(dbg){print "R1372", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1373]++; if(dbg){print "R1373", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2293 !_#_!
 #  x2293 sw_em_rz_		sw_mn_iv_  хлеба  хле́ба  хлеба́
xgrp="x2293";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pre_ro(-1) && Q(-1,"pre_im pre_vi") && s(-1) )
 { l[i]=omo1; R[1374]++; if(dbg){print "R1374"}; continue };
 if ( q(-1,"pre_im pre_vi") && Q(-1,"pre_ro") && s(-1) )
 { l[i]=omo2; R[1375]++; if(dbg){print "R1375"}; continue };
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; R[1376]++; if(dbg){print "R1376", "sw_em_z_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1377]++; if(dbg){print "R1377", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1378]++; if(dbg){print "R1378", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1379]++; if(dbg){print "R1379", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2294 !_#_!
 #  x2294 sw_es_rz_      sw_mn_iv_
xgrp="x2294";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_z_f() )
 { l[i]=omo1; R[1380]++; if(dbg){print "R1380", "sw_es_z_f"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; R[1381]++; if(dbg){print "R1381", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1382]++; if(dbg){print "R1382", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1383]++; if(dbg){print "R1383", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2295 !_#_!
 #  x2295 sw_es_r_		sw_ez_i_ уха  у́ха  уха́
xgrp="x2295";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( bw(-1,"мочка") && s(-1) )
 { l[i]=omo1; R[1384]++; if(dbg){print "R1384", "sw_es_r_f"}; continue };
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; R[1385]++; if(dbg){print "R1385", "sw_es_r_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[1386]++; if(dbg){print "R1386", "sw_ez_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2296 !_#_!
 #  x2296 sw_ez_rz_      sw_mn_iv_
xgrp="x2296";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="колы") {
   cst="кока нюка перри";
   if ( w(-1,cst) && se(-1,"-") )
   { l[i]=omo1; R[1387]++; if(dbg){print "R1387"}; continue };
 };
 if(iwrd=="земли") {
   if ( w(-1,"матери") && se(-1,"-") )
   { l[i]=omo1; R[1388]++; if(dbg){print "R1388"}; continue };
 };
 #
 if ( sw_ez_z_f() )
 { l[i]=omo1; R[1389]++; if(dbg){print "R1389", "sw_ez_z_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[1390]++; if(dbg){print "R1390", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1391]++; if(dbg){print "R1391", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1392]++; if(dbg){print "R1392", "sw_mn_v_f"}; continue };

 if ( wc(-1,"[ео]й$ [ео]йся$") && s(-1) )
 { l[i]=omo1; R[1393]++; if(dbg){print "R1393"}; continue };
 if ( wc(-1,"[иы]е$ [иы]еся$") && s(-1) )
 { l[i]=omo2; R[1394]++; if(dbg){print "R1394"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2297 !_#_!
 #  x2297 sw_em_i_		m3_sw_1em_iv_2mn_r_3deep_   пристав  при́став  приста́в
xgrp="x2297";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 # 3 сущ. им.п.: +при́став (од.), -приста́в (неод.), -приста́ва (неод.)
 #
 if ( w(1,"к как") && s(0) )
 { l[i]=omo2; R[1395]++; if(dbg){print "R1395"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; R[1396]++; if(dbg){print "R1396", "sw_em_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2298 !_#_!
 #  x2298 gl_paedmu_	sw_mn_r_
xgrp="x2298";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
   if ( gl_in(1) && s(0) )
   { l[i]=omo1; R[1397]++; if(dbg){print "R1397"}; continue };
   if ( w(1,"было") &&
       (q(2,"gl_in isname")||w(2,"он")) && s(0,1) )
   { l[i]=omo1; R[1398]++; if(dbg){print "R1398"}; continue };
   if ( sc(-1,"—") &&
   (isname(1)||suw_edmuim(1)||w(1,"он")) && s(0) )
   { l[i]=omo1; R[1399]++; if(dbg){print "R1399"}; continue };
   if ( q(1,"pre_vi preph_vi") &&
        q(2,"suw_vi prl_vi prq_vi mest_vi") && s(0,1) )
   { l[i]=omo1; R[1400]++; if(dbg){print "R1400"}; continue };
   if ( q(1,"pre_ro preph_ro") &&
        q(2,"suw_ro prl_ro prq_ro mest_ro") && s(0,1) )
   { l[i]=omo1; R[1401]++; if(dbg){print "R1401"}; continue };
   if ( q(1,"pre_tv preph_tv") &&
        q(2,"suw_tv prl_tv prq_tv mest_tv") && s(0,1) )
   { l[i]=omo1; R[1402]++; if(dbg){print "R1402"}; continue };
   if ( pre_pr(1) &&
             q(2,"suw_pr prl_pr prq_pr mest_pr") && s(0,1) )
   { l[i]=omo1; R[1403]++; if(dbg){print "R1403"}; continue };
   if ( gl_in(1) && s(0) )
   { l[i]=omo1; R[1404]++; if(dbg){print "R1404"}; continue };

 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; R[1405]++; if(dbg){print "R1405", "gl_paedmu_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1406]++; if(dbg){print "R1406", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2299 !_#_!
 #  x2299 sw_em_rz_		sw_ez_i_   лука  лу́ка  лука́
xgrp="x2299";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; R[1407]++; if(dbg){print "R1407", "sw_em_z_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1408]++; if(dbg){print "R1408", "sw_em_r_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[1409]++; if(dbg){print "R1409", "sw_ez_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2300 !_#_!
 #  x2300 gl_poed_      sw_1ez_rz_2mn_iv_
xgrp="x2300";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="пищи") {
   cst="запас приём производство";
   if ( bw(-1,cst) && s(-1) )
   { l[i]=omo2; R[1410]++; if(dbg){print "R1410"}; continue };
 };
 if ( q(-2,"pre_any preph_any") &&
      q(-1,"suw_any") && s(-2,-1) )
 { l[i]=omo2; R[1411]++; if(dbg){print "R1411"}; continue };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; R[1412]++; if(dbg){print "R1412", "gl_poed_f"}; continue };
 #
 if ( sw_ez_z_f() )
 { l[i]=omo2; R[1413]++; if(dbg){print "R1413", "sw_ez_z_f"}; continue };
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; R[1414]++; if(dbg){print "R1414", "sw_ez_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; R[1415]++; if(dbg){print "R1415", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; R[1416]++; if(dbg){print "R1416", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2301 !_#_!
 #  x2301 gl_poed_   sw_1ez_rz_2mn_iv_  пошло  пошло́  по́шло
xgrp="x2301";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="быть выглядеть звучать смотреться";
 if ( bw(-1,cst) && s(-1) )
 { l[i]=omo2; R[1417]++; if(dbg){print "R1417", "gl_paedsr_f"}; continue };
 cst="достаточнош немного слишком черезчур";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1418]++; if(dbg){print "R1418", "gl_paedsr_f"}; continue };
 if ( q(-2,"prl_kred_sr") &&
sz_iili(-1) && s(-2,-1) )
 { l[i]=omo2; R[1419]++; if(dbg){print "R1419", "gl_paedsr_f"}; continue };

 #
 if ( qxs(-1,"если","на","то")||
      qxs(-1,"если","бы","что-то")||
      qxs(-1,"если","уж","на","то") )
 { l[i]=omo1; R[1420]++; if(dbg){print "R1420"}; continue };
 if ( qxs(1,"не","так")||
      qxs(1,"на","перекосяк") )
 { l[i]=omo1; R[1421]++; if(dbg){print "R1421"}; continue };
 if ( q(1,"pre_vi preph_vi") &&
      q(2,"suw_vi") && s(0,1) )
 { l[i]=omo1; R[1422]++; if(dbg){print "R1422"}; continue };

 if ( gl_paedsr_f() )
 { l[i]=omo1; R[1423]++; if(dbg){print "R1423", "gl_paedsr_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2302 !_#_!
 #  x2302 sw_em_p_		sw_ez_dp_ одуш-неодуш.
xgrp="x2302";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 #
 if ( w(-1,"на") && s(-1) )
 { l[i]=omo2; R[1424]++; if(dbg){print "R1424", "sw_ez_d_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[1425]++; if(dbg){print "R1425", "sw_em_p_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[1426]++; if(dbg){print "R1426", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[1427]++; if(dbg){print "R1427", "sw_ez_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2303 !_#_!
 #  x2303 sw_em_p_		sw_ez_dp_ неодуш.
xgrp="x2303";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 if(iwrd=="кружке") {
   cst="вина воды жидкости молока пива сока эля";
   if ( w(1,cst) && s(0) )
   { l[i]=omo2; R[1428]++; if(dbg){print "R1428"}; continue };
 };
 if(iwrd=="полке") {
   if ( w(-1,"на") && s(-1) )
   { l[i]=omo2; R[1429]++; if(dbg){print "R1429"}; continue };
 };
 if(iwrd=="жаре") {
   if ( w(-1,"на по") && s(-1) )
   { l[i]=omo2; R[1430]++; if(dbg){print "R1430"}; continue };
 };
 if(iwrd=="носке") {
   if ( w(-1,"в на") && s(-1) )
   { l[i]=omo1; R[1431]++; if(dbg){print "R1431"}; continue };
 };
 if(iwrd=="спине") {
   prex=0
   if ( sw_em_p_f() )
   { l[i]=omo2; R[1432]++; if(dbg){print "R1432", "sw_em_p_f"}; continue };
   prex=1
 };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[1433]++; if(dbg){print "R1433", "sw_em_p_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; R[1434]++; if(dbg){print "R1434", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[1435]++; if(dbg){print "R1435", "sw_ez_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2304 !_#_!
 #  x2304 sw_em_d_		sw_ez_v_
xgrp="x2304";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[1436]++; if(dbg){print "R1436", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[1437]++; if(dbg){print "R1437", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2305 !_#_!
 #  x2305 sw_em_d_		sw_ez_v_
xgrp="x2305";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[1438]++; if(dbg){print "R1438", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; R[1439]++; if(dbg){print "R1439", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2306 !_#_!
 #  x2306 sw_em_r_		sw_ez_i_
xgrp="x2306";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1440]++; if(dbg){print "R1440", "sw_em_r_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[1441]++; if(dbg){print "R1441", "sw_ez_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2307 !_#_!
 #  x2307 pl_ems_p_		sw_em_t_   другом  друго́м  дру́гом
xgrp="x2307";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2

 cst="быть стать являться";
 if ( bw(-1,cst) && s(-1) )
 { l[i]=omo2; R[1442]++; if(dbg){print "R1442"}; continue };
 if ( bw(-2,cst) &&
       q(-1,"mest_3e") && s(-1) )
 { l[i]=omo2; R[1443]++; if(dbg){print "R1443"}; continue };

 #
 if ( w(-1,"друг") && s(-1) )
 { l[i]=omo2; R[1444]++; if(dbg){print "R1444", "sw_em_t_f"}; continue };
 if ( q(-2,"suw_tv") &&
sz_iili(-1) && s(-2,-1) )
 { l[i]=omo2; R[1445]++; if(dbg){print "R1445", "sw_em_t_f"}; continue };
 #
 if ( sw_em_p_f()||sw_es_p_f()||pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; R[1446]++; if(dbg){print "R1446", "sw_em_p_f||sw_es_p_f||pl_em_p_f||pl_es_p_f"}; continue };
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; R[1447]++; if(dbg){print "R1447", "sw_em_t_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2308 !_#_!
 #  x2308 m3_nar_1srav_2vrem_3pre_ro_  pl_es_iv_  позднее  поздне́е  по́зднее
xgrp="x2308";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_srav_f() )
 { l[i]=omo1; R[1448]++; if(dbg){print "R1448", "pl_srav_f"}; continue };
 #
 cst="значительно куда лишь много намного немного несколько";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1449]++; if(dbg){print "R1449"}; continue };
 if ( nar_vrem_f() )
 { l[i]=omo1; R[1450]++; if(dbg){print "R1450", "nar_vrem_f"}; continue };
 #
 if ( pl_es_i_f() )
 { l[i]=omo2; R[1451]++; if(dbg){print "R1451", "pl_es_i_f"}; continue };
 #
 if ( pl_es_v_f() )
 { l[i]=omo2; R[1452]++; if(dbg){print "R1452", "pl_es_v_f"}; continue };
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2309 !_#_!
 #  x2309 m2_1sw_em_d_2gl_ed1e_  sw_em_l_  берегу  берегу́  бе́регу
xgrp="x2309";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; R[1453]++; if(dbg){print "R1453", "sw_em_l_f"}; continue };
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; R[1454]++; if(dbg){print "R1454", "sw_em_d_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[1455]++; if(dbg){print "R1455", "gl_ed1e_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2310 !_#_!
 #  x2310 sw_emz_dp_	sw_ez_dp_  буре  бу́ре  буре́
xgrp="x2310";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; R[1456]++; if(dbg){print "R1456", "sw_ez_d_f"}; continue };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; R[1457]++; if(dbg){print "R1457", "sw_em_p_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; R[1458]++; if(dbg){print "R1458", "sw_ez_p_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2311 !_#_!
 #  x2311 nar_spos_	 pl_ems_p_  добром  добро́м  до́бром
xgrp="x2311";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"прошу") && s(-1) )
 { l[i]=omo1; R[1459]++; if(dbg){print "R1459"}; continue };
 #
 if ( pl_em_p_f() )
 { l[i]=omo2; R[1460]++; if(dbg){print "R1460", "sw_ez_d_f"}; continue };
 #
 if ( pl_es_p_f() )
 { l[i]=omo2; R[1461]++; if(dbg){print "R1461", "sw_em_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2312 !_#_!
 #  x2312 pl_ez_dprt_	pl_srav_  горячей  горя́чей  горяче́й
xgrp="x2312";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_ez_d_f()||pl_ez_p_f()||pl_ez_r_f()||pl_ez_t_f() )
 { l[i]=omo1; R[1462]++; if(dbg){print "R1462", "sw_ez_d_f"}; continue };
 #
 if ( pl_srav_f() )
 { l[i]=omo2; R[1463]++; if(dbg){print "R1463", "sw_em_p_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2313 !_#_!
 #  x2313 gl_paedmu_	sw_mn_r_
xgrp="x2313";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(1,"prl_ro") &&
      q(2,"suw_ro") && s(0) )
 { l[i]=omo2; R[1464]++; if(dbg){print "R1464"}; continue };
 if ( q(1,"suw_ro") && s(0) )
 { l[i]=omo2; R[1465]++; if(dbg){print "R1465"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; R[1466]++; if(dbg){print "R1466", "sw_mn_r_f"}; continue };
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; R[1467]++; if(dbg){print "R1467", "gl_paedmu_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2314 !_#_!
 #  x2314 deep_na_     pl_ez_i_  такая  та́кая  така́я
xgrp="x2314";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(1,"suw_edzeim prl_edzeim") && s(0) )
 { l[i]=omo2; R[1468]++; if(dbg){print "R1468"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2315 !_#_!
 #  x2315 word_hyphdef_  deep_na_  какая  кака́я  ка́кая
xgrp="x2315";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( s1(0,"-") && ismark(1,"YHYF") && w(1,"то") )
 { l[i]=omo1; l[i+1]=gensub(/^(.+)$/,"\xcc\xa0\\1\xcc\xa0",1,l[i+1]); R[1469]++; if(dbg){print "R1469"}; continue };
 if ( s1(0,"-") && ismark(1,"YHYF") )
 { l[i]=omo1; R[1470]++; if(dbg){print "R1470"}; continue };
 #
 if ( pl_ez_i_f() )
 { l[i]=omo1; R[1471]++; if(dbg){print "R1471", "pl_ez_i_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x2316 !_#_!
 #  x2316 m2_1nar_kaq_2pl_kr_es_  sw_es_iv_  далеко  далеко́  далёко
xgrp="x2316";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="быть стать являться";
 if ( bw(-1,cst) && s(-1) )
 { l[i]=omo1; R[1472]++; if(dbg){print "R1472"}; continue };
 if ( q(-1,"nar_step") && s(-1) )
 { l[i]=omo1; R[1473]++; if(dbg){print "R1473"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x3001 !_#_!
 #  x3001 gl_paedze_    sw_em_r_   sw_mn_iv_
xgrp="x3001";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[1474]++; if(dbg){print "R1474", "sw_em_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo3; R[1475]++; if(dbg){print "R1475", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo3; R[1476]++; if(dbg){print "R1476", "sw_mn_v_f"}; continue };
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; R[1477]++; if(dbg){print "R1477", "gl_paedze_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3002 !_#_!
 #  x3002 gl_paedze_    sw_es_r_   sw_mn_iv_
xgrp="x3002";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[1478]++; if(dbg){print "R1478", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo3; R[1479]++; if(dbg){print "R1479", "sw_mn_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo3; R[1480]++; if(dbg){print "R1480", "sw_mn_v_f"}; continue };
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; R[1481]++; if(dbg){print "R1481", "gl_paedze_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3003 !_#_!
 #  x3003 nar_napr_     sw_ez_t_   sw_mn_r_
xgrp="x3003";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; R[1482]++; if(dbg){print "R1482", "sw_ez_t_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo3; R[1483]++; if(dbg){print "R1483", "sw_mn_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3004 !_#_!
 #  x3004 m2_1sw_mn_i_2deep_na_    sw_em_vr_     sw_ez_i_
xgrp="x3004";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[1484]++; if(dbg){print "R1484", "sw_mn_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[1485]++; if(dbg){print "R1485", "sw_em_v_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[1486]++; if(dbg){print "R1486", "sw_em_r_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo3; R[1487]++; if(dbg){print "R1487", "sw_ez_i_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3005 !_#_!
 #  x3005 gl_ed1e_      sw_em_d_   sw_ez_v_
xgrp="x3005";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; R[1488]++; if(dbg){print "R1488", "sw_em_d_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo3; R[1489]++; if(dbg){print "R1489", "sw_ez_v_f"}; continue };
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; R[1490]++; if(dbg){print "R1490", "gl_ed1e_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3006 !_#_!
 #  x3006 pl_es_iv_     sw_es_iv_  sw_es_p_
xgrp="x3006";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; R[1491]++; if(dbg){print "R1491", "sw_es_i_f"}; continue };
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; R[1492]++; if(dbg){print "R1492", "sw_es_v_f"}; continue };
 #
 if ( sw_es_p_f() )
 { l[i]=omo3; R[1493]++; if(dbg){print "R1493", "sw_es_p_f"}; continue };
 #
 if ( pl_es_i_f() )
 { l[i]=omo1; R[1494]++; if(dbg){print "R1494", "pl_es_i_f"}; continue };
 #
 if ( pl_es_v_f() )
 { l[i]=omo1; R[1495]++; if(dbg){print "R1495", "pl_es_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3007 !_#_!
 #  x3007 sw_em_r_      sw_ez_i_   sw_mn_v_  округа  о́круга  окру́га  округа́
xgrp="x3007";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( bw(-1,"совет") && s(-1) )
 { l[i]=omo1; R[1496]++; if(dbg){print "R1496"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; R[1497]++; if(dbg){print "R1497", "sw_em_r_f"}; continue };
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; R[1498]++; if(dbg){print "R1498", "sw_ez_i_f"}; continue };
 #
 if ( sw_mn_v_f() )
 { l[i]=omo3; R[1499]++; if(dbg){print "R1499", "sw_mn_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3008 !_#_!
 #  x3008 sw_em_l_    sw_em_r_     sw_ez_v_
xgrp="x3008";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; R[1500]++; if(dbg){print "R1500", "sw_em_l_f"}; continue };
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; R[1501]++; if(dbg){print "R1501", "sw_em_r_f"}; continue };
 #
 if ( sw_ez_v_f() )
 { l[i]=omo3; R[1502]++; if(dbg){print "R1502", "sw_ez_v_f"}; continue };
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3009 !_#_!
 #  x3009 gl_ed3e_  sw_em_iv_  sw_mn_r_
xgrp="x3009";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_ed3e_f() )
 { l[i]=omo1; R[1503]++; if(dbg){print "R1503", "gl_ed3e_f"}; continue };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo3; R[1504]++; if(dbg){print "R1504", "sw_mn_r_f"}; continue };
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; R[1505]++; if(dbg){print "R1505", "sw_em_i_f"}; continue };
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; R[1506]++; if(dbg){print "R1506", "sw_em_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3010 !_#_!
 #  x3010 gl_mn2e_      sw_em_p_   sw_ez_dp_
xgrp="x3010";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; R[1507]++; if(dbg){print "R1507", "sw_em_p_f"}; continue };
 #
 if ( sw_ez_d_f() )
 { l[i]=omo3; R[1508]++; if(dbg){print "R1508", "sw_ez_d_f"}; continue };
 #
 if ( sw_ez_p_f() )
 { l[i]=omo3; R[1509]++; if(dbg){print "R1509", "sw_ez_p_f"}; continue };
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; R[1510]++; if(dbg){print "R1510", "gl_mn2e_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3011 !_#_!
 #  x3011 heal_1bud_2pov_  gl_pomn_ gl_mn2e_  выходите  вы́ходите  выходи́те  выхо́дите
xgrp="x3011";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn2e_f() )
 { l[i]=omo3; R[1511]++; if(dbg){print "R1511", "gl_mn2e_f"}; continue };
 #
 if ( gl_pomn_f() )
 { l[i]=omo2; R[1512]++; if(dbg){print "R1512", "gl_pomn_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3012 !_#_!
 #  x3012 sw_mn_iv_  sw_es_r_  sw_em_r_  лета  лета́  ле́та  лёта
xgrp="x3012";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; R[1513]++; if(dbg){print "R1513", "sw_es_r_f"}; continue };
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; R[1514]++; if(dbg){print "R1514", "sw_mn_i_f"}; continue };
 if ( sw_mn_v_f() )
 { l[i]=omo1; R[1515]++; if(dbg){print "R1515", "sw_mn_v_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3013 !_#_!
 #  x3013 sw_1ez_r_2ez_mn_iv_  sw_mn_iv_number_  sw_mn_iv_troop_  четы  четы́  чёты  че́ты
xgrp="x3013";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; R[1516]++; if(dbg){print "R1516", "sw_ez_r_f"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3014 !_#_!
 #  x3014 gl_export_  gl_smear_  pq_kr_em_  вывозим  выво́зим  вы́возим  вывози́м
xgrp="x3014";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer
### x3015 !_#_!
 #  x3015 gl_carryout_  gl_nurture_  pq_kr_em_  выносим  выно́сим  вы́носим  выноси́м
xgrp="x3015";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3016 !_#_!
 #  x3016 hyphany_word_  icon_  image_  образной  обра́зной  о́бразной  образно́й
xgrp="x3016";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(-1,"-") )
 { l[i]=omo1; R[1517]++; if(dbg){print "R1517"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x4700 !_#_!
 #  x4700 cost_         stand_   стоит  сто́ит  стои́т
xgrp="x4700";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="стоит") {
   if ( q(1,"prl_ro mest_ro") &&
        q(2,"suw_ro") && s(0,1) && Q(1,"suw_edim") )
   { l[i]=omo1; R[1518]++; if(dbg){print "R1518"}; continue };
   if ( q(1,"suw_ro") && s(0) && Q(1,"suw_edim") )
   { l[i]=omo1; R[1519]++; if(dbg){print "R1519"}; continue };
 };
 #
 if ( w(1,"того") && z(1) &&
      w(2,"чтобы") )
 { l[i]=omo1; R[1520]++; if(dbg){print "R1520"}; continue };
 #
 if (  qxs(-1,"один одно","другого")||
       qxs(-1,"одна","другой")||
       qxs(-1,"мало","что")||
       qxs(-1,"чего-то кое-чего","и да")||
       qxs(-1,"ничего что столько лучше","не")||
       qxs(-1,"друг","друга") )
 { l[i]=omo1; R[1521]++; if(dbg){print "R1521"}; continue };
 #
 if (  qxs(1,"один","другого")||
       qxs(1,"в","зависимости","от")||
       qxs(1,"ни","копейки гроша цента")||
       qxs(1,"по","колено щиколотку пояс горло шею подбородок уши брови","в")||
       qxs(1,"мало","что")||
       qxs(1,"друг","друга")  )
 { l[i]=omo1; R[1522]++; if(dbg){print "R1522"}; continue };
 #
 if ( narph_kaq(1) &&
              q(xwn+1,"qik_im qik_edim") &&
              q(xwn+2,"suw_mnro") && ba(xwn+2,"_geld") && s(0,xwn+1) )
 { l[i]=omo1; R[1523]++; if(dbg){print "R1523"}; continue };
 if ( q(1,"qik_im qik_edim") &&
      q(2,"suw_ro") && ba(2,"_geld") && s(0,1) )
 { l[i]=omo1; R[1524]++; if(dbg){print "R1524"}; continue };
 if ( q(-1,"mest_it suw_im") &&
      q(1,"suw_im") && ba(1,"_geld") && s(-1,0) )
 { l[i]=omo1; R[1525]++; if(dbg){print "R1525"}; continue };
 if ( q(1,"prl_ro mest_ro") &&
      q(2,"suw_ro") && s(0,1) && Q(1,"suw_im") )
 { l[i]=omo1; R[1526]++; if(dbg){print "R1526"}; continue };
 if ( q(1,"suw_ro") && s(0) && Q(1,"suw_im") )
 { l[i]=omo1; R[1527]++; if(dbg){print "R1527"}; continue };
 if ( w(1,"по") &&
      q(2,"qik_im qik_edim") &&
      q(3,"suw_ro") && ba(3,"_geld") && s(0,3) )
 { l[i]=omo1; R[1528]++; if(dbg){print "R1528"}; continue };
 #
 if ( p(-2) && w(-1,"не") && s(-1) && p(0) )
 { l[i]=omo1; R[1529]++; if(dbg){print "R1529"}; continue };
 if ( p(-1) && w(1,"ли") && s(0) && p(1) )
 { l[i]=omo1; R[1530]++; if(dbg){print "R1530"}; continue };
 if ( p(-2) && w(-1,"а но не") &&
      w(1,"ли") && s(-1,0) && p(1) )
 { l[i]=omo1; R[1531]++; if(dbg){print "R1531"}; continue };
 cst="кое-чего чего чего-нибудь чего-то";
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1532]++; if(dbg){print "R1532"}; continue };
 #
 cst="более больше денег дешево дорого дорогого мало менее меньше многого недорого немало немногого побольше поменьше того";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; R[1533]++; if(dbg){print "R1533"}; continue };
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo1; R[1534]++; if(dbg){print "R1534"}; continue };
 if ( q(1,"mest_mnro prl_mnro") &&
      w(2,"денег") && s(0,1) )
 { l[i]=omo1; R[1535]++; if(dbg){print "R1535"}; continue };
 #
 if ( q(-1,"mest_it") &&
      w(1,"риска") && s(-1,0) )
 { l[i]=omo1; R[1536]++; if(dbg){print "R1536"}; continue };
 #
 cst="больше дешево дорого меньше";
 if ( q(1,"prl_kred_sr nar_step") &&
      w(2,cst) && s(0,1) )
 { l[i]=omo1; R[1537]++; if(dbg){print "R1537"}; continue };
 #
 cst="боком впереди выше лицом ниже позади сбоку сзади слева снизу спиной справа столбом";
 if ( w(1,cst) && s(0) )
 { l[i]=omo2; R[1538]++; if(dbg){print "R1538"}; continue };
 if ( w(-1,cst) && s(-1) )
 { l[i]=omo2; R[1539]++; if(dbg){print "R1539"}; continue };
 #
 if ( qb(-5,-1,"gl_in") && s(qbn,-1) )
 { l[i]=omo1; R[1540]++; if(dbg){print "R1540"}; continue };
 #
 if ( qf(1,5,"gl_in") && s(0,qfn-1) )
 { l[i]=omo1; R[1541]++; if(dbg){print "R1541"}; continue };
 #
 if ( q(-1,"nar_mest nar_spos nar_kaq") && s(-1) )
 { l[i]=omo2; R[1542]++; if(dbg){print "R1542"}; continue };
 if ( q(1,"nar_mest nar_spos nar_kaq") && s(0) )
 { l[i]=omo2; R[1543]++; if(dbg){print "R1543"}; continue };
 #
 if ( pre_ro(1) &&
           q(2,"suw_ro prl_ro prq_ro mest_ro") && s(0,1) )
 { l[i]=omo2; R[1544]++; if(dbg){print "R1544"}; continue };
 if ( pre_ro(-2) &&
           q(-1,"suw_ro") &&
           q(1,"suw_im") && s(-2,0) )
 { l[i]=omo2; R[1545]++; if(dbg){print "R1545"}; continue };
 if ( pre_ro(-2) &&
           q(-1,"suw_ro") &&
           q(1,"prl_im prq_im mest_im") &&
           q(2,"suw_im") && s(-2,1) )
 { l[i]=omo2; R[1546]++; if(dbg){print "R1546"}; continue };
 #
 if ( pre_pr(1) &&
           q(2,"suw_edme") && s(0,1) )
 { l[i]=omo2; R[1547]++; if(dbg){print "R1547"}; continue };
 if ( pre_pr(1) &&
           q(2,"prl_edpr") &&
           q(3,"suw_edme") && s(0,2) )
 { l[i]=omo2; R[1548]++; if(dbg){print "R1548"}; continue };
 #
 if ( pre_pr(1) &&
           q(2,"suw_pr prl_pr prq_pr mest_pr") && s(0,1) )
 { l[i]=omo2; R[1549]++; if(dbg){print "R1549"}; continue };
 if ( pre_pr(-2) &&
           q(-1,"suw_pr") &&
           q(1,"suw_im") && s(-2,0) )
 { l[i]=omo2; R[1550]++; if(dbg){print "R1550"}; continue };
 if ( pre_pr(-2) &&
           q(-1,"suw_pr") &&
           q(1,"prl_im prq_im mest_im") &&
           q(2,"suw_im") && s(-2,1) )
 { l[i]=omo2; R[1551]++; if(dbg){print "R1551"}; continue };
 #
 if ( pre_tv(1) &&
           q(2,"suw_tv prl_tv prq_tv mest_tv") && s(0,1) )
 { l[i]=omo2; R[1552]++; if(dbg){print "R1552"}; continue };
 if ( pre_tv(-2) &&
           q(-1,"suw_tv") &&
           q(1,"suw_im") && s(-2,0) )
 { l[i]=omo2; R[1553]++; if(dbg){print "R1553"}; continue };
 if ( pre_tv(-2) &&
           q(-1,"suw_tv") &&
           q(1,"prl_im prq_im mest_im") &&
           q(2,"suw_im") && s(-2,1) )
 { l[i]=omo2; R[1554]++; if(dbg){print "R1554"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4701 !_#_!
 #  x4701 comeout_    heal_    выходить  выходи́ть  вы́ходить
xgrp="x4701";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(1,"pre_vi") &&
      q(2,"suw_vi prl_vi prq_vi mest_vi") && s(0,1) )
 { l[i]=omo1; R[1555]++; if(dbg){print "R1555"}; continue };
 if ( q(1,"pre_ro") &&
      q(2,"suw_ro prl_ro prq_ro mest_ro") && s(0,1) )
 { l[i]=omo1; R[1556]++; if(dbg){print "R1556"}; continue };
 if ( q(1,"pre_da") &&
      q(2,"suw_da prl_da prq_da mest_da") && s(0,1) )
 { l[i]=omo1; R[1557]++; if(dbg){print "R1557"}; continue };
 if ( pre_pr(1) &&
           q(2,"suw_pr suw_edme prl_pr prq_pr mest_pr") && s(0,1) )
 { l[i]=omo1; R[1558]++; if(dbg){print "R1558"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4702 !_#_!
 #  x4702 know_    lead_    введение  ве́дение  веде́ние
xgrp="x4702";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 cst="быть находиться передавать передаваться передать";
 if ( w(-2,"в") &&
      q(-1,"mest_vi mest_pr") &&
      q(0,"suw_vi suw_pr") &&
      q(1,"suw_ro") &&
     bw(2,cst) && s(-2,1) )
 { l[i]=omo1; R[1559]++; if(dbg){print "R1559"}; continue };
 if ( w(-2,"в") &&
      q(-1,"mest_vi mest_pr") &&
      q(0,"suw_vi suw_pr") &&
     bw(1,cst) && s(-2,0) )
 { l[i]=omo1; R[1560]++; if(dbg){print "R1560"}; continue };
 #
 if ( prl_kred_sr(1) &&
                q(2,"prl_ro prq_ro mest_ro") &&
                q(3,"prl_ro prq_ro mest_ro suw_ro") && s(0,2) )
 { l[i]=omo2; R[1561]++; if(dbg){print "R1561"}; continue };
 if ( q(1,"prl_ro prq_ro mest_ro") &&
      q(2,"suw_ro") && s(0,1) )
 { l[i]=omo2; R[1562]++; if(dbg){print "R1562"}; continue };
 if ( q(1,"suw_ro") && s(0) )
 { l[i]=omo2; R[1563]++; if(dbg){print "R1563"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4703 !_#_!
 #  x4703 temp_    time_    временной  вре́менной  временно́й
xgrp="x4703";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"пространственно") && se(-1,"-") )
 { l[i]=omo2; R[1564]++; if(dbg){print "R1564"}; continue };
 #
 if(iwrd=="временной") {
   if ( q(1,"suw_edmuim suw_edmuvi") && s(0) )
   { l[i]=omo2; R[1565]++; if(dbg){print "R1565"}; continue };
 };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4704 !_#_!
 #  x4704 disperse_  herumlauf_    разбегаться  разбега́ться  разбе́гаться
xgrp="x4704";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( q(0,"gl_in") && q(-1,"mod_ed mod_bz mod_mn") && s(-1) )
 { l[i]=omo1; R[1566]++; if(dbg){print "R1566"}; continue };
 if ( q(0,"gl_navzmn") && q(1,"gl_namn gl_navzmn") && z(0) )
 { l[i]=omo1; R[1567]++; if(dbg){print "R1567"}; continue };
 if ( q(0,"gl_pavzmn") && q(1,"gl_pamn") && z(0) )
 { l[i]=omo1; R[1568]++; if(dbg){print "R1568"}; continue };
 if ( q(0,"gl_buvzmn") && q(1,"gl_bumn") && z(0) )
 { l[i]=omo1; R[1569]++; if(dbg){print "R1569"}; continue };
 if ( q(0,"gl_povzmn") )
 { l[i]=omo1; R[1570]++; if(dbg){print "R1570"}; continue };
 if ( pre_pr(1) &&
           q(2,"prl_ro prq_ro") &&
           q(3,"suw_ro") && s(0,2) )
 { l[i]=omo1; R[1571]++; if(dbg){print "R1571"}; continue };
 if ( pre_ro(1) &&
           q(2,"suw_ro") && s(0,1) )
 { l[i]=omo1; R[1572]++; if(dbg){print "R1572"}; continue };
 if ( pre_pr(1) &&
           q(2,"prl_pr prq_pr") &&
           q(3,"suw_pr") && s(0,2) )
 { l[i]=omo1; R[1573]++; if(dbg){print "R1573"}; continue };
 if ( pre_pr(1) &&
           q(2,"suw_pr") && s(0,1) )
 { l[i]=omo1; R[1574]++; if(dbg){print "R1574"}; continue };
 if ( pre_pr(-2) &&
           q(-1,"suw_pr") && s(-2,-1) )
 { l[i]=omo1; R[1575]++; if(dbg){print "R1575"}; continue };
 if ( z(0) &&
      w(1,"как словно") &&
      q(2,"suw_im") && s(1) )
 { l[i]=omo1; R[1576]++; if(dbg){print "R1576"}; continue };
 if ( z(0) &&
      w(1,"как словно") &&
      q(2,"prl_im") &&
      q(3,"suw_im") && s(1,2) )
 { l[i]=omo1; R[1577]++; if(dbg){print "R1577"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4705 !_#_!
 #  x4705 sink_   stomp_    упопать  упопа́ть  упо́пать
xgrp="x4705";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4706 !_#_!
 #  x4706 arrest_    drive_   привод   приво́д  при́вод
xgrp="x4706";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( bw(-1,"главный") && s(-1) )
 { l[i]=omo2; R[1578]++; if(dbg){print "R1578"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4707 !_#_!
 #  x4707 castle_    lock_   замок  за́мок  замо́к
 #  замка  замкам  замками  замках  замке  замки  замков  замком  замку  замок

 ZAMOK_F() # <<< правила находятся в файле zamok.awk

### x4708 !_#_!
 #  x4708 castle_    lock_   замоковый  за́моковый  замо́ковый
xgrp="x4708";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
#if ( bw(-1,"главный") && s(-1) )
#{ l[i]=omo2; R[1579]++; if(dbg){print "R1579"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4777 !_#_!
 #  x4777 forced_       none_
xgrp="x4777";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 l[i]=omo1; R[1580]++; if(dbg){print "R1580"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer


### THE_x_END !_#_!

# вывести изменённую строку

for (i in book) { print book[i] }

if ( dbgstat ) { DO_DEBUG(Z,"Z") };

  }
###_END_###

function DO_DEBUG(array,a_prefix,   outfile, k,cmd) {
#cmd = "if [ -s _Z_stat.txt ]; then rm _Z_stat.txt; fi"; system(cmd);
 outfile = "_" a_prefix ".txt"
 for (k in array) { if ( array[k] ) {printf ("%s%s %s %s\n", a_prefix, k, "=", array[k]) >> outfile } };
#                                    else {printf ("%s%s %s %s\n", a_prefix, k, "=", "empty")  >> outfile } };
  }
