# Правила для всех форм слова
# let @a=1|%s/"Z\zs\d\+\ze"/\=''.(@a+setreg('a',@a+1))/g|%s/ Z\[\zs\d\+\ze\]++; if(dbg){print "Z\(\d\+\)"/\1/g
#  x4707 castle_    lock_   замок  за́мок  замо́к
#  замка  замкам  замками  замках  замке  замки  замков  замком  замку  замок

function ZAMOK_F() { # <<< правила находятся в файле zamok.awk

xgrp="x4707";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2

## собрать слова
#cst1="ие ий им ими их ого ом ому";
#if ( jme(-1,"ск",cst1) && isname(-1) )
#{ print l[i-1] >> "_prl_a.txt"; Z[1]++; if(dbg){print "Z1"}; }; continue
#if ( w(0,"замок") && wb(-4,-1,"в во") && s(wbn,-1) && qif(wbn+1,-1,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi qast") )
#{ print book[b]; Z[2]++; if(dbg){print "Z2"}; }; continue
#{ print book[b] >> "_va_zamok.txt"; Z[3]++; if(dbg){print "Z3"}; }; continue
#{ getBFx(-2,-2,"_glo.txt"); Z[4]++; if(dbg){print "Z4"}; }; continue
#if ( w(1,"между") &&
#     q(2,"suw_tv") && s(0,1) && Q(2,"prl_tv")  )
#{ print l[i+2] >> "_ss_tv.txt"; Z[5]++; if(dbg){print "Z5"}; }; continue
#if ( w(1,"между") &&
#     q(2,"prl_tv prq_tv mest_tv mest_3e") &&
#     q(3,"suw_tv") && s(0,2) && Q(3,"prl_tv")  )
#{ print l[i+3] >> "_ss_tv.txt"; Z[6]++; if(dbg){print "Z6"}; }; continue
#if ( w(1,"между") &&
#     q(2,"prl_tv prq_tv mest_tv mest_3e") &&
#     q(3,"prl_tv prq_tv mest_tv mest_3e") &&
#     q(4,"suw_tv") && s(0,3) && Q(4,"prl_tv")  )
#{ print l[i+4] >> "_ss_tv.txt"; Z[7]++; if(dbg){print "Z7"}; }; continue
#{ print l[i+1] >> "_sw.txt"; Z[8]++; if(dbg){print "Z8"}; }; continue

#getBFx(-3,3,"_an.txt"); Z[9]++; if(dbg){print "Z9"}; continue

 ### ALL
 cst="блокировать";
 cst1="армия взвод дивизия отряд полк рота";
 if ( base(-1,cst) &&
      base(1,cst1) && s(-1,0) )
 { l[i]=omo1; Z[10]++; if(dbg){print "Z10"}; continue };
 if ( base(-2,cst1) && z(-2) &&
   prq_any(-1) && base(-1,cst) && s(-1) )
 { l[i]=omo1; Z[11]++; if(dbg){print "Z11"}; continue };
 if ( base(-3,cst1) &&
         q(-2,"suw_ro isname") && z(-2) &&
   prq_any(-1) && base(-1,cst) && s(-1) )
 { l[i]=omo1; Z[12]++; if(dbg){print "Z12"}; continue };

 if ( qxs(-1,"замок","или","даже") )
 { l[i]=omo1; Z[13]++; if(dbg){print "Z13"}; continue };
 if ( qxs(1,"или","даже","замок") )
 { l[i]=omo2; Z[14]++; if(dbg){print "Z14"}; continue };


 cst="блокировать опечатать сканировать";
#if ( prq_any(-1) && ba(-1,"_lock_pe") && s(-1) )
 if ( prq_any(-1) && base(-1,cst) && s(-1) )
 { l[i]=omo2; Z[15]++; if(dbg){print "Z15"}; continue };

 cst="завернуть";
 if ( prq_any(-3) && base(-3,cst) &&
            q(-2,"pre_vi") &&
            q(-1,"suw_vi") && s(-3,-1) )
 { l[i]=omo2; Z[16]++; if(dbg){print "Z16"}; continue };

 cst="[иотх]летн[еи] башенн[оы] комнатн[оы] метров[оы] саженн[оы] стенн[оы] уровнев[оы] этажн[оы] ярусн[оы]";
 if ( wc(-1,cst) && s(-1) )
 { l[i]=omo1; Z[17]++; if(dbg){print "Z17"}; continue };

 cst="бергск боргск бургск вилльск вильск городск гофск градск дорфск стонск стоунск таунск штадтск";
 cst1="ие ий им ими их ого ом ому";
 if ( jme(-1,cst,cst1) && s(-1) )
 { l[i]=omo1; Z[18]++; if(dbg){print "Z18"}; continue };

#cst="ие ий им ими их ого ом ому";
#if ( wma(-1,"_castle_geo_nodic",cst) && s(-1) )
#{ l[i]=omo1; Z[19]++; if(dbg){print "Z19"}; continue };

 cst="дюймов[оы] засовн[оы] значн[оы] копеечн[оы] пружинн[оы] пудов[оы] сувальдн[оы] точечн[оы] цилиндров[оы] штифтов[оы] штырьков[оы]";
 if ( wc(-1,cst) && s(-1) )
 { l[i]=omo2; Z[20]++; if(dbg){print "Z20"}; continue };

 cst="дюжин дюжины сотени сотни тысяч тысячи";
 if ( w(1,cst) &&
      q(2,"suw_mnro") && s(0,1) )
 { l[i]=omo1; Z[21]++; if(dbg){print "Z21"}; continue };

 cst="брать взять";
 if ( base(-3,cst) &&
         q(-2,"qast") &&
         w(-1,"приступом штурмом") && s(-3,-1) )
 { l[i]=omo1; Z[22]++; if(dbg){print "Z22"}; continue };
 if ( qxs(-1,"на","себя") &&
     base(xsn-1,cst) && s(xsn-1) )
 { l[i]=omo1; Z[23]++; if(dbg){print "Z23"}; continue };

 cst="выглядеть казаться оказаться показаться представлять";
 if ( q(-1,"nar_mest nar_napr") &&
     bf(1,3,cst) && s(-1,bfn-1) )
 { l[i]=omo1; Z[24]++; if(dbg){print "Z24"}; continue };

 if ( qxs(1,"средней","руки") )
 { l[i]=omo1; Z[25]++; if(dbg){print "Z25"}; continue };
 if ( qxw(-1,"да","ну","его") && z(-1) )
 { l[i]=omo1; Z[26]++; if(dbg){print "Z26"}; continue };

 # _castlelike_things:start
 if ( z(0) &&
   (qxw(1,"а но","не и")||
    qxw(1,"а но","также","и")||
    qxw(1,"так","и") ) &&
     ba(xwn+1,"_castlelike_things") && s(xwn) )
 { l[i]=omo1; Z[27]++; if(dbg){print "Z27"}; continue };
 if ( z(0) &&
   (qxw(1,"а но","не и")||
    qxw(1,"а но","также","и")||
    qxw(1,"так","и") ) &&
      q(xwn+1,"prl_any prq_any nar_any") &&
     ba(xwn+2,"_castlelike_things") && s(1,xwn+1) )
 { l[i]=omo1; Z[28]++; if(dbg){print "Z28"}; continue };
 if ( qxs(-1,"а но","не и") &&
       ba(xsn-1,"_castlelike_things") && sc(xsn-1,",") )
 { l[i]=omo1; Z[29]++; if(dbg){print "Z29"}; continue };
 if ( mest_it(-2) &&
            w(-1,"не") && s(-2,-1) &&
            z(0) &&
      mest_it(1) &&
            w(2,"не") &&
           ba(3,"_castlelike_things") && s(1,2) )
 { l[i]=omo1; Z[30]++; if(dbg){print "Z30"}; continue };
 if ( mest_it(-2) &&
            w(-1,"не") && s(-2,-1) &&
            z(0) &&
      mest_it(1) &&
            w(2,"не") &&
            q(3,"prl_any prq_any nar_any") &&
           ba(4,"_castlelike_things") && s(1,3) )
 { l[i]=omo1; Z[31]++; if(dbg){print "Z31"}; continue };
 if ( q(-1,"prl_any prq_any nar_any") &&
sz_iili(1) &&
      q(2,"prl_any prq_any nar_any") &&
     ba(3,"_castlelike_things") && s(-1,2) )
 { l[i]=omo1; Z[32]++; if(dbg){print "Z32"}; continue };
 if ( q(1,"prl_srav nar_srav") &&
    bfa(2,4,"_castlelike_things") && s(0,bfn-1) && qif(2,bfn-1,"prl_ro mest_ro mest_3e prq_ro nar_any qast") )
 { l[i]=omo1; Z[33]++; if(dbg){print "Z33"}; continue };
 if ( q(1,"prl_kred nar_any qast") &&
      q(2,"prl_srav nar_srav") &&
    bfa(3,5,"_castlelike_things") && s(0,bfn-1) && qif(3,bfn-1,"prl_ro mest_ro mest_3e prq_ro nar_any qast") )
 { l[i]=omo1; Z[34]++; if(dbg){print "Z34"}; continue };

 # ни … ни
 if ( w(-2,"ни") &&
      q(-1,"prl_any mest_any prq_any") &&
sz_iili(1) &&
      w(2,"ни") &&
      q(3,"prl_any mest_any prq_any") &&
     ba(4,"_castlelike_things") && s(-2,3) )
 { l[i]=omo1; Z[35]++; if(dbg){print "Z35"}; continue };
 if ( w(-1,"ни") && z(0) && s(-1) &&
      w(1,"ни") &&
     ba(2,"_castlelike_things") && s(1) )
 { l[i]=omo1; Z[36]++; if(dbg){print "Z36"}; continue };

 # дефис
 if ( sc(0,"-") && ba(1,"_castlelike_things") )
 { l[i]=omo1; Z[37]++; if(dbg){print "Z37"}; continue };
 if ( sc(-1,"-") && ba(-1,"_castlelike_things") )
 { l[i]=omo1; Z[38]++; if(dbg){print "Z38"}; continue };

 # —
 if ( sc(0,"—") && ba(1,"_castlelike_things") )
 { l[i]=omo1; Z[39]++; if(dbg){print "Z39"}; continue };
 if ( sc(0,"—") &&
       q(1,"mest_it") &&
      ba(2,"_castlelike_things") && s(1) )
 { l[i]=omo1; Z[40]++; if(dbg){print "Z40"}; continue };

 # превращать
 cst="превратить превратиться превращать превращаться";
 if ( base(-1,cst) &&
         w(1,"в") &&
       bfa(2,5,"_castlelike_things") && s(-1,bfn) && Qf(2,bfn-1,"sz_iili pre_any") )
 { l[i]=omo1; Z[41]++; if(dbg){print "Z41"}; continue };
 if ( base(1,cst) &&
         w(2,"в") &&
       bfa(3,6,"_castlelike_things") && s(0,bfn) && Qf(3,bfn-1,"sz_iili pre_any") )
 { l[i]=omo1; Z[42]++; if(dbg){print "Z42"}; continue };
 if ( ba(-3,"_castlelike_things") &&
    base(-2,cst) &&
       w(-1,"в") && s(-3,-1) )
 { l[i]=omo1; Z[43]++; if(dbg){print "Z43"}; continue };

 cst="напоминать";
 if ( ba(-4,"_castlelike_things") && z(-4) &&
       q(-3,"prl_kred_sr") &&
    base(-2,cst) &&
       q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
 { l[i]=omo1; Z[44]++; if(dbg){print "Z44"}; continue };
 if ( ba(-3,"_castlelike_things") && z(-3) &&
    base(-2,cst) &&
       q(-1,"prl_vi mest_vi mest_3e") && s(-2,-1) )
 { l[i]=omo1; Z[45]++; if(dbg){print "Z45"}; continue };
 if ( ba(-2,"_castlelike_things") && z(-2) &&
    base(-1,cst) && s(-1) )
 { l[i]=omo1; Z[46]++; if(dbg){print "Z46"}; continue };
 # _castlelike_things:end

 # _castle_environs:start
 # escapes
 if ( sc(0,"[— ]") &&
    base(1,"вынести") &&
    (qxw(2,"с со") ||
     qxw(2,"вместе","с со")) &&
       w(xwn+1,"дверью дверями воротами") && s(1,xwn) )
 { l[i]=omo2; Z[47]++; if(dbg){print "Z47"}; continue };
 cst="багажник канаву корзинку кусты сумку";
 if ( base(-1,"забросить бросить") &&
         w(1,"в") &&
         w(2,cst) && s(-1,1) )
 { l[i]=omo2; Z[48]++; if(dbg){print "Z48"}; continue };
 if ( base(-1,"забросить бросить") &&
         w(1,"в") &&
         q(2,"prl_vi prq_vi") &&
         w(3,cst) && s(-1,2) )
 { l[i]=omo2; Z[49]++; if(dbg){print "Z49"}; continue };

 #
 if ( q(1,"sz_iili") &&
     ba(2,"_castle_environs") && s(0,1) )
 { l[i]=omo1; Z[50]++; if(dbg){print "Z50"}; continue };
 if ( q(1,"sz_iili") &&
      w(2,"даже же не ни") &&
     ba(3,"_castle_environs") && s(0,2) )
 { l[i]=omo1; Z[51]++; if(dbg){print "Z51"}; continue };
 if ( ba(-2,"_castle_environs") &&
       q(-1,"sz_iili") && s(-2,-1) )
 { l[i]=omo1; Z[52]++; if(dbg){print "Z52"}; continue };
 if ( ba(-3,"_castle_environs") &&
       q(-2,"sz_iili") &&
       w(-1,"даже же не ни") && s(-3,-1) )
 { l[i]=omo1; Z[53]++; if(dbg){print "Z53"}; continue };
 if ( ba(-3,"_castle_environs") &&
       q(-2,"sz_iili") &&
       q(-1,"prl_any prq_any mest_any") && s(-3,-1) )
 { l[i]=omo1; Z[54]++; if(dbg){print "Z54"}; continue };
 if ( z(-1) && ba(-1,"_castle_environs") )
 { l[i]=omo1; Z[55]++; if(dbg){print "Z55"}; continue };
 if ( z(0) && ba(1,"_castle_environs") )
 { l[i]=omo1; Z[56]++; if(dbg){print "Z56"}; continue };
 if ( qq(-1,1) && z(0) && s(-1) &&
      ba(2,"_castle_environs") && s(1) )
 { l[i]=omo1; Z[57]++; if(dbg){print "Z57"}; continue };
 if ( qq(-1,2) && qq(-2,1) && z(0) && s(-2,-1) &&
      ba(3,"_castle_environs") && s(1,2) )
 { l[i]=omo1; Z[58]++; if(dbg){print "Z58"}; continue };
 if ( qq(-1,1) && z(0) && s(-1) &&
       q(2,"prl_any mest_any prq_any nar_any") &&
      ba(3,"_castle_environs") && s(1,2) )
 { l[i]=omo1; Z[59]++; if(dbg){print "Z59"}; continue };
 if ( qq(-1,2) && z(0) && s(-1) &&
       w(1,"а но однако") &&
       q(3,"prl_any mest_any prq_any nar_any") &&
      ba(4,"_castle_environs") && s(1,3) )
 { l[i]=omo1; Z[60]++; if(dbg){print "Z60"}; continue };
 if ( ba(-3,"_castle_environs") &&
 sz_iili(-2) &&
      qq(-4,-1) && s(-4,-1) )
 { l[i]=omo1; Z[61]++; if(dbg){print "Z61"}; continue };
 if ( q(-4,"prl_any mest_any prq_any") &&
     ba(-3,"_castle_environs") &&
sz_iili(-2) &&
     qq(-5,-1) && s(-5,-1) )
 { l[i]=omo1; Z[62]++; if(dbg){print "Z62"}; continue };
 if ( ba(-4,"_castle_environs") &&
 sz_iili(-3) &&
       q(-1,"prl_any mest_any prq_any") &&
      qq(-5,-2) && s(-5,-1) )
 { l[i]=omo1; Z[63]++; if(dbg){print "Z63"}; continue };
 if ( qq(-1,1) && z(0) && s(-1) &&
       q(2,"prl_any") &&
      ba(3,"_castle_environs") && s(1,2) )
 { l[i]=omo1; Z[64]++; if(dbg){print "Z64"}; continue };
 if ( pre_vi(-1) && s(-1) && z(0) &&
      pre_vi(1) && W(1,"на под") &&
          ba(2,"_castle_environs") && qq(-1,1) && s(1) )
 { l[i]=omo1; Z[65]++; if(dbg){print "Z65"}; continue };
 if ( pre_vi(-3) && s(-3) && z(-2) && W(-3,"на под") &&
          ba(-2,"_castle_environs") &&
      pre_vi(-1) && qq(-3,-1) && s(-1) )
 { l[i]=omo1; Z[66]++; if(dbg){print "Z66"}; continue };
 if ( qxs(-1,"не","только") && z(0) &&
        w(1,"а но") &&
        w(2,"и") &&
        q(3,"prl_im prq_im") &&
       ba(4,"_castle_environs") && s(1,3) )
 { l[i]=omo1; Z[67]++; if(dbg){print "Z67"}; continue };
 if ( ba(-3,"_castle_environs") && s(-3) &&
       q(-2,"suw_ro mest_ro isname") && sc(-2,"—") &&
       q(-1,"suw_ro mest_ro isname") && s(-1) )
 { l[i]=omo1; Z[68]++; if(dbg){print "Z68"}; continue };
 # _castle_environs:end

 # _locklike_hyphens:start
 if ( sc(-1,"-") && ba(-1,"_locklike_hyphens") )
 { l[i]=omo2; Z[69]++; if(dbg){print "Z69"}; continue };
 if ( sc(0,"-") && ba(1,"_locklike_hyphens") )
 { l[i]=omo2; Z[70]++; if(dbg){print "Z70"}; continue };
 if ( sc(-1,"-") && wa(-1,"_locklike_acro") )
 { l[i]=omo2; Z[71]++; if(dbg){print "Z71"}; continue };
 if ( sc(0,"-") && wa(1,"_locklike_acro") )
 { l[i]=omo2; Z[72]++; if(dbg){print "Z72"}; continue };
 # _locklike_hyphens:start

 # _locklike_things:start
 if ( q(1,"sz_iili") &&
     ba(2,"_locklike_things") && s(0,1) )
 { l[i]=omo2; Z[73]++; if(dbg){print "Z73"}; continue };
 if ( qq(-1,2) &&
       q(1,"sz_iili") &&
      ba(3,"_locklike_things") && s(0,1) )
 { l[i]=omo2; Z[74]++; if(dbg){print "Z74"}; continue };
 if ( qq(-4,-1) &&
       q(-2,"sz_iili") &&
      ba(-3,"_locklike_things") && s(0,1) )
 { l[i]=omo2; Z[75]++; if(dbg){print "Z75"}; continue };
 if ( q(1,"sz_iili") &&
      q(2,"prl_any mest_any prq_any") &&
     ba(3,"_locklike_things") && s(0,2) )
 { l[i]=omo2; Z[76]++; if(dbg){print "Z76"}; continue };
 if ( ba(-2,"_locklike_things") && zs(-2) &&
       q(-1,"sz_iili") && s(-1) && !(bfa(1,3,"_castle_pe") && s(0,bfn-1)) )
 { l[i]=omo2; Z[77]++; if(dbg){print "Z77"}; continue };
 if ( ba(-3,"_locklike_things") && s(-3) &&
       q(-2,"prl_any mest_any prq_any") && zs(-2) &&
       q(-1,"sz_iili") && s(-1) && !(bfa(1,3,"_castle_pe") && s(0,bfn-1)) )
 { l[i]=omo2; Z[78]++; if(dbg){print "Z78"}; continue };
 if ( z(-1) && ba(-1,"_locklike_things") && !(isname(1) && base(1,"люк")) )
 { l[i]=omo2; Z[79]++; if(dbg){print "Z79"}; continue };
 if ( z(0) && ba(1,"_locklike_things") && !(isname(1) && base(1,"люк")) )
 { l[i]=omo2; Z[80]++; if(dbg){print "Z80"}; continue };
 # ни … ни
 if ( w(-2,"ни") &&
      q(-1,"prl_any mest_any prq_any") &&
sz_iili(1) &&
      w(2,"ни") &&
      q(3,"prl_any mest_any prq_any") &&
     ba(4,"_locklike_things") && s(-2,3) )
 { l[i]=omo2; Z[81]++; if(dbg){print "Z81"}; continue };
 if ( w(-1,"ни") && z(0) && s(-1) &&
      w(1,"ни") &&
     ba(2,"_locklike_things") && s(1) )
 { l[i]=omo2; Z[82]++; if(dbg){print "Z82"}; continue };
 # _locklike_things:end

 # _castle_v_suw_pr:start
 if ( w(1,"в во") &&
    wfa(2,5,"_castle_v_suw_pr") && s(0,wfn-1) && Qf(2,wfn-1,"sz_iili pre_any") )
 { l[i]=omo1; Z[83]++; if(dbg){print "Z83"}; continue };
 # _castle_v_suw_pr:end

 # _lock_v_suw_pr:start
 if ( w(1,"в во на") &&
    wfa(2,5,"_lock_v_suw_pr") && s(0,wfn-1) && qif(3,wfn-1,"prl_pr prq_pr mest_pr mest_3e qast") )
 { l[i]=omo2; Z[84]++; if(dbg){print "Z84"}; continue };
 if ( q(1,"qast") &&
      w(2,"в во на") &&
    wfa(3,6,"_lock_v_suw_pr") && s(0,wfn-1) && qif(3,wfn-1,"prl_pr prq_pr mest_pr mest_3e qast") )
 { l[i]=omo2; Z[85]++; if(dbg){print "Z85"}; continue };
 if ( w(-2,"в во на") &&
     wa(-1,"_lock_v_suw_pr") && s(-2,-1) )
 { l[i]=omo2; Z[86]++; if(dbg){print "Z86"}; continue };
 if ( w(-3,"в во на") &&
      q(-2,"prl_pr prq_pr") &&
     wa(-1,"_lock_v_suw_pr") && s(-3,-1) && sv(-1,"\\(") )
 { l[i]=omo2; Z[87]++; if(dbg){print "Z87"}; continue };
 # _lock_v_suw_pr:end

 # _castle_pod_suw_ro:start
 if ( w(1,"под") &&
    wfa(2,5,"_castle_pod_suw_ro") && s(0,wfn-1) && qif(3,wfn-1,"prl_ro prq_ro mest_ro mest_3e qast") )
 { l[i]=omo1; Z[88]++; if(dbg){print "Z88"}; continue };
 if ( q(1,"qast") &&
      w(2,"под") &&
    wfa(3,6,"_castle_pod_suw_ro") && s(0,wfn-1) && qif(3,wfn-1,"prl_ro prq_ro mest_ro mest_3e qast") )
 { l[i]=omo1; Z[89]++; if(dbg){print "Z89"}; continue };
 if ( w(-2,"под") &&
     wa(-1,"_castle_pod_suw_ro") && s(-2,-1) )
 { l[i]=omo1; Z[90]++; if(dbg){print "Z90"}; continue };
 if ( w(-3,"под") &&
      q(-2,"prl_ro prq_ro") &&
     wa(-1,"_castle_pod_suw_ro") && s(-3,-1) && sv(-1,"\\(") )
 { l[i]=omo1; Z[91]++; if(dbg){print "Z91"}; continue };
 # _castle_pod_suw_ro:end

 # _castle_na_suw_vi:start
 if ( w(1,"на") &&
    wfa(2,4,"_castle_na_suw_vi") && s(0,wfn-1) && qif(2,wfn-1,"prl_vi mest_vi mest_3e nar_any prq_vi"))
 { l[i]=omo1; Z[92]++; if(dbg){print "Z92"}; continue };
 # _castle_na_suw_vi:end

 # _castle_na_suw_pr:start
 # + _gl_4_castle_na_suw_pr
 if ( w(1,"на") &&
    wfa(2,4,"_castle_na_suw_pr") && s(0,wfn-1) && qif(2,wfn-1,"prl_pr mest_pr mest_3e nar_any prq_pr") )
 { l[i]=omo1; Z[93]++; if(dbg){print "Z93"}; continue };
 if ( w(-2,"на") && se(-1," — ") &&
     wa(-1,"_castle_na_suw_pr") && s(-2) )
 { l[i]=omo1; Z[94]++; if(dbg){print "Z94"}; continue };
 if ( w(-3,"на") &&
     wa(-2,"_castle_na_suw_pr") &&
      q(-1,"suw_ro isname") && s(-3,-1) )
 { l[i]=omo1; Z[95]++; if(dbg){print "Z95"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_ro isname") &&
      q(-1,"prl_vi mest_vi mest_3e") && s(-4,-1) )
 { l[i]=omo1; Z[96]++; if(dbg){print "Z96"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_ro isname") &&
      q(-2,"prl_vi mest_vi mest_3e") &&
      q(-1,"prl_vi mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[97]++; if(dbg){print "Z97"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
      q(-4,"suw_ro isname") &&
      q(-3,"nar_vrem nar_mest qast mest_3e") &&
      q(-2,"prl_vi mest_vi mest_3e") &&
      q(-1,"prl_vi mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[98]++; if(dbg){print "Z98"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_ro isname") &&
      q(-2,"isname") &&
      q(-1,"prl_vi mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[99]++; if(dbg){print "Z99"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_ro isname") &&
      q(-1,"mest_im") && s(-4,-1) )
 { l[i]=omo1; Z[100]++; if(dbg){print "Z100"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_ro isname") &&
      q(-2,"qast") &&
      q(-1,"mest_im") && s(-5,-1) )
 { l[i]=omo1; Z[101]++; if(dbg){print "Z101"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"prl_ro prq_ro mest_ro mest_3e") &&
      q(-1,"suw_ro isname") && s(-4,-1) )
 { l[i]=omo1; Z[102]++; if(dbg){print "Z102"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"prl_ro prq_ro mest_ro mest_3e") &&
      q(-2,"suw_ro isname") &&
      q(-1,"prl_vi mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[103]++; if(dbg){print "Z103"}; continue };
 if ( w(-3,"на") && se(-1," — ") &&
     wa(-2,"_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-3) )
 { l[i]=omo1; Z[104]++; if(dbg){print "Z104"}; continue };
 if ( w(-2,"на") &&
     wa(-1,"_castle_na_suw_pr") && s(-2,-1) )
 { l[i]=omo1; Z[105]++; if(dbg){print "Z105"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"nar_step qast") &&
      q(-2,"qast") &&
      w(-1,"не") && s(-5,-1) )
 { l[i]=omo1; Z[106]++; if(dbg){print "Z106"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"qast") &&
      q(-1,"nar_vrem qast") && s(-4,-1) )
 { l[i]=omo1; Z[107]++; if(dbg){print "Z107"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
     ba(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"qast") &&
      q(-1,"nar_vrem qast") && s(-5,-1) )
 { l[i]=omo1; Z[108]++; if(dbg){print "Z108"}; continue };
 if ( w(-3,"на") &&
      q(-2,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-1,"_castle_na_suw_pr") && s(-3,-1) )
 { l[i]=omo1; Z[109]++; if(dbg){print "Z109"}; continue };
 if ( w(-4,"на") &&
      q(-3,"prl_pr prq_pr mest_pr mest_3e") &&
      q(-2,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-1,"_castle_na_suw_pr") && s(-4,-1) )
 { l[i]=omo1; Z[110]++; if(dbg){print "Z110"}; continue };
 if ( w(-3,"на") &&
     wa(-2,"_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-3,-1) )
 { l[i]=omo1; Z[111]++; if(dbg){print "Z111"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-4,-1) )
 { l[i]=omo1; Z[112]++; if(dbg){print "Z112"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") &&
      q(-1,"qast") && s(-4,-1) )
 { l[i]=omo1; Z[113]++; if(dbg){print "Z113"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
      q(-4,"nar_step") &&
      q(-3,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") &&
sz_iili(-2) &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[114]++; if(dbg){print "Z114"}; continue };
 if ( w(-4,"на") &&
      q(-3,"prl_pr prq_pr mest_pr") &&
     wa(-2,"_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-4,-1) )
 { l[i]=omo1; Z[115]++; if(dbg){print "Z115"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"prq_edmuim prq_mnim") &&
      q(-1,"suw_tv") && s(-5,-1) )
 { l[i]=omo1; Z[116]++; if(dbg){print "Z116"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"prq_edmuim prq_mnim") &&
      q(-2,"suw_tv") &&
      q(-1,"suw_ro") && s(-6,-1) )
 { l[i]=omo1; Z[117]++; if(dbg){print "Z117"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[118]++; if(dbg){print "Z118"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr") &&
     wa(-4,"_castle_na_suw_pr") &&
   base(-3,"быть") &&
      q(-2,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[119]++; if(dbg){print "Z119"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
     ba(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"prl_kred_sr nar_mest") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[120]++; if(dbg){print "Z120"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
     ba(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-4,-1) )
 { l[i]=omo1; Z[121]++; if(dbg){print "Z121"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
     ba(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[122]++; if(dbg){print "Z122"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_ro mest_ro mest_3e isname") &&
     ba(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e nar_vrem") && s(-5,-1) )
 { l[i]=omo1; Z[123]++; if(dbg){print "Z123"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_ro mest_ro mest_3e isname") &&
     ba(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[124]++; if(dbg){print "Z124"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_ro mest_ro mest_3e isname nar_vrem nar_mest") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-4,-1) )
 { l[i]=omo1; Z[125]++; if(dbg){print "Z125"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"prl_ro prq_ro mest_ro mest_3e") &&
      q(-2,"suw_ro mest_ro mest_3e isname nar_vrem nar_mest") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[126]++; if(dbg){print "Z126"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_ro mest_ro mest_3e isname nar_vrem nar_mest") &&
      q(-2,"qast") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[127]++; if(dbg){print "Z127"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_ro mest_ro mest_3e isname nar_vrem nar_mest") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[128]++; if(dbg){print "Z128"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_im mest_im mest_3e isname") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[129]++; if(dbg){print "Z129"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_ro mest_ro mest_3e isname") &&
      q(-2,"mod_bz mod_ed mod_mn") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-6,-1) )
 { l[i]=omo1; Z[130]++; if(dbg){print "Z130"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_ro mest_ro mest_3e isname") &&
      q(-2,"prl_kred_sr") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[131]++; if(dbg){print "Z131"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
 pre_tv(-4) &&
      q(-3,"prl_tv prq_tv mest_tv mest_3e") &&
      q(-2,"suw_tv") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-6,-1) )
 { l[i]=omo1; Z[132]++; if(dbg){print "Z132"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
 pre_tv(-2) &&
      q(-1,"suw_tv isname") && s(-4,-1) )
 { l[i]=omo1; Z[133]++; if(dbg){print "Z133"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
 pre_tv(-3) &&
      q(-2,"suw_tv isname") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[134]++; if(dbg){print "Z134"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
 pre_ro(-4) &&
      q(-3,"suw_ro") &&
     ba(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[135]++; if(dbg){print "Z135"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
 pre_ro(-2) &&
      q(-1,"suw_ro mest_ro") && s(-4,-1) )
 { l[i]=omo1; Z[136]++; if(dbg){print "Z136"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
 pre_ro(-3) &&
      q(-2,"suw_ro mest_ro") &&
   base(-1,"быть") && s(-5,-1) )
 { l[i]=omo1; Z[137]++; if(dbg){print "Z137"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
 pre_ro(-4) &&
      q(-3,"suw_ro mest_ro") &&
      q(-2,"nar_spos") &&
   base(-1,"быть") && s(-6,-1) )
 { l[i]=omo1; Z[138]++; if(dbg){print "Z138"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"prl_kred_mu prl_krmn") &&
      q(-1,"prl_edmuvi prl_mnvi") && s(-4,-1) )
 { l[i]=omo1; Z[139]++; if(dbg){print "Z139"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"prl_kred_mu prl_krmn") &&
      q(-2,"prl_edmuvi prl_mnvi") &&
      q(-1,"qast") && s(-5,-1) )
 { l[i]=omo1; Z[140]++; if(dbg){print "Z140"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
      q(-4,"nar_step prl_kred_sr") &&
      q(-3,"prl_kred_mu prl_krmn") &&
      q(-2,"prl_edmuvi prl_mnvi") &&
      q(-1,"qast") && s(-6,-1) )
 { l[i]=omo1; Z[141]++; if(dbg){print "Z141"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-3,"_castle_na_suw_pr") &&
     ba(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[142]++; if(dbg){print "Z142"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw_pr") &&
     ba(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"prl_ro prq_ro") &&
      q(-1,"suw_ro") && s(-6,-1) )
 { l[i]=omo1; Z[143]++; if(dbg){print "Z143"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
     ba(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"prl_ro prq_ro") &&
      q(-1,"suw_ro") && s(-5,-1) )
 { l[i]=omo1; Z[144]++; if(dbg){print "Z144"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"nar_vrem qast") &&
     ba(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[145]++; if(dbg){print "Z145"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw_pr") &&
     ba(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"qast") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[146]++; if(dbg){print "Z146"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw_pr") &&
     ba(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"nar_any") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[147]++; if(dbg){print "Z147"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw_pr") &&
sz_iili(-3) &&
     ba(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[148]++; if(dbg){print "Z148"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-3,"_castle_na_suw_pr") &&
     ba(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[149]++; if(dbg){print "Z149"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e") &&
      q(-3,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-2,"_castle_na_suw_pr") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[150]++; if(dbg){print "Z150"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e") &&
      q(-3,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-2,"_castle_na_suw_pr") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-6,-1) )
 { l[i]=omo1; Z[151]++; if(dbg){print "Z151"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"isname") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-4,-1) )
 { l[i]=omo1; Z[152]++; if(dbg){print "Z152"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"nar_vrem") &&
     ba(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[153]++; if(dbg){print "Z153"}; continue };
 if ( w(-3,"на") &&
     wa(-2,"_castle_na_suw_pr") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-3,-1) )
 { l[i]=omo1; Z[154]++; if(dbg){print "Z154"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
 pre_da(-3) &&
      q(-2,"suw_da") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[155]++; if(dbg){print "Z155"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_da mest_da") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-4,-1) )
 { l[i]=omo1; Z[156]++; if(dbg){print "Z156"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_da mest_da suw_ro mest_ro") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[157]++; if(dbg){print "Z157"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_ro mest_ro") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-6,-1) )
 { l[i]=omo1; Z[158]++; if(dbg){print "Z158"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_da mest_da nar_step") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[159]++; if(dbg){print "Z159"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"mest_ro prl_ro mod_bz mod_ed mod_mn") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-4,-1) )
 { l[i]=omo1; Z[160]++; if(dbg){print "Z160"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"mod_bz mod_ed mod_mn") &&
     ba(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuvi prl_mnvi mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[161]++; if(dbg){print "Z161"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"isname") &&
      q(-2,"mest_ro prl_ro mod_any") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[162]++; if(dbg){print "Z162"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
      q(-4,"isname") &&
      q(-3,"mest_ro prl_ro mod_any") &&
     ba(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuvi prl_mnvi mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[163]++; if(dbg){print "Z163"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"mest_ro prl_ro mod_bz") &&
      q(-2,"mod_any") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[164]++; if(dbg){print "Z164"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"mest_ro prl_ro mod_bz") &&
      q(-2,"mod_any") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-6,-1) )
 { l[i]=omo1; Z[165]++; if(dbg){print "Z165"}; continue };
 if ( w(-4,"на") &&
      q(-3,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-2,"_castle_na_suw_pr") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-4,-1) )
 { l[i]=omo1; Z[166]++; if(dbg){print "Z166"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"qast") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[167]++; if(dbg){print "Z167"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"nar_any prl_kred_sr") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[168]++; if(dbg){print "Z168"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr") &&
     wa(-3,"_castle_na_suw_pr") &&
     ba(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[169]++; if(dbg){print "Z169"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr") &&
     wa(-4,"_castle_na_suw_pr") &&
     ba(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"suw_tv") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[170]++; if(dbg){print "Z170"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr") &&
     wa(-3,"_castle_na_suw_pr") &&
     ba(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[171]++; if(dbg){print "Z171"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_ro isname") &&
      q(-2,"suw_im mest_im isname") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-5,-1) )
 { l[i]=omo1; Z[172]++; if(dbg){print "Z172"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_im mest_im isname") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-4,-1) )
 { l[i]=omo1; Z[173]++; if(dbg){print "Z173"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_im mest_im isname") &&
     ba(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_vi prq_vi mest_da mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[174]++; if(dbg){print "Z174"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
      q(-4,"suw_im mest_im isname") &&
     ba(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"suw_da mest_da isname mest_3e") &&
      q(-1,"prl_vi prq_vi") && s(-6,-1) )
 { l[i]=omo1; Z[175]++; if(dbg){print "Z175"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
      q(-4,"suw_im mest_im isname") &&
     ba(-3,"_gl_4_castle_na_suw_pr") &&
      q(-2,"qast") &&
      q(-1,"nar_any") && s(-6,-1) )
 { l[i]=omo1; Z[176]++; if(dbg){print "Z176"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw_pr") &&
      q(-4,"suw_ro isname") &&
      q(-3,"suw_im mest_im isname") &&
     ba(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[177]++; if(dbg){print "Z177"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr") &&
     wa(-4,"_castle_na_suw_pr") &&
      q(-3,"suw_im mest_im isname") &&
     ba(-2,"_gl_4_castle_na_suw_pr") &&
      q(-1,"suw_im mest_im isname") && s(-6,-1) )
 { l[i]=omo1; Z[178]++; if(dbg){print "Z178"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw_pr") &&
      q(-2,"suw_ro isname") &&
     ba(-1,"_gl_4_castle_na_suw_pr") && s(-4,-1) )
 { l[i]=omo1; Z[179]++; if(dbg){print "Z179"}; continue };

 if ( ba(1,"_gl_4_castle_na_suw_pr") && zs(0) &&
       w(2,"на") &&
      wa(3,"_castle_na_suw_pr") && s(1,2) )
 { l[i]=omo1; Z[180]++; if(dbg){print "Z180"}; continue };
 if ( ba(1,"_gl_4_castle_na_suw_pr") && zs(0) &&
       w(2,"на") &&
       q(3,"prl_pr prq_pr") &&
      wa(4,"_castle_na_suw_pr") && s(1,3) )
 { l[i]=omo1; Z[181]++; if(dbg){print "Z181"}; continue };
 if ( ba(1,"_gl_4_castle_na_suw_pr") && zs(0) &&
       w(2,"на") &&
       q(3,"prl_vi prl_pr otnsz_vi otnsz_pr mest_vi mest_pr mest_pr prq_vi prq_pr") &&
       q(4,"prl_pr prl_vi prq_pr prq_vi") &&
      wa(5,"_castle_na_suw_pr") && s(1,4) )
 { l[i]=omo1; Z[182]++; if(dbg){print "Z182"}; continue };
 if ( q(1,"nar_any qast") && zs(0) &&
     ba(2,"_gl_4_castle_na_suw_pr") &&
      w(3,"на") &&
      q(4,"prl_pr prq_pr") &&
     wa(5,"_castle_na_suw_pr") && s(1,4) )
 { l[i]=omo1; Z[183]++; if(dbg){print "Z183"}; continue };
 # _castle_na_suw_pr:end

 # дома:escape
 cst="дома";
 if ( wf(1,5,cst) && isname(wfn) && s(0,wfn-1) && qif(1,wfn-1,"prl_ro mest_ro mest_3e prq_ro qast nar_any") )
 { l[i]=omo1; Z[184]++; if(dbg){print "Z184"}; continue };
 if ( wf(1,5,cst) && isname(wfn+1) && s(0,wfn) && qif(1,wfn-1,"prl_ro mest_ro mest_3e prq_ro qast nar_any") )
 { l[i]=omo1; Z[185]++; if(dbg){print "Z185"}; continue };

 # _castle_suw_ro:start
 if ( wfa(1,4,"_castle_suw_ro") && s(0,wfn-1) && Qf(1,wfn-1,"pre_any sz_iili gl_ed gl_mn") && Ww_(-1,"под") )
 { l[i]=omo1; Z[186]++; if(dbg){print "Z186"}; continue };

 if ( w(1,"для") &&
     wa(2,"_castle_suw_ro2") && s(0,1) )
 { l[i]=omo1; Z[187]++; if(dbg){print "Z187"}; continue };
 if ( w(1,"для") &&
      q(2,"prl_ro prq_ro mest_ro mest_3e") &&
     wa(3,"_castle_suw_ro2") && s(0,2) && qsb(-10,-1,",") && !(base(qsn,"дверь люк")) )
 { l[i]=omo1; Z[188]++; if(dbg){print "Z188"}; continue };
 if ( w(1,"для") &&
      q(2,"prl_ro prq_ro mest_ro mest_3e") &&
      q(3,"prl_ro prq_ro mest_ro mest_3e") &&
     wa(4,"_castle_suw_ro2") && s(0,3) )
 { l[i]=omo1; Z[189]++; if(dbg){print "Z189"}; continue };
 # _castle_suw_ro:end

 # _lock_suw_ro:start
 if ( wfa(1,5,"_lock_suw_ro") && s(0,wfn-1) && Qf(1,wfn-1,"sz_iili pre_any gl_in deep gl_ed gl_mn gl_vzed gl_vzmn") && !(bb(-3,-1,"знать")) )
 { l[i]=omo2; Z[190]++; if(dbg){print "Z190"}; continue };
 if ( w(1,"для от у") &&
     wa(2,"_lock_suw_ro") && s(0,1) )
 { l[i]=omo2; Z[191]++; if(dbg){print "Z191"}; continue };
 if ( w(1,"для от у") &&
      q(2,"prl_ro prq_ro mest_ro mest_3e") &&
     wa(3,"_lock_suw_ro") && W(3,"дома") && s(0,2) )
 { l[i]=omo2; Z[192]++; if(dbg){print "Z192"}; continue };
 if ( w(1,"для от у") &&
      q(2,"prl_ro prq_ro mest_ro mest_3e") &&
      q(3,"prl_ro prq_ro mest_ro mest_3e") &&
     wa(4,"_lock_suw_ro") && W(4,"дома") && s(0,3) )
 { l[i]=omo2; Z[193]++; if(dbg){print "Z193"}; continue };
 # _lock_suw_ro:end

 # _castle_iz_suw_ro:start
 if ( w(1,"из") &&
    wfa(2,5,"_castle_iz_suw_ro") && s(0,wfn-1) && qif(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo1; Z[194]++; if(dbg){print "Z194"}; continue };
 if ( w(-3,"из") &&
      q(-2,"prl_edro prq_edro") &&
     wa(-1,"_castle_iz_suw_ro") && s(-3,-1) )
 { l[i]=omo1; Z[195]++; if(dbg){print "Z195"}; continue };
 cst1="возвести возводить выкладывать выложить выстроить построить сложить";
 if ( (z(0)||s(0)) &&
    base(1,cst1) &&
       w(2,"из") &&
     wfa(3,6,"_castle_iz_suw_ro") && s(1,wfn-1) && qif(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo1; Z[196]++; if(dbg){print "Z196"}; continue };
 if ( wb(-5,-1,"из") && s(wbn,-1) && qib(wbn+1,-1,"prl_ro prq_ro mest_ro mest_3e") &&
    base(wbn-1,cst1) &&
     wba(wbn+1,-1,"_castle_iz_suw_ro") )
 { l[i]=omo1; Z[197]++; if(dbg){print "Z197"}; continue };
 # _castle_iz_suw_ro:end

 # _lock_iz_suw_ro:start
 if ( w(1,"из") &&
    wfa(2,5,"_lock_iz_suw_ro") && s(0,wfn-1) && qif(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo2; Z[198]++; if(dbg){print "Z198"}; continue };
 # _lock_iz_suw_ro:end
 # _castle_pre_tv_suw_tv:start
 if ( pre_tv(1) &&
         wfa(2,4,"_castle_pre_tv_suw_tv") && s(0,wfn-1) )
 { l[i]=omo1; Z[199]++; if(dbg){print "Z199"}; continue };
 if ( qb(-6,-1,"pre_tv") &&
     wba(wbn+1,-1,"_castle_pre_tv_suw_tv") && s(wbn,-1) && s(0,qbn-1) )
 { l[i]=omo1; Z[200]++; if(dbg){print "Z200"}; continue };
 # _castle_pre_tv_suw_tv:end

 # _castle_pre_ro_suw_ro:start
 if ( w(1,"у возле посреди") &&
    wfa(2,4,"_castle_pre_ro_suw_ro") && s(0,wfn-1) )
 { l[i]=omo1; Z[201]++; if(dbg){print "Z201"}; continue };
 if ( wb(-6,-2,"у возле посреди") && s(wbn,-1) && Qb(wbn+1,-1,"pre_any sz_iili") &&
     wba(wbn+1,-1,"_castle_pre_ro_suw_ro") && !(bf(1,5,"повесить") && s(0,bfn-1)) )
 { l[i]=omo1; Z[202]++; if(dbg){print "Z202"}; continue };
 # _castle_pre_ro_suw_ro:start

 # _castle_k_suw_da:start
 if ( w(1,"к") &&
     wa(2,"_castle_k_suw_da") && s(0,1) )
 { l[i]=omo1; Z[203]++; if(dbg){print "Z203"}; continue };
 if ( wb(-6,-1,"к") &&
     wba(wbn+1,-1,"_castle_k_suw_da") && s(wbn,-1) )
 { l[i]=omo1; Z[204]++; if(dbg){print "Z204"}; continue };
 # _castle_k_suw_da:end

 # _lock_mexdu_suw_tv:start
 if ( w(1,"между") &&
    wfa(2,4,"_lock_mexdu_suw_tv") && s(0,wfn-1) )
 { l[i]=omo2; Z[205]++; if(dbg){print "Z205"}; continue };
 # _lock_mexdu_suw_tv:end

 if ( w(1,"веками вдали издали вдалеке") && s(0) )
 { l[i]=omo1; Z[206]++; if(dbg){print "Z206"}; continue };

 # suw_ro escape:start
 cst="засов";
 if ( base(1,"венчать") && zs(0) &&
        bf(2,5,cst) && s(1,bfn-1) && Qf(2,bfn-1,"sz_iili pre_any") )
 { l[i]=omo2; Z[207]++; if(dbg){print "Z207"}; continue };

 cst="поднять подхватить";
 if ( base(-3,cst) &&
         w(-2,"с со") &&
         q(-1,"suw_ro") && s(-3,-1) )
 { l[i]=omo2; Z[208]++; if(dbg){print "Z208"}; continue };

 cst="слетать слететь спадать спасть";
 if ( w(1,"с со") &&
      q(2,"suw_ro") &&
   base(3,cst) && s(0,2) )
 { l[i]=omo2; Z[209]++; if(dbg){print "Z209"}; continue };
 if ( w(1,"с со") &&
      q(2,"suw_ro") &&
      q(3,"nar_any prl_kred_sr") &&
   base(4,cst) && s(0,3) )
 { l[i]=omo2; Z[210]++; if(dbg){print "Z210"}; continue };

 cst="подвала";
 cst1="крыши флюгера";
 if ( qxs(1,"с со от",cst,"до",cst1) )
 { l[i]=omo1; Z[211]++; if(dbg){print "Z211"}; continue };

 if ( qxs(1,"с","лица","земли")||
      qxs(1,"с","ног","на","голову") )
 { l[i]=omo1; Z[212]++; if(dbg){print "Z212"}; continue };
 # suw_ro escape:end

 # _castle_s_suw_ro:start
 if ( w(1,"с со") &&
    wfa(2,5,"_castle_s_suw_ro") && s(0,wfn-1) && qif(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo1; Z[213]++; if(dbg){print "Z213",qfn}; continue };
 if ( w(-2,"с со") &&
     wa(-1,"_castle_s_suw_ro") && s(-2,-1) )
 { l[i]=omo1; Z[214]++; if(dbg){print "Z214"}; continue };
 # _castle_s_suw_ro:start

 # _castle_s_suw_tv:start
 if ( w(1,"с со") &&
    wfa(2,5,"_castle_s_suw_tv") && s(0,wfn-1) && qif(2,wfn-1,"prl_tv prq_tv mest_tv mest_3e") )
 { l[i]=omo1; Z[215]++; if(dbg){print "Z215",qfn}; continue };
 if ( w(-2,"с со") &&
     wa(-1,"_castle_s_suw_tv") && s(-2,-1) )
 { l[i]=omo1; Z[216]++; if(dbg){print "Z216"}; continue };
 # _castle_s_suw_tv:start

 # _castle_u_suw_ro:start
 if ( w(1,"у") &&
    wfa(2,5,"_castle_u_suw_ro") && s(0,wfn-1) && qif(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo1; Z[217]++; if(dbg){print "Z217"}; continue };
 if ( w(-2,"у") &&
     wa(-1,"_castle_u_suw_ro") && s(-2,-1) )
 { l[i]=omo1; Z[218]++; if(dbg){print "Z218"}; continue };
 # _castle_u_suw_ro:start

 # _castle_sredi_suw_ro:start
 if ( w(1,"посреди посредине среди") &&
    wfa(2,5,"_castle_sredi_suw_ro") && s(0,wfn-1) && qif(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo1; Z[219]++; if(dbg){print "Z219"}; continue };
 if ( w(-2,"посреди посредине среди") &&
     wa(-1,"_castle_sredi_suw_ro") && s(-2,-1) )
 { l[i]=omo1; Z[220]++; if(dbg){print "Z220"}; continue };
 # _castle_sredi_suw_ro:start

 # _lock_su_suw_ro:start
 if ( w(1,"с со у") &&
    wfa(2,5,"_lock_su_suw_ro") && s(0,wfn-1) && qif(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") && W_w(wfn+1,"до по") )
 { l[i]=omo2; Z[221]++; if(dbg){print "Z221"}; continue };
 if ( w(-2,"с со у") &&
     wa(-1,"_lock_su_suw_ro") && s(-2,-1) )
 { l[i]=omo2; Z[222]++; if(dbg){print "Z222"}; continue };
 if ( z(0) &&
     ba(1,"_lock_su_suw_ro") &&
   base(2,"который") && s(1) )
 { l[i]=omo1; Z[223]++; if(dbg){print "Z223"}; continue };
 # _lock_su_suw_ro:end

 # _lock_s_suw_tv:start
 if ( w(1,"с со") &&
    wfa(2,5,"_lock_s_suw_tv") && s(0,wfn-1) && qif(2,wfn-1,"prl_tv prq_tv mest_tv mest_3e") && W_w(wfn+1,"до по") )
 { l[i]=omo2; Z[224]++; if(dbg){print "Z224"}; continue };
 if ( w(-2,"с со") &&
     wa(-1,"_lock_s_suw_tv") && s(-2,-1) )
 { l[i]=omo2; Z[225]++; if(dbg){print "Z225"}; continue };
 if ( z(0) &&
     ba(1,"_lock_s_suw_tv") &&
   base(2,"который") && s(1) )
 { l[i]=omo1; Z[226]++; if(dbg){print "Z226"}; continue };
 # _lock_s_suw_tv:end

 # _lock_s_suw:start
 if ( z(0) &&
     ba(1,"_lock_parts") &&
      q(2,"otnsz_mu") && s(1) )
 { l[i]=omo2; Z[227]++; if(dbg){print "Z227"}; continue };
 # _lock_s_suw:end

 if ( sc(0,"[XIV]+") &&
       w(1,"века веков") && s(0) )
 { l[i]=omo1; Z[228]++; if(dbg){print "Z228"}; continue };

 cst1="создавать создать сплести сплетать";
 cst2="ног пальцев рук";
 if ( base(-3,cst1) &&
    pre_ro(-2) &&
         w(-1,cst2) && s(-3,-1) )
 { l[i]=omo2; Z[229]++; if(dbg){print "Z229"}; continue };
 if ( base(-4,cst1) &&
    pre_ro(-3) &&
         q(-2,"prl_ro prq_ro mest_ro mest_3e") &&
         w(-1,cst2) && s(-4,-1) )
 { l[i]=omo2; Z[230]++; if(dbg){print "Z230"}; continue };


 ### замок замки им.п. вин.п.
 if(iwrd=="замок" || iwrd=="замки") {

    cst1="быть стать";
    cst8="сложен";
    if ( base(1,cst1) &&
           wf(2,5,cst8) &&
            w(wfn+1,"в из по") && s(0,wfn) && Qf(2,wfn-1,"pre_any sz_iili") )
    { l[i]=omo1; Z[231]++; if(dbg){print "Z231"}; continue };
    if ( base(-2,cst1) &&
            w(-1,cst8) && s(-2,-1) )
    { l[i]=omo1; Z[232]++; if(dbg){print "Z232"}; continue };
    cst1="большой замечательный интересный красивый прекрасный";
    if ( w(-4,"у") &&
         q(-3,"mest_ro suw_ro") &&
         q(-2,"nar_step") &&
         w(-1,cst1) && s(-4,-1) )
    { l[i]=omo1; Z[233]++; if(dbg){print "Z233"}; continue };
    if ( w(-3,"у") &&
         q(-2,"mest_ro suw_ro") &&
         w(-1,cst1) && s(-3,-1) )
    { l[i]=omo1; Z[234]++; if(dbg){print "Z234"}; continue };
    cst1="здравствуй привет";
    if ( w(-1,cst1) && zs(-1) )
    { l[i]=omo1; Z[235]++; if(dbg){print "Z235"}; continue };
    cst1="показать";
    if ( ba(-2,"_gl_dvizh") && sc(-2,"—") && s(-1) &&
       base(-1,cst1) )
    { l[i]=omo1; Z[236]++; if(dbg){print "Z236"}; continue };

    # _castle_prl:start
    if ( q(-1,"prl_im prl_kred_mu") && ba(-1,"_castle_prl") && s(-1) && !(ba(-2,"_lock_pe") && s(-2)) )
    { l[i]=omo1; Z[237]++; if(dbg){print "Z237"}; continue };
    if ( q(-2,"prl_im prl_kred_mu") && ba(-2,"_castle_prl") &&
         q(-1,"prl_any prq_any mest_any qast") && !(bam(-1,"_lock_prl _lock_pe")) && s(-2,-1) )
    { l[i]=omo1; Z[238]++; if(dbg){print "Z238"}; continue };
    if ( q(-3,"prl_im prl_kred_mu") && ba(-3,"_castle_prl") &&
         q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
         q(-1,"prl_any prq_any mest_any qast") && s(-3,-1) )
    { l[i]=omo1; Z[239]++; if(dbg){print "Z239"}; continue };
    if ( q(1,"prl_im prl_kred_mu") && ba(1,"_castle_prl") && s(0) )
    { l[i]=omo1; Z[240]++; if(dbg){print "Z240"}; continue };
    cst1="быть ведь же казаться стать считаться являться";
    if ( base(1,cst1) &&
          bfa(2,5,"_castle_prl") && q(bfn,"prl_im prl_tv prl_kred_mu") && s(0,bfn-1) && Qf(2,bfn-1,"pre_any sz_iili")  )
    { l[i]=omo1; Z[241]++; if(dbg){print "Z241"}; continue };
    cst2="быть делать казаться сделать стать считаться являться";
    if ( bb(-3,-1,cst2) &&
          q(1,"prl_tv") && ba(1,"_castle_prl") && s(bbn,0) )
    { l[i]=omo1; Z[242]++; if(dbg){print "Z242"}; continue };
    # _castle_prl:start

    # _lock_prl:escape
    cst="сложить";
    cst1="быть ведь же казаться стать считаться являться";
    if ( base(1,cst) &&
            w(2,"из") && s(0,1) )
    { l[i]=omo1; Z[243]++; if(dbg){print "Z243"}; continue };
    if ( base(1,cst1) &&
         base(2,cst) &&
            w(3,"из") && s(0,2) )
    { l[i]=omo1; Z[244]++; if(dbg){print "Z244"}; continue };
    if ( w(-4,"из") &&
         q(-3,"otnsz_ro") &&
      base(-2,cst1) &&
      base(-1,cst) && s(-4,-1) )
    { l[i]=omo1; Z[245]++; if(dbg){print "Z245"}; continue };
    if ( w(-5,"из") &&
         q(-4,"otnsz_ro") &&
      base(-3,cst1) &&
      base(-2,cst) &&
         q(-1,"prl_vi mest_vi mest_3e") && s(-5,-1) )
    { l[i]=omo1; Z[246]++; if(dbg){print "Z246"}; continue };
    # _lock_prl:escape

    # _lock_prl:start
    cst1="быть ведь же казаться стать считаться являться";
    if ( q(-1,"prl_im prl_kred_mu") && ba(-1,"_lock_prl") && s(-1) )
    { l[i]=omo2; Z[247]++; if(dbg){print "Z247"}; continue };
    if ( q(-2,"prl_im prl_kred_mu") && ba(-2,"_lock_prl") &&
         Q(-1,"suw_any sz_iili") && s(-2,-1) )
    { l[i]=omo2; Z[248]++; if(dbg){print "Z248"}; continue };
    if ( q(-3,"prl_im prl_kred_mu") && ba(-3,"_lock_prl") &&
         q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
         q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo2; Z[249]++; if(dbg){print "Z249"}; continue };
    if ( q(1,"prl_im prl_kred_mu") && ba(1,"_lock_prl") && s(0) && Q(2,"isname suw_im") )
    { l[i]=omo2; Z[250]++; if(dbg){print "Z250"}; continue };
    if ( q(1,"nar_mest") &&
         q(2,"prl_im prl_kred_mu") && ba(2,"_lock_prl") && s(0,1) && Q(3,"isname suw_im") )
    { l[i]=omo2; Z[251]++; if(dbg){print "Z251"}; continue };
    if ( base(1,cst1) &&
            q(2,"prl_im prl_tv prl_kred_mu") && ba(2,"_lock_prl") && s(0,1) )
    { l[i]=omo2; Z[252]++; if(dbg){print "Z252"}; continue };
    # _lock_prl:end

    # _lock_prq_kak_gl:start
    cst1="быть ведь же казаться стать считаться являться";
    if ( q(-1,"prq_im prq_kred_mu") && ba(-1,"_lock_prq_kak_gl") && s(-1) )
    { l[i]=omo2; Z[253]++; if(dbg){print "Z253"}; continue };
    if ( q(-2,"prq_im prq_kred_mu") && ba(-2,"_lock_prq_kak_gl") &&
         Q(-1,"suw_any sz_iili") && s(-2,-1) )
    { l[i]=omo2; Z[254]++; if(dbg){print "Z254"}; continue };
    if ( q(-3,"prq_im prq_kred_mu") && ba(-3,"_lock_prq_kak_gl") &&
         q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
         q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo2; Z[255]++; if(dbg){print "Z255"}; continue };
    if ( q(1,"prq_im prq_kred_mu") && ba(1,"_lock_prq_kak_gl") && s(0) && Q(1,"isname") )
    { l[i]=omo2; Z[256]++; if(dbg){print "Z256"}; continue };
    if ( base(1,cst1) &&
            q(2,"prq_im prq_tv prq_kred_mu") && ba(2,"_lock_prq_kak_gl") && s(0,1) )
    { l[i]=omo2; Z[257]++; if(dbg){print "Z257"}; continue };
    # _lock_prq_kak_gl:end

    cst="весь целый";
    if ( w(-1,cst) && s(-1) )
    { l[i]=omo1; Z[258]++; if(dbg){print "Z258"}; continue };
    if ( w(1,cst) && s(0) && p(1) )
    { l[i]=omo1; Z[259]++; if(dbg){print "Z259"}; continue };

    cst="закрывать закрыть";
    if ( w(1,"для") &&
         q(2,"mest_ro suw_ro") &&
        bf(3,5,cst) && s(0,bfn-1) )
    { l[i]=omo1; Z[260]++; if(dbg){print "Z260"}; continue };
    if ( bf(1,3,cst) &&
          w(bfn+1,"для") && s(0,bfn) )
    { l[i]=omo1; Z[261]++; if(dbg){print "Z261"}; continue };

    cst="быть стать явиться являться";
    if ( bf(1,3,cst) &&
          q(bfn+1,"suw_tv") &&
          w(bfn+2,"для к") && s(0,bfn+1) )
    { l[i]=omo1; Z[262]++; if(dbg){print "Z262"}; continue };

    cst1="ворота дверь калитка";
    cst2="камера комната парадное подъезд прихожая продуктовый";
    if ( ba(-5,"_lock_pe") &&
          w(-4,"на") &&
       base(-3,cst1) &&
          w(-2,"в") &&
       base(-1,cst2) && s(-5,-1) )
    { l[i]=omo2; Z[263]++; if(dbg){print "Z263"}; continue };

  # в замок
  if ( wb(-4,-1,"в во") && s(wbn,-1) ) {
  tn = wbn; # адрес поискового токена, в данном случае — "в"

  # определения между "в" и "замок"
  cst_muvi="prl_edmuvi mcop_edmuvi mcop_mnvi qis_vi qik_vi prq_edmuvi qast_any mest_3e nar_kaq";

  cst="собственно";
  if ( qif(tn+1,-1,cst_muvi)||
        wf(tn+1,-1,cst)||
        (q(tn+1,"prq_edmuvi prq_mnvi") && qif(tn+2,-1,"mest_da suw_da prq_da nar_any suw_edmutv prl_edmutv prq_edmutv") ))
  { tn_ok = 1 } else { tn_ok = "" };

    cst="поставить";
    cst1="гарнизон";
    if ( base(tn-2,cst) &&
         base(tn-1,cst1) &&
          vis(tn_ok) && s(tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[264]++; if(dbg){print "Z264"}; continue };
    if ( base(tn-1,cst) &&
         base(1,cst1) &&
          vis(tn_ok) && s(tn-1) )
    { l[i]=omo1; Z[265]++; if(dbg){print "Z265"}; continue };

    if ( qxs(tn-1,"ни не") && z(0) && s(tn-1) &&
         vis(tn_ok) &&
        (qxw(1,"а но ни не","в")||
         qxw(1,"а но","не","в")) &&
         bfa(xwn+1,xwn+5,"_castle_environs") &&
         qif(xwn+1,bfn-1,cst_muvi) && s(xwn,bfn-1) )
    { l[i]=omo1; Z[266]++; if(dbg){print "Z266"}; continue };
    if ( qxw(tn-3,"ни не","в") &&
          ba(tn-2,"_castle_environs") && z(tn-2) &&
         qxs(tn-1,"а но ни не") && vis(tn_ok) )
    { l[i]=omo1; Z[267]++; if(dbg){print "Z267"}; continue };
    if ( wb(tn-5,tn-2,"через сквозь") &&
        qif(wbn+1,tn-2,"prl_vi mest_vi mest_3e prq_vi") &&
         ba(tn-1,"_castle_environs") && zs(tn-1) &&
        vis(tn_ok) && s(wbn,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[268]++; if(dbg){print "Z268"}; continue };

    cst="совать";
    if ( bb(tn-4,tn-2,cst) &&
        qif(bbn+1,tn-2,"prl_edmuvi mest_edmuvi mest_3e") &&
          w(tn-1,"нос") &&
        vis(tn_ok) && s(bbn,tn-1) )
    { l[i]=omo1; Z[269]++; if(dbg){print "Z269"}; continue };
    if ( base(1,cst) &&
           wf(2,5,"нос") &&
          qif(wfn+1,wfn-1,"prl_edmuvi mest_edmuvi mest_3e") &&
          vis(tn_ok) && s(1,wfn-1) )
    { l[i]=omo1; Z[270]++; if(dbg){print "Z270"}; continue };

    cst="захватить";
    if ( bb(tn-6,tn-3,cst) &&
        qif(bbn+1,tn-3,"suw_vi mest_vi mest_3e") &&
          w(tn-2,"с") &&
          q(tn-1,"mest_tv") &&
        vis(tn_ok) && s(bbn,tn-1) )
    { l[i]=omo1; Z[271]++; if(dbg){print "Z271"}; continue };

    if ( qxs(tn-1,"по","возвращению приезду прибытию") &&
         vis(tn_ok) )
    { l[i]=omo1; Z[272]++; if(dbg){print "Z272"}; continue };
    if ( qxs(tn-2,"в","одной","руке") &&
           q(tn-1,"suw_vi") &&
         vis(tn_ok) && zs(tn-1) )
    { l[i]=omo2; Z[273]++; if(dbg){print "Z273"}; continue };

    if ( q(tn-1,"mest_im mest_vi mest_3e suw_odim suw_odvi") && Q(tn-1,"gl_po") &&
       vis(tn_ok) && p(tn-2) && p(0) && s(tn-1,-1) )
    { l[i]=omo1; Z[274]++; if(dbg){print "Z274"}; continue };
    if ( q(tn-2,"mest_im mest_vi mest_3e suw_odim suw_odvi") && Q(tn-2,"gl_po") &&
         q(tn-1,"nar_any prl_kred_sr") &&
       vis(tn_ok) && p(tn-3) && p(0) && s(tn-2,-1) )
    { l[i]=omo1; Z[275]++; if(dbg){print "Z275"}; continue };
    if ( q(tn-2,"nar_any prl_kred_sr") &&
         q(tn-1,"mest_im mest_vi mest_3e suw_odim suw_odvi") && Q(tn-1,"gl_po") &&
       vis(tn_ok) && p(tn-3) && p(0) && s(tn-2,-1) )
    { l[i]=omo1; Z[276]++; if(dbg){print "Z276"}; continue };

    cst1="брать взять завести заключить захватить свести сводить собрать";
    cst2="голень голова грудь живот колено ладонь ладошка лодыжка локоть ляжка нога ножка палец пальчик плечо поясница рука ручка стопа талия туловище шея";
    cst3="взмахом движением";
    if ( bb(tn-4,tn-2,cst2) && s(bbn,tn-1) &&
       !( w(bbn,"руки руках руками") && (w(bbn-1,"на за под в с") || bba(bbn-4,bbn-2,"_gl_v_castle_imvi")) && s(bbn,bbn-1)) &&
       base(tn-1,cst1) &&
        vis(tn_ok) )
    { l[i]=omo2; Z[277]++; if(dbg){print "Z277"}; continue };
    if ( bb(tn-4,tn-1,cst1) &&
        qif(bbn+1,tn-2,"prl_vi mcop_vi prq_vi") &&
       base(tn-1,cst2) &&
        vis(tn_ok) && s(bbn,tn-1) )
    { l[i]=omo2; Z[278]++; if(dbg){print "Z278"}; continue };
    if ( base(tn-2,cst1) &&
         base(tn-1,cst2) &&
          vis(tn_ok) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[279]++; if(dbg){print "Z279"}; continue };
    if ( base(tn-3,cst1) &&
         base(tn-2,cst2) &&
            q(tn-1,"suw_ro suw_edne isname") &&
          vis(tn_ok) && s(tn-3,tn-1) )
    { l[i]=omo2; Z[280]++; if(dbg){print "Z280"}; continue };
    if ( vis(tn_ok) &&
        base(1,cst2) &&
        base(2,cst1) && s(0,1) )
    { l[i]=omo2; Z[281]++; if(dbg){print "Z281"}; continue };
    if ( base(tn-1,cst1) &&
          vis(tn_ok) &&
           bf(1,3,cst2) && s(tn-1,bfn-1) )
    { l[i]=omo2; Z[282]++; if(dbg){print "Z282"}; continue };
    if ( w(tn-3,cst3) &&
      base(tn-2,cst1) &&
         q(tn-1,"isname suw_vi") && s(tn-3,tn-1) )
    { l[i]=omo2; Z[283]++; if(dbg){print "Z283"}; continue };

    cst="захват обхват";
    if ( base(tn-2,cst) &&
         base(tn-1,cst2) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[284]++; if(dbg){print "Z284"}; continue };
    if ( base(tn-5,cst) &&
         base(tn-4,cst2) &&
            q(tn-3,"suw_ro suw_edne isname") &&
            q(tn-2,"prl_tv mest_tv mest_3e prq_tv qis_tv qik_tv") &&
            q(tn-1,"suw_tv") &&
          vis(tn_ok) && s(tn-5,tn-1) )
    { l[i]=omo2; Z[285]++; if(dbg){print "Z285"}; continue };
    if ( base(tn-1,cst) && s(tn-1) )
    { l[i]=omo2; Z[286]++; if(dbg){print "Z286"}; continue };

    # в ... «замок» в кавычках
    if ( base(tn-2,cst1) &&
            q(tn-1,"isname suw_vi") &&
           sc(-1,"[\x22«]") && sc(0,"[\x22»]") && s(tn-2,tn-1) )
    { l[i]=omo2; Z[287]++; if(dbg){print "Z287"}; continue };
    if ( base(tn-1,cst2) &&
           sc(tn-1,"[\x22«]") && sc(0,"[\x22»]") && s(tn-1) )
    { l[i]=omo2; Z[288]++; if(dbg){print "Z288"}; continue };
    if ( base(tn-2,cst2) &&
            q(tn-1,"qast_any") &&
           sc(tn-1,"[\x22«]") && sc(0,"[\x22»]") && s(tn-2,tn-1) )
    { l[i]=omo2; Z[289]++; if(dbg){print "Z289"}; continue };

    if ( base(tn-1,cst2) &&
          vis(tn_ok) &&
            w(1,"за на") &&
         base(2,cst2) && s(tn-1,1) )
    { l[i]=omo2; Z[290]++; if(dbg){print "Z290"}; continue };

    cst="впустить выпустить послать";
    cst1="дым поток";
    if ( base(tn-3,cst) &&
            w(tn-2,cst1) &&
            q(tn-1,"suw_ro") &&
          vis(tn_ok) && s(tn-3,tn-1) )
    { l[i]=omo2; Z[291]++; if(dbg){print "Z291"}; continue }; #edit
    if ( bb(tn-9,tn-3,cst) &&
          w(bbn+1,cst1) &&
          q(bbn+2,"pre_tv") &&
        qif(tn+3,tn-1,"suw_tv prl_tv mest_tv prq_tv isname qast nar_any") &&
        vis(tn_ok) && s(bbn,tn-2) && zs(tn-1) )
    { l[i]=omo2; Z[292]++; if(dbg){print "Z292"}; continue }; #edit


    cst="вбить запихать запихнуть засунуть сунуть";
    if ( bb(tn-4,tn-1,cst) && s(bbn,1) &&
        vis(tn_ok) &&
          w(1,"к") &&
          q(2,"suw_odedda suw_odmnda isname") )
    { l[i]=omo1; Z[293]++; if(dbg){print "Z293"}; continue };
    if ( bb(tn-4,tn-2,cst) && s(bbn,-1) &&
          q(tn-1,"suw_odedvi suw_odmnvi isname") &&
        vis(tn_ok) )
    { l[i]=omo1; Z[294]++; if(dbg){print "Z294"}; continue };
    if ( base(tn-1,cst1) &&
          vis(tn_ok) &&
           bf(1,3,cst2) && s(tn-1,bfn-1) )
    { l[i]=omo2; Z[295]++; if(dbg){print "Z295"}; continue };

    cst3="армия войско отряд";
    if ( bb(tn-4,tn-1,cst) &&
       base(bbn-1,cst3) &&
        vis(tn_ok) && s(bbn-1,tn-1) )
    { l[i]=omo1; Z[296]++; if(dbg){print "Z296"}; continue };

    cst1="вкладывать вложить";
    cst2="деньги доллар золото магия работа серебро сила средство труд усилие";
    if ( bb(tn-5,tn-2,cst2) && s(bbn,tn-1) &&
       base(tn-1,cst1) &&
        vis(tn_ok) )
    { l[i]=omo1; Z[297]++; if(dbg){print "Z297"}; continue };
    if ( bb(tn-5,tn-2,cst1) && s(bbn,tn-1) &&
       base(tn-1,cst2) &&
        vis(tn_ok) )
    { l[i]=omo1; Z[298]++; if(dbg){print "Z298"}; continue };
    if ( base(tn-2,cst2) && z(tn-2) &&
         base(tn-1,cst1) && s(tn-1) &&
          vis(tn_ok) )
    { l[i]=omo1; Z[299]++; if(dbg){print "Z299"}; continue };
    if ( vis(tn_ok) &&
          bf(1,4,cst1) &&
          bf(bfn+1,bfn+4,cst2) && s(0,bfn-1) )
    { l[i]=omo1; Z[300]++; if(dbg){print "Z300"}; continue };

    # _suw_v_castle:start
    # escape
    if ( ba(tn-3,"_suw_v_lock") &&
          w(tn-2,"с") &&
          q(tn-1,"suw_tv") &&
        vis(tn_ok) && s(tn-3,tn-1) )
    { l[i]=omo2; Z[301]++; if(dbg){print "Z301"}; continue };
    #
    if ( ba(tn-1,"_suw_v_castle") && s(tn-1) && vis(tn_ok) )
    { l[i]=omo1; Z[302]++; if(dbg){print "Z302"}; continue };
    if ( ba(tn-2,"_suw_v_castle") && vis(tn_ok) && s(tn-2,tn-1) &&
          q(tn-1,"prl_kred_sr nar_any") )
    { l[i]=omo1; Z[303]++; if(dbg){print "Z303"}; continue };
    if ( bba(tn-6,tn-2,"_suw_v_castle") &&
         qif(bbn+1,tn-2,"prl_ro prq_ro mcop_ro") &&
           q(tn-1,"suw_ro mest_ro mest_3e qast nar_napr isname") &&
         vis(tn_ok) && s(bbn,tn-1) )
    { l[i]=omo1; Z[304]++; if(dbg){print "Z304"}; continue };
    if ( ba(tn-4,"_suw_v_castle") &&
     pre_ro(tn-3) &&
          q(tn-2,"suw_ro") &&
          q(tn-1,"suw_ro") &&
        vis(tn_ok) && s(tn-4,tn-1) )
    { l[i]=omo1; Z[305]++; if(dbg){print "Z305"}; continue };
    # _suw_v_castle:end

    # escape: рука
    cst="рука";
    cst1="вашу его ее их мою нашу свои свою твою";
    cst2="груди грудь затылок колени колено лобок макушку него нее них пояс спину стол";
    cst3="вашими его ее их моими нашими своей своею своими твоими";
    cst4="головами головой затылком коленками коленкой коленом коленями лобком макушкой него нее них поясом спиной столом";
    cst5="вашем ваших его ее их моем моих нашем наших своем своих твоем твоих";
    cst6="бедрах бедре груди грудях затылке колене коленках коленке коленях макушках макушке него нее них поясе столах столе столу";
    if ( (qxs(tn-2,"за на",cst2) ||
          qxs(tn-2,"за на",cst1,cst2) ||
          qxs(tn-2,"за над",cst4) ||
          qxs(tn-2,"за над",cst3,cst4) ||
          qxs(tn-2,"на",cst6) ||
          qxs(tn-2,"на",cst5,cst6) ) &&
         base(tn-1,cst) &&
          vis(tn_ok) && s(tn-1) )
    { l[i]=omo2; Z[306]++; if(dbg){print "Z306"}; continue };
    if ( (qxs(tn-1,"за на",cst2) ||
          qxs(tn-1,"за на",cst1,cst2) ||
          qxs(tn-1,"за над",cst4) ||
          qxs(tn-1,"за над",cst3,cst4) ||
          qxs(tn-1,"на",cst6) ||
          qxs(tn-1,"на",cst5,cst6) ) &&
         base(xsn-1,cst) &&
          vis(tn_ok) && s(tn-1) )
    { l[i]=omo2; Z[307]++; if(dbg){print "Z307"}; continue };
    if ( vvb(tn-5,tn-1) &&
        (qxs(vvn-2,"за на",cst2) ||
         qxs(vvn-2,"за на",cst1,cst2) ||
         qxs(vvn-2,"за над",cst4) ||
         qxs(vvn-2,"за над",cst3,cst4) ||
         qxs(vvn-2,"на",cst6) ||
         qxs(vvn-2,"на",cst5,cst6) ) &&
        base(vvn-1,cst) &&
         vis(tn_ok) && s(tn-1) )
    { l[i]=omo2; Z[308]++; if(dbg){print "Z308"}; continue };
    if ( base(tn-1,cst) && s(tn-1) &&
         (qxs(1,"за на",cst2) ||
          qxs(1,"за на",cst1,cst2) ||
          qxs(1,"за над",cst4) ||
          qxs(1,"за над",cst3,cst4) ||
          qxs(1,"на",cst6) ||
          qxs(1,"на",cst5,cst6) ) &&
          vis(tn_ok) )
    { l[i]=omo2; Z[309]++; if(dbg){print "Z309"}; continue };
    if ( p(-3) && base(-2,cst) && tn == -1 && (p(0)||sz_iili(1)) )
    { l[i]=omo2; Z[310]++; if(dbg){print "Z310"}; continue };

    cst="рука";
    cst1="ладонями пальцами";
    if ( base(tn-1,cst) && s(tn-1,0) &&
            w(1,cst1) &&
          vis(tn_ok) )
    { l[i]=omo2; Z[311]++; if(dbg){print "Z311"}; continue };
    if ( p(-3) && base(-2,cst) && tn == -1 && (p(0)||sz_iili(1)) )
    { l[i]=omo2; Z[312]++; if(dbg){print "Z312"}; continue };



    # _suw_v_lock:start
    if ( ba(tn-1,"_suw_v_lock") &&
        vis(tn_ok) && s(tn-1) )
    { l[i]=omo2; Z[313]++; if(dbg){print "Z313"}; continue };
    if ( vvb(tn-5,tn-1) &&
          ba(vvn,"_suw_v_lock") &&
         vis(tn_ok) )
    { l[i]=omo2; Z[314]++; if(dbg){print "Z314"}; continue };
    if ( bba(tn-6,tn-2,"_suw_v_lock") &&
         qif(bbn+1,tn-2,"prl_ro prq_ro mcop_ro") &&
           q(tn-1,"suw_ro mest_ro mest_3e isname qast") &&
         vis(tn_ok) && s(bbn,tn-1) )
    { l[i]=omo2; Z[315]++; if(dbg){print "Z315"}; continue };
    if ( vvb(tn-5,tn-1) &&
         bba(vvn-6,vvn-1,"_suw_v_lock") &&
         qif(vvn+1,vvn-1,"prl_ro prq_ro mcop_ro") &&
           q(vvn,"suw_ro mest_ro mest_3e isname qast") &&
         vis(tn_ok) && s(bbn,vvn-1) )
    { l[i]=omo2; Z[316]++; if(dbg){print "Z316"}; continue };
    if ( ba(tn-4,"_suw_v_lock") &&
     pre_ro(tn-3) &&
          q(tn-2,"suw_ro") &&
          q(tn-1,"suw_ro") &&
        vis(tn_ok) && s(tn-4,tn-1) )
    { l[i]=omo2; Z[317]++; if(dbg){print "Z317"}; continue };
    if ( ba(tn-3,"_suw_v_lock") &&
     pre_vi(tn-2) &&
          q(tn-1,"suw_vi") &&
        vis(tn_ok) && s(tn-3,tn-1) )
    { l[i]=omo2; Z[318]++; if(dbg){print "Z318"}; continue };
    if ( ba(tn-1,"_suw_v_lock") && s(tn-1) &&
        qxs(1,"за","спиной") )
    { l[i]=omo2; Z[319]++; if(dbg){print "Z319"}; continue };
    # _suw_v_lock:end

    cst="скользнуть";
    cst1="змеем змейкой";
    cst2="первый";
    cst3="воздух пространство";
    if ( w(tn-2,cst1) &&
      base(tn-1,cst) &&
       vis(tn_ok) && s(tn-2,tn-1) )
    { l[i]=omo1; Z[320]++; if(dbg){print "Z320"}; continue };
    if ( base(tn-2,cst2) &&
         base(tn-1,cst) &&
          vis(tn_ok) && s(tn-2,tn-1) )
    { l[i]=omo1; Z[321]++; if(dbg){print "Z321"}; continue };
    if ( qb(tn-9,tn-3,"mest_impe suw_odim") &&
       base(tn-2,cst) &&
          q(tn-1,"nar_napr") &&
        vis(tn_ok) && s(qbn,tn-1) )
    { l[i]=omo1; Z[322]++; if(dbg){print "Z322"}; continue };
    if ( qb(tn-7,tn-3,"gl_ed gl_mn") &&
    sz_iili(tn-2) &&
       base(tn-1,cst) &&
        vis(tn_ok) && s(qbn,tn-1) )
    { l[i]=omo1; Z[323]++; if(dbg){print "Z323"}; continue };
    if ( bb(-7,-4,cst) &&
     pre_vi(bbn+1) &&
        qif(bbn+2,tn-2,"prl_vi prq_vi mcop_vi") &&
       base(tn-1,cst3) &&
        vis(tn_ok) && s(bbn,tn-1) )
    { l[i]=omo1; Z[324]++; if(dbg){print "Z324"}; continue };

    cst="затолкать";
    if ( w(tn-3,"тебя меня вас нас") &&
      base(tn-2,cst) &&
         q(tn-1,"nar_napr") &&
       vis(tn_ok) && s(tn-3,tn-1) )
    { l[i]=omo1; Z[325]++; if(dbg){print "Z325"}; continue };

    # _gl_v_lock_imvi:start
    if ( ba(tn-1,"_gl_v_lock_imvi") &&
        vis(tn_ok) && s(tn-1) )
    { l[i]=omo2; Z[326]++; if(dbg){print "Z326"}; continue };
    if ( ba(tn-3,"_gl_v_lock_imvi") &&
          q(tn-2,"suw_vi") &&
          q(tn-1,"mest_vi mest_3e") &&
        vis(tn_ok) && s(tn-3,tn-1) )
    { l[i]=omo2; Z[327]++; if(dbg){print "Z327"}; continue };
    if (  bba(tn-6,tn-2,"_gl_v_lock_imvi") &&
            q(bbn+1,"suw_vi") &&
          qif(bbn+2,tn-2,"prl_ro prq_ro mcop_ro qis_ro qik_ro suw_ro suw_edne isname") &&
            q(tn-1,"suw_ro isname") &&
          vis(tn_ok) && s(bbn,tn-1) )
    { l[i]=omo2; Z[328]++; if(dbg){print "Z328"}; continue };
    if ( bba(tn-6,tn-2,"_gl_v_lock_imvi") &&
         qif(bbn+1,tn-2,"prl_vi prq_vi mcop_vi qik_vi qis_vi prl_kred_sr nar_any isname") &&
           q(tn-1,"suw_vi") &&
         vis(tn_ok) && s(bbn,tn-1) )
    { l[i]=omo2; Z[329]++; if(dbg){print "Z329"}; continue };
    if (  bba(tn-7,tn-3,"_gl_v_lock_imvi") &&
            q(bbn+1,"suw_vi") &&
          qif(bbn+2,tn-3,"prl_ro prq_ro mcop_ro qis_ro qik_ro suw_ro suw_edne isname") &&
            q(tn-2,"suw_ro isname") &&
            q(tn-1,"mest_ro suw_ro") &&
          vis(tn_ok) && s(bbn,tn-1) )
    { l[i]=omo2; Z[330]++; if(dbg){print "Z330"}; continue };
    if ( vvb(tn-5,tn-1) &&
         bba(vvn-6,vvn-1,"_gl_v_lock_imvi") &&
         qif(bbn+1,vvn-1,"prl_vi prq_vi mcop_vi qik_vi qis_vi prl_kred_sr nar_any isname") &&
           q(vvn,"suw_vi") &&
         vis(tn_ok) && s(bbn,vvn-1) )
    { l[i]=omo2; Z[331]++; if(dbg){print "Z331"}; continue };
    if ( ba(tn-4,"_gl_v_lock_imvi") &&
          q(tn-3,"prl_vi prq_vi mest_vi mest_3e prl_kred_sr nar_step isname") &&
          q(tn-2,"suw_vi") &&
          q(tn-1,"suw_ro") &&
        vis(tn_ok) && s(bbn,tn-1) )
    { l[i]=omo2; Z[332]++; if(dbg){print "Z332"}; continue };
    if ( bba(tn-5,tn-2,"_gl_v_lock_imvi") &&
         qif(bbn+1,tn-2,"prl_tv prq_tv mcop_tv qik_tv qis_tv") &&
           q(tn-1,"suw_tv") &&
         vis(tn_ok) && s(bbn,tn-1) )
    { l[i]=omo2; Z[333]++; if(dbg){print "Z333"}; continue };
    if ( qb(tn-6,tn-3,"pre_vi") &&
         ba(qbn-2,"_gl_v_lock_imvi") &&
          q(qbn-1,"suw_vi mest_vi mest_3e") &&
          q(qbn+1,"suw_vi mest_vi mcop_vi") &&
        qif(qbn+2,tn-2,"prl_tv prq_tv mcop_tv qik_tv qis_tv") &&
          q(tn-1,"suw_tv") &&
        vis(tn_ok) && s(qbn-2,tn-1) )
    { l[i]=omo2; Z[334]++; if(dbg){print "Z334"}; continue }; # _gl_v_lock_imvi suw_vi PRE_VI suw_vi
    if ( ba(tn-6,"_gl_v_lock_imvi") &&
          q(tn-5,"suw_vi mest_vi mest_3e prq_vi") &&
          q(tn-4,"prq_tv") &&
          q(tn-3,"pre_pr") &&
          q(tn-2,"suw_pr") &&
          q(tn-1,"suw_tv") &&
        vis(tn_ok) && s(tn-6,tn-1) )
    { l[i]=omo2; Z[335]++; if(dbg){print "Z335"}; continue };
    if ( bba(tn-9,tn-3,"_gl_v_lock_imvi") &&
         qif(bbn+1,tn-2,"prl_tv prq_tv mest_tv mest_vi qik_tv qis_tv prl_vi prq_vi mest_3e qik_vi qis_vi suw_vi") &&
           q(tn-1,"suw_tv") &&
         vis(tn_ok) && s(bbn,tn-1) )
    { l[i]=omo2; Z[336]++; if(dbg){print "Z336"}; continue }; # _gl_v_lock_imvi suw_vi suw_tv
    if ( bba(tn-9,tn-3,"_gl_v_lock_imvi") &&
         qif(bbn+1,tn-2,"prl_tv prq_tv mest_tv mest_vi qik_tv qis_tv prl_vi prq_vi mest_3e qik_vi qis_vi suw_tv") &&
           q(tn-1,"suw_vi") &&
         vis(tn_ok) && s(bbn,tn-1) )
    { l[i]=omo2; Z[337]++; if(dbg){print "Z337"}; continue }; # _gl_v_lock_imvi suw_tv suw_vi
    if ( bba(tn-7,tn-5,"_gl_v_lock_imvi") && s(bbn) &&
           q(bbn+1,"prl_vi prq_vi") && z(bbn+1) &&
           q(bbn+2,"prq_vi") &&
         qif(bbn+3,tn-3,"mest_tv prl_tv prq_tv mest_3e qik_tv qis_tv") &&
           q(tn-2,"suw_tv") &&
           q(tn-1,"suw_vi") &&
         vis(tn_ok) && s(bbn+2,tn-1) )
    { l[i]=omo2; Z[338]++; if(dbg){print "Z338"}; continue }; # _gl_v_lock_imvi suw_tv suw_vi
    if ( ba(tn-4,"_gl_v_lock_imvi") &&
          q(tn-3,"suw_vi suw_im mest_im mest_vi suw_tv qast isname") &&
          q(tn-2,"suw_vi suw_tv") &&
          q(tn-1,"suw_ro") &&
        vis(tn_ok) && s(tn-4,tn-1) && Qf(tn-3,tn-1,"sz_iili pre_any"))
    { l[i]=omo2; Z[339]++; if(dbg){print "Z339"}; continue }; #inspect
    if ( ba(tn-3,"_gl_v_lock_imvi") &&
          q(tn-2,"suw_vi suw_im mest_im mest_vi suw_tv mest_tv qast isname") &&
          q(tn-1,"suw_vi suw_tv qast nar_any") &&
        vis(tn_ok) && s(tn-3,tn-1) )
    { l[i]=omo2; Z[340]++; if(dbg){print "Z340"}; continue }; #inspect
    if ( ba(tn-2,"_gl_v_lock_imvi") &&
          q(tn-1,"mest_vi mest_tv mest_im mest_3e") &&
        vis(tn_ok) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[341]++; if(dbg){print "Z341"}; continue };
    if ( ba(tn-3,"_gl_v_lock_imvi") &&
          q(tn-2,"prl_srav prl_kred_sr nar_spos") && Q(tn-2,"pre_vi") &&
          q(tn-1,"suw_vi mest_vi suw_im mest_im mest_3e prl_kred_sr prl_srav isname nar_mest") &&
        vis(tn_ok) && s(tn-3,tn-1) )
    { l[i]=omo2; Z[342]++; if(dbg){print "Z342"}; continue };
    if ( ba(tn-2,"_gl_v_lock_imvi") &&
          q(tn-1,"suw_im prl_kred_sr prl_srav isname nar_mest qis_vi") &&
        vis(tn_ok) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[343]++; if(dbg){print "Z343"}; continue };
    if ( qb(tn-5,tn-2,"pre_vi") &&
         ba(qbn-2,"_gl_v_lock_imvi") &&
          q(qbn-1,"suw_vi") &&
        qif(qbn+1,tn-2,"prl_vi mcop_vi prq_vi qis_vi qik_vi") &&
          q(tn-1,"suw_vi mest_vi") &&
        vis(tn_ok) && s(qbn-2,tn-1) )
    { l[i]=omo2; Z[344]++; if(dbg){print "Z344"}; continue }; # _gl_v_lock_imvi suw_vi PRE_VI suw_vi
    if ( qb(tn-5,tn-2,"pre_tv") &&
         ba(qbn-1,"_gl_v_lock_imvi") &&
        qif(qbn+1,tn-2,"prl_tv mcop_tv prq_tv qis_tv qik_tv") &&
          q(tn-1,"suw_tv mest_tv") &&
        vis(tn_ok) && s(qbn-1,tn-1) )
    { l[i]=omo2; Z[345]++; if(dbg){print "Z345"}; continue }; # _gl_v_lock_imvi PRE_TV suw_tv
    if ( qb(tn-6,tn-3,"pre_tv") &&
         ba(qbn-1,"_gl_v_lock_imvi") &&
        qif(qbn+1,tn-3,"prl_tv mcop_tv prq_tv qis_tv qik_tv") &&
          q(tn-2,"suw_tv mest_tv") &&
          q(tn-1,"suw_vi") &&
        vis(tn_ok) && s(qbn-1,tn-1) )
    { l[i]=omo2; Z[346]++; if(dbg){print "Z346"}; continue }; # _gl_v_lock_imvi PRE_TV suw_tv suw_vi
    if ( qb(tn-7,tn-4,"pre_tv") &&
         ba(qbn-1,"_gl_v_lock_imvi") &&
        qif(qbn+1,tn-4,"prl_tv mcop_tv prq_tv qis_tv qik_tv") &&
          q(tn-3,"suw_tv mest_tv") &&
          q(tn-2,"prl_vi mcop_vi prq_vi") &&
          q(tn-1,"suw_vi") &&
        vis(tn_ok) && s(qbn-1,tn-1) )
    { l[i]=omo2; Z[347]++; if(dbg){print "Z347"}; continue }; # _gl_v_lock_imvi PRE_TV suw_tv suw_vi
      if ( qb(tn-5,tn-2,"pre_tv") &&
           ba(qbn-2,"_gl_v_lock_imvi") &&
            q(qbn-1,"suw_vi mest_vi mest_3e prq_vi prl_kred_sr") &&
          qif(qbn+1,tn-2,"prl_tv mcop_tv prq_tv qis_tv qik_tv") &&
            q(tn-1,"suw_tv mest_tv") &&
          vis(tn_ok) && s(qbn-2,tn-1) )
    { l[i]=omo2; Z[348]++; if(dbg){print "Z348"}; continue }; # _gl_v_lock_imvi suw_vi PRE_TV suw_tv
      if ( qb(tn-6,tn-3,"pre_tv") &&
          bba(qbn-6,qbn-2,"_gl_v_lock_imvi") &&
          qif(bbn+1,qbn-2,"prl_im prl_vi mest_im mest_vi mest_3e prq_im prq_vi prl_kred_sr") &&
            q(qbn-1,"suw_vi suw_im mest_im mest_vi mest_3e prq_vi prl_kred_sr") &&
          qif(qbn+1,tn-3,"prl_tv mcop_tv prq_tv qis_tv qik_tv") &&
            q(tn-2,"suw_tv mest_tv") &&
            q(tn-1,"suw_vi isname") &&
          vis(tn_ok) && s(qbn-2,tn-1) )
    { l[i]=omo2; Z[349]++; if(dbg){print "Z349"}; continue }; # _gl_v_lock_imvi suw_vi PRE_TV suw_tv
    if ( qb(tn-6,tn-3,"pre_ro") &&
         ba(qbn-1,"_gl_v_lock_imvi") &&
        qif(qbn+1,tn-3,"prl_ro mcop_ro prq_ro qis_ro qik_ro") &&
          q(tn-2,"suw_ro mest_ro") &&
          q(tn-1,"suw_vi prq_vi mest_vi mest_3e") &&
        vis(tn_ok) && s(qbn-1,tn-1) )
    { l[i]=omo2; Z[350]++; if(dbg){print "Z350"}; continue }; # _gl_v_lock_imvi PRE_RO suw_ro suw_vi
    if ( qb(tn-5,tn-2,"pre_ro") &&
         ba(qbn-2,"_gl_v_lock_imvi") &&
          q(qbn-1,"suw_vi prq_vi mest_vi mest_3e") &&
        qif(qbn+1,tn-2,"prl_ro mcop_ro prq_ro qis_ro qik_ro") &&
          q(tn-1,"suw_ro mest_ro") &&
        vis(tn_ok) && s(qbn-2,tn-1) )
    { l[i]=omo2; Z[351]++; if(dbg){print "Z351"}; continue }; # _gl_v_lock_imvi suw_vi PRE_RO suw_ro
    if ( qb(tn-6,tn-3,"pre_ro") &&
        bba(qbn-5,qbn-2,"_gl_v_lock_imvi") &&
        qif(bbn+1,qbn-2,"prl_vi mcop_vi prq_vi qis_vi qik_vi qast") &&
          q(qbn-1,"suw_vi prq_vi mest_vi mest_3e") &&
        qif(qbn+1,tn-3,"prl_ro mcop_ro prq_ro qis_ro qik_ro") &&
          q(tn-2,"suw_ro mest_ro") &&
          q(tn-1,"suw_vi prq_vi mest_vi mest_3e") &&
        vis(tn_ok) && s(bbn,tn-1) )
    { l[i]=omo2; Z[352]++; if(dbg){print "Z352"}; continue }; # _gl_v_lock_imvi <SUW_VI PRE_RO <suw_ro suw_vi
    if ( qb(tn-5,tn-2,"pre_ro") &&
         ba(qbn-1,"_gl_v_lock_imvi") &&
        qif(qbn+1,tn-2,"prl_ro mcop_ro prq_ro qis_ro qik_ro") &&
          q(tn-1,"suw_ro mest_ro") &&
        vis(tn_ok) && s(qbn-2,tn-1) )
    { l[i]=omo2; Z[353]++; if(dbg){print "Z353"}; continue }; # _gl_v_lock_imvi suw_vi PRE_RO suw_ro
    if ( qb(tn-5,tn-3,"pre_pr") &&
         ba(qbn-3,"_gl_v_lock_imvi") &&
          q(qbn-2,"suw_vi prq_vi") &&
          q(qbn-1,"suw_ro prq_ro") &&
        qif(qbn+1,tn-3,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
          q(tn-2,"suw_pr") &&
          q(tn-1,"suw_ro mest_ro suw_vi mest_vi mest_3e") &&
        vis(tn_ok) && s(qbn-3,tn-1) )
    { l[i]=omo2; Z[354]++; if(dbg){print "Z354"}; continue }; # _gl_v_lock_imvi suw_vi suw_ro PRE_PR <suw_pr suw_ro
    if ( qb(tn-5,tn-2,"pre_pr") &&
        bba(qbn-5,qbn-2,"_gl_v_lock_imvi") &&
        qif(bbn+1,qbn-2,"prl_vi mest_vi prq_vi") &&
          q(qbn-1,"suw_vi prq_vi mest_vi mest_3e") &&
        qif(qbn+1,tn-2,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
          q(tn-1,"suw_pr") &&
        vis(tn_ok) && s(qbn-2,tn-1) )
    { l[i]=omo2; Z[355]++; if(dbg){print "Z355"}; continue }; # _gl_v_lock_imvi suw_vi suw_ro PRE_PR <suw_pr
    if ( qb(tn-6,tn-3,"pre_pr") &&
         ba(qbn-2,"_gl_v_lock_imvi") &&
          q(qbn-1,"suw_vi prq_vi mest_vi mest_3e") &&
        qif(qbn+1,tn-3,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
          q(tn-2,"suw_pr") &&
          q(tn-1,"suw_vi prq_vi mest_vi mest_3e") &&
        vis(tn_ok) && s(qbn-2,tn-1) )
    { l[i]=omo2; Z[356]++; if(dbg){print "Z356"}; continue }; # _gl_v_lock_imvi suw_vi suw_ro PRE_PR <suw_pr suw_vi
    if ( qb(tn-5,tn-3,"pre_pr") &&
         ba(qbn-1,"_gl_v_lock_imvi") &&
        qif(qbn+1,tn-3,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
          q(tn-2,"suw_pr") &&
          q(tn-1,"suw_ro mest_ro suw_vi mest_vi mest_3e") &&
        vis(tn_ok) && s(qbn-1,tn-1) )
    { l[i]=omo2; Z[357]++; if(dbg){print "Z357"}; continue }; # _gl_v_lock_imvi PRE_PR <suw_pr suw_ro
    if ( qb(tn-5,tn-2,"pre_pr") &&
         ba(qbn-1,"_gl_v_lock_imvi") &&
        qif(qbn+1,tn-2,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
          q(tn-1,"suw_pr") &&
        vis(tn_ok) && s(qbn-1,tn-1) )
    { l[i]=omo2; Z[358]++; if(dbg){print "Z358"}; continue }; # _gl_v_lock_imvi PRE_PR <suw_pr
    if ( qb(tn-5,tn-2,"pre_pr") &&
         ba(qbn-3,"_gl_v_lock_imvi") &&
          q(qbn-2,"pre_ro") &&
          q(qbn-1,"suw_ro mest_ro") &&
        qif(qbn+1,tn-2,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
          q(tn-1,"suw_pr") &&
        vis(tn_ok) && s(qbn-3,tn-1) )
    { l[i]=omo2; Z[359]++; if(dbg){print "Z359"}; continue }; # _gl_v_lock_imvi PRE_PR <suw_pr
    if ( qb(tn-5,tn-2,"pre_pr") &&
         ba(qbn-3,"_gl_v_lock_imvi") &&
          q(qbn-2,"pre_ro") &&
          q(qbn-1,"mcop_ro") &&
        qif(qbn+1,tn-2,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
          q(tn-1,"suw_pr") &&
        vis(tn_ok) && s(qbn-1,tn-1) )
    { l[i]=omo2; Z[360]++; if(dbg){print "Z360"}; continue }; # _gl_v_lock_imvi PRE_PR <suw_pr
    if ( qb(tn-6,tn-3,"pre_pr") &&
         ba(qbn-1,"_gl_v_lock_imvi") &&
          q(qbn+1,"suw_pr") &&
        qif(qbn+2,tn-2,"prl_vi mcop_vi prq_vi qis_vi qik_vi") &&
          q(tn-1,"suw_vi") &&
        vis(tn_ok) && s(qbn-1,tn-1) )
    { l[i]=omo2; Z[361]++; if(dbg){print "Z361"}; continue }; # _gl_v_lock_imvi PRE_PR <suw_pr
    if ( qb(tn-7,tn-4,"pre_pr") &&
         ba(qbn-1,"_gl_v_lock_imvi") &&
          q(qbn+1,"suw_pr") &&
        qif(qbn+2,tn-3,"prl_vi mcop_vi prq_vi qis_vi qik_vi") &&
          q(tn-2,"suw_vi") &&
          q(tn-1,"suw_ro") &&
        vis(tn_ok) && s(qbn-1,tn-1) )
    { l[i]=omo2; Z[362]++; if(dbg){print "Z362"}; continue }; # _gl_v_lock_imvi PRE_PR <suw_pr
    if ( ba(tn-6,"_gl_v_lock_imvi") &&
          q(tn-5,"suw_vi mest_vi mest_3e") &&
     pre_pr(tn-4) && s(tn-6,tn-4) &&
          q(tn-3,"suw_pr") && z(tn-3) &&
         sz(tn-2) &&
          q(tn-1,"suw_vi mest_vi mest_3e") &&
        vis(tn_ok) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[363]++; if(dbg){print "Z363"}; continue };
    if ( !(bba(tn-4,tn-1,"_gl_v_castle_imvi") && s(bbn,tn-1) && Qb(bbn+1,tn-1,"sz_iili") ) && vis(tn_ok) &&
           bfa(1,3,"_gl_v_lock_imvi") && s(0,bfn-1) && Qf(1,bfn,"sz_iili") )
    { l[i]=omo2; Z[364]++; if(dbg){print "Z364"}; continue };

    cst1="горло кисти кисть клинок ладони ладонь ладошки ладошку лодыжки лодыжку ноги ногу ножки ножку палец пальцы ремень руки руку талию шеи шею";
    if ( ba(tn-3,"_gl_v_lock_imvi") &&
     pre_vi(tn-2) &&
          w(tn-1,cst1) &&
        vis(tn_ok) && s(tn-3,tn-1) )
    { l[i]=omo2; Z[365]++; if(dbg){print "Z365"}; continue };
    if ( wb(tn-5,tn-1,cst1) && s(tn-1) &&
          q(wbn-1,"narph_any") &&
         ba(xwn-1,"_gl_v_lock_imvi") && s(xwn-1) &&
        vis(tn_ok) )
    { l[i]=omo2; Z[366]++; if(dbg){print "Z366"}; continue };
    # _gl_v_lock_imvi:end


    # _v_zamok:start
    # cst1 выше
    if ( vis(tn_ok) &&
          ba(1,"_v_zamok") &&
           w(2,cst1) && s(0,1) )
    { l[i]=omo2; Z[367]++; if(dbg){print "Z367"}; continue };

    if ( ba(tn-2,"_v_zamok") &&
          w(tn-1,cst1) &&
        vis(tn_ok) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[368]++; if(dbg){print "Z368"}; continue };
    if ( bba(tn-6,tn-3,"_v_zamok") &&
           w(bbn+1,cst1) &&
         qif(bbn+2,tn-2,"prl_ro mest_ro mest_3e prq_ro") &&
           q(tn-1,"suw_ro suw_edne") &&
         vis(tn_ok) && s(tn-3,tn-1) )
    { l[i]=omo2; Z[369]++; if(dbg){print "Z369"}; continue };
    if ( bba(tn-5,tn-2,"_v_zamok") &&
         qif(bbn+1,tn-2,"prl_vi prq_vi mcop_vi nar_mest") &&
           w(tn-1,cst1) &&
         vis(tn_ok) && s(bbn,tn-1) )
    { l[i]=omo2; Z[370]++; if(dbg){print "Z370"}; continue };
    if ( ba(tn-4,"_v_zamok") &&
          w(tn-3,cst1) &&
     pre_ro(tn-2) &&
          q(tn-1,"suw_ro") &&
        vis(tn_ok) && s(tn-4,tn-1) )
    { l[i]=omo2; Z[371]++; if(dbg){print "Z371"}; continue };
    if ( base(tn-4,cst1) &&
           ba(tn-3,"_v_zamok") &&
       pre_tv(tn-2) &&
            q(tn-1,"suw_tv mest_tv") &&
          vis(tn_ok) && s(tn-4,tn-1) )
    { l[i]=omo2; Z[372]++; if(dbg){print "Z372"}; continue };
    if ( ba(tn-4,"_v_zamok") &&
          w(tn-3,cst1) &&
     pre_tv(tn-2) &&
          q(tn-1,"suw_tv mest_tv") &&
        vis(tn_ok) && s(tn-4,tn-1) )
    { l[i]=omo2; Z[373]++; if(dbg){print "Z373"}; continue };
    if ( ba(tn-4,"_v_zamok") &&
          w(tn-3,cst1) &&
     pre_pr(tn-2) &&
          q(tn-1,"suw_pr mest_pr") &&
        vis(tn_ok) && s(tn-4,tn-1) )
    { l[i]=omo2; Z[374]++; if(dbg){print "Z374"}; continue };
    if ( ba(tn-4,"_v_zamok") &&
          q(tn-3,"suw_vi mest_vi isname") &&
     pre_vi(tn-2) &&
          w(tn-1,cst1) &&
        vis(tn_ok) && s(tn-4,tn-1) )
    { l[i]=omo2; Z[375]++; if(dbg){print "Z375"}; continue };
    if ( vis(tn_ok) &&
        base(1,cst1) &&
           q(2,"nar_kaq") &&
          ba(3,"_v_zamok") && s(0,2) )
    { l[i]=omo2; Z[376]++; if(dbg){print "Z376"}; continue };

    cst2="хватом";
    if ( ba(tn-2,"_v_zamok") &&
          w(tn-1,cst2) &&
        vis(tn_ok) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[377]++; if(dbg){print "Z377"}; continue };
    # _v_zamok:end

    if ( base(tn-2,"пуля") &&
         base(tn-1,"угодить") &&
          vis(tn_ok) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[378]++; if(dbg){print "Z378"}; continue };

    cst="быстрее быстро все назад обратно скорее";
    if ( w(tn-1,cst) &&
       vis(tn_ok) && p(tn-2,",") && p(0) )
    { l[i]=omo1; Z[379]++; if(dbg){print "Z379"}; continue };

    if ( p(-2,",") && tn==-1 && cap(-1) && p(0) )
    { l[i]=omo1; Z[380]++; if(dbg){print "Z380"}; continue };

    cst="ввести вводить внедриться войти вползать врезаться всадить вторгнуться входить загнать зайти засадить идти лезть пойти поместить попадать попасть пройти \
         проникать проникнуть проскальзывать проскользнуть проходить спрятаться юркнуть";
    cst1="карту ключ ключи ключик код отвертка отмычка";
    cst2="картой ключом отверткой отмычкой";
    cst3=cst1 " " cst2
    if ( bb(tn-6,tn-2,cst) && s(bbn,tn-1) &&
          q(bbn+1,"mest_vi mest_3e") &&
        qsb(bbn-10,bbn-1,",") &&
         bb(qsn-10,qsn,cst1) && s(bbn,qsn-1) &&
        vis(tn_ok) )
    { l[i]=omo2; Z[381]++; if(dbg){print "Z381"}; continue };
    if ( bb(tn-3,tn-1,cst1) && s(bbn,tn-1) &&
        qif(bbn+1,tn-2,"nar_any") &&
       base(tn-1,cst) &&
        qif(tn+1,-1,"mest_edmuvi prl_edmuvi prq_edmuvi prq_mnvi suw_da mest_da prl_da suw_tv prl_tv mest_tv suw_edne isname") && s(tn,-1) )
    { l[i]=omo2; Z[382]++; if(dbg){print "Z382"}; continue };
    if ( base(tn-1,cst) &&
           bf(1,3,cst1) &&
          qif(1,bfn-1,"prl_vi mcop_vi prq_vi prl_im mcop_im prq_im") &&
          vis(tn_ok) && s(tn-1,bfn-1) )
    { l[i]=omo2; Z[383]++; if(dbg){print "Z383"}; continue }; #check
    if (   bf(1,3,cst1) &&
          qif(1,bfn-1,"prl_vi mcop_vi prq_vi prl_im mcop_im prq_im") &&
         base(bfn+1,cst) &&
          vis(tn_ok) && s(tn,bfn-1) )
    { l[i]=omo2; Z[384]++; if(dbg){print "Z384"}; continue }; #check
    if ( wb(tn-3,tn-1,cst3) &&
        qif(wbn+1,tn-1,"nar_any qast_any prl_any") && s(wbn,tn-1) )
    { l[i]=omo2; Z[385]++; if(dbg){print "Z385"}; continue };
    if (   wf(1,5,cst3) &&
          qif(1,wfn-2,"nar_any prl_kred_sr mest_any prl_any mod_bz") &&
         base(wfn-1,cst) && s(0,wfn-1) )
    { l[i]=omo2; Z[386]++; if(dbg){print "Z386"}; continue };
    if (  p(tn-2,",") &&
          w(tn-1,cst1) && s(tn-1) )
    { l[i]=omo2; Z[387]++; if(dbg){print "Z387"}; continue };
    if (  base(tn-3,"рука палец") && s(tn-3) &&
          base(tn-2,"дрожать трястись") && z(tn-2) &&
            sz(tn-1) &&
             q(1,"suw_im mest_im prq_im") &&
          base(2,cst) &&
           vis(tn_ok) && s(tn-1,1) )
    { l[i]=omo2; Z[388]++; if(dbg){print "Z388"}; continue };

    cst="ввести вводить внедриться вползать врезаться всадить вторгнуться входить загнать зайти засадить идти лезть пойти поместить попадать попасть пройти проникать \
         проскальзывать проскользнуть проходить спрятаться юркнуть";
    cst1="войти";
    if ( bba(tn-6,tn-2,"_lock_parts") &&
          sv(bbn,tn-2,"[….:;!?]") &&
        base(tn-1,cst) &&
         vis(tn_ok) && s(tn-1) )
    { l[i]=omo2; Z[389]++; if(dbg){print "Z389"}; continue }; #token
    if ( bba(tn-6,tn-2,"_lock_parts") &&
           W(bbn+1,"и") &&
          sv(bbn,tn-2,"[….:;!?]") &&
        base(tn-1,cst1) &&
         vis(tn_ok) && s(tn-1) )
    { l[i]=omo2; Z[390]++; if(dbg){print "Z390"}; continue }; #token
    if ( bba(tn-6,tn-2,"_lock_parts") &&
        base(tn-1,"проникнуть просочиться") &&
         vis(tn_ok) && s(bbn,tn-1) )
    { l[i]=omo2; Z[391]++; if(dbg){print "Z391"}; continue }; #token

    # escape
    cst="булавка камень коготь копье магазин обойма очередь паста пуля рожок язык";
    cst1="выпустить запустить засадить";
    if ( base(tn-3,cst1) &&
            q(tn-2,"qik_vi prl_vi mest_vi") &&
         base(tn-1,cst) &&
          vis(tn_ok) && s(tn-3,tn-1) )
    { l[i]=omo2; Z[392]++; if(dbg){print "Z392"}; continue };
    if ( base(tn-2,cst1) &&
         base(tn-1,cst) &&
          vis(tn_ok) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[393]++; if(dbg){print "Z393"}; continue };
    if ( base(tn-1,cst1) && s(-1) &&
          vis(tn_ok) &&
         base(1,cst) && s(0) )
    { l[i]=omo2; Z[394]++; if(dbg){print "Z394"}; continue };
    if ( base(tn-1,cst1) &&
          vis(tn_ok) &&
            q(1,"mest_vi prl_vi qik_vi") &&
         base(2,cst) && s(tn-1,1) )
    { l[i]=omo2; Z[395]++; if(dbg){print "Z395"}; continue };
    # escape


    #
    cst="всадить въехать загнать заехать засадить захватить провести";
    cst1="затвор коленка колено кулак локоть нога рука шея";
    if ( bb(tn-5,tn-2,cst1) && s(bbn,tn-1) &&
       base(tn-1,cst) &&
        vis(tn_ok) )
    { l[i]=omo2; Z[396]++; if(dbg){print "Z396"}; continue };
    if ( bb(tn-5,tn-2,cst) && s(bbn,tn-1) &&
         bb(bbn-1,tn-1,cst1) &&
        vis(tn_ok) )
    { l[i]=omo2; Z[397]++; if(dbg){print "Z397"}; continue };
    if ( base(tn-3,cst) &&
            q(tn-2,"mest_vi mest_3e suw_vi") &&
         base(tn-1,cst1) &&
          vis(tn_ok) && s(tn-3,tn-1) )
    { l[i]=omo2; Z[398]++; if(dbg){print "Z398"}; continue };

    # _gl_v_castle_imvi: begin
    # _lock_parts:start - части замка́
    #  escape1
    if ( bba(tn-5,tn-2,"_gl_v_castle_imvi") &&
         qif(bbn+1,tn-2,"prl_any prq_any mest_any") &&
          ba(tn-1,"_lock_parts") &&
         vis(tn_ok) && s(bbn,tn-1) )
    { l[i]=omo2; Z[399]++; if(dbg){print "Z399"}; continue };
    if ( ba(tn-4,"_gl_v_castle_imvi") &&
         ba(tn-3,"_lock_parts") &&
          q(tn-2,"suw_ro") &&
          q(tn-1,"nar_napr") &&
        vis(tn_ok) && s(tn-4,tn-1) )
    { l[i]=omo2; Z[400]++; if(dbg){print "Z400"}; continue };
    if ( ba(tn-4,"_gl_v_castle_imvi") &&
          q(tn-3,"suw_ro") &&
         ba(tn-2,"_lock_parts") &&
          q(tn-1,"nar_napr") &&
        vis(tn_ok) && s(tn-4,tn-1) )
    { l[i]=omo2; Z[401]++; if(dbg){print "Z401"}; continue };

    #
    cst="лезть попадать попасть";
    if ( bb(-6,-3,cst) &&
        qif(bbn+1,-3,"qast nar_any") &&
        (ba(-2,"_lock_parts")||w(-2,"им")) &&
          w(-1,"в") && s(bbn,-1) )
    { l[i]=omo2; Z[402]++; if(dbg){print "Z402"}; continue };
    if ( bb(tn-6,tn-3,cst) &&
        qif(bbn+1,tn-3,"qast nar_any") &&
         ba(tn-2,"_lock_parts") &&
          q(tn-1,"suw_ro") &&
        vis(tn_ok) && s(bbn,tn-1) )
    { l[i]=omo2; Z[403]++; if(dbg){print "Z403"}; continue };
    if ( base(tn-1,cst) &&
          vis(tn_ok) &&
          bfa(1,4,"_lock_parts") &&
          qif(1,bfn-1,"prl_tv mcop_tv prq_vi") && s(tn-1,bfn-1) )
    { l[i]=omo2; Z[404]++; if(dbg){print "Z404"}; continue };
    # _lock_parts:end

    # _gl_v_castle_imvi: escape2
    cst="попадать попасть";
    if ( base(tn-4,cst) &&
            q(tn-3,"suw_im mest_im isname") &&
       pre_da(tn-2) &&
            q(tn-1,"mest_da suw_da isname") &&
          vis(tn_ok) && s(tn-4,tn-1) )
    { l[i]=omo1; Z[405]++; if(dbg){print "Z405"}; continue };
    cst="вынести открывать снести";
    cst1="выстрелом пинком пулей ударом";
    if ( base(tn-3,cst) &&
            q(tn-2,"nar_any mest_vi mest_3e suw_vi") &&
            w(tn-1,cst1) &&
          vis(tn_ok) && s(tn-3,tn-2) && zs(tn-1) )
    { l[i]=omo2; Z[406]++; if(dbg){print "Z406"}; continue };
    if ( base(tn-4,cst) &&
            q(tn-3,"nar_any mest_vi mest_3e suw_vi") &&
            q(tn-2,"prl_tv mest_tv mest_3e prq_tv") &&
            w(tn-1,cst1) &&
          vis(tn_ok) && s(tn-4,tn-2) && zs(tn-1) )
    { l[i]=omo2; Z[407]++; if(dbg){print "Z407"}; continue };
    cst="впустить пропустить";
    if ( base(tn-3,cst) &&
            q(tn-2,"prl_vi prl_im mest_vi mest_im mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") &&
            q(tn-1,"suw_vi suw_im mest_vi suw_edne mest_im mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") &&
          vis(tn_ok) && s(tn-3,tn-2) && zs(tn-1) && z(0) &&
           ba(1,"_lock_pe") &&
           ba(2,"_lock_parts") && s(1) )
    { l[i]=omo2; Z[408]++; if(dbg){print "Z408"}; continue };

    cst="айда бегом брысь верхом домой надо надолго нужно обратно пешком ползком пора сюда";
    if ( w(tn-1,cst) &&
       vis(tn_ok) && (zs(tn-1)||sc(tn-1,"—")) )
    { l[i]=omo1; Z[409]++; if(dbg){print "Z409"}; continue };
    if ( vis(tn_ok) &&
           w(1,cst) && s(0) )
    { l[i]=omo1; Z[410]++; if(dbg){print "Z410"}; continue };


    # _gl_v_castle_imvi: main

    # поиск по _gl_v_castle_imvi
    bb_n=""; bba(tn-8,tn-1,"_gl_v_castle_imvi"); bb_n = bbn;

    if ( vgle(bb_n,tn-8,tn-3) &&
            q(bb_n+1,"prl_vi mest_vi mest_3e prq_vi qik_vi") &&
            q(bb_n+2,"suw_vi mest_vi mest_3e") &&
          qif(bb_n+3,tn-1,"prl_kred_sr nar_any qast") &&
          vis(tn_ok) && s(bb_n,tn-1) )
    { l[i]=omo1; Z[411]++; if(dbg){print "Z411"}; continue };
    if ( vgle(bb_n,tn-5,tn-2) &&
          qif(bb_n+1,tn-2,"prl_im prq_im mest_im") &&
            q(tn-1,"suw_im name_im_sy") &&
          vis(tn_ok) && s(bb_n,tn-1) )
    { l[i]=omo1; Z[412]++; if(dbg){print "Z412"}; continue };
    if ( vgle(bb_n,tn-7,tn-3) &&
          qif(bb_n+1,tn-3,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi") &&
            q(tn-2,"suw_vi mest_vi mest_3e suw_mnsq prq_vi qis_vi isname") &&
            q(tn-1,"nar_any") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[413]++; if(dbg){print "Z413"}; continue };
    if ( vgle(bb_n,tn-5,tn-2) &&
            q(bb_n+1,"prq_vi suw_vi") &&
          qif(bb_n+2,tn-1,"suw_vi mest_vi mest_3e suw_mnsq qis_vi isname") &&
          vis(tn_ok) && s(bb_n,tn-1) )
    { l[i]=omo1; Z[414]++; if(dbg){print "Z414"}; continue };
    if ( vgle(bb_n,tn-6,tn-2) &&
          qif(bb_n+1,tn-2,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any gl_in qast") &&
            q(tn-1,"suw_vi mest_vi mest_3e suw_mnsq qis_vi qast name_vi_sy isname") &&
          vis(tn_ok) && s(bb_n,tn-1) )
    { l[i]=omo1; Z[415]++; if(dbg){print "Z415"}; continue };
    if ( vgle(bb_n,tn-5,tn-2) &&
          qif(bb_n+1,tn-2,"mest_vi prq_vi suw_vi prl_im mest_3e qast nar_any name_vi_sy isname") &&
            q(tn-1,"suw_im suw_edne mest_im name_vi_sy isname qast prl_vi mest_vi") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[416]++; if(dbg){print "Z416"}; continue };
    if ( vgle(bb_n,tn-5,tn-2) &&
            q(bb_n+1,"suw_im suw_edne mest_im name_vi_sy isname qast prl_vi mest_vi") &&
          qif(bb_n+2,tn-1,"mest_vi prq_vi suw_vi prl_im mest_3e qast nar_any name_vi_sy isname") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[417]++; if(dbg){print "Z417"}; continue };
    if ( vgle(bb_n,tn-6,tn-3) &&
          qif(bb_n+1,tn-3,"mest_vi prq_vi suw_vi mest_3e name_vi_sy isname nar_any qast") &&
            q(tn-2,"suw_im suw_edne mest_im name_vi_sy isname") &&
            q(tn-1,"nar_any") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[418]++; if(dbg){print "Z418"}; continue };
    if ( vgle(bb_n,tn-6,tn-2) &&
            q(bb_n+1,"suw_vi suw_edne isname nar_any") &&
          qif(bb_n+2,tn-1,"suw_ro prq_ro suw_edne isname nar_any") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[419]++; if(dbg){print "Z419"}; continue };
    if ( vgle(bb_n,tn-5,tn-2) &&
          qif(bb_n+1,tn-2,"prl_tv mest_tv mest_3e suw_tv prq_tv gl_in prl_kred_sr nar_any qast name_tv_sy isname") &&
            q(tn-1,"suw_tv mest_tv prq_tv prl_tv suw_edne mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[420]++; if(dbg){print "Z420"}; continue };
    if ( vgle(bb_n,tn-5,tn-2) &&
            q(bb_n+1,"suw_tv mest_tv prq_tv prl_tv suw_edne mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") &&
          qif(bb_n+2,tn-2,"prl_vi mest_vi mest_3e suw_vi prq_vi gl_in prl_kred_sr nar_any qast name_tv_sy isname") &&
            q(tn-1,"suw_vi mest_vi mest_3e name_vi_sy isname") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[421]++; if(dbg){print "Z421"}; continue };
    if ( vgle(bb_n,tn-6,tn-2) &&
            q(bb_n+1,"suw_vi mest_vi mest_3e name_vi_sy isname") &&
          qif(bb_n+2,tn-2,"prl_tv mest_tv mest_3e gl_in prl_kred_sr nar_any qast name_tv_sy isname") &&
            q(tn-1,"suw_tv mest_tv prq_tv prl_tv suw_edne mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[422]++; if(dbg){print "Z422"}; continue };
    if ( vgle(bb_n,tn-6,tn-2) &&
          qif(bb_n+1,tn-2,"prl_vi prq_vi mest_vi mest_3e") &&
            q(tn-1,"suw_im suw_edne mest_vi mest_im mest_3e name_vi_sy isname") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[423]++; if(dbg){print "Z423"}; continue };
    if ( vgle(bb_n,tn-6,tn-2) &&
          qif(bb_n+1,tn-2,"prl_da mest_da prq_da gl_in nar_any qast_any") &&
            q(tn-1,"mest_da suw_da prq_da suw_edne isname") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[424]++; if(dbg){print "Z424"}; continue };
    if ( vgle(bb_n,tn-6,tn-2) &&
            q(bb_n+1,"mest_da suw_da suw_edne isname") &&
          qif(bb_n+2,tn-2,"prl_vi mest_vi prq_vi nar_any qast_any") &&
            q(tn-1,"suw_vi suw_edne mest_vi mest_3e nar_napr") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[425]++; if(dbg){print "Z425"}; continue };
    if ( vgle(bb_n,tn-6,tn-2) &&
          qif(bb_n+1,tn-3,"prl_vi mest_vi prq_vi nar_any qast_any") &&
            q(tn-2,"suw_vi suw_edne mest_vi mest_3e nar_napr") &&
            q(tn-1,"mest_da suw_da suw_edne isname") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[426]++; if(dbg){print "Z426"}; continue };
    if ( vgle(bb_n,tn-6,tn-2) &&
          qif(bb_n+1,tn-2,"prl_ro mest_ro prq_ro nar_any qast_any") &&
            q(tn-1,"mest_ro suw_ro prq_ro suw_edne isname") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[427]++; if(dbg){print "Z427"}; continue };

    if ( vgle(bb_n,tn-6,tn-2) &&
            q(bb_n+1,"suw_vi suw_edne mest_vi mest_3e") &&
          qif(bb_n+2,tn-1,"prl_ro prq_ro mest_ro suw_mnsq mest_3e suw_ro prl_kred_sr") &&
          vis(tn_ok) && s(bb_n,tn-1) )
    { l[i]=omo1; Z[428]++; if(dbg){print "Z428"}; continue };
    if ( vgle(bb_n,tn-7,tn-3) &&
          qif(bb_n+1,tn-3,"prl_vi prq_vi mest_vi mest_3e") &&
            q(tn-2,"suw_vi suw_edne") &&
            q(tn-1,"suw_ro prl_kred_sr") &&
          vis(tn_ok) && s(bb_n,tn-1) )
    { l[i]=omo1; Z[429]++; if(dbg){print "Z429"}; continue };

    if ( vgle(bb_n,tn-6,tn-3) &&
            q(bb_n+1,"suw_vi suw_edne mest_vi mest_3e") &&
          qif(bb_n+2,tn-2,"prl_da prq_da mest_da mest_3e") &&
            q(tn-1,"suw_da isname") &&
          vis(tn_ok) && s(bb_n,tn-1) )
    { l[i]=omo1; Z[430]++; if(dbg){print "Z430"}; continue };
    if ( vgle(bb_n,tn-5,tn-2) &&
          qif(bb_n+1,tn-2,"prl_da prq_da mest_da mest_3e") &&
            q(tn-1,"suw_da mest_da") &&
          vis(tn_ok) && s(bb_n,tn-1) )
    { l[i]=omo1; Z[431]++; if(dbg){print "Z431"}; continue };
    if ( vgle(bb_n,tn-4,tn-2) &&
          qif(bb_n+1,tn-1,"gl_in gl_aux_be qast_any") &&
          vis(tn_ok) && s(bb_n,tn-1) )
    { l[i]=omo1; Z[432]++; if(dbg){print "Z432"}; continue };
    if ( vgle(bb_n,tn-1,tn-1) &&
          vis(tn_ok) && zs(tn-1) )
    { l[i]=omo1; Z[433]++; if(dbg){print "Z433"}; continue };

    # поиск по sz_iili + _gl_v_castle_imvi
    qn_n=bb_n=""; qb(tn-6,tn-2,"sz_iili"); bba(qbn-6,qbn-2,"_gl_v_castle_imvi"); qb_n=qbn; bb_n=bbn;

    if ( vgle(qb_n,tn-6,tn-2) && vgle(bb_n,qb_n-6,qb_n-2) &&
          qif(bb_n+1,qb_n-2,"prl_vi mest_vi suw_vi suw_edne mest_3e prq_vi qis_vi qik_vi name_vi_sy isname") &&
          qif(qb_n+1,tn-2,"prl_vi mest_vi suw_vi suw_edne mest_3e prq_vi qis_vi qik_vi prq_vi name_vi_sy isname") &&
            q(qb_n-1,"suw_vi mest_vi suw_edne mest_3e prq_vi qast name_vi_sy isname") &&
            q(tn-1,"suw_vi mest_vi suw_edne mest_3e prq_vi qast name_vi_sy isname") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[434]++; if(dbg){print "Z434"}; continue };
    if ( vgle(qb_n,tn-6,tn-2) && vgle(bb_n,qb_n-6,qb_n-2) &&
          qif(bb_n+1,qb_n-2,"prl_vi mest_vi suw_vi suw_edne mest_3e prq_vi qis_vi qik_vi name_vi_sy isname") &&
          qif(qb_n+1,tn-3,"prl_vi mest_vi suw_vi suw_edne mest_3e prq_vi qis_vi qik_vi prq_vi name_vi_sy isname") &&
            q(qb_n-1,"suw_vi mest_vi suw_edne mest_3e prq_vi qast name_vi_sy isname") &&
            q(tn-2,"suw_vi mest_vi suw_edne mest_3e prq_vi qast name_vi_sy isname") &&
            q(tn-1,"nar_any gl_in") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[435]++; if(dbg){print "Z435"}; continue };
    if ( vgle(qb_n,tn-6,tn-2) && vgle(bb_n,qb_n-6,qb_n-2) &&
            q(bb_n+1,"nar_any gl_in") &&
          qif(bb_n+2,qb_n-2,"prl_vi mest_vi suw_vi suw_edne mest_3e prq_vi qis_vi qik_vi name_vi_sy isname") &&
          qif(qb_n+1,tn-2,"prl_vi mest_vi suw_vi suw_edne mest_3e prq_vi qis_vi qik_vi prq_vi name_vi_sy isname") &&
            q(qb_n-1,"suw_vi mest_vi suw_edne mest_3e prq_vi qast name_vi_sy isname") &&
            q(tn-1,"suw_vi mest_vi suw_edne mest_3e prq_vi qast name_vi_sy isname") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[436]++; if(dbg){print "Z436"}; continue };
    if ( vgle(qb_n,tn-6,tn-2) && vgle(bb_n,qb_n-6,qb_n-2) &&
          qif(bb_n+1,qb_n-2,"prl_im mest_im suw_im suw_edne mest_3e prq_im prq_im qis_im qik_im name_im_sy isname") &&
          qif(qb_n+1,tn-2,"prl_im mest_im suw_im suw_edne mest_3e prq_im prq_im qis_im qik_im name_im_sy isname") &&
            q(qb_n-1,"suw_im mest_im suw_edne mest_3e qast name_im_sy isname") &&
            q(tn-1,"suw_im mest_im suw_edne mest_3e qast name_im_sy isname") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[437]++; if(dbg){print "Z437"}; continue };


    # поиск по pre_da + _gl_v_castle_imvi: qb_n и bb_n
    qn_n=bb_n=""; qb(tn-6,tn-2,"pre_da"); bba(qbn-9,qbn-1,"_gl_v_castle_imvi"); qb_n=qbn; bb_n=bbn;

    if ( vgle(bb_n,qb_n-5,qb_n-1) && vgle(qb_n,tn-5,tn-2) &&
          qif(qb_n+1,qb_n-1,"nar_any prl_kred_sr qast prl_vi mest_vi prq_vi suw_vi mest_3e suw_im suw_edne mest_im isname") &&
          qif(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-1,"mest_da suw_da suw_edne prq_da isname") &&
          vis(tn_ok) && s(bb_n,tn-1) )
    { l[i]=omo1; Z[438]++; if(dbg){print "Z438"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-3) &&
          qif(qb_n+1,qb_n-1,"nar_any prl_kred_sr qast prl_vi mest_vi prq_vi suw_vi mest_3e suw_im suw_edne mest_im isname") &&
          qif(qb_n+1,tn-3,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-2,"mest_da suw_da suw_edne prq_da isname") &&
            q(tn-1,"nar_any") &&
          vis(tn_ok) && s(bb_n,tn-1) )
    { l[i]=omo1; Z[439]++; if(dbg){print "Z439"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
            q(bb_n+1,"suw_vi mest_vi mest_3e qis_vi qik_vi") &&
          qif(bb_n+2,qb_n-1,"suw_ro suw_edne nar_any isname") &&
          qif(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-1,"mest_da suw_da suw_edne isname") &&
          vis(tn_ok) && s(bb_n,tn-1) )
    { l[i]=omo1; Z[440]++; if(dbg){print "Z440"}; continue };
    if ( vgle(bb_n,qb_n-7,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qif(bb_n+1,qb_n-3,"prl_vi mest_vi mest_3e prq_vi") &&
            q(qb_n-2,"suw_vi mest_vi mest_3e qis_vi qik_vi") &&
            q(qb_n-1,"suw_ro suw_edne nar_any isname") &&
          qif(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-1,"mest_da suw_da suw_edne isname") &&
          vis(tn_ok) && s(bb_n,tn-1) )
    { l[i]=omo1; Z[441]++; if(dbg){print "Z441"}; continue };
    if ( vgle(bb_n,qb_n-7,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
            q(bb_n+1,"nar_vrem prl_kred_sr qast mest_vi suw_vi mest_3e isname") &&
       pre_vi(bb_n+2) &&
          qif(bb_n+3,qb_n-2,"prl_vi mest_vi mest_3e prq_vi") &&
            q(qb_n-1,"mest_vi suw_vi suw_edne") &&
          qif(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-1,"suw_da mest_da") &&
          vis(tn_ok) && s(bb_n,tn-1) )
    { l[i]=omo1; Z[442]++; if(dbg){print "Z442"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
       pre_vi(bb_n+1) &&
          qif(bb_n+2,qb_n-2,"prl_vi mest_vi mest_3e prq_vi") &&
            q(qb_n-1,"mest_vi suw_vi suw_edne") &&
          qif(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-1,"suw_da mest_da") &&
          vis(tn_ok) && s(bb_n,tn-1) )
    { l[i]=omo1; Z[443]++; if(dbg){print "Z443"}; continue };
    if ( vgle(bb_n,qb_n-9,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
           qb(qb_n-5,qb_n-2,"sz_iili") &&
          qif(bb_n+1,qbn-2,"prl_vi mest_vi mest_3e prq_vi") &&
            q(qbn-1,"suw_vi mest_vi suw_edne mest_3e isname") &&
          qif(qbn+1,qb_n-2,"prl_vi mest_vi mest_3e prq_vi") &&
            q(qb_n-1,"suw_vi mest_vi suw_edne mest_3e isname") &&
          qif(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-1,"mest_da suw_da prq_da isname") &&
          vis(tn_ok) && s(bb_n,tn-1) )
    { l[i]=omo1; Z[444]++; if(dbg){print "Z444"}; continue };
    if ( vgle(bb_n,qb_n-9,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qif(bb_n+1,qb_n-2,"prl_vi mest_vi mest_3e prq_vi") &&
            q(qb_n-2,"suw_vi mest_vi suw_edne mest_3e isname") &&
            q(qb_n-1,"sz_iili") &&
          qif(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-1,"mest_da suw_da prq_da isname") &&
          vis(tn_ok) && s(bb_n,tn-1) )
    { l[i]=omo1; Z[445]++; if(dbg){print "Z445"}; continue };
    if ( vgle(bb_n,qb_n-9,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
           qb(bb_b+1,qn_n-2,"pre_tv") &&
          qif(bb_n+1,qbn-1,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            q(qbn-1,"suw_vi mest_vi suw_edne mest_3e isname") &&
          qif(qbn+1,qb_n-2,"prl_tv mest_tv suw_tv mest_3e prq_tv prl_kred_sr qik_tv nar_any isname") &&
            q(qb_n-1,"mest_tv suw_tv suw_edne isname") &&
          qif(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-1,"suw_da mest_da isname") &&
          vis(tn_ok) && s(bb_n,tn-1) )
    { l[i]=omo1; Z[446]++; if(dbg){print "Z446"}; continue };
    if ( vgle(bb_n,qb_n-9,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
           qb(bb_b+1,qn_n-2,"pre_ro") &&
          qif(bb_n+1,qbn-1,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            q(qbn-1,"suw_vi mest_vi suw_edne mest_3e isname") &&
          qif(qbn+1,qb_n-2,"prl_ro mest_ro suw_ro mest_3e prq_ro prl_kred_sr qik_ro nar_any isname") &&
            q(qb_n-1,"mest_ro suw_ro suw_edne isname") &&
          qif(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-1,"suw_da mest_da isname") &&
          vis(tn_ok) && s(bb_n,tn-1) )
    { l[i]=omo1; Z[447]++; if(dbg){print "Z447"}; continue };

    # поиск по pre_tv + _gl_v_castle_imvi: qb_n и bb_n
    qn_n=bb_n=""; qb(tn-6,tn-2,"pre_tv"); bba(qbn-9,qbn-1,"_gl_v_castle_imvi"); qb_n=qbn; bb_n=bbn;

    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qif(bb_n+1,qb_n-1,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qif(qb_n+1,tn-2,"prl_tv mest_tv suw_tv mest_3e prq_tv prl_kred_sr qik_tv nar_any isname") &&
            q(tn-1,"mest_tv suw_tv prq_tv suw_edne isname") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[448]++; if(dbg){print "Z448"}; continue };
    if ( vgle(qb_n,tn-6,tn-2) &&
          vvb(qb_n-5,qb_n-1) &&
          bba(qbn-9,qbn-1,"_gl_v_castle_imvi") && s(bbn+1,vvn-1) &&
          qif(bbn+1,vvn,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qif(qb_n+1,tn-2,"prl_tv mest_tv suw_tv mest_3e prq_tv prl_kred_sr qik_tv nar_any isname") &&
            q(tn-1,"mest_tv suw_tv prq_tv suw_edne isname") &&
          vis(tn_ok) && s(qb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[449]++; if(dbg){print "Z449"}; continue };
     if ( vgle(bb_n,qb_n-7,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
             q(bb_n+1,"pre_tv") &&
           qif(bb_n+2,qb_n-1,"suw_tv mest_tv prl_tv mest_3e qis_tv nar_any prl_kred_sr isname qast_any") &&
           qif(qb_n+1,tn-2,"prl_tv mest_tv suw_tv mest_3e prq_tv prl_kred_sr qik_tv nar_any isname") &&
             q(tn-1,"mest_tv suw_tv prq_tv suw_edne isname") &&
           vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[450]++; if(dbg){print "Z450"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
            w(bb_n+1,"ка") && se(bb_n,"-") &&
          qif(bb_n+2,qb_n-1,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qif(qb_n+2,tn-2,"prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
            q(tn-1,"mest_tv suw_tv suw_edne isname") &&
          vis(tn_ok) && s(bb_n+1,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[451]++; if(dbg){print "Z451"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qif(bb_n+1,qb_n-1,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qif(qb_n+1,tn-3,"prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
            q(tn-2,"mest_tv suw_tv suw_edne isname") &&
            q(tn-1,"suw_ro suw_edne") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[452]++; if(dbg){print "Z452"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qif(bb_n+1,qb_n-1,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            q(qb_n+1,"mest_tv suw_tv suw_edne isname") &&
          qif(qb_n+2,tn-2,"prl_ro mest_ro mest_3e prq_ro") &&
            q(tn-1,"suw_ro suw_edne") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[453]++; if(dbg){print "Z453"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qif(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qif(qb_n+1,tn-3,"prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
            q(tn-2,"mest_tv suw_tv suw_edne isname") &&
            q(tn-1,"nar_any prl_kred_sr") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[454]++; if(dbg){print "Z454"}; continue };
    if ( vgle(bb_n,qb_n-9,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
           qb(bb_n+1,qn_n-1,"sz_iili") &&
          qif(bb_n+1,qbn-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qif(qbn+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qif(qb_n+1,tn+1,"suw_tv suw_edne isname prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[455]++; if(dbg){print "Z455"}; continue };
    if ( vgle(bb_n,qb_n-9,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
           qb(qb_n+1,tn-1,"sz_iili") &&
          qif(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qif(qb_n+1,qbn-1,"suw_tv suw_edne isname prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
          qif(qbn+1,tn-1,"suw_tv suw_edne isname prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[456]++; if(dbg){print "Z456"}; continue };


    # поиск по pre_pr + _gl_v_castle_imvi: qb_n и bb_n
    qn_n=bb_n=""; qb(tn-7,tn-2,"pre_pr"); bba(qbn-6,qbn-1,"_gl_v_castle_imvi"); qb_n=qbn; bb_n=bbn;

    if ( vgle(bb_n,qb_n-5,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qif(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            q(qb_n+1,"suw_pr") &&
          qif(qb_n+2,tn-2,"prl_vi prq_vi mest_vi mest_3e qik_vi") &&
            q(tn-1,"suw_vi suw_edne") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[457]++; if(dbg){print "Z457"}; continue };
    if ( vgle(bb_n,qb_n-5,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qif(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qif(qb_n+1,tn-2,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
            q(tn-1,"mest_pr suw_pr suw_edne") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[458]++; if(dbg){print "Z458"}; continue };
    if ( vgle(bb_n,qb_n-5,qb_n-1) && vgle(qb_n,tn-6,tn-3) &&
          qif(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qif(qb_n+1,tn-3,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
            q(tn-2,"suw_pr suw_edne") &&
            q(tn-1,"suw_ro suw_edne nar_any") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[459]++; if(dbg){print "Z459"}; continue };
    if ( vgle(bb_n,qb_n-5,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qif(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            q(qb_n+1,"suw_pr suw_edne") &&
          qif(qb_n+2,tn-1,"suw_ro suw_edne nar_any prl_ro prq_ro") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[460]++; if(dbg){print "Z460"}; continue };
    if ( vgle(bb_n,qb_n-5,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
       pre_tv(bb_n+1) &&
          qif(qb_n+2,qb_n-2,"prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
            q(qb_n-1,"mest_tv suw_tv suw_edne isname") &&
          qif(qb_n+1,tn-2,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
            q(tn-1,"mest_pr suw_pr suw_edne isname") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[461]++; if(dbg){print "Z461"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
            w(bb_n+1,"ка") && se(bb_n+1,"-") &&
       pre_tv(bb_n+2) &&
          qif(bb_n+3,qb_n-2,"prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
            q(qb_n-1,"mest_tv suw_tv suw_edne isname") &&
          qif(qb_n+1,tn-2,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
            q(tn-1,"mest_pr suw_pr suw_edne isname") &&
          vis(tn_ok) && s(bb_n+1,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[462]++; if(dbg){print "Z462"}; continue };

    # поиск по pre_vi + _gl_v_castle_imvi: qb_n и bb_n
    qn_n=bb_n=""; qb(tn-7,tn-2,"pre_vi"); bba(qbn-7,qbn-1,"_gl_v_castle_imvi"); qb_n=qbn; bb_n=bbn;

    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qif(bb_n+1,qb_n-1,"nar_any suw_im suw_ro suw_vi prl_vi mest_vi prq_vi mest_3e suw_edne suw_mnsq isname") &&
          qif(qb_n+1,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[463]++; if(dbg){print "Z463"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-7,tn-2) &&
           qb(bb_n+1,qb_n-1,"pre_da") &&
          qif(bb_n+1,qbn-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qif(qbn+1,qb_n-1,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
          qif(qb_n+1,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[464]++; if(dbg){print "Z464"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-7,tn-1) &&
           qb(bb_n+1,qb_n-1,"pre_ro") &&
          qif(bb_n+1,qbn-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qif(qbn+1,qb_n-1,"suw_ro prl_ro mest_ro mest_3e prq_ro prl_kred_sr nar_any isname") &&
          qif(qb_n+1,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[465]++; if(dbg){print "Z465"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-7,tn-1) &&
           qb(qb_n+1,tn-1,"sz_iili") &&
          qif(bbn+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qif(qb_n+1,qbn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") &&
          qif(qbn+1,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[466]++; if(dbg){print "Z466"}; continue };

    # поиск по pre_ro + _gl_v_castle_imvi: qb_n и bb_n
    qn_n=bb_n=""; qb(tn-7,tn-2,"pre_ro"); bba(qbn-6,qbn-1,"_gl_v_castle_imvi"); qb_n=qbn; bb_n=bbn;

    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qif(bb_n+1,qb_n-1,"mest_vi suw_vi prl_vi prq_vi mest_3e isname nar_any qast") &&
          qif(qb_n+1,tn-1,"prl_ro mest_ro suw_ro suw_edne prq_ro nar_any qast isname") &&
          vis(tn_ok) && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[467]++; if(dbg){print "Z467"}; continue };
    if ( vgle(qb_n,tn-6,tn-2) &&
    narph_any(qb_n-1) &&
           ba(xwn-1,"_gl_v_castle_imvi") &&
            q(tn-2,"prl_ro mest_ro suw_ro suw_edne prq_ro") &&
            q(tn-1,"mest_ro suw_ro suw_edne") &&
          vis(tn_ok) && s(xwn-1,tn-1) )
    { l[i]=omo1; Z[468]++; if(dbg){print "Z468"}; continue };

    # фразы-предлоги

    if ( preph_ro(tn-2) &&
              bba(xwn-4,xwn-1,"_gl_v_castle_imvi") &&
              qif(bbn+1,xwn-1,"mest_vi suw_vi prl_vi prq_vi mest_3e isname nar_any qast pre_any") &&
                q(tn-1,"mest_ro suw_ro suw_edne isname") &&
              vis(tn_ok) && s(bbn,tn-1) )
    { l[i]=omo1; Z[469]++; if(dbg){print "Z469"}; continue };
    if ( preph_vi(tn-2) &&
               ba(xwn-1,"_gl_v_castle_imvi") &&
                q(tn-1,"mest_vi suw_vi suw_edne") &&
              vis(tn_ok) && s(xwn-1,tn-1) )
    { l[i]=omo1; Z[470]++; if(dbg){print "Z470"}; continue };
    if ( preph_da(tn-2) &&
               ba(xwn-1,"_gl_v_castle_imvi") &&
                q(tn-1,"mest_da suw_da suw_edne") &&
              vis(tn_ok) && s(xwn-1,tn-1) )
    { l[i]=omo1; Z[471]++; if(dbg){print "Z471"}; continue };
    if ( preph_tv(tn-2) &&
               ba(xwn-1,"_gl_v_castle_imvi") &&
                q(tn-1,"mest_tv suw_tv suw_edne") &&
              vis(tn_ok) && s(xwn-1,tn-1) )
    { l[i]=omo1; Z[472]++; if(dbg){print "Z472"}; continue };

    # _gl_v_castle_imvi: end

    if (  vis(tn_ok) &&
            w(1,"к") &&
            q(2,"suw_odedda suw_odmnda isname mest_da") && s(0,1) )
    { l[i]=omo1; Z[473]++; if(dbg){print "Z473"}; continue };
    if (  vis(tn_ok) &&
            w(1,"к") &&
            q(2,"prl_da prq_da mest_da mest_3e") &&
            q(3,"suw_odedda suw_odmnda isname mest_da") && s(0,2) )
    { l[i]=omo1; Z[474]++; if(dbg){print "Z474"}; continue };
    if (  vis(tn_ok) && z(0) &&
            q(1,"sz") &&
            w(2,"к") &&
            q(3,"suw_odedda suw_odmnda isname mest_da") && s(1,2) )
    { l[i]=omo1; Z[475]++; if(dbg){print "Z475"}; continue };

    if ( vis(tn_ok) &&
      pre_tv(1) &&
           q(2,"suw_tv") &&
           q(3,"nar_spos") &&
          ba(4,"_gl_v_castle_imvi") && s(0,3) )
    { l[i]=omo1; Z[476]++; if(dbg){print "Z476"}; continue };
    if ( vis(tn_ok) &&
         bfa(1,5,"_gl_v_castle_imvi") && s(0,bfn-1) && Qf(1,bfn,"sz_iili") )
    { l[i]=omo1; Z[477]++; if(dbg){print "Z477"}; continue };

    if ( narph_any(tn-1) &&
                ba(xwn-1,"_gl_v_castle_imvi") &&
               vis(tn_ok) && s(xnw-1,tn-1) )
    { l[i]=omo1; Z[478]++; if(dbg){print "Z478"}; continue };
    if ( narph_any(tn-2) &&
                ba(xwn-1,"_gl_v_castle_imvi") &&
                 q(tn-1,"suw_vi suw_im mest_vi mest_im mest_3e isname nar_any") &&
               vis(tn_ok) && s(xnw-1,tn-1) )
    { l[i]=omo1; Z[479]++; if(dbg){print "Z479"}; continue };
    if ( narph_any(tn-1) &&
                ba(xwn-2,"_gl_v_castle_imvi") &&
                 q(xwn-1,"suw_vi mest_vi mest_3e isname nar_any") &&
               vis(tn_ok) && s(xnw-2,tn-1) )
    { l[i]=omo1; Z[480]++; if(dbg){print "Z480"}; continue };

    cst="города деревни замка замков";
    if ( w(tn-2,"из") &&
        (w(tn-1,cst)||q(tn-1,"isname")) &&
       vis(tn_ok) && s(tn-2,tn-1) && !(bb(tn-6,tn-3,"выстрелить выпалить прицелиться") && s(bbn,tn-3)) )
    { l[i]=omo1; Z[481]++; if(dbg){print "Z481"}; continue };
    cst="города деревни замка замков";
    if ( w(tn-3,"из") &&
        (w(tn-2,cst)||q(tn-2,"isname")) &&
         q(tn-1,"nar_any") &&
       vis(tn_ok) && s(tn-3,tn-1) && !(bb(tn-7,tn-4,"выстрелить выпалить прицелиться") && s(bbn,tn-4)) )
    { l[i]=omo1; Z[482]++; if(dbg){print "Z482"}; continue };

    if ( q(tn-2,"mest_da suw_da") &&
         q(tn-1,"mod_ed mod_mn mod_bz") &&
       vis(tn_ok) && s(tn-2,tn-1) )
    { l[i]=omo1; Z[483]++; if(dbg){print "Z483"}; continue };

    # prl как часть сказуемого
    cst="вхожий";
    if ( base(tn-1,cst) &&
          vis(tn_ok) && s(tn-1) )
    { l[i]=omo1; Z[484]++; if(dbg){print "Z484"}; continue };
    if ( vis(tn_ok) &&
        base(1,cst) && s(0) )
    { l[i]=omo1; Z[485]++; if(dbg){print "Z485"}; continue };
    if ( vis(tn_ok) &&
           w(1,"не") &&
        base(2,cst) && s(0,1) )
    { l[i]=omo1; Z[486]++; if(dbg){print "Z486"}; continue };
    if ( vis(tn_ok) &&
           q(1,"mest_im suw_im isname prl_kred_sr") &&
        base(2,cst) && s(0,1) )
    { l[i]=omo1; Z[487]++; if(dbg){print "Z487"}; continue };
    if ( vis(tn_ok) &&
           q(1,"mest_im suw_im isname") &&
           w(2,"не") &&
        base(3,cst) && s(0,2) )
    { l[i]=omo1; Z[488]++; if(dbg){print "Z488"}; continue };
    #
    if ( ba(-4,"_gl_v_castle_imvi") &&
          w(-3,"в") &&
          q(-2,"prq_edmuvi prq_mnvi") &&
          q(-1,"suw_da mest_da prl_da suw_tv prl_tv mest_tv suw_edne isname") && s(-4,-1) )
    { l[i]=omo1; Z[489]++; if(dbg){print "Z489"}; continue }; # без tn!
    if ( ba(-5,"_gl_v_castle_imvi") &&
          w(-4,"в") &&
          q(-3,"mest_edmuvi prl_edmuvi") &&
          q(-2,"prq_edmuvi prq_mnvi") &&
          q(-1,"suw_da mest_da prl_da suw_tv prl_tv mest_tv suw_edne isname") && s(-5,-1) )
    { l[i]=omo1; Z[490]++; if(dbg){print "Z490"}; continue }; # без tn!
    if ( ba(-3,"_gl_v_castle_imvi") &&
          w(-2,"в") &&
          q(-1,"mest_vip3e mest_vi") && s(-3,-1) )
    { l[i]=omo1; Z[491]++; if(dbg){print "Z491"}; continue }; # без tn!
    #
    if ( q(tn-1,"mwqast") &&
        ba(xwn-1,"_gl_v_castle_imvi") &&
       vis(tn_ok) && s(xwn-1) && zs(tn-1) )
    { l[i]=omo1; Z[492]++; if(dbg){print "Z492"}; continue };

    tn_ok=""
  }; # в замок
  # на замок
  if ( wb(-4,-1,"на") && s(wbn,-1) ) {

    cst="пасти пасть";
    if ( w(-2,cst) &&
         w(-1,"на") && s(-2,-1) )
    { l[i]=omo2; Z[493]++; if(dbg){print "Z493"}; continue };

    if ( base(-4,"раскатать") &&
            w(-3,"губу губы") &&
            w(-2,"на") &&
            q(-1,"prl_vi mest_vi mest_3e prq_vi") && s(-4,-1) )
    { l[i]=omo1; Z[494]++; if(dbg){print "Z494"}; continue };

    # _gl_na_castle:start
    if ( ba(-2,"_gl_na_castle") &&
          w(-1,"на") && s(-2,-1) )
    { l[i]=omo1; Z[495]++; if(dbg){print "Z495"}; continue };
    if ( ba(-3,"_gl_na_castle") &&
          q(-2,"suw_im mest_im suw_vi mest_vi mest_3e") &&
          w(-1,"на") && s(-3,-1) )
    { l[i]=omo1; Z[496]++; if(dbg){print "Z496"}; continue };
    if ( ba(-4,"_gl_na_castle") &&
          q(-3,"prl_vi prq_vi mest_vi mest_3e") &&
          q(-2,"suw_vi") &&
          w(-1,"на") && s(-4,-1) )
    { l[i]=omo1; Z[497]++; if(dbg){print "Z497"}; continue };
    if ( w(-2,"на") &&
         q(-1,"prl_vi mest_vi mest_3e") &&
        ba(1,"_gl_na_castle") && s(-2,0) )
    { l[i]=omo1; Z[498]++; if(dbg){print "Z498"}; continue };
    if ( w(-1,"на") &&
        ba(1,"_gl_na_castle") && s(-1,0) )
    { l[i]=omo1; Z[499]++; if(dbg){print "Z499"}; continue };
    # _gl_na_castle:end

    # _gl_na_lock:start
    if ( ba(-2,"_gl_na_lock") &&
          w(-1,"на") && s(-2,-1) )
    { l[i]=omo2; Z[500]++; if(dbg){print "Z500"}; continue };
    if ( ba(-3,"_gl_na_lock") &&
          q(-2,"suw_vi mest_vi mest_3e prl_kred_sr nar_any qast isname") &&
          w(-1,"на") && s(-3,-1) )
    { l[i]=omo2; Z[501]++; if(dbg){print "Z501"}; continue };
    if ( ba(-4,"_gl_na_lock") &&
          q(-3,"prl_vi prq_vi mest_vi mest_3e qast") &&
          q(-2,"suw_vi mest_vi mest_3e prl_kred_sr nar_any qast isname") &&
          w(-1,"на") && s(-4,-1) )
    { l[i]=omo2; Z[502]++; if(dbg){print "Z502"}; continue };
    if ( ba(-5,"_gl_na_lock") &&
          q(-4,"prl_vi prq_vi mest_vi mest_3e qast") &&
          q(-3,"suw_vi isname") &&
          q(-2,"nar_napr") &&
          w(-1,"на") && s(-5,-1) )
    { l[i]=omo2; Z[503]++; if(dbg){print "Z503"}; continue };
    if ( ba(-3,"_gl_na_lock") &&
          q(-2,"suw_im mest_im") &&
          w(-1,"на") && s(-3,-1) )
    { l[i]=omo2; Z[504]++; if(dbg){print "Z504"}; continue };
    if ( ba(-3,"_gl_na_lock") &&
          q(-2,"suw_tv mest_tv") &&
          w(-1,"на") && s(-3,-1) )
    { l[i]=omo2; Z[505]++; if(dbg){print "Z505"}; continue };
    if ( ba(-4,"_gl_na_lock") &&
          q(-3,"prl_im prq_im mest_im qast") &&
          q(-2,"suw_im mest_im") &&
          w(-1,"на") && s(-4,-1) )
    { l[i]=omo2; Z[506]++; if(dbg){print "Z506"}; continue };
    if ( ba(-4,"_gl_na_lock") &&
          q(-3,"suw_vi mest_vi mest_3e prl_kred_sr nar_any qast") &&
          w(-2,"на") &&
          q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-4,-1) )
    { l[i]=omo2; Z[507]++; if(dbg){print "Z507"}; continue };
    if ( ba(-6,"_gl_na_lock") &&
          q(-5,"suw_vi mest_vi mest_3e prl_kred_sr nar_any qast") &&
     pre_tv(-4) &&
          q(-3,"suw_tv mest_tv") &&
          w(-2,"на") &&
          q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-6,-1) )
    { l[i]=omo2; Z[508]++; if(dbg){print "Z508"}; continue };
    if ( ba(-5,"_gl_na_lock") &&
          q(-4,"suw_vi mest_vi mest_3e prl_kred_sr nar_any qast") &&
     pre_tv(-3) &&
          q(-2,"suw_tv mest_tv") &&
          w(-1,"на") && s(-5,-1) )
    { l[i]=omo2; Z[509]++; if(dbg){print "Z509"}; continue };
    if ( ba(-5,"_gl_na_lock") &&
     pre_pr(-4) &&
          q(-3,"prl_pr mest_pr mest_3e") &&
          q(-2,"suw_pr") &&
          w(-1,"на") && s(-5,-1) )
    { l[i]=omo2; Z[510]++; if(dbg){print "Z510"}; continue };
    if ( ba(-4,"_gl_na_lock") &&
          q(-3,"prl_vi mest_vi mest_3e") &&
          q(-2,"suw_vi") &&
          w(-1,"на") && s(-4,-1) )
    { l[i]=omo2; Z[511]++; if(dbg){print "Z511"}; continue };
    if ( ba(-5,"_gl_na_lock") &&
          q(-4,"prl_vi mest_vi mest_3e") &&
          q(-3,"prl_vi mest_vi") &&
          q(-2,"suw_vi") &&
          w(-1,"на") && s(-5,-1) )
    { l[i]=omo2; Z[512]++; if(dbg){print "Z512"}; continue };
    if ( ba(-4,"_gl_na_lock") &&
          w(-3,"на") &&
          q(-2,"prl_vi mest_vi mest_3e") &&
          q(-1,"prl_vi mest_vi mest_3e") && s(-4,-1) )
    { l[i]=omo2; Z[513]++; if(dbg){print "Z513"}; continue };
    if ( ba(-3,"_gl_na_lock") &&
          w(-2,"на") &&
          q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo2; Z[514]++; if(dbg){print "Z514"}; continue };
    if ( ba(-4,"_gl_na_lock") &&
          w(-3,"на") &&
          q(-2,"prl_vi prq_vi") &&
          q(-1,"suw_vi") && s(-4,-1) )
    { l[i]=omo2; Z[515]++; if(dbg){print "Z515"}; continue };
    if ( vvb(-6,-1) &&
          ba(vvn-2,"_gl_na_lock") &&
           w(vvn-1,"на") &&
           q(vvn,"prl_vi mest_vi mest_3e") && s(vvn-2,vvn-1) )
    { l[i]=omo2; Z[516]++; if(dbg){print "Z516"}; continue };
    if ( ba(-5,"_gl_na_lock") &&
     pre_tv(-4) &&
          q(-3,"mest_tv suw_tv") &&
          q(-2,"mest_vi suw_vi mest_3e") &&
          w(-1,"на") && s(-5,-1) )
    { l[i]=omo2; Z[517]++; if(dbg){print "Z517"}; continue };
    if ( ba(-4,"_gl_na_lock") &&
     pre_vi(-3) &&
          q(-2,"suw_vi") &&
          w(-1,"на") && s(-4,-1) )
    { l[i]=omo2; Z[518]++; if(dbg){print "Z518"}; continue };
    if ( w(-1,"на") &&
       bfa(1,3,"_gl_na_lock") && s(-1,bfn-1) )
    { l[i]=omo2; Z[519]++; if(dbg){print "Z519"}; continue };
    # _gl_na_lock:end

    # _suw_na_castle:start
    if ( ba(-3,"_suw_na_castle") &&
          w(-2,"на") &&
          q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[520]++; if(dbg){print "Z520"}; continue };
    if ( ba(-2,"_suw_na_castle") &&
          w(-1,"на") && s(-2,-1) )
    { l[i]=omo1; Z[521]++; if(dbg){print "Z521"}; continue };
    if ( ba(-3,"_suw_na_castle") &&
          q(-2,"suw_tv mest_tv") &&
          w(-1,"на") && s(-3,-1) )
    { l[i]=omo1; Z[522]++; if(dbg){print "Z522"}; continue };
    # _suw_na_castle:end

    # _suw_na_lock:start
    if ( ba(-3,"_suw_na_lock") &&
          w(-2,"на") &&
          q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo2; Z[523]++; if(dbg){print "Z523"}; continue };
    if ( ba(-2,"_suw_na_lock") &&
          w(-1,"на") && s(-2,-1) )
    { l[i]=omo2; Z[524]++; if(dbg){print "Z524"}; continue };
    if ( ba(-3,"_suw_na_lock") &&
          q(-2,"suw_tv mest_tv") &&
          w(-1,"на") && s(-3,-1) )
    { l[i]=omo2; Z[525]++; if(dbg){print "Z525"}; continue };
    # _suw_na_lock:end

    # похожий
    cst="походить похожий";
    if ( base(-2,cst) &&
            w(-1,"на") &&
           ba(1,"_castlelike_things") && s(-2,0) )
    { l[i]=omo1; Z[526]++; if(dbg){print "Z526"}; continue };
    if ( base(-4,cst) &&
            w(-3,"на") &&
           ba(-2,"_castlelike_things") &&
      sz_iili(-1) && s(-4,-1) )
    { l[i]=omo1; Z[527]++; if(dbg){print "Z527"}; continue };
    if ( base(-3,cst) &&
            w(-2,"на") &&
            q(-1,"prl_vi mest_vi mest_3e prq_vi") &&
           ba(1,"_castlelike_things") && s(-3,0) )
    { l[i]=omo1; Z[528]++; if(dbg){print "Z528"}; continue };
    if ( ba(-3,"_castlelike_things") &&
       base(-2,cst) &&
          w(-1,"на") && s(-3,-1) )
    { l[i]=omo1; Z[529]++; if(dbg){print "Z529"}; continue };
    if ( ba(-4,"_castlelike_things") &&
          w(-3,"не") &&
       base(-2,cst) &&
          w(-1,"на") && s(-4,-1) )
    { l[i]=omo1; Z[530]++; if(dbg){print "Z530"}; continue };
    if ( base(-2,cst) &&
            w(-1,"на") &&
            q(1,"prl_any") &&
           ba(2,"_castlelike_things") && s(-2,1) )
    { l[i]=omo1; Z[531]++; if(dbg){print "Z531"}; continue };
    if ( w(-2,"на") &&
         q(-1,"prl_any mest_any") &&
        ba(1,"_castlelike_things") &&
    pre_pr(2) &&
         q(3,"suw_pr") &&
      base(4,cst) && s(-2,3) )
    { l[i]=omo1; Z[532]++; if(dbg){print "Z532"}; continue };
    if ( ba(-3,"_castlelike_things") && z(-3) &&
       base(-2,cst) &&
          w(-1,"на") && s(-2,-1) )
    { l[i]=omo1; Z[533]++; if(dbg){print "Z533"}; continue };
    if ( ba(-4,"_castlelike_things") && z(-4) &&
       base(-3,cst) &&
          w(-2,"на") &&
          q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[534]++; if(dbg){print "Z534"}; continue };
    if (  z(0) &&
       base(1,cst) &&
          w(2,"на") &&
         ba(3,"_castlelike_things") && s(1,2) )
    { l[i]=omo1; Z[535]++; if(dbg){print "Z535"}; continue };
    # похожий

    cst="атака набег нападать нападение напасть";
    if ( base(-2,cst) &&
            w(-1,"на") && s(-2,-1) )
    { l[i]=omo1; Z[536]++; if(dbg){print "Z536"}; continue };
    if ( base(-3,cst) &&
            w(-2,"на") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[537]++; if(dbg){print "Z537"}; continue };
    if ( w(-1,"на") &&
        bf(1,3,cst) && s(-1,bfn-1) )
    { l[i]=omo1; Z[538]++; if(dbg){print "Z538"}; continue };

    cst="потянуть тянуть";
    if ( w(-1,"на") &&
         q(1,"suw_im mest_im") &&
         w(2,"не") &&
      base(3,cst) && s(-1,2) )
    { l[i]=omo1; Z[539]++; if(dbg){print "Z539"}; continue };

  }; # на замок
  # за замок
  if ( wb(-4,-1,"за") && s(wbn,-1) ) {

    cst1="закружить";
    cst2="цепляться";
    if ( base(-5,cst1) && z(-5) &&
            q(-4,"nar_step") &&
            q(-3,"qast") &&
         base(-2,cst2) &&
            w(-1,"за") && s(-4,-1) )
    { l[i]=omo1; Z[540]++; if(dbg){print "Z540"}; continue };
    cst="держаться";
    if ( base(-2,cst) &&
            w(-1,"за") && s(-2,-1) &&
         (qxs(1,"до","последнего")||
          qxs(1,"нет","смысла") ) )
    { l[i]=omo1; Z[541]++; if(dbg){print "Z541"}; continue };
    cst="взяться держаться цепляться";
    if ( base(-3,cst) &&
          qxs(-1,"за","мой твой наш ваш их свой этот тот ее её их его") )
    { l[i]=omo1; Z[542]++; if(dbg){print "Z542"}; continue };
    cst1="взяться приняться";
    cst2="стена";
    if ( qxs(-3,"а","уж","потом") &&
        base(xsn-1,cst2) && sc(xsn-1,"—") &&
        base(-2,cst1) &&
           w(-1,"за") && s(-2,-1) )
    { l[i]=omo1; Z[543]++; if(dbg){print "Z543"}; continue };
    if ( base(-3,cst) &&
            w(-2,"за") &&
       isname(-1) && s(-3,-1) )
    { l[i]=omo1; Z[544]++; if(dbg){print "Z544"}; continue };
    if ( base(-2,cst) &&
            w(-1,"за") &&
      sz_iili(1) &&
         base(2,"спалить сжечь сровнять снести") && s(-2,1) )
    { l[i]=omo1; Z[545]++; if(dbg){print "Z545"}; continue };
    if ( wb(-5,-3,"нужно пора") &&
          w(-2,cst) &&
          w(-1,"за") && s(wbn,-1) )
    { l[i]=omo1; Z[546]++; if(dbg){print "Z546"}; continue };
   if ( base(-3,"хотеть") &&
           w(-2,cst) &&
           w(-1,"за") && s(-3,-1) )
    { l[i]=omo1; Z[547]++; if(dbg){print "Z547"}; continue };
   cst1="когда крепко наконец основательно плотно";
    if ( w(-3,cst1) &&
      base(-2,cst) &&
         w(-1,"за") && s(-3,-1) )
    { l[i]=omo1; Z[548]++; if(dbg){print "Z548"}; continue };
    if ( w(-3,cst1) &&
      base(-2,cst) &&
         w(-1,"за") &&
         w(1,"новый мой твой наш ваш их свой этот тот ее её их его") && s(-3,0) )
    { l[i]=omo1; Z[549]++; if(dbg){print "Z549"}; continue };
    if ( base(-2,cst) &&
            w(-1,"за") &&
            w(1,cst1) && s(-2,0) )
    { l[i]=omo1; Z[550]++; if(dbg){print "Z550"}; continue };


    # _gl_za_lock:start
    if ( ba(-2,"_gl_za_lock") &&
          w(-1,"за") && s(-2,-1) )
    { l[i]=omo2; Z[551]++; if(dbg){print "Z551"}; continue };
    if ( ba(-3,"_gl_za_lock") &&
          q(-2,"suw_vi mest_vi mest_3e prl_kred_sr nar_any qast isname") &&
          w(-1,"за") && s(-3,-1) )
    { l[i]=omo2; Z[552]++; if(dbg){print "Z552"}; continue };
    if ( ba(-4,"_gl_za_lock") &&
          q(-3,"prl_vi mest_vi mest_3e") &&
          q(-2,"suw_vi") &&
          w(-1,"за") && s(-4,-1) )
    { l[i]=omo2; Z[553]++; if(dbg){print "Z553"}; continue };
    if ( ba(-4,"_gl_za_lock") &&
          q(-3,"prl_tv mest_tv mest_3e prl_kred_sr nar_any") &&
          q(-2,"suw_tv") &&
          w(-1,"за") && s(-4,-1) )
    { l[i]=omo2; Z[554]++; if(dbg){print "Z554"}; continue };
    if ( ba(-4,"_gl_za_lock") &&
          q(-3,"prl_vi mest_vi mest_3e qast") &&
          q(-2,"suw_vi mest_vi mest_3e prl_kred_sr nar_any qast isname") &&
          w(-1,"за") && s(-4,-1) )
    { l[i]=omo2; Z[555]++; if(dbg){print "Z555"}; continue };
    if ( ba(-3,"_gl_za_lock") &&
          q(-2,"suw_im mest_im") &&
          w(-1,"за") && s(-3,-1) )
    { l[i]=omo2; Z[556]++; if(dbg){print "Z556"}; continue };
    if ( ba(-3,"_gl_za_lock") &&
          q(-2,"suw_tv mest_tv") &&
          w(-1,"за") && s(-3,-1) )
    { l[i]=omo2; Z[557]++; if(dbg){print "Z557"}; continue };
    if ( ba(-4,"_gl_za_lock") &&
          q(-3,"prl_im prq_im mest_im qast") &&
          q(-2,"suw_im mest_im") &&
          w(-1,"за") && s(-4,-1) )
    { l[i]=omo2; Z[558]++; if(dbg){print "Z558"}; continue };
    if ( ba(-4,"_gl_za_lock") &&
          q(-3,"suw_vi mest_vi mest_3e prl_kred_sr nar_any qast") &&
          w(-2,"за") &&
          q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-4,-1) )
    { l[i]=omo2; Z[559]++; if(dbg){print "Z559"}; continue };
    if ( ba(-6,"_gl_za_lock") &&
          q(-5,"suw_vi mest_vi mest_3e prl_kred_sr nar_any qast") &&
     pre_tv(-4) &&
          q(-3,"suw_tv mest_tv") &&
          w(-2,"за") &&
          q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-6,-1) )
    { l[i]=omo2; Z[560]++; if(dbg){print "Z560"}; continue };
    if ( ba(-5,"_gl_za_lock") &&
          q(-4,"suw_vi mest_vi mest_3e prl_kred_sr nar_any qast") &&
     pre_tv(-3) &&
          q(-2,"suw_tv mest_tv") &&
          w(-1,"за") && s(-5,-1) )
    { l[i]=omo2; Z[561]++; if(dbg){print "Z561"}; continue };
    if ( ba(-5,"_gl_za_lock") &&
     pre_pr(-4) &&
          q(-3,"prl_pr mest_pr mest_3e") &&
          q(-2,"suw_pr") &&
          w(-1,"за") && s(-5,-1) )
    { l[i]=omo2; Z[562]++; if(dbg){print "Z562"}; continue };
    if ( ba(-4,"_gl_za_lock") &&
          q(-3,"prl_vi mest_vi mest_3e") &&
          q(-2,"suw_vi") &&
          w(-1,"за") && s(-4,-1) )
    { l[i]=omo2; Z[563]++; if(dbg){print "Z563"}; continue };
    if ( ba(-5,"_gl_za_lock") &&
          q(-4,"prl_vi mest_vi mest_3e") &&
          q(-3,"prl_vi mest_vi") &&
          q(-2,"suw_vi") &&
          w(-1,"за") && s(-5,-1) )
    { l[i]=omo2; Z[564]++; if(dbg){print "Z564"}; continue };
    if ( ba(-4,"_gl_za_lock") &&
          w(-3,"за") &&
          q(-2,"prl_vi mest_vi mest_3e") &&
          q(-1,"prl_vi mest_vi mest_3e") && s(-4,-1) )
    { l[i]=omo2; Z[565]++; if(dbg){print "Z565"}; continue };
    if ( ba(-3,"_gl_za_lock") &&
          w(-2,"за") &&
          q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo2; Z[566]++; if(dbg){print "Z566"}; continue };
    if ( ba(-4,"_gl_za_lock") &&
          w(-3,"за") &&
          q(-2,"prl_vi prq_vi") &&
          q(-1,"suw_vi") && s(-4,-1) )
    { l[i]=omo2; Z[567]++; if(dbg){print "Z567"}; continue };
    if ( vvb(-6,-1) &&
          ba(vvn-2,"_gl_za_lock") &&
           w(vvn-1,"за") &&
           q(vvn,"prl_vi mest_vi mest_3e") && s(vvn-2,vvn-1) )
    { l[i]=omo2; Z[568]++; if(dbg){print "Z568"}; continue };
    if ( ba(-5,"_gl_za_lock") &&
     pre_tv(-4) &&
          q(-3,"mest_tv suw_tv") &&
          q(-2,"mest_vi suw_vi mest_3e") &&
          w(-1,"за") && s(-5,-1) )
    { l[i]=omo2; Z[569]++; if(dbg){print "Z569"}; continue };
    if ( ba(-4,"_gl_za_lock") &&
     pre_vi(-3) &&
          q(-2,"suw_vi") &&
          w(-1,"за") && s(-4,-1) )
    { l[i]=omo2; Z[570]++; if(dbg){print "Z570"}; continue };
    if ( w(-1,"за") &&
       bfa(1,3,"_gl_za_lock") && s(-1,bfn-1) )
    { l[i]=omo2; Z[571]++; if(dbg){print "Z571"}; continue };
    # _gl_za_lock:end

    # _gl_za_castle:start
    if ( ba(-2,"_gl_za_castle") &&
          w(-1,"за") && s(-2,-1) )
    { l[i]=omo1; Z[572]++; if(dbg){print "Z572"}; continue };
    if ( ba(-3,"_gl_za_castle") &&
          q(-2,"suw_im mest_im suw_vi mest_vi mest_3e") &&
          w(-1,"за") && s(-3,-1) )
    { l[i]=omo1; Z[573]++; if(dbg){print "Z573"}; continue };
    if ( ba(-4,"_gl_za_castle") &&
          q(-3,"prl_vi prq_vi mest_vi mest_3e pre_vi") &&
          q(-2,"suw_vi") &&
          w(-1,"за") && s(-4,-1) )
    { l[i]=omo1; Z[574]++; if(dbg){print "Z574"}; continue };
    if ( w(-2,"за") &&
         q(-1,"prl_vi mest_vi mest_3e") &&
        ba(1,"_gl_za_castle") && s(-2,0) )
    { l[i]=omo1; Z[575]++; if(dbg){print "Z575"}; continue };
    if ( w(-1,"за") &&
        ba(1,"_gl_za_castle") && s(-1,0) )
    { l[i]=omo1; Z[576]++; if(dbg){print "Z576"}; continue };
    # _gl_za_castle:end

    # _suw_za_castle:start
    if ( ba(-3,"_suw_za_castle") &&
          w(-2,"за") &&
          q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[577]++; if(dbg){print "Z577"}; continue };
    if ( ba(-2,"_suw_za_castle") &&
          w(-1,"за") && s(-2,-1) )
    { l[i]=omo1; Z[578]++; if(dbg){print "Z578"}; continue };
    if ( ba(-3,"_suw_za_castle") &&
          q(-2,"suw_tv mest_tv") &&
          w(-1,"за") && s(-3,-1) )
    { l[i]=omo1; Z[579]++; if(dbg){print "Z579"}; continue };
    # _suw_za_castle:end

    # _suw_za_lock:start
#   if ( ba(-3,"_suw_za_lock") &&
#         w(-2,"за") &&
#         q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-3,-1) )
#   { l[i]=omo2; Z[580]++; if(dbg){print "Z580"}; continue };
#   if ( ba(-2,"_suw_za_lock") &&
#         w(-1,"за") && s(-2,-1) )
#   { l[i]=omo2; Z[581]++; if(dbg){print "Z581"}; continue };
#   if ( ba(-3,"_suw_za_lock") &&
#         q(-2,"suw_tv mest_tv") &&
#         w(-1,"за") && s(-3,-1) )
#   { l[i]=omo2; Z[582]++; if(dbg){print "Z582"}; continue };
    # _suw_za_lock:end

  }; # за замок
  # под замок
  if ( wb(-4,-1,"под") && s(wbn,-1) ) {

    cst="земля подкоп территория участок";
    if ( base(-2,cst) &&
            w(-1,"под") && s(-2,-1) )
    { l[i]=omo1; Z[583]++; if(dbg){print "Z583"}; continue };
    if ( base(-3,cst) &&
            w(-2,"под") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[584]++; if(dbg){print "Z584"}; continue };
    if ( w(-1,"под") &&
        bf(1,3,cst) && s(-1,bfn-1) )
    { l[i]=omo1; Z[585]++; if(dbg){print "Z585"}; continue };

    # escape для место:start
    cst1="место";
    cst2="выбирать выбрать искать найти находиться отыскать подыскать поискать приглядеть присмотреть";
    if ( base(-4,cst2) &&
            q(-3,"nar_mest mest_da suw_da") &&
         base(-2,cst1) &&
            w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[586]++; if(dbg){print "Z586"}; continue };
    if ( base(-3,cst2) &&
         base(-2,cst1) &&
            w(-1,"под") && s(-3,-1) )
    { l[i]=omo1; Z[587]++; if(dbg){print "Z587"}; continue };
    if ( base(-3,cst1) &&
         base(-2,cst2) &&
            w(-1,"под") && s(-3,-1) )
    { l[i]=omo1; Z[588]++; if(dbg){print "Z588"}; continue };
    if ( base(-2,cst1) &&
            w(-1,"под") &&
           bf(1,3,cst2) && s(-2,bfn-1) )
    { l[i]=omo1; Z[589]++; if(dbg){print "Z589"}; continue };

    cst3="выбор поиск";
    if ( base(-4,cst3) &&
            q(-3,"prl_ro") &&
         base(-2,cst1) &&
            w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[590]++; if(dbg){print "Z590"}; continue };

    cst3="уверенный";
    if ( base(-4,cst3) &&
            w(-3,"насчет о") &&
         base(-2,cst1) &&
            w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[591]++; if(dbg){print "Z591"}; continue };

    cst4="отправить отправиться отправлять отправляться сложить";
    if ( base(-4,cst4) &&
            w(-3,"на") &&
         base(-2,cst1) &&
            w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[592]++; if(dbg){print "Z592"}; continue };
    if ( base(-2,cst4) &&
            w(-1,"под") &&
            w(1,"в") &&
            q(2,"prl_vi prq_vi mest_vi mest_3e") &&
         base(3,cst1) && s(-2,2) )
    { l[i]=omo2; Z[593]++; if(dbg){print "Z593"}; continue };

    cst4="выжечь выжигать";
    if ( base(-6,cst4) &&
            w(-5,"в") &&
            q(-4,"suw_pr mest_pr") &&
            q(-3,"suw_tv") &&
         base(-2,cst1) &&
            w(-1,"под") && s(-6,-1) )
    { l[i]=omo2; Z[594]++; if(dbg){print "Z594"}; continue };
    # escape для место:end

    if ( sc(-2,"—") &&
          w(-1,"под") && s(-1) && (p(0)||q_w(1,"sz_iili pre_any")) )
    { l[i]=omo2; Z[595]++; if(dbg){print "Z595"}; continue };
    if ( w(-1,"под") &&
         q(1,"mest_vi mest_3e suw_odvi qis_vi isname") && s(-1,0) && (p(1)||q_w(2,"sz_iili pre_any")) )
    { l[i]=omo2; Z[596]++; if(dbg){print "Z596"}; continue };
    if ( q(-2,"mest_vi mest_3e suw_odvi qis_vi sz") &&
         w(-1,"под") &&
         s(-2,-1) && p(-3) && (p(0)||q_w(1,"sz_iili pre_any")) )
    { l[i]=omo2; Z[597]++; if(dbg){print "Z597"}; continue };
    if ( pre_vi(-3) && s(-3) &&
              q(-2,"suw_vi isname") && z(-2) &&
              w(-1,"под") && s(-1) && (p(0)||q_w(1,"sz_iili pre_any")) )
    { l[i]=omo2; Z[598]++; if(dbg){print "Z598"}; continue };
    if ( pre_vi(-4) && s(-4,-3) &&
              q(-3,"prl_vi mest_vi mest_3e qast") &&
              q(-2,"suw_vi") && z(-2) &&
              w(-1,"под") && s(-1) && (p(0)||q_w(1,"sz_iili pre_any")) )
    { l[i]=omo2; Z[599]++; if(dbg){print "Z599"}; continue };
    if ( pre_vi(-4) &&
              q(-3,"suw_vi") &&
        sz_iili(-2) &&
              w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[600]++; if(dbg){print "Z600"}; continue };


    # _gl_i_pod_lock:start
    if ( ba(-3,"_gl_i_pod_lock") && zs(-3) &&
        qxs(-1,"и","под") )
    { l[i]=omo2; Z[601]++; if(dbg){print "Z601"}; continue };
    if ( ba(-4,"_gl_i_pod_lock") && zs(-4) &&
          q(-3,"mest_vi mest_3e suw_vi isname") &&
        qxs(-1,"и","под") )
    { l[i]=omo2; Z[602]++; if(dbg){print "Z602"}; continue };
    # _gl_i_pod_lock:start

    # _gl_pod_lock:start
    if ( ba(-2,"_gl_pod_lock") && zs(-2) &&
          w(-1,"под") && s(-1) )
    { l[i]=omo2; Z[603]++; if(dbg){print "Z603"}; continue };
    if ( narph_any(-2) && s(xwn-1) &&
                ba(xwn-1,"_gl_pod_lock") &&
                 w(-1,"под") && s(-1) )
    { l[i]=omo2; Z[604]++; if(dbg){print "Z604"}; continue };
    if ( narph_any(-2) && s(xwn-2,xwn-1) &&
                ba(xwn-2,"_gl_pod_lock") &&
                 q(xwn-1,"suw_vi mest_vi mest_3e isname") &&
                 w(-1,"под") && s(-1) )
    { l[i]=omo2; Z[605]++; if(dbg){print "Z605"}; continue };
    if ( ba(-4,"_gl_pod_lock") &&
          q(-3,"prl_vi prq_vi mest_vi mest_3e qik_vi qis_vi qast") &&
          q(-2,"suw_vi mest_vi mest_3e qis_vi qast isname") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[606]++; if(dbg){print "Z606"}; continue };
    if ( ba(-6,"_gl_pod_lock") &&
          q(-5,"prl_vi prq_vi mest_vi mest_3e qik_vi qis_vi qast") &&
          q(-4,"suw_vi mest_vi mest_3e qis_vi qast isname") &&
    sz_iili(-3) &&
          q(-2,"suw_vi mest_vi mest_3e qis_vi qast isname") &&
          w(-1,"под") && s(-6,-1) )
    { l[i]=omo2; Z[607]++; if(dbg){print "Z607"}; continue };
    if ( ba(-5,"_gl_pod_lock") &&
          q(-4,"prl_vi mest_vi mest_3e qik_vi qis_vi qast") &&
          q(-3,"prl_vi mest_vi mest_3e mest_im qast") &&
          q(-2,"suw_vi mest_vi mest_3e qast") &&
          w(-1,"под") && s(-5,-1) )
    { l[i]=omo2; Z[608]++; if(dbg){print "Z608"}; continue };
    if ( ba(-5,"_gl_pod_lock") &&
          q(-4,"suw_vi") &&
          q(-3,"isname") &&
          q(-2,"isname") &&
          w(-1,"под") && s(-5,-1) )
    { l[i]=omo2; Z[609]++; if(dbg){print "Z609"}; continue };
    if ( ba(-4,"_gl_pod_lock") &&
          q(-3,"suw_vi suw_edne") &&
          q(-2,"isname suw_ro") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[610]++; if(dbg){print "Z610"}; continue };
    if ( ba(-5,"_gl_pod_lock") &&
          q(-4,"suw_vi suw_edne") &&
          q(-3,"prl_ro mest_ro qik_ro qis_ro") &&
          q(-2,"isname suw_ro") &&
          w(-1,"под") && s(-5,-1) )
    { l[i]=omo2; Z[611]++; if(dbg){print "Z611"}; continue };
    if ( ba(-6,"_gl_pod_lock") &&
          q(-5,"prl_kred_sr nar_any") &&
          q(-4,"prl_vi mest_vi mest_3e qik_vi qis_vi qast") &&
          q(-3,"prl_vi mest_vi mest_3e mest_im qast") &&
          q(-2,"suw_vi mest_vi mest_3e qast") &&
          w(-1,"под") && s(-6,-1) )
    { l[i]=omo2; Z[612]++; if(dbg){print "Z612"}; continue };
    if ( ba(-5,"_gl_pod_lock") &&
          q(-4,"prl_vi mest_vi mest_3e") &&
          q(-3,"suw_vi isname") &&
          q(-2,"suw_ro isname") &&
          w(-1,"под") && s(-5,-1) )
    { l[i]=omo2; Z[613]++; if(dbg){print "Z613"}; continue };
    if ( ba(-6,"_gl_pod_lock") &&
          q(-5,"prl_kred_sr nar_any") &&
          q(-4,"prl_vi mest_vi mest_3e") &&
          q(-3,"suw_vi isname") &&
          q(-2,"suw_ro isname") &&
          w(-1,"под") && s(-6,-1) )
    { l[i]=omo2; Z[614]++; if(dbg){print "Z614"}; continue };
    if ( ba(-6,"_gl_pod_lock") &&
     pre_vi(-5) &&
          q(-4,"prl_vi mest_vi mest_3e qast") &&
          q(-3,"prl_vi mest_vi mest_3e qast") &&
          q(-2,"suw_vi mest_vi mest_3e qast") &&
          w(-1,"под") && s(-6,-1) )
    { l[i]=omo2; Z[615]++; if(dbg){print "Z615"}; continue };
    if ( ba(-4,"_gl_pod_lock") &&
     pre_vi(-3) &&
          q(-2,"suw_vi suw_pr mest_vi mest_3e qast isname") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[616]++; if(dbg){print "Z616"}; continue };
    if ( ba(-5,"_gl_pod_lock") &&
     pre_vi(-4) &&
          q(-3,"prl_vi mest_vi mest_3e qast") &&
          q(-2,"suw_vi mest_vi mest_3e qast") &&
          w(-1,"под") && s(-5,-1) )
    { l[i]=omo2; Z[617]++; if(dbg){print "Z617"}; continue };
    if ( ba(-5,"_gl_pod_lock") &&
     pre_vi(-4) &&
          q(-3,"qik_vi") &&
          q(-2,"suw_ro") &&
          w(-1,"под") && s(-5,-1) )
    { l[i]=omo2; Z[618]++; if(dbg){print "Z618"}; continue };
    if ( ba(-5,"_gl_pod_lock") &&
          q(-4,"prl_vi mest_vi mest_3e suw_vi prl_kred_sr") &&
     pre_vi(-3) &&
          q(-2,"suw_vi mest_vi mest_3e suw_pr isname") &&
          w(-1,"под") && s(-5,-1) )
    { l[i]=omo2; Z[619]++; if(dbg){print "Z619"}; continue };
    if ( ba(-6,"_gl_pod_lock") &&
          q(-5,"prl_vi prl_ro mest_vi mest_3e suw_vi isname prl_kred_sr") &&
     pre_vi(-4) &&
          q(-3,"prl_vi mest_vi mest_3e qast") &&
          q(-2,"suw_vi mest_vi mest_3e") &&
          w(-1,"под") && s(-6,-1) )
    { l[i]=omo2; Z[620]++; if(dbg){print "Z620"}; continue };
    if ( ba(-6,"_gl_pod_lock") &&
          q(-5,"prl_vi prl_ro mest_vi mest_3e suw_vi isname") &&
     pre_pr(-4) &&
          q(-3,"prl_pr mest_pr mest_3e qast") &&
          q(-2,"suw_pr mest_pr mest_3e") &&
          w(-1,"под") && s(-6,-1) )
    { l[i]=omo2; Z[621]++; if(dbg){print "Z621"}; continue };
    if ( ba(-7,"_gl_pod_lock") &&
          q(-6,"qast") &&
          q(-5,"prl_vi prl_ro mest_vi mest_3e suw_vi isname") &&
     pre_pr(-4) &&
          q(-3,"prl_pr mest_pr mest_3e qast") &&
          q(-2,"suw_pr mest_pr mest_3e") &&
          w(-1,"под") && s(-7,-1) )
    { l[i]=omo2; Z[622]++; if(dbg){print "Z622"}; continue };
    if ( ba(-7,"_gl_pod_lock") &&
          q(-6,"prl_vi prl_ro mest_vi mest_3e suw_vi isname") &&
     pre_vi(-5) &&
          q(-4,"prl_vi mest_vi mest_3e qast") &&
          q(-3,"suw_vi mest_vi mest_3e suw_pr") &&
          q(-2,"suw_ro") &&
          w(-1,"под") && s(-7,-1) )
    { l[i]=omo2; Z[623]++; if(dbg){print "Z623"}; continue };
    if ( ba(-3,"_gl_pod_lock") && s(-3) &&
          q(-2,"suw_tv mest_tv mest_3e qis_tv prl_tv prq_tv") &&
          w(-1,"под") && zs(-2) && s(-1) )
    { l[i]=omo2; Z[624]++; if(dbg){print "Z624"}; continue };
    if ( ba(-3,"_gl_pod_lock") && s(-3) &&
          q(-2,"suw_vi mest_vi mest_3e qis_vi prl_ro prq_ro qast isname nar_any") &&
          w(-1,"под") && zs(-2) && s(-1) )
    { l[i]=omo2; Z[625]++; if(dbg){print "Z625"}; continue };
    if ( ba(-5,"_gl_pod_lock") && s(-5,-3) &&
          q(-4,"suw_vi mest_vi mest_3e qis_vi") &&
          q(-3,"prl_tv mest_tv mest_3e prq_tv qis_tv") &&
          q(-2,"suw_tv mest_tv mest_3e") &&
          w(-1,"под") && zs(-2) && s(-1) )
    { l[i]=omo2; Z[626]++; if(dbg){print "Z626"}; continue };
    if ( ba(-4,"_gl_pod_lock") &&
          q(-3,"suw_vi mest_vi mest_3e prl_ro prq_ro isname") &&
          q(-2,"nar_vrem nar_spos nar_mest nar_napr") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[627]++; if(dbg){print "Z627"}; continue };
    if ( ba(-5,"_gl_pod_lock") &&
          q(-4,"suw_vi prl_vi isname") &&
    sz_iili(-3) &&
          q(-2,"suw_vi prl_vi isname") &&
          w(-1,"под") && s(-5,-1) )
    { l[i]=omo2; Z[628]++; if(dbg){print "Z628"}; continue };
    if ( ba(-4,"_gl_pod_lock") &&
     pre_ro(-3) &&
          q(-2,"suw_ro") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[629]++; if(dbg){print "Z629"}; continue };
    if ( ba(-4,"_gl_pod_lock") &&
     pre_tv(-3) &&
          q(-2,"suw_tv") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[630]++; if(dbg){print "Z630"}; continue };
    if ( preph_tv(-3) &&
               ba(xwn-1,"_gl_pod_lock") &&
                q(-2,"suw_tv") &&
                w(-1,"под") && s(xwn-1,-1) )
    { l[i]=omo2; Z[631]++; if(dbg){print "Z631"}; continue };
    if ( ba(-3,"_gl_pod_lock") &&
          w(-2,"под") &&
          q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo2; Z[632]++; if(dbg){print "Z632"}; continue };
    if ( w(-1,"под") &&
       bfa(1,5,"_gl_pod_lock") && s(-1,bfn-1) )
    { l[i]=omo2; Z[633]++; if(dbg){print "Z633"}; continue };
    # _gl_pod_lock:end

    # _suw_pod_lock:start
    if ( ba(-2,"_suw_pod_lock") &&
          w(-1,"под") && s(-2,-1) )
    { l[i]=omo2; Z[634]++; if(dbg){print "Z634"}; continue };
    if ( ba(-4,"_suw_pod_lock") &&
          q(-3,"prl_vi mest_vi mest_3e qast") &&
          q(-2,"suw_vi mest_vi mest_3e qast") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[635]++; if(dbg){print "Z635"}; continue };
    if ( ba(-3,"_suw_pod_lock") &&
          q(-2,"suw_vi mest_vi mest_3e qast") &&
          w(-1,"под") && s(-3,-1) )
    { l[i]=omo2; Z[636]++; if(dbg){print "Z636"}; continue };
    if ( ba(-4,"_suw_pod_lock") &&
     pre_ro(-3) &&
          q(-2,"suw_ro") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[637]++; if(dbg){print "Z637"}; continue };
    if ( ba(-3,"_suw_pod_lock") &&
          w(-2,"под") &&
          q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo2; Z[638]++; if(dbg){print "Z638"}; continue };
    if ( w(-1,"под") &&
       bfa(1,3,"_suw_pod_lock") && s(-1,bfn-1) )
    { l[i]=omo2; Z[639]++; if(dbg){print "Z639"}; continue };
    # _suw_pod_lock:end

    # _suw_pod_castle:start
    if ( ba(-2,"_suw_pod_castle") &&
          w(-1,"под") && s(-2,-1) )
    { l[i]=omo1; Z[640]++; if(dbg){print "Z640"}; continue };
    if ( ba(-4,"_suw_pod_castle") &&
          q(-3,"prl_vi mest_vi mest_3e qast") &&
          q(-2,"suw_vi mest_vi mest_3e qast") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[641]++; if(dbg){print "Z641"}; continue };
    if ( ba(-3,"_suw_pod_castle") &&
          q(-2,"suw_vi mest_vi mest_3e qast") &&
          w(-1,"под") && s(-3,-1) )
    { l[i]=omo1; Z[642]++; if(dbg){print "Z642"}; continue };
    if ( ba(-4,"_suw_pod_castle") &&
     pre_ro(-3) &&
          q(-2,"suw_ro") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[643]++; if(dbg){print "Z643"}; continue };
    if ( ba(-3,"_suw_pod_castle") &&
          w(-2,"под") &&
          q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[644]++; if(dbg){print "Z644"}; continue };
    if ( w(-1,"под") &&
       bfa(1,3,"_suw_pod_castle") && s(-1,bfn-1) )
    { l[i]=omo1; Z[645]++; if(dbg){print "Z645"}; continue };
    # _suw_pod_castle:end

    # _gl_pod_castle:start
    if ( ba(-2,"_gl_pod_castle") &&
          w(-1,"под") && s(-2,-1) )
    { l[i]=omo1; Z[646]++; if(dbg){print "Z646"}; continue };
    if ( ba(-3,"_gl_pod_castle") &&
          w(-2,"под") &&
          q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[647]++; if(dbg){print "Z647"}; continue };
    if ( w(-1,"под") &&
       bfa(1,3,"_gl_pod_castle") && s(-1,bfn-1) )
    { l[i]=omo1; Z[648]++; if(dbg){print "Z648"}; continue };
    if ( ba(-4,"_gl_pod_castle") &&
     pre_da(-3) &&
          q(-2,"mest_da suw_da") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[649]++; if(dbg){print "Z649"}; continue };
    if ( ba(-6,"_gl_pod_castle") &&
          q(-5,"suw_vi mest_vi mest_3e") &&
          q(-4,"nar_any") &&
     pre_da(-3) &&
          q(-2,"mest_da suw_da") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[650]++; if(dbg){print "Z650"}; continue };
    if ( ba(-4,"_gl_pod_castle") &&
     pre_tv(-3) &&
          q(-2,"mest_tv suw_tv") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[651]++; if(dbg){print "Z651"}; continue };
    # _gl_pod_castle:end

    if ( w(-3,"в во") &&
         q(-2,"suw_vi") &&
         w(-1,"под") && s(-3,-1) )
    { l[i]=omo2; Z[652]++; if(dbg){print "Z652"}; continue };
    if ( w(-4,"в во") &&
         q(-3,"suw_vi") &&
         w(-2,"не") &&
         w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[653]++; if(dbg){print "Z653"}; continue };
    if ( w(-1,"под") &&
         w(1,"в во") &&
         q(2,"suw_vi") && s(-1,1) )
    { l[i]=omo2; Z[654]++; if(dbg){print "Z654"}; continue };

    if ( w(-1,"под") && p(-2) &&
         q(1,"prl_vi suw_vi mest_vi mest_3e") &&
         q(2,"mest_vi suw_vi") && s(-1,1) && p(2) )
    { l[i]=omo2; Z[655]++; if(dbg){print "Z655"}; continue };
    if ( q(-3,"mest_vi prl_vi mest_3e") && p(-4) &&
         q(-2,"suw_vi") &&
         w(-1,"под") && s(-3,-1) && p(0) )
    { l[i]=omo2; Z[656]++; if(dbg){print "Z656"}; continue };
    if ( q(-2,"mest_vi suw_vi") && p(-3) &&
         w(-1,"под") && s(-2,-1) && p(0) )
    { l[i]=omo2; Z[657]++; if(dbg){print "Z657"}; continue };
    if ( pre_vi(-5) && p(-6) &&
              q(-4,"suw_vi") &&
              q(-3,"mest_vi mest_3e") &&
        sz_iili(-2) &&
              w(-1,"под") && s(-5,-1) )
    { l[i]=omo2; Z[658]++; if(dbg){print "Z658"}; continue };

  }; # под замок
  # о замок
  if ( wb(-4,-1,"о") && s(wbn,-1) ) {

    if ( w(-1,"о") &&
         w(1,"чем что как") && s(-1) && (p(-2)||sc(-2,"[(«]")) && z(0) )
    { l[i]=omo1; Z[659]++; if(dbg){print "Z659"}; continue };
    cst="разбиваться удариться";
    if ( (qxs(-3,"ветер")||
          qxs(-3,"луч","света") ) &&
         base(-2,cst) &&
            w(-1,"о") && s(-2,-1) )
    { l[i]=omo1; Z[660]++; if(dbg){print "Z660"}; continue };
    if ( qxs(-1,"что","это","бьется","о") )
    { l[i]=omo1; Z[661]++; if(dbg){print "Z661"}; continue };

    if ( ba(-2,"_gl_o_lock") &&
          w(-1,"о") && s(-2,-1) )
    { l[i]=omo2; Z[662]++; if(dbg){print "Z662"}; continue };
    if ( w(-1,"о") &&
        ba(1,"_gl_o_lock") && s(-1,0) )
    { l[i]=omo2; Z[663]++; if(dbg){print "Z663"}; continue };
    if ( ba(-3,"_gl_o_lock") &&
          q(-2,"suw_vi suw_tv") &&
          w(-1,"о") && s(-3,-1) )
    { l[i]=omo2; Z[664]++; if(dbg){print "Z664"}; continue };
    if ( w(-1,"о") &&
         q(1,"prl_kred_sr") &&
   sz_iili(2) &&
         q(3,"prl_kred_sr") &&
        ba(4,"_gl_o_lock") && s(-1,3) )
    { l[i]=omo2; Z[665]++; if(dbg){print "Z665"}; continue };
    if ( ba(-2,"_suw_o_lock") &&
          w(-1,"о") && s(-2,-1) )
    { l[i]=omo2; Z[666]++; if(dbg){print "Z666"}; continue };
    if ( ba(-3,"_suw_o_lock") &&
          q(-2,"suw_ro suw_tv") &&
          w(-1,"о") && s(-3,-1) )
    { l[i]=omo2; Z[667]++; if(dbg){print "Z667"}; continue };

  }; # о замок

    if ( base(-2,"решить решение велеть приказать") &&
            w(-1,"демонтировать") && s(-2,-1) )
    { l[i]=omo1; Z[668]++; if(dbg){print "Z668"}; continue };

    cst2="владении власти распоряжении";
    if ( base(1,"быть находиться") &&
            w(2,"в во") &&
            q(3,"prl_pr prq_pr mest_pr mest_3e") &&
            q(4,"prl_pr prq_pr mest_pr mest_3e") &&
            w(5,cst2) && s(0,4) )
    { l[i]=omo1; Z[669]++; if(dbg){print "Z669"}; continue };
    if ( base(1,"быть находиться") &&
            w(2,"в во") &&
            q(3,"prl_pr prq_pr mest_pr mest_3e") &&
            w(4,cst2) && s(0,3) )
    { l[i]=omo1; Z[670]++; if(dbg){print "Z670"}; continue };

    cst1="перевесить";
    cst2="гору";
    if ( base(1,cst1) &&
            w(2,cst2) && s(0,1) )
    { l[i]=omo1; Z[671]++; if(dbg){print "Z671"}; continue };

    cst1="меняться";
    if ( base(1,cst1) && z(1) && s(0) &&
            w(2,"то тогда") &&
            q(3,"qik_vi mest_vi") &&
           ba(4,"_lock_parts") && s(2,3) )
    { l[i]=omo2; Z[672]++; if(dbg){print "Z672"}; continue };

    cst1="поменять сменить";
    cst2="владелец имя название хозяин";
    if ( bf(1,5,cst1) && Qf(1,bfn-1,"sz_iili pre_any") &&
         bf(bfn+1,bfn+3,cst2) && s(0,bfn-1) )
    { l[i]=omo1; Z[673]++; if(dbg){print "Z673"}; continue };

    cst1="вырезать вырубать вырубить высекать высечь";
    cst2="гора камень скала";
    if ( bf(1,5,cst1) && Qf(1,bfn-1,"sz_iili pre_any") &&
          w(bfn+1,"в из") &&
         bf(bfn+2,bfn+4,cst2) && s(0,bfn-1) )
    { l[i]=omo1; Z[674]++; if(dbg){print "Z674"}; continue };

    # брать взять
    cst1="брать взять";
    if ( base(-1,cst1) &&
            q(1,"nar_napr") && s(-1,0) )
    { l[i]=omo2; Z[675]++; if(dbg){print "Z675"}; continue };
    if ( base(1,cst1) &&
           ba(2,"_lock_parts") && s(0,1) )
    { l[i]=omo2; Z[676]++; if(dbg){print "Z676"}; continue };
    cst2="скрепить стиснуть";
    if ( base(-1,cst1) &&
           (w(1,"и да")||z(0)) &&
           bf(2,4,cst2) &&
            q(bfn+1,"mest_tv suw_tv") && s(0,bfn-1) )
    { l[i]=omo2; Z[677]++; if(dbg){print "Z677"}; continue };
    # _lock_bratj_i_gl
    if ( base(-1,cst1) &&
            w(1,"и да") &&
           ba(2,"_lock_bratj_i_gl") && s(-1,1) )
    { l[i]=omo2; Z[678]++; if(dbg){print "Z678"}; continue };
    if ( base(-2,cst1) &&
            q(-1,"prl_vi mest_vi mest_3e") &&
            w(1,"и да") &&
           ba(2,"_lock_bratj_i_gl") && s(-2,1) )
    { l[i]=omo2; Z[679]++; if(dbg){print "Z679"}; continue };
    if ( base(-3,cst1) &&
            q(-2,"prl_vi mest_vi mest_3e") &&
            q(-1,"prl_vi mest_vi mest_3e") &&
            w(1,"и да") &&
           ba(2,"_lock_bratj_i_gl") && s(-3,1) )
    { l[i]=omo2; Z[680]++; if(dbg){print "Z680"}; continue };
    if ( base(-3,cst1) &&
            q(-2,"prl_vi mest_vi mest_3e") &&
            q(-1,"prl_vi mest_vi mest_3e") &&
            w(1,"и да") &&
            q(2,"nar_vrem nar_spos") &&
           ba(3,"_lock_bratj_i_gl") && s(-3,1) )
    { l[i]=omo2; Z[681]++; if(dbg){print "Z681"}; continue };
    if ( base(-1,cst1) && vv(0,5) &&
            w(vvn+1,"и да") &&
           ba(vvn+2,"_lock_bratj_i_gl") && s(vvn+1) )
    { l[i]=omo2; Z[682]++; if(dbg){print "Z682"}; continue };
    if ( base(1,cst1) &&
            w(2,"и да") &&
           ba(3,"_lock_bratj_i_gl") && s(0,1) )
    { l[i]=omo2; Z[683]++; if(dbg){print "Z683"}; continue };
    if ( base(-1,cst1) &&
            w(1,"и да") &&
            q(2,"prl_kred_sr nar_spos") &&
           ba(3,"_lock_bratj_i_gl") && s(-1,2) )
    { l[i]=omo2; Z[684]++; if(dbg){print "Z684"}; continue };
    if ( base(-2,cst1) &&
            w(-1,"и да") &&
           ba(1,"_lock_bratj_i_gl") && s(-2,0) )
    { l[i]=omo2; Z[685]++; if(dbg){print "Z685"}; continue };
    if ( base(-1,cst1) && s(-1) &&
            z(0) &&
          bfa(1,4,"_lock_bratj_i_gl") && s(1,bfn-1) )
    { l[i]=omo2; Z[686]++; if(dbg){print "Z686"}; continue };

    if ( ba(-4,"_lock_parts") &&
       base(-3,cst1) &&
          w(-2,"и да") &&
          q(-1,"prl_vi mest_vi mest_3e prq_vi") &&
       base(1,"поставить") && s(-4,0) )
    { l[i]=omo2; Z[687]++; if(dbg){print "Z687"}; continue };
    if ( ba(-2,"_lock_parts") &&
          q(-1,"prl_vi mest_vi mest_3e") &&
          w(1,"не") &&
       base(2,cst1) && s(-2,1) )
    { l[i]=omo2; Z[688]++; if(dbg){print "Z688"}; continue };
    if ( ba(-5,"_lock_parts") &&
          w(-4,"в") &&
          q(-3,"suw_vi") &&
          w(-2,"и да") &&
       base(-1,cst1) && s(-5,-1) )
    { l[i]=omo2; Z[689]++; if(dbg){print "Z689"}; continue };

    if ( base(1,cst1) &&
            w(2,"у") &&
            q(3,"suw_ro mest_ro mest_3e") &&
         base(4,"кровь") && s(0,3) )
    { l[i]=omo2; Z[690]++; if(dbg){print "Z690"}; continue };

    cst2="отмычка";
    if ( base(-6,cst2) &&
            w(-5,"не") &&
            q(-4,"mod_ed mod_mn") &&
         base(-3,cst1) &&
            q(-2,"prl_vi mest_vi mest_3e") &&
            q(-1,"prl_vi mest_vi mest_3e") && s(-6,-1) )
    { l[i]=omo2; Z[691]++; if(dbg){print "Z691"}; continue };

    if ( ba(-4,"_gl_dvizh") && s(-4) &&
          q(-3,"nar_napr nar_spos nar_vrem") && z(-3) &&
       base(-2,cst1) &&
          q(-1,"mest_vi prl_vi mest_vi mest_3e") && s(-2,-1) )
    { l[i]=omo2; Z[692]++; if(dbg){print "Z692"}; continue };

    cst2="сделать";
    cst3="шаг";
    if ( base(-1,cst1) &&
            w(1,"и да") &&
         base(2,cst2) &&
            w(3,cst3) && s(-1,2) )
    { l[i]=omo2; Z[693]++; if(dbg){print "Z693"}; continue };

    cst2="ладони ладонь лапу лапы руки руку";
    if ( base(-1,cst1) &&
          qxs(1,"в",cst2) && s(-1) )
    { l[i]=omo2; Z[694]++; if(dbg){print "Z694"}; continue };
    if ( base(-2,cst1) &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") &&
          qxs(1,"в",cst2) && s(-2,-1) )
    { l[i]=omo2; Z[695]++; if(dbg){print "Z695"}; continue };
    if ( (qxs(-1,"в",cst2)||
          qxs(-1,"в","правую левую свою свои обе",cst2)||
          qxs(-1,"на","мушку") ) &&
         base(xsn-1,cst1) && s(xsn-1) )
    { l[i]=omo2; Z[696]++; if(dbg){print "Z696"}; continue };
    if ( base(-1,cst1) &&
         (qxs(1,"в",cst2)||
          qxs(1,"в","правую левую свою свои обе",cst2) ) && s(-1) )
    { l[i]=omo2; Z[697]++; if(dbg){print "Z697"}; continue };
    cst2="лавки пола полки стола";
    if ( base(-3,cst1) &&
            w(-2,"с со") &&
            w(-1,cst2) && s(-3,-1) )
    { l[i]=omo2; Z[698]++; if(dbg){print "Z698"}; continue };
    cst2="рук";
    if ( base(-1,cst1) &&
            w(1,"у") &&
            q(2,"suw_ro mest_ro isname") &&
            w(3,"из") &&
            w(4,cst2) && s(-1,3) )
    { l[i]=omo2; Z[699]++; if(dbg){print "Z699"}; continue };
    cst2="ногтем пальцами руками рукой";
    if ( base(-1,cst1) &&
            w(1,cst2) && s(-1,0) )
    { l[i]=omo2; Z[700]++; if(dbg){print "Z700"}; continue };
    if ( base(-1,cst2) &&
            w(1,cst1) && s(-1,0) )
    { l[i]=omo2; Z[701]++; if(dbg){print "Z701"}; continue };
    if ( w(1,cst2) &&
      base(2,cst1) && s(0,1) )
    { l[i]=omo2; Z[702]++; if(dbg){print "Z702"}; continue };
    if ( base(-1,cst1) &&
            q(1,"prl_tv mest_tv mest_3e") &&
            w(2,cst2) && s(-1,1) )
    { l[i]=omo2; Z[703]++; if(dbg){print "Z703"}; continue };

    cst2="опять осторожно снова";
    if ( q(-3,"isname suw_odim mest_im") &&
         w(-2,cst2) &&
      base(-1,cst1) && s(-3,-1) )
    { l[i]=omo2; Z[704]++; if(dbg){print "Z704"}; continue };
    cst2="опять осторожно снова";
    if ( base(-1,cst1) &&
            w(1,"и да") &&
         base(2,"сказать") &&
            q(3,"suw_odda mest_da isname") && s(-1,2) )
    { l[i]=omo2; Z[705]++; if(dbg){print "Z705"}; continue };
    # брать взять

    cst="встроить поставить";
    cst2="дверь ящик";
    if ( base(-3,cst) &&
       pre_pr(-2) &&
         base(-1,cst2) && s(-3,-1) )
    { l[i]=omo2; Z[706]++; if(dbg){print "Z706"}; continue };
    cst2="дверь ящик";
    if ( base(-4,cst) &&
       pre_pr(-3) &&
         base(-2,cst2) &&
            q(-1,"prl_edmuim") && s(-4,-1) )
    { l[i]=omo2; Z[707]++; if(dbg){print "Z707"}; continue };
    if ( base(-1,cst) &&
       pre_pr(1) &&
         base(2,cst2) && s(-1,1) )
    { l[i]=omo2; Z[708]++; if(dbg){print "Z708"}; continue };


    cst1="панель";
    cst2="показаться";
    if ( base(-4,cst1) && z(-4) &&
       pre_tv(-3) &&
            q(-2,"otnsz_tv") &&
         base(-1,cst2) && s(-3,-1) )
    { l[i]=omo2; Z[709]++; if(dbg){print "Z709"}; continue };

    cst1="держать";
    cst2="закрыть запереть открыть";
    cst3="руке";
    if ( base(-2,cst1) &&
            q(-1,"prq_tv") && base(-1,cst2) &&
       isname(1) && s(-2,0) )
    { l[i]=omo1; Z[710]++; if(dbg){print "Z710"}; continue };

    cst="передавать передать получить принять";
    if ( ( qxs(-1,"в","дар подарок наследство собственность распоряжение")||
           qxs(-1,"во","владение")||
           qxs(-1,"в","своё свое свои свою","владение владения собственность распоряжение")||
           qxs(-1,"под","управление")||
           qxs(-1,"под","своё свое","управление") ) && bb(xsn-4,xsn-1,cst) && s(bbn,xsn-1) )
    { l[i]=omo1; Z[711]++; if(dbg){print "Z711"}; continue };

    if ( base(1,"ходить") &&
         (qxs(2,"на","ушах")||
            w(2,"ходуном") ) && s(0,1) )
    { l[i]=omo1; Z[712]++; if(dbg){print "Z712"}; continue };
    if ( bb(-3,-1,"знать") && s(bbn,-1) &&
        qxs(1,"как","ваши наши свои","пять","пальцев") )
    { l[i]=omo1; Z[713]++; if(dbg){print "Z713"}; continue };

    if ( base(-3,"открывать открываться") &&
            w(-2,"перед") &&
            q(-1,"suw_tv mest_tv") && s(-3,-1) )
    { l[i]=omo1; Z[714]++; if(dbg){print "Z714"}; continue };

    cst="потянуть тянуть";
    if ( w(1,"не") &&
      base(2,cst) && s(0,1) )
    { l[i]=omo1; Z[715]++; if(dbg){print "Z715"}; continue };
    cst1="башня время сила стена";
    if ( base(1,cst) &&
         base(2,cst1) && s(0,1) )
    { l[i]=omo1; Z[716]++; if(dbg){print "Z716"}; continue };
    if ( q(1,"suw_da mest_da") &&
         w(2,"не") &&
      base(3,cst) && s(0,2) )
    { l[i]=omo1; Z[717]++; if(dbg){print "Z717"}; continue };
    if ( base(1,cst) &&
            q(2,"suw_ro mest_ro mest_3e") &&
            w(3,"к") && s(0,2) )
    { l[i]=omo1; Z[718]++; if(dbg){print "Z718"}; continue };
    if ( bf(1,5,cst) && Qf(1,bfn-1,"sz_iili pre_any") &&
          w(bfn+1,"из") &&
          q(bfn+2,"suw_ro mest_ro mest_3e") && s(0,bfn+1) )
    { l[i]=omo1; Z[719]++; if(dbg){print "Z719"}; continue };
    if ( bf(1,3,cst) && Qf(1,bfn-1,"sz_iili pre_any") &&
          q(bfn+1,"suw_vi mest_vi mest_3e") &&
          q(bfn+2,"nar_any prl_kred_sr") && s(0,bfn+1) )
    { l[i]=omo1; Z[720]++; if(dbg){print "Z720"}; continue };

    cst="затягивать затягиваться затянуть затянуться";
    cst1="дым дымка паутина пелена туман";
    if ( base(1,cst) &&
         base(2,cst1) && s(0,1) )
    { l[i]=omo1; Z[721]++; if(dbg){print "Z721"}; continue };

    cst="освободить освобождать спасти";
    cst1="захват захватчик оккупант осада разрушение";
    if ( base(-1,cst) &&
            w(1,"от") &&
         base(2,cst1) && s(-1,1) )
    { l[i]=omo1; Z[722]++; if(dbg){print "Z722"}; continue };
    if ( base(-1,cst) &&
            w(1,"от") &&
            q(2,"prl_ro prq_ro") &&
         base(3,cst1) && s(-1,2) )
    { l[i]=omo1; Z[723]++; if(dbg){print "Z723"}; continue };

    cst="вырвать";
    if ( base(-1,cst) && s(-1) &&
        ( qxs(1,"из","цепких","лап рук")||
          qxs(1,"из","лап рук") ) )
    { l[i]=omo1; Z[724]++; if(dbg){print "Z724"}; continue };
    if ( base(-2,cst) &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-2,-1) &&
        ( qxs(1,"из","его ее её их ваших цепких","лап рук")||
          qxs(1,"из","лап рук") ) )
    { l[i]=omo1; Z[725]++; if(dbg){print "Z725"}; continue };

    cst="погружаться погрузиться";
    cst1="металл";
    if ( base(1,cst) &&
            w(2,"в во") &&
         base(3,cst1) && s(0,2) )
    { l[i]=omo2; Z[726]++; if(dbg){print "Z726"}; continue };

    cst="снести сносить";
    cst1="выстрелом молотом прикладом ударом";
    if ( base(-2,cst) &&
            w(-1,cst1) && s(-2,-1) )
    { l[i]=omo2; Z[727]++; if(dbg){print "Z727"}; continue };

    cst="разнести";
    if ( qxs(1,"на","кирпичи кирпичики") &&
        base(xsn+1,cst) && s(xsn) )
    { l[i]=omo1; Z[728]++; if(dbg){print "Z728"}; continue };
    if ( qxs(1,"на","кирпичи кирпичики") &&
        base(-1,cst) && s(-1) )
    { l[i]=omo1; Z[729]++; if(dbg){print "Z729"}; continue };


    cst1="капитулировать сдаться";
    cst2="возня минута секунда";
    if ( base(-1,cst2) &&
         base(1,cst1) && s(-1,0) )
    { l[i]=omo2; Z[730]++; if(dbg){print "Z730"}; continue };
    if ( w(1,"через после") &&
        bf(2,5,cst2) &&
      base(bfn,cst1) && s(0,bfn) )
    { l[i]=omo2; Z[731]++; if(dbg){print "Z731"}; continue };
    if ( base(1,cst1) &&
            w(2,"через после") &&
           bf(3,6,cst2) && s(0,bfn-1) )
    { l[i]=omo2; Z[732]++; if(dbg){print "Z732"}; continue };
    if ( bf(1,3,"охватить охватывать") && s(0,bfn) &&
          w(bfn+1,"трубку трубу") && Qf(1,bfn-1,"sz_iili pre_any") )
    { l[i]=omo2; Z[733]++; if(dbg){print "Z733"}; continue };

    if ( vv(0,4) && !(bfa(1,vvn-1,"_castle_pe") || (bba(-4,-1,"_castle_pe") && s(bbn,-1))) &&
         ba(vvn+1,"_lock_pe") )
    { l[i]=omo2; Z[734]++; if(dbg){print "Z734"}; continue };
    if ( z(0) &&
         q(1,"prl_kred_sr") &&
         q(2,"mest_3e") &&
        ba(3,"_lock_pe") && s(1,2) )
    { l[i]=omo2; Z[735]++; if(dbg){print "Z735"}; continue };

    if ( bf(1,3,"закрыться закрываться") && s(0,bfn+2) && Qf(1,bfn-1,"sz_iili pre_any") &&
          w(bfn+1,"на") &&
          q(bfn+2,"qik_vi") &&
       base(bfn+3,"день месяц год век") )
    { l[i]=omo1; Z[736]++; if(dbg){print "Z736"}; continue };

    if ( base(1,"загореться") &&
            w(2,"зеленым") && s(0,1) )
    { l[i]=omo2; Z[737]++; if(dbg){print "Z737"}; continue };

    # _castle_pe:start
    if ( ba(-1,"_castle_pe") && s(-1) && Q(-1,"suw_any") )
    { l[i]=omo1; Z[738]++; if(dbg){print "Z738"}; continue };
    if ( ba(-1,"_castle_pe") && s(-1) && q(-1,"prq_any") )
    { l[i]=omo1; Z[739]++; if(dbg){print "Z739"}; continue };
    if ( ba(-3,"_castle_pe") && Q(-3,"suw_any") &&
          q(-2,"nar_mest") &&
          q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[740]++; if(dbg){print "Z740"}; continue };
    if ( ba(-2,"_castle_pe") && Q(-2,"suw_any") &&
          q(-1," prl_vi prq_vi mest_vi mest_3e nar_spos nar_mest nar_vrem qast") && s(-2,-1) )
    { l[i]=omo1; Z[741]++; if(dbg){print "Z741"}; continue };
    if ( ba(-3,"_castle_pe") && s(-3) && Q(-3,"suw_any") &&
          q(-2,"prl_kred_sr") && se(-2,"-") &&
          q(-1,"prl_vi") && s(-1) )
    { l[i]=omo1; Z[742]++; if(dbg){print "Z742"}; continue };
    if ( ba(-2,"_castle_pe") && Q(-2,"suw_any") && !(ba(-3,"_lock_pe") && s(-3)) &&
          q(-1,"suw_tv mest_tv") && s(-2,-1) )
    { l[i]=omo1; Z[743]++; if(dbg){print "Z743"}; continue };
    if ( ba(-3,"_castle_pe") && Q(-3,"suw_any") && !(ba(-4,"_lock_pe") && s(-3)) &&
          q(-2,"nar_mest prl_tv prq_tv mest_vi mest_3e qast") &&
          q(-1,"suw_tv") && s(-3,-1) )
    { l[i]=omo1; Z[744]++; if(dbg){print "Z744"}; continue };
    if ( ba(-4,"_castle_pe") && Q(-4,"suw_any") && !(ba(-5,"_lock_pe") && s(-3)) &&
          q(-3,"nar_mest prl_tv prq_tv mest_vi mest_3e qast") &&
          q(-2,"nar_mest prl_tv prq_tv mest_vi mest_3e qast") &&
          q(-1,"suw_tv") && s(-3,-1) )
    { l[i]=omo1; Z[745]++; if(dbg){print "Z745"}; continue };
    if ( ba(-3,"_castle_pe") && Q(-3,"suw_any") &&
          q(-2,"nar_mest prl_vi prq_vi mest_vi mest_3e qast") &&
          q(-1,"nar_mest prl_vi prq_vi mest_vi qast") && s(-3,-1) &&
      !(bfa(1,3,"_lock_pe")) )
    { l[i]=omo1; Z[746]++; if(dbg){print "Z746"}; continue };
    if ( ba(-4,"_castle_pe") && Q(-4,"suw_any") &&
          q(-3,"nar_mest prl_vi prq_vi mest_vi mest_3e qast") &&
          q(-2,"nar_mest prl_vi prq_vi mest_vi mest_3e qast") &&
          q(-1,"nar_mest prl_vi prq_vi mest_vi qast") && s(-4,-1) )
    { l[i]=omo1; Z[747]++; if(dbg){print "Z747"}; continue };


    if ( bfa(1,3,"_castle_pe") && s(0,bfn-1) && Q(bfn,"suw_any") && Qf(1,bfn-1,"sz_iili pre_any") &&
        !(ba(bfn,"_castle_pe_notrh")) && !(bfa(1,bfn-1,"_lock_pe")) )
    { l[i]=omo1; Z[748]++; if(dbg){print "Z748"}; continue };
    if ( pre_tv(1) &&
              q(2,"suw_tv") &&
             ba(3,"_castle_pe") && s(0,2) )
    { l[i]=omo1; Z[749]++; if(dbg){print "Z749"}; continue };
    if ( z(0) && !((bba(-4,-1,"_lock_pe") || bba(-4,-1,"_gl_v_lock_imvi")) && s(bbn,-1)) &&
       bfa(2,4,"_castle_pe") && qif(1,bfn-1,"otnsz_mu nar_any mest_any qast mod_any isname") &&
         s(1,bfn-1) && !(ba(bfn,"_castle_pe_notrh")) )
    { l[i]=omo1; Z[750]++; if(dbg){print "Z750"}; continue };

    if ( q(1,"narph_any") &&
       bfa(xwn+1,xwn+3,"_castle_pe") && s(0,bfn-1) && Q(bfn,"suw_any") && Qf(xwn+1,bfn-1,"sz_iili pre_any") )
    { l[i]=omo1; Z[751]++; if(dbg){print "Z751"}; continue };

    if ( q(1,"mest_im suw_im") && s(0) &&
       qxs(2,"так","и","не") &&
        ba(xsn+1,_castle_pe) && Q(xsn+1,"suw_any") && s(xsn+1) )
    { l[i]=omo1; Z[752]++; if(dbg){print "Z752"}; continue };

    if ( ba(-3,"_castle_pe") && Q(-3,"suw_any") &&
     pre_vi(-2) &&
          q(-1,"suw_vi") && s(-3,-1) )
    { l[i]=omo1; Z[753]++; if(dbg){print "Z753"}; continue };
    if ( ba(-3,"_castle_pe") && Q(-3,"suw_any") &&
     pre_ro(-2) &&
          q(-1,"suw_ro") && s(-3,-1) )
    { l[i]=omo1; Z[754]++; if(dbg){print "Z754"}; continue };
    if ( ba(-4,"_castle_pe") && Q(-4,"suw_any") &&
     pre_ro(-3) &&
          q(-2,"prl_ro prq_ro mest_ro mest_3e") &&
          q(-1,"suw_ro") && s(-4,-1) )
    { l[i]=omo1; Z[755]++; if(dbg){print "Z755"}; continue };
    if ( ba(-3,"_castle_pe") && Q(-3,"suw_any") &&
     pre_tv(-2) &&
          q(-1,"suw_tv") && s(-3,-1) )
    { l[i]=omo1; Z[756]++; if(dbg){print "Z756"}; continue };
    if ( ba(-4,"_castle_pe") && Q(-4,"suw_any") &&
     pre_tv(-3) &&
          q(-2,"suw_tv") &&
          q(-1,"prl_ro prq_ro mest_ro mest_3e") && s(-4,-1) )
    { l[i]=omo1; Z[757]++; if(dbg){print "Z757"}; continue };
    if ( ba(-5,"_castle_pe") && Q(-5,"suw_any") &&
          q(-4,"prl_kred_sr qast") &&
     pre_tv(-3) &&
          q(-2,"suw_tv") &&
          q(-1,"prl_ro prq_ro mest_ro mest_3e") && s(-5,-1) )
    { l[i]=omo1; Z[758]++; if(dbg){print "Z758"}; continue };
    if ( ba(-4,"_castle_pe") && Q(-4,"suw_any") &&
     pre_tv(-3) &&
          q(-2,"prl_tv prq_tv mest_tv mest_3e") &&
          q(-1,"suw_tv") && s(-4,-1) )
    { l[i]=omo1; Z[759]++; if(dbg){print "Z759"}; continue };
    if ( ba(-3,"_castle_pe") && Q(-3,"suw_any") &&
     pre_pr(-2) &&
          q(-1,"suw_pr") && s(-3,-1) )
    { l[i]=omo1; Z[760]++; if(dbg){print "Z760"}; continue };
    if ( ba(-4,"_castle_pe") && Q(-4,"suw_any") &&
     pre_pr(-3) &&
          q(-2,"prl_pr prq_pr mest_pr mest_3e") &&
          q(-1,"suw_pr") && s(-4,-1) )
    { l[i]=omo1; Z[761]++; if(dbg){print "Z761"}; continue };
    if ( ba(-4,"_castle_pe") && Q(-4,"suw_any") &&
     pre_pr(-3) &&
          q(-2,"suw_pr") &&
          q(-1,"prl_edvi prq_edvi mest_vi mest_3e") && s(-4,-1) )
    { l[i]=omo1; Z[762]++; if(dbg){print "Z762"}; continue };
    if ( ba(-5,"_castle_pe") && Q(-5,"suw_any") &&
     pre_pr(-4) &&
          q(-3,"prl_pr prq_pr mest_pr mest_3e") &&
          q(-2,"suw_pr") &&
          q(-1,"prl_edvi prq_edvi mest_vi mest_3e") && s(-5,-1) )
    { l[i]=omo1; Z[763]++; if(dbg){print "Z763"}; continue };
    if ( ba(-6,"_castle_pe") && Q(-6,"suw_any") &&
     pre_ro(-5) &&
          q(-4,"prl_ro prq_ro mest_ro") && Q(-1,"suw_any") &&
     pre_pr(-3) &&
          q(-2,"suw_pr") &&
          q(-1,"prl_edvi prq_edvi mest_vi mest_3e") && s(-6,-1) )
    { l[i]=omo1; Z[764]++; if(dbg){print "Z764"}; continue };
    if ( ba(-7,"_castle_pe") && Q(-7,"suw_any") &&
     pre_ro(-6) &&
          q(-5,"prl_ro prq_ro mest_ro") &&
     pre_pr(-4) &&
          q(-3,"prl_pr prq_pr mest_pr mest_3e") &&
          q(-2,"suw_pr") &&
          q(-1,"prl_edvi prq_edvi mest_vi mest_3e") && s(-7,-1) )
    { l[i]=omo1; Z[765]++; if(dbg){print "Z765"}; continue };
    # _castle_pe:end ...

    # _lock_pe:start
    if ( ba(-1,"_lock_pe") && s(-1) )
    { l[i]=omo2; Z[766]++; if(dbg){print "Z766"}; continue };
    if ( ba(-2,"_lock_pe") &&
          q(-1,"suw_tv") && s(-2,-1) )
    { l[i]=omo2; Z[767]++; if(dbg){print "Z767"}; continue };
    if ( ba(-3,"_lock_pe") &&
          q(-2,"suw_tv") &&
          q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo2; Z[768]++; if(dbg){print "Z768"}; continue };
    if ( ba(-2,"_lock_pe") &&
          q(-1,"suw_im mest_im isname") && s(-2,-1) )
    { l[i]=omo2; Z[769]++; if(dbg){print "Z769"}; continue };
    if ( ba(-3,"_lock_pe") &&
          q(-2,"prl_vi prq_vi mest_vi mest_3e qast") &&
          q(-1,"prl_vi prq_vi mest_vi qast") && s(-3,-1) )
    { l[i]=omo2; Z[770]++; if(dbg){print "Z770"}; continue };
    if ( ba(-4,"_lock_pe") &&
          q(-3,"prl_vi prq_vi mest_vi mest_3e qast") &&
          q(-2,"prl_vi prq_vi mest_vi mest_3e qast") &&
          q(-1,"prl_vi prq_vi mest_vi qast") && s(-4,-1) )
    { l[i]=omo2; Z[771]++; if(dbg){print "Z771"}; continue };
    if ( ba(-5,"_lock_pe") &&
          q(-4,"nar_any prl_kred_sr") &&
          q(-3,"prl_vi prq_vi mest_vi mest_3e qast") &&
          q(-2,"prl_vi prq_vi mest_vi mest_3e qast") &&
          q(-1,"prl_vi prq_vi mest_vi qast") && s(-5,-1) )
    { l[i]=omo2; Z[772]++; if(dbg){print "Z772"}; continue };
    if ( ba(-2,"_lock_pe") &&
          q(-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") && s(-2,-1) )
    { l[i]=omo2; Z[773]++; if(dbg){print "Z773"}; continue };
    if ( ba(-3,"_lock_pe") &&
          q(-2,"prl_ro prq_ro mest_ro mest_3e qik_vi") &&
          q(-1,"suw_ro") && s(-3,-1) )
    { l[i]=omo2; Z[774]++; if(dbg){print "Z774"}; continue };
    if ( ba(-3,"_lock_pe") &&
          q(-2,"prl_tv prq_tv mest_tv") &&
          q(-1,"suw_tv") && s(-3,-1) )
    { l[i]=omo2; Z[775]++; if(dbg){print "Z775"}; continue };
    if ( ba(-3,"_lock_pe") &&
          q(-2,"prq_vi") &&
          q(-1,"suw_tv") && s(-3,-1) )
    { l[i]=omo2; Z[776]++; if(dbg){print "Z776"}; continue };


    if ( bfa(1,3,"_lock_pe") && s(0,bfn-1) && Qf(1,bfn-1,"sz_iili pre_any") )
    { l[i]=omo2; Z[777]++; if(dbg){print "Z777"}; continue };
    if (  w(1,"на") &&
          q(2,"suw_vi mest_vi") &&
        bfa(3,5,"_lock_pe") &&
          s(0,bfn-1) && Qf(3,bfn-1,"sz_iili pre_any") )
    { l[i]=omo2; Z[778]++; if(dbg){print "Z778"}; continue };
    if ( qxs(-1,"еще","один") &&
           q(xsn-1,"gl_pein gl_peed gl_pemn gl_poed deep_pe") && s(xsn-1) &&
           w(1,"и да") &&
          ba(2,"_lock_pe") && s(0,1) )
    { l[i]=omo2; Z[779]++; if(dbg){print "Z779"}; continue };
    if ( pre_pr(1) &&
              q(2,"suw_pr") &&
              q(3,"suw_ro") &&
         pre_tv(4) &&
              q(5,"suw_tv") &&
             ba(6,"_lock_pe") && s(0,5) )
    { l[i]=omo2; Z[780]++; if(dbg){print "Z780"}; continue };


    if ( z(0) &&
         q(1,"otnsz_mu") &&
       bfa(2,4,"_lock_pe") && s(1,bfn-1) && Qf(2,bfn-1,"sz_iili pre_any") )
    { l[i]=omo2; Z[781]++; if(dbg){print "Z781"}; continue };

    if ( ba(-5,"_lock_pe") &&
          w(-4,"у") &&
          q(-3,"suw_ro mest_ro") &&
     pre_vi(-2) &&
          q(-1,"suw_vi mest_vi") && s(-5,-1) )
    { l[i]=omo2; Z[782]++; if(dbg){print "Z782"}; continue };
    if ( ba(-4,"_lock_pe") &&
     pre_vi(-3) &&
          q(-2,"suw_vi mest_vi") &&
          q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-4,-1) )
    { l[i]=omo2; Z[783]++; if(dbg){print "Z783"}; continue };
    if ( ba(-5,"_lock_pe") &&
     pre_vi(-4) &&
          q(-3,"suw_vi mest_vi") &&
          q(-2,"prl_vi prq_vi mest_vi mest_3e") &&
          q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-5,-1) )
    { l[i]=omo2; Z[784]++; if(dbg){print "Z784"}; continue };
    if ( ba(-6,"_lock_pe") &&
     pre_vi(-5) &&
          q(-4,"suw_vi mest_vi") &&
          q(-3,"nar_napr") &&
          q(-2,"prl_vi prq_vi mest_vi mest_3e") &&
          q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-6,-1) )
    { l[i]=omo2; Z[785]++; if(dbg){print "Z785"}; continue };
    if ( ba(-4,"_lock_pe") &&
     pre_vi(-3) &&
          q(-2,"suw_vi") &&
          q(-1,"suw_ro") && s(-4,-1) )
    { l[i]=omo2; Z[786]++; if(dbg){print "Z786"}; continue };
    if ( ba(-5,"_lock_pe") &&
          q(-4,"suw_im mest_im suw_da mest_da") &&
     pre_vi(-3) &&
          q(-2,"suw_vi") &&
          q(-1,"suw_ro") && s(-5,-1) )
    { l[i]=omo2; Z[787]++; if(dbg){print "Z787"}; continue };
    if ( ba(-4,"_lock_pe") &&
     pre_vi(-3) &&
          q(-2,"prl_vi prq_vi mest_vi mest_3e") &&
          q(-1,"suw_vi mest_vi") && s(-4,-1) )
    { l[i]=omo2; Z[788]++; if(dbg){print "Z788"}; continue };
    if ( ba(-5,"_lock_pe") &&
     pre_vi(-4) &&
          q(-3,"prl_vi prq_vi mest_vi mest_3e") &&
          q(-2,"suw_vi mest_vi") &&
          q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-5,-1) )
    { l[i]=omo2; Z[789]++; if(dbg){print "Z789"}; continue };
    if ( ba(-4,"_lock_pe") &&
     pre_vi(-3) &&
          q(-2,"prl_vi prq_vi mest_vi mest_3e") &&
          q(-1,"suw_vi mest_vi") && s(-4,-1) )
    { l[i]=omo2; Z[790]++; if(dbg){print "Z790"}; continue };
    if ( ba(-3,"_lock_pe") &&
     pre_tv(-2) &&
          q(-1,"suw_tv mest_tv") && s(-3,-1) )
    { l[i]=omo2; Z[791]++; if(dbg){print "Z791"}; continue };
    if ( ba(-4,"_lock_pe") &&
     pre_tv(-3) &&
          q(-2,"prl_tv mest_tv mest_3e") &&
          q(-1,"suw_tv mest_tv") && s(-4,-1) )
    { l[i]=omo2; Z[792]++; if(dbg){print "Z792"}; continue };
    if ( ba(-3,"_lock_pe") &&
     pre_pr(-2) &&
          q(-1,"suw_pr mest_vip3e") && s(-3,-1) )
    { l[i]=omo2; Z[793]++; if(dbg){print "Z793"}; continue };
    # _lock_pe:end ...

    # _castle_prl_geo:start
    cst1="быть ведь же стать считаться являться";
    if ( prl_im(-1) &&
             ba(-1,"_castle_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[794]++; if(dbg){print "Z794"}; continue };
    if ( prl_im(-2) &&
             ba(-2,"_castle_prl_geo") &&
              Q(-1,"suw_any") && s(-2,-1)  )
    { l[i]=omo1; Z[795]++; if(dbg){print "Z795"}; continue };
    if ( prl_im(1) &&
             ba(1,"_castle_prl_geo") && s(0) && !(prl_ro(1)))
    { l[i]=omo1; Z[796]++; if(dbg){print "Z796"}; continue };
    if ( prl_im(1) &&
           base(1,cst1) &&
            bfa(2,5,"_castle_prl_geo") && s(0,bfn-1) && Qf(2,bfn-1,"pre_any sz_iili")  )
    { l[i]=omo1; Z[797]++; if(dbg){print "Z797"}; continue };
    # _castle_prl_geo:start


 }; # и.п. и в.п. замок замки

 ### замка замков р.п.
 if(iwrd=="замка" || iwrd=="замков") {
 #
    # _castle_prl:start
    if ( ba(-1,"_castle_prl") && prl_ro(-1) && s(-1)  )
    { l[i]=omo1; Z[798]++; if(dbg){print "Z798"}; continue };
    if ( ba(-2,"_castle_prl") && prl_ro(-2) &&
          q(-1,"prl_any prq_any mest_any qast") && s(-2,-1)  )
    { l[i]=omo1; Z[799]++; if(dbg){print "Z799"}; continue };
    if ( ba(-3,"_castle_prl") && prl_ro(-3) &&
          q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
          q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo1; Z[800]++; if(dbg){print "Z800"}; continue };
    if ( ba(1,"_castle_prl") && prl_ro(1) && s(0) )
    { l[i]=omo1; Z[801]++; if(dbg){print "Z801"}; continue };
    # _castle_prl:start

    # _lock_prl:start
    if ( ba(-1,"_lock_prl") && s(-1) && prl_ro(-1) )
    { l[i]=omo2; Z[802]++; if(dbg){print "Z802"}; continue };
    if ( ba(-2,"_lock_prl") && prl_ro(-2) &&
          Q(-1,"suw_any sz_iili") && s(-2,-1) )
    { l[i]=omo2; Z[803]++; if(dbg){print "Z803"}; continue };
    if ( ba(-3,"_lock_prl") && prl_ro(-3) &&
          q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
          q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo2; Z[804]++; if(dbg){print "Z804"}; continue };
    if ( ba(1,"_lock_prl") && s(0) && prl_ro(1) && !(isname(1)) )
    { l[i]=omo2; Z[805]++; if(dbg){print "Z805"}; continue };
    # _lock_prl:end

    # _castle_prl_geo:start
    if ( prl_ro(-1) &&
             ba(-1,"_castle_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[806]++; if(dbg){print "Z806"}; continue };
    if ( prl_ro(-2) &&
             ba(-2,"_castle_prl_geo") &&
              Q(-1,"suw_any") && s(-2,-1)  )
    { l[i]=omo1; Z[807]++; if(dbg){print "Z807"}; continue };
    if ( prl_ro(1) &&
             ba(1,"_castle_prl_geo") && s(0) && !(prl_ro(1)))
    { l[i]=omo1; Z[808]++; if(dbg){print "Z808"}; continue };
    # _castle_prl_geo:start

  }; # р.п. замка замков

 ### замком замками дат.п.
 if(iwrd=="замку" || iwrd=="замкам") {
 #
    # _castle_prl:start
    if ( ba(-1,"_castle_prl") && prl_da(-1) && s(-1)  )
    { l[i]=omo1; Z[809]++; if(dbg){print "Z809"}; continue };
    if ( ba(-2,"_castle_prl") && prl_da(-2) &&
          q(-1,"prl_any prq_any mest_any qast") && s(-2,-1)  )
    { l[i]=omo1; Z[810]++; if(dbg){print "Z810"}; continue };
    if ( ba(-3,"_castle_prl") && prl_da(-3) &&
          q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
          q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo1; Z[811]++; if(dbg){print "Z811"}; continue };
    if ( ba(1,"_castle_prl") && prl_da(1) && s(0) )
    { l[i]=omo1; Z[812]++; if(dbg){print "Z812"}; continue };
    # _castle_prl:start

    # _lock_prl:start
    if ( ba(-1,"_lock_prl") && s(-1) && prl_da(-1) )
    { l[i]=omo2; Z[813]++; if(dbg){print "Z813"}; continue };
    if ( ba(-2,"_lock_prl") && prl_da(-2) &&
          Q(-1,"suw_any sz_iili") && s(-2,-1) )
    { l[i]=omo2; Z[814]++; if(dbg){print "Z814"}; continue };
    if ( ba(-3,"_lock_prl") && prl_da(-3) &&
          q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
          q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo2; Z[815]++; if(dbg){print "Z815"}; continue };
    if ( ba(1,"_lock_prl") && s(0) && prl_da(1) && !(isname(1)) )
    { l[i]=omo2; Z[816]++; if(dbg){print "Z816"}; continue };
    # _lock_prl:end

    # _castle_prl_geo:start
    if ( prl_da(-1) &&
             ba(-1,"_castle_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[817]++; if(dbg){print "Z817"}; continue };
    if ( prl_da(-2) &&
             ba(-2,"_castle_prl_geo") &&
              Q(-1,"suw_any") && s(-2,-1)  )
    { l[i]=omo1; Z[818]++; if(dbg){print "Z818"}; continue };
    if ( prl_da(1) &&
             ba(1,"_castle_prl_geo") && s(0) && !(prl_da(1)))
    { l[i]=omo1; Z[819]++; if(dbg){print "Z819"}; continue };
    # _castle_prl_geo:start

  }; # дат.п. замку замкам


 ### замком замками тв.п.
 if(iwrd=="замком" || iwrd=="замками") {
 #
    # _castle_prl:start
    if ( ba(-1,"_castle_prl") && prl_tv(-1) && s(-1)  )
    { l[i]=omo1; Z[820]++; if(dbg){print "Z820"}; continue };
    if ( ba(-2,"_castle_prl") && prl_tv(-2) &&
          q(-1,"prl_any prq_any mest_any qast") && s(-2,-1)  )
    { l[i]=omo1; Z[821]++; if(dbg){print "Z821"}; continue };
    if ( ba(-3,"_castle_prl") && prl_tv(-3) &&
          q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
          q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo1; Z[822]++; if(dbg){print "Z822"}; continue };
    if ( ba(1,"_castle_prl") && prl_tv(1) && s(0) )
    { l[i]=omo1; Z[823]++; if(dbg){print "Z823"}; continue };
    # _castle_prl:start

    # _lock_prl:start
    if ( ba(-1,"_lock_prl") && s(-1) && prl_tv(-1) )
    { l[i]=omo2; Z[824]++; if(dbg){print "Z824"}; continue };
    if ( ba(-2,"_lock_prl") && prl_tv(-2) &&
          Q(-1,"suw_any sz_iili") && s(-2,-1) )
    { l[i]=omo2; Z[825]++; if(dbg){print "Z825"}; continue };
    if ( ba(-3,"_lock_prl") && prl_tv(-3) &&
          q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
          q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo2; Z[826]++; if(dbg){print "Z826"}; continue };
    if ( ba(1,"_lock_prl") && s(0) && prl_tv(1) && !(isname(1)) )
    { l[i]=omo2; Z[827]++; if(dbg){print "Z827"}; continue };
    # _lock_prl:end

    # _castle_prl_geo:start
    if ( prl_tv(-1) &&
             ba(-1,"_castle_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[828]++; if(dbg){print "Z828"}; continue };
    if ( prl_tv(-2) &&
             ba(-2,"_castle_prl_geo") &&
              Q(-1,"suw_any") && s(-2,-1)  )
    { l[i]=omo1; Z[829]++; if(dbg){print "Z829"}; continue };
    if ( prl_tv(1) &&
             ba(1,"_castle_prl_geo") && s(0) && !(prl_tv(1)))
    { l[i]=omo1; Z[830]++; if(dbg){print "Z830"}; continue };
    # _castle_prl_geo:start

  }; # тв.п. замком замками

 ### замке замках пр.п.
 if(iwrd=="замке" || iwrd=="замках") {
 #
    # _castle_prl:start
    if ( ba(-1,"_castle_prl") && prl_da(-1) && s(-1)  )
    { l[i]=omo1; Z[831]++; if(dbg){print "Z831"}; continue };
    if ( ba(-2,"_castle_prl") && prl_da(-2) &&
          q(-1,"prl_any prq_any mest_any qast") && s(-2,-1)  )
    { l[i]=omo1; Z[832]++; if(dbg){print "Z832"}; continue };
    if ( ba(-3,"_castle_prl") && prl_da(-3) &&
          q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
          q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo1; Z[833]++; if(dbg){print "Z833"}; continue };
    if ( ba(1,"_castle_prl") && prl_da(1) && s(0) )
    { l[i]=omo1; Z[834]++; if(dbg){print "Z834"}; continue };
    # _castle_prl:start

    # _lock_prl:start
    if ( ba(-1,"_lock_prl") && s(-1) && prl_da(-1) )
    { l[i]=omo2; Z[835]++; if(dbg){print "Z835"}; continue };
    if ( ba(-2,"_lock_prl") && prl_da(-2) &&
          Q(-1,"suw_any sz_iili") && s(-2,-1) )
    { l[i]=omo2; Z[836]++; if(dbg){print "Z836"}; continue };
    if ( ba(-3,"_lock_prl") && prl_da(-3) &&
          q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
          q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo2; Z[837]++; if(dbg){print "Z837"}; continue };
    if ( ba(1,"_lock_prl") && s(0) && prl_da(1) && !(isname(1)) )
    { l[i]=omo2; Z[838]++; if(dbg){print "Z838"}; continue };
    # _lock_prl:end

    # _castle_prl_geo:start
    if ( prl_da(-1) &&
             ba(-1,"_castle_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[839]++; if(dbg){print "Z839"}; continue };
    if ( prl_da(-2) &&
             ba(-2,"_castle_prl_geo") &&
              Q(-1,"suw_any") && s(-2,-1)  )
    { l[i]=omo1; Z[840]++; if(dbg){print "Z840"}; continue };
    if ( prl_da(1) &&
             ba(1,"_castle_prl_geo") && s(0) && !(prl_da(1)))
    { l[i]=omo1; Z[841]++; if(dbg){print "Z841"}; continue };
    # _castle_prl_geo:start

  }; # пр.п. замке замках


  # _castle_pe:start
 # _lock_pe:start
 cst="ручка";
 if ( qxs(-1,"как","и") &&
     base(xsn-1,cst) && sc(xsn-1,",") &&
       ba(1,"_castle_pe") && Q(1,"suw_any") )
 { l[i]=omo2; Z[842]++; if(dbg){print "Z842"}; continue };
 if ( z(0) && q(1,"prq_any") && ba(1,"_castle_pe") && s(1) && Q(1,"suw_any") )
 { l[i]=omo1; Z[843]++; if(dbg){print "Z843"}; continue };
 if ( z(0) &&
      q(1,"nar_spos prl_kred_sr") &&
      q(2,"prq_any") && ba(2,"_castle_pe") && s(1,2) && Q(-1,"suw_any") )
 { l[i]=omo1; Z[844]++; if(dbg){print "Z844"}; continue };
 if ( z(0) && q(1,"prq_any") && ba(1,"_lock_pe") && s(1) )
 { l[i]=omo2; Z[845]++; if(dbg){print "Z845"}; continue };
 if ( q(-1,"prq_any") && ba(-1,"_castle_pe") && s(-1) && Q(-1,"suw_any") )
 { l[i]=omo1; Z[846]++; if(dbg){print "Z846"}; continue };
 if ( q(-1,"prq_any") && ba(-1,"_lock_pe") && s(-1) )
 { l[i]=omo2; Z[847]++; if(dbg){print "Z847"}; continue };
 if ( q(-3,"prq_any") && ba(-3,"_castle_pe") && Q(-3,"suw_any") &&
 pre_ro(-2) &&
      q(-1,"suw_ro") && s(-3,-1) )
 { l[i]=omo1; Z[848]++; if(dbg){print "Z848"}; continue };
 if ( q(-4,"prq_any") && ba(-4,"_castle_pe") && Q(-4,"suw_any") &&
 pre_ro(-3) &&
      q(-2,"prl_ro") &&
      q(-1,"suw_ro") && s(-4,-1) )
 { l[i]=omo1; Z[849]++; if(dbg){print "Z849"}; continue };
 # _castle_pe:start
 # _lock_pe:end

 # _lock_na_item:start
 if ( w(-4,"на") &&
      q(-3,"prl_pr mest_pr mest_3e") &&
     ba(-2,"_lock_na_item") &&
      q(-1,"prl_im prq_im mest_vi mest_3e") && s(-4,-1) )
 { l[i]=omo2; Z[850]++; if(dbg){print "Z850"}; continue };
 if ( ba(-2,"_lock_na_item") && se(-2," — ") &&
       w(-1,"на") && s(-1) )
 { l[i]=omo2; Z[851]++; if(dbg){print "Z851"}; continue };
 if ( w(1,"на") &&
    bfa(2,5,"_lock_na_item") && s(0,bfn-1) &&
    qif(2,bfn-1,"prl_vi prl_pr mest_vi mest_pr prq_vi prq_pr") )
 { l[i]=omo2; Z[852]++; if(dbg){print "Z852"}; continue }; #check ислючения "в"
 if ( w(1,"у") && Ww_(-1,"в") &&
      q(2,"suw_vi mest_vi isname") &&
      w(3,"на") &&
    qif(4,5,"prl_vi prl_pr mest_vi mest_pr mest_3e prq_vi prq_pr") &&
    bfa(4,7,"_lock_na_item") && s(0,bfn-1) )
 { l[i]=omo2; Z[853]++; if(dbg){print "Z853"}; continue };
 cst="быть находиться стоять";
 if ( base(1,cst) &&
         w(2,"на") && Ww_(-1,"в") &&
       qif(3,6,"prl_vi prl_pr mest_vi mest_pr mest_3e prq_vi prq_pr") &&
       bfa(3,7,"_lock_na_item") && s(0,bfn-1) )
 { l[i]=omo2; Z[854]++; if(dbg){print "Z854"}; continue };
 # _lock_na_item:end


 # от обработки предыдущего в строке:start
 if ( gist(-4,2) &&
         w(-3,"не") &&
         q(-2,"gl_ed gl_mn gl_vzed gl_vzmn") && z(-2) &&
         w(-1,"а но и или") && s(0) )
 { l[i]=omo2; Z[855]++; if(dbg){print "Z855"}; continue };
 # от обработки предыдущего в строке:end

 if ( isname(1) && s(0) )
 { l[i]=omo1; Z[856]++; if(dbg){print "Z856"}; continue };
 if ( w(1,"де дю фон ди да дель ла ло ле лё") &&
 isname(2) && s(0,1) )
 { l[i]=omo1; Z[857]++; if(dbg){print "Z857"}; continue };
 if ( (qxs(1,"де","ла")||
       qxs(1,"фон","дер")) &&
    isname(xsn+1) && s(xsn) )
 { l[i]=omo1; Z[858]++; if(dbg){print "Z858"}; continue };
 if ( w(1,"д л") && sc(1,"[\x27’]") &&
 isname(2) && s(0) )
 { l[i]=omo1; Z[859]++; if(dbg){print "Z859"}; continue };
 if ( q(1,"pre_vi pre_ro pre_pr") &&
 isname(2) && s(0,1) && !(bb(-4,-1,"ключ ключик")) )
 { l[i]=omo1; Z[860]++; if(dbg){print "Z860"}; continue };
 if ( isname(-1) && ( (s(-2,-1) && sv(-2,")"))||(z(-2) && s(-1)) ) )
 { l[i]=omo1; Z[861]++; if(dbg){print "Z861"}; continue };
 if ( isname(0) && s(-1) )
 { l[i]=omo1; Z[862]++; if(dbg){print "Z862"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

}
