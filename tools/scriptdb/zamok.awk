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
#if ( w(0,"замок") && wb(-4,-1,"в во") && s(wbn,-1) && qir(wbn+1,-1,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi qast") )
#{ print book[b]; Z[2]++; if(dbg){print "Z2"}; }; continue
#{ print book[b] >> "_va_zamok.txt"; Z[3]++; if(dbg){print "Z3"}; }; continue
#if ( w(0,"замок") && wb(-4,-1,"под") && s(wbn,-1) )
#{ print book[b] >> "_pod_zamok.txt"; Z[4]++; if(dbg){print "Z4"}; }; continue
#{ getBFx(-2,-2,"_glo.txt"); Z[5]++; if(dbg){print "Z5"}; }; continue
#if ( w(0,"замок") && bb(-9,-1,"заменить") && s(bbn,-1) )
#{ print book[b] >> "_pod_zamok.txt"; Z[6]++; if(dbg){print "Z6"}; }; continue
#if ( q(1,"isname") && s(1) )
#{ print l[i+1] >> "_isname.txt"; Z[7]++; if(dbg){print "Z7"}; }; continue
#if ( w(1,"между") &&
#     q(2,"prl_tv prq_tv mest_tv mest_3e") &&
#     q(3,"suw_tv") && s(0,2) && Q(3,"prl_tv")  )
#{ print l[i+3] >> "_ss_tv.txt"; Z[8]++; if(dbg){print "Z8"}; }; continue
#if ( w(1,"между") &&
#     q(2,"prl_tv prq_tv mest_tv mest_3e") &&
#     q(3,"prl_tv prq_tv mest_tv mest_3e") &&
#     q(4,"suw_tv") && s(0,3) && Q(4,"prl_tv")  )
#{ print l[i+4] >> "_ss_tv.txt"; Z[9]++; if(dbg){print "Z9"}; }; continue
#{ print l[i+1] >> "_sw.txt"; Z[10]++; if(dbg){print "Z10"}; }; continue

#getBFx(-3,3,"_an.txt"); Z[11]++; if(dbg){print "Z11"}; continue
 # forced:start

 if ( ( qxs(1,"черных","ключей")||
        qxs(1,"дикого","волка") ) &&
        qir(1,xsn,"isname") )
 { l[i]=omo1; Z[12]++; if(dbg){print "Z12"}; continue };

 if ( prl_any(-1) && isname(-1) && ba(-1,"_castle_prl_geo_forced") && s(-1) )
 { l[i]=omo2; Z[13]++; if(dbg){print "Z13"}; continue };
 if ( prl_any(-1) && ba(-1,"_lock_prl_forced") && s(-1) )
 { l[i]=omo2; Z[14]++; if(dbg){print "Z14"}; continue };

 if ( wa(1,"_castle_isname_geo_forced") && s(0) )
 { l[i]=omo1; Z[15]++; if(dbg){print "Z15"}; continue };
 # forced:end

 ### ALL
 cst="блокировать заблокировать";
 cst1="армия взвод дивизия имперец отряд полк рота";
 if ( bw(-1,cst) &&
      bw(1,cst1) && s(-1,0) )
 { l[i]=omo1; Z[16]++; if(dbg){print "Z16"}; continue };
 if ( bw(-2,cst1) && z(-2) &&
 prq_any(-1) && bw(-1,cst) && s(-1) )
 { l[i]=omo1; Z[17]++; if(dbg){print "Z17"}; continue };
 if ( bw(-4,cst) &&
  pre_pr(-3) &&
       q(-2,"isname") &&
       q(-1,"prl_vi mest_vi mest_3e") && s(-4,-1) )
 { l[i]=omo1; Z[18]++; if(dbg){print "Z18"}; continue };
 if ( bw(-3,cst1) &&
       q(-2,"suw_ro isname") && z(-2) &&
 prq_any(-1) && bw(-1,cst) && s(-1) )
 { l[i]=omo1; Z[19]++; if(dbg){print "Z19"}; continue };

 if ( qxs(-1,"замок","или","даже") )
 { l[i]=omo1; Z[20]++; if(dbg){print "Z20"}; continue };
 if ( qxs(1,"или","даже","замок") )
 { l[i]=omo2; Z[21]++; if(dbg){print "Z21"}; continue };

 if ( q(0,"isname") && q(1,"isname") && zs(0) && zs(-1) &&
    !(s(0) && wa(1,"_lock_suw-ro") )  )
 { l[i]=omo1; Z[22]++; if(dbg){print "Z22"}; continue };

 if ( q(-1,"isname") && q(0,"isname") && s(-1) && zs(-2) &&
      Q(-1,"pre_any") &&
    !(q(-1,"prq_any") && ba(-1,"_lock_pe") ) &&
   !bam(-1,"_lock_prl _lock_parts") &&
   !(zs(0) && qy(1,"sz_iili") && s(0+qyn) && ba(1+qyn,"_lock_parts") ) &&
    !(s(0) && wa(1,"_lock_suw-ro") ) )
 { l[i]=omo1; Z[23]++; if(dbg){print "Z23"}; continue };

 if ( prq_any(-1) && ba(-1,"_prq_castle") && s(-1) )
 { l[i]=omo1; Z[24]++; if(dbg){print "Z24"}; continue };
 cst="окружить";
 if ( prq_any(-2) && bw(-2,cst) &&
            q(-1,"suw_tv mest_tv") && s(-2,-1) )
 { l[i]=omo1; Z[25]++; if(dbg){print "Z25"}; continue };

 if ( prq_any(-1) && ba(-1,"_prq_lock") && s(-1) )
 { l[i]=omo2; Z[26]++; if(dbg){print "Z26"}; continue };

 cst="завернуть";
 if ( prq_any(-3) && bw(-3,cst) &&
            q(-2,"pre_vi") &&
            q(-1,"suw_vi") && s(-3,-1) )
 { l[i]=omo2; Z[27]++; if(dbg){print "Z27"}; continue };

 cst="полный";
 if ( bw(1,cst) &&
       q(2,"suw_ro suw_tv") && zs(0) && s(1) )
 { l[i]=omo1; Z[28]++; if(dbg){print "Z28"}; continue };

 cst="[иотх]летн[еи] башенн[оы] комнатн[оы] метров[оы] саженн[оы] стенн[оы] уровнев[оы] этажн[оы] ярусн[оы]";
 if ( wc(-1,cst) && s(-1) )
 { l[i]=omo1; Z[29]++; if(dbg){print "Z29"}; continue };

 cst="бергск боргск бургск вилльск вильск городск гофск градск дорфск стонск стоунск таунск штадтск";
 cst1="ие ий им ими их ого ом ому";
 if ( jme(-1,cst,cst1) && s(-1) )
 { l[i]=omo1; Z[30]++; if(dbg){print "Z30"}; continue };

 if ( q(-1,"prl_any") &&
 isname(0) && s(-2,-1) )
 { l[i]=omo1; Z[31]++; if(dbg){print "Z31"}; continue };

#cst="ие ий им ими их ого ом ому";
#if ( wma(-1,"_castle_geo_nodic",cst) && s(-1) )
#{ l[i]=omo1; Z[32]++; if(dbg){print "Z32"}; continue };

 cst="дюймов[оы] засовн[оы] значн[оы] копеечн[оы] пружинн[оы] пудов[оы] сувальдн[оы] точечн[оы] цилиндров[оы] штифтов[оы] штырьков[оы]";
 if ( wc(-1,cst) && s(-1) )
 { l[i]=omo2; Z[33]++; if(dbg){print "Z33"}; continue };

 cst="дюжин дюжины сотени сотни тысяч тысячи";
 if ( w(1,cst) &&
      q(2,"suw_mnro") && s(0,1) )
 { l[i]=omo1; Z[34]++; if(dbg){print "Z34"}; continue };

 cst="выглядеть казаться оказаться показаться представлять";
 if ( q(-1,"nar_mest nar_napr") &&
     bf(1,3,cst) && s(-1,bfn-1) )
 { l[i]=omo1; Z[35]++; if(dbg){print "Z35"}; continue };

 if ( qxs(1,"средней","руки") )
 { l[i]=omo1; Z[36]++; if(dbg){print "Z36"}; continue };
 if ( qxw(-1,"да","ну","его") && z(-1) )
 { l[i]=omo1; Z[37]++; if(dbg){print "Z37"}; continue };

 # _castlelike_things:start
 if ( z(0) &&
   (qxw(1,"а но","не и")||
    qxw(1,"а но","также","и")||
    qxw(1,"так","и") ) &&
     ba(xwn+1,"_castlelike_things") && s(xwn) )
 { l[i]=omo1; Z[38]++; if(dbg){print "Z38"}; continue };
 if ( z(0) &&
   (qxw(1,"а но","не и")||
    qxw(1,"а но","также","и")||
    qxw(1,"так","и") ) &&
      q(xwn+1,"prl_any prq_any nar_any") &&
     ba(xwn+2,"_castlelike_things") && s(1,xwn+1) )
 { l[i]=omo1; Z[39]++; if(dbg){print "Z39"}; continue };
 if ( qxs(-1,"а но","не и") &&
       ba(xsn-1,"_castlelike_things") && sc(xsn-1,",") )
 { l[i]=omo1; Z[40]++; if(dbg){print "Z40"}; continue };
 if ( mest_it(-2) &&
            w(-1,"не") && s(-2,-1) &&
            z(0) &&
      mest_it(1) &&
            w(2,"не") &&
           ba(3,"_castlelike_things") && s(1,2) )
 { l[i]=omo1; Z[41]++; if(dbg){print "Z41"}; continue };
 if ( mest_it(-2) &&
            w(-1,"не") && s(-2,-1) &&
            z(0) &&
      mest_it(1) &&
            w(2,"не") &&
            q(3,"prl_any prq_any nar_any") &&
           ba(4,"_castlelike_things") && s(1,3) )
 { l[i]=omo1; Z[42]++; if(dbg){print "Z42"}; continue };
 cst="более больше скорее";
 if (  w(-1,cst) && s(-1) && z(0) &&
       w(1,"чем") &&
      ba(2,"_castlelike_things") && s(1) )
 { l[i]=omo1; Z[43]++; if(dbg){print "Z43"}; continue };
 if (  w(-3,cst) && s(-3) &&
      ba(-2,"_castlelike_things") && z(-2) &&
       w(-1,"чем") && s(1) )
 { l[i]=omo1; Z[44]++; if(dbg){print "Z44"}; continue };

 if ( q(1,"prl_srav nar_srav") &&
    bfa(2,4,"_castlelike_things") && s(0,bfn-1) &&
    qir(2,bfn-1,"prl_ro mest_ro mest_3e prq_ro nar_any qast") )
 { l[i]=omo1; Z[45]++; if(dbg){print "Z45"}; continue };
 if ( q(1,"prl_kred nar_any qast") &&
      q(2,"prl_srav nar_srav") &&
    bfa(3,5,"_castlelike_things") && s(0,bfn-1) &&
    qir(3,bfn-1,"prl_ro mest_ro mest_3e prq_ro nar_any qast") )
 { l[i]=omo1; Z[46]++; if(dbg){print "Z46"}; continue };

 # ни … ни
 if ( qb(-4,-1,"qast_ne") && s(qbn,-1) &&
     qir(qbn+1,-1,"prl_any mest_any prq_any") &&
 sz_iili(1) && zs(0) &&
       q(2,"qast_ne") &&
     bfa(3,6,"_castlelike_things") && s(0,bfn-1) &&
     qir(3,bfn-1,"prl_any mest_any prq_any") )
 { l[i]=omo1; Z[47]++; if(dbg){print "Z47"}; continue };
 if ( q(-1,"qast_ne") && z(0) && s(-1) &&
      q(1,"qast_ne") &&
     ba(2,"_castlelike_things") && s(1) )
 { l[i]=omo1; Z[48]++; if(dbg){print "Z48"}; continue };
 if ( q(-1,"qast_ne") && z(0) && s(-1) &&
      w(1,"а но") &&
     ba(2,"_castlelike_things") && s(1) )
 { l[i]=omo1; Z[49]++; if(dbg){print "Z49"}; continue };

 # дефис
 if ( sc(0,"-") && ba(1,"_castlelike_things") )
 { l[i]=omo1; Z[50]++; if(dbg){print "Z50"}; continue };
 if ( sc(-1,"-") && ba(-1,"_castlelike_things") )
 { l[i]=omo1; Z[51]++; if(dbg){print "Z51"}; continue };


 # превращать
 cst="превратить превратиться превращать превращаться";
 if ( bw(-1,cst) &&
       w(1,"в") &&
     bfa(2,5,"_castlelike_things") && s(-1,bfn) &&
     qir(2,bfn-1,"prl_vi mest_vi mest_3e prq_vi nar_any qast_any") )
 { l[i]=omo1; Z[52]++; if(dbg){print "Z52"}; continue };
 if ( qy(1,"gl_aux_be") &&
      bw(1+qyn,cst) &&
       w(2+qyn,"в") &&
     bfa(3+qyn,6+qyn,"_castlelike_things") && s(0,bfn-1+qyn) &&
     qir(3+qyn,bfn-1,"prl_vi mest_vi mest_3e prq_vi nar_any qast_any") )
 { l[i]=omo1; Z[53]++; if(dbg){print "Z53"}; continue };
 if ( ba(-3,"_castlelike_things") &&
      bw(-2,cst) &&
       w(-1,"в") && s(-3,-1) )
 { l[i]=omo1; Z[54]++; if(dbg){print "Z54"}; continue };
 if ( bw(-3,cst) &&
       w(-2,"в") &&
      ba(-1,"_castlelike_things") && s(-3,-1) )
 { l[i]=omo1; Z[55]++; if(dbg){print "Z55"}; continue };

 cst="напоминать";
 bf(-3,-1,cst); wf_n=bfn; bfa(wf_n-5,wf_n-1,"_castlelike_things"); bf_n=bfn;
 if ( vgle(wf_n,-3,-1) && vgle(bf_n,wf_n-5,wf_n-1) && z(bf_n) &&
       qir(bf_n-1,wf_n+1,"prl_kred_sr") &&
       qir(wf_n-1,-1,"prl_vi mest_vi mest_3e") && s(bf_n+1,-1) )
 { l[i]=omo1; Z[56]++; if(dbg){print "Z56"}; continue };
 if ( bw(1,cst) && zs(0) &&
     bfa(2,5,"_castlelike_things") &&
     qiz(2,bfn-1,"prl_vi prq_vi mest_vi mest_3e","qast") &&
       q(bfn,"suw_vi") && s(1,bfn-1) )
 { l[i]=omo1; Z[57]++; if(dbg){print "Z57"}; continue };
 if ( wf(2,6,"собой") &&
     qir(1,wfn-2,"nar_any isname prl_vi prq_vi pre_pr prl_pr suw_pr qast_any") &&
      bw(wfn-1,"представлять") && zs(0) &&
     bfa(wfn+1,wfn+4,"_castlelike_things") &&
     qiz(wfn+1,bfn-1,"prl_vi prq_vi mest_vi mest_3e","qast") &&
       q(bfn,"suw_vi") && s(1,bfn-1) )
 { l[i]=omo1; Z[58]++; if(dbg){print "Z58"}; continue };
 if ( wf(2,6,"собой") &&
     qir(1,wfn-2,"nar_any isname pre_pr prl_pr suw_pr qast_any") &&
      bw(wfn-1,"представлять") && zs(0) &&
     bfa(wfn+1,wfn+4,"_locklike_things") &&
     qiz(wfn+1,bfn-1,"prl_vi prq_vi mest_vi mest_3e","qast") &&
       q(bfn,"suw_vi") && s(1,bfn-1) )
 { l[i]=omo2; Z[59]++; if(dbg){print "Z59"}; continue };
 if ( qxw(1,"как") && z(0) &&
       qy(xwn+1,"prl_im prl_vi prq_im prq_vi") &&
       ba(xwn+1+qyn,"_castlelike_things") && s(xwn,xwn+qyn) )
 { l[i]=omo1; Z[60]++; if(dbg){print "Z60"}; continue };

 cst="быть вставать именовать казаться объявить объявлять оказаться провозгласить провозглашать сделать служить стать являться";
 if ( bw(1,cst) && zs(0) &&
     bfa(2,5,"_castlelike_things") &&
       q(bfn,"suw_tv") &&
     qiz(2,bfn-1,"prl_tv prq_tv mest_tv mest_3e","qast") && s(1,bfn-1) )
 { l[i]=omo1; Z[61]++; if(dbg){print "Z61"}; continue };
 # _castlelike_things:end

 # _castlelike_acro:start
 if ( s(0) && isacro(1) && wa(1,"_castlelike_acro") )
 { l[i]=omo1; Z[62]++; if(dbg){print "Z62"}; continue };
 # _castlelike_acro:start

 # _castle_environs:start
 # escapes:start
 if ( sc(0,"[— ]") &&
      bw(1,"вынести") &&
    (qxw(2,"с со") ||
     qxw(2,"вместе","с со")) &&
       w(xwn+1,"дверью дверями воротами") && s(1,xwn) )
 { l[i]=omo2; Z[63]++; if(dbg){print "Z63"}; continue };
 cst="багажник канаву корзинку кусты сумку";
 if ( bw(-1,"забросить бросить") &&
       w(1,"в") &&
       w(2,cst) && s(-1,1) )
 { l[i]=omo2; Z[64]++; if(dbg){print "Z64"}; continue };
 if ( bw(-1,"забросить бросить") &&
       w(1,"в") &&
       q(2,"prl_vi prq_vi") &&
       w(3,cst) && s(-1,2) )
 { l[i]=omo2; Z[65]++; if(dbg){print "Z65"}; continue };
 # escapes:end

 #
 if ( ba(-3,"_castle_environs") && s(-3) &&
       q(-2,"suw_ro mest_ro isname") && sc(-2,"—") &&
       q(-1,"suw_ro mest_ro isname") && s(-1) )
 { l[i]=omo1; Z[66]++; if(dbg){print "Z66"}; continue };

 bfa(2,6,"_castle_environs"); bf_n=bfn;
 if ( vgle(bf_n,2,6) &&
         w(bf_n,"сел села") && s(1,bf_n-1) && zs(0) &&
         w(bfn+1,"в во за на под над") )
 { bf_n=""; Z[67]++; if(dbg){print "Z67"}; };
 if ( vgle(bf_n,2,6) &&
       bam(-1,"_lock_pe _lock_prl") && s(-1) )
 { bf_n=""; Z[68]++; if(dbg){print "Z68"}; };

 if ( vgle(bf_n,2,6) && s(1,bf_n-1) &&
         q(1,"sz_iili") && zs(0) &&
       qia(2,bf_n-1,"prl_kred_sr","prl_any mest_any qast_any") )
 { l[i]=omo1; Z[69]++; if(dbg){print "Z69"}; continue };
 if ( z(0) && s(1) &&
      q(1,"prl_any mcop_any") &&
     ba(2,"_castle_environs") && Q(2,"isname") )
 { l[i]=omo1; Z[70]++; if(dbg){print "Z70"}; continue };
 if ( pre_vi(-1) && s(-1) && z(0) &&
      pre_vi(1) && W(1,"на под") &&
          ba(2,"_castle_environs") && qq(-1,1) && s(1) )
 { l[i]=omo1; Z[71]++; if(dbg){print "Z71"}; continue };
 if ( qxs(-1,"не","только") && z(0) &&
      qxw(1,"а но","и") &&
       qy(xwn+1,"prl_im prq_im") &&
       ba(xwn+1+qyn,"_castle_environs") && s(xwn,xwn+qyn) )
 { l[i]=omo1; Z[72]++; if(dbg){print "Z72"}; continue };

 if ( qq(-1,1) && z(0) && s(-1) &&
      ba(2,"_castle_environs") && s(1) )
 { l[i]=omo1; Z[73]++; if(dbg){print "Z73"}; continue };
 if ( qq(-1,2) && qq(-2,1) && z(0) && s(-2,-1) &&
      ba(3,"_castle_environs") && s(1,2) )
 { l[i]=omo1; Z[74]++; if(dbg){print "Z74"}; continue };
 if ( qq(-1,2) && zs(0) && s(-1) &&
 sz_iili(1) &&
      ba(3,"_castle_environs") && s(1,2) )
 { l[i]=omo1; Z[75]++; if(dbg){print "Z75"}; continue };
 if ( qq(-1,1) && z(0) && s(-1) &&
       q(2,"prl_any mest_any prq_any nar_any") &&
      ba(3,"_castle_environs") && s(1,2) )
 { l[i]=omo1; Z[76]++; if(dbg){print "Z76"}; continue };
 if ( qq(-1,2) && z(0) && s(-1) &&
       w(1,"а но однако ни") &&
      ba(3,"_castle_environs") && s(1,2) )
 { l[i]=omo1; Z[77]++; if(dbg){print "Z77"}; continue };
 if ( qq(-1,2) && z(0) && s(-1) &&
       w(1,"а но однако ни") &&
       q(3,"prl_any mest_any prq_any nar_any") &&
      ba(4,"_castle_environs") && s(1,3) )
 { l[i]=omo1; Z[78]++; if(dbg){print "Z78"}; continue };
 if ( qq(-2,2) && z(0) && s(-2,-1) && !(bba(-8,-3,"_gl_v_lock-iv") && s(bbn,-3)) &&
       q(-1,"prl_any mest_any prq_any nar_any") &&
       w(1,"а но однако ни") &&
      ba(3,"_castle_environs") && s(1,2) )
 { l[i]=omo1; Z[79]++; if(dbg){print "Z79"}; continue };
 if ( qq(-2,2) && z(0) && s(-2,-1) && !(bba(-8,-3,"_gl_v_lock-iv") && s(bbn,-3)) &&
       q(-1,"prl_any mest_any prq_any nar_any") &&
       w(1,"а но однако ни") &&
       q(3,"prl_any mest_any prq_any nar_any") &&
      ba(4,"_castle_environs") && s(1,2) )
 { l[i]=omo1; Z[80]++; if(dbg){print "Z80"}; continue };
 if ( ba(-3,"_castle_environs") &&
 sz_iili(-2) &&
      qq(-4,-1) && s(-4,-1) )
 { l[i]=omo1; Z[81]++; if(dbg){print "Z81"}; continue };
 if ( q(-4,"prl_any mest_any prq_any") &&
     ba(-3,"_castle_environs") &&
sz_iili(-2) &&
     qq(-5,-1) && s(-5,-1) )
 { l[i]=omo1; Z[82]++; if(dbg){print "Z82"}; continue };
 if ( ba(-4,"_castle_environs") &&
 sz_iili(-3) &&
       q(-1,"prl_any mest_any prq_any") &&
      qq(-5,-2) && s(-5,-1) )
 { l[i]=omo1; Z[83]++; if(dbg){print "Z83"}; continue };
 if ( qq(-1,1) && z(0) && s(-1) &&
       q(2,"prl_any") &&
      ba(3,"_castle_environs") && s(1,2) )
 { l[i]=omo1; Z[84]++; if(dbg){print "Z84"}; continue };
 if ( pre_vi(-3) && s(-3) && z(-2) && W(-3,"на под") &&
          ba(-2,"_castle_environs") &&
      pre_vi(-1) &&
          qq(-3,-1) && s(-1) )
 { l[i]=omo1; Z[85]++; if(dbg){print "Z85"}; continue };
 # _castle_environs:end

 # _locklike_hyphens:start
 if ( sc(-1,"[/-]") && ba(-1,"_locklike_hyphens") )
 { l[i]=omo2; Z[86]++; if(dbg){print "Z86"}; continue };
 if ( sc(0,"[/-]") && ba(1,"_locklike_hyphens") )
 { l[i]=omo2; Z[87]++; if(dbg){print "Z87"}; continue };
 if ( sc(-1,"[/-]") && isacro(-1) && wa(-1,"_locklike_acro") )
 { l[i]=omo2; Z[88]++; if(dbg){print "Z88"}; continue };
 if ( sc(0,"[/-]") && isacro(1) && wa(1,"_locklike_acro") )
 { l[i]=omo2; Z[89]++; if(dbg){print "Z89"}; continue };
 # _locklike_hyphens:start

 # _locklike_things:start
 if ( ba(-1,"_locklike_things") && se(-1," — ") )
 { l[i]=omo2; Z[90]++; if(dbg){print "Z90"}; continue };
 if ( ba(-2,"_locklike_things") &&
       q(-1,"suw_ro") && se(-1," — ") )
 { l[i]=omo2; Z[91]++; if(dbg){print "Z91"}; continue };

 if ( (qxs(-1,"а но","не и")||
       qxs(-1,"а но","также","и")||
       qxs(-1,"как так","и") ) &&
        ba(xsn-1,"_locklike_things") && zs(xsn-1) )
 { l[i]=omo2; Z[92]++; if(dbg){print "Z92"}; continue };
 if ( z(0) &&
   (qxw(1,"а но","не и")||
    qxw(1,"а но","также","и")||
    qxw(1,"так","и") ) &&
     ba(xwn+1,"_locklike_things") && s(xwn) )
 { l[i]=omo2; Z[93]++; if(dbg){print "Z93"}; continue };
 if ( z(0) &&
   (qxw(1,"а но","не и")||
    qxw(1,"а но","также","и")||
    qxw(1,"так","и") ) &&
      q(xwn+1,"prl_any prq_any nar_any") &&
     ba(xwn+2,"_locklike_things") && s(1,xwn+1) )
 { l[i]=omo2; Z[94]++; if(dbg){print "Z94"}; continue };
 if ( qxs(-1,"а но","не и") &&
       ba(xsn-1,"_locklike_things") && sc(xsn-1,",") )
 { l[i]=omo2; Z[95]++; if(dbg){print "Z95"}; continue };
 if ( mest_it(-2) &&
            w(-1,"не") && s(-2,-1) &&
            z(0) &&
      mest_it(1) &&
            w(2,"не") &&
           ba(3,"_locklike_things") && s(1,2) )
 { l[i]=omo2; Z[96]++; if(dbg){print "Z96"}; continue };
 if ( mest_it(-2) &&
            w(-1,"не") && s(-2,-1) &&
            z(0) &&
      mest_it(1) &&
            w(2,"не") &&
            q(3,"prl_any prq_any nar_any") &&
           ba(4,"_locklike_things") && s(1,3) )
 { l[i]=omo2; Z[97]++; if(dbg){print "Z97"}; continue };
 cst="более больше скорее";
 if (  w(-1,cst) && s(-1) && z(0) &&
       w(1,"чем") &&
      ba(2,"_locklike_things") && s(1) )
 { l[i]=omo2; Z[98]++; if(dbg){print "Z98"}; continue };
 if (  w(-3,cst) && s(-3) &&
      ba(-2,"_locklike_things") && z(-2) &&
       w(-1,"чем") && s(1) )
 { l[i]=omo2; Z[99]++; if(dbg){print "Z99"}; continue };



 if ( qq(-1,2) &&
       q(1,"sz_iili") &&
      ba(3,"_locklike_things") && s(0,1) )
 { l[i]=omo2; Z[100]++; if(dbg){print "Z100"}; continue };
 if ( qq(-4,-1) &&
       q(-2,"sz_iili") &&
      ba(-3,"_locklike_things") && s(0,1) )
 { l[i]=omo2; Z[101]++; if(dbg){print "Z101"}; continue };
 if ( qq(-1,1) && z(0) && s(-1) &&
      ba(2,"_locklike_things") && s(1) &&
     !(w(-1,"в") && bba(-5,-2,"_gl_v_castle-iv") && s(bbn,-1)) )
 { l[i]=omo2; Z[102]++; if(dbg){print "Z102"}; continue };
 if ( qq(-1,2) && qq(-2,1) && z(0) && s(-2,-1) &&
      ba(3,"_locklike_things") && s(1,2) )
 { l[i]=omo2; Z[103]++; if(dbg){print "Z103"}; continue };
 if ( qq(-1,2) && zs(0) && s(-1) &&
 sz_iili(1) &&
      ba(3,"_locklike_things") && s(1,2) )
 { l[i]=omo2; Z[104]++; if(dbg){print "Z104"}; continue };
 if ( qq(-1,1) && z(0) && s(-1) &&
       q(2,"prl_any mest_any prq_any nar_any") &&
      ba(3,"_locklike_things") && s(1,2) )
 { l[i]=omo2; Z[105]++; if(dbg){print "Z105"}; continue };
 if ( qq(-1,2) && z(0) && s(-1) &&
       w(1,"а но однако ни") &&
      ba(3,"_locklike_things") && s(1,2) )
 { l[i]=omo2; Z[106]++; if(dbg){print "Z106"}; continue };
 if ( qq(-1,2) && z(0) && s(-1) &&
       w(1,"а но однако ни") &&
       q(3,"prl_any mest_any prq_any nar_any") &&
      ba(4,"_locklike_things") && s(1,3) )
 { l[i]=omo2; Z[107]++; if(dbg){print "Z107"}; continue };

 #
 qb(-4,-1,"sz_iili"); bba(qbn-3,qbn-1,"_locklike_things"); qb_n=qbn; bb_n=bbn;
 if ( vgle(qb_n,-4,-1) && vgle(bb_n,qb_n-3,qb_n-1) && zs(qb_n-1) &&
       qir(bb_n+1,qb_n-1,"prl_any mest_any prq_any gl_pein gl_peed gl_pemn") && s(bb_n,qb_n-2) &&
       qir(qb_n+1,-1,"prl_any mest_any prq_any") && s(qb_n,-1) &&
     !(bfa(1,3,"_castle_pe") && s(0,bfn-1)) )
 { l[i]=omo2; Z[108]++; if(dbg){print "Z108"}; continue };
#if ( ba(-3,"_locklike_things") && s(-3) &&
#      q(-2,"prl_any mest_any prq_any") && zs(-2) &&
#      q(-1,"sz_iili") && s(-1) && !(bfa(1,3,"_castle_pe") && s(0,bfn-1)) )
#{ l[i]=omo2; Z[109]++; if(dbg){print "Z109"}; continue };
#if ( ba(-3,"_locklike_things") &&
#      q(-2,"gl_pein gl_peed gl_pemn") &&
#      q(-1,"sz_iili") && s(-3,-1) )
#{ l[i]=omo2; Z[110]++; if(dbg){print "Z110"}; continue };

 if ( q(1,"sz_iili") &&
      q(2,"prl_any mest_any prq_any") &&
     ba(3,"_locklike_things") && s(0,2) )
 { l[i]=omo2; Z[111]++; if(dbg){print "Z111"}; continue };
 if ( q(1,"sz_iili") &&
     ba(2,"_locklike_things") && s(0,1) )
 { l[i]=omo2; Z[112]++; if(dbg){print "Z112"}; continue };


 if ( z(-1) && ba(-1,"_locklike_things") &&
         !(isname(1) && bw(1,"люк")) )
 { l[i]=omo2; Z[113]++; if(dbg){print "Z113"}; continue };
 if ( z(0) && ba(1,"_locklike_things") &&
         !(isname(1) && bw(1,"люк")) )
 { l[i]=omo2; Z[114]++; if(dbg){print "Z114"}; continue };

 # ни … ни
 if ( w(-2,"ни") &&
      q(-1,"prl_any mest_any prq_any") &&
sz_iili(1) &&
      w(2,"ни") &&
      q(3,"prl_any mest_any prq_any") &&
     ba(4,"_locklike_things") && s(-2,3) )
 { l[i]=omo2; Z[115]++; if(dbg){print "Z115"}; continue };
 if ( w(-1,"ни") && z(0) && s(-1) &&
      w(1,"ни") &&
     ba(2,"_locklike_things") && s(1) )
 { l[i]=omo2; Z[116]++; if(dbg){print "Z116"}; continue };
 # _locklike_things:end

 # в географической местности
 if ( wb(-6,-1,"в во на") && s(wbn,-1) &&
       q(wbn+1,"isname") &&
       q(wbn+2,"gl_aux_be nar_any") &&
     qir(wbn+3,-1,"prl_vi mest_vi mest_3e") )
 { l[i]=omo1; Z[117]++; if(dbg){print "Z117"}; continue };

 # _castle_v_suw-pr+point_gl:start
 wb(-6,-2,"в во"); wb_n=wbn; wba(wb_n+1,-1,"_castle_v_suw-pr"); bb_n=wbn;
 cst="быть висеть гореть купить находиться оказаться остаться парить построить появиться продать стоять";
 if ( vgle(wb_n,-6,-2) && vgle(bb_n,wb_n+1,-1) &&
       qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") && s(wb_n,bb_n-1) &&
       qia(bb_n+1,-2,"qast","prl_any mest_any nar_any prl_kred_mu prl_krmn suw_ro") && ds(bb_n) &&
        bw(-1,cst) && s(bb_n+1,-1) )
 { l[i]=omo1; Z[118]++; if(dbg){print "Z118"}; continue };
 if ( vgle(wb_n,-6,-2) && vgle(bb_n,wb_n+1,-1) &&
       qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") && s(wb_n,bb_n-1) &&
        bw(bb_n+1,cst) &&
       qia(bb_n+2,-1,"qast","prl_any mest_any nar_any prl_kred_mu prl_krmn suw_ro") && ds(bb_n) && s(bb_n+1,-1) )
 { l[i]=omo1; Z[119]++; if(dbg){print "Z119"}; continue };
 if ( vgle(wb_n,-6,-2) && vgle(bb_n,wb_n+1,-1) &&
        bw(wb_n-1,cst) &&
       qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") && s(wb_n,bb_n-1) &&
       qia(bb_n+2,-1,"qast","prl_any mest_any nar_any prl_kred_mu prl_krmn suw_ro") && ds(bb_n) && s(bb_n+1,-1) )
 { l[i]=omo1; Z[120]++; if(dbg){print "Z120"}; continue };
 # _castle_v_suw-pr+point_gl:end

 # _lock_v_suw-pr:start
 wf(1,4,"в во на"); wf_n=wfn;
 if ( vgle(wf_n,1,1) &&
       wfa(wf_n+1,wf_n+4,"_lock_v_suw-pr") &&
       qir(wf_n+1,wfn-1,"prl_pr mest_pr mest_3e prq_pr") &&
       qir(1,wf_n-1,"gl_peed gl_vzed prl_vi mest_vi mest_3e prq_vi qast_any") && s(0,wfn-1) )
 { l[i]=omo2; Z[121]++; if(dbg){print "Z121"}; continue };

 if ( wb(-6,-2,"в во на") &&
     wfa(wbn+1,-1,"_lock_v_suw-pr") &&
     qir(wbn+1,wfn-1,"prl_pr mest_pr mest_3e prq_pr") &&
     qir(wfn+1,-1,"gl_need gl_vzed gl_aux_be prl_vi mest_vi mest_3e prq_vi") &&
       s(wbn,-1) && sv(-1,"\\(") && Q_w(1,"isname") )
 { l[i]=omo2; Z[122]++; if(dbg){print "Z122"}; continue };
