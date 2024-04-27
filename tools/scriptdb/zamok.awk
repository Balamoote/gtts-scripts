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
#if ( q(1,"isname") && q(2,"isname") && q(3,"isname") && s(0,2) )
#{ print l[i+1] sep[i+1] l[i+2] sep[i+2] l[i+3] sep[i+3] >> "_isname.txt"; Z[7]++; if(dbg){print "Z7"}; }; continue
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

 # очистка переменных
 delete Y;

 # названия замков и имена владельцев:start
 if ( w3x(1,"_castle_w_w_w") && s(0,2) )
 { l[i]=omo1; Z[12]++; if(dbg){print "Z12"}; continue };
 if ( w2x(1,"_castle_w_w") && s(0,1) )
 { l[i]=omo1; Z[13]++; if(dbg){print "Z13"}; continue };
 if ( w2x(1,"_lock_w_w") && s(0,1) )
 { l[i]=omo2; Z[14]++; if(dbg){print "Z14"}; continue };

 if ( isname(1) && wa(1,"_castle_isname_forced") && s(0) )
 { l[i]=omo1; Z[15]++; if(dbg){print "Z15"}; continue };
 if ( isname(1) && wa(1,"_castle_numbered_royalty-ro") && roman(1) && s(0) )
 { l[i]=omo1; Z[16]++; if(dbg){print "Z16"}; continue };

 if ( isname(-1) && s(-1) && ba(-1,"_castle_prl_forced") )
 { l[i]=omo1; Z[17]++; if(dbg){print "Z17"}; continue };
 cst="магический";
 if ( isname(-1) && s(-2,-1) && bw(-1,cst) )
 { l[i]=omo1; Z[18]++; if(dbg){print "Z18"}; continue };

 if ( FN_lock_prl_true_f("_lock_prl_true") )
 { Z[19]++; if(dbg){print "Z19"}; continue };

 if ( bba(-3,-1,"_lock_prl_forced") && FN_lock_prl_true_f("_lock_prl_forced") )
 { Z[20]++; if(dbg){print "Z20"}; continue };
 if ( bfa(1,3,"_lock_prl_forced") && FN_lock_prl_true_f("_lock_prl_forced") )
 { Z[21]++; if(dbg){print "Z21"}; continue };

#if ( q(1,"isname") && s(0) )
#{ print l[i+1] >> "_isname.txt"; Z[22]++; if(dbg){print "Z22"}; }; continue
 # названия замков и имена владельцев:end

 if ( iwrd=="замок" || iwrd=="замки" )  { Y["iwrd_case"]="iv"; if ( iwrd=="замок" ) {Y["iwrd_form"]="ediv"} else {Y["iwrd_form"]="mniv"}; if(dbg){print "замок: им+вин, ед+мн"};

    if ( wb(-8,-1,"в во")  ) { Y["n_pre_v"]  = Y["n_pre_v_ist"]  = wbn; }; #
    if ( wb(-8,-1,"на")    ) { Y["n_pre_na"] = Y["n_pre_na_ist"] = wbn; }; #

    # pointesque <<-- складываем сюда исключения, не/слабо поддающиеся анализу
    if ( zamok_vi_pointesque_f() )
    { Z[23]++; if(dbg){print "Z23", "-- is_pointesque!"}; continue };
    # pointesque

    # определить, прикреплен ли к омографу предлог
    if ( vgl(Y["n_pre_v"],-8,-1) ) { DEFINE_TN_OK_PREVI_ZAMOK(Y["n_pre_v"],"в во"); Y["n_pre_v"]    =tn; Y["tn_ok_v"]    =Y["tn_ok_vi"]=Y["tn_ok_any"]=tn_ok }; # TN_v_zamok_f()
    if ( wb(-5,-1,"за")    )       { DEFINE_TN_OK_PREVI_ZAMOK(wbn,"за");            Y["n_pre_za"]   =tn; Y["tn_ok_za"]   =Y["tn_ok_vi"]=Y["tn_ok_any"]=tn_ok }; # TN_za_zamok_f()
    if ( vgl(Y["n_pre_na"],-8,-1)) { DEFINE_TN_OK_PREVI_ZAMOK(Y["n_pre_na"],"на");  Y["n_pre_na"]   =tn; Y["tn_ok_na"]   =Y["tn_ok_vi"]=Y["tn_ok_any"]=tn_ok }; # TN_na_zamok_f()
    if ( wb(-5,-1,"под")   )       { DEFINE_TN_OK_PREVI_ZAMOK(wbn,"под");           Y["n_pre_pod"]  =tn; Y["tn_ok_pod"]  =Y["tn_ok_vi"]=Y["tn_ok_any"]=tn_ok }; # TN_pod_zamok_f()
    if ( wb(-5,-1,"о")     )       { DEFINE_TN_OK_PREVI_ZAMOK(wbn,"о");             Y["n_pre_o"]    =tn; Y["tn_ok_o"]    =Y["tn_ok_vi"]=Y["tn_ok_any"]=tn_ok }; # TN_o_zamok_f()
    if ( wb(-5,-1,"по")    )       { DEFINE_TN_OK_PREVI_ZAMOK(wbn,"по");            Y["n_pre_po"]   =tn; Y["tn_ok_po"]   =Y["tn_ok_vi"]=Y["tn_ok_any"]=tn_ok }; # TN_po_zamok_f()
    if ( wb(-5,-1,"через") )       { DEFINE_TN_OK_PREVI_ZAMOK(wbn,"через");         Y["n_pre_qerez"]=tn; Y["tn_ok_qerez"]=Y["tn_ok_vi"]=Y["tn_ok_any"]=tn_ok }; # TN_qerez_zamok_f()

    bba(-7,-1,"_lock_pe");    Y["n-_lock_pe"]    = bbn;
    bba(-7,-1,"_castle_pe");  Y["n-_castle_pe"]  = bbn;
    bfa(1,6,  "_lock_pe");    Y["n+_lock_pe"]    = bfn;
    bfa(1,6,  "_castle_pe");  Y["n+_castle_pe"]  = bfn;
    if ( vex(Y["tn_ok_v"]) ) { tn=Y["n_pre_v"];
       if ( bba(tn-9,tn-1,"_gl_v_castle-iv")  ) { Y["n-_gl_v_castle-iv"]  = bbn };
       if ( bba(tn-9,tn-1,"_gl_v_lock-iv")    ) { Y["n-_gl_v_lock-iv"]    = bbn };
       if ( bba(tn-6,tn-1,"_suw_v_castle-vp") ) { Y["n-_suw_v_castle-vp"] = bbn }; };

#if ( vex(Y["tn_ok_v"]) && wf(1,4,"на") && s(0,wfn-1) )
#{ print book[b] >> "_vna.txt"; Z[24]++; if(dbg){print "Z24"}; }; continue

 };
 #
 if (iwrd=="замка" || iwrd=="замков" ) { Y["iwrd_case"]="ro"; if ( iwrd=="замка" ) {Y["iwrd_form"]="edro"} else {Y["iwrd_form"]="mnro"}; if(dbg){print "замок: ро, ед+мн"};
    if ( wb(-5,-1,"до") ) { DEFINE_TN_OK_PRERO_ZAMKA(wbn,"до"); Y["n_pre_do"] = tn; Y["tn_ok_do"]=Y["tn_ok_ro"]=Y["tn_ok_any"]=tn_ok }; # TN_do_zamok_f()
    # hwro
    if ( bba(-5,-1,"_hw_castle-ro") &&
         qir(bbn+1,-1,"prl_ro prq_ro mest_ro mest_3e") && s(bbn,-1) )
    { l[i]=omo1; Z[25]++; if(dbg){print "Z25"}; continue };
    if ( bba(-5,-1,"_hw_lock-ro") &&
         qir(bbn+1,-1,"prl_ro prq_ro mest_ro mest_3e") && s(bbn,-1) )
    { l[i]=omo2; Z[26]++; if(dbg){print "Z26"}; continue };

   };
 if (iwrd=="замку"  || iwrd=="замкам")  { Y["iwrd_case"]="da"; if(dbg){print "замок: дат, ед+мн"}; };
 if (iwrd=="замком" || iwrd=="замками") { Y["iwrd_case"]="tv"; if(dbg){print "замок: тв, ед+мн"};  };
 if (iwrd=="замке"  || iwrd=="замках")  { Y["iwrd_case"]="pr"; if(dbg){print "замок: пр, ед+мн"};

    if ( wb(-8,-1,"в во")  ) { Y["n_pre_v"]  = Y["n_pre_v_ist"]  = wbn; }; #
    if ( wb(-8,-1,"на")    ) { Y["n_pre_na"] = Y["n_pre_na_ist"] = wbn; }; #

 };

if ( bfa(1,5,"_castlelike_things") ) { Y["n+_castlelike_things"]  = bfn; };
#bba(-5,-1,"_castle_prl"); Y["n-_castle_prl"] = bbn;
#bfa(-5,-1,"_lock_prl");   Y["n-_lock_prl"]   = bfn;
#===============================================================================================================================================================

 cst="барона бога герцога короля легиона принца рыцаря";
 if ( w(2,cst) && wc(1,"ого$") && s(0,1) )
 { l[i]=omo1; Z[27]++; if(dbg){print "Z27"}; continue };
 cst="баронессы королевы принцессы";
 if ( w(2,cst) && wc(1,"ой$") && s(0,1) )
 { l[i]=omo1; Z[28]++; if(dbg){print "Z28"}; continue };

 # forced:end

#if ( vex(Y["tn_ok_v"]) ) {
#   if ( TN_v_zamok_f() )
#   { Z[29]++; if(dbg){print "Z29", "-- TN_v_zamok_f"}; continue };
#};
#if ( vex(Y["tn_ok_za"]) ) {
#   if ( TN_za_zamok_f() )
#   { Z[30]++; if(dbg){print "Z30", "-- TN_za_zamok_f"}; continue };
#};
#if ( vex(Y["tn_ok_na"]) ) {
#   if ( TN_na_zamok_f() )
#   { Z[31]++; if(dbg){print "Z31", "-- TN_na_zamok_f"}; continue };
#};
#if ( vex(Y["tn_ok_pod"]) ) {
#   if ( TN_pod_zamok_f() )
#   { Z[32]++; if(dbg){print "Z32", "-- TN_pod_zamok_f"}; continue };
#};
#if ( vex(Y["tn_ok_o"]) ) {
#   if ( TN_o_zamok_f() )
#   { Z[33]++; if(dbg){print "Z33", "-- TN_o_zamok_f"}; continue };
#};
#if ( vex(Y["tn_ok_qerez"]) ) {
#   if ( TN_qerez_zamok_f() )
#   { Z[34]++; if(dbg){print "Z34", "-- TN_qerez_zamok_f"}; continue };
#};

 ### ALL
 cst="блокировать заблокировать";
 cst1="армия взвод дивизия имперец отряд полк рота";
 if ( bw(-1,cst) &&
      bw(1,cst1) && s(-1,0) )
 { l[i]=omo1; Z[35]++; if(dbg){print "Z35"}; continue };
 if ( bw(-4,cst) &&
  pre_pr(-3) &&
       q(-2,"isname") &&
       q(-1,"prl_vi mest_vi mest_3e") && s(-4,-1) )
 { l[i]=omo1; Z[36]++; if(dbg){print "Z36"}; continue };
 if ( bw(-3,cst1) &&
       q(-2,"suw_ro isname") && z(-2) &&
 prq_any(-1) && bw(-1,cst) && s(-1) )
 { l[i]=omo1; Z[37]++; if(dbg){print "Z37"}; continue };

 if ( qxs(-1,"замок","или","даже") )
 { l[i]=omo1; Z[38]++; if(dbg){print "Z38"}; continue };
 if ( qxs(1,"или","даже","замок") )
 { l[i]=omo2; Z[39]++; if(dbg){print "Z39"}; continue };

 cst="Virtus|Castle|Chateau|Wolfenstein|Schloss|Burg|Castello|castello|castrum|chateau|castle|dun|dunga|castellum";
 if ( sc(0,cst) )
 { l[i]=omo1; Z[40]++; if(dbg){print "Z40"}; continue };
 if ( s(0) && q(1,"isname") && sc(1,cst) )
 { l[i]=omo1; Z[41]++; if(dbg){print "Z41"}; continue };
 cst="Sesamee|Magzip|Zip|Lock|Fox|lock";
 if ( s(0) && sc(0,cst) )
 { l[i]=omo2; Z[42]++; if(dbg){print "Z42"}; continue };


 if ( q(0,"isname") && q(1,"isname") && zs(0) && zs(-1) &&
    !(s(0) && wa(1,"_lock_suw-ro") )  )
 { l[i]=omo1; Z[43]++; if(dbg){print "Z43"}; continue };
 if ( prq_any(-1) && ba(-1,"_prq_lock") && s(-1) )
 { l[i]=omo2; Z[44]++; if(dbg){print "Z44"}; continue };

 if ( prq_any(-1) && ba(-1,"_prq_castle") && s(-1) )
 { l[i]=omo1; Z[45]++; if(dbg){print "Z45"}; continue };
 if ( q(1,"gl_aux_be") &&
      q(2,"prq_any") && ba(2,"_prq_castle") && s(0,1) )
 { l[i]=omo1; Z[46]++; if(dbg){print "Z46"}; continue };

 if ( q(-1,"isname") && q(0,"isname") && s(-1) && zs(-2) &&
      Q(-1,"pre_any") &&
    !(q(-1,"prq_any") && ba(-1,"_lock_pe") ) &&
   !bam(-1,"_lock_prl _lock_parts") &&
   !(zs(0) && qy(1,"sz_iili") && s(0+qyn) && ba(1+qyn,"_lock_parts") ) &&
    !(s(0) && wa(1,"_lock_suw-ro") ) )
 { l[i]=omo1; Z[47]++; if(dbg){print "Z47"}; continue };

 cst="окружить";
 if ( prq_any(-2) && bw(-2,cst) &&
            q(-1,"suw_tv mest_tv") && s(-2,-1) )
 { l[i]=omo1; Z[48]++; if(dbg){print "Z48"}; continue };


 cst="завернуть";
 if ( prq_any(-3) && bw(-3,cst) &&
            q(-2,"pre_vi") &&
            q(-1,"suw_vi") && s(-3,-1) )
 { l[i]=omo2; Z[49]++; if(dbg){print "Z49"}; continue };

 cst="полный";
 if ( bw(1,cst) &&
       q(2,"suw_ro suw_tv") && zs(0) && s(1) )
 { l[i]=omo1; Z[50]++; if(dbg){print "Z50"}; continue };

 cst="[иотх]летн[еи] [иох]башенн[оы] [иох]комнатн[оы] [иох]метров[оы] [иох]саженн[оы] [иох]стенн[оы] [иох]этажн[оы] [иоъ]ярусн[оы]";
 if ( wc(-1,cst) && s(-1) )
 { l[i]=omo1; Z[51]++; if(dbg){print "Z51"}; continue };

 cst="бергск боргск бургск вилльск вильск городск гофск градск дорфск стонск стоунск таунск штадтск";
 cst1="ие ий им ими их ого ом ому";
 if ( jme(-1,cst,cst1) && s(-1) )
 { l[i]=omo1; Z[52]++; if(dbg){print "Z52"}; continue };

#if ( q(-1,"prl_any") &&
#isname(0) && s(-2,-1) )
#{ l[i]=omo1; Z[53]++; if(dbg){print "Z53"}; continue };

#cst="ие ий им ими их ого ом ому"; # перенесено в словарь
#if ( wma(-1,"_castle_geo_nodic",cst) && s(-1) )
#{ l[i]=omo1; Z[54]++; if(dbg){print "Z54"}; continue };

 cst="дюймов[оы] засовн[оы] значн[оы] копеечн[оы] пружинн[оы] пудов[оы] сувальдн[оы] точечн[оы] цилиндров[оы] штифтов[оы] штырьков[оы]";
 if ( wc(-1,cst) && s(-1) )
 { l[i]=omo2; Z[55]++; if(dbg){print "Z55"}; continue };

 cst="дюжин дюжины сотени сотни тысяч тысячи";
 if ( w(1,cst) &&
      q(2,"suw_mnro") && s(0,1) )
 { l[i]=omo1; Z[56]++; if(dbg){print "Z56"}; continue };

 cst="выглядеть казаться оказаться показаться представлять";
 if ( q(-1,"nar_mest nar_napr") &&
     bf(1,3,cst) && s(-1,bfn-1) )
 { l[i]=omo1; Z[57]++; if(dbg){print "Z57"}; continue };

 cst="осветить";
 if ( q(-3,"prq_any") && bw(-3,cst) &&
      q(-2,"prl_tv prq_tv") &&
      q(-1,"suw_tv") && s(-3,-1) )
 { l[i]=omo1; Z[58]++; if(dbg){print "Z58"}; continue };

 if ( qxs(1,"средней","руки") )
 { l[i]=omo1; Z[59]++; if(dbg){print "Z59"}; continue };
 if ( qxw(-1,"да","ну","его") && z(-1) )
 { l[i]=omo1; Z[60]++; if(dbg){print "Z60"}; continue };

 if ( qxw(-3,"часть","ворот двери") && z(0) &&
      qxw(-1,"а","именно") && se(-1," — ") )
 { l[i]=omo2; Z[61]++; if(dbg){print "Z61"}; continue };



 # _castlelike_things:start
 if ( z(0) &&
   (qxw(1,"а но","не и")||
    qxw(1,"а но","также","и")||
    qxw(1,"так","и") ) &&
     ba(xwn+1,"_castlelike_things") && s(xwn) )
 { l[i]=omo1; Z[62]++; if(dbg){print "Z62"}; continue };
 if ( z(0) &&
   (qxw(1,"а но","не и")||
    qxw(1,"а но","также","и")||
    qxw(1,"так","и") ) &&
      q(xwn+1,"prl_any prq_any nar_any") &&
     ba(xwn+2,"_castlelike_things") && s(1,xwn+1) )
 { l[i]=omo1; Z[63]++; if(dbg){print "Z63"}; continue };
 if ( qxs(-1,"а но","не и") &&
       ba(xsn-1,"_castlelike_things") && sc(xsn-1,",") )
 { l[i]=omo1; Z[64]++; if(dbg){print "Z64"}; continue };
 cst="более больше скорее";
 if (  w(-1,cst) && s(-1) && z(0) &&
       w(1,"чем") &&
     veq(Y["n+_castlelike_things"],2) && s(1) )
 { l[i]=omo1; Z[65]++; if(dbg){print "Z65"}; continue };
 if (  w(-3,cst) && s(-3) &&
      ba(-2,"_castlelike_things") && z(-2) &&
       w(-1,"чем") && s(1) )
 { l[i]=omo1; Z[66]++; if(dbg){print "Z66"}; continue };

 if ( vgl(Y["n+_castlelike_things"],2,5) ) { bf_n=Y["n+_castlelike_things"];

    if ( vgl(bf_n,2,5) && s(0,bf_n-1) && vex(Y["tn_ok_vi"]) && TN_na_zamok_f() )
    { Z[67]++; if(dbg){print "Z67"}; continue };

   if ( vgl(bf_n,2,5) && s(0,bf_n-1) &&
          q(1,"prl_srav nar_srav") &&
        qir(2,bf_n-1,"prl_ro mest_ro mest_3e prq_ro nar_any qast") )
    { l[i]=omo1; Z[68]++; if(dbg){print "Z68"}; continue };
    if ( vgl(bf_n,2,5) && s(0,bf_n-1) &&
           q(1,"prl_kred nar_any qast") &&
           q(2,"prl_srav nar_srav") &&
         qir(3,bf_n-1,"prl_ro mest_ro mest_3e prq_ro nar_any qast") )
    { l[i]=omo1; Z[69]++; if(dbg){print "Z69"}; continue };

    # ни … ни
    if ( vgl(bf_n,3,6) && qb(-4,-1,"qast_ne") && s(qbn,-1) && zs(0) && s(1,bf_n-1) &&
         qir(qbn+1,-1,"prl_any mest_any prq_any") &&
     sz_iili(1) &&
           q(2,"qast_ne") &&
         qir(3,bf_n-1,"prl_any mest_any prq_any") )
    { l[i]=omo1; Z[70]++; if(dbg){print "Z70"}; continue };
    if ( veq(bf_n,2) && q(-1,"qast_ne") && z(0) && s(-1) && s(1) &&
           q(1,"qast_ne") &&
         veq(Y["n+_castlelike_things"],2) && s(1) )
    { l[i]=omo1; Z[71]++; if(dbg){print "Z71"}; continue };
    if ( veq(bf_n,2) && q(-1,"qast_ne") && z(0) && s(-1) && s(1) &&
           w(1,"а но") )
    { l[i]=omo1; Z[72]++; if(dbg){print "Z72"}; continue };
    if ( veq(bf_n,3) && q(-1,"qast_ne") && z(1) && s(-1,0) && s(2) &&
           q(1,"gl_aux_be") &&
           w(2,"а но") )
    { l[i]=omo1; Z[73]++; if(dbg){print "Z73"}; continue };

 };

 # дефис
 if ( sc(0,"-") && veq(Y["n+_castlelike_things"],1) )
 { l[i]=omo1; Z[74]++; if(dbg){print "Z74"}; continue };
 if ( sc(-1,"-") && ba(-1,"_castlelike_things") )
 { l[i]=omo1; Z[75]++; if(dbg){print "Z75"}; continue };


 # превращать
 cst="обращать превратить превратиться превращать превращаться";
 wf_n=Y["n+_castlelike_things"];
 if ( bb(-4,-1,cst) &&
       w(1,"в") &&
     vgl(wf_n,2,5) && s(bbn,wf_n-1) &&
     qir(bbn+1,-1,"prl_vi mest_vi mest_3e prq_vi nar_any qast_any") &&
     qir(2,wf_n-1,"prl_vi mest_vi mest_3e prq_vi nar_any qast_any") )
 { l[i]=omo1; Z[76]++; if(dbg){print "Z76"}; continue };
 if ( qy(1,"gl_aux_be") &&
      bw(1+qyn,cst) &&
       w(2+qyn,"в") &&
     bfa(3+qyn,6+qyn,"_castlelike_things") && s(0,bfn-1+qyn) &&
     qir(3+qyn,bfn-1,"prl_vi mest_vi mest_3e prq_vi nar_any qast_any") )
 { l[i]=omo1; Z[77]++; if(dbg){print "Z77"}; continue };
 if ( ba(-3,"_castlelike_things") &&
      bw(-2,cst) &&
       w(-1,"в") && s(-3,-1) )
 { l[i]=omo1; Z[78]++; if(dbg){print "Z78"}; continue };
 if ( bw(-3,cst) &&
       w(-2,"в") &&
      ba(-1,"_castlelike_things") && s(-3,-1) )
 { l[i]=omo1; Z[79]++; if(dbg){print "Z79"}; continue };


 cst="именовать";
 cst2="палка";
 if ( bw(-2,cst2) && zs(-2) &&
      bw(-1,cst) && s(-1) )
 { l[i]=omo2; Z[80]++; if(dbg){print "Z80"}; continue };

 cst="напоминать";
 if ( bf(1,4,cst) ) { wf_n=bfn;
   if ( bfa(wf_n+1,wf_n+4,"_castlelike_things") ) { bf_n=bfn;

      if ( vgl(wf_n,1,4) && vgl(bf_n,wf_n+1,wf_n+4) && zs(0) &&
           qir(1,wf_n-1,"suw_ro isname mod_any gl_aux_be") &&
           qiz(wf_n+1,bfn-1,"prl_vi prq_vi mest_vi mest_3e","qast") &&
             q(bf_n,"suw_vi") && s(1,bf_n-1) )
      { l[i]=omo1; Z[81]++; if(dbg){print "Z81"}; continue };

 };};
 cst="напоминать";
 if ( qxs(-1,"внешним своим","видом") && s(xsn-1) && z(xsn-2) &&
       bw(xsn-1,cst) &&
       ba(xsn-2,"_castlelike_things") )
 { l[i]=omo1; Z[82]++; if(dbg){print "Z82"}; continue };


 if ( wf(2,6,"собой") && bw(wfn-1,"представлять") ) { wf_n=wfn;
      if ( vex(Y["tn_ok_v"]) && TN_v_zamok_f() )
      { Z[83]++; if(dbg){print "Z83", "-- TN_v_zamok_f"}; continue};

   if ( bfa(wfn+1,wfn+4,"_castlelike_things") ) { bf_n=bfn;

     if ( vgl(wf_n,2,6) && vgl(bf_n,wfn+1,wfn+4) && s(1,bf_n-1) &&
          qir(1,wf_n-2,"nar_any isname prl_vi prq_vi pre_pr prl_pr suw_pr qast_any") &&
           bw(wf_n-1,"представлять") && zs(0) &&
            q(bf_n,"suw_vi") &&
          qiz(wf_n+1,bf_n-1,"prl_vi prq_vi mest_vi mest_3e","qast") )
     { l[i]=omo1; Z[84]++; if(dbg){print "Z84"}; continue };

   };
   if ( bfa(wf_n+1,wf_n+4,"_locklike_things") ) { bf_n=bfn;

     cst1="систему";
     cst2="рвов укреплений ходов";
     if ( vgl(wf_n,2,6) && vgl(bf_n,wfn+1,wfn+4) && s(1,bf_n-1) &&
          qir(1,wf_n-2,"nar_any isname prl_vi prq_vi pre_pr prl_pr suw_pr qast_any") &&
           bw(wf_n-1,"представлять") && zs(0) &&
            w(bf_n,cst1) &&
           wf(bf_n+1,bf_n+4,cst2) &&
          qiz(wf_n+1,bf_n-1,"prl_vi prq_vi mest_vi mest_3e","qast") &&
          qir(bf_n+1,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
     { l[i]=omo1; Z[85]++; if(dbg){print "Z85"}; continue };

     if ( vgl(wf_n,2,6) && vgl(bf_n,wfn+1,wfn+4) && s(1,bf_n-1) &&
          qir(1,wf_n-2,"nar_any isname pre_pr prl_pr suw_pr qast_any") &&
           bw(wf_n-1,"представлять") && zs(0) &&
            q(bf_n,"suw_vi") &&
          qiz(wf_n+1,bf_n-1,"prl_vi prq_vi mest_vi mest_3e","qast") )
     { l[i]=omo2; Z[86]++; if(dbg){print "Z86"}; continue };

 };};

 if ( qxw(1,"как") && z(0) &&
       qy(xwn+1,"prl_im prl_vi prq_im prq_vi") &&
       ba(xwn+1+qyn,"_castlelike_things") && s(xwn,xwn+qyn) )
 { l[i]=omo1; Z[87]++; if(dbg){print "Z87"}; continue };

 cst="быть вставать выбрать избрать именовать именоваться казаться объявить объявлять оказаться провозгласить провозглашать сделать служить стать считаться \
      являться";
 cst8="быть стать";
 cst0="дверью клеткой ключом пеплом руинами целью центром";
 if ( bf(1,4,cst) ) { bf_n=bfn;
   if ( bw(bf_n,cst8) ) { if ( s(bf_n,3) && bf(bf_n+1,4,cst) ) bf_n=bfn }; bbn=wfn=bfn="";

   if ( bfa(bf_n+1,bf_n+5,"_castlelike_things")||
         wf(bf_n+1,bf_n+5,cst0)||
      ( bfa(bf_n+1,bf_n+5,"_prq_castle") && q(bfn,"prq_tv") ) ) {

       if (bfn) bb_n=bfn; if (wfn) bb_n=wfn;

       if ( vgl(bf_n,1,4) && zs(0) && s(1,bb_n-1) &&
            vgl(Y["n-_lock_pe"],-4,-1) && s(Y["n-_lock_pe"],-1) &&
            qir(bb_n+1,-1,"prl_edmuim prl_mnim mest_vi mest_3e qast_any") )
       { bf_n=bb_n=""; Z[88]++; if(dbg){print "Z88"}; };
       if ( vgl(bf_n,1,4) && zs(0) && s(1,bb_n-1) &&
              w(bb_n,"ключом") && !w(bb_n+1,"к") )
       { bf_n=bb_n=""; Z[89]++; if(dbg){print "Z89"}; };

    if ( vgl(bf_n,1,4) && zs(0) && s(1,bb_n-1) &&
           q(bb_n,"suw_tv prq_tv") &&
         qir(1,bf_n-1,"otsz_any mod_any gl_aux_be qast nar_any suw_ro suw_edne isname suw_vi prl_vi mest_vi mest_da mest_im sz suw_da") &&
         qir(bf_n+1,bb_n-1,"prl_tv prq_tv mest_tv mest_3e nar_any prl_kred_sr qast suw_tv suw_da mest_da isname suw_edne prq_kred prq_krmn") )
    { l[i]=omo1; Z[90]++; if(dbg){print "Z90"}; continue };
    if ( vgl(bf_n,1,4) && zs(0) && s(1,bb_n-1) &&
           w(bf_n+1,"для") &&
           q(bb_n,"suw_tv prq_tv") &&
         qir(1,bf_n-1,"otsz_any mod_any gl_aux_be qast nar_any suw_ro suw_edne isname suw_vi prl_vi mest_vi mest_da mest_im sz suw_da prl_kred_sr") &&
         qir(bf_n+2,bb_n-1,"prl_tv prq_tv mest_tv mest_3e nar_any prl_kred_sr qast suw_ro mest_ro isname suw_edne prq_kred prq_krmn") )
    { l[i]=omo1; Z[91]++; if(dbg){print "Z91"}; continue };
    if ( vgl(bf_n,1,4) && zs(0) && s(1,bb_n-1) &&
           q(bb_n,"suw_tv") &&
         qir(1,bf_n-1,"otsz_any mod_any gl_aux_be qast nar_any suw_ro isname") &&
           q(bf_n+1,"narph_any") &&
         qiz(xwn+1,bb_n-1,"prl_tv prq_tv mest_tv mest_3e nar_any prl_kred_sr qast_any suw_da mest_da isname suw_edne","qast") )
    { l[i]=omo1; Z[92]++; if(dbg){print "Z92"}; continue };


 };
 cst1="архитектуре";
 cst2="вскрытия";
 cst4="дверью";
 if ( qf(bf_n+1,bf_n+4,"prl_kred_mu prq_kred_mu") ) { qf_n=qfn;

     if ( vgl(bf_n,1,4) && vgl(qf_n,bf_n+1,bf_n+4) &&
            w(qf_n+1,"по") &&
           wf(qf_n+2,qf_n+5,cst1) && s(0,wfn-1) &&
          qir(bf_n+1,qf_n-1,"mod_any nar_any prl_kred_sr gl_aux_be isname") &&
          qir(qf_n+2,wfn-1,"prl_da prq_da mest_da mest_3e") )
     { l[i]=omo1; Z[93]++; if(dbg){print "Z93"}; continue };
     if ( vgl(bf_n,1,4) && vgl(qf_n,bf_n+1,bf_n+4) &&
            w(qf_n+1,"от") &&
           wf(qf_n+2,qf_n+5,cst2) && s(0,wfn-1) &&
          qir(bf_n+1,qf_n-1,"mod_any nar_any prl_kred_sr gl_aux_be isname") &&
          qir(qf_n+2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
     { l[i]=omo2; Z[94]++; if(dbg){print "Z94"}; continue };
     if ( vgl(bf_n,1,4) && vgl(qf_n,bf_n+1,bf_n+4) &&
            w(qf_n+1,"с со") &&
           wf(qf_n+2,qf_n+5,cst4) && s(0,wfn-1) &&
          qir(bf_n+1,qf_n-1,"mod_any nar_any prl_kred_sr gl_aux_be isname") &&
          qir(qf_n+2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
     { l[i]=omo2; Z[95]++; if(dbg){print "Z95"}; continue };

  };
 };
 # сказуемое в виде причастия и дополнения в родительном падеже -- castle

 cst1="источен окружен оснащен покрыт прикрыт снабжен";
 cst2="бойцами колпаком кристаллами системой стенами стеной ходами";
 if ( wf(1,4,cst1) ) { wf_n=wfn;
   if ( wf(wf_n+1,wf_n+4,cst2) ) { bf_n=wfn;

     if ( vgl(wf_n,1,4) && vgl(bf_n,wf_n+1,wf_n+4) && s(0,bf_n-1) &&
          qir(1,wf_n-1,"mod_any nar_any prl_kred_sr gl_aux_be isname") &&
          qir(wf_n+1,bf_n-1,"prl_tv prq_tv mest_tv mest_3e") )
     { l[i]=omo1; Z[96]++; if(dbg){print "Z96"}; continue };

 };};
 # сказуемое в виде причастия и дополнения в родительном падеже -- lock
 cst1="залит";
 cst2="медью";
 if ( wf(1,4,cst1) ) { wf_n=wfn;
   if ( wf(wf_n+1,wf_n+4,cst2) ) { bf_n=wfn;

     if ( vgl(wf_n,1,4) && vgl(bf_n,wf_n+1,wf_n+4) && s(0,bf_n-1) &&
          qir(1,wf_n-1,"mod_any nar_any prl_kred_sr gl_aux_be isname") &&
          qir(wf_n+1,bf_n-1,"prl_tv prq_tv mest_tv mest_3e") )
     { l[i]=omo2; Z[97]++; if(dbg){print "Z97"}; continue };

 };};
 cst2="залит";
 cst1="медью";
 if ( wf(1,4,cst1) ) { wf_n=wfn;
   if ( wf(wf_n+1,wf_n+4,cst2) ) { bf_n=wfn;

     if ( vgl(wf_n,1,4) && vgl(bf_n,wf_n+1,wf_n+4) && s(0,bf_n-1) &&
          qir(1,wf_n-1,"prl_tv prq_tv mest_tv mest_3e") &&
          qir(wf_n+1,bf_n-1,"mod_any nar_any prl_kred_sr gl_aux_be isname") )
 { l[i]=omo2; Z[98]++; if(dbg){print "Z98"}; continue };

 };};

 if ( bb(-4,-1,cst) ) { bb_n=bbn; bf_n="";

   if ( vgl(Y["n+_castlelike_things"],1,5) ) { bf_n=Y["n+_castlelike_things"] } else {
     if ( !vex(Y["tn_ok_vi"]) && !vgl(Y["n-_lock_pe"],-3,-1) && wf(1,5,cst0) ) bf_n=wfn };
    if ( bf_n ) {

    if ( vgl(bb_n,-4,-1) && zs(0) && s(1,bf_n-1) &&
           q(bf_n,"suw_tv") &&
         qia(1,bf_n-1,"qast","prl_tv prq_tv mest_tv mest_3e nar_any prl_kred_sr") )
    { l[i]=omo1; Z[99]++; if(dbg){print "Z99"}; continue };

 };};
 # _castlelike_things:end
 # cst + _locklike_things по той же схеме
   cst="быть вставать выбрать избрать именовать именоваться казаться объявить объявлять оказаться провозгласить провозглашать сделать служить стать считаться \
        являться";
   cst1="войска";
   cst3="пути";
   cst2="вещью";
 if (bb(1,3,cst)) { bf_n=bbn;
   if ( bfa(bf_n+1,bf_n+5,"_locklike_things")||wf(bf_n+1,bf_n+5,cst2) ) { if (bfn) bb_n=bfn; if (wfn) bb_n=wfn;

       if ( vgl(bf_n,1,3) && zs(0) && s(1,bb_n-1) &&
            vex(Y["tn_ok_vi"]) )
       { bf_n=bb_n=""; Z[100]++; if(dbg){print "Z100"}; };

    cst0="преградой";
    if ( vgl(bf_n,1,3) && zs(0) && w(bb_n,cst0) && s(1,bb_n) ) {
       if( w(bb_n+1,"для") &&
          wf(bb_n+2,bb_n+4,cst1) &&
         qir(bb_n+2,wfn-1,"prl_ro mest_ro mest_3e prq_ro") && s(bb_n+1,wfn-1) )
       { l[i]=omo1; Z[101]++; if(dbg){print "Z101"}; continue };
    };

    cst5="система";
    cst6="отдушин отопления рвов укреплений ходов";
    cst7="взаимосвязанной единой";
    if ( vgl(bf_n,1,4) && zs(0) &&
           q(bb_n,"suw_tv prq_tv") && bw(bb_n,cst5) &&
          wf(bb_n+1,bb_n+4,cst6) && s(1,wfn-1) &&
         qir(1,bf_n-1,"otsz_any mod_any gl_aux_be qast nar_any suw_ro suw_edne isname suw_vi prl_vi mest_vi mest_da mest_im sz suw_da") &&
         qir(bf_n+2,bb_n-1,"prl_tv prq_tv mest_tv mest_3e nar_any prl_kred_sr qast suw_tv suw_da mest_da isname suw_edne prq_kred prq_krmn") &&
         qir(bb_n+1,wfn-1,"prl_ro mest_ro mest_3e") )
    { l[i]=omo1; Z[102]++; if(dbg){print "Z102"}; continue };
    if ( vgl(bf_n,1,4) && zs(0) &&
           q(bb_n,"suw_tv") && bw(bb_n,cst5) &&
           w(bb_n-1,cst7) && s(1,bb_n-1) &&
         qir(1,bf_n-1,"otsz_any mod_any gl_aux_be qast nar_any suw_ro suw_edne isname suw_vi prl_vi mest_vi mest_da mest_im sz suw_da") &&
         qir(bf_n+1,bb_n-1,"prl_tv prq_tv mest_tv mest_3e nar_any prl_kred_sr qast suw_tv suw_da mest_da isname suw_edne prq_kred prq_krmn") )
    { l[i]=omo1; Z[103]++; if(dbg){print "Z103"}; continue };
    cst5="частью";
    if ( vgl(bf_n,1,4) &&
          wf(bf_n+1,bf_n+4,cst5) &&
         bfa(wfn+1,wfn+4,"_locklike_things") && s(0,bfn-1) &&
         qir(1,bf_n-1,"otsz_any mod_any gl_aux_be qast nar_any suw_ro suw_edne isname suw_vi prl_vi mest_vi mest_da mest_im sz suw_da") &&
         qir(bf_n+1,wfn-1,"prl_tv prq_tv mest_tv mest_3e nar_any prl_kred_sr qast suw_tv suw_da mest_da isname suw_edne prq_kred prq_krmn") &&
         qir(wfn+1,bfn-1,"prl_ro mest_ro mest_3e") )
    { l[i]=omo2; Z[104]++; if(dbg){print "Z104"}; continue };
    cst8="дверь портал";
    if ( vgl(bf_n,1,3) && zs(0) && s(1,bf_n-1) &&
           q(bb_n,"suw_tv") && bw(bb_n,cst8) &&
         qir(1,bf_n-1,"otsz_any mod_any gl_aux_be qast nar_any suw_ro isname") &&
         qiz(bf_n+1,bb_n-1,"prl_tv prq_tv mest_tv mest_3e nar_any prl_kred_sr qast_any suw_da mest_da isname suw_edne prq_kred_mu","qast") && s(bf_n,bb_n-1) )
    { l[i]=omo1; Z[105]++; if(dbg){print "Z105"}; continue };

    if ( vgl(bf_n,1,3) && zs(0) && s(1,bb_n-1) &&
           q(bb_n,"suw_tv") &&
         qir(1,bf_n-1,"otsz_any mod_any gl_aux_be qast nar_any suw_ro isname") &&
         qiz(bf_n+1,bb_n-1,"prl_tv prq_tv mest_tv mest_3e nar_any prl_kred_sr qast_any suw_da mest_da isname suw_edne prq_kred_mu","qast") && s(bf_n,bb_n-1) )
    { l[i]=omo2; Z[106]++; if(dbg){print "Z106"}; continue };
    if ( vgl(bf_n,1,3) && zs(0) && s(1,bb_n-1) &&
           q(bb_n,"suw_ro") &&
         qir(1,bf_n-1,"otsz_any mod_any gl_aux_be qast nar_any suw_ro isname") &&
         qiz(bf_n+1,bb_n-1,"prl_ro prq_ro mest_ro mest_3e nar_any prl_kred_sr qast_any suw_da mest_da isname suw_edne prq_kred_mu","qast") && s(bf_n,bb_n-1) )
    { l[i]=omo2; Z[107]++; if(dbg){print "Z107"}; continue };

 };};

 # _castlelike_acro:start
 if ( s(0) && isacro(1) && wa(1,"_castlelike_acro") )
 { l[i]=omo1; Z[108]++; if(dbg){print "Z108"}; continue };
 # _castlelike_acro:start

 # _castle_environs:start
 # escapes:start
 if ( sc(0,"[— ]") &&
      bw(1,"вынести") &&
    (qxw(2,"с со") ||
     qxw(2,"вместе","с со")) &&
       w(xwn+1,"дверью дверями воротами") && s(1,xwn) )
 { l[i]=omo2; Z[109]++; if(dbg){print "Z109"}; continue };
 cst="багажник канаву корзинку кусты сумку";
 if ( bw(-1,"забросить бросить") &&
       w(1,"в") &&
       w(2,cst) && s(-1,1) )
 { l[i]=omo2; Z[110]++; if(dbg){print "Z110"}; continue };
 if ( bw(-1,"забросить бросить") &&
       w(1,"в") &&
       q(2,"prl_vi prq_vi") &&
       w(3,cst) && s(-1,2) )
 { l[i]=omo2; Z[111]++; if(dbg){print "Z111"}; continue };
 # escapes:end

 #
 if ( ba(-3,"_castle_environs") && s(-3) &&
       q(-2,"suw_ro mest_ro isname") && sc(-2,"—") &&
       q(-1,"suw_ro mest_ro isname") && s(-1) )
 { l[i]=omo1; Z[112]++; if(dbg){print "Z112"}; continue };

 if ( qq(-1,1) && z(0) && s(-1) &&
      ba(2,"_castle_environs") && s(1) )
 { l[i]=omo1; Z[113]++; if(dbg){print "Z113"}; continue };
 if ( qq(-1,2) && qq(-2,1) && z(0) && s(-2,-1) &&
      ba(3,"_castle_environs") && s(1,2) )
 { l[i]=omo1; Z[114]++; if(dbg){print "Z114"}; continue };
 if ( qq(-1,2) && zs(0) && s(-1) &&
 sz_iili(1) &&
      ba(3,"_castle_environs") && s(1,2) )
 { l[i]=omo1; Z[115]++; if(dbg){print "Z115"}; continue };
 if ( qq(-1,1) && z(0) && s(-1) &&
       q(2,"prl_any mest_any prq_any nar_any") &&
      ba(3,"_castle_environs") && s(1,2) )
 { l[i]=omo1; Z[116]++; if(dbg){print "Z116"}; continue };
 if ( qq(-1,2) && z(0) && s(-1) &&
       w(1,"а но однако ни и") &&
      ba(3,"_castle_environs") && s(1,2) )
 { l[i]=omo1; Z[117]++; if(dbg){print "Z117"}; continue };
 if ( qq(-1,2) && z(0) && s(-1) &&
       w(1,"а но однако ни и") &&
       q(3,"prl_any mest_any prq_any nar_any") &&
      ba(4,"_castle_environs") && s(1,3) )
 { l[i]=omo1; Z[118]++; if(dbg){print "Z118"}; continue };
 if ( qq(-2,2) && z(0) && s(-2,-1) && !(vex(Y["tn_ok_v"]) && bba(-8,-3,"_gl_v_lock-iv") && s(bbn,-3)) &&
       q(-1,"prl_any mest_any prq_any nar_any") &&
       w(1,"а но однако ни и") &&
      ba(3,"_castle_environs") && s(1,2) )
 { l[i]=omo1; Z[119]++; if(dbg){print "Z119"}; continue };
 if ( qq(-2,2) && z(0) && s(-2,-1) && !(vex(Y["tn_ok_v"]) && bba(-8,-3,"_gl_v_lock-iv") && s(bbn,-3)) &&
       q(-1,"prl_any mest_any prq_any nar_any") &&
       w(1,"а но однако ни и") &&
       q(3,"prl_any mest_any prq_any nar_any") &&
      ba(4,"_castle_environs") && s(1,2) )
 { l[i]=omo1; Z[120]++; if(dbg){print "Z120"}; continue };

 if ( bfa(1,6,"_castle_environs") ) { bf_n=Y["n+_castle_environs"]=bfn;

    if ( vgl(bf_n,1,6) && z(0) && s(1,bf_n-1) && vex(Y["tn_ok_vi"]) && TN_na_zamok_f() )
    { Z[121]++; if(dbg){print "Z121"}; continue };
    if ( vgl(bf_n,1,6) &&
           w(bf_n,"сел села") && s(1,bf_n-1) && zs(0) &&
          (w(bfn+1,"в во за на под над и с у")||q(bfn+1,"nar_mest") ) )
    { bf_n=""; Z[122]++; if(dbg){print "Z122"}; };
    if ( vgl(bf_n,1,6) &&
         bam(-1,"_lock_pe _lock_prl") && s(-1) )
    { bf_n=""; Z[123]++; if(dbg){print "Z123"}; };

    if ( vgl(bf_n,1,6) && s(1,bf_n-1) &&
           q(1,"sz_iili") && zs(0) &&
         qia(2,bf_n-1,"prl_kred_sr","prl_any mest_any qast_any") )
    { l[i]=omo1; Z[124]++; if(dbg){print "Z124"}; continue };
    if ( veq(bf_n,2) && z(0) && s(1) &&
           q(1,"prl_any mcop_any") &&
           Q(2,"isname") )
    { l[i]=omo1; Z[125]++; if(dbg){print "Z125"}; continue };

    if ( veq(bf_n,2) && z(1) && s(0) &&
           q(1,"isname") )
    { l[i]=omo1; Z[126]++; if(dbg){print "Z126"}; continue };
    if ( pre_vi(-1) && s(-1) && z(0) &&
         pre_vi(1) && W(1,"на под") &&
            veq(bf_n,2) && qq(-1,1) && s(1) )
    { l[i]=omo1; Z[127]++; if(dbg){print "Z127"}; continue };
    if ( vgl(bf_n,2,5) && s(0,bf_n-1) && !vex(Y["tn_ok_vi"]) &&
           q(1,"prl_im mest_im mest_3e prq_im") &&
         qir(2,bf_n-1,"prl_im mest_im mest_3e prq_im") && p(bf_n) )
    { l[i]=omo1; Z[128]++; if(dbg){print "Z128"}; continue };

 };

 if ( qxs(-1,"не","только") && z(0) &&
      qxw(1,"а но","и") &&
       qy(xwn+1,"prl_im prq_im") &&
       ba(xwn+1+qyn,"_castle_environs") && s(xwn,xwn+qyn) )
 { l[i]=omo1; Z[129]++; if(dbg){print "Z129"}; continue };

 if ( q(1,"isname") && s(0,3) &&
      q(2,"sz_iili") &&
     ba(3,"_castle_environs") &&
      q(4,"isname") )
 { l[i]=omo1; Z[130]++; if(dbg){print "Z130"}; continue };

 if ( ba(-5,"_castle_environs") &&
       q(-4,"pre_pr") &&
       q(-3,"prl_pr mest_pr prq_pr") &&
       q(-2,"suw_pr") && z(-2) &&
       q(-1,"prl_vi mest_vi") && s(-1) )
 { l[i]=omo1; Z[131]++; if(dbg){print "Z131"}; continue };
 if ( ba(-3,"_castle_environs") &&
 sz_iili(-2) &&
      qq(-4,-1) && s(-4,-1) )
 { l[i]=omo1; Z[132]++; if(dbg){print "Z132"}; continue };
 if ( q(-4,"prl_any mest_any prq_any") &&
     ba(-3,"_castle_environs") &&
sz_iili(-2) &&
     qq(-5,-1) && s(-5,-1) )
 { l[i]=omo1; Z[133]++; if(dbg){print "Z133"}; continue };
 if ( ba(-4,"_castle_environs") &&
 sz_iili(-3) &&
       q(-1,"prl_any mest_any prq_any") &&
      qq(-5,-2) && s(-5,-1) )
 { l[i]=omo1; Z[134]++; if(dbg){print "Z134"}; continue };
 if ( ba(-5,"_castle_environs") &&
 sz_iili(-4) &&
       w(-3,"даже") &&
       q(-1,"prl_any mest_any prq_any") &&
      qq(-6,-2) && s(-6,-1) )
 { l[i]=omo1; Z[135]++; if(dbg){print "Z135"}; continue };
 if ( pre_vi(-3) && s(-3) && z(-2) && W(-3,"на под") &&
          ba(-2,"_castle_environs") &&
      pre_vi(-1) &&
          qq(-3,-1) && s(-1) )
 { l[i]=omo1; Z[136]++; if(dbg){print "Z136"}; continue };
 # _castle_environs:end

 # _locklike_hyphens:start
 if ( sc(-1,"[/-]") && ba(-1,"_locklike_hyphens") )
 { l[i]=omo2; Z[137]++; if(dbg){print "Z137"}; continue };
 if ( sc(0,"[/-]") && ba(1,"_locklike_hyphens") )
 { l[i]=omo2; Z[138]++; if(dbg){print "Z138"}; continue };
 if ( sc(-1,"[/-]") && isacro(-1) && wa(-1,"_locklike_acro") )
 { l[i]=omo2; Z[139]++; if(dbg){print "Z139"}; continue };

 cst="аналогия взаимоотношение концепция механизм модель отношение парадигма принцип режим система соединение схема тип";
 if ( sc(-1,"[/-]") && w(-1,"ключ") && s(-2) && bw(-2,cst) )
 { l[i]=omo2; Z[140]++; if(dbg){print "Z140"}; continue };
 if ( sc(0,"[/-]") && w(1,"ключ") && s(-1) && bw(-1,cst) )
 { l[i]=omo2; Z[141]++; if(dbg){print "Z141"}; continue };
 # _locklike_hyphens:start

 # строки
 if ( qxs(-1,"герметичное плотное","соединение") )
 { l[i]=omo2; Z[142]++; if(dbg){print "Z142"}; continue };


 # _locklike_things:start
 if ( bba(-3,-1,"_locklike_things") ) { bb_n=bbn;
   if ( veq(bb_n,-1) && se(-1," — ") )
   { l[i]=omo2; Z[143]++; if(dbg){print "Z143"}; continue };
   if ( veq(bb_n,-2) && s(-2) &&
          q(-1,"suw_ro") && se(-1," — ") )
   { l[i]=omo2; Z[144]++; if(dbg){print "Z144"}; continue };
   if ( z(-1) && veq(bb_n,-1) && !(isname(1) && bw(1,"люк")) )
   { l[i]=omo2; Z[145]++; if(dbg){print "Z145"}; continue };

   if ( qq(-4,-1) &&
         q(-2,"sz_iili") &&
       veq(bb_n,-3) && s(-4,-1) )
   { l[i]=omo2; Z[146]++; if(dbg){print "Z146"}; continue };
 };

 if ( bfa(1,4,"_locklike_things") ) { bf_n=bfn;

    if ( qq(-1,2) &&
          q(1,"sz_iili") &&
        veq(bf_n,3) && s(-1,2) )
    { l[i]=omo2; Z[147]++; if(dbg){print "Z147"}; continue };
    if ( qq(-1,1) && z(0) && s(-1) &&
         veq(bf_n,2) && s(1) ) {
            if ( vex(Y["tn_ok_v"]) && TN_v_zamok_f() )
            { Z[148]++; if(dbg){print "Z148"}; continue } else
    { l[i]=omo2; Z[149]++; if(dbg){print "Z149"}; continue };};
    if ( qq(-1,2) && qq(-2,1) && z(0) && s(-2,-1) &&
        veq(bf_n,3) && s(1,2) )
    { l[i]=omo2; Z[150]++; if(dbg){print "Z150"}; continue };
    if ( qq(-1,2) && zs(0) && s(-1) &&
    sz_iili(1) &&
        veq(bf_n,3) && s(1,2) )
    { l[i]=omo2; Z[151]++; if(dbg){print "Z151"}; continue };
    if ( qq(-1,1) && z(0) && s(-1) &&
          q(2,"prl_any mest_any prq_any nar_any") &&
        veq(bf_n,3) && s(1,2) )
    { l[i]=omo2; Z[152]++; if(dbg){print "Z152"}; continue };
    if ( qq(-1,2) && z(0) && s(-1) &&
          w(1,"а но однако ни и") &&
        veq(bf_n,3) && s(1,2) )
    { l[i]=omo2; Z[153]++; if(dbg){print "Z153"}; continue };
    if ( qq(-1,2) && z(0) && s(-1) &&
          w(1,"а но однако ни") &&
          q(3,"prl_any mest_any prq_any nar_any") &&
        veq(bf_n,4) && s(1,3) )
    { l[i]=omo2; Z[154]++; if(dbg){print "Z154"}; continue };

    if ( q(1,"sz_iili") &&
         q(2,"prl_any mest_any prq_any") &&
       veq(bf_n,3) && s(0,2) ) {
            if ( vex(Y["tn_ok_v"]) && TN_v_zamok_f() )
            { Z[155]++; if(dbg){print "Z155"}; continue } else
    { l[i]=omo2; Z[156]++; if(dbg){print "Z156"}; continue };};
    if ( q(1,"sz_iili") &&
       veq(bf_n,2) && s(0,1) )
    { l[i]=omo2; Z[157]++; if(dbg){print "Z157"}; continue };
    cst="вроде типа";
    if ( vgl(bf_n,2,4) &&
           w(bf_n-1,cst) && q(bf_n,"suw_ro") && s(0,bf_n-1) &&
         qir(1,bf_n-2,"prl_edmuim prl_kred_mu") )
    { l[i]=omo2; Z[158]++; if(dbg){print "Z158"}; continue };

    #
    cst="дверь";
    if ( z(0) && veq(bf_n,1) && s(1) && bw(1,cst) &&
     ( qxw(2,"которого")||
       qxw(2,"от","которого") ) )
    { l[i]=omo1; Z[159]++; if(dbg){print "Z159"}; continue };
    if ( z(0) && veq(bf_n,1) && !(isname(1) && bw(1,"люк")) ) {
            if ( vex(Y["tn_ok_v"]) && TN_v_zamok_f() )
            { Z[160]++; if(dbg){print "Z160"}; continue } else
    { l[i]=omo2; Z[161]++; if(dbg){print "Z161"}; continue };};
 };

 if ( z(0) &&
   (qxw(1,"а но","не и")||
    qxw(1,"а но","также","и")||
    qxw(1,"так","и") ) &&
     ba(xwn+1,"_locklike_things") && s(xwn) )
 { l[i]=omo2; Z[162]++; if(dbg){print "Z162"}; continue };
 if ( z(0) &&
   (qxw(1,"а но","не и")||
    qxw(1,"а но","также","и")||
    qxw(1,"так","и") ) &&
      q(xwn+1,"prl_any prq_any nar_any") &&
     ba(xwn+2,"_locklike_things") && s(1,xwn+1) )
 { l[i]=omo2; Z[163]++; if(dbg){print "Z163"}; continue };

 # ни … ни
 if ( w(-2,"ни") &&
      q(-1,"prl_any mest_any prq_any") &&
sz_iili(1) &&
      w(2,"ни") &&
      q(3,"prl_any mest_any prq_any") &&
     ba(4,"_locklike_things") && s(-2,3) )
 { l[i]=omo2; Z[164]++; if(dbg){print "Z164"}; continue };

 if ( (qxs(-1,"а но","не и")||
       qxs(-1,"а но","также","и")||
       qxs(-1,"как так","и") ) &&
        ba(xsn-1,"_locklike_things") && zs(xsn-1) )
 { l[i]=omo2; Z[165]++; if(dbg){print "Z165"}; continue };
 #
 if ( qb(-4,-1,"sz_iili") ) { qb_n=qbn;
   if ( bba(qb_n-3,qb_n-1,"_locklike_things") ) { bb_n=bbn;

   if ( vgl(qb_n,-4,-1) && vgl(bb_n,qb_n-3,qb_n-1) && zs(qb_n-1) &&
        qir(bb_n+1,qb_n-1,"prl_any mest_any prq_any gl_pein gl_peed gl_pemn") && s(bb_n,qb_n-2) &&
        qir(qb_n+1,-1,"prl_any mest_any prq_any") && s(qb_n,-1) &&
      !(bfa(1,3,"_castle_pe") && s(0,bfn-1)) )
   { l[i]=omo2; Z[166]++; if(dbg){print "Z166"}; continue };
 };};
 # _locklike_things:end

 #######################################################################################################################
 # suw_ro escape:start
 cst="засов";
 if ( bw(1,"венчать") && zs(0) &&
      bf(2,5,cst) && s(1,bfn-1) && Qf(2,bfn-1,"sz_iili pre_any") )
 { l[i]=omo2; Z[167]++; if(dbg){print "Z167"}; continue };

 cst="поднять подхватить";
 if ( bw(-3,cst) &&
       w(-2,"с со") &&
       q(-1,"suw_ro") && s(-3,-1) )
 { l[i]=omo2; Z[168]++; if(dbg){print "Z168"}; continue };

 cst="слетать слететь спадать спасть";
 if ( w(1,"с со") &&
      q(2,"suw_ro") &&
     bw(3,cst) && s(0,2) )
 { l[i]=omo2; Z[169]++; if(dbg){print "Z169"}; continue };
 if ( w(1,"с со") &&
      q(2,"suw_ro") &&
      q(3,"nar_any prl_kred_sr") &&
     bw(4,cst) && s(0,3) )
 { l[i]=omo2; Z[170]++; if(dbg){print "Z170"}; continue };

 cst="подвала уровня яруса ярусов";
 cst1="крыши флюгера";
 if ( w(1,"с со от") && zs(0) &&
     wf(2,4,cst) &&
      w(wfn+1,"до") &&
     wb(wfn+2,wfn+4,cst1) && s(1,wbn-1) &&
    qir(2,wfn-1,"prl_ro mest_ro mest_3e") &&
    qir(wfn+2,wbn-1,"prl_ro mest_ro mest_3e") )
 { l[i]=omo1; Z[171]++; if(dbg){print "Z171"}; continue };

 if ( qxs(1,"с","лица","земли")||
      qxs(1,"снизу сверху","доверху донизу")||
      qxs(1,"с","ног","на","голову") )
 { l[i]=omo1; Z[172]++; if(dbg){print "Z172"}; continue };

 cst1="создавать создать сплести сплетать";
 cst2="ног пальцев рук";
 if ( bw(-3,cst1) &&
  pre_ro(-2) &&
       w(-1,cst2) && s(-3,-1) )
 { l[i]=omo2; Z[173]++; if(dbg){print "Z173"}; continue };
 if ( bw(-4,cst1) &&
  pre_ro(-3) &&
       q(-2,"prl_ro prq_ro mest_ro mest_3e") &&
       w(-1,cst2) && s(-4,-1) )
 { l[i]=omo2; Z[174]++; if(dbg){print "Z174"}; continue };
 cst1="принять";
 cst2="рук";
 if ( bw(-1,cst1) &&
       w(1,"из") &&
       w(2,cst2) && s(-1,1) )
 { l[i]=omo1; Z[175]++; if(dbg){print "Z175"}; continue };

 # suw_ro escape:end

 if ( FN_zamok_suwro_f() )
 { Z[176]++; if(dbg){print "Z176", "-- FN_zamok_suwro_f"}; continue };

 # _castle_suw-ro -- для
 if ( wf(1,6,"для") ) { wf_n=Y["n+_pre_dlya"]=wfn;
   if ( wfa(wf_n+1,wf_n+4,"_castle_suw-ro2") ) { bf_n=wfn;

    cst1="быть закрыть закрыться оказаться открываться открыть открыться подходить предназначаться располагать служить создаваться стать";
    if ( vgl(wf_n,2,6) && vgl(bf_n,wf_n+1,wf_n+4) && s(0,bf_n-1) &&
          bf(1,wf_n-1,cst1) &&
         qir(wf_n+1,bf_n-1,"prl_ro mest_ro mest_3e prq_ro") )
    { l[i]=omo1; Z[177]++; if(dbg){print "Z177"}; continue };

    if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+4) && s(0,bf_n-1) ) {
      if ( ba(-1,"_lock_prl") && s(-1) )
      { wf_n=bf_n=""; Z[178]++; if(dbg){print "Z178"}; };
      if ( wa(1,"_lock_suw-ro") && s(0) )
      { wf_n=bf_n=""; Z[179]++; if(dbg){print "Z179"}; };
      if ( qsb(-10,-1,",") && bb(sbn-3,sbn,"дверь люк") && s(sbn-3,sbn-1) )
      { wf_n=bf_n=""; Z[180]++; if(dbg){print "Z180"}; };
      if ( vex(Y["tn_ok_v"]) && TN_v_zamok_f() )
      { Z[181]++; if(dbg){print "Z181", "-- TN_v_zamok_f"}; continue};
      if ( vex(Y["tn_ok_na"]) && TN_na_zamok_f() )
      { Z[182]++; if(dbg){print "Z182", "-- TN_na_zamok_f"}; continue};
      if ( vex(Y["tn_ok_pod"]) && TN_pod_zamok_f() )
      { Z[183]++; if(dbg){print "Z183", "-- TN_pod_zamok_f"}; continue};

      if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+4) && s(0,bf_n-1) &&
           qir(1,wf_n-1,"nar_any prl_kred_sr prl_kred_mu prq_kred_sr prq_kred_mu suw_vi prl_vi prl_tv pre_vi qast_any") &&
           qir(wf_n+1,bf_n-1,"prl_ro mest_ro mest_3e prq_ro") )
      { l[i]=omo1; Z[184]++; if(dbg){print "Z184"}; continue };
   };
 };
   # продолжаем "для"
   cst="быть казаться оказаться показаться стать";
   cst2="простым простыми сложным сложными";
   if ( bf(wf_n+2,wf_n+5,cst) ) { bf_n=bfn;
     if ( wf(bf_n+1,bf_n+4,cst2) ) { wb_n=wfn;

       if ( vgl(wf_n,1,6) && vgl(bf_n,wf_n+1,wf_n+4) && vgl(wb_n,bf_n+1,bf_n+4) && s(0,wb_n-1) &&
            qir(1,wf_n-1,"nar_any prl_kred_sr isname") &&
            qir(wf_n+1,bf_n-1,"suw_ro prl_ro mest_ro mest_3e prq_ro qast_any") &&
            qir(bf_n+1,wb_n-1,"qast_any") )
       { l[i]=omo2; Z[185]++; if(dbg){print "Z185"}; continue };

  };};
 };

 if ( wb(-5,-2,"для") ) { wb_n=Y["n-_pre_dlya"]=wbn;
   if ( wba(wb_n+1,-1,"_castle_suw-ro1") ) { bb_n=wbn;

    if ( vgl(wb_n,-5,-1) && vgl(bb_n,wb_n+1,-1) && s(wb_n,-1) &&
         qir(wb_n+1,bb_n-1,"prl_ro mest_ro mest_3e prq_ro") &&
         qir(bb_n+1,-1,"prl_any mest_any") )
    { l[i]=omo1; Z[186]++; if(dbg){print "Z186"}; continue }; #checkro2

   };
   if ( wba(wb_n+1,-1,"_castle_suw-ro2") ) { bb_n=wbn;

    if ( vgl(wb_n,-5,-1) && vgl(bb_n,wb_n+1,-1) && s(wb_n-1,-1) &&
           q(wb_n-1,"prl_edmu") &&
         qir(wb_n+1,bb_n-1,"prl_ro mest_ro mest_3e prq_ro") &&
         qir(bb_n+1,-1,"prl_any mest_any") )
    { l[i]=omo1; Z[187]++; if(dbg){print "Z187"}; continue }; #checkro2

 };};
 # _castle_suw-ro -- для
 # _lock_suw-ro:start
 if ( wfa(1,5,"_lock_suw-ro") ) { wf_n=wfn;

    if ( vgl(wf_n,2,5) && s(0,wf_n-1) &&
      pre_ro(1) && w(wf_n+1,"до") && s(wfn) )
    { wf_n=""; Z[188]++; if(dbg){print "Z188"}; };

      cst0="гермодвери двери";
       if ( vgl(wf_n,1,5) && s(0,wf_n-1) && W(wf_n,cst0) &&
            vex(Y["tn_ok_v"]) && TN_v_zamok_f() )
       { Z[189]++; if(dbg){print "Z189", "-- TN_v_zamok_f"}; continue };

    if ( vgl(wf_n,2,5) && s(0,wf_n-1) &&
           w(1,"для у от") &&
         qir(2,wf_n-1,"prl_ro prq_ro mest_ro mest_3e") )
    { l[i]=omo2; Z[190]++; if(dbg){print "Z190"}; continue };
 };
 # _lock_suw-ro:end
 #######################################################################################################################


 # в географической местности
 if ( vgl(Y["n_pre_v"],-6,-3) ) { wb_n=Y["n_pre_v"];

    if ( q(wb_n+1,"isname") && s(wb_n,-1) &&
         q(wb_n+2,"gl_aux_be nar_any") &&
       qir(wb_n+3,-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[191]++; if(dbg){print "Z191"}; continue };
 };
 if ( vgl(Y["n_pre_na"],-6,-3) ) { wb_n=Y["n_pre_na"];

    if ( q(wb_n+1,"isname") && s(wb_n,-1) &&
         q(wb_n+2,"gl_aux_be nar_any") &&
       qir(wb_n+3,-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[192]++; if(dbg){print "Z192"}; continue };
 };
 # _castle_v_suw-pr+point_gl:start
 if ( vgl(Y["n_pre_v"],-6,-2) )  { wb_n=Y["n_pre_v"];
   if ( wba(wb_n+1,-1,"_castle_v_suw-pr") ) { bb_n=wbn;
   cst="быть висеть гореть купить находиться оказаться остаться парить построить появиться продать стоять";

    if ( vgl(wb_n,-6,-2) && vgl(bb_n,wb_n+1,-1) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") && s(wb_n,bb_n-1) &&
         qia(bb_n+1,-2,"qast","prl_any mest_any nar_any prl_kred_mu prl_krmn suw_ro") && ds(bb_n) &&
          bw(-1,cst) && s(bb_n+1,-1) )
    { l[i]=omo1; Z[193]++; if(dbg){print "Z193"}; continue };
    if ( vgl(wb_n,-6,-2) && vgl(bb_n,wb_n+1,-1) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") && s(wb_n,bb_n-1) &&
          bw(bb_n+1,cst) &&
         qia(bb_n+2,-1,"qast","prl_any mest_any nar_any prl_kred_mu prl_krmn suw_ro") && ds(bb_n) && s(bb_n+1,-1) )
    { l[i]=omo1; Z[194]++; if(dbg){print "Z194"}; continue };
    if ( vgl(wb_n,-6,-2) && vgl(bb_n,wb_n+1,-1) &&
          bw(wb_n-1,cst) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") && s(wb_n,bb_n-1) &&
         qia(bb_n+2,-1,"qast","prl_any mest_any nar_any prl_kred_mu prl_krmn suw_ro") && ds(bb_n) && s(bb_n+1,-1) )
    { l[i]=omo1; Z[195]++; if(dbg){print "Z195"}; continue };

 };};
 # _castle_v_suw-pr+point_gl:end

 # _lock_v_suw-pr:start
 if ( wf(1,4,"в во") ) { wf_n=wfn;

    if ( vgl(wf_n,1,1) &&
         wfa(wf_n+1,wf_n+4,"_lock_v_suw-pr") &&
         qir(wf_n+1,wfn-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qir(1,wf_n-1,"gl_peed gl_vzed prl_vi mest_vi mest_3e prq_vi qast_any") && s(0,wfn-1) )
    { l[i]=omo2; Z[196]++; if(dbg){print "Z196"}; continue };

 };
 if ( wb(-6,-2,"в во") ) { wb_n=wbn;
    if ( vgl(wb_n,-6,-2) &&
         wfa(wb_n+1,-1,"_lock_v_suw-pr") && zs(wfn) && s(wb_n,wfn-1) && s(wfn+1,-1) &&
         qir(wb_n+1,wfn-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qir(wfn+1,-1,"gl_need gl_vzed gl_aux_be prl_vi mest_vi mest_3e prq_vi isname nar_any qast_any") &&
          sv(-1,"\\(") && Q_w(1,"isname") && Q(wfn+1,"sz") )
    { l[i]=omo2; Z[197]++; if(dbg){print "Z197"}; continue };
    if ( vgl(wb_n,-6,-2) &&
         wfa(wb_n+1,-1,"_lock_v_suw-pr") && zs(wfn) && s(wb_n,wfn-1) && s(wfn+1,-1) &&
         qir(wb_n+1,wfn-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qir(wb_n+1,wfn-1,"prl_pr mest_pr mest_3e prq_pr") &&
           w(wfn+1,"у") &&
           q(wfn+2,"suw_ro isname") &&
         qir(wfn+3,-1,"gl_need gl_vzed gl_aux_be prl_vi mest_vi mest_3e prq_vi qast_any") )
    { l[i]=omo2; Z[198]++; if(dbg){print "Z198"}; continue };
 };
 # _lock_v_suw-pr:end

 # _castle_pod_suw-tv:start
 if ( w(1,"под") &&
    wfa(2,5,"_castle_pod_suw-tv") && s(0,wfn-1) &&
    qir(3,wfn-1,"prl_tv prq_tv mest_tv mest_3e qast") )
 { l[i]=omo1; Z[199]++; if(dbg){print "Z199"}; continue };
 if ( q(1,"qast") &&
      w(2,"под") &&
    wfa(3,6,"_castle_pod_suw-tv") && s(0,wfn-1) &&
    qir(3,wfn-1,"prl_tv prq_tv mest_tv mest_3e qast") )
 { l[i]=omo1; Z[200]++; if(dbg){print "Z200"}; continue };
 if ( w(-2,"под") &&
     wa(-1,"_castle_pod_suw-tv") && s(-2,-1) )
 { l[i]=omo1; Z[201]++; if(dbg){print "Z201"}; continue };
 # _castle_pod_suw-tv:end

 # _lock_pod_suw-tv:start
 if ( w(1,"под") && zs(0) &&
    wfa(2,5,"_lock_pod_suw-tv") && s(1,wfn-1) &&
    qir(3,wfn-1,"prl_tv prq_tv mest_tv mest_3e qast") )
 { l[i]=omo2; Z[202]++; if(dbg){print "Z202"}; continue };
 if ( q(1,"nar_spos qast") && zs(0) &&
      w(2,"под") &&
    wfa(3,6,"_lock_pod_suw-tv") && s(1,wfn-1) &&
    qir(3,wfn-1,"prl_tv prq_tv mest_tv mest_3e qast") )
 { l[i]=omo2; Z[203]++; if(dbg){print "Z203"}; continue };
 if ( w(-2,"под") &&
     wa(-1,"_lock_pod_suw-tv") && s(-2,-1) )
 { l[i]=omo2; Z[204]++; if(dbg){print "Z204"}; continue };
 # _lock_pod_suw-tv:end

 # _castle_na_suw-vi:start
 if ( w(1,"на") &&
    wfa(2,4,"_castle_na_suw-vi") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_vi mest_vi mest_3e nar_any prq_vi"))
 { l[i]=omo1; Z[205]++; if(dbg){print "Z205"}; continue };
 cst="месте";
 if ( qxw(1,"на",cst) &&
      bfa(xwn+1,xwn+4,"_castle_environs") && s(0,bfn-1) &&
      qir(xwn+1,bfn-1,"prl_pr mest_pr mest_3e nar_any prq_pr") )
 { l[i]=omo1; Z[206]++; if(dbg){print "Z206"}; continue };
 # _castle_na_suw-vi:end

 # _castle_na_suw-pr:start
    cst="валяться лежать";
    cst1="земле";
    if ( bb(-7,-1,cst) ) { bb_n=bbn;

       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              w(bb_n+1,"на") &&
             wf(bb_n+2,-1,cst1) &&
            qir(bb_n+2,wfn-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") &&
            qir(wfn+1,-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") )
       { l[i]=omo2; Z[207]++; if(dbg){print "Z207"}; continue };

    };
    if ( bf(1,5,cst) ) { bf_n=bfn;

       if ( vgl(bf_n,1,5) && s(0,bf_n-1) &&
              w(1,"на") &&
             wf(2,bf_n-1,cst1) &&
            qir(2,wfn-1,"prl_pr prq_pr mest_pr") )
       { l[i]=omo2; Z[208]++; if(dbg){print "Z208"}; continue };

    };
       if ( w(-1,"и") && s(-1) &&
          qxs(1,"на","земле") && p(xsn) )
       { l[i]=omo2; Z[209]++; if(dbg){print "Z209"}; continue };
       if ( wb(-5,-2,"на") && s(wbn,-1) &&
             w(wbn+1,"земле") &&
           qir(wbn+2,-1,"prl_vi mest_vi mest_3e prq_vi") )
       { l[i]=omo2; Z[210]++; if(dbg){print "Z210"}; continue };
#
 if ( wba(-7,-1,"_castle_na_suw-pr") ) { bb_n=wbn;
   if ( wb(bb_n-5,bb_n-1,"на") ) { wb_n=wbn;
   cst0="двери";

    if ( vgl(wb_n,bb_n-5,bb_n-1) && vgl(bb_n,-7,-1) &&
          qy(bb_n+1,"nar_napr nar_mest") && (zs(bb_n+qyn)||se(bb_n+qyn," — ")) && s(wb_n,bb_n-1) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qia(bb_n+1,-1-qyn,"gl_aux_be sz_i isname","prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e nar_any qast_any") && s(bb_n+1+qyn,-1) &&
        !bba(bb_n+1,-1-qyn,"_lock_prl") )
    { l[i]=omo1; Z[211]++; if(dbg){print "Z211"}; continue };
    if ( vgl(wb_n,bb_n-5,bb_n-1) && vgl(bb_n,-7,-1) && s(wb_n,bb_n) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
           q(bb_n+1,"suw_ro isname") && (zs(bb_n+1)||se(bb_n+1," — ")) && s(bb_n+2,-1) &&
           W(bb_n+1,cst0) && !wba(bb_n+2,-1,"_lock_prl") &&
         qia(bb_n+2,-1,"qast","prl_vi mest_vi mest_3e nar_any qast_any") )
    { l[i]=omo1; Z[212]++; if(dbg){print "Z212"}; continue };
    if ( vgl(wb_n,bb_n-5,bb_n-1) && vgl(bb_n,-7,-1) && s(wb_n,-3) && (zs(-2)||se(-2," — ")) && s(-1) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qir(bb_n+1,-2,"suw_ro isname prl_ro mest_ro mest_3e prq_ro") &&
           W(-2,cst0) && !wa(-1,"_lock_prl") &&
           q(-1,"prl_vi mest_vi mest_3e nar_any qast_any") )
    { l[i]=omo1; Z[213]++; if(dbg){print "Z213"}; continue };
    if ( vgl(wb_n,bb_n-5,bb_n-1) && vgl(bb_n,-7,-1) && s(wb_n,-2) && (zs(-1)||se(-1," — ")) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qir(bb_n+1,-1,"suw_ro isname prl_ro mest_ro mest_3e prq_ro") && W(-1,cst0) )
    { l[i]=omo1; Z[214]++; if(dbg){print "Z214"}; continue };
    if ( vgl(wb_n,bb_n-5,bb_n-1) && vgl(bb_n,-7,-1) && s(wb_n,-1) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qir(bb_n+1,-2,"suw_ro isname") &&
           q(-1,"mest_im isname suw_im") )
    { l[i]=omo1; Z[215]++; if(dbg){print "Z215"}; continue };
    if ( vgl(wb_n,bb_n-5,bb_n-1) && vgl(bb_n,-7,-1) && s(wb_n,-1) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qir(bb_n+1,-3,"suw_ro isname") &&
         qir(-2,-1,"mest_im isname suw_im sz_i qast_any") )
    { l[i]=omo1; Z[216]++; if(dbg){print "Z216"}; continue };
    if ( vgl(wb_n,bb_n-5,bb_n-1) && vgl(bb_n,-7,-1) && s(wb_n,-1) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
           q(bb_n+1,"prq_edmuim prq_mnim") &&
           q(bb_n+2,"suw_tv") &&
         qir(bb_n+3,-1,"mest_ro isname suw_ro") )
    { l[i]=omo1; Z[217]++; if(dbg){print "Z217"}; continue };
    if ( vgl(wb_n,bb_n-5,bb_n-1) && vgl(bb_n,-7,-1) && s(wb_n,-1) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qiz(bb_n+1,-1,"nar_step prl_kred_sr prl_kred_mu prl_krmn prl_edmuvi prl_mnvi","sz_i qast_any") )
    { l[i]=omo1; Z[218]++; if(dbg){print "Z218"}; continue };
    if ( vgl(wb_n,bb_n-5,bb_n-1) && vgl(bb_n,-7,-1) && s(wb_n,-1) &&
          qb(bb_n+1,-1,"sz_iili") &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qia(bb_n+1,qbn-1,"nar_step prl_kred_sr","prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") &&
         qir(qbn+1,-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") )
    { l[i]=omo1; Z[219]++; if(dbg){print "Z219"}; continue };

 };};

 if ( w(-4,"на") &&
     wa(-3,"_castle_na_suw-pr") &&
 pre_ro(-2) &&
      q(-1,"suw_ro mest_ro") && s(-4,-1) )
 { l[i]=omo1; Z[220]++; if(dbg){print "Z220"}; continue };
 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw-pr") &&
 pre_ro(-3) &&
      q(-2,"suw_ro mest_ro") &&
     bw(-1,"быть") && s(-5,-1) )
 { l[i]=omo1; Z[221]++; if(dbg){print "Z221"}; continue };
 if ( w(-6,"на") &&
     wa(-5,"_castle_na_suw-pr") &&
 pre_ro(-4) &&
      q(-3,"suw_ro mest_ro") &&
      q(-2,"nar_spos") &&
     bw(-1,"быть") && s(-6,-1) )
 { l[i]=omo1; Z[222]++; if(dbg){print "Z222"}; continue };

 if ( w(-5,"на") &&
     wa(-4,"_castle_na_suw-pr") &&
 pre_tv(-3) &&
      q(-2,"suw_tv isname") &&
      q(-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") && s(-5,-1) )
 { l[i]=omo1; Z[223]++; if(dbg){print "Z223"}; continue };

 if ( vgl(Y["n_pre_na"],-8,-3) ) { wb_n=Y["n_pre_na"];
   if ( wfa(wb_n+1,wb_n+4,"_castle_na_suw-pr") ) { wf_n=wfn;
     if ( bfa(wf_n+1,-1,"_gl_4_castle_na_suw-pr") ) { bf_n=bfn;
       if ( gl_aux_be(bf_n) ) { if ( bfa(bf_n+1,-1,"_gl_4_castle_na_suw-pr") ) bf_n=bfn; };

       if ( vgl(wb_n,-8,-3) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wf_n+1,-1) && s(wb_n,-1) &&
            qir(wb_n+1,wf_n-1,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
            qir(wf_n+1,bf_n-1,"suw_ro mest_ro mest_3e isname prl_kred_sr nar_any mest_im suw_im suw_edne mod_any gl_aux_be suw_da mest_da prl_da prq_da qast") &&
            qir(bf_n+1,-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e prl_kred_sr nar_any qast suw_ro prq_ro mest_ro suw_tv prl_tv mest_tv") )
       { l[i]=omo1; Z[224]++; if(dbg){print "Z224"}; continue };

       if ( vgl(wb_n,-8,-3) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wf_n+1,-1) && s(wb_n,-1) &&
              q(wf_n+1,"pre_da") &&
            qir(wb_n+1,wf_n-1,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
            qir(wf_n+2,bf_n-1,"suw_ro mest_ro mest_3e isname prl_kred_sr nar_any suw_edne mod_any gl_aux_be suw_da mest_da prl_da prq_da qast") &&
            qir(bf_n+1,-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e prl_kred_sr nar_any qast suw_ro prq_ro mest_ro suw_tv prl_tv mest_tv") )
       { l[i]=omo1; Z[225]++; if(dbg){print "Z225"}; continue };
       if ( vgl(wb_n,-8,-3) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wf_n+1,-1) && s(wb_n,-1) &&
              q(wf_n+1,"pre_tv") &&
            qir(wb_n+1,wf_n-1,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
            qir(wf_n+2,bf_n-1,"suw_ro mest_ro mest_3e isname prl_kred_sr nar_any suw_edne mod_any gl_aux_be suw_tv mest_tv prl_tv prq_tv qast") &&
            qir(bf_n+1,-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e prl_kred_sr nar_any qast suw_ro prq_ro mest_ro suw_tv prl_tv mest_tv") )
       { l[i]=omo1; Z[226]++; if(dbg){print "Z226"}; continue };
       if ( vgl(wb_n,-8,-3) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wf_n+1,-1) && s(wb_n,-1) &&
              q(wf_n+1,"pre_ro") &&
            qir(wb_n+1,wf_n-1,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
            qir(wf_n+2,bf_n-1,"suw_ro mest_ro mest_3e isname prl_kred_sr nar_any suw_edne mod_any gl_aux_be qast") &&
            qir(bf_n+1,-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e prl_kred_sr nar_any qast suw_ro prq_ro mest_ro suw_tv prl_tv mest_tv") )
       { l[i]=omo1; Z[227]++; if(dbg){print "Z227"}; continue };

   };};
   cst="краю кромке";
   cst1="болота города городка дороги дубровы земли которого леса мира моря мыса обрыва озера острова поля поляны пропасти пустыни селения скалы степи утеса чаши \
         чащи";
   if ( wf(wb_n+1,wb_n+4,cst) ) { wf_n=wfn;
     if ( bfa(wf_n+1,-1,"_gl_4_castle_na_suw-pr") ) { bf_n=bfn;
       if ( gl_aux_be(bf_n) ) { if ( bfa(bf_n+1,-1,"_gl_4_castle_na_suw-pr") ) bf_n=bfn; };

       if ( vgl(wb_n,-8,-3) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wf_n+1,-1) && s(wb_n,-1) &&
             wf(wf_n+1,bf_n-1,cst1) &&
            qir(wb_n+1,wf_n-1,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
            qir(bf_n+1,wfn-1,"prl_ro prq_ro mest_ro mest_3e muk_ro") &&
            qir(wfn+1,bf_n-1,"suw_ro mest_ro mest_3e isname prl_kred_sr nar_any mest_im suw_im suw_edne mod_any gl_aux_be suw_da mest_da prl_da prq_da qast") &&
            qir(bf_n+1,-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e prl_kred_sr nar_any qast suw_ro prq_ro mest_ro suw_tv prl_tv mest_tv") )
       { l[i]=omo1; Z[228]++; if(dbg){print "Z228"}; continue };

 };};
 };

 if ( w(1,"на") &&
    wfa(2,4,"_castle_na_suw-pr") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_pr mest_pr mest_3e nar_any prq_pr") )
 { l[i]=omo1; Z[229]++; if(dbg){print "Z229"}; continue };

 cst="краю кромке";
 cst1="болота городка дороги дубровы земли леса мира моря мыса обрыва озера острова поля поляны пропасти пустыни скалы степи утеса чаши чащи";
 if ( w(1,"на") &&
     wf(2,4,cst) &&
    wf2(wfn+1,wfn+4,cst1) &&
    qir(2,wfn-1,"prl_pr mest_pr mest_3e nar_any prq_pr") &&
    qir(wfn+1,wfn2-1,"prl_ro mest_ro prq_ro isname") && s(0,wfn2-1) )
 { l[i]=omo1; Z[230]++; if(dbg){print "Z230"}; continue };

 if ( bba(1,3,"_gl_4_castle_na_suw-pr") ) { bf_n=bbn;

     if ( bba(-3,-1,"_lock_prl") && s(bbn,-1) )
     { bf_n=""; Z[231]++; if(dbg){print "Z231"}; };

   if ( vgl(bf_n,1,3) && zs(0) &&
          w(bf_n+1,"на") &&
        wfa(bf_n+2,bf_n+6,"_castle_na_suw-pr") &&
        qir(1,bf_n-1,"nar_any qast_any mod_any gl_aux_be prl_kred_sr") &&
        qir(bf_n+2,wfn-1,"prl_vi prl_pr otsz_vi otsz_pr mest_vi mest_pr prq_vi prq_pr") && s(1,wfn-1) )
   { l[i]=omo1; Z[232]++; if(dbg){print "Z232"}; continue };

   if ( vgl(bf_n,1,3) && zs(0) &&
          w(bf_n+1,"на") &&
         wf(bf_n+2,bf_n+6,cst) &&
        wf2(wfn+1,wfn+4,cst1) &&
        qir(1,bf_n-1,"nar_any qast_any mod_any gl_aux_be prl_kred_sr") &&
        qir(bf_n+2,wfn-1,"prl_vi prl_pr otsz_vi otsz_pr mest_vi mest_pr prq_vi prq_pr") &&
        qir(wfn+1,wfn2-1,"prl_ro mest_ro prq_ro isname") && s(1,wfn2-1) )
   { l[i]=omo1; Z[233]++; if(dbg){print "Z233"}; continue };
 };
 # _castle_na_suw-pr:end

 # _lock_na_suw-pr:start
 if ( vgl(Y["n_pre_na"],-8,-2) ) { wb_n=Y["n_pre_na"];
   if ( wfa(wb_n+1,wb_n+4,"_lock_na_suw-pr") ) { wf_n=wfn;
     if ( bfa(wf_n+1,-1,"_gl_4_lock_na_suw-pr") ) { bf_n=bfn;
       if ( gl_aux_be(bf_n) ) { if ( bfa(bf_n+1,-1,"_gl_4_lock_na_suw-pr") ) bf_n=bfn; };

       if ( vgl(wb_n,-8,-3) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wf_n+1,-1) && s(wb_n,-1) &&
            qir(wb_n+1,wf_n-1,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
            qir(wf_n+1,bf_n-1,"suw_ro mest_ro mest_3e isname prl_kred_sr nar_any mest_im suw_im suw_edne mod_any gl_aux_be suw_da mest_da prl_da prq_da qast") &&
            qir(bf_n+1,-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e prl_kred_sr nar_any qast suw_ro prq_ro mest_ro suw_tv prl_tv mest_tv") )
       { l[i]=omo2; Z[234]++; if(dbg){print "Z234"}; continue };

     };
     if ( bba(wb_n-3,wb_n-1,"_gl_4_lock_na_suw-pr") ) { bf_n=bbn;

       if ( vgl(wb_n,-8,-2) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wb_n-3,wb_n-1) && s(bf_n,-1) &&
            qir(bf_n+1,wb_n-1,"nar_any suw_da mest_da") &&
            qir(wb_n+1,wf_n-1,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
            qir(wf_n+1,-1,"prl_vi mest_vi mest_3e") )
       { l[i]=omo2; Z[235]++; if(dbg){print "Z235"}; continue };

      };

 };};
 if ( vgl(Y["n_pre_na"],-8,-2) ) { wb_n=Y["n_pre_na"];
   if ( wfa(wb_n+1,-1,"_lock_na_suw-pr") ) { bf_n=wfn;

        if ( vgl(Y["n-_castle_pe"],wfn+1,-1) )
        { bf_n=""; Z[236]++; if(dbg){print "Z236"}; };
        if ( s(-1) && bw(-1,"весь целый") )
        { wb_n=bf_n=""; Z[237]++; if(dbg){print "Z237"}; };

        cst0="держать остаться унести";
        if ( bb(wb_n-4,wb_n-1,cst0) && s(bbn,-1) &&
           mwba(bf_n,bbn,"M_lock_na_suw-pr_gl_castle_pe") )
        { wb_n=bf_n=""; Z[238]++; if(dbg){print "Z238"}; };
        if ( bf(wb_n+1,-1,cst0) && s(wb_n,-1) &&
           mwba(bf_n,bfn,"M_lock_na_suw-pr_gl_castle_pe") )
        { wb_n=bf_n=""; Z[239]++; if(dbg){print "Z239"}; };

      if ( vgl(wb_n,-8,-2) && vgl(bf_n,wb_n+1,-1) && s(wb_n,-1) &&
           qir(wb_n+1,bf_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
           qir(bf_n+1,-1,"gl_need gl_vzed gl_aux_be prl_vi mest_vi mest_3e prq_vi qast_any") &&
            sv(-1,"\\(") && Q_w(1,"isname") )
      { l[i]=omo2; Z[240]++; if(dbg){print "Z240"}; continue };
 };};


 if ( wa(-2,"_lock_na_suw-pr") && se(-2," — ") &&
       w(-1,"на") && s(-1) )
 { l[i]=omo2; Z[241]++; if(dbg){print "Z241"}; continue };


 if ( w(1,"на") && wfa(2,5,"_lock_na_suw-pr") ) { wf_n=wfn;

        if ( vex(Y["tn_ok_v"]) && vex(Y["n-_gl_v_castle-iv"]) &&
            mwba(wf_n,Y["n-_gl_v_castle-iv"],"M_lock_na_suw-pr_gl_v_castle") && TN_v_zamok_f() )
        { Z[242]++; if(dbg){print "Z242"}; continue };
        if ( vex(Y["tn_ok_v"]) && bfa(wf_n+1,wf_n+3,"_gl_v_castle-iv") &&
            mwba(wf_n,bfn,"M_lock_na_suw-pr_gl_v_castle") && TN_v_zamok_f() )
        { Z[243]++; if(dbg){print "Z243"}; continue };
        if ( vex(Y["tn_ok_v"]) && vex(Y["n-_suw_v_castle-vp"]) &&
            mwba(wf_n,Y["n-_suw_v_castle-vp"],"M_lock_na_suw-pr_suw_v_castle-vp") && TN_v_zamok_f() )
        { Z[244]++; if(dbg){print "Z244"}; continue };
        if ( vex(Y["tn_ok_qerez"]) && bba(Y["tn_ok_qerez"]-5,Y["tn_ok_qerez"]-1,"_gl_qerez_castle") &&
            mwba(wf_n,Y["n-_gl_v_castle-iv"],"M_lock_na_suw-pr_gl_qerez_castle") && TN_qerez_zamok_f() )
        { Z[245]++; if(dbg){print "Z245"}; continue };
        if ( vex(Y["tn_ok_qerez"]) && bfa(wf_n+1,wf_n+3,"_gl_qerez_castle") &&
            mwba(wf_n,bfn,"M_lock_na_suw-pr_gl_qerez_castle") && TN_qerez_zamok_f() )
        { Z[246]++; if(dbg){print "Z246"}; continue };
        cst0="держать остаться унести";
        if ( bb(-4,-1,cst0) && s(bbn,wf_n-1) &&
           mwba(wf_n,bbn,"M_lock_na_suw-pr_gl_castle_pe") )
        { wf_n=""; Z[247]++; if(dbg){print "Z247"}; };
        if ( bf(-4,-1,cst0) && s(bfn,wf_n-1) &&
           mwba(wf_n,bfn,"M_lock_na_suw-pr_gl_castle_pe") )
        { wf_n=""; Z[248]++; if(dbg){print "Z248"}; };
        cst0="весь целый";
        if ( w(-1,cst0) && vgl(wf_n,2,5) && s(-1,wf_n-1) )
        { wf_n=""; Z[249]++; if(dbg){print "Z249"}; };

     if ( vgl(wf_n,2,5) && s(0,wf_n-1) &&
          qir(2,wf_n-1,"prl_pr mest_pr mest_3e prq_pr") )
     { l[i]=omo2; Z[250]++; if(dbg){print "Z250"}; continue };
 };
 # _lock_na_suw-pr:end

 # _lock_na_suw-vi:start
 if ( vgl(Y["n_pre_na"],-8,-2) ) { wb_n=Y["n_pre_na"];
   if ( wfa(wb_n+1,wb_n+4,"_lock_na_suw-vi") ) { wf_n=wfn;
     if ( bfa(wf_n+1,-1,"_gl_4_lock_na_suw-vi") ) { bf_n=bfn;
       if ( gl_aux_be(bf_n) ) { if ( bfa(bf_n+1,-1,"_gl_4_lock_na_suw-vi") ) bf_n=bfn; };

       if ( vgl(wb_n,-8,-3) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wf_n+1,-1) && s(wb_n,-1) &&
            qir(wb_n+1,wf_n-1,"prl_vi prq_vi mest_vi mest_3e muk_vi") &&
            qir(wf_n+1,bf_n-1,"suw_ro mest_ro mest_3e isname prl_kred_sr nar_any mest_im suw_im suw_edne mod_any gl_aux_be suw_da mest_da prl_da prq_da qast") &&
            qir(bf_n+1,-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e prl_kred_sr nar_any qast suw_ro prq_ro mest_ro suw_tv prl_tv mest_tv") )
       { l[i]=omo2; Z[251]++; if(dbg){print "Z251"}; continue };

     };
     if ( bba(wb_n-3,wb_n-1,"_gl_4_lock_na_suw-vi") ) { bf_n=bbn;

       if ( vgl(wb_n,-8,-2) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wb_n-3,wb_n-1) && s(bf_n,-1) &&
            qir(bf_n+1,wb_n-1,"nar_any suw_da mest_da") &&
            qir(wb_n+1,wf_n-1,"prl_vi prq_vi mest_vi mest_3e muk_vi") &&
            qir(wf_n+1,-1,"prl_vi mest_vi mest_3e") )
       { l[i]=omo2; Z[252]++; if(dbg){print "Z252"}; continue };

      };

 };};
 if ( vgl(Y["n_pre_na"],-8,-2) ) { wb_n=Y["n_pre_na"];
   if ( wfa(wb_n+1,-1,"_lock_na_suw-vi") ) { bf_n=wfn;
      if ( vgl(Y["n-_castle_pe"],wfn+1,-1) )
      { bf_n=""; Z[253]++; if(dbg){print "Z253"}; };
#       cst0="держать";
#       if ( bb(wb_n-4,wb_n-1,cst0) && s(bbn,-1) &&
#           mwba(bf_n,bbn,"M_lock_na_suw-vi_gl_castle_pe") )
#       { wb_n=bf_n=""; Z[254]++; if(dbg){print "Z254"}; };

      if ( vgl(wb_n,-8,-2) && vgl(bf_n,wb_n+1,-1) && s(wb_n,-1) &&
           qir(wb_n+1,bf_n-1,"prl_vi mest_vi mest_3e prq_vi") &&
           qir(bf_n+1,-1,"gl_ed gl_in gl_mn gl_vzed gl_vzmn gl_po gl_aux_be prl_vi mest_vi mest_3e prq_vi qast_any") &&
            sv(-1,"\\(") && Q_w(1,"isname") )
      { l[i]=omo2; Z[255]++; if(dbg){print "Z255"}; continue };
 };};

 if ( wa(-2,"_lock_na_suw-vi") && se(-2," — ") &&
       w(-1,"на") && s(-1) )
 { l[i]=omo2; Z[256]++; if(dbg){print "Z256"}; continue };

 if ( w(1,"на") && wfa(2,5,"_lock_na_suw-vi") ) { wf_n=wfn;

        if ( vex(Y["tn_ok_v"]) && vex(Y["n-_gl_v_castle-iv"]) &&
            mwba(wf_n,Y["n-_gl_v_castle-iv"],"M_lock_na_suw-vi_gl_v_castle") && TN_v_zamok_f() )
        { Z[257]++; if(dbg){print "Z257"}; continue };
#       if ( vex(Y["tn_ok_v"]) && bfa(wf_n+1,wf_n+3,"_gl_v_castle-iv") &&
#           mwba(wf_n,bfn,"M_lock_na_suw-vi_gl_v_castle") && TN_v_zamok_f() )
#       { Z[258]++; if(dbg){print "Z258"}; continue };
        if ( vex(Y["tn_ok_v"]) && vex(Y["n-_suw_v_castle-vp"]) &&
            mwba(wf_n,Y["n-_suw_v_castle-vp"],"M_lock_na_suw-vi_suw_v_castle-vp") && TN_v_zamok_f() )
        { Z[259]++; if(dbg){print "Z259"}; continue };

     if ( vgl(wf_n,2,5) && s(0,wf_n-1) &&
          qir(2,wf_n-1,"prl_vi mest_vi mest_3e prq_vi") )
     { l[i]=omo2; Z[260]++; if(dbg){print "Z260"}; continue };
 };
 # _lock_na_suw-pr:end

 # _castle_bez_suw-ro:start
 if ( wf(1,3,"без") &&
     wba(wfn+1,wfn+3,"_castle_bez_suw-ro") && s(0,wbn-1) &&
     qir(1,wfn-1,"isname nar_any") &&
     qir(wbn+1,wbn-1,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo1; Z[261]++; if(dbg){print "Z261"}; continue };
 # _castle_bez_suw-ro:end

 # _lock_bez_suw-ro:start
 if ( wb(-5,-2,"без") && s(wbn,-1) &&
      wa(-1,"_lock_bez_suw-ro") &&
     qir(wbn+1,-2,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo2; Z[262]++; if(dbg){print "Z262"}; continue };
 if ( w(1,"без") &&
    wfa(2,5,"_lock_bez_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo2; Z[263]++; if(dbg){print "Z263"}; continue };
 # _lock_bez_suw-ro:end

 # _castle_iz_suw-ro:start
 if ( w(1,"из") &&
    wfa(2,5,"_castle_iz_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo1; Z[264]++; if(dbg){print "Z264"}; continue };

 if ( wb(-5,-1,"из") ) { wb_n=wbn;
    if ( vgl(wb_n,-5,-1) && s(wb_n,-1) &&
         qir(wb_n+1,-2,"prl_ro prq_ro mest_ro mest_3e") &&
          wa(-1,"_castle_iz_suw-ro") )
    { l[i]=omo1; Z[265]++; if(dbg){print "Z265"}; continue };
    cst="построить сложить строить";
    if ( vgl(wb_n,-5,-1) && s(wb_n-1,-1) &&
          bw(wb_n-1,cst) &&
           q(wb_n+1,"mest_vip3e") &&
         qir(wb_n+2,-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[266]++; if(dbg){print "Z266"}; continue };
    if ( vgl(wb_n,-5,-1) && s(wb_n,-1) &&
           q(wb_n+1,"otsz_ro mest_vip3e") &&
          bw(wb_n+2,cst) &&
         qir(wb_n+3,-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[267]++; if(dbg){print "Z267"}; continue };
 };
 # _castle_iz_suw-ro:end

 # _lock_iz_suw-ro:start
 if ( !( veq(Y["iwrd_case"],"iv") && bb(-3,-1,"вырвать принять") ) ) {
    if ( w(1,"из") &&
       wfa(2,5,"_lock_iz_suw-ro") && s(0,wfn-1) &&
       qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
    { l[i]=omo2; Z[268]++; if(dbg){print "Z268"}; continue };
 };
 # _lock_iz_suw-ro:end

 # _castle_pre-ro_suw-ro:start
 if ( w(1,"у возле посреди") &&
    wfa(2,4,"_castle_pre-ro_suw-ro") && s(0,wfn-1) )
 { l[i]=omo1; Z[269]++; if(dbg){print "Z269"}; continue };
 if ( wb(-6,-2,"у возле посреди") && s(wbn,-1) &&
      Qb(wbn+1,-1,"pre_any sz_iili") &&
     wba(wbn+1,-1,"_castle_pre-ro_suw-ro") &&
    !(bf(1,5,"повесить") && s(0,bfn-1)) )
 { l[i]=omo1; Z[270]++; if(dbg){print "Z270"}; continue };
 # _castle_pre-ro_suw-ro:start

 ######################################################################################################################
 # _castle_k_suw-da:start
 if ( w(1,"к ко") &&
     wa(2,"_castle_k_suw-da") && s(0,1) )
 { l[i]=omo1; Z[271]++; if(dbg){print "Z271"}; continue };
 if ( wb(-6,-1,"к ко") &&
     wba(wbn+1,-1,"_castle_k_suw-da") && s(wbn,-1) )
 { l[i]=omo1; Z[272]++; if(dbg){print "Z272"}; continue };
 # _castle_k_suw-da:end

 # _castle_pre-tv_suw-tv:start
 if ( pre_tv(1) &&
         wfa(2,4,"_castle_pre-tv_suw-tv") && s(0,wfn-1) )
 { l[i]=omo1; Z[273]++; if(dbg){print "Z273"}; continue };
 if ( qb(-6,-1,"pre_tv") &&
     wba(wbn+1,-1,"_castle_pre-tv_suw-tv") && s(wbn,-1) && s(0,qbn-1) )
 { l[i]=omo1; Z[274]++; if(dbg){print "Z274"}; continue };
 # _castle_pre-tv_suw-tv:end

 # _lock_mexdu_suw-tv:start
 if ( w(1,"между") &&
    wfa(2,4,"_lock_mexdu_suw-tv") && s(0,wfn-1) )
 { l[i]=omo2; Z[275]++; if(dbg){print "Z275"}; continue };
 # _lock_mexdu_suw-tv:end

 cst="вдалеке вдали веками издали";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; Z[276]++; if(dbg){print "Z276"}; continue };
 if ( qxs(-1,"тот этот","же самый") &&
        w(xsn-1,cst) && s(xsn-1) )
 { l[i]=omo1; Z[277]++; if(dbg){print "Z277"}; continue };

 if ( !(vgl(Y["n_pre_na_ist"],-5,-1) && s(Y["n-_lock_pe"],-1) ) &&
          q(1,"nar_vrem") &&
        qxs(2,"столько сколько много немало несколько","дней недель месяцев лет веков столетий тысячелетий времени") )
 { l[i]=omo1; Z[278]++; if(dbg){print "Z278"}; continue };
 if ( qxs(-1,"в","последние следующие последующие эти те такие","дни недели месяцы годы века столетия тысячелетия") )
 { l[i]=omo1; Z[279]++; if(dbg){print "Z279"}; continue };

 if ( qxs(1,"многие долгие","дни недели месяцы годы века столетия тысячелетия") )
 { l[i]=omo1; Z[280]++; if(dbg){print "Z280"}; continue };

 # _castle_s_suw-ro:start
 if ( w(-2,"с со") &&
     wa(-1,"_castle_s_suw-ro") && s(-2,-1) )
 { l[i]=omo1; Z[281]++; if(dbg){print "Z281"}; continue };
 # _castle_s_suw-ro:end

 # _castle_s_suw-tv:start
 if ( w(-2,"с со") &&
     wa(-1,"_castle_s_suw-tv") && s(-2,-1) )
 { l[i]=omo1; Z[282]++; if(dbg){print "Z282"}; continue };
 # _castle_s_suw-tv:end

 if ( w(1,"с со") ) {
     if (Y["tn_ok_na"] && TN_na_zamok_f() )
     { Z[283]++; if(dbg){print "Z283", "-- TN_na_zamok_f"}; continue } else {
     # _castle_s_suw-ro:start
     if ( zs(0) &&
         wfa(2,5,"_castle_s_suw-ro") && s(0,wfn-1) &&
         qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e qik_ro") )
     { l[i]=omo1; Z[284]++; if(dbg){print "Z284"}; continue };
     # _castle_s_suw-ro:end
     # _castle_s_suw-tv:start
     if ( zs(0) &&
         wfa(2,5,"_castle_s_suw-tv") && s(1,wfn-1) &&
         qir(2,wfn-1,"prl_tv prq_tv mest_tv mest_3e qik_tv") )
     { l[i]=omo1; Z[285]++; if(dbg){print "Z285"}; continue };
     # _castle_s_suw-tv:end
 }; };

 # _castle_u_suw-ro:start
 if ( w(1,"у") &&
    wfa(2,5,"_castle_u_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e qik_ro") )
 { l[i]=omo1; Z[286]++; if(dbg){print "Z286"}; continue };
 # _castle_u_suw-ro:start

 # _castle_sredi_suw-ro:start
 if ( w(1,"посреди посредине среди") &&
    wfa(2,5,"_castle_sredi_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e qik_ro") )
 { l[i]=omo1; Z[287]++; if(dbg){print "Z287"}; continue };
 if ( w(-2,"посреди посредине среди") &&
     wa(-1,"_castle_sredi_suw-ro") && s(-2,-1) )
 { l[i]=omo1; Z[288]++; if(dbg){print "Z288"}; continue };
 # _castle_sredi_suw-ro:start

 # _castle_bez_suw-ro:start
 if ( w(-2,"без") &&
     wa(-1,"_castle_bez_suw-ro") && s(-2,-1) )
 { l[i]=omo1; Z[289]++; if(dbg){print "Z289"}; continue };
 # _castle_bez_suw-ro:start

 # _lock_s_suw-ro:start
 if ( wb(-8,-2,"с со") ) { wb_n=wbn;
   if ( wfa(wb_n+1,-1,"_lock_s_suw-ro") ) { bb_n=wfn;

      if ( vgl(wb_n,-8,-2) && vgl(bb_n,wb_n+1,-1) && s(wb_n,-1) &&
           qir(wb_n+1,bb_n-1,"prl_ro mest_ro mest_3e") &&
           qir(bb_n+1,-1,"prl_any mcop_any suw_ro") )
      { l[i]=omo2; Z[290]++; if(dbg){print "Z290"}; continue };

 };};
 if ( w(1,"с со") &&
    wfa(2,5,"_lock_s_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e qik_ro") && W_w(wfn+1,"до по") )
 { l[i]=omo2; Z[291]++; if(dbg){print "Z291"}; continue };
 # _lock_s_suw-ro:end

 # _lock_u_suw-ro:start
 if ( w(1,"у") &&
    wfa(2,5,"_lock_u_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e qik_ro") && W_w(wfn+1,"до по") )
 { l[i]=omo2; Z[292]++; if(dbg){print "Z292"}; continue };
 if ( w(-2,"у") &&
     wa(-1,"_lock_u_suw-ro") && s(-2,-1) )
 { l[i]=omo2; Z[293]++; if(dbg){print "Z293"}; continue };
 # _lock_u_suw-ro:end

 # _lock_s_suw-tv:start
 if ( wf(1,3,"с со") ) { wf_n=wfn;
   if ( wfa(wf_n+1,wf_n+4,"_lock_s_suw-tv") ) { bf_n=wfn;

      if ( vex(Y["tn_ok_v"]) && TN_v_zamok_f() )
      { Z[294]++; if(dbg){print "Z294", "-- TN_v_zamok_f"}; continue };
      cst="накренить покидать покинуть";
      if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+4) && s(-1,wf_n-1) &&
           veq(Y["n-_castle_pe"],-1) && bw(-1,cst) )
      { wf_n=bf_n=""; Z[295]++; if(dbg){print "Z295"}; };
      cst="обрушиться рухнуть";
      if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+4) && s(0,wf_n-1) &&
           veq(Y["n+_castle_pe"],bf_n+1) && bw(bf_n+1,cst) )
      { wf_n=bf_n=""; Z[296]++; if(dbg){print "Z296"}; };
      cst0="отчего";
      if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+4) && s(-1,wf_n-1) &&
            ba(-1,"_castle_prl") && W(-1,cst0) )
      { wf_n=bf_n=""; Z[297]++; if(dbg){print "Z297"}; };
      cst2="деталями";
      cst3="бетона камня кирпича мрамора";
      if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+4) &&
             w(bf_n,cst2) &&
             w(bf_n+1,"из") &&
            wf(bf_n+2,bf_n+4,cst3) && s(0,wfn-1) )
      { l[i]=omo1; Z[298]++; if(dbg){print "Z298"}; continue };

    if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+4) && s(0,bf_n-1) &&
         qir(1,wf_n-1,"prl_vi mest_vi gl_aux_be qast_any nar_any") &&
         qir(wf_n+1,bf_n-1,"prl_tv prq_tv mest_tv mest_3e qik_tv suw_tv") && W_w(bf_n+1,"до по") )
    { l[i]=omo2; Z[299]++; if(dbg){print "Z299"}; continue };
    if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+4) && s(0,bf_n-1) &&
       mqast(1) && xwn == wf_n-1 &&
         qir(wf_n+1,bf_n-1,"prl_tv prq_tv mest_tv mest_3e qik_tv") && W_w(bf_n+1,"до по") )
    { l[i]=omo2; Z[300]++; if(dbg){print "Z300"}; continue };


 };};
 # _lock_s_suw-tv:end

 cst="близ вблизи";
 if ( w(1,cst) && q(2,"suw_ro isname") && s(0,1)  )
 { l[i]=omo1; Z[301]++; if(dbg){print "Z301"}; continue };

 if ( sc(0,"[XIV]+") &&
       w(1,"века веков столетия столетий") && s(0) )
 { l[i]=omo1; Z[302]++; if(dbg){print "Z302"}; continue };
 if ( sc(0,"[XIV]+") &&
       w(1,"в вв") && s(0) && sc(1,"\\.") )
 { l[i]=omo1; Z[303]++; if(dbg){print "Z303"}; continue };

  ######################################################################################################
    # основные прилагательные -- castle
    if ( FN_castle_prl_f("_castle_prl") )
    { Z[304]++; if(dbg){print "Z304", "-- FN_castle_prl_f"}; continue };

    # основные прилагательные -- lock
    if ( FN_lock_prl_true_f("_lock_prl") )
    { Z[305]++; if(dbg){print "Z305", "-- FN_lock_prl_true_f(\"_lock_prl\")"}; continue };

    if ( mbba(-1,2,"M_lock_2prl") && s(-1) && z(0) && s(1) && q(1,"nar_step") )
    { l[i]=omo2; Z[306]++; if(dbg){print "Z306"}; continue };
    if ( mbba(-2,-1,"M_lock_2prl") && s(-2,-1) )
    { l[i]=omo2; Z[307]++; if(dbg){print "Z307"}; continue };

  ######################################################################################################
 ### замок замки им_п_ вин_п_
 if( veq(Y["iwrd_case"],"iv") ) {

    # —
    if ( se(0," — ") && veq(Y["n+_castlelike_things"],1) &&
       !bam(-1,"_lock_prl _lock_pe") )
    { l[i]=omo1; Z[308]++; if(dbg){print "Z308"}; continue };
    if ( se(0," — ") &&
          q(1,"mest_it") &&
        veq(Y["n+_castlelike_things"],2) && s(1) )
    { l[i]=omo1; Z[309]++; if(dbg){print "Z309"}; continue };
    if ( se(0," — ") &&
        qsf(1,5,",") && se(sfn+1," — ") &&
         ba(sfn+1,"_castlelike_things") )
    { l[i]=omo1; Z[310]++; if(dbg){print "Z310"}; continue };
    if ( q(-1,"mest_it") && s(-1) &&
        ba(-2,"_castlelike_things") && se(-2," — ") )
    { l[i]=omo1; Z[311]++; if(dbg){print "Z311"}; continue };
    if ( sc(0,"\\(") && sc(1,"\\)") && veq(Y["n+_castlelike_things"],1) )
    { l[i]=omo1; Z[312]++; if(dbg){print "Z312"}; continue };

    if ( qxs(-1,"меньше больше меньшее большее","чем") &&
       ( qxw(1,"и или","хотя","бы")||
         qxw(1,"и или") ) && zs(0) && s(xwn) &&
          ba(xwn+1,"_castlelike_things") )
    { l[i]=omo1; Z[313]++; if(dbg){print "Z313"}; continue };

    if ( wf(1,4,"как") && qxs(wfn,"как","на","ладони") && s(0,wfn-1) &&
        qir(1,wfn-1,"isname gl_aux_be prq_kred_mu") )
    { l[i]=omo1; Z[314]++; if(dbg){print "Z314"}; continue };

    if ( w(-1,"дисковой") && s(1) )
    { l[i]=omo2; Z[315]++; if(dbg){print "Z315"}; continue };

    if ( !vex(Y["tn_ok_any"]) && q(1,"prq_edmuim prq_mnim") && ba(1,"_prq_castle") && s(0) )
    { l[i]=omo1; Z[316]++; if(dbg){print "Z316"}; continue };

    cst="местность место";
    if ( bw(-5,cst) &&
          q(-4,"nar_mest") &&
          q(-3,"prl_vi") &&
        qxs(-1,"и","рядом") && s(-5,-1) )
    { l[i]=omo1; Z[317]++; if(dbg){print "Z317"}; continue };

    if ( q(-3,"prl_any") && s(-3) &&
        ba(-2,"_locklike_things") && zs(-2) &&
         q(-1,"prl_edmuim") && s(-1) )
    { l[i]=omo2; Z[318]++; if(dbg){print "Z318"}; continue };

    if ( z(0) &&
        ba(1,"_lock_parts") &&
         q(2,"otsz_edmuro otsz_mnro") && s(1) )
    { l[i]=omo2; Z[319]++; if(dbg){print "Z319"}; continue };

    if ( qxs(1,"до","открытого закрытого","состояния") )
    { l[i]=omo2; Z[320]++; if(dbg){print "Z320"}; continue };
    # _castle_environs
    if ( qb(-5,-1,"sz_iili") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_castle_environs") ) { bb_n=bbn;

         if ( vgl(Y["n+_lock_pe"],1,5) && s(0,Y["n+_lock_pe"]-1) )
         { bb_n=qb_n=""; Z[321]++; if(dbg){print "Z321"}; };

       if ( vgl(qb_n,-5,-1) && veq(bb_n,qb_n-1) && s(bb_n,-1) &&
              q(bb_n,"suw_im suw_vi") &&
            qir(qb_n+1,-1,"prl_im prq_im mest_im qast_any") )
       { l[i]=omo1; Z[322]++; if(dbg){print "Z322"}; continue };

    };};

    cst1="двери дверь";
    if ( narph_spos(1) && s(0) && z(xwn) &&
                  w(xwn+1,cst1) &&
                  q(xwn+2,"nar_spos") )
    { l[i]=omo2; Z[323]++; if(dbg){print "Z323"}; continue };
    cst1="камня кирпича основания фундамента";
    if ( wf(2,5,cst1) ) { bf_n=wfn;
       if ( vgl(bf_n,2,5) && s(0,bf_n-1) &&
              w(1,"до") &&
            qir(2,bf_n-1,"prl_ro mest_ro mest_3e prq_ro") )
       { l[i]=omo1; Z[324]++; if(dbg){print "Z324"}; continue };
    };
    if ( qxs(-1,"до",cst1) )
    { l[i]=omo1; Z[325]++; if(dbg){print "Z325"}; continue };
    cst1="булыжники камешки камни камушки кирпичи кирпичики клочья куски кусочки пыль щепки щепы";
    if ( wf(2,5,cst1) ) { bf_n=wfn;
       if ( vgl(bf_n,2,5) && s(0,bf_n-1) &&
              w(1,"в на") &&
            qir(2,bf_n-1,"prl_vi") )
       { l[i]=omo1; Z[326]++; if(dbg){print "Z326"}; continue };
    };
    cst1="булыжнику камешкам камешку камню камням камушкам камушки камушку кирпичикам кирпичику кирпичу крипчику кусочкам";
    if ( wf(2,5,cst1) ) { bf_n=wfn;
       if ( vgl(bf_n,2,5) && s(0,bf_n-1) &&
              w(1,"по") &&
            qir(2,bf_n-1,"prl_da") )
       { l[i]=omo1; Z[327]++; if(dbg){print "Z327"}; continue };
    };

    cst="быть встать красоваться находиться размещаться располагаться стоять";
    if ( bb(-5,-1,cst) ) { wb_n=bbn;
      if ( bba(wb_n-5,wb_n-1,"_castle_platz") ) { bb_n=bbn;

       if ( vgl(wb_n,-5,-1) && vgl(bb_n,wb_n-5,wb_n-1) &&
              w(bb_n+1,"где") && z(bb_n) && s(bb_n+1,-1) )
       { l[i]=omo1; Z[328]++; if(dbg){print "Z328"}; continue };
       if ( vgl(wb_n,-5,-1) && vgl(bb_n,wb_n-5,wb_n-1) &&
              q(bb_n+1,"pre_any") && z(bb_n) && s(bb_n+1,-1) &&
              q(bb_n+2,"otsz_any") )
       { l[i]=omo1; Z[329]++; if(dbg){print "Z329"}; continue };

      };
      if ( wba(wb_n-5,wb_n-1,"_lock_na_suw-pr") ) { bb_n=wbn;
       if ( vgl(wb_n,-5,-1) && vgl(bb_n,wb_n-5,wb_n-1) &&
             wb(bb_n-4,wb_n-1,"на") && s(wbn,-1) &&
            qir(wbn+1,bb_n-1,"prl_pr mest_pr mest_3e") &&
            qir(bb_n+1,wb_n-1,"nar_any mod_any gl_aux_be") &&
            qir(wb_n+1,-1,"prl_vi mest_vi mest_3e nar_any prl_kred_sr prq_vi") )
       { l[i]=omo2; Z[330]++; if(dbg){print "Z330"}; continue };#urhere
    };};
    if ( bf(1,3,cst) ) { wf_n=bfn;
      if ( bba(-5,-1,"_castle_platz") ) { bb_n=bbn;

       if ( vgl(wf_n,1,3) && vgl(bb_n,-5,-1) &&
              q(bb_n+1,"pre_any") && z(bb_n) && s(bb_n+1,-1) && s(0,wf_n-1) &&
              q(bb_n+2,"otsz_any") )
       { l[i]=omo1; Z[331]++; if(dbg){print "Z331"}; continue };

    };};

    # сложен
    cst="сложить";
    cst1="быть ведь же казаться стать считаться являться";
    if ( bw(1,cst) &&
          w(2,"из") && s(0,1) )
    { l[i]=omo1; Z[332]++; if(dbg){print "Z332"}; stopp=ret=1; continue };
    if ( !vex(Y["tn_ok_v"]) && bw(1,cst) &&
            q(2,"nar_spos nar_kaq prl_kred_sr") && s(0,1) )
    { l[i]=omo1; Z[333]++; if(dbg){print "Z333"}; stopp=ret=1; continue };
    if ( bw(1,cst1) &&
         bf(2,5,cst) &&
          w(bfn+1,"в из по") && s(0,bfn) && Qf(2,bfn-1,"pre_any sz_iili") )
    { l[i]=omo1; Z[334]++; if(dbg){print "Z334"}; continue };
    if ( bw(1,cst) && s(0) &&
       (qxs(2,"вовсе совсем никак отнюдь","не")||
        qxs(2,"не") ) &&
          w(xsn+1,"из") && s(xsn+1) )
    { l[i]=omo1; Z[335]++; if(dbg){print "Z335"}; stopp=ret=1; continue };
    if ( wb(-7,-4,"из") && s(wbn,-1) &&
          q(wbn+1,"otsz_ro") &&
         bw(wbn+2,cst1) &&
         bw(wbn+3,cst) &&
        qir(wbn+4,-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[336]++; if(dbg){print "Z336"}; stopp=ret=1; continue };
    # сложен

    cst1="большой замечательный интересный красивый прекрасный";
    if ( w(-4,"у") &&
         q(-3,"mest_ro suw_ro") &&
         q(-2,"nar_step") &&
         w(-1,cst1) && s(-4,-1) )
    { l[i]=omo1; Z[337]++; if(dbg){print "Z337"}; continue };
    if ( w(-3,"у") &&
         q(-2,"mest_ro suw_ro") &&
         w(-1,cst1) && s(-3,-1) )
    { l[i]=omo1; Z[338]++; if(dbg){print "Z338"}; continue };
    cst1="здравствуй привет";
    if ( w(-1,cst1) && zs(-1) )
    { l[i]=omo1; Z[339]++; if(dbg){print "Z339"}; continue };
    cst1="показать";
    if ( ba(-2,"_gl_dvizh") && sc(-2,"—") && s(-1) &&
         bw(-1,cst1) )
    { l[i]=omo1; Z[340]++; if(dbg){print "Z340"}; continue };


    # _lock_prq_kak_gl:start
    cst1="быть ведь же казаться стать считаться являться";
    if ( q(-1,"prq_im prq_kred_mu") && bw(-2,cst1) && ba(-1,"_lock_prq_kak_gl") && s(-2,-1) )
    { l[i]=omo2; Z[341]++; if(dbg){print "Z341"}; continue };
    if ( q(2,"prq_im prq_kred_mu") && bw(1,cst1) && ba(2,"_lock_prq_kak_gl") && s(0,1) &&
      (!ba(-1,"_castle_prl") && s(-1)) )
    { l[i]=omo2; Z[342]++; if(dbg){print "Z342"}; continue };
    # _lock_prq_kak_gl:end

    cst="весь целый";
    if ( wb(-5,-1,cst) ) { wb_n=wbn;
       if ( vgl(wb_n,-5,-1) && s(wb_n,-1) &&
            qir(wb_n+1,-1,"mest_vi prl_vi prq_vi") && !(ba(1,"_lock_pe_forced") && s(0) ) )
       { l[i]=omo1; Z[343]++; if(dbg){print "Z343"}; continue };
       if ( veq(wb_n,-2) &&
             wc(-1,"ский$") && s(-2,-1) )
       { l[i]=omo1; Z[344]++; if(dbg){print "Z344"}; continue };
    };

       if ( w(1,cst) && s(0) && p(1) )
       { l[i]=omo1; Z[345]++; if(dbg){print "Z345"}; continue };


    cst="закрывать закрыть";
    cst2="верности";
    if ( w(1,"для") &&
         q(2,"mest_ro suw_ro") &&
        bf(3,5,cst) && s(0,bfn-1) )
    { l[i]=omo1; Z[346]++; if(dbg){print "Z346"}; continue };
    if ( bf(1,3,cst) &&
        qxw(bfn+1,"для",cst2) && s(0,bfn) )
    { l[i]=omo2; Z[347]++; if(dbg){print "Z347"}; continue };
    if ( bf(1,3,cst) &&
          w(bfn+1,"для") && s(0,bfn) )
    { l[i]=omo1; Z[348]++; if(dbg){print "Z348"}; continue };

    cst="быть стать явиться являться";
    if ( bf(1,3,cst) &&
          q(bfn+1,"suw_tv") &&
          w(bfn+2,"для к") && s(0,bfn+1) )
    { l[i]=omo1; Z[349]++; if(dbg){print "Z349"}; continue };

    cst1="ворота дверь калитка";
    cst2="камера комната парадное подъезд прихожая продуктовый";
    if ( ba(-5,"_lock_pe") &&
          w(-4,"на") &&
         bw(-3,cst1) &&
          w(-2,"в") &&
         bw(-1,cst2) && s(-5,-1) )
    { l[i]=omo2; Z[350]++; if(dbg){print "Z350"}; continue };

  # в замок --->>>
  if ( vgl(Y["n_pre_v"],-5,-1) ) {

    if ( TN_v_zamok_f() )
    { Z[351]++; if(dbg){print "Z351", "-- TN_v_zamok_f"}; continue };

    #
    if ( ba(-4,"_gl_v_castle-iv") &&
          w(-3,"в") &&
          q(-2,"prq_edmuvi prq_mnvi") &&
          q(-1,"suw_da mest_da prl_da suw_tv prl_tv mest_tv suw_edne isname") && s(-4,-1) )
    { l[i]=omo1; Z[352]++; if(dbg){print "Z352"}; continue }; # без tn!
    if ( ba(-5,"_gl_v_castle-iv") &&
          w(-4,"в") &&
          q(-3,"mest_edmuvi prl_edmuvi") &&
          q(-2,"prq_edmuvi prq_mnvi") &&
          q(-1,"suw_da mest_da prl_da suw_tv prl_tv mest_tv suw_edne isname") && s(-5,-1) )
    { l[i]=omo1; Z[353]++; if(dbg){print "Z353"}; continue }; # без tn!
    if ( ba(-3,"_gl_v_castle-iv") &&
          w(-2,"в") &&
          q(-1,"mest_vip3e mest_vi") && s(-3,-1) )
    { l[i]=omo1; Z[354]++; if(dbg){print "Z354"}; continue }; # без tn!

  }; # в замок
  # в замок <<<---
  ######################################################################################################
  # на замок
  if ( vgl(Y["n_pre_na"],-5,-1) ) {

    if ( TN_na_zamok_f() )
    { Z[355]++; if(dbg){print "Z355", "-- TN_na_zamok_f"}; continue };

    if ( wa(-4,"_suw_na_castle") && s(-4,-1) &&
          w(-3,"на") &&
         wa(-2,"_castle_environs") &&
       sz_i(-1) )
    { l[i]=omo1; Z[356]++; if(dbg){print "Z356"}; continue };
    if ( ba(-4,"_gl_na_lock") &&
          w(-3,"на") &&
          q(-2,"prl_vi prq_vi") &&
          q(-1,"suw_vi") && s(-4,-1) )
    { l[i]=omo2; Z[357]++; if(dbg){print "Z357"}; continue };

    # похожий I
    cst="непохожий походить похожий";
    if ( bw(-2,cst) &&
          w(-1,"на") &&
        veq(Y["n+_castlelike_things"],1) && s(-2,0) )
    { l[i]=omo1; Z[358]++; if(dbg){print "Z358"}; continue };
    if ( bw(-2,cst) && s(-2,-1) &&
          w(-1,"на") &&
        qxs(1,"комбинаций","песчинок") )
    { l[i]=omo1; Z[359]++; if(dbg){print "Z359"}; continue };
    if ( bw(-3,cst) &&
          w(-2,"на") &&
          q(-1,"prl_vi mest_vi mest_3e prq_vi") &&
        veq(Y["n+_castlelike_things"],1) && s(-3,0) )
    { l[i]=omo1; Z[360]++; if(dbg){print "Z360"}; continue };
    if ( ba(-3,"_castlelike_things") &&
         bw(-2,cst) &&
          w(-1,"на") && s(-3,-1) )
    { l[i]=omo1; Z[361]++; if(dbg){print "Z361"}; continue };
    if ( ba(-4,"_castlelike_things") &&
          w(-3,"не") &&
         bw(-2,cst) &&
          w(-1,"на") && s(-4,-1) )
    { l[i]=omo1; Z[362]++; if(dbg){print "Z362"}; continue };
    if ( bw(-2,cst) &&
          w(-1,"на") &&
          q(1,"prl_any") &&
        veq(Y["n+_castlelike_things"],2) && s(-2,1) )
    { l[i]=omo1; Z[363]++; if(dbg){print "Z363"}; continue };
    if ( ba(-3,"_castlelike_things") && z(-3) &&
         bw(-2,cst) &&
          w(-1,"на") && s(-2,-1) )
    { l[i]=omo1; Z[364]++; if(dbg){print "Z364"}; continue };
    if ( ba(-4,"_castlelike_things") && z(-4) &&
         bw(-3,cst) &&
          w(-2,"на") &&
          q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo1; Z[365]++; if(dbg){print "Z365"}; continue };
    # похожий I


  }; # на замок
  ######################################################################################################
  # за замок
  if ( vgl(Y["n_pre_za"],-5,-1) ) {

    if ( TN_za_zamok_f() )
    { Z[366]++; if(dbg){print "Z366", "-- TN_za_zamok_f"}; continue };

  }; # за замок
  ######################################################################################################
  # под замок
  if ( vgl(Y["n_pre_pod"],-5,-1) ) {

    if ( TN_pod_zamok_f() )
    { Z[367]++; if(dbg){print "Z367", "-- TN_pod_zamok_f"}; continue };

  }; # под замок
  ######################################################################################################
  # о замок
  if ( vgl(Y["n_pre_o"],-5,-1) ) {

    if ( TN_o_zamok_f() )
    { Z[368]++; if(dbg){print "Z368", "-- TN_o_zamok_f"}; continue };

  }; # о замок

  ######################################################################################################
  # по замок
  if ( vgl(Y["n_pre_po"],-5,-1) ) {

    if ( TN_po_zamok_f() )
    { Z[369]++; if(dbg){print "Z369", "-- TN_po_zamok_f"}; continue };

  }; # по замок

  ######################################################################################################
  # через замок
  if ( vgl(Y["n_pre_qerez"],-5,-1) ) {

    if ( TN_qerez_zamok_f() )
    { Z[370]++; if(dbg){print "Z370", "-- TN_qerez_zamok_f"}; continue };

  };
  ######################################################################################################

  # ниже "замок" без собственного предлога
   # escape:pe
   #
   cst1="вывести";
   if ( bb(-5,-1,cst1) &&
        qy(bbn+1,"qast_any") &&
       qaw(bbn+1+qyn,"из","строя") &&
       qir(awn+1+qyn,-1,"prl_vi mest_vi mest_3e") && s(bbn,-1) )
   { l[i]=omo2; Z[371]++; if(dbg){print "Z371"}; continue };

   cst1="обойти";
   cst2="открыть";
   if ( bb(-5,-1,cst1) && s(bbn,-1) &&
        bw(bbn-1,cst2) && z(bbn-1) &&
       qir(bbn+1,-1,"prl_vi mest_vi mest_3e") )
   { l[i]=omo2; Z[372]++; if(dbg){print "Z372"}; continue };

   cst1="цеплять";
   cst2="взгляд";
   if ( bb(-3,-1,cst1) && s(bbn,-1) &&
        bw(bbn-1,cst2) &&
       qir(bbn+1,-1,"prl_vi mest_vi mest_3e nar_any prl_kred_sr") )
   { l[i]=omo1; Z[373]++; if(dbg){print "Z373"}; continue };

   cst="снять";
   cst1="год зиму лето месяц неделю сезон";
   if ( wb(-5,-2,"на") &&
        bb(wbn-3,wbn-1,cst) && s(bbn,-1) &&
       wb2(wbn+1,-1,cst1) &&
       qir(bbn+1,wbn-1,"nar_any prl_kred_sr") &&
       qir(wbn+1,wbn2-1,"prl_vi mest_vi mest_3e") &&
       qir(wbn2+1,-1,"prl_vi mest_vi mest_3e") )
   { l[i]=omo1; Z[374]++; if(dbg){print "Z374"}; continue };

   cst1="осыпаться покрывать покрываться покрыть покрыться";
   cst2="налетом пылью росой трухой";
   if ( bb(-4,-2,cst1) && s(bbn,-1) &&
         w(-1,cst2) &&
       qir(bbn+1,-2,"prl_tv mest_tv mest_3e nar_any prl_kred_sr") )
   { l[i]=omo2; Z[375]++; if(dbg){print "Z375"}; continue };
   if ( bf(1,5,cst1) && s(0,bbn-1) &&
         w(bfn-1,cst2) &&
       qir(1,bfn-2,"prl_tv mest_tv mest_3e nar_any prl_kred_sr") )
   { l[i]=omo2; Z[376]++; if(dbg){print "Z376"}; continue };

   cst1="исчезнуть пропасть";
   if (  bw(1,cst1) &&
        qxs(2,"из","виду") && s(0,xsn-1) )
   { l[i]=omo1; Z[377]++; if(dbg){print "Z377"}; continue };

   cst1="отжать отжимать";
   if (  bb(-7,-1,cst1) ) { bb_n=bbn;
     if ( vgl(bb_n,-7,-3) && s(bb_n,-1) &&
            w(bb_n+1,"у") &&
            q(bb_n+2,"suw_ro mest_ro mest_3e") &&
          qir(bb_n+3,-1,"prl_vi mest_vi mest_3e") )
     { l[i]=omo1; Z[378]++; if(dbg){print "Z378"}; continue };
     if ( vgl(bb_n,-5,-1) &&
           wb(bb_n-4,bb_n-1,"у") && s(wbn,-1) &&
            q(wbn+1,"suw_ro mest_ro mest_3e") &&
          qir(wbn+2,bb_n-1,"mod_any gl_aux_be nar_any") &&
          qir(bb_n+1,-1,"prl_vi mest_vi mest_3e") )
     { l[i]=omo1; Z[379]++; if(dbg){print "Z379"}; continue };
     if (  veq(bb_n,-1) && s(-1) &&
           qxs(-2,"все","равно","что") )
     { l[i]=omo1; Z[380]++; if(dbg){print "Z380"}; continue };
     if (  veq(bb_n,-1) && s(-1) &&
             q(0,"isname") )
     { l[i]=omo1; Z[381]++; if(dbg){print "Z381"}; continue };
     if (  veq(bb_n,-2) && s(-2,-1) &&
            ba(-1,"_castle_prl") )
     { l[i]=omo1; Z[382]++; if(dbg){print "Z382"}; continue };
   };
   if ( bf(1,5,cst1) ) { bf_n=bfn;
     if ( vgl(bf_n,1,5) &&
           qf(bf_n+1,bf_n+4,"suw_im mest_im") && s(0,qfn-1) &&
          qir(1,bf_n-1,"nar_any prl_kred_sr gl_aux_be mod_any") &&
          qir(bf_n+1,qfn-1,"prl_vi mest_vi mest_3e") )
     { l[i]=omo1; Z[383]++; if(dbg){print "Z383"}; continue };
   };

   cst1="потерять терять";
   if (  bw(1,cst1) &&
         wf(2,5,"значение") &&
        qir(2,wfn-1,"mest_vi prl_vi") && s(0,wfn-1) )
   { l[i]=omo1; Z[384]++; if(dbg){print "Z384"}; continue };


   cst1="потрясти";
   cst2="буря весть взрыв вой вопль грохот гул известие крик рев рычание событие трагедия удар";
   if ( bw(-2,cst2) && zs(-2) &&
        bw(-1,cst1) && s(-1) )
   { l[i]=omo1; Z[385]++; if(dbg){print "Z385"}; continue };
   if ( bw(-1,cst1) &&
        bw(1,cst2) && s(-1,0) )
   { l[i]=omo1; Z[386]++; if(dbg){print "Z386"}; continue };
   if ( bw(-3,cst2) && zs(-3) &&
         q(-2,"otsz_any") &&
        bw(-1,cst1) && s(-2,-1) )
   { l[i]=omo1; Z[387]++; if(dbg){print "Z387"}; continue };
   if ( qy(1,"nar_any prl_kred_sr isname") &&
        bw(1+qyn,cst1) &&
        bf(2+qyn,4+qyn,cst2) &&
       qir(2+qyn,bfn-1,"prl_im mest_im prq_im") && s(0,bfn-1) )
   { l[i]=omo1; Z[388]++; if(dbg){print "Z388"}; continue };
   if ( bw(-1,cst1) && s(-1) && vvb(-6,-2) && bw(vvn,cst2) )
   { l[i]=omo1; Z[389]++; if(dbg){print "Z389"}; continue };
   if ( q(-3,"otsz_any") &&
        q(-2,"mod_any") &&
       bw(-1,cst1) && s(-3,-1) &&
      vvb(-8,-4) &&
       bb(vvn-4,vvn,cst2) && s(bbn,vvn-1) )
   { l[i]=omo1; Z[390]++; if(dbg){print "Z390"}; continue };


    cst1="велеть приказать решение решить";
    cst2="демонтировать";
    if ( bw(-2,cst1) &&
          w(-1,cst2) && s(-2,-1) )
    { l[i]=omo1; Z[391]++; if(dbg){print "Z391"}; continue };

    cst1="быть находиться оказаться";
    cst2="владении власти горах лесах лесу распоряжении руках";
    if ( bw(1,cst1) &&
          w(2,"в во") &&
         wf(3,6,cst2) &&
        qir(3,wfn-1,"prl_pr prq_pr mest_pr mest_3e") && s(0,wfn-1) )
    { l[i]=omo1; Z[392]++; if(dbg){print "Z392"}; continue };

    cst1="быть виднеться находиться располагаться расположиться стоять";
    cst2="глубине гуще конце начале середине стороне центре";
    cst3="болота города долины дорог дороги композиции крепости круга леса подземелья склона";
    if ( wf(1,6,"в во на") ) { wf_n=wfn;
      if ( wf(wf_n+1,wf_n+4,cst2) ) { bf_n=wfn;
        if ( wf(bf_n+1,bf_n+4,cst3) ) { qf_n=wfn;

         if ( vgl(wf_n,1,6) && vgl(bf_n,wf_n+1,wf_n+4) && vgl(qf_n,bf_n+1,bf_n+4) &&
               bw(wf_n-1,cst1) &&
              qir(wf_n+1,bf_n-1,"prl_pr prq_pr mest_pr mest_3e") &&
              qia(bf_n+1,qf_n-1,"pre_ro","prl_ro prq_ro mest_ro mest_3e") && s(0,qf_n-1) )
         { l[i]=omo1; Z[393]++; if(dbg){print "Z393"}; continue };

    };};};

    if ( wb(-4,-1,cst3) ) { qf_n=wbn;
      if ( wb(qf_n-4,qf_n-1,cst2) ) { bf_n=wbn;
        if ( wb(bf_n-4,bf_n-1,"в во на") ) { wb_n=wbn;

       if ( vgl(qf_n,-4,-1) && vgl(bf_n,qf_n-4,qf_n-1) && vgl(wb_n,bf_n-4,bf_n-1) && s(wb_n,-1) &&
            qir(wb_n+1,bf_n-1,"prl_pr prq_pr mest_pr mest_3e") &&
            qir(bf_n+1,qf_n-1,"prl_ro prq_ro mest_ro mest_3e") &&
             bw(qf_n+1,cst1) &&
            qir(qf_n+2,-1,"prl_vi mest_vi mest_3e prq_vi") )
       { l[i]=omo1; Z[394]++; if(dbg){print "Z394"}; continue };
       if ( vgl(qf_n,-4,-1) && vgl(bf_n,qf_n-4,qf_n-1) && vgl(wb_n,bf_n-4,bf_n-1) && s(wb_n,-1) &&
            qir(wb_n+1,bf_n-1,"prl_pr prq_pr mest_pr mest_3e") &&
            qir(bf_n+1,qf_n-1,"prl_ro prq_ro mest_ro mest_3e") &&
            qir(qf_n+1,-1,"prl_vi mest_vi mest_3e prq_vi") )
       { l[i]=omo1; Z[395]++; if(dbg){print "Z395"}; continue };

    };};};

    cst1="перевесить";
    cst2="гору";
    if ( bw(1,cst1) &&
          w(2,cst2) && s(0,1) )
    { l[i]=omo1; Z[396]++; if(dbg){print "Z396"}; continue };

    cst1="меняться";
    if ( bw(1,cst1) && z(1) && s(0) &&
          w(2,"то тогда") &&
          q(3,"qik_vi mest_vi") &&
         ba(4,"_lock_parts") && s(2,3) )
    { l[i]=omo2; Z[397]++; if(dbg){print "Z397"}; continue };

    cst="снести";
    if ( wb(-5,-1,"с со") &&
         bb(bbn-3,bbn-1,cst) && s(bbn,-2) && zs(-1) )
    { l[i]=omo2; Z[398]++; if(dbg){print "Z398"}; continue };

    cst1="менять поменять сменить";
    cst2="владелец имя название статус хозяин";
    if ( bf(1,5,cst1) && Qf(1,bfn-1,"sz_iili pre_any") &&
         bf(bfn+1,bfn+3,cst2) && s(0,bfn-1) )
    { l[i]=omo1; Z[399]++; if(dbg){print "Z399"}; continue };

    cst1="положить";
    cst2="гранату конец начало";
    if ( qxs(-1,"на","рот","был","положен") )
    { l[i]=omo2; Z[400]++; if(dbg){print "Z400"}; continue };
    if ( w(-1,"положен") && s(-1) )
    { l[i]=omo1; Z[401]++; if(dbg){print "Z401"}; continue };
    if ( w(1,"положен") && s(0) )
    { l[i]=omo1; Z[402]++; if(dbg){print "Z402"}; continue };
    if ( wy(1,"не") &&
          w(1+wyn,"положен положено") && s(0,0+wyn) )
    { l[i]=omo1; Z[403]++; if(dbg){print "Z403"}; continue };
    if ( bf(1,3,cst1) && Qf(1,bfn-1,"sz_iili pre_any") &&
          w(bfn+1,cst2) && zs(0) && s(1,bfn-1) )
    { l[i]=omo1; Z[404]++; if(dbg){print "Z404"}; continue };
    if ( bw(-1,cst1) &&
          w(bfn+1,"к ко") &&
          q(bfn+2,"mest_da mest_3e") &&
          w(bfn+3,"ногам") && s(0,bfn+2) )
    { l[i]=omo1; Z[405]++; if(dbg){print "Z405"}; continue };
    if ( bw(-1,cst1) &&
        qxs(1,"в","руины") && s(-1) )
    { l[i]=omo1; Z[406]++; if(dbg){print "Z406"}; continue };

    cst1="врезать встроить вырезать вырубать вырубить высекать высечь";
    cst2="гора камень скала стена";
    if ( bf(1,5,cst1) && Qf(1,bfn-1,"sz_iili pre_any") &&
          w(bfn+1,"в из") &&
         bf(bfn+2,bfn+4,cst2) && s(0,bfn-1) )
    { l[i]=omo1; Z[407]++; if(dbg){print "Z407"}; continue };
    if ( q(1,"prq_any") && bw(1,cst1) && z(0) &&
         w(2,"в из") &&
        bf(3,5,cst2) && s(1,bfn-1) )
    { l[i]=omo1; Z[408]++; if(dbg){print "Z408"}; continue };

  # брать взять <<<---:start
  cst1="брать взять";
  if ( bb(-7,-1,cst1) ) { bb_n=bbn;

    cst2="нападением наскоком нахрапом приступом штурмом";
    if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
           w(bb_n+1,cst2) &&
         qir(bb_n+2,-1,"qast_any mest_vi prl_vi") )
    { l[i]=omo1; Z[409]++; if(dbg){print "Z409"}; continue };
    if ( vgl(bb_n,-7,-1) &&
          wf(1,4,cst2) && s(bb_n,wfn-1) &&
         qir(bb_n+1,-1,"qast_any mest_vi prl_vi") &&
         qir(1,wfn-1,"qast_any mest_tv prl_tv") )
    { l[i]=omo1; Z[410]++; if(dbg){print "Z410"}; continue };

    cst2="вырезать";
    cst3="гарнизон";
    if ( vgl(bb_n,-7,-1) && s(bb_n,-1) && zs(0) &&
         qir(bb_n+1,-1,"qast_any mest_vi prl_vi") &&
          bw(1,cst2) &&
          wf(2,5,cst3) && s(1,bfn-1) &&
         qir(1,bfn-1,"prl_kred_sr prl_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[411]++; if(dbg){print "Z411"}; continue };

    cst2="башня стена шпиль";
    if ( vgl(bb_n,-7,-1) && s(bb_n,-1) && zs(0) &&
         qir(bb_n+1,-1,"qast_any mest_vi prl_vi") &&
          wb(1,3,"на") &&
          bf(wbn+1,wbn+4,cst2) && s(1,bfn-1) &&
         qir(wbn+1,bfn-1,"prl_kred_sr prl_pr mest_pr mest_3e") )
    { l[i]=omo1; Z[412]++; if(dbg){print "Z412"}; continue };

    if ( qxs(-1,"на","себя") &&
         veq(bb_n,xsn-1) && s(xsn-1) )
    { l[i]=omo1; Z[413]++; if(dbg){print "Z413"}; continue };
    if ( veq(bb_n,-1) && s(-1) &&
         qxs(1,"в","крепкие","руки") )
    { l[i]=omo1; Z[414]++; if(dbg){print "Z414"}; continue };

    if ( vgl(bb_n,-7,-1) && s(bb_n,-1) && zs(0) &&
         vgl(Y["n+_lock_pe"],1,5) && s(1,Y["n+_lock_pe"]-1) &&
         qir(bb_n+1,-1,"qast_any mest_vi prl_vi") &&
         qir(1,Y["n+_lock_pe"]-1,"prl_kred_sr mest_vi mest_3e") )
    { l[i]=omo2; Z[415]++; if(dbg){print "Z415"}; continue };

    if ( vgl(bb_n,-7,-1) && s(bb_n,-1) && z(0) &&
         qir(bb_n+1,-1,"qast_any mest_vi prl_vi") &&
           q(1,"otsz_vi isname suw_im") &&
          ba(2,"_lock_pe") && s(1) )
    { l[i]=omo2; Z[416]++; if(dbg){print "Z416"}; continue };

    cst2="кулак ладони ладонь руки руку";
    if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
           w(bb_n+1,"в во") &&
          wf(bb_n+2,bb_n+4,cst2) &&
         qir(bb_n+2,wfn-1,"mest_vi prl_vi prq_vi") &&
         qir(wfn+1,-1,"mest_vi prl_vi prq_vi nar_any") )
    { l[i]=omo2; Z[417]++; if(dbg){print "Z417"}; continue };
    if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
           w(1,"в во") &&
          wf(2,4,cst2) &&
         qir(bb_n+1,-1,"mest_vi prl_vi prq_vi") &&
         qir(2,wfn-1,"mest_vi prl_vi prq_vi nar_any") )
    { l[i]=omo2; Z[418]++; if(dbg){print "Z418"}; continue };
    cst2="булавка ключ отмычка";
    if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
          bb(bb_n-4,bb_n-1,cst2) &&
         qir(bbn+1,bb_n-1,"mod_ed mod_mn qast_any") &&
         qir(bb_n+1,-1,"mest_vi prl_vi prq_vi nar_any") )
    { l[i]=omo2; Z[419]++; if(dbg){print "Z419"}; continue };

    if ( veq(bb_n,-1) &&
           q(1,"nar_napr") && s(-1,0) )
    { l[i]=omo2; Z[420]++; if(dbg){print "Z420"}; continue };


    if ( bfa(1,5,"_lock_bratj_i_gl") ) { bf_n=bfn;
       if ( vgl(bb_n,-7,-1) && vgl(bf_n,1,5) && s(bb_n,-1) && s(1,bf_n-1) && zs(0) &&
            qir(bb_n+1,-1,"prl_vi mest_vi mest_3e nar_any") &&
            qia(1,bf_n-1,"sz_i","prl_kred_sr nar_any") )
       { l[i]=omo2; Z[421]++; if(dbg){print "Z421"}; continue };
       if ( vgl(bb_n,-7,-1) && vgl(bf_n,1,5) && s(bb_n,-1) && s(1,bf_n-1) && zs(0) &&
            qiz(bb_n+1,-1,"prl_vi mest_vi mest_3e nar_any","sz_i") &&
            qir(1,bf_n-1,"prl_kred_sr nar_any") )
       { l[i]=omo2; Z[422]++; if(dbg){print "Z422"}; continue };
    };


    if ( veq(bb_n,-1) && vv(0,5) &&
           w(vvn+1,"и да") &&
          ba(vvn+2,"_lock_bratj_i_gl") && s(vvn+1) )
    { l[i]=omo2; Z[423]++; if(dbg){print "Z423"}; continue };

    if ( veq(bb_n,-1) && s(-5,-1) &&
          ba(-5,"_lock_parts") &&
           w(-4,"в") &&
           q(-3,"suw_vi") &&
        sz_i(-2) )
    { l[i]=omo2; Z[424]++; if(dbg){print "Z424"}; continue };


    if ( veq(bb_n,-2) && ba(-4,"_gl_dvizh") && s(-4) &&
           q(-3,"nar_napr nar_spos nar_vrem") && z(-3) &&
           q(-1,"prl_vi mest_vi mest_3e") && s(-2,-1) )
    { l[i]=omo2; Z[425]++; if(dbg){print "Z425"}; continue };

    cst2="сделать";
    cst3="шаг";
    if ( veq(bb_n,-1) &&
        sz_i(1) &&
          bw(2,cst2) &&
           w(3,cst3) && s(-1,2) )
    { l[i]=omo2; Z[426]++; if(dbg){print "Z426"}; continue };

    cst2="ладони ладонь лапу лапы руки руку";
    if ( (qxs(-1,"в",cst2)||
          qxs(-1,"в","правую левую свою свои обе",cst2)||
          qxs(-1,"на","мушку") ) &&
           bw(xsn-1,cst1) && s(xsn-1) )
    { l[i]=omo2; Z[427]++; if(dbg){print "Z427"}; continue };
    if ( veq(bb_n,-1) &&
        (qxs(1,"в",cst2)||
         qxs(1,"в","правую левую свою свои обе",cst2) ) && s(-1) )
    { l[i]=omo2; Z[428]++; if(dbg){print "Z428"}; continue };
    cst2="лавки пола полки стола";
    if ( veq(bb_n,-3) &&
           w(-2,"с со") &&
           w(-1,cst2) && s(-3,-1) )
    { l[i]=omo2; Z[429]++; if(dbg){print "Z429"}; continue };
    cst2="локтей пальцев рук";
    if ( veq(bb_n,-1) &&
           w(1,"у") &&
           q(2,"suw_ro mest_ro isname") &&
           w(3,"из") &&
           w(4,cst2) && s(-1,3) )
    { l[i]=omo2; Z[430]++; if(dbg){print "Z430"}; continue };
    cst2="ногтем пальцами руками рукой";
    if ( veq(bb_n,-1) &&
           q(1,"prl_tv mest_tv mest_3e") &&
           w(2,cst2) && s(-1,1) )
    { l[i]=omo2; Z[431]++; if(dbg){print "Z431"}; continue };

    cst2="опять осторожно снова";
    if ( q(-3,"isname suw_odim mest_im") &&
         w(-2,cst2) &&
       veq(bb_n,-1) && s(-3,-1) )
    { l[i]=omo2; Z[432]++; if(dbg){print "Z432"}; continue };
    cst2="опять осторожно снова";
    if ( veq(bb_n,-1) &&
        sz_i(1) &&
          bw(2,"сказать") &&
           q(3,"suw_odda mest_da isname") && s(-1,2) )
    { l[i]=omo2; Z[433]++; if(dbg){print "Z433"}; continue };

  }; # брать взять <<<---:end
  # брать взять --->>>:start
  cst1="брать взять";
  if ( bf(1,3,cst1) ) { bf_n=bfn;

    cst2="наскоком нахрапом приступом штурмом";
    if ( vgl(bf_n,1,3) && s(0,bf_n-1) &&
         qir(1,bf_n-1,"gl_aux_be mod_any") &&
           w(bf_n+1,cst2) )
    { l[i]=omo1; Z[434]++; if(dbg){print "Z434"}; continue };

    cst2="ногтем пальцами руками рукой";
    if ( veq(bf_n,2) && w(1,cst2) && s(0,1) )
    { l[i]=omo2; Z[435]++; if(dbg){print "Z435"}; continue };

    if ( veq(bf_n,1) &&
        sz_i(2) &&
          ba(3,"_lock_bratj_i_gl") && zs(0) && s(1,2) )
    { l[i]=omo2; Z[436]++; if(dbg){print "Z436"}; continue };
    if ( veq(bf_n,1) &&
           w(2,"у") &&
           q(3,"suw_ro mest_ro mest_3e") &&
          bw(4,"кровь") && s(0,3) )
    { l[i]=omo2; Z[437]++; if(dbg){print "Z437"}; continue };

    if ( veq(bf_n,1) &&
          ba(2,"_lock_parts") && s(0,1) )
    { l[i]=omo2; Z[438]++; if(dbg){print "Z438"}; continue };
    if ( ba(-2,"_lock_parts") &&
          q(-1,"prl_vi mest_vi mest_3e") &&
          w(1,"не") &&
        veq(bf_n,2) && s(-2,1) )
    { l[i]=omo2; Z[439]++; if(dbg){print "Z439"}; continue };
  }; # брать взять --->>>:end

    # _gl_4_castle_na_suw-pr:start с наречиями и пр. --> глаголы указывают на месторасположение
    cst="вблизи вдалеке вдали наконец";
    if ( bba(-4,-1,"_gl_4_castle_na_suw-pr") &&
           w(bbn-1,cst) && s(bbn-1,-1) &&
         qir(bbn+1,-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[440]++; if(dbg){print "Z440"}; continue };
    # _gl_4_castle_na_suw-pr:start

    #
    cst="стоять";
    if ( bf(1,3,cst) &&
        qir(1,bfn-1,"nar_any qast") && s(0,bfn-1) && p(bfn) )
    { l[i]=omo1; Z[441]++; if(dbg){print "Z441"}; continue };

    cst="принести приносить";
    cst1="доход пользу прибыль";
    if ( bf(1,3,cst) ) { bf_n=bfn;

      if ( vgl(bf_n,1,3) &&
             q(bfn,"gl_po") &&
           qir(1,bfn-1,"qast_any mest_vi") && s(0,bfn-1) )
      { l[i]=omo2; Z[442]++; if(dbg){print "Z442"}; continue };

      if ( vgl(bf_n,1,3) &&
            wf(bf_n+1,bf_n+5,cst1) && s(0,wfn-1) &&
           qir(1,bf_n-1,"mod_any gl_aux_be nar_any") &&
           qir(bf_n+1,wfn-1,"prl_vi mest_vi suw_da prl_da mest_da mest_3e nar_any") )
      { l[i]=omo1; Z[443]++; if(dbg){print "Z443"}; continue };

    };

    cst="назвать переименовать";
    if ( vgl(Y["n_pre_v_ist"],-8,-1) ) { wb_n=Y["n_pre_v_ist"];
       if ( vgl(wb_n,-6,-3) &&
             bb(wb_n-3,wb_n-1,cst) && s(bb_n,-1) &&
             wf(wb_n+1,-1,"честь") &&
            qir(wf_n+1,wfn-1,"mest_3e mest_vi") &&
            qir(wfn+1,-1,"mest_vi mest_3e prl_vi isname mest_ro suw_ro") )
       { l[i]=omo1; Z[444]++; if(dbg){print "Z444"}; continue };
    };

    cst="встроить поставить";
    cst2="дверь ручка ящик";
    if ( bw(-3,cst) &&
     pre_pr(-2) &&
         bw(-1,cst2) && s(-3,-1) )
    { l[i]=omo2; Z[445]++; if(dbg){print "Z445"}; continue };
    cst2="дверь ящик";
    if ( bw(-4,cst) &&
     pre_pr(-3) &&
         bw(-2,cst2) &&
          q(-1,"prl_edmuim") && s(-4,-1) )
    { l[i]=omo2; Z[446]++; if(dbg){print "Z446"}; continue };
    if ( bw(-1,cst) &&
     pre_pr(1) &&
         bw(2,cst2) && s(-1,1) )
    { l[i]=omo2; Z[447]++; if(dbg){print "Z447"}; continue };
    if ( ba(-5,"_gl_dvizh") &&
          q(-4,"nar_any") && z(-4) &&
          w(-3,"чтобы") &&
          w(-2,cst) &&
          q(-1,"prl_vi mest_vi mest_3e") && s(-3,-1) )
    { l[i]=omo2; Z[448]++; if(dbg){print "Z448"}; continue };
    if ( vgl(Y["n_pre_na_ist"],-5,-1) && s(Y["n_pre_na_ist"],-1) &&
          bw(Y["n_pre_na_ist"]-1,cst) &&
         qir(Y["n_pre_na_ist"]+1,-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo2; Z[449]++; if(dbg){print "Z449"}; continue };


    cst1="носить";
    cst2="имя название";
    if ( bf(1,5,cst1) && zs(0) && s(1,bfn-1) &&
         wf(bfn+1,bfn+3,cst2) &&
        qir(bfn+1,wfn-1,"prl_im mest_im qast_any") )
    { l[i]=omo1; Z[450]++; if(dbg){print "Z450"}; continue };
    if ( w(-2,cst2) && s(-2,-1) &&
        bw(-1,cst1) )
    { l[i]=omo1; Z[451]++; if(dbg){print "Z451"}; continue };

    cst1="панель";
    cst2="показаться";
    if ( bw(-4,cst1) && z(-4) &&
     pre_tv(-3) &&
          q(-2,"otsz_tv") &&
         bw(-1,cst2) && s(-3,-1) )
    { l[i]=omo2; Z[452]++; if(dbg){print "Z452"}; continue };

    cst1="держать удерживать унести";
    cst2="закрыть запереть открыть";
    cst3="руках руке";
    cst4="плечах";
    if ( bb(-6,-1,cst1) ) { bb_n=bbn;
       if ( veq(bb_n,-2) &&
              q(-1,"prq_tv") && bw(-1,cst2) &&
         isname(1) && s(-2,0) )
       { l[i]=omo1; Z[453]++; if(dbg){print "Z453"}; continue };
       if ( veq(bb_n,-1) &&
             qf(1,3,"prq_tv") && bw(qfn,cst2) &&
            qir(1,qfn-1,"nar_any prl_kred_sr isname") &&
              w(qfn+1,"для") && s(-1,qfn) )
       { l[i]=omo1; Z[454]++; if(dbg){print "Z454"}; continue };
       if ( vgl(bb_n,-6,-3) && s(bb_n,-1) &&
             wf(bb_n+1,bb_n+3,"на") &&
             wb(wfn+1,-1,cst4) &&
            qir(bb_n+1,wfn-1,"nar_any prl_kred_sr") &&
            qir(wfn+1,wbn-1,"prl_mnvi mest_vi mest_3e") &&
            qir(wbn+1,-1,"prl_vi mest_vi mest_3e") )
       { l[i]=omo1; Z[455]++; if(dbg){print "Z455"}; continue };
       if ( vgl(bb_n,-4,-1) && s(bb_n,-1) &&
              w(1,"на") &&
             wf(2,5,cst4) && s(0,wfn-1) &&
            qir(bb_n+1,-1,"nar_any prl_kred_sr prl_vi mest_vi mest_3e") &&
            qir(2,wfn-1,"prl_mnvi mest_vi mest_3e") )
       { l[i]=omo1; Z[456]++; if(dbg){print "Z456"}; continue };
       if ( veq(bb_n,-3) &&
              w(-2,"в") &&
              w(-1,cst3) && s(-3,-1) )
       { l[i]=omo2; Z[457]++; if(dbg){print "Z457"}; continue };
    };

    cst="заполучить захватить отдавать отдать передавать передать получить предоставить привести приводить принять";
    if ( bb(-7,-3,cst) &&
         qy(bbn+1,"mest_da suw_da suw_edne isname") &&
      ( qaw(bbn+1+qyn,"в","дар подарок наследство собственность распоряжение управление бенефиций")||
        qaw(bbn+1+qyn,"во","владение")||
        qaw(bbn+1+qyn,"в во","мое наше ваше свое его ее их полное временное безвозмездное","владение распоряжение управление пользование")||
        qaw(bbn+1+qyn,"в","мою нашу вашу свою его ее их","собственность волю")||
        qaw(bbn+1+qyn,"в","мои наши ваши свои его ее их","владения руки")||
        qaw(bbn+1+qyn,"в","относительный","порядок")||
        qaw(bbn+1+qyn,"в","прежний","вид")||
        qaw(bbn+1+qyn,"в","боевую","готовность")||
        qaw(bbn+1+qyn,"под","управление")||
        qaw(bbn+1+qyn,"под","мою твою свою его ее их нашу","руку")||
        qaw(bbn+1+qyn,"под","мое твое свое его ее их наше","управление") ) &&
          s(bbn,bbn+qyn) && s(awn,-1) &&
        qir(awn+1,-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[458]++; if(dbg){print "Z458"}; continue };

    cst="прийти приходить";
    if ( bf(1,4,cst) &&
          w(bfn+1,"в") &&
         wf(bfn+2,bfn+5,"запустение упадок") &&
        qir(bfn+2,wfn-1,"prl_vi mest_vi") &&
          s(0,wfn-1) )
    { l[i]=omo1; Z[459]++; if(dbg){print "Z459"}; continue };

    if ( bb(-3,-1,"знать") && s(bbn,-1) &&
        qxs(1,"как","ваши наши свои","пять","пальцев") )
    { l[i]=omo1; Z[460]++; if(dbg){print "Z460"}; continue };

    if ( bw(1,"ходить") &&
       (qxs(2,"на","ушах")||
          w(2,"ходуном") ) && s(0,1) )
    { l[i]=omo1; Z[461]++; if(dbg){print "Z461"}; continue };

    cst="открывать открываться открыть открыться";
    if ( bw(-3,cst) &&
          w(-2,"перед") &&
          q(-1,"suw_tv mest_tv") && s(-3,-1) )
    { l[i]=omo1; Z[462]++; if(dbg){print "Z462"}; continue };
    if ( w(-3,"перед") &&
         q(-2,"suw_tv mest_tv") &&
        bw(-1,cst) && s(-3,-1) )
    { l[i]=omo1; Z[463]++; if(dbg){print "Z463"}; continue };

    cst="потянуть тянуть";
    if ( w(1,"не") &&
        bw(2,cst) && s(0,1) )
    { l[i]=omo1; Z[464]++; if(dbg){print "Z464"}; continue };
    cst1="башня время сила стена";
    if ( bw(1,cst) &&
         bw(2,cst1) && s(0,1) )
    { l[i]=omo1; Z[465]++; if(dbg){print "Z465"}; continue };
    if ( q(1,"suw_da mest_da") &&
         w(2,"не") &&
        bw(3,cst) && s(0,2) )
    { l[i]=omo1; Z[466]++; if(dbg){print "Z466"}; continue };
    if ( bw(1,cst) &&
          q(2,"suw_ro mest_ro mest_3e") &&
          w(3,"к ко") && s(0,2) )
    { l[i]=omo1; Z[467]++; if(dbg){print "Z467"}; continue };
    if ( bf(1,5,cst) && Qf(1,bfn-1,"sz_iili pre_any") &&
          w(bfn+1,"из") &&
          q(bfn+2,"suw_ro mest_ro mest_3e") && s(0,bfn+1) )
    { l[i]=omo1; Z[468]++; if(dbg){print "Z468"}; continue };
    if ( bf(1,3,cst) && Qf(1,bfn-1,"sz_iili pre_any") &&
          q(bfn+1,"suw_vi mest_vi mest_3e") &&
          q(bfn+2,"nar_any prl_kred_sr") && s(0,bfn+1) )
    { l[i]=omo1; Z[469]++; if(dbg){print "Z469"}; continue };

    cst="затягивать затягиваться затянуть затянуться";
    cst1="дым дымка паутина пелена туман";
    if ( bw(1,cst) &&
         bf(2,5,cst1) && s(0,bfn-1) &&
        qir(2,bfn-1,"prl_im mest_im mest_3e mest_tv prl_tv") )
    { l[i]=omo1; Z[470]++; if(dbg){print "Z470"}; continue };
    if ( bf(1,3,cst) &&
         qf(bfn+1,bfn+3,"mest_vi mest_3e suw_vi") && s(0,qfn-1) &&
        qir(1,bfn-1,"mod_any nar_any gl_aux_be prl_kred_sr") &&
        qir(bfn+1,qfn-1,"prl_vi") )
    { l[i]=omo1; Z[471]++; if(dbg){print "Z471"}; continue };

    cst="освободить освобождать спасти";
    cst1="захват захватчик оккупант осада разрушение";
    if ( bw(-1,cst) &&
          w(1,"от") &&
         bw(2,cst1) && s(-1,1) )
    { l[i]=omo1; Z[472]++; if(dbg){print "Z472"}; continue };
    if ( bw(-1,cst) &&
          w(1,"от") &&
          q(2,"prl_ro prq_ro") &&
         bw(3,cst1) && s(-1,2) )
    { l[i]=omo1; Z[473]++; if(dbg){print "Z473"}; continue };

    cst="вырвать";
    if ( wf(1,3,"из") ) { wf_n=wfn;
      if ( bb(-3,-1,cst) ) { bb_n=bbn;
        if ( vgl(bb_n,-3,-1) && s(bb_n,wf_n-1) &&
           ( qxs(wf_n,"из","его ее её их ваших цепких","лап рук")||
             qxs(wf_n,"из","лап рук объятий воспоминаний") ) &&
             qir(bb_n+1,-1,"prl_vi prq_vi mest_vi mest_3e") &&
             qir(1,wf_n-1,"nar_any prl_kred_sr isname") )
        { l[i]=omo1; Z[474]++; if(dbg){print "Z474"}; continue };
    };};

    if ( bw(-4,cst) && s(-4,-1) &&
          q(-3,"suw_vi prq_vi mest_vi mest_3e") &&
          w(-2,"из") &&
          w(-1,"лап рук воспоминаний") )
    { l[i]=omo1; Z[475]++; if(dbg){print "Z475"}; continue };

    cst="погружаться погрузиться";
    cst1="металл";
    if ( bw(1,cst) &&
          w(2,"в во") &&
         bw(3,cst1) && s(0,2) )
    { l[i]=omo2; Z[476]++; if(dbg){print "Z476"}; continue };

    cst="усилить";
    cst1="башня";
    if ( bb(-5,-1,cst) && s(bbn,-1) &&
          w(-1,"башнями") &&
        qir(bbn+1,-2,"prl_tv mest_tv mest_3e prq_tv") )
    { l[i]=omo1; Z[477]++; if(dbg){print "Z477"}; continue };

    cst="вплавить врезать вырезать вырубать вырубить высекать высечь";
    cst1="гора камень скала стена";
    if ( bb(-5,-1,cst) ) { bb_n=bbn;
      if ( vgl(bb_n,-5,-1) && s(bb_n,-1) &&
             w(bb_n+1,"в во из") &&
            bw(bb_n+2,cst1) &&
           qir(bb_n+3,-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") )
      { l[i]=omo1; Z[478]++; if(dbg){print "Z478"}; continue };
    };

    cst="снести сносить";
    cst1="выстрелом молотом прикладом ударом";
    if ( bw(-2,cst) &&
          w(-1,cst1) && s(-2,-1) )
    { l[i]=omo2; Z[479]++; if(dbg){print "Z479"}; continue };
    if ( bf(1,4,cst) ) { bf_n=bfn;
      if ( vgl(bf_n,1,4) &&
            wf(bf_n+1,bf_n+4,cst1) && s(0,wfn-1) &&
           qir(1,bf_n-1,"mest_im suw_im isname nar_any") &&
           qir(bf_n+1,wfn-1,"prl_edtv mest_edtv") )
      { l[i]=omo2; Z[480]++; if(dbg){print "Z480"}; continue };
    };

    cst="отворить";
    cst1="требование требовать";
    if ( bw(-2,cst1) &&
          w(-1,cst) && s(-2,-1) )
    { l[i]=omo1; Z[481]++; if(dbg){print "Z481"}; continue };


    #
    cst="разбирать разлететься разнести разносить разобрать";
    cst1="камешки кирпичи кирпичики";
    cst2="камешкам камешку камням камушку кирпичам кирпичикам кирпичику";
    cst3="выстрел очередь пуля удар";
    cst4="основания";
    cst5="пыль щепы";
    if ( bw(-2,cst3) &&
         bw(-1,cst) && s(-2,-1) )
    { l[i]=omo2; Z[482]++; if(dbg){print "Z482"}; continue };
    if ( bw(-1,cst3) &&
         bw(1,cst) && s(-1,0) )
    { l[i]=omo2; Z[483]++; if(dbg){print "Z483"}; continue };
    if ( bw(-3,cst) &&
          w(-2,"на") &&
          w(-1,cst1) && s(-3,-1) )
    { l[i]=omo1; Z[484]++; if(dbg){print "Z484"}; continue };
    if ( bw(-1,cst) &&
         wf(1,3,"в") &&
          w(wfn+1,cst5) && s(-1,wfn) )
    { l[i]=omo1; Z[485]++; if(dbg){print "Z485"}; continue };

    if ( bf(1,5,cst) && s(0,bfn-1) ) { bf_n=bfn;

       if ( ( qxw(bf_n+1,"на",cst1)||
              qxw(bf_n+1,"по",cst2)||
              qxw(bf_n+1,"до",cst4)||
              qxw(bf_n+1,"в",cst5) ) &&
              qir(1,bf_n-1,"qast_any mest_3e nar_any prl_kred_sr gl_aux_be mod_any isname") && s(bf_n) )
       { l[i]=omo1; Z[486]++; if(dbg){print "Z486"}; continue };

       if ( z(bf_n) &&
          qxw(bf_n+1,"для","освобождения очистки","места земли территории") )
       { l[i]=omo1; Z[487]++; if(dbg){print "Z487"}; continue };

    };
    if ( bb(-6,-1,cst) && s(bbn,-1) ) { bb_n=bbn;

       if ( ( qxs(bb_n-1,"на",cst1)||
              qxs(bb_n-1,"по",cst2)||
              qxs(bb_n-1,"до",cst4)||
              qxs(bb_n-1,"в",cst5) ) &&
              qir(bb_n+1,-1,"prl_vi mest_vi mest_3e") )
       { l[i]=omo1; Z[488]++; if(dbg){print "Z488"}; continue };
       if ( ( qaw(bb_n+1,"на",cst1)||
              qaw(bb_n+1,"по",cst2)||
              qaw(bb_n+1,"до",cst4)||
              qaw(bb_n+1,"в",cst5) ) &&
              qir(awn+1,-1,"prl_vi mest_vi mest_3e") )
       { l[i]=omo1; Z[489]++; if(dbg){print "Z489"}; continue };

    };
    #

    if ( qxs(1,"заместитель","командира")||
         qxs(1,"начтыла") )
    { l[i]=omo2; Z[490]++; if(dbg){print "Z490"}; continue };

    cst1="капитулировать сдаться";
    cst2="возня минута секунда";
    if ( bw(-1,cst2) &&
         bw(1,cst1) && s(-1,0) )
    { l[i]=omo2; Z[491]++; if(dbg){print "Z491"}; continue };
    if ( bw(1,cst1) &&
          w(2,"через после") &&
         bf(3,6,cst2) && s(0,bfn-1) )
    { l[i]=omo2; Z[492]++; if(dbg){print "Z492"}; continue };

    cst1="охватить охватывать";
    cst2="трубку трубу";
    cst3="ладонями пальцами руками";
    if ( bf(1,3,cst1) ) { bf_n=bfn;
       if ( vgl(bf_n,1,3) && s(0,bf_n) &&
              w(bf_n+1,cst2) &&
             Qf(1,bf_n-1,"sz_iili pre_any") )
       { l[i]=omo2; Z[493]++; if(dbg){print "Z493"}; continue };
       if ( vgl(bf_n,1,3) && wf(bf_n+1,bf_n+4,cst3) && zs(0) && s(1,wfn-1) &&
            qir(bf_n+1,wfn-1,"prl_tv mest_tv mest_3e") &&
             Qf(1,bf_n-1,"sz_iili pre_any") )
       { l[i]=omo2; Z[494]++; if(dbg){print "Z494"}; continue };
    };

    cst1="закрываться закрыться";
    if ( bf(1,3,cst1) ) { bf_n=bfn;
       if ( vgl(bf_n,1,3) && s(0,bf_n+2) && Qf(1,bf_n-1,"sz_iili pre_any") &&
              w(bf_n+1,"на") &&
              q(bf_n+2,"qik_vi") &&
             bw(bf_n+3,"день месяц год век") )
       { l[i]=omo1; Z[495]++; if(dbg){print "Z495"}; continue };
    };

    if ( bw(1,"загореться") &&
          w(2,"зеленым красным") && s(0,1) )
    { l[i]=omo2; Z[496]++; if(dbg){print "Z496"}; continue };

    # esc-_lock_pe
    if ( vgl(Y["n-_lock_pe"],-7,-1) ) { bb_n=Y["n-_lock_pe"];

       # escape:start
       cst="отбрасывать";
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
             bw(bb_n,cst) &&
          ( qaw(bb_n+1,"вокруг","себя")||
            qaw(bb_n+1,"ауру тень тени") ) &&
            qir(awn+1,-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") )
       { l[i]=omo1; Z[497]++; if(dbg){print "Z497"}; continue };
       cst="заменить";
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
       ( isname(0) || q_w(1,"isname") ) &&
             bw(bb_n,cst) )
       { l[i]=omo1; Z[498]++; if(dbg){print "Z498"}; continue };
       cst="поискать";
       if ( vgl(bb_n,-7,-1) && bw(bb_n,cst) && s(bb_n,0) && q(1,"isname") &&
            qir(bb_n+1,-1,"prl_vi mest_vi mest_3e") )
       { l[i]=omo1; Z[499]++; if(dbg){print "Z499"}; continue };
       cst="достать";
       if ( vgl(bb_n,-7,-1) && bw(bb_n,cst) && s(bb_n,-1) && z(0) &&
              w(bb_n-1,"настолько так") && w(1,"что") &&
            qir(bb_n+1,-1,"prl_vi mest_vi mest_3e") )
       { l[i]=omo1; Z[500]++; if(dbg){print "Z500"}; continue };
       cst="собирать собрать";
       if ( vgl(bb_n,-7,-1) && bw(bb_n,cst) && s(bb_n,-1) &&
              w(bb_n+1,"с со") &&
            qir(bb_n+2,-1,"prl_tv mest_tv mest_3e isname") )
       { l[i]=omo1; Z[501]++; if(dbg){print "Z501"}; continue };

       cst="открывать открываться открыть открыться";
       cst1="взгляду взору воображению глазам уму";
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
             bw(bb_n,cst) &&
              w(bb_n+1,cst1) &&
            qir(bb_n+2,-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") )
       { l[i]=omo1; Z[502]++; if(dbg){print "Z502"}; continue };
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
             bw(bb_n,cst) &&
             wb(bb_n-3,bb_n-1,cst1) &&
            qir(wbn+1,bb_n-1,"isname suw_ro") &&
            qir(bb_n+1,-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") )
       { l[i]=omo1; Z[503]++; if(dbg){print "Z503"}; continue };
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
             bw(bb_n,cst) &&
            qxs(bb_n-1,"во","всей","красе") &&
            qir(bb_n+1,-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") )
       { l[i]=omo1; Z[504]++; if(dbg){print "Z504"}; continue };
       cst="открывать открыть";
       cst1="ворота";
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
             bw(bb_n,cst) &&
              w(bb_n+1,cst1) &&
            qir(bb_n+2,-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") )
       { l[i]=omo1; Z[505]++; if(dbg){print "Z505"}; continue };

       cst="закрепить закреплять";
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
             bw(bb_n,cst) &&
              w(bb_n+1,"за") &&
            qia(bb_n+2,-1,"suw_tv prl_tv mest_tv","prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr isname") )
       { l[i]=omo1; Z[506]++; if(dbg){print "Z506"}; continue };
    };
    # esc+_lock_pe
    if ( vgl(Y["n+_lock_pe"],1,6) ) { bf_n=Y["n+_lock_pe"];

       # escape:start
       cst="отбрасывать";
       cst1="аура тень";
       if ( vgl(bf_n,1,6) &&
             bw(bf_n,cst) &&
              w(bf_n+1,"на") &&
             wf(bf_n+2,bf_n+5,cst1) && s(0,wfn-1) &&
            qir(0,bf_n-1,"gl_aux_be mod_any prl_kred_sr prl_kred_mu nar_any isname") &&
            qir(bf_n+2,wfn-1,"suw_vi prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr isname") )
       { l[i]=omo1; Z[507]++; if(dbg){print "Z507"}; continue };
       cst="врезать вырезать";
       cst1="скала";
       if ( vgl(bf_n,1,6) &&
             bw(bf_n,cst) &&
             qf(bf_n+1,bf_n+3,"pre_pr") &&
             bf(qfn+1,qfn+3,cst1) && s(0,bfn-1) &&
            qia(1,bf_n-1,"isname","gl_aux_be") &&
            qir(qfn+1,bfn-1,"nar_any prl_pr prl_vi mest_pr mest_vi mest_3e") )
       { l[i]=omo1; Z[508]++; if(dbg){print "Z508"}; continue };
       cst="валяться висеть лежать";
       if ( bw(bf_n,cst) &&
             w(bf_n+1,"за") &&
            wf(bf_n+2,bf_n+5,"дверью") && s(0,wfn-1) )
       { l[i]=omo2; Z[509]++; if(dbg){print "Z509"}; continue };


       cst="открывать открываться открыть открыться";
       cst1="взгляду взору воображению глазам уму";
       if ( vgl(bf_n,1,6) &&
             bw(bf_n,cst) &&
             wf(bf_n+1,wf_n+4,"во") &&
            qxs(wfn+1,"всей","красе") && s(0,xsn-1) )
       { l[i]=omo1; Z[510]++; if(dbg){print "Z510"}; continue };

       cst="закрыть закрыться";
       cst1="мира";
       if ( vgl(bf_n,1,6) &&
             bw(bf_n,cst) &&
              w(bf_n+1,"от") &&
             wf(bf_n+2,bf_n+5,cst1) && s(0,wfn-1) )
       { l[i]=omo1; Z[511]++; if(dbg){print "Z511"}; continue };

       cst="закрыть отворить открывать открыть";
       cst1="ворота путь";
       cst3=cst1 " " "дверь";
       if ( vgl(bf_n,1,6) && veq(Y["n-_pre_dlya"],-2) && s(-2,bf_n) &&
             wa(-1,"_castle_suw-ro") &&
             bw(bf_n,cst) &&
              w(bf_n+1,cst3) )
       { l[i]=omo1; Z[512]++; if(dbg){print "Z512"}; continue };
       if ( vgl(bf_n,1,6) &&
             bw(bf_n,cst) &&
             wf(bf_n+1,bf_n+4,cst1) && s(0,wfn-1) &&
            qir(1,bf_n-1,"isname nar_any") &&
            qir(bf_n+1,wfn-1,"prl_vi mest_vi mest_da suw_da isname") )
       { l[i]=omo1; Z[513]++; if(dbg){print "Z513"}; continue }; # check4 mass errors
       if ( vgl(bf_n,1,6) &&
             bw(bf_n,cst) &&
              w(bf_n+1,"перед") &&
              q(bf_n+2,"mest_tv suw_tv isname") &&
             wf(bf_n+3,bf_n+6,cst1) && s(0,wfn-1) &&
            qir(bf_n+3,wfn-1,"prl_vi mest_vi") )
       { l[i]=omo1; Z[514]++; if(dbg){print "Z514"}; continue };

       cst="греметь";
       cst1="подготовкой";
       cst3="зурны песен";
       if ( vgl(bf_n,1,6) && s(0,bf_n) &&
             bw(bf_n,cst) &&
              w(bf_n+1,cst1) )
       { l[i]=omo1; Z[515]++; if(dbg){print "Z515"}; continue };
       if ( vgl(bf_n,1,6) && s(0,bf_n) &&
             bw(bf_n,cst) &&
             wf(bf_n+1,bf_n+5,"от") &&
             wf(TN+1,TN+5,cst3) )
       { l[i]=omo1; Z[516]++; if(dbg){print "Z516"}; continue };
       cst="треснуть";
       if ( bw(bf_n,cst) && s(0,bf_n-1) &&
           qxs(bf_n+1,"по","швам") )
       { l[i]=omo1; Z[517]++; if(dbg){print "Z517"}; continue };
       if ( bw(bf_n,cst) &&
             w(bf_n+1,"от") &&
            wf(bf_n+2,bf_n+6,"людей гостей") && s(0,wfn-1) )
       { l[i]=omo1; Z[518]++; if(dbg){print "Z518"}; continue };
       cst="висеть";
       if ( bw(bf_n,cst) &&
             w(bf_n+1,"в") &&
            wf(bf_n+2,bf_n+5,"пространстве небе воздухе") && s(0,wfn-1) )
       { l[i]=omo1; Z[519]++; if(dbg){print "Z519"}; continue };
       if ( bw(bf_n,cst) &&
            wf(bf_n+1,bf_n+3,"над") &&
            wb(wfn+1,wfn+3,"головой") && s(0,wbn-1) &&
           qir(bf_n+1,wfn-1,"nar_any isname") &&
           qir(wfn+1,wbn-1,"prl_tv mest_tv mest_3e") )
       { l[i]=omo1; Z[520]++; if(dbg){print "Z520"}; continue };

    };
    # esc-_castle_pe
    if ( vgl(Y["n-_castle_pe"],-5,-1) ) { bb_n=Y["n-_castle_pe"];

       if ( vgl(bb_n,-5,-1) && s(bb_n,0) &&
              q(bb_n,"prq_any") &&
            qir(bb_n+1,-1,"prl_vi mest_vi mest_3e prl_kred_sr nar_any qast_any") &&
              q(1,"suw_any") )
       { l[i]=omo1; Z[521]++; if(dbg){print "Z521"}; continue };
       cst="встречать";
       if ( vgl(bb_n,-5,-1) && s(bb_n-1,-1) &&
             bw(bb_n,cst) &&
              q(bb_n-1,"mest_vi suw_vi isname") &&
            qxs(bb_n-2,"на","входе") )
       { l[i]=omo2; Z[522]++; if(dbg){print "Z522"}; continue };

    };

    # escape:end

    # _castle_pe с предлогами между глаголами и "замок":start
    #
    # поиск по pre_vi + _castle_pe: qb_n и bb_n
    if ( qb(-7,-2,"pre_vi") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_castle_pe") ) { bb_n=bbn;

       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) && !sc(-1,"\\(") &&
              Q(bb_n,"suw_any") &&
            qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
            qir(qb_n+1,-2,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
              q(-1,"suw_vi") )
       { l[i]=omo1; Z[523]++; if(dbg){print "Z523"}; continue };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
              Q(bb_n,"suw_any") &&
            qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
              q(qb_n+1,"suw_vi") &&
            qir(qb_n+2,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
       { l[i]=omo1; Z[524]++; if(dbg){print "Z524"}; continue };

    };};

    # поиск по pre_da + _castle_pe: qb_n и bb_n
    if ( qb(-7,-2,"pre_da") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_castle_pe") ) { bb_n=bbn;

        if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
               w(1,"на") &&
             wfa(2,5,"_lock_na_suw-pr") && s(0,wfn-1) &&
             qir(2,wfn-1,"prl_pr mest_pr mest_3e prq_pr") )
        { l[i]=omo2; Z[525]++; if(dbg){print "Z525"}; continue }; #check
        if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
               w(1,"на") &&
             wfa(2,5,"_lock_na_suw-vi") && s(0,wfn-1) &&
             qir(2,wfn-1,"prl_vi mest_vi mest_3e prq_vi") )
        { l[i]=omo2; Z[526]++; if(dbg){print "Z526"}; continue }; #check

        if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
               Q(bb_n,"suw_any") &&
             qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
             qir(qb_n+1,-2,"prl_da mest_da prq_da mest_3e prl_kred_sr nar_any qast_any") &&
               q(-1,"suw_da") )
        { l[i]=omo1; Z[527]++; if(dbg){print "Z527"}; continue };
        if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
               Q(bb_n,"suw_any") &&
             qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
               q(qb_n+1,"suw_da") &&
             qir(qb_n+2,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
        { l[i]=omo1; Z[528]++; if(dbg){print "Z528"}; continue };

    };};

    # поиск по pre_ro + _castle_pe: qb_n и bb_n
    if ( qb(-7,-2,"pre_ro") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_castle_pe") ) { bb_n=bbn;

       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
              Q(bb_n,"suw_any") &&
            qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
            qiz(qb_n+1,-1,"prl_ro mest_ro prq_ro mest_3e prl_kred_sr nar_any qast_any suw_ro","prl_vi mest_vi prq_vi") )
       { l[i]=omo1; Z[529]++; if(dbg){print "Z529"}; continue };
#      if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
#             Q(bb_n,"suw_any") &&
#           qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
#             q(qb_n+1,"suw_ro") &&
#           qir(qb_n+2,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
#      { l[i]=omo1; Z[530]++; if(dbg){print "Z530"}; continue };

    };};

    # поиск по pre_tv + _castle_pe: qb_n и bb_n
    if ( qb(-7,-2,"pre_tv") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_castle_pe") ) { bb_n=bbn;

        if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
               Q(bb_n,"suw_any") &&
             qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
             qir(qb_n+1,-2,"prl_tv mest_tv prq_tv mest_3e prl_kred_sr nar_any qast_any") &&
               q(-1,"suw_tv") )
        { l[i]=omo1; Z[531]++; if(dbg){print "Z531"}; continue };
        if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
               Q(bb_n,"suw_any") &&
             qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
               q(qb_n-1,"suw_tv") &&
             qir(qb_n+2,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
        { l[i]=omo1; Z[532]++; if(dbg){print "Z532"}; continue };

        if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
               Q(bb_n,"suw_any") &&
             qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
               q(qb_n+1,"suw_tv") &&
             qir(qb_n+2,-1,"suw_ro suw_edne isname prl_ro mest_ro prq_ro prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
        { l[i]=omo1; Z[533]++; if(dbg){print "Z533"}; continue };

    };};

    # поиск по pre_pr + _castle_pe: qb_n и bb_n
    if ( qb(-7,-2,"pre_pr") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_castle_pe") ) { bb_n=bbn;

       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
              Q(bb_n,"suw_any") &&
            qir(bb_n+1,qb_n-1,"suw_da prl_da mest_da prq_da nar_mest prl_kred_sr") &&
            qir(qb_n+1,-2,"prl_pr prq_pr mest_pr mest_3e") &&
              q(-1,"suw_pr") )
       { l[i]=omo1; Z[534]++; if(dbg){print "Z534"}; continue };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
              Q(bb_n,"suw_any") &&
            qir(bb_n+1,qb_n-1,"suw_da prl_da mest_da prq_da nar_mest prl_kred_sr") &&
              q(qb_n+1,"suw_pr isname") &&
            qir(qb_n+2,-1,"suw_ro prl_vi prq_vi mest_vi mest_3e") )
       { l[i]=omo1; Z[535]++; if(dbg){print "Z535"}; continue };
#      if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
#             Q(bb_n,"suw_any") &&
#           qir(bb_n+1,qb_n-1,"suw_da prl_da mest_da prq_da nar_mest prl_kred_sr") &&
#           qir(qb_n+1,-3,"prl_pr prq_pr mest_pr mest_3e") &&
#             q(-2,"suw_pr isname") &&
#             q(-1,"prl_vi prq_vi mest_vi mest_3e") )
#      { l[i]=omo1; Z[536]++; if(dbg){print "Z536"}; continue };

    };};
    # _castle_pe с предлогами между глаголами и "замок":end

    # _lock_pe с предлогами между глаголами и "замок":start
    #
    if ( qb(-7,-2,"pre_vi") ) { qb_n=qbn;
      if ( bba(qb_n-7,qb_n-1,"_lock_pe") ) { bb_n=bbn;
       cst0="зиму";
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qbn-7,qbn-1) && s(bb_n,-1) &&
            vex(Y["tn_ok_vi"]) )
       { bb_n=qb_n=""; Z[537]++; if(dbg){print "Z537"}; };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qbn-7,qbn-1) && s(bb_n,-1) &&
              w(qb_n,"в во") && qir(qb_n+1,-1,"isname") && ba(bb_n,"_gl_v_castle-iv") )
       { bb_n=qb_n=""; Z[538]++; if(dbg){print "Z538"}; };

       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qbn-7,qbn-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
              q(qb_n+1,"suw_vi mest_vi") && W(qb_n+1,cst0) &&
            qir(qb_n+2,-1,"prl_vi prq_vi mest_vi mest_3e nar_any") )
       { l[i]=omo2; Z[539]++; if(dbg){print "Z539"}; continue };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qbn-7,qbn-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
            qir(qb_n+1,-2,"prl_vi prq_vi mest_vi mest_3e nar_any") &&
              q(-1,"suw_vi mest_vi") && W(-1,cst0) )
       { l[i]=omo2; Z[540]++; if(dbg){print "Z540"}; continue };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qbn-7,qbn-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
              q(qb_n+1,"suw_vi") && W(qb_n+1,cst0) &&
            qir(qb_n+2,-1,"suw_ro prl_ro mest_ro prq_ro") )
       { l[i]=omo2; Z[541]++; if(dbg){print "Z541"}; continue };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qbn-7,qbn-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_im prl_im prq_im mest_im mest_3e nar_any") &&
              q(qb_n+1,"suw_vi") && W(qb_n+1,cst0) &&
            qir(qb_n+2,-2,"suw_ro prl_ro mest_ro prq_ro") &&
              q(-1,"prl_vi prq_vi mest_vi mest_3e nar_any") )
       { l[i]=omo2; Z[542]++; if(dbg){print "Z542"}; continue };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qbn-7,qbn-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_da prl_da prq_da mest_da mest_3e nar_any") &&
              q(qb_n+1,"suw_vi") && W(qb_n+1,cst0) &&
            qir(qb_n+2,-1,"suw_ro prl_ro mest_ro prq_ro") )
       { l[i]=omo2; Z[543]++; if(dbg){print "Z543"}; continue };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qbn-7,qbn-1) && s(bb_n,-1) &&
            qir(qb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
            qir(qb_n+1,-3,"prl_vi prq_vi mest_vi mest_3e") &&
              q(-2,"suw_vi mest_vi") && W(-2,cst0) &&
              q(-1,"prl_vi prq_vi mest_vi mest_3e") )
       { l[i]=omo2; Z[544]++; if(dbg){print "Z544"}; continue };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qbn-7,qbn-1) && s(bb_n,-1) &&
            qir(qb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
              q(qbn+1,"prl_vi prq_vi mest_vi mest_3e") &&
              q(qb_n+2,"suw_vi mest_vi") && W(qb_n+2,cst0) &&
            qir(qb_n+3,-1,"prl_vi prq_vi mest_vi mest_3e") )
       { l[i]=omo2; Z[545]++; if(dbg){print "Z545"}; continue };

       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qbn-7,qbn-1) && s(bb_n,-1) &&
              w(bb_n+1,"у") &&
            qir(bb_n+2,qb_n-2,"prl_ro mest_ro mest_3e prq_ro") &&
              q(qb_n-1,"suw_ro mest_ro") &&
            qir(qbn+1,-2,"prl_vi mest_vi prq_vi") &&
              q(-1,"suw_vi mest_vi") )
       { l[i]=omo2; Z[546]++; if(dbg){print "Z546"}; continue };

    };};

    #
    if ( qb(-7,-2,"pre_ro") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_lock_pe") ) { bb_n=bbn;

       if ( vgl(qb_n,-5,-1) && vgl(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
            qir(qb_n+1,-2,"prl_ro mest_ro mest_3e") &&
              q(-1,"suw_ro mest_ro") )
       { l[i]=omo2; Z[547]++; if(dbg){print "Z547"}; continue };
       if ( vgl(qb_n,-5,-1) && vgl(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
              q(qb_n+1,"suw_ro mest_ro") &&
            qir(qb_n+2,-1,"prl_vi mest_vi mest_3e prq_vi suw_ro") )
       { l[i]=omo2; Z[548]++; if(dbg){print "Z548"}; continue };

    };};

    #
    if ( qb(-7,-2,"pre_tv") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_lock_pe") ) { bb_n=bbn;

       if ( vgl(qb_n,-5,-1) && vgl(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
            qir(qb_n+1,-2,"prl_tv mest_tv mest_3e") &&
              q(-1,"suw_tv mest_tv") )
       { l[i]=omo2; Z[549]++; if(dbg){print "Z549"}; continue };
       if ( vgl(qb_n,-5,-1) && vgl(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
              q(qb_n+1,"suw_tv mest_tv") &&
            qir(qb_n+2,-1,"prl_vi mest_vi mest_3e prq_vi") )
       { l[i]=omo2; Z[550]++; if(dbg){print "Z550"}; continue };

    };};

    #
    if ( qb(-7,-2,"pre_pr") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_lock_pe") ) { bb_n=bbn;

       if ( vgl(qb_n,-5,-1) && vgl(bb_n,qb_n-5,qb_n-1) && Q_w(1,"isname") &&
            qir(bb_n+1,qb_n-1,"nar_any qast_any") &&
            qir(qb_n+1,-1,"suw_pr suw_ro suw_edne mest_vip3e prl_pr mest_pr mest_3e prq_pr isname") && s(bb_n,-1) )
       { l[i]=omo2; Z[551]++; if(dbg){print "Z551"}; continue };
       if ( vgl(qb_n,-5,-1) && vgl(bb_n,qb_n-5,qb_n-1) && Q_w(1,"isname") &&
            qir(bb_n+1,qb_n-1,"nar_any qast_any") &&
            qir(qb_n+1,-2,"suw_pr mest_vip3e prl_pr mest_pr mest_3e prq_pr isname") &&
              q(-1,"prl_vi mest_vi mest_3e prq_vi") && s(bb_n,-1) )
       { l[i]=omo2; Z[552]++; if(dbg){print "Z552"}; continue };

    };};
    # _lock_pe с предлогами между глаголами и "замок":end



    # _castle_pe самостоятельно
    if ( vgl(Y["n-_castle_pe"],-7,-1) ) { bb_n=Y["n-_castle_pe"];

       if ( vgl(bb_n,-7,-1) && xw(bb_n,"X_castle_pe") )
       { bb_n=""; Z[553]++; if(dbg){print "Z553"};};

         if ( veq(bb_n,-1) && s(-1) && q(-1,"prq_any gl_in") )
         { l[i]=omo1; Z[554]++; if(dbg){print "Z554"}; continue };

       if ( vgl(bb_n,-7,-1) && bfa(bb_n+1,-1,"_lock_pe") && s(bfn,-1) )
       { bb_n=""; Z[555]++; if(dbg){print "Z555"};};
       if ( vgl(bb_n,-7,-1) && q(bb_n,"prq_edmuim") && ba(bb_n-1,"_lock_pe") && s(bfn-1,-1) )
       { bb_n=""; Z[556]++; if(dbg){print "Z556"};};

         if ( veq(bb_n,-2) && s(bb_n,-1) && wc(-1,"ский$") )
         { l[i]=omo1; Z[557]++; if(dbg){print "Z557"}; continue };

         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
               (p(bb_n-1)||p(0)||q_w(1,"sz_i")||(q_w(1,"nar_any")&& s(0)) ) &&
              qia(bb_n+1,-1,"sz_i","prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[558]++; if(dbg){print "Z558"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              qir(bb_n+1,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[559]++; if(dbg){print "Z559"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              qir(bb_n+1,-1,"suw_da prl_da mest_da prq_da mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[560]++; if(dbg){print "Z560"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              qir(bb_n+1,-1,"suw_ro prl_ro mest_ro prq_ro mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[561]++; if(dbg){print "Z561"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              qir(bb_n+1,-2,"suw_da prl_da mest_da prq_da mest_3e prl_kred_sr nar_any qast_any") &&
                q(-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[562]++; if(dbg){print "Z562"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
                q(bb_n+1,"suw_da mest_da") &&
              qir(bb_n+2,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[563]++; if(dbg){print "Z563"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
                q(bb_n+1,"suw_da mest_da") &&
                q(bb_n+2,"suw_im mest_im") &&
              qir(bb_n+3,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[564]++; if(dbg){print "Z564"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              qir(bb_n+1,-1,"suw_im prl_im mest_im prq_im isname mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[565]++; if(dbg){print "Z565"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              qir(bb_n+1,-1,"suw_tv prl_tv mest_tv prq_tv mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[566]++; if(dbg){print "Z566"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              qir(bb_n+1,-2,"suw_tv prl_tv mest_tv prq_tv mest_3e prl_kred_sr nar_any qast_any") &&
                q(-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[567]++; if(dbg){print "Z567"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
                q(bb_n+1,"prq_vi") &&
              qiz(bb_n+2,-1,"prl_tv mest_tv prq_tv mest_3e prl_kred_sr nar_any qast_any","suw_tv") )
         { l[i]=omo1; Z[568]++; if(dbg){print "Z568"}; continue };

         if ( vex(Y["n_pre_v_ist"]) ) { wf_n=Y["n_pre_v_ist"];
            if ( vgl(bb_n,-7,-3) && vgl(wf_n,bb_n+1,-1) && s(bb_n,-1) &&
                  qb(wf_n+1,-1,"suw_pr") &&
                 qir(bb_n+1,wf_n-1,"nar_any prl_kred_sr") &&
                 qir(wf_n+1,qbn-1,"prl_pr mest_pr mest_3e prq_pr") &&
                 qir(qbn+1,-1,"prl_vi mest_vi mest_3e prq_vi") )
            { l[i]=omo1; Z[569]++; if(dbg){print "Z569"}; continue };
         };

       if ( (qxw(-1,"тот","или","иной этот") ||
             qxw(-1,"и","тот этот мой свой наш ваш ее его их сам")||
             qxw(-1,"же ли","и","тот этот мой свой наш ваш ее его их сам")||
             qxw(-1,"один","и","тот","же")||
             qxw(-1,"еще","хоть","один")||
             qxw(-1,"хотя","бы")||
             qxw(-1,"хоть","один") ) &&
             veq(bb_n,xwn-1) && s(xwn-1) && s(-1) )
       { l[i]=omo1; Z[570]++; if(dbg){print "Z570"}; continue };

      };

      if ( qb(-5,-1,"sz_iili") ) { qb_n=qbn;
        if ( bba(qb_n-5,qb_n-1,"_castle_pe") ) { bb_n=bbn;

         if ( vgl(Y["n+_lock_pe"],1,5) && s(0,Y["n+_lock_pe"]-1) )
         { bb_n=qb_n=""; Z[571]++; if(dbg){print "Z571"}; };

         if ( vgl(qb_n,-5,-1) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
              qir(bb_n+1,qb_n-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
              qir(qb_n+1,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[572]++; if(dbg){print "Z572"}; continue };

      };};

      if ( vv(0,4) && !(se(0,", — ") && !se(vvn,", — ") ) &&
        !(bfa(1,vvn-1,"_castle_pe") ) &&
        !(bba(-4,-1,"_castle_environs") && sq(bbn,-1,"[, ]") ) &&
        !(vgl(Y["n-_castle_pe"],-4,-1) && s(Y["n-_castle_pe"],-1)) &&
           ba(vvn+1,"_lock_pe") )
      { l[i]=omo2; Z[573]++; if(dbg){print "Z573"}; continue };


    if ( qy(-1,"prl_vi mest_vi mest_3e") &&
          q(-1-qyn,"narph_any") &&
        bba(xwn-3,xwn-1,"_castle_pe") && s(bbn,-1) && Xw(bfn,"X_castle_pe") )
    { l[i]=omo1; Z[574]++; if(dbg){print "Z574"}; continue };
#      bfa(xwn-3,xwn-1,"_castle_pe") && s(bfn,-1) && Q(bfn,"suw_any") )
    # _castle_pe <<---:end

    # _lock_pe <<<---:start
    if ( vgl(Y["n-_lock_pe"],-7,-1) ) { bb_n=Y["n-_lock_pe"];

      if ( veq(bb_n,-1) && q(bb_n,"predik vvod") && s(-1) && zs(-2) )
      { bb_n=""; Z[575]++; if(dbg){print "Z575"};};
      if ( vgl(bb_n,-4,-1) && q(bb_n,"prq_im") && vgl(Y["n+_castle_pe"],1,2) && s(bb_n,Y["n+_castle_pe"]-1) &&
           qir(bb_n+1,-1,"prl_im mcop_im prq_im nar_any qast_any") )
      { bb_n=""; Z[576]++; if(dbg){print "Z576"};};

       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
            qir(bb_n+1,-1,"prl_vi prq_vi mest_vi mest_3e qast_any nar_any prl_kred_sr") )
       { l[i]=omo2; Z[577]++; if(dbg){print "Z577"}; continue };
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              q(bb_n+1,"suw_tv mest_tv") &&
            qir(bb_n+2,-1,"prl_vi prl_tv prq_vi mest_vi mest_3e qast") )
       { l[i]=omo2; Z[578]++; if(dbg){print "Z578"}; continue };
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              q(bb_n+1,"prq_vi") &&
              q(bb_n+2,"suw_vi mest_vi") &&
            qir(bb_n+3,-1,"prl_vi prq_vi mest_vi mest_3e qast") )
       { l[i]=omo2; Z[579]++; if(dbg){print "Z579"}; continue };
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              q(bb_n+1,"prl_tv prq_tv mest_tv") &&
              q(bb_n+2,"suw_tv mest_tv") &&
            qir(bb_n+3,-1,"prl_vi prq_vi mest_vi mest_3e qast") )
       { l[i]=omo2; Z[580]++; if(dbg){print "Z580"}; continue };
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              q(bb_n+1,"suw_da mest_da") &&
            qir(bb_n+2,-1,"prl_vi prq_vi mest_vi mest_3e qik_vi nar_any qast_any") )
       { l[i]=omo2; Z[581]++; if(dbg){print "Z581"}; continue };
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
            qir(bb_n+1,-2,"prl_tv prq_tv mest_tv") &&
              q(-1,"suw_tv mest_tv") )
       { l[i]=omo2; Z[582]++; if(dbg){print "Z582"}; continue };
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              q(bb_n+1,"suw_im mest_im isname") &&
            qir(bb_n+2,-1,"prl_vi prq_vi mest_vi mest_3e qast_any") )
       { l[i]=omo2; Z[583]++; if(dbg){print "Z583"}; continue };
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
            qir(bb_n+1,-1,"suw_odim prl_im prq_im mest_im mest_3e qast_any isname") )
       { l[i]=omo2; Z[584]++; if(dbg){print "Z584"}; continue };
       if ( vgl(bb_n,-7,-1) &&
            qir(bb_n+1,-2,"suw_vi suw_edne prl_ro prq_ro mest_ro mest_3e qik_vi nar_any") &&
              q(-1,"suw_ro") && s(bb_n,-1) )
       { l[i]=omo2; Z[585]++; if(dbg){print "Z585"}; continue };
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              q(bb_n+1,"prq_vi") &&
            qir(bb_n+2,-2,"prl_tv prq_tv mest_tv") &&
              q(-1,"suw_tv mest_tv") )
       { l[i]=omo2; Z[586]++; if(dbg){print "Z586"}; continue };

       cst1="ваш верхний второй его ее их мой наш сам свой такой тот этот";
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
           (qaw(bb_n+1,"тот","или","иной этот") ||
            qaw(bb_n+1,"и также",cst1)||
            qaw(bb_n+1,"еще же ли уже","и",cst1)||
            qaw(bb_n+1,"один","и","тот","же")||
            qaw(bb_n+1,"еще","хоть","один")||
            qaw(bb_n+1,"вполне","себе")||
            qaw(bb_n+1,"хотя","бы")||
            qaw(bb_n+1,"хоть еще","один такой какой-то какой-нибудь") ) &&
            vlt(awn,0) &&
            qir(awn+1,-1,"prl_edmuim prq_edmuim mest_edmuvi") )
       { l[i]=omo2; Z[587]++; if(dbg){print "Z587"}; continue };
       if ( (qxw(-1,"его ее их еще","и") ||
             qxw(-1,"и",cst1) ) &&
             veq(bb_n,xwn-1) && s(xwn-1) && s(-1) && p(0) )
       { l[i]=omo2; Z[588]++; if(dbg){print "Z588"}; continue };
    };

    if ( qb(-5,-1,"sz_iili") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_lock_pe") ) { bb_n=bbn;

          if ( vgl(qb_n,-5,-1) && vgl(bb_n,qbn-5,qbn-1) && s(bb_n,-1) &&
                bw(bb_n,"поцеловать") )
          { qb_n=bb_n=""; Z[589]++; if(dbg){print "Z589"}; };

          if ( vgl(qb_n,-5,-1) && vgl(bb_n,qbn-5,qbn-1) && s(bb_n,-1) &&
               vgl(Y["n+_castle_pe"],1,3) && sq(0,Y["n+_castle_pe"]-1,"[, ]") &&
               qir(1,Y["n+_castle_pe"]-1,"mod_any gl_aux_be nar_any mest_vi mest_3e") )
          { qb_n=bb_n=""; Z[590]++; if(dbg){print "Z590"}; };

       if ( vgl(qb_n,-5,-1) && vgl(bb_n,qbn-5,qbn-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-2,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") &&
              q(qb_n-1,"suw_vi") &&
            qir(qb_n+1,-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") )
       { l[i]=omo2; Z[591]++; if(dbg){print "Z591"}; continue };
       if ( vgl(qb_n,-5,-1) && vgl(bb_n,qbn-5,qbn-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") &&
            qir(qb_n+1,-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") )
       { l[i]=omo2; Z[592]++; if(dbg){print "Z592"}; continue };

    };};

    if ( q(-1,"narph_any") &&
       bfa(xwn-3,xwn-1,"_lock_pe") && s(bfn,-1) && Q(bfn,"suw_any") )
    { l[i]=omo2; Z[593]++; if(dbg){print "Z593"}; continue };
    # _lock_pe <<<---:end

    # _castle_pe --->>>:start
    if ( vgl(Y["n+_castle_pe"],1,6) ) { bf_n=Y["n+_castle_pe"]; bb_n=Y["n-_lock_pe"];

       if ( veq(bf_n,1) && s(0,1) &&
             bw(1,"хранить") &&
              w(2,"дома") )
       { l[i]=omo2; Z[594]++; if(dbg){print "Z594"}; continue };

       if ( vgl(bf_n,1,6) && zs(0) && s(1,bf_n-1) &&
              q(bf_n,"mod_any") && q(bf_n+1,"deep gl_in gl_ed gl_mn") && !ba(bf_n+1,"_castle_pe") )
       { bf_n=""; Z[595]++; if(dbg){print "Z595"}; };
       if ( vgl(bf_n,1,6) && zs(0) && s(1,bf_n-1) &&
              q(bf_n,"mod_any") && q(bf_n+1,"gl_in") && ba(bf_n+1,"_castle_pe") )
       { bf_n=bf_n+1; Z[596]++; if(dbg){print "Z596"}; };
       if ( vgl(bf_n,1,6) && vv(0,4) &&
              q(bf_n,"deep") && ba(vvn+1,"_lock_pe") )
       { l[i]=omo2; Z[597]++; if(dbg){print "Z597"}; continue };

       if ( vgl(bf_n,1,6) && s(0,bf_n-1) && Q(bf_n,"suw_any") && Qf(1,bf_n-1,"sz_iili pre_any") &&
            !ba(bf_n,"_castle_pe_notrh") && !vgl(Y["n+_lock_pe"],1,bf_n-1) &&
          !(vgl(Y["n-_lock_pe"],-5,-1) && q(bb_n,"prq_any vvod") && Qf(bb_n+1,-1,"sz_iili pre_any") && s(bb_n,-1)) )
       { l[i]=omo1; Z[598]++; if(dbg){print "Z598"}; continue };
       if ( vgl(bf_n,1,6) && z(0) && s(1,bf_n-1) &&
         !((vgl(bb_n,-4,-1) && s(bb_n,-1) ) || ( bba(-4,-1,"_gl_v_lock-iv") && s(bbn,-1) )) &&
            qir(1,bf_n-1,"otsz_mu nar_any mest_any qast mod_any isname") &&
            !ba(bf_n,"_castle_pe_notrh") )
       { l[i]=omo1; Z[599]++; if(dbg){print "Z599"}; continue };

       if ( vgl(bf_n,1,6) && s(0,bf_n-1) &&
         pre_tv(1) &&
              q(bf_n-1,"suw_tv") &&
            qir(2,bf_n-2,"prl_tv mest_tv mest_3e prq_tv") )
       { l[i]=omo1; Z[600]++; if(dbg){print "Z600"}; continue };

       if ( vgl(bf_n,1,6) && s(0,bf_n-1) &&
         pre_ro(1) &&
              q(bf_n-1,"suw_im") &&
            qir(2,bf_n-2,"suw_ro prl_ro mest_ro mest_3e prq_ro") )
       { l[i]=omo1; Z[601]++; if(dbg){print "Z601"}; continue };

    };

    if ( q(1,"narph_any") &&
       bfa(xwn+1,xwn+3,"_castle_pe") && s(0,bfn-1) && Q(bfn,"suw_any") )
    { l[i]=omo1; Z[602]++; if(dbg){print "Z602"}; continue };
    # _castle_pe --->>>:end


    # _lock_pe --->>>:start
    if ( vgl(Y["n+_lock_pe"],1,6) ) { bf_n=Y["n+_lock_pe"];

       if ( vgl(bf_n,1,6) && s(0,bf_n-1) &&
              w(1,"за") &&
            qir(2,bf_n-1,"suw_tv mest_tv prl_tv isname qast_any") && !(isname(0) && zs(-1) ) )
       { l[i]=omo2; Z[603]++; if(dbg){print "Z603"}; continue };
       if ( vgl(bf_n,3,5) && s(0,bf_n-1) &&
              w(1,"на") &&
              q(2,"suw_vi mest_vi") &&
              s(0,bf_n-1) && Qf(3,bf_n-1,"sz_iili pre_any") )
       { l[i]=omo2; Z[604]++; if(dbg){print "Z604"}; continue };
       if ( veq(bf_n,6) && s(0,bf_n-1) &&
         pre_pr(1) &&
              q(2,"suw_pr") &&
              q(3,"suw_ro") &&
         pre_tv(4) &&
              q(5,"suw_tv") )
       { l[i]=omo2; Z[605]++; if(dbg){print "Z605"}; continue };

       cst2="скрепить скреплять";
       if ( vgl(bf_n,1,6) && s(-1,bf_n-1) && p(-2) &&
              w(-1,"как словно точно") && bw(bf_n,cst2) &&
             Qf(1,bf_n-1,"sz_iili pre_any") )
       { l[i]=omo2; Z[606]++; if(dbg){print "Z606"}; continue };

         if ( vgl(bf_n,1,6) && s(0,bf_n-1) && veq(Y["iwrd_form"],"ediv") &&
          prq_any(bf_n) && !q(bf_n,"prq_edmuim prq_edmutv prq_kred_mu") &&
             !exb(-1,"тот ни другой ") )
         { bf_n=""; Z[607]++; if(dbg){print "Z607"}; };
         if ( vgl(bf_n,1,6) && s(0,bf_n-1) &&
               ba(-1,"_castle_prl_geo") && s(-1) )
         { bf_n=""; Z[608]++; if(dbg){print "Z608"}; };

       if ( vgl(bf_n,1,6) && s(0,bf_n-1) &&
             Qf(1,bf_n-1,"sz_iili pre_any") && !(isname(0) && zs(-1) ) )
       { l[i]=omo2; Z[609]++; if(dbg){print "Z609"}; continue };
       if ( veq(bf_n,2) && s(0,bf_n) &&
              q(1,"sz_i") &&
              w(3,"его") )
       { l[i]=omo2; Z[610]++; if(dbg){print "Z610"}; continue };

    };

    if ( q(1,"narph_any") &&
       bfa(xwn+1,xwn+3,"_lock_pe") && s(0,bfn-1) && Q(bfn,"suw_any") )
    { l[i]=omo2; Z[611]++; if(dbg){print "Z611"}; continue };

    if ( vgl(Y["n+_lock_pe"],2,4) && s(1,Y["n+_lock_pe"]-1) && z(0) &&
           q(1,"otsz_mu") &&
          Qf(2,Y["n+_lock_pe"]-1,"sz_iili pre_any") )
    { l[i]=omo2; Z[612]++; if(dbg){print "Z612"}; continue };
    # _lock_pe --->>>:end

    # _castle_prl_geo:start
#   cst1="быть ведь же стать считаться являться";
    if ( prl_im(-1) && ba(-1,"_castle_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[613]++; if(dbg){print "Z613"}; continue };
    if ( prl_im(-2) && ba(-2,"_castle_prl_geo") &&
              Q(-1,"suw_any") && s(-2,-1)  )
    { l[i]=omo1; Z[614]++; if(dbg){print "Z614"}; continue };
    if ( prl_im(1) && ba(1,"_castle_prl_geo") && s(0) && !prl_ro(1))
    { l[i]=omo1; Z[615]++; if(dbg){print "Z615"}; continue };
    # _castle_prl_geo:start

 # доработка прилагательных им_п_
 if ( w(-1,"самый") && W_w(-2,"тот этот") && s(-2,-1) )
 { l[i]=omo1; Z[616]++; if(dbg){print "Z616"}; continue };
 if ( qxs(-1,"самый","же") )
 { l[i]=omo1; Z[617]++; if(dbg){print "Z617"}; continue };

 if ( wb(-5,-2,"самый") )  { wb_n=wbn;

    if ( veq(wb_n,-1) && qxs(-2,"тот этот","же") && s(-1) )
    { wb_n=""; Z[618]++; if(dbg){print "Z618"}; };

    if ( veq(wb_n,-2) && wa(-1,"_samyj_prl_castle") && s(wb_n,-1) )
    { l[i]=omo1; Z[619]++; if(dbg){print "Z619"}; continue };
    if ( veq(wb_n,-2) && wa(-1,"_samyj_prl_lock") && s(wb_n,-1) )
    { l[i]=omo2; Z[620]++; if(dbg){print "Z620"}; continue };
    if ( veq(wb_n,-4) && q(-3,"prl_edmuvi") && q(-2,"sz_i") && wa(-1,"_samyj_prl_lock") && s(wb_n,-1) )
    { l[i]=omo2; Z[621]++; if(dbg){print "Z621"}; continue };

 };
 if ( wf(1,4,"самый самым") )  { wf_n=wfn;

    if ( vgl(wf_n,1,4) && wa(wf_n+1,"_samyj_prl_castle") && s(0,wf_n) &&
         qir(1,wf_n-1,"nar_any gl_aux_be qast_any") )
    { l[i]=omo1; Z[622]++; if(dbg){print "Z622"}; continue };
    if ( vgl(wf_n,1,3) && wa(wf_n+1,"_samyj_prl_lock") && s(0,wf_n) &&
         qir(1,wf_n-1,"nar_any gl_aux_be qast_any") )
    { l[i]=omo2; Z[623]++; if(dbg){print "Z623"}; continue };
    cst5="быть выглядеть казаться оказаться показаться представлять стать";
    if ( vgl(wf_n,2,4) && qm(wf_n+1,"prl_edmuim prl_edmutv","_samyj_prl_castle") && s(0,wf_n-1) &&
          bw(1,cst5) && qir(2,wf_n-1,"nar_any gl_aux_be qast_any") )
    { l[i]=omo1; Z[624]++; if(dbg){print "Z624"}; continue };
    if ( vgl(wf_n,2,4) && qm(wf_n+1,"prl_edmuim prl_edmutv","_samyj_prl_lock") && s(0,wf_n-1) &&
          bw(1,cst5) && qir(2,wf_n-1,"nar_any gl_aux_be qast_any") )
    { l[i]=omo2; Z[625]++; if(dbg){print "Z625"}; continue };

 };

 if ( z(0) && qxw(1,"в","котором который") ) {

   if ( bfa(3,7,"_gl_v_castle-iv") && s(3,bfn-1) &&
        qir(3,bfn-1,"mest_any mest_3e isname pre_any nar_any gl_aux_be mod_any") )
   { l[i]=omo1; Z[626]++; if(dbg){print "Z626"}; continue };
   if ( bfa(3,7,"_gl_v_castle-pr") && s(3,bfn-1) &&
        qir(3,bfn-1,"mest_any mest_3e isname pre_any nar_any gl_aux_be mod_any") )
   { l[i]=omo1; Z[627]++; if(dbg){print "Z627"}; continue };

 };


 }; # и_п_ и в_п_ замок замки
  ######################################################################################################

 ### замка замков р_п_
 if ( veq(Y["iwrd_case"],"ro") ) {
 #

    # _castle_environs
    if ( qb(-5,-1,"sz_iili") ) { qb_n=qbn; if ( bba(qb_n-5,qb_n-1,"_castle_environs") ) { bb_n=bbn;

       if ( vgl(qb_n,-5,-1) && veq(bb_n,qb_n-1) && s(bb_n,-1) &&
              q(bb_n,"suw_ro") &&
            qir(qb_n+1,-1,"prl_ro prq_ro mest_ro qast_any") )
       { l[i]=omo1; Z[628]++; if(dbg){print "Z628"}; continue };

    };};

    cst="ударить";
    if ( bw(-3,cst) &&
          w(-2,"по") &&
          q(-1,"suw_da") && ba(-1,"_hw_castle-ro") && s(-3,-1)  )
    { l[i]=omo2; Z[629]++; if(dbg){print "Z629"}; continue };


    cst="близ вблизи";
    if ( wb(-5,-1,cst) ) { wb_n=wbn;

       if ( vgl(wb_n,-5,-1) && s(wb_n,-1) &&
            qir(wb_n+1,-1,"prl_ro prq_ro mest_ro mest_3e isname") )
       { l[i]=omo1; Z[630]++; if(dbg){print "Z630"}; continue };

    };


    if ( TN_do_zamka_f() )
    { Z[631]++; if(dbg){print "Z631", "-- TN_do_zamka_f"}; continue };

    # _castle_prl:start
    if ( ba(-1,"_castle_prl") && prl_ro(-1) && s(-1)  )
    { l[i]=omo1; Z[632]++; if(dbg){print "Z632"}; continue };
    if ( ba(-2,"_castle_prl") && prl_ro(-2) &&
          q(-1,"prl_any prq_any mest_any qast") && s(-2,-1)  )
    { l[i]=omo1; Z[633]++; if(dbg){print "Z633"}; continue };
    if ( ba(1,"_castle_prl") && prl_ro(1) && s(0) )
    { l[i]=omo1; Z[634]++; if(dbg){print "Z634"}; continue };
    # _castle_prl:start

    # _lock_prl:start
    if ( ba(-1,"_lock_prl") && s(-1) && prl_ro(-1) )
    { l[i]=omo2; Z[635]++; if(dbg){print "Z635"}; continue };
    if ( ba(1,"_lock_prl") && s(0) && prl_ro(1) && !isname(1) )
    { l[i]=omo2; Z[636]++; if(dbg){print "Z636"}; continue };
    # _lock_prl:end

    # _castle_prl_geo:start
    if ( prl_ro(-1) &&
             ba(-1,"_castle_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[637]++; if(dbg){print "Z637"}; continue };
    if ( prl_ro(-2) &&
             ba(-2,"_castle_prl_geo") &&
              Q(-1,"suw_any") && s(-2,-1)  )
    { l[i]=omo1; Z[638]++; if(dbg){print "Z638"}; continue };
    # _castle_prl_geo:start

  }; # р_п_ замка замков
  ######################################################################################################

 ### замком замками дат_п_
 if ( veq(Y["iwrd_case"],"da") ) {
 #
  #
    # _castle_prl:start
    if ( ba(-1,"_castle_prl") && prl_da(-1) && s(-1)  )
    { l[i]=omo1; Z[639]++; if(dbg){print "Z639"}; continue };
    # _castle_prl:start

    # _lock_prl:start
    if ( ba(-1,"_lock_prl") && s(-1) && prl_da(-1) )
    { l[i]=omo2; Z[640]++; if(dbg){print "Z640"}; continue };
    if ( ba(1,"_lock_prl") && s(0) && prl_da(1) && !isname(1) )
    { l[i]=omo2; Z[641]++; if(dbg){print "Z641"}; continue };
    # _lock_prl:end

    # _castle_prl_geo:start
    if ( prl_da(-1) &&
             ba(-1,"_castle_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[642]++; if(dbg){print "Z642"}; continue };
    # _castle_prl_geo:start

  }; # дат_п_ замку замкам
  ######################################################################################################


 ### замком замками тв_п_
 if ( veq(Y["iwrd_case"],"tv") ) {
 #
    # _castle_environs
    if ( qb(-5,-1,"sz_iili") ) { qb_n=qbn; if ( bba(qb_n-5,qb_n-1,"_castle_environs") ) { bb_n=bbn;

       if ( vgl(qb_n,-5,-1) && veq(bb_n,qb_n-1) && s(bb_n,-1) &&
              q(bb_n,"suw_tv") &&
            qir(qb_n+1,-1,"prl_tv prq_tv mest_tv qast_any") )
       { l[i]=omo1; Z[643]++; if(dbg){print "Z643"}; continue };

    };};

 #
    # _castle_prl:start
    if ( ba(-1,"_castle_prl") && prl_tv(-1) && s(-1)  )
    { l[i]=omo1; Z[644]++; if(dbg){print "Z644"}; continue };
    if ( ba(-2,"_castle_prl") && prl_tv(-2) &&
          q(-1,"prl_any prq_any mest_any qast") && s(-2,-1)  )
    { l[i]=omo1; Z[645]++; if(dbg){print "Z645"}; continue };
    # _castle_prl:start

    # _lock_prl:start
    if ( ba(-1,"_lock_prl") && s(-1) && prl_tv(-1) )
    { l[i]=omo2; Z[646]++; if(dbg){print "Z646"}; continue };
    # _lock_prl:end

    # _castle_prl_geo:start
    if ( prl_tv(-1) &&
             ba(-1,"_castle_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[647]++; if(dbg){print "Z647"}; continue };
    # _castle_prl_geo:start

  }; # тв_п_ замком замками
  ######################################################################################################

 ### замке замках пр_п_
 if ( veq(Y["iwrd_case"],"pr") ) {
 #
    # _castle_environs
    if ( qb(-5,-1,"sz_iili") ) { qb_n=qbn; if ( bba(qb_n-5,qb_n-1,"_castle_environs") ) { bb_n=bbn;

       if ( vgl(qb_n,-5,-1) && veq(bb_n,qb_n-1) && s(bb_n,-1) &&
              q(bb_n,"suw_pr") &&
            qir(qb_n+1,-1,"prl_pr prq_pr mest_pr qast_any") )
       { l[i]=omo1; Z[648]++; if(dbg){print "Z648"}; continue };

    };};

  #
  # в замке
  if ( wb(-5,-1,"в во") && s(wbn,-1) ) {
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
  #
  if ( ba(tn-1,"_suw_v_castle-vp") && s(tn-1) )
  { l[i]=omo1; Z[649]++; if(dbg){print "Z649"}; continue };
  if ( ba(tn-2,"_suw_v_castle-vp") && s(tn-2,tn-1) &&
        q(tn-1,"prl_kred_sr nar_any mest_vi mest_3e prl_vi") )
  { l[i]=omo1; Z[650]++; if(dbg){print "Z650"}; continue };
  if ( bba(tn-6,tn-2,"_suw_v_castle-vp") &&
       qir(bbn+1,tn-2,"prl_ro prq_ro mcop_ro suw_ro") &&
         q(tn-1,"suw_ro mest_ro mest_3e qast nar_napr isname") && s(bbn,tn-1) )
  { l[i]=omo1; Z[651]++; if(dbg){print "Z651"}; continue };
  # _suw_v_castle-vp:end
  } # в замке

  }; # пр_п_ замке замках
  ######################################################################################################


 cst="[иох]уровнев[оы]";
 if ( wc(-1,cst) && s(-1) )
 { l[i]=omo1; Z[652]++; if(dbg){print "Z652"}; continue };


 # _lock_parts:start
 if ( bfa(1,5,"_lock_parts") ) { bf_n=bfn;

    if ( vgl(bf_n,1,5) && s(1,bf_n-1) && (s(0)||se(0," — ")) && bw(bf_n,"данное") )
    { bf_n=""; Z[653]++; if(dbg){print "Z653"}; };
    if ( vgl(bf_n,1,5) && s(1,bf_n-1) && (s(0)||se(0," — ")) && bw(bf_n-1,"визитный") )
    { bf_n=""; Z[654]++; if(dbg){print "Z654"}; };

    if ( vgl(bf_n,1,5) && s(1,bf_n-1) && (s(0)||se(0," — ")) && qf(1,bfn,"isname") )
    { bf_n=""; Z[655]++; if(dbg){print "Z655"}; };
    if ( vgl(bf_n,1,5) && s(1,bf_n-1) && (s(0)||se(0," — ")) && q(-1,"isname") && p(-2) )
    { bf_n=""; Z[656]++; if(dbg){print "Z656"}; };

    if ( vgl(bf_n,1,5) && s(1,bf_n-1) && (s(0)||se(0," — ")) &&
         qir(1,bf_n-1,"mod_any gl_in gl_aux_be gl_ed gl_mn nar_any prl_kred_sr prl_any mest_any qast_any") )
    { l[i]=omo2; Z[657]++; if(dbg){print "Z657"}; continue };

 };
 # _lock_parts:end

 # _castle_pe:start
 if ( z(0) && q(1,"prq_any") && ba(1,"_castle_pe") && s(1) && Q(1,"suw_any") )
 { l[i]=omo1; Z[658]++; if(dbg){print "Z658"}; continue };
 if ( z(0) &&
      q(1,"nar_spos prl_kred_sr") &&
      q(2,"prq_any") && ba(2,"_castle_pe") && s(1,2) && Q(-1,"suw_any") )
 { l[i]=omo1; Z[659]++; if(dbg){print "Z659"}; continue };
 if ( q(-3,"prq_any") && ba(-3,"_castle_pe") && Q(-3,"suw_any") &&
 pre_ro(-2) &&
      q(-1,"suw_ro") && s(-3,-1) )
 { l[i]=omo1; Z[660]++; if(dbg){print "Z660"}; continue };
 if ( q(-1,"prq_any") && ba(-1,"_castle_pe") && s(-1) && Q(-1,"suw_any") )
 { l[i]=omo1; Z[661]++; if(dbg){print "Z661"}; continue };
 # _castle_pe:end

 # _lock_pe:start
 if ( z(0) && q(1,"prq_any") && ba(1,"_lock_pe") && s(1) )
 { l[i]=omo2; Z[662]++; if(dbg){print "Z662"}; continue };
 if ( q(-1,"prq_any") && ba(-1,"_lock_pe") && s(-1) )
 { l[i]=omo2; Z[663]++; if(dbg){print "Z663"}; continue };
 # _lock_pe:end

 # _castle_v_suw-pr:start
 if ( wf(1,6,"в во") ) { wf_n=wfn; if ( wfa(wf_n+1,wf_n+4,"_castle_v_suw-pr") ) { bf_n=wfn;

    if ( vgl(wf_n,1,6) && vgl(bf_n,wf_n+1,wf_n+4) && zs(0) && s(1,bfn-1) &&
         qir(1,wf_n-1,"prl_any mest_any") &&
         qir(wf_n+1,bf_n-1,"prl_pr mest_pr mest_3e prq_pr") )
    { l[i]=omo1; Z[664]++; if(dbg){print "Z664"}; continue };

 };};

 if ( vgl(Y["n_pre_v_ist"],-6,-2) ) { wb_n=Y["n_pre_v_ist"];
   if ( wba(wb_n+1,-1,"_castle_v_suw-pr") ) { bb_n=wbn;
    # escape:start
    cst8="ключ";
    if ( vgl(wb_n,-6,-2) && vgl(bb_n,wb_n+1,-1) &&
           w(wb_n-1,cst8) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") && s(wb_n,bb_n-1) &&
         qia(bb_n+1,-1,"qast","prl_any mest_any nar_any suw_ro isname") && ds(bb_n) && s(bb_n+1,-1) )
    { l[i]=omo2; Z[665]++; if(dbg){print "Z665"}; continue };
    # escape:end

    if ( vgl(wb_n,-6,-2) && vgl(bb_n,wb_n+1,-1) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") && s(wb_n,bb_n-1) &&
         qia(bb_n+1,-1,"qast","prl_any mest_any nar_any suw_ro isname") && ds(bb_n) && s(bb_n+1,-1) )
    { l[i]=omo1; Z[666]++; if(dbg){print "Z666"}; continue };

 };};
 # _castle_v_suw-pr:end

 # похожий II
 cst="непохожий походить похожий";
 if ( qy(1,"gl_aux_be") &&
      bw(1+qyn,cst) && zs(0) &&
       w(2+qyn,"на") &&
     bfa(3+qyn,6+qyn,"_castlelike_things") &&
     qir(3+qyn,bfn-1,"prl_vi mest_vi mest_3e prq_vi") && s(1+qyn,bfn-1) )
 { l[i]=omo1; Z[667]++; if(dbg){print "Z667"}; continue };
 # похожий II

 if ( wf(1,4,"дома") && s(0,wfn-1) &&
     qir(1,wfn-1,"prl_ro mest_ro prq_ro") &&
    !wfa(1,wfn-1,"_lock_suw-ro") && Ww_(-1,"под") )
 { l[i]=omo1; Z[668]++; if(dbg){print "Z668"}; continue };

 # замок, где...
 cst="страницы";
 if ( w(1,"где") && z(0) &&
     wf(2,5,cst) && s(1,wfn-1) &&
    qir(2,wfn-1,"mod_any gl_aux_be gl_nein")  )
 { l[i]=omo2; Z[669]++; if(dbg){print "Z669"}; continue };

 if ( z(0) && w(1,"где") )
 { l[i]=omo1; Z[670]++; if(dbg){print "Z670"}; continue };
 if ( bba(-5,-2,"_castle_platz") && z(bbn) && s(bbn+1,-1) &&
        w(bbn+1,"где") &&
      qir(bbn+2,-1,"prl_vi mest_vi mest_3e")  )
 { l[i]=omo1; Z[671]++; if(dbg){print "Z671"}; continue };

 # цифры
 if ( vgl(Y["n_pre_v"],-7,-2) ) { wb_n=Y["n_pre_v"];

    if ( vgl(wb_n,-7,-3) && s(wb_n,-1) &&
      digits(wb_n+1) &&
          qy(wb_n+2,"digits") &&
           w(wb_n+2+qyn,"году годах") &&
         qir(wb_n+3+qyn,-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[672]++; if(dbg){print "Z672"}; continue };
    if ( vgl(wb_n,-7,-3) && s(wb_n,-1) &&
      digits(wb_n+1) &&
           w(wb_n+2,"м х") &&
           w(wb_n+3,"году годах") &&
       roman(wb_n+3) &&
           w(wb_n+4,"века") &&
         qir(wb_n+5,-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[673]++; if(dbg){print "Z673"}; continue };
    if ( vgl(wb_n,-6,-2) && s(wb_n+1,-1) &&
       roman(wb_n) &&
           w(wb_n+1,"веке веках") &&
         qir(wb_n+2,-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[674]++; if(dbg){print "Z674"}; continue };

 };

 if ( wb(-6,-2,"к") && s(wbn+1,-1) &&
   roman(wbn) &&
       w(wbn+1,"веку векам") &&
     qir(wbn+2,-1,"prl_vi mest_vi mest_3e") )
 { l[i]=omo1; Z[675]++; if(dbg){print "Z675"}; continue };
 if ( qb(-6,-2,"pre_ro") && s(qbn+1,-1) &&
   roman(qbn) &&
       w(qbn+1,"века веков") &&
     qir(qbn+2,-1,"prl_vi mest_vi mest_3e") )
 { l[i]=omo1; Z[676]++; if(dbg){print "Z676"}; continue };

 if ( FN_castle_prl_f("_castle_prl_after") )
 { Z[677]++; if(dbg){print "Z677", "-- FN_castle_prl_after_f"}; continue };

 if ( FN_lock_prl_true_f("_lock_prl_after") )
 { Z[678]++; if(dbg){print "Z678", "-- FN_lock_prl_true_f(\"_lock_prl_after\")"}; continue };


 # перенос назад
    if ( z(-1) && ba(-1,"_castle_environs") )
    { l[i]=omo1; Z[679]++; if(dbg){print "Z679"}; continue };
    if ( z(0) && ba(1,"_castle_environs") && Q(1,"isname") )
    { l[i]=omo1; Z[680]++; if(dbg){print "Z680"}; continue };
 # перенос назад


 # от обработки предыдущего в строке:start
 if ( gist(-4,2) &&
         w(-3,"не") &&
         q(-2,"gl_ed gl_mn gl_vzed gl_vzmn") && z(-2) &&
         w(-1,"а но и или") && s(0) )
 { l[i]=omo2; Z[681]++; if(dbg){print "Z681"}; continue };
 # от обработки предыдущего в строке:end

 if ( q(1,"isname") && s(0) ) {
      if ( wa(1,"_castle_isname_geo")||
           wa(1,"_castle_isname_geo_edro")||
           wa(1,"_castle_isname_geo_mnro") )
      { l[i]=omo1; Z[682]++; if(dbg){print "Z682"}; continue } else
      { l[i]=omo1; Z[683]++; if(dbg){print "Z683"}; continue };
 };

 if ( (qxs(1,"де","ла")||
       qxs(1,"фон","дер")) &&
    isname(xsn+1) && s(xsn) )
 { l[i]=omo1; Z[684]++; if(dbg){print "Z684"}; continue };

 if ( isname(2) && s(0) ) {
    if ( w(1,"де дю фон ди да дель ла ло ле лё ля") && s(1) )
    { l[i]=omo1; Z[685]++; if(dbg){print "Z685"}; continue };
    if ( w(1,"д л") && sc(1,"[\x27’]") )
    { l[i]=omo1; Z[686]++; if(dbg){print "Z686"}; continue };
    if ( w(1,"ал") && se(1,"-") )
    { l[i]=omo1; Z[687]++; if(dbg){print "Z687"}; continue };
    if ( q(1,"pre_vi pre_ro pre_pr") && s(1) &&
       !bb(-4,-1,"ключ ключик") )
    { l[i]=omo1; Z[688]++; if(dbg){print "Z688"}; continue };
 };

 if ( isname(-1) && ( (s(-2,-1) && sv(-2,"\x29"))||(z(-2) && s(-1)) ) )
 { l[i]=omo1; Z[689]++; if(dbg){print "Z689"}; continue };
 if ( isname(0) && s(-1) )
 { l[i]=omo1; Z[690]++; if(dbg){print "Z690", "-- is_CAP"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

} #main_end

function DEFINE_TN_OK_PREVI_ZAMOK(num,el,    fufu) { # определение компонентов между "pre_vi" и "замок"
    tn=tn_ok="";
    tn=num;
#   cst_muvi="prl_edmuvi prl_mnvi mcop_edmuvi mcop_mnvi qis_vi qik_vi prq_edmuvi prq_mnvi qast_any mest_3e nar_kaq nar_step";
    cst1_edmuvi="prl_edmuim mcop_edmuim qis_vi qik_vi prq_edmuim qast_any mest_3e nar_kaq nar_step";
    cst1_mnvi="prl_mnim mcop_mnim qis_vi qik_vi prq_mnvi qast_any mest_3e nar_kaq nar_step";
    cst2_edmuvi="prl_edmuim prq_edmuim";
    cst2_mnvi="prl_mnim prq_mnim";
    cst3_edmuvi="prl_edmuim mcop_edmuim qis_vi qik_vi prq_edmuim suw_ro suw_edne";
    cst3_mnvi="prl_mnim mcop_mnim qis_vi qik_vi prq_mnim suw_ro suw_edne";

    if ( w(0,"замок") )
    { cst1 = cst1_edmuvi; cst2 = cst2_edmuvi;  cst3 = cst3_edmuvi; };
    if ( w(0,"замки") )
    { cst1 = cst1_mnvi;   cst2 = cst2_mnvi;    cst3 = cst3_mnvi    };

    if ( hwy(-1,"то") && qir(tn+1,-1-hyn,cst1) && s(tn,-1) )
    { tn_ok = 1; Z[691]++; if(dbg){print "Z691", "-- tn_ok ON", el, "замок"};};
    if ( !vex(tn_ok) && s(tn,-1) &&
            q(tn+1,cst2) && wy(-1,"же") &&
          qir(tn+2,-1-wyn,"mest_da suw_da prq_da nar_any prl_da") )
    { tn_ok = 1; Z[692]++; if(dbg){print "Z692", "-- tn_ok ON", el, "замок"};};
    if ( !vex(tn_ok) && s(tn,-1) &&
            q(tn+1,cst2) &&
          qir(tn+2,-2,"mest_tv prq_tv qik_tv nar_any prl_tv") &&
            q(-1,"suw_tv mest_tv") )
    { tn_ok = 1; Z[693]++; if(dbg){print "Z693", "-- tn_ok ON", el, "замок"};};
    if ( !vex(tn_ok) && s(tn,-1) &&
            q(tn+1,cst2) &&
          qir(tn+2,-3,"mest_tv prq_tv qik_tv nar_any prl_tv") &&
            q(-2,"suw_tv qik_tv") &&
            q(-1,cst3) )
    { tn_ok = 1; Z[694]++; if(dbg){print "Z694", "-- tn_ok ON", el, "замок"};};
    if ( !vex(tn_ok) && s(tn,-1) &&
            q(tn+1,cst2) &&
            q(tn+2,"pre_vi") &&
          qir(tn+3,-2,"prl_vi mest_vi mest_3e") &&
            q(-1,"mest_vip3e suw_vi") )
    { tn_ok = 1; Z[695]++; if(dbg){print "Z695", "-- tn_ok ON", el, "замок"};};
    if ( !vex(tn_ok) && s(tn,-1) &&
            q(tn+1,cst2) &&
            q(tn+2,"pre_tv") &&
          qir(tn+3,-2,"prl_tv mest_tv mest_3e") &&
            q(-1,"suw_tv") )
    { tn_ok = 1; Z[696]++; if(dbg){print "Z696", "-- tn_ok ON", el, "замок"};};
    cst="именно собственно";
    if ( !vex(tn_ok) && s(tn,-1) && qiw(tn+1,-1,cst1,cst) )
    { tn_ok = 1; Z[697]++; if(dbg){print "Z697", "-- tn_ok ON", el, "замок"};};
    if ( !vex(tn_ok) && s(-4) && zs(-3) && s(-2,-1) && veq(tn,-4) &&
            q(-3,cst2) && q(-2,"nar_any prl_kred_sr") && q(-1,cst2) )
    { tn_ok = 1; Z[698]++; if(dbg){print "Z698", "-- tn_ok ON", el, "замок"};};
    if ( !vex(tn_ok) && s(tn,-1) && veq(tn,-2) && wc(-1,"ский$|ный$") )
    { tn_ok = 1; Z[699]++; if(dbg){print "Z699", "-- tn_ok ON", el, "замок"};};
    if ( !vex(tn_ok) && zs(-2) && s(-1) && veq(tn,-3) &&
            q(-2,cst2) && wc(-1,"ский$|ный$") )
    { tn_ok = 1; Z[700]++; if(dbg){print "Z700", "-- tn_ok ON", el, "замок"};};
    if ( !vex(tn_ok) && s(tn,-1) && veq(tn,-4) &&
            q(-3,cst2) && q(-2,"sz_iili") && wc(-1,"ский$|ный$") )
    { tn_ok = 1; Z[701]++; if(dbg){print "Z701", "-- tn_ok ON", el, "замок"};};
#   if ( !vex(tn_ok) && s(tn-1,-1) && veq(tn,-3) &&
#           q(-2,"prq_vi") && q(-1,"suw_vi") )
#   { tn_ok=fufu=1; Z[702]++; if(dbg){print "Z702", "-- tn_ok ON", el, "замок"};};
#   if ( !vex(tn_ok) && s(tn-1,-1) && veq(tn,-4) &&
#           q(-3,"prq_vi") && q(-2,"suw_vi") && q(-1,"prl_vi mest_vi") )
#   { tn_ok=fufu=1; Z[703]++; if(dbg){print "Z703", "-- tn_ok ON", el, "замок"};};
    # передвижка tn_ok
    if ( vex(tn_ok) && s(tn,-1) &&
       ( qxs(tn-1,"как","и")||
         qxs(tn-1,"да","еще","и")||
         qxs(tn-1,"ведь даже же прямо сразу") ) )
    { tn = xsn; Z[704]++; if(dbg){print "Z704", "-- tn_ok MOV", el, "замок"};};
    # выключение tn_ok
    if ( vex(tn_ok) && !vex(fufu) && s(tn,-1) && qf(tn+1,-1,"prq_edmuvi prq_mnvi") &&
         bam(qfn,"_castle_pe _lock_pe") &&
           q(1,"suw_edmuvi suw_mnvi suw_edne") && s(0) )
    { tn_ok = ""; Z[705]++; if(dbg){print "Z705", "-- tn_ok OFF", el, "замок"};};
    if ( vex(tn_ok) && !vex(fufu) && s(tn,-1) &&
         qxs(-1,"прошлый тот этот","раз") )
    { tn_ok = ""; Z[706]++; if(dbg){print "Z706", "-- tn_ok OFF", el, "замок"};};
}

function TN_v_zamok_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n) { stopp=v2s(Y["TN_v_zamok_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_v"]) ) { tn=Y["n_pre_v"];

#   if ( bba(tn-9,tn-1,"_gl_v_castle-iv") ) { Y["n-_gl_v_castle-iv"] = bbn };
#   if ( bba(tn-9,tn-1,"_gl_v_lock-iv")   ) { Y["n-_gl_v_lock-iv"]   = bbn };

    # point escape:одиночные исключения
    if ( qxs(1,"несколько","раз","без","толку","стреляли") )
    { l[i]=omo2; Z[707]++; if(dbg){print "Z707"}; stopp=ret=1; continue };

    cst="поставить";
    cst1="гарнизон конь";
    if ( bw(tn-1,cst) &&
         bw(1,cst1) && s(tn-1) )
    { l[i]=omo1; Z[708]++; if(dbg){print "Z708"}; stopp=ret=1; continue };

    cst="переходить";
    cst2="ствол";
    if ( bb(tn-4,tn-2,cst2) &&
         bw(tn-1,cst) && s(bbn,tn-1) )
    { l[i]=omo2; Z[709]++; if(dbg){print "Z709"}; stopp=ret=1; continue };

    if ( qxs(tn-1,"ни не") && z(0) && s(tn-1) &&
        (qxw(1,"а но","не","в")||
         qxw(1,"а но ни не","в")) &&
         bfa(xwn+1,xwn+5,"_castle_environs") &&
         qir(xwn+1,bfn-1,cst_muvi) && s(xwn,bfn-1) )
    { l[i]=omo1; Z[710]++; if(dbg){print "Z710"}; stopp=ret=1; continue };
    if ( qxw(tn-3,"ни не","в") &&
          ba(tn-2,"_castle_environs") && z(tn-2) &&
         qxs(tn-1,"а но ни не") )
    { l[i]=omo1; Z[711]++; if(dbg){print "Z711"}; stopp=ret=1; continue };
    if ( wb(tn-5,tn-2,"через сквозь") &&
        qir(wbn+1,tn-2,"prl_vi mest_vi mest_3e prq_vi") &&
         ba(tn-1,"_castle_environs") && zs(tn-1) && s(wbn,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[712]++; if(dbg){print "Z712"}; stopp=ret=1; continue };

    cst="совать";
    if ( bb(tn-4,tn-2,cst) &&
        qir(bbn+1,tn-2,"prl_edmuvi mest_edmuvi mest_3e") &&
          w(tn-1,"нос") && s(bbn,tn-1) )
    { l[i]=omo1; Z[713]++; if(dbg){print "Z713"}; stopp=ret=1; continue };
    if ( bw(1,cst) &&
         wf(2,5,"нос") &&
        qir(wfn+1,wfn-1,"prl_edmuvi mest_edmuvi mest_3e") && s(1,wfn-1) )
    { l[i]=omo1; Z[714]++; if(dbg){print "Z714"}; stopp=ret=1; continue };

    cst="захватить";
    if ( bb(tn-6,tn-3,cst) &&
        qir(bbn+1,tn-3,"suw_vi mest_vi mest_3e") &&
          w(tn-2,"с") &&
          q(tn-1,"mest_tv") && s(bbn,tn-1) )
    { l[i]=omo1; Z[715]++; if(dbg){print "Z715"}; stopp=ret=1; continue };

    if ( qxs(tn-1,"по","возвращению приезду прибытию") )
    { l[i]=omo1; Z[716]++; if(dbg){print "Z716"}; stopp=ret=1; continue };
    if ( qxs(tn-2,"в","одной","руке") &&
           q(tn-1,"suw_vi") &&
          zs(tn-1) )
    { l[i]=omo2; Z[717]++; if(dbg){print "Z717"}; stopp=ret=1; continue };

    if ( q(tn-1,"mest_im mest_vi mest_3e suw_odim suw_odvi") && Q(tn-1,"gl_po") &&
         p(tn-2) && p(0) && s(tn-1,-1) )
    { l[i]=omo1; Z[718]++; if(dbg){print "Z718"}; stopp=ret=1; continue };
    if ( q(tn-2,"mest_im mest_vi mest_3e suw_odim suw_odvi") && Q(tn-2,"gl_po") &&
         q(tn-1,"nar_any prl_kred_sr") &&
         p(tn-3) && p(0) && s(tn-2,-1) )
    { l[i]=omo1; Z[719]++; if(dbg){print "Z719"}; stopp=ret=1; continue };
    if ( q(tn-2,"nar_any prl_kred_sr") &&
         q(tn-1,"mest_im mest_vi mest_3e suw_odim suw_odvi") && Q(tn-1,"gl_po") &&
         p(tn-3) && p(0) && s(tn-2,-1) )
    { l[i]=omo1; Z[720]++; if(dbg){print "Z720"}; stopp=ret=1; continue };

    cst1="брать взять завести заключить захватить свести сводить собрать";
    cst2="голень голова грудь живот колено ладонь ладошка лодыжка локоть ляжка нога ножка палец пальчик плечо поясница рука ручка стопа талия туловище шея";
    cst3="взмахом движением";
    if ( bb(tn-3,tn-1,cst1) ) { bb_n=bbn;
       if ( veq(bb_n,tn-1) && bb(tn-4,tn-2,cst2) && s(bbn,tn-1) &&
           !( w(bbn,"руки руках руками") && (w(bbn-1,"на за под в с") || vgl(Y["n-_gl_v_castle-iv"],bbn-4,bbn-2)) && s(Y["n-_gl_v_castle-iv"],bbn-1)) )
       { l[i]=omo2; Z[721]++; if(dbg){print "Z721"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-4,tn-1) && s(bbn,tn-1) &&
            qir(bb_n+1,tn-2,"prl_vi mcop_vi prq_vi") &&
             bw(tn-1,cst2) )
       { l[i]=omo2; Z[722]++; if(dbg){print "Z722"}; stopp=ret=1; continue };
       if ( veq(bb_n,tn-3) && s(tn-3,tn-1) &&
             bw(tn-2,cst2) &&
              q(tn-1,"suw_ro suw_edne isname") )
       { l[i]=omo2; Z[723]++; if(dbg){print "Z723"}; stopp=ret=1; continue };
       if ( veq(bb_n,tn-2) && s(tn-3,tn-1) &&
              w(tn-3,cst3) &&
              q(tn-1,"isname suw_vi") )
       { l[i]=omo2; Z[724]++; if(dbg){print "Z724"}; stopp=ret=1; continue };

    };
       if ( bw(tn-1,cst2) && se(tn-1, " — ") && p(0) )
       { l[i]=omo2; Z[725]++; if(dbg){print "Z725"}; stopp=ret=1; continue };

    if ( bw(tn-1,cst1) &&
         bf(1,3,cst2) && s(tn-1,bfn-1) )
    { l[i]=omo2; Z[726]++; if(dbg){print "Z726"}; stopp=ret=1; continue };

    cst="захват обхват";
    if ( bw(tn-2,cst) &&
         bw(tn-1,cst2) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[727]++; if(dbg){print "Z727"}; stopp=ret=1; continue };
    if ( bw(tn-5,cst) &&
         bw(tn-4,cst2) &&
          q(tn-3,"suw_ro suw_edne isname") &&
          q(tn-2,"prl_tv mest_tv mest_3e prq_tv qis_tv qik_tv") &&
          q(tn-1,"suw_tv") && s(tn-5,tn-1) )
    { l[i]=omo2; Z[728]++; if(dbg){print "Z728"}; stopp=ret=1; continue };
    if ( bw(tn-1,cst) && s(tn-1) )
    { l[i]=omo2; Z[729]++; if(dbg){print "Z729"}; stopp=ret=1; continue };

    # в ... «замок» в кавычках
    if ( bw(tn-2,cst1) &&
          q(tn-1,"isname suw_vi") &&
         sc(-1,"[\x22«]") && sc(0,"[\x22»]") && s(tn-2,tn-1) )
    { l[i]=omo2; Z[730]++; if(dbg){print "Z730"}; stopp=ret=1; continue };
    if ( bw(tn-1,cst2) &&
         sc(tn-1,"[\x22«]") && sc(0,"[\x22»]") && s(tn-1) )
    { l[i]=omo2; Z[731]++; if(dbg){print "Z731"}; stopp=ret=1; continue };
    if ( bw(tn-2,cst2) &&
          q(tn-1,"qast_any") &&
         sc(tn-1,"[\x22«]") && sc(0,"[\x22»]") && s(tn-2,tn-1) )
    { l[i]=omo2; Z[732]++; if(dbg){print "Z732"}; stopp=ret=1; continue };

    if ( bw(tn-1,cst2) &&
          w(1,"за на") &&
         bw(2,cst2) && s(tn-1,1) )
    { l[i]=omo2; Z[733]++; if(dbg){print "Z733"}; stopp=ret=1; continue };

    cst="впустить выпустить послать";
    cst1="дым поток";
    if ( bw(tn-3,cst) &&
          w(tn-2,cst1) &&
          q(tn-1,"suw_ro") && s(tn-3,tn-1) )
    { l[i]=omo2; Z[734]++; if(dbg){print "Z734"}; stopp=ret=1; continue }; #edit
    if ( bb(tn-9,tn-3,cst) &&
          w(bbn+1,cst1) &&
          q(bbn+2,"pre_tv") &&
        qir(tn+3,tn-1,"suw_tv prl_tv mest_tv prq_tv isname qast nar_any") && s(bbn,tn-2) && zs(tn-1) )
    { l[i]=omo2; Z[735]++; if(dbg){print "Z735"}; stopp=ret=1; continue }; #edit


    cst="вбить запихать запихнуть засунуть сунуть";
    if ( bb(tn-4,tn-1,cst) && s(bbn,1) &&
          w(1,"к ко") &&
          q(2,"suw_odedda suw_odmnda isname") )
    { l[i]=omo1; Z[736]++; if(dbg){print "Z736"}; stopp=ret=1; continue };
    if ( bb(tn-4,tn-2,cst) && s(bbn,-1) &&
         (q(tn-1,"suw_odedvi suw_odmnvi isname")||w(tn-1,"меня тебя вас нас всех")) )
    { l[i]=omo1; Z[737]++; if(dbg){print "Z737"}; stopp=ret=1; continue };

    cst3="армия войско отряд";
    if ( bb(tn-4,tn-1,cst) &&
         bw(bbn-1,cst3) && s(bbn-1,tn-1) )
    { l[i]=omo1; Z[738]++; if(dbg){print "Z738"}; stopp=ret=1; continue };

    cst1="вкладывать вложить";
    cst2="деньги доллар золото магия работа серебро сила средство труд усилие";
    if ( bb(tn-5,tn-2,cst2) && s(bbn,tn-1) &&
         bw(tn-1,cst1) )
    { l[i]=omo1; Z[739]++; if(dbg){print "Z739"}; stopp=ret=1; continue };
    if ( bb(tn-5,tn-2,cst1) && s(bbn,tn-1) &&
         bw(tn-1,cst2) )
    { l[i]=omo1; Z[740]++; if(dbg){print "Z740"}; stopp=ret=1; continue };
    if ( bw(tn-2,cst2) && z(tn-2) &&
         bw(tn-1,cst1) && s(tn-1) )
    { l[i]=omo1; Z[741]++; if(dbg){print "Z741"}; stopp=ret=1; continue };
    if ( bf(1,4,cst1) &&
         bf(bfn+1,bfn+4,cst2) && s(0,bfn-1) )
    { l[i]=omo1; Z[742]++; if(dbg){print "Z742"}; stopp=ret=1; continue };

    # _suw_v_castle-vp:start
    # escape
    if ( ba(tn-3,"_suw_v_lock") &&
          w(tn-2,"с") &&
          q(tn-1,"suw_tv") && s(tn-3,tn-1) )
    { l[i]=omo2; Z[743]++; if(dbg){print "Z743"}; stopp=ret=1; continue };
    cst="ключ";
    if ( ba(tn-2,"_suw_v_castle-vp") &&
         bw(tn-1,cst) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[744]++; if(dbg){print "Z744"}; stopp=ret=1; continue };
    cst="ключ пропуск";
    if ( ba(tn-2,"_gl_v_lock-iv") &&
         bw(tn-1,cst) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[745]++; if(dbg){print "Z745"}; stopp=ret=1; continue };

    #
    if ( ba(tn-1,"_suw_v_castle-vp") && s(tn-1) )
    { l[i]=omo1; Z[746]++; if(dbg){print "Z746"}; stopp=ret=1; continue };
    if ( vvb(tn-5,tn-1) && ba(vvn,"_suw_v_castle-vp") )
    { l[i]=omo1; Z[747]++; if(dbg){print "Z747"}; stopp=ret=1; continue };
    if ( ba(tn-2,"_suw_v_castle-vp")  && s(tn-2) &&
          q(tn-1,"prl_kred_sr nar_any") && zs(tn-1) )
    { l[i]=omo1; Z[748]++; if(dbg){print "Z748"}; stopp=ret=1; continue };
    if ( bba(tn-6,tn-2,"_suw_v_castle-vp") &&
         qir(bbn+1,tn-2,"prl_ro prq_ro mcop_ro suw_ro") &&
           q(tn-1,"suw_ro mest_ro mest_3e qast nar_napr isname") && s(bbn,tn-1) )
    { l[i]=omo1; Z[749]++; if(dbg){print "Z749"}; stopp=ret=1; continue };

    cst="без для из с";
    if ( bba(tn-6,tn-3,"_suw_v_castle-vp") &&
           w(bbn+1,cst) &&
         qir(bbn+2,tn-1,"suw_ro prl_ro prq_ro mest_ro mest_3e isname") && s(bbn,tn-1) )
    { l[i]=omo1; Z[750]++; if(dbg){print "Z750"}; stopp=ret=1; continue };
    if ( ba(tn-1,"_suw_v_castle-vp") && se(tn-1," — ") )
    { l[i]=omo1; Z[751]++; if(dbg){print "Z751"}; stopp=ret=1; continue };
    cst="начаться начинаться";
    if ( bw(1,cst) &&
         ba(2,"_suw_v_castle-vp") && s(0,1) )
    { l[i]=omo1; Z[752]++; if(dbg){print "Z752"}; stopp=ret=1; continue };
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
    { l[i]=omo2; Z[753]++; if(dbg){print "Z753"}; stopp=ret=1; continue };
    if ( (qxs(tn-1,"за на",cst2) ||
          qxs(tn-1,"за на",cst1,cst2) ||
          qxs(tn-1,"за над",cst4) ||
          qxs(tn-1,"за над",cst3,cst4) ||
          qxs(tn-1,"на",cst6) ||
          qxs(tn-1,"на",cst5,cst6) ) &&
           bw(xsn-1,cst) && s(tn-1) )
    { l[i]=omo2; Z[754]++; if(dbg){print "Z754"}; stopp=ret=1; continue };
    if ( bw(tn-1,cst) && s(tn-1) &&
       (qxs(1,"за на",cst2) ||
        qxs(1,"за на",cst1,cst2) ||
        qxs(1,"за над",cst4) ||
        qxs(1,"за над",cst3,cst4) ||
        qxs(1,"на",cst6) ||
        qxs(1,"на",cst5,cst6) ) )
    { l[i]=omo2; Z[755]++; if(dbg){print "Z755"}; stopp=ret=1; continue };
    if ( p(-3) && bw(-2,cst) && tn == -1 && (p(0)||sz_iili(1)) )
    { l[i]=omo2; Z[756]++; if(dbg){print "Z756"}; stopp=ret=1; continue };

    cst="рука";
    cst1="ладонями пальцами";
    if ( bw(tn-1,cst) && s(tn-1,0) && w(1,cst1) )
    { l[i]=omo2; Z[757]++; if(dbg){print "Z757"}; stopp=ret=1; continue };

    cst="дороги хода ходу";
    if ( hwy(1,"то") && qy(1+hyn,"mest_da suw_da isname prq_da") &&
        (qxs(1+qyn+hyn,cst,"нет") ||
         qxs(1+qyn+hyn,"нет",cst) ||
         qxs(1+qyn+hyn,"какими","судьбами") ) && s(0+hyn) )
    { l[i]=omo1; Z[758]++; if(dbg){print "Z758"}; stopp=ret=1; continue };
    if ( qxs(tn-1,cst,"нет") ||
         qxs(tn-1,"нет",cst) ||
         qxs(tn-1,"какими","судьбами") ||
         qxs(tn-1,"ни","ногой") )
    { l[i]=omo1; Z[759]++; if(dbg){print "Z759"}; stopp=ret=1; continue };

    if ( qxs(1,"больше более","ни","ногой")||
         qxs(1,"ни","ногой")||
           w(1,"ни-ни") )
    { l[i]=omo1; Z[760]++; if(dbg){print "Z760"}; stopp=ret=1; continue };
    # _suw_v_lock:start
    if ( ba(tn-1,"_suw_v_lock") && s(tn-1) )
    { l[i]=omo2; Z[761]++; if(dbg){print "Z761"}; stopp=ret=1; continue };
    if ( vvb(tn-5,tn-1) &&
          ba(vvn,"_suw_v_lock") )
    { l[i]=omo2; Z[762]++; if(dbg){print "Z762"}; stopp=ret=1; continue };
    if ( bba(tn-6,tn-2,"_suw_v_lock") &&
         qir(bbn+1,tn-2,"prl_ro prq_ro mcop_ro") &&
           q(tn-1,"suw_ro mest_ro mest_3e isname qast") && s(bbn,tn-1) )
    { l[i]=omo2; Z[763]++; if(dbg){print "Z763"}; stopp=ret=1; continue };
    if ( vvb(tn-5,tn-1) &&
         bba(vvn-6,vvn-1,"_suw_v_lock") &&
         qir(vvn+1,vvn-1,"prl_ro prq_ro mcop_ro") &&
           q(vvn,"suw_ro mest_ro mest_3e isname qast") && s(bbn,vvn-1) )
    { l[i]=omo2; Z[764]++; if(dbg){print "Z764"}; stopp=ret=1; continue };
    if ( ba(tn-3,"_suw_v_lock") &&
     pre_vi(tn-2) &&
          q(tn-1,"suw_vi") && s(tn-3,tn-1) )
    { l[i]=omo2; Z[765]++; if(dbg){print "Z765"}; stopp=ret=1; continue };
    # _suw_v_lock:end

    cst="скользнуть";
    cst1="змеем змейкой";
    cst2="первый";
    cst3="воздух пространство";
    if ( w(tn-2,cst1) &&
        bw(tn-1,cst) && s(tn-2,tn-1) )
    { l[i]=omo1; Z[766]++; if(dbg){print "Z766"}; stopp=ret=1; continue };
    if ( bw(tn-2,cst2) &&
         bw(tn-1,cst) && s(tn-2,tn-1) )
    { l[i]=omo1; Z[767]++; if(dbg){print "Z767"}; stopp=ret=1; continue };
    if ( qb(tn-9,tn-3,"mest_impe suw_odim") &&
         bw(tn-2,cst) &&
          q(tn-1,"nar_napr") && s(qbn,tn-1) )
    { l[i]=omo1; Z[768]++; if(dbg){print "Z768"}; stopp=ret=1; continue };
    if ( qb(tn-7,tn-3,"gl_ed gl_mn") &&
    sz_iili(tn-2) &&
         bw(tn-1,cst) && s(qbn,tn-1) )
    { l[i]=omo1; Z[769]++; if(dbg){print "Z769"}; stopp=ret=1; continue };
    if ( bb(-7,-4,cst) &&
     pre_vi(bbn+1) &&
        qir(bbn+2,tn-2,"prl_vi prq_vi mcop_vi") &&
         bw(tn-1,cst3) && s(bbn,tn-1) )
    { l[i]=omo1; Z[770]++; if(dbg){print "Z770"}; stopp=ret=1; continue };

    cst="затолкать";
    if ( w(tn-3,"тебя меня вас нас") &&
        bw(tn-2,cst) &&
         q(tn-1,"nar_napr") && s(tn-3,tn-1) )
    { l[i]=omo1; Z[771]++; if(dbg){print "Z771"}; stopp=ret=1; continue };

    # _gl_v_lock-iv:start
    # поиск по _gl_v_lock-iv
    if ( vgl(Y["n-_gl_v_lock-iv"],tn-9,tn-1) ) { bb_n=Y["n-_gl_v_lock-iv"];
         # pointesque
         if ( w(1,"бренау") && isname(1) && s(0) )
         { l[i]=omo1; Z[772]++; if(dbg){print "Z772"}; stopp=ret=1; continue };
         # pointesque

       cst0="шепчущего";
       if ( veq(bb_n,tn-1) && s(tn-2,tn-1) &&
              q(tn-1,"prq_vi") && (q(tn-1,"suw_odedvi suw_odmnvi")||w(tn-1,cst0) ) )
       { bb_n=""; Z[773]++; if(dbg){print "Z773"}; };

       if ( veq(bb_n,tn-1) && s(tn-1) )
       { l[i]=omo2; Z[774]++; if(dbg){print "Z774"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-2) &&
            qir(bb_n+1,tn-2,"prl_vi prq_vi mcop_vi qik_vi qis_vi prl_kred_sr nar_any isname qast_any") &&
              q(tn-1,"suw_vi qast_any") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[775]++; if(dbg){print "Z775"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-3) && s(bb_n,tn-3) &&
            qir(bb_n+1,tn-3,"prl_vi prq_vi mcop_vi qik_vi qis_vi prl_kred_sr nar_any isname qast_any") &&
              q(tn-2,"suw_vi qast_any") && zs(tn-2) && s(tn-1) &&
              q(tn-1,"sz") )
       { l[i]=omo2; Z[776]++; if(dbg){print "Z776"}; stopp=ret=1; continue }; #check
       if ( vgl(bb_n,tn-7,tn-3) &&
            qir(bb_n+1,tn-3,"prl_vi prq_vi mest_vi mest_3e prl_kred_sr nar_step isname") &&
              q(tn-2,"suw_vi") &&
              q(tn-1,"suw_ro") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[777]++; if(dbg){print "Z777"}; stopp=ret=1; continue };
       if ( veq(bb_n,tn-4) &&
              q(tn-3,"suw_vi suw_im mest_im mest_vi suw_tv qast isname") &&
              q(tn-2,"suw_vi suw_tv") &&
              q(tn-1,"suw_ro") && s(tn-4,tn-1) && Qf(tn-3,tn-1,"sz_iili pre_any"))
       { l[i]=omo2; Z[778]++; if(dbg){print "Z778"}; stopp=ret=1; continue }; #inspect
       if ( vgl(bb_n,tn-6,tn-2) &&
              q(bb_n+1,"suw_vi suw_edne") &&
            qir(bb_n+2,tn-2,"prl_ro prq_ro mcop_ro qis_ro qik_ro qik_vi suw_ro suw_edne isname") &&
              q(tn-1,"suw_ro suw_edne isname") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[779]++; if(dbg){print "Z779"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-3) &&
              q(bb_n+1,"suw_vi") &&
            qir(bb_n+2,tn-3,"prl_ro prq_ro mcop_ro qis_ro qik_ro suw_ro suw_edne isname") &&
              q(tn-2,"suw_ro isname") &&
              q(tn-1,"mest_ro suw_ro") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[780]++; if(dbg){print "Z780"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-2) &&
            qir(bb_n+1,tn-2,"prl_tv prq_tv mest_tv mcop_tv mest_vi qik_tv qis_tv prl_vi prq_vi mest_3e qik_vi qis_vi suw_vi") &&
              q(tn-1,"suw_tv") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[781]++; if(dbg){print "Z781"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-9,tn-3) &&
            qir(bb_n+1,tn-2,"prl_tv prq_tv mest_tv mest_vi qik_tv qis_tv prl_vi prq_vi mest_3e qik_vi qis_vi suw_tv") &&
              q(tn-1,"suw_vi") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[782]++; if(dbg){print "Z782"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-5) && s(bb_n) &&
              q(bb_n+1,"prl_vi prq_vi") && z(bb_n+1) &&
              q(bb_n+2,"prq_vi") &&
            qir(bb_n+3,tn-3,"mest_tv prl_tv prq_tv mest_3e qik_tv qis_tv") &&
              q(tn-2,"suw_tv") &&
              q(tn-1,"suw_vi") && s(bb_n+2,tn-1) )
       { l[i]=omo2; Z[783]++; if(dbg){print "Z783"}; stopp=ret=1; continue };
       if ( veq(bb_n,tn-3) &&
              q(tn-2,"suw_vi suw_im mest_im mest_vi suw_tv mest_tv qast isname") &&
              q(tn-1,"suw_vi suw_tv qast nar_any") && s(tn-3,tn-1) )
       { l[i]=omo2; Z[784]++; if(dbg){print "Z784"}; stopp=ret=1; continue }; #inspect
       if ( veq(bb_n,tn-2) &&
              q(tn-1,"mest_vi mest_tv mest_im mest_3e prl_vi") && s(tn-2,tn-1) )
       { l[i]=omo2; Z[785]++; if(dbg){print "Z785"}; stopp=ret=1; continue };
       if ( veq(bb_n,tn-3) &&
              q(tn-2,"prl_srav prl_kred_sr nar_spos") && Q(tn-2,"pre_vi") &&
              q(tn-1,"suw_vi mest_vi suw_im mest_im mest_3e prl_kred_sr prl_srav isname nar_mest") && s(tn-3,tn-1) )
       { l[i]=omo2; Z[786]++; if(dbg){print "Z786"}; stopp=ret=1; continue };
       if ( veq(bb_n,tn-2) &&
              q(tn-1,"suw_im prl_kred_sr prl_srav isname nar_mest qis_vi") && s(tn-2,tn-1) )
       { l[i]=omo2; Z[787]++; if(dbg){print "Z787"}; stopp=ret=1; continue };
    };

    if ( vvb(tn-5,tn-1) && bba(vvn-6,vvn-1,"_gl_v_lock-iv") &&
         qir(bbn+1,vvn-1,"prl_vi prq_vi mcop_vi qik_vi qis_vi prl_kred_sr nar_any isname") &&
           q(vvn,"suw_vi") && s(bb_n,vvn-1) )
    { l[i]=omo2; Z[788]++; if(dbg){print "Z788"}; stopp=ret=1; continue };

    # поиск по pre_vi + _gl_v_lock-iv: qb_n и bb_n
    if ( qb(tn-8,tn-2,"pre_vi") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_v_lock-iv") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-8,tn-3) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi mest_vi mest_3e prq_vi") &&
              q(qb_n+1,"suw_vi mest_vi mcop_vi") &&
            qir(qb_n+2,tn-2,"prl_tv prq_tv mest_tv qik_tv qis_tv") &&
              q(tn-1,"suw_tv") )
       { l[i]=omo2; Z[789]++; if(dbg){print "Z789"}; stopp=ret=1; continue };


       if ( qb(qb_n+1,tn-1,"prq_vi") && ba(qbn,"_gl_v_castle-iv") )
       { qb_n=bb_n=""; l[i]=omo2; Z[790]++; if(dbg){print "Z790"}; };
       if ( vgl(qb_n,tn-8,tn-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi mest_vi mest_3e prq_vi") &&
            qir(qb_n+1,tn-1,"suw_vi suw_ro prl_vi mest_vi prq_vi qis_vi qik_vi") )
       { l[i]=omo2; Z[791]++; if(dbg){print "Z791"}; stopp=ret=1; continue };

    };};

    # поиск по pre_tv + _gl_v_lock-iv: qb_n и bb_n
    if ( qb(tn-8,tn-2,"pre_tv") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_v_lock-iv") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-8,tn-2) && veq(bb_n,qb_n-1) &&
            qir(qb_n+1,tn-2,"prl_tv mest_tv mest_3e prq_tv qis_tv qik_tv") &&
              q(tn-1,"suw_tv mest_tv") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[792]++; if(dbg){print "Z792"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-8,tn-3) && veq(bb_n,qb_n-1) &&
            qir(qb_n+1,tn-3,"prl_tv mest_tv mest_3e prq_tv qis_tv qik_tv") &&
              q(tn-2,"suw_tv mest_tv") &&
              q(tn-1,"suw_vi") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[793]++; if(dbg){print "Z793"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-8,tn-4) && veq(bb_n,qb_n-1) &&
            qir(qb_n+1,tn-4,"prl_tv mest_tv prq_tv qis_tv qik_tv") &&
              q(tn-3,"suw_tv mest_tv") &&
              q(tn-2,"prl_vi mcop_vi prq_vi") &&
              q(tn-1,"suw_vi") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[794]++; if(dbg){print "Z794"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-8,tn-2) && vgl(bb_n,qbn-5,qbn-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi mest_vi mest_3e prq_vi prl_kred_sr") &&
            qir(qb_n+1,tn-1,"prl_tv mest_tv prq_tv qis_tv qik_tv suw_tv isname") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[795]++; if(dbg){print "Z795"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-8,tn-3) && vgl(bb_n,qb_n-5,qb_n-2) &&
            qir(bb_n+1,qb_n-2,"prl_im prl_vi mest_im mest_vi mest_3e prq_im prq_vi prl_kred_sr") &&
              q(qb_n-1,"suw_vi suw_im mest_im mest_vi mest_3e prq_vi prl_kred_sr") &&
            qir(qb_n+1,tn-3,"prl_tv mest_tv prq_tv qis_tv qik_tv") &&
              q(tn-2,"suw_tv mest_tv") &&
              q(tn-1,"suw_vi isname") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[796]++; if(dbg){print "Z796"}; stopp=ret=1; continue };

    };};

    # поиск по pre_ro + _gl_v_lock-iv: qb_n и bb_n
    if ( qb(tn-8,tn-2,"pre_ro") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_v_lock-iv") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-8,tn-2) && vgl(bb_n,qbn-5,qbn-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi mcop_vi prq_vi qis_vi qik_vi qast") &&
            qir(qb_n+1,tn-1,"suw_ro prl_ro mest_ro prq_ro qis_ro qik_ro isname") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[797]++; if(dbg){print "Z797"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-8,tn-2) && vgl(bb_n,qb_n-5,qb_n-1) &&
            qir(bb_n+1,qb_n-1,"suw_tv mest_tv") &&
            qir(qb_n+1,tn-2,"prl_ro mest_ro prq_ro qis_ro qik_ro") &&
              q(tn-1,"suw_ro mest_ro") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[798]++; if(dbg){print "Z798"}; stopp=ret=1; continue };

    };};

    # поиск по pre_pr + _gl_v_lock-iv: qb_n и bb_n
    if ( qb(tn-8,tn-2,"pre_pr") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_v_lock-iv") ) { bb_n=bbn;

        if ( vgl(qb_n,tn-8,tn-3) && veq(bb_n,qb_n-3) &&
               q(tn-5,"suw_vi mest_vi mest_3e prq_vi") &&
               q(tn-4,"prq_tv") &&
               q(tn-2,"suw_pr") &&
               q(tn-1,"suw_tv") && s(bb_n,tn-1) )
        { l[i]=omo2; Z[799]++; if(dbg){print "Z799"}; stopp=ret=1; continue };
        if ( vgl(qb_n,tn-8,tn-2) && vgl(bb_n,qb_n-5,qb_n-2) &&
             qir(bb_n+1,qb_n-2,"prl_vi mest_vi prq_vi") &&
               q(qb_n-1,"suw_vi prq_vi mest_vi mest_3e") &&
             qir(qb_n+1,tn-2,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
               q(tn-1,"suw_pr") && s(bb_n,tn-1) )
        { l[i]=omo2; Z[800]++; if(dbg){print "Z800"}; stopp=ret=1; continue };
        if ( vgl(qb_n,tn-8,tn-3) && veq(bb_n,qb_n-2) &&
               q(qb_n-1,"suw_vi prq_vi mest_vi mest_3e") &&
             qir(qb_n+1,tn-3,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
               q(tn-2,"suw_pr") &&
               q(tn-1,"suw_vi prq_vi mest_vi mest_3e") && s(bb_n,tn-1) )
        { l[i]=omo2; Z[801]++; if(dbg){print "Z801"}; stopp=ret=1; continue };
        if ( vgl(qb_n,tn-8,tn-3) && vgl(bb_n,qb_n-5,qb_n-1) &&
              qy(qb_n-1,"suw_vi prq_vi mest_vi mest_3e") &&
             qir(bb_n+1,qb_n-2,"prl_vi mest_vi prq_vi") &&
             qir(qb_n+1,tn-3,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
               q(tn-2,"suw_pr") &&
               q(tn-1,"suw_ro mest_ro suw_vi mest_vi mest_3e") && s(bb_n,tn-1) )
        { l[i]=omo2; Z[802]++; if(dbg){print "Z802"}; stopp=ret=1; continue };
        if ( vgl(qb_n,tn-8,tn-2) && veq(bb_n,qb_n-1) &&
             qir(qb_n+1,tn-2,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
               q(tn-1,"suw_pr") && s(bb_n,tn-1) )
        { l[i]=omo2; Z[803]++; if(dbg){print "Z803"}; stopp=ret=1; continue };
        if ( vgl(qb_n,tn-8,tn-2) && veq(bb_n,qb_n-3) &&
               q(qb_n-2,"pre_ro") &&
               q(qb_n-1,"suw_ro mest_ro") &&
             qir(qb_n+1,tn-2,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
               q(tn-1,"suw_pr") && s(bb_n,tn-1) )
        { l[i]=omo2; Z[804]++; if(dbg){print "Z804"}; stopp=ret=1; continue };
        if ( vgl(qb_n,tn-8,tn-3) && veq(bb_n,qb_n-1) &&
               q(qb_n+1,"suw_pr") &&
             qir(qb_n+2,tn-2,"prl_vi mcop_vi prq_vi qis_vi qik_vi") &&
               q(tn-1,"suw_vi") && s(bb_n,tn-1) )
        { l[i]=omo2; Z[805]++; if(dbg){print "Z805"}; stopp=ret=1; continue };
        if ( vgl(qb_n,tn-8,tn-4) && veq(bb_n,qb_n-1) &&
               q(qb_n+1,"suw_pr") &&
             qir(qb_n+2,tn-3,"prl_vi mcop_vi prq_vi qis_vi qik_vi") &&
               q(tn-2,"suw_vi") &&
               q(tn-1,"suw_ro") && s(bb_n,tn-1) )
        { l[i]=omo2; Z[806]++; if(dbg){print "Z806"}; stopp=ret=1; continue };
    };};

    if ( !(vgl(Y["n-_gl_v_castle-iv"],tn-5,tn-1) && s(Y["n-_gl_v_castle-iv"],tn-1) && Qb(Y["n-_gl_v_castle-iv"]+1,tn-1,"sz_iili") ) &&
           bfa(1,4,"_gl_v_lock-iv") && s(0,bfn-1) && Qf(1,bfn,"sz_iili") )
    { l[i]=omo2; Z[807]++; if(dbg){print "Z807"}; stopp=ret=1; continue };

    cst1="горло кисти кисть клинок ладони ладонь ладошки ладошку лодыжки лодыжку ноги ногу ножки ножку палец пальцы ремень руки руку стопа стопу талию шеи шею";
    if ( wb(tn-5,tn-1,cst1) && s(tn-1) &&
          q(wbn-1,"narph_any") &&
        veq(Y["n-_gl_v_lock-iv"],xwn-1) && s(xwn-1) )
    { l[i]=omo2; Z[808]++; if(dbg){print "Z808"}; stopp=ret=1; continue };
    # _gl_v_lock-iv:end


    # _v_zamok:start
    cst1="горло кисти кисть клинок ладони ладонь ладошки ладошку лодыжки лодыжку ноги ногу ножки ножку палец пальцы ремень руки руку стопа стопу талию шеи шею";
    if ( ba(1,"_v_zamok") &&
          w(2,cst1) && s(0,1) )
    { l[i]=omo2; Z[809]++; if(dbg){print "Z809"}; stopp=ret=1; continue };

    if ( ba(tn-2,"_v_zamok") &&
          w(tn-1,cst1) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[810]++; if(dbg){print "Z810"}; stopp=ret=1; continue };
    if ( bba(tn-6,tn-3,"_v_zamok") &&
           w(bbn+1,cst1) &&
         qir(bbn+2,tn-2,"prl_ro mest_ro mest_3e prq_ro") &&
           q(tn-1,"suw_ro suw_edne") && s(tn-3,tn-1) )
    { l[i]=omo2; Z[811]++; if(dbg){print "Z811"}; stopp=ret=1; continue };
    if ( bba(tn-5,tn-2,"_v_zamok") &&
         qir(bbn+1,tn-2,"prl_vi prq_vi mcop_vi nar_mest") &&
           w(tn-1,cst1) && s(bbn,tn-1) )
    { l[i]=omo2; Z[812]++; if(dbg){print "Z812"}; stopp=ret=1; continue };
    if ( ba(tn-4,"_v_zamok") &&
          w(tn-3,cst1) &&
     pre_pr(tn-2) &&
          q(tn-1,"suw_pr mest_pr") && s(tn-4,tn-1) )
    { l[i]=omo2; Z[813]++; if(dbg){print "Z813"}; stopp=ret=1; continue };
    if ( ba(tn-4,"_v_zamok") &&
          q(tn-3,"suw_vi mest_vi isname") &&
     pre_vi(tn-2) &&
          w(tn-1,cst1) && s(tn-4,tn-1) )
    { l[i]=omo2; Z[814]++; if(dbg){print "Z814"}; stopp=ret=1; continue };

    cst2="хватом";
    if ( ba(tn-2,"_v_zamok") &&
          w(tn-1,cst2) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[815]++; if(dbg){print "Z815"}; stopp=ret=1; continue };
    # _v_zamok:end

    if ( bw(tn-2,"пуля") &&
         bw(tn-1,"угодить") && s(tn-2,tn-1) )
    { l[i]=omo2; Z[816]++; if(dbg){print "Z816"}; stopp=ret=1; continue };

    cst="быстрее быстро все и или назад обратно сейчас скорее сначала сперва срочно теперь";
    cst1="прямо сразу";
    if ( w(tn-1,cst) &&
         p(tn-2,",") && p(0) )
    { l[i]=omo1; Z[817]++; if(dbg){print "Z817"}; stopp=ret=1; continue };
    if ( w(tn,cst1) &&
         p(tn-1,",") && p(0) )
    { l[i]=omo1; Z[818]++; if(dbg){print "Z818"}; stopp=ret=1; continue };

    if ( p(-2,",") && veq(tn,-1) && cap(0) && p(0) )
    { l[i]=omo1; Z[819]++; if(dbg){print "Z819"}; stopp=ret=1; continue };

    cst="ввести вводить внедриться войти вползать врезаться всадить вторгнуться входить загнать зайти запихнуть засадить идти лезть пойти поместить попадать попасть \
         пройти проникать проникнуть проскальзывать проскользнуть проходить спрятаться юркнуть";
    cst1="карту ключ ключи ключик код отвертка отмычка скрепку спички спичку";
    cst2="жалом картой ключом отверткой отмычкой ремнем";
    cst3=cst1 " " cst2
    cst4="волос коготь палец рука стопа";
    if ( bb(tn-6,tn-2,cst) && s(bbn,tn-1) &&
          q(bbn+1,"mest_vi mest_3e") &&
        qsb(bbn-10,bbn-1,",") &&
         bb(sbn-10,sbn,cst1) && s(bbn,sbn-1) )
    { l[i]=omo2; Z[820]++; if(dbg){print "Z820"}; stopp=ret=1; continue };
    if ( bb(tn-4,tn-2,cst1) && s(bbn,tn-1) &&
        qir(bbn+1,tn-2,"nar_any qast_any") &&
         bw(tn-1,cst) )
    { l[i]=omo2; Z[821]++; if(dbg){print "Z821"}; stopp=ret=1; continue };
    if ( bb(tn-4,tn-2,cst4) && s(bbn,tn-1) &&
        qir(bbn+1,tn-2,"nar_any qast_any") &&
         bw(tn-1,cst) &&
!(narph_any(bbn)||w(bbn-1,"в на")) )
    { l[i]=omo2; Z[822]++; if(dbg){print "Z822"}; stopp=ret=1; continue };
    if ( wb(tn-3,tn-1,cst3) &&
        qir(wbn+1,tn-1,"nar_any qast_any prl_any") && s(wbn,tn-1) )
    { l[i]=omo2; Z[823]++; if(dbg){print "Z823"}; stopp=ret=1; continue };

    if ( bw(tn-1,cst) &&
         bf(1,3,cst1) &&
        qir(1,bfn-1,"prl_vi mcop_vi prq_vi prl_im mcop_im prq_im") && s(tn-1,bfn-1) )
    { l[i]=omo2; Z[824]++; if(dbg){print "Z824"}; stopp=ret=1; continue }; #check
    if ( bf(1,3,cst1) &&
        qir(1,bfn-1,"prl_vi mcop_vi prq_vi prl_im mcop_im prq_im") &&
         bw(bfn+1,cst) && s(tn,bfn-1) )
    { l[i]=omo2; Z[825]++; if(dbg){print "Z825"}; stopp=ret=1; continue }; #check
    if ( wf(1,5,cst3) &&
        qir(1,wfn-2,"nar_any prl_kred_sr mest_any prl_any mod_bz") &&
         bw(wfn-1,cst) && s(0,wfn-1) )
    { l[i]=omo2; Z[826]++; if(dbg){print "Z826"}; stopp=ret=1; continue };
    if ( bw(tn-1,cst) && sv(0,"\\(") &&
         wf(1,5,cst3) &&
        qir(1,wfn-2,"nar_any prl_kred_sr mest_any prl_any mod_bz") && s(-1,wfn-1) )
    { l[i]=omo2; Z[827]++; if(dbg){print "Z827"}; stopp=ret=1; continue };
    if ( bw(tn-3,"рука палец") && s(tn-3) &&
         bw(tn-2,"дрожать трястись") && z(tn-2) &&
         sz(tn-1) &&
          q(1,"suw_im mest_im prq_im") &&
         bw(2,cst) && s(tn-1,1) )
    { l[i]=omo2; Z[828]++; if(dbg){print "Z828"}; stopp=ret=1; continue };

    cst="попасть";
    if ( ( qxs(tn-1,"а но что только","не")||
           qxs(tn-1,"не") ) && s(tn-1) &&
           vvb(xsn-5,xsn-1) &&
            bw(vvn,cst) )
    { l[i]=omo2; Z[829]++; if(dbg){print "Z829"}; stopp=ret=1; continue };

    cst="втягиваться";
    if ( bw(tn-1,cst) &&
          w(tn+1,"центральный") && s(tn-1) )
    { l[i]=omo2; Z[830]++; if(dbg){print "Z830"}; stopp=ret=1; continue };

    cst="ввести вводить внедриться вползать врезаться всадить вторгнуться входить загнать зайти засадить идти лезть пойти поместить попадать попасть пройти проникать \
         проскальзывать проскользнуть проходить спрятаться юркнуть";
    cst1="войти";
    if ( bba(tn-6,tn-2,"_lock_parts") &&
          sQ(bbn,tn-2,"[….:;!?]") &&
          bw(tn-1,cst) && s(tn-1) )
    { l[i]=omo2; Z[831]++; if(dbg){print "Z831"}; stopp=ret=1; continue };
    if ( bba(tn-6,tn-2,"_lock_parts") &&
           W(bbn+1,"и") &&
          sQ(bbn,tn-2,"[….:;!?]") &&
          bw(tn-1,cst1) && s(tn-1) )
    { l[i]=omo2; Z[832]++; if(dbg){print "Z832"}; stopp=ret=1; continue };
    if ( bba(tn-6,tn-2,"_lock_parts") &&
          bw(tn-1,"проникнуть просочиться") && s(bbn,tn-1) )
    { l[i]=omo2; Z[833]++; if(dbg){print "Z833"}; stopp=ret=1; continue };

    if ( bba(tn-3,tn-1,"_lock_parts") &&
          se(tn-1," — ") && s(bbn,tn-2) )
    { l[i]=omo2; Z[834]++; if(dbg){print "Z834"}; stopp=ret=1; continue };

    # escape
    cst="булавка камень коготь копье магазин обойма очередь паста пуля рожок язык";
    cst1="выпустить высадить запустить засадить";
    if ( bw(tn-3,cst1) &&
          q(tn-2,"qik_vi prl_vi mest_vi") &&
         bw(tn-1,cst) && s(tn-3,tn-1) )
    { l[i]=omo2; Z[835]++; if(dbg){print "Z835"}; stopp=ret=1; continue };
    if ( bw(tn-2,cst1) &&
         bw(tn-1,cst) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[836]++; if(dbg){print "Z836"}; stopp=ret=1; continue };
    if ( bw(tn-1,cst1) && s(-1) &&
         bw(1,cst) && s(0) )
    { l[i]=omo2; Z[837]++; if(dbg){print "Z837"}; stopp=ret=1; continue };
    if ( bw(tn-1,cst1) &&
          q(1,"mest_vi prl_vi qik_vi") &&
         bw(2,cst) && s(tn-1,1) )
    { l[i]=omo2; Z[838]++; if(dbg){print "Z838"}; stopp=ret=1; continue };
    # escape


    #
    cst="всадить въехать загнать заехать засадить захватить провести";
    cst1="затвор коленка колено кулак локоть нога рука шея";
    if ( bb(tn-5,tn-2,cst1) && s(bbn,tn-1) &&
         bw(tn-1,cst) )
    { l[i]=omo2; Z[839]++; if(dbg){print "Z839"}; stopp=ret=1; continue };
    if ( bb(tn-5,tn-2,cst) && s(bbn,tn-1) &&
         bb(bbn-1,tn-1,cst1) )
    { l[i]=omo2; Z[840]++; if(dbg){print "Z840"}; stopp=ret=1; continue };

    # поиск по "надо нужно"
    if ( wb(tn-5,tn-1,"надо нужно") ) { wb_n=wbn;

       if ( vgl(wb_n,tn-5,tn-1) &&
            qir(wb_n+1,tn-1,"gl_aux_be mest_da suw_da nar_srav nar_napr") && s(wb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[841]++; if(dbg){print "Z841"}; stopp=ret=1; continue };
       if ( vgl(wb_n,tn-5,tn-1) &&
         pre_pr(wb_n+1) &&
            qir(wb_n+2,tn-2,"prl_pr mest_pr mest_3e prq_pr") &&
              q(tn-1,"suw_pr suw_edne isname") && s(wb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[842]++; if(dbg){print "Z842"}; stopp=ret=1; continue };

    };
    if ( wf(1,5,"надо нужно") ) { wf_n = wfn;

       if ( vgl(wf_n,1,5) &&
            qir(1,wf_n-1,"gl_aux_be mest_da suw_da nar_srav nar_napr mest_vi mest_3e qast_ne") && s(0,wf_n-1) )
       { l[i]=omo1; Z[843]++; if(dbg){print "Z843"}; stopp=ret=1; continue };
       cst="будет было ведь все и не равно тоже";
       if ( vgl(wf_n,1,5) &&
            wir(1,wf_n-1,cst) && s(0,wf_n-1) )
       { l[i]=omo1; Z[844]++; if(dbg){print "Z844"}; stopp=ret=1; continue };
       if ( vgl(wf_n,2,5) &&
              q(1,"suw_da mest_da suw_vi mest_vi mest_3e") &&
            wir(2,wf_n-1,cst) && s(0,wf_n-1) )
       { l[i]=omo1; Z[845]++; if(dbg){print "Z845"}; stopp=ret=1; continue };

    };

    # _gl_v_castle-iv: begin
    # _lock_parts:start - части замка́
    #  escape1
    if ( vgl(Y["n-_gl_v_castle-iv"],tn-5,tn-2) ) { bb_n = Y["n-_gl_v_castle-iv"] };
       if ( vgl(bb_n,tn-5,tn-2) && s(bb_n,tn-1) &&
            qir(bb_n+1,tn-2,"prl_any prq_any mest_any") &&
             ba(tn-1,"_lock_parts") )
       { l[i]=omo2; Z[846]++; if(dbg){print "Z846"}; stopp=ret=1; continue };
       if ( veq(Y["n-_gl_v_castle-iv"],tn-4) &&
             ba(tn-3,"_lock_parts") &&
              q(tn-2,"suw_ro") &&
              q(tn-1,"nar_napr") && s(tn-4,tn-1) )
       { l[i]=omo2; Z[847]++; if(dbg){print "Z847"}; stopp=ret=1; continue };

    #
    cst="лезть попадать попасть";
    if ( bb(tn-5,tn-2,cst) &&
        qir(bbn+1,tn-2,"qast nar_any") &&
        (ba(tn-1,"_lock_parts")||w(tn-1,"им")) && s(bbn,tn-1) )
    { l[i]=omo2; Z[848]++; if(dbg){print "Z848"}; stopp=ret=1; continue };
    if ( bb(tn-6,tn-3,cst) &&
        qir(bbn+1,tn-3,"qast nar_any") &&
         ba(tn-2,"_lock_parts") &&
          q(tn-1,"suw_ro") && s(bbn,tn-1) )
    { l[i]=omo2; Z[849]++; if(dbg){print "Z849"}; stopp=ret=1; continue };
    # _lock_parts:end

    # _gl_v_castle-iv: escape2
    cst="попадать попасть";
    if ( bw(tn-4,cst) &&
          q(tn-3,"suw_im mest_im isname") &&
     pre_da(tn-2) &&
          q(tn-1,"mest_da suw_da isname") && s(tn-4,tn-1) )
    { l[i]=omo1; Z[850]++; if(dbg){print "Z850"}; stopp=ret=1; continue };
    cst="вынести открывать снести";
    cst1="выстрелом пинком пулей ударом";
    if ( bw(tn-3,cst) &&
          q(tn-2,"nar_any mest_vi mest_3e suw_vi") &&
          w(tn-1,cst1) && s(tn-3,tn-2) && zs(tn-1) )
    { l[i]=omo2; Z[851]++; if(dbg){print "Z851"}; stopp=ret=1; continue };
    if ( bw(tn-4,cst) &&
          q(tn-3,"nar_any mest_vi mest_3e suw_vi") &&
          q(tn-2,"prl_tv mest_tv mest_3e prq_tv") &&
          w(tn-1,cst1) && s(tn-4,tn-2) && zs(tn-1) )
    { l[i]=omo2; Z[852]++; if(dbg){print "Z852"}; stopp=ret=1; continue };
    cst="впустить пропустить";
    if ( bw(tn-3,cst) &&
          q(tn-2,"prl_vi prl_im mest_vi mest_im mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") &&
          q(tn-1,"suw_vi suw_im mest_vi suw_edne mest_im mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") &&
          s(tn-3,tn-2) && zs(tn-1) && z(0) &&
         ba(1,"_lock_pe") &&
         ba(2,"_lock_parts") && s(1) )
    { l[i]=omo2; Z[853]++; if(dbg){print "Z853"}; stopp=ret=1; continue };

    cst="айда бегом брысь верхом домой надо надолго немедленно нужно обратно пешком ползком пора сюда";
    if ( w(tn-1,cst) &&
       (zs(tn-1)||sc(tn-1,"—")) )
    { l[i]=omo1; Z[854]++; if(dbg){print "Z854"}; stopp=ret=1; continue };
    if ( w(1,cst) && s(0) )
    { l[i]=omo1; Z[855]++; if(dbg){print "Z855"}; stopp=ret=1; continue };


    # _gl_v_castle-iv: main
    # поиск по _gl_v_castle-iv
    if ( vgl(Y["n-_gl_v_castle-iv"],tn-8,tn-1) ) { bb_n = Y["n-_gl_v_castle-iv"];

       if ( vgl(bb_n,tn-8,tn-1) && s(bb_n,tn-1) && prq_any(bb_n) && ba(bb_n,"X_prq_gl_v_castle-iv") )
       { bb_n=""; Z[856]++; if(dbg){print "Z856"}; };
       if ( vgl(bb_n,tn-8,tn-3) &&
              q(bb_n+1,"prl_vi mest_vi mest_3e prq_vi qik_vi digits") &&
              q(bb_n+2,"suw_vi mest_vi mest_3e") &&
            qir(bb_n+3,tn-1,"prl_kred_sr nar_any qast") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[857]++; if(dbg){print "Z857"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-2) &&
            qir(bb_n+1,tn-2,"prl_im prq_im mest_im") &&
              q(tn-1,"suw_im name_im_sy") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[858]++; if(dbg){print "Z858"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-3) &&
            qir(bb_n+1,tn-3,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi") &&
              q(tn-2,"suw_vi mest_vi mest_3e suw_mnsq prq_vi qis_vi isname") &&
              q(tn-1,"nar_any") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[859]++; if(dbg){print "Z859"}; stopp=ret=1; continue };
       if ( vvb(tn-5,tn-1) && vgl(bb_n,tn-8,tn-2) &&
              q(bb_n+1,"prq_vi suw_vi mest_vi mest_3e") &&
            qir(bb_n+2,vvn,"suw_vi mest_vi mest_3e suw_mnsq qis_vi isname") && s(bb_n,vvn-1) )
       { l[i]=omo1; Z[860]++; if(dbg){print "Z860"}; stopp=ret=1; continue }; #check
       if ( vgl(bb_n,tn-5,tn-2) &&
              q(bb_n+1,"prq_vi suw_vi mest_vi mest_3e") &&
            qir(bb_n+2,tn-1,"suw_vi mest_vi mest_3e suw_mnsq qis_vi isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[861]++; if(dbg){print "Z861"}; stopp=ret=1; continue }; #check
       if ( vgl(bb_n,tn-6,tn-2) &&
            qiz(bb_n+1,tn-2,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any gl_in qast_any","mest_da") &&
              q(tn-1,"suw_vi mest_vi mest_3e suw_mnsq qis_vi qast name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[862]++; if(dbg){print "Z862"}; stopp=ret=1; continue };
       if ( vvb(tn-5,tn-1) && !bfa(vvn+1,tn-1,"_gl_v_lock-iv") &&
            bba(vvn-6,vvn,"_gl_v_castle-iv") &&
            qir(bb_n+1,vvn-1,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any gl_in qast") &&
              q(vvn-1,"suw_vi mest_vi mest_3e suw_mnsq qis_vi qast name_vi_sy isname") && s(bbn,vvn-1) )
       { l[i]=omo1; Z[863]++; if(dbg){print "Z863"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-2) &&
            qia(bb_n+1,tn-2,"qast","mest_vi prq_vi suw_vi prl_im mest_3e qast_any nar_any name_vi_sy isname") &&
              q(tn-1,"suw_im suw_edne mest_im name_vi_sy isname qast prl_vi mest_vi") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[864]++; if(dbg){print "Z864"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-2) &&
              q(bb_n+1,"suw_im suw_edne mest_im name_vi_sy isname qast_any prl_vi mest_vi") &&
            qir(bb_n+2,tn-1,"mest_vi prq_vi suw_vi prl_im mest_3e qast_any nar_any name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[865]++; if(dbg){print "Z865"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-3) &&
            qir(bb_n+1,tn-3,"mest_vi prq_vi suw_vi mest_3e name_vi_sy isname nar_any qast") &&
              q(tn-2,"suw_im suw_edne mest_im name_vi_sy isname") &&
              q(tn-1,"nar_any") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[866]++; if(dbg){print "Z866"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-2) &&
              q(bb_n+1,"suw_vi suw_edne isname nar_any") &&
            qir(bb_n+2,tn-1,"suw_ro prq_ro suw_edne isname nar_any") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[867]++; if(dbg){print "Z867"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-2) &&
            qir(bb_n+1,tn-2,"prl_tv mest_tv mest_3e suw_tv prq_tv gl_in prl_kred_sr nar_any qast name_tv_sy isname") &&
              q(tn-1,"suw_tv mest_tv prq_tv prl_tv suw_edne mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[868]++; if(dbg){print "Z868"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-2) &&
              q(bb_n+1,"suw_tv mest_tv prq_tv prl_tv suw_edne mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") &&
            qir(bb_n+2,tn-2,"prl_vi mest_vi mest_3e suw_vi prq_vi gl_in prl_kred_sr nar_any qast name_tv_sy isname") &&
              q(tn-1,"suw_vi mest_vi mest_3e name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[869]++; if(dbg){print "Z869"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-2) &&
              q(bb_n+1,"suw_vi mest_vi mest_3e name_vi_sy isname") &&
            qir(bb_n+2,tn-2,"prl_tv mest_tv mest_3e gl_in prl_kred_sr nar_any qast name_tv_sy isname") &&
              q(tn-1,"suw_tv mest_tv prq_tv prl_tv suw_edne mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[870]++; if(dbg){print "Z870"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-2) &&
            qir(bb_n+1,tn-2,"prl_vi prq_vi mest_vi mest_3e") &&
              q(tn-1,"suw_im suw_edne mest_vi mest_im mest_3e name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[871]++; if(dbg){print "Z871"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-2) &&
            qir(bb_n+1,tn-2,"prl_da mest_da prq_da gl_in nar_any qast_any") &&
              q(tn-1,"mest_da suw_da prq_da suw_edne isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[872]++; if(dbg){print "Z872"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-2) &&
              q(bb_n+1,"mest_da suw_da suw_edne isname") &&
            qir(bb_n+2,tn-2,"prl_vi mest_vi prq_vi nar_any qast_any") &&
              q(tn-1,"suw_vi suw_edne mest_vi mest_3e nar_napr") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[873]++; if(dbg){print "Z873"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-2) &&
            qir(bb_n+1,tn-3,"prl_vi mest_vi prq_vi nar_any qast_any") &&
              q(tn-2,"suw_vi suw_edne mest_vi mest_3e nar_napr") &&
              q(tn-1,"mest_da suw_da suw_edne isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[874]++; if(dbg){print "Z874"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-2) &&
            qir(bb_n+1,tn-2,"prl_ro mest_ro prq_ro nar_any qast_any") &&
              q(tn-1,"mest_ro suw_ro prq_ro suw_edne nar_any isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[875]++; if(dbg){print "Z875"}; stopp=ret=1; continue };

       if ( vgl(bb_n,tn-6,tn-2) &&
              q(bb_n+1,"suw_vi suw_edne mest_vi mest_3e") &&
            qir(bb_n+2,tn-1,"prl_ro prq_ro mest_ro suw_mnsq mest_3e suw_ro prl_kred_sr") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[876]++; if(dbg){print "Z876"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-3) &&
            qir(bb_n+1,tn-3,"prl_vi prq_vi mest_vi mest_3e") &&
              q(tn-2,"suw_vi suw_edne") &&
              q(tn-1,"suw_ro prl_kred_sr") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[877]++; if(dbg){print "Z877"}; stopp=ret=1; continue };

       if ( vgl(bb_n,tn-6,tn-3) &&
              q(bb_n+1,"suw_vi suw_edne mest_vi mest_3e") &&
            qir(bb_n+2,tn-2,"prl_da prq_da mest_da mest_3e") &&
              q(tn-1,"suw_da isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[878]++; if(dbg){print "Z878"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-4,tn-2) &&
            qir(bb_n+1,tn-1,"gl_in gl_aux_be qast_any") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[879]++; if(dbg){print "Z879"}; stopp=ret=1; continue };
       if ( veq(bb_n,tn-1) && zs(tn-1) )
       { l[i]=omo1; Z[880]++; if(dbg){print "Z880"}; stopp=ret=1; continue };
       if ( vvb(tn-5,tn-1) && veq(bb_n,vvn) )
       { l[i]=omo1; Z[881]++; if(dbg){print "Z881"}; stopp=ret=1; continue };
    };

       if (  bfa(tn-8,tn-1,"_gl_v_castle-iv") ) { bf_n=bfn;

       if ( vgl(bf_n,tn-8,tn-2) && vv(bf_n,bf_n+7) &&
            qir(vvn+1,tn-2,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any gl_in qast sz") &&
              q(tn-1,"suw_vi mest_vi mest_3e suw_mnsq qis_vi qast name_vi_sy isname") && s(vvn+1,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[882]++; if(dbg){print "Z882"}; stopp=ret=1; continue };

    };

    # поиск по sz_iili + _gl_v_castle-iv
    if ( qb(tn-6,tn-2,"sz_iili") ) { qb_n=qbn; if ( bba(qb_n-6,qb_n-2,"_gl_v_castle-iv") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-6,tn-2) && vgl(bb_n,qb_n-6,qb_n-2) &&
              s(bb_n,qb_n-3) && zs(qb_n-2) && s(qb_n-1,tn-2) && zs(tn-1) &&
            qir(bb_n+1,qb_n-1,"prl_vi mest_vi suw_vi suw_edne mest_3e prq_vi qast_any qis_vi qik_vi name_vi_sy isname") &&
            qir(qb_n+1,tn-1,"prl_vi mest_vi suw_vi suw_edne mest_3e qast_any nar_any qis_vi qik_vi prq_vi name_vi_sy isname") )
       { l[i]=omo1; Z[883]++; if(dbg){print "Z883"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-6,tn-2) && vgl(bb_n,qb_n-6,qb_n-2) &&
              q(bb_n+1,"nar_any gl_in") &&
            qir(bb_n+2,qb_n-2,"prl_vi mest_vi suw_vi suw_edne mest_3e prq_vi qis_vi qik_vi name_vi_sy isname") &&
            qir(qb_n+1,tn-2,"prl_vi mest_vi suw_vi suw_edne mest_3e qis_vi qik_vi prq_vi name_vi_sy isname") &&
              q(qb_n-1,"suw_vi mest_vi suw_edne mest_3e prq_vi qast name_vi_sy isname") &&
              q(tn-1,"suw_vi mest_vi suw_edne mest_3e prq_vi qast name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[884]++; if(dbg){print "Z884"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-6,tn-2) && vgl(bb_n,qb_n-6,qb_n-2) &&
            qir(bb_n+1,qb_n-1,"prl_im mest_im suw_im suw_edne mest_3e prq_im qis_im qik_im qast_any name_im_sy isname") &&
            qir(qb_n+1,tn-1,"prl_im mest_im suw_im suw_edne mest_3e prq_im nar_any qis_im qik_im name_im_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[885]++; if(dbg){print "Z885"}; stopp=ret=1; continue };

    };};


    # поиск по pre_da + _gl_v_castle-iv: qb_n и bb_n
    if ( qb(tn-6,tn-2,"pre_da") ) { qb_n=qbn; if ( bba(qb_n-9,qb_n-1,"_gl_v_castle-iv") ) { bb_n=bbn;

       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-5,tn-2) &&
            qir(qb_n+1,qb_n-1,"nar_any prl_kred_sr qast prl_vi mest_vi prq_vi suw_vi mest_3e suw_im suw_edne mest_im isname") &&
            qir(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
              q(tn-1,"mest_da suw_da suw_edne prq_da isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[886]++; if(dbg){print "Z886"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-6,qb_n-1) && vgl(qb_n,tn-6,tn-3) &&
            qir(qb_n+1,qb_n-1,"nar_any prl_kred_sr qast prl_vi mest_vi prq_vi suw_vi mest_3e suw_im suw_edne mest_im isname") &&
            qir(qb_n+1,tn-3,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
              q(tn-2,"mest_da suw_da suw_edne prq_da isname") &&
              q(tn-1,"nar_any") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[887]++; if(dbg){print "Z887"}; stopp=ret=1; continue };

  };};

    # поиск по pre_tv + _gl_v_castle-iv: qb_n и bb_n
    if ( qb(tn-7,tn-2,"pre_tv") ) { qb_n=qbn; if ( bba(qb_n-9,qb_n-1,"_gl_v_castle-iv") ) { bb_n=bbn;

       if ( vgl(bb_n,qb_n-6,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi qik_vi nar_any prl_kred_sr isname qast_any") &&
            qir(qb_n+1,tn-2,"prl_tv mest_tv suw_tv mest_3e prq_tv prl_kred_sr qik_vi qik_tv nar_any isname") &&
              q(tn-1,"mest_tv suw_tv prq_tv suw_edne isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[888]++; if(dbg){print "Z888"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-6,tn-2) &&
            vvb(qb_n-5,qb_n-1) &&
            bba(qbn-9,qbn-1,"_gl_v_castle-iv") && s(bbn+1,vvn-1) &&
            qir(bbn+1,vvn,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            qir(qb_n+1,tn-2,"prl_tv mest_tv suw_tv mest_3e prq_tv prl_kred_sr qik_tv nar_any isname") &&
              q(tn-1,"mest_tv suw_tv prq_tv suw_edne isname") && s(qb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[889]++; if(dbg){print "Z889"}; stopp=ret=1; continue };
        if ( vgl(bb_n,qb_n-7,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
               q(bb_n+1,"pre_tv") &&
             qir(bb_n+2,qb_n-1,"suw_tv mest_tv prl_tv mest_3e qis_tv nar_any prl_kred_sr isname qast_any") &&
             qir(qb_n+1,tn-2,"prl_tv mest_tv suw_tv mest_3e prq_tv prl_kred_sr qik_tv nar_any isname") &&
               q(tn-1,"mest_tv suw_tv prq_tv suw_edne isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[890]++; if(dbg){print "Z890"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-6,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            qir(qb_n+1,tn-3,"prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
              q(tn-2,"mest_tv suw_tv suw_edne isname") &&
              q(tn-1,"suw_ro suw_edne") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[891]++; if(dbg){print "Z891"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-6,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
              q(qb_n+1,"mest_tv suw_tv suw_edne isname") &&
            qir(qb_n+2,tn-2,"prl_ro mest_ro mest_3e prq_ro") &&
              q(tn-1,"suw_ro suw_edne") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[892]++; if(dbg){print "Z892"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-6,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            qir(qb_n+1,tn-3,"prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
              q(tn-2,"mest_tv suw_tv suw_edne isname") &&
              q(tn-1,"nar_any prl_kred_sr") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[893]++; if(dbg){print "Z893"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-9,qb_n-1) && vgl(qb_n,tn-7,tn-2) &&
             qb(qb_n+1,tn-1,"sz_iili") && s(bb_n,qbn-3) && zs(qbn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            qir(qb_n+1,qbn-1,"suw_tv suw_edne isname prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
            qir(qbn+1,tn-1,"suw_tv suw_edne isname prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") && s(qbn-1,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[894]++; if(dbg){print "Z894"}; stopp=ret=1; continue };

    };};

    # поиск по pre_pr + _gl_v_castle-iv: qb_n и bb_n
    if ( qb(tn-7,tn-2,"pre_pr") ) { qb_n=qbn; if ( bba(qb_n-6,qb_n-1,"_gl_v_castle-iv") ) { bb_n=bbn;

       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
              q(qb_n+1,"suw_pr") &&
            qir(qb_n+2,tn-2,"prl_vi prq_vi mest_vi mest_3e qik_vi") &&
              q(tn-1,"suw_vi suw_edne") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[895]++; if(dbg){print "Z895"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
             qf(qb_n+1,tn-1,"sz_iili") &&
            qir(qb_n+1,qfn-2,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
            qir(qfn+1,tn-2,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
              q(qfn-1,"suw_pr") &&
              q(tn-1,"suw_pr") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[896]++; if(dbg){print "Z896"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
              q(qb_n+1,"suw_pr suw_edne") &&
             qf(qb_n+3,tn-1,"sz_iili") &&
            qir(qb_n+2,qfn-2,"prl_ro prq_ro mest_ro mest_3e qik_ro") &&
            qir(qfn+1,tn-2,"prl_ro prq_ro mest_ro mest_3e qik_ro") &&
              q(qfn-1,"suw_ro") &&
              q(tn-1,"suw_ro") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[897]++; if(dbg){print "Z897"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            qir(qb_n+1,tn-2,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
              q(tn-1,"mest_pr suw_pr suw_edne") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[898]++; if(dbg){print "Z898"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-6,tn-3) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            qir(qb_n+1,tn-3,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
              q(tn-2,"suw_pr suw_edne") &&
              q(tn-1,"suw_ro suw_edne nar_any") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[899]++; if(dbg){print "Z899"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
              q(qb_n+1,"suw_pr suw_edne") &&
            qir(qb_n+2,tn-1,"suw_ro suw_edne nar_any prl_ro prq_ro") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[900]++; if(dbg){print "Z900"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
         pre_tv(bb_n+1) &&
            qir(qb_n+2,qb_n-2,"prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
              q(qb_n-1,"mest_tv suw_tv suw_edne isname") &&
            qir(qb_n+1,tn-2,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
              q(tn-1,"mest_pr suw_pr suw_edne isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[901]++; if(dbg){print "Z901"}; stopp=ret=1; continue };

    };};

    # поиск по pre_vi + _gl_v_castle-iv: qb_n и bb_n
    if ( qb(tn-9,tn-2,"pre_vi") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_v_castle-iv") ) { bb_n=bbn;

       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-9,tn-2) && hwy(bb_n+1,"ка") &&
            qir(bb_n+1+hyn,qb_n-1,"nar_any suw_im suw_ro suw_vi prl_vi mest_vi prq_vi mest_3e mest_impe suw_edne suw_mnsq isname") &&
            qir(qb_n+1+hyn,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") && s(bb_n+hyn,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[902]++; if(dbg){print "Z902"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-9,tn-2) &&
             qb(bb_n+1,qb_n-1,"pre_da") &&
            qir(bb_n+1,qbn-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            qir(qbn+1,qb_n-1,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            qir(qb_n+1,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[903]++; if(dbg){print "Z903"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-9,tn-2) &&
             qb(bb_n+1,qb_n-1,"pre_ro") &&
            qir(bb_n+1,qbn-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            qir(qbn+1,qb_n-1,"suw_ro prl_ro mest_ro mest_3e prq_ro prl_kred_sr nar_any isname") &&
            qir(qb_n+1,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[904]++; if(dbg){print "Z904"}; stopp=ret=1; continue };

       if ( vgl(bb_n,qb_n-7,qb_n-1) && vgl(qb_n,tn-9,tn-2) && qb(qb_n+1,tn-1,"sz_iili") ) { qf_n=qbn; qsf(bb_n,qf_n,","); wf_n=sfn;

          if ( vgl(bb_n,qb_n-7,qb_n-1) && vgl(qb_n,tn-9,tn-2) &&
               qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
               qir(qb_n+1,qf_n-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") &&
               qir(qf_n+1,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") && s(bb_n,tn-2) && zs(tn-1) )
          { l[i]=omo1; Z[905]++; if(dbg){print "Z905"}; stopp=ret=1; continue };
          if ( vgl(bb_n,qb_n-7,qb_n-1) && vgl(qb_n,tn-9,tn-2) && vgl(wf_n,qb_n,qf_n) &&
               qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
               qir(qb_n+1,wf_n,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") &&
               qir(wf_n+1,qf_n-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") &&
               qir(qf_n+1,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") && s(bb_n,wf_n-1) && s(wf_n+1,tn-2) && zs(tn-1) )
          { l[i]=omo1; Z[906]++; if(dbg){print "Z906"}; stopp=ret=1; continue };

      };};};

    # поиск по pre_ro + _gl_v_castle-iv: qb_n и bb_n
    if ( qb(tn-7,tn-2,"pre_ro") ) { qb_n=qbn; if ( bba(qb_n-6,qb_n-1,"_gl_v_castle-iv") ) { bb_n=bbn;

        if ( vgl(bb_n,qb_n-6,qb_n-1) && vgl(qb_n,tn-7,tn-2) &&
             qir(bb_n+1,qb_n-1,"mest_vi suw_vi prl_vi prq_vi mest_3e isname nar_any qast") &&
             qir(qb_n+1,tn-1,"prl_ro mest_ro suw_ro suw_edne prq_ro nar_any qast isname") && s(bb_n,tn-2) && zs(tn-1) )
        { l[i]=omo1; Z[907]++; if(dbg){print "Z907"}; stopp=ret=1; continue };
        if ( vgl(bb_n,qb_n-6,qb_n-1) && vgl(qb_n,tn-7,tn-2) &&
             qir(bb_n+1,qb_n-1,"mest_im suw_im prl_im prq_im mest_3e isname nar_any qast") &&
             qir(qb_n+1,tn-1,"prl_ro mest_ro suw_ro suw_edne prq_ro nar_any qast isname") && s(bb_n,tn-2) && zs(tn-1) )
        { l[i]=omo1; Z[908]++; if(dbg){print "Z908"}; stopp=ret=1; continue };
       };

    };
    # фразы-предлоги

    if ( vgl(Y["n-_gl_v_castle-iv"],tn-9,tn-1) ) { bb_n = Y["n-_gl_v_castle-iv"];
        if ( preph_ro(tn-2) &&
                  vgl(bb_n,xwn-4,xwn-1) &&
                  qir(bb_n+1,xwn-1,"mest_vi suw_vi prl_vi prq_vi mest_3e isname nar_any qast pre_any") &&
                    q(tn-1,"mest_ro suw_ro suw_edne isname") && s(bb_n,tn-1) )
        { l[i]=omo1; Z[909]++; if(dbg){print "Z909"}; stopp=ret=1; continue };

        if ( narph_any(tn-1) &&
                   veq(bb_n,xwn-1) && s(xnw-1,tn-1) )
        { l[i]=omo1; Z[910]++; if(dbg){print "Z910"}; stopp=ret=1; continue };
        if ( narph_any(tn-2) &&
                   veq(bb_n,xwn-1) &&
                     q(tn-1,"suw_vi suw_im mest_vi mest_im mest_3e isname nar_any") && s(xnw-1,tn-1) )
        { l[i]=omo1; Z[911]++; if(dbg){print "Z911"}; stopp=ret=1; continue };
        if ( narph_any(tn-1) &&
                   veq(bb_n,xwn-2) &&
                     q(xwn-1,"suw_vi mest_vi mest_3e isname nar_any") && s(xnw-2,tn-1) )
        { l[i]=omo1; Z[912]++; if(dbg){print "Z912"}; stopp=ret=1; continue };
    };

    if ( preph_ro(1) && zs(0) &&
                q(xwn+1,"isname") && s(xwn) )
    { l[i]=omo1; Z[913]++; if(dbg){print "Z913"}; stopp=ret=1; continue };

    if ( pre_tv(1) &&
              q(2,"suw_tv") &&
              q(3,"nar_spos") &&
             ba(4,"_gl_v_castle-iv") && s(0,3) )
    { l[i]=omo1; Z[914]++; if(dbg){print "Z914"}; stopp=ret=1; continue };

    if ( bfa(1,6,"_gl_v_castle-iv") ) { bf_n=bfn;

       cst="ключ";
       if ( vgl(bf_n,1,6) &&
             bf(bf_n+1,bf_n+3,cst) &&
            qir(bf_n+1,bfn-1,"prl_vi mest_vi mest_3e prq_vi") && s(0,bfn) )
       { bf_n=""; Z[915]++; if(dbg){print "Z915"}; };

       if ( vgl(bf_n,1,6) && s(0,bf_n-1) && Qf(1,bf_n,"sz_iili") )
       { l[i]=omo1; Z[916]++; if(dbg){print "Z916"}; stopp=ret=1; continue };
       if ( vgl(bf_n,1,6) && s(0,bf_n-1) &&
            sos(tn-9,tn-1) &&
          !(vgl(Y["n-_gl_v_lock-iv"],son,tn-1)||bba(son,tn-1,"_lock_parts") ) &&
             (w(bf_n-1,"и")||
            qxs(bf_n-2,"и","не") ) )
       { l[i]=omo1; Z[917]++; if(dbg){print "Z917"}; stopp=ret=1; continue };

    };

    if ( q(1,"narph_any") &&
       bfa(xwn+1,xwn+3,"_gl_v_castle-iv") && s(0,bfn-1) &&
       qir(xwn+1,bfn-1,"qast_any nar_any") )
    { l[i]=omo1; Z[918]++; if(dbg){print "Z918"}; stopp=ret=1; continue };
    if ( q(1,"suw_im mest_im isname") &&
         q(2,"narph_any") &&
       bfa(xwn+1,xwn+3,"_gl_v_castle-iv") && s(0,bfn-1) &&
       qir(xwn+1,bfn-1,"qast_any nar_any") )
    { l[i]=omo1; Z[919]++; if(dbg){print "Z919"}; stopp=ret=1; continue };


    # _gl_v_castle-iv: end

    if ( w(1,"к ко") && zs(0) &&
         q(2,"suw_odedda suw_odmnda isname mest_da") && s(1) )
    { l[i]=omo1; Z[920]++; if(dbg){print "Z920"}; stopp=ret=1; continue };
    if ( z(0) &&
         q(1,"sz") &&
         w(2,"к ко") &&
         q(3,"suw_odedda suw_odmnda isname mest_da") && s(1,2) )
    { l[i]=omo1; Z[921]++; if(dbg){print "Z921"}; stopp=ret=1; continue };

    cst="города деревни замка замков";
    if ( w(tn-2,"из") &&
        (w(tn-1,cst)||q(tn-1,"isname")) && s(tn-2,tn-1) &&
      !(bb(tn-6,tn-3,"выстрелить выпалить прицелиться") && s(bbn,tn-3)) )
    { l[i]=omo1; Z[922]++; if(dbg){print "Z922"}; stopp=ret=1; continue };

    if ( q(tn-2,"mest_da suw_da") &&
         q(tn-1,"mod_ed mod_mn mod_bz") && s(tn-2,tn-1) )
    { l[i]=omo1; Z[923]++; if(dbg){print "Z923"}; stopp=ret=1; continue };

    if ( w(tn-2,"к ко") &&
         q(tn-1,"mest_da suw_da isname") && s(tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[924]++; if(dbg){print "Z924"}; stopp=ret=1; continue };

    # prl как часть сказуемого
    cst="вхожий";
    if ( bw(tn-1,cst) && s(tn-1) )
    { l[i]=omo1; Z[925]++; if(dbg){print "Z925"}; stopp=ret=1; continue };
    if ( bw(1,cst) && s(0) )
    { l[i]=omo1; Z[926]++; if(dbg){print "Z926"}; stopp=ret=1; continue };
    if ( w(1,"не") &&
        bw(2,cst) && s(0,1) )
    { l[i]=omo1; Z[927]++; if(dbg){print "Z927"}; stopp=ret=1; continue };
    if ( q(1,"mest_im suw_im isname prl_kred_sr") &&
        bw(2,cst) && s(0,1) )
    { l[i]=omo1; Z[928]++; if(dbg){print "Z928"}; stopp=ret=1; continue };
    if ( q(1,"mest_im suw_im isname") &&
         w(2,"не") &&
        bw(3,cst) && s(0,2) )
    { l[i]=omo1; Z[929]++; if(dbg){print "Z929"}; stopp=ret=1; continue };
    #
    cst="ваш мой наш свой сей тот";
    if ( w(-1,cst) )
    { l[i]=omo1; Z[930]++; if(dbg){print "Z930"}; stopp=ret=1; continue };
  Y["tn_ok_vi"]="";
  }; # tn_ok=1 << в замок
break}; Y["TN_v_zamok_f"]=1; return ret }

function TN_na_zamok_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n) { stopp=v2s(Y["TN_na_zamok_f"]);
   while ( !stopp ) {

   if ( vex(Y["tn_ok_na"]) ) { tn=Y["n_pre_na"];

    if ( w(tn-1,"как") && z(0) &&
       qxw(1,"так","и","на") &&
       bfa(xwn+1,xwn+4,"_castle_environs") &&
       qir(xwn+1,bfn-1,"prl_vi mest_vi mest_3e prq_vi") && s(xwn,bfn-1) )
    { l[i]=omo1; Z[931]++; if(dbg){print "Z931"}; stopp=ret=1; continue };

    if ( qxs(tn-1,"не","только") && z(0) &&
         qxw(1,"но","и","на") &&
         bfa(xwn+1,xwn+4,"_locklike_things") &&
         qir(xwn+1,bfn-1,"prl_vi mest_vi mest_3e prq_vi") && s(xwn,bfn-1) )
    { l[i]=omo2; Z[932]++; if(dbg){print "Z932"}; stopp=ret=1; continue };

#   if ( vlt(tn-1,-1) && qia(tn+1,-1,"mest_3e mest_edmuvi mest_mnvi","prl_edmuvi prl_mnvi") &&
#        FN_castle_prl_f("_castle_prl") )
#   { l[i]=omo1; Z[933]++; if(dbg){print "Z933"}; stopp=ret=1; continue };
#   if ( vlt(tn-1,-1) && qia(tn+1,-1,"mest_3e mest_edmuvi mest_mnvi","prl_edmuvi prl_mnvi") &&
#        FN_lock_prl_true_f("_lock_prl") )
#   { l[i]=omo2; Z[934]++; if(dbg){print "Z934"}; stopp=ret=1; continue };

    cst="пасти пасть";
    if ( w(tn-1,cst) && s(tn-1) )
    { l[i]=omo2; Z[935]++; if(dbg){print "Z935"}; stopp=ret=1; continue };

    cst="закрывать закрыть запереть запирать";
    cst2="дорогу";
    if ( bw(tn-2,cst) &&
          w(tn-1,cst2) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[936]++; if(dbg){print "Z936"}; stopp=ret=1; continue };

    cst="брать взять прокладывать проложить";
    cst1="кредит курс";
    if ( bb(tn-6,tn-2,cst) && s(bbn,tn-1) &&
        qir(bbn+1,tn-2,"prl_vi mest_vi") &&
          w(tn-1,cst1) )
    { l[i]=omo1; Z[937]++; if(dbg){print "Z937"}; stopp=ret=1; continue };

    cst="положить";
    cst1="глаз";
    if ( bb(tn-6,tn-2,cst) && s(bbn,tn-1) &&
        qir(bbn+1,tn-2,"prl_vi mest_vi") &&
          w(tn-1,cst1) )
    { l[i]=omo1; Z[938]++; if(dbg){print "Z938"}; stopp=ret=1; continue };

    if ( bw(tn-2,"раскатать") &&
          w(tn-1,"губу губы") && s(tn-2,tn-1) )
    { l[i]=omo1; Z[939]++; if(dbg){print "Z939"}; stopp=ret=1; continue };

    cst="наложить";
    cst1="заклинание заклятие защита лапа чара";
    cst2="страж форма";
    if ( bb(tn-3,tn-1,cst) ) { bb_n=bbn;

       if ( vgl(bb_n,tn-3,tn-1) && s(bb_n,tn-1) &&
             bb(bb_n-5,bb_n-1,"дверь") )
       { l[i]=omo2; Z[940]++; if(dbg){print "Z940"}; stopp=ret=1; continue };

       if ( veq(bb_n,tn-1) && s(tn-1) &&
             bw(1,cst1) && s(0) )
       { l[i]=omo1; Z[941]++; if(dbg){print "Z941"}; stopp=ret=1; continue };
       if ( veq(bb_n,tn-1) && s(tn-1) &&
              q(1,"prl_vi mest_vi mest_3e") &&
             bw(2,cst1) && s(0,1) )
       { l[i]=omo1; Z[942]++; if(dbg){print "Z942"}; stopp=ret=1; continue };
       if ( veq(bb_n,tn-2) && s(tn-2,tn-1) &&
             bw(tn-1,cst1) )
       { l[i]=omo1; Z[943]++; if(dbg){print "Z943"}; stopp=ret=1; continue };

       if ( veq(bb_n,tn-1) && s(tn-1) &&
             bw(1,cst2) && s(0) )
       { l[i]=omo2; Z[944]++; if(dbg){print "Z944"}; stopp=ret=1; continue };

    };
    if ( bf(1,3,cst) ) { bf_n=bfn;

       if ( bw(tn-1,cst1) && s(tn-1) &&
           vgl(bf_n,1,3) && s(0,bf_n-1) &&
           qir(1,bf_n-1,"mod_any gl_aux_be") )
       { l[i]=omo1; Z[945]++; if(dbg){print "Z945"}; stopp=ret=1; continue };
       if ( vgl(bf_n,1,3) &&
             bf(bf_n+1,bf_n+4,cst1) && s(0,bf_n-1) &&
            qir(1,bf_n-1,"mod_any gl_aux_be") &&
            qir(bf_n+1,bfn-1,"mod_any gl_aux_be") )
       { l[i]=omo1; Z[946]++; if(dbg){print "Z946"}; stopp=ret=1; continue };
       if ( vgl(bf_n,1,3) &&
             bf(bf_n+1,bf_n+4,cst2) && s(0,bf_n-1) &&
            qir(1,bf_n-1,"mod_any gl_aux_be") &&
            qir(bf_n+1,bfn-1,"prl_vi mest_vi mest_3e") )
       { l[i]=omo2; Z[947]++; if(dbg){print "Z947"}; stopp=ret=1; continue };

    };

    cst="навести направить нацелить";
    cst1="дракона";
    cst2="автомат бластер излучатель ладонь лазер луч мушкет оружие пистолет пушку ружье ствол стволы";
    if ( bb(tn-5,tn-2,cst) && s(bbn,tn-1) &&
        qir(bbn+1,tn-2,"mest_vi prl_vi") &&
          w(tn-1,cst2) )
    { l[i]=omo2; Z[948]++; if(dbg){print "Z948"}; stopp=ret=1; continue };
    if ( bb(tn-5,tn-1,cst) && s(bbn,0) &&
        qir(bbn+1,tn-1,"mest_vi prl_vi") &&
          w(1,cst2) )
    { l[i]=omo2; Z[949]++; if(dbg){print "Z949"}; stopp=ret=1; continue };
    if ( bb(tn-5,tn-2,cst) && s(bbn,tn-1) &&
        qir(bbn+1,tn-2,"mest_vi prl_vi") &&
          w(tn-1,cst1) )
    { l[i]=omo1; Z[950]++; if(dbg){print "Z950"}; stopp=ret=1; continue };

    # _suw_na_castle:start
    if ( bba(tn-5,tn-1,"_suw_na_castle") ) { bb_n=bbn;

       if ( veq(bb_n,tn-1) && s(tn-1) )
       { l[i]=omo1; Z[951]++; if(dbg){print "Z951"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,tn-1) &&
            qir(bb_n+1,tn-1,"suw_tv prl_tv mest_tv prq_tv")  )
       { l[i]=omo1; Z[952]++; if(dbg){print "Z952"}; stopp=ret=1; continue };

    };

    if ( bfa(1,4,"_suw_na_castle") ) { bf_n=bfn;
       if ( vgl(bf_n,1,4) && s(0,bf_n-1) &&
              q(bf_n,"prl_vi") )
       { bf_n=""; Z[953]++; if(dbg){print "Z953"}; stopp=ret=1; };

       if ( vgl(bf_n,1,4) && s(0,bf_n-1) &&
            qir(1,bf_n-1,"gl_aux_be gl_in gl_ed gl_mn prq_kred")  )
       { l[i]=omo1; Z[954]++; if(dbg){print "Z954"}; stopp=ret=1; continue };

    };
    # _suw_na_castle:end

    # _suw_na_lock:start
    if ( bba(tn-5,tn-1,"_suw_na_lock") ) { bb_n=bbn;

       if ( veq(bb_n,tn-1) && s(tn-1) )
       { l[i]=omo2; Z[955]++; if(dbg){print "Z955"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,tn-1) &&
            qir(bb_n+1,tn-1,"suw_tv prl_tv mest_tv prq_tv")  )
       { l[i]=omo2; Z[956]++; if(dbg){print "Z956"}; stopp=ret=1; continue };

    };
    # _suw_na_lock:end

    # _gl_na_castle:start
    if ( bba(tn-5,tn-1,"_gl_na_castle") ) { bb_n=bbn;

       # pointesque
       if ( qxs(bb_n-1,"два","удара") &&
             bw(bb_n,"обрушиться") && s(tn-1) )
       { l[i]=omo2; Z[957]++; if(dbg){print "Z957"}; stopp=ret=1; continue };
       cst="накинуть";
       cst2="крючок цепочку";
       if ( bw(tn-1,cst) && s(tn-1) &&
             w(1,cst2) && s(0) )
       { l[i]=omo2; Z[958]++; if(dbg){print "Z958"}; stopp=ret=1; continue };
       # pointesque

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,tn-1) &&
            qir(bb_n+1,tn-1,"qast_any nar_any prl_kred_sr") )
       { l[i]=omo1; Z[959]++; if(dbg){print "Z959"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,tn-1) &&
            qir(bb_n+1,tn-2,"prl_vi prq_vi mest_vi mest_3e") &&
              q(tn-1,"suw_vi mest_vi mest_3e") )
       { l[i]=omo1; Z[960]++; if(dbg){print "Z960"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,tn-1) &&
            qir(bb_n+1,tn-2,"prl_im prq_im mest_im mest_3e") &&
              q(tn-1,"suw_im mest_im mest_3e") )
       { l[i]=omo1; Z[961]++; if(dbg){print "Z961"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,tn-1) &&
            qir(bb_n+1,tn-2,"prl_tv prq_tv mest_tv mest_3e") &&
              q(tn-1,"suw_tv mest_tv mest_3e") )
       { l[i]=omo1; Z[962]++; if(dbg){print "Z962"}; stopp=ret=1; continue };

    };

    if ( bfa(1,3,"_gl_na_castle") && s(0,bfn-1) &&
          Xw(bfn,"X_castle_pe") && Qf(1,bfn-1,"sz_iili pre_any") &&
        !bfa(1,bfn-1,"_suw_na_lock") )
    { l[i]=omo1; Z[963]++; if(dbg){print "Z963", bfn}; stopp=ret=1; continue };
    # _gl_na_castle:end

    # _gl_na_lock:start
    #
    if ( qb(tn-7,tn-1,"pre_vi") ) { qb_n=qbn; if ( bba(qb_n-5,qb_n-1,"_gl_na_lock") ) { bb_n=bbn;

       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any prl_kred_sr qast_any") &&
            qir(qb_n+1,tn-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any prl_kred_sr qast_any") )
       { l[i]=omo2; Z[964]++; if(dbg){print "Z964"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
              q(qb_n+1,"suw_vi") &&
            qir(qb_n+2,tn-1,"suw_ro prl_ro prq_ro mest_ro mest_3e nar_any prl_kred_sr qast") )
       { l[i]=omo2; Z[965]++; if(dbg){print "Z965"}; stopp=ret=1; continue };

    };};

    if ( qb(tn-7,tn-1,"pre_ro") ) { qb_n=qbn; if ( bba(qb_n-5,qb_n-1,"_gl_na_lock") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any isname qast_any") &&
            qir(qb_n+1,tn-1,"suw_ro prl_ro prq_ro mest_ro mest_3e nar_any prl_kred_sr qast_any") )
       { l[i]=omo2; Z[966]++; if(dbg){print "Z966"}; stopp=ret=1; continue };

    };};

    if ( qb(tn-7,tn-1,"pre_tv") ) { qb_n=qbn; if ( bba(qb_n-5,qb_n-1,"_gl_na_lock") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
            qir(qb_n+1,tn-1,"suw_tv prl_tv prq_tv mest_tv mest_3e nar_any prl_kred_sr qast_any") )
       { l[i]=omo2; Z[967]++; if(dbg){print "Z967"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
              q(qb_n+1,"suw_tv prl_tv prq_tv mest_tv isname") &&
              q(qb_n+2,"suw_vi") &&
            qir(qb_n+3,tn-1,"suw_ro prl_ro prq_ro mest_ro mest_3e nar_any prl_kred_sr qast_any") )
       { l[i]=omo2; Z[968]++; if(dbg){print "Z968"}; stopp=ret=1; continue };

    };};

    if ( qb(tn-7,tn-1,"pre_pr") ) { qb_n=qbn; if ( bba(qb_n-5,qb_n-1,"_gl_na_lock") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
            qir(qb_n+1,tn-1,"suw_pr prl_pr prq_pr mest_pr mest_3e nar_any prl_kred_sr qast_any") )
       { l[i]=omo2; Z[969]++; if(dbg){print "Z969"}; stopp=ret=1; continue };

    };};

    if ( qb(tn-7,tn-1,"pre_pr") ) { qb_n=qbn; if ( bba(qb_n-5,qb_n-1,"_gl_na_lock") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
              q(qb_n+1,"suw_pr") &&
            qir(qb_n+2,tn-1,"suw_ro prl_ro prq_ro mest_ro mest_3e nar_any prl_kred_sr qast_any") )
       { l[i]=omo2; Z[970]++; if(dbg){print "Z970"}; stopp=ret=1; continue };

    };};

    #
    if ( bba(tn-7,tn-1,"_gl_na_lock") ) { bb_n=bbn;

       if ( veq(bb_n,tn-1) && s(tn-1) )
       { l[i]=omo2; Z[971]++; if(dbg){print "Z971"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qia(bb_n+1,tn-1,"sz_i","suw_vi prl_vi prq_vi mest_vi mest_3e qast_any prl_kred_sr nar_any") )
       { l[i]=omo2; Z[972]++; if(dbg){print "Z972"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qir(bb_n+1,tn-1,"suw_im isname prl_im prq_im mest_im mest_3e qast nar_any prl_kred_sr") )
       { l[i]=omo2; Z[973]++; if(dbg){print "Z973"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
              q(bb_n+1,"suw_vi isname prl_vi prq_vi mest_vi mest_3e qast_any nar_any prl_kred_sr") &&
            qir(bb_n+2,tn-1,"suw_ro suw_edne prl_ro mest_ro") )
       { l[i]=omo2; Z[974]++; if(dbg){print "Z974"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qir(bb_n+1,tn-2,"suw_vi isname prl_vi prq_vi mest_vi mest_3e qast_any nar_any prl_kred_sr") &&
              q(tn-1,"suw_ro suw_edne") )
       { l[i]=omo2; Z[975]++; if(dbg){print "Z975"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qir(bb_n+1,tn-1,"suw_tv isname prl_tv prq_tv mest_tv mest_3e qast_any nar_any prl_kred_sr") )
       { l[i]=omo2; Z[976]++; if(dbg){print "Z976"}; stopp=ret=1; continue };

    };

    if ( bfa(1,5,"_gl_na_lock") ) { bf_n=bfn;

       if ( vgl(bf_n,1,5) && s(-1,bf_n-1) &&
             Qf(1,bf_n-1,"pre_any sz_iili") )
       { l[i]=omo2; Z[977]++; if(dbg){print "Z977"}; stopp=ret=1; continue };
       if ( vgl(bf_n,1,5) && s(-1,bf_n-1) &&
            qir(1,bf_n-1,"nar_any prl_kred_sr") )
       { l[i]=omo2; Z[978]++; if(dbg){print "Z978"}; stopp=ret=1; continue };
       if ( vgl(bf_n,1,5) && s(-1,bf_n-1) &&
            qir(1,bf_n-1,"nar_any prl_kred_sr qast_any") )
       { l[i]=omo2; Z[979]++; if(dbg){print "Z979"}; stopp=ret=1; continue };
       if ( vgl(bf_n,1,5) && s(-1,bf_n-1) &&
         pre_ro(1) &&
            qiz(2,bf_n-1,"nar_any prl_kred_sr prl_ro mest_ro mest_3e","qast_any suw_ro") )
       { l[i]=omo2; Z[980]++; if(dbg){print "Z980"}; stopp=ret=1; continue };
       if ( vgl(bf_n,1,5) && s(-1,bf_n-1) &&
         pre_pr(1) &&
            qiz(2,bf_n-1,"nar_any prl_kred_sr prl_pr mest_pr mest_3e","qast_any suw_pr") )
       { l[i]=omo2; Z[981]++; if(dbg){print "Z981"}; stopp=ret=1; continue };
       if ( vgl(bf_n,1,5) && s(-1,bf_n-1) &&
            qia(1,bf_n-1,"sz_i","nar_any prl_kred_sr prl_pr mest_pr mest_3e qast_any suw_pr") )
       { l[i]=omo2; Z[982]++; if(dbg){print "Z982"}; stopp=ret=1; continue };

    };
    # _gl_na_lock:end

    if ( qy(tn-1,"sz_iili") &&
         wb(tn-5-qyn,tn-2-qyn,"на") && s(wbn,tn-2-qyn) && zs(tn-1-qyn) &&
         ba(tn-1-qyn,"_castle_environs") &&
        qir(wbn+1,tn-2-qyn,"prl_vi mest_vi mest_3e prq_vi") )
    { l[i]=omo1; Z[983]++; if(dbg){print "Z983"}; stopp=ret=1; continue };
    if ( qy(tn-1,"sz_iili") &&
         wb(tn-5-qyn,tn-2-qyn,"на") && s(wbn,tn-2-qyn) && zs(tn-1-qyn) &&
         ba(wbn+1,"_castle_environs") &&
        qir(wbn+2,tn-1-qyn,"prl_ro mest_ro mest_3e prq_ro isname") )
    { l[i]=omo1; Z[984]++; if(dbg){print "Z984"}; stopp=ret=1; continue };

    # pointesque
    #
  Y["tn_ok_vi"]="";
  }; # tn_ok=1 << в замок
break}; Y["TN_na_zamok_f"]=1; return ret }

function TN_za_zamok_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n) { stopp=v2s(Y["TN_za_zamok_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_za"]) ) { tn=Y["n_pre_za"];

   cst1="закружить";
   cst2="цепляться";
   if ( bw(-5,cst1) && z(-5) &&
         q(-4,"nar_step") &&
         q(-3,"qast") &&
        bw(-2,cst2) &&
         w(-1,"за") && s(-4,-1) )
    { l[i]=omo1; Z[985]++; if(dbg){print "Z985"}; stopp=ret=1; continue };
    cst="держаться";
    if ( bw(-2,cst) &&
          w(-1,"за") && s(-2,-1) &&
       (qxs(1,"до","последнего")||
        qxs(1,"нет","смысла") ) )
    { l[i]=omo1; Z[986]++; if(dbg){print "Z986"}; stopp=ret=1; continue };

    cst="взяться держаться цепляться";
    if ( bw(-3,cst) &&
        qxs(-1,"за","мой твой наш ваш их свой этот тот ее её их его") )
    { l[i]=omo1; Z[987]++; if(dbg){print "Z987"}; stopp=ret=1; continue };
    cst1="взяться приняться";
    cst2="стена";
    if ( qxs(-3,"а","уж","потом") &&
          bw(xsn-1,cst2) && sc(xsn-1,"—") &&
          bw(-2,cst1) &&
           w(-1,"за") && s(-2,-1) )
    { l[i]=omo1; Z[988]++; if(dbg){print "Z988"}; stopp=ret=1; continue };
    if ( bw(-3,cst) &&
          w(-2,"за") &&
     isname(-1) && s(-3,-1) )
    { l[i]=omo1; Z[989]++; if(dbg){print "Z989"}; stopp=ret=1; continue };
    if ( bw(-2,cst) &&
          w(-1,"за") &&
    sz_iili(1) &&
         bw(2,"спалить сжечь сровнять снести") && s(-2,1) )
    { l[i]=omo1; Z[990]++; if(dbg){print "Z990"}; stopp=ret=1; continue };
    if ( wb(-5,-3,"нужно пора") &&
          w(-2,cst) &&
          w(-1,"за") && s(wbn,-1) )
    { l[i]=omo1; Z[991]++; if(dbg){print "Z991"}; stopp=ret=1; continue };
    if ( bw(-3,"хотеть") &&
          w(-2,cst) &&
          w(-1,"за") && s(-3,-1) )
    { l[i]=omo1; Z[992]++; if(dbg){print "Z992"}; stopp=ret=1; continue };
    cst1="когда крепко наконец основательно плотно";
    if ( w(-3,cst1) &&
        bw(-2,cst) &&
         w(-1,"за") && s(-3,-1) )
    { l[i]=omo1; Z[993]++; if(dbg){print "Z993"}; stopp=ret=1; continue };


    # _gl_za_lock <<<---:start
    if ( bba(tn-7,tn-1,"_gl_za_lock") ) { bb_n=bbn;

       if ( veq(bb_n,tn-1) && s(tn-1) )
       { l[i]=omo2; Z[994]++; if(dbg){print "Z994"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qia(bb_n+1,tn-2,"mest_im suw_im suw_edne","prl_vi mest_vi mest_3e prq_vi prl_kred_sr nar_any qast isname") &&
              q(tn-1,"suw_vi mest_vi mest_3e prl_kred_sr nar_any qast isname") )
       { l[i]=omo2; Z[995]++; if(dbg){print "Z995"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qir(bb_n+1,tn-2,"prl_tv mest_tv mest_3e prl_kred_sr nar_any") &&
              q(tn-1,"suw_tv mest_tv") )
       { l[i]=omo2; Z[996]++; if(dbg){print "Z996"}; stopp=ret=1; continue };

    };
    # _gl_za_lock <<<---:end

    # _gl_za_castle <<<---:start
    if ( bba(tn-7,tn-1,"_gl_za_castle") ) { bb_n=bbn;

       if ( veq(bb_n,tn-1) && s(tn-1) )
       { l[i]=omo1; Z[997]++; if(dbg){print "Z997"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qir(bb_n+1,tn-2,"prl_vi mest_vi mest_3e prq_vi prl_kred_sr nar_any qast_any isname") &&
              q(tn-1,"suw_vi mest_vi mest_3e prl_kred_sr nar_any qast isname") )
       { l[i]=omo1; Z[998]++; if(dbg){print "Z998"}; stopp=ret=1; continue };

    };

    if ( qb(tn-7,tn-1,"pre_vi") ) { qb_n=qbn; if ( bba(qb_n-5,qb_n-1,"_gl_za_castle") ) { bb_n=bbn;

        if ( vgl(qb_n,tn-7,tn-1) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-2) && zs(tn-1) &&
             qir(bb_n+1,qb_n-1,"suw_vi prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast") &&
             qir(qb_n+1,tn-2,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast") &&
               q(tn-1,"suw_vi mest_vi") )
        { l[i]=omo1; Z[999]++; if(dbg){print "Z999"}; stopp=ret=1; continue };

    };};
    # _gl_za_castle <<<---:end

    # _gl_za_lock --->>>:start
    if ( bfa(1,3,"_gl_za_lock") && s(0,bfn-1) && Qf(1,bfn-1,"sz_iili pre_any") )
    { l[i]=omo2; Z[1000]++; if(dbg){print "Z1000"}; stopp=ret=1; continue };
    # _gl_za_lock --->>>:end

    # _gl_za_castle --->>>:start
    if ( ba(1,"_gl_za_castle") && s(0) )
    { l[i]=omo1; Z[1001]++; if(dbg){print "Z1001"}; stopp=ret=1; continue };
    # _gl_za_castle --->>>:end

    # _suw_za_castle:start
    if ( ba(tn-1,"_suw_za_castle") && s(tn-1) )
    { l[i]=omo1; Z[1002]++; if(dbg){print "Z1002"}; stopp=ret=1; continue };
    # _suw_za_castle:end
   Y["tn_ok_vi"]="";
   }; # tn_ok
break}; Y["TN_za_zamok_f"]=1; return ret }

function TN_pod_zamok_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n) { stopp=v2s(Y["TN_pod_zamok_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_pod"]) ) { tn=Y["n_pre_pod"];

   cst="земля подкоп территория участок";
   if ( bw(-2,cst) &&
         w(-1,"под") && s(-2,-1) )
    { l[i]=omo1; Z[1003]++; if(dbg){print "Z1003"}; stopp=ret=1; continue };
    if ( w(-1,"под") &&
        bf(1,3,cst) && s(-1,bfn-1) )
    { l[i]=omo1; Z[1004]++; if(dbg){print "Z1004"}; stopp=ret=1; continue };

    # escape для место:start
    cst1="место";
    cst2="выбирать выбрать выделить искать найти находиться отыскать подыскать поискать приглядеть присмотреть";
    if ( bw(-4,cst2) &&
          q(-3,"nar_mest mest_da suw_da") &&
         bw(-2,cst1) &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[1005]++; if(dbg){print "Z1005"}; stopp=ret=1; continue };
    if ( bw(-3,cst2) &&
         bw(-2,cst1) &&
          w(-1,"под") && s(-3,-1) )
    { l[i]=omo1; Z[1006]++; if(dbg){print "Z1006"}; stopp=ret=1; continue };
    if ( bw(-3,cst1) &&
         bw(-2,cst2) &&
          w(-1,"под") && s(-3,-1) )
    { l[i]=omo1; Z[1007]++; if(dbg){print "Z1007"}; stopp=ret=1; continue };
    if ( bw(-2,cst1) &&
          w(-1,"под") &&
         bf(1,3,cst2) && s(-2,bfn-1) )
    { l[i]=omo1; Z[1008]++; if(dbg){print "Z1008"}; stopp=ret=1; continue };

    cst3="выбор поиск";
    if ( bw(-4,cst3) &&
          q(-3,"prl_ro") &&
         bw(-2,cst1) &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[1009]++; if(dbg){print "Z1009"}; stopp=ret=1; continue };

    cst3="уверенный";
    if ( bw(-4,cst3) &&
          w(-3,"насчет о") &&
         bw(-2,cst1) &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo1; Z[1010]++; if(dbg){print "Z1010"}; stopp=ret=1; continue };

    cst4="отправить отправиться отправлять отправляться сложить";
    if ( bw(-4,cst4) &&
          w(-3,"на") &&
         bw(-2,cst1) &&
          w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[1011]++; if(dbg){print "Z1011"}; stopp=ret=1; continue };
    if ( bw(-2,cst4) &&
          w(-1,"под") &&
          w(1,"в") &&
          q(2,"prl_vi prq_vi mest_vi mest_3e") &&
         bw(3,cst1) && s(-2,2) )
    { l[i]=omo2; Z[1012]++; if(dbg){print "Z1012"}; stopp=ret=1; continue };

    cst4="выжечь выжигать";
    if ( bw(-6,cst4) &&
          w(-5,"в") &&
          q(-4,"suw_pr mest_pr") &&
          q(-3,"suw_tv") &&
         bw(-2,cst1) &&
          w(-1,"под") && s(-6,-1) )
    { l[i]=omo2; Z[1013]++; if(dbg){print "Z1013"}; stopp=ret=1; continue };
    # escape для место:end


    # _gl_i_pod_lock:start
    if ( ba(-3,"_gl_i_pod_lock") && zs(-3) &&
        qxs(-1,"и","под") )
    { l[i]=omo2; Z[1014]++; if(dbg){print "Z1014"}; stopp=ret=1; continue };
    if ( ba(-4,"_gl_i_pod_lock") && zs(-4) &&
          q(-3,"mest_vi mest_3e suw_vi isname") &&
        qxs(-1,"и","под") )
    { l[i]=omo2; Z[1015]++; if(dbg){print "Z1015"}; stopp=ret=1; continue };
    # _gl_i_pod_lock:start

    # _gl_pod_lock:start
    if ( narph_any(tn-1) && s(xwn-1) &&
                ba(xwn-1,"_gl_pod_lock") && s(tn-1) )
    { l[i]=omo2; Z[1016]++; if(dbg){print "Z1016"}; stopp=ret=1; continue };
    if ( narph_any(tn-1) && s(xwn-2,xwn-1) &&
                ba(xwn-2,"_gl_pod_lock") &&
                 q(xwn-1,"suw_vi mest_vi mest_3e isname") && s(tn-1) )
    { l[i]=omo2; Z[1017]++; if(dbg){print "Z1017"}; stopp=ret=1; continue };
    if ( preph_tv(tn-2) &&
               ba(xwn-1,"_gl_pod_lock") &&
                q(tn-1,"suw_tv") && s(xwn-1,tn-1) )
    { l[i]=omo2; Z[1018]++; if(dbg){print "Z1018"}; stopp=ret=1; continue };

    # escape
    if ( ba(tn-3,"_suw_pod_castle") && z(tn-3) &&
          w(tn-2,"что") &&
        bam(tn-1,"_gl_pod_lock _gl_pod_castle") && s(tn-2,tn-1) )
    { l[i]=omo1; Z[1019]++; if(dbg){print "Z1019"}; stopp=ret=1; continue };
    cst="самый";
    cst1="ударить";
    cst2="кулаком ногой рукой";
    if ( bw(tn-2,cst1) &&
          w(tn-1,cst2) &&
          w(tn+1,cst) && s(tn-2) && zs(tn-1) )
    { l[i]=omo2; Z[1020]++; if(dbg){print "Z1020"}; stopp=ret=1; continue };
    if ( qxs(-1,"под","самый") )
    { l[i]=omo1; Z[1021]++; if(dbg){print "Z1021"}; stopp=ret=1; continue };


    # _gl_pod_lock:start
    if ( bba(tn-9,tn-1,"_gl_pod_lock") ) { bb_n=bbn;

        if ( vgl(bb_n,tn-9,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
             qir(bb_n+1,tn-1,"suw_vi suw_edne prl_vi prq_vi mest_vi mest_impe mest_3e qik_vi qis_vi qast prl_kred_sr isname nar_any") )
        { l[i]=omo2; Z[1022]++; if(dbg){print "Z1022"}; stopp=ret=1; continue };
        if ( vgl(bb_n,tn-9,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
             qir(bb_n+1,tn-2,"suw_vi suw_edne prl_vi prq_vi mest_vi mest_3e qik_vi qis_vi qast prl_kred_sr isname nar_any") &&
               q(tn-1,"isname suw_ro") )
        { l[i]=omo2; Z[1023]++; if(dbg){print "Z1023"}; stopp=ret=1; continue };
        if ( vgl(bb_n,tn-9,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
               q(bb_n+1,"isname suw_vi") &&
             qir(bb_n+2,tn-2,"suw_ro suw_edne prl_ro prq_ro mest_ro mest_3e qik_ro qis_ro qast prl_kred_sr isname nar_any") &&
               q(tn-1,"isname suw_ro") )
        { l[i]=omo2; Z[1024]++; if(dbg){print "Z1024"}; stopp=ret=1; continue };
        if ( vgl(bb_n,tn-9,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
             qir(bb_n+1,tn-1,"suw_tv suw_edne prl_tv prq_tv mest_tv mest_3e qik_tv qis_tv qast prl_kred_sr isname nar_any") )
        { l[i]=omo2; Z[1025]++; if(dbg){print "Z1025"}; stopp=ret=1; continue };
        if ( vgl(bb_n,tn-9,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
               q(bb_n+1,"isname suw_vi mest_vi mest_3e") &&
             qir(bb_n+2,tn-2,"suw_tv suw_edne prl_tv prq_tv mest_tv mest_3e qik_tv qis_tv qast prl_kred_sr isname nar_any") &&
               q(tn-1,"isname suw_tv") )
        { l[i]=omo2; Z[1026]++; if(dbg){print "Z1026"}; stopp=ret=1; continue };

    };

    #
    if ( qb(tn-5,tn-2,"pre_vi") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_pod_lock") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-5,tn-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast prl_kred_sr","suw_vi suw_edne isname") &&
            qiz(qb_n+1,tn-1,"prl_vi mest_vi prq_vi mest_3e qast","suw_vi suw_edne isname") )
       { l[i]=omo2; Z[1027]++; if(dbg){print "Z1027"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-5,tn-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast","suw_vi suw_edne isname") &&
            qiz(qb_n+1,tn-1,"suw_vi prl_vi mest_vi mest_3e qik_vi qast","suw_ro suw_edne isname") )
       { l[i]=omo2; Z[1028]++; if(dbg){print "Z1028"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-5,tn-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-2) && zs(tn-1) &&
             qf(bb_n+1,qb_n-1,"pre_tv") &&
            qiz(bb_n+1,qfn-1,"prl_vi prl_ro mest_vi mest_3e qast","suw_vi suw_edne isname") &&
            qiz(qfn+1,qb_n-1,"prl_tv mest_tv mest_3e prq_tv","suw_tv suw_edne isname") &&
            qiz(qb_n+1,tn-1,"suw_vi prl_vi mest_vi mest_3e qik_vi qast","suw_ro suw_edne isname") )
       { l[i]=omo2; Z[1029]++; if(dbg){print "Z1029"}; stopp=ret=1; continue };

    };};

    #
    if ( qb(tn-5,tn-2,"pre_ro") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_pod_lock") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-5,tn-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast prl_kred_sr","suw_vi suw_edne isname") &&
            qiz(qb_n+1,tn-1,"prl_ro mest_ro mest_3e qast","suw_ro suw_edne isname") )
       { l[i]=omo2; Z[1030]++; if(dbg){print "Z1030"}; stopp=ret=1; continue };

    };};

    if ( qb(tn-5,tn-2,"pre_tv") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_pod_lock") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-5,tn-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast prl_kred_sr","suw_vi suw_edne isname") &&
            qiz(qb_n+1,tn-1,"prl_tv mest_tv mest_3e qast","suw_tv suw_edne isname") )
       { l[i]=omo2; Z[1031]++; if(dbg){print "Z1031"}; stopp=ret=1; continue };

    };};

    if ( qb(tn-5,tn-2,"pre_pr") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_pod_lock") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-5,tn-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast prl_kred_sr","suw_vi suw_edne isname") &&
            qiz(qb_n+1,tn-1,"prl_pr mest_pr mest_3e qast","suw_pr suw_edne isname") )
       { l[i]=omo2; Z[1032]++; if(dbg){print "Z1032"}; stopp=ret=1; continue };

    };};

    if ( bfa(1,5,"_gl_pod_lock") && s(0,bfn-1) &&
          Qf(1,bfn-1,"pre_any sz_iili") )
    { l[i]=omo2; Z[1033]++; if(dbg){print "Z1033"}; stopp=ret=1; continue };

    if ( qf(1,3,"pre_ro") ) { qf_n=qfn;
      if ( bfa(qf_n+1,qf_n+5,"_gl_pod_lock") ) { bf_n=bfn;

       if ( vgl(qf_n,1,3) && vgl(bf_n,qf_n+1,qf_n+5) && s(0,bfn-1) &&
            qir(1,qf_n-1,"suw_vi prl_vi mest_vi mest_3e") &&
            qir(qf_n+1,bf_n-2,"prl_ro mest_ro mest_3e") &&
              q(bf_n-1,"suw_ro suw_edne") )
       { l[i]=omo2; Z[1034]++; if(dbg){print "Z1034"}; stopp=ret=1; continue };

    };};
    if ( q(1,"narph_any") &&
       bfa(xwn+1,xwn+3,"_gl_pod_lock") && s(0,bfn-1) &&
       qir(xwn+1,bfn-1,"qast_any") )
    { l[i]=omo2; Z[1035]++; if(dbg){print "Z1035"}; stopp=ret=1; continue };

    # _gl_pod_lock:end

    # _gl_pod_castle:start
    if ( bba(tn-9,tn-1,"_gl_pod_castle") ) { bb_n=bbn;

        if ( vgl(bb_n,tn-9,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
             qir(bb_n+1,tn-1,"suw_vi suw_edne prl_vi prq_vi mest_vi mest_impe mest_3e qik_vi qis_vi qast prl_kred_sr isname nar_any") )
        { l[i]=omo1; Z[1036]++; if(dbg){print "Z1036"}; stopp=ret=1; continue };

    };

    #
    if ( qb(tn-5,tn-1,"pre_vi") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_pod_castle") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-5,tn-1) && vgl(bb_n,qbn-5,qbn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast prl_kred_sr","suw_vi suw_edne isname") &&
            qiz(qb_n+1,tn-1,"prl_vi mest_vi prq_vi mest_3e qast","suw_vi suw_edne isname") )
       { l[i]=omo1; Z[1037]++; if(dbg){print "Z1037"}; stopp=ret=1; continue };

    };};

    #
    if ( qb(tn-5,tn-1,"pre_ro") ) { qb_n=qbn; if ( q(qb_n,"suw_tv") ) { qb(qb_n-4,qb_n-1,"pre_ro"); qb_n=qbn};
      if ( bba(qb_n-5,qb_n-1,"_gl_pod_castle") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-5,tn-1) && vgl(bb_n,qbn-5,qbn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast prl_kred_sr","suw_vi suw_edne isname") &&
            qiz(qb_n+1,tn-1,"prl_ro mest_ro mest_3e qast","suw_ro suw_edne isname") )
       { l[i]=omo1; Z[1038]++; if(dbg){print "Z1038"}; stopp=ret=1; continue };

       if ( vgl(qb_n,tn-5,tn-1) && vgl(bb_n,qbn-5,qbn-1) && s(bb_n,tn-2) && zs(tn-1) &&
             qy(bb_n+1,"pre_tv") &&
            qiz(bb_n+1+qyn,qb_n-1,"prl_tv prq_tv mest_tv mest_3e qast prl_kred_sr","suw_tv suw_edne isname") &&
            qir(qb_n+1,tn-1,"mest_ro suw_tv") )
       { l[i]=omo1; Z[1039]++; if(dbg){print "Z1039"}; stopp=ret=1; continue };

    };};

    if ( qb(tn-5,tn-1,"pre_tv") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_pod_castle") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-5,tn-1) && vgl(bb_n,qbn-5,qbn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast prl_kred_sr","suw_vi suw_edne isname") &&
            qiz(qb_n+1,tn-1,"prl_tv mest_tv mest_3e qast","suw_tv suw_edne isname") )
       { l[i]=omo1; Z[1040]++; if(dbg){print "Z1040"}; stopp=ret=1; continue };

    };};

    if ( bfa(1,5,"_gl_pod_castle") && s(0,bfn-1) &&
          Qf(1,bfn-1,"pre_any sz_iili") )
    { l[i]=omo1; Z[1041]++; if(dbg){print "Z1041"}; stopp=ret=1; continue };
    # _gl_pod_castle:end

    # _suw_pod_lock:start
    if ( bba(tn-4,tn-1,"_suw_pod_lock") ) { bb_n=bbn;
       if ( vgl(bb_n,tn-4,tn-1) && s(bb_n,-1) &&
            qir(bb_n+1,tn-1,"suw_vi prl_vi mest_vi mest_3e qast") )
       { l[i]=omo2; Z[1042]++; if(dbg){print "Z1042"}; stopp=ret=1; continue };
    };
    if ( bfa(1,3,"_suw_pod_lock") && s(0,bfn-1) )
    { l[i]=omo2; Z[1043]++; if(dbg){print "Z1043"}; stopp=ret=1; continue };
    # _suw_pod_lock:end

    # _suw_pod_castle:start
    if ( bba(tn-4,tn-1,"_suw_pod_castle") ) { bb_n=bbn;
       if ( vgl(bb_n,tn-4,tn-1) && s(bb_n,-1) &&
            qir(bb_n+1,tn-1,"suw_vi prl_vi mest_vi mest_3e qast") )
       { l[i]=omo1; Z[1044]++; if(dbg){print "Z1044"}; stopp=ret=1; continue };
    };
    if ( bfa(1,3,"_suw_pod_castle") && s(0,bfn-1) )
    { l[i]=omo1; Z[1045]++; if(dbg){print "Z1045"}; stopp=ret=1; continue };
    # _suw_pod_castle:end

    # _v_suw-vi_pod_lock:start
    if ( bba(tn-4,tn-1,"_v_suw-vi_pod_lock") ) { bb_n=bbn;
       if ( vgl(bb_n,tn-4,tn-1) &&
             wb(bb_n-4,bb_n-1,"в во") && s(wbn,-1) &&
            qir(wbn+1,bb_n-1,"prl_vi mest_vi mest_3e") &&
            qir(bb_n+1,tn-1,"gl_peed suw_vi prl_vi mest_vi mest_3e qast") )
       { l[i]=omo2; Z[1046]++; if(dbg){print "Z1046"}; stopp=ret=1; continue };
    };
    if ( w(1,"в во") && bfa(2,4,"_v_suw-vi_pod_lock") && s(0,bfn-1) &&
       qir(2,bfn-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo2; Z[1047]++; if(dbg){print "Z1047"}; stopp=ret=1; continue };
    # _suw_pod_lock:end

    if ( w(-3,"в во") &&
         q(-2,"suw_vi") &&
         w(-1,"под") && s(-3,-1) )
    { l[i]=omo2; Z[1048]++; if(dbg){print "Z1048"}; stopp=ret=1; continue };
    if ( w(-4,"в во") &&
         q(-3,"suw_vi") &&
         w(-2,"не") &&
         w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[1049]++; if(dbg){print "Z1049"}; stopp=ret=1; continue };
    if ( w(-1,"под") &&
         w(1,"в во") &&
         q(2,"suw_vi") && s(-1,1) )
    { l[i]=omo2; Z[1050]++; if(dbg){print "Z1050"}; stopp=ret=1; continue };

    if ( w(-1,"под") && p(-2) &&
         q(1,"prl_vi suw_vi mest_vi mest_3e") &&
         q(2,"mest_vi suw_vi") && s(-1,1) && p(2) )
    { l[i]=omo2; Z[1051]++; if(dbg){print "Z1051"}; stopp=ret=1; continue };
    if ( q(-3,"mest_vi prl_vi mest_3e") && p(-4) &&
         q(-2,"suw_vi") &&
         w(-1,"под") && s(-3,-1) && p(0) )
    { l[i]=omo2; Z[1052]++; if(dbg){print "Z1052"}; stopp=ret=1; continue };
    if ( q(-2,"mest_vi suw_vi") && p(-3) &&
         w(-1,"под") && s(-2,-1) && p(0) )
    { l[i]=omo2; Z[1053]++; if(dbg){print "Z1053"}; stopp=ret=1; continue };
    if ( pre_vi(-5) && p(-6) &&
              q(-4,"suw_vi") &&
              q(-3,"mest_vi mest_3e") &&
        sz_iili(-2) &&
              w(-1,"под") && s(-5,-1) )
    { l[i]=omo2; Z[1054]++; if(dbg){print "Z1054"}; stopp=ret=1; continue };

    if ( sc(-2,"—") &&
          w(-1,"под") && s(-1) && (p(0)||q_w(1,"sz_iili pre_any")) )
    { l[i]=omo2; Z[1055]++; if(dbg){print "Z1055"}; stopp=ret=1; continue };
    if ( w(-1,"под") &&
         q(1,"mest_vi mest_3e suw_odvi qis_vi isname") && s(-1,0) && (p(1)||q_w(2,"sz_iili pre_any")) &&
      !veq(Y["n+_castle_pe"],2)  )
    { l[i]=omo2; Z[1056]++; if(dbg){print "Z1056"}; stopp=ret=1; continue };
    if ( q(-2,"mest_vi mest_3e suw_odvi qis_vi sz") &&
         w(-1,"под") &&
         s(-2,-1) && p(-3) && (p(0)||q_w(1,"sz_iili pre_any")) )
    { l[i]=omo2; Z[1057]++; if(dbg){print "Z1057"}; stopp=ret=1; continue };
    if ( pre_vi(-3) && s(-3) &&
              q(-2,"suw_vi isname") && z(-2) &&
              w(-1,"под") && s(-1) && (p(0)||q_w(1,"sz_iili pre_any")) )
    { l[i]=omo2; Z[1058]++; if(dbg){print "Z1058"}; stopp=ret=1; continue };
    if ( pre_vi(-4) && s(-4,-3) &&
              q(-3,"prl_vi mest_vi mest_3e qast") &&
              q(-2,"suw_vi") && z(-2) &&
              w(-1,"под") && s(-1) && (p(0)||q_w(1,"sz_iili pre_any")) )
    { l[i]=omo2; Z[1059]++; if(dbg){print "Z1059"}; stopp=ret=1; continue };
    if ( pre_vi(-4) &&
              q(-3,"suw_vi") &&
        sz_iili(-2) &&
              w(-1,"под") && s(-4,-1) )
    { l[i]=omo2; Z[1060]++; if(dbg){print "Z1060"}; stopp=ret=1; continue };
   Y["tn_ok_vi"]="";
   } # tn_ok <<== end
break}; Y["TN_pod_zamok_f"]=1; return ret }

function TN_o_zamok_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n) { stopp=v2s(Y["TN_o_zamok_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_o"]) ) { tn=Y["n_pre_o"];

    if ( w(1,"чем что как") && (p(tn-1)||sc(tn-1,"[(«]")) && z(0) )
    { l[i]=omo1; Z[1061]++; if(dbg){print "Z1061"}; stopp=ret=1; continue };
    cst="разбиваться удариться";
    if ( (qxs(tn-2,"ветер")||
          qxs(tn-2,"луч","света") ) &&
           bw(tn-1,cst) && s(tn-1) )
    { l[i]=omo1; Z[1062]++; if(dbg){print "Z1062"}; stopp=ret=1; continue };
    if ( qxs(tn-1,"что","это","бьется") )
    { l[i]=omo1; Z[1063]++; if(dbg){print "Z1063"}; stopp=ret=1; continue };

    if ( bba(tn-5,tn-1,"_gl_o_lock") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_vi mest_vi mest_3e","suw_vi suw_edne") )
       { l[i]=omo2; Z[1064]++; if(dbg){print "Z1064"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_tv mest_tv mest_3e","suw_tv suw_edne") )
       { l[i]=omo2; Z[1065]++; if(dbg){print "Z1065"}; stopp=ret=1; continue };

    };

    if ( bba(tn-5,tn-1,"_suw_o_lock") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne") )
       { l[i]=omo2; Z[1066]++; if(dbg){print "Z1066"}; stopp=ret=1; continue };

    };

    if ( bfa(1,5,"_gl_o_lock") ) { bf_n=bfn;

       if ( vgl(bf_n,1,5) && s(1,bf_n-1) &&
             Qf(1,bf_n-1,"pre_any sz_iili") )
       { l[i]=omo2; Z[1067]++; if(dbg){print "Z1067"}; stopp=ret=1; continue };

    };

    if ( q(1,"prl_kred_sr") &&
   sz_iili(2) &&
         q(3,"prl_kred_sr") &&
        ba(4,"_gl_o_lock") && s(-1,3) )
    { l[i]=omo2; Z[1068]++; if(dbg){print "Z1068"}; stopp=ret=1; continue };
   Y["tn_ok_vi"]="";
   }; # tn_ok <<== end
break}; Y["TN_o_zamok_f"]=1; return ret }

function TN_po_zamok_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n) { stopp=v2s(Y["TN_po_zamok_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_po"]) ) { tn=Y["n_pre_po"];

    if ( bba(tn-5,tn-1,"_gl_po_lock") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qir(bb_n+1,tn-1,"prl_vi mest_vi mest_3e suw_vi suw_edne nar_any") )
       { l[i]=omo2; Z[1069]++; if(dbg){print "Z1069"}; stopp=ret=1; continue };

    };

   Y["tn_ok_vi"]="";
   }; # tn_ok <<== end
break}; Y["TN_po_zamok_f"]=1; return ret }

function TN_qerez_zamok_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n) { stopp=v2s(Y["TN_qerez_zamok_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_qerez"]) ) { tn=Y["n_pre_qerez"];

    if ( bba(tn-5,tn-1,"_suw_qerez_castle") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne") )
       { l[i]=omo1; Z[1070]++; if(dbg){print "Z1070"}; stopp=ret=1; continue };

    };
    if ( bba(tn-5,tn-1,"_gl_qerez_castle") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_vi mest_vi mest_3e","suw_vi suw_edne") )
       { l[i]=omo1; Z[1071]++; if(dbg){print "Z1071"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_tv mest_tv mest_3e","suw_tv suw_edne") )
       { l[i]=omo1; Z[1072]++; if(dbg){print "Z1072"}; stopp=ret=1; continue };

    };
    if ( bfa(1,5,"_gl_qerez_castle") ) { bf_n=bfn;

       if ( vgl(bf_n,1,5) && s(1,bf_n-1) &&
             Qf(1,bf_n-1,"pre_any sz_iili") )
       { l[i]=omo1; Z[1073]++; if(dbg){print "Z1073"}; stopp=ret=1; continue };

    };
    if ( q(1,"narph_any") &&
       bfa(xwn+1,xwn+3,"_gl_qerez_castle") && s(0,bfn-1) &&
       qir(xwn+1,bfn-1,"qast_any nar_any") )
    { l[i]=omo1; Z[1074]++; if(dbg){print "Z1074"}; stopp=ret=1; continue };
   Y["tn_ok_vi"]="";
   }; # tn_ok <<== end
break}; Y["TN_qerez_zamok_f"]=1; return ret }

function zamok_vi_pointesque_f(    ret, stopp) { stopp=Y["zamok_vi_pointesque_f"];
  while ( !stopp ) {

   if ( exf(1," Саакадзе и в изобилии суровую стражу") )
   { l[i]=omo1; Z[1075]++; if(dbg){print "Z1075"}; stopp=ret=1; continue };
   if ( exf(1,"\", в долине, но не в стране") )
   { l[i]=omo1; Z[1076]++; if(dbg){print "Z1076"}; stopp=ret=1; continue };
   if ( exf_(1," был не согласен менять розовый окрас на ") )
   { l[i]=omo1; Z[1077]++; if(dbg){print "Z1077"}; stopp=ret=1; continue };
   if ( exf_(1," был настоящий, не чета тому, бутафорскому,") )
   { l[i]=omo1; Z[1078]++; if(dbg){print "Z1078"}; stopp=ret=1; continue };
   if ( isname(1) && exf_(2," сама разносила с превеликой радостью на моих глазах, ") )
   { l[i]=omo1; Z[1079]++; if(dbg){print "Z1079"}; stopp=ret=1; continue };
   if ( exb_(-1,"Поле битвы смыло, его сменил ") )
   { l[i]=omo1; Z[1080]++; if(dbg){print "Z1080"}; stopp=ret=1; continue };
   if ( exb_(-1,"скелет был изуродован прямо как ") )
   { l[i]=omo1; Z[1081]++; if(dbg){print "Z1081"}; stopp=ret=1; continue };
   if ( exb_(-1," находится ныне кормило власти, опечатали мой ") )
   { l[i]=omo1; Z[1082]++; if(dbg){print "Z1082"}; stopp=ret=1; continue };

   if ( q(0,"isname") && exf(1,", Копну и Бочку") )
   { l[i]=omo2; Z[1083]++; if(dbg){print "Z1083"}; stopp=ret=1; continue };
   if ( exf(1," там старинный, ценный, ломать жалко") )
   { l[i]=omo2; Z[1084]++; if(dbg){print "Z1084"}; stopp=ret=1; continue };
   if ( exf(1," встречал хозяина с перекошенной от ужаса физиономией,") )
   { l[i]=omo2; Z[1085]++; if(dbg){print "Z1085"}; stopp=ret=1; continue };

   if ( exb_(-1,"пока этого не происходило, я поставила ") )
   { l[i]=omo2; Z[1086]++; if(dbg){print "Z1086"}; stopp=ret=1; continue };
   if ( exb_(-1,"у испанских переселенцев были только самые простые ") )
   { l[i]=omo2; Z[1087]++; if(dbg){print "Z1087"}; stopp=ret=1; continue };
   if ( exb_(-1," луч на световой ") )
   { l[i]=omo2; Z[1088]++; if(dbg){print "Z1088"}; stopp=ret=1; continue };
   if ( exb_(-1," маленький ключик, показывая мне, что ") )
   { l[i]=omo2; Z[1089]++; if(dbg){print "Z1089"}; stopp=ret=1; continue };
   if ( exb_(-1," в лучшем своём состоянии не с первого раза покоряя своей воле злосчастный ") )
   { l[i]=omo2; Z[1090]++; if(dbg){print "Z1090"}; stopp=ret=1; continue };
   if ( exb_(-1,"Дверь на нулевой уровень теперь надёжно хранил ") )
   { l[i]=omo2; Z[1091]++; if(dbg){print "Z1091"}; stopp=ret=1; continue };

   if ( w(-1,"изящный") && bw(-2,"осмотреть") && s(-2,-1) && z(0) &&
        q(1,"nar_spos prl_kred_sr") && bw(2,"выдохнуть") && s(1) )
   { l[i]=omo2; Z[1092]++; if(dbg){print "Z1092"}; stopp=ret=1; continue };

break}; Y["zamok_vi_pointesque_f"]=1; return ret }

function DEFINE_TN_OK_PRERO_ZAMKA(num,el) { # определение компонентов между "pre_ro" и "замка"
    tn=tn_ok="";
    tn=num;
#   cst_muvi="prl_edmuvi prl_mnvi mcop_edmuvi mcop_mnvi qis_vi qik_vi prq_edmuvi prq_mnvi qast_any mest_3e nar_kaq nar_step";
    cst1_edmuro="prl_edmuro mcop_edmuro qis_ro qik_ro prq_edmuro qast_any mest_3e nar_kaq nar_step";
    cst1_mnro="prl_mnro mcop_mnro qis_ro qik_ro prq_mnro qast_any mest_3e nar_kaq nar_step";
    cst2_edmuro="prl_edmuro prq_edmuro";
    cst2_mnro="prl_mnro prq_mnro";
    cst3_edmuro="prl_edmuro mcop_edmuro qis_ro qik_ro prq_edmuro suw_ro suw_edne";
    cst3_mnro="prl_mnro mcop_mnro qis_ro qik_ro prq_mnro suw_ro suw_edne";

    if ( w(0,"замка") )
    { cst1 = cst1_edmuro; cst2 = cst2_edmuro;  cst3 = cst3_edmuro; };
    if ( w(0,"замков") )
    { cst1 = cst1_mnro;   cst2 = cst2_mnro;    cst3 = cst3_mnro    };

    if ( hwy(-1,"то") && qir(tn+1,-1-hyn,cst1) && s(tn,-1) )
    { tn_ok = 1; Z[1093]++; if(dbg){print "Z1093", "-- tn_ok ON", el, "замка"};};
#   if ( !vex(tn_ok) && s(tn,-1) &&
#           q(tn+1,cst2) && wy(-1,"же") &&
#         qir(tn+2,-1-wyn,"mest_da suw_da prq_da nar_any prl_da") )
#   { tn_ok = 1; Z[1094]++; if(dbg){print "Z1094", "-- tn_ok ON", el, "замка"};};
#   if ( !vex(tn_ok) && s(tn,-1) &&
#           q(tn+1,cst2) &&
#         qir(tn+2,-2,"mest_tv prq_tv qik_tv nar_any prl_tv") &&
#           q(-1,"suw_tv mest_tv") )
#   { tn_ok = 1; Z[1095]++; if(dbg){print "Z1095", "-- tn_ok ON", el, "замка"};};
#   if ( !vex(tn_ok) && s(tn,-1) &&
#           q(tn+1,cst2) &&
#         qir(tn+2,-3,"mest_tv prq_tv qik_tv nar_any prl_tv") &&
#           q(-2,"suw_tv qik_tv") &&
#           q(-1,cst3) )
#   { tn_ok = 1; Z[1096]++; if(dbg){print "Z1096", "-- tn_ok ON", el, "замка"};};
#   if ( !vex(tn_ok) && s(tn,-1) &&
#           q(tn+1,cst2) &&
#           q(tn+2,"pre_vi") &&
#         qir(tn+3,-2,"prl_vi mest_vi mest_3e") &&
#           q(-1,"mest_vip3e suw_vi") )
#   { tn_ok = 1; Z[1097]++; if(dbg){print "Z1097", "-- tn_ok ON", el, "замка"};};
#   if ( !vex(tn_ok) && s(tn,-1) &&
#           q(tn+1,cst2) &&
#           q(tn+2,"pre_tv") &&
#         qir(tn+3,-2,"prl_tv mest_tv mest_3e") &&
#           q(-1,"suw_tv") )
#   { tn_ok = 1; Z[1098]++; if(dbg){print "Z1098", "-- tn_ok ON", el, "замка"};};
    cst="именно собственно";
    if ( !vex(tn_ok) && s(tn,-1) && qiw(tn+1,-1,cst1,cst) )
    { tn_ok = 1; Z[1099]++; if(dbg){print "Z1099", "-- tn_ok ON", el, "замка"};};
    if ( !vex(tn_ok) && s(-4) && zs(-3) && s(-2,-1) && veq(tn,-4) &&
            q(-3,cst2) && q(-2,"nar_any prl_kred_sr") && q(-1,cst2) )
    { tn_ok = 1; Z[1100]++; if(dbg){print "Z1100", "-- tn_ok ON", el, "замка"};};
    if ( !vex(tn_ok) && s(tn,-1) && veq(tn,-2) && wc(-1,"ского$|ного$") )
    { tn_ok = 1; Z[1101]++; if(dbg){print "Z1101", "-- tn_ok ON", el, "замка"};};
    if ( !vex(tn_ok) && zs(-2) && s(-1) && veq(tn,-3) &&
            q(-2,cst2) && wc(-1,"ского$|ного$") )
    { tn_ok = 1; Z[1102]++; if(dbg){print "Z1102", "-- tn_ok ON", el, "замка"};};
    if ( !vex(tn_ok) && s(tn,-1) && veq(tn,-4) &&
            q(-3,cst2) && q(-2,"sz_iili") && wc(-1,"ского$|ного$") )
    { tn_ok = 1; Z[1103]++; if(dbg){print "Z1103", "-- tn_ok ON", el, "замка"};};
    # передвижка tn_ok
    if ( vex(tn_ok) && s(tn,-1) &&
       ( qxs(tn-1,"как","и")||
         qxs(tn-1,"да","еще","и")||
         qxs(tn-1,"ведь даже же прямо сразу") ) )
    { tn = xsn; Z[1104]++; if(dbg){print "Z1104", "-- tn_ok MOV", el, "замка"};};
    # выключение tn_ok
#   if ( vex(tn_ok) && s(tn,-1) && qf(tn+1,-1,"prq_edmuvi prq_mnvi") &&
#        bam(qfn,"_castle_pe _lock_pe") &&
#          q(1,"suw_edmuvi suw_mnvi suw_edne") && s(0) )
#   { tn_ok = ""; Z[1105]++; if(dbg){print "Z1105", "-- tn_ok OFF", el, "замка"};};
#   if ( vex(tn_ok) && s(tn,-1) &&
#        qxs(-1,"прошлый тот этот","раз") )
#   { tn_ok = ""; Z[1106]++; if(dbg){print "Z1106", "-- tn_ok OFF", el, "замка"};};
}

function TN_do_zamka_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n) { stopp=v2s(Y["TN_do_zamka_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_do"]) ) { tn=Y["n_pre_do"];

#   if ( bba(tn-5,tn-1,"_suw_do_castle") ) { bb_n=bbn;

#      if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
#           qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne") )
#      { l[i]=omo1; Z[1107]++; if(dbg){print "Z1107"}; stopp=ret=1; continue };

#   };
    if ( bba(tn-5,tn-1,"_gl_do_castle-ro") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne") )
       { l[i]=omo1; Z[1108]++; if(dbg){print "Z1108"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne") )
       { l[i]=omo1; Z[1109]++; if(dbg){print "Z1109"}; stopp=ret=1; continue };

    };
    if ( bfa(1,5,"_gl_do_castle-ro") ) { bf_n=bfn;

       if ( vgl(bf_n,1,5) && s(1,bf_n-1) &&
             Qf(1,bf_n-1,"pre_any sz_iili") )
       { l[i]=omo1; Z[1110]++; if(dbg){print "Z1110"}; stopp=ret=1; continue };

    };

   }; # tn_ok <<== end
break}; Y["TN_do_zamka_f"]=1; return ret }

function FN_castle_prl_f(str_castle,    ret, stopp_str, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n) { stopp_str="FN" str_castle "_f"; stopp=v2s(Y[stopp_str]);
  while ( !stopp ) {

#   if ( vex(Y["tn_ok_na"]) && TN_na_zamok_f() )
#   { Z[1111]++; if(dbg){print "Z1111"}; stopp=ret=1; continue };
    if ( iwrd == "замок") {

       # _castle_prl:start
       if ( q(-1,"prl_edmuim prl_mnim prl_kred_mu") && ba(-1,str_castle) && s(-1) &&
         !(ba(-2,"_lock_pe") && s(-2)) )
       { l[i]=omo1; Z[1112]++; if(dbg){print "Z1112"}; stopp=ret=1; continue };
       if ( q(-2,"prl_edmuim prl_mnim prl_kred_mu") && ba(-2,str_castle) &&
            q(-1,"prl_any prq_any mest_any qast") && !(bam(-1,"_lock_prl _lock_pe")) && s(-2,-1) )
       { l[i]=omo1; Z[1113]++; if(dbg){print "Z1113"}; stopp=ret=1; continue };
       if ( q(-3,"prl_edmuim prl_mnim prl_kred_mu") && ba(-3,str_castle) &&
            q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
            q(-1,"prl_any prq_any mest_any qast") && !(bam(-1,"_lock_prl _lock_pe")) && s(-3,-1) )
       { l[i]=omo1; Z[1114]++; if(dbg){print "Z1114"}; stopp=ret=1; continue };
       if ( q(-4,"prl_edmuim prl_mnim prl_kred_mu") && ba(-4,str_castle) &&
            q(-3,"prl_any prq_any mest_any qast") && W(-3,"как") &&
            q(-2,"prl_any prq_any mest_any nar_any qast") && W(-2,"как") &&
            q(-1,"prl_any prq_any mest_any qast") && !(bam(-1,"_lock_prl _lock_pe")) && s(-4,-1) )
       { l[i]=omo1; Z[1115]++; if(dbg){print "Z1115"}; stopp=ret=1; continue };

       if ( q(1,"prl_edmuim prl_kred_mu") && w(0,"замок") && ba(1,str_castle) && s(0) &&
          Q_w(2,"suw_vi suw_im suw_edne") )
       { l[i]=omo1; Z[1116]++; if(dbg){print "Z1116"}; stopp=ret=1; continue };

       cst="массивный огромный";
       if ( w(-2,cst) &&
            w(-1,"как") && s(-2,-1) )
       { l[i]=omo1; Z[1117]++; if(dbg){print "Z1117"}; stopp=ret=1; continue };

          cst1="быть казаться оказаться стать считаться являться";
          if ( bf(1,3,cst1) ) { wf_n=bfn;
             if ( bfa(wf_n+1,wf_n+5,str_castle) ) { bf_n=bfn;
                if ( vgl(Y["n+_lock_pe"],wf_n+1,bf_n-1) ||
                     bfa(wf_n+1,bf_n-1,"_lock_prl") ||
                     vex(Y["tn_ok_vi"]) )
                { wf_n=bf_n=""; Z[1118]++; if(dbg){print "Z1118"}; };
                if ( s(bf_n,bf_n+1) && sz_iili(bf_n+1) && ba(bf_n+2,"_lock_prl") )
                { wf_n=bf_n=""; Z[1119]++; if(dbg){print "Z1119"}; };

                cst2="ключ отмычка";
                if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+5) && s(0,bf_n-1) && z(bf_n) &&
                      bf(bf_n+1,bf_n+5,cst2) )
                { l[i]=omo2; Z[1120]++; if(dbg){print "Z1120"}; stopp=ret=1; continue };

                if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+5) && s(0,bf_n-1) &&
                       q(bf_n,"prl_edmuim prl_mnim prl_edmutv prl_kred_mu") &&
                     qir(1,wf_n-1,"nar_any mod_any qast_any") &&
                     qir(wf_n+1,bf_n-1,"nar_any prq_kred_mu qast_any prl_edmuim prl_mnim prl_kred_sr predik prl_edmutv mest_im mest_tv mest_3e mest_da isname suw_da") )
                { l[i]=omo1; Z[1121]++; if(dbg){print "Z1121"}; stopp=ret=1; continue };
                if ( veq(wf_n,1) && veq(bf_n,3) && s(0) &&
                       q(2,"prl_edmuim prl_mnim prl_tv prl_kred_mu") && z(2) )
                { l[i]=omo1; Z[1122]++; if(dbg){print "Z1122"}; stopp=ret=1; continue };

          };};
          if ( bf(1,3,cst1) ) { wf_n=bfn;
             if ( bba(wf_n+1,wf_n+5,str_castle) ) { bb_n=bbn;

                if ( vgl(wf_n,1,3) && vgl(bb_n,wf_n+1,wf_n+5) && s(0,wf_n) &&
                       q(wf_n+1,"prl_edmuim prl_mnim prl_edmutv prl_kred_mu") && z(wf_n+1) &&
                       q(wf_n+2,"prl_edmuim prl_mnim prl_edmutv prl_kred_mu") &&
                       q(wf_n+3,"sz_iili") &&
                      ba(bb_n,"_castle_prl") && s(wf_n+2,bb_n-1) &&
                     qir(1,wf_n-1,"nar_any mod_any qast_any") &&
                     qir(wf_n+4,bb_n-1,"nar_any qast_any prl_kred_sr") )
                { l[i]=omo1; Z[1123]++; if(dbg){print "Z1123"}; stopp=ret=1; continue };
          };};
          cst1="ведь же там тут";
          if ( bf(1,3,cst1) ) { wf_n=bfn;
             if ( bfa(wf_n+1,wf_n+5,str_castle) ) { bf_n=bfn;
               if ( vgl(Y["n+_lock_pe"],wf_n+1,bf_n-1) ||
                    bfa(wf_n+1,bf_n-1,"_lock_prl") ||
                    vex(Y["tn_ok_vi"]) )
                { wf_n=bf_n=""; Z[1124]++; if(dbg){print "Z1124"}; };

                if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+5) && s(0,bf_n-1) &&
                       q(bf_n,"prl_edmuim prl_mnim prl_edmutv prl_kred_mu") &&
                     qir(1,wf_n-1,"nar_any qast_any") &&
                     qir(wf_n+1,bf_n-1,"nar_any prq_kred_mu qast_any prl_edmuim prl_mnim prl_kred_sr predik prl_edmutv mest_im mest_tv mest_3e") )
                { l[i]=omo1; Z[1125]++; if(dbg){print "Z1125"}; stopp=ret=1; continue };
                if ( veq(wf_n,1) && veq(bf_n,3) && s(0) &&
                       q(2,"prl_edmuim prl_mnim prl_tv prl_kred_mu") && z(2) )
                { l[i]=omo1; Z[1126]++; if(dbg){print "Z1126"}; stopp=ret=1; continue };
          };};

       cst2="быть делать казаться сделать стать считаться являться";
       if ( bb(-3,-1,cst2) &&
             q(1,"prl_tv") && ba(1,str_castle) && s(bbn,0) )
       { l[i]=omo1; Z[1127]++; if(dbg){print "Z1127"}; stopp=ret=1; continue };
    };
    if ( iwrd == "замка") {
       if ( q(-1,"prl_edmuro") && ba(-1,str_castle) && s(-1) &&
         !(ba(-2,"_lock_pe") && s(-2)) )
       { l[i]=omo1; Z[1128]++; if(dbg){print "Z1128"}; stopp=ret=1; continue };
       if ( s(-2,-1) && prl_edmuro(-2) && q(-1,"prl_edmuro") && ba(-2,str_castle) )
       { l[i]=omo1; Z[1129]++; if(dbg){print "Z1129"}; stopp=ret=1; continue };
    };
    if ( iwrd == "замку") {
       if ( q(-1,"prl_edmuda") && ba(-1,str_castle) && s(-1) &&
         !(ba(-2,"_lock_pe") && s(-2)) )
       { l[i]=omo1; Z[1130]++; if(dbg){print "Z1130"}; stopp=ret=1; continue };
       if ( s(-2,-1) && prl_edmuda(-2) && q(-1,"prl_edmuda") && ba(-2,str_castle) )
       { l[i]=omo1; Z[1131]++; if(dbg){print "Z1131"}; stopp=ret=1; continue };
       if ( q(1,"prl_edmuda") && (s(0)||se(0," — ")||sc(0,":")) && Q_w(2,"suw_edda") )
       { l[i]=omo1; Z[1132]++; if(dbg){print "Z1132"}; stopp=ret=1; continue };
    };
    if ( iwrd == "замком") {
       if ( q(-1,"prl_edmutv") && ba(-1,str_castle) && s(-1) &&
         !(ba(-2,"_lock_pe") && s(-2)) )
       { l[i]=omo1; Z[1133]++; if(dbg){print "Z1133"}; stopp=ret=1; continue };
       if ( s(-2,-1) && prl_edmutv(-2) && q(-1,"prl_edmutv") && ba(-2,str_castle) )
       { l[i]=omo1; Z[1134]++; if(dbg){print "Z1134"}; stopp=ret=1; continue };
    };
    if ( iwrd == "замке") {
       if ( q(-1,"prl_edmupr") && ba(-1,str_castle) && s(-1) &&
         !(ba(-2,"_lock_pe") && s(-2)) )
       { l[i]=omo1; Z[1135]++; if(dbg){print "Z1135"}; stopp=ret=1; continue };
       if ( s(-2,-1) && prl_edmupr(-2) && q(-1,"prl_edmupr") && ba(-2,str_castle) )
       { l[i]=omo1; Z[1136]++; if(dbg){print "Z1136"}; stopp=ret=1; continue };
    };
    if ( iwrd == "замки") {
       if ( s(-1) && prl_mnim(-1) && ba(-1,str_castle) )
       { l[i]=omo1; Z[1137]++; if(dbg){print "Z1137"}; stopp=ret=1; continue };
       if ( s(-2,-1) && prl_mnim(-2) && q(-1,"prl_mnim") && ba(-2,str_castle) )
       { l[i]=omo1; Z[1138]++; if(dbg){print "Z1138"}; stopp=ret=1; continue };
       if ( q(1,"prl_mnim prl_mntv qast_any") && q(2,"prl_mnim prl_mntv") &&
           ba(2,str_castle) && (zs(0)||se(0," — ")) && zs(1) )
       { l[i]=omo1; Z[1139]++; if(dbg){print "Z1139"}; stopp=ret=1; continue };
       if ( qb(1,5,"prl_mnim prl_mntv prl_krmn") && qir(1,qbn-1,"gl_aux_be qast_any nar_any prl_krmn muk_mnim") &&
            ba(qbn,str_castle) && (zs(0)||se(0," — ")) && s(1,qbn-1) && Q(qbn+1,"suw_mnim suw_mntv") )
       { l[i]=omo1; Z[1140]++; if(dbg){print "Z1140"}; stopp=ret=1; continue };
    };
    if ( iwrd == "замков") {
       if ( s(-1) && q(-1,"prl_mnro") && ba(-1,str_castle) )
       { l[i]=omo1; Z[1141]++; if(dbg){print "Z1141"}; stopp=ret=1; continue };
       if ( s(-2,-1) && prl_mnro(-2) && q(-1,"prl_mnro") && ba(-2,str_castle) )
       { l[i]=omo1; Z[1142]++; if(dbg){print "Z1142"}; stopp=ret=1; continue };
    };
    if ( iwrd == "замкам") {
       if ( s(-1) && q(-1,"prl_mnda") && ba(-1,str_castle) )
       { l[i]=omo1; Z[1143]++; if(dbg){print "Z1143"}; stopp=ret=1; continue };
       if ( s(-2,-1) && prl_mnda(-2) && q(-1,"prl_mnda") && ba(-2,str_castle) )
       { l[i]=omo1; Z[1144]++; if(dbg){print "Z1144"}; stopp=ret=1; continue };
    };
    if ( iwrd == "замками") {
       if ( s(-1) && q(-1,"prl_mntv") && ba(-1,str_castle) )
       { l[i]=omo1; Z[1145]++; if(dbg){print "Z1145"}; stopp=ret=1; continue };
       if ( s(-2,-1) && prl_mntv(-2) && q(-1,"prl_mntv") && ba(-2,str_castle) )
       { l[i]=omo1; Z[1146]++; if(dbg){print "Z1146"}; stopp=ret=1; continue };
    };
    if ( iwrd == "замках") {
       if ( s(-1) && q(-1,"prl_mnpr") && ba(-1,str_castle) )
       { l[i]=omo1; Z[1147]++; if(dbg){print "Z1147"}; stopp=ret=1; continue };
       if ( s(-2,-1) && prl_mnpr(-2) && q(-1,"prl_mnpr") && ba(-2,str_castle) )
       { l[i]=omo1; Z[1148]++; if(dbg){print "Z1148"}; stopp=ret=1; continue };
    };
    # _castle_prl:end
break}; Y[stopp_str]=1; return ret }

function FN_lock_prl_f(str_lock,    ret, stopp_str, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n) { stopp_str="FN" str_lock "_f"; stopp=v2s(Y[stopp_str]);
  while ( !stopp ) {
    # _lock_prl:escape
    cst="сложить";
    cst1="быть ведь же казаться стать считаться являться";
    if ( bw(1,cst) &&
          w(2,"из") && s(0,1) )
    { l[i]=omo1; Z[1149]++; if(dbg){print "Z1149"}; stopp=ret=1; continue };
    if ( bw(1,cst) && s(0) &&
       (qxs(2,"вовсе совсем никак отнюдь","не")||
        qxs(2,"не") ) &&
          w(xsn+1,"из") && s(xsn+1) )
    { l[i]=omo1; Z[1150]++; if(dbg){print "Z1150"}; stopp=ret=1; continue };
    if ( w(-5,"из") &&
         q(-4,"otsz_ro") &&
        bw(-3,cst1) &&
        bw(-2,cst) &&
         q(-1,"prl_vi mest_vi mest_3e") && s(-5,-1) )
    { l[i]=omo1; Z[1151]++; if(dbg){print "Z1151"}; stopp=ret=1; continue };
    # _lock_prl:escape

    # _lock_prl:start
    if ( s(-1) && ba(-1,"_castle_prl_geo") )
    { Z[1152]++; if(dbg){print "Z1152", "-- _castle_prl_geo -- break"}; stopp=1; ret=0; continue };

    cst="вернуться";
    if ( vex(Y["tn_ok_v"]) && vex(Y["n-_gl_v_castle-iv"]) && bw(Y["n-_gl_v_castle-iv"],cst) && TN_v_zamok_f() )
    { Z[1153]++; if(dbg){print "Z1153", "-- TN_v_zamok_f"}; stopp=ret=1; continue };
    if ( vex(Y["tn_ok_v"]) && vgl(Y["n-_suw_v_castle-vp"],Y["n_pre_v_ist"]-3,Y["n_pre_v_ist"]-1) && TN_v_zamok_f() )
    { Z[1154]++; if(dbg){print "Z1154", "-- TN_v_zamok_f"}; stopp=ret=1; continue };

    if ( iwrd == "замок" ) {

       if ( q(-1,"prl_edmuim prl_kred_mu") && ba(-1,str_lock) && s(-1) &&
          !wa(-1,"X_lock_prl") )
       { l[i]=omo2; Z[1155]++; if(dbg){print "Z1155"}; stopp=ret=1; continue };
       if ( q(-2,"prl_edmuim prl_kred_mu") && ba(-2,str_lock) && !wa(-2,"X_lock_prl") &&
            q(-1,"prl_edmuim mest_edmuvi prq_edmuim mest_3e qast_any nar_any prl_kred_sr gl_aux_be isname") && zs(-2) && s(-1)  )
       { l[i]=omo2; Z[1156]++; if(dbg){print "Z1156"}; stopp=ret=1; continue };
       if ( q(-3,"prl_edmuim prl_kred_mu") && ba(-3,str_lock) && zs(-3) &&
            q(-2,"prl_edmuim prl_kred_sr mest_edmuvi prq_edmuim mest_3e qast_any sz_iili") && zs(-2) &&
            q(-1,"prl_edmuim mest_edmuvi prq_edmuim mest_3e qast_any") && s(-1)  )
       { l[i]=omo2; Z[1157]++; if(dbg){print "Z1157"}; stopp=ret=1; continue };

       cst1="быть казаться оказаться стать считаться являться";
       if ( bf(1,3,cst1) ) { wf_n=bfn;
              if ( vex(Y["tn_ok_v"]) && TN_v_zamok_f() )
              { Z[1158]++; if(dbg){print "Z1158", "-- TN_v_zamok_f"}; stopp=ret=1; continue};

          if ( bfa(wf_n+1,wf_n+5,str_lock) ) { bf_n=bfn;
            if ( vgl(Y["n+_castle_pe"],wf_n+1,bf_n-1) ||
               ( bfa(wf_n+1,bf_n-1,"_castle_prl") && Q(bfn,"prl_kred_sr") ) ||
                 vex(Y["tn_ok_vi"]) ||
            ( isname(0) && s(-1) ) )
             { wf_n=bf_n=""; Z[1159]++; if(dbg){print "Z1159"}; };

             if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+5) && s(0,bf_n-1) &&
                    q(bf_n,"prl_edmuim prl_mnim prl_edmutv prl_kred_mu") &&
                  qir(1,wf_n-1,"nar_any qast_any") &&
                  qir(wf_n+1,bf_n-1,"nar_any prq_kred_mu qast_any prl_edmuim prl_mnim prl_kred_sr predik prl_edmutv mest_im mest_tv mest_3e") )
             { l[i]=omo2; Z[1160]++; if(dbg){print "Z1160"}; stopp=ret=1; continue };
             if ( veq(wf_n,1) && veq(bf_n,3) && s(0) &&
                    q(2,"prl_edmuim prl_mnim prl_tv prl_kred_mu") && z(2) )
             { l[i]=omo2; Z[1161]++; if(dbg){print "Z1161"}; stopp=ret=1; continue };

       };};
       cst1="ведь же там тут";
       if ( bf(1,3,cst1) ) { wf_n=bfn;
              if ( vex(Y["tn_ok_v"]) && TN_v_zamok_f() )
              { Z[1162]++; if(dbg){print "Z1162", "-- TN_v_zamok_f"}; stopp=ret=1; continue};

          if ( bfa(wf_n+1,wf_n+5,str_lock) ) { bf_n=bfn;
            if ( vgl(Y["n+_castle_pe"],wf_n+1,bf_n-1) || vex(Y["tn_ok_vi"]) )
            { wf_n=bf_n=""; Z[1163]++; if(dbg){print "Z1163"}; };

             if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+5) && s(0,bf_n-1) &&
                    q(bf_n,"prl_edmuim prl_mnim prl_edmutv prl_kred_mu") &&
                  qir(1,wf_n-1,"nar_any qast_any") &&
                  qir(wf_n+1,bf_n-1,"nar_any prq_kred_mu qast_any prl_edmuim prl_mnim prl_kred_sr predik prl_edmutv mest_im mest_tv mest_3e") )
             { l[i]=omo2; Z[1164]++; if(dbg){print "Z1164"}; stopp=ret=1; continue };
             if ( veq(wf_n,1) && veq(bf_n,3) && s(0) &&
                    q(2,"prl_edmuim prl_mnim prl_tv prl_kred_mu") && z(2) )
             { l[i]=omo2; Z[1165]++; if(dbg){print "Z1165"}; stopp=ret=1; continue };

       };};

       if ( q(1,"prl_edmuim prl_kred_mu") && ba(1,str_lock) && s(0) &&
          !wa(1,"X_lock_prl") && Q_w(2,"isname suw_im") )
       { l[i]=omo2; Z[1166]++; if(dbg){print "Z1166"}; stopp=ret=1; continue };
       if ( q(1,"nar_mest gl_aux_be prl_edmuim") &&
            q(2,"prl_edmuim prl_kred_mu") && ba(2,str_lock) && s(0,1) &&
          !wa(2,"X_lock_prl") && Q_w(3,"isname suw_im") )
       { l[i]=omo2; Z[1167]++; if(dbg){print "Z1167"}; stopp=ret=1; continue };
       if ( q(1,"nar_mest gl_aux_be") &&
            q(2,"prl_edmutv mest_edmutv prl_kred_mu") &&
            q(3,"prl_edmutv prl_kred_mu") &&
            q(4,"sz_iili") &&
            q(5,"prl_edmutv prl_kred_mu") && ba(5,str_lock) && s(0,4) )
       { l[i]=omo2; Z[1168]++; if(dbg){print "Z1168"}; stopp=ret=1; continue };

       # true
          if ( qf(2,6,"sz_i") && qiz(1,qfn-1,"gl_aux_be qast_any nar_any prl_kred_sr muk_edmuim muk_edmutv","prl_edmuim prl_edmutv") &&
                q(qfn+1,"prl_edmuim prl_edmutv") && ba(qfn+1,str_lock) && s(0,qfn) )
          { l[i]=omo2; Z[1169]++; if(dbg){print "Z1169"}; stopp=ret=1; continue };
          if ( q(1,"prl_edmuim prl_edmutv qast_any gl_aux_be") && qm(2,"prl_edmuim prl_edmutv",str_lock) && Q_w(3,"suw_edvi suw_edim suw_edtv") &&
             (zs(0)||se(0," — ")) && zs(1) )
          { l[i]=omo2; Z[1170]++; if(dbg){print "Z1170"}; stopp=ret=1; continue };
          cst="делать оставить оставлять сделать";
          if ( bb(-3,-1,cst) ) { bb_n=bbn;
              if ( qf(1,3,"prl_edmutv") && ba(qfn,str_lock) && s(bb_n,qfn-1) && Q_w(qfn+1,"suw_edtv") &&
                  qir(1,qfn-1,"nar_any qast_any") && qir(bb_n+1,-1,"nar_any qast_any mest_im suw_im isname prl_edmuvi mest_edmuvi mest_3e") )
              { l[i]=omo2; Z[1171]++; if(dbg){print "Z1171"}; stopp=ret=1; continue };
          };
       # true

    };
    if ( iwrd == "замки" ) {

       if ( q(-1,"prl_mnim prl_kred_mu") && ba(-1,str_lock) && s(-1) && !wa(-1,"X_lock_prl") )
       { l[i]=omo2; Z[1172]++; if(dbg){print "Z1172"}; stopp=ret=1; continue };

       if ( q(1,"prl_edmuim prl_mnim prl_kred_mu") && ba(1,str_lock) && s(0) && Q(2,"isname suw_im") )
       { l[i]=omo2; Z[1173]++; if(dbg){print "Z1173"}; stopp=ret=1; continue };

    };
    # _lock_prl:end
break}; Y[stopp_str]=1; return ret }

function FN_lock_prl_true_f(str_lock,    ret, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n) { stopp_str="FN" str_lock "_f"; stopp=v2s(Y[stopp_str]);
  while ( !stopp ) {
    # _lock_prl:escape
    if ( s(-1) && ba(-1,"_castle_prl_geo") )
    { Z[1174]++; if(dbg){print "Z1174", "-- _castle_prl_geo -- break"}; stopp=1; ret=0; continue };

    cst="вернуться";
    if ( vex(Y["tn_ok_v"]) && vex(Y["n-_gl_v_castle-iv"]) && bw(Y["n-_gl_v_castle-iv"],cst) && TN_v_zamok_f() )
    { Z[1175]++; if(dbg){print "Z1175", "-- TN_v_zamok_f"}; stopp=ret=1; continue };
    if ( vex(Y["tn_ok_v"]) && vgl(Y["n-_suw_v_castle-vp"],Y["n_pre_v_ist"]-3,Y["n_pre_v_ist"]-1) && TN_v_zamok_f() )
    { Z[1176]++; if(dbg){print "Z1176", "-- TN_v_zamok_f"}; stopp=ret=1; continue };
    # _lock_prl:escape


    # _lock_prl:start

       if ( iwrd == "замок") {
          if ( s(-1) && q(-1,"prl_edmuim prl_kred_mu") && ba(-1,str_lock) && !wa(-1,"X_lock_prl") )
          { l[i]=omo2; Z[1177]++; if(dbg){print "Z1177"}; stopp=ret=1; continue };
          if ( zs(-2) && s(-1) && qm(-2,"prl_edmuim prl_kred_mu",str_lock) && !wa(-2,"X_lock_prl") &&
                q(-1,"prl_edmuim mest_edmuvi prq_edmuim mest_3e qast_any nar_any prl_kred_sr gl_aux_be isname") && zs(-2) && s(-1)  )
          { l[i]=omo2; Z[1178]++; if(dbg){print "Z1178"}; stopp=ret=1; continue };
          if ( z(-3) && s(-2,-1) && qm(-3,"prl_edmuim",str_lock) && q(-2,"prl_edmuim prl_kred_sr nar_any sz_i") && q(-1,"prl_edmuim") )
          { l[i]=omo2; Z[1179]++; if(dbg){print "Z1179"}; stopp=ret=1; continue };
          if ( q(1,"prl_edmuim prl_edmutv qast_any gl_aux_be") && qm(2,"prl_edmuim prl_edmutv",str_lock) && Q_w(3,"suw_edvi suw_edim suw_edtv") &&
             (zs(0)||se(0," — ")) && zs(1) )
          { l[i]=omo2; Z[1180]++; if(dbg){print "Z1180"}; stopp=ret=1; continue };
          if ( qm(1,"prl_edmuim",str_lock) && (s(0)||se(0," — ")||sc(0,":")) && Q_w(2,"suw_edvi suw_edim suw_edtv") )
          { l[i]=omo2; Z[1181]++; if(dbg){print "Z1181"}; stopp=ret=1; continue };
          if ( qf(1,5,"prl_edmuim prl_edmutv prl_kred_mu") && qir(1,qfn-1,"gl_aux_be qast_any nar_any predik prl_kred_sr muk_edmuim") && !wa(qfn,"X_lock_prl") &&
               ba(qfn,str_lock) && (zs(0)||se(0," — ")) && s(1,qfn-1) && Q_w(qfn+1,"suw_edvi suw_edim suw_edtv") )
          { l[i]=omo2; Z[1182]++; if(dbg){print "Z1182"}; stopp=ret=1; continue };
          if ( qb(1,5,"prl_edmuim prl_edmutv prl_kred_mu") && qir(1,qbn-1,"gl_aux_be qast_any nar_any prl_kred_sr prl_edmuim prl_edmutv muk_edmuim") && !wa(qbn,"X_lock_prl") &&
               ba(qbn,str_lock) && (zs(0)||se(0," — ")) && s(1,qbn-1) && Q(qbn+1,"suw_edvi suw_edim suw_edtv") )
          { l[i]=omo2; Z[1183]++; if(dbg){print "Z1183"}; stopp=ret=1; continue };

          if ( q(1,"vvod") && z(0) && z(1) && qm(2,"prl_edmuim prl_kred_mu",str_lock) && Q_w(3,"suw_edvi suw_edim") )
          { l[i]=omo2; Z[1184]++; if(dbg){print "Z1184"}; stopp=ret=1; continue };
          if ( q(1,"nar_mest") && s(0) && q(2,"vvod") && z(1) && z(2) && qm(3,"prl_edmuim prl_kred_mu",str_lock) && Q_w(4,"suw_edvi suw_edim") )
          { l[i]=omo2; Z[1185]++; if(dbg){print "Z1185"}; stopp=ret=1; continue };
          if ( q(1,"nar_mest") && s(0) && q(2,"vvod") && z(1) && z(2) && q(3,"nar_spos") && qm(4,"prl_edmuim prl_kred_mu",str_lock) && Q_w(5,"suw_edvi suw_edim") )
          { l[i]=omo2; Z[1186]++; if(dbg){print "Z1186"}; stopp=ret=1; continue };

          if ( qf(1,5,"prl_edmuim prl_edmutv") && qir(1,qfn-1,"gl_aux_be qast_any nar_any prl_kred_sr") && z(qfn) &&
                q(qfn+1,"prl_edmuim prl_edmutv") && ba(qfn+1,str_lock) && s(0,qfn-1) )
          { l[i]=omo2; Z[1187]++; if(dbg){print "Z1187"}; stopp=ret=1; continue };
          if ( qf(2,6,"sz_i") && qiz(1,qfn-1,"gl_aux_be qast_any nar_any prl_kred_sr muk_edmuim muk_edmutv","prl_edmuim prl_edmutv") &&
                q(qfn+1,"prl_edmuim prl_edmutv") && ba(qfn+1,str_lock) && s(0,qfn) )
          { l[i]=omo2; Z[1188]++; if(dbg){print "Z1188"}; stopp=ret=1; continue };

          cst="казаться оказаться остаться показаться являться";
          if ( bf(1,3,cst) ) { wf_n=bfn;
              if ( qf(wf_n+1,wf_n+3,"prl_edmutv") && ba(qfn,str_lock) && s(0,qfn-1) && Q_w(qfn+1,"suw_edtv") &&
                  qir(1,wf_n-1,"nar_any qast_any") && qir(wf_n+1,qfn-1,"nar_any qast_any") )
              { l[i]=omo2; Z[1189]++; if(dbg){print "Z1189"}; stopp=ret=1; continue };
              if ( qb(wf_n+1,wf_n+3,"prl_edmutv") && ba(qbn,str_lock) && s(0,qbn-1) && Q_w(qfn+1,"suw_edtv") &&
                  qir(1,wf_n-1,"nar_any qast_any") && qir(wf_n+1,qbn-1,"nar_any qast_any prl_edmutv") )
              { l[i]=omo2; Z[1190]++; if(dbg){print "Z1190"}; stopp=ret=1; continue };
              if ( qf(wf_n+1,wf_n+3,"prl_edmuim prl_kred_mu") && ba(qfn,str_lock) && s(0,qfn-1) && Q_w(qfn+1,"suw_edvi suw_edim") &&
                  qir(1,wf_n-1,"nar_any qast_any") && qir(wf_n+1,qfn-1,"nar_any qast_any") )
              { l[i]=omo2; Z[1191]++; if(dbg){print "Z1191"}; stopp=ret=1; continue };
              if ( qb(wf_n+1,wf_n+3,"prl_edmuim prl_kred_mu") && ba(qbn,str_lock) && s(0,qbn-1) && Q_w(qfn+1,"suw_edvi suw_edim") &&
                  qir(1,wf_n-1,"nar_any qast_any") && qir(wf_n+1,qbn-1,"nar_any qast_any prl_edmuim") )
              { l[i]=omo2; Z[1192]++; if(dbg){print "Z1192"}; stopp=ret=1; continue };
          };
          cst="делать оставить оставлять сделать";
          if ( bb(-3,-1,cst) ) { bb_n=bbn;
              if ( qf(1,3,"prl_edmutv") && ba(qfn,str_lock) && s(bb_n,qfn-1) && Q_w(qfn+1,"suw_edtv") &&
                  qir(1,qfn-1,"nar_any qast_any") && qir(bb_n+1,-1,"nar_any qast_any mest_im suw_im isname prl_edmuvi mest_edmuvi mest_3e") )
              { l[i]=omo2; Z[1193]++; if(dbg){print "Z1193"}; stopp=ret=1; continue };
          };
       }; #замок
       if ( iwrd == "замка") {
          if ( s(-1) && q(-1,"prl_edmuro") && ba(-1,str_lock) )
          { l[i]=omo2; Z[1194]++; if(dbg){print "Z1194"}; stopp=ret=1; continue };
          if ( s(-2,-1) && prl_edmuro(-2) && q(-1,"prl_edmuro") && ba(-2,str_lock) )
          { l[i]=omo2; Z[1195]++; if(dbg){print "Z1195"}; stopp=ret=1; continue };
       };
       if ( iwrd == "замку") {
          if ( s(-1) && q(-1,"prl_edmuda") && ba(-1,str_lock) )
          { l[i]=omo2; Z[1196]++; if(dbg){print "Z1196"}; stopp=ret=1; continue };
          if ( s(-2,-1) && prl_edmuda(-2) && q(-1,"prl_edmuda") && ba(-2,str_lock) )
          { l[i]=omo2; Z[1197]++; if(dbg){print "Z1197"}; stopp=ret=1; continue };
          if ( q(1,"prl_edmuda") && (s(0)||se(0," — ")||sc(0,":")) && Q_w(2,"suw_edda") )
          { l[i]=omo2; Z[1198]++; if(dbg){print "Z1198"}; stopp=ret=1; continue };
       };
       if ( iwrd == "замком") {
          if ( s(-1) && q(-1,"prl_edmutv") && ba(-1,str_lock) )
          { l[i]=omo2; Z[1199]++; if(dbg){print "Z1199"}; stopp=ret=1; continue };
          if ( s(-2,-1) && prl_edmutv(-2) && q(-1,"prl_edmutv") && ba(-2,str_lock) )
          { l[i]=omo2; Z[1200]++; if(dbg){print "Z1200"}; stopp=ret=1; continue };
       };
       if ( iwrd == "замке") {
          if ( s(-1) && q(-1,"prl_edmupr") && ba(-1,str_lock) )
          { l[i]=omo2; Z[1201]++; if(dbg){print "Z1201"}; stopp=ret=1; continue };
          if ( s(-2,-1) && prl_edmupr(-2) && q(-1,"prl_edmupr") && ba(-2,str_lock) )
          { l[i]=omo2; Z[1202]++; if(dbg){print "Z1202"}; stopp=ret=1; continue };
       };
       if ( iwrd == "замки") {
          if ( s(-1) && q(-1,"prl_mnim prl_krmn") && ba(-1,str_lock) )
          { l[i]=omo2; Z[1203]++; if(dbg){print "Z1203"}; stopp=ret=1; continue };
          if ( s(-2,-1) && prl_mnim(-2) && q(-1,"prl_mnim") && ba(-2,str_lock) )
          { l[i]=omo2; Z[1204]++; if(dbg){print "Z1204"}; stopp=ret=1; continue };
          if ( q(1,"prl_mnim prl_mntv qast_any") && q(2,"prl_mnim prl_mntv") &&
              ba(2,str_lock) && (zs(0)||se(0," — ")) && zs(1) )
          { l[i]=omo2; Z[1205]++; if(dbg){print "Z1205"}; stopp=ret=1; continue };
          if ( qb(1,5,"prl_mnim prl_mntv prl_krmn") && qir(1,qbn-1,"gl_aux_be qast_any nar_any prl_krmn muk_mnim") &&
               ba(qbn,str_lock) && (zs(0)||se(0," — ")) && s(1,qbn-1) && Q(qbn+1,"suw_mnim suw_mntv") )
          { l[i]=omo2; Z[1206]++; if(dbg){print "Z1206"}; stopp=ret=1; continue };
       };
       if ( iwrd == "замков") {
          if ( s(-1) && q(-1,"prl_mnro") && ba(-1,str_lock) )
          { l[i]=omo2; Z[1207]++; if(dbg){print "Z1207"}; stopp=ret=1; continue };
          if ( s(-2,-1) && prl_mnro(-2) && q(-1,"prl_mnro") && ba(-2,str_lock) )
          { l[i]=omo2; Z[1208]++; if(dbg){print "Z1208"}; stopp=ret=1; continue };
       };
       if ( iwrd == "замкам") {
          if ( s(-1) && q(-1,"prl_mnda") && ba(-1,str_lock) )
          { l[i]=omo2; Z[1209]++; if(dbg){print "Z1209"}; stopp=ret=1; continue };
          if ( s(-2,-1) && prl_mnda(-2) && q(-1,"prl_mnda") && ba(-2,str_lock) )
          { l[i]=omo2; Z[1210]++; if(dbg){print "Z1210"}; stopp=ret=1; continue };
       };
       if ( iwrd == "замками") {
          if ( s(-1) && q(-1,"prl_mntv") && ba(-1,str_lock) )
          { l[i]=omo2; Z[1211]++; if(dbg){print "Z1211"}; stopp=ret=1; continue };
          if ( s(-2,-1) && prl_mntv(-2) && q(-1,"prl_mntv") && ba(-2,str_lock) )
          { l[i]=omo2; Z[1212]++; if(dbg){print "Z1212"}; stopp=ret=1; continue };
       };
       if ( iwrd == "замках") {
          if ( s(-1) && q(-1,"prl_mnpr") && ba(-1,str_lock) )
          { l[i]=omo2; Z[1213]++; if(dbg){print "Z1213"}; stopp=ret=1; continue };
          if ( s(-2,-1) && prl_mnpr(-2) && q(-1,"prl_mnpr") && ba(-2,str_lock) )
          { l[i]=omo2; Z[1214]++; if(dbg){print "Z1214"}; stopp=ret=1; continue };
       };
    # _lock_prl:end
break}; Y[stopp_str]=1; return ret }

function FN_zamok_suwro_f(    ret, stopp_str, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n) { stopp=v2s(Y["FN_zamok_suwro_f"]);
  while ( !stopp ) {
 # _castle_suw-ro:start
 cst8="крупнокалиберного";
 if ( wfa(1,5,"_castle_suw-ro") ) { wf_n=wfn;
    if ( vgl(wf_n,1,5) && s(0,wf_n-1) &&
        (wfa(1,wf_n-1,"_lock_suw-ro") || wf(1,wf_n-1,cst8) || ww_(-1,"под")) )
    { wf_n=""; Z[1215]++; if(dbg){print "Z1215"}; }; #check_!под
    cst3="ломать щелкнуть";
    if ( vgl(wf_n,1,5) && s(-1,wf_n-1) && bw(-1,cst3) )
    { wf_n=""; Z[1216]++; if(dbg){print "Z1216"}; };

    if ( vgl(wf_n,1,5) && s(0,wf_n-1) &&
         qir(1,wf_n-1,"prl_ro mest_ro prq_ro prl_kred_sr nar_step") )
    { l[i]=omo1; Z[1217]++; if(dbg){print "Z1217"}; stopp=ret=1; continue }; #check_!под
 };
 # _castle_suw-ro:end

 # _lock_suw-ro:start
 if ( wfa(1,5,"_lock_suw-ro") ) { wf_n=wfn;

       if ( vgl(wf_n,1,5) && s(-1,wf_n-1) &&
              w(-1,"разбившие") && w(wf_n,"пушки") &&
            qir(1,wf_n-1,"prl_ro mest_ro prq_ro qik_im qip_ro") )
       { l[i]=omo1; Z[1218]++; if(dbg){print "Z1218"}; stopp=ret=1; continue };

       if ( vgl(wf_n,1,5) && s(0,wf_n-1) && !( isname(wf_n)||isname(1) ) &&
            qir(1,wf_n-1,"prl_ro mest_ro prq_ro qik_im qip_ro") )
       { l[i]=omo2; Z[1219]++; if(dbg){print "Z1219"}; stopp=ret=1; continue };

 };
 # _lock_suw-ro:end
break}; Y["FN_zamok_suwro_f"]=1; return ret }

