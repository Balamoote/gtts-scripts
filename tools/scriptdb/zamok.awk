# Правила для всех форм слова
# let @a=1|%s/"Z\zs\d\+\ze"/\=''.(@a+setreg('a',@a+1))/g|%s/ Z\[\zs\d\+\ze\]++; if(dbg){print "Z\(\d\+\)"/\1/g
#  x4707 castle_    lock_   замок  за́мок  замо́к
#  замка  замкам  замками  замках  замке  замки  замков  замком  замку  замок

function ZAMOK_F() { # <<< правила находятся в файле zamok.awk

for(wrd in omap["x4707"]){omakevars(x4707,"x4707");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2

 # собрать слова
#if ( q(1,"suw_edro suw_mnro") && s(0) && Ww_(-1,"под")  )
#{ print lc(1) >> "_suw_ro.txt"; Z[1]++; if(dbg){print "Z1"}; }; continue
#{ getBF(-1,"_suw_ro.txt"); Z[2]++; if(dbg){print "Z2"}; }; continue

 ### ALL
 cst="блокировать";
 cst1="армия взвод дивизия отряд полк рота";
 if ( base(-1,cst) &&
      base(1,cst1) && s(-1,0) )
 { l[i]=omo1; Z[3]++; if(dbg){print "Z3"}; continue };
 if ( base(-2,cst1) && sc(-2,",") &&
   prq_any(-1) && base(-1,cst) && s(-1) )
 { l[i]=omo1; Z[4]++; if(dbg){print "Z4"}; continue };
 if ( base(-3,cst1) &&
         q(-2,"suw_ro isname") && sc(-2,",") &&
   prq_any(-1) && base(-1,cst) && s(-1) )
 { l[i]=omo1; Z[5]++; if(dbg){print "Z5"}; continue };


 cst="блокировать опечатать сканировать";
 if ( prq_any(-1) && base(-1,cst) && s(-1) )
 { l[i]=omo2; Z[6]++; if(dbg){print "Z6"}; continue };

 cst="[иотх]летн[еи] башенн[оы] комнатн[оы] метров[оы] саженн[оы] стенн[оы] уровнев[оы] этажн[оы] ярусн[оы]";
 if ( wc(-1,cst) && s(-1) )
 { l[i]=omo1; Z[7]++; if(dbg){print "Z7"}; continue };

 cst="бергск бургск вилльск городск гофск стонск стоунск таунск штадтск";
 cst1="ие ий им ими их ого ом ому";
 if ( jme(-1,cst,cst1) && s(-1) )
 { l[i]=omo1; Z[8]++; if(dbg){print "Z8"}; continue };

 cst="дюймов[оы] засовн[оы] значн[оы] копеечн[оы] пружинн[оы] пудов[оы] сувальдн[оы] точечн[оы] цилиндров[оы] штифтов[оы] штырьков[оы]";
 if ( wc(-1,cst) && s(-1) )
 { l[i]=omo2; Z[9]++; if(dbg){print "Z9"}; continue };

 cst="дюжин дюжины сотени сотни тысяч тысячи";
 if ( w(1,cst) &&
      q(2,"suw_mnro") && s(0,1) )
 { l[i]=omo1; Z[10]++; if(dbg){print "Z10"}; continue };

 # _lock_na_item:start
 if ( w(-4,"на") &&
      q(-3,"prl_pr mest_pr mest_3e") &&
   basa(-2,"_lock_na_item") &&
      q(-1,"prl_im prq_im mest_vi mest_3e") && s(-4,-1) )
 { l[i]=omo2; Z[11]++; if(dbg){print "Z11"}; continue };
 if ( basa(-2,"_lock_na_item") && se(-2," — ") &&
         w(-1,"на") && s(-1) )
 { l[i]=omo2; Z[12]++; if(dbg){print "Z12"}; continue };
 if ( w(1,"на") && Ww_(-1,"в") &&
    bfa(2,5,"_lock_na_item") && s(0,bfn-1) && Qf(2,bfn-1,"sz_iili pre_any") )
 { l[i]=omo2; Z[13]++; if(dbg){print "Z13"}; continue };
 # _lock_na_item:end

 cst="брать взять";
 if ( base(-3,cst) &&
         q(-2,"qast") &&
         w(-1,"приступом штурмом") && s(-3,-1) )
 { l[i]=omo1; Z[14]++; if(dbg){print "Z14"}; continue };

 cst="выглядеть казаться оказаться показаться представлять";
 if ( q(-1,"nar_mest nar_napr") &&
     bf(1,3,cst) && s(-1,bfn-1) )
 { l[i]=omo1; Z[15]++; if(dbg){print "Z15"}; continue };

 if ( qxs(1,"средней","руки") )
 { l[i]=omo1; Z[16]++; if(dbg){print "Z16"}; continue };

 # _castlelike_things:start
 if ( sc(0,",") &&
     qxw(1,"а но","не и") &&
    basa(xwn+1,"_castlelike_things") && s(xwn) )
 { l[i]=omo1; Z[17]++; if(dbg){print "Z17"}; continue };
 if ( sc(0,",") &&
       w(1,"а но") &&
       w(2,"не") &&
       q(3,"prl_any prq_any nar_any") &&
    basa(4,"_castlelike_things") && s(1,3) )
 { l[i]=omo1; Z[18]++; if(dbg){print "Z18"}; continue };
 if ( qxs(-1,"а но","не и") &&
     basa(xsn-1,"_castlelike_things") && sc(xsn-1,",") )
 { l[i]=omo1; Z[19]++; if(dbg){print "Z19"}; continue };
 if ( mest_it(-2) &&
            w(-1,"не") && s(-2,-1) &&
           sc(0,",") &&
      mest_it(1) &&
            w(2,"не") &&
         basa(3,"_castlelike_things") && s(1,2) )
 { l[i]=omo1; Z[20]++; if(dbg){print "Z20"}; continue };
 if ( mest_it(-2) &&
            w(-1,"не") && s(-2,-1) &&
           sc(0,",") &&
      mest_it(1) &&
            w(2,"не") &&
            q(3,"prl_any prq_any nar_any") &&
         basa(4,"_castlelike_things") && s(1,3) )
 { l[i]=omo1; Z[21]++; if(dbg){print "Z21"}; continue };
 if ( q(-1,"prl_any prq_any nar_any") &&
sz_iili(1) &&
      q(2,"prl_any prq_any nar_any") &&
   basa(3,"_castlelike_things") && s(-1,2) )
 { l[i]=omo1; Z[22]++; if(dbg){print "Z22"}; continue };

                    #cst="дворец дом крепость музей особняк резиденция тюрьма фактория цитадель";
 if ( sc(0,"-") && basa(1,"_castlelike_things") )
 { l[i]=omo1; Z[23]++; if(dbg){print "Z23"}; continue };
 if ( sc(-1,"-") && basa(-1,"_castlelike_things") )
 { l[i]=omo1; Z[24]++; if(dbg){print "Z24"}; continue };

 # превращать
 cst="превратить превратиться превращать превращаться";
 if ( base(-1,cst) &&
         w(1,"в") &&
       bfa(2,5,"_castlelike_things") && s(-1,bfn) && Qf(2,bfn-1,"sz_iili pre_any") )
 { l[i]=omo1; Z[25]++; if(dbg){print "Z25"}; continue };
 if ( base(1,cst) &&
         w(2,"в") &&
       bfa(3,6,"_castlelike_things") && s(0,bfn) && Qf(3,bfn-1,"sz_iili pre_any") )
 { l[i]=omo1; Z[26]++; if(dbg){print "Z26"}; continue };
 if ( basa(-3,"_castlelike_things") &&
      base(-2,cst) &&
         w(-1,"в") && s(-3,-1) )
 { l[i]=omo1; Z[27]++; if(dbg){print "Z27"}; continue };

 # _castlelike_things:end

 # _castle_environs:start
 if ( q(1,"sz_iili") &&
   basa(2,"_castle_environs") && s(0,1) )
 { l[i]=omo1; Z[28]++; if(dbg){print "Z28"}; continue };
 if ( q(1,"sz_iili") &&
      w(2,"даже же") &&
   basa(3,"_castle_environs") && s(0,2) )
 { l[i]=omo1; Z[29]++; if(dbg){print "Z29"}; continue };
 if ( basa(-2,"_castle_environs") &&
         q(-1,"sz_iili") && s(-2,-1) )
 { l[i]=omo1; Z[30]++; if(dbg){print "Z30"}; continue };
 if ( basa(-3,"_castle_environs") &&
         q(-2,"sz_iili") &&
         q(-1,"prl_any prq_any mest_any") && s(-3,-1) )
 { l[i]=omo1; Z[31]++; if(dbg){print "Z31"}; continue };
 if ( sc(-1,",") && basa(-1,"_castle_environs") )
 { l[i]=omo1; Z[32]++; if(dbg){print "Z32"}; continue };
 if ( sc(0,",") && basa(1,"_castle_environs") )
 { l[i]=omo1; Z[33]++; if(dbg){print "Z33"}; continue };
 if ( pre_vi(-1) && s(-1) && sc(0,",") &&
      pre_vi(1) && W(1,"на под") &&
        basa(2,"_castle_environs") && qq(-1,1) && s(1) )
 { l[i]=omo1; Z[34]++; if(dbg){print "Z34"}; continue };
 if ( pre_vi(-3) && s(-3) && sc(-2,",") && W(-3,"на под") &&
        basa(-2,"_castle_environs") &&
      pre_vi(-1) && qq(-3,-1) && s(-1) )
 { l[i]=omo1; Z[35]++; if(dbg){print "Z35"}; continue };
 if ( qxs(-1,"не","только") && sc(0,",") &&
        w(1,"а но") &&
        w(2,"и") &&
        q(3,"prl_im prq_im") &&
     basa(4,"_castle_environs") && s(1,3) )
 { l[i]=omo1; Z[36]++; if(dbg){print "Z36"}; continue };
 # _castle_environs:end

 # _locklike_things:start
 if ( sc(-1,"-") && basa(-1,"_locklike_things") )
 { l[i]=omo2; Z[37]++; if(dbg){print "Z37"}; continue };
 if ( sc(0,"-") && basa(1,"_locklike_things") )
 { l[i]=omo2; Z[38]++; if(dbg){print "Z38"}; continue };
 # _locklike_things:start

 # _castle_v_suw_pr:start
 if ( w(1,"в во") &&
    wfa(2,5,"_castle_v_suw_pr") && s(0,wfn-1) && Qf(2,wfn-1,"sz_iili pre_any") )
 { l[i]=omo1; Z[39]++; if(dbg){print "Z39"}; continue };
 # _castle_v_suw_pr:end

 # _lock_v_suw_pr:start
 cst="ванной двери дверь доме камере клетке комнате конюшне люке панцире погребе прихожей сумке туалете хранилище ящике";
 if ( w(1,"в во на") &&
    wfa(2,5,"_lock_v_suw_pr") && s(0,wfn-1) && Qf(2,wfn-1,"sz_iili pre_any") )
 { l[i]=omo2; Z[40]++; if(dbg){print "Z40"}; continue };
 if ( w(-2,"в во на") &&
     wa(-1,"_lock_v_suw_pr") && s(-2,-1) )
 { l[i]=omo2; Z[41]++; if(dbg){print "Z41"}; continue };
 if ( w(-3,"в во на") &&
      q(-2,"prl_pr prq_pr") &&
     wa(-1,"_lock_v_suw_pr") && s(-3,-1) && sv(-1,"\\(") )
 { l[i]=omo2; Z[42]++; if(dbg){print "Z42"}; continue };
 # _lock_v_suw_pr:end

 # _castle_na_suw_pr:start
 # + _gl_4_castle_na_suw_pr
 if ( w(1,"на") &&
    wfa(2,4,"_castle_na_suw_pr") && s(0,wfn-1) )
 { l[i]=omo1; Z[43]++; if(dbg){print "Z43"}; continue };
 if ( w(-2,"на") && se(-1," — ") &&
     wa(-1,"_castle_na_suw_pr") && s(-2) )
 { l[i]=omo1; Z[44]++; if(dbg){print "Z44"}; continue };
 if ( w(-3,"на") &&
     wa(-2,"_castle_na_suw_pr") &&
      q(-1,"suw_ro isname") && s(-3,-1) )
 { l[i]=omo1; Z[45]++; if(dbg){print "Z45"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_ro isname") &&
      q(-1,"prl_vi mest_vi mest_3e") && s(-4,-1) )
 { l[i]=omo1; Z[46]++; if(dbg){print "Z46"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_ro isname") &&
      q(-2,"prl_vi mest_vi mest_3e") &&
      q(-1,"prl_vi mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[47]++; if(dbg){print "Z47"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
      q(-4,"suw_ro isname") &&
      q(-3,"nar_vrem nar_mest qast mest_3e") &&
      q(-2,"prl_vi mest_vi mest_3e") &&
      q(-1,"prl_vi mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[48]++; if(dbg){print "Z48"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_ro isname") &&
      q(-2,"isname") &&
      q(-1,"prl_vi mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[49]++; if(dbg){print "Z49"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_ro isname") &&
      q(-1,"mest_im") && s(-4,-1) )
 { l[i]=omo1; Z[50]++; if(dbg){print "Z50"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_ro isname") &&
      q(-2,"qast") &&
      q(-1,"mest_im") && s(-5,-1) )
 { l[i]=omo1; Z[51]++; if(dbg){print "Z51"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"prl_ro prq_ro mest_ro mest_3e") &&
      q(-1,"suw_ro isname") && s(-4,-1) )
 { l[i]=omo1; Z[52]++; if(dbg){print "Z52"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"prl_ro prq_ro mest_ro mest_3e") &&
      q(-2,"suw_ro isname") &&
      q(-1,"prl_vi mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[53]++; if(dbg){print "Z53"}; continue };
 if ( w(-3,"на") && se(-1," — ") &&
     wa(-2,"_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-3) )
 { l[i]=omo1; Z[54]++; if(dbg){print "Z54"}; continue };
 if ( w(-2,"на") &&
     wa(-1,"_castle_na_suw_pr") && s(-2,-1) )
 { l[i]=omo1; Z[55]++; if(dbg){print "Z55"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"nar_step qast") &&
      q(-2,"qast") &&
      w(-1,"не") && s(-5,-1) )
 { l[i]=omo1; Z[56]++; if(dbg){print "Z56"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"qast") &&
      q(-1,"nar_vrem qast") && s(-4,-1) )
 { l[i]=omo1; Z[57]++; if(dbg){print "Z57"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
   basa(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"qast") &&
      q(-1,"nar_vrem qast") && s(-5,-1) )
 { l[i]=omo1; Z[58]++; if(dbg){print "Z58"}; continue };
 if ( w(-3,"на") &&
      q(-2,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-1,"_castle_na_suw_pr") && s(-3,-1) )
 { l[i]=omo1; Z[59]++; if(dbg){print "Z59"}; continue };
 if ( w(-4,"на") &&
      q(-3,"prl_pr prq_pr mest_pr mest_3e") &&
      q(-2,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-1,"_castle_na_suw_pr") && s(-4,-1) )
 { l[i]=omo1; Z[60]++; if(dbg){print "Z60"}; continue };
 if ( w(-3,"на") &&
     wa(-2,"_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-3,-1) )
 { l[i]=omo1; Z[61]++; if(dbg){print "Z61"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-4,-1) )
 { l[i]=omo1; Z[62]++; if(dbg){print "Z62"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") &&
      q(-1,"qast") && s(-4,-1) )
 { l[i]=omo1; Z[63]++; if(dbg){print "Z63"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
      q(-4,"nar_step") &&
      q(-3,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") &&
sz_iili(-2) &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[64]++; if(dbg){print "Z64"}; continue };
 if ( w(-4,"на") &&
      q(-3,"prl_pr prq_pr mest_pr") &&
     wa(-2,"_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-4,-1) )
 { l[i]=omo1; Z[65]++; if(dbg){print "Z65"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"prq_edmuim prq_mnim") &&
      q(-1,"suw_tv") && s(-5,-1) )
 { l[i]=omo1; Z[66]++; if(dbg){print "Z66"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"prq_edmuim prq_mnim") &&
      q(-2,"suw_tv") &&
      q(-1,"suw_ro") && s(-6,-1) )
 { l[i]=omo1; Z[67]++; if(dbg){print "Z67"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[68]++; if(dbg){print "Z68"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr") &&
     wa(-4,"_castle_na_suw_pr") &&
   base(-3,"быть") &&
      q(-2,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[69]++; if(dbg){print "Z69"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
   basa(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"prl_kred_sr nar_mest") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[70]++; if(dbg){print "Z70"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
   basa(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-4,-1) )
 { l[i]=omo1; Z[71]++; if(dbg){print "Z71"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
   basa(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[72]++; if(dbg){print "Z72"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_ro mest_ro mest_3e isname") &&
   basa(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e nar_vrem") && s(-5,-1) )
 { l[i]=omo1; Z[73]++; if(dbg){print "Z73"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_ro mest_ro mest_3e isname") &&
   basa(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[74]++; if(dbg){print "Z74"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_ro mest_ro mest_3e isname nar_vrem nar_mest") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-4,-1) )
 { l[i]=omo1; Z[75]++; if(dbg){print "Z75"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"prl_ro prq_ro mest_ro mest_3e") &&
      q(-2,"suw_ro mest_ro mest_3e isname nar_vrem nar_mest") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[76]++; if(dbg){print "Z76"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_ro mest_ro mest_3e isname nar_vrem nar_mest") &&
      q(-2,"qast") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[77]++; if(dbg){print "Z77"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_ro mest_ro mest_3e isname nar_vrem nar_mest") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[78]++; if(dbg){print "Z78"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_im mest_im mest_3e isname") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[79]++; if(dbg){print "Z79"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_ro mest_ro mest_3e isname") &&
      q(-2,"mod_bz mod_ed mod_mn") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-6,-1) )
 { l[i]=omo1; Z[80]++; if(dbg){print "Z80"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_ro mest_ro mest_3e isname") &&
      q(-2,"prl_kred_sr") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[81]++; if(dbg){print "Z81"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
 pre_tv(-4) &&
      q(-3,"prl_tv prq_tv mest_tv mest_3e") &&
      q(-2,"suw_tv") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-6,-1) )
 { l[i]=omo1; Z[82]++; if(dbg){print "Z82"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
 pre_tv(-2) &&
      q(-1,"suw_tv isname") && s(-4,-1) )
 { l[i]=omo1; Z[83]++; if(dbg){print "Z83"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
 pre_tv(-3) &&
      q(-2,"suw_tv isname") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[84]++; if(dbg){print "Z84"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
 pre_ro(-4) &&
      q(-3,"suw_ro") &&
   basa(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[85]++; if(dbg){print "Z85"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
 pre_ro(-2) &&
      q(-1,"suw_ro mest_ro") && s(-4,-1) )
 { l[i]=omo1; Z[86]++; if(dbg){print "Z86"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
 pre_ro(-3) &&
      q(-2,"suw_ro mest_ro") &&
   base(-1,"быть") && s(-5,-1) )
 { l[i]=omo1; Z[87]++; if(dbg){print "Z87"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
 pre_ro(-4) &&
      q(-3,"suw_ro mest_ro") &&
      q(-2,"nar_spos") &&
   base(-1,"быть") && s(-6,-1) )
 { l[i]=omo1; Z[88]++; if(dbg){print "Z88"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"prl_kred_mu prl_krmn") &&
      q(-1,"prl_edmuvi prl_mnvi") && s(-4,-1) )
 { l[i]=omo1; Z[89]++; if(dbg){print "Z89"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"prl_kred_mu prl_krmn") &&
      q(-2,"prl_edmuvi prl_mnvi") &&
      q(-1,"qast") && s(-5,-1) )
 { l[i]=omo1; Z[90]++; if(dbg){print "Z90"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
      q(-4,"nar_step prl_kred_sr") &&
      q(-3,"prl_kred_mu prl_krmn") &&
      q(-2,"prl_edmuvi prl_mnvi") &&
      q(-1,"qast") && s(-6,-1) )
 { l[i]=omo1; Z[91]++; if(dbg){print "Z91"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-3,"_castle_na_suw_pr") &&
   basa(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[92]++; if(dbg){print "Z92"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw_pr") &&
   basa(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"prl_ro prq_ro") &&
      q(-1,"suw_ro") && s(-6,-1) )
 { l[i]=omo1; Z[93]++; if(dbg){print "Z93"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
   basa(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"prl_ro prq_ro") &&
      q(-1,"suw_ro") && s(-5,-1) )
 { l[i]=omo1; Z[94]++; if(dbg){print "Z94"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"nar_vrem qast") &&
   basa(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[95]++; if(dbg){print "Z95"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw_pr") &&
   basa(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"qast") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[96]++; if(dbg){print "Z96"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw_pr") &&
   basa(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"nar_vrem nar_step nar_spos") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[97]++; if(dbg){print "Z97"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw_pr") &&
sz_iili(-3) &&
   basa(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[98]++; if(dbg){print "Z98"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-3,"_castle_na_suw_pr") &&
   basa(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[99]++; if(dbg){print "Z99"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e") &&
      q(-3,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-2,"_castle_na_suw_pr") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[100]++; if(dbg){print "Z100"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e") &&
      q(-3,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-2,"_castle_na_suw_pr") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-6,-1) )
 { l[i]=omo1; Z[101]++; if(dbg){print "Z101"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"isname") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-4,-1) )
 { l[i]=omo1; Z[102]++; if(dbg){print "Z102"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"nar_vrem") &&
   basa(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[103]++; if(dbg){print "Z103"}; continue };
 if ( w(-3,"на") &&
     wa(-2,"_castle_na_suw_pr") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-3,-1) )
 { l[i]=omo1; Z[104]++; if(dbg){print "Z104"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
 pre_da(-3) &&
      q(-2,"suw_da") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[105]++; if(dbg){print "Z105"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_da mest_da") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-4,-1) )
 { l[i]=omo1; Z[106]++; if(dbg){print "Z106"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_da mest_da suw_ro mest_ro") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[107]++; if(dbg){print "Z107"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_ro mest_ro") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-6,-1) )
 { l[i]=omo1; Z[108]++; if(dbg){print "Z108"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_da mest_da nar_step") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[109]++; if(dbg){print "Z109"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"mest_ro prl_ro mod_bz mod_ed mod_mn") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-4,-1) )
 { l[i]=omo1; Z[110]++; if(dbg){print "Z110"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"mod_bz mod_ed mod_mn") &&
   basa(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuvi prl_mnvi mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[111]++; if(dbg){print "Z111"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"isname") &&
      q(-2,"mest_ro prl_ro mod_any") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[112]++; if(dbg){print "Z112"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
      q(-4,"isname") &&
      q(-3,"mest_ro prl_ro mod_any") &&
   basa(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuvi prl_mnvi mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[113]++; if(dbg){print "Z113"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"mest_ro prl_ro mod_bz") &&
      q(-2,"mod_any") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[114]++; if(dbg){print "Z114"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"mest_ro prl_ro mod_bz") &&
      q(-2,"mod_any") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-6,-1) )
 { l[i]=omo1; Z[115]++; if(dbg){print "Z115"}; continue };
 if ( w(-4,"на") &&
      q(-3,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-2,"_castle_na_suw_pr") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-4,-1) )
 { l[i]=omo1; Z[116]++; if(dbg){print "Z116"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"qast") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[117]++; if(dbg){print "Z117"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"nar_kaq nar_vrem prl_kred_sr") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[118]++; if(dbg){print "Z118"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr") &&
     wa(-3,"_castle_na_suw_pr") &&
   basa(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[119]++; if(dbg){print "Z119"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr") &&
     wa(-4,"_castle_na_suw_pr") &&
   basa(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"suw_tv") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[120]++; if(dbg){print "Z120"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr") &&
     wa(-3,"_castle_na_suw_pr") &&
   basa(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[121]++; if(dbg){print "Z121"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_ro isname") &&
      q(-2,"suw_im mest_im isname") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[122]++; if(dbg){print "Z122"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_im mest_im isname") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-4,-1) )
 { l[i]=omo1; Z[123]++; if(dbg){print "Z123"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_im mest_im isname") &&
   basa(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_vi prq_vi mest_da mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[124]++; if(dbg){print "Z124"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
      q(-4,"suw_im mest_im isname") &&
   basa(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"suw_da mest_da isname mest_3e") &&
      q(-1,"prl_vi prq_vi") && s(-6,-1) )
 { l[i]=omo1; Z[125]++; if(dbg){print "Z125"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
      q(-4,"suw_im mest_im isname") &&
   basa(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"qast") &&
      q(-1,"nar_step nar_vrem") && s(-6,-1) )
 { l[i]=omo1; Z[126]++; if(dbg){print "Z126"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
      q(-4,"suw_ro isname") &&
      q(-3,"suw_im mest_im isname") &&
   basa(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[127]++; if(dbg){print "Z127"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_im mest_im isname") &&
   basa(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"suw_im mest_im isname") && s(-6,-1) )
 { l[i]=omo1; Z[128]++; if(dbg){print "Z128"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_ro isname") &&
   basa(-1,"_gl_4_castle_na_suw_pr") && s(-4,-1) )
 { l[i]=omo1; Z[129]++; if(dbg){print "Z129"}; continue };
 # _castle_na_suw_pr:end

 # _castle_pre_tv_suw_tv:start
 if ( pre_tv(1) &&
         wfa(2,4,"_castle_pre_tv_suw_tv") && s(0,wfn-1) )
 { l[i]=omo1; Z[130]++; if(dbg){print "Z130"}; continue };
 if ( qb(-6,-1,"pre_tv") &&
     wba(wbn+1,-1,"_castle_pre_tv_suw_tv") && s(wbn,-1) && s(0,qbn-1) )
 { l[i]=omo1; Z[131]++; if(dbg){print "Z131"}; continue };
 # _castle_pre_tv_suw_tv:end

 # _castle_pre_ro_suw_ro:start
 if ( w(1,"у возле посреди") &&
    wfa(2,4,"_castle_pre_ro_suw_ro") && s(0,wfn-1) )
 { l[i]=omo1; Z[132]++; if(dbg){print "Z132"}; continue };
 if ( wb(-6,-2,"у возле посреди") && s(wbn,-1) && Qb(wbn+1,-1,"pre_any sz_iili") &&
     wba(wbn+1,-1,"_castle_pre_ro_suw_ro") && !(bf(1,5,"повесить") && s(0,bfn-1)) )
 { l[i]=omo1; Z[133]++; if(dbg){print "Z133"}; continue };
 # _castle_pre_ro_suw_ro:start

 # _castle_k_suw_da:start
 if ( w(1,"к") &&
     wa(2,"_castle_k_suw_da") && s(0,1) )
 { l[i]=omo1; Z[134]++; if(dbg){print "Z134"}; continue };
 if ( wb(-6,-1,"к") &&
     wba(wbn+1,-1,"_castle_k_suw_da") && s(wbn,-1) )
 { l[i]=omo1; Z[135]++; if(dbg){print "Z135"}; continue };
 # _castle_k_suw_da:end

 # _lock_mexdu_suw_tv:start
 if ( w(1,"между") &&
    wfa(2,4,"_lock_mexdu_suw_tv") && s(0,wfn-1) )
 { l[i]=omo2; Z[136]++; if(dbg){print "Z136"}; continue };
 # _lock_mexdu_suw_tv:end

 if ( w(1,"веками вдали издали вдалеке") && s(0) )
 { l[i]=omo1; Z[137]++; if(dbg){print "Z137"}; continue };


 cst="засов";
 if ( base(1,"венчать") && (s(0)||sc(0,",")) &&
        bf(2,5,cst) && s(1,bfn-1) && Qf(2,bfn-1,"sz_iili pre_any") )
 { l[i]=omo2; Z[138]++; if(dbg){print "Z138"}; continue };

 cst="подвала";
 cst1="крыши";
 if ( qxs(1,"с со",cst,"до",cst1) )
 { l[i]=omo1; Z[139]++; if(dbg){print "Z139"}; continue };

 # _castle_s_suw:start
 if ( w(1,"с со") &&
    bfa(2,5,"_castle_s_suw") && s(0,bfn-1) && Qf(2,bfn-1,"sz_iili pre_any") )
 { l[i]=omo1; Z[140]++; if(dbg){print "Z140"}; continue };
 # _castle_s_suw:start

 # _castle_iz_suw_ro:start
 if ( w(1,"из") &&
    wfa(2,5,"_castle_iz_suw_ro") && s(0,wfn-1) && Qf(2,wfn-1,"sz_iili pre_any") )
 { l[i]=omo1; Z[141]++; if(dbg){print "Z141"}; continue };
 if ( w(-3,"из") &&
      q(-2,"prl_edro prq_edro") &&
     wa(-1,"_castle_iz_suw_ro") && s(-3,-1) )
 { l[i]=omo1; Z[142]++; if(dbg){print "Z142"}; continue };
 cst1="возвести возводить выкладывать выложить выстроить построить сложить";
 if ( (sc(0,",")||s(0)) &&
     base(1,cst1) &&
        w(2,"из") &&
      wfa(3,6,"_castle_iz_suw_ro") && s(1,wfn-1) && Qf(3,wfn-1,"sz_iili pre_any") )
 { l[i]=omo1; Z[143]++; if(dbg){print "Z143"}; continue };
 if ( wb(-5,-1,"из") && s(wbn,-1) && Qb(wbn+1,-1,"sz_iili pre_any") &&
    base(wbn-1,cst1) &&
     wba(wbn+1,-1,"_castle_iz_suw_ro") )
 { l[i]=omo1; Z[144]++; if(dbg){print "Z144"}; continue };
 # _castle_iz_suw_ro:end

 cst="ног пальцев рук";
 if ( w(1,"из") &&
     wf(2,5,cst) && s(0,wfn-1) && Qf(2,wfn-1,"sz_iili pre_any") )
 { l[i]=omo2; Z[145]++; if(dbg){print "Z145"}; continue };


 # _lock_s_suw_rotv:start
 if ( w(1,"с со") &&
    wfa(2,5,"_lock_s_suw_rotv") && s(0,wfn-1) && Qf(2,wfn-1,"sz_iili pre_any") && W_w(wfn+1,"до по") )
 { l[i]=omo2; Z[146]++; if(dbg){print "Z146"}; continue };
 if ( w(-2,"с со") &&
     wa(-1,"_lock_s_suw_rotv") && s(-2,-1) )
 { l[i]=omo2; Z[147]++; if(dbg){print "Z147"}; continue };
 if ( sc(0,",") &&
    basa(1,"_lock_s_suw_rotv") &&
    base(2,"который") && s(1) )
 { l[i]=omo1; Z[148]++; if(dbg){print "Z148"}; continue };

 # _lock_s_suw_rotv:end

 # _lock_s_suw:start
 if ( w(1,"с со") &&
    bfa(2,5,"_lock_s_suw") && s(0,bfn-1) && Qf(2,bfn-1,"sz_iili pre_any") )
 { l[i]=omo2; Z[149]++; if(dbg){print "Z149"}; continue };
 if ( w(-2,"с со") &&
   basa(-1,"_lock_s_suw") && s(-2,-1) )
 { l[i]=omo2; Z[150]++; if(dbg){print "Z150"}; continue };
 # _lock_s_suw:end

 if ( sc(0,"[XIV]+") &&
       w(1,"века веков") && s(0) )
 { l[i]=omo1; Z[151]++; if(dbg){print "Z151"}; continue };

 # _locklike_list:start
 if ( q(1,"sz_iili") &&
   basa(2,"_locklike_list") && s(0,1) )
 { l[i]=omo2; Z[152]++; if(dbg){print "Z152"}; continue };
 if ( q(-1,"sz_iili") &&
   basa(-2,"_locklike_list") && s(-2,-1) )
 { l[i]=omo2; Z[153]++; if(dbg){print "Z153"}; continue };
 if ( sc(-1,",") && basa(-1,"_locklike_list") && !(isname(1) && base(1,"люк")) )
 { l[i]=omo2; Z[154]++; if(dbg){print "Z154"}; continue };
 if ( sc(0,",") && basa(1,"_locklike_list") && !(isname(1) && base(1,"люк")) )
 { l[i]=omo2; Z[155]++; if(dbg){print "Z155"}; continue };
 # _locklike_list:end

 cst1="создавать создать сплести сплетать";
 cst2="ног пальцев рук";
 if ( base(-3,cst1) &&
    pre_ro(-2) &&
         w(-1,cst2) && s(-3,-1) )
 { l[i]=omo2; Z[156]++; if(dbg){print "Z156"}; continue };
 if ( base(-4,cst1) &&
    pre_ro(-3) &&
         q(-2,"prl_ro prq_ro mest_ro mest_3e") &&
         w(-1,cst2) && s(-4,-1) )
 { l[i]=omo2; Z[157]++; if(dbg){print "Z157"}; continue };


 ### замок замки им.п. вин.п.
 if(iwrd=="замок" || iwrd=="замки") {

    cst1="быть стать";
    cst8="сложен";
    if ( base(1,cst1) &&
           wf(2,5,cst8) &&
            w(wfn+1,"в из по") && s(0,wfn) && Qf(2,wfn-1,"pre_any sz_iili") )
    { l[i]=omo1; Z[158]++; if(dbg){print "Z158"}; continue };
    if ( base(-2,cst1) &&
            w(-1,cst8) && s(-2,-1) )
    { l[i]=omo1; Z[159]++; if(dbg){print "Z159"}; continue };

    # _castle_prl:start
    cst1="быть ведь же казаться стать считаться являться";
    if ( q(-1,"prl_im prl_kred_mu") && basa(-1,"_castle_prl") && s(-1) )
    { l[i]=omo1; Z[160]++; if(dbg){print "Z160"}; continue };
    if ( q(-2,"prl_im prl_kred_mu") && basa(-2,"_castle_prl") &&
         q(-1,"prl_any prq_any mest_any qast") && s(-2,-1) )
    { l[i]=omo1; Z[161]++; if(dbg){print "Z161"}; continue };
    if ( q(-3,"prl_im prl_kred_mu") && basa(-3,"_castle_prl") &&
         q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
         q(-1,"prl_any prq_any mest_any qast") && s(-3,-1) )
    { l[i]=omo1; Z[162]++; if(dbg){print "Z162"}; continue };
    if ( q(1,"prl_im prl_kred_mu") && basa(1,"_castle_prl") && s(0) )
    { l[i]=omo1; Z[163]++; if(dbg){print "Z163"}; continue };
    if ( base(1,cst1) &&
          bfa(2,5,"_castle_prl") && q(bfn,"prl_im prl_tv prl_kred_mu") && s(0,bfn-1) && Qf(2,bfn-1,"pre_any sz_iili")  )
    { l[i]=omo1; Z[164]++; if(dbg){print "Z164"}; continue };
    # _castle_prl:start

    # _lock_prl:start
    if ( q(-1,"prl_im prl_kred_mu") && basa(-1,"_lock_prl") && s(-1) )
    { l[i]=omo2; Z[165]++; if(dbg){print "Z165"}; continue };
    if ( q(-2,"prl_im prl_kred_mu") && basa(-2,"_lock_prl") &&
         Q(-1,"suw_any sz_iili") && s(-2,-1) )
    { l[i]=omo2; Z[166]++; if(dbg){print "Z166"}; continue };
    if ( q(-3,"prl_im prl_kred_mu") && basa(-3,"_lock_prl") &&
         q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
         q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo2; Z[167]++; if(dbg){print "Z167"}; continue };
    if ( q(1,"prl_im prl_kred_mu") && basa(1,"_lock_prl") && s(0) && !(isname(1)) )
    { l[i]=omo2; Z[168]++; if(dbg){print "Z168"}; continue };
    if ( base(1,cst1) &&
            q(2,"prl_im prl_tv prl_kred_mu") && basa(2,"_lock_prl") && s(0,1) )
    { l[i]=omo2; Z[169]++; if(dbg){print "Z169"}; continue };
    # _lock_prl:end

    if ( w(-1,"весь") && s(-1) )
    { l[i]=omo1; Z[170]++; if(dbg){print "Z170"}; continue };
    if ( w(1,"весь") && s(0) )
    { l[i]=omo1; Z[171]++; if(dbg){print "Z171"}; continue };

    cst="закрывать закрыть";
    if ( w(1,"для") &&
         q(2,"mest_ro suw_ro") &&
        bf(3,5,cst) && s(0,bfn-1) )
    { l[i]=omo1; Z[172]++; if(dbg){print "Z172"}; continue };
    if ( bf(1,3,cst) &&
          w(bfn+1,"для") && s(0,bfn) )
    { l[i]=omo1; Z[173]++; if(dbg){print "Z173"}; continue };

    cst="быть стать явиться являться";
    if ( bf(1,3,cst) &&
          q(bfn+1,"suw_tv") &&
          w(bfn+2,"для к") && s(0,bfn+1) )
    { l[i]=omo1; Z[174]++; if(dbg){print "Z174"}; continue };

  # в замок
  if ( wb(-3,-1,"в во") && s(wbn,-1) ) {

    if ( qxs(-1,"ни не","в") && sc(0,",") &&
        (qxw(1,"а но ни не","в")||
         qxw(1,"а но","не","в")) &&
        basa(xwn+1,"_castle_environs") && s(xwn) )
    { l[i]=omo1; Z[175]++; if(dbg){print "Z175"}; continue };
    if ( qxw(-4,"ни не","в") &&
        basa(-3,"_castle_environs") && sc(-3,",") &&
         qxs(-1,"а но ни не","в") )
    { l[i]=omo1; Z[176]++; if(dbg){print "Z176"}; continue };

    cst1="брать взять свести сводить собрать";
    cst2="голень голова колено ладонь ладошка лодыжка локоть ляжка нога ножка палец пальчик плечо поясница рука ручка стопа талия туловище шея";
    if ( bb(-5,-3,cst2) && s(bbn,-3) &&
       base(-2,cst1) &&
          w(-1,"в") && s(-2,-1) )
    { l[i]=omo2; Z[177]++; if(dbg){print "Z177"}; continue };
    if ( base(-3,cst1) &&
         base(-2,cst2) &&
            w(-1,"в") && s(-3,-1) )
    { l[i]=omo2; Z[178]++; if(dbg){print "Z178"}; continue };
    if ( base(-4,cst1) &&
            q(-3,"prl_vi mest_vi mest_3e") &&
         base(-2,cst2) &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo2; Z[179]++; if(dbg){print "Z179"}; continue };
    if ( base(-2,cst1) &&
            w(-1,"в") &&
           bf(1,3,cst2) && s(-2,bfn-1) )
    { l[i]=omo2; Z[180]++; if(dbg){print "Z180"}; continue };

    cst="запихать запихнуть засунуть сунуть";
    if ( bb(-5,-2,cst) && s(bbn,1) &&
          w(-1,"в") &&
          w(1,"к") &&
          q(2,"suw_odedda suw_odmnda isname") )
    { l[i]=omo1; Z[181]++; if(dbg){print "Z181"}; continue };
    if ( base(-2,cst1) &&
            w(-1,"в") &&
           bf(1,3,cst2) && s(-2,bfn-1) )
    { l[i]=omo2; Z[182]++; if(dbg){print "Z182"}; continue };

    cst3="армия";
    if ( bb(-5,-2,cst) &&
          w(bbn+1,"в") &&
       base(bbn-1,cst3) && s(bbn-1,-1) )
    { l[i]=omo1; Z[183]++; if(dbg){print "Z183"}; continue };

    cst1="вкладывать вложить";
    cst2="деньги золото магия работа серебро сила средство труд усилие";
    if ( bb(-6,-3,cst2) && s(bbn,-1) &&
       base(-2,cst1) &&
          w(-1,"в") )
    { l[i]=omo1; Z[184]++; if(dbg){print "Z184"}; continue };
    if ( bb(-7,-4,cst2) && s(bbn,-1) &&
       base(-3,cst1) &&
          w(-2,"в во") &&
          q(-1,"prl_vi prq_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[185]++; if(dbg){print "Z185"}; continue };
    if ( base(-4,cst2) && sc(-4,",") &&
         base(-3,cst1) &&
            w(-2,"в во") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[186]++; if(dbg){print "Z186"}; continue };

    # _suw_v_castle:start
    if ( basa(-2,"_suw_v_castle") &&
            w(-1,"в") && s(-2,-1) )
    { l[i]=omo1; Z[187]++; if(dbg){print "Z187"}; continue };
    if ( basa(-3,"_suw_v_castle") &&
            q(-2,"suw_ro mest_ro mest_3e qast nar_napr isname") &&
            w(-1,"в") && s(-3,-1) )
    { l[i]=omo1; Z[188]++; if(dbg){print "Z188"}; continue };
    if ( basa(-4,"_suw_v_castle") &&
            q(-3,"prl_ro prq_ro mest_ro mest_3e") &&
            q(-2,"suw_ro mest_ro mest_3e qast") &&
            w(-1,"в") && s(-3,-1) )
    { l[i]=omo1; Z[189]++; if(dbg){print "Z189"}; continue };
    if ( basa(-5,"_suw_v_castle") &&
            q(-4,"pre_ro") &&
            q(-3,"suw_ro") &&
            q(-2,"suw_ro") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo1; Z[190]++; if(dbg){print "Z190"}; continue };
    if ( basa(-3,"_suw_v_castle") &&
            w(-2,"в во") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[191]++; if(dbg){print "Z191"}; continue };
    # _suw_v_castle:end

    cst="айда бегом брысь верхом домой надо надолго нужно пешком ползком пора сюда";
    if ( w(-2,cst) &&
         w(-1,"в") && s(-2,-1) )
    { l[i]=omo1; Z[192]++; if(dbg){print "Z192"}; continue };
    if ( w(-1,"в") &&
         w(1,cst) && s(-1,0) )
    { l[i]=omo1; Z[193]++; if(dbg){print "Z193"}; continue };

    cst="скользнуть";
    cst1="змеем змейкой";
    cst2="первый";
    if ( w(-3,cst1) &&
      base(-2,cst) &&
         w(-1,"в") && s(-3,-1) )
    { l[i]=omo1; Z[194]++; if(dbg){print "Z194"}; continue };
    if ( base(-3,cst2) &&
         base(-2,cst) &&
            w(-1,"в") && s(-3,-1) )
    { l[i]=omo1; Z[195]++; if(dbg){print "Z195"}; continue };
    if ( qb(-8,-4,"gl_ed gl_mn") &&
    sz_iili(-3) &&
       base(-2,cst) &&
          w(-1,"в") && s(qbn,-1) )
    { l[i]=omo1; Z[196]++; if(dbg){print "Z196"}; continue };

    # _gl_v_lock_main:start
    if ( basa(-2,"_gl_v_lock_main") &&
            w(-1,"в") && s(-2,-1) )
    { l[i]=omo2; Z[197]++; if(dbg){print "Z197"}; continue };
    if ( basa(-3,"_gl_v_lock_main") &&
            w(-2,"в во") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo2; Z[198]++; if(dbg){print "Z198"}; continue };
    if ( basa(-4,"_gl_v_lock_main") &&
            w(-3,"в во") &&
            q(-2,"prl_vi prq_vi mest_vi mest_3e") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-4,-1) )
    { l[i]=omo2; Z[199]++; if(dbg){print "Z199"}; continue };
    if ( basa(-4,"_gl_v_lock_main") &&
            q(-3,"suw_vi") &&
            q(-2,"suw_ro mest_vi mest_3e") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo2; Z[200]++; if(dbg){print "Z200"}; continue };
    if ( basa(-5,"_gl_v_lock_main") &&
            q(-4,"suw_vi") &&
            q(-3,"prl_ro prq_ro mest_ro mest_3e qis_ro qik_ro isname") &&
            q(-2,"suw_ro mest_vi mest_3e") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo2; Z[201]++; if(dbg){print "Z201"}; continue };
    if ( basa(-5,"_gl_v_lock_main") &&
            q(-4,"prl_vi prq_vi mest_vi mest_3e prl_kred_sr nar_step isname") &&
            q(-3,"prl_vi prq_vi mest_vi mest_3e isname") &&
            q(-2,"suw_vi") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo2; Z[202]++; if(dbg){print "Z202"}; continue };
    if ( basa(-5,"_gl_v_lock_main") &&
            q(-4,"prl_vi prq_vi mest_vi mest_3e prl_kred_sr nar_step isname") &&
            q(-3,"suw_vi") &&
            q(-2,"suw_ro") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo2; Z[203]++; if(dbg){print "Z203"}; continue };
    if ( basa(-4,"_gl_v_lock_main") &&
            q(-3,"prl_vi prq_vi mest_vi mest_3e qast prl_tv prq_tv mest_tv qik_vi qik_tv qis_vi qis_tv") &&
            q(-2,"suw_vi suw_tv qast") &&
            w(-1,"в") && s(-4,-1) && Qf(-3,-2,"sz_iili pre_any"))
    { l[i]=omo2; Z[204]++; if(dbg){print "Z204"}; continue };
    if ( basa(-6,"_gl_v_lock_main") &&
            q(-5,"prl_vi prq_vi mest_vi mest_3e qast prl_tv prq_tv mest_tv qik_vi qik_tv qis_vi qis_tv") &&
            q(-4,"suw_vi suw_tv qast") &&
            q(-3,"prl_vi prq_vi mest_vi mest_3e qast prl_tv prq_tv mest_tv qik_vi qik_tv qis_vi qis_tv") &&
            q(-2,"suw_vi suw_tv qast") &&
            w(-1,"в") && s(-6,-1) && Qf(-5,-2,"sz_iili pre_any"))
    { l[i]=omo2; Z[205]++; if(dbg){print "Z205"}; continue };
    if ( basa(-5,"_gl_v_lock_main") &&
            q(-4,"suw_vi suw_im mest_im mest_vi suw_tv qast isname") &&
            q(-3,"suw_vi suw_tv") &&
            q(-2,"suw_ro") &&
            w(-1,"в") && s(-5,-1) && Qf(-4,-2,"sz_iili pre_any"))
    { l[i]=omo2; Z[206]++; if(dbg){print "Z206"}; continue };
    if ( basa(-4,"_gl_v_lock_main") &&
            q(-3,"suw_vi suw_im mest_im mest_vi suw_tv qast isname") &&
            q(-2,"suw_vi suw_tv qast nar_spos nar_mest") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo2; Z[207]++; if(dbg){print "Z207"}; continue };
    if ( basa(-5,"_gl_v_lock_main") &&
            q(-4,"prl_vi prq_vi mest_vi mest_3e qast prl_tv prq_tv mest_tv qik_vi qik_tv qis_vi qis_tv") &&
            q(-3,"suw_vi suw_tv qast") &&
            w(-2,"в во") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-5,-1) )
    { l[i]=omo2; Z[208]++; if(dbg){print "Z208"}; continue };
    if ( basa(-6,"_gl_v_lock_main") &&
            q(-5,"prl_vi prq_vi mest_vi mest_3e qast prl_tv prq_tv mest_tv qik_vi qik_tv qis_vi qis_tv") &&
            q(-4,"suw_vi suw_tv qast") &&
            w(-3,"в во") &&
            q(-2,"prl_vi prq_vi mest_vi mest_3e") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-6,-1) )
    { l[i]=omo2; Z[209]++; if(dbg){print "Z209"}; continue };
    if ( basa(-4,"_gl_v_lock_main") &&
            q(-3,"suw_vi mest_vi mest_3e") &&
            w(-2,"в во") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-4,-1) )
    { l[i]=omo2; Z[210]++; if(dbg){print "Z210"}; continue };
    if ( basa(-4,"_gl_v_lock_main") &&
            q(-3,"prl_srav prl_kred_sr nar_spos") &&
            q(-2,"suw_vi mest_vi suw_im mest_im mest_3e prl_kred_sr prl_srav isname nar_mest") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo2; Z[211]++; if(dbg){print "Z211"}; continue };
    if ( basa(-3,"_gl_v_lock_main") &&
            q(-2,"suw_vi mest_vi suw_im mest_im mest_3e prl_kred_sr prl_srav isname nar_mest qis_vi") &&
            w(-1,"в") && s(-3,-1) )
    { l[i]=omo2; Z[212]++; if(dbg){print "Z212"}; continue };
    if ( basa(-3,"_gl_v_lock_main") &&
            q(-2,"suw_tv mest_tv") &&
            w(-1,"в") && s(-3,-1) )
    { l[i]=omo2; Z[213]++; if(dbg){print "Z213"}; continue };
    if ( basa(-4,"_gl_v_lock_main") &&
       pre_tv(-3) &&
            q(-2,"suw_tv mest_tv") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo2; Z[214]++; if(dbg){print "Z214"}; continue };
    if ( basa(-5,"_gl_v_lock_main") &&
       pre_tv(-4) &&
            q(-3,"suw_tv mest_tv") &&
            q(-2,"suw_vi") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo2; Z[215]++; if(dbg){print "Z215"}; continue };
    if ( basa(-6,"_gl_v_lock_main") &&
       pre_tv(-5) &&
            q(-4,"prl_tv prq_tv mest_tv mest_3e") &&
            q(-3,"suw_tv mest_tv") &&
            q(-2,"suw_vi") &&
            w(-1,"в") && s(-6,-1) )
    { l[i]=omo2; Z[216]++; if(dbg){print "Z216"}; continue };
    if ( basa(-5,"_gl_v_lock_main") &&
            q(-4,"suw_vi mest_vi mest_3e prl_kred_sr") &&
       pre_tv(-3) &&
            q(-2,"suw_tv mest_tv") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo2; Z[217]++; if(dbg){print "Z217"}; continue };
    if ( basa(-6,"_gl_v_lock_main") &&
            q(-5,"suw_vi mest_vi mest_3e prl_kred_sr") &&
       pre_tv(-4) &&
            q(-3,"prl_tv prq_tv mest_tv mest_3e") &&
            q(-2,"suw_tv mest_tv") &&
            w(-1,"в") && s(-6,-1) )
    { l[i]=omo2; Z[218]++; if(dbg){print "Z218"}; continue };
    if ( basa(-5,"_gl_v_lock_main") &&
       pre_tv(-4) &&
            q(-3,"prl_tv prq_tv mest_tv mest_3e") &&
            q(-2,"suw_tv") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo2; Z[219]++; if(dbg){print "Z219"}; continue };
    if ( basa(-5,"_gl_v_lock_main") &&
       pre_ro(-4) &&
            q(-3,"suw_ro") &&
            q(-2,"suw_vi") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo2; Z[220]++; if(dbg){print "Z220"}; continue };
    if ( basa(-7,"_gl_v_lock_main") &&
            q(-6,"qast") &&
            q(-5,"prq_vi") &&
       pre_ro(-4) &&
            q(-3,"suw_ro") &&
            q(-2,"suw_vi") &&
            w(-1,"в") && s(-7,-1) )
    { l[i]=omo2; Z[221]++; if(dbg){print "Z221"}; continue };
    if ( basa(-8,"_gl_v_lock_main") &&
            q(-7,"qast") &&
            q(-6,"qast") &&
            q(-5,"prq_vi") &&
       pre_ro(-4) &&
            q(-3,"suw_ro") &&
            q(-2,"suw_vi") &&
            w(-1,"в") && s(-8,-1) )
    { l[i]=omo2; Z[222]++; if(dbg){print "Z222"}; continue };
    if ( basa(-5,"_gl_v_lock_main") &&
            q(-4,"suw_vi") &&
       pre_ro(-3) &&
            q(-2,"suw_ro") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo2; Z[223]++; if(dbg){print "Z223"}; continue };
    if ( basa(-6,"_gl_v_lock_main") &&
            q(-5,"prq_vi") &&
       pre_ro(-4) &&
            q(-3,"suw_ro") &&
            q(-2,"suw_vi") &&
            w(-1,"в") && s(-6,-1) )
    { l[i]=omo2; Z[224]++; if(dbg){print "Z224"}; continue };
    if ( basa(-7,"_gl_v_lock_main") &&
            q(-6,"suw_vi mest_vi mest_3e") &&
       pre_pr(-5) && s(-7,-5) &&
            q(-4,"suw_pr") && sc(-4,",") &&
           sz(-3) &&
            q(-2,"suw_vi mest_vi mest_3e") &&
            w(-1,"в") && s(-3,-1) )
    { l[i]=omo2; Z[225]++; if(dbg){print "Z225"}; continue };
    if ( basa(-7,"_gl_v_lock_main") &&
            q(-6,"suw_vi") &&
            q(-5,"prq_ro") &&
       pre_pr(-4) &&
            q(-3,"suw_pr") &&
            q(-2,"suw_ro") &&
            w(-1,"в") && s(-7,-1) )
    { l[i]=omo2; Z[226]++; if(dbg){print "Z226"}; continue };
    if ( basa(-5,"_gl_v_lock_main") &&
            q(-4,"suw_vi") &&
       pre_pr(-3) &&
            q(-2,"suw_pr") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo2; Z[227]++; if(dbg){print "Z227"}; continue };
    if ( basa(-6,"_gl_v_lock_main") &&
            q(-5,"suw_vi") &&
       pre_pr(-4) &&
            q(-3,"prl_pr prq_pr") &&
            q(-2,"suw_pr") &&
            w(-1,"в") && s(-6,-1) )
    { l[i]=omo2; Z[228]++; if(dbg){print "Z228"}; continue };
    if ( basa(-5,"_gl_v_lock_main") &&
       pre_pr(-4) &&
            q(-3,"suw_pr") &&
            q(-2,"suw_vi") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo2; Z[229]++; if(dbg){print "Z229"}; continue };
    if ( basa(-6,"_gl_v_lock_main") &&
       pre_pr(-5) &&
            q(-4,"suw_pr") &&
            q(-3,"suw_vi") &&
            q(-2,"suw_ro") &&
            w(-1,"в") && s(-6,-1) )
    { l[i]=omo2; Z[230]++; if(dbg){print "Z230"}; continue };
    if ( basa(-6,"_gl_v_lock_main") &&
       pre_pr(-5) &&
            q(-4,"suw_pr") &&
            q(-3,"prl_vi prq_vi mest_vi mest_3e") &&
            q(-2,"suw_vi") &&
            w(-1,"в") && s(-6,-1) )
    { l[i]=omo2; Z[231]++; if(dbg){print "Z231"}; continue };
    if ( basa(-7,"_gl_v_lock_main") &&
       pre_pr(-6) &&
            q(-5,"suw_pr") &&
            q(-4,"prl_vi prq_vi mest_vi mest_3e") &&
            q(-3,"prl_vi prq_vi mest_vi mest_3e") &&
            q(-2,"suw_vi") &&
            w(-1,"в") && s(-7,-1) )
    { l[i]=omo2; Z[232]++; if(dbg){print "Z232"}; continue };
    if ( basa(-6,"_gl_v_lock_main") &&
            q(-5,"prq_vi") &&
       pre_pr(-4) &&
            q(-3,"suw_pr") &&
            q(-2,"suw_vi") &&
            w(-1,"в") && s(-6,-1) )
    { l[i]=omo2; Z[233]++; if(dbg){print "Z233"}; continue };
    if ( basa(-5,"_gl_v_lock_main") &&
            q(-4,"prq_vi") &&
       pre_pr(-3) &&
            q(-2,"suw_pr") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo2; Z[234]++; if(dbg){print "Z234"}; continue };
    if ( basa(-4,"_gl_v_lock_main") &&
       pre_pr(-3) &&
            q(-2,"suw_pr") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo2; Z[235]++; if(dbg){print "Z235"}; continue };
    if ( w(-1,"в") &&
       bfa(1,3,"_gl_v_lock_main") && s(-1,bfn-1) && Qf(1,bfn,"sz_iili") )
    { l[i]=omo2; Z[236]++; if(dbg){print "Z236"}; continue };

    cst1="горло кисти кисть ладони ладонь ладошки ладошку лодыжки лодыжку ноги ногу ножки ножку палец пальцы руки руку талию шеи шею";
    if ( basa(-4,"_gl_v_lock_main") &&
       pre_vi(-3) &&
            w(-2,cst1) &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo2; Z[237]++; if(dbg){print "Z237"}; continue };
    # _gl_v_lock_main:end


    # _v_zamok:start
    if ( basa(-3,"_v_zamok") &&
           (w(-2,cst1)||isname(-2)) &&
            w(-1,"в") && s(-3,-1) )
    { l[i]=omo2; Z[238]++; if(dbg){print "Z238"}; continue };
    if ( basa(-4,"_v_zamok") &&
            q(-3,"nar_mest") &&
            w(-2,cst1) &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo2; Z[239]++; if(dbg){print "Z239"}; continue };
    if ( basa(-4,"_v_zamok") &&
            w(-3,cst1) &&
            q(-2,"suw_ro") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo2; Z[240]++; if(dbg){print "Z240"}; continue };
    if ( basa(-5,"_v_zamok") &&
            w(-4,cst1) &&
       pre_ro(-3) &&
            q(-2,"suw_ro") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo2; Z[241]++; if(dbg){print "Z241"}; continue };
    if ( basa(-4,"_v_zamok") &&
            q(-3,"prl_vi prq_vi mest_vi mest_3e") &&
            w(-2,cst1) &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo2; Z[242]++; if(dbg){print "Z242"}; continue };
    if ( basa(-4,"_v_zamok") &&
            w(-3,cst1) &&
            w(-2,"в во") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-4,-1) )
    { l[i]=omo2; Z[243]++; if(dbg){print "Z243"}; continue };
    if ( basa(-5,"_v_zamok") &&
            w(-4,cst1) &&
            w(-3,"в во") &&
            q(-2,"prl_vi prq_vi mest_vi mest_3e") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-5,-1) )
    { l[i]=omo2; Z[244]++; if(dbg){print "Z244"}; continue };
    if ( basa(-5,"_v_zamok") &&
            q(-4,"prl_vi prq_vi mest_vi mest_3e") &&
            w(-3,cst1) &&
            w(-2,"в во") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-5,-1) )
    { l[i]=omo2; Z[245]++; if(dbg){print "Z245"}; continue };
    if ( base(-5,cst1) &&
         basa(-4,"_v_zamok") &&
       pre_tv(-3) &&
            q(-2,"suw_tv mest_tv") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo2; Z[246]++; if(dbg){print "Z246"}; continue };
    if ( basa(-5,"_v_zamok") &&
            w(-4,cst1) &&
       pre_tv(-3) &&
            q(-2,"suw_tv mest_tv") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo2; Z[247]++; if(dbg){print "Z247"}; continue };
    if ( basa(-5,"_v_zamok") &&
            w(-4,cst1) &&
       pre_pr(-3) &&
            q(-2,"suw_pr mest_pr") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo2; Z[248]++; if(dbg){print "Z248"}; continue };
    if ( basa(-5,"_v_zamok") &&
            q(-4,"suw_vi mest_vi isname") &&
       pre_vi(-3) &&
            w(-2,cst1) &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo2; Z[249]++; if(dbg){print "Z249"}; continue };
    if ( w(-1,"в") &&
      base(1,cst1) &&
         q(2,"nar_kaq") &&
      basa(3,"_v_zamok") && s(-1,2) )
    { l[i]=omo2; Z[250]++; if(dbg){print "Z250"}; continue };

    cst2="хватом";
    if ( basa(-4,"_v_zamok") &&
            w(-3,cst2) &&
            w(-2,"в во") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-4,-1) )
    { l[i]=omo2; Z[251]++; if(dbg){print "Z251"}; continue };
    if ( basa(-3,"_v_zamok") &&
            w(-2,cst2) &&
            w(-1,"в") && s(-3,-1) )
    { l[i]=omo2; Z[252]++; if(dbg){print "Z252"}; continue };
    # _v_zamok:end

    if ( base(-3,"пуля") &&
         base(-2,"угодить") &&
            w(-1,"в") && s(-3,-1) )
    { l[i]=omo2; Z[253]++; if(dbg){print "Z253"}; continue };

    cst="быстрее быстро все всё назад обратно скорее";
    if ( qxs(-1,cst,"в во") && p(xsn-1,",") && p(0) )
    { l[i]=omo1; Z[254]++; if(dbg){print "Z254"}; continue };

    if ( p(-2,",") && w(-1,"в") && cap(-1) && p(0) )
    { l[i]=omo1; Z[255]++; if(dbg){print "Z255"}; continue };

    cst="ввести вводить всадить загнать засадить";
    cst1="ключ код отвертка отвёртка";
    if ( bb(-7,-3,cst) &&
          q(bbn+1,"mest_vi mest_3e") &&
        qsb(bbn-10,bbn-1,",") &&
         bb(qsn-10,qsn,cst1) && s(bbn,qsn-1) &&
          w(-1,"в") && s(bbn,-1) )
    { l[i]=omo2; Z[256]++; if(dbg){print "Z256"}; continue };
    if ( bb(-8,-4,cst) &&
          q(bbn+1,"mest_vi mest_3e") && s(bbn,-1) &&
        qsb(bbn-10,bbn-1,",") &&
         bb(qsn-10,qsn,cst1) && s(bbn,qsn-1) &&
          w(-2,"в во") &&
          q(-1,"prl_vi prq_vi mest_vi mest_3e") )
    { l[i]=omo2; Z[257]++; if(dbg){print "Z257"}; continue };

    #
    cst="всадить въехать загнать заехать засадить захватить";
    cst1="затвор коленка колено кулак локоть нога рука";
    if ( bb(-7,-4,cst1) && s(bbn,-1) &&
       base(-3,cst) &&
          w(-2,"в во") &&
          q(-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo2; Z[258]++; if(dbg){print "Z258"}; continue };
    if ( bb(-6,-3,cst1) && s(bbn,-1) &&
       base(-2,cst) &&
          w(-1,"в") )
    { l[i]=omo2; Z[259]++; if(dbg){print "Z259"}; continue };
    if ( base(-4,cst) &&
         base(-3,cst1) &&
            w(-2,"в во") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-4,-1) )
    { l[i]=omo2; Z[260]++; if(dbg){print "Z260"}; continue };
    if ( base(-3,cst) &&
         base(-2,cst1) &&
            w(-1,"в") && s(-3,-1) )
    { l[i]=omo2; Z[261]++; if(dbg){print "Z261"}; continue };
    if ( base(-4,cst) &&
            q(-3,"mest_vi mest_3e suw_vi") &&
         base(-2,cst1) &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo2; Z[262]++; if(dbg){print "Z262"}; continue };

    # _gl_v_castle_main: begin
    # _v_lock_parts:sart - части замка́
    if ( bba(-7,-4,"_v_lock_parts") && s(bbn,-1) &&
        basa(-3,"_gl_v_castle_main") &&
           w(-2,"в во") &&
           q(-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo2; Z[263]++; if(dbg){print "Z263"}; continue };
    if ( bba(-6,-3,"_v_lock_parts") && s(bbn,-1) &&
        basa(-2,"_gl_v_castle_main") &&
           w(-1,"в") )
    { l[i]=omo2; Z[264]++; if(dbg){print "Z264"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
         basa(-3,"_v_lock_parts") &&
            w(-2,"в во") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-4,-1) )
    { l[i]=omo2; Z[265]++; if(dbg){print "Z265"}; continue };
    if ( basa(-6,"_gl_v_castle_main") &&
            q(-5,"prl_any prq_any mest_any") &&
            q(-4,"prl_any prq_any mest_any") &&
         basa(-3,"_v_lock_parts") &&
            w(-2,"в во") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-6,-1) )
    { l[i]=omo2; Z[266]++; if(dbg){print "Z266"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"prl_any prq_any mest_any") &&
            q(-3,"prl_any prq_any mest_any") &&
         basa(-2,"_v_lock_parts") &&
            w(-1,"в во") && s(-5,-1) )
    { l[i]=omo2; Z[267]++; if(dbg){print "Z267"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"prl_any prq_any mest_any") &&
         basa(-3,"_v_lock_parts") &&
            w(-2,"в во") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-5,-1) )
    { l[i]=omo2; Z[268]++; if(dbg){print "Z268"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
            q(-3,"prl_any prq_any mest_any") &&
         basa(-2,"_v_lock_parts") &&
            w(-1,"в во") && s(-4,-1) )
    { l[i]=omo2; Z[269]++; if(dbg){print "Z269"}; continue };
    if ( basa(-3,"_gl_v_castle_main") &&
         basa(-2,"_v_lock_parts") &&
            w(-1,"в") && s(-3,-1) )
    { l[i]=omo2; Z[270]++; if(dbg){print "Z270"}; continue };
    if ( basa(-3,"_v_lock_parts") && sc(-3,",") &&
         basa(-2,"_gl_v_castle_main") &&
            w(-1,"в") )
    { l[i]=omo2; Z[271]++; if(dbg){print "Z271"}; continue };
    if ( basa(-4,"_v_lock_parts") && sc(-4,",") &&
            q(-3,"nar_spos nar_vrem prl_kred_sr isname") &&
         basa(-2,"_gl_v_castle_main") &&
            w(-1,"в") )
    { l[i]=omo2; Z[272]++; if(dbg){print "Z272"}; continue };

    #
    if ( base(-3,"попасть попадать") &&
        (basa(-2,"_v_lock_parts")||w(-2,"им")) &&
            w(-1,"в") && s(-3,-1) )
    { l[i]=omo2; Z[273]++; if(dbg){print "Z273"}; continue };
    # _v_lock_parts:end
    #
    # _gl_v_castle_main: main
    if ( basa(-2,"_gl_v_castle_main") &&
            w(-1,"в") && s(-2,-1) )
    { l[i]=omo1; Z[274]++; if(dbg){print "Z274"}; continue };
    if ( basa(-3,"_gl_v_castle_main") &&
            w(-2,"в во") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[275]++; if(dbg){print "Z275"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
            w(-3,"в во") &&
            q(-2,"prl_vi prq_vi mest_vi mest_3e") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-4,-1) )
    { l[i]=omo1; Z[276]++; if(dbg){print "Z276"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
            q(-3,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi") &&
            q(-2,"suw_vi mest_vi mest_3e suw_mnsq qis_vi isname") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo1; Z[277]++; if(dbg){print "Z277"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"prq_vi") &&
            q(-3,"suw_vi mest_vi mest_3e suw_mnsq qis_vi isname") &&
            q(-2,"suw_vi mest_vi mest_3e suw_mnsq qis_vi isname") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo1; Z[278]++; if(dbg){print "Z278"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_spos") &&
            q(-3,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi") &&
            q(-2,"suw_vi mest_vi mest_3e suw_mnsq qis_vi isname") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo1; Z[279]++; if(dbg){print "Z279"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"prl_vi mest_vi mest_3e prq_vi qik_vi") &&
            q(-3,"suw_vi mest_vi mest_3e") &&
            q(-2,"prl_kred_sr nar_napr nar_vrem nar_spos qast") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo1; Z[280]++; if(dbg){print "Z280"}; continue };
    if ( basa(-7,"_gl_v_castle_main") &&
       pre_pr(-6) &&
            q(-5,"suw_pr") &&
            q(-4,"prl_vi prq_vi mest_vi mest_3e qik_vi") &&
            q(-3,"suw_vi") &&
            w(-2,"в во") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-7,-1) )
    { l[i]=omo1; Z[281]++; if(dbg){print "Z281"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"prl_vi prq_vi mest_vi mest_3e") &&
            q(-3,"suw_vi") &&
            w(-2,"в во") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-5,-1) )
    { l[i]=omo1; Z[282]++; if(dbg){print "Z282"}; continue };
    if ( basa(-6,"_gl_v_castle_main") &&
            q(-5,"prl_vi prq_vi mest_vi mest_3e") &&
            q(-4,"suw_vi") &&
            w(-3,"в во") &&
            q(-2,"prl_vi prq_vi mest_vi mest_3e") &&
            q(-1,"prl_vi prq_vi mest_vi") && s(-6,-1) )
    { l[i]=omo1; Z[283]++; if(dbg){print "Z283"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
            q(-3,"prl_vi prq_vi mest_vi mest_3e") &&
            q(-2,"suw_vi suw_im name_vi_sy isname") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo1; Z[284]++; if(dbg){print "Z284"}; continue };
    if ( basa(-3,"_gl_v_castle_main") &&
            q(-2,"suw_vi suw_im suw_ro suw_tv mest_vi mest_im mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr nar_spos qast name_vi_sy isname") &&
            w(-1,"в") && s(-3,-1) )
    { l[i]=omo1; Z[285]++; if(dbg){print "Z285"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
            q(-3,"prl_vi prl_im mest_vi mest_im mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr nar_spos qast name_vi_sy isname") &&
            q(-2,"suw_vi suw_im mest_vi mest_im mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr nar_spos qast name_vi_sy isname") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo1; Z[286]++; if(dbg){print "Z286"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"prl_vi prl_im mest_vi mest_im mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr nar_spos qast name_vi_sy isname") &&
            q(-3,"suw_vi suw_im mest_vi mest_im mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr nar_spos qast name_vi_sy isname") &&
            q(-2,"qast") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo1; Z[287]++; if(dbg){print "Z287"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
            q(-3,"prl_ro mest_ro mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr nar_spos qast name_vi_sy isname") &&
            q(-2,"suw_ro mest_ro mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr nar_spos qast name_vi_sy isname") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo1; Z[288]++; if(dbg){print "Z288"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
            q(-3,"prl_tv mest_tv mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr nar_spos qast name_vi_sy isname") &&
            q(-2,"suw_tv mest_tv mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr nar_spos qast name_vi_sy isname") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo1; Z[289]++; if(dbg){print "Z289"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
            q(-3,"suw_vi suw_im mest_vi mest_im mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr nar_spos qast name_vi_sy isname") &&
            w(-2,"в во") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-4,-1) )
    { l[i]=omo1; Z[290]++; if(dbg){print "Z290"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
            q(-3,"suw_tv mest_tv mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr nar_spos qast name_vi_sy isname") &&
            w(-2,"в во") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-4,-1) )
    { l[i]=omo1; Z[291]++; if(dbg){print "Z291"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"suw_vi suw_im suw_tv mest_vi mest_im mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr nar_spos qast name_vi_sy isname") &&
            w(-3,"в во") &&
            q(-2,"prl_vi prq_vi mest_vi mest_3e") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-5,-1) )
    { l[i]=omo1; Z[292]++; if(dbg){print "Z292"}; continue };
    if ( basa(-6,"_gl_v_castle_main") &&
            q(-5,"prl_vi prq_vi mest_vi mest_3e") &&
            q(-4,"suw_vi suw_im mest_vi mest_im mest_3e name_vi_sy isname") &&
            w(-3,"в во") &&
            q(-2,"prl_vi prq_vi mest_vi mest_3e") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-6,-1) )
    { l[i]=omo1; Z[293]++; if(dbg){print "Z293"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"suw_vi suw_im mest_vi mest_im mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr qast name_vi_sy isname") &&
            q(-3,"sz_iili") &&
            q(-2,"suw_vi suw_im mest_vi mest_im mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr qast name_vi_sy isname") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo1; Z[294]++; if(dbg){print "Z294"}; continue };
    if ( basa(-6,"_gl_v_castle_main") &&
            q(-5,"suw_vi suw_im mest_vi mest_im mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr qast name_vi_sy isname") &&
            q(-4,"sz_iili") &&
            q(-3,"prl_vi prq_vi mest_vi mest_3e") &&
            q(-2,"suw_vi suw_im mest_vi mest_im mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr qast name_vi_sy isname") &&
            w(-1,"в") && s(-6,-1) )
    { l[i]=omo1; Z[295]++; if(dbg){print "Z295"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
            q(-3,"suw_vi suw_im mest_vi suw_tv mest_im mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr qast name_vi_sy isname") &&
            q(-2,"nar_napr nar_vrem nar_spos prl_kred_sr") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo1; Z[296]++; if(dbg){print "Z296"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"qast") &&
            q(-3,"suw_vi suw_im mest_vi mest_im mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr qast name_vi_sy isname") &&
            q(-2,"nar_napr nar_vrem nar_spos prl_kred_sr") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo1; Z[297]++; if(dbg){print "Z297"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
            q(-3,"qast") &&
            q(-2,"suw_vi mest_vi mest_im mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr qast") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo1; Z[298]++; if(dbg){print "Z298"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
            q(-3,"qast") &&
            q(-2,"suw_tv mest_tv mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr qast") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo1; Z[299]++; if(dbg){print "Z299"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
            q(-3,"suw_vi") &&
            q(-2,"suw_ro prl_kred_sr") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo1; Z[300]++; if(dbg){print "Z300"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"suw_vi") &&
            q(-3,"prl_ro prq_ro mest_ro mest_3e") &&
            q(-2,"suw_ro prl_kred_sr isname") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo1; Z[301]++; if(dbg){print "Z301"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
            q(-3,"suw_vi suw_tv mest_vi mest_3e gl_in prl_kred_sr nar_vrem nar_mest nar_napr qast") &&
            w(-2,"в во") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-4,-1) )
    { l[i]=omo1; Z[302]++; if(dbg){print "Z302"}; continue };
    if ( basa(-6,"_gl_v_castle_main") &&
            q(-5,"nar_vrem prl_kred_sr") &&
       pre_da(-4) &&
            q(-3,"suw_da mest_da") &&
            w(-2,"в во") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-6,-1) )
    { l[i]=omo1; Z[303]++; if(dbg){print "Z303"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"nar_vrem prl_kred_sr qast mest_vi mest_3e isname") &&
       pre_da(-3) &&
            q(-2,"suw_da mest_da") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo1; Z[304]++; if(dbg){print "Z304"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
       pre_da(-3) &&
            q(-2,"mest_da suw_da isname") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo1; Z[305]++; if(dbg){print "Z305"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
       pre_da(-4) &&
            q(-3,"mest_da suw_da isname") &&
            q(-2,"nar_napr") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo1; Z[306]++; if(dbg){print "Z306"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"suw_vi mest_vi mest_3e") &&
       pre_da(-3) &&
            q(-2,"mest_da suw_da") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo1; Z[307]++; if(dbg){print "Z307"}; continue };
    if ( basa(-7,"_gl_v_castle_main") &&
            q(-6,"suw_vi mest_vi mest_3e") &&
      sz_iili(-5) &&
            q(-4,"suw_vi mest_vi mest_3e") &&
       pre_da(-3) &&
            q(-2,"mest_da suw_da") &&
            w(-1,"в") && s(-7,-1) )
    { l[i]=omo1; Z[308]++; if(dbg){print "Z308"}; continue };
    if ( basa(-6,"_gl_v_castle_main") &&
            q(-5,"prl_vi mest_vi mest_3e") &&
            q(-4,"suw_vi mest_vi mest_3e") &&
       pre_da(-3) &&
            q(-2,"mest_da suw_da") &&
            w(-1,"в") && s(-6,-1) )
    { l[i]=omo1; Z[309]++; if(dbg){print "Z309"}; continue };
    if ( basa(-7,"_gl_v_castle_main") &&
            q(-6,"prl_vi mest_vi mest_3e") &&
            q(-5,"suw_vi mest_vi mest_3e") &&
       pre_da(-4) &&
            q(-3,"mest_da prl_da prq_da") &&
            q(-2,"mest_da suw_da") &&
            w(-1,"в") && s(-7,-1) )
    { l[i]=omo1; Z[310]++; if(dbg){print "Z310"}; continue };
    if ( basa(-6,"_gl_v_castle_main") &&
            q(-5,"suw_vi mest_vi mest_3e") &&
       pre_da(-4) &&
            q(-3,"mest_da prl_da prq_da") &&
            q(-2,"mest_da suw_da") &&
            w(-1,"в") && s(-6,-1) )
    { l[i]=omo1; Z[311]++; if(dbg){print "Z311"}; continue };
    if ( basa(-8,"_gl_v_castle_main") &&
            q(-7,"mest_vi suw_vi isname") &&
      sz_iili(-6) &&
            q(-5,"prl_vi mest_vi mest_3e") &&
            q(-4,"suw_vi mest_vi mest_3e") &&
       pre_da(-3) &&
            q(-2,"mest_da suw_da") &&
            w(-1,"в") && s(-8,-1) )
    { l[i]=omo1; Z[312]++; if(dbg){print "Z312"}; continue };
    if ( basa(-7,"_gl_v_castle_main") &&
            q(-6,"prl_vi mest_vi mest_3e") &&
            q(-5,"suw_vi mest_vi mest_3e") &&
            q(-4,"suw_ro mest_ro mest_3e") &&
       pre_da(-3) &&
            q(-2,"mest_da suw_da") &&
            w(-1,"в") && s(-6,-1) )
    { l[i]=omo1; Z[313]++; if(dbg){print "Z313"}; continue };
    if ( basa(-7,"_gl_v_castle_main") &&
            q(-6,"prl_vi mest_vi mest_3e") &&
            q(-5,"suw_vi mest_vi mest_3e") &&
      sz_iili(-4) &&
       pre_da(-3) &&
            q(-2,"mest_da suw_da") &&
            w(-1,"в") && s(-7,-1) )
    { l[i]=omo1; Z[314]++; if(dbg){print "Z314"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
       pre_da(-4) &&
            q(-3,"mest_da suw_da") &&
            w(-2,"в во") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-5,-1) )
    { l[i]=omo1; Z[315]++; if(dbg){print "Z315"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
       pre_tv(-3) &&
            q(-2,"mest_tv suw_tv isname") &&
            w(-1,"в во") && s(-4,-1) )
    { l[i]=omo1; Z[316]++; if(dbg){print "Z316"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
       pre_tv(-4) &&
            q(-3,"mest_tv suw_tv isname") &&
            q(-2,"nar_napr nar_spos nar_vrem prl_kred_sr") &&
            w(-1,"в во") && s(-5,-1) )
    { l[i]=omo1; Z[317]++; if(dbg){print "Z317"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
       pre_tv(-4) &&
            q(-3,"mest_tv suw_tv isname") &&
            w(-2,"в во") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-5,-1) )
    { l[i]=omo1; Z[318]++; if(dbg){print "Z318"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
       pre_tv(-4) &&
            q(-3,"prl_tv mest_tv qik_tv mest_3e") &&
            q(-2,"mest_tv suw_tv isname") &&
            w(-1,"в во") && s(-5,-1) )
    { l[i]=omo1; Z[319]++; if(dbg){print "Z319"}; continue };
    if ( basa(-7,"_gl_v_castle_main") &&
            q(-6,"mest_vi suw_vi isname") &&
      sz_iili(-5) &&
            q(-4,"mest_vi suw_vi isname") &&
       pre_tv(-3) &&
            q(-2,"mest_tv suw_tv isname") &&
            w(-1,"в во") && s(-7,-1) )
    { l[i]=omo1; Z[320]++; if(dbg){print "Z320"}; continue };
    if ( basa(-7,"_gl_v_castle_main") &&
       pre_tv(-6) &&
            q(-5,"prl_tv mest_tv qik_tv mest_3e") &&
            q(-4,"mest_tv suw_tv isname") &&
      sz_iili(-3) &&
            q(-2,"mest_tv suw_tv isname") &&
            w(-1,"в во") && s(-7,-1) )
    { l[i]=omo1; Z[321]++; if(dbg){print "Z321"}; continue };
    if ( basa(-7,"_gl_v_castle_main") &&
       pre_tv(-6) &&
            q(-5,"mest_tv suw_tv isname") &&
      sz_iili(-4) &&
            q(-3,"prl_tv mest_tv qik_tv mest_3e") &&
            q(-2,"mest_tv suw_tv isname") &&
            w(-1,"в во") && s(-7,-1) )
    { l[i]=omo1; Z[322]++; if(dbg){print "Z322"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"mest_vi suw_vi nar_napr nar_vrem nar_spos prl_kred_sr isname") &&
            q(-3,"pre_tv") &&
            q(-2,"mest_tv suw_tv isname") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo1; Z[323]++; if(dbg){print "Z323"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"pre_tv") &&
            q(-3,"mest_tv suw_tv") &&
            w(-2,"в во") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-5,-1) )
    { l[i]=omo1; Z[324]++; if(dbg){print "Z324"}; continue };
    if ( basa(-7,"_gl_v_castle_main") &&
            q(-6,"pre_tv") &&
            q(-5,"prl_tv mest_tv mest_3e") &&
            q(-4,"mest_tv suw_tv") &&
            w(-3,"в во") &&
            q(-2,"prl_vi mest_vi mest_3e") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-7,-1) )
    { l[i]=omo1; Z[325]++; if(dbg){print "Z325"}; continue };
    if ( basa(-6,"_gl_v_castle_main") &&
            q(-5,"suw_vi mest_vi mest_3e") &&
            q(-4,"nar_napr nar_spos") &&
            q(-3,"pre_da") &&
            q(-2,"mest_da suw_da") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo1; Z[326]++; if(dbg){print "Z326"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
            q(-3,"pre_vi") &&
            q(-2,"mest_vi suw_vi") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo1; Z[327]++; if(dbg){print "Z327"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"pre_vi") &&
            q(-3,"mest_vi suw_vi") &&
            w(-2,"в") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-5,-1) )
    { l[i]=omo1; Z[328]++; if(dbg){print "Z328"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"pre_vi") &&
            q(-3,"mest_vi suw_vi") &&
            q(-2,"nar_napr") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo1; Z[329]++; if(dbg){print "Z329"}; continue };
    if ( basa(-6,"_gl_v_castle_main") &&
       pre_ro(-5) &&
            q(-4,"suw_ro isname") &&
            q(-3,"pre_vi") &&
            q(-2,"mest_vi suw_vi isname") &&
            w(-1,"в") && s(-6,-1) )
    { l[i]=omo1; Z[330]++; if(dbg){print "Z330"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"pre_vi") &&
            q(-3,"prl_vi mest_vi mest_3e") &&
            q(-2,"mest_vi suw_vi") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo1; Z[331]++; if(dbg){print "Z331"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"mest_vi suw_vi suw_da mest_da mest_3e") &&
            q(-3,"pre_vi") &&
            q(-2,"mest_vi suw_vi") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo1; Z[332]++; if(dbg){print "Z332"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
            q(-3,"pre_pr") &&
            q(-2,"mest_pr suw_pr") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo1; Z[333]++; if(dbg){print "Z333"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
            q(-3,"pre_ro") &&
            q(-2,"mest_ro suw_ro") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo1; Z[334]++; if(dbg){print "Z334"}; continue };
    if ( basa(-8,"_gl_v_castle_main") &&
            q(-7,"pre_ro") &&
            q(-6,"mest_ro suw_ro") &&
            q(-5,"pre_ro") &&
            q(-4,"prl_ro prq_ro mest_ro mest_3e") &&
            q(-3,"prl_ro prq_ro mest_ro mest_3e") &&
            q(-2,"mest_ro suw_ro") &&
            w(-1,"в") && s(-8,-1) )
    { l[i]=omo1; Z[335]++; if(dbg){print "Z335"}; continue };
    if ( basa(-6,"_gl_v_castle_main") &&
            q(-5,"pre_ro") &&
            q(-4,"prl_ro prq_ro mest_ro mest_3e") &&
            q(-3,"prl_ro prq_ro mest_ro mest_3e") &&
            q(-2,"mest_ro suw_ro") &&
            w(-1,"в") && s(-6,-1) )
    { l[i]=omo1; Z[336]++; if(dbg){print "Z336"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"pre_ro") &&
            q(-3,"prl_ro prq_ro mest_ro mest_3e") &&
            q(-2,"mest_ro suw_ro") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo1; Z[337]++; if(dbg){print "Z337"}; continue };
    if ( basa(-5,"_gl_v_castle_main") &&
            q(-4,"mest_vi suw_vi") &&
            q(-3,"pre_ro") &&
            q(-2,"mest_ro suw_ro") &&
            w(-1,"в") && s(-5,-1) )
    { l[i]=omo1; Z[338]++; if(dbg){print "Z338"}; continue };
    if ( basa(-6,"_gl_v_castle_main") &&
            q(-5,"prl_vi prq_vi mest_vi mest_3e") &&
            q(-4,"suw_vi") &&
            q(-3,"pre_ro") &&
            q(-2,"mest_ro suw_ro") &&
            w(-1,"в") && s(-6,-1) )
    { l[i]=omo1; Z[339]++; if(dbg){print "Z339"}; continue };
    if ( basa(-3,"_gl_v_castle_main") &&
            q(-2,"mest_da suw_da") &&
            w(-1,"в") && s(-3,-1) )
    { l[i]=omo1; Z[340]++; if(dbg){print "Z340"}; continue };
    if ( basa(-4,"_gl_v_castle_main") &&
            q(-3,"qast") &&
            q(-2,"mest_da suw_da") &&
            w(-1,"в") && s(-4,-1) )
    { l[i]=omo1; Z[341]++; if(dbg){print "Z341"}; continue };

    if (  w(-1,"в") &&
          w(1,"к") &&
          q(2,"suw_odedda suw_odmnda isname mest_da") && s(-1,1) )
    { l[i]=omo1; Z[342]++; if(dbg){print "Z342"}; continue };
    if (  w(-1,"в") &&
          w(1,"к") &&
          q(2,"prl_da prq_da mest_da mest_3e") &&
          q(3,"suw_odedda suw_odmnda isname mest_da") && s(-1,2) )
    { l[i]=omo1; Z[343]++; if(dbg){print "Z343"}; continue };
    if (  w(-1,"в") && s(-1) && sc(0,",") &&
          q(1,"sz") &&
          w(2,"к") &&
          q(3,"suw_odedda suw_odmnda isname mest_da") && s(1,2) )
    { l[i]=omo1; Z[344]++; if(dbg){print "Z344"}; continue };

    if ( w(-1,"в") &&
    pre_tv(1) &&
         q(2,"suw_tv") &&
         q(3,"nar_spos") &&
      basa(4,"_gl_v_castle_main") && s(-1,3) )
    { l[i]=omo1; Z[345]++; if(dbg){print "Z345"}; continue };
    if ( w(-1,"в") &&
       bfa(1,5,"_gl_v_castle_main") && s(-1,bfn-1) && Qf(1,bfn,"sz_iili") )
    { l[i]=omo1; Z[346]++; if(dbg){print "Z346"}; continue };
    if ( w(-2,"в во") &&
         q(-1,"prl_vi mest_vi mest_3e") &&
       bfa(1,3,"_gl_v_castle_main") && s(-2,bfn-1) && Qf(1,bfn,"sz_iili") )
    { l[i]=omo1; Z[347]++; if(dbg){print "Z347"}; continue };
    # _gl_v_castle_main: end

    cst="города деревни замка замков";
    if ( w(-3,"из") &&
        (w(-2,cst)||q(-2,"isname")) &&
         w(-1,"в") && s(-3,-1) && !(bb(-7,-4,"выстрелить выпалить прицелиться") && s(bbn,-4)) )
    { l[i]=omo1; Z[348]++; if(dbg){print "Z348"}; continue };

    if ( q(-3,"mest_da suw_da") &&
         q(-2,"mod_ed mod_mn mod_bz") &&
         w(-1,"в") && s(-3,-1) )
    { l[i]=omo1; Z[349]++; if(dbg){print "Z349"}; continue };

  }; # в замок
  # на замок
  if ( wb(-3,-1,"на") && s(wbn,-1) ) {

    cst="граница";
    if ( base(-2,cst) &&
            w(-1,"на") && s(-2,-1) )
    { l[i]=omo2; Z[350]++; if(dbg){print "Z350"}; continue };

    cst="пахать работать";
    if ( base(-2,cst) &&
            w(-1,"на") && s(-2,-1) )
    { l[i]=omo1; Z[351]++; if(dbg){print "Z351"}; continue };
    if ( w(-1,"на") &&
      base(1,cst) && s(-1,0) )
    { l[i]=omo1; Z[352]++; if(dbg){print "Z352"}; continue };

    # _gl_na_lock:start
    if ( basa(-2,"_gl_na_lock") &&
            w(-1,"на") && s(-2,-1) )
    { l[i]=omo2; Z[353]++; if(dbg){print "Z353"}; continue };
    if ( basa(-3,"_gl_na_lock") &&
            q(-2,"suw_vi mest_vi mest_3e prl_kred_sr nar_mest nar_spos qast") &&
            w(-1,"на") && s(-3,-1) )
    { l[i]=omo2; Z[354]++; if(dbg){print "Z354"}; continue };
    if ( basa(-4,"_gl_na_lock") &&
            q(-3,"suw_vi mest_vi mest_3e prl_kred_sr nar_mest nar_spos qast") &&
            w(-2,"на") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-4,-1) )
    { l[i]=omo2; Z[355]++; if(dbg){print "Z355"}; continue };
    if ( basa(-6,"_gl_na_lock") &&
            q(-5,"suw_vi mest_vi mest_3e prl_kred_sr nar_mest nar_spos qast") &&
       pre_tv(-4) &&
            q(-3,"suw_tv mest_tv") &&
            w(-2,"на") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-6,-1) )
    { l[i]=omo2; Z[356]++; if(dbg){print "Z356"}; continue };
    if ( basa(-5,"_gl_na_lock") &&
            q(-4,"suw_vi mest_vi mest_3e prl_kred_sr nar_mest nar_spos qast") &&
       pre_tv(-3) &&
            q(-2,"suw_tv mest_tv") &&
            w(-1,"на") && s(-5,-1) )
    { l[i]=omo2; Z[357]++; if(dbg){print "Z357"}; continue };
    if ( basa(-5,"_gl_na_lock") &&
       pre_pr(-4) &&
            q(-3,"prl_pr mest_pr mest_3e") &&
            q(-2,"suw_pr") &&
            w(-1,"на") && s(-5,-1) )
    { l[i]=omo2; Z[358]++; if(dbg){print "Z358"}; continue };
    if ( basa(-4,"_gl_na_lock") &&
            q(-3,"prl_vi mest_vi mest_3e") &&
            q(-2,"suw_vi") &&
            w(-1,"на") && s(-4,-1) )
    { l[i]=omo2; Z[359]++; if(dbg){print "Z359"}; continue };
    if ( basa(-5,"_gl_na_lock") &&
            q(-4,"prl_vi mest_vi mest_3e") &&
            q(-3,"prl_vi mest_vi") &&
            q(-2,"suw_vi") &&
            w(-1,"на") && s(-5,-1) )
    { l[i]=omo2; Z[360]++; if(dbg){print "Z360"}; continue };
    if ( basa(-4,"_gl_na_lock") &&
            w(-3,"на") &&
            q(-2,"prl_vi mest_vi mest_3e") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-4,-1) )
    { l[i]=omo2; Z[361]++; if(dbg){print "Z361"}; continue };
    if ( basa(-3,"_gl_na_lock") &&
            w(-2,"на") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo2; Z[362]++; if(dbg){print "Z362"}; continue };
    if ( basa(-4,"_gl_na_lock") &&
            w(-3,"на") &&
            q(-2,"prl_vi prq_vi") &&
            q(-1,"suw_vi") && s(-4,-1) )
    { l[i]=omo2; Z[363]++; if(dbg){print "Z363"}; continue };
    if ( vvb(-6,-1) &&
        basa(vvn-2,"_gl_na_lock") &&
           w(vvn-1,"на") &&
           q(vvn,"prl_vi mest_vi mest_3e") && s(vvn-2,vvn-1) )
    { l[i]=omo2; Z[364]++; if(dbg){print "Z364"}; continue };
    if ( basa(-5,"_gl_na_lock") &&
       pre_tv(-4) &&
            q(-3,"mest_tv suw_tv") &&
            q(-2,"mest_vi suw_vi mest_3e") &&
            w(-1,"на") && s(-5,-1) )
    { l[i]=omo2; Z[365]++; if(dbg){print "Z365"}; continue };
    if ( basa(-4,"_gl_na_lock") &&
       pre_vi(-3) &&
            q(-2,"suw_vi") &&
            w(-1,"на") && s(-4,-1) )
    { l[i]=omo2; Z[366]++; if(dbg){print "Z366"}; continue };
    if ( w(-1,"на") &&
       bfa(1,3,"_gl_na_lock") && s(-1,bfn-1) )
    { l[i]=omo2; Z[367]++; if(dbg){print "Z367"}; continue };
    # _gl_na_lock:end

    # _suw_na_lock:start
    if ( basa(-2,"_suw_na_lock") &&
            w(-1,"на") && s(-2,-1) )
    { l[i]=omo2; Z[368]++; if(dbg){print "Z368"}; continue };
    if ( w(-1,"на") &&
      basa(1,"_suw_na_lock") && s(0,0) )
    { l[i]=omo2; Z[369]++; if(dbg){print "Z369"}; continue };
    # _suw_na_lock:end

    # похожий
    cst="похожий";
    if ( base(-2,cst) &&
            w(-1,"на") &&
         basa(1,"_castlelike_things") && s(-2,0) )
    { l[i]=omo1; Z[370]++; if(dbg){print "Z370"}; continue };
    if ( base(-2,cst) &&
            w(-1,"на") &&
            q(1,"prl_any") &&
         basa(2,"_castlelike_things") && s(-2,1) )
    { l[i]=omo1; Z[371]++; if(dbg){print "Z371"}; continue };
    if ( w(-2,"на") &&
         q(-1,"prl_any mest_any") &&
      basa(1,"_castlelike_things") &&
    pre_pr(2) &&
         q(3,"suw_pr") &&
      base(4,cst) && s(-2,3) )
    { l[i]=omo1; Z[372]++; if(dbg){print "Z372"}; continue };
    # похожий

    cst="атака набег нападать нападение напасть";
    if ( base(-2,cst) &&
            w(-1,"на") && s(-2,-1) )
    { l[i]=omo1; Z[373]++; if(dbg){print "Z373"}; continue };
    if ( base(-3,cst) &&
            w(-2,"на") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[374]++; if(dbg){print "Z374"}; continue };
    if ( w(-1,"на") &&
        bf(1,3,cst) && s(-1,bfn-1) )
    { l[i]=omo1; Z[375]++; if(dbg){print "Z375"}; continue };

    cst="потянуть тянуть";
    if ( w(-1,"на") &&
         q(1,"suw_im mest_im") &&
         w(2,"не") &&
      base(3,cst) && s(-1,2) )
    { l[i]=omo1; Z[376]++; if(dbg){print "Z376"}; continue };

  }; # на замок
  # за замок
  if ( wb(-3,-1,"за") && s(wbn,-1) ) {

    cst="взяться";
    if ( base(-3,cst) &&
          qxs(-1,"за","мой твой наш ваш их свой этот тот ее её их его") )
    { l[i]=omo1; Z[377]++; if(dbg){print "Z377"}; continue };
    if ( base(-3,cst) &&
            w(-2,"за") &&
       isname(-1) && s(-3,-1) )
    { l[i]=omo1; Z[378]++; if(dbg){print "Z378"}; continue };
    if ( base(-2,cst) &&
            w(-1,"за") &&
      sz_iili(1) &&
         base(2,"спалить сжечь сровнять снести") && s(-2,1) )
    { l[i]=omo1; Z[379]++; if(dbg){print "Z379"}; continue };
    if ( wb(-5,-3,"нужно пора") &&
          w(-2,cst) &&
          w(-1,"за") && s(wbn,-1) )
    { l[i]=omo1; Z[380]++; if(dbg){print "Z380"}; continue };
   if ( base(-3,"хотеть") &&
           w(-2,cst) &&
           w(-1,"за") && s(-3,-1) )
    { l[i]=omo1; Z[381]++; if(dbg){print "Z381"}; continue };
   cst1="когда крепко наконец основательно плотно";
    if ( w(-3,cst1) &&
      base(-2,cst) &&
         w(-1,"за") && s(-3,-1) )
    { l[i]=omo1; Z[382]++; if(dbg){print "Z382"}; continue };
    if ( w(-3,cst1) &&
      base(-2,cst) &&
         w(-1,"за") &&
         w(1,"новый мой твой наш ваш их свой этот тот ее её их его") && s(-3,0) )
    { l[i]=omo1; Z[383]++; if(dbg){print "Z383"}; continue };
    if ( base(-2,cst) &&
            w(-1,"за") &&
            w(1,cst1) && s(-2,0) )
    { l[i]=omo1; Z[384]++; if(dbg){print "Z384"}; continue };

    cst="взяться схватиться ухватиться";
    if ( base(-2,cst) &&
            w(-1,"за") && s(-2,-1) )
    { l[i]=omo2; Z[385]++; if(dbg){print "Z385"}; continue };
    if ( base(-3,cst) &&
            q(-2,"suw_vi") &&
            w(-1,"за") && s(-3,-1) )
    { l[i]=omo2; Z[386]++; if(dbg){print "Z386"}; continue };
    if ( base(-4,cst) &&
            q(-3,"prl_vi mest_vi mest_3e") &&
            q(-2,"suw_vi") &&
            w(-1,"за") && s(-4,-1) )
    { l[i]=omo2; Z[387]++; if(dbg){print "Z387"}; continue };
    if ( base(-5,cst) &&
            q(-4,"prl_vi mest_vi mest_3e") &&
            q(-3,"prl_vi mest_vi") &&
            q(-2,"suw_vi") &&
            w(-1,"за") && s(-5,-1) )
    { l[i]=omo2; Z[388]++; if(dbg){print "Z388"}; continue };
    if ( base(-3,cst) &&
            w(-2,"за") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo2; Z[389]++; if(dbg){print "Z389"}; continue };
    if ( vvb(-6,-1) &&
        base(vvn-2,cst) &&
           w(vvn-1,"за") &&
           q(vvn,"prl_vi mest_vi mest_3e") && s(vvn-2,vvn-1) )
    { l[i]=omo2; Z[390]++; if(dbg){print "Z390"}; continue };
    if ( w(-1,"за") &&
        bf(1,3,cst) && s(-1,bfn-1) )
    { l[i]=omo2; Z[391]++; if(dbg){print "Z391"}; continue };
    if ( base(-5,cst) &&
       pre_tv(-4) &&
            q(-3,"mest_tv suw_tv") &&
            q(-2,"mest_vi suw_vi mest_3e") &&
            w(-1,"за") && s(-5,-1) )
    { l[i]=omo2; Z[392]++; if(dbg){print "Z392"}; continue };

  }; # за замок
  # под замок
  if ( wb(-3,-1,"под") && s(wbn,-1) ) {

    cst="подкоп";
    if ( base(-2,cst) &&
            w(-1,"под") && s(-2,-1) )
    { l[i]=omo1; Z[393]++; if(dbg){print "Z393"}; continue };
    if ( base(-3,cst) &&
            w(-2,"под") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[394]++; if(dbg){print "Z394"}; continue };
    if ( w(-1,"под") &&
        bf(1,3,cst) && s(-1,bfn-1) )
    { l[i]=omo1; Z[395]++; if(dbg){print "Z395"}; continue };

    # _pod_lock:start
    if ( basa(-2,"_pod_lock") &&
            w(-1,"под") && s(-2,-1) )
    { l[i]=omo2; Z[396]++; if(dbg){print "Z396"}; continue };
    if ( basa(-4,"_pod_lock") &&
            q(-3,"prl_vi mest_vi mest_3e qast") &&
            q(-2,"suw_vi mest_vi mest_3e qast") &&
            w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[397]++; if(dbg){print "Z397"}; continue };
    if ( basa(-3,"_pod_lock") &&
            q(-2,"suw_vi mest_vi mest_3e qast") &&
            w(-1,"под") && s(-3,-1) )
    { l[i]=omo2; Z[398]++; if(dbg){print "Z398"}; continue };
    if ( basa(-3,"_pod_lock") &&
            w(-2,"под") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo2; Z[399]++; if(dbg){print "Z399"}; continue };
    if ( w(-1,"под") &&
       bfa(1,3,"_pod_lock") && s(-1,bfn-1) )
    { l[i]=omo2; Z[400]++; if(dbg){print "Z400"}; continue };
    # _pod_lock:end

    cst="приидти прийти приходить";
    if ( base(-2,cst) &&
            w(-1,"под") && s(-2,-1) )
    { l[i]=omo1; Z[401]++; if(dbg){print "Z401"}; continue };
    if ( base(-3,cst) &&
            w(-2,"под") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[402]++; if(dbg){print "Z402"}; continue };
    if ( w(-1,"под") &&
        bf(1,3,cst) && s(-1,bfn-1) )
    { l[i]=omo1; Z[403]++; if(dbg){print "Z403"}; continue };
    if ( base(-4,cst) &&
            q(-3,"pre_da") &&
            q(-2,"mest_da suw_da") &&
            w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[404]++; if(dbg){print "Z404"}; continue };
    if ( base(-6,cst) &&
            q(-5,"suw_vi mest_vi mest_3e") &&
            q(-4,"nar_napr nar_spos") &&
            q(-3,"pre_da") &&
            q(-2,"mest_da suw_da") &&
            w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[405]++; if(dbg){print "Z405"}; continue };
    if ( base(-4,cst) &&
            q(-3,"pre_tv") &&
            q(-2,"mest_tv suw_tv") &&
            w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[406]++; if(dbg){print "Z406"}; continue };

    if ( w(-3,"в во") &&
         q(-2,"suw_vi") &&
         w(-1,"под") && s(-3,-1) )
    { l[i]=omo2; Z[407]++; if(dbg){print "Z407"}; continue };
    if ( w(-1,"под") &&
         w(1,"в во") &&
         q(2,"suw_vi") && s(-1,1) )
    { l[i]=omo2; Z[408]++; if(dbg){print "Z408"}; continue };

  }; # под замок

    if ( base(-2,"решить решение велеть приказать") &&
            w(-1,"демонтировать") && s(-2,-1) )
    { l[i]=omo1; Z[409]++; if(dbg){print "Z409"}; continue };

    cst2="владении власти распоряжении";
    if ( base(1,"быть находиться") &&
            w(2,"в во") &&
            q(3,"prl_pr prq_pr mest_pr mest_3e") &&
            q(4,"prl_pr prq_pr mest_pr mest_3e") &&
            w(5,cst2) && s(0,4) )
    { l[i]=omo1; Z[410]++; if(dbg){print "Z410"}; continue };
    if ( base(1,"быть находиться") &&
            w(2,"в во") &&
            q(3,"prl_pr prq_pr mest_pr mest_3e") &&
            w(4,cst2) && s(0,3) )
    { l[i]=omo1; Z[411]++; if(dbg){print "Z411"}; continue };


    cst1="поменять сменить";
    cst2="владелец имя название хозяин";
    if ( bf(1,5,cst1) && Qf(1,bfn-1,"sz_iili pre_any") &&
         bf(bfn+1,bfn+3,cst2) && s(0,bfn-1) )
    { l[i]=omo1; Z[412]++; if(dbg){print "Z412"}; continue };

    cst1="вырезать вырубать вырубить высекать высечь";
    cst2="гора камень скала";
    if ( bf(1,5,cst1) && Qf(1,bfn-1,"sz_iili pre_any") &&
          w(bfn+1,"в из") &&
         bf(bfn+2,bfn+4,cst2) && s(0,bfn-1) )
    { l[i]=omo1; Z[413]++; if(dbg){print "Z413"}; continue };

    cst1="брать взять";
    cst2="скрепить";
    if ( base(-1,cst1) &&
           (w(1,"и")||sc(0,",")) &&
           bf(2,4,cst2) &&
            q(bfn+1,"mest_tv suw_tv") && s(0,bfn-1) )
    { l[i]=omo2; Z[414]++; if(dbg){print "Z414"}; continue };

    cst1="держать";
    cst2="закрыть запереть открыть";
    if ( base(-2,cst1) &&
         base(-1,cst2) &&
       isname(1) && s(-2,0) )
    { l[i]=omo1; Z[415]++; if(dbg){print "Z415"}; continue };

    cst="передавать передать получить принять";
    if ( ( qxs(-1,"в","дар подарок наследство собственность распоряжение")||
           qxs(-1,"во","владение")||
           qxs(-1,"в","своё свое свои","владение владения")||
           qxs(-1,"под","управление")||
           qxs(-1,"под","своё свое","управление") ) && bb(xsn-4,xsn-1,cst) && s(bbn,xsn-1) )
    { l[i]=omo1; Z[416]++; if(dbg){print "Z416"}; continue };

    if ( base(1,"ходить") &&
         (qxs(2,"на","ушах")||
            w(2,"ходуном") ) && s(0,1) )
    { l[i]=omo1; Z[417]++; if(dbg){print "Z417"}; continue };
    if ( bb(-3,-1,"знать") && s(bbn,-1) &&
        qxs(1,"как","ваши наши свои","пять","пальцев") )
    { l[i]=omo1; Z[418]++; if(dbg){print "Z418"}; continue };

    if ( base(-3,"открывать открываться") &&
            w(-2,"перед") &&
            q(-1,"suw_tv mest_tv") && s(-3,-1) )
    { l[i]=omo1; Z[419]++; if(dbg){print "Z419"}; continue };

    cst="потянуть тянуть";
    if ( w(1,"не") &&
      base(2,cst) && s(0,1) )
    { l[i]=omo1; Z[420]++; if(dbg){print "Z420"}; continue };
    cst1="башня время сила стена";
    if ( base(1,cst) &&
         base(2,cst1) && s(0,1) )
    { l[i]=omo1; Z[421]++; if(dbg){print "Z421"}; continue };
    if ( q(1,"suw_da mest_da") &&
         w(2,"не") &&
      base(3,cst) && s(0,2) )
    { l[i]=omo1; Z[422]++; if(dbg){print "Z422"}; continue };
    if ( base(1,cst) &&
            q(2,"suw_ro mest_ro mest_3e") &&
            w(3,"к") && s(0,2) )
    { l[i]=omo1; Z[423]++; if(dbg){print "Z423"}; continue };
    if ( bf(1,5,cst) && Qf(1,bfn-1,"sz_iili pre_any") &&
          w(bfn+1,"из") &&
          q(bfn+2,"suw_ro mest_ro mest_3e") && s(0,bfn+1) )
    { l[i]=omo1; Z[424]++; if(dbg){print "Z424"}; continue };
    if ( bf(1,3,cst) && Qf(1,bfn-1,"sz_iili pre_any") &&
          q(bfn+1,"suw_vi mest_vi mest_3e") &&
          q(bfn+2,"nar_vrem nar_mest nar_napr prl_kred_sr") && s(0,bfn+1) )
    { l[i]=omo1; Z[425]++; if(dbg){print "Z425"}; continue };

    cst="затягивать затягиваться затянуть затянуться";
    cst1="дым дымка паутина пелена туман";
    if ( base(1,cst) &&
         base(2,cst1) && s(0,1) )
    { l[i]=omo1; Z[426]++; if(dbg){print "Z426"}; continue };

    cst="освободить освобождать";
    cst1="захватчик оккупант осада";
    if ( base(-1,cst) &&
            w(1,"от") &&
         base(2,cst1) && s(-1,1) )
    { l[i]=omo1; Z[427]++; if(dbg){print "Z427"}; continue };
    if ( base(-1,cst) &&
            w(1,"от") &&
            q(2,"prl_ro prq_ro") &&
         base(3,cst1) && s(-1,2) )
    { l[i]=omo1; Z[428]++; if(dbg){print "Z428"}; continue };

    cst="вырвать";
    if ( base(-1,cst) && s(-1) &&
        ( qxs(1,"из","цепких","лап рук")||
          qxs(1,"из","лап рук") ) )
    { l[i]=omo1; Z[429]++; if(dbg){print "Z429"}; continue };
    if ( base(-2,cst) &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-2,-1) &&
        ( qxs(1,"из","его ее её их ваших цепких","лап рук")||
          qxs(1,"из","лап рук") ) )
    { l[i]=omo1; Z[430]++; if(dbg){print "Z430"}; continue };

    cst="погружаться погрузиться";
    cst1="металл";
    if ( base(1,cst) &&
            w(2,"в во") &&
         base(3,cst1) && s(0,2) )
    { l[i]=omo2; Z[431]++; if(dbg){print "Z431"}; continue };

    cst="снести сносить";
    cst1="выстрелом молотом прикладом ударом";
    if ( base(-2,cst) &&
            w(-1,cst1) && s(-2,-1) )
    { l[i]=omo2; Z[432]++; if(dbg){print "Z432"}; continue };


    cst1="капитулировать сдаться";
    cst2="возня минута секунда";
    if ( base(-1,cst2) &&
         base(1,cst1) && s(-1,0) )
    { l[i]=omo2; Z[433]++; if(dbg){print "Z433"}; continue };
    if ( w(1,"через после") &&
        bf(2,5,cst2) &&
      base(bfn,cst1) && s(0,bfn) )
    { l[i]=omo2; Z[434]++; if(dbg){print "Z434"}; continue };
    if ( base(1,cst1) &&
            w(2,"через после") &&
           bf(3,6,cst2) && s(0,bfn-1) )
    { l[i]=omo2; Z[435]++; if(dbg){print "Z435"}; continue };
    if ( bf(1,3,"охватить охватывать") && s(0,bfn) &&
          w(bfn+1,"трубку трубу") && Qf(1,bfn-1,"sz_iili pre_any") )
    { l[i]=omo2; Z[436]++; if(dbg){print "Z436"}; continue };

    # _castle_pe:start
    # cst0
    if ( basa(-1,"_castle_pe") && s(-1) && Q(-1,"suw_any") )
    { l[i]=omo1; Z[437]++; if(dbg){print "Z437"}; continue };
    if ( basa(-3,"_castle_pe") && Q(-3,"suw_any") &&
            q(-2,"nar_mest") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[438]++; if(dbg){print "Z438"}; continue };
    if ( basa(-2,"_castle_pe") && Q(-2,"suw_any") &&
            q(-1,"nar_mest prl_vi prq_vi mest_vi mest_3e qast") && s(-2,-1) )
    { l[i]=omo1; Z[439]++; if(dbg){print "Z439"}; continue };
    if ( basa(-3,"_castle_pe") && s(-3) && Q(-3,"suw_any") &&
            q(-2,"prl_kred_sr") && se(-2,"-") &&
            q(-1,"prl_vi") && s(-1) )
    { l[i]=omo1; Z[440]++; if(dbg){print "Z440"}; continue };
    if ( basa(-2,"_castle_pe") && Q(-2,"suw_any") && !(basa(-3,"_lock_pe") && s(-3)) &&
            q(-1,"suw_tv") && s(-2,-1) )
    { l[i]=omo1; Z[441]++; if(dbg){print "Z441"}; continue };
    if ( basa(-3,"_castle_pe") && Q(-3,"suw_any") && !(basa(-4,"_lock_pe") && s(-3)) &&
            q(-2,"nar_mest prl_tv prq_tv mest_vi mest_3e qast") &&
            q(-1,"suw_tv") && s(-3,-1) )
    { l[i]=omo1; Z[442]++; if(dbg){print "Z442"}; continue };
    if ( basa(-4,"_castle_pe") && Q(-4,"suw_any") && !(basa(-5,"_lock_pe") && s(-3)) &&
            q(-3,"nar_mest prl_tv prq_tv mest_vi mest_3e qast") &&
            q(-2,"nar_mest prl_tv prq_tv mest_vi mest_3e qast") &&
            q(-1,"suw_tv") && s(-3,-1) )
    { l[i]=omo1; Z[443]++; if(dbg){print "Z443"}; continue };
    if ( basa(-3,"_castle_pe") && Q(-3,"suw_any") &&
            q(-2,"nar_mest prl_vi prq_vi mest_vi mest_3e qast") &&
            q(-1,"nar_mest prl_vi prq_vi mest_vi qast") && s(-3,-1) )
    { l[i]=omo1; Z[444]++; if(dbg){print "Z444"}; continue };
    if ( basa(-4,"_castle_pe") && Q(-4,"suw_any") &&
            q(-3,"nar_mest prl_vi prq_vi mest_vi mest_3e qast") &&
            q(-2,"nar_mest prl_vi prq_vi mest_vi mest_3e qast") &&
            q(-1,"nar_mest prl_vi prq_vi mest_vi qast") && s(-4,-1) )
    { l[i]=omo1; Z[445]++; if(dbg){print "Z445"}; continue };

    if ( bfa(1,3,"_castle_pe") && s(0,bfn-1) && Q(bfn,"suw_any") && Qf(1,bfn-1,"sz_iili pre_any") )
    { l[i]=omo1; Z[446]++; if(dbg){print "Z446"}; continue };
    if ( q(1,"mest_im suw_im") && s(0) &&
       qxs(2,"так","и","не") &&
      basa(xsn+1,_castle_pe) && Q(xsn+1,"suw_any") && s(xsn+1) )
    { l[i]=omo1; Z[447]++; if(dbg){print "Z447"}; continue };

    if ( basa(-3,"_castle_pe") && Q(-3,"suw_any") &&
       pre_vi(-2) &&
            q(-1,"suw_vi") && s(-3,-1) )
    { l[i]=omo1; Z[448]++; if(dbg){print "Z448"}; continue };
    if ( basa(-3,"_castle_pe") && Q(-3,"suw_any") &&
       pre_ro(-2) &&
            q(-1,"suw_ro") && s(-3,-1) )
    { l[i]=omo1; Z[449]++; if(dbg){print "Z449"}; continue };
    if ( basa(-4,"_castle_pe") && Q(-4,"suw_any") &&
       pre_ro(-3) &&
            q(-2,"prl_ro prq_ro mest_ro mest_3e") &&
            q(-1,"suw_ro") && s(-4,-1) )
    { l[i]=omo1; Z[450]++; if(dbg){print "Z450"}; continue };
    if ( basa(-3,"_castle_pe") && Q(-3,"suw_any") &&
       pre_tv(-2) &&
            q(-1,"suw_tv") && s(-3,-1) )
    { l[i]=omo1; Z[451]++; if(dbg){print "Z451"}; continue };
    if ( basa(-4,"_castle_pe") && Q(-4,"suw_any") &&
       pre_tv(-3) &&
            q(-2,"suw_tv") &&
            q(-1,"prl_ro prq_ro mest_ro mest_3e") && s(-4,-1) )
    { l[i]=omo1; Z[452]++; if(dbg){print "Z452"}; continue };
    if ( basa(-5,"_castle_pe") && Q(-5,"suw_any") &&
            q(-4,"prl_kred_sr qast") &&
       pre_tv(-3) &&
            q(-2,"suw_tv") &&
            q(-1,"prl_ro prq_ro mest_ro mest_3e") && s(-5,-1) )
    { l[i]=omo1; Z[453]++; if(dbg){print "Z453"}; continue };
    if ( basa(-4,"_castle_pe") && Q(-4,"suw_any") &&
       pre_tv(-3) &&
            q(-2,"prl_tv prq_tv mest_tv mest_3e") &&
            q(-1,"suw_tv") && s(-4,-1) )
    { l[i]=omo1; Z[454]++; if(dbg){print "Z454"}; continue };
    if ( basa(-3,"_castle_pe") && Q(-3,"suw_any") &&
       pre_pr(-2) &&
            q(-1,"suw_pr") && s(-3,-1) )
    { l[i]=omo1; Z[455]++; if(dbg){print "Z455"}; continue };
    if ( basa(-4,"_castle_pe") && Q(-4,"suw_any") &&
       pre_pr(-3) &&
            q(-2,"prl_pr prq_pr mest_pr mest_3e") &&
            q(-1,"suw_pr") && s(-4,-1) )
    { l[i]=omo1; Z[456]++; if(dbg){print "Z456"}; continue };
    if ( basa(-4,"_castle_pe") && Q(-4,"suw_any") &&
       pre_pr(-3) &&
            q(-2,"suw_pr") &&
            q(-1,"prl_edvi prq_edvi mest_vi mest_3e") && s(-4,-1) )
    { l[i]=omo1; Z[457]++; if(dbg){print "Z457"}; continue };
    if ( basa(-5,"_castle_pe") && Q(-5,"suw_any") &&
       pre_pr(-4) &&
            q(-3,"prl_pr prq_pr mest_pr mest_3e") &&
            q(-2,"suw_pr") &&
            q(-1,"prl_edvi prq_edvi mest_vi mest_3e") && s(-5,-1) )
    { l[i]=omo1; Z[458]++; if(dbg){print "Z458"}; continue };
    if ( basa(-6,"_castle_pe") && Q(-6,"suw_any") &&
       pre_ro(-5) &&
            q(-4,"prl_ro prq_ro mest_ro") && Q(-1,"suw_any") &&
       pre_pr(-3) &&
            q(-2,"suw_pr") &&
            q(-1,"prl_edvi prq_edvi mest_vi mest_3e") && s(-6,-1) )
    { l[i]=omo1; Z[459]++; if(dbg){print "Z459"}; continue };
    if ( basa(-7,"_castle_pe") && Q(-7,"suw_any") &&
       pre_ro(-6) &&
            q(-5,"prl_ro prq_ro mest_ro") &&
       pre_pr(-4) &&
            q(-3,"prl_pr prq_pr mest_pr mest_3e") &&
            q(-2,"suw_pr") &&
            q(-1,"prl_edvi prq_edvi mest_vi mest_3e") && s(-7,-1) )
    { l[i]=omo1; Z[460]++; if(dbg){print "Z460"}; continue };
    # _castle_pe:end ...

    # _lock_pe:start
    # cst9 -- замо́к
    if ( basa(-1,"_lock_pe") && s(-1) )
    { l[i]=omo2; Z[461]++; if(dbg){print "Z461"}; continue };
    if ( basa(-3,"_lock_pe") &&
            q(-2,"prl_vi prq_vi mest_vi mest_3e qast") &&
            q(-1,"prl_vi prq_vi mest_vi qast") && s(-3,-1) )
    { l[i]=omo2; Z[462]++; if(dbg){print "Z462"}; continue };
    if ( basa(-4,"_lock_pe") &&
            q(-3,"prl_vi prq_vi mest_vi mest_3e qast") &&
            q(-2,"prl_vi prq_vi mest_vi mest_3e qast") &&
            q(-1,"prl_vi prq_vi mest_vi qast") && s(-4,-1) )
    { l[i]=omo2; Z[463]++; if(dbg){print "Z463"}; continue };
    if ( basa(-2,"_lock_pe") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e qast nar_mest nar_cel nar_napr") && s(-2,-1) )
    { l[i]=omo2; Z[464]++; if(dbg){print "Z464"}; continue };
    if ( bfa(1,3,"_lock_pe") && s(0,bfn-1) && Qf(1,bfn-1,"sz_iili pre_any") )
    { l[i]=omo2; Z[465]++; if(dbg){print "Z465"}; continue };
    if ( basa(-3,"_lock_pe") &&
            q(-2,"prl_tv prq_tv mest_tv") &&
            q(-1,"suw_tv") && s(-3,-1) )
    { l[i]=omo2; Z[466]++; if(dbg){print "Z466"}; continue };
    if ( basa(-3,"_lock_pe") &&
            q(-2,"prq_vi") &&
            q(-1,"suw_tv") && s(-3,-1) )
    { l[i]=omo2; Z[467]++; if(dbg){print "Z467"}; continue };

    if ( basa(-3,"_lock_pe") &&
       pre_vi(-2) &&
            q(-1,"suw_vi mest_vi") && s(-3,-1) )
    { l[i]=omo2; Z[468]++; if(dbg){print "Z468"}; continue };
    if ( basa(-4,"_lock_pe") &&
       pre_vi(-3) &&
            q(-2,"prl_vi prq_vi mest_vi mest_3e") &&
            q(-1,"suw_vi mest_vi") && s(-4,-1) )
    { l[i]=omo2; Z[469]++; if(dbg){print "Z469"}; continue };
    if ( basa(-4,"_lock_pe") &&
       pre_vi(-3) &&
            q(-2,"prl_vi prq_vi mest_vi mest_3e") &&
            q(-1,"suw_vi mest_vi") && s(-4,-1) )
    { l[i]=omo2; Z[470]++; if(dbg){print "Z470"}; continue };
    if ( basa(-3,"_lock_pe") &&
       pre_tv(-2) &&
            q(-1,"suw_tv mest_tv") && s(-3,-1) )
    { l[i]=omo2; Z[471]++; if(dbg){print "Z471"}; continue };
    if ( basa(-3,"_lock_pe") &&
       pre_pr(-2) &&
            q(-1,"suw_pr mest_pr") && s(-3,-1) )
    { l[i]=omo2; Z[472]++; if(dbg){print "Z472"}; continue };
    # _lock_pe:end ...

    # _castle_prl_geo:start
    cst1="быть ведь же стать считаться являться";
    if ( prl_im(-1) &&
           basa(-1,"_castle_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[473]++; if(dbg){print "Z473"}; continue };
    if ( prl_im(-2) &&
           basa(-2,"_castle_prl_geo") &&
              Q(-1,"suw_any") && s(-2,-1)  )
    { l[i]=omo1; Z[474]++; if(dbg){print "Z474"}; continue };
    if ( prl_im(1) &&
           basa(1,"_castle_prl_geo") && s(0) && !(prl_ro(1)))
    { l[i]=omo1; Z[475]++; if(dbg){print "Z475"}; continue };
    if ( prl_im(1) &&
           base(1,cst1) &&
            bfa(2,5,"_castle_prl_geo") && s(0,bfn-1) && Qf(2,bfn-1,"pre_any sz_iili")  )
    { l[i]=omo1; Z[476]++; if(dbg){print "Z476"}; continue };
    # _castle_prl_geo:start


 }; # и.п. и в.п. замок замки

 ### замка замков р.п.
 if(iwrd=="замка" || iwrd=="замков") {
 #
    # _castle_prl:start
    if ( basa(-1,"_castle_prl") && prl_ro(-1) && s(-1)  )
    { l[i]=omo1; Z[477]++; if(dbg){print "Z477"}; continue };
    if ( basa(-2,"_castle_prl") && prl_ro(-2) &&
            q(-1,"prl_any prq_any mest_any qast") && s(-2,-1)  )
    { l[i]=omo1; Z[478]++; if(dbg){print "Z478"}; continue };
    if ( basa(-3,"_castle_prl") && prl_ro(-3) &&
            q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
            q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo1; Z[479]++; if(dbg){print "Z479"}; continue };
    if ( basa(1,"_castle_prl") && prl_ro(1) && s(0) )
    { l[i]=omo1; Z[480]++; if(dbg){print "Z480"}; continue };
    # _castle_prl:start

    # _lock_prl:start
    if ( basa(-1,"_lock_prl") && s(-1) && prl_ro(-1) )
    { l[i]=omo2; Z[481]++; if(dbg){print "Z481"}; continue };
    if ( basa(-2,"_lock_prl") && prl_ro(-2) &&
            Q(-1,"suw_any sz_iili") && s(-2,-1) )
    { l[i]=omo2; Z[482]++; if(dbg){print "Z482"}; continue };
    if ( basa(-3,"_lock_prl") && prl_ro(-3) &&
            q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
            q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo2; Z[483]++; if(dbg){print "Z483"}; continue };
    if ( basa(1,"_lock_prl") && s(0) && prl_ro(1) && !(isname(1)) )
    { l[i]=omo2; Z[484]++; if(dbg){print "Z484"}; continue };
    # _lock_prl:end

    # _castle_prl_geo:start
    if ( prl_ro(-1) &&
           basa(-1,"_castle_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[485]++; if(dbg){print "Z485"}; continue };
    if ( prl_ro(-2) &&
           basa(-2,"_castle_prl_geo") &&
              Q(-1,"suw_any") && s(-2,-1)  )
    { l[i]=omo1; Z[486]++; if(dbg){print "Z486"}; continue };
    if ( prl_ro(1) &&
           basa(1,"_castle_prl_geo") && s(0) && !(prl_ro(1)))
    { l[i]=omo1; Z[487]++; if(dbg){print "Z487"}; continue };
    # _castle_prl_geo:start

  }; # р.п. замка замков

 ### замком замками дат.п.
 if(iwrd=="замку" || iwrd=="замкам") {
 #
    # _castle_prl:start
    if ( basa(-1,"_castle_prl") && prl_da(-1) && s(-1)  )
    { l[i]=omo1; Z[488]++; if(dbg){print "Z488"}; continue };
    if ( basa(-2,"_castle_prl") && prl_da(-2) &&
            q(-1,"prl_any prq_any mest_any qast") && s(-2,-1)  )
    { l[i]=omo1; Z[489]++; if(dbg){print "Z489"}; continue };
    if ( basa(-3,"_castle_prl") && prl_da(-3) &&
            q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
            q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo1; Z[490]++; if(dbg){print "Z490"}; continue };
    if ( basa(1,"_castle_prl") && prl_da(1) && s(0) )
    { l[i]=omo1; Z[491]++; if(dbg){print "Z491"}; continue };
    # _castle_prl:start

    # _lock_prl:start
    if ( basa(-1,"_lock_prl") && s(-1) && prl_da(-1) )
    { l[i]=omo2; Z[492]++; if(dbg){print "Z492"}; continue };
    if ( basa(-2,"_lock_prl") && prl_da(-2) &&
            Q(-1,"suw_any sz_iili") && s(-2,-1) )
    { l[i]=omo2; Z[493]++; if(dbg){print "Z493"}; continue };
    if ( basa(-3,"_lock_prl") && prl_da(-3) &&
            q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
            q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo2; Z[494]++; if(dbg){print "Z494"}; continue };
    if ( basa(1,"_lock_prl") && s(0) && prl_da(1) && !(isname(1)) )
    { l[i]=omo2; Z[495]++; if(dbg){print "Z495"}; continue };
    # _lock_prl:end

    # _castle_prl_geo:start
    if ( prl_da(-1) &&
           basa(-1,"_castle_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[496]++; if(dbg){print "Z496"}; continue };
    if ( prl_da(-2) &&
           basa(-2,"_castle_prl_geo") &&
              Q(-1,"suw_any") && s(-2,-1)  )
    { l[i]=omo1; Z[497]++; if(dbg){print "Z497"}; continue };
    if ( prl_da(1) &&
           basa(1,"_castle_prl_geo") && s(0) && !(prl_da(1)))
    { l[i]=omo1; Z[498]++; if(dbg){print "Z498"}; continue };
    # _castle_prl_geo:start

  }; # дат.п. замку замкам


 ### замком замками тв.п.
 if(iwrd=="замком" || iwrd=="замками") {
 #
    # _castle_prl:start
    if ( basa(-1,"_castle_prl") && prl_tv(-1) && s(-1)  )
    { l[i]=omo1; Z[499]++; if(dbg){print "Z499"}; continue };
    if ( basa(-2,"_castle_prl") && prl_tv(-2) &&
            q(-1,"prl_any prq_any mest_any qast") && s(-2,-1)  )
    { l[i]=omo1; Z[500]++; if(dbg){print "Z500"}; continue };
    if ( basa(-3,"_castle_prl") && prl_tv(-3) &&
            q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
            q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo1; Z[501]++; if(dbg){print "Z501"}; continue };
    if ( basa(1,"_castle_prl") && prl_tv(1) && s(0) )
    { l[i]=omo1; Z[502]++; if(dbg){print "Z502"}; continue };
    # _castle_prl:start

    # _lock_prl:start
    if ( basa(-1,"_lock_prl") && s(-1) && prl_tv(-1) )
    { l[i]=omo2; Z[503]++; if(dbg){print "Z503"}; continue };
    if ( basa(-2,"_lock_prl") && prl_tv(-2) &&
            Q(-1,"suw_any sz_iili") && s(-2,-1) )
    { l[i]=omo2; Z[504]++; if(dbg){print "Z504"}; continue };
    if ( basa(-3,"_lock_prl") && prl_tv(-3) &&
            q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
            q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo2; Z[505]++; if(dbg){print "Z505"}; continue };
    if ( basa(1,"_lock_prl") && s(0) && prl_tv(1) && !(isname(1)) )
    { l[i]=omo2; Z[506]++; if(dbg){print "Z506"}; continue };
    # _lock_prl:end

    # _castle_prl_geo:start
    if ( prl_tv(-1) &&
           basa(-1,"_castle_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[507]++; if(dbg){print "Z507"}; continue };
    if ( prl_tv(-2) &&
           basa(-2,"_castle_prl_geo") &&
              Q(-1,"suw_any") && s(-2,-1)  )
    { l[i]=omo1; Z[508]++; if(dbg){print "Z508"}; continue };
    if ( prl_tv(1) &&
           basa(1,"_castle_prl_geo") && s(0) && !(prl_tv(1)))
    { l[i]=omo1; Z[509]++; if(dbg){print "Z509"}; continue };
    # _castle_prl_geo:start

  }; # тв.п. замком замками

 ### замке замках пр.п.
 if(iwrd=="замке" || iwrd=="замках") {
 #
    # _castle_prl:start
    if ( basa(-1,"_castle_prl") && prl_da(-1) && s(-1)  )
    { l[i]=omo1; Z[510]++; if(dbg){print "Z510"}; continue };
    if ( basa(-2,"_castle_prl") && prl_da(-2) &&
            q(-1,"prl_any prq_any mest_any qast") && s(-2,-1)  )
    { l[i]=omo1; Z[511]++; if(dbg){print "Z511"}; continue };
    if ( basa(-3,"_castle_prl") && prl_da(-3) &&
            q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
            q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo1; Z[512]++; if(dbg){print "Z512"}; continue };
    if ( basa(1,"_castle_prl") && prl_da(1) && s(0) )
    { l[i]=omo1; Z[513]++; if(dbg){print "Z513"}; continue };
    # _castle_prl:start

    # _lock_prl:start
    if ( basa(-1,"_lock_prl") && s(-1) && prl_da(-1) )
    { l[i]=omo2; Z[514]++; if(dbg){print "Z514"}; continue };
    if ( basa(-2,"_lock_prl") && prl_da(-2) &&
            Q(-1,"suw_any sz_iili") && s(-2,-1) )
    { l[i]=omo2; Z[515]++; if(dbg){print "Z515"}; continue };
    if ( basa(-3,"_lock_prl") && prl_da(-3) &&
            q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
            q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo2; Z[516]++; if(dbg){print "Z516"}; continue };
    if ( basa(1,"_lock_prl") && s(0) && prl_da(1) && !(isname(1)) )
    { l[i]=omo2; Z[517]++; if(dbg){print "Z517"}; continue };
    # _lock_prl:end

    # _castle_prl_geo:start
    if ( prl_da(-1) &&
           basa(-1,"_castle_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[518]++; if(dbg){print "Z518"}; continue };
    if ( prl_da(-2) &&
           basa(-2,"_castle_prl_geo") &&
              Q(-1,"suw_any") && s(-2,-1)  )
    { l[i]=omo1; Z[519]++; if(dbg){print "Z519"}; continue };
    if ( prl_da(1) &&
           basa(1,"_castle_prl_geo") && s(0) && !(prl_da(1)))
    { l[i]=omo1; Z[520]++; if(dbg){print "Z520"}; continue };
    # _castle_prl_geo:start

  }; # пр.п. замке замках


  # _castle_pe:start
 # _lock_pe:start
 cst="ручка";
 if ( qxs(-1,"как","и") &&
     base(xsn-1,cst) && sc(xsn-1,",") &&
     basa(1,"_castle_pe") && Q(1,"suw_any") )
 { l[i]=omo2; Z[521]++; if(dbg){print "Z521"}; continue };
 if ( sc(0,",") && q(1,"prq_any") && basa(1,"_castle_pe") && s(1) && Q(1,"suw_any") )
 { l[i]=omo1; Z[522]++; if(dbg){print "Z522"}; continue };
 if ( sc(0,",") &&
       q(1,"nar_spos prl_kred_sr") &&
       q(2,"prq_any") && basa(2,"_castle_pe") && s(1,2) && Q(-1,"suw_any") )
 { l[i]=omo1; Z[523]++; if(dbg){print "Z523"}; continue };
 if ( sc(0,",") && q(1,"prq_any") && basa(1,"_lock_pe") && s(1) )
 { l[i]=omo2; Z[524]++; if(dbg){print "Z524"}; continue };
 if ( q(-1,"prq_any") && basa(-1,"_castle_pe") && s(-1) && Q(-1,"suw_any") )
 { l[i]=omo1; Z[525]++; if(dbg){print "Z525"}; continue };
 if ( q(-1,"prq_any") && basa(-1,"_lock_pe") && s(-1) )
 { l[i]=omo2; Z[526]++; if(dbg){print "Z526"}; continue };
 if ( q(-3,"prq_any") && basa(-3,"_castle_pe") && Q(-3,"suw_any") &&
 pre_ro(-2) &&
      q(-1,"suw_ro") && s(-3,-1) )
 { l[i]=omo1; Z[527]++; if(dbg){print "Z527"}; continue };
 if ( q(-4,"prq_any") && basa(-4,"_castle_pe") && Q(-4,"suw_any") &&
 pre_ro(-3) &&
      q(-2,"prl_ro") &&
      q(-1,"suw_ro") && s(-4,-1) )
 { l[i]=omo1; Z[528]++; if(dbg){print "Z528"}; continue };
 # _castle_pe:start
 # _lock_pe:end

 # _castle_suw_ro:start
 if ( wfa(1,4,"_castle_suw_ro") && s(0,wfn-1) && Qf(1,wfn-1,"pre_any sz_iili") && Ww_(-1,"под") )
 { l[i]=omo1; Z[529]++; if(dbg){print "Z529"}; continue };

 if ( w(1,"для") &&
     wa(2,"_castle_suw_ro2") && s(0,1) )
 { l[i]=omo1; Z[530]++; if(dbg){print "Z530"}; continue };
 if ( w(1,"для") &&
      q(2,"prl_ro prq_ro mest_ro mest_3e") &&
     wa(3,"_castle_suw_ro2") && s(0,2) && qsb(-10,-1,",") && !(base(qsn,"дверь люк")) )
 { l[i]=omo1; Z[531]++; if(dbg){print "Z531"}; continue };
 if ( w(1,"для") &&
      q(2,"prl_ro prq_ro mest_ro mest_3e") &&
      q(3,"prl_ro prq_ro mest_ro mest_3e") &&
     wa(4,"_castle_suw_ro2") && s(0,3) )
 { l[i]=omo1; Z[532]++; if(dbg){print "Z532"}; continue };
 # _castle_suw_ro:end

 # _lock_suw_ro:start
 if ( wfa(1,5,"_lock_suw_ro") && s(0,wfn-1) && Qf(1,wfn-1,"sz_iili pre_any gl_in deep gl_ed gl_mn gl_vzed gl_vzmn") && !(bb(-3,-1,"знать")) )
 { l[i]=omo2; Z[533]++; if(dbg){print "Z533"}; continue };
 if ( w(1,"для") &&
     wa(2,"_lock_suw_ro") && s(0,1) )
 { l[i]=omo2; Z[534]++; if(dbg){print "Z534"}; continue };
 if ( w(1,"для") &&
      q(2,"prl_ro prq_ro mest_ro mest_3e") &&
     wa(3,"_lock_suw_ro") && s(0,2) )
 { l[i]=omo2; Z[535]++; if(dbg){print "Z535"}; continue };
 if ( w(1,"для") &&
      q(2,"prl_ro prq_ro mest_ro mest_3e") &&
      q(3,"prl_ro prq_ro mest_ro mest_3e") &&
     wa(4,"_lock_suw_ro") && s(0,3) )
 { l[i]=omo2; Z[536]++; if(dbg){print "Z536"}; continue };
 # _lock_suw_ro:end


 if ( isname(1) && s(0) )
 { l[i]=omo1; Z[537]++; if(dbg){print "Z537"}; continue };
 if ( w(1,"де дю фон ди да дель ле лё") &&
 isname(2) && s(0,1) )
 { l[i]=omo1; Z[538]++; if(dbg){print "Z538"}; continue };
 if ( w(1,"д л") && sc(1,"[\x27’]") &&
 isname(2) && s(0) )
 { l[i]=omo1; Z[539]++; if(dbg){print "Z539"}; continue };
 if ( q(1,"pre_vi pre_ro pre_pr") &&
 isname(2) && s(0,1) && !(bb(-4,-1,"ключ ключик")) )
 { l[i]=omo1; Z[540]++; if(dbg){print "Z540"}; continue };
 if ( isname(-1) && ( (s(-2,-1) && sv(-2,")"))||(sc(-2,",") && s(-1)) ) )
 { l[i]=omo1; Z[541]++; if(dbg){print "Z541"}; continue };
 if ( isname(0) && s(-1) )
 { l[i]=omo1; Z[542]++; if(dbg){print "Z542"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

};
