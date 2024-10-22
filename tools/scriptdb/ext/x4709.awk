###   x4709 !_#_! ==> palate_    sky_    небо  нёбо  не́бо
 #    небо неба небу небом небе
function x4709_f() {
xgrp="x4709";for(wrd in omap[xgrp]){omakevars(xgrp);for(y=1;y<=wln;y++)        # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2


## собрать слова
#cst1="ие ий им ими их ого ом ому";
#if ( jme(-1,"ск",cst1) && isname(-1) )
#{ print l[i-1] >> "_prl_a.txt"; Z[1]++; if(dbg){print "Z1"}; }; continue
#if ( w(0,"небо") && wb(-4,-1,"в во") && s(wbn,-1) && qir(wbn+1,-1,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi qast") )
#{ print book[b]; Z[2]++; if(dbg){print "Z2"}; }; continue
#{ print book[b] >> "_va_nebo.txt"; Z[3]++; if(dbg){print "Z3"}; }; continue
#if ( w(0,"небо") && wb(-4,-1,"под") && s(wbn,-1) )
#{ print book[b] >> "_pod_nebo.txt"; Z[4]++; if(dbg){print "Z4"}; }; continue
#{ getBFx(-2,-2,"_glo.txt"); Z[5]++; if(dbg){print "Z5"}; }; continue
#if ( w(0,"небо") && bb(-9,-1,"заменить") && s(bbn,-1) )
#{ print book[b] >> "_pod_nebo.txt"; Z[6]++; if(dbg){print "Z6"}; }; continue
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

#getBFx(-4,4,"_an.txt"); Z[11]++; if(dbg){print "Z11"}; continue
 # forced:start
#if ( q(1,"isname") && s(0) )
#{ print l[i+1] >> "_isname.txt"; Z[12]++; if(dbg){print "Z12"}; }; continue

 # очистка переменных
 delete Y;

##
#cst="язычек десна глотка гортань альвеолы челюсти";
#if ( wb(-5,-1,cst) && !sos(wbn,-1) )
#{ l[i]=omo1; R[1586]++; if(dbg){print "R1586"}; continue };
#if ( wf(1,5,cst) && !eos(0,wfn-1) )
#{ l[i]=omo1; R[1586]++; if(dbg){print "R1586"}; continue };
##
#cst="мягкое расчепленное готическое расщепленное удлиненное вибрирующее надрезанное пересохшее ребристое трахея горло носоглотка ротоглотка губы зубы";
#if ( w(-1,cst) && s(-1) )
#{ l[i]=omo1; R[1586]++; if(dbg){print "R1586"}; continue };


 if ( bfa(1,7,"_palatelike_things")   ) { Y["n+_palatelike_things"]  = bfn; Y["w+_palatelike_things"]  = BFn; };
 if ( bba(-6,-1,"_palatelike_things") ) { Y["n-_palatelike_things"]  = bbn; Y["w-_palatelike_things"]  = BBn; };
 if ( bba(-6,-1,"_palate_environs")   ) { Y["n-_palate_environs"]    = bbn; Y["w-_palate_environs"]    = BBn; };
 if ( bfa(1,6,"_palate_environs")     ) { Y["n+_palate_environs"]    = bfn; Y["w+_palate_environs"]    = BFn; };
 if ( bba(-6,-1,"_skylike_things")   ) { Y["n-_skylike_things"]    = bbn; Y["w-_skylike_things"]    = BBn; };
 if ( bfa(1,6,"_skylike_things")     ) { Y["n+_skylike_things"]    = bfn; Y["w+_skylike_things"]    = BFn; };
#if ( bba(-6,-1,"_sky_parts")        ) { Y["n-_sky_parts"]         = bbn; Y["w-_sky_parts"]         = BBn; };
#if ( bfa(1,6,"_sky_parts")          ) { Y["n+_sky_parts"]         = bfn; Y["w+_sky_parts"]         = BFn; };

 if ( iwrd=="небо" )  { Y["iwrd_case"]="iv"; Y["iwrd_form"]="ediv"; if(dbg){print "небо: им+вин, ед+мн"};

   cst="в во за на о по под подо через";
   if ( wb(-8,-1,cst) ) { qb_n=wbn;

     if ( wb(-8,-1,"в во")   )  { Y["n_pre_v_ist"]     = wbn; sw="в"     };
     if ( wb(-8,-1,"на")     )  { Y["n_pre_na_ist"]    = wbn; sw="на"    };
     if ( wb(-5,-1,"за")     )  { Y["n_pre_za_ist"]    = wbn; sw="за"    };
     if ( wb(-5,-1,"под подо")) { Y["n_pre_pod_ist"]   = wbn; sw="под"   };
     if ( wb(-5,-1,"о")      )  { Y["n_pre_o_ist"]     = wbn; sw="о"     };
     if ( wb(-5,-1,"по")     )  { Y["n_pre_po_ist"]    = wbn; sw="по"    };
     if ( wb(-5,-1,"через")  )  { Y["n_pre_qerez_ist"] = wbn; sw="через" };

     if ( vex(Y["n_pre_v_ist"])  ) {
       DEF_TN_PREVI_NEBO(Y["n_pre_v_ist"],"в во"); Y["n_pre_v"] = tn; Y["tn_ok_v"] = Y["tn_ok_vi"] = Y["tn_ok_any"] = tn_ok ; # TN_v_nebo_f()
       if ( vex(Y["tn_ok_v"]) ) { tn=Y["n_pre_v"];

          if ( bba(tn-9,tn-1,"_gl_v_palate-iv")  ) { Y["n-_gl_v_palate-iv"]  = bbn; Y["w-_gl_v_palate-iv"]  = BBn; };
          if ( bba(tn-9,tn-1,"_gl_v_sky-iv")    ) { Y["n-_gl_v_sky-iv"]    = bbn; Y["w-_gl_v_sky-iv"]    = BBn; };
          if ( bba(tn-6,tn-1,"_suw_v_palate-vp") ) { Y["n-_suw_v_palate-vp"] = bbn; Y["w-_suw_v_palate-vp"] = BBn; }; };

     }; #

     if ( vex(Y["n_pre_na_ist"])    ) {
       DEF_TN_PREVI_NEBO(Y["n_pre_na_ist"],"на"); Y["n_pre_na"] = tn; Y["tn_ok_na"] = Y["tn_ok_vi"] = Y["tn_ok_any"] = tn_ok ; # TN_na_nebo_f()
       if ( vex(Y["tn_ok_na"]) ) { tn=Y["n_pre_na"];

          if ( bba(tn-7,tn-1,"_gl_na_palate")  ) { Y["n-_gl_na_palate"]  = bbn; Y["w-_gl_na_palate"]  = BBn; };
          if ( bba(tn-7,tn-1,"_gl_na_sky")    ) { Y["n-_gl_na_sky"]    = bbn; Y["w-_gl_na_sky"]    = BBn; };
          if ( bba(tn-5,tn-1,"_suw_na_palate") ) { Y["n-_suw_na_palate"] = bbn; Y["w-_suw_na_palate"] = BBn; };
          if ( bba(tn-5,tn-1,"_suw_na_sky") )   { Y["n-_suw_na_sky"]   = bbn; Y["w-_suw_na_sky"]   = BBn; }; };

       }; #

     # определить, прикреплен ли к омографу предлог
     if ( vex(Y["n_pre_za_ist"])    ) { DEF_TN_PREVI_NEBO(Y["n_pre_za_ist"],   "за");    Y["n_pre_za"]   =tn; Y["tn_ok_za"]   =Y["tn_ok_vi"]=Y["tn_ok_any"]=tn_ok }; # TN_za_nebo_f()
     if ( vex(Y["n_pre_pod_ist"])   ) { DEF_TN_PREVI_NEBO(Y["n_pre_pod_ist"],  "под");   Y["n_pre_pod"]  =tn; Y["tn_ok_pod"]  =Y["tn_ok_vi"]=Y["tn_ok_any"]=tn_ok }; # TN_pod_nebo_f()
       if ( vex(Y["tn_ok_pod"]) ) { tn=Y["n_pre_pod"];
          if ( bba(tn-7,tn-1,"_gl_pod_palate")  ) { Y["n-_gl_pod_palate"]  = bbn; Y["w-_gl_pod_palate"]  = BBn; };
          if ( bba(tn-7,tn-1,"_gl_pod_sky")    ) { Y["n-_gl_pod_sky"]    = bbn; Y["w-_gl_pod_sky"]    = BBn; }; };
     if ( vex(Y["n_pre_o_ist"])     ) { DEF_TN_PREVI_NEBO(Y["n_pre_o_ist"],    "о");     Y["n_pre_o"]    =tn; Y["tn_ok_o"]    =Y["tn_ok_vi"]=Y["tn_ok_any"]=tn_ok }; # TN_o_nebo_f()
     if ( vex(Y["n_pre_po_ist"])    ) { DEF_TN_PREVI_NEBO(Y["n_pre_po_ist"],   "по");    Y["n_pre_po"]   =tn; Y["tn_ok_po"]   =Y["tn_ok_vi"]=Y["tn_ok_any"]=tn_ok }; # TN_po_nebo_f()
     if ( vex(Y["n_pre_qerez_ist"]) ) { DEF_TN_PREVI_NEBO(Y["n_pre_qerez_ist"],"через"); Y["n_pre_qerez"]=tn; Y["tn_ok_qerez"]=Y["tn_ok_vi"]=Y["tn_ok_any"]=tn_ok }; # TN_qerez_nebo_f()
  }; #<== pre_vi

    bba(-7,-1,"_sky_pe");   Y["n-_sky_pe"]    = bbn; Y["w-_sky_pe"]           = BBn;
    bfa(1,6,  "_sky_pe");   Y["n+_sky_pe"]    = bfn; Y["w+_sky_pe"]           = BFn;
    bba(-7,-1,"_palate_pe"); Y["n-_palate_pe"]  = bb_n = bbn; Y["w-_palate_pe"]  = BBn;
       if ( wa(bb_n,"X_suw_palate_pe") ) { bba(-7,bb_n-1,"_palate_pe"); Y["n-_palate_pe"] = bbn; Y["w-_palate_pe"] = BBn };
    bfa(1,6,  "_palate_pe"); Y["n+_palate_pe"]  = bfn; Y["w+_palate_pe"]         = BFn;
    bba(-7,-1,"_gl_nebo");  Y["n-_gl_nebo"]   = bbn; Y["w-_gl_nebo"]          = BBn;
    bfa(1,6,  "_gl_nebo");  Y["n+_gl_nebo"]   = bf_n = bfn; Y["w+_gl_nebo"]   = BFn;
       if ( vex(Y["n+_gl_nebo"]) && q(bf_n,"mod_any") ) { if ( s(0,bf_n-1) && bfa(bf_n+1,6,"_gl_nebo") && q(bfn,"gl_in prq_kred_mu prq_krmn") && s(bf_n,bfn-1) )
       { Y["n+_gl_nebo"] = bfn; Y["w+_gl_nebo"] = BFn }; };
       cst="казаться оказаться считаться являться";
       if ( vex(Y["n+_gl_nebo"]) && weq(Y["w+_gl_nebo"],cst) ) { if ( s(0,bf_n-1) && bfa(bf_n+1,6,"_gl_nebo") && q(bfn,"prq_tv") && s(bf_n,bfn-1) )
       { Y["n+_gl_nebo"] = bfn; Y["w+_gl_nebo"] = BFn }; };


#if ( vex(Y["tn_ok_v"]) && wf(1,4,"на") && s(0,wfn-1) )
#{ print book[b] >> "_vna.txt"; Z[16]++; if(dbg){print "Z16"}; }; continue

    # pointesque <<-- складываем сюда исключения или случаи с опорными словами
    if ( FN_nebo_vi_esc_f(0) )
    { Z[17]++; if(dbg){print "Z17", "-- is_escape!"}; continue };
    # pointesque

 };
 #
 if (iwrd=="неба" ) { Y["iwrd_case"]="ro"; Y["iwrd_form"]="edro"; if(dbg){print "небо: ро, ед+мн"};
    # определить, прикреплен ли к омографу предлог
   cst="до из изо от ото внутри вокруг у";
   if ( wb(-5,-1,cst) ) { qb_n=Y["n-_pre_ro"]=wbn; Y["w-_pre_ro"]=WBn;
     if ( wb(-5,-1,"до") ) { DEF_TN_PRERO_NEBA(wbn,"до"); Y["n_pre_do"] = tn; Y["tn_ok_do"]=Y["tn_ok_ro"]=Y["tn_ok_any"]=tn_ok }; # TN_do_neba_f()
     if ( vex(Y["tn_ok_do"]) ) { tn=Y["n_pre_do"];
        if ( bba(tn-9,tn-1,"_gl_do_palate-ro")  ) { Y["n-_gl_do_palate-ro"]  = bbn }; };

     if ( wb(-5,-1,"от ото") ) { DEF_TN_PRERO_NEBA(wbn,"от"); Y["n_pre_ot"] = tn; Y["tn_ok_ot"]=Y["tn_ok_ro"]=Y["tn_ok_any"]=tn_ok }; # TN_ot_neba_f()
     if ( vex(Y["tn_ok_ot"]) ) { tn=Y["n_pre_ot"];
        if ( bba(tn-9,tn-1,"_gl_ot_palate-ro")  ) { Y["n-_gl_ot_palate-ro"]  = bbn }; };

     if ( wb(-5,-1,"из изо") ) { DEF_TN_PRERO_NEBA(wbn,"из"); Y["n_pre_iz"] = tn; Y["tn_ok_iz"]=Y["tn_ok_ro"]=Y["tn_ok_any"]=tn_ok }; # TN_iz_neba_f()
     if ( vex(Y["tn_ok_iz"]) ) { tn=Y["n_pre_iz"];
        if ( bba(tn-9,tn-1,"_gl_iz_palate-ro")  ) { Y["n-_gl_iz_palate-ro"]  = bbn }; };

     if ( wb(-5,-1,"внутри") ) { DEF_TN_PRERO_NEBA(wbn,"внутри"); Y["n_pre_vnutri"] = tn; Y["tn_ok_vnutri"]=Y["tn_ok_ro"]=Y["tn_ok_any"]=tn_ok }; # TN_vnutri_neba_f()
     if ( vex(Y["tn_ok_vnutri"]) ) { tn=Y["n_pre_vnutri"];
        if ( bba(tn-5,tn-1,"_suw_vnutri_palate-ro")  ) { Y["n-_suw_vnutri_palate-ro"]  = bbn }; };

     if ( wb(-5,-1,"вокруг") ) { DEF_TN_PRERO_NEBA(wbn,"вокруг"); Y["n_pre_vokrug"] = tn; Y["tn_ok_vokrug"]=Y["tn_ok_ro"]=Y["tn_ok_any"]=tn_ok }; # TN_vokrug_neba_f()
     if ( vex(Y["tn_ok_vokrug"]) ) { tn=Y["n_pre_vokrug"];
        if ( bba(tn-5,tn-1,"_suw_vokrug_palate-ro")  ) { Y["n-_suw_vokrug_palate-ro"]  = bbn }; };

     if ( wb(-5,-1,"у") ) { DEF_TN_PRERO_NEBA(wbn,"у"); Y["n_pre_u"] = tn; Y["tn_ok_u"]=Y["tn_ok_ro"]=Y["tn_ok_any"]=tn_ok }; # TN_u_neba_f()
     if ( vex(Y["tn_ok_u"]) ) { tn=Y["n_pre_u"];
        if ( bba(tn-5,tn-1,"_suw_u_palate-ro")  ) { Y["n-_suw_u_palate-ro"] = bbn }; };
    };

    # hwro
    if ( bba(-5,-1,"_hw_palate-ro") ) { Y["n-_hw_palate-ro"] = bbn; Y["w-_hw_palate-ro"] = BBn; };
    if ( bba(-5,-1,"_hw_sky-ro") )   { Y["n-_hw_sky-ro"]   = bbn; Y["w-_hw_sky-ro"]   = BBn; };

   };
 if (iwrd=="небу" )  { Y["iwrd_case"]="da"; if(dbg){print "небо: дат, ед+мн"};
    if ( wb(-5,-1,"к ко")   )       { DEF_TN_PREDA_NEBU(wbn,"к ко");   Y["n_pre_k_tv"]  =tn; Y["tn_ok_k_tv"]  =Y["tn_ok_da"]=Y["tn_ok_any"]=tn_ok }; # TN_k_nebu_f()
   };
 if (iwrd=="небом" ) { Y["iwrd_case"]="tv"; if(dbg){print "небо: тв, ед+мн"};
    if ( wb(-5,-1,"под")   )       { DEF_TN_PRETV_NEBOM(wbn,"под");   Y["n_pre_pod_tv"]  =tn; Y["tn_ok_pod_tv"]  =Y["tn_ok_tv"]=Y["tn_ok_any"]=tn_ok }; # TN_pod_neboом_f()
   };
 if (iwrd=="небе" )  { Y["iwrd_case"]="pr"; if(dbg){print "небо: пр, ед+мн"};

   cst="в во на";
   if ( wb(-8,-1,cst) ) { qb_n=wbn;

     if ( wb(-8,-1,"в во")  ) { Y["n_pre_v_ist"]=wbn;
       DEF_TN_PREPR_NEBE(wbn,"в во"); Y["n_pre_v_pr"]=tn; Y["tn_ok_v_pr"]=Y["tn_ok_pr"]=Y["tn_ok_any"]=tn_ok }; # TN_v_nebe_f()
     if ( wb(-8,-1,"на")    ) { Y["n_pre_na_ist"] = wbn; }; #

   };

 };

if ( vex(Y["n_pre_v_ist"]) && !vex(Y["tn_ok_v"]) ) { tn=Y["n_pre_v_ist"];
   if ( wba(tn+1,-1,"_sky_v_suw-pr")  ) { Y["n-_sky_v_suw-pr"]  = wbn }; };

#===============================================================================================================================================================

 if ( isname(0) && s(-1) )
 { l[i]=omo2; Z[23]++; if(dbg){print "Z23"}; continue };

 if ( bba(-3,-1,"_sky_prl_forced") && FN_sky_prl_f("_sky_prl_forced") )
 { Z[24]++; if(dbg){print "Z24"}; continue };
 if ( bfa(1,3,"_sky_prl_forced") && FN_sky_prl_f("_sky_prl_forced") )
 { Z[25]++; if(dbg){print "Z25"}; continue };

 if ( FN_sky_prl_f("_sky_prl_true") )
 { Z[26]++; if(dbg){print "Z26"}; continue };


 # forced:end

 ### ALL

 if ( q(0,"isname") && q(1,"isname") && zs(0) && zs(-1) &&
    !(s(0) && wa(1,"_sky_suw-ro") )  )
 { l[i]=omo2; Z[35]++; if(dbg){print "Z35"}; continue };
 if ( prq_any(-1) && ba(-1,"_prq_sky") && s(-1) )
 { l[i]=omo2; Z[36]++; if(dbg){print "Z36"}; continue };

 if ( prq_any(-1) && ba(-1,"_prq_palate") && s(-1) )
 { l[i]=omo1; Z[37]++; if(dbg){print "Z37"}; continue };
 if ( q(1,"gl_aux_be") &&
      q(2,"prq_any") && ba(2,"_prq_palate") && s(0,1) )
 { l[i]=omo1; Z[38]++; if(dbg){print "Z38"}; continue };

 # _palatelike_things:start
 if ( vgl(Y["n-_palatelike_things"],-6,-1) ) { bb_n=Y["n-_palatelike_things"]; BB_n=Y["w-_palatelike_things"];


 };

 if ( vgl(Y["n+_palatelike_things"],1,7) ) { bf_n=Y["n+_palatelike_things"]; wf_n=Y["n-_sky_pe"];

 };

 # _palate_environs:start
 #
 if ( vgl(Y["n-_palate_environs"],-6,-1) ) { bb_n=Y["n-_palate_environs"]; BB_n=Y["w-_palate_environs"];
 };
 if ( vgl(Y["n+_palate_environs"],1,6) ) { bf_n=Y["n+_palate_environs"]; BF_n=Y["w+_palate_environs"];
      qb_n=Y["n-_sky_pe"]; bb_n=Y["n-_gl_v_sky-iv"]; QB_n=Y["w-_sky_pe"]; BB_n=Y["w-_gl_v_sky-iv"];

 };

 # _palate_environs:end

 # _skylike_hyphens:start
 if ( sc(-1,"[/-]") && ba(-1,"_skylike_hyphens") )
 { l[i]=omo2; Z[102]++; if(dbg){print "Z102"}; continue };
 if ( sc(0,"[/-]") && ba(1,"_skylike_hyphens") )
 { l[i]=omo2; Z[103]++; if(dbg){print "Z103"}; continue };

 # _skylike_hyphens:start

 # _skylike_things:start
 if ( vex(Y["n-_skylike_things"]) ) { bb_n=Y["n-_skylike_things"]; BB_n=Y["w-_skylike_things"];
 };

 if ( vex(Y["n+_skylike_things"]) ) { bf_n=Y["n+_skylike_things"]; BF_n=Y["w+_skylike_things"];

 };

 # _skylike_things:end

 #######################################################################################################################
 # suw_ro escape:start

 if ( veq(Y["iwrd_case"],"tv") ) {
    if ( vex(Y["tn_ok_pod_tv"]) && TN_pod_nebom_f() )
    { Z[139]++; if(dbg){print "Z139", "-- TN_pod_nebom_f"}; continue};
 };
 if ( veq(Y["iwrd_case"],"ro") ) {
    if ( vex(Y["tn_ok_do"]) && TN_do_neba_f() )
    { Z[140]++; if(dbg){print "Z140", "-- TN_do_neba_f"}; continue};
    if ( vex(Y["tn_ok_ot"]) && TN_ot_neba_f() )
    { Z[141]++; if(dbg){print "Z141", "-- TN_ot_neba_f"}; continue};
    if ( vex(Y["tn_ok_iz"]) && TN_iz_neba_f() )
    { Z[142]++; if(dbg){print "Z142", "-- TN_iz_neba_f"}; continue};
    if ( vex(Y["tn_ok_vnutri"]) && TN_vnutri_neba_f() )
    { Z[142]++; if(dbg){print "Z142", "-- TN_vnutri_neba_f"}; continue};
    if ( vex(Y["tn_ok_vokrug"]) && TN_vokrug_neba_f() )
    { Z[142]++; if(dbg){print "Z142", "-- TN_vokrug_neba_f"}; continue};
    if ( vex(Y["tn_ok_u"]) && TN_u_neba_f() )
    { Z[142]++; if(dbg){print "Z142", "-- TN_u_neba_f"}; continue};
 };
 # suw_ro escape:end

 if ( FN_nebo_suwro_f() )
 { Z[143]++; if(dbg){print "Z143", "-- FN_nebo_suwro_f"}; continue };

 # _palate_bez_suw-ro:start
 if ( wf(1,3,"без") &&
     wba(wfn+1,wfn+3,"_palate_bez_suw-ro") && s(0,wbn-1) &&
     qir(1,wfn-1,"isname nar_any") &&
     qir(wbn+1,wbn-1,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo1; Z[144]++; if(dbg){print "Z144"}; continue };
 # _palate_bez_suw-ro:end

 # _sky_bez_suw-ro:start
 if ( wb(-5,-2,"без") && s(wbn,-1) &&
      wa(-1,"_sky_bez_suw-ro") &&
     qir(wbn+1,-2,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo2; Z[145]++; if(dbg){print "Z145"}; continue };
 if ( w(1,"без") &&
    wfa(2,5,"_sky_bez_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo2; Z[146]++; if(dbg){print "Z146"}; continue };
 # _sky_bez_suw-ro:end

 # _palate_iz_suw-ro:start
 cst="";
 if ( z(0) && bf(1,3,cst) && s(1,bfn-1) && qir(1,bfn-1,"otsz_mu gl_aux_be mod_any nar_any") ) { bf_n=bfn; } else { bf_n=0 };
 if ( wf2(bf_n+1,bf_n+5,"из изо") &&
      wfa(wfN+1,wfN+4,"_palate_iz_suw-ro") && s(bf_n,wfn-1) &&
      qir(bf_n+1,wfN-1,"prq_kred_mu gl_aux_be isname suw_ro suw_edne nar_any qast_any") &&
      qir(wfN+1,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
 { l[i]=omo1; Z[147]++; if(dbg){print "Z147"}; continue };

 if ( wb(-5,-1,"из изо") ) { wb_n=wbn;
    if ( vgl(wb_n,-5,-1) && s(wb_n,-1) &&
         qir(wb_n+1,-2,"prl_ro prq_ro mest_ro mest_3e") &&
          wa(-1,"_palate_iz_suw-ro") )
    { l[i]=omo1; Z[148]++; if(dbg){print "Z148"}; continue };
    cst="";
    if ( vgl(wb_n,-5,-1) && bw(wb_n-1,cst) && s(wb_n,-1) &&
         bba(wb_n-5,wb_n-1,"_palate_iz_suw") && !sos(bbn,wb_n) &&
           q(wb_n+1,"mest_vip3e") &&
         qir(wb_n+2,-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[149]++; if(dbg){print "Z149"}; continue };
    if ( vgl(wb_n,-5,-1) && s(wb_n,-1) &&
          ba(wb_n-1,"_palate_iz_suw") && zs(wb_n-1) &&
           q(wb_n+1,"otsz_ro mest_vip3e") &&
          bw(wb_n+2,cst) &&
         qir(wb_n+3,-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[150]++; if(dbg){print "Z150"}; continue };
 };
 # _palate_iz_suw-ro:end

 # _sky_iz_suw-ro:start
 if ( w(1,"из") ) { wf_n=1;
    if ( veq(Y["iwrd_case"],"iv") && bb(-3,-1,"вырвать принять") && s(bbn,-1) )
    { wf_n=""; Z[151]++; if(dbg){print "Z151"}; continue };

    if ( vex(Y["tn_ok_na"]) && TN_na_nebo_f() )
    { Z[152]++; if(dbg){print "Z152", "-- TN_na_nebo_f"}; continue};

    if ( veq(wf_n,1) &&
         wfa(2,5,"_sky_iz_suw-ro") && s(0,wfn-1) &&
         qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
    { l[i]=omo2; Z[153]++; if(dbg){print "Z153"}; continue };
 };
 # _sky_iz_suw-ro:end

 # _palate_pre-ro_suw-ro:start
 if ( w(1,"у возле посреди") &&
    wfa(2,4,"_palate_pre-ro_suw-ro") && s(0,wfn-1) )
 { l[i]=omo1; Z[154]++; if(dbg){print "Z154"}; continue };
 if ( wb(-6,-2,"у возле посреди") && s(wbn,-1) &&
      Qb(wbn+1,-1,"pre_any sz_iili") &&
     wba(wbn+1,-1,"_palate_pre-ro_suw-ro") && s(0,bfn-1) )
 { l[i]=omo1; Z[155]++; if(dbg){print "Z155"}; continue };
 # _palate_pre-ro_suw-ro:start


 if ( wb(-5,-2,"для") ) { wb_n=Y["n-_pre_dlya"]=wbn;
   if ( wba(wb_n+1,-1,"_palate_suw-ro1") ) { bb_n=wbn;

    if ( vgl(wb_n,-5,-1) && vgl(bb_n,wb_n+1,-1) && s(wb_n,-1) &&
         qir(wb_n+1,bb_n-1,"prl_ro mest_ro mest_3e prq_ro") &&
         qir(bb_n+1,-1,"prl_any mest_any") )
    { l[i]=omo1; Z[165]++; if(dbg){print "Z165"}; continue };

   };
   if ( wba(wb_n+1,-1,"_palate_suw-ro2") ) { bb_n=wbn;

    if ( vgl(wb_n,-5,-1) && vgl(bb_n,wb_n+1,-1) && s(wb_n-1,-1) &&
           q(wb_n-1,"prl_edmu") &&
         qir(wb_n+1,bb_n-1,"prl_ro mest_ro mest_3e prq_ro") &&
         qir(bb_n+1,-1,"prl_any mest_any") )
    { l[i]=omo1; Z[166]++; if(dbg){print "Z166"}; continue };

  };
 };
 # _palate_suw-ro -- для
 # _sky_suw-ro:start
 if ( wfa(1,5,"_sky_suw-ro") ) { wf_n=wfn;

    if ( vgl(wf_n,2,5) && s(0,wf_n-1) &&
      pre_ro(1) && w(wf_n+1,"до") && s(wfn) )
    { wf_n=""; Z[167]++; if(dbg){print "Z167"}; };

      cst0="гермодвери двери";
       if ( vgl(wf_n,1,5) && s(0,wf_n-1) && W(wf_n,cst0) &&
            vex(Y["tn_ok_v"]) && TN_v_nebo_f() )
       { Z[168]++; if(dbg){print "Z168", "-- TN_v_nebo_f"}; continue };

    cst0="работы";
    if ( vgl(wf_n,2,5) && s(0,wf_n-1) && !weq(WFn,cst0) &&
           w(1,"для у от") &&
         qir(2,wf_n-1,"prl_ro prq_ro mest_ro mest_3e") )
    { l[i]=omo2; Z[169]++; if(dbg){print "Z169"}; continue };
 };
 # _sky_suw-ro:end
 #######################################################################################################################

 # _palate_v_suw-pr+point_gl:start
 if ( vgl(Y["n_pre_v_ist"],-6,-2) )  { wb_n=Y["n_pre_v_ist"];

   if ( wba(wb_n+1,-1,"_palate_v_suw-pr") ) { bb_n=wbn;
   cst="быть висеть гореть купить находиться оказаться остаться парить построить появиться продать стоять";

    if ( vgl(wb_n,-6,-2) && vgl(bb_n,wb_n+1,-1) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") && s(wb_n,bb_n-1) &&
         qia(bb_n+1,-2,"qast","prl_any mest_any nar_any prl_kred_mu prl_krmn suw_ro mest_ro pre_ro") && ds(bb_n) &&
          bw(-1,cst) && s(bb_n+1,-1) )
    { l[i]=omo1; Z[178]++; if(dbg){print "Z178"}; continue };
    if ( vgl(wb_n,-6,-2) && vgl(bb_n,wb_n+1,-1) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") && s(wb_n,bb_n-1) &&
          bw(bb_n+1,cst) &&
         qia(bb_n+2,-1,"qast","prl_any mest_any nar_any prl_kred_mu prl_krmn suw_ro mest_ro pre_ro") && ds(bb_n) && s(bb_n+1,-1) )
    { l[i]=omo1; Z[179]++; if(dbg){print "Z179"}; continue };
    if ( vgl(wb_n,-6,-2) && vgl(bb_n,wb_n+1,-1) &&
          bw(wb_n-1,cst) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") && s(wb_n,bb_n-1) &&
         qia(bb_n+2,-1,"qast","prl_any mest_any nar_any prl_kred_mu prl_krmn suw_ro pre_ro") && ds(bb_n) && s(bb_n+1,-1) )
    { l[i]=omo1; Z[180]++; if(dbg){print "Z180"}; continue };

 };};
 # _palate_v_suw-pr+point_gl:end

 # _sky_v_suw-pr:start
 if ( wf(1,4,"в во") ) { wf_n=wfn;
   if ( wfa(wf_n+1,wf_n+4,"_sky_v_suw-pr") ) { bf_n=wfn;

        if ( vex(Y["tn_ok_v"]) && vex(Y["n-_gl_v_palate-iv"]) && s(Y["n-_gl_v_palate-iv"],bf_n-1) &&
            mwba(bf_n,Y["n-_gl_v_palate-iv"],"M_ispalate_sky_v_suw-pr_gl_v_palate_combo") )
        { l[i]=omo1; Z[181]++; if(dbg){print "Z181"}; continue };
        if ( vex(Y["tn_ok_v"]) && bfa(bf_n+1,bf_n+3,"_gl_v_palate-iv") && s(0,bfn-1) &&
            mwba(bf_n,bfn,"M_ispalate_sky_v_suw-pr_gl_v_palate_combo") )
        { l[i]=omo1; Z[182]++; if(dbg){print "Z182"}; continue };

    if ( vgl(wf_n,1,4) && s(0,bf_n-1) && (vex(Y["n-_suw_v_palate-vp"])||vex(Y["n-_gl_v_palate-iv"])) && TN_v_nebo_f() )
    { Z[183]++; if(dbg){print "Z183"}; continue };

    if ( vgl(wf_n,1,4) && vgl(bf_n,wf_n+1,wf_n+4) && s(0,bf_n-1) &&
         qir(wf_n+1,bf_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qir(1,wf_n-1,"gl_peed gl_vzed prl_vi mest_vi mest_3e prq_vi qast_any") )
    { l[i]=omo2; Z[184]++; if(dbg){print "Z184"}; continue };

   };

    cst="верстах днях километрах лерах лигах лье милях улицах часах";
    if ( vgl(wf_n,1,4) &&
          wf(wf_n+1,wf_n+4,cst) &&
         qir(wf_n+1,wfn-1,"qik_ro qin_ro prl_kred_sr nar_kaq") &&
         qir(1,wf_n-1,"gl_peed gl_vzed prl_vi mest_vi mest_3e prq_vi qast_any prl_kred_sr nar_kaq") )
    { l[i]=omo1; Z[185]++; if(dbg){print "Z185"}; continue };

 };

 if ( vgl(Y["n_pre_v_ist"],-8,-1) ) { wb_n=Y["n_pre_v_ist"]; wf_n=Y["n-_sky_v_suw-pr"];

    if ( vgl(wb_n,-8,-2) && vgl(wf_n,wb_n+1,-1) && s(wb_n,-1) &&
          sv(-1,"\\(") &&
         qir(wb_n+1,wf_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qir(wf_n+1,-1,"prl_vi mest_vi mest_3e prq_vi isname nar_step qast_any") )
    { l[i]=omo2; Z[186]++; if(dbg){print "Z186"}; continue };
    cst2="активироваться быть заклацать закрутиться красоваться оказаться поблескивать повернуться покоиться появиться прощелкать стоять";
    if ( vgl(wb_n,-8,-2) && vgl(wf_n,wb_n+1,-1) && s(wb_n,-1) &&
          bf(wf_n+1,-1,cst2) &&
         qir(wb_n+1,wf_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qir(wf_n+1,bfn-1,"suw_ro isname qast_any nar_vrem otsz_ro") &&
         qir(bfn+1,-1,"prl_vi mest_vi mest_3e prq_vi isname nar_step qast_any") )
    { l[i]=omo2; Z[187]++; if(dbg){print "Z187"}; continue };

    if ( vgl(wb_n,-8,-3) && vgl(wf_n,wb_n+1,-3) && zs(wf_n) && s(wb_n,wf_n-1) && s(wf_n+1,-1) &&
         qir(wb_n+1,wf_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
           w(wf_n+1,"у") &&
           q(wf_n+2,"suw_ro isname") &&
         qir(wf_n+3,-1,"prl_vi mest_vi mest_3e prq_vi qast_any") )
    { l[i]=omo2; Z[188]++; if(dbg){print "Z188"}; continue };
 };
 # _sky_v_suw-pr:end

 # _palate_pod_suw-tv:start
 if ( wf(1,3,"под") ) {wf_n=wfn;
     if ( wfa(wf_n+1,wf_n+4,"_palate_pod_suw-tv") ) { bf_n=wfn; bb_n=Y["n-_sky_pe"];

       if ( vgl(bb_n,-3,-1) && s(bb_n,-1) )
       { wf_n=""; Z[189]++; if(dbg){print "Z189"}; };

       cst="названием";
       if ( w(bf_n,cst) && !isname(bf_n+1) && s(0,bf_n) )
       { wf_n=""; Z[190]++; if(dbg){print "Z190"}; };
       cst="ударом";
       cst1="молота";
       if ( w(bf_n,cst) && w(bf_n+1,cst1) && s(0,bf_n) )
       { l[i]=omo2; Z[191]++; if(dbg){print "Z191"}; continue };

       if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+4) && s(0,bf_n-1) &&
            qir(1,wf_n-1,"qast_any suw_ro isname suw_edne prl_kred_sr mod_any gl_aux_be") &&
            qir(wf_n+1,wfn-1,"prl_tv prq_tv mest_tv mest_3e qast") )
       { l[i]=omo1; Z[192]++; if(dbg){print "Z192"}; continue };
    };
    if ( vgl(wf_n,1,3) &&
           q(wf_n+1,"isname") && s(0,wf_n) )
    { l[i]=omo1; Z[193]++; if(dbg){print "Z193"}; continue };
   };
 if ( w(-2,"под") &&
     wa(-1,"_palate_pod_suw-tv") && s(-2,-1) )
 { l[i]=omo1; Z[194]++; if(dbg){print "Z194"}; continue };
 # _palate_pod_suw-tv:end

 # _sky_pod_suw-tv:start
 if ( w(1,"под") && zs(0) &&
    wfa(2,5,"_sky_pod_suw-tv") && s(1,wfn-1) &&
    qir(3,wfn-1,"prl_tv prq_tv mest_tv mest_3e qast") )
 { l[i]=omo2; Z[195]++; if(dbg){print "Z195"}; continue };
 if ( q(1,"nar_spos qast") && zs(0) &&
      w(2,"под") &&
    wfa(3,6,"_sky_pod_suw-tv") && s(1,wfn-1) &&
    qir(3,wfn-1,"prl_tv prq_tv mest_tv mest_3e qast") )
 { l[i]=omo2; Z[196]++; if(dbg){print "Z196"}; continue };

 if ( wba(-5,-1,"_sky_pod_suw-tv") ) { bb_n=wbn;
   if ( wb(bb_n-4,bb_n-1,"под") ) { wb_n=wbn;
     if ( vgl(bb_n,-5,-1) && vgl(wb_n,bb_n-4,bb_n-1) && s(bb_n,-1) &&
          qir(wb_n+1,bb_n-1,"prl_tv mest_tv mest_3e") &&
          qir(bb_n+1,-1,"prl_vi mest_vi mest_3e pre_ro mest_ro suw_ro gl_vzed") )
     { l[i]=omo2; Z[197]++; if(dbg){print "Z197"}; continue };
 };};
 # _sky_pod_suw-tv:end

 # _palate_nad_suw-tv:start
 if ( w(1,"над") &&
    wfa(2,5,"_palate_nad_suw-tv") && s(0,wfn-1) &&
    qir(3,wfn-1,"prl_tv prq_tv mest_tv mest_3e qast") )
 { l[i]=omo1; Z[198]++; if(dbg){print "Z198"}; continue };
 if ( w(1,"над") &&
      q(2,"isname") && s(0,1) )
 { l[i]=omo1; Z[199]++; if(dbg){print "Z199"}; continue };
 if ( q(1,"qast") &&
      w(2,"над") &&
    wfa(3,6,"_palate_nad_suw-tv") && s(0,wfn-1) &&
    qir(3,wfn-1,"prl_tv prq_tv mest_tv mest_3e qast") )
 { l[i]=omo1; Z[200]++; if(dbg){print "Z200"}; continue };
 if ( w(-2,"над") &&
     wa(-1,"_palate_nad_suw-tv") && s(-2,-1) )
 { l[i]=omo1; Z[201]++; if(dbg){print "Z201"}; continue };
 # _palate_nad_suw-tv:end

 # _palate_na_suw-vi:start
 if ( w(1,"на") &&
    wfa(2,4,"_palate_na_suw-vi") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_vi mest_vi mest_3e nar_any prq_vi"))
 { l[i]=omo1; Z[202]++; if(dbg){print "Z202"}; continue };
 cst="месте";
 if ( qxw(1,"на",cst) &&
      bfa(xwn+1,xwn+4,"_palate_environs") && s(0,bfn-1) &&
      qir(xwn+1,bfn-1,"prl_pr mest_pr mest_3e nar_any prq_pr") )
 { l[i]=omo1; Z[203]++; if(dbg){print "Z203"}; continue };
 # _palate_na_suw-vi:end

 # _palate_na_suw-pr:start
 #
  if ( w(-1,"и") && s(-1) &&
     qxs(1,"на","земле") && p(xsn) )
  { l[i]=omo2; Z[204]++; if(dbg){print "Z204"}; continue };
  if ( wb(-5,-2,"на") && s(wbn,-1) &&
        w(wbn+1,"земле") &&
      qir(wbn+2,-1,"prl_vi mest_vi mest_3e prq_vi") )
  { l[i]=omo2; Z[205]++; if(dbg){print "Z205"}; continue };

 if ( wba(-7,-1,"_palate_na_suw-pr") ) { bb_n=wbn;
   if ( wb(bb_n-5,bb_n-1,"на") ) { wb_n=wbn;
   cst0="двери";

    if ( vgl(wb_n,bb_n-5,bb_n-1) && vgl(bb_n,-7,-1) &&
          qy(bb_n+1,"nar_napr nar_mest") && (zs(bb_n+qyn)||se(bb_n+qyn," — ")) && s(wb_n,bb_n-1) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qia(bb_n+1,-1-qyn,"gl_aux_be sz_i isname","prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e nar_any qast_any") && s(bb_n+1+qyn,-1) &&
        !bba(bb_n+1,-1-qyn,"_sky_prl") )
    { l[i]=omo1; Z[206]++; if(dbg){print "Z206"}; continue };
    if ( vgl(wb_n,bb_n-5,bb_n-1) && vgl(bb_n,-7,-1) && s(wb_n,bb_n) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
           q(bb_n+1,"suw_ro isname") && (zs(bb_n+1)||se(bb_n+1," — ")) && s(bb_n+2,-1) &&
           W(bb_n+1,cst0) && !wba(bb_n+2,-1,"_sky_prl") &&
         qia(bb_n+2,-1,"qast","prl_vi mest_vi mest_3e nar_any qast_any") )
    { l[i]=omo1; Z[207]++; if(dbg){print "Z207"}; continue };
    if ( vgl(wb_n,bb_n-5,bb_n-1) && vgl(bb_n,-7,-1) && s(wb_n,-3) && (zs(-2)||se(-2," — ")) && s(-1) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qir(bb_n+1,-2,"suw_ro isname prl_ro mest_ro mest_3e prq_ro") &&
           W(-2,cst0) && !wa(-1,"_sky_prl") &&
           q(-1,"prl_vi mest_vi mest_3e nar_any qast_any") )
    { l[i]=omo1; Z[208]++; if(dbg){print "Z208"}; continue };
    if ( vgl(wb_n,bb_n-5,bb_n-1) && vgl(bb_n,-7,-1) && s(wb_n,-2) && (zs(-1)||se(-1," — ")) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qir(bb_n+1,-1,"suw_ro isname prl_ro mest_ro mest_3e prq_ro") && W(-1,cst0) )
    { l[i]=omo1; Z[209]++; if(dbg){print "Z209"}; continue };
    if ( vgl(wb_n,bb_n-5,bb_n-1) && vgl(bb_n,-7,-1) && s(wb_n,-1) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qir(bb_n+1,-2,"suw_ro isname") &&
           q(-1,"mest_im isname suw_im") )
    { l[i]=omo1; Z[210]++; if(dbg){print "Z210"}; continue };
    if ( vgl(wb_n,bb_n-5,bb_n-1) && vgl(bb_n,-7,-1) && s(wb_n,-1) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qir(bb_n+1,-3,"suw_ro isname") &&
         qir(-2,-1,"mest_im isname suw_im sz_i qast_any") )
    { l[i]=omo1; Z[211]++; if(dbg){print "Z211"}; continue };
    if ( vgl(wb_n,bb_n-5,bb_n-1) && vgl(bb_n,-7,-1) && s(wb_n,-1) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
           q(bb_n+1,"prq_edmuim prq_mnim") &&
           q(bb_n+2,"suw_tv") &&
         qir(bb_n+3,-1,"mest_ro isname suw_ro") )
    { l[i]=omo1; Z[212]++; if(dbg){print "Z212"}; continue };
    if ( vgl(wb_n,bb_n-5,bb_n-1) && vgl(bb_n,-7,-1) && s(wb_n,-1) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qiz(bb_n+1,-1,"nar_step prl_kred_sr prl_kred_mu prl_krmn prl_edmuvi prl_mnvi","sz_i qast_any") )
    { l[i]=omo1; Z[213]++; if(dbg){print "Z213"}; continue };
    if ( vgl(wb_n,bb_n-5,bb_n-1) && vgl(bb_n,-7,-1) && s(wb_n,-1) &&
          qb(bb_n+1,-1,"sz_iili") &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
         qia(bb_n+1,qbn-1,"nar_step prl_kred_sr","prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") &&
         qir(qbn+1,-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") )
    { l[i]=omo1; Z[214]++; if(dbg){print "Z214"}; continue };

 };};

 if ( vgl(Y["n_pre_na_ist"],-8,-3) ) { wb_n=Y["n_pre_na_ist"];
   if ( wfa(wb_n+1,wb_n+4,"_palate_na_suw-pr") ) { wf_n=wfn;

       if ( pre_ro(wf_n+1) && s(wb_n,-1) &&
                 q(-1,"suw_ro mest_ro") &&
               qir(wf_n+2,-2,"suw_ro mest_ro nar_spos prl_ro prq_ro mest_vip3e isname") )
       { l[i]=omo1; Z[215]++; if(dbg){print "Z215"}; continue };
       if (  pre_ro(wf_n+1) &&
                  q(-2,"suw_ro mest_ro") &&
                  q(-1,"gl_aux_be") && s(wb_n,-1) )
       { l[i]=omo1; Z[216]++; if(dbg){print "Z216"}; continue };
       if ( pre_ro(wf_n+1) && s(wb_n,-1) &&
                qb(wf_n+3,-1,"gl_aux_be") &&
               qir(wf_n+2,qfn-1,"suw_ro mest_ro nar_spos prl_ro prq_ro mest_vip3e isname") &&
               qir(qfn+1,-1,"prl_vi mest_vi mest_3e isname") )
       { l[i]=omo1; Z[217]++; if(dbg){print "Z217"}; continue };

       if ( pre_tv(wf_n+1) && s(wb_n,-1) &&
                qf(wf_n+2,-1,"suw_tv isname") &&
               qir(wf_n+2,qfn-1,"prl_tv prq_tv mest_tv mest_3e") &&
               qir(qfn+1,-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e") )
       { l[i]=omo1; Z[218]++; if(dbg){print "Z218"}; continue };

     if ( bfa(wf_n+1,-1,"_gl_4_palate_na_suw-pr") ) { bf_n=bfn;
       if ( gl_aux_be(bf_n) ) { if ( bfa(bf_n+1,-1,"_gl_4_palate_na_suw-pr") ) bf_n=bfn; };

       if ( vgl(wb_n,-8,-3) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wf_n+1,-1) && s(wb_n,bf_n) && zs(bf_n+1) && s(bf_n+2,-1) &&
            qir(wb_n+1,wf_n-1,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
            qir(wf_n+1,bf_n-1,"suw_ro mest_ro mest_3e isname prl_kred_sr nar_any mest_im suw_im suw_edne mod_any gl_aux_be suw_da mest_da prl_da prq_da qast") &&
            qir(bf_n+1,-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e prl_kred_sr nar_any qast suw_ro prq_ro mest_ro suw_tv prl_tv mest_tv") )
       { l[i]=omo1; Z[219]++; if(dbg){print "Z219"}; continue };
       if ( vgl(wb_n,-8,-3) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wf_n+1,-1) && s(wb_n,-1) &&
            qir(wb_n+1,wf_n-1,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
            qir(wf_n+1,bf_n-1,"suw_ro mest_ro mest_3e isname prl_kred_sr nar_any mest_im suw_im suw_edne mod_any gl_aux_be suw_da mest_da prl_da prq_da qast") &&
            qir(bf_n+1,-1,"prq_edmuim prq_mnim prl_im mest_vi suw_ro mest_3e isname suw_im") )
       { l[i]=omo1; Z[220]++; if(dbg){print "Z220"}; continue };

       if ( vgl(wb_n,-8,-3) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wf_n+1,-1) && s(wb_n,-1) &&
              q(wf_n+1,"pre_da") &&
            qir(wb_n+1,wf_n-1,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
            qir(wf_n+2,bf_n-1,"suw_ro mest_ro mest_3e isname prl_kred_sr nar_any suw_edne mod_any gl_aux_be suw_da mest_da prl_da prq_da qast") &&
            qir(bf_n+1,-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e prl_kred_sr nar_any qast suw_ro prq_ro mest_ro suw_tv prl_tv mest_tv") )
       { l[i]=omo1; Z[221]++; if(dbg){print "Z221"}; continue };
       if ( vgl(wb_n,-8,-3) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wf_n+1,-1) && s(wb_n,-1) &&
              q(wf_n+1,"pre_tv") &&
            qir(wb_n+1,wf_n-1,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
            qir(wf_n+2,bf_n-1,"suw_ro mest_ro mest_3e isname prl_kred_sr nar_any suw_edne mod_any gl_aux_be suw_tv mest_tv prl_tv prq_tv qast") &&
            qir(bf_n+1,-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e prl_kred_sr nar_any qast suw_ro prq_ro mest_ro suw_tv prl_tv mest_tv") )
       { l[i]=omo1; Z[222]++; if(dbg){print "Z222"}; continue };
       if ( vgl(wb_n,-8,-3) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wf_n+1,-1) && s(wb_n,-1) &&
              q(wf_n+1,"pre_ro") &&
            qir(wb_n+1,wf_n-1,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
            qir(wf_n+2,bf_n-1,"suw_ro mest_ro mest_3e isname prl_kred_sr nar_any suw_edne mod_any gl_aux_be qast") &&
            qir(bf_n+1,-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e prl_kred_sr nar_any qast suw_ro prq_ro mest_ro suw_tv prl_tv mest_tv") )
       { l[i]=omo1; Z[223]++; if(dbg){print "Z223"}; continue };

   };};
   cst="краю кромке месте";
   cst1="болота города городка дороги дубравы дубровы земли которого леса мира моря мыса обрыва озера острова поля поляны пропасти пустыни селения скалы степи утеса \
         чаши чащи";
   if ( wf(wb_n+1,wb_n+4,cst) ) { wf_n=wfn;
     if ( bfa(wf_n+1,-1,"_gl_4_palate_na_suw-pr") ) { bf_n=bfn;
       if ( gl_aux_be(bf_n) ) { if ( bfa(bf_n+1,-1,"_gl_4_palate_na_suw-pr") ) bf_n=bfn; };

       if ( vgl(wb_n,-8,-3) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wf_n+1,-1) && s(wb_n,-1) &&
             wf(wf_n+1,bf_n-1,cst1) &&
            qir(wb_n+1,wf_n-1,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
            qir(bf_n+1,wfn-1,"prl_ro prq_ro mest_ro mest_3e muk_ro") &&
            qir(wfn+1,bf_n-1,"suw_ro mest_ro mest_3e isname prl_kred_sr nar_any mest_im suw_im suw_edne mod_any gl_aux_be suw_da mest_da prl_da prq_da qast") &&
            qir(bf_n+1,-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e prl_kred_sr nar_any qast suw_ro prq_ro mest_ro suw_tv prl_tv mest_tv") )
       { l[i]=omo1; Z[224]++; if(dbg){print "Z224"}; continue };

   };};

   cst="месте";
   cst1="высоком открытом сухом";
   if ( wf(wb_n+1,wb_n+4,cst) ) { wf_n=wfn;
     if ( bfa(wf_n+1,-1,"_gl_4_palate_na_suw-pr") ) { bf_n=bfn;
       if ( gl_aux_be(bf_n) ) { if ( bfa(bf_n+1,-1,"_gl_4_palate_na_suw-pr") ) bf_n=bfn; };

       if ( vgl(wb_n,-8,-3) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wf_n+1,-1) && s(wb_n,bf_n-2) && zs(bf_n-1) && s(bf_n,-1) &&
             wf(wb_n+1,wf_n-1,cst1) &&
            qir(wb_n+1,wf_n-1,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
            qir(wf_n+1,bf_n-1,"prl_kred_sr nar_any mod_any gl_aux_be qast_any") &&
            qir(bf_n+1,-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e prl_kred_sr nar_any") )
       { l[i]=omo1; Z[225]++; if(dbg){print "Z225"}; continue };

   };};

 };

 if ( wf(1,3,"на") ) { wf_n=wfn;

     if ( vgl(wf_n,1,3) && s(0,wf_n-1) && vex(Y["tn_ok_pod"]) && TN_pod_nebo_f() )
     { Z[226]++; if(dbg){print "Z226"}; continue };

   cst="высоте уровне";
   cst1="глаз головы пояса роста";
   if ( vgl(wf_n,1,3) &&
         wf(wf_n+1,wf_n+4,cst) &&
        wf2(wfn+1,wfn+3,cst1) && s(0,wfN-1) &&
        qir(1,wf_n-1,"suw_ro suw_edne") &&
        qir(wfn+1,wfN-1,"prl_ro mest_ro mest_3e") &&
        qir(wf_n+1,wfn-1,"prl_pr mest_pr mest_3e nar_any prq_pr") )
   { l[i]=omo2; Z[227]++; if(dbg){print "Z227"}; continue };

   if ( vgl(wf_n,1,3) &&
        wfa(wf_n+1,wf_n+4,"_palate_na_suw-pr") && s(0,wfn-1) &&
        qir(1,wf_n-1,"suw_ro suw_edne isname qast_any") &&
        qir(wf_n+1,wfn-1,"prl_pr mest_pr mest_3e nar_any prq_pr") )
   { l[i]=omo1; Z[228]++; if(dbg){print "Z228"}; continue };

   cst="краю кромке плече";
   cst1="болота города городка горы дороги дубровы земли которого леса мира моря мыса обрыва озера острова поля поляны пропасти пустыни селения скалы степи утеса чаши \
         чащи";
   if ( vgl(wf_n,1,3) &&
         wf(wf_n+1,wf_n+4,cst) &&
        wf2(wfn+1,wfn+4,cst1) && s(0,wfN-1) &&
        qir(1,wf_n-1,"suw_ro suw_edne isname") &&
        qir(wf_n+2,wfn-1,"prl_pr mest_pr mest_3e nar_any prq_pr") &&
        qir(wfn+1,wfN-1,"prl_ro mest_ro prq_ro isname") )
   { l[i]=omo1; Z[229]++; if(dbg){print "Z229"}; continue };
 };

 if ( bba(1,3,"_gl_4_palate_na_suw-pr") ) { bf_n=bbn;

     if ( bba(-3,-1,"_sky_prl") && s(bbn,-1) )
     { bf_n=""; Z[230]++; if(dbg){print "Z230"}; };

   if ( vgl(bf_n,1,3) && s(0,bf_n-1) &&
        wf2(bf_n+1,bf_n+3,"на") &&
        wfa(wfN+1,wfN+5,"_palate_na_suw-pr") && s(bf_n,wfn-1) &&
        qir(1,bf_n-1,"nar_any qast_any mod_any gl_aux_be prl_kred_sr isname suw_ro suw_edne") &&
        qir(bf_n+1,wfN-1,"nar_any qast_any") &&
        qir(wfN+1,wfn-1,"prl_vi prl_pr otsz_vi otsz_pr mest_vi mest_pr prq_vi prq_pr") )
   { l[i]=omo1; Z[231]++; if(dbg){print "Z231"}; continue };
   if ( vgl(bf_n,1,3) && qsf(0,bf_n-1,"[,—]") && s(0,sfn-1) &&
          w(bf_n+1,"на") &&
        wfa(bf_n+2,bf_n+6,"_palate_na_suw-pr") && s(bf_n,wfn-1) && s(sfn+1,wfn-1) &&
        qir(1,sfn-1,"suw_ro suw_edne isname") &&
        qir(sfn+1,bf_n-1,"nar_any qast_any mod_any gl_aux_be prl_kred_sr isname") &&
        qir(bf_n+2,wfn-1,"prl_vi prl_pr otsz_vi otsz_pr mest_vi mest_pr prq_vi prq_pr") )
   { l[i]=omo1; Z[232]++; if(dbg){print "Z232"}; continue };

   if ( vgl(bf_n,1,3) && zs(0) &&
          w(bf_n+1,"на") &&
         wf(bf_n+2,bf_n+6,cst) &&
        wf2(wfn+1,wfn+4,cst1) &&
        qir(1,bf_n-1,"nar_any qast_any mod_any gl_aux_be prl_kred_sr") &&
        qir(bf_n+2,wfn-1,"prl_vi prl_pr otsz_vi otsz_pr mest_vi mest_pr prq_vi prq_pr") &&
        qir(wfn+1,wfN-1,"prl_ro mest_ro prq_ro isname") && s(1,wfN-1) )
   { l[i]=omo1; Z[233]++; if(dbg){print "Z233"}; continue };
 };
 # _palate_na_suw-pr:end

 # _sky_na_suw-pr:start
 if ( vgl(Y["n_pre_na_ist"],-8,-2) ) { wb_n=Y["n_pre_na_ist"];
   if ( wfa(wb_n+1,wb_n+4,"_sky_na_suw-pr") ) { wf_n=wfn;
     if ( bfa(wf_n+1,-1,"_gl_4_sky_na_suw-pr") ) { bf_n=bfn;
       if ( gl_aux_be(bf_n) ) { if ( bfa(bf_n+1,-1,"_gl_4_sky_na_suw-pr") ) bf_n=bfn; };

       if ( vgl(wb_n,-8,-3) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wf_n+1,-1) && s(wb_n,-1) &&
            vgl(Y["n-_palate_pe"],bf_n+1,-1) )
       { wb_n=wf_n=bf_n=""; Z[234]++; if(dbg){print "Z234"}; };

       if ( vgl(wb_n,-8,-3) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wf_n+1,-1) && s(wb_n,-1) &&
            qir(wb_n+1,wf_n-1,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
            qir(wf_n+1,bf_n-1,"suw_ro mest_ro mest_3e isname prl_kred_sr nar_any mest_im suw_im suw_edne mod_any gl_aux_be suw_da mest_da prl_da prq_da qast") &&
            qir(bf_n+1,-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e prl_kred_sr nar_any qast suw_ro prq_ro mest_ro suw_tv prl_tv mest_tv") )
       { l[i]=omo2; Z[235]++; if(dbg){print "Z235"}; continue };

     };
     if ( bba(wb_n-3,wb_n-1,"_gl_4_sky_na_suw-pr") ) { bf_n=bbn;

       if ( vgl(wb_n,-8,-2) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wb_n-3,wb_n-1) && s(bf_n,-1) &&
            qir(bf_n+1,wb_n-1,"nar_any suw_da mest_da") &&
            qir(wb_n+1,wf_n-1,"prl_pr prq_pr mest_pr mest_3e muk_pr") &&
            qir(wf_n+1,-1,"prl_vi mest_vi mest_3e") )
       { l[i]=omo2; Z[236]++; if(dbg){print "Z236"}; continue };

      };

 };};
 if ( vgl(Y["n_pre_na_ist"],-8,-2) ) { wb_n=Y["n_pre_na_ist"]; wf_n=Y["n_pre_v_ist"]

        cst="руках";
        cst1="остаться";
        if ( vgl(wb_n,-8,-2) && s(wb_n,-1) &&
              wf(wb_n+1,wb_n+3,cst) &&
              bf(wfn+1,-1,cst1) &&
             qir(wb_n+1,wfn-1,"prl_pr mest_pr mest_3e prq_pr") &&
             qir(wfn+1,bfn-1,"gl_aux_be mod_any nar_any") &&
             qir(bfn+1,-1,"prl_vi mest_vi mest_3e prq_vi") )
        { l[i]=omo1; Z[237]++; if(dbg){print "Z237"}; continue };

   if ( wfa(wb_n+1,-1,"_sky_na_suw-pr") ) { bf_n=wfn; qf_n=Y["n-_palate_pe"]; qb_n=Y["n-_sky_pe"];

     if ( bba(-8,-1,"M_ispalate_sky_na_suw-pr_gl_list") ) { bb_n=bbn;
        if ( vgt(bb_n,bf_n) && s(bb_n,-1) && mwba(bf_n,bb_n,"M_ispalate_sky_na_suw-pr_gl_combo") )
        { l[i]=omo1; Z[238]++; if(dbg){print "Z238"}; continue };
        if ( vgt(bf_n,bb_n) && s(bf_n,-1) && mwba(bf_n,bb_n,"M_ispalate_sky_na_suw-pr_gl_combo") )
        { l[i]=omo1; Z[239]++; if(dbg){print "Z239"}; continue };
     };

        if ( vgt(qf_n,wb_n) && s(qf_n,-1) && mwba(bf_n,qf_n,"M_issky_sky_na_suw-pr_gl_palate_pe") )
        { l[i]=omo2; Z[240]++; if(dbg){print "Z240"}; continue };
        if ( vgt(wb_n,qf_n) && s(wb_n,-1) && mwba(bf_n,qf_n,"M_issky_sky_na_suw-pr_gl_palate_pe") )
        { l[i]=omo2; Z[241]++; if(dbg){print "Z241"}; continue };

        cst="держать нести остаться унести";
        if ( bb(wb_n-4,wb_n-1,cst0) && s(bbn,-1) &&
           mwba(bf_n,bbn,"M_sky_na_suw-pr_gl_palate_pe") )
        { wb_n=bf_n=""; Z[242]++; if(dbg){print "Z242"}; };
        if ( bf(wb_n+1,-1,cst0) && s(wb_n,-1) &&
           mwba(bf_n,bfn,"M_sky_na_suw-pr_gl_palate_pe") )
        { wb_n=bf_n=""; Z[243]++; if(dbg){print "Z243"}; };

        if ( vgl(qf_n,bf_n+1,-1) && Xw(qf_n,"X_suw_palate_pe") )
        { bf_n=""; Z[244]++; if(dbg){print "Z244"}; };
        if ( vgl(qf_n,bf_n-5,bf_n-2) && Xw(qf_n,"X_suw_palate_pe") )
        { bf_n=""; Z[245]++; if(dbg){print "Z245"}; };
        if ( s(-1) && bw(-1,"весь целый") )
        { wb_n=bf_n=""; Z[246]++; if(dbg){print "Z246"}; };

      if ( vgl(wb_n,-8,-2) && vgl(bf_n,wb_n+1,-1) && s(wb_n,-1) &&
           qir(wb_n+1,bf_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
           qir(bf_n+1,-1,"gl_need gl_vzed gl_aux_be prl_vi mest_vi mest_3e prq_vi qast_any suw_ro") &&
            sv(-1,"\\(") && Q_w(1,"isname") )
      { l[i]=omo2; Z[247]++; if(dbg){print "Z247"}; continue };
      cst="дом комната церковь";
      if ( vgl(wb_n,-8,-2) && vgl(bf_n,wb_n+1,wf_n-1) && vgl(wf_n,bf_n+1,-2) && s(wb_n,-1) &&
            bf(wf_n+1,-1,cst) &&
           qir(wb_n+2,wf_n-1,"prl_pr mest_pr mest_3e prq_pr") &&
           qir(wf_n+1,bfn-1,"prl_vi prl_pr mest_3e mest_vi mest_pr") &&
           qir(bfn+1,-1,"prl_vi mest_vi mest_3e prq_vi qast_any suw_ro") )
      { l[i]=omo2; Z[248]++; if(dbg){print "Z248"}; continue };
 };};


 if ( wa(-2,"_sky_na_suw-pr") && se(-2," — ") &&
       w(-1,"на") && s(-1) )
 { l[i]=omo2; Z[249]++; if(dbg){print "Z249"}; continue };


 if ( w(1,"на") && wfa(2,5,"_sky_na_suw-pr") ) { wf_n=wfn; qb_n=Y["n-_palate_pe"]

        if ( vex(Y["tn_ok_v"]) && vex(Y["n-_gl_v_palate-iv"]) && s(Y["n-_gl_v_palate-iv"],wf_n-1) &&
            mwba(wf_n,Y["n-_gl_v_palate-iv"],"M_ispalate_sky_na_suw-pr_gl_v_palate_combo") )
        { l[i]=omo1; Z[250]++; if(dbg){print "Z250"}; continue };
        if ( vex(Y["tn_ok_v"]) && bfa(wf_n+1,wf_n+3,"_gl_v_palate-iv") && s(0,bfn-1) &&
            mwba(wf_n,bfn,"M_ispalate_sky_na_suw-pr_gl_v_palate_combo") )
        { l[i]=omo1; Z[251]++; if(dbg){print "Z251"}; continue };

        if ( vex(Y["tn_ok_v"]) && vex(Y["n-_suw_v_palate-vp"]) &&
            mwba(wf_n,Y["n-_suw_v_palate-vp"],"M_sky_na_suw-pr_suw_v_palate-vp") && TN_v_nebo_f() )
        { Z[252]++; if(dbg){print "Z252"}; continue };
        if ( vex(Y["tn_ok_qerez"]) && bba(Y["tn_ok_qerez"]-5,Y["tn_ok_qerez"]-1,"_gl_qerez_palate") &&
            mwba(wf_n,Y["n-_gl_v_palate-iv"],"M_sky_na_suw-pr_gl_qerez_palate") && TN_qerez_nebo_f() )
        { Z[253]++; if(dbg){print "Z253"}; continue };
        if ( vex(Y["tn_ok_qerez"]) && bfa(wf_n+1,wf_n+3,"_gl_qerez_palate") &&
            mwba(wf_n,bfn,"M_sky_na_suw-pr_gl_qerez_palate") && TN_qerez_nebo_f() )
        { Z[254]++; if(dbg){print "Z254"}; continue };
        if ( vex(Y["tn_ok_do"]) && vex(Y["n-_gl_do_palate-ro"]) &&
            mwba(wf_n,Y["n-_gl_do_palate-ro"],"M_sky_na_suw-pr_gl_do_palate-ro") && TN_do_neba_f() )
        { Z[255]++; if(dbg){print "Z255"}; continue };

        cst0="держать остаться унести";
        if ( bb(-4,-1,cst0) && s(bbn,wf_n-1) &&
           mwba(wf_n,bbn,"M_ispalate_sky_na_suw-pr_gl_combo") )
        { wf_n=""; Z[256]++; if(dbg){print "Z256"}; };
        if ( bf(-4,-1,cst0) && s(bfn,wf_n-1) &&
           mwba(wf_n,bfn,"M_sky_na_suw-pr_gl_combo") )
        { wf_n=""; Z[257]++; if(dbg){print "Z257"}; };
        cst0="весь целый";
        if ( bw(-1,cst0) && Q(-1,"prl_kred_mu") && s(-1,wf_n-1) )
        { wf_n=""; Z[258]++; if(dbg){print "Z258"}; };
        cst0="изобразить править снести укрепить";
        if ( vgl(qb_n,-4,-1) && vgl(wf_n,2,5) && s(qb_n,wf_n-1) &&
             qir(qb_n+1,-1,"prl_vi mest_vi mest_3e prq_vi") && !bw(qb_n,cst0) )
        { wf_n=""; Z[259]++; if(dbg){print "Z259"}; };
        if ( vex(Y["n-_hw_palate-ro"]) && s(Y["n-_hw_palate-ro"],-1) )
        { wf_n=""; Z[259]++; if(dbg){print "Z259"}; };

     if ( vgl(wf_n,2,5) && ts(0) && s(1,wf_n-1) &&
          qir(2,wf_n-1,"prl_pr mest_pr mest_3e prq_pr") )
     { l[i]=omo2; Z[260]++; if(dbg){print "Z260"}; continue };
 };
 # _sky_na_suw-pr:end

 # _sky_na_suw-vi:start
 if ( vgl(Y["n_pre_na_ist"],-8,-2) ) { wb_n=Y["n_pre_na_ist"];
   if ( wfa(wb_n+1,wb_n+4,"_sky_na_suw-vi") ) { wf_n=wfn;
     if ( bfa(wf_n+1,-1,"_gl_4_sky_na_suw-vi") ) { bf_n=bfn;
       if ( gl_aux_be(bf_n) ) { if ( bfa(bf_n+1,-1,"_gl_4_sky_na_suw-vi") ) bf_n=bfn; };

       if ( vgl(wb_n,-8,-3) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wf_n+1,-1) && s(wb_n,-1) &&
            qir(wb_n+1,wf_n-1,"prl_vi prq_vi mest_vi mest_3e muk_vi") &&
            qir(wf_n+1,bf_n-1,"suw_ro mest_ro mest_3e isname prl_kred_sr nar_any mest_im suw_im suw_edne mod_any gl_aux_be suw_da mest_da prl_da prq_da qast") &&
            qir(bf_n+1,-1,"prl_edmuim prl_mnim prq_edmuim prq_mnim mest_vi mest_3e prl_kred_sr nar_any qast suw_ro prq_ro mest_ro suw_tv prl_tv mest_tv") )
       { l[i]=omo2; Z[261]++; if(dbg){print "Z261"}; continue };

     };
     if ( bba(wb_n-3,wb_n-1,"_gl_4_sky_na_suw-vi") ) { bf_n=bbn;

       if ( vgl(wb_n,-8,-2) && vgl(wf_n,wb_n+1,wb_n+4) && vgl(bf_n,wb_n-3,wb_n-1) && s(bf_n,-1) &&
            qir(bf_n+1,wb_n-1,"nar_any suw_da mest_da") &&
            qir(wb_n+1,wf_n-1,"prl_vi prq_vi mest_vi mest_3e muk_vi") &&
            qir(wf_n+1,-1,"prl_vi mest_vi mest_3e") )
       { l[i]=omo2; Z[262]++; if(dbg){print "Z262"}; continue };

      };

 };};
 if ( vgl(Y["n_pre_na_ist"],-8,-2) ) { wb_n=Y["n_pre_na_ist"];
   if ( wfa(wb_n+1,-1,"_sky_na_suw-vi") ) { bf_n=wfn;
      if ( vgl(Y["n-_palate_pe"],wfn+1,-1) )
      { bf_n=""; Z[263]++; if(dbg){print "Z263"}; };

      if ( vgl(wb_n,-8,-2) && vgl(bf_n,wb_n+1,-1) && s(wb_n,-1) &&
           qir(wb_n+1,bf_n-1,"prl_vi mest_vi mest_3e prq_vi") &&
           qir(bf_n+1,-1,"gl_ed gl_in gl_mn gl_vzed gl_vzmn gl_po gl_aux_be prl_vi mest_vi mest_3e prq_vi qast_any") &&
            sv(-1,"\\(") && Q_w(1,"isname") )
      { l[i]=omo2; Z[264]++; if(dbg){print "Z264"}; continue };
 };};

 if ( wa(-2,"_sky_na_suw-vi") && se(-2," — ") &&
       w(-1,"на") && s(-1) )
 { l[i]=omo2; Z[265]++; if(dbg){print "Z265"}; continue };

 if ( w(1,"на") ) {
   if ( wfa(2,5,"_sky_na_suw-vi") ) { wf_n=wfn;

     if ( vex(Y["tn_ok_v"]) && vex(Y["n-_gl_v_palate-iv"]) &&
         mwba(wf_n,Y["n-_gl_v_palate-iv"],"M_sky_na_suw-vi_gl_v_palate") && TN_v_nebo_f() )
     { Z[266]++; if(dbg){print "Z266"}; continue };
     if ( vex(Y["tn_ok_v"]) && vex(Y["n-_suw_v_palate-vp"]) &&
         mwba(wf_n,Y["n-_suw_v_palate-vp"],"M_sky_na_suw-vi_suw_v_palate-vp") && TN_v_nebo_f() )
     { Z[267]++; if(dbg){print "Z267"}; continue };

     if ( vgl(wf_n,2,5) && s(0,wf_n-1) &&
          qir(2,wf_n-1,"prl_vi mest_vi mest_3e prq_vi") )
     { l[i]=omo2; Z[268]++; if(dbg){print "Z268"}; continue };
   };
   if ( bba(-5,-1,"_gl_4_sky_na_suw-vi") ) { bb_n=bbn;
     if ( sos(-20,bb_n-1) && wfa(son+1,bb_n-1,"_sky_na_suw-vi") ) { wb_n=bfn;

     if ( eos(2,5) && s(0,eon-1) &&
            q(eon,"prl_vi mest_vi mest_3e") && rodeq_sw_pl(wb_n,eon) )
     { l[i]=omo2; Z[269]++; if(dbg){print "Z269"}; continue };
   };};

 };
 # _sky_na_suw-vi:end
 # _sky_v_suw-vi:end
 if ( w(1,"в во") ) {
   if ( wfa(2,5,"_sky_v_suw-vi") ) { wf_n=wfn;

     if ( vex(Y["tn_ok_v"]) && vex(Y["n-_gl_v_palate-iv"])  )
     { wf_n=""; Z[270]++; if(dbg){print "Z270"}; };

     if ( vgl(wf_n,2,5) && s(0,wf_n-1) &&
          qir(2,wf_n-1,"prl_vi mest_vi mest_3e prq_vi") )
     { l[i]=omo2; Z[271]++; if(dbg){print "Z271"}; continue };
   };
 };
 # _sky_v_suw-vi:end

 ######################################################################################################################
 # _palate_k_suw-da:start
 if ( w(1,"к ко") &&
     wa(2,"_palate_k_suw-da") && s(0,1) )
 { l[i]=omo1; Z[272]++; if(dbg){print "Z272"}; continue };
 if ( wb(-6,-1,"к ко") &&
     wba(wbn+1,-1,"_palate_k_suw-da") && s(wbn,-1) )
 { l[i]=omo1; Z[273]++; if(dbg){print "Z273"}; continue };
 # _palate_k_suw-da:end

 # _palate_pre-tv_suw-tv:start
 if ( pre_tv(1) &&
         wfa(2,4,"_palate_pre-tv_suw-tv") && s(0,wfn-1) )
 { l[i]=omo1; Z[274]++; if(dbg){print "Z274"}; continue };
 if ( qb(-6,-1,"pre_tv") &&
     wba(wbn+1,-1,"_palate_pre-tv_suw-tv") && s(wbn,-1) && s(0,qbn-1) )
 { l[i]=omo1; Z[275]++; if(dbg){print "Z275"}; continue };
 # _palate_pre-tv_suw-tv:end

 # _sky_mexdu_suw-tv:start
 if ( w(1,"между") &&
    wfa(2,4,"_sky_mexdu_suw-tv") && s(0,wfn-1) )
 { l[i]=omo2; Z[276]++; if(dbg){print "Z276"}; continue };
 # _sky_mexdu_suw-tv:end

 cst="вдалеке вдали веками издали";
 if ( w(1,cst) && s(0) )
 { l[i]=omo1; Z[277]++; if(dbg){print "Z277"}; continue };
 if ( qxs(-1,"тот этот","же самый") &&
        w(xsn-1,cst) && s(xsn-1) )
 { l[i]=omo1; Z[278]++; if(dbg){print "Z278"}; continue };

 if ( !(vgl(Y["n_pre_na_ist"],-5,-1) && s(Y["n-_sky_pe"],-1) ) &&
          q(1,"nar_vrem") &&
        qxs(2,"столько сколько много немало несколько","дней недель месяцев лет веков столетий тысячелетий времени") )
 { l[i]=omo1; Z[279]++; if(dbg){print "Z279"}; continue };
 if ( qxs(-1,"в","последние следующие последующие эти те такие","дни недели месяцы годы века столетия тысячелетия") )
 { l[i]=omo1; Z[280]++; if(dbg){print "Z280"}; continue };

 if ( qxs(1,"многие долгие","дни недели месяцы годы века столетия тысячелетия") )
 { l[i]=omo1; Z[281]++; if(dbg){print "Z281"}; continue };

 # _palate_s_suw-ro:start
 if ( w(-2,"с со") &&
     wa(-1,"_palate_s_suw-ro") && s(-2,-1) )
 { l[i]=omo1; Z[282]++; if(dbg){print "Z282"}; continue };
 # _palate_s_suw-ro:end

 # _palate_s_suw-tv:start
 if ( w(-2,"с со") &&
     wa(-1,"_palate_s_suw-tv") && s(-2,-1) )
 { l[i]=omo1; Z[283]++; if(dbg){print "Z283"}; continue };
 # _palate_s_suw-tv:end

 if ( wf(1,3,"с со") ) { wf_n=wfn;
     if (Y["tn_ok_na"] && TN_na_nebo_f() )
     { Z[284]++; if(dbg){print "Z284", "-- TN_na_nebo_f"}; continue };
     cst0="закрыть открыться";
     if ( vex(Y["n-_sky_pe"]) && s(Y["n-_sky_pe"],-1) && !weq(Y["w-_sky_pe"],cst0) &&
          qir(Y["n-_sky_pe"]+1,-1,"prl_vi mest_vi mest_3e prl_kred_sr prq_vi") )
     { wf_n=""; Z[285]++; if(dbg){print "Z285"}; };

     # _palate_s_suw-ro:start
     if ( vgl(wf_n,1,3) && s(0,wf_n-1) &&
          wfa(wf_n+1,wf_n+4,"_palate_s_suw-ro") && s(wf_n,wfn-1) &&
          qir(1,wf_n-1,"suw_ro suw_edne isname") &&
          qir(wf_n+1,wfn-1,"prl_ro prq_ro mest_ro mest_3e qik_ro") )
     { l[i]=omo1; Z[286]++; if(dbg){print "Z286"}; continue };
     if ( vgl(wf_n,1,3) && qsf(0,wf_n-1,",") && s(0,sfn-1) &&
          wfa(wf_n+1,wf_n+4,"_palate_s_suw-ro") && s(sfn+1,wfn-1) &&
          qir(1,sfn,"suw_ro suw_edne isname") &&
          qir(sfn+1,wf_n-1,"qast_any prq_any mcop_any") &&
          qir(wf_n+1,wfn-1,"prl_ro prq_ro mest_ro mest_3e qik_ro") )
     { l[i]=omo1; Z[287]++; if(dbg){print "Z287"}; continue };
     # _palate_s_suw-ro:end

     # _palate_s_suw-tv:start
     if ( veq(wf_n,1) && qxs(2,"острым","краем") )
     { l[i]=omo2; Z[288]++; if(dbg){print "Z288"}; continue };

     if ( vgl(wf_n,1,3) && zs(wf_n-1) && s(0,wf_n-2) &&
          wfa(wf_n+1,wf_n+4,"_palate_s_suw-tv") && s(wf_n,wfn-1) &&
         (qir(1,wf_n-1,"suw_ro suw_edne isname sz_i nar_kaq prl_kred_mu")||w(wf_n-1,"вместе")) &&
          qir(wf_n+1,wfn-1,"prl_tv prq_tv mest_tv mest_3e qik_tv") )
     { l[i]=omo1; Z[289]++; if(dbg){print "Z289"}; continue };
     if ( vgl(wf_n,1,3) && zs(wf_n-1) && s(0,wf_n-2) &&
            q(wf_n+1,"prl_tv") && s(wf_n) && zs(wf_n+1) &&
            q(wf_n+2,"prq_tv") &&
          wfa(wf_n+3,wf_n+7,"_palate_s_suw-tv") && s(wf_n+2,wfn-1) &&
          qir(wf_n+3,wfn-1,"prl_tv prq_tv mest_tv mest_3e suw_tv suw_ro") )
     { l[i]=omo1; Z[290]++; if(dbg){print "Z290"}; continue };
     # _palate_s_suw-tv:end
 };

 # _palate_za_suw-tv:start
 if ( w(-2,"за") &&
     wa(-1,"_palate_za_suw-tv") && s(-2,-1) )
 { l[i]=omo1; Z[291]++; if(dbg){print "Z291"}; continue };

 if ( wf(1,3,"за") ) { wf_n=wfn;

      if ( vgl(wf_n,1,3) && zs(wf_n-1) && s(0,wf_n-2) &&
           wfa(wf_n+1,wf_n+4,"_palate_za_suw-tv") && s(wf_n,wfn-1) &&
           qir(1,wf_n-1,"suw_ro suw_edne isname sz_i") &&
           qir(wf_n+1,wfn-1,"prl_tv prq_tv mest_tv mest_3e qik_tv") )
     { l[i]=omo1; Z[292]++; if(dbg){print "Z292"}; continue };
     if ( vgl(wf_n,1,3) && zs(wf_n-1) && s(0,wf_n-2) &&
            q(wf_n+1,"prl_tv") && s(wf_n) && zs(wf_n+1) &&
            q(wf_n+2,"prq_tv") &&
          wfa(wf_n+3,wf_n+7,"_palate_za_suw-tv") && s(wf_n+2,wfn-1) &&
          qir(wf_n+3,wfn-1,"prl_tv prq_tv mest_tv mest_3e suw_tv suw_ro") )
     { l[i]=omo1; Z[293]++; if(dbg){print "Z293"}; continue };
 };
 # _palate_za_suw-tv:end

 # _palate_u_suw-ro:start
 if ( w(1,"у") &&
    wfa(2,5,"_palate_u_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e qik_ro") )
 { l[i]=omo1; Z[294]++; if(dbg){print "Z294"}; continue };
 # _palate_u_suw-ro:start

 # _palate_sredi_suw-ro:start
 cst="посередине посреди посредине среди";
 if ( w(1,cst) &&
    wfa(2,5,"_palate_sredi_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e qik_ro") )
 { l[i]=omo1; Z[295]++; if(dbg){print "Z295"}; continue };
 if ( wb(-6,-2,cst) &&
      wa(wbn+1,"_palate_sredi_suw-ro") && s(wbn,-1) &&
     qia(wbn+2,-1,"gl_aux_be","prl_vi mest_3e mest_vi prq_vi") )
 { l[i]=omo1; Z[296]++; if(dbg){print "Z296"}; continue };
 # _palate_sredi_suw-ro:start

 # _palate_sredi_suw-ro:start
 cst="посередине посреди посредине среди";
 if ( w(1,cst) &&
    wfa(2,5,"_sky_sredi_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e qik_ro") )
 { l[i]=omo2; Z[297]++; if(dbg){print "Z297"}; continue };
 if ( wb(-6,-2,cst) &&
      wa(wbn+1,"_sky_sredi_suw-ro") && s(wbn,-1) &&
     qia(wbn+2,-1,"gl_aux_be","prl_vi mest_3e mest_vi prq_vi") )
 { l[i]=omo2; Z[298]++; if(dbg){print "Z298"}; continue };
 # _palate_sredi_suw-ro:start

 # _palate_bez_suw-ro:start
 if ( w(-2,"без") &&
     wa(-1,"_palate_bez_suw-ro") && s(-2,-1) )
 { l[i]=omo1; Z[299]++; if(dbg){print "Z299"}; continue };
 # _palate_bez_suw-ro:start

 # _sky_s_suw-ro:start
 if ( wb(-8,-2,"с со") ) { wb_n=wbn;
   if ( wfa(wb_n+1,-1,"_sky_s_suw-ro") ) { bb_n=wfn;

      if ( vgl(wb_n,-8,-2) && vgl(bb_n,wb_n+1,-1) && s(wb_n,-1) &&
           qir(wb_n+1,bb_n-1,"prl_ro mest_ro mest_3e") &&
           qir(bb_n+1,-1,"prl_any mcop_any suw_ro") )
      { l[i]=omo2; Z[300]++; if(dbg){print "Z300"}; continue };

 };};
 if ( w(1,"с со") &&
    wfa(2,5,"_sky_s_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e qik_ro") && W_w(wfn+1,"до по") )
 { l[i]=omo2; Z[301]++; if(dbg){print "Z301"}; continue };
 # _sky_s_suw-ro:end

 # _sky_u_suw-ro:start
 if ( w(1,"у") &&
    wfa(2,5,"_sky_u_suw-ro") && s(0,wfn-1) &&
    qir(2,wfn-1,"prl_ro prq_ro mest_ro mest_3e qik_ro") && W_w(wfn+1,"до по") )
 { l[i]=omo2; Z[302]++; if(dbg){print "Z302"}; continue };
 if ( w(-2,"у") &&
     wa(-1,"_sky_u_suw-ro") && s(-2,-1) )
 { l[i]=omo2; Z[303]++; if(dbg){print "Z303"}; continue };
 # _sky_u_suw-ro:end

 # _sky_s_suw-tv:start
 if ( wf(1,4,"с со") ) { wf_n=wfn;
      cst1="кусками куском частью";
      cst2="двери створки филенки";
      if ( vgl(wf_n,1,3) &&
            wf(wf_n+1,wf_n+3,cst1) &&
           wf2(wfn+1,wfn+3,cst2) && s(0,wfN-1) &&
           qir(wf_n+1,wfn-1,"prl_tv mest_tv mest_3e") &&
           qir(wfn+1,wfN-1,"prl_ro mest_ro mest_3e") )
      { l[i]=omo2; Z[304]++; if(dbg){print "Z304"}; continue };
   if ( wfa(wf_n+1,wf_n+4,"_sky_s_suw-tv") ) { bf_n=wfn;

      if ( vex(Y["tn_ok_v"]) && TN_v_nebo_f() )
      { Z[305]++; if(dbg){print "Z305", "-- TN_v_nebo_f"}; continue };
      cst="накренить покидать покинуть";
      if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+4) && s(-1,wf_n-1) &&
           veq(Y["n-_palate_pe"],-1) && bw(-1,cst) )
      { wf_n=bf_n=""; Z[306]++; if(dbg){print "Z306"}; };
      cst="обрушиться рухнуть";
      if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+4) && s(0,wf_n-1) &&
           veq(Y["n+_palate_pe"],bf_n+1) && bw(bf_n+1,cst) )
      { wf_n=bf_n=""; Z[307]++; if(dbg){print "Z307"}; };
      cst0="отчего";
      if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+4) && s(-1,wf_n-1) &&
            ba(-1,"_palate_prl") && W(-1,cst0) )
      { wf_n=bf_n=""; Z[308]++; if(dbg){print "Z308"}; };
#     cst2="деталями";
#     cst3="бетона камня кирпича мрамора";
#     if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+4) &&
#            w(bf_n,cst2) &&
#            w(bf_n+1,"из") &&
#           wf(bf_n+2,bf_n+4,cst3) && s(0,wfn-1) )
#     { l[i]=omo1; Z[309]++; if(dbg){print "Z309"}; continue };

    cst0="дома";
    if ( vgl(wf_n,1,4) && vgl(bf_n,wf_n+1,wf_n+4) && s(0,bf_n-1) && W(wf_n-1,cst0) && W_w(bf_n+1,"до по") &&
         qir(1,wf_n-1,"prl_vi mest_vi gl_aux_be qast_any nar_any sz_i") &&
         qir(wf_n+1,bf_n-1,"prl_tv prq_tv mest_tv mest_3e mest_vip3e qik_tv suw_tv qast_any prl_kred_sr nar_any sz_iili pre_vi") )
    { l[i]=omo2; Z[310]++; if(dbg){print "Z310"}; continue };
    cst="оказаться поставить сочетаться";
    if ( veq(wf_n,2) && vgl(bf_n,wf_n+1,wf_n+4) && s(0,bf_n-1) &&
          bw(1,cst) &&
         qir(wf_n+1,bf_n-1,"prl_tv prq_tv mest_tv mest_3e qik_tv suw_tv") )
    { l[i]=omo2; Z[311]++; if(dbg){print "Z311"}; continue };
    if ( qsf(1,3,",") && vgl(wf_n,2,4) && vgl(bf_n,wf_n+1,wf_n+4) && s(0,sfn-1) && z(sfn) && s(sfn+1,bf_n-1) &&
         qiz(1,sfn,"nar_any gl_aux_be","prl_edmuim prl_edmutv") &&
         qir(wf_n+1,bf_n-1,"prl_tv prq_tv mest_tv mest_3e qik_tv suw_tv") )
    { l[i]=omo2; Z[312]++; if(dbg){print "Z312"}; continue };
#   if ( vgl(wf_n,1,4) && vgl(bf_n,wf_n+1,wf_n+4) && s(0,bf_n-1) &&
#      mqast(1) && veq(xwn,wf_n-1) &&
#        qir(wf_n+1,bf_n-1,"prl_tv prq_tv mest_tv mest_3e qik_tv") && W_w(bf_n+1,"до по") )
#   { l[i]=omo2; Z[313]++; if(dbg){print "Z313"}; continue };


 };};
 # _sky_s_suw-tv:end

 cst="близ вблизи";
 if ( w(1,cst) && q(2,"suw_ro isname") && s(0,1)  )
 { l[i]=omo1; Z[314]++; if(dbg){print "Z314"}; continue };

 if ( sc(0,"[XIV]+") &&
       w(1,"века веков столетия столетий") && s(0) )
 { l[i]=omo1; Z[315]++; if(dbg){print "Z315"}; continue };
 if ( sc(0,"[XIV]+") &&
       w(1,"в вв") && s(0) && sc(1,"\\.") )
 { l[i]=omo1; Z[316]++; if(dbg){print "Z316"}; continue };

  ######################################################################################################
    # основные прилагательные -- palate

    if ( FN_palate_prl_f("_palate_prl") )
    { Z[317]++; if(dbg){print "Z317", "-- FN_palate_prl_f(\"_palate_prl\")"}; continue };
    if ( q(-1,"prl_pv_any") && ba(-1,"_palate_prl_pv") )
    { l[i]=omo1; Z[318]++; if(dbg){print "Z318"}; continue };

    # основные прилагательные -- sky
    if ( FN_sky_prl_f("_sky_prl") )
    { Z[319]++; if(dbg){print "Z319", "-- FN_sky_prl_f(\"_sky_prl\")"}; continue };

    if ( mbba(-1,2,"M_sky_2prl") && s(-1) && z(0) && s(1) && q(1,"nar_step") )
    { l[i]=omo2; Z[320]++; if(dbg){print "Z320"}; continue };
    if ( mbba(-2,-1,"M_sky_2prl") && s(-2,-1) )
    { l[i]=omo2; Z[321]++; if(dbg){print "Z321"}; continue };

  ######################################################################################################
 ### небо замки им_п_ вин_п_
 if( veq(Y["iwrd_case"],"iv") ) {

    bf_n=Y["n+_palatelike_things"];

    # —
    if ( se(0," — ") && vgl(bf_n,1,4) &&
        qir(1,bf_n-1,"qast_any nar_any prl_im mest_im mest_3e mest_it prq_im gl_aux_be mod_bz") &&
     !( veq(Y["n-_sky_prl"],-1)||veq(Y["n-_sky_pe"],-1) ) )
    { l[i]=omo1; Z[322]++; if(dbg){print "Z322"}; continue };b
    if ( se(1," — ") && vgl(bf_n,2,5) &&
          q(1,"suw_ro suw_edne isname qast_any") &&
        qir(2,bf_n-1,"prl_im mest_im mest_3e mest_it prq_im gl_aux_be mod_bz") &&
       !bam(-1,"_sky_prl _sky_pe") )
    { l[i]=omo1; Z[323]++; if(dbg){print "Z323"}; continue };b
    if ( se(0," — ") &&
        qsf(1,5,",") && se(sfn+1," — ") &&
         ba(sfn+1,"_palatelike_things") )
    { l[i]=omo1; Z[324]++; if(dbg){print "Z324"}; continue };
    if ( q(-1,"mest_it") && s(-1) &&
        ba(-2,"_palatelike_things") && se(-2," — ") )
    { l[i]=omo1; Z[325]++; if(dbg){print "Z325"}; continue };
    if ( vgl(Y["n-_palate_pe"],-7,-1) && qsb(-5,-2,",") && s(Y["n-_palate_pe"],sbn-1) &&
       ( qaw(sbn+1,"а но","не и")||
         qaw(sbn+1,"а но") ) && s(awn,-1) &&
          ba(sbn,"_palatelike_things") &&
         qir(awn+1,-1,"prl_vi mest_vi mest_3e") &&
         qir(Y["n-_palate_pe"]+1,sbn-1,"qast_any prl_vi mest_vi mest_3e nar_any") )
    { l[i]=omo1; Z[326]++; if(dbg){print "Z326"}; continue };
    cst="нужен нужна нужны";
    if ( qsb(-5,-2,",") &&
       ( qaw(sbn+1,"а но","не и")||
         qaw(sbn+1,"а но") ) && s(awn,-1) &&
          ba(sbn,"_palatelike_things") &&
         (qb(sbn-4,sbn-1,"mod_any") || wb(sbn-4,sbn-1,cst) ) && v2v(qbn,wbn) && s(yvn,sbn-1) &&
         qir(awn+1,-1,"prl_vi mest_vi mest_3e") &&
         qir(yvn+1,sbn-1,"qast_any prl_vi mest_vi mest_3e nar_any") )
    { l[i]=omo1; Z[327]++; if(dbg){print "Z327"}; continue };
    if ( sc(0,"\\(") && sc(1,"\\)") && veq(Y["n+_palatelike_things"],1) )
    { l[i]=omo1; Z[328]++; if(dbg){print "Z328"}; continue };


    cst="быть вставать выбрать избрать именовать именоваться казаться объявить объявлять оказаться провозгласить провозглашать сделать служить стать считаться \
         являться";
    cst8="быть стать";
    cst0="дверью клеткой ключом пеплом руинами целью центром";
    if ( bf(1,4,cst) ) { bf_n=bfn;
      if ( bw(bf_n,cst8) ) { if ( s(bf_n,3) && bf(bf_n+1,4,cst) ) bf_n=bfn }; bbn=wfn=bfn="";

      if ( bfa(bf_n+1,bf_n+5,"_palatelike_things")||
            wf(bf_n+1,bf_n+5,cst0)||
         ( bfa(bf_n+1,bf_n+5,"_prq_palate") && q(bfn,"prq_tv") ) ) {

          if (bfn) bb_n=bfn; if (wfn) bb_n=wfn;

          if ( vgl(bf_n,1,4) && zs(0) && s(1,bb_n-1) &&
               vgl(Y["n-_sky_pe"],-4,-1) && s(Y["n-_sky_pe"],-1) &&
               qir(bb_n+1,-1,"prl_edmuim prl_mnim mest_vi mest_3e qast_any") )
          { bf_n=bb_n=""; Z[329]++; if(dbg){print "Z329"}; };
          if ( vgl(bf_n,1,4) && zs(0) && s(1,bb_n-1) &&
                 w(bb_n,"ключом") && !w(bb_n+1,"к") )
          { bf_n=bb_n=""; Z[330]++; if(dbg){print "Z330"}; };

       if ( vgl(bf_n,1,4) && zs(0) && s(1,bb_n-1) &&
              q(bb_n,"suw_tv prq_tv") &&
            qir(1,bf_n-1,"otsz_any mod_any gl_aux_be qast nar_any suw_ro suw_edne isname suw_vi prl_vi mest_vi mest_da mest_im sz suw_da") &&
            qir(bf_n+1,bb_n-1,"prl_tv prq_tv mest_tv mest_3e nar_any prl_kred_sr qast suw_tv suw_da mest_da isname suw_edne prq_kred prq_krmn") )
       { l[i]=omo1; Z[331]++; if(dbg){print "Z331"}; continue };
       if ( vgl(bf_n,1,4) && zs(0) && s(1,bb_n-1) &&
              w(bf_n+1,"для") &&
              q(bb_n,"suw_tv prq_tv") &&
            qir(1,bf_n-1,"otsz_any mod_any gl_aux_be qast nar_any suw_ro suw_edne isname suw_vi prl_vi mest_vi mest_da mest_im sz suw_da prl_kred_sr") &&
            qir(bf_n+2,bb_n-1,"prl_tv prq_tv mest_tv mest_3e nar_any prl_kred_sr qast suw_ro mest_ro isname suw_edne prq_kred prq_krmn") )
       { l[i]=omo1; Z[332]++; if(dbg){print "Z332"}; continue };
       if ( vgl(bf_n,1,4) && zs(0) && s(1,bb_n-1) &&
              q(bb_n,"suw_tv") &&
            qir(1,bf_n-1,"otsz_any mod_any gl_aux_be qast nar_any suw_ro isname") &&
              q(bf_n+1,"narph_any") &&
            qiz(xwn+1,bb_n-1,"prl_tv prq_tv mest_tv mest_3e nar_any prl_kred_sr qast_any suw_da mest_da isname suw_edne","qast") )
       { l[i]=omo1; Z[333]++; if(dbg){print "Z333"}; continue };


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
        { l[i]=omo1; Z[334]++; if(dbg){print "Z334"}; continue };
        if ( vgl(bf_n,1,4) && vgl(qf_n,bf_n+1,bf_n+4) &&
               w(qf_n+1,"от") &&
              wf(qf_n+2,qf_n+5,cst2) && s(0,wfn-1) &&
             qir(bf_n+1,qf_n-1,"mod_any nar_any prl_kred_sr gl_aux_be isname") &&
             qir(qf_n+2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
        { l[i]=omo2; Z[335]++; if(dbg){print "Z335"}; continue };
        if ( vgl(bf_n,1,4) && vgl(qf_n,bf_n+1,bf_n+4) &&
               w(qf_n+1,"с со") &&
              wf(qf_n+2,qf_n+5,cst4) && s(0,wfn-1) &&
             qir(bf_n+1,qf_n-1,"mod_any nar_any prl_kred_sr gl_aux_be isname") &&
             qir(qf_n+2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") )
        { l[i]=omo2; Z[336]++; if(dbg){print "Z336"}; continue };

     };
    };

    cst="номер";
    if ( bb(-5,-2,cst) && se(bbn," — ") &&
          q(bbn+1,"mest_it") &&
        qir(bbn+2,-1,"qast_any nar_any prl_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[337]++; if(dbg){print "Z337"}; continue };

    if ( ( ( qxs(-1,"не","только") && qxw(1,"а но","и") )||
           ( qxs(-1,"как","сам") && qxw(1,"так","и") ))&& z(0) &&
             bfa(xwn+1,wxn+4,"_palate_environs") && s(xwn,bfn-1) &&
             qir(xwn+1,bfn-1,"prl_vi mest_vi mest_3e prq_vi") )
    { l[i]=omo1; Z[338]++; if(dbg){print "Z338"}; continue };

    if ( wb(-4,-1,"где") && s(wbn,-1) && z(0) &&
      ( qxw(1,"а","где") ||
        qxw(1,"там","и") ) &&
        bfa(xwn+1,wxn+4,"_palate_environs") && s(xwn,bfn-1) &&
        qir(wbn+1,-1,"prl_vi mest_vi mest_3e prq_vi") &&
        qir(xwn+1,bfn-1,"prl_im mest_vi mest_3e prq_im") )
    { l[i]=omo1; Z[339]++; if(dbg){print "Z339"}; continue };

    if ( qxs(-1,"меньше больше меньшее большее","чем") &&
       ( qxw(1,"и или","хотя","бы")||
         qxw(1,"и или") ) && zs(0) && s(xwn) &&
          ba(xwn+1,"_palatelike_things") )
    { l[i]=omo1; Z[340]++; if(dbg){print "Z340"}; continue };

    if ( wf(1,4,"как") && qxs(wfn,"как","на","ладони") && s(0,wfn-1) &&
        qir(1,wfn-1,"isname gl_aux_be prq_kred_mu") )
    { l[i]=omo1; Z[341]++; if(dbg){print "Z341"}; continue };

    if ( !vex(Y["tn_ok_any"]) && q(1,"prq_edmuim prq_mnim") && ba(1,"_prq_palate") && s(0) )
    { l[i]=omo1; Z[342]++; if(dbg){print "Z342"}; continue };

    cst="весом высотой размером ростом стоимостью ценой шириной";
    if ( wb(-5,-1,"с со") ) { wb_n=wbn;
      if ( wb2(wb_n-4,wb_n-1,cst) && s(wbN,-1) &&
           qir(wbN+1,wb_n-1,"nar_step qast_any") &&
           qir(wb_n+1,-1,"prl_vi mest_vi mest_3e prq_vi") )
      { l[i]=omo1; Z[343]++; if(dbg){print "Z343"}; continue };
   cst1="восточной западной северной южной";
   cst2="стороны";
      if ( qaw(wb_n+1,cst1,cst2) && s(wb_n) && s(awn,-1) &&
           qir(awn+1,-1,"prl_vi mest_vi mest_3e prq_vi") )
      { l[i]=omo1; Z[344]++; if(dbg){print "Z344"}; continue };
    };

    cst="местность место";
    if ( bw(-5,cst) &&
          q(-4,"nar_mest") &&
          q(-3,"prl_vi") &&
        qxs(-1,"и","рядом") && s(-5,-1) )
    { l[i]=omo1; Z[345]++; if(dbg){print "Z345"}; continue };

    if ( q(-3,"prl_any") && s(-3) &&
        ba(-2,"_skylike_things") && zs(-2) &&
         q(-1,"prl_edmuim") && s(-1) )
    { l[i]=omo2; Z[346]++; if(dbg){print "Z346"}; continue };

    if ( z(0) &&
        ba(1,"_sky_parts") &&
         q(2,"otsz_edmuro otsz_mnro") && s(1) )
    { l[i]=omo2; Z[347]++; if(dbg){print "Z347"}; continue };

    if ( qxs(1,"до","открытого закрытого","состояния") )
    { l[i]=omo2; Z[348]++; if(dbg){print "Z348"}; continue };
    # _palate_environs
    if ( qb(-5,-1,"sz_iili") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_palate_environs") ) { bb_n=bbn;

         if ( vgl(Y["n+_sky_pe"],1,5) && s(0,Y["n+_sky_pe"]-1) )
         { bb_n=qb_n=""; Z[349]++; if(dbg){print "Z349"}; };

       if ( vgl(qb_n,-5,-1) && veq(bb_n,qb_n-1) && s(bb_n,-1) &&
              q(bb_n,"suw_im suw_vi") &&
            qir(qb_n+1,-1,"prl_im prq_im mest_im qast_any") )
       { l[i]=omo1; Z[350]++; if(dbg){print "Z350"}; continue };

    };};

    cst1="двери дверь";
    if ( narph_spos(1) && s(0) && z(xwn) &&
                  w(xwn+1,cst1) &&
                  q(xwn+2,"nar_spos") )
    { l[i]=omo2; Z[351]++; if(dbg){print "Z351"}; continue };
    cst1="камня кирпича основания тла фундамента";
    if ( wf(2,6,cst1) ) { bf_n=wfn;
       if ( vgl(bf_n,2,6) && s(0,bf_n-1) &&
             wf(1,bf_n-1,"до") &&
            qir(1,wfn-1,"gl_ed gl_mn gl_in isname suw_ro") &&
            qir(wfn+1,bf_n-1,"prl_ro mest_ro mest_3e prq_ro") )
       { l[i]=omo1; Z[352]++; if(dbg){print "Z352"}; continue };
    };
    if ( qxs(-1,"до",cst1) )
    { l[i]=omo1; Z[353]++; if(dbg){print "Z353"}; continue };
    cst1="булыжники груду камешки камни камушки кирпичи кирпичики клочья куски кусочки пыль щепки щепы";
    if ( wf(2,5,cst1) ) { bf_n=wfn;
       if ( vgl(bf_n,2,5) && s(0,bf_n-1) &&
              w(1,"в во на") &&
            qir(2,bf_n-1,"prl_vi") )
       { l[i]=omo1; Z[354]++; if(dbg){print "Z354"}; continue };
    };
    if ( wb(-4,-1,cst1) ) { wb_n=wbn;
       if ( vgl(wb_n,-4,-1) &&
             wb(wb_n-4,wb_n-1,"в во на") && s(wbn,-1) &&
            qir(wbn+1,wb_n-1,"prl_vi") &&
            qir(wb_n+1,-1,"prl_vi mest_vi mest_3e prl_ro suw_ro") )
       { l[i]=omo1; Z[355]++; if(dbg){print "Z355"}; continue };
    };
    cst1="булыжнику камешкам камешку камню камням камушкам камушки камушку кирпичикам кирпичику кирпичу крипчику кусочкам";
    if ( wf(2,5,cst1) ) { bf_n=wfn;
       if ( vgl(bf_n,2,5) && s(0,bf_n-1) &&
              w(1,"по") &&
            qir(2,bf_n-1,"prl_da") )
       { l[i]=omo1; Z[356]++; if(dbg){print "Z356"}; continue };
    };

    cst1="большой замечательный интересный красивый прекрасный";
    if ( w(-4,"у") &&
         q(-3,"mest_ro suw_ro") &&
         q(-2,"nar_step") &&
         w(-1,cst1) && s(-4,-1) )
    { l[i]=omo1; Z[357]++; if(dbg){print "Z357"}; continue };
    if ( w(-3,"у") &&
         q(-2,"mest_ro suw_ro") &&
         w(-1,cst1) && s(-3,-1) )
    { l[i]=omo1; Z[358]++; if(dbg){print "Z358"}; continue };

    # _sky_prq_kak_gl:start
    cst1="быть ведь же казаться стать считаться являться";
#   if ( q(-1,"prq_im prq_kred_mu") && bw(-2,cst1) && ba(-1,"_sky_prq_kak_gl") && s(-2,-1) )
#   { l[i]=omo2; Z[359]++; if(dbg){print "Z359"}; continue };
    if ( q(2,"prq_im prq_kred_mu") && bw(1,cst1) && ba(2,"_sky_prq_kak_gl") && s(0,1) &&
      (!ba(-1,"_palate_prl") && s(-1)) )
    { l[i]=omo2; Z[360]++; if(dbg){print "Z360"}; continue };
    # _sky_prq_kak_gl:end

    # весь
    cst="весь целый";
    if ( wb(-5,-1,cst) ) { wb_n=wbn;
       if ( vgl(wb_n,-5,-1) && s(wb_n,-1) &&
            qir(wb_n+1,-1,"mest_vi mest_3e prl_vi prq_vi") && !(ba(1,"_sky_pe_forced") && s(0) ) )
       { l[i]=omo1; Z[361]++; if(dbg){print "Z361"}; continue };
#      if ( veq(wb_n,-2) &&
#            wc(-1,"ский$") && s(-2,-1) )
#      { l[i]=omo1; Z[362]++; if(dbg){print "Z362"}; continue };
    };

    if ( w(1,cst) && s(0) && p(1) )
    { l[i]=omo1; Z[363]++; if(dbg){print "Z363"}; continue };
    cst="весь целиком";
    if ( w(1,cst) && se(0," — ") && ( p(1)||z(1) ) )
    { l[i]=omo1; Z[364]++; if(dbg){print "Z364"}; continue };
    # весь


    cst1="ворота дверь калитка";
    cst2="камера комната парадное подъезд прихожая продуктовый";
    if ( ba(-5,"_sky_pe") &&
          w(-4,"на") &&
         bw(-3,cst1) &&
          w(-2,"в") &&
         bw(-1,cst2) && s(-5,-1) )
    { l[i]=omo2; Z[365]++; if(dbg){print "Z365"}; continue };

  # в небо --->>>
  if ( vgl(Y["n_pre_v_ist"],-8,-1) ) { wb_n=Y["n_pre_v_ist"];

    if ( TN_v_nebo_f() )
    { Z[366]++; if(dbg){print "Z366", "-- TN_v_nebo_f"}; continue };

    if ( vgl(wb_n,-8,-2) && ba(wb_n-1,"_gl_v_palate-iv") && s(wb_n-1,-1) &&
         qir(wb_n+1,-1,"mest_edmuvi prl_edmuvi prq_edmuvi prq_mnvi suw_da mest_da prl_da suw_tv prl_tv mest_tv suw_edne isname mest_vip3e mest_vi") )
    { l[i]=omo1; Z[367]++; if(dbg){print "Z367"}; continue }; # без tn!

  }; # в небо
  # в небо <<<---
  ######################################################################################################
  # на небо
  if ( vgl(Y["n_pre_na_ist"],-8,-1) ) { wb_n=Y["n_pre_na_ist"];

    if ( TN_na_nebo_f() )
    { Z[368]++; if(dbg){print "Z368", "-- TN_na_nebo_f"}; continue };

    if ( veq(wb_n,-3) &&
          ba(-4,"_suw_na_palate") && s(-4,-1) &&
          wa(-2,"_palate_environs") &&
        sz_i(-1) )
    { l[i]=omo1; Z[369]++; if(dbg){print "Z369"}; continue };
    if ( veq(wb_n,-3) &&
          ba(-4,"_gl_na_sky") &&
           q(-2,"prl_vi prq_vi") &&
           q(-1,"suw_vi") && s(-4,-1) )
    { l[i]=omo2; Z[370]++; if(dbg){print "Z370"}; continue };

  }; # на небо
  ######################################################################################################
  # за небо
  if ( vgl(Y["n_pre_za"],-5,-1) ) {

    if ( TN_za_nebo_f() )
    { Z[371]++; if(dbg){print "Z371", "-- TN_za_nebo_f"}; continue };

  }; # за небо
  ######################################################################################################
  # под небо
  if ( vgl(Y["n_pre_pod"],-5,-1) ) {

    if ( TN_pod_nebo_f() )
    { Z[372]++; if(dbg){print "Z372", "-- TN_pod_nebo_f"}; continue };

  }; # под небо
  ######################################################################################################
  # о небо
  if ( vgl(Y["n_pre_o"],-5,-1) ) {

    if ( TN_o_nebo_f() )
    { Z[373]++; if(dbg){print "Z373", "-- TN_o_nebo_f"}; continue };

  }; # о небо

  ######################################################################################################
  # по небо
  if ( vgl(Y["n_pre_po"],-5,-1) ) {

    if ( TN_po_nebo_f() )
    { Z[374]++; if(dbg){print "Z374", "-- TN_po_nebo_f"}; continue };

  }; # по небо

  ######################################################################################################
  # через небо
  if ( vgl(Y["n_pre_qerez"],-5,-1) ) {

    if ( TN_qerez_nebo_f() )
    { Z[375]++; if(dbg){print "Z375", "-- TN_qerez_nebo_f"}; continue };

  };
  ######################################################################################################
 
  # pointesque <<-- складываем сюда исключения или случаи с опорными словами
  if ( FN_nebo_vi_esc_f(5) )
  { Z[17]++; if(dbg){print "Z17", "-- is_escape!"}; continue };
  # pointesque

  # ниже "небо" без собственного предлога
   # escape:pe
   #
    cst2="глубине гуще конце начале середине стороне центре";
    cst3="болота города долины дорог дороги композиции крепости круга леса подземелья склона";
    if ( wf(1,6,"в во на") ) { wf_n=wfn;
      if ( wf(wf_n+1,wf_n+4,cst2) ) { bf_n=wfn;
        if ( wf(bf_n+1,bf_n+4,cst3) ) { qf_n=wfn;

         if ( vgl(wf_n,1,6) && vgl(bf_n,wf_n+1,wf_n+4) && vgl(qf_n,bf_n+1,bf_n+4) &&
              qir(wf_n+1,bf_n-1,"prl_pr prq_pr mest_pr mest_3e") &&
              qia(bf_n+1,qf_n-1,"pre_ro","prl_ro prq_ro mest_ro mest_3e") && s(0,qf_n-1) )
         { l[i]=omo1; Z[377]++; if(dbg){print "Z377"}; continue };

    };};};

    if ( wb(-4,-1,cst3) ) { qf_n=wbn;
      if ( wb(qf_n-4,qf_n-1,cst2) ) { bf_n=wbn;
        if ( wb(bf_n-4,bf_n-1,"в во на") ) { wb_n=wbn;

       if ( vgl(qf_n,-4,-1) && vgl(bf_n,qf_n-4,qf_n-1) && vgl(wb_n,bf_n-4,bf_n-1) && s(wb_n,-1) &&
            qir(wb_n+1,bf_n-1,"prl_pr prq_pr mest_pr mest_3e") &&
            qir(bf_n+1,qf_n-1,"prl_ro prq_ro mest_ro mest_3e") &&
            qir(qf_n+1,-1,"prl_vi mest_vi mest_3e prq_vi") )
       { l[i]=omo1; Z[379]++; if(dbg){print "Z379"}; continue };

    };};};


    # _gl_4_palate_na_suw-pr:start с наречиями и пр. --> глаголы указывают на месторасположение
    cst="вблизи вдалеке вдали наконец";
    if ( bba(-4,-1,"_gl_4_palate_na_suw-pr") &&
           w(bbn-1,cst) && s(bbn-1,-1) &&
         qir(bbn+1,-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[380]++; if(dbg){print "Z380"}; continue };
    # _gl_4_palate_na_suw-pr:start

    #
    cst="назвать переименовать";
    if ( vgl(Y["n_pre_v_ist"],-8,-1) ) { wb_n=Y["n_pre_v_ist"];
       if ( vgl(wb_n,-6,-3) &&
             bb(wb_n-3,wb_n-1,cst) && s(bb_n,-1) &&
             wf(wb_n+1,-1,"честь") &&
            qir(wf_n+1,wfn-1,"mest_3e mest_vi") &&
            qir(wfn+1,-1,"mest_vi mest_3e prl_vi isname mest_ro suw_ro") )
       { l[i]=omo1; Z[382]++; if(dbg){print "Z382"}; continue };
    };

    #

    if ( qxs(1,"заместитель","командира")||
         qxs(1,"начтыла") )
    { l[i]=omo2; Z[383]++; if(dbg){print "Z383"}; continue };

    # esc-_sky_pe
    if ( vgl(Y["n-_sky_pe"],-7,-1) ) { bb_n=Y["n-_sky_pe"]; BB_n=Y["w-_sky_pe"];

       # escape:start
       cst="отбрасывать";
       if ( vgl(bb_n,-7,-1) && s(bb_n) &&
            weq(BB_n,cst) &&
          ( qaw(bb_n+1,"вокруг","себя")||
            qaw(bb_n+1,"ауру тень тени") ) && s(awn,-1) &&
            qir(awn+1,-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") )
       { l[i]=omo1; Z[384]++; if(dbg){print "Z384"}; continue };
       cst="заменить";
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
       ( isname(0) || q_w(1,"isname") ) &&
            weq(BB_n,cst) )
       { l[i]=omo1; Z[385]++; if(dbg){print "Z385"}; continue };
#      cst="поискать";
#      if ( vgl(bb_n,-7,-1) && bw(bb_n,cst) && s(bb_n,0) && q(1,"isname") &&
#           qir(bb_n+1,-1,"prl_vi mest_vi mest_3e") )
#      { l[i]=omo1; Z[386]++; if(dbg){print "Z386"}; continue };
       cst="достать";
       if ( vgl(bb_n,-7,-1) && weq(BB_n,cst) && s(bb_n,-1) && z(0) &&
              w(bb_n-1,"настолько так") && w(1,"что") &&
            qir(bb_n+1,-1,"prl_vi mest_vi mest_3e") )
       { l[i]=omo1; Z[387]++; if(dbg){print "Z387"}; continue };
       cst="собирать собрать";
       if ( vgl(bb_n,-7,-1) && weq(BB_n,cst) && s(bb_n,-1) &&
              w(bb_n+1,"с со") &&
            qir(bb_n+2,-1,"prl_tv mest_tv mest_3e isname") )
       { l[i]=omo1; Z[388]++; if(dbg){print "Z388"}; continue };
       if ( veq(bb_n,-1) && bw(bb_n,cst) && isname(0) && s(-1) )
       { l[i]=omo1; Z[389]++; if(dbg){print "Z389"}; continue };
       cst1="разбирать";
       if ( vgl(bb_n,-7,-3) && q(bb_n+1,"sz_iili") && bw(bb_n+2,cst) && s(bb_n,-1) && weq(BB_n,cst1) &&
            qir(bb_n+3,-1,"prl_vi mest_vi mest_3e prq_vi") )
       { l[i]=omo2; Z[390]++; if(dbg){print "Z390"}; continue };

       cst="открывать открываться открыть открыться";
       cst1="взгляду взору воображению глазам уму";
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
            weq(BB_n,cst) &&
              w(bb_n+1,cst1) &&
            qir(bb_n+2,-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") )
       { l[i]=omo1; Z[391]++; if(dbg){print "Z391"}; continue };
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
            weq(BB_n,cst) &&
             wb(bb_n-3,bb_n-1,cst1) &&
            qir(wbn+1,bb_n-1,"isname suw_ro") &&
            qir(bb_n+1,-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") )
       { l[i]=omo1; Z[392]++; if(dbg){print "Z392"}; continue };
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
            weq(BB_n,cst) &&
            qxs(bb_n-1,"во","всей","красе") &&
            qir(bb_n+1,-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") )
       { l[i]=omo1; Z[393]++; if(dbg){print "Z393"}; continue };
       cst="открывать открыть";
       cst1="ворота";
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
            weq(BB_n,cst) &&
              w(bb_n+1,cst1) &&
            qir(bb_n+2,-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") )
       { l[i]=omo1; Z[394]++; if(dbg){print "Z394"}; continue };

       cst="закрепить закреплять";
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
            weq(BB_n,cst) &&
              w(bb_n+1,"за") &&
            qia(bb_n+2,-1,"suw_tv prl_tv mest_tv","prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr isname") )
       { l[i]=omo1; Z[395]++; if(dbg){print "Z395"}; continue };
    };
    # esc+_sky_pe
    if ( vgl(Y["n+_sky_pe"],1,6) ) { bf_n=Y["n+_sky_pe"]; BF_n=Y["w+_sky_pe"];

       # escape:start
       cst="отбрасывать";
       cst1="аура тень";
       if ( vgl(bf_n,1,6) &&
            weq(BF_n,cst) &&
              w(bf_n+1,"на") &&
             wf(bf_n+2,bf_n+5,cst1) && s(0,wfn-1) &&
            qir(0,bf_n-1,"gl_aux_be mod_any prl_kred_sr prl_kred_mu nar_any isname") &&
            qir(bf_n+2,wfn-1,"suw_vi prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr isname") )
       { l[i]=omo1; Z[396]++; if(dbg){print "Z396"}; continue };
       cst="врезать вырезать";
       cst1="скала";
       if ( vgl(bf_n,1,6) &&
            weq(BF_n,cst) &&
             qf(bf_n+1,bf_n+3,"pre_pr") &&
             bf(qfn+1,qfn+3,cst1) && s(0,bfn-1) &&
            qia(1,bf_n-1,"isname","gl_aux_be") &&
            qir(qfn+1,bfn-1,"nar_any prl_pr prl_vi mest_pr mest_vi mest_3e") )
       { l[i]=omo1; Z[397]++; if(dbg){print "Z397"}; continue };
#      cst="валяться висеть лежать";
#      if ( bw(bf_n,cst) &&
#            w(bf_n+1,"за") &&
#           wf(bf_n+2,bf_n+5,"дверью") && s(0,wfn-1) )
#      { l[i]=omo2; Z[398]++; if(dbg){print "Z398"}; continue };


       cst="открывать открываться открыть открыться";
       cst1="взгляду взору воображению глазам уму";
       cst2="ежедневно";
       if ( vgl(bf_n,1,6) &&
            weq(BF_n,cst) &&
             wf(bf_n+1,wf_n+4,"во") &&
            qxs(wfn+1,"всей","красе") && s(0,xsn-1) )
       { l[i]=omo1; Z[399]++; if(dbg){print "Z399"}; continue };
       if ( vgl(bf_n,1,6) && s(0,bf_n-1) &&
            weq(BF_n,cst) &&
              w(bf_n+1,cst2) &&
            qir(1,bf_n-1,"suw_ro suw_edne isname") )
       { l[i]=omo1; Z[400]++; if(dbg){print "Z400"}; continue };

       cst="закрыть закрыться";
       cst1="мира";
       cst="заблокировать закрыть закрыться запереть";
       cst1="вторжений гостей мира поиска посторонних происходящего проникновения телепортации";
       if ( vgl(bf_n,1,6) &&
            weq(BF_n,cst) &&
              w(bf_n+1,"от") &&
             wf(bf_n+2,bf_n+5,cst1) && s(0,wfn-1) &&
            qir(bf_n+2,wfn-1,"prl_ro prq_ro mest_ro mest_3e") &&
           !qxs(wfn,"посторонних","глаз") )
       { l[i]=omo1; Z[401]++; if(dbg){print "Z401"}; continue };

       cst="закрыть отворить открывать открыть";
       cst1="ворота путь";
       cst3=cst1 " " "дверь";
       if ( vgl(bf_n,1,6) && veq(Y["n-_pre_dlya"],-2) && s(-2,bf_n) &&
             wa(-1,"_palate_suw-ro") &&
            weq(BF_n,cst) &&
              w(bf_n+1,cst3) )
       { l[i]=omo1; Z[402]++; if(dbg){print "Z402"}; continue };
       if ( vgl(bf_n,1,6) &&
            weq(BF_n,cst) &&
             wf(bf_n+1,bf_n+4,cst1) && s(0,wfn-1) &&
            qir(1,bf_n-1,"isname nar_any") &&
            qir(bf_n+1,wfn-1,"prl_vi mest_vi mest_da suw_da isname") )
       { l[i]=omo1; Z[403]++; if(dbg){print "Z403"}; continue };
       if ( vgl(bf_n,1,6) &&
            weq(BF_n,cst) &&
              w(bf_n+1,"перед") &&
              q(bf_n+2,"mest_tv suw_tv isname") &&
             wf(bf_n+3,bf_n+6,cst1) && s(0,wfn-1) &&
            qir(bf_n+3,wfn-1,"prl_vi mest_vi") )
       { l[i]=omo1; Z[404]++; if(dbg){print "Z404"}; continue };

       cst="греметь прогреметь";
       cst1="подготовкой церемонией";
       cst3="зурны песен";
       if ( vgl(bf_n,1,6) && bw(bf_n,cst) &&
             wf(bf_n+1,bf_n+4,cst1) && s(0,wfn-1) &&
            qir(bf_n+1,wfn-1,"prl_tv mest_tv qik_tv nar_any") )
       { l[i]=omo1; Z[405]++; if(dbg){print "Z405"}; continue };
       if ( vgl(bf_n,1,6) && s(0,bf_n) &&
            weq(BF_n,cst) &&
             wf(bf_n+1,bf_n+5,"от") &&
            wf2(wfn+1,wfn+5,cst3) && s(bf_n+1,wfN-1) )
       { l[i]=omo1; Z[406]++; if(dbg){print "Z406"}; continue };
       cst="треснуть";
       if ( weq(BF_n,cst) && s(0,bf_n-1) &&
            qxs(bf_n+1,"по","швам") )
       { l[i]=omo1; Z[407]++; if(dbg){print "Z407"}; continue };
       if ( weq(BF_n,cst) &&
              w(bf_n+1,"от") &&
             wf(bf_n+2,bf_n+6,"людей гостей") && s(0,wfn-1) )
       { l[i]=omo1; Z[408]++; if(dbg){print "Z408"}; continue };
       cst="висеть";
       if ( weq(BF_n,cst) &&
              w(bf_n+1,"в") &&
             wf(bf_n+2,bf_n+5,"пространстве небе воздухе") && s(0,wfn-1) )
       { l[i]=omo1; Z[409]++; if(dbg){print "Z409"}; continue };
       if ( weq(BF_n,cst) &&
             wf(bf_n+1,bf_n+3,"над") &&
             wb(wfn+1,wfn+3,"головой") && s(0,wbn-1) &&
            qir(bf_n+1,wfn-1,"nar_any isname") &&
            qir(wfn+1,wbn-1,"prl_tv mest_tv mest_3e") )
       { l[i]=omo1; Z[410]++; if(dbg){print "Z410"}; continue };

    };
    # esc-_palate_pe
    if ( vgl(Y["n-_palate_pe"],-5,-1) ) { bb_n=Y["n-_palate_pe"]; BB_n=Y["w-_palate_pe"];

       if ( vgl(bb_n,-5,-1) && s(bb_n,0) &&
              q(bb_n,"prq_any") &&
            qir(bb_n+1,-1,"prl_vi mest_vi mest_3e prl_kred_sr nar_any qast_any") &&
              q(1,"suw_any") )
       { l[i]=omo1; Z[411]++; if(dbg){print "Z411"}; continue };
       cst="встречать";
       if ( vgl(bb_n,-5,-1) && s(bb_n-1,-1) &&
            weq(BB_n,cst) &&
              q(bb_n-1,"mest_vi suw_vi isname") &&
            qxs(bb_n-2,"на","входе") )
       { l[i]=omo2; Z[412]++; if(dbg){print "Z412"}; continue };

    };

    # escape:end

    # _palate_pe с предлогами между глаголами и "небо":start
    #
    # поиск по pre_vi + _palate_pe: qb_n и bb_n
    if ( qb(-7,-2,"pre_vi") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_palate_pe") ) { bb_n=bbn;

       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) && !sc(-1,"\\(") &&
            qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
            qir(qb_n+1,-2,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
              q(-1,"suw_vi") )
       { l[i]=omo1; Z[413]++; if(dbg){print "Z413"}; continue };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
              q(qb_n+1,"suw_vi") &&
            qir(qb_n+2,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any suw_ro") )
       { l[i]=omo1; Z[414]++; if(dbg){print "Z414"}; continue };

    };};

    # поиск по pre_da + _palate_pe: qb_n и bb_n
    if ( qb(-7,-2,"pre_da") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_palate_pe") ) { bb_n=bbn;

#       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
#              w(1,"на") &&
#            wfa(2,5,"_sky_na_suw-pr") && s(0,wfn-1) &&
#            qir(2,wfn-1,"prl_pr mest_pr mest_3e prq_pr") )
#       { l[i]=omo2; Z[415]++; if(dbg){print "Z415"}; continue };
#       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
#              w(1,"на") &&
#            wfa(2,5,"_sky_na_suw-vi") && s(0,wfn-1) &&
#            qir(2,wfn-1,"prl_vi mest_vi mest_3e prq_vi") )
#       { l[i]=omo2; Z[416]++; if(dbg){print "Z416"}; continue };

        if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
             qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
             qir(qb_n+1,-2,"prl_da mest_da prq_da mest_3e prl_kred_sr nar_any qast_any") &&
               q(-1,"suw_da") )
        { l[i]=omo1; Z[417]++; if(dbg){print "Z417"}; continue };
        if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
             qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
               q(qb_n+1,"suw_da") &&
             qir(qb_n+2,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
        { l[i]=omo1; Z[418]++; if(dbg){print "Z418"}; continue };

    };};

    # поиск по pre_ro + _palate_pe: qb_n и bb_n
    if ( qb(-7,-2,"pre_ro") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_palate_pe") ) { bb_n=bbn;

       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) && Xw(bb_n,"X_suw_palate_pe") &&
            qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
            qiz(qb_n+1,-1,"prl_ro mest_ro prq_ro mest_3e prl_kred_sr nar_any qast_any suw_ro isname","prl_vi mest_vi prq_vi") )
       { l[i]=omo1; Z[419]++; if(dbg){print "Z419"}; continue };

    };};

    # поиск по pre_tv + _palate_pe: qb_n и bb_n
    if ( qb(-7,-2,"pre_tv") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_palate_pe") ) { bb_n=bbn;

        if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
             qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
             qir(qb_n+1,-2,"prl_tv mest_tv prq_tv mest_3e prl_kred_sr nar_any qast_any") &&
               q(-1,"suw_tv") )
        { l[i]=omo1; Z[420]++; if(dbg){print "Z420"}; continue };
        if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
             qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
               q(qb_n-1,"suw_tv") &&
             qir(qb_n+2,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
        { l[i]=omo1; Z[421]++; if(dbg){print "Z421"}; continue };

        if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
             qir(bb_n+1,qb_n-1,"suw_vi suw_edne isname prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
               q(qb_n+1,"suw_tv") &&
             qir(qb_n+2,-1,"suw_ro suw_edne isname prl_ro mest_ro prq_ro prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
        { l[i]=omo1; Z[422]++; if(dbg){print "Z422"}; continue };

    };};

    # поиск по pre_pr + _palate_pe: qb_n и bb_n
    if ( qb(-7,-2,"pre_pr") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_palate_pe") ) { bb_n=bbn;

      cst2="торце";
      cst="расположить";
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
             bw(bb_n,cst) &&
            qir(bb_n+1,qb_n-1,"suw_da prl_da mest_da prq_da nar_mest prl_kred_sr") &&
              w(qb_n+1,cst2) &&
            qir(qb_n+2,-1,"suw_ro prl_vi prq_vi mest_vi mest_3e") )
       { l[i]=omo2; Z[423]++; if(dbg){print "Z423"}; continue };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_da prl_da mest_da prq_da nar_mest prl_kred_sr") &&
            qir(qb_n+1,-2,"prl_pr prq_pr mest_pr mest_3e") &&
              q(-1,"suw_pr") )
       { l[i]=omo1; Z[424]++; if(dbg){print "Z424"}; continue };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_da prl_da mest_da prq_da nar_mest prl_kred_sr") &&
              q(qb_n+1,"suw_pr isname") &&
            qir(qb_n+2,-1,"suw_ro prl_vi prq_vi mest_vi mest_3e") )
       { l[i]=omo1; Z[425]++; if(dbg){print "Z425"}; continue };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_da prl_da mest_da prq_da nar_mest prl_kred_sr") &&
              q(qb_n+1,"mest_pr prl_pr prq_pr mest_3e") &&
              q(qb_n+2,"suw_pr isname") &&
            qir(qb_n+3,-1,"suw_ro prl_vi prq_vi mest_vi mest_3e") )
       { l[i]=omo1; Z[426]++; if(dbg){print "Z426"}; continue };

    };};
    # _palate_pe с предлогами между глаголами и "небо":end

    # _sky_pe с предлогами между глаголами и "небо":start
    #
    if ( qb(-7,-2,"pre_vi")  ) { qb_n=qbn;
      if ( bba(qb_n-7,qb_n-1,"_sky_pe") ) { bb_n=bbn;
#      cst0="зиму";
#      if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
#           vex(Y["tn_ok_vi"]) )
#      { bb_n=qb_n=""; Z[427]++; if(dbg){print "Z427"}; };
#      if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
#             w(qb_n,"в во") && qir(qb_n+1,-1,"isname") && ba(bb_n,"_gl_v_palate-iv") )
#      { bb_n=qb_n=""; Z[428]++; if(dbg){print "Z428"}; };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-1) && isname(0) )
       { bb_n=qb_n=""; Z[429]++; if(dbg){print "Z429"}; };


       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
              q(qb_n+1,"suw_vi mest_vi") && W(qb_n+1,cst0) &&
            qir(qb_n+2,-1,"prl_vi prq_vi mest_vi mest_3e nar_any") )
       { l[i]=omo2; Z[430]++; if(dbg){print "Z430"}; continue };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
            qir(qb_n+1,-2,"prl_vi prq_vi mest_vi mest_3e nar_any") &&
              q(-1,"suw_vi mest_vi") && W(-1,cst0) )
       { l[i]=omo2; Z[431]++; if(dbg){print "Z431"}; continue };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
              q(qb_n+1,"suw_vi") && W(qb_n+1,cst0) &&
            qir(qb_n+2,-1,"suw_ro prl_ro mest_ro prq_ro") )
       { l[i]=omo2; Z[432]++; if(dbg){print "Z432"}; continue };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_im prl_im prq_im mest_im mest_3e nar_any") &&
              q(qb_n+1,"suw_vi") && W(qb_n+1,cst0) &&
            qir(qb_n+2,-2,"suw_ro prl_ro mest_ro prq_ro") &&
              q(-1,"prl_vi prq_vi mest_vi mest_3e nar_any") )
       { l[i]=omo2; Z[433]++; if(dbg){print "Z433"}; continue };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_da prl_da prq_da mest_da mest_3e nar_any") &&
              q(qb_n+1,"suw_vi") && W(qb_n+1,cst0) &&
            qir(qb_n+2,-1,"suw_ro prl_ro mest_ro prq_ro") )
       { l[i]=omo2; Z[434]++; if(dbg){print "Z434"}; continue };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
            qir(qb_n+1,-3,"prl_vi prq_vi mest_vi mest_3e") &&
              q(-2,"suw_vi mest_vi") && W(-2,cst0) &&
              q(-1,"prl_vi prq_vi mest_vi mest_3e") )
       { l[i]=omo2; Z[435]++; if(dbg){print "Z435"}; continue };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
              q(qb_n+1,"prl_vi prq_vi mest_vi mest_3e") &&
              q(qb_n+2,"suw_vi mest_vi") && W(qb_n+2,cst0) &&
            qir(qb_n+3,-1,"prl_vi prq_vi mest_vi mest_3e") )
       { l[i]=omo2; Z[436]++; if(dbg){print "Z436"}; continue };

#      if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
#             w(bb_n+1,"у") &&
#           qir(bb_n+2,qb_n-2,"prl_ro mest_ro mest_3e prq_ro") &&
#             q(qb_n-1,"suw_ro mest_ro") &&
#           qir(qb_n+1,-1,"prl_vi mest_vi prq_vi suw_vi") )
#      { l[i]=omo2; Z[437]++; if(dbg){print "Z437"}; continue };
       if ( vgl(qb_n,-7,-2) && vgl(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
              w(bb_n+1,"к") &&
            qir(bb_n+2,qb_n-2,"prl_da mest_da mest_3e prq_da") &&
              q(qb_n-1,"suw_da mest_da") &&
            qir(qb_n+1,-1,"prl_vi mest_vi prq_vi suw_vi") )
       { l[i]=omo2; Z[438]++; if(dbg){print "Z438"}; continue };

    };};

    #
    if ( qb(-7,-2,"pre_ro") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_sky_pe") ) { bb_n=bbn;

       if ( vgl(qb_n,-5,-1) && vgl(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
            qir(qb_n+1,-2,"prl_ro mest_ro mest_3e") &&
              q(-1,"suw_ro mest_ro") )
       { l[i]=omo2; Z[439]++; if(dbg){print "Z439"}; continue };
       if ( vgl(qb_n,-5,-1) && vgl(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
              q(qb_n+1,"suw_ro mest_ro") &&
            qir(qb_n+2,-1,"prl_vi mest_vi mest_3e prq_vi suw_ro") )
       { l[i]=omo2; Z[440]++; if(dbg){print "Z440"}; continue };

    };};

    #
    if ( qb(-7,-2,"pre_tv") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_sky_pe") ) { bb_n=bbn;

       if ( vgl(qb_n,-5,-1) && vgl(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
            qir(qb_n+1,-2,"prl_tv mest_tv mest_3e") &&
              q(-1,"suw_tv mest_tv") )
       { l[i]=omo2; Z[441]++; if(dbg){print "Z441"}; continue };
       if ( vgl(qb_n,-5,-1) && vgl(bb_n,qb_n-7,qb_n-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any") &&
              q(qb_n+1,"suw_tv mest_tv") &&
            qir(qb_n+2,-1,"prl_vi mest_vi mest_3e prq_vi") )
       { l[i]=omo2; Z[442]++; if(dbg){print "Z442"}; continue };

    };};

    #
    if ( qb(-7,-2,"pre_pr") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_sky_pe") ) { bb_n=bbn;

       if ( vgl(qb_n,-5,-1) && vgl(bb_n,qb_n-5,qb_n-1) && Q_w(1,"isname") &&
            qir(bb_n+1,qb_n-1,"nar_any qast_any") &&
            qir(qb_n+1,-1,"suw_pr suw_ro suw_edne mest_vip3e prl_pr mest_pr mest_3e prq_pr isname") && s(bb_n,-1) )
       { l[i]=omo2; Z[443]++; if(dbg){print "Z443"}; continue };
       if ( vgl(qb_n,-5,-1) && vgl(bb_n,qb_n-5,qb_n-1) && Q_w(1,"isname") &&
            qir(bb_n+1,qb_n-1,"nar_any qast_any") &&
            qir(qb_n+1,-2,"suw_pr mest_vip3e prl_pr mest_pr mest_3e prq_pr isname") &&
              q(-1,"prl_vi mest_vi mest_3e prq_vi") && s(bb_n,-1) )
       { l[i]=omo2; Z[444]++; if(dbg){print "Z444"}; continue };

    };};
    # _sky_pe с предлогами между глаголами и "небо":end

    # _palate_pe самостоятельно
    if ( vgl(Y["n-_palate_pe"],-7,-1) ) { bb_n=Y["n-_palate_pe"];

#      if ( vgl(bb_n,-7,-1) && xw(bb_n,"X_suw_palate_pe") )
#      { bb_n=""; Z[445]++; if(dbg){print "Z445"};};

         if ( veq(bb_n,-1) && s(-1) && q(-1,"prq_any gl_in") )
         { l[i]=omo1; Z[446]++; if(dbg){print "Z446"}; continue };

       if ( vgl(bb_n,-7,-1) && bfa(bb_n+1,-1,"_sky_pe") && s(bfn,-1) )
       { bb_n=""; Z[447]++; if(dbg){print "Z447"};};
       if ( vgl(bb_n,-7,-1) && q(bb_n,"prq_edmuim") && ba(bb_n-1,"_sky_pe") && s(bfn-1,-1) )
       { bb_n=""; Z[448]++; if(dbg){print "Z448"};};

         if ( veq(bb_n,-2) && s(bb_n,-1) && wc(-1,"ский$") )
         { l[i]=omo1; Z[449]++; if(dbg){print "Z449"}; continue };

         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
               (p(bb_n-1)||p(0)||q_w(1,"sz_i")||(q_w(1,"nar_any")&& s(0)) ) &&
              qia(bb_n+1,-1,"sz_i","prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[450]++; if(dbg){print "Z450"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              qir(bb_n+1,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[451]++; if(dbg){print "Z451"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              qir(bb_n+1,-1,"suw_da prl_da mest_da prq_da mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[452]++; if(dbg){print "Z452"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              qir(bb_n+1,-1,"suw_ro prl_ro mest_ro prq_ro mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[453]++; if(dbg){print "Z453"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              qir(bb_n+1,-2,"suw_da prl_da mest_da prq_da mest_3e prl_kred_sr nar_any qast_any") &&
                q(-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[454]++; if(dbg){print "Z454"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
                q(bb_n+1,"suw_da mest_da") &&
              qir(bb_n+2,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[455]++; if(dbg){print "Z455"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
                q(bb_n+1,"suw_da mest_da") &&
                q(bb_n+2,"suw_im mest_im") &&
              qir(bb_n+3,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[456]++; if(dbg){print "Z456"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              qir(bb_n+1,-1,"suw_im prl_im mest_im prq_im isname mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[457]++; if(dbg){print "Z457"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              qir(bb_n+1,-1,"suw_tv prl_tv mest_tv prq_tv mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[458]++; if(dbg){print "Z458"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              qir(bb_n+1,-2,"suw_tv prl_tv mest_tv prq_tv mest_3e prl_kred_sr nar_any qast_any") &&
                q(-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[459]++; if(dbg){print "Z459"}; continue };
         if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
                q(bb_n+1,"prq_vi") &&
              qiz(bb_n+2,-1,"prl_tv mest_tv prq_tv mest_3e prl_kred_sr nar_any qast_any","suw_tv") )
         { l[i]=omo1; Z[460]++; if(dbg){print "Z460"}; continue };

         if ( vex(Y["n_pre_v_ist"]) ) { wf_n=Y["n_pre_v_ist"];
            if ( vgl(bb_n,-7,-3) && vgl(wf_n,bb_n+1,-1) && s(bb_n,-1) &&
                  qb(wf_n+1,-1,"suw_pr") &&
                 qir(bb_n+1,wf_n-1,"nar_any prl_kred_sr") &&
                 qir(wf_n+1,qbn-1,"prl_pr mest_pr mest_3e prq_pr") &&
                 qir(qbn+1,-1,"prl_vi mest_vi mest_3e prq_vi") )
            { l[i]=omo1; Z[461]++; if(dbg){print "Z461"}; continue };
         };

       if ( (qxw(-1,"тот","или","иной этот") ||
             qxw(-1,"же ли","и","тот этот мой свой наш ваш ее его их сам")||
             qxw(-1,"и","тот этот мой свой наш ваш ее его их сам")||
             qxw(-1,"один","и","тот","же")||
             qxw(-1,"еще","хоть","один")||
             qxw(-1,"хотя","бы")||
             qxw(-1,"хоть","один") ) &&
             veq(bb_n,xwn-1) && s(xwn-1) && s(-1) )
       { l[i]=omo1; Z[462]++; if(dbg){print "Z462"}; continue };

      };

      if ( qb(-5,-1,"sz_iili") ) { qb_n=qbn;
        if ( bba(qb_n-5,qb_n-1,"_palate_pe") ) { bb_n=bbn;

         if ( vgl(Y["n+_sky_pe"],1,5) && s(0,Y["n+_sky_pe"]-1) )
         { bb_n=qb_n=""; Z[463]++; if(dbg){print "Z463"}; };

         if ( vgl(qb_n,-5,-1) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,-1) &&
              qir(bb_n+1,qb_n-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
              qir(qb_n+1,-1,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") )
         { l[i]=omo1; Z[464]++; if(dbg){print "Z464"}; continue };

      };};

      if ( vv(0,4) && !(se(0,", — ") && !se(vvn,", — ") ) &&
        !(vgl(Y["n+_palate_pe"],1,vvn-1) ) &&
        !(vgl(Y["n-_palate_environs"],-4,-1) && sq(bbn,-1,"[, ]") ) &&
        !(vgl(Y["n-_palate_pe"],-4,-1) && s(Y["n-_palate_pe"],-1)) &&
           ba(vvn+1,"_sky_pe") )
      { l[i]=omo2; Z[465]++; if(dbg){print "Z465"}; continue };


    if ( qy(-1,"prl_vi mest_vi mest_3e") &&
          q(-1-qyn,"narph_any") &&
        bba(xwn-3,xwn-1,"_palate_pe") && s(bbn,-1) && Xw(bfn,"X_suw_palate_pe") )
    { l[i]=omo1; Z[466]++; if(dbg){print "Z466"}; continue };
    # _palate_pe <<---:end

    # _sky_pe <<<---:start
    if ( vgl(Y["n-_sky_pe"],-7,-1) ) { bb_n=Y["n-_sky_pe"]; BB_n=Y["w-_sky_pe"];
      if ( q(bb_n,"prq_edmuvi") && veq(Y["iwrd_case"],"iv") && ba(bb_n-1,"_sky_pe") )
      { bb_n=bb_n-1; Z[467]++; if(dbg){print "Z467", "-- bb_n-1"}; };
      # _sky_pe escape <<<---:start
      # _sky_pe escape <<<---:end

      if ( veq(bb_n,-1) && q(bb_n,"predik vvod") && s(-1) && zs(-2) )
      { bb_n=""; Z[468]++; if(dbg){print "Z468"};};
      if ( vgl(bb_n,-4,-1) && q(bb_n,"prq_im mod_any") && vgl(Y["n+_palate_pe"],1,2) && s(bb_n,Y["n+_palate_pe"]-1) &&
           qir(bb_n+1,-1,"prl_im mcop_im prq_im nar_any qast_any") )
      { bb_n=""; Z[469]++; if(dbg){print "Z469"};};
      if ( vgl(bb_n,-7,-1) && xw(bb_n,"X_prl_palate_pe") && s(bb_n,-1) &&
             q(bb_n+1,"prl_edzevi suw_edzevi") )
      { bb_n=""; Z[470]++; if(dbg){print "Z470"};};

       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
            qir(bb_n+1,-1,"suw_vi prl_vi prq_vi mest_vi mest_3e qast_any nar_any prl_kred_sr") )
       { l[i]=omo2; Z[471]++; if(dbg){print "Z471"}; continue };
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              q(bb_n+1,"suw_tv mest_tv") &&
            qir(bb_n+2,-1,"prl_vi prl_tv prq_vi mest_vi mest_3e qast") )
       { l[i]=omo2; Z[472]++; if(dbg){print "Z472"}; continue };
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              q(bb_n+1,"prl_tv prq_tv mest_tv") &&
              q(bb_n+2,"suw_tv mest_tv") &&
            qir(bb_n+3,-1,"prl_vi prq_vi mest_vi mest_3e qast") )
       { l[i]=omo2; Z[473]++; if(dbg){print "Z473"}; continue };
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              q(bb_n+1,"suw_da mest_da") &&
            qir(bb_n+2,-1,"prl_vi prq_vi mest_vi mest_3e qik_vi nar_any qast_any") )
       { l[i]=omo2; Z[474]++; if(dbg){print "Z474"}; continue };
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
            qir(bb_n+1,-2,"prl_tv prq_tv mest_tv") &&
              q(-1,"suw_tv mest_tv") )
       { l[i]=omo2; Z[475]++; if(dbg){print "Z475"}; continue };
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              q(bb_n+1,"suw_im mest_im isname") &&
            qir(bb_n+2,-1,"prl_vi prq_vi mest_vi mest_3e qast_any") )
       { l[i]=omo2; Z[476]++; if(dbg){print "Z476"}; continue };
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
            qir(bb_n+1,-1,"suw_odim prl_im prq_im mest_im mest_3e qast_any isname") )
       { l[i]=omo2; Z[477]++; if(dbg){print "Z477"}; continue };
       if ( vgl(bb_n,-7,-1) &&
            qir(bb_n+1,-2,"suw_vi suw_edne prl_ro prq_ro mest_ro mest_3e qik_vi nar_any") &&
              q(-1,"suw_ro") && s(bb_n,-1) )
       { l[i]=omo2; Z[478]++; if(dbg){print "Z478"}; continue };
       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              q(bb_n+1,"prq_vi") &&
            qir(bb_n+2,-2,"prl_tv prq_tv mest_tv") &&
              q(-1,"suw_tv mest_tv") )
       { l[i]=omo2; Z[479]++; if(dbg){print "Z479"}; continue };

       if ( vgl(bb_n,-7,-1) && s(bb_n,-1) &&
              w(bb_n+1,"его") &&
            qir(bb_n+2,-1,"prl_tv prq_tv mest_tv suw_tv prl_vi") )
       { l[i]=omo2; Z[480]++; if(dbg){print "Z480"}; continue };

       cst1="ваш верхний второй его ее их мой наш сам свой такой тот этот";
       if ( vgl(bb_n,-7,-1) && s(bb_n) &&
           (qaw(bb_n+1,"тот","или","иной этот") ||
            qaw(bb_n+1,"и также",cst1)||
            qaw(bb_n+1,"еще же ли уже","и",cst1)||
            qaw(bb_n+1,"один","и","тот","же")||
            qaw(bb_n+1,"еще","хоть","один")||
            qaw(bb_n+1,"вполне","себе")||
            qaw(bb_n+1,"хотя","бы")||
            qaw(bb_n+1,"хоть еще","один такой какой-то какой-нибудь") ) &&
            vlt(awn,0) && s(awn,-1) &&
            qir(awn+1,-1,"prl_edmuim prq_edmuim mest_edmuvi") )
       { l[i]=omo2; Z[481]++; if(dbg){print "Z481"}; continue };
       if ( (qxw(-1,"его ее их еще","и") ||
             qxw(-1,"и",cst1) ) &&
             veq(bb_n,xwn-1) && s(xwn-1) && s(-1) && p(0) )
       { l[i]=omo2; Z[482]++; if(dbg){print "Z482"}; continue };

       if ( vgl(bb_n,-7,-3) && q(-1,"narph_any") && s(bb_n,-1) &&
            qir(bb_n+1,xwn-1,"nar_any") )
       { l[i]=omo2; Z[483]++; if(dbg){print "Z483"}; continue };
    };

    if ( qb(-5,-1,"sz_iili") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_sky_pe") ) { bb_n=bbn;

          if ( vgl(qb_n,-5,-1) && vgl(bb_n,qbn-5,qbn-1) && s(bb_n,-1) &&
                bw(bb_n,"поцеловать") )
          { qb_n=bb_n=""; Z[484]++; if(dbg){print "Z484"}; };

          if ( vgl(qb_n,-5,-1) && vgl(bb_n,qbn-5,qbn-1) && s(bb_n,-1) &&
               vgl(Y["n+_palate_pe"],1,3) && sq(0,Y["n+_palate_pe"]-1,"[, ]") &&
               qir(1,Y["n+_palate_pe"]-1,"mod_any gl_aux_be nar_any mest_vi mest_3e") )
          { qb_n=bb_n=""; Z[485]++; if(dbg){print "Z485"}; };

       if ( vgl(qb_n,-5,-1) && vgl(bb_n,qbn-5,qbn-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-2,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") &&
              q(qb_n-1,"suw_vi") &&
            qir(qb_n+1,-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") )
       { l[i]=omo2; Z[486]++; if(dbg){print "Z486"}; continue };
       if ( vgl(qb_n,-5,-1) && vgl(bb_n,qbn-5,qbn-1) && s(bb_n,-1) &&
            qir(bb_n+1,qb_n-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") &&
            qir(qb_n+1,-1,"prl_vi prq_vi mest_vi mest_3e qast nar_any prl_kred_sr") )
       { l[i]=omo2; Z[487]++; if(dbg){print "Z487"}; continue };

    };};

    # _sky_pe <<<---:end

    # _palate_pe --->>>:start
    if ( vgl(Y["n+_palate_pe"],1,6) ) { bf_n=Y["n+_palate_pe"]; bb_n=Y["n-_sky_pe"]; wf_n=Y["n-_gl_v_sky-iv"];

       if ( vgl(bf_n,1,6) && xw(bf_n,"X_suw_palate_pe") && !eos(0,bf_n-1) &&
       !( gl_in(bf_n) && mod_any(bf_n-1) ) )
       { bf_n=""; Z[488]++; if(dbg){print "Z488"};};
#      if ( vgl(bf_n,1,6) && xw(bf_n,"X_prl_palate_pe") && !eos(0,bf_n-1) )
#      { bf_n=""; Z[489]++; if(dbg){print "Z489"};};

       if ( vgl(bf_n,1,6) && zs(0) && s(1,bf_n-1) &&
              q(bf_n,"mod_any") && q(bf_n+1,"deep gl_in gl_ed gl_mn") && !ba(bf_n+1,"_palate_pe") )
       { bf_n=""; Z[490]++; if(dbg){print "Z490"}; };
       if ( vgl(bf_n,1,6) && zs(0) && s(1,bf_n-1) &&
              q(bf_n,"mod_any") && q(bf_n+1,"gl_in") && ba(bf_n+1,"_palate_pe") )
       { bf_n=bf_n+1; Z[491]++; if(dbg){print "Z491"}; };
       if ( vgl(bf_n,1,6) && vv(0,4) &&
              q(bf_n,"deep") && ba(vvn+1,"_sky_pe") )
       { l[i]=omo2; Z[492]++; if(dbg){print "Z492"}; continue };
       if ( vgl(bf_n,1,6) && ba(bf_n,"_palate_pe_notrh") && !eos(0,bf_n-1) )
       { bf_n=""; Z[493]++; if(dbg){print "Z493"};};

       if ( vgl(bf_n,1,6) && s(0,bf_n-1) && Qf(1,bf_n-1,"sz_iili pre_any") &&
             qb(-3,-1,"mod_any") && s(qbn,-1) &&
            qir(qbn+1,-1,"prl_vi mest_vi mest_3e") )
       { l[i]=omo1; Z[494]++; if(dbg){print "Z494"}; continue };
       if ( vgl(bf_n,1,6) && s(0,bf_n-1) &&
            qir(1,bf_n-1,"mod_any gl_aux_be nar_any") )
       { l[i]=omo1; Z[495]++; if(dbg){print "Z495"}; continue };

       if ( vgl(bf_n,1,6) && s(0,bf_n-1) &&
         pre_tv(1) &&
              q(bf_n-1,"suw_tv") &&
            qir(2,bf_n-2,"prl_tv mest_tv mest_3e prq_tv") )
       { l[i]=omo1; Z[496]++; if(dbg){print "Z496"}; continue };

       if ( vgl(bf_n,1,6) && s(0,bf_n-1) &&
         pre_ro(1) &&
              q(bf_n-1,"suw_im") &&
            qir(2,bf_n-2,"suw_ro prl_ro mest_ro mest_3e prq_ro") )
       { l[i]=omo1; Z[497]++; if(dbg){print "Z497"}; continue };

       if ( vgl(bf_n,1,6) && s(0,bf_n-1) && Qf(1,bf_n-1,"sz_iili pre_any") &&
           !vgl(Y["n+_sky_pe"],1,bf_n-1)  )
       { l[i]=omo1; Z[498]++; if(dbg){print "Z498"}; continue };

          if ( vgl(bf_n,1,6) && z(0) && s(1,bf_n-1) &&
             ((vgl(bb_n,-4,-1) && s(bb_n,-1) ) || ( vgl(wf_n,-4,-1) && s(wf_n,-1) )) )
          { bf_n=""; Z[499]++; if(dbg){print "Z499"}; };
#         if ( vgl(bf_n,1,6) && z(0) && s(1,bf_n-1) && ba(bf_n,"_palate_pe_notrh") )
#         { bf_n=""; Z[500]++; if(dbg){print "Z500"}; };
          if ( vgl(bf_n,1,6) && z(0) && s(1,bf_n-1) &&
                qf(bf_n+1,bf_n+4,"suw_vi") && s(bf_n,qfn-1) &&
               qia(bf_n+1,qfn-1,"qast_any","prl_vi mest_vi mest_3e") )
          { bf_n=""; Z[501]++; if(dbg){print "Z501"}; };

       if ( vgl(bf_n,1,6) && qsf(0,3,",") && s(sfn+1,bf_n-1) &&
            qir(1,sfn,"suw_ro suw_edne isname qast_any") &&
            qir(sfn+1,bf_n-1,"otsz_mu nar_any mest_any qast mod_any isname") )
       { l[i]=omo1; Z[502]++; if(dbg){print "Z502"}; continue };

       if ( vgl(bf_n,3,6) && q(1,"narph_any") && Xw(bf_n,"X_suw_palate_pe") && s(0,bf_n-1) )
       { l[i]=omo1; Z[503]++; if(dbg){print "Z503"}; continue };
    };
    # _palate_pe --->>>:end


    # _sky_pe --->>>:start
    if ( vgl(Y["n+_sky_pe"],1,6) ) { bf_n=Y["n+_sky_pe"]; BF_n=Y["w+_sky_pe"];

       if ( vgl(bf_n,1,6) && xw(bf_n,"X_sky_pe") )
       { bf_n=""; Z[504]++; if(dbg){print "Z504"};};

       if ( vgl(bf_n,2,6) && s(0,bf_n-1) &&
              w(1,"за") &&
            qir(2,bf_n-1,"suw_tv mest_tv prl_tv isname qast_any") && !(isname(0) && zs(-1) ) )
       { l[i]=omo2; Z[505]++; if(dbg){print "Z505"}; continue };
       if ( vgl(bf_n,3,5) && s(0,bf_n-1) &&
              w(1,"на") &&
              q(2,"suw_vi mest_vi") &&
              s(0,bf_n-1) && Qf(3,bf_n-1,"sz_iili pre_any") )
       { l[i]=omo2; Z[506]++; if(dbg){print "Z506"}; continue };
       if ( veq(bf_n,6) && s(0,bf_n-1) &&
         pre_pr(1) &&
              q(2,"suw_pr") &&
              q(3,"suw_ro") &&
         pre_tv(4) &&
              q(5,"suw_tv") )
       { l[i]=omo2; Z[507]++; if(dbg){print "Z507"}; continue };

         if ( vgl(bf_n,1,6) && s(0,bf_n-1) && veq(Y["iwrd_form"],"ediv") &&
          prq_any(bf_n) && !q(bf_n,"prq_edmuim prq_edmutv prq_kred_mu") &&
             !exb(-1,"тот ни другой ") )
         { bf_n=""; Z[508]++; if(dbg){print "Z508"}; };
         if ( vgl(bf_n,1,6) && s(0,bf_n-1) &&
               ba(-1,"_palate_prl_geo") && s(-1) )
         { bf_n=""; Z[509]++; if(dbg){print "Z509"}; };

       if ( vgl(bf_n,1,6) && s(0,bf_n-1) &&
             Qf(1,bf_n-1,"sz_iili pre_any") && !(isname(0) && zs(-1) ) )
       { l[i]=omo2; Z[510]++; if(dbg){print "Z510"}; continue };
       if ( vgl(bf_n,1,6) && s(0,bf_n-1) &&
            qir(1,bf_n-1,"mod_any gl_aux_be nar_any") && !(isname(0) && zs(-1) ) )
       { l[i]=omo2; Z[511]++; if(dbg){print "Z511"}; continue };
       if ( vgl(bf_n,1,6) && s(0,bf_n-1) &&
              q(1,"suw_odim mest_im") &&
           sz_i(bf_n-1) &&
            qir(2,bf_n-2,"nar_any qast_any") )
       { l[i]=omo2; Z[512]++; if(dbg){print "Z512"}; continue };
       if ( veq(bf_n,2) && s(0,bf_n) &&
              q(1,"sz_i") &&
              w(3,"его") )
       { l[i]=omo2; Z[513]++; if(dbg){print "Z513"}; continue };
       if ( vgl(bf_n,1,6) &&
            qxs(1,"можно","будет","даже и") &&
              q(bf_n-1,"suw_tv") &&
            qir(xsn+1,bf_n-2,"prl_tv mest_tv") )
       { l[i]=omo2; Z[514]++; if(dbg){print "Z514"}; continue };
       if ( veq(bf_n,1) && z(0) && q(1,"prq_edmuim prq_mnim") &&
             qf(2,4,"suw_vi") && s(1,qfn-1) && qir(1,qfn-1,"prl_vi mest_vi") )
       { l[i]=omo2; Z[515]++; if(dbg){print "Z515"}; stopp=ret=1; continue };
       cst="спине";
       if ( vgl(bf_n,3,6) && s(0,bf_n-1) &&
              w(1,"на") &&
             wf(2,5,cst) &&
            qir(2,wfn-1,"prl_pr mest_pr mest_3e sz_iili suw_pr")  )
       { l[i]=omo2; Z[516]++; if(dbg){print "Z516"}; continue };

       if ( vgl(bf_n,2,6) && s(1,bf_n-1) && z(0) &&
              q(1,"otsz_mu") &&
             Qf(2,bf_n-1,"sz_iili pre_any") )
       { l[i]=omo2; Z[517]++; if(dbg){print "Z517"}; continue };

       if ( vgl(bf_n,3,6) && q(1,"narph_any") && s(0,bf_n-1) &&
           !( s(-1) && isname(0) ) )
       { l[i]=omo2; Z[518]++; if(dbg){print "Z518"}; continue };
    };

    # _sky_pe --->>>:end

    # _palate_prl_geo:start
#   cst1="быть ведь же стать считаться являться";
    if ( prl_im(-1) && ba(-1,"_palate_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[519]++; if(dbg){print "Z519"}; continue };
    if ( prl_im(-2) && ba(-2,"_palate_prl_geo") &&
              Q(-1,"suw_any") && s(-2,-1)  )
    { l[i]=omo1; Z[520]++; if(dbg){print "Z520"}; continue };
    if ( prl_im(1) && ba(1,"_palate_prl_geo") && s(0) && !prl_ro(1))
    { l[i]=omo1; Z[521]++; if(dbg){print "Z521"}; continue };
    # _palate_prl_geo:start

 # доработка прилагательных им_п_

 if ( wb(-5,-1,"самый") )  { wb_n=wbn;

    if ( veq(wb_n,-1) && Ww_(-2,"тот этот") && s(-2,-1) )
    { l[i]=omo1; Z[522]++; if(dbg){print "Z522"}; continue };

    if ( veq(wb_n,-2) && w(-1,"же") )
    { l[i]=omo1; Z[523]++; if(dbg){print "Z523"}; continue };

    if ( veq(wb_n,-1) && qxs(-2,"тот этот","же") && s(-1) )
    { wb_n=""; Z[524]++; if(dbg){print "Z524"}; };

    if ( veq(wb_n,-2) && wa(-1,"_samyj_prl_palate") && s(wb_n,-1) )
    { l[i]=omo1; Z[525]++; if(dbg){print "Z525"}; continue };
    cst="большой дорогой";
    cst1="королевстве мире стране";
    if ( veq(wb_n,-2) && w(-1,cst) && s(wb_n,-1) &&
           w(1,"в во") &&
          wf(2,5,cst1) &&
         qir(2,wfn-1,"prl_pr mest_pr mest_3e prq_vi") )
    { l[i]=omo1; Z[526]++; if(dbg){print "Z526"}; continue };

    if ( veq(wb_n,-2) && wa(-1,"_samyj_prl_sky") && s(wb_n,-1) )
    { l[i]=omo2; Z[527]++; if(dbg){print "Z527"}; continue };

    if ( veq(wb_n,-4) && q(-3,"prl_edmuvi") && q(-2,"sz_i") && wa(-1,"_samyj_prl_sky") && s(wb_n,-1) )
    { l[i]=omo2; Z[528]++; if(dbg){print "Z528"}; continue };

 };
 if ( wf(1,4,"самый самым") )  { wf_n=wfn;

    if ( vgl(wf_n,1,4) && wa(wf_n+1,"_samyj_prl_palate") && s(0,wf_n) &&
         qir(1,wf_n-1,"nar_any gl_aux_be qast_any") )
    { l[i]=omo1; Z[529]++; if(dbg){print "Z529"}; continue };
    if ( vgl(wf_n,1,3) && wa(wf_n+1,"_samyj_prl_sky") && s(0,wf_n) &&
         qir(1,wf_n-1,"nar_any gl_aux_be qast_any") )
    { l[i]=omo2; Z[530]++; if(dbg){print "Z530"}; continue };
    cst5="быть выглядеть казаться оказаться показаться представлять стать";
    if ( vgl(wf_n,2,4) && qm(wf_n+1,"prl_edmuim prl_edmutv","_samyj_prl_palate") && s(0,wf_n-1) &&
          bw(1,cst5) && qir(2,wf_n-1,"nar_any gl_aux_be qast_any") )
    { l[i]=omo1; Z[531]++; if(dbg){print "Z531"}; continue };
    if ( vgl(wf_n,2,4) && qm(wf_n+1,"prl_edmuim prl_edmutv","_samyj_prl_sky") && s(0,wf_n-1) &&
          bw(1,cst5) && qir(2,wf_n-1,"nar_any gl_aux_be qast_any") )
    { l[i]=omo2; Z[532]++; if(dbg){print "Z532"}; continue };

 };

 if ( z(0) && qxw(1,"в","котором который") ) {

   if ( bfa(3,7,"_gl_v_palate-iv") && s(3,bfn-1) &&
        qir(3,bfn-1,"mest_any mest_3e prl_any suw_any isname pre_any nar_any gl_aux_be mod_any") )
   { l[i]=omo1; Z[533]++; if(dbg){print "Z533"}; continue };
   if ( bfa(3,7,"_gl_v_palate-pr") && s(3,bfn-1) &&
        qir(3,bfn-1,"mest_any mest_3e isname pre_any nar_any gl_aux_be mod_any") )
   { l[i]=omo1; Z[534]++; if(dbg){print "Z534"}; continue };

 };


 }; # и_п_ и в_п_ небо замки
  ######################################################################################################

 ### неба замков р_п_
 if ( veq(Y["iwrd_case"],"ro") ) {
 #
    if ( FN_hw_neba_f() )
    { Z[18]++; if(dbg){print "Z18", "-- is_HW"}; continue };


    # _palate_environs
    if ( qb(-5,-1,"sz_iili") ) { qb_n=qbn; if ( bba(qb_n-5,qb_n-1,"_palate_environs") ) { bb_n=bbn;

       if ( vgl(qb_n,-5,-1) && veq(bb_n,qb_n-1) && s(bb_n,-1) &&
              q(bb_n,"suw_ro") &&
            qir(qb_n+1,-1,"prl_ro prq_ro mest_ro qast_any") )
       { l[i]=omo1; Z[535]++; if(dbg){print "Z535"}; continue };

    };};


    cst="близ вблизи";
    if ( wb(-5,-1,cst) ) { wb_n=wbn;

       if ( vgl(wb_n,-5,-1) && s(wb_n,-1) &&
            qir(wb_n+1,-1,"prl_ro prq_ro mest_ro mest_3e isname") )
       { l[i]=omo1; Z[536]++; if(dbg){print "Z536"}; continue };

    };


#   if ( TN_do_neba_f() )
#   { Z[537]++; if(dbg){print "Z537", "-- TN_do_neba_f"}; continue };
#   if ( TN_ot_neba_f() )
#   { Z[538]++; if(dbg){print "Z538", "-- TN_ot_neba_f"}; continue };
#   if ( TN_iz_neba_f() )
#   { Z[539]++; if(dbg){print "Z539", "-- TN_iz_neba_f"}; continue };

    # _palate_prl:start
    if ( ba(-1,"_palate_prl") && prl_ro(-1) && s(-1)  )
    { l[i]=omo1; Z[540]++; if(dbg){print "Z540"}; continue };
    if ( ba(-2,"_palate_prl") && prl_ro(-2) &&
          q(-1,"prl_any prq_any mest_any qast") && s(-2,-1)  )
    { l[i]=omo1; Z[541]++; if(dbg){print "Z541"}; continue };
    if ( ba(1,"_palate_prl") && prl_ro(1) && s(0) )
    { l[i]=omo1; Z[542]++; if(dbg){print "Z542"}; continue };
    # _palate_prl:start

    # _sky_prl:start
    if ( ba(-1,"_sky_prl") && s(-1) && prl_ro(-1) )
    { l[i]=omo2; Z[543]++; if(dbg){print "Z543"}; continue };
    if ( ba(1,"_sky_prl") && s(0) && prl_ro(1) && !isname(1) )
    { l[i]=omo2; Z[544]++; if(dbg){print "Z544"}; continue };
    # _sky_prl:end

    # _palate_prl_geo:start
    if ( prl_ro(-1) &&
             ba(-1,"_palate_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[545]++; if(dbg){print "Z545"}; continue };
    if ( prl_ro(-2) &&
             ba(-2,"_palate_prl_geo") &&
              Q(-1,"suw_any") && s(-2,-1)  )
    { l[i]=omo1; Z[546]++; if(dbg){print "Z546"}; continue };
    # _palate_prl_geo:start

  }; # р_п_ неба замков
  ######################################################################################################

 ### небом замками дат_п_
 if ( veq(Y["iwrd_case"],"da") ) {
 #
  #
    if ( TN_k_nebu_f() )
    { Z[547]++; if(dbg){print "Z547", "-- TN_k_nebu_f"}; continue };


    # _palate_prl:start
    if ( ba(-1,"_palate_prl") && prl_da(-1) && s(-1)  )
    { l[i]=omo1; Z[548]++; if(dbg){print "Z548"}; continue };
    # _palate_prl:start

    # _sky_prl:start
#   if ( ba(-1,"_sky_prl") && s(-1) && prl_da(-1) )
#   { l[i]=omo2; Z[549]++; if(dbg){print "Z549"}; continue };
    if ( ba(1,"_sky_prl") && s(0) && prl_da(1) && !isname(1) )
    { l[i]=omo2; Z[550]++; if(dbg){print "Z550"}; continue };
    # _sky_prl:end

    # _palate_prl_geo:start
    if ( prl_da(-1) &&
             ba(-1,"_palate_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[551]++; if(dbg){print "Z551"}; continue };
    # _palate_prl_geo:start

  }; # дат_п_ небу замкам
  ######################################################################################################


 ### небом замками тв_п_
 if ( veq(Y["iwrd_case"],"tv") ) {
 #
    # _palate_environs
    if ( qb(-5,-1,"sz_iili") ) { qb_n=qbn; if ( bba(qb_n-5,qb_n-1,"_palate_environs") ) { bb_n=bbn;

       if ( vgl(qb_n,-5,-1) && veq(bb_n,qb_n-1) && s(bb_n,-1) &&
              q(bb_n,"suw_tv") &&
            qir(qb_n+1,-1,"prl_tv prq_tv mest_tv qast_any") )
       { l[i]=omo1; Z[552]++; if(dbg){print "Z552"}; continue };

    };};

    if ( vex(Y["tn_ok_pod_tv"]) && TN_pod_nebom_f() )
    { Z[553]++; if(dbg){print "Z553", "-- TN_pod_nebom_f"}; continue};


 #
    # _palate_prl:start
    if ( ba(-1,"_palate_prl") && prl_tv(-1) && s(-1)  )
    { l[i]=omo1; Z[554]++; if(dbg){print "Z554"}; continue };
    if ( ba(-2,"_palate_prl") && prl_tv(-2) &&
          q(-1,"prl_any prq_any mest_any qast") && s(-2,-1)  )
    { l[i]=omo1; Z[555]++; if(dbg){print "Z555"}; continue };
    # _palate_prl:start

    # _sky_prl:start
    if ( ba(-1,"_sky_prl") && s(-1) && prl_tv(-1) )
    { l[i]=omo2; Z[556]++; if(dbg){print "Z556"}; continue };
    # _sky_prl:end

    # _palate_prl_geo:start
    if ( prl_tv(-1) &&
             ba(-1,"_palate_prl_geo") && s(-1)  )
    { l[i]=omo1; Z[557]++; if(dbg){print "Z557"}; continue };
    # _palate_prl_geo:start

    # _palate_tv:start
    if ( bba(-4,-1,"_palate_tv") && s(bbn,-1) &&
         qir(bbn+1,-1,"prl_tv prq_tv mest_tv qast_any") )
    { l[i]=omo1; Z[558]++; if(dbg){print "Z558"}; continue };
    # _palate_tv:start

    cst="быть вставать выбрать избрать именовать именоваться казаться объявить объявлять оказаться провозгласить провозглашать сделать служить стать считаться \
         являться";
    cst8="быть стать";
    cst0="дверью клеткой ключом пеплом руинами целью центром";
    if ( bf(1,4,cst) ) { bf_n=bfn;
      if ( bw(bf_n,cst8) ) { if ( s(bf_n,3) && bf(bf_n+1,4,cst) ) bf_n=bfn }; bbn=wfn=bfn="";

      if ( bfa(bf_n+1,bf_n+5,"_palatelike_things")||
            wf(bf_n+1,bf_n+5,cst0)||
         ( bfa(bf_n+1,bf_n+5,"_prq_palate") && q(bfn,"prq_tv") ) ) {

          if (bfn) bb_n=bfn; if (wfn) bb_n=wfn;

          if ( vgl(bf_n,1,4) && zs(0) && s(1,bb_n-1) &&
               vgl(Y["n-_sky_pe"],-4,-1) && s(Y["n-_sky_pe"],-1) &&
               qir(bb_n+1,-1,"prl_edmuim prl_mnim mest_vi mest_3e qast_any") )
          { bf_n=bb_n=""; Z[559]++; if(dbg){print "Z559"}; };
          if ( vgl(bf_n,1,4) && zs(0) && s(1,bb_n-1) &&
                 w(bb_n,"ключом") && !w(bb_n+1,"к") )
          { bf_n=bb_n=""; Z[560]++; if(dbg){print "Z560"}; };

       if ( vgl(bf_n,1,4) && zs(0) && s(1,bb_n-1) &&
              q(bb_n,"suw_tv prq_tv") &&
            qir(1,bf_n-1,"otsz_any mod_any gl_aux_be qast nar_any suw_ro suw_edne isname suw_vi prl_vi mest_vi mest_da mest_im sz suw_da") &&
            qir(bf_n+1,bb_n-1,"prl_tv prq_tv mest_tv mest_3e nar_any prl_kred_sr qast suw_tv suw_da mest_da isname suw_edne prq_kred prq_krmn") )
       { l[i]=omo1; Z[561]++; if(dbg){print "Z561"}; continue };
       if ( vgl(bf_n,1,4) && zs(0) && s(1,bb_n-1) &&
              w(bf_n+1,"для") &&
              q(bb_n,"suw_tv prq_tv") &&
            qir(1,bf_n-1,"otsz_any mod_any gl_aux_be qast nar_any suw_ro suw_edne isname suw_vi prl_vi mest_vi mest_da mest_im sz suw_da prl_kred_sr") &&
            qir(bf_n+2,bb_n-1,"prl_tv prq_tv mest_tv mest_3e nar_any prl_kred_sr qast suw_ro mest_ro isname suw_edne prq_kred prq_krmn") )
       { l[i]=omo1; Z[562]++; if(dbg){print "Z562"}; continue };
       if ( vgl(bf_n,1,4) && zs(0) && s(1,bb_n-1) &&
              q(bb_n,"suw_tv") &&
            qir(1,bf_n-1,"otsz_any mod_any gl_aux_be qast nar_any suw_ro isname") &&
              q(bf_n+1,"narph_any") &&
            qiz(xwn+1,bb_n-1,"prl_tv prq_tv mest_tv mest_3e nar_any prl_kred_sr qast_any suw_da mest_da isname suw_edne","qast") )
       { l[i]=omo1; Z[563]++; if(dbg){print "Z563"}; continue };
     };
   };

  }; # тв_п_ небом замками
  ######################################################################################################

 ### небе замках пр_п_
 if ( veq(Y["iwrd_case"],"pr") ) {
 #
    if ( vex(Y["tn_ok_v_pr"]) && TN_v_nebe_f() )
    { Z[564]++; if(dbg){print "Z564", "-- TN_v_nebe_f"}; continue};

    # _palate_environs
    if ( qb(-5,-1,"sz_iili") ) { qb_n=qbn; if ( bba(qb_n-5,qb_n-1,"_palate_environs") ) { bb_n=bbn;

       if ( vgl(qb_n,-5,-1) && veq(bb_n,qb_n-1) && s(bb_n,-1) &&
              q(bb_n,"suw_pr") &&
            qir(qb_n+1,-1,"prl_pr prq_pr mest_pr qast_any") )
       { l[i]=omo1; Z[565]++; if(dbg){print "Z565"}; continue };

    };};

  #

  }; # пр_п_ небе замках
  ######################################################################################################


 cst="[иох]уровнев[оы]";
 if ( wc(-1,cst) && s(-1) )
 { l[i]=omo1; Z[566]++; if(dbg){print "Z566"}; continue };

 # _sky_parts:start
 if ( bfa(1,5,"_sky_parts") ) { bf_n=bfn; BF_n=BFn;

    if ( vgl(bf_n,1,5) && s(1,bf_n-1) && (s(0)||se(0," — ")) && weq(BF_n,"данное") )
    { bf_n=""; Z[567]++; if(dbg){print "Z567"}; };
    if ( vgl(bf_n,1,5) && s(1,bf_n-1) && (s(0)||se(0," — ")) && w(bf_n-1,"визитная") )
    { bf_n=""; Z[568]++; if(dbg){print "Z568"}; };

    if ( vgl(bf_n,1,5) && s(1,bf_n-1) && (s(0)||se(0," — ")) && qf(1,bf_n,"isname") )
    { bf_n=""; Z[569]++; if(dbg){print "Z569"}; };
    if ( vgl(bf_n,1,5) && s(1,bf_n-1) && (s(0)||se(0," — ")) && q(-1,"isname") && p(-2) )
    { bf_n=""; Z[570]++; if(dbg){print "Z570"}; };

    if ( vgl(bf_n,1,5) && s(1,bf_n-1) && (s(0)||se(0," — ")) &&
         qir(1,bf_n-1,"mod_any gl_in gl_aux_be gl_ed gl_mn nar_any prl_kred_sr prl_any mest_any qast_any") )
    { l[i]=omo2; Z[571]++; if(dbg){print "Z571"}; continue };

 };
 # _sky_parts:end

 # _palate_pe:start
 if ( z(0) && q(1,"prq_any") && ba(1,"_palate_pe") && s(1) )
 { l[i]=omo1; Z[572]++; if(dbg){print "Z572"}; continue };
 if ( z(0) &&
      q(1,"nar_spos prl_kred_sr") &&
      q(2,"prq_any") && ba(2,"_palate_pe") && s(1,2) )
 { l[i]=omo1; Z[573]++; if(dbg){print "Z573"}; continue };
 if ( q(-3,"prq_any") && ba(-3,"_palate_pe") &&
 pre_ro(-2) &&
      q(-1,"suw_ro") && s(-3,-1) )
 { l[i]=omo1; Z[574]++; if(dbg){print "Z574"}; continue };
 if ( q(-1,"prq_any") && ba(-1,"_palate_pe") && s(-1) )
 { l[i]=omo1; Z[575]++; if(dbg){print "Z575"}; continue };
 # _palate_pe:end

 # _sky_pe:start
 if ( z(0) && q(1,"prq_any") && ba(1,"_sky_pe") && s(1) )
 { l[i]=omo2; Z[576]++; if(dbg){print "Z576"}; continue };
 if ( q(-1,"prq_any") && ba(-1,"_sky_pe") && s(-1) )
 { l[i]=omo2; Z[577]++; if(dbg){print "Z577"}; continue };
 # _sky_pe:end

 # _palate_v_suw-pr:start
 if ( wf(1,6,"в во") ) { wf_n=wfn;
   if ( wfa(wf_n+1,wf_n+4,"_palate_v_suw-pr") ) { bf_n=wfn;

    if ( vgl(wf_n,1,6) && vgl(bf_n,wf_n+1,wf_n+4) && zs(0) && s(1,bfn-1) &&
         qir(1,wf_n-1,"prl_any mest_any isname prl_kred_sr") &&
         qir(wf_n+1,bf_n-1,"prl_pr mest_pr mest_3e prq_pr qik_pr qik_vi") )
    { l[i]=omo1; Z[578]++; if(dbg){print "Z578"}; continue };

    cst1="быть находиться стоять";
    cst3="области";
    cst2="горла живота поясницы";
    if ( vgl(wf_n,1,6) && vgl(bf_n,wf_n+1,wf_n+4) && zs(0) && s(1,bfn-1) &&
           w(bf_n,cst3) &&
           w(bf_n+1,cst2) &&
          bw(wf_n-1,cst1) &&
         qir(1,wf_n-2,"prl_any mest_any isname qast_ne") &&
         qir(wf_n+1,bf_n-1,"prl_pr mest_pr mest_3e prq_pr") )
    { l[i]=omo2; Z[579]++; if(dbg){print "Z579"}; continue };
    if ( vgl(wf_n,1,6) && vgl(bf_n,wf_n+1,wf_n+4) && zs(0) && s(1,bfn-1) &&
          bw(wf_n-1,cst1) &&
         qir(1,wf_n-2,"prl_any mest_any isname qast_ne") &&
         qir(wf_n+1,bf_n-1,"prl_pr mest_pr mest_3e prq_pr") )
    { l[i]=omo1; Z[580]++; if(dbg){print "Z580"}; continue };

 };};

 if ( vgl(Y["n_pre_v_ist"],-6,-2) ) { wb_n=Y["n_pre_v_ist"];
   if ( wba(wb_n+1,-1,"_palate_v_suw-pr") ) { bb_n=wbn;
    # escape:start
    cst8="ключ ключ-карта";
    if ( vgl(wb_n,-6,-2) && vgl(bb_n,wb_n+1,-1) &&
           w(wb_n-1,cst8) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") && s(wb_n,bb_n-1) &&
         qia(bb_n+1,-1,"qast","prl_any mest_any nar_any suw_ro isname") && ds(bb_n) && s(bb_n+1,-1) )
    { l[i]=omo2; Z[581]++; if(dbg){print "Z581"}; continue };
    # escape:end

    if ( vgl(wb_n,-6,-2) && vgl(bb_n,wb_n+1,-1) &&
         qir(wb_n+1,bb_n-1,"prl_pr mest_pr mest_3e prq_pr") && s(wb_n,bb_n-1) &&
         qia(bb_n+1,-1,"qast","prl_any mest_any nar_any suw_ro isname") && ds(bb_n) && s(bb_n+1,-1) )
    { l[i]=omo1; Z[582]++; if(dbg){print "Z582"}; continue };

 };};
 # _palate_v_suw-pr:end

 # похожий II
 cst="непохожий походить похожий";
 if ( bf2(1,5,cst) &&
        w(bfN+1,"на") &&
      bfa(bfN+2,bfN+5,"_palatelike_things") && !eos(0,bfn-1) &&
      qir(1,bfN-1,"gl_aux_be isname otsz_any nar_any") &&
      qir(bfN+2,bfn-1,"prl_vi mest_vi mest_3e prq_vi") )
 { l[i]=omo1; Z[583]++; if(dbg){print "Z583"}; continue };
 if ( wf(1,4,"как") &&
     qxs(wfn+1,"две","капли","воды") &&
     bf2(xsn+1,xsn+3,cst) &&
       w(bfN+1,"на") &&
     bfa(bfN+2,bfN+5,"_palatelike_things") && !eos(0,bfn-1) &&
     qir(1,wfn-1,"gl_aux_be isname otsz_any nar_any") &&
     qir(xsn+1,bfN-1,"gl_aux_be nar_step") &&
     qir(bfN+2,bfn-1,"prl_vi mest_vi mest_3e prq_vi") )
 { l[i]=omo1; Z[584]++; if(dbg){print "Z584"}; continue };
 # похожий II

 if ( wf(1,4,"дома") && s(0,wfn-1) &&
     qir(1,wfn-1,"prl_ro mest_ro prq_ro") &&
    !wfa(1,wfn-1,"_sky_suw-ro") && Ww_(-1,"под") )
 { l[i]=omo1; Z[585]++; if(dbg){print "Z585"}; continue };

 # небо, где...
 cst="страницы";
 if ( w(1,"где") && z(0) &&
     wf(2,5,cst) && s(1,wfn-1) &&
    qir(2,wfn-1,"mod_any gl_aux_be gl_nein")  )
 { l[i]=omo2; Z[586]++; if(dbg){print "Z586"}; continue };

 if ( z(0) && w(1,"где") )
 { l[i]=omo1; Z[587]++; if(dbg){print "Z587"}; continue };
 if ( bba(-5,-2,"_palate_platz") && z(bbn) && s(bbn+1,-1) &&
        w(bbn+1,"где") &&
      qir(bbn+2,-1,"prl_vi mest_vi mest_3e")  )
 { l[i]=omo1; Z[588]++; if(dbg){print "Z588"}; continue };

 # небо, куда...
 if ( z(0) && w(1,"куда") &&
    bfa(2,6,"_gl_v_palate-iv") && s(1,bfn-1) &&
    qir(2,bfn-1,"mod_any nar_any mest_any suw_any qast_ne isname") )
 { l[i]=omo1; Z[589]++; if(dbg){print "Z589"}; continue };
 cst="держать";
 cst1="дорогу путь";
 if ( z(0) && w(1,"куда") && bf(2,6,cst) &&
      w(bfn+1,cst1) && s(1,bfn) &&
    qir(2,bfn-1,"mest_im otsz_any gl_aux_be mod_any") )
 { l[i]=omo1; Z[590]++; if(dbg){print "Z590"}; stopp=ret=1; continue };

 # цифры
 if ( vgl(Y["n_pre_v_ist"],-8,-2) ) { wb_n=Y["n_pre_v_ist"];

    if ( vgl(wb_n,-7,-3) && s(wb_n,-1) &&
      digits(wb_n+1) &&
          qy(wb_n+2,"digits") &&
           w(wb_n+2+qyn,"году годах") &&
         qir(wb_n+3+qyn,-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[591]++; if(dbg){print "Z591"}; continue };
    if ( vgl(wb_n,-7,-3) && s(wb_n,-1) &&
      digits(wb_n+1) &&
           w(wb_n+2,"м х") &&
           w(wb_n+3,"году годах") &&
       roman(wb_n+3) &&
           w(wb_n+4,"века") &&
         qir(wb_n+5,-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[592]++; if(dbg){print "Z592"}; continue };
    if ( vgl(wb_n,-6,-2) && s(wb_n+1,-1) &&
       roman(wb_n) &&
           w(wb_n+1,"веке веках") &&
         qir(wb_n+2,-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[593]++; if(dbg){print "Z593"}; continue };

 };

 if ( wb(-6,-2,"к") && s(wbn+1,-1) &&
   roman(wbn) &&
       w(wbn+1,"веку векам") &&
     qir(wbn+2,-1,"prl_vi mest_vi mest_3e") )
 { l[i]=omo1; Z[594]++; if(dbg){print "Z594"}; continue };
 if ( qb(-6,-2,"pre_ro") && s(qbn+1,-1) &&
   roman(qbn) &&
       w(qbn+1,"века веков") &&
     qir(qbn+2,-1,"prl_vi mest_vi mest_3e") )
 { l[i]=omo1; Z[595]++; if(dbg){print "Z595"}; continue };

 if ( FN_palate_prl_f("_palate_prl_after") )
 { Z[596]++; if(dbg){print "Z596", "-- FN_palate_prl_after_f"}; continue };

 if ( FN_sky_prl_f("_sky_prl_after") )
 { Z[597]++; if(dbg){print "Z597", "-- FN_sky_prl_f(\"_sky_prl_after\")"}; continue };


 # перенос назад
    if ( z(-1) && veq(Y["n-_palate_environs"],-1) )
    { l[i]=omo1; Z[598]++; if(dbg){print "Z598"}; continue };
    if ( z(0) && veq(Y["n+_palate_environs"],1) && Q(1,"isname") )
    { l[i]=omo1; Z[599]++; if(dbg){print "Z599"}; continue };
 # перенос назад


 # от обработки предыдущего в строке:start
 if ( gist(-4,2) &&
         w(-3,"не") &&
         q(-2,"gl_ed gl_mn gl_vzed gl_vzmn") && z(-2) &&
         w(-1,"а но и или") && s(0) )
 { l[i]=omo2; Z[600]++; if(dbg){print "Z600"}; continue };
 # от обработки предыдущего в строке:end

 if ( q(1,"isname") && s(0) &&
    (wa(1,"_palate_isname_geo")||
     wa(1,"_palate_isname_geo_edro")||
     wa(1,"_palate_isname_geo_mnro")||
     wa(1,"_palate_cap")||
     wa(1,"_palate_cap_edro")||
     wa(1,"_palate_cap_mnro") ))
 { l[i]=omo1; Z[601]++; if(dbg){print "Z601"}; continue };

 if ( q(1,"suw_ro suw_edne isname") && s(0) && z(1) &&
      q(2,"isname") && p(2) &&
    (wa(2,"_palate_isname_geo")||
     wa(2,"_palate_isname_geo_edro")||
     wa(2,"_palate_isname_geo_mnro")||
     wa(2,"_palate_cap")||
     wa(2,"_palate_cap_edro")||
     wa(2,"_palate_cap_mnro") ))
 { l[i]=omo1; Z[602]++; if(dbg){print "Z602"}; continue };

 if ( (qxs(1,"де","ла")||
       qxs(1,"фон","дер")) &&
    isname(xsn+1) && s(xsn) )
 { l[i]=omo1; Z[603]++; if(dbg){print "Z603"}; continue };

 if ( isname(2) && s(0) ) {
    if ( w(1,"де дю фон ди да дель ла ло ле лё ля") && s(1) )
    { l[i]=omo1; Z[604]++; if(dbg){print "Z604"}; continue };
    if ( w(1,"д л") && sc(1,"[\x27’]") )
    { l[i]=omo1; Z[605]++; if(dbg){print "Z605"}; continue };
    if ( w(1,"ал") && se(1,"-") )
    { l[i]=omo1; Z[606]++; if(dbg){print "Z606"}; continue };
    if ( q(1,"pre_vi pre_ro pre_pr") && s(1) &&
       !bb(-4,-1,"ключ ключик ключ-карта") )
    { l[i]=omo1; Z[607]++; if(dbg){print "Z607"}; continue };
 };

 if ( isname(1) && prl_any(1) && s(0) && (p(1)||q_w(1,"sz_iili")) )
 { l[i]=omo1; Z[608]++; if(dbg){print "Z608"}; continue };
 if ( isname(-1) && ( (s(-2,-1) && sv(-2,"\x29"))||(z(-2) && s(-1)) ) )
 { l[i]=omo1; Z[609]++; if(dbg){print "Z609"}; continue };
 if ( isname(0) && s(-1) )
 { l[i]=omo1; Z[610]++; if(dbg){print "Z610", "-- is_CAP"}; continue };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

} #main_end

function DEF_TN_PREVI_NEBO(num,el,    fufu) { # определение компонентов между "pre_vi" и "небо"
    tn=tn_ok="";
    tn=num;
    cst1_edmuvi="prl_edmuim mcop_edmuim qis_vi qik_vi prq_edmuim qast_any mest_3e nar_kaq nar_step";
    cst1_mnvi="prl_mnim mcop_mnim qis_vi qik_vi prq_mnvi qast_any mest_3e nar_kaq nar_step";
    cst2_edmuvi="prl_edmuim prq_edmuim";
    cst2_mnvi="prl_mnim prq_mnim";
    cst3_edmuvi="prl_edmuim mcop_edmuim qis_vi qik_vi prq_edmuim suw_ro suw_edne";
    cst3_mnvi="prl_mnim mcop_mnim qis_vi qik_vi prq_mnim suw_ro suw_edne";

    if ( w(0,"небо") )
    { cst1 = cst1_edmuvi; cst2 = cst2_edmuvi;  cst3 = cst3_edmuvi; };
    if ( w(0,"замки") )
    { cst1 = cst1_mnvi;   cst2 = cst2_mnvi;    cst3 = cst3_mnvi    };

    if ( hwy(-1,"то") && qir(tn+1,-1-hyn,cst1) && s(tn,-1) )
    { tn_ok = 1; Z[611]++; if(dbg){print "Z611", "-- tn_ok ON", el, "небо"};};
    if ( !vex(tn_ok) && s(tn,-1) &&
            q(tn+1,cst2) && wy(-1,"же") &&
          qir(tn+2,-1-wyn,"mest_da suw_da prq_da nar_any prl_da") )
    { tn_ok = 1; Z[612]++; if(dbg){print "Z612", "-- tn_ok ON", el, "небо"};};
    if ( !vex(tn_ok) && s(tn,-1) &&
            q(tn+1,cst2) &&
          qir(tn+2,-2,"mest_tv prq_tv qik_tv nar_any prl_tv") &&
            q(-1,"suw_tv mest_tv") )
    { tn_ok = 1; Z[613]++; if(dbg){print "Z613", "-- tn_ok ON", el, "небо"};};
    if ( !vex(tn_ok) && s(tn,-1) &&
            q(tn+1,cst2) &&
          qir(tn+2,-3,"mest_tv prq_tv qik_tv nar_any prl_tv") &&
            q(-2,"suw_tv qik_tv") &&
            q(-1,cst3) )
    { tn_ok = 1; Z[614]++; if(dbg){print "Z614", "-- tn_ok ON", el, "небо"};};
    if ( !vex(tn_ok) && s(tn,-1) &&
            q(tn+1,cst2) &&
            q(tn+2,"pre_vi") &&
          qir(tn+3,-2,"prl_vi mest_vi mest_3e") &&
            q(-1,"mest_vip3e suw_vi") )
    { tn_ok = 1; Z[615]++; if(dbg){print "Z615", "-- tn_ok ON", el, "небо"};};
    if ( !vex(tn_ok) && s(tn,-1) &&
            q(tn+1,cst2) &&
            q(tn+2,"pre_tv") &&
          qir(tn+3,-2,"prl_tv mest_tv mest_3e") &&
            q(-1,"suw_tv") )
    { tn_ok = 1; Z[616]++; if(dbg){print "Z616", "-- tn_ok ON", el, "небо"};};
    cst="именно собственно";
    if ( !vex(tn_ok) && s(tn,-1) && qiw(tn+1,-1,cst1,cst) )
    { tn_ok = 1; Z[617]++; if(dbg){print "Z617", "-- tn_ok ON", el, "небо"};};
    if ( !vex(tn_ok) && s(-4) && zs(-3) && s(-2,-1) && veq(tn,-4) &&
            q(-3,cst2) && q(-2,"nar_any prl_kred_sr") && q(-1,cst2) )
    { tn_ok = 1; Z[618]++; if(dbg){print "Z618", "-- tn_ok ON", el, "небо"};};
    if ( !vex(tn_ok) && s(tn,-1) && veq(tn,-2) && wc(-1,"ский$|ный$") )
    { tn_ok = 1; Z[619]++; if(dbg){print "Z619", "-- tn_ok ON", el, "небо"};};
    if ( !vex(tn_ok) && zs(-2) && s(-1) && veq(tn,-3) &&
            q(-2,cst2) && wc(-1,"ский$|ный$") )
    { tn_ok = 1; Z[620]++; if(dbg){print "Z620", "-- tn_ok ON", el, "небо"};};
    if ( !vex(tn_ok) && s(tn,-1) && veq(tn,-4) &&
            q(-3,cst2) && q(-2,"sz_iili") && wc(-1,"ский$|ный$") )
    { tn_ok = 1; Z[621]++; if(dbg){print "Z621", "-- tn_ok ON", el, "небо"};};
    # передвижка tn_ok
    if ( vex(tn_ok) && s(tn,-1) &&
       ( qxs(tn-1,"как","и")||
         qxs(tn-1,"да","еще","и")||
         qxs(tn-1,"ведь даже же прямо сразу") ) )
    { tn = xsn; Z[622]++; if(dbg){print "Z622", "-- tn_ok MOV", el, "небо"};};
    # выключение tn_ok
    if ( vex(tn_ok) && z(tn-1) && w(tn+1,"который") )
    { tn_ok = ""; Z[623]++; if(dbg){print "Z623", "-- tn_ok OFF", el, "небо"};};
    if ( vex(tn_ok) && !vex(fufu) && s(tn,-1) && qf(tn+1,-1,"prq_edmuvi prq_mnvi") &&
         bam(qfn,"_palate_pe _sky_pe") &&
           q(1,"suw_edmuvi suw_mnvi suw_edne") && s(0) )
    { tn_ok = ""; Z[624]++; if(dbg){print "Z624", "-- tn_ok OFF", el, "небо"};};
    if ( vex(tn_ok) && !vex(fufu) && s(tn,-1) &&
         qxs(-1,"прошлый тот этот","раз") )
    { tn_ok = ""; Z[625]++; if(dbg){print "Z625", "-- tn_ok OFF", el, "небо"};};
}

function DEF_TN_PREDA_NEBU(num,el,    fufu) { # определение компонентов между "pre_da" и "небу"
    tn=tn_ok="";
    tn=num;
    cst1_edmuvi="prl_edmuda mcop_edmuda qis_da qik_da prq_edmuda qast_any mest_3e nar_kaq nar_step";
    cst1_mnvi="prl_mnda mcop_mnda qis_da qik_da prq_mnda qast_any mest_3e nar_kaq nar_step";
    cst2_edmuvi="prl_edmuda prq_edmuda";
    cst2_mnvi="prl_mnda prq_mnda";
    cst3_edmuvi="prl_edmuda mcop_edmuda qis_da qik_da prq_edmuda suw_ro suw_edne";
    cst3_mnvi="prl_mnda mcop_mnda qis_da qik_da prq_mnda suw_ro suw_edne";

    if ( w(0,"небу") )
    { cst1 = cst1_edmuda; cst2 = cst2_edmuda;  cst3 = cst3_edmuda; };
    if ( w(0,"замкам") )
    { cst1 = cst1_mnda;   cst2 = cst2_mnda;    cst3 = cst3_mnda    };

    if ( hwy(-1,"то") && qir(tn+1,-1-hyn,cst1) && s(tn,-1) )
    { tn_ok = 1; Z[626]++; if(dbg){print "Z626", "-- tn_ok ON", el, "небу"};};
    # передвижка tn_ok
    if ( vex(tn_ok) && s(tn,-1) &&
       ( qxs(tn-1,"как","и")||
         qxs(tn-1,"да","еще","и")||
         qxs(tn-1,"ведь даже же прямо сразу") ) )
    { tn = xsn; Z[627]++; if(dbg){print "Z627", "-- tn_ok MOV", el, "небу"};};
}

function DEF_TN_PRETV_NEBOM(num,el,    fufu) { # определение компонентов между "pre_tv" и "небом"
    tn=tn_ok="";
    tn=num;
    cst1_edmuvi="prl_edmutv mcop_edmutv qis_tv qik_tv prq_edmutv qast_any mest_3e nar_kaq nar_step";
    cst1_mnvi="prl_mntv mcop_mntv qis_tv qik_tv prq_mntv qast_any mest_3e nar_kaq nar_step";
    cst2_edmuvi="prl_edmutv prq_edmutv";
    cst2_mnvi="prl_mntv prq_mntv";
    cst3_edmuvi="prl_edmutv mcop_edmutv qis_tv qik_tv prq_edmutv suw_ro suw_edne";
    cst3_mnvi="prl_mntv mcop_mntv qis_tv qik_tv prq_mntv suw_ro suw_edne";

    if ( w(0,"небом") )
    { cst1 = cst1_edmutv; cst2 = cst2_edmutv;  cst3 = cst3_edmutv; };
    if ( w(0,"замками") )
    { cst1 = cst1_mntv;   cst2 = cst2_mntv;    cst3 = cst3_mntv    };

    if ( hwy(-1,"то") && qir(tn+1,-1-hyn,cst1) && s(tn,-1) )
    { tn_ok = 1; Z[628]++; if(dbg){print "Z628", "-- tn_ok ON", el, "небом"};};
    # передвижка tn_ok
    if ( vex(tn_ok) && s(tn,-1) &&
       ( qxs(tn-1,"как","и")||
         qxs(tn-1,"да","еще","и")||
         qxs(tn-1,"ведь даже же прямо сразу") ) )
    { tn = xsn; Z[629]++; if(dbg){print "Z629", "-- tn_ok MOV", el, "небом"};};
}

function DEF_TN_PREPR_NEBE(num,el) { # определение компонентов между "pre_pr" и "небе"
    tn=tn_ok="";
    tn=num;
    cst1_edmupr="prl_edmupr mcop_edmupr qis_pr qik_pr prq_edmupr qast_any mest_3e nar_kaq nar_step";
    cst1_mnpr="prl_mnpr mcop_mnpr qis_pr qik_pr prq_mnpr qast_any mest_3e nar_kaq nar_step";
    cst2_edmupr="prl_edmupr prq_edmupr";
    cst2_mnpr="prl_mnpr prq_mnpr";
    cst3_edmupr="prl_edmupr mcop_edmupr qis_pr qik_pr prq_edmupr suw_ro suw_edne";
    cst3_mnpr="prl_mnpr mcop_mnpr qis_pr qik_pr prq_mnpr suw_ro suw_edne";

    if ( w(0,"небе") )
    { cst1 = cst1_edmupr; cst2 = cst2_edmupr;  cst3 = cst3_edmupr; };
    if ( w(0,"замках") )
    { cst1 = cst1_mnpr;   cst2 = cst2_mnpr;    cst3 = cst3_mnpr    };

    if ( hwy(-1,"то") && qir(tn+1,-1-hyn,cst1) && s(tn,-1) )
    { tn_ok = 1; Z[630]++; if(dbg){print "Z630", "-- tn_ok ON", el, "небе"};};
    cst="именно собственно";
    if ( !vex(tn_ok) && s(tn,-1) && qiw(tn+1,-1,cst1,cst) )
    { tn_ok = 1; Z[631]++; if(dbg){print "Z631", "-- tn_ok ON", el, "небе"};};
    if ( !vex(tn_ok) && s(-4) && zs(-3) && s(-2,-1) && veq(tn,-4) &&
            q(-3,cst2) && q(-2,"nar_any prl_kred_sr") && q(-1,cst2) )
    { tn_ok = 1; Z[632]++; if(dbg){print "Z632", "-- tn_ok ON", el, "небе"};};
    if ( !vex(tn_ok) && s(tn,-1) && veq(tn,-2) && wc(-1,"ском$|ном$") )
    { tn_ok = 1; Z[633]++; if(dbg){print "Z633", "-- tn_ok ON", el, "небе"};};
    if ( !vex(tn_ok) && zs(-2) && s(-1) && veq(tn,-3) &&
            q(-2,cst2) && wc(-1,"ском$|ном$") )
    { tn_ok = 1; Z[634]++; if(dbg){print "Z634", "-- tn_ok ON", el, "небе"};};
    if ( !vex(tn_ok) && s(tn,-1) && veq(tn,-4) &&
            q(-3,cst2) && q(-2,"sz_iili") && wc(-1,"ском$|ном$") )
    { tn_ok = 1; Z[635]++; if(dbg){print "Z635", "-- tn_ok ON", el, "небе"};};
    # передвижка tn_ok
    if ( vex(tn_ok) && s(tn,-1) &&
       ( qxs(tn-1,"как","и")||
         qxs(tn-1,"да","еще","и")||
         qxs(tn-1,"ведь даже же прямо сразу") ) )
    { tn = xsn; Z[636]++; if(dbg){print "Z636", "-- tn_ok MOV", el, "небе"};};
}


function TN_v_nebo_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) { stopp=v2s(Y["TN_v_nebo_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_v"]) ) { tn=Y["n_pre_v"];

    # point escape:одиночные исключения
    if ( qxs(1,"несколько","раз","без","толку","стреляли") )
    { l[i]=omo2; Z[637]++; if(dbg){print "Z637"}; stopp=ret=1; continue };

    cst="поставить";
    cst1="гарнизон конь";
    if ( bw(tn-1,cst) &&
         bw(1,cst1) && s(tn-1) )
    { l[i]=omo1; Z[638]++; if(dbg){print "Z638"}; stopp=ret=1; continue };

    cst="угодить";
    cst1="голова локоть нога пуля рука шея";
    if ( bb(tn-4,tn-1,cst) &&
        bb2(bbn-4,bbn-1,cst1) && s(bbN,tn-1) &&
        qir(bbn+1,tn-1,"nar_any qast_any") &&
        qir(bbN+1,bbn-1,"suw_ro suw_edne isname prl_ro mest_ro mest_3e nar_any qast_any") )
    { l[i]=omo2; Z[639]++; if(dbg){print "Z639"}; stopp=ret=1; continue };

    cst="переходить";
    cst2="ствол";
    if ( bb(tn-4,tn-2,cst2) &&
         bw(tn-1,cst) && s(bbn,tn-1) )
    { l[i]=omo2; Z[640]++; if(dbg){print "Z640"}; stopp=ret=1; continue };

    if ( qxs(tn-1,"ни не") && z(0) && s(tn-1) &&
        (qxw(1,"а но","не","в")||
         qxw(1,"а но ни не","в")) &&
         bfa(xwn+1,xwn+5,"_palate_environs") && s(xwn,bfn-1) &&
         qir(xwn+1,bfn-1,"prl_vi mest_vi mest_3e prq_vi") )
    { l[i]=omo1; Z[641]++; if(dbg){print "Z641"}; stopp=ret=1; continue };
    if ( qxw(tn-3,"ни не","в") &&
          ba(tn-2,"_palate_environs") && z(tn-2) &&
         qxs(tn-1,"а но ни не") )
    { l[i]=omo1; Z[642]++; if(dbg){print "Z642"}; stopp=ret=1; continue };
    if ( wb(tn-5,tn-2,"через сквозь") &&
        qir(wbn+1,tn-2,"prl_vi mest_vi mest_3e prq_vi") &&
         ba(tn-1,"_palate_environs") && zs(tn-1) && s(wbn,tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[643]++; if(dbg){print "Z643"}; stopp=ret=1; continue };

    cst="совать";
    if ( bb(tn-4,tn-2,cst) &&
        qir(bbn+1,tn-2,"prl_edmuvi mest_edmuvi mest_3e") &&
          w(tn-1,"нос") && s(bbn,tn-1) )
    { l[i]=omo1; Z[644]++; if(dbg){print "Z644"}; stopp=ret=1; continue };
    if ( bw(1,cst) &&
         wf(2,5,"нос") &&
        qir(wfn+1,wfn-1,"prl_edmuvi mest_edmuvi mest_3e") && s(1,wfn-1) )
    { l[i]=omo1; Z[645]++; if(dbg){print "Z645"}; stopp=ret=1; continue };

    cst="захватить";
    if ( bb(tn-6,tn-3,cst) &&
        qir(bbn+1,tn-3,"suw_vi mest_vi mest_3e") &&
          w(tn-2,"с") &&
          q(tn-1,"mest_tv") && s(bbn,tn-1) )
    { l[i]=omo1; Z[646]++; if(dbg){print "Z646"}; stopp=ret=1; continue };

    if ( qxs(tn-1,"по","возвращению приезду прибытию") )
    { l[i]=omo1; Z[647]++; if(dbg){print "Z647"}; stopp=ret=1; continue };
    if ( qxs(tn-2,"в","одной","руке") &&
           q(tn-1,"suw_vi") &&
          zs(tn-1) )
    { l[i]=omo2; Z[648]++; if(dbg){print "Z648"}; stopp=ret=1; continue };

    if ( q(tn-1,"mest_im mest_vi mest_3e suw_odim suw_odvi") && Q(tn-1,"gl_po") &&
         p(tn-2) && p(0) && s(tn-1,-1) )
    { l[i]=omo1; Z[649]++; if(dbg){print "Z649"}; stopp=ret=1; continue };
    if ( q(tn-2,"mest_im mest_vi mest_3e suw_odim suw_odvi") && Q(tn-2,"gl_po") &&
         q(tn-1,"nar_any prl_kred_sr") &&
         p(tn-3) && p(0) && s(tn-2,-1) )
    { l[i]=omo1; Z[650]++; if(dbg){print "Z650"}; stopp=ret=1; continue };
    if ( q(tn-2,"nar_any prl_kred_sr") &&
         q(tn-1,"mest_im mest_vi mest_3e suw_odim suw_odvi") && Q(tn-1,"gl_po") &&
         p(tn-3) && p(0) && s(tn-2,-1) )
    { l[i]=omo1; Z[651]++; if(dbg){print "Z651"}; stopp=ret=1; continue };

    cst="держать";
    cst1="дорогу путь";
    if ( bf(1,5,cst) ) { bf_n=bfn;
      if ( vgl(bf_n,1,5) &&
             w(bf_n+1,cst1) && s(0,bf_n) &&
           qir(1,bf_n-1,"mest_im otsz_any gl_aux_be mod_any") )
      { l[i]=omo1; Z[652]++; if(dbg){print "Z652"}; stopp=ret=1; continue };
      if ( vgl(bf_n,1,5) &&
             w(bf_n-1,cst1) && s(0,bf_n-1) &&
           qir(1,bf_n-2,"mest_im otsz_any gl_aux_be mod_any") )
      { l[i]=omo1; Z[653]++; if(dbg){print "Z653"}; stopp=ret=1; continue };
    };

    { # захват в -->>
        cst1="брать взять завести заключить захватить свести сводить сложить собираться собрать";
        cst2="голень голова грудь живот колено ладонь ладошка лодыжка локоть ляжка нога ножка палец пальчик плечо поясница рука ручка стопа талия туловище шея";
        cst3="взмахом движением";
        if ( bb(tn-3,tn-1,cst1) ) { bb_n=bbn;

           if ( veq(bb_n,tn-1) && bb(tn-4,tn-2,cst2) && zs(tn-2) && zs(tn-1) && s(bbn,tn-3) &&
               !( w(bbn,"руки руками") && (w(bbn-1,"на за под в с") || vgl(Y["n-_gl_v_palate-iv"],bbn-4,bbn-2)) && s(Y["n-_gl_v_palate-iv"],bbn-1)) )
           { l[i]=omo2; Z[654]++; if(dbg){print "Z654"}; stopp=ret=1; continue };
           if ( vgl(bb_n,tn-4,tn-1) && s(bbn,tn-1) &&
                qir(bb_n+1,tn-2,"prl_vi mcop_vi prq_vi") &&
                 bw(tn-1,cst2) )
           { l[i]=omo2; Z[655]++; if(dbg){print "Z655"}; stopp=ret=1; continue };
           if ( veq(bb_n,tn-3) && s(tn-3,tn-1) &&
                 bw(tn-2,cst2) &&
                  q(tn-1,"suw_ro suw_edne isname") )
           { l[i]=omo2; Z[656]++; if(dbg){print "Z656"}; stopp=ret=1; continue };
           if ( veq(bb_n,tn-2) && s(tn-3,tn-1) &&
                  w(tn-3,cst3) &&
                  q(tn-1,"isname suw_vi") )
           { l[i]=omo2; Z[657]++; if(dbg){print "Z657"}; stopp=ret=1; continue };

        };
           if ( bw(tn-1,cst2) && se(tn-1, " — ") && p(0) )
           { l[i]=omo2; Z[658]++; if(dbg){print "Z658"}; stopp=ret=1; continue };

        if ( bw(tn-1,cst1) &&
             bf(1,3,cst2) && s(tn-1,bfn-1) )
        { l[i]=omo2; Z[659]++; if(dbg){print "Z659"}; stopp=ret=1; continue };

        cst="захват обхват";
        if ( bw(tn-2,cst) &&
             bw(tn-1,cst2) && s(tn-2,tn-1) )
        { l[i]=omo2; Z[660]++; if(dbg){print "Z660"}; stopp=ret=1; continue };
        if ( bw(tn-5,cst) &&
             bw(tn-4,cst2) &&
              q(tn-3,"suw_ro suw_edne isname") &&
              q(tn-2,"prl_tv mest_tv mest_3e prq_tv qis_tv qik_tv") &&
              q(tn-1,"suw_tv") && s(tn-5,tn-1) )
        { l[i]=omo2; Z[661]++; if(dbg){print "Z661"}; stopp=ret=1; continue };
        if ( bw(tn-1,cst) && s(tn-1) )
        { l[i]=omo2; Z[662]++; if(dbg){print "Z662"}; stopp=ret=1; continue };

        # в ... «небо» в кавычках
        if ( bw(tn-2,cst1) &&
              q(tn-1,"isname suw_vi") &&
             sc(-1,"[\x22«]") && sc(0,"[\x22»]") && s(tn-2,tn-1) )
        { l[i]=omo2; Z[663]++; if(dbg){print "Z663"}; stopp=ret=1; continue };
        if ( bw(tn-1,cst2) &&
             sc(tn-1,"[\x22«]") && sc(0,"[\x22»]") && s(tn-1) )
        { l[i]=omo2; Z[664]++; if(dbg){print "Z664"}; stopp=ret=1; continue };
        if ( bw(tn-2,cst2) &&
              q(tn-1,"qast_any") &&
             sc(tn-1,"[\x22«]") && sc(0,"[\x22»]") && s(tn-2,tn-1) )
        { l[i]=omo2; Z[665]++; if(dbg){print "Z665"}; stopp=ret=1; continue };

        if ( bw(tn-1,cst2) &&
              w(1,"за на") &&
             bw(2,cst2) && s(tn-1,1) )
        { l[i]=omo2; Z[666]++; if(dbg){print "Z666"}; stopp=ret=1; continue };

    } # захват в <<--

    cst="впустить выпустить послать";
    cst1="дым поток";
    if ( bw(tn-3,cst) &&
          w(tn-2,cst1) &&
          q(tn-1,"suw_ro") && s(tn-3,tn-1) )
    { l[i]=omo2; Z[667]++; if(dbg){print "Z667"}; stopp=ret=1; continue }; #edit
    if ( bb(tn-9,tn-3,cst) &&
          w(bbn+1,cst1) &&
          q(bbn+2,"pre_tv") &&
        qir(tn+3,tn-1,"suw_tv prl_tv mest_tv prq_tv isname qast nar_any") && s(bbn,tn-2) && zs(tn-1) )
    { l[i]=omo2; Z[668]++; if(dbg){print "Z668"}; stopp=ret=1; continue }; #edit


    cst="вбить запихать запихнуть засунуть сунуть";
    if ( bw(tn-1,cst) && s(tn-1) && s(0,1) &&
          w(1,"к ко") &&
          q(2,"suw_odedda suw_odmnda isname") )
    { l[i]=omo1; Z[669]++; if(dbg){print "Z669"}; stopp=ret=1; continue };
    if ( bb(tn-5,tn-2,cst) && s(bbn,tn-1) &&
         (q(tn-1,"suw_odedvi suw_odmnvi isname")||w(tn-1,"меня тебя вас нас всех")) &&
        qir(bbn+1,tn-2,"prl_vi prq_vi mest_vi mest_3e") )
    { l[i]=omo1; Z[670]++; if(dbg){print "Z670"}; stopp=ret=1; continue };
    cst2="спичка";
    if ( bw(tn-2,cst) && s(tn-2,tn-1) &&
          q(tn-1,"suw_vi") && bw(tn-1,cst2) )
    { l[i]=omo2; Z[671]++; if(dbg){print "Z671"}; stopp=ret=1; continue };

    cst1="армия войско отряд";
#   if ( bb(tn-4,tn-1,cst) &&
#        bw(tn-1,cst1) && s(bbn,tn-1) &&
#       qir(bbn+1,tn-2,"prl_vi mest_vi mest_3e nar_any") )
#   { l[i]=omo1; Z[672]++; if(dbg){print "Z672"}; stopp=ret=1; continue };
    if ( bw(tn-1,cst) &&
         bw(tn-2,cst1) && s(tn-2,tn-1) )
    { l[i]=omo1; Z[673]++; if(dbg){print "Z673"}; stopp=ret=1; continue };

    cst="способ";
    cst1="попасть";
    if ( bb(tn-4,tn-2,cst) &&
          w(tn-1,cst1) && s(bbn,tn-1) &&
        qir(bbn+1,tn-2,"suw_da mest_da nar_any") )
    { l[i]=omo1; Z[674]++; if(dbg){print "Z674"}; stopp=ret=1; continue };

    cst1="вкладывать вложить";
    cst2="деньги доллар золото магия работа серебро сила средство труд усилие";
    if ( bb(tn-5,tn-2,cst2) && s(bbn,tn-1) &&
         bw(tn-1,cst1) )
    { l[i]=omo1; Z[675]++; if(dbg){print "Z675"}; stopp=ret=1; continue };
    if ( bb(tn-5,tn-2,cst1) && s(bbn,tn-1) &&
         bw(tn-1,cst2) )
    { l[i]=omo1; Z[676]++; if(dbg){print "Z676"}; stopp=ret=1; continue };
    if ( bw(tn-2,cst2) && z(tn-2) &&
         bw(tn-1,cst1) && s(tn-1) )
    { l[i]=omo1; Z[677]++; if(dbg){print "Z677"}; stopp=ret=1; continue };
    if ( bf(1,4,cst1) &&
         bf(bfn+1,bfn+4,cst2) && s(0,bfn-1) )
    { l[i]=omo1; Z[678]++; if(dbg){print "Z678"}; stopp=ret=1; continue };

    cst1="бить ударить";
    if ( bb(tn-4,tn-2,cst1) && s(bbn,tn-1) &&
          q(tn-1,"suw_tv") &&
        qir(bbn+1,tn-2,"prl_tv mest_tv") )
    { l[i]=omo2; Z[679]++; if(dbg){print "Z679"}; stopp=ret=1; continue };

    # _suw_v_palate-vp:start
    # escape
    if ( ba(tn-3,"_suw_v_sky") &&
          w(tn-2,"с") &&
          q(tn-1,"suw_tv") && s(tn-3,tn-1) )
    { l[i]=omo2; Z[680]++; if(dbg){print "Z680"}; stopp=ret=1; continue };
    cst="ключ ключ-карта пропуск";
    if ( ba(tn-2,"_gl_v_sky-iv") &&
         bw(tn-1,cst) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[681]++; if(dbg){print "Z681"}; stopp=ret=1; continue };


    if ( vex(Y["n-_suw_v_palate-vp"]) ) { bb_n=Y["n-_suw_v_palate-vp"]; BB_n=Y["w-_suw_v_palate-vp"];

      cst="ключ ключ-карта";
      if ( veq(bb_n,tn-2) &&
            bw(tn-1,cst) && s(bb_n,tn-1) )
      { l[i]=omo2; Z[682]++; if(dbg){print "Z682"}; stopp=ret=1; continue };
      cst="доступ";
      cst1="код";
      if ( bw(bb_n-1,cst1) &&
          weq(BB_n,cst) && s(bb_n,tn-1) )
      { l[i]=omo2; Z[683]++; if(dbg){print "Z683"}; stopp=ret=1; continue };
      #
      if ( veq(bb_n,tn-1) && s(bb_n) )
      { l[i]=omo1; Z[684]++; if(dbg){print "Z684"}; stopp=ret=1; continue };

      cst0="дверь";
      if ( !weq(BB_n,cst0) && z(tn-1) && qir(bb_n+1,tn-1,"prl_kred_sr nar_any") && s(bb_n,tn-2) )
      { l[i]=omo1; Z[685]++; if(dbg){print "Z685"}; stopp=ret=1; continue };
      if ( qir(bb_n+1,tn-1,"prl_kred_sr nar_any") && s(bb_n,tn-1) )
      { l[i]=omo1; Z[686]++; if(dbg){print "Z686"}; stopp=ret=1; continue };
      if ( qir(bb_n+1,tn-2,"prl_ro prq_ro mcop_ro suw_ro") &&
             q(tn-1,"suw_ro mest_ro mest_3e qast nar_napr isname") && s(bb_n,tn-1) )
      { l[i]=omo1; Z[687]++; if(dbg){print "Z687"}; stopp=ret=1; continue };
      if ( vvb(tn-5,tn-1) && veq(vvn,bb_n) )
      { l[i]=omo1; Z[688]++; if(dbg){print "Z688"}; stopp=ret=1; continue };

      cst="без для из с";
      if ( w(bb_n+1,cst) &&
         qir(bb_n+2,tn-1,"suw_ro prl_ro prq_ro mest_ro mest_3e isname") && s(bb_n,tn-1) )
      { l[i]=omo1; Z[689]++; if(dbg){print "Z689"}; stopp=ret=1; continue };
      if ( veq(bb_n,tn-1) && se(tn-1," — ") )
      { l[i]=omo1; Z[690]++; if(dbg){print "Z690"}; stopp=ret=1; continue };
    };
      cst="начаться начинаться";
      if ( bw(1,cst) &&
           ba(2,"_suw_v_palate-vp") && s(0,1) )
      { l[i]=omo1; Z[691]++; if(dbg){print "Z691"}; stopp=ret=1; continue };
    # _suw_v_palate-vp:end

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
    { l[i]=omo2; Z[692]++; if(dbg){print "Z692"}; stopp=ret=1; continue };
    if ( (qxs(tn-1,"за на",cst2) ||
          qxs(tn-1,"за на",cst1,cst2) ||
          qxs(tn-1,"за над",cst4) ||
          qxs(tn-1,"за над",cst3,cst4) ||
          qxs(tn-1,"на",cst6) ||
          qxs(tn-1,"на",cst5,cst6) ) &&
           bw(xsn-1,cst) && s(tn-1) )
    { l[i]=omo2; Z[693]++; if(dbg){print "Z693"}; stopp=ret=1; continue };
    if ( bw(tn-1,cst) && s(tn-1) &&
       (qxs(1,"за на",cst2) ||
        qxs(1,"за на",cst1,cst2) ||
        qxs(1,"за над",cst4) ||
        qxs(1,"за над",cst3,cst4) ||
        qxs(1,"на",cst6) ||
        qxs(1,"на",cst5,cst6) ) )
    { l[i]=omo2; Z[694]++; if(dbg){print "Z694"}; stopp=ret=1; continue };
    if ( p(-3) && bw(-2,cst) && tn == -1 && (p(0)||sz_iili(1)) )
    { l[i]=omo2; Z[695]++; if(dbg){print "Z695"}; stopp=ret=1; continue };

    cst="рука";
    cst1="ладонями пальцами";
    if ( bw(tn-1,cst) && s(tn-1,0) && w(1,cst1) )
    { l[i]=omo2; Z[696]++; if(dbg){print "Z696"}; stopp=ret=1; continue };

    cst="дороги хода ходу";
    if ( hwy(1,"то") && qy(1+hyn,"mest_da suw_da isname prq_da") &&
        (qxs(1+qyn+hyn,cst,"нет") ||
         qxs(1+qyn+hyn,"нет",cst) ||
         qxs(1+qyn+hyn,"какими","судьбами") ) && s(0+hyn) )
    { l[i]=omo1; Z[697]++; if(dbg){print "Z697"}; stopp=ret=1; continue };
    if ( qxs(tn-1,cst,"нет") ||
         qxs(tn-1,"нет",cst) ||
         qxs(tn-1,"какими","судьбами") ||
         qxs(tn-1,"ни","ногой") )
    { l[i]=omo1; Z[698]++; if(dbg){print "Z698"}; stopp=ret=1; continue };

    if ( qxs(1,"больше более","ни","ногой")||
         qxs(1,"ни","ногой")||
           w(1,"ни-ни") )
    { l[i]=omo1; Z[699]++; if(dbg){print "Z699"}; stopp=ret=1; continue };
    # _suw_v_sky:start
    if ( ba(tn-1,"_suw_v_sky") && s(tn-1) )
    { l[i]=omo2; Z[700]++; if(dbg){print "Z700"}; stopp=ret=1; continue };
    if ( vvb(tn-5,tn-1) &&
          ba(vvn,"_suw_v_sky") )
    { l[i]=omo2; Z[701]++; if(dbg){print "Z701"}; stopp=ret=1; continue };
    if ( bba(tn-6,tn-2,"_suw_v_sky") &&
         qir(bbn+1,tn-2,"prl_ro prq_ro mcop_ro") &&
           q(tn-1,"suw_ro mest_ro mest_3e isname qast") && s(bbn,tn-1) )
    { l[i]=omo2; Z[702]++; if(dbg){print "Z702"}; stopp=ret=1; continue };
    if ( vvb(tn-5,tn-1) &&
         bba(vvn-6,vvn-1,"_suw_v_sky") &&
         qir(vvn+1,vvn-1,"prl_ro prq_ro mcop_ro") &&
           q(vvn,"suw_ro mest_ro mest_3e isname qast") && s(bbn,vvn-1) )
    { l[i]=omo2; Z[703]++; if(dbg){print "Z703"}; stopp=ret=1; continue };
    if ( ba(tn-3,"_suw_v_sky") &&
     pre_vi(tn-2) &&
          q(tn-1,"suw_vi") && s(tn-3,tn-1) )
    { l[i]=omo2; Z[704]++; if(dbg){print "Z704"}; stopp=ret=1; continue };
    # _suw_v_sky:end

    cst="скользнуть";
    cst1="змеем змейкой";
    cst2="первый";
    cst3="воздух пространство";
    if ( w(tn-2,cst1) &&
        bw(tn-1,cst) && s(tn-2,tn-1) )
    { l[i]=omo1; Z[705]++; if(dbg){print "Z705"}; stopp=ret=1; continue };
    if ( bw(tn-2,cst2) &&
         bw(tn-1,cst) && s(tn-2,tn-1) )
    { l[i]=omo1; Z[706]++; if(dbg){print "Z706"}; stopp=ret=1; continue };
    if ( qb(tn-9,tn-3,"mest_impe suw_odim") &&
         bw(tn-2,cst) &&
          q(tn-1,"nar_napr") && s(qbn,tn-1) )
    { l[i]=omo1; Z[707]++; if(dbg){print "Z707"}; stopp=ret=1; continue };
    if ( qb(tn-7,tn-3,"gl_ed gl_mn") &&
    sz_iili(tn-2) &&
         bw(tn-1,cst) && s(qbn,tn-1) )
    { l[i]=omo1; Z[708]++; if(dbg){print "Z708"}; stopp=ret=1; continue };
    if ( bb(-7,-4,cst) &&
     pre_vi(bbn+1) &&
        qir(bbn+2,tn-2,"prl_vi prq_vi mcop_vi") &&
         bw(tn-1,cst3) && s(bbn,tn-1) )
    { l[i]=omo1; Z[709]++; if(dbg){print "Z709"}; stopp=ret=1; continue };

    cst="затолкать";
    if ( w(tn-3,"тебя меня вас нас") &&
        bw(tn-2,cst) &&
         q(tn-1,"nar_napr") && s(tn-3,tn-1) )
    { l[i]=omo1; Z[710]++; if(dbg){print "Z710"}; stopp=ret=1; continue };

    # _gl_v_sky-iv:start
    # поиск по _gl_v_sky-iv
    if ( vgl(Y["n-_gl_v_sky-iv"],tn-9,tn-1) ) { bb_n=Y["n-_gl_v_sky-iv"];
         # pointesque
         # pointesque

       cst0="шепчущего";
       if ( veq(bb_n,tn-1) && s(tn-2,tn-1) &&
              q(tn-1,"prq_vi") && (q(tn-1,"suw_odedvi suw_odmnvi")||w(tn-1,cst0) ) )
       { bb_n=""; Z[711]++; if(dbg){print "Z711"}; };
       if ( vgl(bb_n,tn-9,tn-1) && s(bb_n,tn-1) &&
            bba(tn+1,-1,"_palate_prl") )
       { bb_n=""; Z[712]++; if(dbg){print "Z712"}; };
       if ( vgl(bb_n,tn-9,tn-1) && s(bb_n,tn-1) && isname(0) )
       { bb_n=qb_n=""; Z[713]++; if(dbg){print "Z713"}; };


       if ( veq(bb_n,tn-1) && s(tn-1) )
       { l[i]=omo2; Z[714]++; if(dbg){print "Z714"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-2) &&
            qir(bb_n+1,tn-2,"prl_vi prq_vi mcop_vi qik_vi qis_vi prl_kred_sr nar_any isname qast_any") &&
              q(tn-1,"suw_vi qast_any") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[715]++; if(dbg){print "Z715"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-3) && s(bb_n,tn-3) &&
            qir(bb_n+1,tn-3,"prl_vi prq_vi mcop_vi qik_vi qis_vi prl_kred_sr nar_any isname qast_any") &&
              q(tn-2,"suw_vi qast_any") && zs(tn-2) && s(tn-1) &&
              q(tn-1,"sz") )
       { l[i]=omo2; Z[716]++; if(dbg){print "Z716"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-3) &&
            qir(bb_n+1,tn-3,"prl_vi prq_vi mest_vi mest_3e prl_kred_sr nar_step isname") &&
              q(tn-2,"suw_vi") &&
              q(tn-1,"suw_ro") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[717]++; if(dbg){print "Z717"}; stopp=ret=1; continue };
       if ( veq(bb_n,tn-4) &&
              q(tn-3,"suw_vi suw_im mest_im mest_vi suw_tv qast isname") &&
              q(tn-2,"suw_vi suw_tv") &&
              q(tn-1,"suw_ro") && s(tn-4,tn-1) && Qf(tn-3,tn-1,"sz_iili pre_any"))
       { l[i]=omo2; Z[718]++; if(dbg){print "Z718"}; stopp=ret=1; continue }; #inspect
       if ( vgl(bb_n,tn-6,tn-2) &&
              q(bb_n+1,"suw_vi suw_edne") &&
            qir(bb_n+2,tn-2,"prl_ro prq_ro mcop_ro qis_ro qik_ro qik_vi suw_ro suw_edne isname") &&
              q(tn-1,"suw_ro suw_edne isname") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[719]++; if(dbg){print "Z719"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-3) &&
              q(bb_n+1,"suw_vi") &&
            qir(bb_n+2,tn-3,"prl_ro prq_ro mcop_ro qis_ro qik_ro suw_ro suw_edne isname") &&
              q(tn-2,"suw_ro isname") &&
              q(tn-1,"mest_ro suw_ro") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[720]++; if(dbg){print "Z720"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-2) &&
            qir(bb_n+1,tn-2,"prl_tv prq_tv mest_tv mcop_tv mest_vi qik_tv qis_tv prl_vi prq_vi mest_3e qik_vi qis_vi suw_vi") &&
              q(tn-1,"suw_tv") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[721]++; if(dbg){print "Z721"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-9,tn-3) &&
            qir(bb_n+1,tn-2,"prl_tv prq_tv mest_tv mest_vi qik_tv qis_tv prl_vi prq_vi mest_3e qik_vi qis_vi suw_tv") &&
              q(tn-1,"suw_vi") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[722]++; if(dbg){print "Z722"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-5) && s(bb_n) &&
              q(bb_n+1,"prl_vi prq_vi") && z(bb_n+1) &&
              q(bb_n+2,"prq_vi") &&
            qir(bb_n+3,tn-3,"mest_tv prl_tv prq_tv mest_3e qik_tv qis_tv") &&
              q(tn-2,"suw_tv") &&
              q(tn-1,"suw_vi") && s(bb_n+2,tn-1) )
       { l[i]=omo2; Z[723]++; if(dbg){print "Z723"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-5) && tz(tn-1) && tz(tn-4) && z(tn-3) && s(2) &&
              q(tn-3,"prl_kred_sr") && q(tn-2,"nar_step") && q(tn-1,"prl_kred_sr") &&
            qir(bbn+1,vvn-1,"prl_vi prq_vi mcop_vi qik_vi qis_vi prl_kred_sr nar_any isname") &&
              q(tn-4,"suw_vi") && s(bb_n,tn-5) )
       { l[i]=omo2; Z[724]++; if(dbg){print "Z724"}; stopp=ret=1; continue };
       if ( veq(bb_n,tn-3) &&
              q(tn-2,"suw_vi suw_im mest_im mest_vi suw_tv mest_tv qast isname") &&
              q(tn-1,"suw_vi suw_tv qast nar_any") && s(tn-3,tn-1) )
       { l[i]=omo2; Z[725]++; if(dbg){print "Z725"}; stopp=ret=1; continue }; #inspect
       if ( veq(bb_n,tn-2) &&
              q(tn-1,"mest_vi mest_tv mest_im mest_3e prl_vi") && s(tn-2,tn-1) )
       { l[i]=omo2; Z[726]++; if(dbg){print "Z726"}; stopp=ret=1; continue };
       if ( veq(bb_n,tn-3) &&
              q(tn-2,"prl_srav prl_kred_sr nar_spos") && Q(tn-2,"pre_vi") &&
              q(tn-1,"suw_vi mest_vi suw_im mest_im mest_3e prl_kred_sr prl_srav isname nar_mest") && s(tn-3,tn-1) )
       { l[i]=omo2; Z[727]++; if(dbg){print "Z727"}; stopp=ret=1; continue };
       if ( veq(bb_n,tn-2) &&
              q(tn-1,"suw_im prl_kred_sr prl_srav isname nar_any qis_vi") && s(tn-2,tn-1) )
       { l[i]=omo2; Z[728]++; if(dbg){print "Z728"}; stopp=ret=1; continue };
    };

    if ( vvb(tn-7,tn-1) && bba(vvn-6,vvn-1,"_gl_v_sky-iv") &&
         qir(bbn+1,vvn-1,"prl_vi prq_vi mcop_vi qik_vi qis_vi prl_kred_sr nar_any isname") &&
           q(vvn,"suw_vi") && s(bbn,vvn-1) )
    { l[i]=omo2; Z[729]++; if(dbg){print "Z729"}; stopp=ret=1; continue };
    cst0="смотреть";
    if ( veq(tn,-1) && vvb(tn-7,tn-1) && bba(vvn-3,vvn,"_gl_v_sky-iv") && !bw(bb_n,cst0) &&
         qir(bbn+1,vvn,"prl_vi prq_vi mcop_vi qik_vi qis_vi prl_kred_sr nar_any isname") && s(bbn,vvn-1) )
    { l[i]=omo2; Z[730]++; if(dbg){print "Z730"}; stopp=ret=1; continue };

    # поиск по pre_vi + _gl_v_sky-iv: qb_n и bb_n
    if ( qb(tn-8,tn-2,"pre_vi") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_v_sky-iv") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-8,tn-3) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi mest_vi mest_3e prq_vi") &&
              q(qb_n+1,"suw_vi mest_vi mcop_vi") &&
            qir(qb_n+2,tn-2,"prl_tv prq_tv mest_tv qik_tv qis_tv") &&
              q(tn-1,"suw_tv") )
       { l[i]=omo2; Z[731]++; if(dbg){print "Z731"}; stopp=ret=1; continue };


       if ( qb(qb_n+1,tn-1,"prq_vi") && ba(qbn,"_gl_v_palate-iv") )
       { qb_n=bb_n=""; l[i]=omo2; Z[732]++; if(dbg){print "Z732"}; };
       if ( vgl(qb_n,tn-8,tn-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi mest_vi mest_3e prq_vi") &&
            qir(qb_n+1,tn-1,"suw_vi suw_ro prl_vi mest_vi prq_vi qis_vi qik_vi") )
       { l[i]=omo2; Z[733]++; if(dbg){print "Z733"}; stopp=ret=1; continue };

    };};

    # поиск по pre_tv + _gl_v_sky-iv: qb_n и bb_n
    if ( qb(tn-8,tn-2,"pre_tv") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_v_sky-iv") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-8,tn-2) && veq(bb_n,qb_n-1) &&
            qir(qb_n+1,tn-2,"prl_tv mest_tv mest_3e prq_tv qis_tv qik_tv") &&
              q(tn-1,"suw_tv mest_tv") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[734]++; if(dbg){print "Z734"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-8,tn-3) && veq(bb_n,qb_n-1) &&
            qir(qb_n+1,tn-3,"prl_tv mest_tv mest_3e prq_tv qis_tv qik_tv") &&
              q(tn-2,"suw_tv mest_tv") &&
              q(tn-1,"suw_vi") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[735]++; if(dbg){print "Z735"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-8,tn-4) && veq(bb_n,qb_n-1) &&
            qir(qb_n+1,tn-4,"prl_tv mest_tv prq_tv qis_tv qik_tv") &&
              q(tn-3,"suw_tv mest_tv") &&
              q(tn-2,"prl_vi mcop_vi prq_vi") &&
              q(tn-1,"suw_vi") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[736]++; if(dbg){print "Z736"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-8,tn-2) && vgl(bb_n,qbn-5,qbn-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi mest_vi mest_3e prq_vi prl_kred_sr") &&
            qir(qb_n+1,tn-1,"prl_tv mest_tv prq_tv qis_tv qik_tv suw_tv isname") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[737]++; if(dbg){print "Z737"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-8,tn-3) && vgl(bb_n,qb_n-5,qb_n-2) &&
            qir(bb_n+1,qb_n-2,"prl_im prl_vi mest_im mest_vi mest_3e prq_im prq_vi prl_kred_sr") &&
              q(qb_n-1,"suw_vi suw_im mest_im mest_vi mest_3e prq_vi prl_kred_sr") &&
            qir(qb_n+1,tn-3,"prl_tv mest_tv prq_tv qis_tv qik_tv") &&
              q(tn-2,"suw_tv mest_tv") &&
              q(tn-1,"suw_vi isname") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[738]++; if(dbg){print "Z738"}; stopp=ret=1; continue };

    };};

    # поиск по pre_ro + _gl_v_sky-iv: qb_n и bb_n
    if ( qb(tn-8,tn-2,"pre_ro") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_v_sky-iv") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-8,tn-2) && vgl(bb_n,qbn-5,qbn-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi mcop_vi prq_vi qis_vi qik_vi qast") &&
            qir(qb_n+1,tn-1,"suw_ro prl_ro mest_ro prq_ro qis_ro qik_ro isname") && s(bb_n,tn-2) && s(tn-1,"[—,]") )
       { l[i]=omo2; Z[739]++; if(dbg){print "Z739"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-8,tn-2) && vgl(bb_n,qb_n-5,qb_n-1) &&
            qir(bb_n+1,qb_n-1,"suw_tv mest_tv") &&
            qir(qb_n+1,tn-2,"prl_ro mest_ro prq_ro qis_ro qik_ro") &&
              q(tn-1,"suw_ro mest_ro") && s(bb_n,tn-1) )
       { l[i]=omo2; Z[740]++; if(dbg){print "Z740"}; stopp=ret=1; continue };

    };};

    # поиск по pre_pr + _gl_v_sky-iv: qb_n и bb_n
    if ( qb(tn-8,tn-2,"pre_pr") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_v_sky-iv") ) { bb_n=bbn;

        if ( vgl(qb_n,tn-8,tn-3) && veq(bb_n,qb_n-3) &&
               q(tn-5,"suw_vi mest_vi mest_3e prq_vi") &&
               q(tn-4,"prq_tv") &&
               q(tn-2,"suw_pr") &&
               q(tn-1,"suw_tv") && s(bb_n,tn-1) )
        { l[i]=omo2; Z[741]++; if(dbg){print "Z741"}; stopp=ret=1; continue };
        if ( vgl(qb_n,tn-8,tn-2) && vgl(bb_n,qb_n-5,qb_n-2) &&
             qir(bb_n+1,qb_n-2,"prl_vi mest_vi prq_vi") &&
               q(qb_n-1,"suw_vi prq_vi mest_vi mest_3e") &&
             qir(qb_n+1,tn-2,"prl_pr mcop_pr prq_pr qis_pr qik_pr mest_3e") &&
               q(tn-1,"suw_pr") && s(bb_n,tn-1) )
        { l[i]=omo2; Z[742]++; if(dbg){print "Z742"}; stopp=ret=1; continue };
        if ( vgl(qb_n,tn-8,tn-3) && veq(bb_n,qb_n-2) &&
               q(qb_n-1,"suw_vi prq_vi mest_vi mest_3e") &&
             qir(qb_n+1,tn-3,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
               q(tn-2,"suw_pr") &&
               q(tn-1,"suw_vi prq_vi mest_vi mest_3e") && s(bb_n,tn-1) )
        { l[i]=omo2; Z[743]++; if(dbg){print "Z743"}; stopp=ret=1; continue };
        if ( vgl(qb_n,tn-8,tn-3) && vgl(bb_n,qb_n-5,qb_n-1) &&
              qy(qb_n-1,"suw_vi prq_vi mest_vi mest_3e") &&
             qir(bb_n+1,qb_n-2,"prl_vi mest_vi prq_vi") &&
             qir(qb_n+1,tn-3,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
               q(tn-2,"suw_pr") &&
               q(tn-1,"suw_ro mest_ro suw_vi mest_vi mest_3e") && s(bb_n,tn-1) )
        { l[i]=omo2; Z[744]++; if(dbg){print "Z744"}; stopp=ret=1; continue };
        if ( vgl(qb_n,tn-8,tn-2) && veq(bb_n,qb_n-1) &&
             qir(qb_n+1,tn-2,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
               q(tn-1,"suw_pr") && s(bb_n,tn-1) )
        { l[i]=omo2; Z[745]++; if(dbg){print "Z745"}; stopp=ret=1; continue };
        if ( vgl(qb_n,tn-8,tn-2) && veq(bb_n,qb_n-3) &&
               q(qb_n-2,"pre_ro") &&
               q(qb_n-1,"suw_ro mest_ro") &&
             qir(qb_n+1,tn-2,"prl_pr mcop_pr prq_pr qis_pr qik_pr") &&
               q(tn-1,"suw_pr") && s(bb_n,tn-1) )
        { l[i]=omo2; Z[746]++; if(dbg){print "Z746"}; stopp=ret=1; continue };
        if ( vgl(qb_n,tn-8,tn-3) && veq(bb_n,qb_n-1) &&
               q(qb_n+1,"suw_pr") &&
             qir(qb_n+2,tn-2,"prl_vi mcop_vi prq_vi qis_vi qik_vi") &&
               q(tn-1,"suw_vi") && s(bb_n,tn-1) )
        { l[i]=omo2; Z[747]++; if(dbg){print "Z747"}; stopp=ret=1; continue };
        if ( vgl(qb_n,tn-8,tn-4) && veq(bb_n,qb_n-1) &&
               q(qb_n+1,"suw_pr") &&
             qir(qb_n+2,tn-3,"prl_vi mcop_vi prq_vi qis_vi qik_vi") &&
               q(tn-2,"suw_vi") &&
               q(tn-1,"suw_ro") && s(bb_n,tn-1) )
        { l[i]=omo2; Z[748]++; if(dbg){print "Z748"}; stopp=ret=1; continue };
    };};

    if ( bfa(1,4,"_gl_v_sky-iv") ) { bf_n=bfn;
       bb_n=v2s(Y["n-_gl_v_palate-iv"]);
       if ( !(vgl(bb_n,tn-5,tn-1) && s(bb_n,tn-1) && Qb(bb_n+1,tn-1,"sz_iili")) &&
              vgl(bf_n,1,4) && s(0,bf_n-1) && Qf(1,bf_n-1,"sz_iili") )
       { l[i]=omo2; Z[749]++; if(dbg){print "Z749"}; stopp=ret=1; continue };

#      if ( vgl(bf_n,1,4) && s(0,bf_n-1) && Qf(1,bf_n-1,"sz_iili") &&
#             q(tn-1,"suw_tv nar_spos") && s(tn-1) )
#      { l[i]=omo2; Z[750]++; if(dbg){print "Z750"}; stopp=ret=1; continue };
    };

    cst1="горло кисти кисть клинок ладони ладонь ладошки ладошку лодыжки лодыжку ноги ногу ножки ножку палец пальцы ремень руки руку стопа стопу талию шеи шею";
    if ( wb(tn-5,tn-1,cst1) && s(tn-1) &&
          q(wbn-1,"narph_any") &&
        veq(Y["n-_gl_v_sky-iv"],xwn-1) && s(xwn-1) )
    { l[i]=omo2; Z[751]++; if(dbg){print "Z751"}; stopp=ret=1; continue };
    # _gl_v_sky-iv:end


    # _v_nebo:start
    cst1="горло кисти кисть клинок ладони ладонь ладошки ладошку лодыжки лодыжку ноги ногу ножки ножку палец пальцы ремень руки руку стопа стопу талию шеи шею";
    if ( ba(1,"_v_nebo") &&
          w(2,cst1) && s(0,1) )
    { l[i]=omo2; Z[752]++; if(dbg){print "Z752"}; stopp=ret=1; continue };

    if ( ba(tn-2,"_v_nebo") &&
          w(tn-1,cst1) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[753]++; if(dbg){print "Z753"}; stopp=ret=1; continue };
    if ( ba(tn-1,"_v_nebo") && z(tn-1) &&
         wb(tn-5,tn-2,cst1) && s(wbn,tn-2) &&
        qir(wbn+1,tn-2,"qast_any nar_any") )
    { l[i]=omo2; Z[754]++; if(dbg){print "Z754"}; stopp=ret=1; continue };
    if ( bba(tn-6,tn-3,"_v_nebo") &&
           w(bbn+1,cst1) &&
         qir(bbn+2,tn-2,"prl_ro mest_ro mest_3e prq_ro") &&
           q(tn-1,"suw_ro suw_edne") && s(tn-3,tn-1) )
    { l[i]=omo2; Z[755]++; if(dbg){print "Z755"}; stopp=ret=1; continue };
    if ( bba(tn-5,tn-2,"_v_nebo") &&
         qir(bbn+1,tn-2,"prl_vi prq_vi mcop_vi nar_mest") &&
           w(tn-1,cst1) && s(bbn,tn-1) )
    { l[i]=omo2; Z[756]++; if(dbg){print "Z756"}; stopp=ret=1; continue };
    if ( ba(tn-4,"_v_nebo") &&
          w(tn-3,cst1) &&
     pre_pr(tn-2) &&
          q(tn-1,"suw_pr mest_pr") && s(tn-4,tn-1) )
    { l[i]=omo2; Z[757]++; if(dbg){print "Z757"}; stopp=ret=1; continue };
    if ( ba(tn-4,"_v_nebo") &&
          q(tn-3,"suw_vi mest_vi isname") &&
     pre_vi(tn-2) &&
          w(tn-1,cst1) && s(tn-4,tn-1) )
    { l[i]=omo2; Z[758]++; if(dbg){print "Z758"}; stopp=ret=1; continue };

    cst2="хватом";
    if ( ba(tn-2,"_v_nebo") &&
          w(tn-1,cst2) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[759]++; if(dbg){print "Z759"}; stopp=ret=1; continue };
    # _v_nebo:end

#   if ( bw(tn-2,"пуля") &&
#        bw(tn-1,"угодить") && s(tn-2,tn-1) )
#   { l[i]=omo2; Z[760]++; if(dbg){print "Z760"}; stopp=ret=1; continue };

    cst="быстрее быстро все и или назад обратно сейчас скорее сначала сперва срочно теперь";
    cst1="прямо сразу";
    if ( w(tn-1,cst) &&
         p(tn-2,",") && p(0) )
    { l[i]=omo1; Z[761]++; if(dbg){print "Z761"}; stopp=ret=1; continue };
    if ( w(tn,cst1) &&
         p(tn-1,",") && p(0) )
    { l[i]=omo1; Z[762]++; if(dbg){print "Z762"}; stopp=ret=1; continue };

    if ( p(-2,",") && veq(tn,-1) && cap(0) && p(0) )
    { l[i]=omo1; Z[763]++; if(dbg){print "Z763"}; stopp=ret=1; continue };

    cst="ввести вводить внедриться войти вползать врезаться всадить вторгнуться входить загнать зайти запихнуть засадить идти лезть пойти поместить попадать попасть \
         пройти проникать проникнуть проскальзывать проскользнуть проходить спрятаться юркнуть";
    cst1="карта ключ ключ-карта ключик код отвертка отмычка скрепка спичка";
    cst2="жалом картой ключ-картой ключиком ключом отверткой отмычкой ремнем скрепкой спичкой";
    cst4="волос голова коготь палец рука стопа";
    if ( bb(tn-6,tn-2,cst) && s(bbn,tn-1) &&
          q(bbn+1,"mest_vi mest_3e") &&
        qsb(bbn-10,bbn-1,",") &&
         bb(sbn-10,sbn,cst1) && s(bbn,sbn-1) )
    { l[i]=omo2; Z[764]++; if(dbg){print "Z764"}; stopp=ret=1; continue };
    if ( bb(tn-4,tn-2,cst1) && s(bbn,tn-1) &&
        qir(bbn+1,tn-2,"nar_any qast_any") &&
         bw(tn-1,cst) )
    { l[i]=omo2; Z[765]++; if(dbg){print "Z765"}; stopp=ret=1; continue };
    if ( bw(tn-3,cst1) && s(bbn+1,tn-1) && sc(bbn,"[,:]") &&
          q(tn-2,"mest_im") &&
         bw(tn-1,cst) )
    { l[i]=omo2; Z[766]++; if(dbg){print "Z766"}; stopp=ret=1; continue };
    if ( bb(tn-4,tn-2,cst4) && s(bbn,tn-1) &&
        qir(bbn+1,tn-2,"nar_any prl_kred_sr qast_any suw_ro isname") &&
         bw(tn-1,cst) &&
     !( qxs(bbn+1,"голова","колонны")||narph_any(bbn)||w(bbn-1,"в на")||q(bbn-1,"deep_pe") ) )
    { l[i]=omo2; Z[767]++; if(dbg){print "Z767"}; stopp=ret=1; continue };
    if ( wb(tn-3,tn-1,cst2) &&
        qir(wbn+1,tn-1,"nar_any qast_any prl_any") && s(wbn,tn-1) )
    { l[i]=omo2; Z[768]++; if(dbg){print "Z768"}; stopp=ret=1; continue };

    if ( bw(tn-1,cst) && s(tn-1,-1) && zs(0) &&
         bf(1,3,cst1) && s(1,bfn-1) &&
        qir(1,bfn-1,"prl_vi mcop_vi prq_vi prl_im mcop_im prq_im") )
    { l[i]=omo2; Z[769]++; if(dbg){print "Z769"}; stopp=ret=1; continue };
    if ( bf(1,3,cst) &&
        bf2(bfn+1,bfn+3,cst1) && s(1,bfN-1) &&
        qir(1,bfn-1,"nar_any") &&
        qir(bfn+1,bfN-1,"prl_vi mcop_vi prq_vi prl_im mcop_im prq_im") )
    { l[i]=omo2; Z[770]++; if(dbg){print "Z770"}; stopp=ret=1; continue };
    if ( bf(1,3,cst1) &&
        qir(1,bfn-1,"prl_vi mcop_vi prq_vi prl_im mcop_im prq_im") &&
         bw(bfn+1,cst) && s(tn,bfn-1) )
    { l[i]=omo2; Z[771]++; if(dbg){print "Z771"}; stopp=ret=1; continue };
    if ( wf(1,5,cst2) &&
        qir(1,wfn-2,"nar_any prl_kred_sr mest_any prl_any mod_bz") &&
         bw(wfn-1,cst) && s(0,wfn-1) )
    { l[i]=omo2; Z[772]++; if(dbg){print "Z772"}; stopp=ret=1; continue };
    if ( bw(tn-1,cst) && sv(0,"\\(") &&
         wf(1,5,cst2) &&
        qir(1,wfn-2,"nar_any prl_kred_sr mest_any prl_any mod_bz") && s(-1,wfn-1) )
    { l[i]=omo2; Z[773]++; if(dbg){print "Z773"}; stopp=ret=1; continue };
    if ( bw(tn-3,"рука палец") && s(tn-3) &&
         bw(tn-2,"дрожать трястись") && z(tn-2) &&
         sz(tn-1) &&
          q(1,"suw_im mest_im prq_im") &&
         bw(2,cst) && s(tn-1,1) )
    { l[i]=omo2; Z[774]++; if(dbg){print "Z774"}; stopp=ret=1; continue };

    cst="попасть";
    if ( ( qxs(tn-1,"а но что только","не")||
           qxs(tn-1,"не") ) && s(tn-1) &&
           vvb(xsn-5,xsn-1) &&
            bw(vvn,cst) )
    { l[i]=omo2; Z[775]++; if(dbg){print "Z775"}; stopp=ret=1; continue };

    cst="втягиваться";
    if ( bw(tn-1,cst) &&
          w(tn+1,"центральный") && s(tn-1) )
    { l[i]=omo2; Z[776]++; if(dbg){print "Z776"}; stopp=ret=1; continue };

    cst="ввести вводить внедриться вползать врезаться всадить вторгнуться входить загнать зайти засадить идти лезть пойти поместить попадать попасть пройти проникать \
         проскальзывать проскользнуть проходить спрятаться юркнуть";
    cst1="войти";
    if ( bba(tn-6,tn-2,"_sky_parts") &&
          sQ(bbn,tn-2,"[….:;!?]") &&
          bw(tn-1,cst) && s(tn-1) )
    { l[i]=omo2; Z[777]++; if(dbg){print "Z777"}; stopp=ret=1; continue };
    if ( bba(tn-6,tn-2,"_sky_parts") &&
           W(bbn+1,"и") && sQ(bbn,tn-2,"[….:;!?]") && Q(0,"isname") &&
          bw(tn-1,cst1) && s(tn-1) )
    { l[i]=omo2; Z[778]++; if(dbg){print "Z778"}; stopp=ret=1; continue };
    if ( bba(tn-6,tn-2,"_sky_parts") &&
          bw(tn-1,"проникнуть просочиться") && s(bbn,tn-1) )
    { l[i]=omo2; Z[779]++; if(dbg){print "Z779"}; stopp=ret=1; continue };

    if ( bba(tn-3,tn-1,"_sky_parts") &&
          se(tn-1," — ") && s(bbn,tn-2) )
    { l[i]=omo2; Z[780]++; if(dbg){print "Z780"}; stopp=ret=1; continue };

    # escape
    cst="булавка камень коготь копье магазин обойма очередь паста пуля рожок язык";
    cst1="выпустить высадить запустить засадить";
    if ( bw(tn-3,cst1) &&
          q(tn-2,"qik_vi prl_vi mest_vi") &&
         bw(tn-1,cst) && s(tn-3,tn-1) )
    { l[i]=omo2; Z[781]++; if(dbg){print "Z781"}; stopp=ret=1; continue };
    if ( bw(tn-2,cst1) &&
         bw(tn-1,cst) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[782]++; if(dbg){print "Z782"}; stopp=ret=1; continue };
    if ( bw(tn-1,cst1) && s(-1) &&
         bw(1,cst) && s(0) )
    { l[i]=omo2; Z[783]++; if(dbg){print "Z783"}; stopp=ret=1; continue };
    if ( bw(tn-1,cst1) &&
          q(1,"mest_vi prl_vi qik_vi") &&
         bw(2,cst) && s(tn-1,1) )
    { l[i]=omo2; Z[784]++; if(dbg){print "Z784"}; stopp=ret=1; continue };
    # escape


    #
    cst="всадить въехать загнать заехать засадить захватить провести";
    cst1="затвор коленка колено кулак локоть нога рука шея";
    if ( bb(tn-5,tn-2,cst) && s(bbn,tn-1) &&
         bb(bbn-1,tn-1,cst1) )
    { l[i]=omo2; Z[785]++; if(dbg){print "Z785"}; stopp=ret=1; continue };

    # поиск по "надо нужно"
    if ( wb(tn-5,tn-1,"надо нужно") ) { wb_n=wbn;

       if ( vgl(wb_n,tn-5,tn-1) &&
            qir(wb_n+1,tn-1,"gl_aux_be mest_da suw_da nar_srav nar_napr") && s(wb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[786]++; if(dbg){print "Z786"}; stopp=ret=1; continue };
       if ( vgl(wb_n,tn-5,tn-1) &&
         pre_pr(wb_n+1) &&
            qir(wb_n+2,tn-2,"prl_pr mest_pr mest_3e prq_pr") &&
              q(tn-1,"suw_pr suw_edne isname") && s(wb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[787]++; if(dbg){print "Z787"}; stopp=ret=1; continue };

    };
    if ( wf(1,5,"надо нужно") ) { wf_n = wfn;

       if ( vgl(wf_n,1,5) &&
            qir(1,wf_n-1,"gl_aux_be mest_da suw_da nar_srav nar_napr mest_vi mest_3e qast_ne") && s(0,wf_n-1) )
       { l[i]=omo1; Z[788]++; if(dbg){print "Z788"}; stopp=ret=1; continue };
       cst="будет было ведь все и не равно тоже";
       if ( vgl(wf_n,1,5) &&
            wir(1,wf_n-1,cst) && s(0,wf_n-1) )
       { l[i]=omo1; Z[789]++; if(dbg){print "Z789"}; stopp=ret=1; continue };
       if ( vgl(wf_n,2,5) &&
              q(1,"suw_da mest_da suw_vi mest_vi mest_3e") &&
            wir(2,wf_n-1,cst) && s(0,wf_n-1) )
       { l[i]=omo1; Z[790]++; if(dbg){print "Z790"}; stopp=ret=1; continue };

    };

    # _gl_v_palate-iv: begin
    # _sky_parts:start - части неба́
    #  escape1
    if ( vgl(Y["n-_gl_v_palate-iv"],tn-5,tn-2) ) { bb_n = Y["n-_gl_v_palate-iv"] };
       if ( vgl(bb_n,tn-5,tn-2) && s(bb_n,tn-1) &&
            qir(bb_n+1,tn-2,"prl_any prq_any mest_any") &&
             ba(tn-1,"_sky_parts") )
       { l[i]=omo2; Z[791]++; if(dbg){print "Z791"}; stopp=ret=1; continue };
       if ( veq(Y["n-_gl_v_palate-iv"],tn-4) &&
             ba(tn-3,"_sky_parts") &&
              q(tn-2,"suw_ro") &&
              q(tn-1,"nar_napr") && s(tn-4,tn-1) )
       { l[i]=omo2; Z[792]++; if(dbg){print "Z792"}; stopp=ret=1; continue };

    #
    cst="лезть попадать попасть";
    if ( bb(tn-5,tn-2,cst) &&
        qir(bbn+1,tn-2,"qast nar_any") &&
        (ba(tn-1,"_sky_parts")||w(tn-1,"им")) && s(bbn,tn-1) )
    { l[i]=omo2; Z[793]++; if(dbg){print "Z793"}; stopp=ret=1; continue };
    if ( bb(tn-6,tn-3,cst) &&
        qir(bbn+1,tn-3,"qast nar_any") &&
         ba(tn-2,"_sky_parts") &&
          q(tn-1,"suw_ro") && s(bbn,tn-1) )
    { l[i]=omo2; Z[794]++; if(dbg){print "Z794"}; stopp=ret=1; continue };
    # _sky_parts:end

    # _gl_v_palate-iv: escape2
    cst="попадать попасть";
    if ( bw(tn-4,cst) &&
          q(tn-3,"suw_im mest_im isname") &&
     pre_da(tn-2) &&
          q(tn-1,"mest_da suw_da isname") && s(tn-4,tn-1) )
    { l[i]=omo1; Z[795]++; if(dbg){print "Z795"}; stopp=ret=1; continue };
    cst="вынести открывать снести";
    cst1="выстрелом пинком пулей ударом";
    if ( bw(tn-3,cst) &&
          q(tn-2,"nar_any mest_vi mest_3e suw_vi") &&
          w(tn-1,cst1) && s(tn-3,tn-2) && zs(tn-1) )
    { l[i]=omo2; Z[796]++; if(dbg){print "Z796"}; stopp=ret=1; continue };
    if ( bw(tn-4,cst) &&
          q(tn-3,"nar_any mest_vi mest_3e suw_vi") &&
          q(tn-2,"prl_tv mest_tv mest_3e prq_tv") &&
          w(tn-1,cst1) && s(tn-4,tn-2) && zs(tn-1) )
    { l[i]=omo2; Z[797]++; if(dbg){print "Z797"}; stopp=ret=1; continue };
    cst="впустить пропустить";
    if ( bw(tn-3,cst) &&
          q(tn-2,"prl_vi prl_im mest_vi mest_im mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") &&
          q(tn-1,"suw_vi suw_im mest_vi suw_edne mest_im mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") &&
          s(tn-3,tn-2) && zs(tn-1) && z(0) &&
         ba(1,"_sky_pe") &&
         ba(2,"_sky_parts") && s(1) )
    { l[i]=omo2; Z[798]++; if(dbg){print "Z798"}; stopp=ret=1; continue };

    cst="айда бегом брысь верхом домой надо надолго немедленно нужно обратно пешком ползком пора сюда";
    if ( w(tn-1,cst) &&
       (zs(tn-1)||sc(tn-1,"—")) )
    { l[i]=omo1; Z[799]++; if(dbg){print "Z799"}; stopp=ret=1; continue };
    if ( w(1,cst) && s(0) )
    { l[i]=omo1; Z[800]++; if(dbg){print "Z800"}; stopp=ret=1; continue };


    # _gl_v_palate-iv: main
    # поиск по _gl_v_palate-iv
    if ( vgl(Y["n-_gl_v_palate-iv"],tn-8,tn-1) ) { bb_n = Y["n-_gl_v_palate-iv"];

#      if ( vgl(bb_n,tn-8,tn-1) && s(bb_n,tn-1) && prq_any(bb_n) && ba(bb_n,"X_prq_gl_v_palate-iv") )
#      { bb_n=""; Z[801]++; if(dbg){print "Z801"}; };
#      if ( vgl(bb_n,tn-8,tn-1) && s(bb_n,tn-1) && z(0) && veq(Y["iwrd_form"],"ediv") && qm(1,"prq_edmuim","_sky_pe") )
#      { bb_n=""; Z[802]++; if(dbg){print "Z802"}; };

       if ( vgl(bb_n,tn-8,tn-3) &&
              q(bb_n+1,"prl_vi mest_vi mest_3e prq_vi qik_vi digits") &&
              q(bb_n+2,"suw_vi mest_vi mest_3e") &&
            qir(bb_n+3,tn-1,"prl_kred_sr nar_any qast") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[803]++; if(dbg){print "Z803"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-2) &&
            qir(bb_n+1,tn-2,"prl_im prq_im mest_im") &&
              q(tn-1,"suw_im name_im_sy") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[804]++; if(dbg){print "Z804"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-3) &&
            qir(bb_n+1,tn-3,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi") &&
              q(tn-2,"suw_vi mest_vi mest_3e suw_mnsq prq_vi qis_vi isname") &&
              q(tn-1,"nar_any") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[805]++; if(dbg){print "Z805"}; stopp=ret=1; continue };
       if ( vvb(tn-5,tn-1) && vgl(bb_n,tn-8,tn-2) &&
              q(bb_n+1,"prq_vi suw_vi mest_vi mest_3e") &&
            qir(bb_n+2,vvn,"suw_vi mest_vi mest_3e suw_mnsq qis_vi isname") && s(bb_n,vvn-1) )
       { l[i]=omo1; Z[806]++; if(dbg){print "Z806"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-2) &&
              q(bb_n+1,"prq_vi suw_vi mest_vi mest_3e") &&
            qir(bb_n+2,tn-1,"suw_vi mest_vi mest_3e suw_mnsq qis_vi isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[807]++; if(dbg){print "Z807"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-2) &&
            qiz(bb_n+1,tn-2,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any gl_in qast_any","mest_da") &&
              q(tn-1,"suw_vi mest_vi mest_3e suw_mnsq qis_vi qast_any name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[808]++; if(dbg){print "Z808"}; stopp=ret=1; continue };
       if ( vvb(tn-5,tn-1) && !bfa(vvn+1,tn-1,"_gl_v_sky-iv") &&
            bba(vvn-6,vvn,"_gl_v_palate-iv") &&
            qir(bb_n+1,vvn-1,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any gl_in qast") &&
              q(vvn-1,"suw_vi mest_vi mest_3e suw_mnsq qis_vi qast name_vi_sy isname") && s(bbn,vvn-1) )
       { l[i]=omo1; Z[809]++; if(dbg){print "Z809"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-2) &&
            qia(bb_n+1,tn-2,"qast","mest_vi prq_vi suw_vi prl_im mest_3e qast_any nar_any name_vi_sy isname") &&
              q(tn-1,"suw_im suw_edne mest_im name_vi_sy isname qast prl_vi mest_vi") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[810]++; if(dbg){print "Z810"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-2) &&
              q(bb_n+1,"suw_im suw_edne mest_im name_vi_sy isname qast_any prl_vi mest_vi") &&
            qir(bb_n+2,tn-1,"mest_vi prq_vi suw_vi prl_im mest_3e qast_any nar_any name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[811]++; if(dbg){print "Z811"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-3) &&
            qir(bb_n+1,tn-3,"mest_vi prq_vi suw_vi mest_3e name_vi_sy isname nar_any qast") &&
              q(tn-2,"suw_im suw_edne mest_im name_vi_sy isname") &&
              q(tn-1,"nar_any") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[812]++; if(dbg){print "Z812"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-2) &&
              q(bb_n+1,"suw_vi suw_edne isname nar_any") &&
            qir(bb_n+2,tn-1,"suw_ro prq_ro suw_edne isname nar_any") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[813]++; if(dbg){print "Z813"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-2) &&
            qir(bb_n+1,tn-2,"prl_tv mest_tv mest_3e suw_tv prq_tv gl_in prl_kred_sr nar_any qast name_tv_sy isname") &&
              q(tn-1,"suw_tv mest_tv prq_tv prl_tv suw_edne mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[814]++; if(dbg){print "Z814"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-2) &&
              q(bb_n+1,"suw_tv mest_tv prq_tv prl_tv suw_edne mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") &&
            qir(bb_n+2,tn-2,"prl_vi mest_vi mest_3e suw_vi prq_vi gl_in prl_kred_sr nar_any qast name_tv_sy isname") &&
              q(tn-1,"suw_vi mest_vi mest_3e name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[815]++; if(dbg){print "Z815"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-2) &&
              q(bb_n+1,"suw_vi mest_vi mest_3e name_vi_sy isname") &&
            qir(bb_n+2,tn-2,"prl_tv mest_tv mest_3e gl_in prl_kred_sr nar_any qast name_tv_sy isname") &&
              q(tn-1,"suw_tv mest_tv prq_tv prl_tv suw_edne mest_3e gl_in prl_kred_sr nar_any qast name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[816]++; if(dbg){print "Z816"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-2) &&
            qir(bb_n+1,tn-2,"prl_vi prq_vi mest_vi mest_3e") &&
              q(tn-1,"suw_im suw_edne mest_vi mest_im mest_3e name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[817]++; if(dbg){print "Z817"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-2) &&
            qir(bb_n+1,tn-2,"prl_da mest_da prq_da gl_in nar_any qast_any") &&
              q(tn-1,"mest_da suw_da prq_da suw_edne isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[818]++; if(dbg){print "Z818"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-2) &&
              q(bb_n+1,"mest_da suw_da suw_edne isname") &&
            qir(bb_n+2,tn-2,"prl_vi mest_vi prq_vi nar_any qast_any") &&
              q(tn-1,"suw_vi suw_edne mest_vi mest_3e nar_napr") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[819]++; if(dbg){print "Z819"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-2) &&
            qir(bb_n+1,tn-3,"prl_vi mest_vi prq_vi nar_any qast_any") &&
              q(tn-2,"suw_vi suw_edne mest_vi mest_3e nar_napr") &&
              q(tn-1,"mest_da suw_da suw_edne isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[820]++; if(dbg){print "Z820"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-6,tn-2) &&
            qir(bb_n+1,tn-2,"prl_ro mest_ro prq_ro nar_any qast_any") &&
              q(tn-1,"mest_ro suw_ro prq_ro suw_edne nar_any isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[821]++; if(dbg){print "Z821"}; stopp=ret=1; continue };

       if ( vgl(bb_n,tn-6,tn-2) &&
              q(bb_n+1,"suw_vi suw_edne mest_vi mest_3e") &&
            qir(bb_n+2,tn-1,"prl_ro prq_ro mest_ro suw_mnsq mest_3e suw_ro prl_kred_sr") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[822]++; if(dbg){print "Z822"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-3) &&
            qir(bb_n+1,tn-3,"prl_vi prq_vi mest_vi mest_3e") &&
              q(tn-2,"suw_vi suw_edne") &&
              q(tn-1,"suw_ro prl_kred_sr") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[823]++; if(dbg){print "Z823"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-4) &&
            qir(bb_n+1,tn-4,"prl_vi prq_vi mest_vi mest_3e") &&
              q(tn-3,"suw_vi suw_edne") &&
              q(tn-2,"prl_ro mest_ro mest_3e prq_ro") &&
              q(tn-1,"suw_ro prl_kred_sr") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[824]++; if(dbg){print "Z824"}; stopp=ret=1; continue };

       if ( vgl(bb_n,tn-6,tn-3) &&
              q(bb_n+1,"suw_vi suw_edne mest_vi mest_3e") &&
            qir(bb_n+2,tn-2,"prl_da prq_da mest_da mest_3e") &&
              q(tn-1,"suw_da isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[825]++; if(dbg){print "Z825"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-4,tn-2) &&
            qir(bb_n+1,tn-1,"gl_in gl_aux_be qast_any") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[826]++; if(dbg){print "Z826"}; stopp=ret=1; continue };
       if ( veq(bb_n,tn-1) && zs(tn-1) )
       { l[i]=omo1; Z[827]++; if(dbg){print "Z827"}; stopp=ret=1; continue };
       if ( vvb(tn-5,tn-1) && veq(bb_n,vvn) )
       { l[i]=omo1; Z[828]++; if(dbg){print "Z828"}; stopp=ret=1; continue };
    };

       if (  bfa(tn-8,tn-1,"_gl_v_palate-iv") ) { bf_n=bfn;

       if ( vgl(bf_n,tn-8,tn-2) && vv(bf_n,bf_n+7) &&
            qir(vvn+1,tn-2,"prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any gl_in qast sz") &&
              q(tn-1,"suw_vi mest_vi mest_3e suw_mnsq qis_vi qast name_vi_sy isname") && s(vvn+1,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[829]++; if(dbg){print "Z829"}; stopp=ret=1; continue };

    };

    # поиск по sz_iili + _gl_v_palate-iv
    if ( qb(tn-6,tn-2,"sz_iili") ) { qb_n=qbn; if ( bba(qb_n-6,qb_n-2,"_gl_v_palate-iv") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-6,tn-2) && vgl(bb_n,qb_n-6,qb_n-2) &&
              s(bb_n,qb_n-3) && zs(qb_n-2) && s(qb_n-1,tn-2) && zs(tn-1) &&
            qir(bb_n+1,qb_n-1,"prl_vi mest_vi suw_vi suw_edne mest_3e prq_vi qast_any qis_vi qik_vi name_vi_sy isname") &&
            qir(qb_n+1,tn-1,"prl_vi mest_vi suw_vi suw_edne mest_3e qast_any nar_any qis_vi qik_vi prq_vi name_vi_sy isname") )
       { l[i]=omo1; Z[830]++; if(dbg){print "Z830"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-6,tn-2) && vgl(bb_n,qb_n-6,qb_n-2) &&
              q(bb_n+1,"nar_any gl_in") &&
            qir(bb_n+2,qb_n-2,"prl_vi mest_vi suw_vi suw_edne mest_3e prq_vi qis_vi qik_vi name_vi_sy isname") &&
            qir(qb_n+1,tn-2,"prl_vi mest_vi suw_vi suw_edne mest_3e qis_vi qik_vi prq_vi name_vi_sy isname") &&
              q(qb_n-1,"suw_vi mest_vi suw_edne mest_3e prq_vi qast name_vi_sy isname") &&
              q(tn-1,"suw_vi mest_vi suw_edne mest_3e prq_vi qast name_vi_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[831]++; if(dbg){print "Z831"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-6,tn-2) && vgl(bb_n,qb_n-6,qb_n-2) &&
            qir(bb_n+1,qb_n-1,"prl_im mest_im suw_im suw_edne mest_3e prq_im qis_im qik_im qast_any name_im_sy isname") &&
            qir(qb_n+1,tn-1,"prl_im mest_im suw_im suw_edne mest_3e prq_im nar_any qis_im qik_im name_im_sy isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[832]++; if(dbg){print "Z832"}; stopp=ret=1; continue };

    };};


    # поиск по pre_da + _gl_v_palate-iv: qb_n и bb_n
    if ( qb(tn-6,tn-2,"pre_da") ) { qb_n=qbn; if ( bba(qb_n-9,qb_n-1,"_gl_v_palate-iv") ) { bb_n=bbn;

       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-5,tn-2) &&
            qir(qb_n+1,qb_n-1,"nar_any prl_kred_sr qast prl_vi mest_vi prq_vi suw_vi mest_3e suw_im suw_edne mest_im isname") &&
            qir(qb_n+1,tn-2,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
              q(tn-1,"mest_da suw_da suw_edne prq_da isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[833]++; if(dbg){print "Z833"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-6,qb_n-1) && vgl(qb_n,tn-6,tn-3) &&
            qir(qb_n+1,qb_n-1,"nar_any prl_kred_sr qast prl_vi mest_vi prq_vi suw_vi mest_3e suw_im suw_edne mest_im isname") &&
            qir(qb_n+1,tn-3,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
              q(tn-2,"mest_da suw_da suw_edne prq_da isname") &&
              q(tn-1,"nar_any") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[834]++; if(dbg){print "Z834"}; stopp=ret=1; continue };

  };};

    # поиск по pre_tv + _gl_v_palate-iv: qb_n и bb_n
    if ( qb(tn-7,tn-2,"pre_tv") ) { qb_n=qbn;
      if ( bba(qb_n-9,qb_n-1,"_gl_v_palate-iv") ) { bb_n=bbn;

       if ( vgl(bb_n,qb_n-6,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi qik_vi nar_any prl_kred_sr isname qast_any") &&
            qir(qb_n+1,tn-2,"prl_tv mest_tv suw_tv mest_3e prq_tv prl_kred_sr qik_vi qik_tv nar_any isname") &&
              q(tn-1,"mest_tv suw_tv prq_tv suw_edne isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[835]++; if(dbg){print "Z835"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-6,tn-2) &&
            vvb(qb_n-5,qb_n-1) &&
            bba(vvn-5,vvn-1,"_gl_v_palate-iv") && s(bbn+1,vvn-1) &&
            qir(bbn+1,vvn,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            qir(qb_n+1,tn-2,"prl_tv mest_tv suw_tv mest_3e prq_tv prl_kred_sr qik_tv nar_any isname") &&
              q(tn-1,"mest_tv suw_tv prq_tv suw_edne isname") && s(qb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[836]++; if(dbg){print "Z836"}; stopp=ret=1; continue };
        if ( vgl(bb_n,qb_n-7,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
               q(bb_n+1,"pre_tv") &&
             qir(bb_n+2,qb_n-1,"suw_tv mest_tv prl_tv mest_3e qis_tv nar_any prl_kred_sr isname qast_any") &&
             qir(qb_n+1,tn-2,"prl_tv mest_tv suw_tv mest_3e prq_tv prl_kred_sr qik_tv nar_any isname") &&
               q(tn-1,"mest_tv suw_tv prq_tv suw_edne isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[837]++; if(dbg){print "Z837"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-6,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            qir(qb_n+1,tn-3,"prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
              q(tn-2,"mest_tv suw_tv suw_edne isname") &&
              q(tn-1,"suw_ro suw_edne") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[838]++; if(dbg){print "Z838"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-6,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi suw_im mest_im mest_da prl_vi suw_da mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
              q(qb_n+1,"mest_tv suw_tv suw_edne isname") &&
            qir(qb_n+2,tn-2,"prl_ro mest_ro mest_3e prq_ro") &&
              q(tn-1,"suw_ro suw_edne") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[839]++; if(dbg){print "Z839"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-6,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            qir(qb_n+1,tn-3,"prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
              q(tn-2,"mest_tv suw_tv suw_edne isname") &&
              q(tn-1,"nar_any prl_kred_sr") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[840]++; if(dbg){print "Z840"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-9,qb_n-1) && vgl(qb_n,tn-7,tn-2) &&
             qb(qb_n+1,tn-1,"sz_iili") && s(bb_n,qbn-3) && zs(qbn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            qir(qb_n+1,qbn-1,"suw_tv suw_edne isname prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
            qir(qbn+1,tn-1,"suw_tv suw_edne isname prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") && s(qbn-1,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[841]++; if(dbg){print "Z841"}; stopp=ret=1; continue };

    };};

    # поиск по pre_pr + _gl_v_palate-iv: qb_n и bb_n
    if ( qb(tn-7,tn-2,"pre_pr") ) { qb_n=qbn; if ( bba(qb_n-6,qb_n-1,"_gl_v_palate-iv") ) { bb_n=bbn;

       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
              q(qb_n+1,"suw_pr") &&
            qir(qb_n+2,tn-2,"prl_vi prq_vi mest_vi mest_3e qik_vi") &&
              q(tn-1,"suw_vi suw_edne") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[842]++; if(dbg){print "Z842"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
             qf(qb_n+1,tn-1,"sz_iili") &&
            qir(qb_n+1,qfn-2,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
            qir(qfn+1,tn-2,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
              q(qfn-1,"suw_pr") &&
              q(tn-1,"suw_pr") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[843]++; if(dbg){print "Z843"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
              q(qb_n+1,"suw_pr suw_edne") &&
             qf(qb_n+3,tn-1,"sz_iili") &&
            qir(qb_n+2,qfn-2,"prl_ro prq_ro mest_ro mest_3e qik_ro") &&
            qir(qfn+1,tn-2,"prl_ro prq_ro mest_ro mest_3e qik_ro") &&
              q(qfn-1,"suw_ro") &&
              q(tn-1,"suw_ro") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[844]++; if(dbg){print "Z844"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            qir(qb_n+1,tn-2,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
              q(tn-1,"mest_pr suw_pr suw_edne") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[845]++; if(dbg){print "Z845"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-6,tn-3) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            qir(qb_n+1,tn-3,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
              q(tn-2,"suw_pr suw_edne") &&
              q(tn-1,"suw_ro suw_edne nar_any") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[846]++; if(dbg){print "Z846"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
            qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
              q(qb_n+1,"suw_pr suw_edne") &&
            qir(qb_n+2,tn-1,"suw_ro suw_edne nar_any prl_ro prq_ro") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[847]++; if(dbg){print "Z847"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-6,tn-2) &&
         pre_tv(bb_n+1) &&
            qir(qb_n+2,qb_n-2,"prl_tv mest_tv mest_3e qik_tv prq_tv prl_kred_sr nar_any") &&
              q(qb_n-1,"mest_tv suw_tv suw_edne isname") &&
            qir(qb_n+1,tn-2,"prl_pr prq_pr mest_pr mest_3e qik_pr") &&
              q(tn-1,"mest_pr suw_pr suw_edne isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[848]++; if(dbg){print "Z848"}; stopp=ret=1; continue };

    };};

    # поиск по pre_vi + _gl_v_palate-iv: qb_n и bb_n
    if ( qb(tn-9,tn-2,"pre_vi") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_v_palate-iv") ) { bb_n=bbn;

       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-9,tn-2) && hwy(bb_n+1,"ка") &&
            qir(bb_n+1+hyn,qb_n-1,"nar_any suw_im suw_ro suw_vi prl_vi mest_vi prq_vi mest_3e mest_impe suw_edne suw_mnsq isname") &&
            qir(qb_n+1+hyn,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") && s(bb_n+hyn,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[849]++; if(dbg){print "Z849"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-9,tn-2) &&
             qb(bb_n+1,qb_n-1,"pre_da") &&
            qir(bb_n+1,qbn-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            qir(qbn+1,qb_n-1,"prl_da mest_da mest_3e prq_da prl_kred_sr nar_any") &&
            qir(qb_n+1,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[850]++; if(dbg){print "Z850"}; stopp=ret=1; continue };
       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-9,tn-2) &&
             qb(bb_n+1,qb_n-1,"pre_ro") &&
            qir(bb_n+1,qbn-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
            qir(qbn+1,qb_n-1,"suw_ro prl_ro mest_ro mest_3e prq_ro prl_kred_sr nar_any isname") &&
            qir(qb_n+1,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") && s(bb_n,tn-2) && zs(tn-1) )
       { l[i]=omo1; Z[851]++; if(dbg){print "Z851"}; stopp=ret=1; continue };

       if ( vgl(bb_n,qb_n-7,qb_n-1) && vgl(qb_n,tn-9,tn-2) && qb(qb_n+1,tn-1,"sz_iili") ) { qf_n=qbn; qsf(bb_n,qf_n,","); wf_n=sfn;

          if ( vgl(bb_n,qb_n-7,qb_n-1) && vgl(qb_n,tn-9,tn-2) &&
               qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname pre_s mest_tv suw_tv qast_any") &&
               qir(qb_n+1,qf_n-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") &&
               qir(qf_n+1,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") && s(bb_n,tn-2) && zs(tn-1) )
          { l[i]=omo1; Z[852]++; if(dbg){print "Z852"}; stopp=ret=1; continue };
          if ( vgl(bb_n,qb_n-7,qb_n-1) && vgl(qb_n,tn-9,tn-2) && vgl(wf_n,qb_n,qf_n) &&
               qir(bb_n+1,qb_n-1,"mest_vi suw_vi mest_da suw_da mest_im suw_im prl_vi prq_vi mest_3e qis_vi nar_any prl_kred_sr isname qast_any") &&
               qir(qb_n+1,wf_n,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") &&
               qir(wf_n+1,qf_n-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") &&
               qir(qf_n+1,tn-1,"suw_vi suw_im suw_ro suw_mnsq prl_vi mest_vi mest_3e prq_vi qik_vi qis_vi nar_any prl_kred_sr isname") && s(bb_n,wf_n-1) && s(wf_n+1,tn-2) && zs(tn-1) )
          { l[i]=omo1; Z[853]++; if(dbg){print "Z853"}; stopp=ret=1; continue };

      };};};

    # поиск по pre_ro + _gl_v_palate-iv: qb_n и bb_n
    if ( qb(tn-7,tn-2,"pre_ro") ) { qb_n=qbn;
      if ( bba(qb_n-6,qb_n-1,"_gl_v_palate-iv") ) { bb_n=bbn;
        if ( qb(bb_n+1,qb_n-1,"pre_ro") ) { qb_n=qbn };

        if ( vgl(bb_n,qb_n-6,qb_n-1) && vgl(qb_n,tn-7,tn-2) && s(bb_n,tn-2) && zs(tn-1) &&
             qir(bb_n+1,qb_n-1,"mest_vi suw_vi prl_vi prq_vi mest_3e isname nar_any qast_any") &&
             qir(qb_n+1,tn-1,"prl_ro mest_ro suw_ro suw_edne prq_ro nar_any qast isname pre_s mest_tv") )
        { l[i]=omo1; Z[854]++; if(dbg){print "Z854"}; stopp=ret=1; continue };
        if ( vgl(bb_n,qb_n-6,qb_n-1) && vgl(qb_n,tn-7,tn-2) && s(bb_n,tn-2) && zs(tn-1) &&
             qir(bb_n+1,qb_n-1,"mest_im suw_im prl_im prq_im mest_3e isname nar_any qast") &&
             qir(qb_n+1,tn-1,"prl_ro mest_ro suw_ro suw_edne prq_ro nar_any qast isname") )
        { l[i]=omo1; Z[855]++; if(dbg){print "Z855"}; stopp=ret=1; continue };
       };

    };
    # фразы-предлоги

    if ( vgl(Y["n-_gl_v_palate-iv"],tn-9,tn-1) ) { bb_n = Y["n-_gl_v_palate-iv"];
        if ( preph_ro(tn-2) &&
                  vgl(bb_n,xwn-4,xwn-1) &&
                  qir(bb_n+1,xwn-1,"mest_vi suw_vi prl_vi prq_vi mest_3e isname nar_any qast pre_any") &&
                    q(tn-1,"mest_ro suw_ro suw_edne isname") && s(bb_n,tn-1) )
        { l[i]=omo1; Z[856]++; if(dbg){print "Z856"}; stopp=ret=1; continue };

        if ( narph_any(tn-1) &&
                   veq(bb_n,xwn-1) && s(xnw-1,tn-1) )
        { l[i]=omo1; Z[857]++; if(dbg){print "Z857"}; stopp=ret=1; continue };
        if ( narph_any(tn-2) &&
                   veq(bb_n,xwn-1) &&
                     q(tn-1,"suw_vi suw_im mest_vi mest_im mest_3e isname nar_any") && s(xnw-1,tn-1) )
        { l[i]=omo1; Z[858]++; if(dbg){print "Z858"}; stopp=ret=1; continue };
        if ( narph_any(tn-1) &&
                   veq(bb_n,xwn-2) &&
                     q(xwn-1,"suw_vi mest_vi mest_3e isname nar_any") && s(xnw-2,tn-1) )
        { l[i]=omo1; Z[859]++; if(dbg){print "Z859"}; stopp=ret=1; continue };
    };

    if ( preph_ro(1) && zs(0) &&
                q(xwn+1,"isname") && s(xwn) )
    { l[i]=omo1; Z[860]++; if(dbg){print "Z860"}; stopp=ret=1; continue };

    if ( pre_tv(1) &&
              q(2,"suw_tv") &&
              q(3,"nar_spos") &&
             ba(4,"_gl_v_palate-iv") && s(0,3) )
    { l[i]=omo1; Z[861]++; if(dbg){print "Z861"}; stopp=ret=1; continue };

    if ( bfa(1,6,"_gl_v_palate-iv") ) { bf_n=bfn;

       cst="ключ ключ-карта";
       if ( vgl(bf_n,1,6) &&
             bf(bf_n+1,bf_n+3,cst) &&
            qir(bf_n+1,bfn-1,"prl_vi mest_vi mest_3e prq_vi") && s(0,bfn) )
       { bf_n=""; Z[862]++; if(dbg){print "Z862"}; };

       if ( vgl(bf_n,1,6) && s(0,bf_n-1) && Qf(1,bf_n,"sz_iili") )
       { l[i]=omo1; Z[863]++; if(dbg){print "Z863"}; stopp=ret=1; continue };
       if ( vgl(bf_n,1,6) && s(0,bf_n-1) &&
            sos(tn-9,tn-1) &&
          !(vgl(Y["n-_gl_v_sky-iv"],son,tn-1)||bba(son,tn-1,"_sky_parts") ) &&
             (w(bf_n-1,"и")||
            qxs(bf_n-2,"и","не") ) )
       { l[i]=omo1; Z[864]++; if(dbg){print "Z864"}; stopp=ret=1; continue };

    };

    if ( q(1,"narph_any") &&
       bfa(xwn+1,xwn+3,"_gl_v_palate-iv") && s(0,bfn-1) &&
       qir(xwn+1,bfn-1,"qast_any nar_any") )
    { l[i]=omo1; Z[865]++; if(dbg){print "Z865"}; stopp=ret=1; continue };
    if ( q(1,"suw_im mest_im isname") &&
         q(2,"narph_any") &&
       bfa(xwn+1,xwn+3,"_gl_v_palate-iv") && s(0,bfn-1) &&
       qir(xwn+1,bfn-1,"qast_any nar_any") )
    { l[i]=omo1; Z[866]++; if(dbg){print "Z866"}; stopp=ret=1; continue };


    # _gl_v_palate-iv: end

    if ( w(1,"к ко") && zs(0) &&
         q(2,"suw_odedda suw_odmnda isname mest_da") && s(1) )
    { l[i]=omo1; Z[867]++; if(dbg){print "Z867"}; stopp=ret=1; continue };
    if ( z(0) &&
         q(1,"sz") &&
         w(2,"к ко") &&
         q(3,"suw_odedda suw_odmnda isname mest_da") && s(1,2) )
    { l[i]=omo1; Z[868]++; if(dbg){print "Z868"}; stopp=ret=1; continue };

    cst="города деревни замка замков окрестностей";
    if ( w(tn-2,"из") &&
        (w(tn-1,cst)||q(tn-1,"isname")) && s(tn-2,tn-1) &&
      !(bb(tn-6,tn-3,"выстрелить выпалить прицелиться") && s(bbn,tn-3)) )
    { l[i]=omo1; Z[869]++; if(dbg){print "Z869"}; stopp=ret=1; continue };

    if ( q(tn-2,"mest_da suw_da") &&
         q(tn-1,"mod_ed mod_mn mod_bz") && s(tn-2,tn-1) )
    { l[i]=omo1; Z[870]++; if(dbg){print "Z870"}; stopp=ret=1; continue };

    if ( w(tn-2,"к ко") &&
         q(tn-1,"mest_da suw_da isname") && s(tn-2) && zs(tn-1) )
    { l[i]=omo1; Z[871]++; if(dbg){print "Z871"}; stopp=ret=1; continue };

    # prl как часть сказуемого
    cst="вхожий";
    if ( bw(tn-1,cst) && s(tn-1) )
    { l[i]=omo1; Z[872]++; if(dbg){print "Z872"}; stopp=ret=1; continue };
    if ( bw(1,cst) && s(0) )
    { l[i]=omo1; Z[873]++; if(dbg){print "Z873"}; stopp=ret=1; continue };
    if ( w(1,"не") &&
        bw(2,cst) && s(0,1) )
    { l[i]=omo1; Z[874]++; if(dbg){print "Z874"}; stopp=ret=1; continue };
    if ( q(1,"mest_im suw_im isname prl_kred_sr") &&
        bw(2,cst) && s(0,1) )
    { l[i]=omo1; Z[875]++; if(dbg){print "Z875"}; stopp=ret=1; continue };
    if ( q(1,"mest_im suw_im isname") &&
         w(2,"не") &&
        bw(3,cst) && s(0,2) )
    { l[i]=omo1; Z[876]++; if(dbg){print "Z876"}; stopp=ret=1; continue };
    #
    cst="ваш мой наш свой сей тот";
    if ( w(-1,cst) )
    { l[i]=omo1; Z[877]++; if(dbg){print "Z877"}; stopp=ret=1; continue };

    # p(-2) "в небо" p(0)
    if ( veq(tn,-1) && s(-1) ) {
      cst2="крюк лапу стык";
      if ( s(-2,"[,—]") && p(0) &&
       ( qxw(-2,"в",cst2)||
         qxw(-2,"под","голову")||
           w(-2,"намертво крепко напуском") ) )
      { l[i]=omo2; Z[878]++; if(dbg){print "Z878"}; stopp=ret=1; continue };
      if ( p(-2) && p(0) )
      { l[i]=omo1; Z[879]++; if(dbg){print "Z879"}; stopp=ret=1; continue };
    };

  Y["tn_ok_v"]="";
  }; # tn_ok=1 << в небо
break}; Y["TN_v_nebo_f"]=1; return ret }

function TN_na_nebo_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) { stopp=v2s(Y["TN_na_nebo_f"]);
   while ( !stopp ) {

   if ( vex(Y["tn_ok_na"]) ) { tn=Y["n_pre_na"];

    cst="весь целый";
    if ( w(tn+1,cst) )
    { l[i]=omo1; Z[880]++; if(dbg){print "Z880"}; stopp=ret=1; continue };

    if ( ( ( w(tn-1,"как") && qxw(1,"так","и","на") && s(tn-1))||
           ( w(tn-1,"и") && qxw(1,"и","на") && s(tn-1) )||
         ( qxs(tn-1,"не","только") && qxw(1,"а но","и","на") )||
         ( qxs(tn-1,"не") && qxw(1,"а но") ) ) && z(0) &&
           bfa(xwn+1,xwn+4,"_palate_environs") && s(xwn,bfn-1) &&
           qir(xwn+1,bfn-1,"prl_vi mest_vi mest_3e prq_vi") )
    { l[i]=omo1; Z[881]++; if(dbg){print "Z881"}; stopp=ret=1; continue };

    if ( ( ( w(tn-1,"как") && qxw(1,"так","и","на") && s(tn-1))||
           ( w(tn-1,"и") && qxw(1,"и","на") && s(tn-1) )||
         ( qxs(tn-1,"не","только") && qxw(1,"а но","и","на") )||
         ( qxs(tn-1,"не") && qxw(1,"а но") ) ) && z(0) &&
           bfa(xwn+1,xwn+4,"_skylike_things") &&
           qir(xwn+1,bfn-1,"prl_vi mest_vi mest_3e prq_vi") && s(xwn,bfn-1) )
    { l[i]=omo2; Z[882]++; if(dbg){print "Z882"}; stopp=ret=1; continue };

    cst="пасти пасть";
    if ( w(tn-1,cst) && s(tn-1) )
    { l[i]=omo2; Z[883]++; if(dbg){print "Z883"}; stopp=ret=1; continue };

    cst="закрывать закрыть запереть запирать";
    cst2="дорогу";
    if ( bw(tn-2,cst) &&
          w(tn-1,cst2) && s(tn-2,tn-1) )
    { l[i]=omo2; Z[884]++; if(dbg){print "Z884"}; stopp=ret=1; continue };

    cst="брать взять прокладывать проложить";
    cst1="кредит курс";
    if ( bb(tn-6,tn-2,cst) && s(bbn,tn-1) &&
        qir(bbn+1,tn-2,"prl_vi mest_vi") &&
          w(tn-1,cst1) )
    { l[i]=omo1; Z[885]++; if(dbg){print "Z885"}; stopp=ret=1; continue };

    cst="положить";
    cst1="глаз";
    if ( bb(tn-6,tn-2,cst) && s(bbn,tn-1) &&
        qir(bbn+1,tn-2,"prl_edmuvi mest_edmuvi") &&
          w(tn-1,cst1) )
    { l[i]=omo1; Z[886]++; if(dbg){print "Z886"}; stopp=ret=1; continue };

    cst="положить";
    cst1="ладонь руку";
    if ( bb(tn-6,tn-2,cst) && s(bbn,tn-1) &&
        qir(bbn+1,tn-2,"prl_edzevi mest_edzevi") &&
          w(tn-1,cst1) )
    { l[i]=omo2; Z[887]++; if(dbg){print "Z887"}; stopp=ret=1; continue };

    cst="лечь";
    cst1="ладонь руку";
    if ( bb(tn-4,tn-2,cst1) && s(bbn,tn-1) &&
        qir(bbn+1,tn-2,"suw_odro isname") &&
         bw(tn-1,cst) )
    { l[i]=omo2; Z[888]++; if(dbg){print "Z888"}; stopp=ret=1; continue };

    if ( bw(tn-2,"раскатать") &&
          w(tn-1,"губу губы") && s(tn-2,tn-1) )
    { l[i]=omo1; Z[889]++; if(dbg){print "Z889"}; stopp=ret=1; continue };

    cst="наложить";
    cst1="заклинание заклятие защита лапа чара";
    cst2="страж форма";
    if ( bb(tn-3,tn-1,cst) ) { bb_n=bbn;

       if ( vgl(bb_n,tn-3,tn-1) && s(bb_n,tn-1) &&
             bb(bb_n-5,bb_n-1,"дверь") )
       { l[i]=omo2; Z[890]++; if(dbg){print "Z890"}; stopp=ret=1; continue };

       if ( veq(bb_n,tn-1) && s(tn-1) &&
             bw(1,cst1) && s(0) )
       { l[i]=omo1; Z[891]++; if(dbg){print "Z891"}; stopp=ret=1; continue };
       if ( veq(bb_n,tn-1) && s(tn-1) &&
              q(1,"prl_vi mest_vi mest_3e") &&
             bw(2,cst1) && s(0,1) )
       { l[i]=omo1; Z[892]++; if(dbg){print "Z892"}; stopp=ret=1; continue };
       if ( veq(bb_n,tn-2) && s(tn-2,tn-1) &&
             bw(tn-1,cst1) )
       { l[i]=omo1; Z[893]++; if(dbg){print "Z893"}; stopp=ret=1; continue };

       if ( veq(bb_n,tn-1) && s(tn-1) &&
             bw(1,cst2) && s(0) )
       { l[i]=omo2; Z[894]++; if(dbg){print "Z894"}; stopp=ret=1; continue };

    };
    if ( bf(1,3,cst) ) { bf_n=bfn;

       if ( bw(tn-1,cst1) && s(tn-1) &&
           vgl(bf_n,1,3) && s(0,bf_n-1) &&
           qir(1,bf_n-1,"mod_any gl_aux_be") )
       { l[i]=omo1; Z[895]++; if(dbg){print "Z895"}; stopp=ret=1; continue };
       if ( vgl(bf_n,1,3) &&
             bf(bf_n+1,bf_n+4,cst1) && s(0,bf_n-1) &&
            qir(1,bf_n-1,"mod_any gl_aux_be") &&
            qir(bf_n+1,bfn-1,"mod_any gl_aux_be") )
       { l[i]=omo1; Z[896]++; if(dbg){print "Z896"}; stopp=ret=1; continue };
       if ( vgl(bf_n,1,3) &&
             bf(bf_n+1,bf_n+4,cst2) && s(0,bf_n-1) &&
            qir(1,bf_n-1,"mod_any gl_aux_be") &&
            qir(bf_n+1,bfn-1,"prl_vi mest_vi mest_3e") )
       { l[i]=omo2; Z[897]++; if(dbg){print "Z897"}; stopp=ret=1; continue };

    };

    cst="навести направить нацелить";
    cst1="дракона";
    cst2="автомат бластер излучатель ладонь лазер луч мушкет оружие пистолет пушку ружье ствол стволы";
    if ( bb(tn-5,tn-2,cst) && s(bbn,tn-1) &&
        qir(bbn+1,tn-2,"mest_vi prl_vi") &&
          w(tn-1,cst2) )
    { l[i]=omo2; Z[898]++; if(dbg){print "Z898"}; stopp=ret=1; continue };
    if ( bb(tn-5,tn-1,cst) && s(bbn,0) &&
        qir(bbn+1,tn-1,"mest_vi prl_vi") &&
          w(1,cst2) )
    { l[i]=omo2; Z[899]++; if(dbg){print "Z899"}; stopp=ret=1; continue };
    if ( bb(tn-5,tn-2,cst) && s(bbn,tn-1) &&
        qir(bbn+1,tn-2,"mest_vi prl_vi") &&
          w(tn-1,cst1) )
    { l[i]=omo1; Z[900]++; if(dbg){print "Z900"}; stopp=ret=1; continue };

    # _suw_na_palate:start
    if ( vgl(Y["n-_suw_na_palate"],tn-5,tn-1) ) { bb_n=Y["n-_suw_na_palate"];

       if ( veq(bb_n,tn-1) && s(tn-1) )
       { l[i]=omo1; Z[901]++; if(dbg){print "Z901"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,tn-1) &&
            qir(bb_n+1,tn-1,"suw_tv prl_tv mest_tv prq_tv")  )
       { l[i]=omo1; Z[902]++; if(dbg){print "Z902"}; stopp=ret=1; continue };

    };

    if ( bfa(1,4,"_suw_na_palate") ) { bf_n=bfn;
       if ( vgl(bf_n,1,4) && s(0,bf_n-1) &&
              q(bf_n,"prl_vi") )
       { bf_n=""; Z[903]++; if(dbg){print "Z903"}; stopp=ret=1; };

       if ( vgl(bf_n,1,4) && s(0,bf_n-1) &&
            qir(1,bf_n-1,"gl_aux_be gl_in gl_ed gl_mn prq_kred")  )
       { l[i]=omo1; Z[904]++; if(dbg){print "Z904"}; stopp=ret=1; continue };

    };
    # _suw_na_palate:end

    # _suw_na_sky:start
    if ( vgl(Y["n-_suw_na_sky"],tn-5,tn-1) ) { bb_n=Y["n-_suw_na_sky"];

       if ( veq(bb_n,tn-1) && s(tn-1) )
       { l[i]=omo2; Z[905]++; if(dbg){print "Z905"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,tn-1) &&
            qir(bb_n+1,tn-1,"suw_tv prl_tv mest_tv prq_tv")  )
       { l[i]=omo2; Z[906]++; if(dbg){print "Z906"}; stopp=ret=1; continue };

    };
    # _suw_na_sky:end

    # _gl_na_palate:start
    if ( vgl(Y["n-_gl_na_palate"],tn-7,tn-1) ) { bb_n=Y["n-_gl_na_palate"]; BB_n=Y["w-_gl_na_palate"];

       # pointesque
       if ( qxs(bb_n-1,"два","удара") &&
             bw(bb_n,"обрушиться") && s(tn-1) )
       { l[i]=omo2; Z[907]++; if(dbg){print "Z907"}; stopp=ret=1; continue };
       cst="накинуть";
       cst2="крючок петлю приспособу цепочку";
       if ( veq(bb_n,tn-1) && bw(tn-1,cst) && s(tn-1) &&
              w(1,cst2) && s(0) )
       { l[i]=omo2; Z[908]++; if(dbg){print "Z908"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-2) && bw(bb_n,cst) && s(bb_n,tn-1) &&
              w(tn-1,cst2) &&
            qir(bb_n+1,tn-2,"prl_vi mest_vi mest_3e qik_vi") )
       { l[i]=omo2; Z[909]++; if(dbg){print "Z909"}; stopp=ret=1; continue };
       cst="опуститься";
       cst2="голова рука";
       if ( bw(tn-2,cst2) &&
            bw(tn-1,cst) && s(tn-2,tn-1) )
       { l[i]=omo2; Z[910]++; if(dbg){print "Z910"}; stopp=ret=1; continue };
       cst="отправить";
       cst2="последовательность";
       if ( bw(tn-1,cst) &&
            wf(1,3,cst2) && s(tn-2,wfn-1) &&
           qir(1,wfn-1,"prl_vi mest_3e") )
       { l[i]=omo2; Z[911]++; if(dbg){print "Z911"}; stopp=ret=1; continue };
       cst="наступать наступить";
       cst2="нога";
       if ( bw(tn-1,cst) &&
            bb(tn-5,tn-2,cst2) && s(bbn,tn-1) &&
           qir(bbn+1,tn-2,"nar_any") )
       { l[i]=omo2; Z[912]++; if(dbg){print "Z912"}; stopp=ret=1; continue };
       # pointesque

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,tn-1) &&
            qir(bb_n+1,tn-1,"qast_any nar_any prl_kred_sr") )
       { l[i]=omo1; Z[913]++; if(dbg){print "Z913"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,tn-1) &&
            qir(bb_n+1,tn-2,"prl_vi prq_vi mest_vi mest_3e qast_any") &&
              q(tn-1,"suw_vi mest_vi mest_3e") )
       { l[i]=omo1; Z[914]++; if(dbg){print "Z914"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,tn-1) &&
            qir(bb_n+1,tn-2,"prl_im prq_im mest_im mest_3e") &&
              q(tn-1,"suw_im mest_im mest_3e") )
       { l[i]=omo1; Z[915]++; if(dbg){print "Z915"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,tn-1) &&
            qir(bb_n+1,tn-2,"prl_tv prq_tv mest_tv mest_3e") &&
              q(tn-1,"suw_tv mest_tv mest_3e") )
       { l[i]=omo1; Z[916]++; if(dbg){print "Z916"}; stopp=ret=1; continue };

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,tn-1) &&
             wf(bb_n+1,tn-2,"с со") &&
            qir(bb_n+1,wfn-1,"qast_any nar_any prl_kred_sr") &&
            qir(wfn+1,tn-1,"mest_tv suw_tv isname suw_ro") )
       { l[i]=omo1; Z[917]++; if(dbg){print "Z917"}; stopp=ret=1; continue };

    };

    if ( bfa(1,4,"_gl_na_palate") ) { bf_n=bfn;
      cst="опуститься";
      cst1="дубина молот рука секира топор";
      if ( vgl(bf_n,1,4) && s(0,bf_n-1) &&
            wf(bf_n+1,bf_n+4,cst1) &&
           qir(1,bf_n-1,"nar_any") &&
           qir(bf_n+1,wfn-1,"prl_im mcop_im mest_3e") )
      { l[i]=omo2; Z[918]++; if(dbg){print "Z918"}; stopp=ret=1; continue };
      if ( vgl(bf_n,1,4) && s(0,bf_n-1) &&
            Xw(bf_n,"X_gl_na_palate") && Qf(1,bf_n-1,"sz_iili pre_any") &&
          !bfa(1,bf_n-1,"_suw_na_sky") )
      { l[i]=omo1; Z[919]++; if(dbg){print "Z919"}; stopp=ret=1; continue };
  };
    # _gl_na_palate:end

    # _gl_na_sky:start
    #
    if ( qb(tn-7,tn-1,"pre_vi") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_na_sky") ) { bb_n=bbn;

       if ( vgl(bb_n,qb_n-5,qb_n-1) && vgl(qb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any prl_kred_sr qast_any") &&
            qir(qb_n+1,tn-1,"suw_vi prl_vi prq_vi mest_vi mest_3e nar_any prl_kred_sr qast_any") )
       { l[i]=omo2; Z[920]++; if(dbg){print "Z920"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
              q(qb_n+1,"suw_vi") &&
            qir(qb_n+2,tn-1,"suw_ro prl_ro prq_ro mest_ro mest_3e nar_any prl_kred_sr qast") )
       { l[i]=omo2; Z[921]++; if(dbg){print "Z921"}; stopp=ret=1; continue };

    };};

    if ( qb(tn-7,tn-1,"pre_ro") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_na_sky") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any isname qast_any") &&
            qir(qb_n+1,tn-1,"suw_ro prl_ro prq_ro mest_ro mest_3e nar_any prl_kred_sr qast_any") )
       { l[i]=omo2; Z[922]++; if(dbg){print "Z922"}; stopp=ret=1; continue };

    };};

    if ( qb(tn-7,tn-1,"pre_tv") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_na_sky") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
            qir(qb_n+1,tn-1,"suw_tv prl_tv prq_tv mest_tv mest_3e nar_any prl_kred_sr qast_any") )
       { l[i]=omo2; Z[923]++; if(dbg){print "Z923"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
              q(qb_n+1,"suw_tv prl_tv prq_tv mest_tv isname") &&
              q(qb_n+2,"suw_vi") &&
            qir(qb_n+3,tn-1,"suw_ro prl_ro prq_ro mest_ro mest_3e nar_any prl_kred_sr qast_any") )
       { l[i]=omo2; Z[924]++; if(dbg){print "Z924"}; stopp=ret=1; continue };

    };};

    if ( qb(tn-7,tn-1,"pre_pr") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_na_sky") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
            qir(qb_n+1,tn-1,"suw_pr prl_pr prq_pr mest_pr mest_3e nar_any prl_kred_sr qast_any") )
       { l[i]=omo2; Z[925]++; if(dbg){print "Z925"}; stopp=ret=1; continue };

    };};

    if ( qb(tn-7,tn-1,"pre_pr") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_na_sky") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(-1) &&
            qir(bb_n+1,qb_n-1,"suw_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast_any") &&
              q(qb_n+1,"suw_pr") &&
            qir(qb_n+2,tn-1,"suw_ro prl_ro prq_ro mest_ro mest_3e nar_any prl_kred_sr qast_any") )
       { l[i]=omo2; Z[926]++; if(dbg){print "Z926"}; stopp=ret=1; continue };

    };};

    #
    if ( vgl(Y["n-_gl_na_sky"],tn-7,tn-1) ) { bb_n=Y["n-_gl_na_sky"];

       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-1) && isname(0) )
       { bb_n=""; Z[927]++; if(dbg){print "Z927"}; };

       if ( veq(bb_n,tn-1) && s(tn-1) )
       { l[i]=omo2; Z[928]++; if(dbg){print "Z928"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qia(bb_n+1,tn-1,"sz_i","suw_vi prl_vi prq_vi mest_vi mest_3e qast_any prl_kred_sr nar_any") )
       { l[i]=omo2; Z[929]++; if(dbg){print "Z929"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qir(bb_n+1,tn-1,"suw_im isname prl_im prq_im mest_im mest_3e qast nar_any prl_kred_sr") )
       { l[i]=omo2; Z[930]++; if(dbg){print "Z930"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
              q(bb_n+1,"suw_vi isname prl_vi prq_vi mest_vi mest_3e qast_any nar_any prl_kred_sr") &&
            qir(bb_n+2,tn-1,"suw_ro suw_edne prl_ro mest_ro") )
       { l[i]=omo2; Z[931]++; if(dbg){print "Z931"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qir(bb_n+1,tn-2,"suw_vi isname prl_vi prq_vi mest_vi mest_3e qast_any nar_any prl_kred_sr") &&
              q(tn-1,"suw_ro suw_edne") )
       { l[i]=omo2; Z[932]++; if(dbg){print "Z932"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qir(bb_n+1,tn-1,"suw_tv isname prl_tv prq_tv mest_tv mest_3e qast_any nar_any prl_kred_sr") )
       { l[i]=omo2; Z[933]++; if(dbg){print "Z933"}; stopp=ret=1; continue };

    };

    if ( bfa(1,5,"_gl_na_sky") ) { bf_n=bfn;

       cst="ставить";
       cst1="заклинания";
       if ( vgl(bf_n,1,5) && s(0,bf_n-1) && bw(bf_n,cst) &&
             wb(tn-3,tn-1,cst1) && s(wbn,tn-1) &&
            qir(wbn+1,tn-1,"isname mest_im") )
       { l[i]=omo1; Z[934]++; if(dbg){print "Z934"}; stopp=ret=1; continue };

       if ( vgl(bf_n,1,5) && s(-1,bf_n-1) &&
             Qf(1,bf_n-1,"pre_any sz_iili") )
       { l[i]=omo2; Z[935]++; if(dbg){print "Z935"}; stopp=ret=1; continue };
       if ( vgl(bf_n,1,5) && s(-1,bf_n-1) &&
            qir(1,bf_n-1,"nar_any prl_kred_sr") )
       { l[i]=omo2; Z[936]++; if(dbg){print "Z936"}; stopp=ret=1; continue };
       if ( vgl(bf_n,1,5) && s(-1,bf_n-1) &&
            qir(1,bf_n-1,"nar_any prl_kred_sr qast_any") )
       { l[i]=omo2; Z[937]++; if(dbg){print "Z937"}; stopp=ret=1; continue };
       if ( vgl(bf_n,1,5) && s(-1,bf_n-1) &&
         pre_ro(1) &&
            qiz(2,bf_n-1,"nar_any prl_kred_sr prl_ro mest_ro mest_3e","qast_any suw_ro") )
       { l[i]=omo2; Z[938]++; if(dbg){print "Z938"}; stopp=ret=1; continue };
       if ( vgl(bf_n,1,5) && s(-1,bf_n-1) &&
         pre_pr(1) &&
            qiz(2,bf_n-1,"nar_any prl_kred_sr prl_pr mest_pr mest_3e","qast_any suw_pr") )
       { l[i]=omo2; Z[939]++; if(dbg){print "Z939"}; stopp=ret=1; continue };
       if ( vgl(bf_n,1,5) && s(-1,bf_n-1) &&
            qia(1,bf_n-1,"sz_i","nar_any prl_kred_sr prl_pr mest_pr mest_3e qast_any suw_pr") )
       { l[i]=omo2; Z[940]++; if(dbg){print "Z940"}; stopp=ret=1; continue };

    };
    # _gl_na_sky:end
    #
    # похожий на I
    cst="непохожий походить похожий";
    if ( vgl(Y["n+_palatelike_things"],1,7) ) { bf_n=Y["n+_palatelike_things"] };

    if ( bw(tn-1,cst) && s(tn-1) ) {
      if ( vgl(bf_n,1,4) && s(0,bf_n-1) &&
           qir(1,bf_n-1,"prl_any mcop_any") )
      { l[i]=omo1; Z[941]++; if(dbg){print "Z941"}; stopp=ret=1; continue };
      if ( qxs(1,"комбинаций","песчинок") )
      { l[i]=omo1; Z[942]++; if(dbg){print "Z942"}; stopp=ret=1; continue };

      if ( bba(tn-4,tn-2,"_palatelike_things") && zs(bbn) &&
           qir(bbn+1,tn-2,"qast_ne prl_srav") && s(bbn+1,tn-2) )
      { l[i]=omo1; Z[943]++; if(dbg){print "Z943"}; stopp=ret=1; continue };
      if ( narph_spos(tn-2) &&
                  bba(xwn-3,xwn-1,"_palatelike_things") && zs(bbn) && s(bbn+1,xwn-1) &&
                  qir(bbn+1,xwn-1,"otsz_any sz_qto") && s(tn-2) )
      { l[i]=omo1; Z[944]++; if(dbg){print "Z944"}; stopp=ret=1; continue };
    };
    # похожий I

    if ( qy(tn-1,"sz_iili") &&
         wb(tn-5-qyn,tn-2-qyn,"на") && s(wbn,tn-2-qyn) && zs(tn-1-qyn) &&
         ba(tn-1-qyn,"_palate_environs") &&
        qir(wbn+1,tn-2-qyn,"prl_vi mest_vi mest_3e prq_vi") )
    { l[i]=omo1; Z[945]++; if(dbg){print "Z945"}; stopp=ret=1; continue };
    if ( qy(tn-1,"sz_iili") &&
         wb(tn-5-qyn,tn-2-qyn,"на") && s(wbn,tn-2-qyn) && zs(tn-1-qyn) &&
         ba(wbn+1,"_palate_environs") &&
        qir(wbn+2,tn-1-qyn,"prl_ro mest_ro mest_3e prq_ro isname") )
    { l[i]=omo1; Z[946]++; if(dbg){print "Z946"}; stopp=ret=1; continue };

    # pointesque
    #
  Y["tn_ok_na"]="";
  }; # tn_ok=1 << в небо
break}; Y["TN_na_nebo_f"]=1; return ret }

function TN_za_nebo_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) { stopp=v2s(Y["TN_za_nebo_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_za"]) ) { tn=Y["n_pre_za"];

   cst1="закружить";
   cst2="цепляться";
   if ( bw(-5,cst1) && z(-5) &&
         q(-4,"nar_step") &&
         q(-3,"qast") &&
        bw(-2,cst2) &&
         w(-1,"за") && s(-4,-1) )
    { l[i]=omo1; Z[947]++; if(dbg){print "Z947"}; stopp=ret=1; continue };
    cst="держаться";
    if ( bw(-2,cst) &&
          w(-1,"за") && s(-2,-1) &&
       (qxs(1,"до","последнего")||
        qxs(1,"нет","смысла") ) )
    { l[i]=omo1; Z[948]++; if(dbg){print "Z948"}; stopp=ret=1; continue };

    cst="взяться держаться цепляться";
    if ( bw(-3,cst) &&
        qxs(-1,"за","мой твой наш ваш их свой этот тот ее её их его") )
    { l[i]=omo1; Z[949]++; if(dbg){print "Z949"}; stopp=ret=1; continue };
    cst1="взяться приняться";
    cst2="стена";
    if ( qxs(-3,"а","уж","потом") &&
          bw(xsn-1,cst2) && sc(xsn-1,"—") &&
          bw(-2,cst1) &&
           w(-1,"за") && s(-2,-1) )
    { l[i]=omo1; Z[950]++; if(dbg){print "Z950"}; stopp=ret=1; continue };
    if ( bw(-3,cst) &&
          w(-2,"за") &&
     isname(-1) && s(-3,-1) )
    { l[i]=omo1; Z[951]++; if(dbg){print "Z951"}; stopp=ret=1; continue };
    if ( bw(-2,cst) &&
          w(-1,"за") &&
    sz_iili(1) &&
         bw(2,"спалить сжечь сровнять снести") && s(-2,1) )
    { l[i]=omo1; Z[952]++; if(dbg){print "Z952"}; stopp=ret=1; continue };
    if ( wb(-5,-3,"нужно пора") &&
          w(-2,cst) &&
          w(-1,"за") && s(wbn,-1) )
    { l[i]=omo1; Z[953]++; if(dbg){print "Z953"}; stopp=ret=1; continue };
    if ( bw(-3,"хотеть") &&
          w(-2,cst) &&
          w(-1,"за") && s(-3,-1) )
    { l[i]=omo1; Z[954]++; if(dbg){print "Z954"}; stopp=ret=1; continue };
    cst1="когда крепко наконец основательно плотно";
    if ( w(-3,cst1) &&
        bw(-2,cst) &&
         w(-1,"за") && s(-3,-1) )
    { l[i]=omo1; Z[955]++; if(dbg){print "Z955"}; stopp=ret=1; continue };


    # _gl_za_sky <<<---:start
    if ( bba(tn-7,tn-1,"_gl_za_sky") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-1) && isname(0) )
       { bb_n=""; Z[956]++; if(dbg){print "Z956"}; };

       if ( veq(bb_n,tn-1) && s(tn-1) )
       { l[i]=omo2; Z[957]++; if(dbg){print "Z957"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qia(bb_n+1,tn-2,"mest_im suw_im suw_edne","prl_vi mest_vi mest_3e prq_vi prl_kred_sr nar_any qast isname") &&
              q(tn-1,"suw_vi mest_vi mest_3e prl_kred_sr nar_any qast isname") )
       { l[i]=omo2; Z[958]++; if(dbg){print "Z958"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qir(bb_n+1,tn-2,"prl_tv mest_tv mest_3e prl_kred_sr nar_any") &&
              q(tn-1,"suw_tv mest_tv") )
       { l[i]=omo2; Z[959]++; if(dbg){print "Z959"}; stopp=ret=1; continue };

    };
    # _gl_za_sky <<<---:end

    # _gl_za_palate <<<---:start
    if ( bba(tn-7,tn-1,"_gl_za_palate") ) { bb_n=bbn;

       if ( veq(bb_n,tn-1) && s(tn-1) )
       { l[i]=omo1; Z[960]++; if(dbg){print "Z960"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qir(bb_n+1,tn-2,"prl_vi mest_vi mest_3e prq_vi prl_kred_sr nar_any qast_any isname") &&
              q(tn-1,"suw_vi mest_vi mest_3e prl_kred_sr nar_any qast isname") )
       { l[i]=omo1; Z[961]++; if(dbg){print "Z961"}; stopp=ret=1; continue };

    };

    if ( qb(tn-7,tn-1,"pre_vi") ) { qb_n=qbn; if ( bba(qb_n-5,qb_n-1,"_gl_za_palate") ) { bb_n=bbn;

        if ( vgl(qb_n,tn-7,tn-1) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-2) && zs(tn-1) &&
             qir(bb_n+1,qb_n-1,"suw_vi prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast") &&
             qir(qb_n+1,tn-2,"prl_vi mest_vi prq_vi mest_3e prl_kred_sr nar_any qast") &&
               q(tn-1,"suw_vi mest_vi") )
        { l[i]=omo1; Z[962]++; if(dbg){print "Z962"}; stopp=ret=1; continue };

    };};
    # _gl_za_palate <<<---:end

    # _gl_za_sky --->>>:start
    if ( bfa(1,5,"_gl_za_sky") && s(0,bfn-1) && Qf(1,bfn-1,"sz_iili pre_any") )
    { l[i]=omo2; Z[963]++; if(dbg){print "Z963"}; stopp=ret=1; continue };
    # _gl_za_sky --->>>:end

    # _gl_za_palate --->>>:start
    if ( bfa(1,5,"_gl_za_palate") && s(0,bfn-1) && Qf(1,bfn-1,"sz_iili pre_any") )
    { l[i]=omo1; Z[964]++; if(dbg){print "Z964"}; stopp=ret=1; continue };
    # _gl_za_palate --->>>:end

    # _suw_za_palate:start
    if ( ba(tn-1,"_suw_za_palate") && s(tn-1) )
    { l[i]=omo1; Z[965]++; if(dbg){print "Z965"}; stopp=ret=1; continue };
    # _suw_za_palate:end
   Y["tn_ok_za"]="";
   }; # tn_ok
break}; Y["TN_za_nebo_f"]=1; return ret }

function TN_pod_nebo_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) { stopp=v2s(Y["TN_pod_nebo_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_pod"]) ) { tn=Y["n_pre_pod"];

    # escape для место:start
    cst1="место";
    cst2="выбирать выбрать выделить искать найти находиться отыскать подыскать поискать приглядеть присмотреть";
    if ( bw(tn-3,cst2) &&
          q(tn-2,"nar_mest mest_da suw_da") &&
         bw(tn-1,cst1) && s(tn-3,tn-1) )
    { l[i]=omo1; Z[966]++; if(dbg){print "Z966"}; stopp=ret=1; continue };
    if ( bw(tn-2,cst2) &&
         bw(tn-1,cst1) && s(tn-2,tn-1) )
    { l[i]=omo1; Z[967]++; if(dbg){print "Z967"}; stopp=ret=1; continue };
    if ( bw(tn-2,cst1) &&
         bw(tn-1,cst2) && s(tn-2,tn-1) )
    { l[i]=omo1; Z[968]++; if(dbg){print "Z968"}; stopp=ret=1; continue };
    if ( bw(tn-1,cst1) &&
         bf(1,3,cst2) && s(tn-1,bfn-1) )
    { l[i]=omo1; Z[969]++; if(dbg){print "Z969"}; stopp=ret=1; continue };

    cst3="выбор поиск";
    if ( bw(tn-3,cst3) &&
          q(tn-2,"prl_ro") &&
         bw(tn-1,cst1) && s(tn-3,tn-1) )
    { l[i]=omo1; Z[970]++; if(dbg){print "Z970"}; stopp=ret=1; continue };

    cst3="уверенный";
    if ( bw(tn-3,cst3) &&
          w(tn-2,"насчет о") &&
         bw(tn-1,cst1) && s(tn-3,tn-1) )
    { l[i]=omo1; Z[971]++; if(dbg){print "Z971"}; stopp=ret=1; continue };

    cst4="отправить отправиться отправлять отправляться сложить";
    if ( bw(tn-3,cst4) &&
          w(tn-2,"на") &&
         bw(tn-1,cst1) && s(tn-3,tn-1) )
    { l[i]=omo2; Z[972]++; if(dbg){print "Z972"}; stopp=ret=1; continue };
    if ( bw(tn-1,cst4) &&
          w(1,"в") &&
          q(2,"prl_vi prq_vi mest_vi mest_3e") &&
         bw(3,cst1) && s(tn-1,2) )
    { l[i]=omo2; Z[973]++; if(dbg){print "Z973"}; stopp=ret=1; continue };

    cst4="выжечь выжигать";
    if ( bw(tn-5,cst4) &&
          w(tn-4,"в") &&
          q(tn-3,"suw_pr mest_pr") &&
          q(tn-2,"suw_tv") &&
         bw(tn-1,cst1) && s(tn-5,tn-1) )
    { l[i]=omo2; Z[974]++; if(dbg){print "Z974"}; stopp=ret=1; continue };

    cst="вести вестись";
    cst1="подкоп";
    if ( bw(1,cst) && w(2,cst1) && s(0,1) )
    { l[i]=omo1; Z[975]++; if(dbg){print "Z975"}; stopp=ret=1; continue };

    # escape для место:end
    cst="земля подкоп территория участок";
    if ( bw(tn-1,cst) && s(tn-1) )
    { l[i]=omo1; Z[976]++; if(dbg){print "Z976"}; stopp=ret=1; continue };

    # _gl_i_pod_sky:start
    if ( ba(tn-2,"_gl_i_pod_sky") && zs(tn-2) && s(tn-1) && w(tn-1,"и") )
    { l[i]=omo2; Z[977]++; if(dbg){print "Z977"}; stopp=ret=1; continue };
    if ( ba(tn-3,"_gl_i_pod_sky") && s(tn-3,tn-1) &&
          q(tn-2,"mest_vi mest_3e suw_vi isname") &&
          w(tn-1,"и") )
    { l[i]=omo2; Z[978]++; if(dbg){print "Z978"}; stopp=ret=1; continue };
    # _gl_i_pod_sky:start

    # _suw_pod_palate:start
    if ( bba(tn-4,tn-1,"_suw_pod_palate") ) { bb_n=bbn;
       if ( vgl(bb_n,tn-4,tn-1) && s(bb_n,-1) &&
            qir(bb_n+1,tn-1,"suw_vi prl_vi mest_vi mest_3e qast") )
       { l[i]=omo1; Z[979]++; if(dbg){print "Z979"}; stopp=ret=1; continue };
    };

    # _gl_pod_sky:start
    if ( narph_any(tn-1) && s(xwn-1) &&
               veq(xwn-1,Y["n-_gl_pod_sky"]) && s(tn-1) )
    { l[i]=omo2; Z[980]++; if(dbg){print "Z980"}; stopp=ret=1; continue };
    if ( narph_any(tn-1) && s(xwn-2,xwn-1) &&
               veq(xwn-2,Y["n-_gl_pod_sky"]) &&
                 q(xwn-1,"suw_vi mest_vi mest_3e isname") && s(tn-1) )
    { l[i]=omo2; Z[981]++; if(dbg){print "Z981"}; stopp=ret=1; continue };
    if ( preph_tv(tn-2) &&
              veq(xwn-1,Y["n-_gl_pod_sky"]) &&
                q(tn-1,"suw_tv") && s(xwn-1,tn-1) )
    { l[i]=omo2; Z[982]++; if(dbg){print "Z982"}; stopp=ret=1; continue };

    # escape
    if ( ba(tn-3,"_suw_pod_palate") && z(tn-3) &&
          w(tn-2,"что") &&
       (veq(tn-1,Y["n-_gl_pod_sky"])||veq(tn-1,Y["n-_gl_pod_palate"])) && s(tn-2,tn-1) )
    { l[i]=omo1; Z[983]++; if(dbg){print "Z983"}; stopp=ret=1; continue };
    cst="самый";
    cst1="ударить";
    cst2="кулаком ногой рукой";
    if ( bw(tn-2,cst1) &&
          w(tn-1,cst2) &&
          w(tn+1,cst) && s(tn-2) && zs(tn-1) )
    { l[i]=omo2; Z[984]++; if(dbg){print "Z984"}; stopp=ret=1; continue };
    if ( qxs(-1,"под","самый") )
    { l[i]=omo1; Z[985]++; if(dbg){print "Z985"}; stopp=ret=1; continue };


    # _gl_pod_sky:start
    if ( vex(Y["n-_gl_pod_sky"]) ) { bb_n=Y["n-_gl_pod_sky"];

        if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
             qir(bb_n+1,tn-1,"suw_vi suw_edne prl_vi prq_vi mest_vi mest_impe mest_3e qik_vi qis_vi qast prl_kred_sr isname nar_any") )
        { l[i]=omo2; Z[986]++; if(dbg){print "Z986"}; stopp=ret=1; continue };
        if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
             qir(bb_n+1,tn-2,"suw_vi suw_edne prl_vi prq_vi mest_vi mest_3e qik_vi qis_vi qast prl_kred_sr isname nar_any") &&
               q(tn-1,"isname suw_ro") )
        { l[i]=omo2; Z[987]++; if(dbg){print "Z987"}; stopp=ret=1; continue };
        if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
               q(bb_n+1,"isname suw_vi") &&
             qir(bb_n+2,tn-2,"suw_ro suw_edne prl_ro prq_ro mest_ro mest_3e qik_ro qis_ro qast prl_kred_sr isname nar_any") &&
               q(tn-1,"isname suw_ro") )
        { l[i]=omo2; Z[988]++; if(dbg){print "Z988"}; stopp=ret=1; continue };
        if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
             qir(bb_n+1,tn-1,"suw_tv suw_edne prl_tv prq_tv mest_tv mest_3e qik_tv qis_tv qast prl_kred_sr isname nar_any") )
        { l[i]=omo2; Z[989]++; if(dbg){print "Z989"}; stopp=ret=1; continue };
        if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
               q(bb_n+1,"isname suw_vi mest_vi mest_3e") &&
             qir(bb_n+2,tn-2,"suw_tv suw_edne prl_tv prq_tv mest_tv mest_3e qik_tv qis_tv qast prl_kred_sr isname nar_any") &&
               q(tn-1,"isname suw_tv") )
        { l[i]=omo2; Z[990]++; if(dbg){print "Z990"}; stopp=ret=1; continue };

    };

    #
    if ( qb(tn-5,tn-2,"pre_vi") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_pod_sky") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-5,tn-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast prl_kred_sr","suw_vi suw_edne isname") &&
            qiz(qb_n+1,tn-1,"prl_vi mest_vi prq_vi mest_3e qast","suw_vi suw_edne isname") )
       { l[i]=omo2; Z[991]++; if(dbg){print "Z991"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-5,tn-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast","suw_vi suw_edne isname") &&
            qiz(qb_n+1,tn-1,"suw_vi prl_vi mest_vi mest_3e qik_vi qast","suw_ro suw_edne isname") )
       { l[i]=omo2; Z[992]++; if(dbg){print "Z992"}; stopp=ret=1; continue };
       if ( vgl(qb_n,tn-5,tn-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-2) && zs(tn-1) &&
             qf(bb_n+1,qb_n-1,"pre_tv") &&
            qiz(bb_n+1,qfn-1,"prl_vi prl_ro mest_vi mest_3e qast","suw_vi suw_edne isname") &&
            qiz(qfn+1,qb_n-1,"prl_tv mest_tv mest_3e prq_tv","suw_tv suw_edne isname") &&
            qiz(qb_n+1,tn-1,"suw_vi prl_vi mest_vi mest_3e qik_vi qast","suw_ro suw_edne isname") )
       { l[i]=omo2; Z[993]++; if(dbg){print "Z993"}; stopp=ret=1; continue };

    };};

    #
    if ( qb(tn-5,tn-2,"pre_ro") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_pod_sky") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-5,tn-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast prl_kred_sr","suw_vi suw_edne isname") &&
            qiz(qb_n+1,tn-1,"prl_ro mest_ro mest_3e qast","suw_ro suw_edne isname") )
       { l[i]=omo2; Z[994]++; if(dbg){print "Z994"}; stopp=ret=1; continue };

    };};

    if ( qb(tn-5,tn-2,"pre_tv") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_pod_sky") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-5,tn-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast prl_kred_sr","suw_vi suw_edne isname") &&
            qiz(qb_n+1,tn-1,"prl_tv mest_tv mest_3e qast","suw_tv suw_edne isname") )
       { l[i]=omo2; Z[995]++; if(dbg){print "Z995"}; stopp=ret=1; continue };

    };};

    if ( qb(tn-5,tn-2,"pre_pr") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_pod_sky") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-5,tn-2) && vgl(bb_n,qb_n-5,qb_n-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast prl_kred_sr","suw_vi suw_edne isname") &&
            qiz(qb_n+1,tn-1,"prl_pr mest_pr mest_3e qast","suw_pr suw_edne isname") )
       { l[i]=omo2; Z[996]++; if(dbg){print "Z996"}; stopp=ret=1; continue };

    };};

    if ( bfa(1,5,"_gl_pod_sky") && s(0,bfn-1) &&
          Qf(1,bfn-1,"pre_any sz_iili") )
    { l[i]=omo2; Z[997]++; if(dbg){print "Z997"}; stopp=ret=1; continue };

    if ( qf(1,3,"pre_ro") ) { qf_n=qfn;
      if ( bfa(qf_n+1,qf_n+5,"_gl_pod_sky") ) { bf_n=bfn;

       if ( vgl(qf_n,1,3) && vgl(bf_n,qf_n+1,qf_n+5) && s(0,bfn-1) &&
            qir(1,qf_n-1,"suw_vi prl_vi mest_vi mest_3e") &&
            qir(qf_n+1,bf_n-2,"prl_ro mest_ro mest_3e") &&
              q(bf_n-1,"suw_ro suw_edne") )
       { l[i]=omo2; Z[998]++; if(dbg){print "Z998"}; stopp=ret=1; continue };

    };};
    if ( q(1,"narph_any") &&
       bfa(xwn+1,xwn+3,"_gl_pod_sky") && s(0,bfn-1) &&
       qir(xwn+1,bfn-1,"qast_any") )
    { l[i]=omo2; Z[999]++; if(dbg){print "Z999"}; stopp=ret=1; continue };

    # _gl_pod_sky:end

    # _gl_pod_palate:start
    if ( vex(Y["n-_gl_pod_palate"]) ) { bb_n=Y["n-_gl_pod_palate"];

        if ( vgl(bb_n,tn-7,tn-1) && s(bb_n,tn-2) && zs(tn-1) &&
             qir(bb_n+1,tn-1,"suw_vi suw_edne prl_vi prq_vi mest_vi mest_impe mest_3e qik_vi qis_vi qast prl_kred_sr isname nar_any") )
        { l[i]=omo1; Z[1000]++; if(dbg){print "Z1000"}; stopp=ret=1; continue };

    };

    #
    if ( qb(tn-5,tn-1,"pre_vi") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_pod_palate") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-5,tn-1) && vgl(bb_n,qbn-5,qbn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast prl_kred_sr","suw_vi suw_edne isname") &&
            qiz(qb_n+1,tn-1,"prl_vi mest_vi prq_vi mest_3e qast","suw_vi suw_edne isname") )
       { l[i]=omo1; Z[1001]++; if(dbg){print "Z1001"}; stopp=ret=1; continue };

    };};

    #
    if ( qb(tn-5,tn-1,"pre_ro") ) { qb_n=qbn; if ( q(qb_n,"suw_tv") ) { qb(qb_n-4,qb_n-1,"pre_ro"); qb_n=qbn};
      if ( bba(qb_n-5,qb_n-1,"_gl_pod_palate") ) { bb_n=bbn;


       if ( vgl(qb_n,tn-5,tn-1) && vgl(bb_n,qbn-5,qbn-1) && s(bb_n,tn-2) && zs(tn-1) &&
             qy(bb_n+1,"pre_tv") &&
            qiz(bb_n+1+qyn,qb_n-1,"prl_tv prq_tv mest_tv mest_3e qast prl_kred_sr","suw_tv suw_edne isname") &&
            qir(qb_n+1,tn-1,"mest_ro suw_tv") )
       { l[i]=omo1; Z[1003]++; if(dbg){print "Z1003"}; stopp=ret=1; continue };

    };};

    if ( qb(tn-5,tn-1,"pre_tv") ) { qb_n=qbn;
      if ( bba(qb_n-5,qb_n-1,"_gl_pod_palate") ) { bb_n=bbn;

       if ( vgl(qb_n,tn-5,tn-1) && vgl(bb_n,qbn-5,qbn-1) && s(bb_n,tn-2) && zs(tn-1) &&
            qiz(bb_n+1,qb_n-1,"prl_vi prl_ro mest_vi mest_3e qast prl_kred_sr","suw_vi suw_edne isname") &&
            qiz(qb_n+1,tn-1,"prl_tv mest_tv mest_3e qast","suw_tv suw_edne isname") )
       { l[i]=omo1; Z[1004]++; if(dbg){print "Z1004"}; stopp=ret=1; continue };

    };};

    if ( bfa(1,5,"_gl_pod_palate") && s(0,bfn-1) &&
          Qf(1,bfn-1,"pre_any sz_iili") )
    { l[i]=omo1; Z[1005]++; if(dbg){print "Z1005"}; stopp=ret=1; continue };
    # _gl_pod_palate:end

    # _suw_pod_sky:start
    if ( bba(tn-4,tn-1,"_suw_pod_sky") ) { bb_n=bbn;
       if ( vgl(bb_n,tn-4,tn-1) && s(bb_n,-1) &&
            qir(bb_n+1,tn-1,"suw_vi prl_vi mest_vi mest_3e qast") )
       { l[i]=omo2; Z[1006]++; if(dbg){print "Z1006"}; stopp=ret=1; continue };
    };
    if ( bfa(1,3,"_suw_pod_sky") && s(0,bfn-1) )
    { l[i]=omo2; Z[1007]++; if(dbg){print "Z1007"}; stopp=ret=1; continue };
    # _suw_pod_sky:end

    # _v_suw-vi_pod_sky:start
    if ( bba(tn-4,tn-1,"_v_suw-vi_pod_sky") ) { bb_n=bbn;
       if ( vgl(bb_n,tn-4,tn-1) &&
             wb(bb_n-4,bb_n-1,"в во") && s(wbn,-1) &&
            qir(wbn+1,bb_n-1,"prl_vi mest_vi mest_3e") &&
            qir(bb_n+1,tn-1,"gl_peed suw_vi prl_vi mest_vi mest_3e qast") )
       { l[i]=omo2; Z[1008]++; if(dbg){print "Z1008"}; stopp=ret=1; continue };
    };
    if ( w(1,"в во") && bfa(2,4,"_v_suw-vi_pod_sky") && s(0,bfn-1) &&
       qir(2,bfn-1,"prl_vi mest_vi mest_3e") )
    { l[i]=omo2; Z[1009]++; if(dbg){print "Z1009"}; stopp=ret=1; continue };
    # _suw_pod_sky:end

    if ( qxs(1,"на","хранение") )
    { l[i]=omo2; Z[1010]++; if(dbg){print "Z1010"}; stopp=ret=1; continue };

    if ( w(tn-2,"в во") &&
         q(tn-1,"suw_vi") && s(tn-2,tn-1) )
    { l[i]=omo2; Z[1011]++; if(dbg){print "Z1011"}; stopp=ret=1; continue };
    if ( w(tn-3,"в во") &&
         q(tn-2,"suw_vi") &&
         w(tn-1,"не") && s(tn-3,tn-1) )
    { l[i]=omo2; Z[1012]++; if(dbg){print "Z1012"}; stopp=ret=1; continue };
    if ( w(1,"в во") && s(tn-1) &&
         q(2,"suw_vi") && s(0,1) )
    { l[i]=omo2; Z[1013]++; if(dbg){print "Z1013"}; stopp=ret=1; continue };

    if ( q(1,"prl_vi suw_vi mest_vi mest_3e") && p(tn-1) &&
         q(2,"mest_vi suw_vi") && s(1) && p(2) )
    { l[i]=omo2; Z[1014]++; if(dbg){print "Z1014"}; stopp=ret=1; continue };
    if ( q(tn-2,"mest_vi prl_vi mest_3e") && p(tn-3) &&
         q(tn-1,"suw_vi") && s(tn-2,tn-1) && p(0) )
    { l[i]=omo2; Z[1015]++; if(dbg){print "Z1015"}; stopp=ret=1; continue };
    if ( q(tn-1,"mest_vi suw_vi") && p(tn-2) && s(tn-1) && p(0) )
    { l[i]=omo2; Z[1016]++; if(dbg){print "Z1016"}; stopp=ret=1; continue };
    if ( pre_vi(tn-4) && p(tn-5) &&
              q(tn-3,"suw_vi") &&
              q(tn-2,"mest_vi mest_3e") &&
        sz_iili(tn-1) && s(tn-4,tn-1) )
    { l[i]=omo2; Z[1017]++; if(dbg){print "Z1017"}; stopp=ret=1; continue };

    if ( sc(tn-1,"—") && (p(0)||q_w(1,"sz_iili pre_any")) && Qf(tn+1,-1,"qip_vi") )
    { l[i]=omo2; Z[1018]++; if(dbg){print "Z1018"}; stopp=ret=1; continue };
    if ( q(1,"mest_vi mest_3e suw_odvi qis_vi isname") && s(0) && (p(1)||q_w(2,"sz_iili pre_any")) &&
      !veq(Y["n+_palate_pe"],2)  )
    { l[i]=omo2; Z[1019]++; if(dbg){print "Z1019"}; stopp=ret=1; continue };
    if ( q(tn-1,"mest_vi mest_3e suw_odvi qis_vi sz nar_vrem qast_any") &&
         s(tn-1) && p(tn-2) && (p(0)||q_w(1,"sz_iili pre_any")) )
    { l[i]=omo2; Z[1020]++; if(dbg){print "Z1020"}; stopp=ret=1; continue };
    if ( q(tn-2,"nar_vrem") &&
         q(tn-1,"mest_vi mest_3e suw_odvi qis_vi sz") &&
         s(tn-2,tn-1) && p(tn-3) && (p(0)||q_w(1,"sz_iili pre_any")) )
    { l[i]=omo2; Z[1021]++; if(dbg){print "Z1021"}; stopp=ret=1; continue };
    if ( pre_vi(tn-2) && s(tn-2) &&
              q(tn-1,"suw_vi isname") && z(tn-1) && (p(0)||q_w(1,"sz_iili pre_any")) )
    { l[i]=omo2; Z[1022]++; if(dbg){print "Z1022"}; stopp=ret=1; continue };
    if ( pre_vi(tn-3) && s(tn-3,tn-2) &&
              q(tn-2,"prl_vi mest_vi mest_3e qast") &&
              q(tn-1,"suw_vi") && z(tn-1) && (p(0)||q_w(1,"sz_iili pre_any")) )
    { l[i]=omo2; Z[1023]++; if(dbg){print "Z1023"}; stopp=ret=1; continue };
    if ( pre_vi(tn-3) &&
              q(tn-2,"suw_vi") &&
        sz_iili(tn-1) && s(tn-3,tn-1) )
    { l[i]=omo2; Z[1024]++; if(dbg){print "Z1024"}; stopp=ret=1; continue };
   Y["tn_ok_pod"]="";
   } # tn_ok <<== end
break}; Y["TN_pod_nebo_f"]=1; return ret }

function TN_pod_nebom_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) { stopp=v2s(Y["TN_pod_nebom_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_pod_tv"]) ) { tn=Y["n_pre_pod_tv"];

      if ( ba(tn-1,"_suw_pod_palate-tv") && s(tn-1) )
      { l[i]=omo1; Z[1025]++; if(dbg){print "Z1025"}; stopp=ret=1; continue };


      if ( bba(tn-5,tn-1,"_gl_pod_sky-tv") ) { bb_n=bbn;

        if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
             qir(bb_n+1,tn-1,"suw_vi mest_vi mest_3e") )
        { l[i]=omo2; Z[1026]++; if(dbg){print "Z1026"}; stopp=ret=1; continue };

      };

   Y["tn_ok_tv"]="";
   } # tn_ok <<== end
break}; Y["TN_pod_nebom_f"]=1; return ret }

function TN_o_nebo_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) { stopp=v2s(Y["TN_o_nebo_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_o"]) ) { tn=Y["n_pre_o"];

    if ( w(1,"чем что как") && (p(tn-1)||sc(tn-1,"[(«]")) && z(0) )
    { l[i]=omo1; Z[1027]++; if(dbg){print "Z1027"}; stopp=ret=1; continue };
    cst="разбиваться удариться";
    if ( (qxs(tn-2,"ветер")||
          qxs(tn-2,"луч","света") ) &&
           bw(tn-1,cst) && s(tn-1) )
    { l[i]=omo1; Z[1028]++; if(dbg){print "Z1028"}; stopp=ret=1; continue };
    if ( qxs(tn-1,"что","это","бьется") )
    { l[i]=omo1; Z[1029]++; if(dbg){print "Z1029"}; stopp=ret=1; continue };

    if ( bba(tn-5,tn-1,"_gl_o_sky") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_vi mest_vi mest_3e","suw_vi suw_edne") )
       { l[i]=omo2; Z[1030]++; if(dbg){print "Z1030"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_tv mest_tv mest_3e","suw_tv suw_edne") )
       { l[i]=omo2; Z[1031]++; if(dbg){print "Z1031"}; stopp=ret=1; continue };

    };

    if ( bba(tn-5,tn-1,"_suw_o_sky") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne") )
       { l[i]=omo2; Z[1032]++; if(dbg){print "Z1032"}; stopp=ret=1; continue };

    };

    if ( bfa(1,5,"_gl_o_sky") ) { bf_n=bfn;

       if ( vgl(bf_n,1,5) && s(1,bf_n-1) &&
             Qf(1,bf_n-1,"pre_any sz_iili") )
       { l[i]=omo2; Z[1033]++; if(dbg){print "Z1033"}; stopp=ret=1; continue };

    };

    if ( q(1,"prl_kred_sr") &&
   sz_iili(2) &&
         q(3,"prl_kred_sr") &&
        ba(4,"_gl_o_sky") && s(-1,3) )
    { l[i]=omo2; Z[1034]++; if(dbg){print "Z1034"}; stopp=ret=1; continue };
   Y["tn_ok_o"]="";
   }; # tn_ok <<== end
break}; Y["TN_o_nebo_f"]=1; return ret }

function TN_po_nebo_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) { stopp=v2s(Y["TN_po_nebo_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_po"]) ) { tn=Y["n_pre_po"];

    if ( bba(tn-5,tn-1,"_gl_po_sky") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qir(bb_n+1,tn-1,"prl_vi mest_vi mest_3e suw_vi suw_edne nar_any") )
       { l[i]=omo2; Z[1035]++; if(dbg){print "Z1035"}; stopp=ret=1; continue };

    };

   Y["tn_ok_po"]="";
   }; # tn_ok <<== end
break}; Y["TN_po_nebo_f"]=1; return ret }

function TN_qerez_nebo_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) { stopp=v2s(Y["TN_qerez_nebo_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_qerez"]) ) { tn=Y["n_pre_qerez"];

    if ( bba(tn-5,tn-1,"_suw_qerez_palate") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e isname","suw_ro suw_edne") )
       { l[i]=omo1; Z[1036]++; if(dbg){print "Z1036"}; stopp=ret=1; continue };

    };
    if ( bba(tn-5,tn-1,"_gl_qerez_palate") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_vi mest_vi mest_3e","suw_vi suw_edne") )
       { l[i]=omo1; Z[1037]++; if(dbg){print "Z1037"}; stopp=ret=1; continue };
       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_tv mest_tv mest_3e","suw_tv suw_edne") )
       { l[i]=omo1; Z[1038]++; if(dbg){print "Z1038"}; stopp=ret=1; continue };

    };
    if ( bfa(1,5,"_gl_qerez_palate") ) { bf_n=bfn;

       if ( vgl(bf_n,1,5) && s(1,bf_n-1) &&
             Qf(1,bf_n-1,"pre_any sz_iili") )
       { l[i]=omo1; Z[1039]++; if(dbg){print "Z1039"}; stopp=ret=1; continue };

    };
    if ( q(1,"narph_any") &&
       bfa(xwn+1,xwn+3,"_gl_qerez_palate") && s(0,bfn-1) &&
       qir(xwn+1,bfn-1,"qast_any nar_any") )
    { l[i]=omo1; Z[1040]++; if(dbg){print "Z1040"}; stopp=ret=1; continue };
   Y["tn_ok_qerez"]="";
   }; # tn_ok <<== end
break}; Y["TN_qerez_nebo_f"]=1; return ret }

function DEF_TN_PRERO_NEBA(num,el) { # определение компонентов между "pre_ro" и "неба"
    tn=tn_ok="";
    tn=num;
#   cst_muvi="prl_edmuvi prl_mnvi mcop_edmuvi mcop_mnvi qis_vi qik_vi prq_edmuvi prq_mnvi qast_any mest_3e nar_kaq nar_step";
    cst1_edmuro="prl_edmuro mcop_edmuro qis_ro qik_ro prq_edmuro qast_any mest_3e nar_kaq nar_step";
    cst1_mnro="prl_mnro mcop_mnro qis_ro qik_ro prq_mnro qast_any mest_3e nar_kaq nar_step";
    cst2_edmuro="prl_edmuro prq_edmuro";
    cst2_mnro="prl_mnro prq_mnro";
    cst3_edmuro="prl_edmuro mcop_edmuro qis_ro qik_ro prq_edmuro suw_ro suw_edne";
    cst3_mnro="prl_mnro mcop_mnro qis_ro qik_ro prq_mnro suw_ro suw_edne";

    if ( w(0,"неба") )
    { cst1 = cst1_edmuro; cst2 = cst2_edmuro;  cst3 = cst3_edmuro; };
    if ( w(0,"замков") )
    { cst1 = cst1_mnro;   cst2 = cst2_mnro;    cst3 = cst3_mnro    };

    if ( hwy(-1,"то") && qir(tn+1,-1-hyn,cst1) && s(tn,-1) )
    { tn_ok = 1; Z[1041]++; if(dbg){print "Z1041", "-- tn_ok ON", el, "неба"};};
    cst="именно собственно";
    if ( !vex(tn_ok) && s(tn,-1) && qiw(tn+1,-1,cst1,cst) )
    { tn_ok = 1; Z[1042]++; if(dbg){print "Z1042", "-- tn_ok ON", el, "неба"};};
    if ( !vex(tn_ok) && s(-4) && zs(-3) && s(-2,-1) && veq(tn,-4) &&
            q(-3,cst2) && q(-2,"nar_any prl_kred_sr") && q(-1,cst2) )
    { tn_ok = 1; Z[1043]++; if(dbg){print "Z1043", "-- tn_ok ON", el, "неба"};};
    if ( !vex(tn_ok) && s(tn,-1) && veq(tn,-2) && wc(-1,"ского$|ного$") )
    { tn_ok = 1; Z[1044]++; if(dbg){print "Z1044", "-- tn_ok ON", el, "неба"};};
    if ( !vex(tn_ok) && zs(-2) && s(-1) && veq(tn,-3) &&
            q(-2,cst2) && wc(-1,"ского$|ного$") )
    { tn_ok = 1; Z[1045]++; if(dbg){print "Z1045", "-- tn_ok ON", el, "неба"};};
    if ( !vex(tn_ok) && s(tn,-1) && veq(tn,-4) &&
            q(-3,cst2) && q(-2,"sz_iili") && wc(-1,"ского$|ного$") )
    { tn_ok = 1; Z[1046]++; if(dbg){print "Z1046", "-- tn_ok ON", el, "неба"};};
    # передвижка tn_ok
    if ( vex(tn_ok) && s(tn,-1) &&
       ( qxs(tn-1,"как","и")||
         qxs(tn-1,"да","еще","и")||
         qxs(tn-1,"ведь даже же прямо сразу") ) )
    { tn = xsn; Z[1047]++; if(dbg){print "Z1047", "-- tn_ok MOV", el, "неба"};};
}

function TN_do_neba_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) { stopp=v2s(Y["TN_do_neba_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_do"]) ) { tn=Y["n_pre_do"];

    if ( bba(tn-5,tn-1,"_suw_do_palate") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne") )
       { l[i]=omo1; Z[1048]++; if(dbg){print "Z1048"}; stopp=ret=1; continue };

    };
    if ( bba(tn-5,tn-1,"_gl_do_palate-ro") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne") )
       { l[i]=omo1; Z[1049]++; if(dbg){print "Z1049"}; stopp=ret=1; continue };

    };
    if ( bfa(1,5,"_gl_do_palate-ro") ) { bf_n=bfn;

       if ( vgl(bf_n,1,5) && s(1,bf_n-1) &&
             Qf(1,bf_n-1,"pre_any sz_iili") )
       { l[i]=omo1; Z[1050]++; if(dbg){print "Z1050"}; stopp=ret=1; continue };

    };

   }; # tn_ok <<== end
break}; Y["TN_do_neba_f"]=1; return ret }

function TN_u_neba_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) { stopp=v2s(Y["TN_u_neba_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_u"]) ) { tn=Y["n_pre_u"];

    if ( bba(tn-5,tn-1,"_suw_u_palate-ro") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne") )
       { l[i]=omo1; Z[1051]++; if(dbg){print "Z1051"}; stopp=ret=1; continue };

    };
    if ( bba(tn-5,tn-1,"_suw_u_sky-ro") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne qast_any") )
       { l[i]=omo2; Z[1052]++; if(dbg){print "Z1052"}; stopp=ret=1; continue };

    };
    if ( bba(tn-5,tn-1,"_gl_u_palate-ro") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qir(bb_n+1,tn-1,"nar_any isname mest_im") )
       { l[i]=omo1; Z[1053]++; if(dbg){print "Z1053"}; stopp=ret=1; continue };

    };
    if ( bfa(1,5,"_gl_u_palate-ro") ) { bf_n=bfn;

       if ( vgl(bf_n,1,5) && s(1,bf_n-1) &&
             Qf(1,bf_n-1,"pre_any sz_iili") )
       { l[i]=omo1; Z[1055]++; if(dbg){print "Z1055"}; stopp=ret=1; continue };

    };

   }; # tn_ok <<== end
break}; Y["TN_u_neba_f"]=1; return ret }

function TN_vokrug_neba_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) { stopp=v2s(Y["TN_vokrug_neba_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_vokrug"]) ) { tn=Y["n_pre_vokrug"];

    if ( bba(tn-5,tn-1,"_suw_vokrug_palate-ro") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne") )
       { l[i]=omo1; Z[1051]++; if(dbg){print "Z1051"}; stopp=ret=1; continue };

    };
    if ( bba(tn-5,tn-1,"_suw_vokrug_sky-ro") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne qast_any") )
       { l[i]=omo2; Z[1052]++; if(dbg){print "Z1052"}; stopp=ret=1; continue };

    };
    if ( bba(tn-5,tn-1,"_gl_vokrug_palate-ro") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qir(bb_n+1,tn-1,"nar_any isname mest_im") )
       { l[i]=omo1; Z[1053]++; if(dbg){print "Z1053"}; stopp=ret=1; continue };

    };
    if ( bfa(1,5,"_gl_vokrug_palate-ro") ) { bf_n=bfn;

       if ( vgl(bf_n,1,5) && s(1,bf_n-1) &&
             Qf(1,bf_n-1,"pre_any sz_iili") )
       { l[i]=omo1; Z[1055]++; if(dbg){print "Z1055"}; stopp=ret=1; continue };

    };

    l[i]=omo1; Z[1055]++; if(dbg){print "Z1055"}; stopp=ret=1; continue;

   }; # tn_ok <<== end
break}; Y["TN_vokrug_neba_f"]=1; return ret }

function TN_vnutri_neba_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) { stopp=v2s(Y["TN_vnutri_neba_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_vnutri"]) ) { tn=Y["n_pre_vnutri"];

    if ( bba(tn-5,tn-1,"_suw_vnutri_palate-ro") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne") )
       { l[i]=omo1; Z[1051]++; if(dbg){print "Z1051"}; stopp=ret=1; continue };

    };
    if ( bba(tn-5,tn-1,"_suw_vnutri_sky-ro") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne qast_any") )
       { l[i]=omo2; Z[1052]++; if(dbg){print "Z1052"}; stopp=ret=1; continue };

    };
    if ( bba(tn-5,tn-1,"_gl_vnutri_palate-ro") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qir(bb_n+1,tn-1,"nar_any isname mest_im") )
       { l[i]=omo1; Z[1053]++; if(dbg){print "Z1053"}; stopp=ret=1; continue };

    };
    if ( bfa(1,5,"_gl_vnutri_palate-ro") ) { bf_n=bfn;

       if ( vgl(bf_n,1,5) && s(1,bf_n-1) &&
             Qf(1,bf_n-1,"pre_any sz_iili") )
       { l[i]=omo1; Z[1055]++; if(dbg){print "Z1055"}; stopp=ret=1; continue };

    };

    l[i]=omo1; Z[1055]++; if(dbg){print "Z1055"}; stopp=ret=1; continue;

   }; # tn_ok <<== end
break}; Y["TN_vnutri_neba_f"]=1; return ret }

function TN_iz_neba_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) { stopp=v2s(Y["TN_iz_neba_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_iz"]) ) { tn=Y["n_pre_iz"];

    if ( bba(tn-5,tn-1,"_suw_iz_palate-ro") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne") )
       { l[i]=omo1; Z[1051]++; if(dbg){print "Z1051"}; stopp=ret=1; continue };

    };
    if ( bba(tn-5,tn-1,"_suw_iz_sky-ro") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne qast_any") )
       { l[i]=omo2; Z[1052]++; if(dbg){print "Z1052"}; stopp=ret=1; continue };

    };
    if ( bba(tn-5,tn-1,"_gl_iz_palate-ro") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qir(bb_n+1,tn-1,"nar_any isname mest_im suw_vi mest_vi mest_3e") )
       { l[i]=omo1; Z[1053]++; if(dbg){print "Z1053"}; stopp=ret=1; continue };

    };
    if ( bfa(1,5,"_gl_iz_palate-ro") ) { bf_n=bfn;

       if ( vgl(bf_n,1,5) && s(1,bf_n-1) &&
             Qf(1,bf_n-1,"pre_any sz_iili") )
       { l[i]=omo1; Z[1055]++; if(dbg){print "Z1055"}; stopp=ret=1; continue };

    };

   }; # tn_ok <<== end
break}; Y["TN_iz_neba_f"]=1; return ret }

function TN_ot_neba_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) { stopp=v2s(Y["TN_ot_neba_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_ot"]) ) { tn=Y["n_pre_ot"];

    if ( bba(tn-5,tn-1,"_suw_ot_palate-ro") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne") )
       { l[i]=omo1; Z[1056]++; if(dbg){print "Z1056"}; stopp=ret=1; continue };

    };
    if ( bba(tn-5,tn-1,"_suw_ot_sky-ro") ) { bb_n=bbn; BB_n=BBn;

       cst="ключ";
       if ( weq(BB_n,cst) && s(bb_n,tn-1) && s(0) &&
            ( wa(1,"_palate_isname_geo") || wa(1,"_palate_isname_geo_edro") ) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne qast_any") )
       { l[i]=omo1; Z[1057]++; if(dbg){print "Z1057"}; stopp=ret=1; continue };

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne qast_any") )
       { l[i]=omo2; Z[1057]++; if(dbg){print "Z1057"}; stopp=ret=1; continue };

    };
    if ( bba(tn-5,tn-1,"_gl_ot_palate-ro") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_ro mest_ro mest_3e","suw_ro suw_edne") )
       { l[i]=omo1; Z[1058]++; if(dbg){print "Z1058"}; stopp=ret=1; continue };

    };
    if ( bfa(1,5,"_gl_ot_palate-ro") ) { bf_n=bfn;

       if ( vgl(bf_n,1,5) && s(1,bf_n-1) &&
             Qf(1,bf_n-1,"pre_any sz_iili") )
       { l[i]=omo1; Z[1060]++; if(dbg){print "Z1060"}; stopp=ret=1; continue };

    };

   }; # tn_ok <<== end
break}; Y["TN_ot_neba_f"]=1; return ret }

function TN_v_nebe_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) { stopp=v2s(Y["TN_v_nebe_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_v_pr"]) ) { tn=Y["n_pre_v_pr"];

    if ( bba(tn-5,tn-1,"_gl_v_palate-pr") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_pr mest_pr mest_3e","suw_ro suw_edne") )
       { l[i]=omo1; Z[1061]++; if(dbg){print "Z1061"}; stopp=ret=1; continue };
#      if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
#           qiz(bb_n+1,tn-1,"prl_pr mest_pr mest_3e","suw_ro suw_edne") )
#      { l[i]=omo1; Z[1062]++; if(dbg){print "Z1062"}; stopp=ret=1; continue };

    };
    if ( bfa(1,5,"_gl_v_palate-pr") ) { bf_n=bfn;

       if ( vgl(bf_n,1,5) && s(1,bf_n-1) &&
             Qf(1,bf_n-1,"pre_any sz_iili") )
       { l[i]=omo1; Z[1063]++; if(dbg){print "Z1063"}; stopp=ret=1; continue };

    };
    # _suw_v_palate-vp:start
    # escape
    #
    if ( ba(tn-1,"_suw_v_palate-vp") && s(tn-1) )
    { l[i]=omo1; Z[1064]++; if(dbg){print "Z1064"}; stopp=ret=1; continue };
    if ( ba(tn-2,"_suw_v_palate-vp") && s(tn-2,tn-1) &&
          q(tn-1,"prl_kred_sr nar_any mest_vi mest_3e prl_vi") )
    { l[i]=omo1; Z[1065]++; if(dbg){print "Z1065"}; stopp=ret=1; continue };
    if ( bba(tn-6,tn-2,"_suw_v_palate-vp") &&
         qir(bbn+1,tn-2,"prl_ro prq_ro mcop_ro suw_ro") &&
           q(tn-1,"suw_ro mest_ro mest_3e qast nar_napr isname") && s(bbn,tn-1) )
    { l[i]=omo1; Z[1066]++; if(dbg){print "Z1066"}; stopp=ret=1; continue };
    # _suw_v_palate-vp:end
    # в небе

   }; # tn_ok <<== end
break}; Y["TN_v_nebe_f"]=1; return ret }

function TN_k_nebu_f(    ret, tn, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) { stopp=v2s(Y["TN_k_nebu_f"]);
  while ( !stopp ) {

  if ( vex(Y["tn_ok_k_tv"]) ) { tn=Y["n_pre_k_tv"];

    if ( bba(tn-5,tn-1,"_gl_k_palate-da") ) { bb_n=bbn;

       if ( vgl(bb_n,tn-5,tn-1) && s(bb_n,-1) &&
            qiz(bb_n+1,tn-1,"prl_da mest_da mest_3e","suw_ro suw_edne") )
       { l[i]=omo1; Z[1067]++; if(dbg){print "Z1067"}; stopp=ret=1; continue };

    };
    if ( bfa(1,5,"_gl_k_palate-da") ) { bf_n=bfn;

       if ( vgl(bf_n,1,5) && s(1,bf_n-1) &&
             Qf(1,bf_n-1,"pre_any sz_iili") )
       { l[i]=omo1; Z[1069]++; if(dbg){print "Z1069"}; stopp=ret=1; continue };

    };
    # _suw_v_palate-vp:start
    # escape
    #
#   if ( ba(tn-1,"_suw_v_palate-vp") && s(tn-1) )
#   { l[i]=omo1; Z[1070]++; if(dbg){print "Z1070"}; stopp=ret=1; continue };
#   if ( ba(tn-2,"_suw_v_palate-vp") && s(tn-2,tn-1) &&
#         q(tn-1,"prl_kred_sr nar_any mest_vi mest_3e prl_vi") )
#   { l[i]=omo1; Z[1071]++; if(dbg){print "Z1071"}; stopp=ret=1; continue };
#   if ( bba(tn-6,tn-2,"_suw_v_palate-vp") &&
#        qir(bbn+1,tn-2,"prl_ro prq_ro mcop_ro suw_ro") &&
#          q(tn-1,"suw_ro mest_ro mest_3e qast nar_napr isname") && s(bbn,tn-1) )
#   { l[i]=omo1; Z[1072]++; if(dbg){print "Z1072"}; stopp=ret=1; continue };
    # _suw_v_palate-vp:end
    # в небе

   }; # tn_ok <<== end
break}; Y["TN_v_nebu_f"]=1; return ret }

function FN_palate_prl_f(str_palate,    ret, stopp_str, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) { stopp_str="FN" str_palate "_f"; stopp=v2s(Y[stopp_str]);
  while ( !stopp ) {

#   if ( vex(Y["tn_ok_na"]) && TN_na_nebo_f() )
#   { Z[1073]++; if(dbg){print "Z1073"}; stopp=ret=1; continue };
    if ( iwrd == "небо") {

       # _palate_prl:start
       cst0="собирать собрать";
       if ( q(-1,"prl_edmuim prl_mnim prl_kred_mu") && ba(-1,str_palate) && s(-1) &&
        !(bam(-2,"_sky_pe _sky_prl_true") && !bw(-2,cst0) && s(-2)) )
       { l[i]=omo1; Z[1074]++; if(dbg){print "Z1074"}; stopp=ret=1; continue };
       if ( q(-2,"prl_edmuim prl_mnim prl_kred_mu") && ba(-2,str_palate) &&
            q(-1,"prl_any prq_any mest_any qast") && !(bam(-1,"_sky_prl _sky_pe")) && s(-2,-1) )
       { l[i]=omo1; Z[1075]++; if(dbg){print "Z1075"}; stopp=ret=1; continue };
       if ( q(-3,"prl_edmuim prl_mnim prl_kred_mu") && ba(-3,str_palate) &&
            q(-2,"prl_any prq_any mest_any qast") && W(-2,"как") &&
            q(-1,"prl_any prq_any mest_any qast") && !(bam(-1,"_sky_prl _sky_pe")) && s(-3,-1) )
       { l[i]=omo1; Z[1076]++; if(dbg){print "Z1076"}; stopp=ret=1; continue };
       if ( q(-4,"prl_edmuim prl_mnim prl_kred_mu") && ba(-4,str_palate) &&
            q(-3,"prl_any prq_any mest_any qast") && W(-3,"как") &&
            q(-2,"prl_any prq_any mest_any nar_any qast") && W(-2,"как") &&
            q(-1,"prl_any prq_any mest_any qast") && !(bam(-1,"_sky_prl _sky_pe")) && s(-4,-1) )
       { l[i]=omo1; Z[1077]++; if(dbg){print "Z1077"}; stopp=ret=1; continue };

       if ( q(1,"prl_edmuim prl_kred_mu") && w(0,"небо") && ba(1,str_palate) && s(0) &&
          Q_w(2,"suw_vi suw_im suw_edne") )
       { l[i]=omo1; Z[1078]++; if(dbg){print "Z1078"}; stopp=ret=1; continue };
       if ( q(1,"nar_any") &&
            q(2,"prl_edmuim prl_kred_mu") && w(0,"небо") && ba(2,str_palate) && s(0,-1) &&
          Q_w(3,"suw_vi suw_im suw_edne") )
       { l[i]=omo1; Z[1079]++; if(dbg){print "Z1079"}; stopp=ret=1; continue };

       cst="массивный огромный";
       if ( w(-2,cst) && zs(-2) &&
            w(-1,"как") && s(-1) )
       { l[i]=omo1; Z[1080]++; if(dbg){print "Z1080"}; stopp=ret=1; continue };

          cst1="быть казаться оказаться стать считаться являться";
          if ( bf(1,4,cst1) ) { wf_n=bfn;
             if ( bfa(wf_n+1,wf_n+5,str_palate) ) { bf_n=bfn;
                if ( vgl(Y["n+_sky_pe"],wf_n+1,bf_n-1) ||
                     bfa(wf_n+1,bf_n-1,"_sky_prl") ||
                     vex(Y["tn_ok_vi"]) )
                { wf_n=bf_n=""; Z[1081]++; if(dbg){print "Z1081"}; };
                if ( s(bf_n,bf_n+1) && sz_iili(bf_n+1) && ba(bf_n+2,"_sky_prl") )
                { wf_n=bf_n=""; Z[1082]++; if(dbg){print "Z1082"}; };

                cst2="ключ отмычка";
                if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+5) && s(0,bf_n-1) && z(bf_n) &&
                      bf(bf_n+1,bf_n+5,cst2) )
                { l[i]=omo2; Z[1083]++; if(dbg){print "Z1083"}; stopp=ret=1; continue };

                if ( vgl(wf_n,1,4) && vgl(bf_n,wf_n+1,wf_n+5) && s(0,bf_n-1) &&
                       q(bf_n,"prl_edmuim prl_mnim prl_edmutv prl_kred_mu") &&
                     qir(1,wf_n-1,"nar_any mod_any qast_any") &&
                     qir(wf_n+1,bf_n-1,"nar_any prq_kred_mu qast_any prl_edmuim prl_mnim prl_kred_sr predik prl_edmutv mest_im mest_tv mest_3e mest_da isname suw_da") )
                { l[i]=omo1; Z[1084]++; if(dbg){print "Z1084"}; stopp=ret=1; continue };
                if ( veq(wf_n,1) && veq(bf_n,3) && s(0) &&
                       q(2,"prl_edmuim prl_mnim prl_tv prl_kred_mu") && z(2) )
                { l[i]=omo1; Z[1085]++; if(dbg){print "Z1085"}; stopp=ret=1; continue };

                if ( vgl(wf_n,1,4) && vgl(bf_n,wf_n+1,wf_n+5) &&
                      vv(0,3) && s(vvn+1,bf_n-1) &&
                       q(bf_n,"prl_edmuim prl_mnim prl_edmutv prl_kred_mu") &&
                     qir(1,vvn,"vvod") &&
                     qir(vvn+1,wf_n-1,"nar_any mod_any qast_any") &&
                     qir(wf_n+1,bf_n-1,"nar_any prq_kred_mu qast_any prl_edmuim prl_mnim prl_kred_sr predik prl_edmutv mest_im mest_tv mest_3e mest_da isname suw_da") )
                { l[i]=omo1; Z[1086]++; if(dbg){print "Z1086"}; stopp=ret=1; continue };
          };};
          if ( bf(1,3,cst1) ) { wf_n=bfn;
             if ( bba(wf_n+1,wf_n+5,str_palate) ) { bb_n=bbn;

                if ( vgl(wf_n,1,3) && vgl(bb_n,wf_n+1,wf_n+5) && s(0,wf_n) &&
                       q(wf_n+1,"prl_edmuim prl_mnim prl_edmutv prl_kred_mu") && z(wf_n+1) &&
                       q(wf_n+2,"prl_edmuim prl_mnim prl_edmutv prl_kred_mu") &&
                       q(wf_n+3,"sz_iili") &&
                      ba(bb_n,"_palate_prl") && s(wf_n+2,bb_n-1) &&
                     qir(1,wf_n-1,"nar_any mod_any qast_any") &&
                     qir(wf_n+4,bb_n-1,"nar_any qast_any prl_kred_sr") )
                { l[i]=omo1; Z[1088]++; if(dbg){print "Z1088"}; stopp=ret=1; continue };
          };};
          cst1="ведь же там тут";
          if ( bf(1,3,cst1) ) { wf_n=bfn;
             if ( bfa(wf_n+1,wf_n+5,str_palate) ) { bf_n=bfn;
               if ( vgl(Y["n+_sky_pe"],wf_n+1,bf_n-1) ||
                    bfa(wf_n+1,bf_n-1,"_sky_prl") ||
                    vex(Y["tn_ok_vi"]) )
                { wf_n=bf_n=""; Z[1089]++; if(dbg){print "Z1089"}; };

                if ( vgl(wf_n,1,3) && vgl(bf_n,wf_n+1,wf_n+5) && s(0,bf_n-1) &&
                       q(bf_n,"prl_edmuim prl_mnim prl_edmutv prl_kred_mu") &&
                     qir(1,wf_n-1,"nar_any qast_any") &&
                     qir(wf_n+1,bf_n-1,"nar_any prq_kred_mu qast_any prl_edmuim prl_mnim prl_kred_sr predik prl_edmutv mest_im mest_tv mest_3e") )
                { l[i]=omo1; Z[1090]++; if(dbg){print "Z1090"}; stopp=ret=1; continue };
          };};

       cst2="быть делать казаться сделать стать считаться являться";
       if ( bb(-3,-1,cst2) &&
             q(1,"prl_tv") && ba(1,str_palate) && s(bbn,0) )
       { l[i]=omo1; Z[1092]++; if(dbg){print "Z1092"}; stopp=ret=1; continue };
    };
    if ( iwrd == "неба") {
       if ( q(-1,"prl_edmuro") && ba(-1,str_palate) && s(-1) &&
         !(ba(-2,"_sky_pe") && s(-2)) )
       { l[i]=omo1; Z[1093]++; if(dbg){print "Z1093"}; stopp=ret=1; continue };
       if ( s(-2,-1) && prl_edmuro(-2) && q(-1,"prl_edmuro") && ba(-2,str_palate) )
       { l[i]=omo1; Z[1094]++; if(dbg){print "Z1094"}; stopp=ret=1; continue };
    };
    if ( iwrd == "небу") {
       if ( q(-1,"prl_edmuda") && ba(-1,str_palate) && s(-1) &&
         !(ba(-2,"_sky_pe") && s(-2)) )
       { l[i]=omo1; Z[1095]++; if(dbg){print "Z1095"}; stopp=ret=1; continue };
       if ( s(-2,-1) && prl_edmuda(-2) && q(-1,"prl_edmuda") && ba(-2,str_palate) )
       { l[i]=omo1; Z[1096]++; if(dbg){print "Z1096"}; stopp=ret=1; continue };
    };
    if ( iwrd == "небом") {
       if ( q(-1,"prl_edmutv") && ba(-1,str_palate) && s(-1) &&
         !(ba(-2,"_sky_pe") && s(-2)) )
       { l[i]=omo1; Z[1098]++; if(dbg){print "Z1098"}; stopp=ret=1; continue };
       if ( s(-2,-1) && prl_edmutv(-2) && q(-1,"prl_edmutv") && ba(-2,str_palate) )
       { l[i]=omo1; Z[1099]++; if(dbg){print "Z1099"}; stopp=ret=1; continue };
    };
    if ( iwrd == "небе") {
       if ( q(-1,"prl_edmupr") && ba(-1,str_palate) && s(-1) &&
         !(ba(-2,"_sky_pe") && s(-2)) )
       { l[i]=omo1; Z[1100]++; if(dbg){print "Z1100"}; stopp=ret=1; continue };
       if ( s(-2,-1) && prl_edmupr(-2) && q(-1,"prl_edmupr") && ba(-2,str_palate) )
       { l[i]=omo1; Z[1101]++; if(dbg){print "Z1101"}; stopp=ret=1; continue };
    };
    # _palate_prl:end
break}; Y[stopp_str]=1; return ret }

function FN_sky_prl_f(str_sky,    ret, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) { stopp_str="FN" str_sky "_f"; stopp=v2s(Y[stopp_str]);
  while ( !stopp ) {
    # _sky_prl:escape
    # _sky_prl:escape

    # _sky_prl:start

       if ( iwrd == "небо") {

#         cst="вернуться";
#         cst0="потайной";
#         if ( vex(Y["tn_ok_v"]) && qb(Y["n_pre_v"]+1,-1,"prl_im") && !wa(qbn,"_sky_prl_true") ) {
#           if ( vex(Y["n-_gl_v_palate-iv"]) && weq(Y["w-_gl_v_palate-iv"],cst) && TN_v_nebo_f() )
#           { Z[1115]++; if(dbg){print "Z1115", "-- TN_v_nebo_f"}; stopp=ret=1; continue };
#           if ( vgl(Y["n-_suw_v_palate-vp"],Y["n_pre_v"]-3,Y["n_pre_v"]-1) && TN_v_nebo_f() )
#           { Z[1116]++; if(dbg){print "Z1116", "-- TN_v_nebo_f"}; stopp=ret=1; continue };
#         };

          if ( s(-1) && q(-1,"prl_edmuim prl_kred_mu") && ba(-1,str_sky) && !wa(-1,"X_sky_prl") )
          { l[i]=omo2; Z[1117]++; if(dbg){print "Z1117"}; stopp=ret=1; continue };
          if ( zs(-2) && s(-1) && qm(-2,"prl_edmuim prl_kred_mu",str_sky) && !wa(-2,"X_sky_prl") && !wa(-1,"_palate_prl") &&
                q(-1,"prl_edmuim mest_edmuvi prq_edmuim mest_3e qast_any nar_any prl_kred_sr gl_aux_be isname") && zs(-2) && s(-1)  )
          { l[i]=omo2; Z[1118]++; if(dbg){print "Z1118"}; stopp=ret=1; continue }; #uphere
          if ( z(-3) && s(-2,-1) && qm(-3,"prl_edmuim",str_sky) && q(-2,"prl_edmuim prl_kred_sr nar_any sz_i") && q(-1,"prl_edmuim") )
          { l[i]=omo2; Z[1119]++; if(dbg){print "Z1119"}; stopp=ret=1; continue };
          if ( q(1,"prl_edmuim prl_edmutv qast_any gl_aux_be") && qm(2,"prl_edmuim prl_edmutv",str_sky) && Q_w(3,"suw_edvi suw_edim suw_edtv") &&
             (zs(0)||se(0," — ")) && zs(1) )
          { l[i]=omo2; Z[1120]++; if(dbg){print "Z1120"}; stopp=ret=1; continue };
          if ( q(1,"prl_edmuim prl_edmutv") &&
               q(2,"prl_edmuim prl_edmutv qast_any gl_aux_be") && qm(3,"prl_edmuim prl_edmutv",str_sky) && Q_w(4,"suw_edvi suw_edim suw_edtv") &&
             (zs(0)||se(0," — ")) && zs(2) )
          { l[i]=omo2; Z[1121]++; if(dbg){print "Z1121"}; stopp=ret=1; continue };
          if ( qm(1,"prl_edmuim",str_sky) && (s(0)||se(0," — ")||sc(0,":")) && Q_w(2,"suw_edvi suw_edim suw_edtv") )
          { l[i]=omo2; Z[1122]++; if(dbg){print "Z1122"}; stopp=ret=1; continue };
          if ( qf(1,5,"prl_edmuim prl_edmutv prl_kred_mu") && qir(1,qfn-1,"gl_aux_be qast_any nar_any predik prl_kred_sr muk_edmuim") && !wa(qfn,"X_sky_prl") &&
               ba(qfn,str_sky) && (zs(0)||se(0," — ")) && s(1,qfn-1) && Q_w(qfn+1,"suw_edvi suw_edim suw_edtv") )
          { l[i]=omo2; Z[1123]++; if(dbg){print "Z1123"}; stopp=ret=1; continue };
          if ( qb(1,5,"prl_edmuim prl_edmutv prl_kred_mu") && qir(1,qbn-1,"gl_aux_be qast_any nar_any prl_kred_sr prl_edmuim prl_edmutv muk_edmuim mezd") && !wa(qbn,"X_sky_prl") &&
               ba(qbn,str_sky) && (zs(0)||se(0," — ")) && s(1,qbn-1) && Q(qbn+1,"suw_edvi suw_edim suw_edtv") )
          { l[i]=omo2; Z[1124]++; if(dbg){print "Z1124"}; stopp=ret=1; continue };

          if ( q(1,"vvod") && z(0) && z(1) && qm(2,"prl_edmuim prl_kred_mu",str_sky) && Q_w(3,"suw_edvi suw_edim") )
          { l[i]=omo2; Z[1125]++; if(dbg){print "Z1125"}; stopp=ret=1; continue };
          if ( q(1,"nar_mest") && s(0) && q(2,"vvod") && z(1) && z(2) && qm(3,"prl_edmuim prl_kred_mu",str_sky) && Q_w(4,"suw_edvi suw_edim") )
          { l[i]=omo2; Z[1126]++; if(dbg){print "Z1126"}; stopp=ret=1; continue };
          if ( q(1,"nar_mest") && s(0) && q(2,"vvod") && z(1) && z(2) && q(3,"nar_spos") && qm(4,"prl_edmuim prl_kred_mu",str_sky) && Q_w(5,"suw_edvi suw_edim") )
          { l[i]=omo2; Z[1127]++; if(dbg){print "Z1127"}; stopp=ret=1; continue };

          if ( qf(1,5,"prl_edmuim prl_edmutv") && qir(1,qfn-1,"gl_aux_be qast_any nar_any prl_kred_sr") && sc(qfn,"[,—]") &&
                q(qfn+1,"prl_edmuim prl_edmutv") && ba(qfn+1,str_sky) && s(0,qfn-1) )
          { l[i]=omo2; Z[1128]++; if(dbg){print "Z1128"}; stopp=ret=1; continue };
          if ( qf(2,6,"sz_i") && qiz(1,qfn-1,"gl_aux_be qast_any nar_any prl_kred_sr muk_edmuim muk_edmutv","prl_edmuim prl_edmutv") &&
                q(qfn+1,"prl_edmuim prl_edmutv") && ba(qfn+1,str_sky) && s(0,qfn) )
          { l[i]=omo2; Z[1129]++; if(dbg){print "Z1129"}; stopp=ret=1; continue };

          cst="казаться оказаться остаться показаться являться";
          if ( bf(1,3,cst) ) { wf_n=bfn;
              if ( qf(wf_n+1,wf_n+3,"prl_edmutv") && ba(qfn,str_sky) && s(0,qfn-1) && Q_w(qfn+1,"suw_edtv") &&
                  qir(1,wf_n-1,"nar_any qast_any") && qir(wf_n+1,qfn-1,"nar_any qast_any") )
              { l[i]=omo2; Z[1130]++; if(dbg){print "Z1130"}; stopp=ret=1; continue };
              if ( qb(wf_n+1,wf_n+3,"prl_edmutv") && ba(qbn,str_sky) && s(0,qbn-1) && Q_w(qfn+1,"suw_edtv") &&
                  qir(1,wf_n-1,"nar_any qast_any") && qir(wf_n+1,qbn-1,"nar_any qast_any prl_edmutv") )
              { l[i]=omo2; Z[1131]++; if(dbg){print "Z1131"}; stopp=ret=1; continue };
              if ( qf(wf_n+1,wf_n+3,"prl_edmuim prl_kred_mu") && ba(qfn,str_sky) && s(0,qfn-1) && Q_w(qfn+1,"suw_edvi suw_edim") &&
                  qir(1,wf_n-1,"nar_any qast_any") && qir(wf_n+1,qfn-1,"nar_any qast_any") )
              { l[i]=omo2; Z[1132]++; if(dbg){print "Z1132"}; stopp=ret=1; continue };
              if ( qb(wf_n+1,wf_n+3,"prl_edmuim prl_kred_mu") && ba(qbn,str_sky) && s(0,qbn-1) && Q_w(qfn+1,"suw_edvi suw_edim") &&
                  qir(1,wf_n-1,"nar_any qast_any") && qir(wf_n+1,qbn-1,"nar_any qast_any prl_edmuim") )
              { l[i]=omo2; Z[1133]++; if(dbg){print "Z1133"}; stopp=ret=1; continue };
          };
       }; #небо
       if ( iwrd == "неба") {
          if ( s(-1) && q(-1,"prl_edmuro") && ba(-1,str_sky) )
          { l[i]=omo2; Z[1135]++; if(dbg){print "Z1135"}; stopp=ret=1; continue };
          if ( s(-2,-1) && prl_edmuro(-2) && q(-1,"prl_edmuro") && ba(-2,str_sky) )
          { l[i]=omo2; Z[1136]++; if(dbg){print "Z1136"}; stopp=ret=1; continue };
       };
       if ( iwrd == "небу") {
          if ( s(-1) && q(-1,"prl_edmuda") && ba(-1,str_sky) )
          { l[i]=omo2; Z[1137]++; if(dbg){print "Z1137"}; stopp=ret=1; continue };
          if ( s(-2,-1) && prl_edmuda(-2) && q(-1,"prl_edmuda") && ba(-2,str_sky) )
          { l[i]=omo2; Z[1138]++; if(dbg){print "Z1138"}; stopp=ret=1; continue };
          if ( q(1,"prl_edmuda") && (s(0)||se(0," — ")||sc(0,":")) && Q_w(2,"suw_edda") )
          { l[i]=omo2; Z[1139]++; if(dbg){print "Z1139"}; stopp=ret=1; continue };
       };
       if ( iwrd == "небом") {
          if ( s(-1) && q(-1,"prl_edmutv") && ba(-1,str_sky) )
          { l[i]=omo2; Z[1140]++; if(dbg){print "Z1140"}; stopp=ret=1; continue };
          if ( s(-2,-1) && prl_edmutv(-2) && q(-1,"prl_edmutv") && ba(-2,str_sky) )
          { l[i]=omo2; Z[1141]++; if(dbg){print "Z1141"}; stopp=ret=1; continue };
       };
       if ( iwrd == "небе") {
          if ( s(-1) && q(-1,"prl_edmupr") && ba(-1,str_sky) )
          { l[i]=omo2; Z[1142]++; if(dbg){print "Z1142"}; stopp=ret=1; continue };
          if ( s(-2,-1) && prl_edmupr(-2) && q(-1,"prl_edmupr") && ba(-2,str_sky) )
          { l[i]=omo2; Z[1143]++; if(dbg){print "Z1143"}; stopp=ret=1; continue };
       };
    # _sky_prl:end
break}; Y[stopp_str]=1; return ret }

function FN_hw_neba_f(    ret, stopp_str, stopp, bb_n,bf_n,qb_n,qf_n,QB_n,QF_n,wb_n,wf_n, fufu) { stopp=v2s(Y["FN_hw_neba_f"]);
  while ( !stopp ) {

break}; Y["FN_hw_neba_f"]=1; return ret }

function FN_nebo_suwro_f(    ret, stopp_str, stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) { stopp=v2s(Y["FN_nebo_suwro_f"]);
  while ( !stopp ) {

 # _sky_suw-ro:end
break}; Y["FN_nebo_suwro_f"]=1; return ret }

function FN_nebo_vi_esc_f(lvl,    ret, stopp_str,fufu,stopp, bb_n,bf_n,qb_n,qf_n,wb_n,wf_n,BB_n,BF_n,eb_n,EB_n,ef_n,EF_n) {
  while ( !stopp ) {


break}; return ret }


