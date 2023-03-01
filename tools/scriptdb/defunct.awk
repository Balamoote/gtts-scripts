# Набор правил обработки для deomo.awk в виде специфицеских для класса слова. Вынесены в отдельный файл, чтобы не загромождать основной файл.
# let @a=1|%s/"D\zs\d\+\ze"/\=''.(@a+setreg('a',@a+1))/g|%s/ d\[\zs\d\+\ze\]++; if(dbg){print "D\(\d\+\)"/\1/g 
# При срабатывании функции выдают значение TRUE, при вызове аргументы НЕ указываются.
function sw_edro_f(rett,   stopp) { while (stopp == 0) {
 # родительный падеж: массовая обработка

#if ( !(w(-3,"не") && s(-3,-3)) && nmark(-2,"GG","d-v") &&
#       (gl_pnin(-2)||gl_pned(-2)||gl_pnmn(-2)||deep(-2)) &&
#        (suw_edda(-1)||suw_mnda(-1)||mest_da(-1)) && Q(0,"gl_in") && s(-2,-1) )
#{ rett=0; edro2mnvi=1; stopp=1; d[1]++; if(dbg){print "D1"}; continue };
 if ( narph_any(-1) &&
      gl_nemn(xsn-1) && s(xsn-1,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[1]++; if(dbg){print "D1"}; continue };


 if ( se(-1,"-") && suw_mnim(0) && suw_mnim(-1) && prl_mnim(-2) )
 { rett=0; edro2mnim=1; stopp=1; d[2]++; if(dbg){print "D2"}; continue };
 if ( se(-1,"-") && suw_mnim(0) && suw_mnim(-1) && Q(-1,"suw_edro") )
 { rett=0; edro2mnim=1; stopp=1; d[3]++; if(dbg){print "D3"}; continue };

 if ( !(w(-2,"не") && s(-2,-2)) &&
      deep_na(-1) && s(-1,-1) )
 { rett=0; stopp=1; d[4]++; if(dbg){print "D4"}; continue };
 if ( suw_edzeim(-1) && (mark("Ycla","paedze")||mark("Ycla","plkrez")) && s(-1,-1) )
 { rett=0; stopp=1; d[5]++; if(dbg){print "D5"}; continue };
 if ( suw_mnim(-1) && mark("Ycla","pamn") && s(-1,-1) )
 { rett=0; stopp=1; d[6]++; if(dbg){print "D6"}; continue };
 if ( preph_vi(-1)||preph_da(-1)||preph_tv(-1) )
 { rett=0; stopp=1; d[7]++; if(dbg){print "D7"}; continue };
 if ( !(w(-3,"не") && s(-3,-3)) && !(mark("Yro","part")) &&
        (gl_pein(-2)||gl_peed(-2)||gl_pemn(-2)||deep_pe(-2)) &&
         (suw_edtv(-1)||suw_mntv(-1)||mest_tv(-1)) && suw_mnvi(0) && s(-2,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[8]++; if(dbg){print "D8"}; continue };
 if ( !(w(-3,"не") && s(-3,-3)) &&
        prq_any(-6) &&
        pre_pr(-5) && (suw_edpr(-4)||suw_mnpr(-4)) &&
         pre_tv(-3) &&(mest_mntv(-2)||prl_mntv(-2)||prq_mntv(-2)) &&
          suw_mntv(-1) && suw_mnvi(0) && s(-5,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[9]++; if(dbg){print "D9"}; continue };
 if ( !(w(-3,"не") && s(-3,-3)) && !(mark("Yro","part")) &&
        (gl_pnin(-2)||gl_pned(-2)||gl_pnmn(-2)||deep_pn(-2)) &&
         (suw_edtv(-1)||suw_mntv(-1)||mest_tv(-1)) && suw_mnvi(0) && s(-2,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[9]++; if(dbg){print "D9"}; continue };
 if ( !(w(-3,"не") && s(-3,-3)) && !(mark("Yro","part")) &&
        (gl_pein(-2)||gl_peed(-2)||gl_pemn(-2)||gl_vzmn(-2)||deep_pe(-2)) &&
         (suw_edda(-1)||suw_mnda(-1)||mest_da(-1)) && suw_mnvi(0) && Q(0,"gl_in") && s(-2,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[10]++; if(dbg){print "D10"}; continue };
 if ( !(w(-3,"не") && s(-3,-3)) && !(mark("Yro","part")) &&
        (gl_pnin(-2)||gl_pned(-2)||gl_pnmn(-2)||deep_pn(-2)) &&
         (suw_edda(-1)||suw_mnda(-1)||mest_da(-1)) && suw_mnvi(0) && Q(0,"gl_in") && s(-2,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[11]++; if(dbg){print "D11"}; continue };
 if ( swc_edtv(-1) &&
     !(w(xsn-2,"не") && s(xsn-2,xsn-2)) &&
       (gl_pnin(xsn-1)||gl_pned(xsn-1)||gl_pnmn(xsn-1)||deep_pn(xsn-1)) &&
         suw_mnvi(0) && s(xsn-1,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[12]++; if(dbg){print "D12"}; continue };
 if ( (prl_mnim(-4)||prq_mnim(-4)) &&
        pre_ro(-3) &&
        (prl_edro(-2)||prl_mnro(-2)) &&
         (suw_edro(-1)||suw_mnro(-1)) && suw_mnvi(0) && s(-4,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[13]++; if(dbg){print "D13"}; continue };
 if ( (prl_mnim(-3)||prq_mnim(-3)) &&
        pre_ro(-2) &&
         (suw_edro(-1)||suw_mnro(-1)) && suw_mnvi(0) && s(-3,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[14]++; if(dbg){print "D14"}; continue };
 if ( (prl_mnim(-3)||prq_mnim(-3)) &&
       (suw_edtv(-2)||suw_mntv(-2)) &&
        (suw_edro(-1)||suw_mnro(-1)) && suw_mnvi(0) && s(-3,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[15]++; if(dbg){print "D15"}; continue };
 if ( gl_nemn(-3) &&
      (prl_mnim(-2)||prq_mnim(-2)) &&
       (suw_edtv(-1)||suw_mntv(-1)) &&
         suw_mnvi(0) && s(-3,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[16]++; if(dbg){print "D16"}; continue };
 if ( (prl_mn(-4)||prq_mn(-4)) && sc(-4,",") &&
        pre_pr(-3) &&
         suw_mnpr(-2) &&
         (suw_edro(-1)||suw_mnro(-1)) && suw_mnvi(0) && s(-3,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[17]++; if(dbg){print "D17"}; continue };
 if ( pre_ro(-2) &&
      (suw_edro(-1)||suw_mnro(-1)) &&
       (prl_krmn(1)||gl_mn(1)) && suw_mnvi(0) && s(-2,0) && sv(-2,0,"-") && p(1) )
 { rett=0; edro2mnvi=1; stopp=1; d[18]++; if(dbg){print "D18"}; continue };
 if ( (prl_mnim(-4)||prq_mnim(-4)) &&
        pre_pr(-3) &&
         mest_pr(-2) &&
         (suw_edpr(-1)||suw_mnpr(-1)) && s(-4,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[25]++; if(dbg){print "D25"}; continue };

 if ( mark("Yro","part") &&
      (gl_pein(-2)||gl_peed(-2)||gl_pemn(-2)||deep_pe(-2)) &&
       (suw_edtv(-1)||suw_mntv(-1)||suw_edda(-1)||suw_mnda(-1)||mest_da(-1)||mest_tv(-1)) && suw_mnim(0) && s(-2,-1) )
 { rett=stopp=1; d[19]++; if(dbg){print "D19"}; continue };
 if ( p(-2) &&
       suw_any(-1) && s(-1,-1) && sv(-1,-1,"-") &&
   !(souz(-1)||qast(-1)||pre_any(-1)||prl_any(-1)||prq_any(-1)||mest_ed(-1)||mest_mn(-1)||gl_ed(-1)||gl_pemn(-1)||gl_pnmn(-1)||gl_nemn(-1)||nar_vrem(-1)||narph_any(-1)) )
 { rett=stopp=1; d[20]++; if(dbg){print "D20"}; continue };
 if ( !(pre_any(-2) && s(-2,-2)) &&
      suw_any(-1) && s(-1,-1) && (p(0)||w(1,"и или")||pre_any(1)) &&
   !(souz(-1)||qast(-1)||pre_any(-1)||prl_ed(-1)||prl_mn(-1)||mest_ed(-1)||mest_mn(-1)||gl_ed(-1)||gl_pemn(-1)||gl_pnmn(-1)||gl_nemn(-1)||nar_vrem(-1)||narph_any(-1)) )
 { rett=stopp=1; d[21]++; if(dbg){print "D21"}; continue };
 if ( pre_any(-2) && p(-3) &&
       suw_any(-1) && s(-2,-1) && Q(-1,"narph_any") &&
   !(souz(-1)||qast(-1)||pre_any(-1)||prl_any(-1)||prq_any(-1)||mest_ed(-1)||mest_mn(-1)||gl_ed(-1)||gl_pemn(-1)||gl_pnmn(-1)||gl_nemn(-1)||nar_vrem(-1)||narph_any(-1)) )
 { rett=stopp=1; d[22]++; if(dbg){print "D22"}; continue };
 if ( !(pre_any(-2) && s(-2,-2)) &&
      suw_any(-1) && s(-1,-1) && (p(0)||w(1,"и или")||pre_any(1)) &&
   !(souz(-1)||qast(-1)||pre_any(-1)||prl_ed(-1)||prl_mn(-1)||mest_ed(-1)||mest_mn(-1)||gl_ed(-1)||gl_pemn(-1)||gl_pnmn(-1)||gl_nemn(-1)||nar_vrem(-1)||narph_any(-1)) )
 { rett=stopp=1; d[23]++; if(dbg){print "D23"}; continue };
 if ( suw_edzeim(-1) && qf(5,"gl_paedze") && s(-1,qfn-1) &&
   !(souz(-1)||qast(-1)||pre_any(-1)||prl_ed(-1)||prl_mn(-1)||mest_ed(-1)||mest_mn(-1)||gl_ed(-1)||gl_pemn(-1)||gl_pnmn(-1)||gl_nemn(-1)||nar_vrem(-1)||narph_any(-1)) )
 { rett=stopp=1; d[24]++; if(dbg){print "D24"}; continue };
 if ( prq_any(-2) &&
       (suw_edtv(-1)||suw_mntv(-1)) && s(-2,-1) &&
   !(souz(-1)||qast(-1)||pre_any(-1)||prl_ed(-1)||prl_mn(-1)||mest_ed(-1)||mest_mn(-1)||gl_ed(-1)||gl_pemn(-1)||gl_pnmn(-1)||gl_nemn(-1)||nar_vrem(-1)||narph_any(-1)) )
 { rett=stopp=1; d[25]++; if(dbg){print "D25"}; continue };
 if ( pre_ro(-2) &&
       (suw_edro(-1)||suw_mnro(-1)||mest_ro(-1)) &&
         w(1,"не") && mod_bz(2) && s(-2,1) )
 { rett=stopp=1; d[25]++; if(dbg){print "D25"}; continue };
 if ( w(-1,"пол") && sc(-1,"-") )
 { rett=stopp=1; d[26]++; if(dbg){print "D26"}; continue };
 if ( w(-1,"ни") && sc(0,",") && w(1,"ни") && (suw_edro(2)||suw_mnro(2)) && !(suw_mnim(2)) )
 { rett=stopp=1; d[27]++; if(dbg){print "D27"}; continue };
 if ( w(-3,"ни") && suw_edro(-2) && suw_mnim(-2) && sc(2,",") && w(-1,"ни") )
 { rett=stopp=1; d[28]++; if(dbg){print "D28"}; continue };
 if ( w(1,"не") && (gl_pein(2)||gl_pnin(2)) && s(0,1) )
 { rett=stopp=1; d[29]++; if(dbg){print "D29"}; continue };
 if ( (prl_srav(-2)||nar_srav(-2)||w(-2,"более мало менее много столько сколько")) &&
       (prl_edro(-1)||prq_edro(-1)) && s(-2,-1) && !(gl_in(1) && s(0,0)) )
 { rett=stopp=1; d[29]++; if(dbg){print "D29"}; continue };
 if ( (prl_srav(-1)||nar_srav(-1)||w(-1,"более мало менее много столько сколько")) && s(-1,-1) && !(gl_in(1) && s(0,0)) )
 { rett=stopp=1; d[29]++; if(dbg){print "D29"}; continue };
 if ( (gl_pnin(-2)||gl_pnin(-2)||gl_pned(-2)||gl_pnmn(-2)||deep_pn(-2)) && !(gl_poed(-2)||gl_pomn(-2)) &&
       (suw_edda(-1)||suw_mnda(-1)||mest_da(-1)) && suw_mnim(0) && Q(0,"gl_in") && s(-2,-1) && (p(0)||w(1,"и или")||pre_any(1)) )
 { rett=stopp=1; d[30]++; if(dbg){print "D30"}; continue };
 if ( (gl_nein(-2)||gl_nein(-2)||gl_need(-2)||gl_nemn(-2)||deep_ne(-2)) && !(gl_poed(-2)||gl_pomn(-2)) &&
       (suw_edda(-1)||suw_mnda(-1)||mest_da(-1)) && suw_mnim(0) && Q(0,"gl_in") && s(-2,-1) && (p(0)||w(1,"и или")||pre_any(1)) )
 { rett=stopp=1; d[31]++; if(dbg){print "D31"}; continue };

 if ( pre_tv(-3) &&
       mest_tv(-2) &&
       (suw_edtv(-1)||suw_mntv(-1)) && s(-3,-1) )
 { rett=stopp=1; d[25]++; if(dbg){print "D25"}; continue };
 if ( pre_pr(-3) &&
       mest_pr(-2) &&
       (suw_edpr(-1)||suw_mnpr(-1)) && s(-3,-1) )
 { rett=stopp=1; d[25]++; if(dbg){print "D25"}; continue };
 if ( pre_ro(-2) && p(-3) &&
       (suw_edro(-1)||suw_mnro(-1)||mest_ro(-1)) && W(-1,"них") && s(-2,0) )
 { rett=stopp=1; d[25]++; if(dbg){print "D25"}; continue };


break}; return rett }

function sw_em_i_f(rett, stopp) { while (stopp == 0) {
 #_#_#
 if (prex == 1) {
 if ( prex_im(-2) &&
      (prl_edmuim(-1)||prq_edmuim(-1)||muk_edim(-1)) && s(-2,-1) )
 { rett=stopp=1; d[32]++; if(dbg){print "D32"}; continue };
 if ( prex_im(-1) && s(-1,-1) )
 { rett=stopp=1; d[33]++; if(dbg){print "D33"}; continue };
 } else {#
 if ( pre_im(-2) &&
      (prl_edmuim(-1)||prq_edmuim(-1)||muk_edim(-1)) && s(-2,-1) )
 { rett=stopp=1; d[34]++; if(dbg){print "D34"}; continue };
 if ( pre_im(-1) && s(-1,-1) )
 { rett=stopp=1; d[35]++; if(dbg){print "D35"}; continue };
 };#_#_#
 if ( (prl_edmuim(-1)||prq_edmuim(-1)||muk_edim(-1)) && s(-1,-1) )
 { rett=stopp=1; d[36]++; if(dbg){print "D36"}; continue };
break}; return rett }

function sw_em_v_f(rett, stopp) { while (stopp == 0) {
 #_#_#
 if (prex == 1) {
 if ( (prex_vi(-2)||preph_vi(-2)) &&
      (prl_edmuvi(-1)||prq_edmuvi(-1)||muk_edvi(-1)) && s(-2,-1) )
 { rett=stopp=1; d[37]++; if(dbg){print "D37"}; continue };
 if ( prex_vi(-1) && s(-1,-1) )
 { rett=stopp=1; d[38]++; if(dbg){print "D38"}; continue };
 } else {#
 if ( (pre_vi(-2)||preph_vi(-2)) &&
      (prl_edmuvi(-1)||prq_edmuvi(-1)||muk_edvi(-1)) && s(-2,-1) )
 { rett=stopp=1; d[39]++; if(dbg){print "D39"}; continue };
 if ( pre_vi(-1) && s(-1,-1) )
 { rett=stopp=1; d[40]++; if(dbg){print "D40"}; continue };
 };#_#_#
 if ( (preph_vi(-1)||prl_edmuvi(-1)||prq_edmuvi(-1)||muk_edvi(-1)) && s(-1,-1) )
 { rett=stopp=1; d[41]++; if(dbg){print "D41"}; continue };
break}; return rett }

function sw_em_d_f(rett, stopp) { while (stopp == 0) {
 #
 #_#_#
 if (prex == 1) {
 if ( (prex_da(-2)||preph_da(-2)) &&
      (prl_edmuda(-1)||prq_edmuda(-1)||mest_edmuda(-1)||wc(-1,"^[0-9]+$")) && s(-2,-1) )
 { rett=stopp=1; d[42]++; if(dbg){print "D42"}; continue };
 if ( prex_da(-1) && s(-1,-1) )
 { rett=stopp=1; d[43]++; if(dbg){print "D43"}; continue };
 } else {#
 if ( (pre_da(-2)||preph_da(-2)) &&
      (prl_edmuda(-1)||prq_edmuda(-1)||mest_edmuda(-1)||wc(-1,"^[0-9]+$")) && s(-2,-1) )
 { rett=stopp=1; d[44]++; if(dbg){print "D44"}; continue };
 if ( pre_da(-1) && s(-1,-1) )
 { rett=stopp=1; d[45]++; if(dbg){print "D45"}; continue };
 };#_#_#
 if ( (preph_da(-1)||prl_edmuda(-1)||prq_edmuda(-1)||mest_edmuda(-1)||wc(-1,"^[0-9]+$")) && W(-1,"ему") && s(-1,-1) )
 { rett=stopp=1; d[46]++; if(dbg){print "D46"}; continue };
break}; return rett }

function sw_em_r_f(rett, stopp) { while (stopp == 0) {
 #
 if ( (w(-2,"нет")||pre_ro(-2)||qi_duom(-2)) &&
       (prl_mnro(-1)||prq_mnro(-1)||mest_mnro(-1)) && s(-2,-1) )
 { rett=stopp=1; d[47]++; if(dbg){print "D47"}; continue };
 if ( (w(-1,"нет")||pre_ro(-1)||qi_duom(-1)) && s(-1,-1) )
 { rett=stopp=1; d[48]++; if(dbg){print "D48"}; continue };

 #_#_#
 if (prex == 1) {
 if ( (prex_ro(-3)||preph_ro(-3)) &&
       (prl_edmuro(-2)||prq_edmuro(-2)||mest_edmuro(-2)||wc(-2,"^[0-9]+$")) &&
        (prl_edmuro(-1)||prq_edmuro(-1)||mest_edmuro(-1)||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[49]++; if(dbg){print "D49"}; continue };
 if ( (prex_ro(-2)||preph_ro(-2)) &&
      (prl_edmuro(-1)||prq_edmuro(-1)||mest_edmuro(-1)||wc(-1,"^[0-9]+$")) && s(-2,-1) )
 { rett=stopp=1; d[50]++; if(dbg){print "D50"}; continue };
 if ( prex_ro(-1) && s(-1,-1) )
 { rett=stopp=1; d[51]++; if(dbg){print "D51"}; continue };
 } else {#
 if ( (pre_ro(-3)||preph_ro(-3)) &&
       (prl_edmuro(-2)||prq_edmuro(-2)||mest_edmuro(-2)||wc(-2,"^[0-9]+$")) &&
        (prl_edmuro(-1)||prq_edmuro(-1)||mest_edmuro(-1)||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[52]++; if(dbg){print "D52"}; continue };
 if ( pre_ro(-2) &&
      (prl_edmuro(-1)||prq_edmuro(-1)||mest_edmuro(-1)||wc(-1,"^[0-9]+$")) && W(-1,"него") && s(-2,-1) )
 { rett=stopp=1; d[53]++; if(dbg){print "D53"}; continue };
 if ( pre_ro(-1) && s(-1,-1) )
 { rett=stopp=1; d[53]++; if(dbg){print "D53"}; continue };
 };#_#_#
 if ( (preph_ro(-1)||prl_edmuro(-1)||prq_edmuro(-1)||mest_edmuro(-1)||wc(-1,"^[0-9]+$")) && W(-1,"его него") && s(-1,-1) )
 { rett=stopp=1; d[54]++; if(dbg){print "D54"}; continue };

 if ( sw_edro_f() )
 { rett=stopp=1; d[55]++; if(dbg){print "D55"}; continue };

break}; return rett }

function sw_em_t_f(rett, stopp) { while (stopp == 0) {
 #
 #_#_#
 if (prex == 1) {
 if ( (prex_tv(-2)||preph_tv(-2)) &&
      (prl_edmutv(-1)||prq_edmutv(-1)) && s(-2,-1) )
 { rett=stopp=1; d[56]++; if(dbg){print "D56"}; continue };
 if ( prex_tv(-1) && s(-1,-1) )
 { rett=stopp=1; d[57]++; if(dbg){print "D57"}; continue };
 } else {#
 if ( (pre_tv(-2)||preph_tv(-2)) &&
      (prl_edmutv(-1)||prq_edmutv(-1)) && s(-2,-1) )
 { rett=stopp=1; d[58]++; if(dbg){print "D58"}; continue };
 if ( pre_tv(-1) && s(-1,-1) )
 { rett=stopp=1; d[59]++; if(dbg){print "D59"}; continue };
 };#_#_#
 if ( (preph_tv(-1)||prl_edmutv(-1)||prq_edmutv(-1)) && s(-1,-1) )
 { rett=stopp=1; d[60]++; if(dbg){print "D60"}; continue };
break}; return rett }

function sw_em_p_f(rett, stopp) { while (stopp == 0) {
 #
 if ( ismark(-1,"Npre") )
 { rett=0; stopp=1; d[61]++; if(dbg){print "D61"}; continue };
 #_#_#
 if (prex == 1) {
 if ( prex_pr(-2) &&
      (prl_edmupr(-1)||prq_edmupr(-1)) && s(-2,-1) )
 { rett=stopp=1; d[62]++; if(dbg){print "D62"}; continue };
 if ( prex_pr(-1) && s(-1,-1) )
 { rett=stopp=1; d[63]++; if(dbg){print "D63"}; continue };
 } else {#
 if ( pre_pr(-2) &&
      (prl_edmupr(-1)||prq_edmupr(-1)) && s(-2,-1) )
 { rett=stopp=1; d[64]++; if(dbg){print "D64"}; continue };
 if ( pre_pr(-1) && s(-1,-1) )
 { rett=stopp=1; d[65]++; if(dbg){print "D65"}; continue };
 };#_#_#
break}; return rett }

function sw_em_q_f(rett, stopp) { while (stopp == 0) {
 #
 if ( qi_duom(-2) &&
       (prl_edmuro(-1)||prq_edmuro(-1)) && s(-2,-1) )
 { rett=stopp=1; d[66]++; if(dbg){print "D66"}; continue };
 if ( qi_duom(-1) && s(-1,-1) )
 { rett=stopp=1; d[67]++; if(dbg){print "D67"}; continue };

break}; return rett }

function sw_em_z_f(rett, stopp) { while (stopp == 0) {
 #
 if ( (w(-2,"с немного чуть-чуть")||suw_edtv(-2)||gl_in(-2)||gl_ed(-2)||gl_nemn(-2)||gl_pnmn(-2)||gl_pemn(-2)) &&
       (prl_edmuro(-1)||prq_edmuro(-1)||mest_edmuro(-1)) && s(-2,-1) )
 { rett=stopp=1; d[68]++; if(dbg){print "D68"}; continue };
 if ( (gl_in(-2)||gl_ed(-2)||gl_nemn(-2)||gl_pnmn(-2)||gl_pemn(-2)) &&
       (w(-1,"с немного чуть-чуть")||suw_edtv(-1)||prl_edmuro(-1)||prq_edmuro(-1)||mest_edmuro(-1)) && s(-2,-1) )
 { rett=stopp=1; d[69]++; if(dbg){print "D69"}; continue };
 if ( (w(-1,"с немного чуть-чуть")||suw_edtv(-1)||prl_edmuro(-1)||prq_edmuro(-1)||mest_edmuro(-1)) && s(-1,-1) )
 { rett=stopp=1; d[70]++; if(dbg){print "D70"}; continue };
break}; return rett }

function sw_es_i_f(rett, stopp) { while (stopp == 0) {
 #_#_#
 if (prex == 1) {
 if ( prex_im(-2) &&
      (prl_edsrim(-1)||prq_edsrim(-1)) && s(-2,-1) )
 { rett=stopp=1; d[71]++; if(dbg){print "D71"}; continue };
 if ( prex_im(-1) && s(-1,-1) )
 { rett=stopp=1; d[72]++; if(dbg){print "D72"}; continue };
 } else {#
 if ( pre_im(-2) &&
      (prl_edsrim(-1)||prq_edsrim(-1)) && s(-2,-1) )
 { rett=stopp=1; d[73]++; if(dbg){print "D73"}; continue };
 if ( pre_im(-1) && s(-1,-1) )
 { rett=stopp=1; d[74]++; if(dbg){print "D74"}; continue };
 };#_#_#
 if ( (prl_edsrim(-1)||prq_edsrim(-1)) && s(-1,-1) )
 { rett=stopp=1; d[75]++; if(dbg){print "D75"}; continue };
break}; return rett }

function sw_es_v_f(rett, stopp) { while (stopp == 0) {
 #_#_#
 if (prex == 1) {
 if ( (prex_vi(-2)||preph_vi(-2)) &&
      (prl_edsrvi(-1)||prq_edsrvi(-1)) && s(-2,-1) )
 { rett=stopp=1; d[76]++; if(dbg){print "D76"}; continue };
 if ( prex_vi(-1) && s(-1,-1) )
 { rett=stopp=1; d[77]++; if(dbg){print "D77"}; continue };
 } else {#
 if ( (pre_vi(-2)||preph_vi(-2)) &&
      (prl_edsrvi(-1)||prq_edsrvi(-1)) && s(-2,-1) )
 { rett=stopp=1; d[78]++; if(dbg){print "D78"}; continue };
 if ( pre_vi(-1) && s(-1,-1) )
 { rett=stopp=1; d[79]++; if(dbg){print "D79"}; continue };
 };#_#_#
 if ( (preph_vi(-1)||prl_edsrvi(-1)||prq_edsrvi(-1)) && s(-1,-1) )
 { rett=stopp=1; d[80]++; if(dbg){print "D80"}; continue };
break}; return rett }

function sw_es_r_f(rett, stopp) { while (stopp == 0) {
 #
 if ( (w(-2,"нет")||pre_ro(-2)||qi_duom(-2)) &&
       (prl_mnro(-1)||prq_mnro(-1)||mest_mnro(-1)) && s(-2,-1) )
 { rett=stopp=1; d[81]++; if(dbg){print "D81"}; continue };
 if ( (w(-1,"нет")||qi_duom(-1)) && s(-1,-1) )
 { rett=stopp=1; d[82]++; if(dbg){print "D82"}; continue };
 if ( w(-3,"не") &&
      (gl_ed(-2)||gl_in(-2)||gl_poed(-2)) &&
        (prl_edsrro(-1)||prl_edsrro(-1)||mest_ro(-1)) && s(-3,-1) )
 { rett=stopp=1; d[83]++; if(dbg){print "D83"}; continue };
 if ( w(-2,"не") &&
       (gl_ed(-1)||gl_in(-1)||gl_poed(-1)) && s(-2,-1) )
 { rett=stopp=1; d[84]++; if(dbg){print "D84"}; continue };

 #_#_#
 if (prex == 1) {
 if ( (prex_ro(-3)||preph_ro(-3)) &&
       (prl_edsrro(-2)||prq_edsrro(-2)||mest_edmuro(-2)) &&
        (prl_edsrro(-1)||prq_edsrro(-1)||mest_edmuro(-1)) && s(-3,-1) )
 { rett=stopp=1; d[85]++; if(dbg){print "D85"}; continue };
 if ( (prex_ro(-2)||preph_ro(-2)) &&
       (prl_edsrro(-1)||prq_edsrro(-1)||mest_edmuro(-1)) && W(-1,"него") && s(-2,-1) )
 { rett=stopp=1; d[85]++; if(dbg){print "D85"}; continue };
 if ( prex_ro(-1) && s(-1,-1) )
 { rett=stopp=1; d[86]++; if(dbg){print "D86"}; continue };
 } else {#
 if ( (pre_ro(-3)||preph_ro(-3)) &&
       (prl_edsrro(-2)||prq_edsrro(-2)||mest_edmuro(-2)) &&
        (prl_edsrro(-1)||prq_edsrro(-1)||mest_edmuro(-1)) && s(-3,-1) )
 { rett=stopp=1; d[87]++; if(dbg){print "D87"}; continue };
 if ( (pre_ro(-2)||preph_ro(-2)) &&
       (prl_edsrro(-1)||prq_edsrro(-1)||mest_edmuro(-1)) && W(-1,"него") && s(-2,-1) )
 { rett=stopp=1; d[87]++; if(dbg){print "D87"}; continue };
 if ( pre_ro(-1) && s(-1,-1) )
 { rett=stopp=1; d[88]++; if(dbg){print "D88"}; continue };
 };#_#_#
 if ( (preph_ro(-1)||prl_edsrro(-1)||prq_edsrro(-1)||mest_edmuro(-1)) && W(-1,"его него") && s(-1,-1) )
 { rett=stopp=1; d[89]++; if(dbg){print "D89"}; continue };

 if ( sw_edro_f() )
 { rett=stopp=1; d[90]++; if(dbg){print "D90"}; continue };

break}; return rett }

function sw_es_d_f(rett, stopp) { while (stopp == 0) {
 #
 #_#_#
 if (prex == 1) {
 if ( (prex_da(-2)||preph_da(-2)) &&
      (prl_edsrda(-1)||prq_edsrda(-1)) && s(-2,-1) )
 { rett=stopp=1; d[91]++; if(dbg){print "D91"}; continue };
 if ( prex_da(-1) && s(-1,-1) )
 { rett=stopp=1; d[92]++; if(dbg){print "D92"}; continue };
 } else {#
 if ( (pre_da(-2)||preph_da(-2)) &&
      (prl_edsrda(-1)||prq_edsrda(-1)) && s(-2,-1) )
 { rett=stopp=1; d[93]++; if(dbg){print "D93"}; continue };
 if ( pre_da(-1) && s(-1,-1) )
 { rett=stopp=1; d[94]++; if(dbg){print "D94"}; continue };
 };#_#_#
 if ( (preph_da(-1)||prl_edsrda(-1)||prq_edsrda(-1)) && s(-1,-1) )
 { rett=stopp=1; d[95]++; if(dbg){print "D95"}; continue };
break}; return rett }

function sw_es_t_f(rett, stopp) { while (stopp == 0) {
 #
 #_#_#
 if (prex == 1) {
 if ( (prex_tv(-2)||preph_tv(-2)) &&
      (prl_edsrtv(-1)||prq_edsrtv(-1)) && s(-2,-1) )
 { rett=stopp=1; d[96]++; if(dbg){print "D96"}; continue };
 if ( prex_tv(-1) && s(-1,-1) )
 { rett=stopp=1; d[97]++; if(dbg){print "D97"}; continue };
 } else {#
 if ( (pre_tv(-2)||preph_tv(-2)) &&
      (prl_edsrtv(-1)||prq_edsrtv(-1)) && s(-2,-1) )
 { rett=stopp=1; d[98]++; if(dbg){print "D98"}; continue };
 if ( pre_tv(-1) && s(-1,-1) )
 { rett=stopp=1; d[99]++; if(dbg){print "D99"}; continue };
 };#_#_#
 if ( (preph_tv(-1)||prl_edsrtv(-1)||prq_edsrtv(-1)) && s(-1,-1) )
 { rett=stopp=1; d[100]++; if(dbg){print "D100"}; continue };
break}; return rett }

function sw_es_p_f(rett, stopp) { while (stopp == 0) {
 #
 #_#_#
 if (prex == 1) {
 if ( prex_pr(-2) &&
      (prl_edsrpr(-1)||prq_edsrpr(-1)) && s(-2,-1) )
 { rett=stopp=1; d[101]++; if(dbg){print "D101"}; continue };
 if ( prex_pr(-1) && s(-2,-1) )
 { rett=stopp=1; d[102]++; if(dbg){print "D102"}; continue };
 } else {#
 if ( pre_pr(-2) &&
      (prl_edsrpr(-1)||prq_edsrpr(-1)) && s(-2,-1) )
 { rett=stopp=1; d[103]++; if(dbg){print "D103"}; continue };
 if ( pre_pr(-1) && s(-1,-1) )
 { rett=stopp=1; d[104]++; if(dbg){print "D104"}; continue };
 };#_#_#
break}; return rett }

function sw_ez_i_f(rett, stopp) { while (stopp == 0) {
 if ( qf(5,"gl_paedze") && s(0,qfn-1) )
 { rett=stopp=1; d[105]++; if(dbg){print "D105"}; continue };
 if ( w(-1,"она") && gl_paedze(0) && s(0,0) )
 { rett=0; stopp=1; d[106]++; if(dbg){print "D106"}; continue };

 #_#_#
 if (prex == 1) {
 if ( prex_im(-2) &&
      (prl_edzeim(-1)||prq_edzeim(-1)||mest_edzeim(-1)) && s(-2,-1) )
 { rett=stopp=1; d[107]++; if(dbg){print "D107"}; continue };
 if ( prex_im(-1) && s(-1,-1) )
 { rett=stopp=1; d[108]++; if(dbg){print "D108"}; continue };
 } else {#
 if ( pre_im(-2) &&
      (prl_edzeim(-1)||prq_edzeim(-1)||mest_edzeim(-1)) && s(-2,-1) )
 { rett=stopp=1; d[109]++; if(dbg){print "D109"}; continue };
 if ( pre_im(-1) && s(-1,-1) )
 { rett=stopp=1; d[110]++; if(dbg){print "D110"}; continue };
 };#_#_#
 if ( (prl_edzeim(-1)||prq_edzeim(-1)||mest_edzeim(-1)) && s(-1,-1) )
 { rett=stopp=1; d[111]++; if(dbg){print "D111"}; continue };
break}; return rett }

function sw_ez_v_f(rett, stopp) { while (stopp == 0) {
 #_#_#
 if (prex == 1) {
 if ( (prex_vi(-2)||preph_vi(-2)) &&
      (prl_edzevi(-1)||prq_edzevi(-1)||mest_edzevi(-1)) && s(-2,-1) )
 { rett=stopp=1; d[112]++; if(dbg){print "D112"}; continue };
 if ( prex_vi(-1) && s(-1,-1) )
 { rett=stopp=1; d[113]++; if(dbg){print "D113"}; continue };
 } else {#
 if ( (pre_vi(-2)||preph_vi(-2)) &&
      (prl_edzevi(-1)||prq_edzevi(-1)||mest_edzevi(-1)) && s(-2,-1) )
 { rett=stopp=1; d[114]++; if(dbg){print "D114"}; continue };
 if ( pre_vi(-1) && s(-1,-1) )
 { rett=stopp=1; d[115]++; if(dbg){print "D115"}; continue };
 };#_#_#
 if ( (preph_vi(-1)||prl_edzevi(-1)||prq_edzevi(-1)||mest_edzevi(-1)) && s(-1,-1) )
 { rett=stopp=1; d[116]++; if(dbg){print "D116"}; continue };
break}; return rett }

function sw_ez_d_f(rett, stopp) { while (stopp == 0) {
 #_#_#
 if (prex == 1) {
 if ( (prex_da(-2)||preph_da(-2)) &&
      (prl_edzeda(-1)||prq_edzeda(-1)||mest_da(-1)) && s(-2,-1) )
 { rett=stopp=1; d[117]++; if(dbg){print "D117"}; continue };
 if ( prex_da(-1) && s(-1,-1) )
 { rett=stopp=1; d[118]++; if(dbg){print "D118"}; continue };
 } else {#
 if ( (pre_da(-2)||preph_da(-2)) &&
      (prl_edzeda(-1)||prq_edzeda(-1)||mest_da(-1)) && s(-2,-1) )
 { rett=stopp=1; d[119]++; if(dbg){print "D119"}; continue };
 if ( pre_da(-1) && s(-1,-1) )
 { rett=stopp=1; d[120]++; if(dbg){print "D120"}; continue };
 };#_#_#
 if ( (preph_da(-1)||prl_edzeda(-1)||prq_edzeda(-1)||mest_da(-1)) && s(-1,-1) )
 { rett=stopp=1; d[121]++; if(dbg){print "D121"}; continue };
break}; return rett }

function sw_em_l_f(rett, stopp) { while (stopp == 0) {
 #
 if ( w(-2,"в на") &&
      (prl_edmupr(-1)||prq_edmupr(-1)||mest_pr(-1)||mest_vi(-1)||wc(-1,"^[0-9]+$")) && s(-2,-1) )
 { rett=stopp=1; d[122]++; if(dbg){print "D122"}; continue };
 #
 if ( w(-1,"в во на") && s(-1,-1) )
 { rett=stopp=1; d[123]++; if(dbg){print "D123"}; continue };
break}; return rett }

function sw_ez_l_f(rett, stopp) { while (stopp == 0) {
 #
 if ( w(-2,"в на") &&
      (prl_edzepr(-1)||prq_edzepr(-1)||mest_pr(-1)) && s(-2,-1) )
 { rett=stopp=1; d[124]++; if(dbg){print "D124"}; continue };
 #
 if ( w(-1,"в во на") && s(-1,-1) )
 { rett=stopp=1; d[125]++; if(dbg){print "D125"}; continue };
break}; return rett }

function sw_ez_r_f(rett, stopp) { while (stopp == 0) {
 #
 if ( (w(-2,"нет")||qi_duoz(-2)) &&
       (prl_edzero(-1)||prl_edzero(-1)||prq_edzero(-1)||prq_edzero(-1)||mest_ro(-1)) && s(-2,-1) )
 { rett=stopp=1; d[126]++; if(dbg){print "D126"}; continue };
 if ( qi_duoz(-2) &&
      (prl_mnim(-1)||prq_mnim(-1)||mest_mnim(-1)) && s(-2,-1) && se(-2," ") )
 { rett=stopp=1; d[127]++; if(dbg){print "D127"}; continue };
 #
 if ( (w(-1,"нет")||qi_duoz(-1)) && s(-1,-1) )
 { rett=stopp=1; d[128]++; if(dbg){print "D128"}; continue };

 #_#_#
 if (prex == 1) {
 if ( (prex_ro(-2)||preph_ro(-2)) &&
      (prl_edzero(-1)||prq_edzero(-1)||mest_edzero(-1)||w(-1,"его их")) && s(-2,-1) )
 { rett=stopp=1; d[129]++; if(dbg){print "D129"}; continue };
 if ( prex_ro(-1) && s(-1,-1) )
 { rett=stopp=1; d[130]++; if(dbg){print "D130"}; continue };
 } else {#
 if ( (pre_ro(-2)||preph_ro(-2)) &&
      (prl_edzero(-1)||prq_edzero(-1)||mest_edzero(-1)||w(-1,"его их")) && s(-2,-1) )
 { rett=stopp=1; d[131]++; if(dbg){print "D131"}; continue };
 if ( pre_ro(-1) && s(-1,-1) )
 { rett=stopp=1; d[132]++; if(dbg){print "D132"}; continue };
 };#_#_#
 if ( (preph_ro(-1)||prl_edzero(-1)||prq_edzero(-1)||mest_edzero(-1)) && W(-1,"её") && s(-1,-1) )
 { rett=stopp=1; d[133]++; if(dbg){print "D133"}; continue };

 if ( sw_edro_f() )
 { rett=stopp=1; d[134]++; if(dbg){print "D134"}; continue };

break}; return rett }

function sw_ez_t_f(rett, stopp) { while (stopp == 0) {
 #_#_#
 if (prex == 1) {
 if ( (prex_tv(-2)||preph_tv(-2)) &&
      (prl_edzetv(-1)||prq_edzetv(-1)||mest_tv(-1)) && s(-2,-1) )
 { rett=stopp=1; d[135]++; if(dbg){print "D135"}; continue };
 if ( prex_tv(-1) && s(-1,-1) )
 { rett=stopp=1; d[136]++; if(dbg){print "D136"}; continue };
 } else {#
 if ( (pre_tv(-2)||preph_tv(-2)) &&
      (prl_edzetv(-1)||prq_edzetv(-1)||mest_tv(-1)) && s(-2,-1) )
 { rett=stopp=1; d[137]++; if(dbg){print "D137"}; continue };
 if ( pre_tv(-1) && s(-1,-1) )
 { rett=stopp=1; d[138]++; if(dbg){print "D138"}; continue };
 };#_#_#
 if ( (preph_tv(-1)||prl_edzetv(-1)||prq_edzetv(-1)||mest_tv(-1)) && s(-1,-1) )
 { rett=stopp=1; d[139]++; if(dbg){print "D139"}; continue };
break}; return rett }

function sw_ez_p_f(rett, stopp) { while (stopp == 0) {
 #_#_#
 if (prex == 1) {
 if ((prex_pr(-2)||w(-2,"по")) &&
     (prl_edzepr(-1)||prq_edzepr(-1)||mest_pr(-1)) && s(-2,-1) )
 { rett=stopp=1; d[140]++; if(dbg){print "D140"}; continue };
 if ( (prex_pr(-1)||w(-1,"по")) && s(-1,-1) )
 { rett=stopp=1; d[141]++; if(dbg){print "D141"}; continue };
 } else {#
 if (pre_pr(-2) &&
     (prl_edzepr(-1)||prq_edzepr(-1)||mest_pr(-1)) && s(-2,-1) )
 { rett=stopp=1; d[142]++; if(dbg){print "D142"}; continue };
 if ( pre_pr(-1)||w(-1,"по") && s(-1,-1) )
 { rett=stopp=1; d[143]++; if(dbg){print "D143"}; continue };
 };#_#_#
break}; return rett }

function sw_mn_i_f(rett, stopp) { while (stopp == 0) {
 if ( edro2mnim==1 )
 { edro2mnim==""; rett=stopp=1; d[144]++; if(dbg){print "D144"}; continue };

 if ( gl_vzmn(-1) && s(-1,-1) )
 { rett=stopp=1; d[145]++; if(dbg){print "D145"}; continue };
 if ( (qf(5,"gl_vzmn")||qf(5,"gl_nemn")) && s(0,qfn-1) )
 { rett=stopp=1; d[146]++; if(dbg){print "D146"}; continue };
 if ( (w(-1,"мы вы они")||suw_mnim(-1)) &&
       (suw_edro(1)||suw_mnro(1)) && sc(-1,"—") )
 { rett=stopp=1; d[147]++; if(dbg){print "D147"}; continue };
 if ( (w(-1,"мы вы они")||suw_mnim(-1)) &&
       (suw_edro(1)||suw_mnro(1)) && s(-1,0) )
 { rett=stopp=1; d[148]++; if(dbg){print "D148"}; continue };
 if ( w(1,"есть") && s(0,0) && p(1) )
 { rett=stopp=1; d[148]++; if(dbg){print "D148"}; continue };
 if ( w(1,"не") &&
      (nar_spos(2)||nar_mest(2)) &&
        gl_mn(3) && s(0,2) )
 { rett=stopp=1; d[148]++; if(dbg){print "D148"}; continue };
 #


 #_#_#
 if (prex == 1) {
 if ( prex_im(-2) &&
      (prl_mnim(-1)||prq_mnim(-1)||mest_mnim(-1)||muk_mnim(-1)) && s(-2,-1) )
 { rett=stopp=1; d[149]++; if(dbg){print "D149"}; continue };
 if ( prex_im(-1) && s(-1,-1) )
 { rett=stopp=1; d[150]++; if(dbg){print "D150"}; continue };
 } else {#
 if ( pre_im(-2) &&
      (prl_mnim(-1)||prq_mnim(-1)||mest_mnim(-1)||muk_mnim(-1)) && s(-2,-1) )
 { rett=stopp=1; d[151]++; if(dbg){print "D151"}; continue };
 if ( pre_im(-1) && s(-1,-1) )
 { rett=stopp=1; d[152]++; if(dbg){print "D152"}; continue };
 };#_#_#
 if ( (prl_mnim(-1)||prq_mnim(-1)||(mest_mnim(-1) && Q(0,"prl_krmn"))||muk_mnim(-1)||wc(-1,"[ео]вы$")) && s(-1,-1) )
 { rett=stopp=1; d[153]++; if(dbg){print "D153"}; continue };
break}; edro2mnim=""; return rett }

function sw_mn_v_f(rett, stopp) { while (stopp == 0) {
 if ( edro2mnvi==1 )
 { rett=stopp=1; d[154]++; if(dbg){print "D154"}; continue };

 #
 if ( W(-3,"не") &&
      (deep_pe(-2)||gl_peed(-2)||gl_pein(-2)||gl_pemn(-2)) &&
        (prl_mnvi(-1)||prq_mnvi(-1)||mest_vi(-1)) && s(-2,-1) )
 { rett=stopp=1; d[155]++; if(dbg){print "D155"}; continue };
 if ( W(-2,"не") &&
      (deep_pe(-1)||gl_peed(-1)||gl_pein(-1)||gl_pemn(-1)) && s(-1,-1) )
 { rett=stopp=1; d[156]++; if(dbg){print "D156"}; continue };
#if ( !(suw_any(-1) && s(-1,-1) && suw_edro(0)) &&
#       (deep_pn(1)||gl_pned(1)||gl_pnin(1)||gl_pnmn(1)) && s(0,0) )
#{ rett=stopp=1; d[157]++; if(dbg){print "D157"}; continue };

 #_#_#
 if (prex == 1) {
 if ( (prex_vi(-2)||preph_vi(-2)) &&
      (prl_mnvi(-1)||prq_mnvi(-1)||mest_pmnim(-1)) && s(-2,-1) )
 { rett=stopp=1; d[158]++; if(dbg){print "D158"}; continue };
 if ( prex_vi(-1) && s(-1,-1) )
 { rett=stopp=1; d[159]++; if(dbg){print "D159"}; continue };
 } else {#
 if ( (pre_vi(-2)||preph_vi(-2)) &&
      (prl_mnvi(-1)||prq_mnvi(-1)||mest_pmnim(-1)) && s(-2,-1) )
 { rett=stopp=1; d[160]++; if(dbg){print "D160"}; continue };
 if ( pre_vi(-1) && s(-1,-1) )
 { rett=stopp=1; d[161]++; if(dbg){print "D161"}; continue };
 };#_#_#
 if ( (preph_vi(-1)||prl_mnvi(-1)||prq_mnvi(-1)||mest_pmnim(-1)) && s(-1,-1) )
 { rett=stopp=1; d[162]++; if(dbg){print "D162"}; continue };
break}; edro2mnvi=""; return rett }

function sw_mn_r_f(rett, stopp) { while (stopp == 0) {
 #
#if ( suw_any(-1) && s(-1,-1) )
#{ rett=stopp=1; d[163]++; if(dbg){print "D163"}; continue };

 #_#_#
 if (prex == 1) {
 if ( (prex_ro(-2)||preph_ro(-2)) &&
      (prl_mnro(-1)||prq_mnro(-1)||qi_ed(-1)||qi_mn(-1)||wc(-1,"^[0-9]+$")) && s(-2,-1) )
 { rett=stopp=1; d[164]++; if(dbg){print "D164"}; continue };
 if ( prex_ro(-1) && s(-1,-1) )
 { rett=stopp=1; d[165]++; if(dbg){print "D165"}; continue };
 } else {#
 if ( (pre_ro(-2)||preph_ro(-2)) &&
      (prl_mnro(-1)||prq_mnro(-1)||qin_im(-1)||wc(-1,"^[0-9]+$")) && s(-2,-1) )
 { rett=stopp=1; d[166]++; if(dbg){print "D166"}; continue };
 if ( pre_ro(-1) && s(-1,-1) )
 { rett=stopp=1; d[167]++; if(dbg){print "D167"}; continue };
 };#_#_#
 if ( (preph_ro(-1)||prl_mnro(-1)||prq_mnro(-1)||qi_ed(-1)||qi_mn(-1)||wc(-1,"^[0-9]+$")) && s(-1,-1) )
 { rett=stopp=1; d[168]++; if(dbg){print "D168"}; continue };

 #
#if ( (qik_im(-1)||qik_mnim(-1)||qik_mnro(-1)) && s(-1,-1) )
 if ( pre_vi(1) &&
      (qi_ed(2)||qi_mn(2)||wc(2,"^[0-9]+$")||w(2,"пару")) && s(0,1) )
 { rett=stopp=1; d[169]++; if(dbg){print "D169"}; continue };
 if ( (qi_ed(-1)||qi_mn(-1)||wc(-1,"^[0-9]+$")||w(-1,"пару")) && s(-1,-1) )
 { rett=stopp=1; d[169]++; if(dbg){print "D169"}; continue };
 if ( !(gl_paedmu_f() && gl_paedmu(0) && s(-1,-1) ) &&
       (qi_ed(1)||qi_mn(1)||wc(1,"^[0-9]+$")) && s(0,0) )
 { rett=stopp=1; d[170]++; if(dbg){print "D170"}; continue };
break}; return rett }

function sw_mn_d_f(rett, stopp) { while (stopp == 0) {
 #_#_#
 if (prex == 1) {
 if ( (prex_da(-2)||preph_da(-2)) &&
      (prl_mnda(-1)||prq_mnda(-1)||qin_da(-1)) && s(-2,-1) )
 { rett=stopp=1; d[171]++; if(dbg){print "D171"}; continue };
 if ( prex_da(-1) && s(-1,-1) )
 { rett=stopp=1; d[172]++; if(dbg){print "D172"}; continue };
 } else {#
 if ( (pre_da(-2)||preph_da(-2)) &&
      (prl_mnda(-1)||prq_mnda(-1)||qin_da(-1)) && s(-2,-1) )
 { rett=stopp=1; d[173]++; if(dbg){print "D173"}; continue };
 if ( pre_da(-1) && s(-1,-1) )
 { rett=stopp=1; d[174]++; if(dbg){print "D174"}; continue };
 };#_#_#
 if ( (preph_da(-1)||prl_mnda(-1)||prq_mnda(-1)||qin_da(-1)) && s(-1,-1) )
 { rett=stopp=1; d[175]++; if(dbg){print "D175"}; continue };
break}; return rett }

function sw_mn_p_f(rett, stopp) { while (stopp == 0) {
 #_#_#
 if (prex == 1) {
 if ( prex_pr(-2) &&
      (prl_mnpr(-1)||prq_mnpr(-1)||qin_pr(-1)) && s(-2,-1) )
 { rett=stopp=1; d[176]++; if(dbg){print "D176"}; continue };
 if ( prex_pr(-1) && s(-1,-1) )
 { rett=stopp=1; d[177]++; if(dbg){print "D177"}; continue };
 } else {#
 if ( pre_pr(-2) &&
      (prl_mnpr(-1)||prq_mnpr(-1)||qin_pr(-1)) && s(-2,-1) )
 { rett=stopp=1; d[178]++; if(dbg){print "D178"}; continue };
 if ( pre_pr(-1) && s(-1,-1) )
 { rett=stopp=1; d[179]++; if(dbg){print "D179"}; continue };
 };#_#_#
break}; return rett }

function pl_em_p_f(rett, stopp) { while (stopp == 0) {
 if ( pre_pr(-1) &&
       (suw_edmupr(1)||suw_edmume(1)) && s(-1,0) )
 { rett=stopp=1; d[180]++; if(dbg){print "D180"}; continue };
break}; return rett }

function pl_es_p_f(rett, stopp) { while (stopp == 0) {
 if ( pre_pr(-1) &&
       suw_edpr(1) && s(-1,0) )
 { rett=stopp=1; d[181]++; if(dbg){print "D181"}; continue };
break}; return rett }

function pl_ez_v_f(rett, stopp) { while (stopp == 0) {
 if ( (pre_vi(-1)||preph_vi(-1)) &&
       suw_edvi(1) && s(-1,0) )
 { rett=stopp=1; d[182]++; if(dbg){print "D182"}; continue };
break}; return rett }

function pl_kr_em_f(rett, stopp) { while (stopp == 0) {
 if ( (w(-2,"я ты он был будь стал")||suw_edmuim(-2)) &&
      prl_kred_sr(-1) && s(-2,-1) && (p(0)||gl_in(1)||pre_any(1)) )
 { rett=stopp=1; d[183]++; if(dbg){print "D183"}; continue };
 if ( (w(-1,"я ты он был будь стал")||suw_edmuim(-1)) && s(-1,-1) && (p(0)||gl_in(1)||pre_any(1)) )
 { rett=stopp=1; d[184]++; if(dbg){print "D184"}; continue };
 if ( w(1,"был было будь стал") && s(0,0) )
 { rett=stopp=1; d[185]++; if(dbg){print "D185"}; continue };
 if ( w(-1,"был будь стал") && s(0,0) )
 { rett=stopp=1; d[186]++; if(dbg){print "D186"}; continue };
break}; return rett }

function pl_kr_ez_f(rett, stopp) { while (stopp == 0) {
 if ( (w(-2,"я ты она была стала")||suw_edzeim(-2)) &&
      prl_kred_sr(-1) && s(-2,-1) )
 { rett=stopp=1; d[187]++; if(dbg){print "D187"}; continue };
 if ( (w(-1,"я ты она была стала")||suw_edzeim(-1)) && s(-1,-1) )
 { rett=stopp=1; d[188]++; if(dbg){print "D188"}; continue };
break}; return rett }

function pl_krmn_f(rett, stopp) { while (stopp == 0) {
 if ( (w(-2,"мы вы они были стали")||(suw_mnim(-2) && Q(-2,"suw_edro"))) &&
      prl_kred_sr(-1) && s(-2,-1) )
 { rett=stopp=1; d[189]++; if(dbg){print "D189"}; continue };
 if ( (w(-1,"мы вы они были стали")||(suw_mnim(-1) && Q(-1,"suw_edro"))) && s(-1,-1) )
 { rett=stopp=1; d[190]++; if(dbg){print "D190"}; continue };
 if ( suw_mnim(-1) && s(-1,-1) && p(-2) )
 { rett=stopp=1; d[191]++; if(dbg){print "D191"}; continue };
break}; return rett }

function gl_inf_f(rett, stopp) { while (stopp == 0) {
 #
 if ( !( (pre_da(-1)||pre_im(-1)||pre_vi(-1)||pre_ro(-1)||pre_pr(-1)) && s(-1,-1)) &&
       (suw_edvi(1)||suw_mnvi(1)||mest_vi(1)) && s(0,0) )
 { rett=stopp=1; d[192]++; if(dbg){print "D192"}; continue };
 #
 if ( !( (pre_da(-1)||pre_im(-1)||pre_vi(-1)||pre_ro(-1)||pre_pr(-1)) && s(-1,-1)) &&
         pre_vi(1) &&
         (suw_edvi(2)||suw_mnvi(2)||mest_vi(2)) && s(0,1) )
 { rett=stopp=1; d[193]++; if(dbg){print "D193"}; continue };
break}; return rett }

function gl_paedmu_f(rett, stopp) { while (stopp == 0) {
 if ( (w(-2,"я ты он")||suw_edmuim(-2)) &&
       (nar_spos(-1)||prl_kred_sr(-1)) && Q(-1,"prl_edmuim") && s(-2,-1) )
 { rett=stopp=1; d[195]++; if(dbg){print "D195"}; continue };
 #
 if ( (w(1,"я ты он")||suw_edmuim(1)) &&
       (prl_kred_sr(2)||gl_in(2)) && Q(1,"prl_edmuim") && s(0,1) )
 { rett=stopp=1; d[196]++; if(dbg){print "D196"}; continue };
 #
 if ( (w(1,"я ты он")||suw_edmuim(1)||prl_kred_sr(1)) && Q(1,"prl_edmuim") && s(0,0) )
 { rett=stopp=1; d[197]++; if(dbg){print "D197"}; continue };
 #
 if ( (w(-1,"я ты он")||suw_edmuim(-1)||prl_kred_sr(-1)||gl_in(-1)) && Q(-1,"prl_edmuim") && s(-1,-1) )
 { rett=stopp=1; d[194]++; if(dbg){print "D194"}; continue };
break}; return rett }

function gl_pamn_f(rett, stopp) { while (stopp == 0) {
 #
 if ( (suw_mnim(-2)||w(-2,"мы вы они")) &&
        prl_kred_sr(-1) && s(-2,-1) )
 { rett=stopp=1; d[198]++; if(dbg){print "D198"}; continue };
 #
 if ( (suw_mnim(-1)||w(-1,"мы вы они")) && s(-1,-1) )
 { rett=stopp=1; d[199]++; if(dbg){print "D199"}; continue };
break}; return rett }

function gl_pomn_f(rett, stopp) { while (stopp == 0) {
 #
 if ( (gl_poed(-4)||gl_pomn(-4)||gl_povzmn(-4)) &&
        w(-3,"что") &&
        (gl_ed(-2)||gl_nemn(-2)||gl_pemn(-2)||gl_pnmn(-2)) &&
          w(-1,"и") && s(-4,-1) )
 { rett=stopp=1; d[200]++; if(dbg){print "D200"}; continue };
 #
 if ( w(-2,"так") &&
       w(-1,"что вот") && s(-2,-1) )
 { rett=stopp=1; d[201]++; if(dbg){print "D201"}; continue };
break}; return rett }

function gl_ed1e_f(rett, stopp) { while (stopp == 0) {
 #
 if ( w(-2,"я") &&
      (prl_kred_sr(-1)||nar_mest(-1)||nar_spos(-1)) &&
       (suw_edvi(1)||suw_mnvi(1)||pre_any(1)) && s(-2,0) )
 { rett=stopp=1; d[202]++; if(dbg){print "D202"}; continue };
 if ( w(-1,"я") &&
      (prl_kred_sr(1)||nar_mest(1)||nar_spos(1)) &&
       (suw_edvi(2)||suw_mnvi(2)||pre_any(2)) && s(-1,1) )
 { rett=stopp=1; d[203]++; if(dbg){print "D203"}; continue };
 if ( w(-1,"я") &&
      (suw_edvi(1)||suw_mnvi(1)||nar_napr(1)||nar_spos(1)||gl_in(1)||pre_any(1)) && s(-1,0) )
 { rett=stopp=1; d[204]++; if(dbg){print "D204"}; continue };
 if ( w(-1,"я") && s(-1,-1) && p(0) )
 { rett=stopp=1; d[205]++; if(dbg){print "D205"}; continue };
break}; return rett }

function gl_mn1e_f(rett, stopp) { while (stopp == 0) {
 #
 if ( wb(-5,"мы если когда коли куда") && s(wbn,-1) )
 { rett=stopp=1; d[206]++; if(dbg){print "D206"}; continue };
 #
 if ( p(-1) && p(0) )
 { rett=stopp=1; d[207]++; if(dbg){print "D207"}; continue };
break}; return rett }

function gl_paedze_f(rett, stopp) { while (stopp == 0) {
 #
 if ( wb(-5,"я ты вы она") && s(wbn,-1) )
 { rett=stopp=1; d[208]++; if(dbg){print "D208"}; continue };
 #
 if ( qb(-5,"suw_edzeim") && s(qbn,-1) )
 { rett=stopp=1; d[209]++; if(dbg){print "D209"}; continue };
 if ( suw_edzeim(-3) && s(-3,-3) &&
       gl_ed(-2) && sc(-2,",") &&
        w(-1,"что как") && s(-1,-1) )
 { rett=stopp=1; d[209]++; if(dbg){print "D209"}; continue };
break}; return rett }

function gl_mn2e_f(rett, stopp) { while (stopp == 0) {
 #
 if ( wb(-5,"будто где если зачем когда коли которого которую которые который которых куда насколько небось откуда пока почему пошто сколько что") &&
      (p(wbn-1)||sc(wbn-1,"[pv]")||souz(wbn-1)||qast(wbn-1)) && s(wbn,-1) )
 { rett=stopp=1; d[210]++; if(dbg){print "D210"}; continue };
 #
 if ( wb(-5,"как") &&
       w(wbn-1,"бы долго же") && s(wbn,-1) )
 { rett=stopp=1; d[211]++; if(dbg){print "D211"}; continue };
 #
 if ( sc(0,"?") )
 { rett=stopp=1; d[212]++; if(dbg){print "D212"}; continue };
break}; return rett }