#if ( wb(-6,-2,"в во на") &&
#    wfa(wbn+1,-1,"_lock_v_suw-pr") &&
#    qir(wbn+1,wfn-1,"prl_pr mest_pr mest_3e prq_pr") &&
#    qir(wfn+1,-1,"gl_need gl_vzed gl_aux_be prl_vi mest_vi mest_3e prq_vi") &&
#      s(wbn,-1) && sv(-1,"\\(") && Q_w(1,"isname") )
#{ l[i]=omo2; Z[123]++; if(dbg){print "Z123"}; continue }; #edit по "ниша, в которой ... замок"
 # _lock_v_suw-pr:end

 # _castle_pod_suw-ro:start
 if ( w(1,"под") &&
    wfa(2,5,"_castle_pod_suw-ro") && s(0,wfn-1) && qir(3,wfn-1,"prl_ro prq_ro mest_ro mest_3e qast") )
 { l[i]=omo1; Z[124]++; if(dbg){print "Z124"}; continue };
 if ( q(1,"qast") &&
      w(2,"под") &&
    wfa(3,6,"_castle_pod_suw-ro") && s(0,wfn-1) && qir(3,wfn-1,"prl_ro prq_ro mest_ro mest_3e qast") )
 { l[i]=omo1; Z[125]++; if(dbg){print "Z125"}; continue };
 if ( w(-2,"под") &&
     wa(-1,"_castle_pod_suw-ro") && s(-2,-1) )
 { l[i]=omo1; Z[126]++; if(dbg){print "Z126"}; continue };
 if ( w(-3,"под") &&
      q(-2,"prl_ro prq_ro") &&
     wa(-1,"_castle_pod_suw-ro") && s(-3,-1) && sv(-1,"\\(") )
 { l[i]=omo1; Z[127]++; if(dbg){print "Z127"}; continue };
 # _castle_pod_suw-ro:end

 # _castle_na_suw-vi:start
 if ( w(1,"на") &&
    wfa(2,4,"_castle_na_suw-vi") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_vi mest_vi mest_3e nar_any prq_vi"))
 { l[i]=omo1; Z[128]++; if(dbg){print "Z128"}; continue };
 cst="месте";
 if ( qxw(1,"на",cst) &&
      bfa(xwn+1,xwn+4,"_castle_environs") && s(0,bfn-1) &&
      qir(xwn+1,bfn-1,"prl_pr mest_pr mest_3e nar_any prq_pr") )
 { l[i]=omo1; Z[129]++; if(dbg){print "Z129"}; continue };
 # _castle_na_suw-vi:end

 # _castle_na_suw-pr:start
 wba(-7,-1,"_castle_na_suw-pr"); bb_n=wbn; wb(bb_n-5,bb_n-1,"на"); wb_n=wbn;
 cst0="двери";
 if ( vgle(wb_n,bb_n-5,bb_n-1) && vgle(bb_n,-7,-1) &&
        qy(bb_n+1,"nar_napr nar_mest") && (zs(bb_n+qyn)||se(bb_n+qyn," — ")) && s(wb_n,bb_n-1) &&
       qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
       qia(bb_n+1,-1-qyn,"gl_aux_be sz_i isname","prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e nar_any qast_any") && s(bb_n+1+qyn,-1) &&
      !wfa(bb_n+1,-1-qyn,"_lock_prl") )
 { l[i]=omo1; Z[130]++; if(dbg){print "Z130"}; continue };
 if ( vgle(wb_n,bb_n-5,bb_n-1) && vgle(bb_n,-7,-1) && s(wb_n,bb_n) &&
       qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
         q(bb_n+1,"suw_ro isname") && (zs(bb_n+1)||se(bb_n+1," — ")) && s(bb_n+2,-1) &&
         W(bb_n+1,cst0) && !wba(bb_n+2,-1,"_lock_prl") &&
       qia(bb_n+2,-1,"qast","prl_vi mest_vi mest_3e nar_any qast_any") )
 { l[i]=omo1; Z[131]++; if(dbg){print "Z131"}; continue };
 if ( vgle(wb_n,bb_n-5,bb_n-1) && vgle(bb_n,-7,-1) && s(wb_n,-3) && (zs(-2)||se(-2," — ")) && s(-1) &&
       qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
       qir(bb_n+1,-2,"suw_ro isname prl_ro mest_ro mest_3e prq_ro") &&
         W(-2,cst0) && !wa(-1,"_lock_prl") &&
         q(-1,"prl_vi mest_vi mest_3e nar_any qast_any") )
 { l[i]=omo1; Z[132]++; if(dbg){print "Z132"}; continue };
 if ( vgle(wb_n,bb_n-5,bb_n-1) && vgle(bb_n,-7,-1) && s(wb_n,-2) && (zs(-1)||se(-1," — ")) &&
       qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
       qir(bb_n+1,-1,"suw_ro isname prl_ro mest_ro mest_3e prq_ro") && W(-1,cst0) )
 { l[i]=omo1; Z[133]++; if(dbg){print "Z133"}; continue };
 if ( vgle(wb_n,bb_n-5,bb_n-1) && vgle(bb_n,-7,-1) && s(wb_n,-1) &&
       qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
       qir(bb_n+1,-2,"prl_ro mest_ro mest_3e prq_ro nar_any qast_any") &&
         W(-1,cst0) && !wfa(bb_n+1,-2,"_lock_prl") &&
         q(-1,"suw_ro isname") )
 { l[i]=omo1; Z[134]++; if(dbg){print "Z134"}; continue };
 if ( vgle(wb_n,bb_n-5,bb_n-1) && vgle(bb_n,-7,-1) && s(wb_n,-1) &&
       qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
       qir(bb_n+1,-2,"suw_ro isname") &&
         q(-1,"mest_im isname suw_im") )
 { l[i]=omo1; Z[135]++; if(dbg){print "Z135"}; continue };
 if ( vgle(wb_n,bb_n-5,bb_n-1) && vgle(bb_n,-7,-1) && s(wb_n,-1) &&
       qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
       qir(bb_n+1,-3,"suw_ro isname") &&
       qir(-2,-1,"mest_im isname suw_im sz_i qast_any") )
 { l[i]=omo1; Z[136]++; if(dbg){print "Z136"}; continue };
 if ( vgle(wb_n,bb_n-5,bb_n-1) && vgle(bb_n,-7,-1) && s(wb_n,-1) &&
       qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
         q(bb_n+1,"prq_edmuim prq_mnim") &&
         q(bb_n+2,"suw_tv") &&
       qir(bb_n+3,-1,"mest_ro isname suw_ro") )
 { l[i]=omo1; Z[137]++; if(dbg){print "Z137"}; continue };
 if ( vgle(wb_n,bb_n-5,bb_n-1) && vgle(bb_n,-7,-1) && s(wb_n,-1) &&
       qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
       qiz(bb_n+1,-1,"nar_step prl_kred_sr prl_kred_mu prl_krmn prl_edmuvi prl_mnvi","sz_i qast_any") )
 { l[i]=omo1; Z[138]++; if(dbg){print "Z138"}; continue };
#if ( w(-4,"на") &&
#    wa(-3,"_castle_na_suw-pr") &&
#     q(-2,"isname") &&
#     q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-4,-1) )
#{ l[i]=omo1; Z[139]++; if(dbg){print "Z139"}; continue };
 if ( vgle(wb_n,bb_n-5,bb_n-1) && vgle(bb_n,-7,-1) && s(wb_n,-1) &&
        qb(bb_n+1,-1,"sz_iili") &&
       qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
       qia(bb_n+1,qbn-1,"nar_step prl_kred_sr","prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") &&
       qir(qbn+1,-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") )
 { l[i]=omo1; Z[140]++; if(dbg){print "Z140"}; continue };

 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw-pr") &&
 pre_ro(-2) &&
      q(-1,"suw_ro mest_ro") && s(-4,-1) )
 { l[i]=omo1; Z[141]++; if(dbg){print "Z141"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw-pr") &&
 pre_ro(-3) &&
      q(-2,"suw_ro mest_ro") &&
     bw(-1,"быть") && s(-5,-1) )
 { l[i]=omo1; Z[142]++; if(dbg){print "Z142"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw-pr") &&
 pre_ro(-4) &&
      q(-3,"suw_ro mest_ro") &&
      q(-2,"nar_spos") &&
     bw(-1,"быть") && s(-6,-1) )
 { l[i]=omo1; Z[143]++; if(dbg){print "Z143"}; continue };

 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw-pr") &&
 pre_tv(-2) &&
      q(-1,"suw_tv isname") && s(-4,-1) )
 { l[i]=omo1; Z[144]++; if(dbg){print "Z144"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw-pr") &&
 pre_tv(-3) &&
      q(-2,"suw_tv isname") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[145]++; if(dbg){print "Z145"}; continue };

 if ( w(1,"на") &&
    wfa(2,4,"_castle_na_suw-pr") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_pr mest_pr mest_3e nar_any prq_pr") )
 { l[i]=omo1; Z[146]++; if(dbg){print "Z146"}; continue };

 # + _gl_4_castle_na_suw-pr
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw-pr") &&
     ba(-3,"_gl_4_castle_na_suw-pr") &&
      q(-2,"qast") &&
      q(-1,"nar_vrem qast") && s(-5,-1) )
 { l[i]=omo1; Z[147]++; if(dbg){print "Z147"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-3,"_castle_na_suw-pr") &&
     ba(-2,"_gl_4_castle_na_suw-pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[148]++; if(dbg){print "Z148"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw-pr") &&
     ba(-3,"_gl_4_castle_na_suw-pr") &&
      q(-2,"prl_kred_sr nar_mest") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[149]++; if(dbg){print "Z149"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw-pr") &&
     ba(-2,"_gl_4_castle_na_suw-pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-4,-1) )
 { l[i]=omo1; Z[150]++; if(dbg){print "Z150"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw-pr") &&
     ba(-3,"_gl_4_castle_na_suw-pr") &&
      q(-2,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[151]++; if(dbg){print "Z151"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw-pr") &&
      q(-3,"suw_ro mest_ro mest_3e isname") &&
     ba(-2,"_gl_4_castle_na_suw-pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e nar_vrem") && s(-5,-1) )
 { l[i]=omo1; Z[152]++; if(dbg){print "Z152"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw-pr") &&
      q(-3,"suw_ro mest_ro mest_3e isname") &&
     ba(-2,"_gl_4_castle_na_suw-pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[153]++; if(dbg){print "Z153"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw-pr") &&
      q(-2,"suw_ro mest_ro mest_3e isname nar_vrem nar_mest") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-4,-1) )
 { l[i]=omo1; Z[154]++; if(dbg){print "Z154"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw-pr") &&
      q(-3,"prl_ro prq_ro mest_ro mest_3e") &&
      q(-2,"suw_ro mest_ro mest_3e isname nar_vrem nar_mest") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-5,-1) )
 { l[i]=omo1; Z[155]++; if(dbg){print "Z155"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw-pr") &&
      q(-3,"suw_ro mest_ro mest_3e isname nar_vrem nar_mest") &&
      q(-2,"qast") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-5,-1) )
 { l[i]=omo1; Z[156]++; if(dbg){print "Z156"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-3,"_castle_na_suw-pr") &&
      q(-2,"suw_ro mest_ro mest_3e isname nar_vrem nar_mest") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-5,-1) )
 { l[i]=omo1; Z[157]++; if(dbg){print "Z157"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-3,"_castle_na_suw-pr") &&
      q(-2,"suw_im mest_im mest_3e isname") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-5,-1) )
 { l[i]=omo1; Z[158]++; if(dbg){print "Z158"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw-pr") &&
      q(-3,"suw_ro mest_ro mest_3e isname") &&
      q(-2,"mod_bz mod_ed mod_mn") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-6,-1) )
 { l[i]=omo1; Z[159]++; if(dbg){print "Z159"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw-pr") &&
      q(-3,"suw_ro mest_ro mest_3e isname") &&
      q(-2,"prl_kred_sr") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-5,-1) )
 { l[i]=omo1; Z[160]++; if(dbg){print "Z160"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw-pr") &&
     ba(-3,"_gl_4_castle_na_suw-pr") &&
      q(-2,"prl_ro prq_ro") &&
      q(-1,"suw_ro") && s(-6,-1) )
 { l[i]=omo1; Z[161]++; if(dbg){print "Z161"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw-pr") &&
     ba(-3,"_gl_4_castle_na_suw-pr") &&
      q(-2,"prl_ro prq_ro") &&
      q(-1,"suw_ro") && s(-5,-1) )
 { l[i]=omo1; Z[162]++; if(dbg){print "Z162"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw-pr") &&
      q(-3,"nar_vrem qast") &&
     ba(-2,"_gl_4_castle_na_suw-pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[163]++; if(dbg){print "Z163"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw-pr") &&
     ba(-3,"_gl_4_castle_na_suw-pr") &&
      q(-2,"qast") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[164]++; if(dbg){print "Z164"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw-pr") &&
     ba(-3,"_gl_4_castle_na_suw-pr") &&
      q(-2,"nar_any") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[165]++; if(dbg){print "Z165"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw-pr") &&
sz_iili(-3) &&
     ba(-2,"_gl_4_castle_na_suw-pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[166]++; if(dbg){print "Z166"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-3,"_castle_na_suw-pr") &&
     ba(-2,"_gl_4_castle_na_suw-pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[167]++; if(dbg){print "Z167"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e") &&
      q(-3,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-2,"_castle_na_suw-pr") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-5,-1) )
 { l[i]=omo1; Z[168]++; if(dbg){print "Z168"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e") &&
      q(-3,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-2,"_castle_na_suw-pr") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-6,-1) )
 { l[i]=omo1; Z[169]++; if(dbg){print "Z169"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw-pr") &&
      q(-3,"nar_vrem") &&
     ba(-2,"_gl_4_castle_na_suw-pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[170]++; if(dbg){print "Z170"}; continue };
 if ( w(-3,"на") &&
     wa(-2,"_castle_na_suw-pr") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-3,-1) )
 { l[i]=omo1; Z[171]++; if(dbg){print "Z171"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw-pr") &&
      q(-2,"suw_da mest_da") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-4,-1) )
 { l[i]=omo1; Z[172]++; if(dbg){print "Z172"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-3,"_castle_na_suw-pr") &&
      q(-2,"suw_da mest_da suw_ro mest_ro") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-5,-1) )
 { l[i]=omo1; Z[173]++; if(dbg){print "Z173"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-3,"_castle_na_suw-pr") &&
      q(-2,"suw_ro mest_ro") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-6,-1) )
 { l[i]=omo1; Z[174]++; if(dbg){print "Z174"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-3,"_castle_na_suw-pr") &&
      q(-2,"suw_da mest_da nar_step") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-5,-1) )
 { l[i]=omo1; Z[175]++; if(dbg){print "Z175"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw-pr") &&
      q(-2,"mest_ro prl_ro mod_bz mod_ed mod_mn") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-4,-1) )
 { l[i]=omo1; Z[176]++; if(dbg){print "Z176"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e") &&
     wa(-4,"_castle_na_suw-pr") &&
      q(-3,"mod_bz mod_ed mod_mn") &&
     ba(-2,"_gl_4_castle_na_suw-pr") &&
      q(-1,"prl_edmuvi prl_mnvi mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[177]++; if(dbg){print "Z177"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw-pr") &&
      q(-3,"isname") &&
      q(-2,"mest_ro prl_ro mod_any") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-5,-1) )
 { l[i]=omo1; Z[178]++; if(dbg){print "Z178"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw-pr") &&
      q(-4,"isname") &&
      q(-3,"mest_ro prl_ro mod_any") &&
     ba(-2,"_gl_4_castle_na_suw-pr") &&
      q(-1,"prl_edmuvi prl_mnvi mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[179]++; if(dbg){print "Z179"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw-pr") &&
      q(-3,"mest_ro prl_ro mod_bz") &&
      q(-2,"mod_any") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-5,-1) )
 { l[i]=omo1; Z[180]++; if(dbg){print "Z180"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-4,"_castle_na_suw-pr") &&
      q(-3,"mest_ro prl_ro mod_bz") &&
      q(-2,"mod_any") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-6,-1) )
 { l[i]=omo1; Z[181]++; if(dbg){print "Z181"}; continue };
 if ( w(-4,"на") &&
      q(-3,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-2,"_castle_na_suw-pr") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-4,-1) )
 { l[i]=omo1; Z[182]++; if(dbg){print "Z182"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-3,"_castle_na_suw-pr") &&
      q(-2,"qast") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-5,-1) )
 { l[i]=omo1; Z[183]++; if(dbg){print "Z183"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
     wa(-3,"_castle_na_suw-pr") &&
      q(-2,"nar_any prl_kred_sr") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-5,-1) )
 { l[i]=omo1; Z[184]++; if(dbg){print "Z184"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr") &&
     wa(-3,"_castle_na_suw-pr") &&
     ba(-2,"_gl_4_castle_na_suw-pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[185]++; if(dbg){print "Z185"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr") &&
     wa(-4,"_castle_na_suw-pr") &&
     ba(-3,"_gl_4_castle_na_suw-pr") &&
      q(-2,"suw_tv") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[186]++; if(dbg){print "Z186"}; continue };
 if ( w(-5,"на") &&
      q(-4,"prl_pr prq_pr") &&
     wa(-3,"_castle_na_suw-pr") &&
     ba(-2,"_gl_4_castle_na_suw-pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[187]++; if(dbg){print "Z187"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw-pr") &&
      q(-3,"suw_ro isname") &&
      q(-2,"suw_im mest_im isname") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-5,-1) )
 { l[i]=omo1; Z[188]++; if(dbg){print "Z188"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw-pr") &&
      q(-2,"suw_im mest_im isname") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-4,-1) )
 { l[i]=omo1; Z[189]++; if(dbg){print "Z189"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw-pr") &&
      q(-3,"suw_im mest_im isname") &&
     ba(-2,"_gl_4_castle_na_suw-pr") &&
      q(-1,"prl_vi prq_vi mest_da mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[190]++; if(dbg){print "Z190"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw-pr") &&
      q(-4,"suw_im mest_im isname") &&
     ba(-3,"_gl_4_castle_na_suw-pr") &&
      q(-2,"suw_da mest_da isname mest_3e") &&
      q(-1,"prl_vi prq_vi") && s(-6,-1) )
 { l[i]=omo1; Z[191]++; if(dbg){print "Z191"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw-pr") &&
      q(-4,"suw_im mest_im isname") &&
     ba(-3,"_gl_4_castle_na_suw-pr") &&
      q(-2,"qast") &&
      q(-1,"nar_any") && s(-6,-1) )
 { l[i]=omo1; Z[192]++; if(dbg){print "Z192"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw-pr") &&
      q(-4,"suw_ro isname") &&
      q(-3,"suw_im mest_im isname") &&
     ba(-2,"_gl_4_castle_na_suw-pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[193]++; if(dbg){print "Z193"}; continue };
 if ( w(-6,"на") &&
      q(-5,"prl_pr prq_pr") &&
     wa(-4,"_castle_na_suw-pr") &&
      q(-3,"suw_im mest_im isname") &&
     ba(-2,"_gl_4_castle_na_suw-pr") &&
      q(-1,"suw_im mest_im isname") && s(-6,-1) )
 { l[i]=omo1; Z[194]++; if(dbg){print "Z194"}; continue };
 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw-pr") &&
      q(-2,"suw_ro isname") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-4,-1) )
 { l[i]=omo1; Z[195]++; if(dbg){print "Z195"}; continue };

 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw-pr") &&
 pre_da(-3) &&
      q(-2,"suw_da") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-5,-1) )
 { l[i]=omo1; Z[196]++; if(dbg){print "Z196"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw-pr") &&
 pre_tv(-4) &&
      q(-3,"prl_tv prq_tv mest_tv mest_3e") &&
      q(-2,"suw_tv") &&
     ba(-1,"_gl_4_castle_na_suw-pr") && s(-6,-1) )
 { l[i]=omo1; Z[197]++; if(dbg){print "Z197"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw-pr") &&
 pre_ro(-4) &&
      q(-3,"suw_ro") &&
     ba(-2,"_gl_4_castle_na_suw-pr") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-6,-1) )
 { l[i]=omo1; Z[198]++; if(dbg){print "Z198"}; continue };

 if ( ba(1,"_gl_4_castle_na_suw-pr") && zs(0) &&
       w(2,"на") &&
      wa(3,"_castle_na_suw-pr") && s(1,2) )
 { l[i]=omo1; Z[199]++; if(dbg){print "Z199"}; continue };
 if ( ba(1,"_gl_4_castle_na_suw-pr") && zs(0) &&
       w(2,"на") &&
       q(3,"prl_pr prq_pr") &&
      wa(4,"_castle_na_suw-pr") && s(1,3) )
 { l[i]=omo1; Z[200]++; if(dbg){print "Z200"}; continue };
 if ( ba(1,"_gl_4_castle_na_suw-pr") && zs(0) &&
       w(2,"на") &&
       q(3,"prl_vi prl_pr otsz_vi otsz_pr mest_vi mest_pr mest_pr prq_vi prq_pr") &&
       q(4,"prl_pr prl_vi prq_pr prq_vi") &&
      wa(5,"_castle_na_suw-pr") && s(1,4) )
 { l[i]=omo1; Z[201]++; if(dbg){print "Z201"}; continue };
 if ( q(1,"nar_any qast") && zs(0) &&
     ba(2,"_gl_4_castle_na_suw-pr") &&
      w(3,"на") &&
      q(4,"prl_pr prq_pr") &&
     wa(5,"_castle_na_suw-pr") && s(1,4) )
 { l[i]=omo1; Z[202]++; if(dbg){print "Z202"}; continue };
 # _castle_na_suw-pr:end

 # _castle_suw-ro:start
 cst8="крупнокалиберного";
 if ( wfa(1,4,"_castle_suw-ro") && s(0,wfn-1) &&
      qir(1,wfn-1,"prl_ro mest_ro prq_ro prl_kred_sr nar_step") &&
    !(wfa(1,wfn-1,"_lock_suw-ro")||wf(1,wfn-1,cst8)) && Ww_(-1,"под") )
 { l[i]=omo1; Z[203]++; if(dbg){print "Z203"}; continue }; #check_!под

 if ( w(1,"для") &&
     wa(2,"_castle_suw-ro2") && s(0,1) )
 { l[i]=omo1; Z[204]++; if(dbg){print "Z204"}; continue };
 if ( w(1,"для") &&
      q(2,"prl_ro prq_ro mest_ro mest_3e") &&
     wa(3,"_castle_suw-ro2") && s(0,2) && qsb(-10,-1,",") && !(bw(sbn,"дверь люк")) )
 { l[i]=omo1; Z[205]++; if(dbg){print "Z205"}; continue };
 if ( w(1,"для") &&
      q(2,"prl_ro prq_ro mest_ro mest_3e") &&
      q(3,"prl_ro prq_ro mest_ro mest_3e") &&
     wa(4,"_castle_suw-ro2") && s(0,3) )
 { l[i]=omo1; Z[206]++; if(dbg){print "Z206"}; continue };
 # _castle_suw-ro:end

 # _lock_suw-ro:start
 wfa(1,5,"_lock_suw-ro"); wf_n=wfn;
 if ( vgle(wf_n,1,5) && s(0,wfn-1) && !( isname(wfn)||isname(1) ) &&
       qir(1,wfn-1,"prl_ro mest_ro prq_ro qik_im qip_ro") )
 { l[i]=omo2; Z[207]++; if(dbg){print "Z207"}; continue };

 if ( vgle(wf_n,2,5) && s(0,wfn-1) && W(wf_n,"дома") &&
         w(1,"для у") &&
       qir(2,wf_n-1,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo2; Z[208]++; if(dbg){print "Z208"}; continue };
 if ( vgle(wf_n,2,5) && s(0,wfn-1) && W(wf_n,"дома") && W(wf_n+1,"до") &&
         w(1,"от") &&
       qir(2,wf_n-1,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo2; Z[209]++; if(dbg){print "Z209"}; continue };
 # _lock_suw-ro:end

 # _castle_bez_suw-ro:start
 if ( w(1,"без") &&
    wfa(2,5,"_castle_bez_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo1; Z[210]++; if(dbg){print "Z210"}; continue };
 # _castle_bez_suw-ro:end

 # _lock_bez_suw-ro:start
 if ( wb(-5,-2,"без") && s(wbn,-1) &&
      wa(-1,"_lock_bez_suw-ro") &&
     qir(wbn+1,-2,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo2; Z[211]++; if(dbg){print "Z211"}; continue };
 if ( w(1,"без") &&
    wfa(2,5,"_lock_bez_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo2; Z[212]++; if(dbg){print "Z212"}; continue };
 # _lock_bez_suw-ro:end

 # _castle_pod_suw-tv:start
 if ( w(1,"под") &&
    wfa(2,5,"_castle_pod_suw-tv") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_tv prq_tv mest_tv mest_3e") )
 { l[i]=omo1; Z[213]++; if(dbg){print "Z213"}; continue };
 # _castle_pod_suw-tv:end

 # _lock_pod_suw-tv:start
 if ( w(1,"под") &&
    wfa(2,5,"_lock_pod_suw-tv") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_tv prq_tv mest_tv mest_3e") )
 { l[i]=omo2; Z[214]++; if(dbg){print "Z214"}; continue };
 # _lock_pod_suw-tv:end

 # _castle_iz_suw-ro:start
 if ( w(1,"из") &&
    wfa(2,5,"_castle_iz_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo1; Z[215]++; if(dbg){print "Z215"}; continue };
 if ( w(-3,"из") &&
      q(-2,"prl_edro prq_edro") &&
     wa(-1,"_castle_iz_suw-ro") && s(-3,-1) )
 { l[i]=omo1; Z[216]++; if(dbg){print "Z216"}; continue };
 cst1="возвести возводить выкладывать выложить выстроить построить сложить";
 if ( (z(0)||s(0)) &&
      bw(1,cst1) &&
       w(2,"из") &&
     wfa(3,6,"_castle_iz_suw-ro") && s(1,wfn-1) &&
     qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo1; Z[217]++; if(dbg){print "Z217"}; continue };
 if ( wb(-5,-1,"из") && s(wbn,-1) &&
     qir(wbn+1,-1,"prl_ro prq_ro mest_ro mest_3e") &&
      bw(wbn-1,cst1) &&
     wba(wbn+1,-1,"_castle_iz_suw-ro") )
 { l[i]=omo1; Z[218]++; if(dbg){print "Z218"}; continue };
 # _castle_iz_suw-ro:end

 # _lock_iz_suw-ro:start
 if ( w(1,"из") &&
    wfa(2,5,"_lock_iz_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo2; Z[219]++; if(dbg){print "Z219"}; continue };
 # _lock_iz_suw-ro:end

 # _castle_pre-tv_suw-tv:start
 if ( pre_tv(1) &&
         wfa(2,4,"_castle_pre-tv_suw-tv") && s(0,wfn-1) )
 { l[i]=omo1; Z[220]++; if(dbg){print "Z220"}; continue };
 if ( qb(-6,-1,"pre_tv") &&
     wba(wbn+1,-1,"_castle_pre-tv_suw-tv") && s(wbn,-1) && s(0,qbn-1) )
 { l[i]=omo1; Z[221]++; if(dbg){print "Z221"}; continue };
 # _castle_pre-tv_suw-tv:end

 # _castle_pre-ro_suw-ro:start
 if ( w(1,"у возле посреди") &&
    wfa(2,4,"_castle_pre-ro_suw-ro") && s(0,wfn-1) )
 { l[i]=omo1; Z[222]++; if(dbg){print "Z222"}; continue };
 if ( wb(-6,-2,"у возле посреди") && s(wbn,-1) &&
      Qb(wbn+1,-1,"pre_any sz_iili") &&
     wba(wbn+1,-1,"_castle_pre-ro_suw-ro") &&
    !(bf(1,5,"повесить") && s(0,bfn-1)) )
 { l[i]=omo1; Z[223]++; if(dbg){print "Z223"}; continue };
 # _castle_pre-ro_suw-ro:start

 # _castle_k_suw-da:start
 if ( w(1,"к ко") &&
     wa(2,"_castle_k_suw-da") && s(0,1) )
 { l[i]=omo1; Z[224]++; if(dbg){print "Z224"}; continue };
 if ( wb(-6,-1,"к ко") &&
     wba(wbn+1,-1,"_castle_k_suw-da") && s(wbn,-1) )
 { l[i]=omo1; Z[225]++; if(dbg){print "Z225"}; continue };
 # _castle_k_suw-da:end

 # _lock_mexdu_suw-tv:start
 if ( w(1,"между") &&
    wfa(2,4,"_lock_mexdu_suw-tv") && s(0,wfn-1) )
 { l[i]=omo2; Z[226]++; if(dbg){print "Z226"}; continue };
 # _lock_mexdu_suw-tv:end

 if ( w(1,"веками вдали издали вдалеке") && s(0) )
 { l[i]=omo1; Z[227]++; if(dbg){print "Z227"}; continue };

 # suw_ro escape:start
 cst="засов";
 if ( bw(1,"венчать") && zs(0) &&
      bf(2,5,cst) && s(1,bfn-1) && Qf(2,bfn-1,"sz_iili pre_any") )
 { l[i]=omo2; Z[228]++; if(dbg){print "Z228"}; continue };

 cst="поднять подхватить";
 if ( bw(-3,cst) &&
       w(-2,"с со") &&
       q(-1,"suw_ro") && s(-3,-1) )
 { l[i]=omo2; Z[229]++; if(dbg){print "Z229"}; continue };

 cst="слетать слететь спадать спасть";
 if ( w(1,"с со") &&
      q(2,"suw_ro") &&
     bw(3,cst) && s(0,2) )
 { l[i]=omo2; Z[230]++; if(dbg){print "Z230"}; continue };
 if ( w(1,"с со") &&
      q(2,"suw_ro") &&
      q(3,"nar_any prl_kred_sr") &&
     bw(4,cst) && s(0,3) )
 { l[i]=omo2; Z[231]++; if(dbg){print "Z231"}; continue };

 cst="подвала";
 cst1="крыши флюгера";
 if ( qxs(1,"с со от",cst,"до",cst1) )
 { l[i]=omo1; Z[232]++; if(dbg){print "Z232"}; continue };

 if ( qxs(1,"с","лица","земли")||
      qxs(1,"с","ног","на","голову") )
 { l[i]=omo1; Z[233]++; if(dbg){print "Z233"}; continue };
 # suw_ro escape:end

 # _castle_s_suw-ro:start
 if ( w(1,"с со") &&
    wfa(2,5,"_castle_s_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e qik_ro") )
 { l[i]=omo1; Z[234]++; if(dbg){print "Z234",qfn}; continue };
 if ( w(-2,"с со") &&
     wa(-1,"_castle_s_suw-ro") && s(-2,-1) )
 { l[i]=omo1; Z[235]++; if(dbg){print "Z235"}; continue };
 # _castle_s_suw-ro:start

 # _castle_s_suw-tv:start
 if ( w(1,"с со") &&
    wfa(2,5,"_castle_s_suw-tv") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_tv prq_tv mest_tv mest_3e qik_tv") )
 { l[i]=omo1; Z[236]++; if(dbg){print "Z236",qfn}; continue };
 if ( w(-2,"с со") &&
     wa(-1,"_castle_s_suw-tv") && s(-2,-1) )
 { l[i]=omo1; Z[237]++; if(dbg){print "Z237"}; continue };
 # _castle_s_suw-tv:start

 # _castle_u_suw-ro:start
 if ( w(1,"у") &&
    wfa(2,5,"_castle_u_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e qik_ro") )
 { l[i]=omo1; Z[238]++; if(dbg){print "Z238"}; continue };
 if ( w(-2,"у") &&
     wa(-1,"_castle_u_suw-ro") && s(-2,-1) )
 { l[i]=omo1; Z[239]++; if(dbg){print "Z239"}; continue };
 # _castle_u_suw-ro:start

 # _castle_sredi_suw-ro:start
 if ( w(1,"посреди посредине среди") &&
    wfa(2,5,"_castle_sredi_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e qik_ro") )
 { l[i]=omo1; Z[240]++; if(dbg){print "Z240"}; continue };
 if ( w(-2,"посреди посредине среди") &&
     wa(-1,"_castle_sredi_suw-ro") && s(-2,-1) )
 { l[i]=omo1; Z[241]++; if(dbg){print "Z241"}; continue };
 # _castle_sredi_suw-ro:start

 # _lock_su_suw-ro:start
 if ( w(1,"с со у") &&
    wfa(2,5,"_lock_su_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e qik_ro") && W_w(wfn+1,"до по") )
 { l[i]=omo2; Z[242]++; if(dbg){print "Z242"}; continue };
 if ( w(-2,"с со у") &&
     wa(-1,"_lock_su_suw-ro") && s(-2,-1) )
 { l[i]=omo2; Z[243]++; if(dbg){print "Z243"}; continue };
 if ( z(0) &&
     ba(1,"_lock_su_suw-ro") &&
     bw(2,"который") && s(1) )
 { l[i]=omo1; Z[244]++; if(dbg){print "Z244"}; continue };
 # _lock_su_suw-ro:end

 # _lock_s_suw-tv:start
 if ( qy(1,"prl_vi mest_vi") &&
       w(1+qyn,"с со") &&
     wfa(2+qyn,5+qyn,"_lock_s_suw-tv") && s(0,wfn-1) &&
     qir(2+qyn,wfn-1,"prl_tv prq_tv mest_tv mest_3e qik_tv") && W_w(wfn+1,"до по") )
 { l[i]=omo2; Z[245]++; if(dbg){print "Z245"}; continue };
 if ( w(-2,"с со") &&
     wa(-1,"_lock_s_suw-tv") && s(-2,-1) )
 { l[i]=omo2; Z[246]++; if(dbg){print "Z246"}; continue };
 if ( z(0) &&
     ba(1,"_lock_s_suw-tv") &&
     bw(2,"который") && s(1) )
 { l[i]=omo1; Z[247]++; if(dbg){print "Z247"}; continue }; #check!
 # _lock_s_suw-tv:end

 if ( sc(0,"[XIV]+") &&
       w(1,"века веков") && s(0) )
 { l[i]=omo1; Z[248]++; if(dbg){print "Z248"}; continue };

 cst1="создавать создать сплести сплетать";
 cst2="ног пальцев рук";
 if ( bw(-3,cst1) &&
  pre_ro(-2) &&
       w(-1,cst2) && s(-3,-1) )
 { l[i]=omo2; Z[249]++; if(dbg){print "Z249"}; continue };
 if ( bw(-4,cst1) &&
  pre_ro(-3) &&
       q(-2,"prl_ro prq_ro mest_ro mest_3e") &&
       w(-1,cst2) && s(-4,-1) )
 { l[i]=omo2; Z[250]++; if(dbg){print "Z250"}; continue };

 ### замок замки им.п. вин.п.
 if(iwrd=="замок" || iwrd=="замки") {

    # —
    if ( se(0," — ") && ba(1,"_castlelike_things") &&
        !ba(-1,"_lock_prl") )
    { l[i]=omo1; Z[251]++; if(dbg){print "Z251"}; continue };
    if ( se(0," — ") &&
          q(1,"mest_it") &&
         ba(2,"_castlelike_things") && s(1) )
    { l[i]=omo1; Z[252]++; if(dbg){print "Z252"}; continue };
    if ( q(-1,"mest_it") && s(-1) &&
        ba(-2,"_castlelike_things") && se(-2," — ") )
    { l[i]=omo1; Z[253]++; if(dbg){print "Z253"}; continue };
    if ( sc(0,"\\(") && sc(1,"\\)") && ba(1,"_castlelike_things") )
    { l[i]=omo1; Z[254]++; if(dbg){print "Z254"}; continue };

    if ( q(-1,"prq_edmuim prq_mnim") && ba(-1,"_prq_castle") && s(-1) )
    { l[i]=omo1; Z[255]++; if(dbg){print "Z255"}; continue };
    if ( q(1,"prq_edmuim prq_mnim") && ba(1,"_prq_castle") && s(0) )
    { l[i]=omo1; Z[256]++; if(dbg){print "Z256"}; continue };
    cst="окружить";
    if ( q(-2,"prq_edmuim prq_mnim") && bw(-2,cst) &&
         q(-1,"suw_tv mest_tv") && s(-2,-1) )
    { l[i]=omo1; Z[257]++; if(dbg){print "Z257"}; continue };

    if ( qxs(1,"и","ключ")||
         qxs(-1,"ключ","и") )
    { l[i]=omo2; Z[258]++; if(dbg){print "Z258"}; continue };

    if ( q(-1,"prq_edmuim prq_mnim") && ba(-1,"_prq_lock") && s(-1) )
    { l[i]=omo2; Z[259]++; if(dbg){print "Z259"}; continue };

    if ( z(0) &&
        ba(1,"_lock_parts") &&
         q(2,"otsz_edmuro otsz_mnro") && s(1) )
    { l[i]=omo2; Z[260]++; if(dbg){print "Z260"}; continue };

    # _castle_environs
    qb(-5,-1,"sz_iili"); bba(qbn-5,qbn-1,"_castle_environs"); bb_n=bbn; qb_n=qbn;
    if ( vgle(qb_n,-5,-1) && veq(bb_n,qb_n-1) && s(bb_n,-1) &&
            q(bb_n,"suw_im suw_vi") &&
          qir(qb_n+1,-1,"prl_im prq_im mest_im qast_any") )
    { l[i]=omo1; Z[261]++; if(dbg){print "Z261"}; continue };

    cst1="камня кирпича основания фундамента";
    wf(2,5,cst1); bf_n=wfn;
    if ( vgle(bf_n,2,5) && s(0,bf_n-1) &&
            w(1,"до") &&
          qir(2,bf_n-1,"prl_ro") )
    { l[i]=omo1; Z[262]++; if(dbg){print "Z262"}; continue };
    if ( qxs(-1,"до",cst1) )
    { l[i]=omo1; Z[263]++; if(dbg){print "Z263"}; continue };
    cst1="булыжники камешки камни камушки кирпичи кирпичики клочья куски кусочки пыль щепки щепы";
    wf(2,5,cst1); bf_n=wfn;
    if ( vgle(bf_n,2,5) && s(0,bf_n-1) &&
            w(1,"в на") &&
          qir(2,bf_n-1,"prl_vi") )
    { l[i]=omo1; Z[264]++; if(dbg){print "Z264"}; continue };
    if ( qxs(-1,"до",cst1) )
    { l[i]=omo1; Z[265]++; if(dbg){print "Z265"}; continue };
    cst1="булыжнику камешкам камешку камню камням камушкам камушки камушку кирпичикам кирпичику кирпичу крипчику кусочкам";
    wf(2,5,cst1); bf_n=wfn;
    if ( vgle(bf_n,2,5) && s(0,bf_n-1) &&
            w(1,"по") &&
          qir(2,bf_n-1,"prl_da") )
    { l[i]=omo1; Z[266]++; if(dbg){print "Z266"}; continue };
    if ( qxs(-1,"до",cst1) )
    { l[i]=omo1; Z[267]++; if(dbg){print "Z267"}; continue };


    cst1="быть стать";
    cst8="сложен";
    if ( bw(1,cst1) &&
         wf(2,5,cst8) &&
          w(wfn+1,"в из по") && s(0,wfn) && Qf(2,wfn-1,"pre_any sz_iili") )
    { l[i]=omo1; Z[268]++; if(dbg){print "Z268"}; continue };
    if ( bw(-2,cst1) &&
          w(-1,cst8) && s(-2,-1) )
    { l[i]=omo1; Z[269]++; if(dbg){print "Z269"}; continue };
    cst1="большой замечательный интересный красивый прекрасный";
    if ( w(-4,"у") &&
         q(-3,"mest_ro suw_ro") &&
         q(-2,"nar_step") &&
         w(-1,cst1) && s(-4,-1) )
    { l[i]=omo1; Z[270]++; if(dbg){print "Z270"}; continue };
    if ( w(-3,"у") &&
         q(-2,"mest_ro suw_ro") &&
         w(-1,cst1) && s(-3,-1) )
    { l[i]=omo1; Z[271]++; if(dbg){print "Z271"}; continue };
    cst1="здравствуй привет";
    if ( w(-1,cst1) && zs(-1) )
    { l[i]=omo1; Z[272]++; if(dbg){print "Z272"}; continue };
    cst1="показать";
    if ( ba(-2,"_gl_dvizh") && sc(-2,"—") && s(-1) &&
         bw(-1,cst1) )
    { l[i]=omo1; Z[273]++; if(dbg){print "Z273"}; continue };

    # _castle_prl:start
    if ( q(-1,"prl_im prl_kred_mu") && ba(-1,"_castle_prl") && s(-1) &&
      !(ba(-2,"_lock_pe") && s(-2)) )
    { l[i]=omo1; Z[274]++; if(dbg){print "Z274"}; continue };
    if ( q(-2,"prl_im prl_kred_mu") && ba(-2,"_castle_prl") &&
         q(-1,"prl_any prq_any mest_any qast") && !(bam(-1,"_lock_prl _lock_pe")) && s(-2,-1) )
    { l[i]=omo1; Z[275]++; if(dbg){print "Z275"}; continue };
    if ( q(-3,"prl_im prl_kred_mu") && ba(-3,"_castle_prl") &&
         q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
         q(-1,"prl_any prq_any mest_any qast") && s(-3,-1) )
    { l[i]=omo1; Z[276]++; if(dbg){print "Z276"}; continue };
    if ( q(1,"prl_edmuim prl_kred_mu") && w(0,"замок") && ba(1,"_castle_prl") && s(0) &&
       Q_w(2,"suw_vi suw_im suw_edne") )
    { l[i]=omo1; Z[277]++; if(dbg){print "Z277"}; continue };
    if ( q(1,"prl_mnim prl_kred_mu") && w(0,"замки") && ba(1,"_castle_prl") && s(0) &&
       Q_w(2,"suw_vi suw_im suw_edne") )
    { l[i]=omo1; Z[278]++; if(dbg){print "Z278"}; continue };
    cst1="быть ведь же казаться стать считаться являться";
    if ( bw(1,cst1) &&
        bfa(2,5,"_castle_prl") &&
          q(bfn,"prl_im prl_tv prl_kred_mu") && s(0,bfn-1) &&
         Qf(2,bfn-1,"pre_any sz_iili")  )
    { l[i]=omo1; Z[279]++; if(dbg){print "Z279"}; continue };
    cst2="быть делать казаться сделать стать считаться являться";
    if ( bb(-3,-1,cst2) &&
          q(1,"prl_tv") && ba(1,"_castle_prl") && s(bbn,0) )
    { l[i]=omo1; Z[280]++; if(dbg){print "Z280"}; continue };
    # _castle_prl:start

    # _lock_prl:escape
    cst="сложить";
    cst1="быть ведь же казаться стать считаться являться";
    if ( bw(1,cst) &&
          w(2,"из") && s(0,1) )
    { l[i]=omo1; Z[281]++; if(dbg){print "Z281"}; continue };
    if ( bw(1,cst1) &&
         bw(2,cst) &&
          w(3,"из") && s(0,2) )
    { l[i]=omo1; Z[282]++; if(dbg){print "Z282"}; continue };
    if ( w(-4,"из") &&
         q(-3,"otsz_ro") &&
        bw(-2,cst1) &&
        bw(-1,cst) && s(-4,-1) )
    { l[i]=omo1; Z[283]++; if(dbg){print "Z283"}; continue };
    if ( w(-5,"из") &&
         q(-4,"otsz_ro") &&
        bw(-3,cst1) &&
        bw(-2,cst) &&
         q(-1,"prl_vi mest_vi mest_3e") && s(-5,-1) )
    { l[i]=omo1; Z[284]++; if(dbg){print "Z284"}; continue };
    # _lock_prl:escape

    # _lock_prl:start
    cst1="быть ведь же казаться стать считаться являться";
    if ( q(-1,"prl_im prl_kred_mu") && ba(-1,"_lock_prl") && s(-1) )
    { l[i]=omo2; Z[285]++; if(dbg){print "Z285"}; continue };
    if ( q(-2,"prl_im prl_kred_mu") && ba(-2,"_lock_prl") &&
         Q(-1,"suw_any sz_iili") && s(-2,-1) )
    { l[i]=omo2; Z[286]++; if(dbg){print "Z286"}; continue };
    if ( q(-3,"prl_im prl_kred_mu") && ba(-3,"_lock_prl") &&
         q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
         q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo2; Z[287]++; if(dbg){print "Z287"}; continue };
    if ( q(1,"prl_im prl_kred_mu") && ba(1,"_lock_prl") && s(0) && Q(2,"isname suw_im") )
    { l[i]=omo2; Z[288]++; if(dbg){print "Z288"}; continue };
    if ( q(1,"nar_mest") &&
         q(2,"prl_im prl_kred_mu") && ba(2,"_lock_prl") && s(0,1) && Q(3,"isname suw_im") )
    { l[i]=omo2; Z[289]++; if(dbg){print "Z289"}; continue };
    if ( bw(1,cst1) &&
          q(2,"prl_im prl_tv prl_kred_mu") && ba(2,"_lock_prl") && s(0,1) )
    { l[i]=omo2; Z[290]++; if(dbg){print "Z290"}; continue };
    # _lock_prl:end

    # _lock_prq_kak_gl:start
    cst1="быть ведь же казаться стать считаться являться";
    if ( q(-1,"prq_im prq_kred_mu") && ba(-1,"_lock_prq_kak_gl") && s(-1) )
    { l[i]=omo2; Z[291]++; if(dbg){print "Z291"}; continue };
    if ( q(-2,"prq_im prq_kred_mu") && ba(-2,"_lock_prq_kak_gl") &&
         Q(-1,"suw_any sz_iili") && s(-2,-1) )
    { l[i]=omo2; Z[292]++; if(dbg){print "Z292"}; continue };
    if ( q(-3,"prq_im prq_kred_mu") && ba(-3,"_lock_prq_kak_gl") &&
         q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
         q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo2; Z[293]++; if(dbg){print "Z293"}; continue };
    if ( q(1,"prq_im prq_kred_mu") && ba(1,"_lock_prq_kak_gl") && s(0) && Q(1,"isname") )
    { l[i]=omo2; Z[294]++; if(dbg){print "Z294"}; continue };
    if ( bw(1,cst1) &&
          q(2,"prq_im prq_tv prq_kred_mu") && ba(2,"_lock_prq_kak_gl") && s(0,1) )
    { l[i]=omo2; Z[295]++; if(dbg){print "Z295"}; continue };
    # _lock_prq_kak_gl:end

    cst="весь целый";
    wb(-5,-1,cst); wb_n=wbn;
    if ( vgle(wb_n,-5,-1) && s(wb_n,-1) &&
          qir(wb_n+1,-1,"mest_vi prl_vi prq_vi") )
    { l[i]=omo1; Z[296]++; if(dbg){print "Z296"}; continue };
    if ( veq(-2) &&
          wc(-1,"ский$") && s(-2,-1) )
    { l[i]=omo1; Z[297]++; if(dbg){print "Z297"}; continue };
    if ( w(1,cst) && s(0) && p(1) )
    { l[i]=omo1; Z[298]++; if(dbg){print "Z298"}; continue };

    cst="закрывать закрыть";
    if ( w(1,"для") &&
         q(2,"mest_ro suw_ro") &&
        bf(3,5,cst) && s(0,bfn-1) )
    { l[i]=omo1; Z[299]++; if(dbg){print "Z299"}; continue };
    if ( bf(1,3,cst) &&
          w(bfn+1,"для") && s(0,bfn) )
    { l[i]=omo1; Z[300]++; if(dbg){print "Z300"}; continue };

    cst="быть стать явиться являться";
    if ( bf(1,3,cst) &&
          q(bfn+1,"suw_tv") &&
          w(bfn+2,"для к") && s(0,bfn+1) )
    { l[i]=omo1; Z[301]++; if(dbg){print "Z301"}; continue };

    cst1="ворота дверь калитка";
    cst2="камера комната парадное подъезд прихожая продуктовый";
    if ( ba(-5,"_lock_pe") &&
          w(-4,"на") &&
         bw(-3,cst1) &&
          w(-2,"в") &&
         bw(-1,cst2) && s(-5,-1) )
    { l[i]=omo2; Z[302]++; if(dbg){print "Z302"}; continue };


  ######################################################################################################
  # в замок
  if ( wb(-5,-1,"в во") && s(wbn,-1) ) {
   # адрес поискового токена, в данном случае — "в"
   DEFINE_TN_OK_PREVI_ZAMOK("в")

   if ( vis(tn_ok) ) {

    # point escape:одиночные исключения
    if ( qxs(1,"несколько","раз","без","толку","стреляли") )
    { l[i]=omo2; Z[303]++; if(dbg){print "Z303"}; continue };

    cst="поставить";
    cst1="гарнизон конь";
    if ( bw(tn-2,cst) &&
         bw(tn-1,cst1) && s(tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[304]++; if(dbg){print "Z304"}; continue };
    if ( bw(tn-1,cst) &&
         bw(1,cst1) && s(tn-1) )
    { l[i]=omo1; Z[305]++; if(dbg){print "Z305"}; continue };

    if ( qxs(tn-1,"ни не") && z(0) && s(tn-1) &&
        (qxw(1,"а но","не","в")||
         qxw(1,"а но ни не","в")) &&
         bfa(xwn+1,xwn+5,"_castle_environs") &&
         qir(xwn+1,bfn-1,cst_muvi) && s(xwn,bfn-1) )
    { l[i]=omo1; Z[306]++; if(dbg){print "Z306"}; continue };
    if ( qxw(tn-3,"ни не","в") &&
          ba(tn-2,"_castle_environs") && z(tn-2) &&
         qxs(tn-1,"а но ни не") )
    { l[i]=omo1; Z[307]++; if(dbg){print "Z307"}; continue };
    if ( wb(tn-5,tn-2,"через сквозь") &&
        qir(wbn+1,tn-2,"prl_vi mest_vi mest_3e prq_vi") &&
         ba(tn-1,"_castle_environs") && zs(tn-1) && s(wbn,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[308]++; if(dbg){print "Z308"}; continue };

    cst="совать";
    if ( bb(tn-4,tn-2,cst) &&
        qir(bbn+1,tn-2,"prl_edmuvi mest_edmuvi mest_3e") &&
          w(tn-1,"нос") && s(bbn,tn-1) )
    { l[i]=omo1; Z[309]++; if(dbg){print "Z309"}; continue };
    if ( bw(1,cst) &&
         wf(2,5,"нос") &&
        qir(wfn+1,wfn-1,"prl_edmuvi mest_edmuvi mest_3e") && s(1,wfn-1) )
    { l[i]=omo1; Z[310]++; if(dbg){print "Z310"}; continue };

    cst="захватить";
    if ( bb(tn-6,tn-3,cst) &&
        qir(bbn+1,tn-3,"suw_vi mest_vi mest_3e") &&
          w(tn-2,"с") &&
          q(tn-1,"mest_tv") && s(bbn,tn-1) )
    { l[i]=omo1; Z[311]++; if(dbg){print "Z311"}; continue };

    if ( qxs(tn-1,"по","возвращению приезду прибытию") )
    { l[i]=omo1; Z[312]++; if(dbg){print "Z312"}; continue };
    if ( qxs(tn-2,"в","одной","руке") &&
           q(tn-1,"suw_vi") &&
          zs(tn-1) )
    { l[i]=omo2; Z[313]++; if(dbg){print "Z313"}; continue };

    if ( q(tn-1,"mest_im mest_vi mest_3e suw_odim suw_odvi") && Q(tn-1,"gl_po") &&
         p(tn-2) && p(0) && s(tn-1,-1) )
    { l[i]=omo1; Z[314]++; if(dbg){print "Z314"}; continue };
    if ( q(tn-2,"mest_im mest_vi mest_3e suw_odim suw_odvi") && Q(tn-2,"gl_po") &&
         q(tn-1,"nar_any prl_kred_sr") &&
         p(tn-3) && p(0) && s(tn-2,-1) )
    { l[i]=omo1; Z[315]++; if(dbg){print "Z315"}; continue };
    if ( q(tn-2,"nar_any prl_kred_sr") &&
         q(tn-1,"mest_im mest_vi mest_3e suw_odim suw_odvi") && Q(tn-1,"gl_po") &&
         p(tn-3) && p(0) && s(tn-2,-1) )
    { l[i]=omo1; Z[316]++; if(dbg){print "Z316"}; continue };

    cst1="брать взять завести заключить захватить свести сводить собрать";
    cst2="голень голова грудь живот колено ладонь ладошка лодыжка локоть ляжка нога ножка палец пальчик плечо поясница рука ручка стопа талия туловище шея";
    cst3="взмахом движением";
    if ( bb(tn-4,tn-2,cst2) && s(bbn,tn-1) &&
       !( w(bbn,"руки руках руками") && (w(bbn-1,"на за под в с") || bba(bbn-4,bbn-2,"_gl_v_castle-iv")) && s(bbn,bbn-1)) &&
         bw(tn-1,cst1) )
    { l[i]=omo2; Z[317]++; if(dbg){print "Z317"}; continue };
    if ( bb(tn-4,tn-1,cst1) &&
        qir(bbn+1,tn-2,"prl_vi mcop_vi prq_vi") &&
         bw(tn-1,cst2) && s(bbn,tn-1) )
    { l[i]=omo2; Z[318]++; if(dbg){print "Z318"}; continue };
    if ( bw(tn-2,cst1) &&
         bw(tn-1,cst2) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[319]++; if(dbg){print "Z319"}; continue };
    if ( bw(tn-3,cst1) &&
         bw(tn-2,cst2) &&
          q(tn-1,"suw_ro suw_edne isname") && s(tn-3,tn-1) )
    { l[i]=omo2; Z[320]++; if(dbg){print "Z320"}; continue };
    if ( bw(1,cst2) &&
         bw(2,cst1) && s(0,1) )
    { l[i]=omo2; Z[321]++; if(dbg){print "Z321"}; continue };
    if ( bw(tn-1,cst1) &&
         bf(1,3,cst2) && s(tn-1,bfn-1) )
    { l[i]=omo2; Z[322]++; if(dbg){print "Z322"}; continue };
    if ( w(tn-3,cst3) &&
        bw(tn-2,cst1) &&
         q(tn-1,"isname suw_vi") && s(tn-3,tn-1) )
    { l[i]=omo2; Z[323]++; if(dbg){print "Z323"}; continue };
     if ( bw(tn-1,cst2) && se(tn-1, " — ") && p(0) )
     { l[i]=omo2; Z[324]++; if(dbg){print "Z324"}; continue };


    cst="захват обхват";
    if ( bw(tn-2,cst) &&
         bw(tn-1,cst2) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[325]++; if(dbg){print "Z325"}; continue };
    if ( bw(tn-5,cst) &&
         bw(tn-4,cst2) &&
          q(tn-3,"suw_ro suw_edne isname") &&
          q(tn-2,"prl_tv mest_tv mest_3e prq_tv qis_tv qik_tv") &&
          q(tn-1,"suw_tv") && s(tn-5,tn-1) )
    { l[i]=omo2; Z[326]++; if(dbg){print "Z326"}; continue };
    if ( bw(tn-1,cst) && s(tn-1) )
    { l[i]=omo2; Z[327]++; if(dbg){print "Z327"}; continue };

    # в ... «замок» в кавычках
    if ( bw(tn-2,cst1) &&
          q(tn-1,"isname suw_vi") &&
         sc(-1,"[\x22«]") && sc(0,"[\x22»]") && s(tn-2,tn-1) )
    { l[i]=omo2; Z[328]++; if(dbg){print "Z328"}; continue };
    if ( bw(tn-1,cst2) &&
         sc(tn-1,"[\x22«]") && sc(0,"[\x22»]") && s(tn-1) )
    { l[i]=omo2; Z[329]++; if(dbg){print "Z329"}; continue };
    if ( bw(tn-2,cst2) &&
          q(tn-1,"qast_any") &&
         sc(tn-1,"[\x22«]") && sc(0,"[\x22»]") && s(tn-2,tn-1) )
    { l[i]=omo2; Z[330]++; if(dbg){print "Z330"}; continue };

    if ( bw(tn-1,cst2) &&
          w(1,"за на") &&
         bw(2,cst2) && s(tn-1,1) )
    { l[i]=omo2; Z[331]++; if(dbg){print "Z331"}; continue };

    cst="впустить выпустить послать";
    cst1="дым поток";
    if ( bw(tn-3,cst) &&
          w(tn-2,cst1) &&
          q(tn-1,"suw_ro") && s(tn-3,tn-1) )
    { l[i]=omo2; Z[332]++; if(dbg){print "Z332"}; continue }; #edit
    if ( bb(tn-9,tn-3,cst) &&
          w(bbn+1,cst1) &&
          q(bbn+2,"pre_tv") &&
        qir(tn+3,tn-1,"suw_tv prl_tv mest_tv prq_tv isname qast nar_any") && s(bbn,tn-2) && zs(tn-1) )
    { l[i]=omo2; Z[333]++; if(dbg){print "Z333"}; continue }; #edit


    cst="вбить запихать запихнуть засунуть сунуть";
    if ( bb(tn-4,tn-1,cst) && s(bbn,1) &&
          w(1,"к ко") &&
          q(2,"suw_odedda suw_odmnda isname") )
    { l[i]=omo1; Z[334]++; if(dbg){print "Z334"}; continue };
    if ( bb(tn-4,tn-2,cst) && s(bbn,-1) &&
         (q(tn-1,"suw_odedvi suw_odmnvi isname")||w(tn-1,"меня тебя вас нас всех")) )
    { l[i]=omo1; Z[335]++; if(dbg){print "Z335"}; continue };
    if ( bw(tn-1,cst1) &&
         bf(1,3,cst2) && s(tn-1,bfn-1) )
    { l[i]=omo2; Z[336]++; if(dbg){print "Z336"}; continue };

    cst3="армия войско отряд";
    if ( bb(tn-4,tn-1,cst) &&
         bw(bbn-1,cst3) && s(bbn-1,tn-1) )
    { l[i]=omo1; Z[337]++; if(dbg){print "Z337"}; continue };

    cst1="вкладывать вложить";
    cst2="деньги доллар золото магия работа серебро сила средство труд усилие";
    if ( bb(tn-5,tn-2,cst2) && s(bbn,tn-1) &&
         bw(tn-1,cst1) )
    { l[i]=omo1; Z[338]++; if(dbg){print "Z338"}; continue };
    if ( bb(tn-5,tn-2,cst1) && s(bbn,tn-1) &&
         bw(tn-1,cst2) )
    { l[i]=omo1; Z[339]++; if(dbg){print "Z339"}; continue };
    if ( bw(tn-2,cst2) && z(tn-2) &&
         bw(tn-1,cst1) && s(tn-1) )
    { l[i]=omo1; Z[340]++; if(dbg){print "Z340"}; continue };
    if ( bf(1,4,cst1) &&
         bf(bfn+1,bfn+4,cst2) && s(0,bfn-1) )
    { l[i]=omo1; Z[341]++; if(dbg){print "Z341"}; continue };

    # _suw_v_castle-vp:start
    # escape
    if ( ba(tn-3,"_suw_v_lock") &&
          w(tn-2,"с") &&
          q(tn-1,"suw_tv") && s(tn-3,tn-1) )
    { l[i]=omo2; Z[342]++; if(dbg){print "Z342"}; continue };
    cst="ключ";
    if ( ba(tn-2,"_suw_v_castle-vp") &&
         bw(tn-1,cst) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[343]++; if(dbg){print "Z343"}; continue };
    cst="ключ пропуск";
    if ( ba(tn-2,"_gl_v_lock-iv") &&
         bw(tn-1,cst) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[344]++; if(dbg){print "Z344"}; continue };
    #
    #
    if ( ba(tn-1,"_suw_v_castle-vp") && s(tn-1) )
    { l[i]=omo1; Z[345]++; if(dbg){print "Z345"}; continue };
    if ( vvb(tn-5,tn-1) && ba(vvn,"_suw_v_castle-vp") )
    { l[i]=omo1; Z[346]++; if(dbg){print "Z346"}; continue };
    if ( ba(tn-2,"_suw_v_castle-vp")  && s(tn-2) &&
          q(tn-1,"prl_kred_sr nar_any") && zs(tn-1) )
    { l[i]=omo1; Z[347]++; if(dbg){print "Z347"}; continue };
    if ( bba(tn-6,tn-2,"_suw_v_castle-vp") &&
         qir(bbn+1,tn-2,"prl_ro prq_ro mcop_ro suw_ro") &&
           q(tn-1,"suw_ro mest_ro mest_3e qast nar_napr isname") && s(bbn,tn-1) )
    { l[i]=omo1; Z[348]++; if(dbg){print "Z348"}; continue };

    cst="без для из с";
    if ( bba(tn-6,tn-3,"_suw_v_castle-vp") &&
           w(bbn+1,cst) &&
         qir(bbn+2,tn-1,"suw_ro prl_ro prq_ro mest_ro mest_3e isname") && s(bbn,tn-1) )
    { l[i]=omo1; Z[349]++; if(dbg){print "Z349"}; continue };
    if ( ba(tn-1,"_suw_v_castle-vp") && se(tn-1," — ") )
    { l[i]=omo1; Z[350]++; if(dbg){print "Z350"}; continue };
    cst="начаться начинаться";
    if ( bw(1,cst) &&
         ba(2,"_suw_v_castle-vp") && s(0,1) )
    { l[i]=omo1; Z[351]++; if(dbg){print "Z351"}; continue };
    # _suw_v_castle-vp:end

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
           bw(tn-1,cst) && s(tn-1) )
    { l[i]=omo2; Z[352]++; if(dbg){print "Z352"}; continue };
    if ( (qxs(tn-1,"за на",cst2) ||
          qxs(tn-1,"за на",cst1,cst2) ||
          qxs(tn-1,"за над",cst4) ||
          qxs(tn-1,"за над",cst3,cst4) ||
          qxs(tn-1,"на",cst6) ||
          qxs(tn-1,"на",cst5,cst6) ) &&
           bw(xsn-1,cst) && s(tn-1) )
    { l[i]=omo2; Z[353]++; if(dbg){print "Z353"}; continue };
    if ( vvb(tn-5,tn-1) &&
        (qxs(vvn-2,"за на",cst2) ||
         qxs(vvn-2,"за на",cst1,cst2) ||
         qxs(vvn-2,"за над",cst4) ||
         qxs(vvn-2,"за над",cst3,cst4) ||
         qxs(vvn-2,"на",cst6) ||
         qxs(vvn-2,"на",cst5,cst6) ) &&
          bw(vvn-1,cst) && s(tn-1) )
    { l[i]=omo2; Z[354]++; if(dbg){print "Z354"}; continue };
    if ( bw(tn-1,cst) && s(tn-1) &&
       (qxs(1,"за на",cst2) ||
        qxs(1,"за на",cst1,cst2) ||
        qxs(1,"за над",cst4) ||
        qxs(1,"за над",cst3,cst4) ||
        qxs(1,"на",cst6) ||
        qxs(1,"на",cst5,cst6) ) )
    { l[i]=omo2; Z[355]++; if(dbg){print "Z355"}; continue };
    if ( p(-3) && bw(-2,cst) && tn == -1 && (p(0)||sz_iili(1)) )
    { l[i]=omo2; Z[356]++; if(dbg){print "Z356"}; continue };

    cst="рука";
    cst1="ладонями пальцами";
    if ( bw(tn-1,cst) && s(tn-1,0) && w(1,cst1) )
    { l[i]=omo2; Z[357]++; if(dbg){print "Z357"}; continue };
    if ( p(-3) && bw(-2,cst) && tn == -1 && (p(0)||sz_iili(1)) )
    { l[i]=omo2; Z[358]++; if(dbg){print "Z358"}; continue };

    cst="дороги хода ходу";
    if ( hwy(1,"то") && qy(1+hyn,"mest_da suw_da isname prq_da") &&
        (qxs(1+qyn+hyn,cst,"нет") ||
         qxs(1+qyn+hyn,"нет",cst) ||
         qxs(1+qyn+hyn,"какими","судьбами") ) && s(0+hyn) )
    { l[i]=omo1; Z[359]++; if(dbg){print "Z359"}; continue };
    if ( qxs(tn-1,cst,"нет") ||
         qxs(tn-1,"нет",cst) ||
         qxs(tn-1,"какими","судьбами") ||
         qxs(tn-1,"ни","ногой") )
    { l[i]=omo1; Z[360]++; if(dbg){print "Z360"}; continue };

    if ( qxs(1,"больше более","ни","ногой")||
         qxs(1,"ни","ногой")||
           w(1,"ни-ни") )
    { l[i]=omo1; Z[361]++; if(dbg){print "Z361"}; continue };
    if ( qxs(tn-1,"ни","ногой") )
    { l[i]=omo1; Z[362]++; if(dbg){print "Z362"}; continue };

    # _suw_v_lock:start
    if ( ba(tn-1,"_suw_v_lock") && s(tn-1) )
    { l[i]=omo2; Z[363]++; if(dbg){print "Z363"}; continue };
    if ( vvb(tn-5,tn-1) &&
          ba(vvn,"_suw_v_lock") )
    { l[i]=omo2; Z[364]++; if(dbg){print "Z364"}; continue };
    if ( bba(tn-6,tn-2,"_suw_v_lock") &&
         qir(bbn+1,tn-2,"prl_ro prq_ro mcop_ro") &&
           q(tn-1,"suw_ro mest_ro mest_3e isname qast") && s(bbn,tn-1) )
    { l[i]=omo2; Z[365]++; if(dbg){print "Z365"}; continue };
    if ( vvb(tn-5,tn-1) &&
         bba(vvn-6,vvn-1,"_suw_v_lock") &&
         qir(vvn+1,vvn-1,"prl_ro prq_ro mcop_ro") &&
           q(vvn,"suw_ro mest_ro mest_3e isname qast") && s(bbn,vvn-1) )
    { l[i]=omo2; Z[366]++; if(dbg){print "Z366"}; continue };
    if ( ba(tn-4,"_suw_v_lock") &&
     pre_ro(tn-3) &&
          q(tn-2,"suw_ro") &&
          q(tn-1,"suw_ro") && s(tn-4,tn-1) )
    { l[i]=omo2; Z[367]++; if(dbg){print "Z367"}; continue };
    if ( ba(tn-3,"_suw_v_lock") &&
     pre_vi(tn-2) &&
          q(tn-1,"suw_vi") && s(tn-3,tn-1) )
    { l[i]=omo2; Z[368]++; if(dbg){print "Z368"}; continue };
    if ( ba(tn-1,"_suw_v_lock") && s(tn-1) &&
        qxs(1,"за","спиной") )
    { l[i]=omo2; Z[369]++; if(dbg){print "Z369"}; continue };
    # _suw_v_lock:end

    cst="скользнуть";
    cst1="змеем змейкой";
    cst2="первый";
    cst3="воздух пространство";
    if ( w(tn-2,cst1) &&
        bw(tn-1,cst) && s(tn-2,tn-1) )
    { l[i]=omo1; Z[370]++; if(dbg){print "Z370"}; continue };
    if ( bw(tn-2,cst2) &&
         bw(tn-1,cst) && s(tn-2,tn-1) )
    { l[i]=omo1; Z[371]++; if(dbg){print "Z371"}; continue };
    if ( qb(tn-9,tn-3,"mest_impe suw_odim") &&
         bw(tn-2,cst) &&
          q(tn-1,"nar_napr") && s(qbn,tn-1) )
    { l[i]=omo1; Z[372]++; if(dbg){print "Z372"}; continue };
    if ( qb(tn-7,tn-3,"gl_ed gl_mn") &&
    sz_iili(tn-2) &&
         bw(tn-1,cst) && s(qbn,tn-1) )
    { l[i]=omo1; Z[373]++; if(dbg){print "Z373"}; continue };
    if ( bb(-7,-4,cst) &&
     pre_vi(bbn+1) &&
        qir(bbn+2,tn-2,"prl_vi prq_vi mcop_vi") &&
         bw(tn-1,cst3) && s(bbn,tn-1) )
    { l[i]=omo1; Z[374]++; if(dbg){print "Z374"}; continue };

    cst="затолкать";
    if ( w(tn-3,"тебя меня вас нас") &&
        bw(tn-2,cst) &&
         q(tn-1,"nar_napr") && s(tn-3,tn-1) )
    { l[i]=omo1; Z[375]++; if(dbg){print "Z375"}; continue };

    # _gl_v_lock-iv:start
    # поиск по _gl_v_castle-iv
    bba(tn-9,tn-1,"_gl_v_lock-iv"); bb_n = bbn;

    if ( veq(bb_n,tn-1) && s(tn-1) &&
         !(q(tn-1,"prq_vi") && ba(tn-2,"_gl_v_castle-iv") && s(tn-2)) )
    { l[i]=omo2; Z[376]++; if(dbg){print "Z376"}; continue }; # check
    cst="ключ ключи кулачищи ладони ладонь ладошки руки руку";
    if ( q(tn-1,"prq_vi") && veq(bb_n,tn-1) && s(tn-1) &&
        wf(1,3,cst) &&
       qir(1,wfn-1,"prl_vi mest_vi") && s(0,wfn-1) )
    { l[i]=omo2; Z[377]++; if(dbg){print "Z377"}; continue };

    if ( veq(bb_n,tn-3) &&
           q(tn-2,"suw_vi") &&
           q(tn-1,"mest_vi mest_3e") && s(tn-3,tn-1) )
    { l[i]=omo2; Z[378]++; if(dbg){print "Z378"}; continue };
    if ( vgle(bb_n,tn-6,tn-2) &&
          qir(bb_n+1,tn-2,"prl_vi prq_vi mcop_vi qik_vi qis_vi prl_kred_sr nar_any isname qast_any") &&
            q(tn-1,"suw_vi qast_any") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[379]++; if(dbg){print "Z379"}; continue };
    if ( vgle(bb_n,tn-6,tn-3) &&
          qir(bb_n+1,tn-3,"prl_vi prq_vi mcop_vi qik_vi qis_vi prl_kred_sr nar_any isname qast_any") &&
            q(tn-2,"suw_vi qast_any") && zs(tn-2) &&
            q(tn-1,"sz") && s(bb_n,tn-3) )
    { l[i]=omo2; Z[380]++; if(dbg){print "Z380"}; continue };
    if ( vvb(tn-5,tn-1) && bba(vvn-6,vvn-1,"_gl_v_lock-iv") &&
         qir(bb_n+1,vvn-1,"prl_vi prq_vi mcop_vi qik_vi qis_vi prl_kred_sr nar_any isname") &&
           q(vvn,"suw_vi") && s(bb_n,vvn-1) )
    { l[i]=omo2; Z[381]++; if(dbg){print "Z381"}; continue };
    if ( vgle(bb_n,tn-7,tn-3) &&
          qir(bb_n+1,tn-3,"prl_vi prq_vi mest_vi mest_3e prl_kred_sr nar_step isname") &&
            q(tn-2,"suw_vi") &&
            q(tn-1,"suw_ro") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[382]++; if(dbg){print "Z382"}; continue };
    if ( veq(bb_n,tn-4) &&
           q(tn-3,"suw_vi suw_im mest_im mest_vi suw_tv qast isname") &&
           q(tn-2,"suw_vi suw_tv") &&
           q(tn-1,"suw_ro") && s(tn-4,tn-1) && Qf(tn-3,tn-1,"sz_iili pre_any"))
    { l[i]=omo2; Z[383]++; if(dbg){print "Z383"}; continue }; #inspect
    if ( vgle(bb_n,tn-6,tn-2) &&
            q(bb_n+1,"suw_vi suw_edne") &&
          qir(bb_n+2,tn-2,"prl_ro prq_ro mcop_ro qis_ro qik_ro qik_vi suw_ro suw_edne isname") &&
            q(tn-1,"suw_ro suw_edne isname") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[384]++; if(dbg){print "Z384"}; continue };
    if ( vgle(bb_n,tn-7,tn-3) &&
            q(bb_n+1,"suw_vi") &&
          qir(bb_n+2,tn-3,"prl_ro prq_ro mcop_ro qis_ro qik_ro suw_ro suw_edne isname") &&
            q(tn-2,"suw_ro isname") &&
            q(tn-1,"mest_ro suw_ro") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[385]++; if(dbg){print "Z385"}; continue };
    if ( vgle(bb_n,tn-7,tn-2) &&
          qir(bb_n+1,tn-2,"prl_tv prq_tv mest_tv mcop_tv mest_vi qik_tv qis_tv prl_vi prq_vi mest_3e qik_vi qis_vi suw_vi") &&
            q(tn-1,"suw_tv") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[386]++; if(dbg){print "Z386"}; continue }; # _gl_v_lock-iv suw_vi suw_tv
    if ( vgle(bb_n,tn-9,tn-3) &&
          qir(bb_n+1,tn-2,"prl_tv prq_tv mest_tv mest_vi qik_tv qis_tv prl_vi prq_vi mest_3e qik_vi qis_vi suw_tv") &&
            q(tn-1,"suw_vi") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[387]++; if(dbg){print "Z387"}; continue }; # _gl_v_lock-iv suw_tv suw_vi
    if ( vgle(bb_n,tn-7,tn-5) && s(bb_n) &&
            q(bb_n+1,"prl_vi prq_vi") && z(bb_n+1) &&
            q(bb_n+2,"prq_vi") &&
          qir(bb_n+3,tn-3,"mest_tv prl_tv prq_tv mest_3e qik_tv qis_tv") &&
            q(tn-2,"suw_tv") &&
            q(tn-1,"suw_vi") && s(bb_n+2,tn-1) )
    { l[i]=omo2; Z[388]++; if(dbg){print "Z388"}; continue }; # _gl_v_lock-iv suw_tv suw_vi
    if ( veq(bb_n,tn-3) &&
           q(tn-2,"suw_vi suw_im mest_im mest_vi suw_tv mest_tv qast isname") &&
           q(tn-1,"suw_vi suw_tv qast nar_any") && s(tn-3,tn-1) )
    { l[i]=omo2; Z[389]++; if(dbg){print "Z389"}; continue }; #inspect
    if ( veq(bb_n,tn-2) &&
           q(tn-1,"mest_vi mest_tv mest_im mest_3e prl_vi") && s(tn-2,tn-1) )
    { l[i]=omo2; Z[390]++; if(dbg){print "Z390"}; continue };
    if ( veq(bb_n,tn-3) &&
           q(tn-2,"prl_srav prl_kred_sr nar_spos") && Q(tn-2,"pre_vi") &&
           q(tn-1,"suw_vi mest_vi suw_im mest_im mest_3e prl_kred_sr prl_srav isname nar_mest") && s(tn-3,tn-1) )
    { l[i]=omo2; Z[391]++; if(dbg){print "Z391"}; continue };
    if ( veq(bb_n,tn-2) &&
           q(tn-1,"suw_im prl_kred_sr prl_srav isname nar_mest qis_vi") && s(tn-2,tn-1) )
    { l[i]=omo2; Z[392]++; if(dbg){print "Z392"}; continue };

    # поиск по pre_vi + _gl_v_lock-iv: qb_n и bb_n
    qb(tn-6,tn-2,"pre_vi"); bba(qbn-9,qbn-1,"_gl_v_lock-iv"); qb_n=qbn; bb_n=bbn;

    if ( vgle(qb_n,tn-6,tn-3) && veq(bb_n,qb_n-2) &&
            q(qb_n-1,"suw_vi mest_vi mest_3e") &&
            q(qb_n+1,"suw_vi mest_vi mcop_vi") &&
          qir(qb_n+2,tn-2,"prl_tv prq_tv mest_tv qik_tv qis_tv") &&
            q(tn-1,"suw_tv") && s(qb_n-2,tn-1) )
    { l[i]=omo2; Z[393]++; if(dbg){print "Z393"}; continue }; # _gl_v_lock-iv suw_vi PRE_VI suw_vi
    if ( vgle(qb_n,tn-5,tn-2) && veq(bb_n,qb_n-2) &&
            q(qb_n-1,"suw_vi") &&
          qir(qb_n+1,tn-2,"prl_vi mcop_vi prq_vi qis_vi qik_vi") &&
            q(tn-1,"suw_vi mest_vi") && s(qb_n-2,tn-1) )
    { l[i]=omo2; Z[394]++; if(dbg){print "Z394"}; continue }; # _gl_v_lock-iv suw_vi PRE_VI suw_vi

    # поиск по pre_tv + _gl_v_lock-iv: qb_n и bb_n
    qb(tn-6,tn-2,"pre_tv"); bba(qbn-9,qbn-1,"_gl_v_lock-iv"); qb_n=qbn; bb_n=bbn;

    if ( vgle(qb_n,tn-5,tn-2) && veq(bb_n,qb_n-1) &&
          qir(qb_n+1,tn-2,"prl_tv mest_tv mest_3e prq_tv qis_tv qik_tv") &&
            q(tn-1,"suw_tv mest_tv") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[395]++; if(dbg){print "Z395"}; continue }; # _gl_v_lock-iv PRE_TV suw_tv
    if ( vgle(qb_n,tn-6,tn-3) && veq(bb_n,qb_n-1) &&
          qir(qb_n+1,tn-3,"prl_tv mest_tv mest_3e prq_tv qis_tv qik_tv") &&
            q(tn-2,"suw_tv mest_tv") &&
            q(tn-1,"suw_vi") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[396]++; if(dbg){print "Z396"}; continue }; # _gl_v_lock-iv PRE_TV suw_tv suw_vi
    if ( vgle(qb_n,tn-7,tn-4) && veq(bb_n,qb_n-1) &&
          qir(qb_n+1,tn-4,"prl_tv mest_tv prq_tv qis_tv qik_tv") &&
            q(tn-3,"suw_tv mest_tv") &&
            q(tn-2,"prl_vi mcop_vi prq_vi") &&
            q(tn-1,"suw_vi") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[397]++; if(dbg){print "Z397"}; continue }; # _gl_v_lock-iv PRE_TV suw_tv suw_vi
    if ( vgle(qb_n,tn-5,tn-2) && vgle(bb_n,qbn-9,qbn-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi prl_vi mest_vi mest_3e prq_vi prl_kred_sr") &&
          qir(qb_n+1,tn-1,"prl_tv mest_tv prq_tv qis_tv qik_tv suw_tv isname") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[398]++; if(dbg){print "Z398"}; continue }; # _gl_v_lock-iv suw_vi PRE_TV suw_tv
    if ( vgle(qb_n,tn-6,tn-3) && vgle(bb_n,qb_n-6,qb_n-2) &&
          qir(bb_n+1,qb_n-2,"prl_im prl_vi mest_im mest_vi mest_3e prq_im prq_vi prl_kred_sr") &&
            q(qb_n-1,"suw_vi suw_im mest_im mest_vi mest_3e prq_vi prl_kred_sr") &&
          qir(qb_n+1,tn-3,"prl_tv mest_tv prq_tv qis_tv qik_tv") &&
            q(tn-2,"suw_tv mest_tv") &&
            q(tn-1,"suw_vi isname") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[399]++; if(dbg){print "Z399"}; continue }; # _gl_v_lock-iv suw_vi PRE_TV suw_tv

    # поиск по pre_ro + _gl_v_lock-iv: qb_n и bb_n
    qb(tn-6,tn-2,"pre_ro"); bba(qbn-9,qbn-1,"_gl_v_lock-iv"); qb_n=qbn; bb_n=bbn;

    if ( vgle(qb_n,tn-5,tn-2) && vgle(bb_n,qbn-9,qbn-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi prl_vi mcop_vi prq_vi qis_vi qik_vi qast") &&
          qir(qb_n+1,tn-1,"suw_ro prl_ro mest_ro prq_ro qis_ro qik_ro isname") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[400]++; if(dbg){print "Z400"}; continue }; # _gl_v_lock-iv suw_vi PRE_RO suw_ro
    if ( vgle(qb_n,tn-6,tn-3) && vgle(bb_n,qb_n-5,qb_n-2) &&
          qir(bb_n+1,qb_n-2,"prl_vi mcop_vi prq_vi qis_vi qik_vi qast") &&
            q(qb_n-1,"suw_vi prq_vi mest_vi mest_3e") &&
          qir(qb_n+1,tn-3,"prl_ro mest_ro prq_ro qis_ro qik_ro") &&
            q(tn-2,"suw_ro mest_ro") &&
            q(tn-1,"suw_vi prq_vi mest_vi mest_3e") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[401]++; if(dbg){print "Z401"}; continue }; # _gl_v_lock-iv <SUW_VI PRE_RO <suw_ro suw_vi
    if ( vgle(qb_n,tn-5,tn-2) && vgle(bb_n,qb_n-5,qb_n-1) &&
          qir(bb_n+1,qb_n-1,"suw_tv mest_tv") &&
          qir(qb_n+1,tn-2,"prl_ro mest_ro prq_ro qis_ro qik_ro") &&
            q(tn-1,"suw_ro mest_ro") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[402]++; if(dbg){print "Z402"}; continue }; # _gl_v_lock-iv suw_vi PRE_RO suw_ro

    # поиск по pre_pr + _gl_v_lock-iv: qb_n и bb_n
    qb(tn-6,tn-2,"pre_pr"); bba(qbn-9,qbn-1,"_gl_v_lock-iv"); qb_n=qbn; bb_n=bbn;

    if ( vgle(qb_n,tn-5,tn-3) && veq(bb_n,qb_n-3) &&
            q(tn-5,"suw_vi mest_vi mest_3e prq_vi") &&
            q(tn-4,"prq_tv") &&
            q(tn-2,"suw_pr") &&
            q(tn-1,"suw_tv") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[403]++; if(dbg){print "Z403"}; continue };
    if ( vgle(qb_n,tn-5,tn-3) && veq(bb_n,qb_n-3) &&
            q(qb_n-2,"suw_vi prq_vi") &&
            q(qb_n-1,"suw_ro prq_ro") &&
          qir(qb_n+1,tn-3,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
            q(tn-2,"suw_pr") &&
            q(tn-1,"suw_ro mest_ro suw_vi mest_vi mest_3e") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[404]++; if(dbg){print "Z404"}; continue }; # _gl_v_lock-iv suw_vi suw_ro PRE_PR <suw_pr suw_ro
    if ( vgle(qb_n,tn-5,tn-2) && vgle(bb_n,qb_n-5,qb_n-2) &&
          qir(bb_n+1,qb_n-2,"prl_vi mest_vi prq_vi") &&
            q(qb_n-1,"suw_vi prq_vi mest_vi mest_3e") &&
          qir(qb_n+1,tn-2,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
            q(tn-1,"suw_pr") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[405]++; if(dbg){print "Z405"}; continue }; # _gl_v_lock-iv suw_vi suw_ro PRE_PR <suw_pr
    if ( vgle(qb_n,tn-6,tn-3) && veq(bb_n,qb_n-2) &&
            q(qb_n-1,"suw_vi prq_vi mest_vi mest_3e") &&
          qir(qb_n+1,tn-3,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
            q(tn-2,"suw_pr") &&
            q(tn-1,"suw_vi prq_vi mest_vi mest_3e") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[406]++; if(dbg){print "Z406"}; continue }; # _gl_v_lock-iv suw_vi suw_ro PRE_PR <suw_pr suw_vi
    if ( vgle(qb_n,tn-5,tn-3) && vgle(bb_n,qb_n-5,qb_n-1) &&
           qy(qb_n-1,"suw_vi prq_vi mest_vi mest_3e") &&
          qir(bb_n+1,qb_n-2,"prl_vi mest_vi prq_vi") &&
          qir(qb_n+1,tn-3,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
            q(tn-2,"suw_pr") &&
            q(tn-1,"suw_ro mest_ro suw_vi mest_vi mest_3e") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[407]++; if(dbg){print "Z407"}; continue }; # _gl_v_lock-iv PRE_PR <suw_pr suw_ro
    if ( vgle(qb_n,tn-5,tn-2) && veq(bb_n,qb_n-1) &&
          qir(qb_n+1,tn-2,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
            q(tn-1,"suw_pr") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[408]++; if(dbg){print "Z408"}; continue }; # _gl_v_lock-iv PRE_PR <suw_pr
    if ( vgle(qb_n,tn-5,tn-2) && veq(bb_n,qb_n-3) &&
            q(qb_n-2,"pre_ro") &&
            q(qb_n-1,"suw_ro mest_ro") &&
          qir(qb_n+1,tn-2,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
            q(tn-1,"suw_pr") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[409]++; if(dbg){print "Z409"}; continue }; # _gl_v_lock-iv PRE_PR <suw_pr
    if ( vgle(qb_n,tn-5,tn-2) && veq(bb_n,qb_n-3) &&
            q(qb_n-2,"pre_ro") &&
            q(qb_n-1,"mcop_ro") &&
          qir(qb_n+1,tn-2,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
            q(tn-1,"suw_pr") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[410]++; if(dbg){print "Z410"}; continue }; # _gl_v_lock-iv PRE_PR <suw_pr
    if ( vgle(qb_n,tn-6,tn-3) && veq(bb_n,qb_n-1) &&
            q(qb_n+1,"suw_pr") &&
          qir(qb_n+2,tn-2,"prl_vi mcop_vi prq_vi qis_vi qik_vi") &&
            q(tn-1,"suw_vi") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[411]++; if(dbg){print "Z411"}; continue }; # _gl_v_lock-iv PRE_PR <suw_pr
    if ( vgle(qb_n,tn-7,tn-4) && veq(bb_n,qb_n-1) &&
            q(qb_n+1,"suw_pr") &&
          qir(qb_n+2,tn-3,"prl_vi mcop_vi prq_vi qis_vi qik_vi") &&
            q(tn-2,"suw_vi") &&
            q(tn-1,"suw_ro") && s(bb_n,tn-1) )
    { l[i]=omo2; Z[412]++; if(dbg){print "Z412"}; continue }; # _gl_v_lock-iv PRE_PR <suw_pr
    if ( vgle(qb_n,tn-7,tn-4) && veq(bb_n,tn-6) &&
          qir(qb_n-1,"suw_vi mest_vi mest_3e") && s(bb_n,qb_n-1) &&
            q(qb_n+1,"suw_pr") && z(qb_n+1) &&
           sz(tn-2) &&
            q(tn-1,"suw_vi mest_vi mest_3e") && s(tn-2,tn-1) )
    { l[i]=omo2; Z[413]++; if(dbg){print "Z413"}; continue };

    if ( !(bba(tn-5,tn-1,"_gl_v_castle-iv") && s(bbn,tn-1) && Qb(bbn+1,tn-1,"sz_iili") ) &&
           bfa(1,4,"_gl_v_lock-iv") && s(0,bfn-1) && Qf(1,bfn,"sz_iili") )
    { l[i]=omo2; Z[414]++; if(dbg){print "Z414"}; continue };

    cst1="горло кисти кисть клинок ладони ладонь ладошки ладошку лодыжки лодыжку ноги ногу ножки ножку палец пальцы ремень руки руку талию шеи шею";
    if ( ba(tn-3,"_gl_v_lock-iv") &&
     pre_vi(tn-2) &&
          w(tn-1,cst1) && s(tn-3,tn-1) )
    { l[i]=omo2; Z[415]++; if(dbg){print "Z415"}; continue };
    if ( wb(tn-5,tn-1,cst1) && s(tn-1) &&
          q(wbn-1,"narph_any") &&
         ba(xwn-1,"_gl_v_lock-iv") && s(xwn-1) )
    { l[i]=omo2; Z[416]++; if(dbg){print "Z416"}; continue };
    # _gl_v_lock-iv:end


    # _v_zamok:start
    # cst1 выше
    if ( ba(1,"_v_zamok") &&
          w(2,cst1) && s(0,1) )
    { l[i]=omo2; Z[417]++; if(dbg){print "Z417"}; continue };

    if ( ba(tn-2,"_v_zamok") &&
          w(tn-1,cst1) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[418]++; if(dbg){print "Z418"}; continue };
    if ( bba(tn-6,tn-3,"_v_zamok") &&
           w(bbn+1,cst1) &&
         qir(bbn+2,tn-2,"prl_ro mest_ro mest_3e prq_ro") &&
           q(tn-1,"suw_ro suw_edne") && s(tn-3,tn-1) )
    { l[i]=omo2; Z[419]++; if(dbg){print "Z419"}; continue };
    if ( bba(tn-5,tn-2,"_v_zamok") &&
         qir(bbn+1,tn-2,"prl_vi prq_vi mcop_vi nar_mest") &&
           w(tn-1,cst1) && s(bbn,tn-1) )
    { l[i]=omo2; Z[420]++; if(dbg){print "Z420"}; continue };
    if ( ba(tn-4,"_v_zamok") &&
          w(tn-3,cst1) &&
     pre_ro(tn-2) &&
          q(tn-1,"suw_ro") && s(tn-4,tn-1) )
    { l[i]=omo2; Z[421]++; if(dbg){print "Z421"}; continue };
    if ( bw(tn-4,cst1) &&
         ba(tn-3,"_v_zamok") &&
     pre_tv(tn-2) &&
          q(tn-1,"suw_tv mest_tv") && s(tn-4,tn-1) )
    { l[i]=omo2; Z[422]++; if(dbg){print "Z422"}; continue };
    if ( ba(tn-4,"_v_zamok") &&
          w(tn-3,cst1) &&
     pre_tv(tn-2) &&
          q(tn-1,"suw_tv mest_tv") && s(tn-4,tn-1) )
    { l[i]=omo2; Z[423]++; if(dbg){print "Z423"}; continue };
    if ( ba(tn-4,"_v_zamok") &&
          w(tn-3,cst1) &&
     pre_pr(tn-2) &&
          q(tn-1,"suw_pr mest_pr") && s(tn-4,tn-1) )
    { l[i]=omo2; Z[424]++; if(dbg){print "Z424"}; continue };
    if ( ba(tn-4,"_v_zamok") &&
          q(tn-3,"suw_vi mest_vi isname") &&
     pre_vi(tn-2) &&
          w(tn-1,cst1) && s(tn-4,tn-1) )
    { l[i]=omo2; Z[425]++; if(dbg){print "Z425"}; continue };
    if ( bw(1,cst1) &&
          q(2,"nar_kaq") &&
         ba(3,"_v_zamok") && s(0,2) )
    { l[i]=omo2; Z[426]++; if(dbg){print "Z426"}; continue };

    cst2="хватом";
    if ( ba(tn-2,"_v_zamok") &&
          w(tn-1,cst2) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[427]++; if(dbg){print "Z427"}; continue };
    # _v_zamok:end

    if ( bw(tn-2,"пуля") &&
         bw(tn-1,"угодить") && s(tn-2,tn-1) )
    { l[i]=omo2; Z[428]++; if(dbg){print "Z428"}; continue };

    cst="быстрее быстро все назад обратно сейчас скорее сначала сперва сразу срочно теперь";
    if ( w(tn-1,cst) &&
         p(tn-2,",") && p(0) )
    { l[i]=omo1; Z[429]++; if(dbg){print "Z429"}; continue };

    if ( p(-2,",") && tn==-1 && cap(-1) && p(0) )
    { l[i]=omo1; Z[430]++; if(dbg){print "Z430"}; continue };

    cst="ввести вводить внедриться войти вползать врезаться всадить вторгнуться входить загнать зайти запихнуть засадить идти лезть пойти поместить попадать попасть \
         пройти проникать проникнуть проскальзывать проскользнуть проходить спрятаться юркнуть";
    cst1="карту ключ ключи ключик код отвертка отмычка скрепку спички спичку";
    cst2="жалом картой ключом отверткой отмычкой ремнем";
    cst3=cst1 " " cst2
    if ( bb(tn-6,tn-2,cst) && s(bbn,tn-1) &&
          q(bbn+1,"mest_vi mest_3e") &&
        qsb(bbn-10,bbn-1,",") &&
         bb(sbn-10,sbn,cst1) && s(bbn,sbn-1) )
    { l[i]=omo2; Z[431]++; if(dbg){print "Z431"}; continue };
    if ( bb(tn-3,tn-1,cst1) && s(bbn,tn-1) &&
        qir(bbn+1,tn-2,"nar_any") &&
         bw(tn-1,cst) &&
        qir(tn+1,-1,"mest_edmuvi prl_edmuvi prq_edmuvi prq_mnvi suw_da mest_da prl_da suw_tv prl_tv mest_tv suw_edne isname") && s(tn,-1) )
    { l[i]=omo2; Z[432]++; if(dbg){print "Z432"}; continue };
    if ( bw(tn-1,cst) &&
         bf(1,3,cst1) &&
        qir(1,bfn-1,"prl_vi mcop_vi prq_vi prl_im mcop_im prq_im") && s(tn-1,bfn-1) )
    { l[i]=omo2; Z[433]++; if(dbg){print "Z433"}; continue }; #check
    if ( bf(1,3,cst1) &&
        qir(1,bfn-1,"prl_vi mcop_vi prq_vi prl_im mcop_im prq_im") &&
         bw(bfn+1,cst) && s(tn,bfn-1) )
    { l[i]=omo2; Z[434]++; if(dbg){print "Z434"}; continue }; #check
    if ( wb(tn-3,tn-1,cst3) &&
        qir(wbn+1,tn-1,"nar_any qast_any prl_any") && s(wbn,tn-1) )
    { l[i]=omo2; Z[435]++; if(dbg){print "Z435"}; continue };
    if ( wf(1,5,cst3) &&
        qir(1,wfn-2,"nar_any prl_kred_sr mest_any prl_any mod_bz") &&
         bw(wfn-1,cst) && s(0,wfn-1) )
    { l[i]=omo2; Z[436]++; if(dbg){print "Z436"}; continue };
    if ( bw(tn-1,cst) && sv(0,"\\(") &&
         wf(1,5,cst3) &&
        qir(1,wfn-2,"nar_any prl_kred_sr mest_any prl_any mod_bz") && s(-1,wfn-1) )
    { l[i]=omo2; Z[437]++; if(dbg){print "Z437"}; continue };
    if ( p(tn-2,",") &&
         w(tn-1,cst1) && s(tn-1) )
    { l[i]=omo2; Z[438]++; if(dbg){print "Z438"}; continue };
    if ( bw(tn-3,"рука палец") && s(tn-3) &&
         bw(tn-2,"дрожать трястись") && z(tn-2) &&
         sz(tn-1) &&
          q(1,"suw_im mest_im prq_im") &&
         bw(2,cst) && s(tn-1,1) )
    { l[i]=omo2; Z[439]++; if(dbg){print "Z439"}; continue };

    cst="попасть";
    if ( ( qxs(tn-1,"а но что только","не")||
           qxs(tn-1,"не") ) && s(tn-1) &&
           vvb(xsn-5,xsn-1) &&
            bw(vvn,cst) )
    { l[i]=omo2; Z[440]++; if(dbg){print "Z440"}; continue };

    cst="втягиваться";
    if ( bw(tn-1,cst) &&
          w(tn+1,"центральный") && s(tn-1) )
    { l[i]=omo2; Z[441]++; if(dbg){print "Z441"}; continue };

    cst="ввести вводить внедриться вползать врезаться всадить вторгнуться входить загнать зайти засадить идти лезть пойти поместить попадать попасть пройти проникать \
         проскальзывать проскользнуть проходить спрятаться юркнуть";
    cst1="войти";
    if ( bba(tn-6,tn-2,"_lock_parts") &&
          sv(bbn,tn-2,"[….:;!?]") &&
          bw(tn-1,cst) && s(tn-1) )
    { l[i]=omo2; Z[442]++; if(dbg){print "Z442"}; continue };
    if ( bba(tn-6,tn-2,"_lock_parts") &&
           W(bbn+1,"и") &&
          sv(bbn,tn-2,"[….:;!?]") &&
          bw(tn-1,cst1) && s(tn-1) )
    { l[i]=omo2; Z[443]++; if(dbg){print "Z443"}; continue };
    if ( bba(tn-6,tn-2,"_lock_parts") &&
          bw(tn-1,"проникнуть просочиться") && s(bbn,tn-1) )
    { l[i]=omo2; Z[444]++; if(dbg){print "Z444"}; continue };

    if ( bba(tn-3,tn-1,"_lock_parts") &&
          se(tn-1," — ") && s(bbn,tn-2) )
    { l[i]=omo2; Z[445]++; if(dbg){print "Z445"}; continue };

    # escape
    cst="булавка камень коготь копье магазин обойма очередь паста пуля рожок язык";
    cst1="выпустить высадить запустить засадить";
    if ( bw(tn-3,cst1) &&
          q(tn-2,"qik_vi prl_vi mest_vi") &&
         bw(tn-1,cst) && s(tn-3,tn-1) )
    { l[i]=omo2; Z[446]++; if(dbg){print "Z446"}; continue };
    if ( bw(tn-2,cst1) &&
         bw(tn-1,cst) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[447]++; if(dbg){print "Z447"}; continue };
    if ( bw(tn-1,cst1) && s(-1) &&
         bw(1,cst) && s(0) )
    { l[i]=omo2; Z[448]++; if(dbg){print "Z448"}; continue };
    if ( bw(tn-1,cst1) &&
          q(1,"mest_vi prl_vi qik_vi") &&
         bw(2,cst) && s(tn-1,1) )
    { l[i]=omo2; Z[449]++; if(dbg){print "Z449"}; continue };
    # escape


    #
    cst="всадить въехать загнать заехать засадить захватить провести";
    cst1="затвор коленка колено кулак локоть нога рука шея";
    if ( bb(tn-5,tn-2,cst1) && s(bbn,tn-1) &&
         bw(tn-1,cst) )
    { l[i]=omo2; Z[450]++; if(dbg){print "Z450"}; continue };
    if ( bb(tn-5,tn-2,cst) && s(bbn,tn-1) &&
         bb(bbn-1,tn-1,cst1) )
    { l[i]=omo2; Z[451]++; if(dbg){print "Z451"}; continue };
    if ( bw(tn-3,cst) &&
          q(tn-2,"mest_vi mest_3e suw_vi") &&
         bw(tn-1,cst1) && s(tn-3,tn-1) )
    { l[i]=omo2; Z[452]++; if(dbg){print "Z452"}; continue };

    # поиск по "надо нужно"
    wb(tn-5,tn-1,"надо нужно"); wb_n=wbn; wf(1,5,"надо нужно"); wf_n = wfn;

    if ( vgle(wb_n,tn-5,tn-1) &&
          qir(wb_n+1,tn-1,"gl_aux_be mest_da suw_da nar_srav nar_napr") && s(wb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[453]++; if(dbg){print "Z453"}; continue };
    if ( vgle(wb_n,tn-5,tn-1) &&
       pre_pr(wb_n+1) &&
          qir(wb_n+2,tn-2,"prl_pr mest_pr mest_3e prq_pr") &&
            q(tn-1,"suw_pr suw_edne isname") && s(wb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[454]++; if(dbg){print "Z454"}; continue };
    if ( vgle(wf_n,1,5) &&
          qir(1,wf_n-1,"gl_aux_be mest_da suw_da nar_srav nar_napr mest_vi mest_3e qast_ne") && s(0,wf_n-1) )
    { l[i]=omo1; Z[455]++; if(dbg){print "Z455"}; continue };
    cst="будет было ведь все и не равно тоже";
    if ( vgle(wf_n,1,5) &&
          wir(1,wf_n-1,cst) && s(0,wf_n-1) )
    { l[i]=omo1; Z[456]++; if(dbg){print "Z456"}; continue };
    if ( vgle(wf_n,2,5) &&
            q(1,"suw_da mest_da suw_vi mest_vi mest_3e") &&
          wir(2,wf_n-1,cst) && s(0,wf_n-1) )
    { l[i]=omo1; Z[457]++; if(dbg){print "Z457"}; continue };


    # _gl_v_castle-iv: begin
    # _lock_parts:start - части замка́
    #  escape1
    if ( bba(tn-5,tn-2,"_gl_v_castle-iv") &&
         qir(bbn+1,tn-2,"prl_any prq_any mest_any") &&
          ba(tn-1,"_lock_parts") && s(bbn,tn-1) )
    { l[i]=omo2; Z[458]++; if(dbg){print "Z458"}; continue };
    if ( ba(tn-4,"_gl_v_castle-iv") &&
         ba(tn-3,"_lock_parts") &&
          q(tn-2,"suw_ro") &&
          q(tn-1,"nar_napr") && s(tn-4,tn-1) )
    { l[i]=omo2; Z[459]++; if(dbg){print "Z459"}; continue };
    if ( ba(tn-4,"_gl_v_castle-iv") &&
          q(tn-3,"suw_ro") &&
         ba(tn-2,"_lock_parts") &&
          q(tn-1,"nar_napr") && s(tn-4,tn-1) )
    { l[i]=omo2; Z[460]++; if(dbg){print "Z460"}; continue };

    #
    cst="лезть попадать попасть";
    if ( bb(tn-5,tn-2,cst) &&
        qir(bbn+1,tn-2,"qast nar_any") &&
        (ba(tn-1,"_lock_parts")||w(tn-1,"им")) && s(bbn,tn-1) )
    { l[i]=omo2; Z[461]++; if(dbg){print "Z461"}; continue };
    if ( bb(tn-6,tn-3,cst) &&
        qir(bbn+1,tn-3,"qast nar_any") &&
         ba(tn-2,"_lock_parts") &&
          q(tn-1,"suw_ro") && s(bbn,tn-1) )
    { l[i]=omo2; Z[462]++; if(dbg){print "Z462"}; continue };
    if ( bw(tn-1,cst) &&
        bfa(1,4,"_lock_parts") &&
        qir(1,bfn-1,"prl_tv mcop_tv prq_vi") && s(tn-1,bfn-1) )
    { l[i]=omo2; Z[463]++; if(dbg){print "Z463"}; continue };
    # _lock_parts:end

    # _gl_v_castle-iv: escape2
    cst="попадать попасть";
    if ( bw(tn-4,cst) &&
          q(tn-3,"suw_im mest_im isname") &&
     pre_da(tn-2) &&
          q(tn-1,"mest_da suw_da isname") && s(tn-4,tn-1) )
    { l[i]=omo1; Z[464]++; if(dbg){print "Z464"}; continue };
    cst="вынести открывать снести";
    cst1="выстрелом пинком пулей ударом";
    if ( bw(tn-3,cst) &&
          q(tn-2,"nar_any mest_vi mest_3e suw_vi") &&
          w(tn-1,cst1) && s(tn-3,tn-2) && zs(tn-1) )
    { l[i]=omo2; Z[465]++; if(dbg){print "Z465"}; continue };
    if ( bw(tn-4,cst) &&
          q(tn-3,"nar_any mest_vi mest_3e suw_vi") &&
          q(tn-2,"prl_tv mest_tv mest_3e prq_tv") &&
          w(tn-1,cst1) && s(tn-4,tn-2) && zs(tn-1) )
    { l[i]=omo2; Z[466]++; if(dbg){print "Z466"}; continue };
    cst="впустить пропустить";
    if ( bw(tn-3,cst) &&
          q(tn-2,"prl_vi prl_im mest_vi mest_im mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") &&
          q(tn-1,"suw_vi suw_im mest_vi suw_edne mest_im mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") &&
          s(tn-3,tn-2) && zs(tn-1) && z(0) &&
         ba(1,"_lock_pe") &&
         ba(2,"_lock_parts") && s(1) )
    { l[i]=omo2; Z[467]++; if(dbg){print "Z467"}; continue };

    cst="айда бегом брысь верхом домой надо надолго немедленно нужно обратно пешком ползком пора сюда";
    if ( w(tn-1,cst) &&
       (zs(tn-1)||sc(tn-1,"—")) )
    { l[i]=omo1; Z[468]++; if(dbg){print "Z468"}; continue };
    if ( w(1,cst) && s(0) )
    { l[i]=omo1; Z[469]++; if(dbg){print "Z469"}; continue };


    # _gl_v_castle-iv: main
    # поиск по _gl_v_castle-iv
    bba(tn-8,tn-1,"_gl_v_castle-iv"); bfa(tn-8,tn-1,"_gl_v_castle-iv"); bb_n = bbn; bf_n = bfn;

    if ( vgle(bb_n,tn-8,tn-3) &&
            q(bb_n+1,"prl_vi mest_vi mest_3e prq_vi qik_vi digits") &&
            q(bb_n+2,"suw_vi mest_vi mest_3e") &&
          qir(bb_n+3,tn-1,"prl_kred_sr nar_any qast") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[470]++; if(dbg){print "Z470"}; continue };
    if ( vgle(bb_n,tn-5,tn-2) &&
          qir(bb_n+1,tn-2,"prl_im prq_im mest_im") &&
            q(tn-1,"suw_im name_im_sy") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[471]++; if(dbg){print "Z471"}; continue };
    if ( vgle(bb_n,tn-7,tn-3) &&
          qir(bb_n+1,tn-3,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi") &&
            q(tn-2,"suw_vi mest_vi mest_3e suw_mnsq prq_vi qis_vi isname") &&
            q(tn-1,"nar_any") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[472]++; if(dbg){print "Z472"}; continue };
    if ( vvb(tn-5,tn-1) && vgle(bb_n,tn-8,tn-2) &&
           q(bb_n+1,"prq_vi suw_vi mest_vi mest_3e") &&
         qir(bb_n+2,vvn,"suw_vi mest_vi mest_3e suw_mnsq qis_vi isname") && s(bb_n,vvn-1) )
    { l[i]=omo1; Z[473]++; if(dbg){print "Z473"}; continue }; #check
    if ( vgle(bb_n,tn-5,tn-2) &&
            q(bb_n+1,"prq_vi suw_vi mest_vi mest_3e") &&
          qir(bb_n+2,tn-1,"suw_vi mest_vi mest_3e suw_mnsq qis_vi isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[474]++; if(dbg){print "Z474"}; continue }; #check
    if ( vgle(bb_n,tn-6,tn-2) &&
          qiz(bb_n+1,tn-2,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any gl_in qast_any","mest_da") &&
            q(tn-1,"suw_vi mest_vi mest_3e suw_mnsq qis_vi qast name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[475]++; if(dbg){print "Z475"}; continue };
    if ( vgle(bf_n,tn-8,tn-2) && vv(bf_n,bf_n+7) &&
          qir(vvn+1,tn-2,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any gl_in qast sz") &&
            q(tn-1,"suw_vi mest_vi mest_3e suw_mnsq qis_vi qast name_vi_sy isname") && s(vvn+1,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[476]++; if(dbg){print "Z476"}; continue };
    if ( vvb(tn-5,tn-1) && !bfa(vvn+1,tn-1,"_gl_v_lock-iv") &&
         bba(vvn-6,vvn,"_gl_v_castle-iv") &&
         qir(bb_n+1,vvn-1,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any gl_in qast") &&
           q(vvn-1,"suw_vi mest_vi mest_3e suw_mnsq qis_vi qast name_vi_sy isname") && s(bbn,vvn-1) )
    { l[i]=omo1; Z[477]++; if(dbg){print "Z477"}; continue };
    if ( vgle(bb_n,tn-5,tn-2) &&
          qia(bb_n+1,tn-2,"qast","mest_vi prq_vi suw_vi prl_im mest_3e qast_any nar_any name_vi_sy isname") &&
            q(tn-1,"suw_im suw_edne mest_im name_vi_sy isname qast prl_vi mest_vi") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[478]++; if(dbg){print "Z478"}; continue };
    if ( vgle(bb_n,tn-5,tn-2) &&
            q(bb_n+1,"suw_im suw_edne mest_im name_vi_sy isname qast_any prl_vi mest_vi") &&
          qir(bb_n+2,tn-1,"mest_vi prq_vi suw_vi prl_im mest_3e qast_any nar_any name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[479]++; if(dbg){print "Z479"}; continue };
    if ( vgle(bb_n,tn-6,tn-3) &&
          qir(bb_n+1,tn-3,"mest_vi prq_vi suw_vi mest_3e name_vi_sy isname nar_any qast") &&
            q(tn-2,"suw_im suw_edne mest_im name_vi_sy isname") &&
            q(tn-1,"nar_any") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[480]++; if(dbg){print "Z480"}; continue };
    if ( vgle(bb_n,tn-6,tn-2) &&
            q(bb_n+1,"suw_vi suw_edne isname nar_any") &&
          qir(bb_n+2,tn-1,"suw_ro prq_ro suw_edne isname nar_any") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[481]++; if(dbg){print "Z481"}; continue };
    if ( vgle(bb_n,tn-5,tn-2) &&
          qir(bb_n+1,tn-2,"prl_tv mest_tv mest_3e suw_tv prq_tv gl_in prl_kred_sr nar_any qast name_tv_sy isname") &&
            q(tn-1,"suw_tv mest_tv prq_tv prl_tv suw_edne mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[482]++; if(dbg){print "Z482"}; continue };
    if ( vgle(bb_n,tn-5,tn-2) &&
            q(bb_n+1,"suw_tv mest_tv prq_tv prl_tv suw_edne mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") &&
          qir(bb_n+2,tn-2,"prl_vi mest_vi mest_3e suw_vi prq_vi gl_in prl_kred_sr nar_any qast name_tv_sy isname") &&
            q(tn-1,"suw_vi mest_vi mest_3e name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[483]++; if(dbg){print "Z483"}; continue };
    if ( vgle(bb_n,tn-6,tn-2) &&
            q(bb_n+1,"suw_vi mest_vi mest_3e name_vi_sy isname") &&
          qir(bb_n+2,tn-2,"prl_tv mest_tv mest_3e gl_in prl_kred_sr nar_any qast name_tv_sy isname") &&
            q(tn-1,"suw_tv mest_tv prq_tv prl_tv suw_edne mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[484]++; if(dbg){print "Z484"}; continue };
    if ( vgle(bb_n,tn-6,tn-2) &&
          qir(bb_n+1,tn-2,"prl_vi prq_vi mest_vi mest_3e") &&
            q(tn-1,"suw_im suw_edne mest_vi mest_im mest_3e name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[485]++; if(dbg){print "Z485"}; continue };
    if ( vgle(bb_n,tn-6,tn-2) &&
          qir(bb_n+1,tn-2,"prl_da mest_da prq_da gl_in nar_any qast_any") &&
            q(tn-1,"mest_da suw_da prq_da suw_edne isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[486]++; if(dbg){print "Z486"}; continue };
    if ( vgle(bb_n,tn-6,tn-2) &&
            q(bb_n+1,"mest_da suw_da suw_edne isname") &&
          qir(bb_n+2,tn-2,"prl_vi mest_vi prq_vi nar_any qast_any") &&
            q(tn-1,"suw_vi suw_edne mest_vi mest_3e nar_napr") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[487]++; if(dbg){print "Z487"}; continue };
    if ( vgle(bb_n,tn-6,tn-2) &&
          qir(bb_n+1,tn-3,"prl_vi mest_vi prq_vi nar_any qast_any") &&
            q(tn-2,"suw_vi suw_edne mest_vi mest_3e nar_napr") &&
            q(tn-1,"mest_da suw_da suw_edne isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[488]++; if(dbg){print "Z488"}; continue };
    if ( vgle(bb_n,tn-6,tn-2) &&
          qir(bb_n+1,tn-2,"prl_ro mest_ro prq_ro nar_any qast_any") &&
            q(tn-1,"mest_ro suw_ro prq_ro suw_edne nar_any isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[489]++; if(dbg){print "Z489"}; continue };

    if ( vgle(bb_n,tn-6,tn-2) &&
            q(bb_n+1,"suw_vi suw_edne mest_vi mest_3e") &&
          qir(bb_n+2,tn-1,"prl_ro prq_ro mest_ro suw_mnsq mest_3e suw_ro prl_kred_sr") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[490]++; if(dbg){print "Z490"}; continue };
    if ( vgle(bb_n,tn-7,tn-3) &&
          qir(bb_n+1,tn-3,"prl_vi prq_vi mest_vi mest_3e") &&
            q(tn-2,"suw_vi suw_edne") &&
            q(tn-1,"suw_ro prl_kred_sr") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[491]++; if(dbg){print "Z491"}; continue };

    if ( vgle(bb_n,tn-6,tn-3) &&
            q(bb_n+1,"suw_vi suw_edne mest_vi mest_3e") &&
          qir(bb_n+2,tn-2,"prl_da prq_da mest_da mest_3e") &&
            q(tn-1,"suw_da isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[492]++; if(dbg){print "Z492"}; continue };
    if ( vgle(bb_n,tn-5,tn-2) &&
          qir(bb_n+1,tn-2,"prl_da prq_da mest_da mest_3e") &&
            q(tn-1,"suw_da mest_da") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[493]++; if(dbg){print "Z493"}; continue };
    if ( vgle(bb_n,tn-4,tn-2) &&
          qir(bb_n+1,tn-1,"gl_in gl_aux_be qast_any") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[494]++; if(dbg){print "Z494"}; continue };
    if ( vgle(bb_n,tn-1,tn-1) && zs(tn-1) )
    { l[i]=omo1; Z[495]++; if(dbg){print "Z495"}; continue };
    if ( vvb(tn-5,tn-1) && vgle(bb_n,vvn,vvn) )
    { l[i]=omo1; Z[496]++; if(dbg){print "Z496"}; continue };

    # поиск по sz_iili + _gl_v_castle-iv
    qb(tn-6,tn-2,"sz_iili"); bba(qbn-6,qbn-2,"_gl_v_castle-iv"); qb_n=qbn; bb_n=bbn;

    if ( vgle(qb_n,tn-6,tn-2) && vgle(bb_n,qb_n-6,qb_n-2) &&
            s(bb_n,qb_n-3) && zs(qb_n-2) && s(qb_n-1,tn-2) && zs(tn-1) &&
          qir(bb_n+1,qb_n-1,"prl_vi mest_vi suw_vi suw_edne mest_3e prq_vi qast_any qis_vi qik_vi name_vi_sy isname") &&
          qir(qb_n+1,tn-1,"prl_vi mest_vi suw_vi suw_edne mest_3e prq_vi qast_any nar_any qis_vi qik_vi prq_vi name_vi_sy isname") )
    { l[i]=omo1; Z[497]++; if(dbg){print "Z497"}; continue };
    if ( vgle(qb_n,tn-6,tn-2) && vgle(bb_n,qb_n-6,qb_n-2) &&
          qir(bb_n+1,qb_n-2,"prl_vi mest_vi suw_vi suw_edne mest_3e prq_vi qis_vi qik_vi name_vi_sy isname") &&
          qir(qb_n+1,tn-3,"prl_vi mest_vi suw_vi suw_edne mest_3e prq_vi qis_vi qik_vi prq_vi name_vi_sy isname") &&
            q(qb_n-1,"suw_vi mest_vi suw_edne mest_3e prq_vi qast name_vi_sy isname") &&
            q(tn-2,"suw_vi mest_vi suw_edne mest_3e prq_vi qast name_vi_sy isname") &&
            q(tn-1,"nar_any gl_in") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[498]++; if(dbg){print "Z498"}; continue };
    if ( vgle(qb_n,tn-6,tn-2) && vgle(bb_n,qb_n-6,qb_n-2) &&
            q(bb_n+1,"nar_any gl_in") &&
          qir(bb_n+2,qb_n-2,"prl_vi mest_vi suw_vi suw_edne mest_3e prq_vi qis_vi qik_vi name_vi_sy isname") &&
          qir(qb_n+1,tn-2,"prl_vi mest_vi suw_vi suw_edne mest_3e prq_vi qis_vi qik_vi prq_vi name_vi_sy isname") &&
            q(qb_n-1,"suw_vi mest_vi suw_edne mest_3e prq_vi qast name_vi_sy isname") &&
            q(tn-1,"suw_vi mest_vi suw_edne mest_3e prq_vi qast name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[499]++; if(dbg){print "Z499"}; continue };
    if ( vgle(qb_n,tn-6,tn-2) && vgle(bb_n,qb_n-6,qb_n-2) &&
          qir(bb_n+1,qb_n-1,"prl_im mest_im suw_im suw_edne mest_3e prq_im qis_im qik_im qast_any name_im_sy isname") &&
          qir(qb_n+1,tn-1,"prl_im mest_im suw_im suw_edne mest_3e prq_im prq_im nar_any qis_im qik_im name_im_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[500]++; if(dbg){print "Z500"}; continue };


    # поиск по pre_da + _gl_v_castle-iv: qb_n и bb_n
    qb(tn-6,tn-2,"pre_da"); bba(qbn-9,qbn-1,"_gl_v_castle-iv"); qb_n=qbn; bb_n=bbn;

    if ( vgle(bb_n,qb_n-5,qb_n-1) && vgle(qb_n,tn-5,tn-2) &&
          qir(qb_n+1,qb_n-1,"nar_any prl_kred_sr qast prl_vi mest_vi prq_vi suw_vi mest_3e suw_im suw_edne mest_im isname") &&
          qir(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-1,"mest_da suw_da suw_edne prq_da isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[501]++; if(dbg){print "Z501"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-3) &&
          qir(qb_n+1,qb_n-1,"nar_any prl_kred_sr qast prl_vi mest_vi prq_vi suw_vi mest_3e suw_im suw_edne mest_im isname") &&
          qir(qb_n+1,tn-3,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-2,"mest_da suw_da suw_edne prq_da isname") &&
            q(tn-1,"nar_any") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[502]++; if(dbg){print "Z502"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
            q(bb_n+1,"suw_vi mest_vi mest_3e qis_vi qik_vi") &&
          qir(bb_n+2,qb_n-1,"suw_ro suw_edne nar_any isname") &&
          qir(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-1,"mest_da suw_da suw_edne isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[503]++; if(dbg){print "Z503"}; continue };
    if ( vgle(bb_n,qb_n-7,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qir(bb_n+1,qb_n-3,"prl_vi mest_vi mest_3e prq_vi") &&
            q(qb_n-2,"suw_vi mest_vi mest_3e qis_vi qik_vi") &&
            q(qb_n-1,"suw_ro suw_edne nar_any isname") &&
          qir(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-1,"mest_da suw_da suw_edne isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[504]++; if(dbg){print "Z504"}; continue };
    if ( vgle(bb_n,qb_n-7,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
            q(bb_n+1,"nar_vrem prl_kred_sr qast mest_vi suw_vi mest_3e isname") &&
       pre_vi(bb_n+2) &&
          qir(bb_n+3,qb_n-2,"prl_vi mest_vi mest_3e prq_vi") &&
            q(qb_n-1,"mest_vi suw_vi suw_edne") &&
          qir(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-1,"suw_da mest_da") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[505]++; if(dbg){print "Z505"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
       pre_vi(bb_n+1) &&
          qir(bb_n+2,qb_n-2,"prl_vi mest_vi mest_3e prq_vi") &&
            q(qb_n-1,"mest_vi suw_vi suw_edne") &&
          qir(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-1,"suw_da mest_da") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[506]++; if(dbg){print "Z506"}; continue };
    if ( vgle(bb_n,qb_n-9,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
           qb(qb_n-5,qb_n-2,"sz_iili") &&
          qir(bb_n+1,qbn-2,"prl_vi mest_vi mest_3e prq_vi") &&
            q(qbn-1,"suw_vi mest_vi suw_edne mest_3e isname") &&
          qir(qbn+1,qb_n-2,"prl_vi mest_vi mest_3e prq_vi") &&
            q(qb_n-1,"suw_vi mest_vi suw_edne mest_3e isname") &&
          qir(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-1,"mest_da suw_da prq_da isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[507]++; if(dbg){print "Z507"}; continue };
    if ( vgle(bb_n,qb_n-9,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qir(bb_n+1,qb_n-2,"prl_vi mest_vi mest_3e prq_vi") &&
            q(qb_n-2,"suw_vi mest_vi suw_edne mest_3e isname") &&
            q(qb_n-1,"sz_iili") &&
          qir(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-1,"mest_da suw_da prq_da isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[508]++; if(dbg){print "Z508"}; continue };
    if ( vgle(bb_n,qb_n-9,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
           qb(bb_b+1,qn_n-2,"pre_tv") &&
          qir(bb_n+1,qbn-1,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            q(qbn-1,"suw_vi mest_vi suw_edne mest_3e isname") &&
          qir(qbn+1,qb_n-2,"prl_tv mest_tv suw_tv mest_3e prq_tv prl_kred_sr qik_tv nar_any isname") &&
            q(qb_n-1,"mest_tv suw_tv suw_edne isname") &&
          qir(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-1,"suw_da mest_da isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[509]++; if(dbg){print "Z509"}; continue };
    if ( vgle(bb_n,qb_n-9,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
           qb(bb_b+1,qn_n-2,"pre_ro") &&
          qir(bb_n+1,qbn-1,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            q(qbn-1,"suw_vi mest_vi suw_edne mest_3e isname") &&
          qir(qbn+1,qb_n-2,"prl_ro mest_ro suw_ro mest_3e prq_ro prl_kred_sr qik_ro nar_any isname") &&
            q(qb_n-1,"mest_ro suw_ro suw_edne isname") &&
          qir(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            q(tn-1,"suw_da mest_da isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[510]++; if(dbg){print "Z510"}; continue };

    # поиск по pre_tv + _gl_v_castle-iv: qb_n и bb_n
    qb(tn-7,tn-2,"pre_tv"); bba(qbn-9,qbn-1,"_gl_v_castle-iv"); qb_n=qbn; bb_n=bbn;

    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qir(bb_n+1,qb_n-1,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qir(qb_n+1,tn-2,"prl_tv mest_tv suw_tv mest_3e prq_tv prl_kred_sr qik_tv nar_any isname") &&
            q(tn-1,"mest_tv suw_tv prq_tv suw_edne isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[511]++; if(dbg){print "Z511"}; continue };
    if ( vgle(qb_n,tn-6,tn-2) &&
          vvb(qb_n-5,qb_n-1) &&
          bba(qbn-9,qbn-1,"_gl_v_castle-iv") && s(bbn+1,vvn-1) &&
          qir(bbn+1,vvn,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qir(qb_n+1,tn-2,"prl_tv mest_tv suw_tv mest_3e prq_tv prl_kred_sr qik_tv nar_any isname") &&
            q(tn-1,"mest_tv suw_tv prq_tv suw_edne isname") && s(qb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[512]++; if(dbg){print "Z512"}; continue };
     if ( vgle(bb_n,qb_n-7,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
             q(bb_n+1,"pre_tv") &&
           qir(bb_n+2,qb_n-1,"suw_tv mest_tv prl_tv mest_3e qis_tv nar_any prl_kred_sr isname qast_any") &&
           qir(qb_n+1,tn-2,"prl_tv mest_tv suw_tv mest_3e prq_tv prl_kred_sr qik_tv nar_any isname") &&
             q(tn-1,"mest_tv suw_tv prq_tv suw_edne isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[513]++; if(dbg){print "Z513"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) && hwy(bb_n+1,"ка") &&
          qir(bb_n+1+hyn,qb_n-1,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qir(qb_n+1,tn-2,"prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
            q(tn-1,"mest_tv suw_tv suw_edne isname") && s(bb_n+hyn,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[514]++; if(dbg){print "Z514"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qir(bb_n+1,qb_n-1,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qir(qb_n+1,tn-3,"prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
            q(tn-2,"mest_tv suw_tv suw_edne isname") &&
            q(tn-1,"suw_ro suw_edne") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[515]++; if(dbg){print "Z515"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qir(bb_n+1,qb_n-1,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            q(qb_n+1,"mest_tv suw_tv suw_edne isname") &&
          qir(qb_n+2,tn-2,"prl_ro mest_ro mest_3e prq_ro") &&
            q(tn-1,"suw_ro suw_edne") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[516]++; if(dbg){print "Z516"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qir(qb_n+1,tn-3,"prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
            q(tn-2,"mest_tv suw_tv suw_edne isname") &&
            q(tn-1,"nar_any prl_kred_sr") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[517]++; if(dbg){print "Z517"}; continue };
    if ( vgle(bb_n,qb_n-9,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
           qb(bb_n+1,qn_n-1,"sz_iili") &&
          qir(bb_n+1,qbn-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qir(qbn+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qir(qb_n+1,tn+1,"suw_tv suw_edne isname prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[518]++; if(dbg){print "Z518"}; continue };
    if ( vgle(bb_n,qb_n-9,qb_n-1) && vgle(qb_n,tn-7,tn-2) &&
           qb(qb_n+1,tn-1,"sz_iili") && s(bb_n,qbn-3) && zs(qbn-2) &&
          qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qir(qb_n+1,qbn-1,"suw_tv suw_edne isname prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
          qir(qbn+1,tn-1,"suw_tv suw_edne isname prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") && s(qbn-1,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[519]++; if(dbg){print "Z519"}; continue };


    # поиск по pre_pr + _gl_v_castle-iv: qb_n и bb_n
    qb(tn-7,tn-2,"pre_pr"); bba(qbn-6,qbn-1,"_gl_v_castle-iv"); qb_n=qbn; bb_n=bbn;

    if ( vgle(bb_n,qb_n-5,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            q(qb_n+1,"suw_pr") &&
          qir(qb_n+2,tn-2,"prl_vi prq_vi mest_vi mest_3e qik_vi") &&
            q(tn-1,"suw_vi suw_edne") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[520]++; if(dbg){print "Z520"}; continue };
    if ( vgle(bb_n,qb_n-5,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
           qf(qb_n+1,tn-1,"sz_iili") &&
          qir(qb_n+1,qfn-2,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
          qir(qfn+1,tn-2,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
            q(qfn-1,"suw_pr") &&
            q(tn-1,"suw_pr") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[521]++; if(dbg){print "Z521"}; continue };
    if ( vgle(bb_n,qb_n-5,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            q(qb_n+1,"suw_pr suw_edne") &&
           qf(qb_n+3,tn-1,"sz_iili") &&
          qir(qb_n+2,qfn-2,"prl_ro prq_ro mest_ro mest_3e qik_ro") &&
          qir(qfn+1,tn-2,"prl_ro prq_ro mest_ro mest_3e qik_ro") &&
            q(qfn-1,"suw_ro") &&
            q(tn-1,"suw_ro") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[522]++; if(dbg){print "Z522"}; continue };
    if ( vgle(bb_n,qb_n-5,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qir(qb_n+1,tn-2,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
            q(tn-1,"mest_pr suw_pr suw_edne") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[523]++; if(dbg){print "Z523"}; continue };
    if ( vgle(bb_n,qb_n-5,qb_n-1) && vgle(qb_n,tn-6,tn-3) &&
          qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qir(qb_n+1,tn-3,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
            q(tn-2,"suw_pr suw_edne") &&
            q(tn-1,"suw_ro suw_edne nar_any") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[524]++; if(dbg){print "Z524"}; continue };
    if ( vgle(bb_n,qb_n-5,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            q(qb_n+1,"suw_pr suw_edne") &&
          qir(qb_n+2,tn-1,"suw_ro suw_edne nar_any prl_ro prq_ro") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[525]++; if(dbg){print "Z525"}; continue };
    if ( vgle(bb_n,qb_n-5,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
       pre_tv(bb_n+1) &&
          qir(qb_n+2,qb_n-2,"prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
            q(qb_n-1,"mest_tv suw_tv suw_edne isname") &&
          qir(qb_n+1,tn-2,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
            q(tn-1,"mest_pr suw_pr suw_edne isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[526]++; if(dbg){print "Z526"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) && hwy(bb_n+1,"ка") &&
       pre_tv(bb_n+1+hyn) &&
          qir(bb_n+2+hyn,qb_n-2,"prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
            q(qb_n-1,"mest_tv suw_tv suw_edne isname") &&
          qir(qb_n+1,tn-2,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
            q(tn-1,"mest_pr suw_pr suw_edne isname") && s(bb_n+hyn,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[527]++; if(dbg){print "Z527"}; continue };

    # поиск по pre_vi + _gl_v_castle-iv: qb_n и bb_n
    qb(tn-9,tn-2,"pre_vi"); bba(qbn-7,qbn-1,"_gl_v_castle-iv"); qb_n=qbn; bb_n=bbn;

    if ( vgle(bb_n,qb_n-7,qb_n-1) && vgle(qb_n,tn-9,tn-2) && hwy(bb_n+1,"ка") &&
          qir(bb_n+1+hyn,qb_n-1,"nar_any suw_im suw_ro suw_vi prl_vi mest_vi prq_vi mest_3e mest_impe suw_edne suw_mnsq isname") &&
          qir(qb_n+1+hyn,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") && s(bb_n+hyn,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[528]++; if(dbg){print "Z528"}; continue };
    if ( vgle(bb_n,qb_n-7,qb_n-1) && vgle(qb_n,tn-9,tn-2) &&
           qb(bb_n+1,qb_n-1,"pre_da") &&
          qir(bb_n+1,qbn-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qir(qbn+1,qb_n-1,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
          qir(qb_n+1,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[529]++; if(dbg){print "Z529"}; continue };
    if ( vgle(bb_n,qb_n-7,qb_n-1) && vgle(qb_n,tn-9,tn-2) &&
           qb(bb_n+1,qb_n-1,"pre_ro") &&
          qir(bb_n+1,qbn-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qir(qbn+1,qb_n-1,"suw_ro prl_ro mest_ro mest_3e prq_ro prl_kred_sr nar_any isname") &&
          qir(qb_n+1,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[530]++; if(dbg){print "Z530"}; continue };

    if ( vgle(bb_n,qb_n-7,qb_n-1) && vgle(qb_n,tn-9,tn-2) &&
           qb(qb_n+1,tn-1,"sz_iili") &&
          qir(bbn+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qir(qb_n+1,qbn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") &&
          qir(qbn+1,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[531]++; if(dbg){print "Z531"}; continue };

    qb(qb_n+1,tn-1,"sz_iili"); qi_n=qbn; qsf(bb_n,qi_n,","); sc_n=sfn;

    if ( vgle(bb_n,qb_n-7,qb_n-1) && vgle(qb_n,tn-9,tn-2) &&
          qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qir(qb_n+1,qi_n-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") &&
          qir(qi_n+1,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[532]++; if(dbg){print "Z532"}; continue };
    if ( vgle(bb_n,qb_n-7,qb_n-1) && vgle(qb_n,tn-9,tn-2) && vgle(sc_n,qb_n,qi_n) &&
          qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
          qir(qb_n+1,sc_n,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") &&
          qir(sc_n+1,qi_n-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") &&
          qir(qi_n+1,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") && s(bb_n,sc_n-1) && s(sc_n+1,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[533]++; if(dbg){print "Z533"}; continue };

    # поиск по pre_ro + _gl_v_castle-iv: qb_n и bb_n
    qb(tn-7,tn-2,"pre_ro"); bba(qbn-6,qbn-1,"_gl_v_castle-iv"); qb_n=qbn; bb_n=bbn;

    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qir(bb_n+1,qb_n-1,"mest_vi suw_vi prl_vi prq_vi mest_3e isname nar_any qast") &&
          qir(qb_n+1,tn-1,"prl_ro mest_ro suw_ro suw_edne prq_ro nar_any qast isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[534]++; if(dbg){print "Z534"}; continue };
    if ( vgle(bb_n,qb_n-6,qb_n-1) && vgle(qb_n,tn-6,tn-2) &&
          qir(bb_n+1,qb_n-1,"mest_im suw_im prl_im prq_im mest_3e isname nar_any qast") &&
          qir(qb_n+1,tn-1,"prl_ro mest_ro suw_ro suw_edne prq_ro nar_any qast isname") && s(bb_n,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[535]++; if(dbg){print "Z535"}; continue };
    if ( vgle(qb_n,tn-6,tn-2) &&
    narph_any(qb_n-1) &&
           ba(xwn-1,"_gl_v_castle-iv") &&
            q(tn-2,"prl_ro mest_ro suw_ro suw_edne prq_ro") &&
            q(tn-1,"mest_ro suw_ro suw_edne") && s(xwn-1,tn-1) )
    { l[i]=omo1; Z[536]++; if(dbg){print "Z536"}; continue };

    # фразы-предлоги

    if ( preph_ro(tn-2) &&
              bba(xwn-4,xwn-1,"_gl_v_castle-iv") &&
              qir(bbn+1,xwn-1,"mest_vi suw_vi prl_vi prq_vi mest_3e isname nar_any qast pre_any") &&
                q(tn-1,"mest_ro suw_ro suw_edne isname") && s(bbn,tn-1) )
    { l[i]=omo1; Z[537]++; if(dbg){print "Z537"}; continue };
    if ( preph_ro(1) && zs(0) &&
                q(xwn+1,"isname") && s(xwn) )
    { l[i]=omo1; Z[538]++; if(dbg){print "Z538"}; continue };
    if ( preph_vi(tn-2) &&
               ba(xwn-1,"_gl_v_castle-iv") &&
                q(tn-1,"mest_vi suw_vi suw_edne") && s(xwn-1,tn-1) )
    { l[i]=omo1; Z[539]++; if(dbg){print "Z539"}; continue };
    if ( preph_da(tn-2) &&
               ba(xwn-1,"_gl_v_castle-iv") &&
                q(tn-1,"mest_da suw_da suw_edne") && s(xwn-1,tn-1) )
    { l[i]=omo1; Z[540]++; if(dbg){print "Z540"}; continue };
    if ( preph_tv(tn-2) &&
               ba(xwn-1,"_gl_v_castle-iv") &&
                q(tn-1,"mest_tv suw_tv suw_edne") && s(xwn-1,tn-1) )
    { l[i]=omo1; Z[541]++; if(dbg){print "Z541"}; continue };

    if ( pre_tv(1) &&
              q(2,"suw_tv") &&
              q(3,"nar_spos") &&
             ba(4,"_gl_v_castle-iv") && s(0,3) )
    { l[i]=omo1; Z[542]++; if(dbg){print "Z542"}; continue };

    bfa(1,6,"_gl_v_castle-iv"); bf_n=bfn;

    if ( vgle(bf_n,1,6) && s(0,bf_n-1) && Qf(1,bf_n,"sz_iili") )
    { l[i]=omo1; Z[543]++; if(dbg){print "Z543"}; continue };
    if ( vgle(bf_n,1,6) && s(0,bf_n-1) &&
          sos(tn-9,tn-1) &&
        !(bba(son,bf_n-2,"_gl_v_lock-iv")||bba(son,tn-1,"_lock_parts") ) &&
           (w(bf_n-1,"и")||
          qxs(bf_n-2,"и","не") ) )
    { l[i]=omo1; Z[544]++; if(dbg){print "Z544"}; continue };


    if ( narph_any(1) &&
                ba(xwn+1,"_gl_v_castle-iv") && s(0,xwn-1) )
    { l[i]=omo1; Z[545]++; if(dbg){print "Z545"}; continue };
    if ( q(1,"suw_im mest_im isname") &&
 narph_any(2) &&
        ba(xwn+1,"_gl_v_castle-iv") && s(0,xwn-1) )
    { l[i]=omo1; Z[546]++; if(dbg){print "Z546"}; continue };

    if ( narph_any(tn-1) &&
                ba(xwn-1,"_gl_v_castle-iv") && s(xnw-1,tn-1) )
    { l[i]=omo1; Z[547]++; if(dbg){print "Z547"}; continue };
    if ( narph_any(tn-2) &&
                ba(xwn-1,"_gl_v_castle-iv") &&
                 q(tn-1,"suw_vi suw_im mest_vi mest_im mest_3e isname nar_any") && s(xnw-1,tn-1) )
    { l[i]=omo1; Z[548]++; if(dbg){print "Z548"}; continue };
    if ( narph_any(tn-1) &&
                ba(xwn-2,"_gl_v_castle-iv") &&
                 q(xwn-1,"suw_vi mest_vi mest_3e isname nar_any") && s(xnw-2,tn-1) )
    { l[i]=omo1; Z[549]++; if(dbg){print "Z549"}; continue };

    # _gl_v_castle-iv: end

    if ( w(1,"к ко") && zs(0) &&
         q(2,"suw_odedda suw_odmnda isname mest_da") && s(1) )
    { l[i]=omo1; Z[550]++; if(dbg){print "Z550"}; continue };
    if ( w(1,"к ко") && zs(0) &&
         q(2,"prl_da prq_da mest_da mest_3e") &&
         q(3,"suw_odedda suw_odmnda isname mest_da") && s(1,2) )
    { l[i]=omo1; Z[551]++; if(dbg){print "Z551"}; continue };
    if ( z(0) &&
         q(1,"sz") &&
         w(2,"к ко") &&
         q(3,"suw_odedda suw_odmnda isname mest_da") && s(1,2) )
    { l[i]=omo1; Z[552]++; if(dbg){print "Z552"}; continue };

    cst="города деревни замка замков";
    if ( w(tn-2,"из") &&
        (w(tn-1,cst)||q(tn-1,"isname")) && s(tn-2,tn-1) &&
      !(bb(tn-6,tn-3,"выстрелить выпалить прицелиться") && s(bbn,tn-3)) )
    { l[i]=omo1; Z[553]++; if(dbg){print "Z553"}; continue };
    cst="города деревни замка замков";
    if ( w(tn-3,"из") &&
        (w(tn-2,cst)||q(tn-2,"isname")) &&
         q(tn-1,"nar_any") && s(tn-3,tn-1) &&
      !(bb(tn-7,tn-4,"выстрелить выпалить прицелиться") && s(bbn,tn-4)) )
    { l[i]=omo1; Z[554]++; if(dbg){print "Z554"}; continue };

    if ( q(tn-2,"mest_da suw_da") &&
         q(tn-1,"mod_ed mod_mn mod_bz") && s(tn-2,tn-1) )
    { l[i]=omo1; Z[555]++; if(dbg){print "Z555"}; continue };

    if ( w(tn-2,"к ко") &&
         q(tn-1,"mest_da suw_da isname") && s(tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[556]++; if(dbg){print "Z556"}; continue };

    # prl как часть сказуемого
    cst="вхожий";
    if ( bw(tn-1,cst) && s(tn-1) )
    { l[i]=omo1; Z[557]++; if(dbg){print "Z557"}; continue };
    if ( bw(1,cst) && s(0) )
    { l[i]=omo1; Z[558]++; if(dbg){print "Z558"}; continue };
    if ( w(1,"не") &&
        bw(2,cst) && s(0,1) )
    { l[i]=omo1; Z[559]++; if(dbg){print "Z559"}; continue };
    if ( q(1,"mest_im suw_im isname prl_kred_sr") &&
        bw(2,cst) && s(0,1) )
    { l[i]=omo1; Z[560]++; if(dbg){print "Z560"}; continue };
    if ( q(1,"mest_im suw_im isname") &&
         w(2,"не") &&
        bw(3,cst) && s(0,2) )
    { l[i]=omo1; Z[561]++; if(dbg){print "Z561"}; continue };
    #
    if ( q(tn-1,"mqast") &&
        ba(xwn-1,"_gl_v_castle-iv") && s(xwn-1) && zs(tn-1) )
    { l[i]=omo1; Z[562]++; if(dbg){print "Z562"}; continue };
    #
    cst="ваш мой наш свой сей тот";
    if ( w(-1,cst) )
    { l[i]=omo1; Z[563]++; if(dbg){print "Z563"}; continue };

  }; # tn_ok=1 << в замок
    #
    if ( ba(-4,"_gl_v_castle-iv") &&
          w(-3,"в") &&
          q(-2,"prq_edmuvi prq_mnvi") &&
          q(-1,"suw_da mest_da prl_da suw_tv prl_tv mest_tv suw_edne isname") && s(-4,-1) )
    { l[i]=omo1; Z[564]++; if(dbg){print "Z564"}; continue }; # без tn!
    if ( ba(-5,"_gl_v_castle-iv") &&
          w(-4,"в") &&
          q(-3,"mest_edmuvi prl_edmuvi") &&
          q(-2,"prq_edmuvi prq_mnvi") &&
          q(-1,"suw_da mest_da prl_da suw_tv prl_tv mest_tv suw_edne isname") && s(-5,-1) )
    { l[i]=omo1; Z[565]++; if(dbg){print "Z565"}; continue }; # без tn!
    if ( ba(-3,"_gl_v_castle-iv") &&
          w(-2,"в") &&
          q(-1,"mest_vip3e mest_vi") && s(-3,-1) )
    { l[i]=omo1; Z[566]++; if(dbg){print "Z566"}; continue }; # без tn!

    tn_ok=""
  }; # в замок
  ######################################################################################################
  # на замок
  if ( wb(-5,-1,"на") && s(wbn,-1) ) {
   # адрес поискового токена, в данном случае — "на"
   DEFINE_TN_OK_PREVI_ZAMOK("на")

   if ( vis(tn_ok) ) {

    if ( w(tn-1,"как") && z(0) &&
       qxw(1,"так","и","на") &&
       bfa(xwn+1,xwn+4,"_castle_environs") &&
       qir(xwn+1,bfn-1,"prl_vi mest_vi mest_3e prq_vi") && s(xwn,bfn-1) )
    { l[i]=omo1; Z[567]++; if(dbg){print "Z567"}; continue };

    if ( qxs(tn-1,"не","только") && z(0) &&
         qxw(1,"но","и","на") &&
         bfa(xwn+1,xwn+4,"_locklike_things") &&
         qir(xwn+1,bfn-1,"prl_vi mest_vi mest_3e prq_vi") && s(xwn,bfn-1) )
    { l[i]=omo2; Z[568]++; if(dbg){print "Z568"}; continue };

    cst="пасти пасть";
    if ( w(tn-1,cst) && s(tn-1) )
    { l[i]=omo2; Z[569]++; if(dbg){print "Z569"}; continue };

    cst="брать взять прокладывать проложить";
    cst1="кредит курс";
    if ( bb(tn-6,tn-2,cst) &&
        qir(bbn+1,tn-2,"prl_vi mest_vi") &&
          w(tn-1,cst1) && s(tn-2,tn-1) )
    { l[i]=omo1; Z[570]++; if(dbg){print "Z570"}; continue };

    if ( bw(tn-2,"раскатать") &&
          w(tn-1,"губу губы") && s(tn-2,tn-1) )
    { l[i]=omo1; Z[571]++; if(dbg){print "Z571"}; continue };

    cst="наложить";
    cst1="заклинание заклятие защита лапа чара";
    cst2="форма";
    if ( bw(tn-1,cst) && s(tn-1) &&
         bw(1,cst1) && s(0) )
    { l[i]=omo1; Z[572]++; if(dbg){print "Z572"}; continue };
    if ( bw(tn-1,cst) && s(tn-1) &&
          q(1,"prl_vi mest_vi mest_3e") &&
         bw(2,cst1) && s(0,1) )
    { l[i]=omo1; Z[573]++; if(dbg){print "Z573"}; continue };
    if ( bw(tn-1,cst1) && s(tn-1) &&
         bw(1,cst) && s(0) )
    { l[i]=omo1; Z[574]++; if(dbg){print "Z574"}; continue };
    if ( bw(1,cst) && s(0,1) &&
         bw(2,cst1) )
    { l[i]=omo1; Z[575]++; if(dbg){print "Z575"}; continue };
    if ( bw(tn-2,cst) && s(tn-2,tn-1) &&
         bw(tn-1,cst1) )
    { l[i]=omo1; Z[576]++; if(dbg){print "Z576"}; continue };

    if ( bw(tn-1,cst) && s(tn-1) &&
         bw(1,cst2) && s(0) )
    { l[i]=omo2; Z[577]++; if(dbg){print "Z577"}; continue };

    cst="навести";
    cst1="автомат излучатель ладонь лазер мушкет оружие пистолет пушку ружье ствол стволы";
    if ( bb(tn-5,tn-2,cst) && s(bbn,tn-1) &&
        qir(bbn+1,tn-2,"mest_vi prl_vi") &&
          w(tn-1,cst1) )
    { l[i]=omo2; Z[578]++; if(dbg){print "Z578"}; continue };
    if ( bb(tn-5,tn-1,cst) && s(bbn,0) &&
        qir(bbn+1,tn-1,"mest_vi prl_vi") &&
          w(1,cst1) )
    { l[i]=omo2; Z[579]++; if(dbg){print "Z579"}; continue };

    # _gl_na_castle:start
    bba(tn-5,tn-1,"_gl_na_castle"); bb_n=bbn;
    if ( veq(bb_n,tn-1) && s(tn-1) )
    { l[i]=omo1; Z[580]++; if(dbg){print "Z580"}; continue };
    if ( vgle(bb_n,tn-5,tn-1) && s(bb_n,tn-1) &&
          qir(bb_n+1,tn-2,"prl_vi prq_vi mest_vi mest_3e") &&
            q(tn-1,"suw_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[581]++; if(dbg){print "Z581"}; continue };
    if ( vgle(bb_n,tn-5,tn-1) && s(bb_n,tn-1) &&
          qir(bb_n+1,tn-2,"prl_im prq_im mest_im mest_3e") &&
            q(tn-1,"suw_im mest_im mest_3e") )
    { l[i]=omo1; Z[582]++; if(dbg){print "Z582"}; continue };
    if ( vgle(bb_n,tn-5,tn-1) && s(bb_n,tn-1) &&
          qir(bb_n+1,tn-2,"prl_tv prq_tv mest_tv mest_3e") &&
            q(tn-1,"suw_tv mest_tv mest_3e") )
    { l[i]=omo1; Z[583]++; if(dbg){print "Z583"}; continue };

    if ( bfa(1,3,"_gl_na_castle") && s(0,bfn-1) &&
          Xw(bfn,"X_castle_pe") && Qf(1,bfn-1,"sz_iili pre_any") &&
        !bfa(1,bfn-1,"_suw_na_lock") )
    { l[i]=omo1; Z[584]++; if(dbg){print "Z584", bfn}; continue };
    # _gl_na_castle:end

    # _gl_na_lock:start
    #
    qb(tn-7,tn-1,"pre_vi"); bba(qbn-5,qbn-1,"_gl_na_lock"); bb_n=bbn; qb_n=qbn;
    if ( vgle(bb_n,qb_n-5,qb_n-1) && vgle(qb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any prl_kred_sr qast_any") &&
          qir(qb_n+1,tn-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any prl_kred_sr qast_any") )
    { l[i]=omo2; Z[585]++; if(dbg){print "Z585"}; continue };
    if ( vgle(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
          qir(qb_n+1,tn-2,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any prl_kred_sr qast_any") &&
            q(tn-1,"suw_vi mest_vi") )
    { l[i]=omo2; Z[586]++; if(dbg){print "Z586"}; continue };

    qb(tn-7,tn-1,"pre_ro"); bba(qbn-5,qbn-1,"_gl_na_lock"); bb_n=bbn; qb_n=qbn;
    if ( vgle(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any isname qast_any") &&
          qir(qb_n+1,tn-1,"suw_ro prl_ro prq_ro mest_ro mest_3e nar_any prl_kred_sr qast_any") )
    { l[i]=omo2; Z[587]++; if(dbg){print "Z587"}; continue };
#   if ( vgle(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(-1) &&
#         qir(bb_n+1,qb_n-1,"suw_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
#         qir(qb_n+1,tn-2,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any prl_kred_sr qast_any") &&
#           q(tn-1,"suw_vi mest_vi") )
#   { l[i]=omo2; Z[588]++; if(dbg){print "Z588"}; continue };

    qb(tn-7,tn-1,"pre_tv"); bba(qbn-5,qbn-1,"_gl_na_lock"); bb_n=bbn; qb_n=qbn;
    if ( vgle(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
          qir(qb_n+1,tn-1,"suw_tv prl_tv prq_tv mest_tv mest_3e nar_any prl_kred_sr qast_any") )
    { l[i]=omo2; Z[589]++; if(dbg){print "Z589"}; continue };
    if ( vgle(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
            q(qb_n+1,"suw_tv prl_tv prq_tv mest_tv isname") &&
            q(qb_n+2,"suw_vi") &&
          qir(qb_n+3,tn-1,"suw_ro prl_ro prq_ro mest_ro mest_3e nar_any prl_kred_sr qast_any") )
    { l[i]=omo2; Z[590]++; if(dbg){print "Z590"}; continue };

    qb(tn-7,tn-1,"pre_pr"); bba(qbn-5,qbn-1,"_gl_na_lock"); bb_n=bbn; qb_n=qbn;
    if ( vgle(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
          qir(qb_n+1,tn-1,"suw_pr prl_pr prq_pr mest_pr mest_3e nar_any prl_kred_sr qast_any") )
    { l[i]=omo2; Z[591]++; if(dbg){print "Z591"}; continue };
    qb(tn-7,tn-1,"pre_pr"); bba(qbn-5,qbn-1,"_gl_na_lock"); bb_n=bbn; qb_n=qbn;
    if ( vgle(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
            q(qb_n+1,"suw_pr") &&
          qir(qb_n+2,tn-1,"suw_ro prl_ro prq_ro mest_ro mest_3e nar_any prl_kred_sr qast_any") )
    { l[i]=omo2; Z[592]++; if(dbg){print "Z592"}; continue };

    #
    bba(tn-7,tn-1,"_gl_na_lock"); bb_n=bbn;
    if ( veq(bb_n,tn-1) && s(tn-1) )
    { l[i]=omo2; Z[593]++; if(dbg){print "Z593"}; continue };
    if ( vgle(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qia(bb_n+1,tn-1,"sz_i","suw_vi prl_vi prq_vi mest_vi mest_3e qast_any prl_kred_sr nar_any") )
    { l[i]=omo2; Z[594]++; if(dbg){print "Z594"}; continue };
    if ( vgle(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qir(bb_n+1,tn-1,"suw_im isname prl_im prq_im mest_im mest_3e qast nar_any prl_kred_sr") )
    { l[i]=omo2; Z[595]++; if(dbg){print "Z595"}; continue };
    if ( vgle(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            q(bb_n+1,"suw_vi isname prl_vi prq_vi mest_vi mest_3e qast_any nar_any prl_kred_sr") &&
          qir(bb_n+2,tn-1,"suw_ro suw_edne prl_ro mest_ro") )
    { l[i]=omo2; Z[596]++; if(dbg){print "Z596"}; continue };
    if ( vgle(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qir(bb_n+1,tn-1,"suw_tv isname prl_tv prq_tv mest_tv mest_3e qast_any nar_any prl_kred_sr") )
    { l[i]=omo2; Z[597]++; if(dbg){print "Z597"}; continue };
#   if ( vgle(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
#         qir(bb_n+1,tn-1,"suw_im isname prl_im prq_im mest_im mest_3e qast_any nar_any prl_kred_sr") )
#   { l[i]=omo2; Z[598]++; if(dbg){print "Z598"}; continue };

#   if ( vvb(-6,-1) &&
#         ba(vvn-2,"_gl_na_lock") &&
#          w(vvn-1,"на") &&
#          q(vvn,"prl_vi mest_vi mest_3e") && s(vvn-2,vvn-1) )
#   { l[i]=omo2; Z[599]++; if(dbg){print "Z599"}; continue };

    if ( bfa(1,3,"_gl_na_lock") && s(-1,bfn-1) )
    { l[i]=omo2; Z[600]++; if(dbg){print "Z600"}; continue };
    # _gl_na_lock:end

    # _suw_na_castle:start
    bba(tn-5,tn-1,"_suw_na_castle"); bb_n=bbn;
    if ( veq(bb_n,tn-1) && s(tn-1) )
    { l[i]=omo1; Z[601]++; if(dbg){print "Z601"}; continue };
    if ( vgle(bb_n,tn-5,tn-1) && s(bb_n,tn-1) &&
          qir(bb_n+1,tn-1,"suw_tv prl_tv mest_tv prq_tv")  )
    { l[i]=omo1; Z[602]++; if(dbg){print "Z602"}; continue };
    bfa(1,4,"_suw_na_castle"); bf_n=bfn;
    if ( vgle(bf_n,1,4) && s(0,bf_n-1) &&
          qir(1,bf_n-1,"gl_aux_be gl_in gl_ed gl_mn prq_kred")  )
    { l[i]=omo1; Z[603]++; if(dbg){print "Z603"}; continue };
    # _suw_na_castle:end

    # _suw_na_lock:start
    bba(tn-5,tn-1,"_suw_na_lock"); bb_n=bbn;
    if ( veq(bb_n,tn-1) && s(tn-1) )
    { l[i]=omo2; Z[604]++; if(dbg){print "Z604"}; continue };
    if ( vgle(bb_n,tn-5,tn-1) && s(bb_n,tn-1) &&
          qir(bb_n+1,tn-1,"suw_tv prl_tv mest_tv prq_tv")  )
    { l[i]=omo2; Z[605]++; if(dbg){print "Z605"}; continue };
    # _suw_na_lock:end

    cst="потянуть тянуть";
    if ( q(1,"suw_im mest_im") &&
         w(2,"не") &&
        bw(3,cst) && s(-1,2) )
    { l[i]=omo1; Z[606]++; if(dbg){print "Z606"}; continue };
    if ( qy(tn-1,"sz_iili") &&
         wb(tn-5-qyn,tn-2-qyn,"на") && s(wbn,tn-2-qyn) && zs(tn-1-qyn) &&
         ba(tn-1-qyn,"_castle_environs") &&
        qir(wbn+1,tn-2-qyn,"prl_vi mest_vi mest_3e prq_vi") )
    { l[i]=omo1; Z[607]++; if(dbg){print "Z607"}; continue };
    if ( qy(tn-1,"sz_iili") &&
         wb(tn-5-qyn,tn-2-qyn,"на") && s(wbn,tn-2-qyn) && zs(tn-1-qyn) &&
         ba(wbn+1,"_castle_environs") &&
        qir(wbn+2,tn-1-qyn,"prl_ro mest_ro mest_3e prq_ro isname") )
    { l[i]=omo1; Z[608]++; if(dbg){print "Z608"}; continue };

   }; # tn_ok <<<--

    if ( ba(-4,"_gl_na_lock") &&
          w(-3,"на") &&
          q(-2,"prl_vi prq_vi") &&
          q(-1,"suw_vi") && s(-4,-1) )
    { l[i]=omo2; Z[609]++; if(dbg){print "Z609"}; continue };

    # похожий
    cst="походить похожий";
    if ( bw(-2,cst) &&
          w(-1,"на") &&
         ba(1,"_castlelike_things") && s(-2,0) )
    { l[i]=omo1; Z[610]++; if(dbg){print "Z610"}; continue };
    if ( bw(-4,cst) &&
          w(-3,"на") &&
         ba(-2,"_castlelike_things") &&
    sz_iili(-1) && s(-4,-1) )
    { l[i]=omo1; Z[611]++; if(dbg){print "Z611"}; continue };
    if ( bw(-3,cst) &&
          w(-2,"на") &&
          q(-1,"prl_vi mest_vi mest_3e prq_vi") &&
         ba(1,"_castlelike_things") && s(-3,0) )
    { l[i]=omo1; Z[612]++; if(dbg){print "Z612"}; continue };
    if ( ba(-3,"_castlelike_things") &&
         bw(-2,cst) &&
          w(-1,"на") && s(-3,-1) )
    { l[i]=omo1; Z[613]++; if(dbg){print "Z613"}; continue };
    if ( ba(-4,"_castlelike_things") &&
          w(-3,"не") &&
         bw(-2,cst) &&
          w(-1,"на") && s(-4,-1) )
    { l[i]=omo1; Z[614]++; if(dbg){print "Z614"}; continue };
    if ( bw(-2,cst) &&
          w(-1,"на") &&
          q(1,"prl_any") &&
         ba(2,"_castlelike_things") && s(-2,1) )
    { l[i]=omo1; Z[615]++; if(dbg){print "Z615"}; continue };
    if ( w(-2,"на") &&
         q(-1,"prl_any mest_any") &&
        ba(1,"_castlelike_things") &&
    pre_pr(2) &&
         q(3,"suw_pr") &&
        bw(4,cst) && s(-2,3) )
    { l[i]=omo1; Z[616]++; if(dbg){print "Z616"}; continue };
    if ( ba(-3,"_castlelike_things") && z(-3) &&
         bw(-2,cst) &&
          w(-1,"на") && s(-2,-1) )
    { l[i]=omo1; Z[617]++; if(dbg){print "Z617"}; continue };
    if ( ba(-4,"_castlelike_things") && z(-4) &&
         bw(-3,cst) &&
          w(-2,"на") &&
          q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[618]++; if(dbg){print "Z618"}; continue };
    # похожий


  }; # на замок
  ######################################################################################################
  # за замок
  if ( wb(-5,-1,"за") && s(wbn,-1) ) {
  DEFINE_TN_OK_PREVI_ZAMOK("за")
  if ( vis(tn_ok) ) {

    cst1="закружить";
    cst2="цепляться";
    if ( bw(-5,cst1) && z(-5) &&
          q(-4,"nar_step") &&
          q(-3,"qast") &&
         bw(-2,cst2) &&
          w(-1,"за") && s(-4,-1) )
    { l[i]=omo1; Z[619]++; if(dbg){print "Z619"}; continue };
    cst="держаться";
    if ( bw(-2,cst) &&
          w(-1,"за") && s(-2,-1) &&
       (qxs(1,"до","последнего")||
        qxs(1,"нет","смысла") ) )
    { l[i]=omo1; Z[620]++; if(dbg){print "Z620"}; continue };

    cst="взяться держаться цепляться";
    if ( bw(-3,cst) &&
        qxs(-1,"за","мой твой наш ваш их свой этот тот ее её их его") )
    { l[i]=omo1; Z[621]++; if(dbg){print "Z621"}; continue };
    cst1="взяться приняться";
    cst2="стена";
    if ( qxs(-3,"а","уж","потом") &&
          bw(xsn-1,cst2) && sc(xsn-1,"—") &&
          bw(-2,cst1) &&
           w(-1,"за") && s(-2,-1) )
    { l[i]=omo1; Z[622]++; if(dbg){print "Z622"}; continue };
    if ( bw(-3,cst) &&
          w(-2,"за") &&
     isname(-1) && s(-3,-1) )
    { l[i]=omo1; Z[623]++; if(dbg){print "Z623"}; continue };
    if ( bw(-2,cst) &&
          w(-1,"за") &&
    sz_iili(1) &&
         bw(2,"спалить сжечь сровнять снести") && s(-2,1) )
    { l[i]=omo1; Z[624]++; if(dbg){print "Z624"}; continue };
    if ( wb(-5,-3,"нужно пора") &&
          w(-2,cst) &&
          w(-1,"за") && s(wbn,-1) )
    { l[i]=omo1; Z[625]++; if(dbg){print "Z625"}; continue };
    if ( bw(-3,"хотеть") &&
          w(-2,cst) &&
          w(-1,"за") && s(-3,-1) )
    { l[i]=omo1; Z[626]++; if(dbg){print "Z626"}; continue };
    cst1="когда крепко наконец основательно плотно";
    if ( w(-3,cst1) &&
        bw(-2,cst) &&
         w(-1,"за") && s(-3,-1) )
    { l[i]=omo1; Z[627]++; if(dbg){print "Z627"}; continue };
    if ( w(-3,cst1) &&
        bw(-2,cst) &&
         w(-1,"за") &&
         w(1,"новый мой твой наш ваш их свой этот тот ее её их его") && s(-3,0) )
    { l[i]=omo1; Z[628]++; if(dbg){print "Z628"}; continue };
    if ( bw(-2,cst) &&
          w(-1,"за") &&
          w(1,cst1) && s(-2,0) )
    { l[i]=omo1; Z[629]++; if(dbg){print "Z629"}; continue };


    # _gl_za_lock <<<---:start
    bba(tn-7,tn-1,"_gl_za_lock"); bb_n=bbn;

    if ( veq(bb_n,tn-1) && s(tn-1) )
    { l[i]=omo2; Z[630]++; if(dbg){print "Z630"}; continue };
    if ( vgle(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qir(bb_n+1,tn-2,"prl_vi mest_vi mest_3e prq_vi prl_kred_sr nar_any qast isname") &&
            q(tn-1,"suw_vi mest_vi mest_3e prl_kred_sr nar_any qast isname") )
    { l[i]=omo2; Z[631]++; if(dbg){print "Z631"}; continue };
    if ( vgle(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qir(bb_n+1,tn-2,"prl_tv mest_tv mest_3e prl_kred_sr nar_any") &&
            q(tn-1,"suw_tv mest_tv") )
    { l[i]=omo2; Z[632]++; if(dbg){print "Z632"}; continue };
    if ( vgle(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qir(bb_n+1,tn-2,"prl_im prq_im mest_im qast") &&
            q(tn-1,"suw_im mest_im") )
    { l[i]=omo2; Z[633]++; if(dbg){print "Z633"}; continue };

#   if ( ba(-4,"_gl_za_lock") &&
#         w(-3,"за") &&
#         q(-2,"prl_vi prq_vi") &&
#         q(-1,"suw_vi") && s(-4,-1) )
#   { l[i]=omo2; Z[634]++; if(dbg){print "Z634"}; continue };
#   if ( vvb(-6,-1) &&
#         ba(vvn-2,"_gl_za_lock") &&
#          w(vvn-1,"за") &&
#          q(vvn,"prl_vi mest_vi mest_3e") && s(vvn-2,vvn-1) )
#   { l[i]=omo2; Z[635]++; if(dbg){print "Z635"}; continue };

    qb(tn-7,tn-1,"pre_vi"); bba(qbn-5,qbn-1,"_gl_za_lock"); qb_n=qbn; bb_n=bbn;
    if ( vgle(qb_n,tn-7,tn-1) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast") &&
          qir(qb_n+1,tn-2,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast") &&
            q(tn-1,"suw_vi mest_vi") )
    { l[i]=omo2; Z[636]++; if(dbg){print "Z636"}; continue };

    qb(tn-7,tn-1,"pre_tv"); bba(qbn-5,qbn-1,"_gl_za_lock"); qb_n=qbn; bb_n=bbn;
    if ( vgle(qb_n,tn-7,tn-1) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast") &&
          qir(qb_n+1,tn-2,"prl_tv mest_tv prq_tv mest_3e prl_kred_sr nar_any qast") &&
            q(tn-1,"suw_tv mest_tv") )
    { l[i]=omo2; Z[637]++; if(dbg){print "Z637"}; continue };
    qb(tn-7,tn-1,"pre_tv"); bba(qbn-5,qbn-1,"_gl_za_lock"); qb_n=qbn; bb_n=bbn;
    if ( vgle(qb_n,tn-7,tn-1) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast") &&
          qir(qb_n+1,tn-3,"prl_tv mest_tv prq_tv mest_3e prl_kred_sr nar_any qast") &&
            q(tn-2,"suw_tv mest_tv") &&
            q(tn-1,"suw_vi mest_vi") )
    { l[i]=omo2; Z[638]++; if(dbg){print "Z638"}; continue };

    qb(tn-7,tn-1,"pre_pr"); bba(qbn-5,qbn-1,"_gl_za_lock"); qb_n=qbn; bb_n=bbn;
    if ( vgle(qb_n,tn-7,tn-1) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast") &&
          qir(qb_n+1,tn-2,"prl_pr mest_pr prq_pr mest_3e prl_kred_sr nar_any qast") &&
            q(tn-1,"suw_pr mest_pr") )
    { l[i]=omo2; Z[639]++; if(dbg){print "Z639"}; continue };
    # _gl_za_lock <<<---:end

    # _gl_za_castle <<<---:start
    bba(tn-7,tn-1,"_gl_za_castle"); bb_n=bbn;

    if ( veq(bb_n,tn-1) && s(tn-1) )
    { l[i]=omo1; Z[640]++; if(dbg){print "Z640"}; continue };
    if ( vgle(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qir(bb_n+1,tn-2,"prl_vi mest_vi mest_3e prq_vi prl_kred_sr nar_any qast_any isname") &&
            q(tn-1,"suw_vi mest_vi mest_3e prl_kred_sr nar_any qast isname") )
    { l[i]=omo1; Z[641]++; if(dbg){print "Z641"}; continue };
    if ( vgle(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            q(bb_n+1,"suw_im mest_im") &&
          qir(bb_n+2,-1,"suw_vi prl_vi mest_vi mest_3e prq_vi prl_kred_sr nar_any qast_any isname") )
    { l[i]=omo1; Z[642]++; if(dbg){print "Z642"}; continue };

    qb(tn-7,tn-1,"pre_vi"); bba(qbn-5,qbn-1,"_gl_za_castle"); qb_n=qbn; bb_n=bbn;
    if ( vgle(qb_n,tn-7,tn-1) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast") &&
          qir(qb_n+1,tn-2,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast") &&
            q(tn-1,"suw_vi mest_vi") )
    { l[i]=omo1; Z[643]++; if(dbg){print "Z643"}; continue };
    # _gl_za_castle <<<---:end

    # _gl_za_lock --->>>:start
    if ( bfa(1,3,"_gl_za_lock") && s(0,bfn-1) && Qf(1,bfn-1,"sz_iili pre_any") )
    { l[i]=omo2; Z[644]++; if(dbg){print "Z644"}; continue };
    # _gl_za_lock --->>>:end

    # _gl_za_castle --->>>:start
    if ( ba(1,"_gl_za_castle") && s(0) )
    { l[i]=omo1; Z[645]++; if(dbg){print "Z645"}; continue };
    # _gl_za_castle --->>>:end

    # _suw_za_castle:start
    if ( ba(tn-1,"_suw_za_castle") && s(tn-1) )
    { l[i]=omo1; Z[646]++; if(dbg){print "Z646"}; continue };
    if ( ba(tn-2,"_suw_za_castle") &&
          q(tn-1,"suw_tv mest_tv") && s(tn-2,tn-1) )
    { l[i]=omo1; Z[647]++; if(dbg){print "Z647"}; continue };
    # _suw_za_castle:end

   }; # tn_ok

  }; # за замок
  ######################################################################################################
  # под замок
  if ( wb(-4,-1,"под") && s(wbn,-1) ) {
  # адрес поискового токена, в данном случае — "под"
  DEFINE_TN_OK_PREVI_ZAMOK("под")
  if ( vis(tn_ok) ) {

    cst="земля подкоп территория участок";
    if ( bw(-2,cst) &&
          w(-1,"под") && s(-2,-1) )
    { l[i]=omo1; Z[648]++; if(dbg){print "Z648"}; continue };
    if ( bw(-3,cst) &&
          w(-2,"под") &&
          q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[649]++; if(dbg){print "Z649"}; continue };
    if ( w(-1,"под") &&
        bf(1,3,cst) && s(-1,bfn-1) )
    { l[i]=omo1; Z[650]++; if(dbg){print "Z650"}; continue };

    # escape для место:start
    cst1="место";
    cst2="выбирать выбрать искать найти находиться отыскать подыскать поискать приглядеть присмотреть";
    if ( bw(-4,cst2) &&
          q(-3,"nar_mest mest_da suw_da") &&
         bw(-2,cst1) &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[651]++; if(dbg){print "Z651"}; continue };
    if ( bw(-3,cst2) &&
         bw(-2,cst1) &&
          w(-1,"под") && s(-3,-1) )
    { l[i]=omo1; Z[652]++; if(dbg){print "Z652"}; continue };
    if ( bw(-3,cst1) &&
         bw(-2,cst2) &&
          w(-1,"под") && s(-3,-1) )
    { l[i]=omo1; Z[653]++; if(dbg){print "Z653"}; continue };
    if ( bw(-2,cst1) &&
          w(-1,"под") &&
         bf(1,3,cst2) && s(-2,bfn-1) )
    { l[i]=omo1; Z[654]++; if(dbg){print "Z654"}; continue };

    cst3="выбор поиск";
    if ( bw(-4,cst3) &&
          q(-3,"prl_ro") &&
         bw(-2,cst1) &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[655]++; if(dbg){print "Z655"}; continue };

    cst3="уверенный";
    if ( bw(-4,cst3) &&
          w(-3,"насчет о") &&
         bw(-2,cst1) &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[656]++; if(dbg){print "Z656"}; continue };

    cst4="отправить отправиться отправлять отправляться сложить";
    if ( bw(-4,cst4) &&
          w(-3,"на") &&
         bw(-2,cst1) &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[657]++; if(dbg){print "Z657"}; continue };
    if ( bw(-2,cst4) &&
          w(-1,"под") &&
          w(1,"в") &&
          q(2,"prl_vi prq_vi mest_vi mest_3e") &&
         bw(3,cst1) && s(-2,2) )
    { l[i]=omo2; Z[658]++; if(dbg){print "Z658"}; continue };

    cst4="выжечь выжигать";
    if ( bw(-6,cst4) &&
          w(-5,"в") &&
          q(-4,"suw_pr mest_pr") &&
          q(-3,"suw_tv") &&
         bw(-2,cst1) &&
          w(-1,"под") && s(-6,-1) )
    { l[i]=omo2; Z[659]++; if(dbg){print "Z659"}; continue };
    # escape для место:end

    if ( sc(-2,"—") &&
          w(-1,"под") && s(-1) && (p(0)||q_w(1,"sz_iili pre_any")) )
    { l[i]=omo2; Z[660]++; if(dbg){print "Z660"}; continue };
    if ( w(-1,"под") &&
         q(1,"mest_vi mest_3e suw_odvi qis_vi isname") && s(-1,0) && (p(1)||q_w(2,"sz_iili pre_any")) )
    { l[i]=omo2; Z[661]++; if(dbg){print "Z661"}; continue };
    if ( q(-2,"mest_vi mest_3e suw_odvi qis_vi sz") &&
         w(-1,"под") &&
         s(-2,-1) && p(-3) && (p(0)||q_w(1,"sz_iili pre_any")) )
    { l[i]=omo2; Z[662]++; if(dbg){print "Z662"}; continue };
    if ( pre_vi(-3) && s(-3) &&
              q(-2,"suw_vi isname") && z(-2) &&
              w(-1,"под") && s(-1) && (p(0)||q_w(1,"sz_iili pre_any")) )
    { l[i]=omo2; Z[663]++; if(dbg){print "Z663"}; continue };
    if ( pre_vi(-4) && s(-4,-3) &&
              q(-3,"prl_vi mest_vi mest_3e qast") &&
              q(-2,"suw_vi") && z(-2) &&
              w(-1,"под") && s(-1) && (p(0)||q_w(1,"sz_iili pre_any")) )
    { l[i]=omo2; Z[664]++; if(dbg){print "Z664"}; continue };
    if ( pre_vi(-4) &&
              q(-3,"suw_vi") &&
        sz_iili(-2) &&
              w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[665]++; if(dbg){print "Z665"}; continue };


    # _gl_i_pod_lock:start
    if ( ba(-3,"_gl_i_pod_lock") && zs(-3) &&
        qxs(-1,"и","под") )
    { l[i]=omo2; Z[666]++; if(dbg){print "Z666"}; continue };
    if ( ba(-4,"_gl_i_pod_lock") && zs(-4) &&
          q(-3,"mest_vi mest_3e suw_vi isname") &&
        qxs(-1,"и","под") )
    { l[i]=omo2; Z[667]++; if(dbg){print "Z667"}; continue };
    # _gl_i_pod_lock:start

    # _gl_pod_lock:start
    if ( narph_any(tn-1) && s(xwn-1) &&
                ba(xwn-1,"_gl_pod_lock") && s(tn-1) )
    { l[i]=omo2; Z[668]++; if(dbg){print "Z668"}; continue };
    if ( narph_any(tn-1) && s(xwn-2,xwn-1) &&
                ba(xwn-2,"_gl_pod_lock") &&
                 q(xwn-1,"suw_vi mest_vi mest_3e isname") && s(tn-1) )
    { l[i]=omo2; Z[669]++; if(dbg){print "Z669"}; continue };
    if ( preph_tv(tn-2) &&
               ba(xwn-1,"_gl_pod_lock") &&
                q(tn-1,"suw_tv") && s(xwn-1,tn-1) )
    { l[i]=omo2; Z[670]++; if(dbg){print "Z670"}; continue };

    # escape
    if ( ba(tn-3,"_suw_pod_castle") && z(tn-3) &&
          w(tn-2,"что") &&
        bam(tn-1,"_gl_pod_lock _gl_pod_castle") && s(tn-2,tn-1) )
    { l[i]=omo1; Z[671]++; if(dbg){print "Z671"}; continue };
    cst="самый";
    cst1="ударить";
    cst2="кулаком ногой рукой";
    if ( bw(tn-2,cst1) &&
          w(tn-1,cst2) &&
          w(tn+1,cst) && s(tn-2) && zs(tn-1) )
    { l[i]=omo2; Z[672]++; if(dbg){print "Z672"}; continue };
    if ( qxs(-1,"под","самый") )
    { l[i]=omo1; Z[673]++; if(dbg){print "Z673"}; continue };


    # поиск по _gl_pod_lock
    bba(tn-9,tn-1,"_gl_pod_lock"); bb_n=bbn;
    if ( vgle(bb_n,tn-9,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qir(bb_n+1,tn-1,"suw_vi suw_edne prl_vi prq_vi mest_vi mest_impe mest_3e qik_vi qis_vi qast prl_kred_sr isname nar_any") )
    { l[i]=omo2; Z[674]++; if(dbg){print "Z674"}; continue };
    if ( vgle(bb_n,tn-9,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qir(bb_n+1,tn-2,"suw_vi suw_edne prl_vi prq_vi mest_vi mest_3e qik_vi qis_vi qast prl_kred_sr isname nar_any") &&
            q(tn-1,"isname suw_ro") )
    { l[i]=omo2; Z[675]++; if(dbg){print "Z675"}; continue };
    if ( vgle(bb_n,tn-9,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            q(bb_n+1,"isname suw_vi") &&
          qir(bb_n+2,tn-2,"suw_ro suw_edne prl_ro prq_ro mest_ro mest_3e qik_ro qis_ro qast prl_kred_sr isname nar_any") &&
            q(tn-1,"isname suw_ro") )
    { l[i]=omo2; Z[676]++; if(dbg){print "Z676"}; continue };
    if ( vgle(bb_n,tn-9,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qir(bb_n+1,tn-1,"suw_tv suw_edne prl_tv prq_tv mest_tv mest_3e qik_tv qis_tv qast prl_kred_sr isname nar_any") )
    { l[i]=omo2; Z[677]++; if(dbg){print "Z677"}; continue };
    if ( vgle(bb_n,tn-9,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qir(bb_n+1,tn-2,"suw_tv suw_edne prl_tv prq_tv mest_tv mest_3e qik_tv qis_tv qast prl_kred_sr isname nar_any") &&
            q(tn-1,"isname suw_vi") )
    { l[i]=omo2; Z[678]++; if(dbg){print "Z678"}; continue };
    if ( vgle(bb_n,tn-9,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            q(bb_n+1,"isname suw_vi mest_vi mest_3e") &&
          qir(bb_n+2,tn-2,"suw_tv suw_edne prl_tv prq_tv mest_tv mest_3e qik_tv qis_tv qast prl_kred_sr isname nar_any") &&
            q(tn-1,"isname suw_tv") )
    { l[i]=omo2; Z[679]++; if(dbg){print "Z679"}; continue };

    #
    qb(tn-5,tn-1,"pre_vi"); bba(qbn-5,qbn-1,"_gl_pod_lock"); qb_n=qbn; bb_n=bbn;
    if ( vgle(qb_n,tn-5,tn-1) && vgle(bb_n,qbn-5,qbn-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast prl_kred_sr","suw_vi suw_edne isname") &&
          qiz(qb_n+1,tn-1,"prl_vi mest_vi prq_vi mest_3e qast","suw_vi suw_edne isname") )
    { l[i]=omo2; Z[680]++; if(dbg){print "Z680"}; continue };
    if ( vgle(qb_n,tn-5,tn-1) && vgle(bb_n,qbn-5,qbn-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast","suw_vi suw_edne isname") &&
          qiz(qb_n+1,tn-1,"suw_vi prl_vi mest_vi mest_3e qik_vi qast","suw_ro suw_edne isname") )
    { l[i]=omo2; Z[681]++; if(dbg){print "Z681"}; continue };

    #
    qb(tn-5,tn-1,"pre_ro"); bba(qbn-5,qbn-1,"_gl_pod_lock"); qb_n=qbn; bb_n=bbn;
    if ( vgle(qb_n,tn-5,tn-1) && vgle(bb_n,qbn-5,qbn-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast prl_kred_sr","suw_vi suw_edne isname") &&
          qiz(qb_n+1,tn-1,"prl_ro mest_ro mest_3e qast","suw_ro suw_edne isname") )
    { l[i]=omo2; Z[682]++; if(dbg){print "Z682"}; continue };

    qb(tn-5,tn-1,"pre_tv"); bba(qbn-5,qbn-1,"_gl_pod_lock"); qb_n=qbn; bb_n=bbn;
    if ( vgle(qb_n,tn-5,tn-1) && vgle(bb_n,qbn-5,qbn-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast prl_kred_sr","suw_vi suw_edne isname") &&
          qiz(qb_n+1,tn-1,"prl_tv mest_tv mest_3e qast","suw_tv suw_edne isname") )
    { l[i]=omo2; Z[683]++; if(dbg){print "Z683"}; continue };

    qb(tn-5,tn-1,"pre_pr"); bba(qbn-5,qbn-1,"_gl_pod_lock"); qb_n=qbn; bb_n=bbn;
    if ( vgle(qb_n,tn-5,tn-1) && vgle(bb_n,qbn-5,qbn-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast prl_kred_sr","suw_vi suw_edne isname") &&
          qiz(qb_n+1,tn-1,"prl_pr mest_pr mest_3e qast","suw_pr suw_edne isname") )
    { l[i]=omo2; Z[684]++; if(dbg){print "Z684"}; continue };

    qb(tn-5,tn-1,"sz_iili"); bba(qbn-5,qbn-1,"_gl_pod_lock"); qb_n=qbn; bb_n=bbn;
    if ( vgle(qb_n,tn-5,tn-1) && vgle(bb_n,qbn-5,qbn-1) && s(bb_n,tn-2) && zs(tn-1) &&
          qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast prl_kred_sr","suw_vi suw_edne isname") &&
          qiz(qb_n+1,tn-1,"prl_vi prl_ro mest_vi mest_3e qast prl_kred_sr","suw_vi suw_edne isname") )
    { l[i]=omo2; Z[685]++; if(dbg){print "Z685"}; continue };

    if ( w(-1,"под") &&
       bfa(1,5,"_gl_pod_lock") && s(-1,bfn-1) )
    { l[i]=omo2; Z[686]++; if(dbg){print "Z686"}; continue };
    # _gl_pod_lock:end

    # _suw_pod_lock:start
    if ( ba(-2,"_suw_pod_lock") &&
          w(-1,"под") && s(-2,-1) )
    { l[i]=omo2; Z[687]++; if(dbg){print "Z687"}; continue };
    if ( ba(-4,"_suw_pod_lock") &&
          q(-3,"prl_vi mest_vi mest_3e qast") &&
          q(-2,"suw_vi mest_vi mest_3e qast") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[688]++; if(dbg){print "Z688"}; continue };
    if ( ba(-3,"_suw_pod_lock") &&
          q(-2,"suw_vi mest_vi mest_3e qast") &&
          w(-1,"под") && s(-3,-1) )
    { l[i]=omo2; Z[689]++; if(dbg){print "Z689"}; continue };
    if ( ba(-4,"_suw_pod_lock") &&
     pre_ro(-3) &&
          q(-2,"suw_ro") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[690]++; if(dbg){print "Z690"}; continue };
    if ( ba(-3,"_suw_pod_lock") &&
          w(-2,"под") &&
          q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo2; Z[691]++; if(dbg){print "Z691"}; continue };
    if ( w(-1,"под") &&
       bfa(1,3,"_suw_pod_lock") && s(-1,bfn-1) )
    { l[i]=omo2; Z[692]++; if(dbg){print "Z692"}; continue };
    # _suw_pod_lock:end

    # _suw_pod_castle:start
    if ( ba(-2,"_suw_pod_castle") &&
          w(-1,"под") && s(-2,-1) )
    { l[i]=omo1; Z[693]++; if(dbg){print "Z693"}; continue };
    if ( ba(-4,"_suw_pod_castle") &&
          q(-3,"prl_vi mest_vi mest_3e qast") &&
          q(-2,"suw_vi mest_vi mest_3e qast") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[694]++; if(dbg){print "Z694"}; continue };
    if ( ba(-3,"_suw_pod_castle") &&
          q(-2,"suw_vi mest_vi mest_3e qast") &&
          w(-1,"под") && s(-3,-1) )
    { l[i]=omo1; Z[695]++; if(dbg){print "Z695"}; continue };
    if ( ba(-4,"_suw_pod_castle") &&
     pre_ro(-3) &&
          q(-2,"suw_ro") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[696]++; if(dbg){print "Z696"}; continue };
    if ( ba(-3,"_suw_pod_castle") &&
          w(-2,"под") &&
          q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[697]++; if(dbg){print "Z697"}; continue };
    if ( w(-1,"под") &&
       bfa(1,3,"_suw_pod_castle") && s(-1,bfn-1) )
    { l[i]=omo1; Z[698]++; if(dbg){print "Z698"}; continue };
    # _suw_pod_castle:end

    # _gl_pod_castle:start
    if ( ba(-2,"_gl_pod_castle") &&
          w(-1,"под") && s(-2,-1) )
    { l[i]=omo1; Z[699]++; if(dbg){print "Z699"}; continue };
    if ( ba(-3,"_gl_pod_castle") &&
          w(-2,"под") &&
          q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[700]++; if(dbg){print "Z700"}; continue };
    if ( w(-1,"под") &&
       bfa(1,3,"_gl_pod_castle") && s(-1,bfn-1) )
    { l[i]=omo1; Z[701]++; if(dbg){print "Z701"}; continue };
    if ( ba(-4,"_gl_pod_castle") &&
     pre_da(-3) &&
          q(-2,"mest_da suw_da") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[702]++; if(dbg){print "Z702"}; continue };
    if ( ba(-6,"_gl_pod_castle") &&
          q(-5,"suw_vi mest_vi mest_3e") &&
          q(-4,"nar_any") &&
     pre_da(-3) &&
          q(-2,"mest_da suw_da") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[703]++; if(dbg){print "Z703"}; continue };
    if ( ba(-4,"_gl_pod_castle") &&
     pre_tv(-3) &&
          q(-2,"mest_tv suw_tv") &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[704]++; if(dbg){print "Z704"}; continue };
    # _gl_pod_castle:end

    if ( w(-3,"в во") &&
         q(-2,"suw_vi") &&
         w(-1,"под") && s(-3,-1) )
    { l[i]=omo2; Z[705]++; if(dbg){print "Z705"}; continue };
    if ( w(-4,"в во") &&
         q(-3,"suw_vi") &&
         w(-2,"не") &&
         w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[706]++; if(dbg){print "Z706"}; continue };
    if ( w(-1,"под") &&
         w(1,"в во") &&
         q(2,"suw_vi") && s(-1,1) )
    { l[i]=omo2; Z[707]++; if(dbg){print "Z707"}; continue };

    if ( w(-1,"под") && p(-2) &&
         q(1,"prl_vi suw_vi mest_vi mest_3e") &&
         q(2,"mest_vi suw_vi") && s(-1,1) && p(2) )
    { l[i]=omo2; Z[708]++; if(dbg){print "Z708"}; continue };
    if ( q(-3,"mest_vi prl_vi mest_3e") && p(-4) &&
         q(-2,"suw_vi") &&
         w(-1,"под") && s(-3,-1) && p(0) )
    { l[i]=omo2; Z[709]++; if(dbg){print "Z709"}; continue };
    if ( q(-2,"mest_vi suw_vi") && p(-3) &&
         w(-1,"под") && s(-2,-1) && p(0) )
    { l[i]=omo2; Z[710]++; if(dbg){print "Z710"}; continue };
    if ( pre_vi(-5) && p(-6) &&
              q(-4,"suw_vi") &&
              q(-3,"mest_vi mest_3e") &&
        sz_iili(-2) &&
              w(-1,"под") && s(-5,-1) )
    { l[i]=omo2; Z[711]++; if(dbg){print "Z711"}; continue };


   } # tn_ok <<== end

  }; # под замок
  ######################################################################################################
  # о замок
  if ( wb(-4,-1,"о") && s(wbn,-1) ) {
  DEFINE_TN_OK_PREVI_ZAMOK("о")
  if ( vis(tn_ok) ) {

    if ( w(1,"чем что как") && (p(tn-1)||sc(tn-1,"[(«]")) && z(0) )
    { l[i]=omo1; Z[712]++; if(dbg){print "Z712"}; continue };
    cst="разбиваться удариться";
    if ( (qxs(tn-2,"ветер")||
          qxs(tn-2,"луч","света") ) &&
           bw(tn-1,cst) && s(tn-1) )
    { l[i]=omo1; Z[713]++; if(dbg){print "Z713"}; continue };
    if ( qxs(tn-1,"что","это","бьется") )
    { l[i]=omo1; Z[714]++; if(dbg){print "Z714"}; continue };

    if ( ba(-2,"_gl_o_lock") &&
          w(-1,"о") && s(-2,-1) )
    { l[i]=omo2; Z[715]++; if(dbg){print "Z715"}; continue };
    if ( w(-1,"о") &&
        ba(1,"_gl_o_lock") && s(-1,0) )
    { l[i]=omo2; Z[716]++; if(dbg){print "Z716"}; continue };
    if ( ba(-3,"_gl_o_lock") &&
          q(-2,"suw_vi suw_tv") &&
          w(-1,"о") && s(-3,-1) )
    { l[i]=omo2; Z[717]++; if(dbg){print "Z717"}; continue };
    if ( w(-1,"о") &&
         q(1,"prl_kred_sr") &&
   sz_iili(2) &&
         q(3,"prl_kred_sr") &&
        ba(4,"_gl_o_lock") && s(-1,3) )
    { l[i]=omo2; Z[718]++; if(dbg){print "Z718"}; continue };
    if ( ba(-2,"_suw_o_lock") &&
          w(-1,"о") && s(-2,-1) )
    { l[i]=omo2; Z[719]++; if(dbg){print "Z719"}; continue };
    if ( ba(-3,"_suw_o_lock") &&
          q(-2,"suw_ro suw_tv") &&
          w(-1,"о") && s(-3,-1) )
    { l[i]=omo2; Z[720]++; if(dbg){print "Z720"}; continue };

   } # tn_ok <<== end
  }; # о замок
  ######################################################################################################

  # ниже "замок" без собственного предлога
   # escape:pe
   #
   cst1="вывести";
   if ( bb(-5,-1,cst1) &&
        qy(bbn+1,"qast_any") &&
       qaw(bbn+1+qyn,"из","строя") &&
       qir(awn+1+qyn,-1,"prl_vi mest_vi mest_3e") && s(bbn,-1) )
   { l[i]=omo2; Z[721]++; if(dbg){print "Z721"}; continue };

   cst1="обойти";
   cst2="открыть";
   if ( bb(-5,-1,cst1) && s(bbn,-1) &&
        bw(bbn-1,cst2) && z(bbn-1) &&
       qir(bbn+1,-1,"prl_vi mest_vi mest_3e") )
   { l[i]=omo2; Z[722]++; if(dbg){print "Z722"}; continue };

   cst1="потрясти";
   cst2="буря весть взрыв вой вопль грохот гул известие крик рев рычание событие трагедия удар";
   if ( bw(-2,cst2) && zs(-2) &&
        bw(-1,cst1) && s(-1) )
   { l[i]=omo1; Z[723]++; if(dbg){print "Z723"}; continue };
   if ( bw(-1,cst1) &&
        bw(1,cst2) && s(-1,0) )
   { l[i]=omo1; Z[724]++; if(dbg){print "Z724"}; continue };
   if ( bw(-3,cst2) && zs(-3) &&
         q(-2,"otsz_any") &&
        bw(-1,cst1) && s(-2,-1) )
   { l[i]=omo1; Z[725]++; if(dbg){print "Z725"}; continue };
   if ( qy(1,"nar_any prl_kred_sr isname") &&
        bw(1+qyn,cst1) &&
        bf(2+qyn,4+qyn,cst2) &&
       qir(2+qyn,bfn-1,"prl_im mest_im prq_im") && s(0,bfn-1) )
   { l[i]=omo1; Z[726]++; if(dbg){print "Z726"}; continue };
   if ( bw(-1,cst1) && s(-1) && vvb(-6,-2) && bw(vvn,cst2) )
   { l[i]=omo1; Z[727]++; if(dbg){print "Z727"}; continue };
   if ( q(-3,"otsz_any") &&
        q(-2,"mod_any") &&
       bw(-1,cst1) && s(-3,-1) &&
      vvb(-8,-4) &&
       bb(vvn-4,vvn,cst2) && s(bbn,vvn-1) )
   { l[i]=omo1; Z[728]++; if(dbg){print "Z728"}; continue };


    cst1="велеть приказать решение решить";
    cst2="демонтировать";
    if ( bw(-2,cst1) &&
          w(-1,cst2) && s(-2,-1) )
    { l[i]=omo1; Z[729]++; if(dbg){print "Z729"}; continue };

    cst1="быть находиться оказаться";
    cst2="владении власти горах лесах лесу распоряжении руках";
    if ( bw(1,cst1) &&
          w(2,"в во") &&
         wf(3,6,cst2) &&
        qir(3,wfn-1,"prl_pr prq_pr mest_pr mest_3e") && s(0,wfn-1) )
    { l[i]=omo1; Z[730]++; if(dbg){print "Z730"}; continue };

    cst1="быть виднеться находиться располагаться расположиться стоять";
    cst2="глубине гуще конце начале середине центре";
    cst3="города долины композиции крепости круга леса подземелья";
    wf(1,6,"в во"); wf_n=wfn; wf(wfn+1,wfn+4,cst3); bf_n=wfn;
    if ( vgle(wf_n,1,6) && vgle(bf_n,wf_n+1,wf_n+4) &&
           bw(wf_n-1,cst1) &&
            w(wf_n+1,cst2) &&
          qir(wf_n+2,bf_n-1,"prl_pr prq_pr mest_pr mest_3e") && s(0,bf_n-1) )
    { l[i]=omo1; Z[731]++; if(dbg){print "Z731"}; continue };

    wb(-4,-1,cst3); w3_n=wbn; wb(w3_n-4,w3_n-1,cst2); w2_n=wbn; wb(w2_n-4,w2_n-1,"в во"); wb_n=wbn;
    if ( vgle(w3_n,-4,-1) && vgle(w2_n,w3_n-4,w3_n-1) && vgle(wb_n,w2_n-4,w2_n-1) && s(wb_n,-1) &&
          qir(wb_n+1,w2_n-1,"prl_pr prq_pr mest_pr mest_3e") &&
          qir(w2_n+1,w3_n-1,"prl_ro prq_ro mest_ro mest_3e") &&
           bw(w3_n+1,cst1) &&
          qir(w3_n+2,-1,"prl_vi mest_vi mest_3e prq_vi") )
    { l[i]=omo1; Z[732]++; if(dbg){print "Z732"}; continue };
    if ( vgle(w3_n,-4,-1) && vgle(w2_n,w3_n-4,w3_n-1) && vgle(wb_n,w2_n-4,w2_n-1) && s(wb_n,-1) &&
          qir(wb_n+1,w2_n-1,"prl_pr prq_pr mest_pr mest_3e") &&
          qir(w2_n+1,w3_n-1,"prl_ro prq_ro mest_ro mest_3e") &&
          qir(w3_n+1,-1,"prl_vi mest_vi mest_3e prq_vi") )
    { l[i]=omo1; Z[733]++; if(dbg){print "Z733"}; continue };

    cst1="перевесить";
    cst2="гору";
    if ( bw(1,cst1) &&
          w(2,cst2) && s(0,1) )
    { l[i]=omo1; Z[734]++; if(dbg){print "Z734"}; continue };

    cst1="меняться";
    if ( bw(1,cst1) && z(1) && s(0) &&
          w(2,"то тогда") &&
          q(3,"qik_vi mest_vi") &&
         ba(4,"_lock_parts") && s(2,3) )
    { l[i]=omo2; Z[735]++; if(dbg){print "Z735"}; continue };

    cst1="поменять сменить";
    cst2="владелец имя название хозяин";
    if ( bf(1,5,cst1) && Qf(1,bfn-1,"sz_iili pre_any") &&
         bf(bfn+1,bfn+3,cst2) && s(0,bfn-1) )
    { l[i]=omo1; Z[736]++; if(dbg){print "Z736"}; continue };

    cst1="положить";
    cst2="гранату конец начало";
    if ( qxs(-1,"на","рот","был","положен") )
    { l[i]=omo2; Z[737]++; if(dbg){print "Z737"}; continue };
    if ( w(-1,"положен") && s(-1) )
    { l[i]=omo1; Z[738]++; if(dbg){print "Z738"}; continue };
    if ( w(1,"положен") && s(0) )
    { l[i]=omo1; Z[739]++; if(dbg){print "Z739"}; continue };
    if ( wy(1,"не") &&
          w(1+wyn,"положен положено") && s(0,0+wyn) )
    { l[i]=omo1; Z[740]++; if(dbg){print "Z740"}; continue };
    if ( bf(1,3,cst1) && Qf(1,bfn-1,"sz_iili pre_any") &&
          w(bfn+1,cst2) && zs(0) && s(1,bfn-1) )
    { l[i]=omo1; Z[741]++; if(dbg){print "Z741"}; continue };
    if ( bw(-1,cst1) &&
          w(bfn+1,"к ко") &&
          q(bfn+2,"mest_da mest_3e") &&
          w(bfn+3,"ногам") && s(0,bfn+2) )
    { l[i]=omo1; Z[742]++; if(dbg){print "Z742"}; continue };
    if ( bw(-1,cst1) &&
        qxs(1,"в","руины") && s(-1) )
    { l[i]=omo1; Z[743]++; if(dbg){print "Z743"}; continue };

    cst1="вырезать вырубать вырубить высекать высечь";
    cst2="гора камень скала";
    if ( bf(1,5,cst1) && Qf(1,bfn-1,"sz_iili pre_any") &&
          w(bfn+1,"в из") &&
         bf(bfn+2,bfn+4,cst2) && s(0,bfn-1) )
    { l[i]=omo1; Z[744]++; if(dbg){print "Z744"}; continue };

  # брать взять <<<---:start
  cst1="брать взять";
  bb(-7,-1,cst1); bb_n=bbn;
  if ( bb_n ) {

    if ( qxs(-1,"на","себя") &&
         veq(xsn-1,bb_n) && s(xsn-1) )
    { l[i]=omo1; Z[745]++; if(dbg){print "Z745"}; continue };

    if ( vgle(bb_n,-7,-1) && s(bb_n,-1) && z(0) &&
          qir(bb_n+1,-1,"qast_any mest_vi prl_vi") &&
            q(1,"otsz_vi isname suw_im") &&
           ba(2,"_lock_pe") && s(1) )
    { l[i]=omo2; Z[746]++; if(dbg){print "Z746"}; continue };

    cst2="наскоком нахрапом приступом штурмом";
    if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
            w(bb_n+1,cst2) &&
          qir(bb_n+2,-1,"qast_any mest_vi prl_vi") )
    { l[i]=omo1; Z[747]++; if(dbg){print "Z747"}; continue };

    cst2="кулак ладони ладонь руки руку";
    if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
            w(bb_n+1,"в во") &&
           wf(bb_n+2,bb_n+4,cst2) &&
          qir(bb_n+2,wfn-1,"mest_vi prl_vi prq_vi") &&
          qir(wfn+1,-1,"mest_vi prl_vi prq_vi nar_any") )
    { l[i]=omo2; Z[748]++; if(dbg){print "Z748"}; continue };
    if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
            w(1,"в во") &&
           wf(2,4,cst2) &&
          qir(bb_n+1,-1,"mest_vi prl_vi prq_vi") &&
          qir(2,wfn-1,"mest_vi prl_vi prq_vi nar_any") )
    { l[i]=omo2; Z[749]++; if(dbg){print "Z749"}; continue };
    cst2="булавка ключ отмычка";
    if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
           bb(bb_n-4,bb_n-1,cst2) &&
          qir(bbn+1,bb_n-1,"mod_ed mod_mn qast_any") &&
          qir(bb_n+1,-1,"mest_vi prl_vi prq_vi nar_any") )
    { l[i]=omo2; Z[750]++; if(dbg){print "Z750"}; continue };

    if ( veq(bb_n,-1) &&
           q(1,"nar_napr") && s(-1,0) )
    { l[i]=omo2; Z[751]++; if(dbg){print "Z751"}; continue };


    bfa(1,5,"_lock_bratj_i_gl"); bf_n=bfn;
    cst0="шпиле";
    if ( vgle(bb_n,-7,-1) && vgle(bf_n,1,5) && s(bb_n,-1) && s(1,bf_n-1) && zs(0) &&
          qir(bb_n+1,-1,"prl_vi mest_vi mest_3e nar_any") &&
          qia(1,bf_n-1,"sz_i","prl_kred_sr nar_any") &&
            w(bfn+1,"на") &&
            w(bfn+2,cst0) )
    { l[i]=omo1; Z[752]++; if(dbg){print "Z752"}; continue };
    if ( vgle(bb_n,-7,-1) && vgle(bf_n,1,5) && s(bb_n,-1) && s(1,bf_n-1) && zs(0) &&
          qir(bb_n+1,-1,"prl_vi mest_vi mest_3e nar_any") &&
          qia(1,bf_n-1,"sz_i","prl_kred_sr nar_any") )
    { l[i]=omo2; Z[753]++; if(dbg){print "Z753"}; continue };
    if ( vgle(bb_n,-7,-1) && vgle(bf_n,1,5) && s(bb_n,-1) && s(1,bf_n-1) && zs(0) &&
          qiz(bb_n+1,-1,"prl_vi mest_vi mest_3e nar_any","sz_i") &&
          qir(1,bf_n-1,"prl_kred_sr nar_any") )
    { l[i]=omo2; Z[754]++; if(dbg){print "Z754"}; continue };


    if ( veq(bb_n,-1) && vv(0,5) &&
           w(vvn+1,"и да") &&
          ba(vvn+2,"_lock_bratj_i_gl") && s(vvn+1) )
    { l[i]=omo2; Z[755]++; if(dbg){print "Z755"}; continue };

    if ( ba(-4,"_lock_parts") &&
        veq(bb_n,-3) &&
       sz_i(-2) &&
          q(-1,"prl_vi mest_vi mest_3e prq_vi") &&
         bw(1,"поставить") && s(-4,0) )
    { l[i]=omo2; Z[756]++; if(dbg){print "Z756"}; continue };
    if ( ba(-5,"_lock_parts") &&
          w(-4,"в") &&
          q(-3,"suw_vi") &&
       sz_i(-2) &&
        veq(bb_n,-1) && s(-5,-1) )
    { l[i]=omo2; Z[757]++; if(dbg){print "Z757"}; continue };


    if ( ba(-4,"_gl_dvizh") && s(-4) &&
          q(-3,"nar_napr nar_spos nar_vrem") && z(-3) &&
        veq(bb_n,-2) &&
          q(-1,"prl_vi mest_vi mest_3e") && s(-2,-1) )
    { l[i]=omo2; Z[758]++; if(dbg){print "Z758"}; continue };

    cst2="сделать";
    cst3="шаг";
    if ( veq(bb_n,-1) &&
        sz_i(1) &&
          bw(2,cst2) &&
           w(3,cst3) && s(-1,2) )
    { l[i]=omo2; Z[759]++; if(dbg){print "Z759"}; continue };

    cst2="ладони ладонь лапу лапы руки руку";
    if ( veq(bb_n,-1) &&
         qxs(1,"в",cst2) && s(-1) )
    { l[i]=omo2; Z[760]++; if(dbg){print "Z760"}; continue };
    if ( veq(bb_n,-2) &&
           q(-1,"prl_vi prq_vi mest_vi mest_3e") &&
         qxs(1,"в",cst2) && s(-2,-1) )
    { l[i]=omo2; Z[761]++; if(dbg){print "Z761"}; continue };
    if ( (qxs(-1,"в",cst2)||
          qxs(-1,"в","правую левую свою свои обе",cst2)||
          qxs(-1,"на","мушку") ) &&
           bw(xsn-1,cst1) && s(xsn-1) )
    { l[i]=omo2; Z[762]++; if(dbg){print "Z762"}; continue };
    if ( veq(bb_n,-1) &&
        (qxs(1,"в",cst2)||
         qxs(1,"в","правую левую свою свои обе",cst2) ) && s(-1) )
    { l[i]=omo2; Z[763]++; if(dbg){print "Z763"}; continue };
    cst2="лавки пола полки стола";
    if ( veq(bb_n,-3) &&
           w(-2,"с со") &&
           w(-1,cst2) && s(-3,-1) )
    { l[i]=omo2; Z[764]++; if(dbg){print "Z764"}; continue };
    cst2="рук";
    if ( veq(bb_n,-1) &&
           w(1,"у") &&
           q(2,"suw_ro mest_ro isname") &&
           w(3,"из") &&
           w(4,cst2) && s(-1,3) )
    { l[i]=omo2; Z[765]++; if(dbg){print "Z765"}; continue };
    cst2="ногтем пальцами руками рукой";
    if ( veq(bb_n,-1) &&
           w(1,cst2) && s(-1,0) )
    { l[i]=omo2; Z[766]++; if(dbg){print "Z766"}; continue };
    if ( veq(bb_n,-1) &&
           q(1,"prl_tv mest_tv mest_3e") &&
           w(2,cst2) && s(-1,1) )
    { l[i]=omo2; Z[767]++; if(dbg){print "Z767"}; continue };

    cst2="опять осторожно снова";
    if ( q(-3,"isname suw_odim mest_im") &&
         w(-2,cst2) &&
       veq(bb_n,-1) && s(-3,-1) )
    { l[i]=omo2; Z[768]++; if(dbg){print "Z768"}; continue };
    cst2="опять осторожно снова";
    if ( veq(bb_n,-1) &&
        sz_i(1) &&
          bw(2,"сказать") &&
           q(3,"suw_odda mest_da isname") && s(-1,2) )
    { l[i]=omo2; Z[769]++; if(dbg){print "Z769"}; continue };

  }; # брать взять <<<---:end
  # брать взять --->>>:start
  cst1="брать взять";
  bf(1,3,cst1); bf_n=bfn;
  if ( bf_n ) {

    cst2="наскоком нахрапом приступом штурмом";
    if ( vgle(bf_n,1,3) && s(0,bf_n-1) &&
          qir(1,bf_n-1,"gl_aux_be mod_any") &&
            w(bf_n+1,cst2) )
    { l[i]=omo1; Z[770]++; if(dbg){print "Z770"}; continue };

    cst2="ногтем пальцами руками рукой";
    if ( veq(bf_n,1) && bw(-1,cst2) && s(-1,0) )
    { l[i]=omo2; Z[771]++; if(dbg){print "Z771"}; continue };
    if ( veq(bf_n,2) && w(1,cst2) && s(0,1) )
    { l[i]=omo2; Z[772]++; if(dbg){print "Z772"}; continue };

    if ( veq(bf_n,1) &&
        sz_i(2) &&
          ba(3,"_lock_bratj_i_gl") && s(0,1) )
    { l[i]=omo2; Z[773]++; if(dbg){print "Z773"}; continue };
    if ( veq(bf_n,1) &&
           w(2,"у") &&
           q(3,"suw_ro mest_ro mest_3e") &&
          bw(4,"кровь") && s(0,3) )
    { l[i]=omo2; Z[774]++; if(dbg){print "Z774"}; continue };

    if ( veq(bf_n,1) &&
          ba(2,"_lock_parts") && s(0,1) )
    { l[i]=omo2; Z[775]++; if(dbg){print "Z775"}; continue };
    if ( ba(-2,"_lock_parts") &&
          q(-1,"prl_vi mest_vi mest_3e") &&
          w(1,"не") &&
        veq(bf_n,2) && s(-2,1) )
    { l[i]=omo2; Z[776]++; if(dbg){print "Z776"}; continue };
  }; # брать взять --->>>:end

    cst="стоять";
    cst2="дверь";
    if ( bf(1,3,cst) &&
        qir(1,bfn-1,"nar_any qast") && s(0,bfn-1) && p(bfn) )
    { l[i]=omo1; Z[777]++; if(dbg){print "Z777"}; continue };
    if ( bb(-3,-1,cst) &&
         qb(bbn-4,bbn-1,"pre_pr") &&
          w(qbn+1,cst2) &&
        qir(qbn+2,bbn-1,"suw_ro suw_edne isname") &&
        qir(bbn+1,-1,"prl_vi mest_vi mest_3e") && s(qbn-1,-1) )
    { l[i]=omo2; Z[778]++; if(dbg){print "Z778"}; continue };

    cst="встроить поставить";
    cst2="дверь ручка ящик";
    if ( bw(-3,cst) &&
     pre_pr(-2) &&
         bw(-1,cst2) && s(-3,-1) )
    { l[i]=omo2; Z[779]++; if(dbg){print "Z779"}; continue };
    cst2="дверь ящик";
    if ( bw(-4,cst) &&
     pre_pr(-3) &&
         bw(-2,cst2) &&
          q(-1,"prl_edmuim") && s(-4,-1) )
    { l[i]=omo2; Z[780]++; if(dbg){print "Z780"}; continue };
    if ( bw(-1,cst) &&
     pre_pr(1) &&
         bw(2,cst2) && s(-1,1) )
    { l[i]=omo2; Z[781]++; if(dbg){print "Z781"}; continue };
    if ( ba(-5,"_gl_dvizh") &&
          q(-4,"nar_any") && z(-4) &&
          w(-3,"чтобы") &&
          w(-2,cst) &&
          q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo2; Z[782]++; if(dbg){print "Z782"}; continue };


    cst1="носить";
    cst2="имя название";
    if ( bf(1,5,cst1) && zs(0) && s(1,bfn-1) &&
         wf(bfn+1,bfn+3,cst2) &&
        qir(bfn+1,wfn-1,"prl_im mest_im qast_any") )
    { l[i]=omo1; Z[783]++; if(dbg){print "Z783"}; continue };
    if ( w(-2,cst2) && s(-2,-1) &&
        bw(-1,cst1) )
    { l[i]=omo1; Z[784]++; if(dbg){print "Z784"}; continue };

    cst1="панель";
    cst2="показаться";
    if ( bw(-4,cst1) && z(-4) &&
     pre_tv(-3) &&
          q(-2,"otsz_tv") &&
         bw(-1,cst2) && s(-3,-1) )
    { l[i]=omo2; Z[785]++; if(dbg){print "Z785"}; continue };

    cst1="держать";
    cst2="закрыть запереть открыть";
    cst3="руках руке";
    if ( bw(-2,cst1) &&
          q(-1,"prq_tv") && bw(-1,cst2) &&
     isname(1) && s(-2,0) )
    { l[i]=omo1; Z[786]++; if(dbg){print "Z786"}; continue };
    if ( bw(-3,cst1) &&
          w(-2,"в") &&
          w(-1,cst3) && s(-3,-1) )
    { l[i]=omo2; Z[787]++; if(dbg){print "Z787"}; continue };

    cst="передавать передать получить принять";
    if ( ( qxs(-1,"в","дар подарок наследство собственность распоряжение управление бенефиций")||
           qxs(-1,"во","владение")||
           qxs(-1,"в","своё свое свои свою","владение владения собственность распоряжение управление")||
           qxs(-1,"под","управление")||
           qxs(-1,"под","своё свое","управление") ) &&
            bb(xsn-4,xsn-1,cst) && s(bbn,xsn-1) )
    { l[i]=omo1; Z[788]++; if(dbg){print "Z788"}; continue };

    if ( bw(1,"ходить") &&
       (qxs(2,"на","ушах")||
          w(2,"ходуном") ) && s(0,1) )
    { l[i]=omo1; Z[789]++; if(dbg){print "Z789"}; continue };
    if ( bb(-3,-1,"знать") && s(bbn,-1) &&
        qxs(1,"как","ваши наши свои","пять","пальцев") )
    { l[i]=omo1; Z[790]++; if(dbg){print "Z790"}; continue };


    if ( bw(-3,"открывать открываться") &&
          w(-2,"перед") &&
          q(-1,"suw_tv mest_tv") && s(-3,-1) )
    { l[i]=omo1; Z[791]++; if(dbg){print "Z791"}; continue };

    cst="потянуть тянуть";
    if ( w(1,"не") &&
        bw(2,cst) && s(0,1) )
    { l[i]=omo1; Z[792]++; if(dbg){print "Z792"}; continue };
    cst1="башня время сила стена";
    if ( bw(1,cst) &&
         bw(2,cst1) && s(0,1) )
    { l[i]=omo1; Z[793]++; if(dbg){print "Z793"}; continue };
    if ( q(1,"suw_da mest_da") &&
         w(2,"не") &&
        bw(3,cst) && s(0,2) )
    { l[i]=omo1; Z[794]++; if(dbg){print "Z794"}; continue };
    if ( bw(1,cst) &&
          q(2,"suw_ro mest_ro mest_3e") &&
          w(3,"к ко") && s(0,2) )
    { l[i]=omo1; Z[795]++; if(dbg){print "Z795"}; continue };
    if ( bf(1,5,cst) && Qf(1,bfn-1,"sz_iili pre_any") &&
          w(bfn+1,"из") &&
          q(bfn+2,"suw_ro mest_ro mest_3e") && s(0,bfn+1) )
    { l[i]=omo1; Z[796]++; if(dbg){print "Z796"}; continue };
    if ( bf(1,3,cst) && Qf(1,bfn-1,"sz_iili pre_any") &&
          q(bfn+1,"suw_vi mest_vi mest_3e") &&
          q(bfn+2,"nar_any prl_kred_sr") && s(0,bfn+1) )
    { l[i]=omo1; Z[797]++; if(dbg){print "Z797"}; continue };

    cst="затягивать затягиваться затянуть затянуться";
    cst1="дым дымка паутина пелена туман";
    if ( bw(1,cst) &&
         bw(2,cst1) && s(0,1) )
    { l[i]=omo1; Z[798]++; if(dbg){print "Z798"}; continue };

    cst="освободить освобождать спасти";
    cst1="захват захватчик оккупант осада разрушение";
    if ( bw(-1,cst) &&
          w(1,"от") &&
         bw(2,cst1) && s(-1,1) )
    { l[i]=omo1; Z[799]++; if(dbg){print "Z799"}; continue };
    if ( bw(-1,cst) &&
          w(1,"от") &&
          q(2,"prl_ro prq_ro") &&
         bw(3,cst1) && s(-1,2) )
    { l[i]=omo1; Z[800]++; if(dbg){print "Z800"}; continue };

    cst="вырвать";
    if ( bw(-1,cst) && s(-1) &&
      ( qxs(1,"из","цепких","лап рук")||
        qxs(1,"из","лап рук") ) )
    { l[i]=omo1; Z[801]++; if(dbg){print "Z801"}; continue };
    if ( bw(-2,cst) &&
          q(-1,"prl_vi prq_vi mest_vi mest_3e") && s(-2,-1) &&
      ( qxs(1,"из","его ее её их ваших цепких","лап рук")||
        qxs(1,"из","лап рук") ) )
    { l[i]=omo1; Z[802]++; if(dbg){print "Z802"}; continue };

    cst="погружаться погрузиться";
    cst1="металл";
    if ( bw(1,cst) &&
          w(2,"в во") &&
         bw(3,cst1) && s(0,2) )
    { l[i]=omo2; Z[803]++; if(dbg){print "Z803"}; continue };

    cst="снести сносить";
    cst1="выстрелом молотом прикладом ударом";
    if ( bw(-2,cst) &&
          w(-1,cst1) && s(-2,-1) )
    { l[i]=omo2; Z[804]++; if(dbg){print "Z804"}; continue };

    cst="разнести";
    cst1="камешки кирпичи кирпичики куски";
    cst2="камешкам камешку камням кирпичам кирпичикам кирпичику";
    cst3="выстрел очередь пуля удар";
    cst5="щепы";
    cst4="основания";
    if ( bw(-2,cst3) &&
         bw(-1,cst) && s(-2,-1) )
    { l[i]=omo2; Z[805]++; if(dbg){print "Z805"}; continue };
    if ( bw(-1,cst3) &&
         bw(1,cst) && s(-1,0) )
    { l[i]=omo2; Z[806]++; if(dbg){print "Z806"}; continue };
    if ( qy(1,"qast_any mest_3e") &&
         bw(1+qyn,cst) && s(0,1+qyn) &&
        qxw(2+qyn,"по",cst2) )
    { l[i]=omo1; Z[807]++; if(dbg){print "Z807"}; continue };
    if ( qy(1,"qast_any") &&
         bw(1+qyn,cst) && s(0,1+qyn) &&
        qxw(2+qyn,"до",cst4) )
    { l[i]=omo1; Z[808]++; if(dbg){print "Z808"}; continue };
    if ( qy(1,"qast_any") &&
         bw(1+qyn,cst) && s(0,1+qyn) &&
        qxw(2+qyn,"в",cst5) )
    { l[i]=omo1; Z[809]++; if(dbg){print "Z809"}; continue };

    if ( qxs(1,"заместитель","командира")||
         qxs(1,"начтыла") )
    { l[i]=omo2; Z[810]++; if(dbg){print "Z810"}; continue };

    cst1="капитулировать сдаться";
    cst2="возня минута секунда";
    if ( bw(-1,cst2) &&
         bw(1,cst1) && s(-1,0) )
    { l[i]=omo2; Z[811]++; if(dbg){print "Z811"}; continue };
    if ( w(1,"через после") &&
        bf(2,5,cst2) &&
        bw(bfn,cst1) && s(0,bfn) )
    { l[i]=omo2; Z[812]++; if(dbg){print "Z812"}; continue };
    if ( bw(1,cst1) &&
          w(2,"через после") &&
         bf(3,6,cst2) && s(0,bfn-1) )
    { l[i]=omo2; Z[813]++; if(dbg){print "Z813"}; continue };
    if ( bf(1,3,"охватить охватывать") && s(0,bfn) &&
          w(bfn+1,"трубку трубу") && Qf(1,bfn-1,"sz_iili pre_any") )
    { l[i]=omo2; Z[814]++; if(dbg){print "Z814"}; continue };

    if ( bf(1,3,"закрыться закрываться") && s(0,bfn+2) && Qf(1,bfn-1,"sz_iili pre_any") &&
          w(bfn+1,"на") &&
          q(bfn+2,"qik_vi") &&
         bw(bfn+3,"день месяц год век") )
    { l[i]=omo1; Z[815]++; if(dbg){print "Z815"}; continue };

    if ( bw(1,"загореться") &&
          w(2,"зеленым") && s(0,1) )
    { l[i]=omo2; Z[816]++; if(dbg){print "Z816"}; continue };

    # _castle_pe и _lock_pe
    bba(-7,-1,"_lock_pe"); bb_n=bbn;
    # escape:start
    cst="отбрасывать";
    if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
           bw(bb_n,cst) &&
          qaw(bb_n+1,"вокруг","себя") &&
          qir(awn+1,-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") )
    { l[i]=omo1; Z[817]++; if(dbg){print "Z817"}; continue };
    cst="заменить";
    if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
     ( isname(0) || q_w(1,"isname") ) &&
           bw(bb_n,cst) )
    { l[i]=omo1; Z[818]++; if(dbg){print "Z818"}; continue };
    cst="открывать открываться открыть открыться";
    cst1="взгляду взору";
    if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
           bw(bb_n,cst) &&
            w(bb_n+1,cst1) &&
          qir(bb_n+2,-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") )
    { l[i]=omo1; Z[819]++; if(dbg){print "Z819"}; continue };

    bba(-5,qbn-1,"_castle_pe"); bb_n=bbn;
    if ( vgle(bb_n,-5,-1) && s(bb_n,0) &&
            q(bb_n,"prq_any") &&
          qir(bb_n+1,-1,"prl_vi mest_vi mest_3e prl_kred_sr nar_any qast_any") &&
            q(1,"suw_any") )
    { l[i]=omo1; Z[820]++; if(dbg){print "Z820"}; continue };

    # escape:end

    # _castle_pe с предлогами между глаголами и "замок":start
    #
    # поиск по pre_vi + _castle_pe: qb_n и bb_n
    qb(-7,-2,"pre_vi"); bba(qbn-5,qbn-1,"_castle_pe"); qb_n=qbn; bb_n=bbn;
    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            Q(bb_n,"suw_any") &&
          qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
          qir(qb_n+1,-2,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
            q(-1,"suw_vi") )
    { l[i]=omo1; Z[821]++; if(dbg){print "Z821"}; continue };
    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            Q(bb_n,"suw_any") &&
          qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
            q(qb_n+1,"suw_vi") &&
          qir(qb_n+2,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
    { l[i]=omo1; Z[822]++; if(dbg){print "Z822"}; continue };

    # поиск по pre_da + _castle_pe: qb_n и bb_n
    qb(-7,-2,"pre_da"); bba(qbn-5,qbn-1,"_castle_pe"); qb_n=qbn; bb_n=bbn;
    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            w(1,"на") &&
          bfa(2,5,"_lock_na_suw") && s(0,bfn-1) &&
          qir(2,bfn-1,"prl_vi prl_pr mest_vi mest_pr prq_vi prq_pr") )
    { l[i]=omo2; Z[823]++; if(dbg){print "Z823"}; continue };

    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            Q(bb_n,"suw_any") &&
          qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
          qir(qb_n+1,-2,"prl_da mest_da prq_da mest_3e prl_kred_sr nar_any qast_any") &&
            q(-1,"suw_da") )
    { l[i]=omo1; Z[824]++; if(dbg){print "Z824"}; continue };
    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            Q(bb_n,"suw_any") &&
          qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
            q(qb_n+1,"suw_da") &&
          qir(qb_n+2,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
    { l[i]=omo1; Z[825]++; if(dbg){print "Z825"}; continue };

    # поиск по pre_ro + _castle_pe: qb_n и bb_n
    qb(-7,-2,"pre_ro"); bba(qbn-5,qbn-1,"_castle_pe"); qb_n=qbn; bb_n=bbn;
    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            Q(bb_n,"suw_any") &&
          qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
          qir(qb_n+1,-2,"prl_ro mest_ro prq_ro mest_3e prl_kred_sr nar_any qast_any") &&
            q(-1,"suw_ro") )
    { l[i]=omo1; Z[826]++; if(dbg){print "Z826"}; continue };
    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            Q(bb_n,"suw_any") &&
          qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
            q(qb_n+1,"suw_ro") &&
          qir(qb_n+2,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
    { l[i]=omo1; Z[827]++; if(dbg){print "Z827"}; continue };

    # поиск по pre_tv + _castle_pe: qb_n и bb_n
    qb(-7,-2,"pre_tv"); bba(qbn-5,qbn-1,"_castle_pe"); qb_n=qbn; bb_n=bbn;
    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            Q(bb_n,"suw_any") &&
          qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
          qir(qb_n+1,-2,"prl_tv mest_tv prq_tv mest_3e prl_kred_sr nar_any qast_any") &&
            q(-1,"suw_tv") )
    { l[i]=omo1; Z[828]++; if(dbg){print "Z828"}; continue };
    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            Q(bb_n,"suw_any") &&
          qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
            q(qb_n-1,"suw_tv") &&
          qir(qb_n+2,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
    { l[i]=omo1; Z[829]++; if(dbg){print "Z829"}; continue };

    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            Q(bb_n,"suw_any") &&
          qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
            q(qb_n+1,"suw_tv") &&
          qir(qb_n+2,-1,"suw_ro suw_edne isname prl_ro mest_ro prq_ro prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
    { l[i]=omo1; Z[830]++; if(dbg){print "Z830"}; continue };

    # поиск по pre_pr + _castle_pe: qb_n и bb_n
    qb(-7,-2,"pre_pr"); bba(qbn-5,qbn-1,"_castle_pe"); qb_n=qbn; bb_n=bbn;
    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            Q(bb_n,"suw_any") &&
          qir(bb_n+1,qb_n-1,"suw_da prl_da mest_da prq_da nar_mest prl_kred_sr") &&
          qir(qb_n+1,-2,"prl_pr prq_pr mest_pr mest_3e") &&
            q(-1,"suw_pr") )
    { l[i]=omo1; Z[831]++; if(dbg){print "Z831"}; continue };
    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            Q(bb_n,"suw_any") &&
          qir(bb_n+1,qb_n-1,"suw_da prl_da mest_da prq_da nar_mest prl_kred_sr") &&
            q(qb_n+1,"suw_pr isname") &&
          qir(qb_n+2,-1,"prl_vi prq_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[832]++; if(dbg){print "Z832"}; continue };
    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            Q(bb_n,"suw_any") &&
          qir(bb_n+1,qb_n-1,"suw_da prl_da mest_da prq_da nar_mest prl_kred_sr") &&
          qir(qb_n+1,-3,"prl_pr prq_pr mest_pr mest_3e") &&
            q(-2,"suw_pr isname") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[833]++; if(dbg){print "Z833"}; continue };

    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            Q(bb_n,"suw_any") &&
       pre_ro(bb_n+1) &&
          qir(bb_n+2,qb_n-1,"suw_ro prl_ro mest_ro prq_ro nar_mest prl_kred_sr") &&
          qir(qb_n+1,-3,"prl_pr prq_pr mest_pr mest_3e") &&
            q(-2,"suw_pr isname") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[834]++; if(dbg){print "Z834"}; continue };
    # _castle_pe с предлогами между глаголами и "замок":end

    # _lock_pe с предлогами между глаголами и "замок":start
    #
    qb(-7,-2,"pre_vi"); bba(qbn-7,qbn-1,"_lock_pe"); bb_n=bbn; qb_n=qbn;
    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qbn-7,qbn-1) && s(bb_n,-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
            q(qb_n+1,"suw_vi mest_vi") &&
          qir(qb_n+2,-1,"prl_vi prq_vi mest_vi mest_3e nar_any") )
    { l[i]=omo2; Z[835]++; if(dbg){print "Z835"}; continue };
    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qbn-7,qbn-1) && s(bb_n,-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
          qir(qb_n+1,-2,"prl_vi prq_vi mest_vi mest_3e nar_any") &&
            q(-1,"suw_vi mest_vi") )
    { l[i]=omo2; Z[836]++; if(dbg){print "Z836"}; continue };
    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qbn-7,qbn-1) && s(bb_n,-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
            q(qb_n+1,"suw_vi") &&
          qir(qb_n+2,-1,"suw_ro prl_ro mest_ro prq_ro") )
    { l[i]=omo2; Z[837]++; if(dbg){print "Z837"}; continue };
    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qbn-7,qbn-1) && s(bb_n,-1) &&
          qir(bb_n+1,qb_n-1,"suw_im prl_im prq_im mest_im mest_3e nar_any") &&
            q(qb_n+1,"suw_vi") &&
          qir(qb_n+2,-1,"suw_ro prl_ro mest_ro prq_ro") )
    { l[i]=omo2; Z[838]++; if(dbg){print "Z838"}; continue };
    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qbn-7,qbn-1) && s(bb_n,-1) &&
          qir(bb_n+1,qb_n-1,"suw_im prl_im prq_im mest_im mest_3e nar_any") &&
            q(qb_n+1,"suw_vi") &&
          qir(qb_n+2,-2,"suw_ro prl_ro mest_ro prq_ro") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e nar_any") )
    { l[i]=omo2; Z[839]++; if(dbg){print "Z839"}; continue };
    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qbn-7,qbn-1) && s(bb_n,-1) &&
          qir(bb_n+1,qb_n-1,"suw_da prl_da prq_da mest_da mest_3e nar_any") &&
            q(qb_n+1,"suw_vi") &&
          qir(qb_n+2,-1,"suw_ro prl_ro mest_ro prq_ro") )
    { l[i]=omo2; Z[840]++; if(dbg){print "Z840"}; continue };
    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qbn-7,qbn-1) && s(bb_n,-1) &&
          qir(qb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
          qir(qb_n+1,-3,"prl_vi prq_vi mest_vi mest_3e") &&
            q(-2,"suw_vi mest_vi") &&
            q(-1,"prl_vi prq_vi mest_vi mest_3e") )
    { l[i]=omo2; Z[841]++; if(dbg){print "Z841"}; continue };
    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qbn-7,qbn-1) && s(bb_n,-1) &&
          qir(qb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
            q(qbn+1,"prl_vi prq_vi mest_vi mest_3e") &&
            q(qb_n+2,"suw_vi mest_vi") &&
          qir(qb_n+3,-1,"prl_vi prq_vi mest_vi mest_3e") )
    { l[i]=omo2; Z[842]++; if(dbg){print "Z842"}; continue };

    if ( vgle(qb_n,-7,-2) && vgle(bb_n,qbn-7,qbn-1) && s(bb_n,-1) &&
            w(bb_n+1,"у") &&
          qir(bb_n+2,qb_n-2,"prl_ro mest_ro mest_3e prq_ro") &&
            q(qb_n-1,"suw_ro mest_ro") &&
          qir(qbn+1,-2,"prl_vi mest_vi prq_vi") &&
            q(-1,"suw_vi mest_vi") )
    { l[i]=omo2; Z[843]++; if(dbg){print "Z843"}; continue };

    #
    qb(-7,-2,"pre_ro"); bba(qbn-5,qbn-1,"_lock_pe"); qb_n=qbn; bb_n=bbn;
    if ( vgle(qb_n,-5,-1) && vgle(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
          qir(qb_n+1,-2,"prl_ro mest_ro mest_3e") &&
            q(-1,"suw_ro mest_ro") )
    { l[i]=omo2; Z[844]++; if(dbg){print "Z844"}; continue };
    if ( vgle(qb_n,-5,-1) && vgle(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
            q(qb_n+1,"suw_ro mest_ro") &&
          qir(qb_n+2,-1,"prl_vi mest_vi mest_3e prq_vi") )
    { l[i]=omo2; Z[845]++; if(dbg){print "Z845"}; continue };

    #
    qb(-7,-2,"pre_tv"); bba(qbn-5,qbn-1,"_lock_pe"); qb_n=qbn; bb_n=bbn;
    if ( vgle(qb_n,-5,-1) && vgle(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
          qir(qb_n+1,-2,"prl_tv mest_tv mest_3e") &&
            q(-1,"suw_tv mest_tv") )
    { l[i]=omo2; Z[846]++; if(dbg){print "Z846"}; continue };
    if ( vgle(qb_n,-5,-1) && vgle(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
          qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
            q(qb_n+1,"suw_tv mest_tv") &&
          qir(qb_n+2,-1,"prl_vi mest_vi mest_3e prq_vi") )
    { l[i]=omo2; Z[847]++; if(dbg){print "Z847"}; continue };

    #
    qb(-7,-2,"pre_pr"); bba(qbn-5,qbn-1,"_lock_pe"); qb_n=qbn; bb_n=bbn;
    if ( vgle(qb_n,-5,-1) && vgle(bb_n,qb_n-5,qb_n-1) && Q_w(1,"isname") &&
          qir(bb_n+1,qb_n-1,"nar_any qast_any") &&
          qir(qb_n+1,-1,"suw_pr suw_ro suw_edne mest_vip3e prl_pr mest_pr mest_3e prq_pr isname") && s(bb_n,-1) )
    { l[i]=omo2; Z[848]++; if(dbg){print "Z848"}; continue };
    if ( vgle(qb_n,-5,-1) && vgle(bb_n,qb_n-5,qb_n-1) && Q_w(1,"isname") &&
          qir(bb_n+1,qb_n-1,"nar_any qast_any") &&
          qir(qb_n+1,-2,"suw_pr mest_vip3e prl_pr mest_pr mest_3e prq_pr isname") &&
            q(-1,"prl_vi mest_vi mest_3e prq_vi") && s(bb_n,-1) )
    { l[i]=omo2; Z[849]++; if(dbg){print "Z849"}; continue };
    # _lock_pe с предлогами между глаголами и "замок":end



    # _castle_pe самостоятельно
    bba(-7,-1,"_castle_pe"); bb_n=bbn;
    if ( vgle(bb_n,-7,-1) && xw(bb_n,"X_castle_pe") )
    { bb_n=""; Z[850]++; if(dbg){print "Z850"};};

      if ( veq(bb_n,-1) && s(-1) && q(-1,"prq_any gl_in") )
      { l[i]=omo1; Z[851]++; if(dbg){print "Z851"}; continue };

    if ( vgle(bb_n,-7,-1) && bfa(bb_n+1,-1,"_lock_pe") && s(bfn,-1) )
    { bb_n=""; Z[852]++; if(dbg){print "Z852"};};
    if ( veq(bb_n,-1) && q(bb_n,"predik vvod") && s(-1) && zs(-2) )
    { bb_n=""; Z[853]++; if(dbg){print "Z853"};};

      if ( veq(bb_n,-2) && s(bb_n,-1) && wc(-1,"ский$") )
      { l[i]=omo1; Z[854]++; if(dbg){print "Z854"}; continue };

      if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
             (p(bb_n-1)||p(0)||q_w(1,"sz_i")||(q_w(1,"nar_any")&& s(0)) ) &&
            qia(bb_n+1,-1,"sz_i","prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
      { l[i]=omo1; Z[855]++; if(dbg){print "Z855"}; continue };
      if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
            qir(bb_n+1,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
      { l[i]=omo1; Z[856]++; if(dbg){print "Z856"}; continue };
      if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
            qir(bb_n+1,-1,"suw_da prl_da mest_da prq_da mest_3e prl_kred_sr nar_any qast_any") )
      { l[i]=omo1; Z[857]++; if(dbg){print "Z857"}; continue };
      if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
            qir(bb_n+1,-1,"suw_ro prl_ro mest_ro prq_ro mest_3e prl_kred_sr nar_any qast_any") )
      { l[i]=omo1; Z[858]++; if(dbg){print "Z858"}; continue };
      if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
            qir(bb_n+1,-2,"suw_da prl_da mest_da prq_da mest_3e prl_kred_sr nar_any qast_any") &&
              q(-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
      { l[i]=omo1; Z[859]++; if(dbg){print "Z859"}; continue };
      if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
              q(bb_n+1,"suw_da mest_da") &&
            qir(bb_n+2,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
      { l[i]=omo1; Z[860]++; if(dbg){print "Z860"}; continue };
      if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
              q(bb_n+1,"suw_da mest_da") &&
              q(bb_n+2,"suw_im mest_im") &&
            qir(bb_n+3,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
      { l[i]=omo1; Z[861]++; if(dbg){print "Z861"}; continue };
      if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
            qir(bb_n+1,-1,"suw_im prl_im mest_im prq_im isname mest_3e prl_kred_sr nar_any qast_any") )
      { l[i]=omo1; Z[862]++; if(dbg){print "Z862"}; continue };
      if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
              q(bb_n+1,"suw_im mest_im isname prq_im") &&
            qir(bb_n+2,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
      { l[i]=omo1; Z[863]++; if(dbg){print "Z863"}; continue };
      if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
            qir(bb_n+1,-1,"suw_tv prl_tv mest_tv prq_tv mest_3e prl_kred_sr nar_any qast_any") )
      { l[i]=omo1; Z[864]++; if(dbg){print "Z864"}; continue };
      if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
            qir(bb_n+1,-2,"suw_tv prl_tv mest_tv prq_tv mest_3e prl_kred_sr nar_any qast_any") &&
              q(-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
      { l[i]=omo1; Z[865]++; if(dbg){print "Z865"}; continue };
      if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
              q(bb_n+1,"suw_tv mest_tv") &&
            qir(bb_n+2,-1,"prl_tv mest_tv prq_tv mest_3e prl_kred_sr nar_any qast_any") )
      { l[i]=omo1; Z[866]++; if(dbg){print "Z866"}; continue };

      qb(-5,-1,"sz_iili"); bba(qb_n-5,qb_n-1,"_castle_pe"); qb_n=qbn; bb_n=bbn;
      if ( vgle(qb_n,-5,-1) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            bfa(1,5,"_lock_pe") && s(0,bfn) &&
            qir(1,bfn-1,"gl_aux_be mod_any prl_kred_sr") )
      { qb_n=bb_n=""; Z[867]++; if(dbg){print "Z867"}; };

      if ( vgle(qb_n,-5,-1) && vgle(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
            qir(qb_n+1,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
      { l[i]=omo1; Z[868]++; if(dbg){print "Z868"}; continue };

      if ( vv(0,4) && !(se(0,", — ") && !se(vvn,", — ") ) &&
        !(bfa(1,vvn-1,"_castle_pe") ) &&
        !(bba(-4,-1,"_castle_environs") && sq(bbn,-1,"[, ]") ) &&
        !(bba(-4,-1,"_castle_pe") && s(bbn,-1)) &&
           ba(vvn+1,"_lock_pe") )
      { l[i]=omo2; Z[869]++; if(dbg){print "Z869"}; continue };
      if ( z(0) &&
           q(1,"prl_kred_sr") &&
           q(2,"mest_3e") &&
          ba(3,"_lock_pe") && s(1,2) )
      { l[i]=omo2; Z[870]++; if(dbg){print "Z870"}; continue };


    if ( q(-1,"narph_any") &&
       bfa(xwn-3,xwn-1,"_castle_pe") && s(bfn,-1) && Q(bfn,"suw_any") )
    { l[i]=omo1; Z[871]++; if(dbg){print "Z871"}; continue };
    # _castle_pe <<---:end

    # _lock_pe <<<---:start
    bba(-7,-1,"_lock_pe"); bb_n=bbn;
    if ( veq(bb_n,-1) && q(bb_n,"predik vvod") && s(-1) && zs(-2) )
    { bb_n=""; Z[872]++; if(dbg){print "Z872"};};

    if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
          qir(bb_n+1,-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") )
    { l[i]=omo2; Z[873]++; if(dbg){print "Z873"}; continue };
    if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
            q(bb_n+1,"suw_tv mest_tv") &&
          qir(bb_n+2,-1,"prl_vi prq_vi mest_vi mest_3e qast") )
    { l[i]=omo2; Z[874]++; if(dbg){print "Z874"}; continue };
    if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
            q(bb_n+1,"prq_vi") &&
            q(bb_n+2,"suw_vi mest_vi") &&
          qir(bb_n+3,-1,"prl_vi prq_vi mest_vi mest_3e qast") )
    { l[i]=omo2; Z[875]++; if(dbg){print "Z875"}; continue };
    if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
            q(bb_n+1,"prl_tv prq_tv mest_tv") &&
            q(bb_n+2,"suw_tv mest_tv") &&
          qir(bb_n+3,-1,"prl_vi prq_vi mest_vi mest_3e qast") )
    { l[i]=omo2; Z[876]++; if(dbg){print "Z876"}; continue };
    if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
            q(bb_n+1,"suw_da mest_da") &&
          qir(bb_n+2,-1,"prl_vi prq_vi mest_vi mest_3e qast") )
    { l[i]=omo2; Z[877]++; if(dbg){print "Z877"}; continue };
    if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
          qir(bb_n+1,-2,"prl_tv prq_tv mest_tv") &&
            q(-1,"suw_tv mest_tv") )
    { l[i]=omo2; Z[878]++; if(dbg){print "Z878"}; continue };
    if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
            q(bb_n+1,"suw_im mest_im isname") &&
          qir(bb_n+2,-1,"prl_vi prq_vi mest_vi mest_3e qast_any") )
    { l[i]=omo2; Z[879]++; if(dbg){print "Z879"}; continue };
    if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
          qir(bb_n+1,-1,"suw_odim prl_im prq_im mest_im mest_3e qast_any isname") )
    { l[i]=omo2; Z[880]++; if(dbg){print "Z880"}; continue };
    if ( vgle(bb_n,-7,-1) &&
          qir(bb_n+1,-2,"prl_ro prq_ro mest_ro mest_3e qik_vi") &&
            q(-1,"suw_ro") && s(bb_n,-1) )
    { l[i]=omo2; Z[881]++; if(dbg){print "Z881"}; continue };
    if ( vgle(bb_n,-7,-1) && s(bb_n,-1) &&
            q(bb_n+1,"prq_vi") &&
          qir(bb_n+2,-2,"prl_tv prq_tv mest_tv") &&
            q(-1,"suw_tv") )
    { l[i]=omo2; Z[882]++; if(dbg){print "Z882"}; continue };


    if ( q(-1,"narph_any") &&
       bfa(xwn-3,xwn-1,"_lock_pe") && s(bfn,-1) && Q(bfn,"suw_any") )
    { l[i]=omo2; Z[883]++; if(dbg){print "Z883"}; continue };
    # _lock_pe <<<---:end

    # _castle_pe --->>>:start
    bfa(1,6,"_castle_pe"); bf_n=bfn;
    if ( vgle(bf_n,1,6) && zs(0) && s(1,bf_n-1) &&
            q(bf_n,"mod_any") && q(bf_n+1,"gl_in") && !ba(bf_n+1,"_castle_pe") )
    { bf_n=""; Z[884]++; if(dbg){print "Z884"}; };
    if ( vgle(bf_n,1,6) && zs(0) && s(1,bf_n-1) &&
            q(bf_n,"mod_any") && q(bf_n+1,"gl_in") && ba(bf_n+1,"_castle_pe") )
    { bf_n=bf_n+1; Z[885]++; if(dbg){print "Z885"}; };

    if ( vgle(bf_n,1,6) && s(0,bf_n-1) && Q(bf_n,"suw_any") && Qf(1,bf_n-1,"sz_iili pre_any") &&
          !ba(bf_n,"_castle_pe_notrh") && !bfa(1,bf_n-1,"_lock_pe") &&
        !(bba(-5,-1,"_lock_pe") && Q(bbn,"prq_any vvod") && Qf(bbn+1,-1,"sz_iili pre_any") && s(bbn,-1)) )
    { l[i]=omo1; Z[886]++; if(dbg){print "Z886"}; continue };
    if ( vgle(bf_n,1,6) && z(0) && s(1,bf_n-1) &&
       !((bba(-4,-1,"_lock_pe") || bba(-4,-1,"_gl_v_lock-iv")) && s(bbn,-1)) &&
          qir(1,bf_n-1,"otsz_mu nar_any mest_any qast mod_any isname") &&
          !ba(bf_n,"_castle_pe_notrh") )
    { l[i]=omo1; Z[887]++; if(dbg){print "Z887"}; continue };
    if ( vgle(bf_n,1,6) && s(0,bf_n-1) &&
       pre_tv(1) &&
            q(bf_n-1,"suw_tv") &&
          qir(2,bf_n-2,"prl_tv mest_tv mest_3e prq_tv") )
    { l[i]=omo1; Z[888]++; if(dbg){print "Z888"}; continue };


#   if ( bfa(1,5,"_castle_pe") && s(0,bfn-1) && Q(bfn,"suw_any") && Qf(1,bfn-1,"sz_iili pre_any") &&
#        !ba(bfn,"_castle_pe_notrh") && !bfa(1,bfn-1,"_lock_pe") &&
#      !(bba(-5,-1,"_lock_pe") && Q(bbn,"prq_any vvod") && Qf(bbn+1,-1,"sz_iili pre_any") && s(bbn,-1)) )
#   { l[i]=omo1; Z[889]++; if(dbg){print "Z889"}; continue };
#   if ( z(0) && !((bba(-4,-1,"_lock_pe") || bba(-4,-1,"_gl_v_lock-iv")) && s(bbn,-1)) &&
#      bfa(2,6,"_castle_pe") &&
#      qir(1,bfn-1,"otsz_mu nar_any mest_any qast mod_any isname") &&
#        s(1,bfn-1) && !ba(bfn,"_castle_pe_notrh") )
#   { l[i]=omo1; Z[890]++; if(dbg){print "Z890"}; continue };


    if ( q(1,"narph_any") &&
       bfa(xwn+1,xwn+3,"_castle_pe") && s(0,bfn-1) && Q(bfn,"suw_any") )
    { l[i]=omo1; Z[891]++; if(dbg){print "Z891"}; continue };

    if ( q(1,"mest_im suw_im") && s(0) &&
       qxs(2,"так","и","не") &&
        ba(xsn+1,_castle_pe) && Q(xsn+1,"suw_any") && s(xsn+1) )
    { l[i]=omo1; Z[892]++; if(dbg){print "Z892"}; continue };
    # _castle_pe --->>>:end


    # _lock_pe --->>>:start
    if ( bfa(1,3,"_lock_pe") && s(0,bfn-1) &&
          Qf(1,bfn-1,"sz_iili pre_any") && !(isname(0) && zs(-1) ) )
    { l[i]=omo2; Z[893]++; if(dbg){print "Z893"}; continue };
    if ( w(1,"на") &&
         q(2,"suw_vi mest_vi") &&
       bfa(3,5,"_lock_pe") &&
         s(0,bfn-1) && Qf(3,bfn-1,"sz_iili pre_any") )
    { l[i]=omo2; Z[894]++; if(dbg){print "Z894"}; continue };
    if ( qxs(-1,"еще","один") &&
           q(xsn-1,"gl_pein gl_peed gl_pemn gl_poed deep_pe") && s(xsn-1) &&
        sz_i(1) &&
          ba(2,"_lock_pe") && s(0,1) )
    { l[i]=omo2; Z[895]++; if(dbg){print "Z895"}; continue };
    if ( pre_pr(1) &&
              q(2,"suw_pr") &&
              q(3,"suw_ro") &&
         pre_tv(4) &&
              q(5,"suw_tv") &&
             ba(6,"_lock_pe") && s(0,5) )
    { l[i]=omo2; Z[896]++; if(dbg){print "Z896"}; continue };

    if ( q(1,"narph_any") &&
       bfa(xwn+1,xwn+3,"_lock_pe") && s(0,bfn-1) && Q(bfn,"suw_any") )
    { l[i]=omo2; Z[897]++; if(dbg){print "Z897"}; continue };

    if ( z(0) &&
         q(1,"otsz_mu") &&
       bfa(2,4,"_lock_pe") && s(1,bfn-1) && Qf(2,bfn-1,"sz_iili pre_any") )
    { l[i]=omo2; Z[898]++; if(dbg){print "Z898"}; continue };
    # _lock_pe --->>>:end

    # _castle_prl_geo:start
    cst1="быть ведь же стать считаться являться";
    if ( prl_im(-1) && ba(-1,"_castle_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[899]++; if(dbg){print "Z899"}; continue };
    if ( prl_im(-2) && ba(-2,"_castle_prl_geo") &&
              Q(-1,"suw_any") && s(-2,-1)  )
    { l[i]=omo1; Z[900]++; if(dbg){print "Z900"}; continue };
    if ( prl_im(1) && ba(1,"_castle_prl_geo") && s(0) && !prl_ro(1))
    { l[i]=omo1; Z[901]++; if(dbg){print "Z901"}; continue };
    if ( prl_im(1) && bw(1,cst1) &&
            bfa(2,5,"_castle_prl_geo") && s(0,bfn-1) &&
             Qf(2,bfn-1,"pre_any sz_iili")  )
    { l[i]=omo1; Z[902]++; if(dbg){print "Z902"}; continue };
    # _castle_prl_geo:start

    # _castle_prl_after:start
    if ( q(-1,"prl_im prl_kred_mu") && ba(-1,"_castle_prl_after") && s(-1) )
    { l[i]=omo1; Z[903]++; if(dbg){print "Z903"}; continue };
    # _castle_prl_after:start

    # _lock_prl_after:start
    if ( q(-1,"prl_im prl_kred_mu") && ba(-1,"_lock_prl_after") && s(-1) )
    { l[i]=omo2; Z[904]++; if(dbg){print "Z904"}; continue };
    # _castle_lock_after:start


 }; # и.п. и в.п. замок замки
  ######################################################################################################

 ### замка замков р.п.
 if(iwrd=="замка" || iwrd=="замков") {
 #
    if ( q(-1,"prq_edmuro prq_mnro") && ba(-1,"_prq_castle") && s(-1) )
    { l[i]=omo1; Z[905]++; if(dbg){print "Z905"}; continue };
    cst="окружить";
    if ( q(-2,"prq_edmuro prq_mnro") && bw(-2,cst) &&
         q(-1,"suw_tv mest_tv") && s(-2,-1) )
    { l[i]=omo1; Z[906]++; if(dbg){print "Z906"}; continue };

    if ( q(-1,"prq_edmuro prq_mnro") && ba(-1,"_prq_lock") && s(-1) )
    { l[i]=omo2; Z[907]++; if(dbg){print "Z907"}; continue };

    # _castle_environs
    qb(-5,-1,"sz_iili"); bba(qbn-5,qbn-1,"_castle_environs"); bb_n=bbn; qb_n=qbn;
    if ( vgle(qb_n,-5,-1) && veq(bb_n,qb_n-1) && s(bb_n,-1) &&
            q(bb_n,"suw_ro") &&
          qir(qb_n+1,-1,"prl_ro prq_ro mest_ro qast_any") )
    { l[i]=omo1; Z[908]++; if(dbg){print "Z908"}; continue };

    cst="близ вблизи";
    wb(-5,-1,cst); wb_n=wbn;
    if ( vgle(wb_n,-5,-1) && s(wb_n,-1) &&
          qir(wb_n+1,-1,"prl_ro prq_ro mest_ro mest_3e") )
    { l[i]=omo1; Z[909]++; if(dbg){print "Z909"}; continue };

    cst="висеть";
    if ( bb(-5,-1,cst) && prq_ro(bbn) &&
     pre_pr(bbn+1) &&
        qir(bbn+2,-2,"prl_pr mest_pr mest_3e") &&
          q(-1,"suw_pr") && s(-1) )
    { l[i]=omo2; Z[910]++; if(dbg){print "Z910"}; continue };


    if ( bba(-5,-1,"_hw_castle-ro") &&
         qir(bbn+1,-1,"prl_ro prq_ro mest_ro mest_3e") && s(bbn,-1) )
    { l[i]=omo1; Z[911]++; if(dbg){print "Z911"}; continue };

    # _castle_prl:start
    if ( ba(-1,"_castle_prl") && prl_ro(-1) && s(-1)  )
    { l[i]=omo1; Z[912]++; if(dbg){print "Z912"}; continue };
    if ( ba(-2,"_castle_prl") && prl_ro(-2) &&
          q(-1,"prl_any prq_any mest_any qast") && s(-2,-1)  )
    { l[i]=omo1; Z[913]++; if(dbg){print "Z913"}; continue };
    if ( ba(-3,"_castle_prl") && prl_ro(-3) &&
          q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
          q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo1; Z[914]++; if(dbg){print "Z914"}; continue };
    if ( ba(1,"_castle_prl") && prl_ro(1) && s(0) )
    { l[i]=omo1; Z[915]++; if(dbg){print "Z915"}; continue };
    # _castle_prl:start

    # _lock_prl:start
    if ( ba(-1,"_lock_prl") && s(-1) && prl_ro(-1) )
    { l[i]=omo2; Z[916]++; if(dbg){print "Z916"}; continue };
    if ( ba(-2,"_lock_prl") && prl_ro(-2) &&
          Q(-1,"suw_any sz_iili") && s(-2,-1) )
    { l[i]=omo2; Z[917]++; if(dbg){print "Z917"}; continue };
    if ( ba(-3,"_lock_prl") && prl_ro(-3) &&
          q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
          q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo2; Z[918]++; if(dbg){print "Z918"}; continue };
    if ( ba(1,"_lock_prl") && s(0) && prl_ro(1) && !isname(1) )
    { l[i]=omo2; Z[919]++; if(dbg){print "Z919"}; continue };
    # _lock_prl:end

    # _castle_prl_geo:start
    if ( prl_ro(-1) &&
             ba(-1,"_castle_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[920]++; if(dbg){print "Z920"}; continue };
    if ( prl_ro(-2) &&
             ba(-2,"_castle_prl_geo") &&
              Q(-1,"suw_any") && s(-2,-1)  )
    { l[i]=omo1; Z[921]++; if(dbg){print "Z921"}; continue };
    if ( prl_ro(1) &&
             ba(1,"_castle_prl_geo") && s(0) && !prl_ro(1))
    { l[i]=omo1; Z[922]++; if(dbg){print "Z922"}; continue };
    # _castle_prl_geo:start

#   # _castle_prl_after:start
#   if ( q(-1,"prl_ro prl_kred_mu") && ba(-1,"_castle_prl_after") && s(-1) )
#   { l[i]=omo1; Z[923]++; if(dbg){print "Z923"}; continue };
#   # _castle_prl_after:start

#   # _lock_prl_after:start
#   if ( q(-1,"prl_ro prl_kred_mu") && ba(-1,"_lock_prl_after") && s(-1) )
#   { l[i]=omo2; Z[924]++; if(dbg){print "Z924"}; continue };
#   # _castle_lock_after:start

  }; # р.п. замка замков
  ######################################################################################################

 ### замком замками дат.п.
 if(iwrd=="замку" || iwrd=="замкам") {
 #
    if ( q(-1,"prq_edmuda prq_mnda") && ba(-1,"_prq_castle") && s(-1) )
    { l[i]=omo1; Z[925]++; if(dbg){print "Z925"}; continue };
    cst="окружить";
    if ( q(-2,"prq_edmuda prq_mnda") && bw(-2,cst) &&
         q(-1,"suw_tv mest_tv") && s(-2,-1) )
    { l[i]=omo1; Z[926]++; if(dbg){print "Z926"}; continue };

    if ( q(-1,"prq_edmuda prq_mnda") && ba(-1,"_prq_lock") && s(-1) )
    { l[i]=omo2; Z[927]++; if(dbg){print "Z927"}; continue };

    # _castle_environs
    qb(-5,-1,"sz_iili"); bba(qbn-5,qbn-1,"_castle_environs"); bb_n=bbn; qb_n=qbn;
    if ( vgle(qb_n,-5,-1) && veq(bb_n,qb_n-1) && s(bb_n,-1) &&
            q(bb_n,"suw_da") &&
          qir(qb_n+1,-1,"prl_da prq_da mest_da qast_any") )
    { l[i]=omo1; Z[928]++; if(dbg){print "Z928"}; continue };

  #
    # _castle_prl:start
    if ( ba(-1,"_castle_prl") && prl_da(-1) && s(-1)  )
    { l[i]=omo1; Z[929]++; if(dbg){print "Z929"}; continue };
    if ( ba(-2,"_castle_prl") && prl_da(-2) &&
          q(-1,"prl_any prq_any mest_any qast") && s(-2,-1)  )
    { l[i]=omo1; Z[930]++; if(dbg){print "Z930"}; continue };
    if ( ba(-3,"_castle_prl") && prl_da(-3) &&
          q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
          q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo1; Z[931]++; if(dbg){print "Z931"}; continue };
    if ( ba(1,"_castle_prl") && prl_da(1) && s(0) )
    { l[i]=omo1; Z[932]++; if(dbg){print "Z932"}; continue };
    # _castle_prl:start

    # _lock_prl:start
    if ( ba(-1,"_lock_prl") && s(-1) && prl_da(-1) )
    { l[i]=omo2; Z[933]++; if(dbg){print "Z933"}; continue };
    if ( ba(-2,"_lock_prl") && prl_da(-2) &&
          Q(-1,"suw_any sz_iili") && s(-2,-1) )
    { l[i]=omo2; Z[934]++; if(dbg){print "Z934"}; continue };
    if ( ba(-3,"_lock_prl") && prl_da(-3) &&
          q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
          q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo2; Z[935]++; if(dbg){print "Z935"}; continue };
    if ( ba(1,"_lock_prl") && s(0) && prl_da(1) && !isname(1) )
    { l[i]=omo2; Z[936]++; if(dbg){print "Z936"}; continue };
    # _lock_prl:end

    # _castle_prl_geo:start
    if ( prl_da(-1) &&
             ba(-1,"_castle_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[937]++; if(dbg){print "Z937"}; continue };
    if ( prl_da(-2) &&
             ba(-2,"_castle_prl_geo") &&
              Q(-1,"suw_any") && s(-2,-1)  )
    { l[i]=omo1; Z[938]++; if(dbg){print "Z938"}; continue };
    if ( prl_da(1) &&
             ba(1,"_castle_prl_geo") && s(0) && !prl_da(1))
    { l[i]=omo1; Z[939]++; if(dbg){print "Z939"}; continue };
    # _castle_prl_geo:start

#   # _castle_prl_after:start
#   if ( q(-1,"prl_da prl_kred_mu") && ba(-1,"_castle_prl_after") && s(-1) )
#   { l[i]=omo1; Z[940]++; if(dbg){print "Z940"}; continue };
#   # _castle_prl_after:start

#   # _lock_prl_after:start
#   if ( q(-1,"prl_da prl_kred_mu") && ba(-1,"_lock_prl_after") && s(-1) )
#   { l[i]=omo2; Z[941]++; if(dbg){print "Z941"}; continue };
#   # _castle_lock_after:start

  }; # дат.п. замку замкам
  ######################################################################################################


 ### замком замками тв.п.
 if(iwrd=="замком" || iwrd=="замками") {
 #
    if ( q(-1,"prq_edmutv prq_mntv") && ba(-1,"_prq_castle") && s(-1) )
    { l[i]=omo1; Z[942]++; if(dbg){print "Z942"}; continue };
    cst="окружить";
    if ( q(-2,"prq_edmutv prq_mntv") && bw(-2,cst) &&
         q(-1,"suw_tv mest_tv") && s(-2,-1) )
    { l[i]=omo1; Z[943]++; if(dbg){print "Z943"}; continue };

    if ( q(-1,"prq_edmutv prq_mntv") && ba(-1,"_prq_lock") && s(-1) )
    { l[i]=omo2; Z[944]++; if(dbg){print "Z944"}; continue };

    # _castle_environs
    qb(-5,-1,"sz_iili"); bba(qbn-5,qbn-1,"_castle_environs"); bb_n=bbn; qb_n=qbn;
    if ( vgle(qb_n,-5,-1) && veq(bb_n,qb_n-1) && s(bb_n,-1) &&
            q(bb_n,"suw_tv") &&
          qir(qb_n+1,-1,"prl_tv prq_tv mest_tv qast_any") )
    { l[i]=omo1; Z[945]++; if(dbg){print "Z945"}; continue };

 #
    # _castle_prl:start
    if ( ba(-1,"_castle_prl") && prl_tv(-1) && s(-1)  )
    { l[i]=omo1; Z[946]++; if(dbg){print "Z946"}; continue };
    if ( ba(-2,"_castle_prl") && prl_tv(-2) &&
          q(-1,"prl_any prq_any mest_any qast") && s(-2,-1)  )
    { l[i]=omo1; Z[947]++; if(dbg){print "Z947"}; continue };
    if ( ba(-3,"_castle_prl") && prl_tv(-3) &&
          q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
          q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo1; Z[948]++; if(dbg){print "Z948"}; continue };
    if ( ba(1,"_castle_prl") && prl_tv(1) && s(0) )
    { l[i]=omo1; Z[949]++; if(dbg){print "Z949"}; continue };
    # _castle_prl:start

    # _lock_prl:start
    if ( ba(-1,"_lock_prl") && s(-1) && prl_tv(-1) )
    { l[i]=omo2; Z[950]++; if(dbg){print "Z950"}; continue };
    if ( ba(-2,"_lock_prl") && prl_tv(-2) &&
          Q(-1,"suw_any sz_iili") && s(-2,-1) )
    { l[i]=omo2; Z[951]++; if(dbg){print "Z951"}; continue };
    if ( ba(-3,"_lock_prl") && prl_tv(-3) &&
          q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
          q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo2; Z[952]++; if(dbg){print "Z952"}; continue };
    if ( ba(1,"_lock_prl") && s(0) && prl_tv(1) && !isname(1) )
    { l[i]=omo2; Z[953]++; if(dbg){print "Z953"}; continue };
    # _lock_prl:end

    # _castle_prl_geo:start
    if ( prl_tv(-1) &&
             ba(-1,"_castle_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[954]++; if(dbg){print "Z954"}; continue };
    if ( prl_tv(-2) &&
             ba(-2,"_castle_prl_geo") &&
              Q(-1,"suw_any") && s(-2,-1)  )
    { l[i]=omo1; Z[955]++; if(dbg){print "Z955"}; continue };
    if ( prl_tv(1) &&
             ba(1,"_castle_prl_geo") && s(0) && !prl_tv(1))
    { l[i]=omo1; Z[956]++; if(dbg){print "Z956"}; continue };
    # _castle_prl_geo:start

#   # _castle_prl_after:start
#   if ( q(-1,"prl_tv prl_kred_mu") && ba(-1,"_castle_prl_after") && s(-1) )
#   { l[i]=omo1; Z[957]++; if(dbg){print "Z957"}; continue };
#   # _castle_prl_after:start

#   # _lock_prl_after:start
#   if ( q(-1,"prl_tv prl_kred_mu") && ba(-1,"_lock_prl_after") && s(-1) )
#   { l[i]=omo2; Z[958]++; if(dbg){print "Z958"}; continue };
#   # _castle_lock_after:start

  }; # тв.п. замком замками
  ######################################################################################################

 ### замке замках пр.п.
 if(iwrd=="замке" || iwrd=="замках") {
 #
    if ( q(-1,"prq_edmupr prq_mnpr") && ba(-1,"_prq_castle") && s(-1) )
    { l[i]=omo1; Z[959]++; if(dbg){print "Z959"}; continue };
    cst="окружить";
    if ( q(-2,"prq_edmupr prq_mnpr") && bw(-2,cst) &&
         q(-1,"suw_tv mest_tv") && s(-2,-1) )
    { l[i]=omo1; Z[960]++; if(dbg){print "Z960"}; continue };

    if ( q(-1,"prq_edmupr prq_mnpr") && ba(-1,"_prq_lock") && s(-1) )
    { l[i]=omo2; Z[961]++; if(dbg){print "Z961"}; continue };

    # _castle_environs
    qb(-5,-1,"sz_iili"); bba(qbn-5,qbn-1,"_castle_environs"); bb_n=bbn; qb_n=qbn;
    if ( vgle(qb_n,-5,-1) && veq(bb_n,qb_n-1) && s(bb_n,-1) &&
            q(bb_n,"suw_pr") &&
          qir(qb_n+1,-1,"prl_pr prq_pr mest_pr qast_any") )
    { l[i]=omo1; Z[962]++; if(dbg){print "Z962"}; continue };

  #
  # в замке
  if ( wb(-4,-1,"в во") && s(wbn,-1) ) {
  tn = wbn; # адрес поискового токена, в данном случае — "в"

  # определения между "в" и "замке"
  cst_mupr="prl_edmupr prl_mnpr mcop_edmupr mcop_mnpr qis_pr qik_pr prq_edmupr prq_mnpr qast_any mest_3e nar_kaq";

  cst="собственно";
  if ( (qir(tn+1,-1,cst_mupr)||
         wf(tn+1,-1,cst)||
         (q(tn+1,"prq_edmupr prq_mnpr") && qir(tn+2,-1,"mest_da suw_da prq_da nar_any suw_edmutv prl_edmutv prq_edmutv") )) )
  { tn_ok = 1 } else { tn_ok = "" };
  if ( qir(tn+1,-1,"prq_pr") &&
      (bba(tn+1,-1,"_castle_pe") || bba(tn+1,-1,"_lock_pe") ) &&
         q(1,"suw_vi isname suw_edne") )
  { tn_ok = "" };

  # _suw_v_castle-vp:start
  # escape
  if ( ba(tn-3,"_suw_v_lock") &&
        w(tn-2,"с") &&
        q(tn-1,"suw_tv") && s(tn-3,tn-1) )
  { l[i]=omo2; Z[963]++; if(dbg){print "Z963"}; continue };
  #
  if ( ba(tn-1,"_suw_v_castle-vp") && s(tn-1) )
  { l[i]=omo1; Z[964]++; if(dbg){print "Z964"}; continue };
  if ( ba(tn-2,"_suw_v_castle-vp") && s(tn-2,tn-1) &&
        q(tn-1,"prl_kred_sr nar_any mest_vi mest_3e prl_vi") )
  { l[i]=omo1; Z[965]++; if(dbg){print "Z965"}; continue };
  if ( bba(tn-6,tn-2,"_suw_v_castle-vp") &&
       qir(bbn+1,tn-2,"prl_ro prq_ro mcop_ro suw_ro") &&
         q(tn-1,"suw_ro mest_ro mest_3e qast nar_napr isname") && s(bbn,tn-1) )
  { l[i]=omo1; Z[966]++; if(dbg){print "Z966"}; continue };
  if ( bba(tn-7,tn-4,"_suw_v_castle-vp") &&
    pre_ro(bbn+1) &&
       qir(bbn+2,tn-1,"suw_ro prl_ro prq_ro mest_ro mest_3e isname") && s(bbn,tn-1) )
  { l[i]=omo1; Z[967]++; if(dbg){print "Z967"}; continue };
  # _suw_v_castle-vp:end
  } # в замке

    # _castle_prl:start
    if ( ba(-1,"_castle_prl") && prl_da(-1) && s(-1)  )
    { l[i]=omo1; Z[968]++; if(dbg){print "Z968"}; continue };
    if ( ba(-2,"_castle_prl") && prl_da(-2) &&
          q(-1,"prl_any prq_any mest_any qast") && s(-2,-1)  )
    { l[i]=omo1; Z[969]++; if(dbg){print "Z969"}; continue };
    if ( ba(-3,"_castle_prl") && prl_da(-3) &&
          q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
          q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo1; Z[970]++; if(dbg){print "Z970"}; continue };
    if ( ba(1,"_castle_prl") && prl_da(1) && s(0) )
    { l[i]=omo1; Z[971]++; if(dbg){print "Z971"}; continue };
    # _castle_prl:start

    # _lock_prl:start
    if ( ba(-1,"_lock_prl") && s(-1) && prl_da(-1) )
    { l[i]=omo2; Z[972]++; if(dbg){print "Z972"}; continue };
    if ( ba(-2,"_lock_prl") && prl_da(-2) &&
          Q(-1,"suw_any sz_iili") && s(-2,-1) )
    { l[i]=omo2; Z[973]++; if(dbg){print "Z973"}; continue };
    if ( ba(-3,"_lock_prl") && prl_da(-3) &&
          q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
          q(-1,"prl_any prq_any mest_any qast") && s(-3,-1)  )
    { l[i]=omo2; Z[974]++; if(dbg){print "Z974"}; continue };
    if ( ba(1,"_lock_prl") && s(0) && prl_da(1) && !isname(1) )
    { l[i]=omo2; Z[975]++; if(dbg){print "Z975"}; continue };
    # _lock_prl:end

    # _castle_prl_geo:start
    if ( prl_da(-1) &&
             ba(-1,"_castle_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[976]++; if(dbg){print "Z976"}; continue };
    if ( prl_da(-2) &&
             ba(-2,"_castle_prl_geo") &&
              Q(-1,"suw_any") && s(-2,-1)  )
    { l[i]=omo1; Z[977]++; if(dbg){print "Z977"}; continue };
    if ( prl_da(1) &&
             ba(1,"_castle_prl_geo") && s(0) && !prl_da(1))
    { l[i]=omo1; Z[978]++; if(dbg){print "Z978"}; continue };
    # _castle_prl_geo:start

#   # _castle_prl_after:start
#   if ( q(-1,"prl_pr prl_kred_mu") && ba(-1,"_castle_prl_after") && s(-1) )
#   { l[i]=omo1; Z[979]++; if(dbg){print "Z979"}; continue };
#   # _castle_prl_after:start

#   # _lock_prl_after:start
#   if ( q(-1,"prl_pr prl_kred_mu") && ba(-1,"_lock_prl_after") && s(-1) )
#   { l[i]=omo2; Z[980]++; if(dbg){print "Z980"}; continue };
#   # _castle_lock_after:start

  }; # пр.п. замке замках
  ######################################################################################################

 # перенос назад
 if ( z(-1) && ba(-1,"_castle_environs") )
 { l[i]=omo1; Z[981]++; if(dbg){print "Z981"}; continue };
 if ( z(0) && ba(1,"_castle_environs") && Q(1,"isname") )
 { l[i]=omo1; Z[982]++; if(dbg){print "Z982"}; continue };
 # перенос назад

 # _lock_parts:start
 bfa(1,5,"_lock_parts"); bf_n=bfn;
 if ( vgle(bf_n,1,5) && s(1,bf_n-1) && (s(0)||se(0," — ")) && bw(bf_n,"данное") )
 { bf_n=""; Z[983]++; if(dbg){print "Z983"}; };

 if ( vgle(bf_n,1,5) && s(1,bf_n-1) && (s(0)||se(0," — ")) && qf(1,bfn,"isname") )
 { bf_n=""; Z[984]++; if(dbg){print "Z984"}; };
 if ( vgle(bf_n,1,5) && s(1,bf_n-1) && (s(0)||se(0," — ")) && q(-1,"isname") && p(-2) )
 { bf_n=""; Z[985]++; if(dbg){print "Z985"}; };

 if ( vgle(bf_n,1,5) && z(0) && s(1,bf_n) &&
       qir(1,bf_n-1,"prl_any mest_any qast_any") &&
         q(bf_n+1,"otsz_mu") )
 { l[i]=omo2; Z[986]++; if(dbg){print "Z986"}; continue };
 if ( vgle(bf_n,1,5) && s(1,bf_n-1) && (s(0)||se(0," — ")) &&
       qir(1,bf_n-1,"mod_any gl_in gl_aux_be gl_ed gl_mn nar_any prl_kred_sr prl_any mest_any qast_any") )
 { l[i]=omo2; Z[987]++; if(dbg){print "Z987"}; continue };
 # _lock_parts:end

 # _castle_pe:start
 if ( z(0) && q(1,"prq_any") && ba(1,"_castle_pe") && s(1) && Q(1,"suw_any") )
 { l[i]=omo1; Z[988]++; if(dbg){print "Z988"}; continue };
 if ( z(0) &&
      q(1,"nar_spos prl_kred_sr") &&
      q(2,"prq_any") && ba(2,"_castle_pe") && s(1,2) && Q(-1,"suw_any") )
 { l[i]=omo1; Z[989]++; if(dbg){print "Z989"}; continue };
 if ( q(-3,"prq_any") && ba(-3,"_castle_pe") && Q(-3,"suw_any") &&
 pre_ro(-2) &&
      q(-1,"suw_ro") && s(-3,-1) )
 { l[i]=omo1; Z[990]++; if(dbg){print "Z990"}; continue };
 if ( q(-4,"prq_any") && ba(-4,"_castle_pe") && Q(-4,"suw_any") &&
 pre_ro(-3) &&
      q(-2,"prl_ro") &&
      q(-1,"suw_ro") && s(-4,-1) )
 { l[i]=omo1; Z[991]++; if(dbg){print "Z991"}; continue };
 if ( q(-1,"prq_any") && ba(-1,"_castle_pe") && s(-1) && Q(-1,"suw_any") )
 { l[i]=omo1; Z[992]++; if(dbg){print "Z992"}; continue };
 # _castle_pe:end

 # _lock_pe:start
 cst="ключ ручка";
 if ( qxs(-1,"как","и") &&
       bw(xsn-1,cst) && sc(xsn-1,",") &&
       ba(1,"_castle_pe") && Q(1,"suw_any") )
 { l[i]=omo2; Z[993]++; if(dbg){print "Z993"}; continue };
 if ( z(0) && q(1,"prq_any") && ba(1,"_lock_pe") && s(1) )
 { l[i]=omo2; Z[994]++; if(dbg){print "Z994"}; continue };
 if ( q(-1,"prq_any") && ba(-1,"_lock_pe") && s(-1) )
 { l[i]=omo2; Z[995]++; if(dbg){print "Z995"}; continue };
 # _lock_pe:end

 # _castle_v_suw-pr:start
 wf(1,6,"в во"); wf_n=wfn; wfa(wf_n+1,wf_n+4,"_castle_v_suw-pr"); bf_n=wfn;
 if ( vgle(wf_n,1,6) && vgle(bf_n,wf_n+1,wf_n+4) && zs(0) && s(1,bfn-1) &&
       qir(1,wf_n-1,"prl_any mest_any") &&
       qir(wf_n+1,bf_n-1,"prl_pr mest_pr mest_3e prq_pr") )
 { l[i]=omo1; Z[996]++; if(dbg){print "Z996"}; continue };

 wb(-6,-2,"в во"); wb_n=wbn; wba(wb_n+1,-1,"_castle_v_suw-pr"); bb_n=wbn;
 # escape:start
 cst8="ключ";
 if ( vgle(wb_n,-6,-2) && vgle(bb_n,wb_n+1,-1) &&
         w(wb_n-1,cst8) &&
       qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") && s(wb_n,bb_n-1) &&
       qia(bb_n+1,-1,"qast","prl_any mest_any nar_any suw_ro isname") && ds(bb_n) && s(bb_n+1,-1) )
 { l[i]=omo2; Z[997]++; if(dbg){print "Z997"}; continue };
# escape:end

 if ( vgle(wb_n,-6,-2) && vgle(bb_n,wb_n+1,-1) &&
       qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") && s(wb_n,bb_n-1) &&
       qia(bb_n+1,-1,"qast","prl_any mest_any nar_any suw_ro isname") && ds(bb_n) && s(bb_n+1,-1) )
 { l[i]=omo1; Z[998]++; if(dbg){print "Z998"}; continue };
 # _castle_v_suw-pr:end

 # похожий
 cst="походить похожий";
 if ( qy(1,"gl_aux_be") &&
      bw(1+qyn,cst) && zs(0) &&
       w(2+qyn,"на") &&
     bfa(3+qyn,6+qyn,"_castlelike_things") &&
     qir(3+qyn,bfn-1,"prl_vi mest_vi mest_3e prq_vi") && s(1+qyn,bfn-1) )
 { l[i]=omo1; Z[999]++; if(dbg){print "Z999"}; continue };
 # похожий

 # _lock_na_suw:start
 if ( w(-4,"на") &&
      q(-3,"prl_pr mest_pr mest_3e") &&
     ba(-2,"_lock_na_suw") &&
      q(-1,"prl_im prq_im mest_vi mest_3e") && s(-4,-1) )
 { l[i]=omo2; Z[1000]++; if(dbg){print "Z1000"}; continue };
 if ( ba(-2,"_lock_na_suw") && se(-2," — ") &&
       w(-1,"на") && s(-1) )
 { l[i]=omo2; Z[1001]++; if(dbg){print "Z1001"}; continue };
 if ( w(1,"на") &&
    bfa(2,5,"_lock_na_suw") && s(0,bfn-1) &&
    qir(2,bfn-1,"prl_vi prl_pr mest_vi mest_pr prq_vi prq_pr") )
 { l[i]=omo2; Z[1002]++; if(dbg){print "Z1002"}; continue }; #check ислючения "в"
 if ( w(1,"у") && Ww_(-1,"в") &&
      q(2,"suw_vi mest_vi isname") &&
      w(3,"на") &&
    qir(4,5,"prl_vi prl_pr mest_vi mest_pr mest_3e prq_vi prq_pr") &&
    bfa(4,7,"_lock_na_suw") && s(0,bfn-1) )
 { l[i]=omo2; Z[1003]++; if(dbg){print "Z1003"}; continue };
 cst="быть находиться располагаться расположиться стоять";
 if ( bw(1,cst) &&
       w(2,"на") && Ww_(-1,"в") &&
     qir(3,6,"prl_vi prl_pr mest_vi mest_pr mest_3e prq_vi prq_pr") &&
     bfa(3,7,"_lock_na_suw") && s(0,bfn-1) )
 { l[i]=omo2; Z[1004]++; if(dbg){print "Z1004"}; continue };
 # _lock_na_suw:end

 if ( wf(1,4,"дома") && s(0,wfn-1) &&
     qir(1,wfn-1,"prl_ro mest_ro prq_ro") &&
    !wfa(1,wfn-1,"_lock_suw-ro") && Ww_(-1,"под") )
 { l[i]=omo1; Z[1005]++; if(dbg){print "Z1005"}; continue };

 # замок, где...
 cst="страницы";
 if ( w(1,"где") && z(0) &&
     wf(2,5,cst) && s(1,wfn-1) &&
    qir(2,wfn-1,"mod_any gl_aux_be gl_nein")  )
 { l[i]=omo2; Z[1006]++; if(dbg){print "Z1006"}; continue };

 if ( z(0) && w(1,"где") )
 { l[i]=omo1; Z[1007]++; if(dbg){print "Z1007"}; continue };

 # цифры
 if ( wf(-7,-3,"в") && s(wfn) &&
  digits(wfn+1) &&
      qy(wfn+2,"digits") &&
       w(wfn+2+qyn,"году годах") &&
     qir(wfn+3+qyn,-1,"prl_vi mest_vi mest_3e") && s(wfn+2+qyn,-1) )
 { l[i]=omo1; Z[1008]++; if(dbg){print "Z1008"}; continue };
 if ( wf(-6,-2,"в") &&
   roman(wfn) &&
       w(wfn+1,"веке веках") &&
     qir(wfn+2,-1,"prl_vi mest_vi mest_3e") && s(wfn+1,-1) )
 { l[i]=omo1; Z[1009]++; if(dbg){print "Z1009"}; continue };

 # от обработки предыдущего в строке:start
 if ( gist(-4,2) &&
         w(-3,"не") &&
         q(-2,"gl_ed gl_mn gl_vzed gl_vzmn") && z(-2) &&
         w(-1,"а но и или") && s(0) )
 { l[i]=omo2; Z[1010]++; if(dbg){print "Z1010"}; continue };
 # от обработки предыдущего в строке:end

 if ( isname(1) && s(0) )
 { l[i]=omo1; Z[1011]++; if(dbg){print "Z1011"}; continue };
 if ( w(1,"де дю фон ди да дель ла ло ле лё") &&
 isname(2) && s(0,1) )
 { l[i]=omo1; Z[1012]++; if(dbg){print "Z1012"}; continue };
 if ( (qxs(1,"де","ла")||
       qxs(1,"фон","дер")) &&
    isname(xsn+1) && s(xsn) )
 { l[i]=omo1; Z[1013]++; if(dbg){print "Z1013"}; continue };
 if ( w(1,"д л") && sc(1,"[\x27’]") &&
 isname(2) && s(0) )
 { l[i]=omo1; Z[1014]++; if(dbg){print "Z1014"}; continue };
 if ( q(1,"pre_vi pre_ro pre_pr") &&
 isname(2) && s(0,1) && !(bb(-4,-1,"ключ ключик")) )
 { l[i]=omo1; Z[1015]++; if(dbg){print "Z1015"}; continue };
 if ( isname(-1) && ( (s(-2,-1) && sv(-2,")"))||(z(-2) && s(-1)) ) )
 { l[i]=omo1; Z[1016]++; if(dbg){print "Z1016"}; continue };
 if ( isname(0) && s(-1) )
 { l[i]=omo1; Z[1017]++; if(dbg){print "Z1017"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

}

function DEFINE_TN_OK_PREVI_ZAMOK(el) { # определение компонентов между "pre_vi" и "замок"

    tn=wbn; tn_ok="";
#   cst_muvi="prl_edmuvi prl_mnvi mcop_edmuvi mcop_mnvi qis_vi qik_vi prq_edmuvi prq_mnvi qast_any mest_3e nar_kaq nar_step";
    cst1_edmuvi="prl_edmuvi mcop_edmuvi qis_vi qik_vi prq_edmuvi qast_any mest_3e nar_kaq nar_step";
    cst1_mnvi="prl_mnvi mcop_mnvi qis_vi qik_vi prq_mnvi qast_any mest_3e nar_kaq nar_step";
    cst2_edmuvi="prl_edmuvi prq_edmuvi";
    cst2_mnvi="prl_mnvi prq_mnvi";
    cst3_edmuvi="prl_edmuvi mcop_edmuvi qis_vi qik_vi prq_edmuvi suw_ro suw_edne";
    cst3_mnvi="prl_mnvi mcop_mnvi qis_vi qik_vi prq_mnvi suw_ro suw_edne";

    if ( w(0,"замок") )
    { cst1 = cst1_edmuvi; cst2 = cst2_edmuvi;  cst3 = cst3_edmuvi; };
    if ( w(0,"замки") )
    { cst1 = cst1_mnvi;   cst2 = cst2_mnvi;    cst3 = cst3_mnvi    };

    if ( hwy(-1,"то") && qir(tn+1,-1-hyn,cst1) )
    { tn_ok = 1; Z[1018]++; if(dbg){print "Z1018", "-- tn_ok ON", el, "замок"};};
    if ( !vis(tn_ok) &&
            q(tn+1,cst2) && wy(-1,"же") &&
          qir(tn+2,-1-wyn,"mest_da suw_da prq_da nar_any prl_vi") )
    { tn_ok = 1; Z[1019]++; if(dbg){print "Z1019", "-- tn_ok ON", el, "замок"};};
    if ( !vis(tn_ok) &&
            q(tn+1,cst2) &&
          qir(tn+2,-2,"mest_tv prq_tv qik_tv nar_any prl_tv") &&
            q(-1,"suw_tv mest_tv") )
    { tn_ok = 1; Z[1020]++; if(dbg){print "Z1020", "-- tn_ok ON", el, "замок"};};
    if ( !vis(tn_ok) &&
            q(tn+1,cst2) &&
          qir(tn+2,-3,"mest_tv prq_tv qik_tv nar_any prl_tv") &&
            q(-2,"suw_tv qik_tv") &&
            q(-1,cst3) )
    { tn_ok = 1; Z[1021]++; if(dbg){print "Z1021", "-- tn_ok ON", el, "замок"};};
    if ( !vis(tn_ok) &&
            q(tn+1,cst2) &&
            q(tn+2,"pre_vi") &&
          qir(tn+3,-2,"prl_vi mest_vi mest_3e") &&
            q(-1,"mest_vip3e suw_vi") )
    { tn_ok = 1; Z[1022]++; if(dbg){print "Z1022", "-- tn_ok ON", el, "замок"};};
    if ( !vis(tn_ok) &&
            q(tn+1,cst2) &&
            q(tn+2,"pre_tv") &&
          qir(tn+3,-2,"prl_tv mest_tv mest_3e") &&
            q(-1,"suw_tv") )
    { tn_ok = 1; Z[1023]++; if(dbg){print "Z1023", "-- tn_ok ON", el, "замок"};};
    cst="именно собственно";
    if ( !vis(tn_ok) && qiw(tn+1,-1,cst1,cst) )
    { tn_ok = 1; Z[1024]++; if(dbg){print "Z1024", "-- tn_ok ON", el, "замок"};};
    if ( !vis(tn_ok) && veq(tn,-2) && wc(-1,"ский$") )
    { tn_ok = 1; Z[1025]++; if(dbg){print "Z1025", "-- tn_ok ON", el, "замок"};};
    # передвижка tn_ok
    if ( vis(tn_ok) &&
       ( qxs(tn-1,"как","и")||
         qxs(tn-1,"даже") ) )
    { tn = xsn; Z[1026]++; if(dbg){print "Z1026", "-- tn_ok MOV", el, "замок"};};
    # выключение tn_ok
    if ( vis(tn_ok) && qf(tn+1,-1,"prq_edmuvi prq_mnvi") &&
         bam(qfn,"_castle_pe _lock_pe") &&
           q(1,"suw_edmuvi suw_mnvi suw_edne") && s(0) )
    { tn_ok = ""; Z[1027]++; if(dbg){print "Z1027", "-- tn_ok OFF", el, "замок"};};
    if ( vis(tn_ok) &&
         qxs(-1,"прошлый тот этот","раз") )
    { tn_ok = ""; Z[1028]++; if(dbg){print "Z1028", "-- tn_ok OFF", el, "замок"};};
}

