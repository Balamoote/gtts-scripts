# Набор правил обработки для deomo.awk в виде специфицеских для класса слова. Вынесены в отдельный файл, чтобы не загромождать основной файл.
# let @a=1|%s/"D\zs\d\+\ze"/\=''.(@a+setreg('a',@a+1))/g|%s/ d\[\zs\d\+\ze\]++; if(dbg){print "D\(\d\+\)"/\1/g 
# При срабатывании функции выдают значение TRUE, при вызове аргументы НЕ указываются.
function sw_im_f(rett, stopp) { while (stopp == 0) {
 #
 cst_gl = "цвету суть кучу тону толщу"
 cst0   = "дома повести велики"
 if ( W(0,cst0) ) {
    #
    if ( mod_ed(-2) && gl_needge(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
         W(-1,"быть") )
    { rett=stopp=1; d[1]++; if(dbg){print "D1"}; continue };
    if ( q(-1,"gl_needge deep_ne") && s(-1,-1) && p(0) &&
         W(-1,cst_gl) )
    { rett=stopp=1; d[2]++; if(dbg){print "D2"}; continue };
    if ( q(1,"gl_nein gl_needge deep_ne") && s(0,0) && p(-1) &&
         W(1,cst_gl) )
    { rett=stopp=1; d[3]++; if(dbg){print "D3"}; continue };
    #
    if ( mod_ed(-2) && gl_peedge(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
         W(-1,"быть") )
    { rett=stopp=1; d[4]++; if(dbg){print "D4"}; continue };
    if ( gl_peedge(-1) && s(-1,-1) && p(0) &&
         W(-1,cst_gl) )
    { rett=stopp=1; d[5]++; if(dbg){print "D5"}; continue };
    if ( q(1,"gl_pein gl_peedge deep_pe") && s(0,0) && p(-1) &&
         W(1,cst_gl) )
    { rett=stopp=1; d[6]++; if(dbg){print "D6"}; continue };
 #
 if ( suw_edmuim(0) ) {
    #
    if ( mod_ed(-2) && gl_needmu(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
      W(-1,"быть") )
    { rett=stopp=1; d[7]++; if(dbg){print "D7"}; continue };
    if ( gl_needmu(-1) && s(-1,-1) && p(0) &&
          W(-1,cst_gl) )
    { rett=stopp=1; d[8]++; if(dbg){print "D8"}; continue };
    if ( gl_needmu(1) && s(0,0) && p(-1) &&
          W(1,cst_gl) )
    { rett=stopp=1; d[9]++; if(dbg){print "D9"}; continue };
    #
    if ( mod_ed(-2) && gl_peedmu(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
      W(-1,"быть") )
    { rett=stopp=1; d[10]++; if(dbg){print "D10"}; continue };
    if ( gl_peedmu(-1) && s(-1,-1) && p(0) &&
          W(-1,cst_gl) )
    { rett=stopp=1; d[11]++; if(dbg){print "D11"}; continue };
    if ( gl_peedmu(1) && s(0,0) && p(-1) &&
          W(1,cst_gl) )
    { rett=stopp=1; d[12]++; if(dbg){print "D12"}; continue };
 };
 if ( suw_edsrim(0) ) {
    #
    if ( mod_ed(-2) && gl_needsr(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
      W(-1,"быть") )
    { rett=stopp=1; d[13]++; if(dbg){print "D13"}; continue };
   if ( gl_needsr(-1) && s(-1,-1) && p(0) &&
         W(-1,cst_gl) )
   { rett=stopp=1; d[14]++; if(dbg){print "D14"}; continue };
   if ( gl_needsr(1) && s(0,0) && p(-1) &&
         W(1,cst_gl) )
   { rett=stopp=1; d[15]++; if(dbg){print "D15"}; continue };
    #
    if ( mod_ed(-2) && gl_peedsr(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
      W(-1,"быть") )
    { rett=stopp=1; d[16]++; if(dbg){print "D16"}; continue };
   if ( gl_peedsr(-1) && s(-1,-1) && p(0) &&
         W(-1,cst_gl) )
   { rett=stopp=1; d[17]++; if(dbg){print "D17"}; continue };
   if ( gl_peedsr(1) && s(0,0) && p(-1) &&
         W(1,cst_gl) )
   { rett=stopp=1; d[18]++; if(dbg){print "D18"}; continue };
 };
 if ( suw_edzeim(0) ) {
    #
    if ( mod_ed(-2) && gl_needze(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
      W(-1,"быть") )
    { rett=stopp=1; d[19]++; if(dbg){print "D19"}; continue };
    if ( gl_needze(-1) && s(-1,-1) && p(0) &&
          W(-1,cst_gl) )
    { rett=stopp=1; d[20]++; if(dbg){print "D20"}; continue };
    if ( gl_needze(1) && s(0,0) && p(-1) &&
          W(1,cst_gl) )
    { rett=stopp=1; d[21]++; if(dbg){print "D21"}; continue };
    #
    if ( mod_ed(-2) && gl_peedze(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
      W(-1,"быть") )
    { rett=stopp=1; d[22]++; if(dbg){print "D22"}; continue };
    if ( gl_peedze(-1) && s(-1,-1) && p(0) &&
          W(-1,cst_gl) )
    { rett=stopp=1; d[23]++; if(dbg){print "D23"}; continue };
    if ( gl_peedze(1) && s(0,0) && p(-1) &&
          W(1,cst_gl) )
    { rett=stopp=1; d[24]++; if(dbg){print "D24"}; continue };
 };
 if ( suw_mnim(0) ) {
    #
    if ( mod_ed(-2) && gl_nemn(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
      W(-1,"быть") )
    { rett=stopp=1; d[25]++; if(dbg){print "D25"}; continue };
    if ( q(-1,"gl_nemn gl_vzmn") && s(-1,-1) && p(0) &&
          W(-1,cst_gl) )
    { rett=stopp=1; d[26]++; if(dbg){print "D26"}; continue };
    if ( q(1,"gl_nemn gl_vzmn") && s(0,0) && p(-1) &&
          W(1,cst_gl) )
    { rett=stopp=1; d[27]++; if(dbg){print "D27"}; continue };
    #
    if ( mod_ed(-2) && gl_pemn(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
      W(-1,"быть") )
    { rett=stopp=1; d[28]++; if(dbg){print "D28"}; continue };
    if ( gl_pemn(-1) && s(-1,-1) && p(0) &&
          W(-1,cst_gl) )
    { rett=stopp=1; d[29]++; if(dbg){print "D29"}; continue };
    if ( gl_pemn(1) && s(0,0) && p(-1) &&
          W(1,cst_gl) )
    { rett=stopp=1; d[30]++; if(dbg){print "D30"}; continue };
 };};

break}; return rett }

function sw_da_f(rett, stopp) { while (stopp == 0) {
 #
 if ( q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && nmark(-1,"GG","Ud") && s(-1,-1) )
 { rett=stopp=1; d[31]++; if(dbg){print "D31"}; continue };
 if ( q(1,"gl_pnin gl_pned gl_pnmn deep_pn") && nmark(1,"GG","Ud") && s(0,0) &&
       W(0,"смогу") )
 { rett=stopp=1; d[32]++; if(dbg){print "D32"}; continue };

break}; return rett }

function sw_tv_f(rett, stopp) { while (stopp == 0) {
 #
 if ( q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && nmark(-1,"GG","Ut") && s(-1,-1) )
 { rett=stopp=1; d[33]++; if(dbg){print "D33"}; continue };
 if ( q(1,"gl_pnin gl_pned gl_pnmn deep_pn") && nmark(1,"GG","Ut") && s(0,0) )
 { rett=stopp=1; d[34]++; if(dbg){print "D34"}; continue };

break}; return rett }

function sw_ro_f(rett, stopp) { while (stopp == 0) {
 if ( q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && nmark(-1,"GG","Nnero") && s(-1,-1) )
 { rett=0; stopp=1; d[35]++; if(dbg){print "D35"}; continue };
 if ( q(-1,"gl_pein gl_peed gl_pemn deep_pe") && nmark(-1,"GG","Nnero") && s(-1,-1) )
 { rett=0; stopp=1; d[36]++; if(dbg){print "D36"}; continue };
 if ( q(-1,"gl_nein gl_need gl_nemn gl_vzed deep_ne") && nmark(-1,"GG","Nnero") && s(-1,-1) )
 { rett=0; stopp=1; d[37]++; if(dbg){print "D37"}; continue };


 if ( q(-2,"mest_ro suw_edro suw_mnro") &&
       q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && nmark(-1,"GG","Ur") && s(-2,-1) )
 { rett=0; stopp=1; d[38]++; if(dbg){print "D38"}; continue };
 if ( q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && nmark(-1,"GG","Ur") && s(-1,-1) )
 { rett=stopp=1; d[39]++; if(dbg){print "D39"}; continue };
 if ( q(-1,"gl_nein gl_need gl_nemn deep_ne") && nmark(-1,"GG","Ur") && s(-1,-1) )
 { rett=stopp=1; d[40]++; if(dbg){print "D40"}; continue };
 if ( q(1,"gl_pein gl_peed gl_pemn") && nmark(1,"GG","Ur") && s(0,0) && p(-1) )
 { rett=stopp=1; d[41]++; if(dbg){print "D41"}; continue };
 
 if ( q(-1,"suw_edim suw_mnim") && qv(-1,"prl_edim prl_mnim mest_im") &&
       q(1,"gl_pein gl_peed gl_pemn gl_pnin gl_pned gl_pnmn") &&
        q(2,"prl_edvi prl_mnvi mest_vi") &&
         q(3,"suw_edvi suw_mnvi") && s(-1,2) )
 { rett=stopp=1; d[42]++; if(dbg){print "D42"}; continue };
 if ( q(-1,"suw_edim suw_mnim") && qv(-1,"prl_edim prl_mnim mest_im") &&
       q(1,"gl_pein gl_peed gl_pemn gl_pnin gl_pned gl_pnmn") &&
        q(2,"suw_edvi suw_mnvi gl_in prl_kred_sr mest_vi nar_step") && s(-1,1) )
 { rett=stopp=1; d[43]++; if(dbg){print "D43"}; continue };

 if ( q(-1,"suw_edtv suw_mntv") &&
	 q(1,"gl_pein gl_peed gl_pemn") && s(-1,0) )
 { rett=stopp=1; d[44]++; if(dbg){print "D44"}; continue };
 if ( q(-1,"suw_edda suw_mnda") &&
	 q(1,"gl_pein gl_peed gl_pemn") && s(-1,0) )
 { rett=stopp=1; d[45]++; if(dbg){print "D45"}; continue };

 if ( q(-5,"mest_im suw_edim suw_mnim") &&
       pre_ro(-4) &&
       q(-3,"prl_edro prl_mnro mest_ro") &&
        q(-2,"prl_edro prl_mnro") &&
         q(-1,"suw_edro suw_mnro") && s(-5,-1) )
 { rett=stopp=1; d[46]++; if(dbg){print "D46"}; continue };
 if ( q(-4,"mest_im suw_edim suw_mnim") &&
        pre_ro(-3) &&
        q(-2,"prl_edro prl_mnro mest_ro") &&
         q(-1,"suw_edro suw_mnro") && s(-4,-1) )
 { rett=stopp=1; d[47]++; if(dbg){print "D47"}; continue };
 if ( q(-3,"mest_im suw_edim suw_mnim") && prex!=1 &&
        pre_ro(-2) &&
         q(-1,"suw_edro suw_mnro") && s(-3,-1) )
 { rett=stopp=1; d[48]++; if(dbg){print "D48"}; continue };

 if ( w(-2,"не") &&
       q(-1,"gl_ed gl_in gl_mn gl_poed gl_pomn deep") && s(-2,-1) )
 { rett=stopp=1; d[49]++; if(dbg){print "D49"}; continue };
 if ( w(-3,"не") &&
       (q(-2,"gl_ed gl_in gl_mn gl_poed gl_pomn deep")||w(-2,"нет")) &&
         w(-1,"и ни никакого никакой никаких") && s(-3,-1) )
 { rett=stopp=1; d[50]++; if(dbg){print "D50"}; continue };


break}; edro2mnim=""; return rett }

function sw_edro_f(rett,   stopp) { while (stopp == 0) {
 # родительный падеж: массовая обработка
 if ( q(-3,"gl_pnin gl_pned gl_pnmn deep_pn") && nmark(-3,"GG","Pt-v") &&
       pre_tv(-2) &&
        q(-1,"suw_edtv suw_mntv mest_tv") && s(-2,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[51]++; if(dbg){print "D51"}; continue };
 if ( !(w(-4,"не") && s(-4,-4)) && nmark(-3,"GG","Pd-v") &&
        q(-3,"gl_pnin gl_pned gl_pnmn deep_pn") &&
         pre_da(-2) &&
          q(-1,"suw_edda suw_mnda mest_da") && s(-3,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[52]++; if(dbg){print "D52"}; continue };


 if ( narph_any(-1) &&
       gl_nemn(xsn-1) && s(xsn-1,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[53]++; if(dbg){print "D53"}; continue };

 if ( se(-1,"-") && suw_mnim(0) && suw_mnim(-1) && prl_mnim(-2) )
 { rett=0; edro2mnim=1; stopp=1; d[54]++; if(dbg){print "D54"}; continue };
 if ( se(-1,"-") && suw_mnim(0) && suw_mnim(-1) && Q(-1,"suw_edro") )
 { rett=0; edro2mnim=1; stopp=1; d[55]++; if(dbg){print "D55"}; continue };
 

 if ( !(w(-2,"не") && s(-2,-2)) &&
      deep_na(-1) && s(-1,-1) )
 { rett=0; stopp=1; d[56]++; if(dbg){print "D56"}; continue };
 if ( suw_edzeim(-1) && (wmark("Ycla","paedze")||wmark("Ycla","plkrez")) && s(-1,-1) )
 { rett=0; stopp=1; d[57]++; if(dbg){print "D57"}; continue };
 if ( suw_mnim(-1) && wmark("Ycla","pamn") && s(-1,-1) )
 { rett=0; stopp=1; d[58]++; if(dbg){print "D58"}; continue };
 if ( q(-1,"preph_vi preph_da preph_tv") && s(-1,-1))
 { rett=0; stopp=1; d[59]++; if(dbg){print "D59"}; continue };
 if ( !(w(-3,"не") && s(-3,-3)) && !(wmark("Yro","part")) &&
         q(-2,"gl_pein gl_peed gl_pemn deep_pe") &&
          q(-1,"suw_edtv suw_mntv mest_tv") && suw_mnvi(0) && s(-2,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[60]++; if(dbg){print "D60"}; continue };
 if ( !(w(-3,"не") && s(-3,-3)) &&
         prq_any(-6) &&
          pre_pr(-5) &&
           q(-4,"suw_edpr suw_mnpr") &&
            pre_tv(-3) && q(-2,"mest_mntv prl_mntv prq_mntv") &&
             suw_mntv(-1) && suw_mnvi(0) && s(-5,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[61]++; if(dbg){print "D61"}; continue };
 if ( !(w(-3,"не") && s(-3,-3)) && !(wmark("Yro","part")) &&
         q(-2,"gl_pnin gl_pned gl_pnmn deep_pn") &&
          q(-1,"suw_edtv suw_mntv mest_tv") && suw_mnvi(0) && s(-2,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[62]++; if(dbg){print "D62"}; continue };
 if ( !(w(-3,"не") && s(-3,-3)) && !(wmark("Yro","part")) &&
         q(-2,"gl_pein gl_peed gl_pemn gl_vzmn deep_pe") &&
          q(-1,"suw_edda suw_mnda mest_da") && suw_mnvi(0) && Q(0,"gl_in") && s(-2,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[63]++; if(dbg){print "D63"}; continue };
 if ( !(w(-3,"не") && s(-3,-3)) && !(wmark("Yro","part")) &&
         q(-2,"gl_pnin gl_pned gl_pnmn deep_pn") &&
          q(-1,"suw_edda suw_mnda mest_da") && suw_mnvi(0) && Q(0,"gl_in") && s(-2,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[64]++; if(dbg){print "D64"}; continue };
 if ( swc_edtv(-1) &&
     !(w(xsn-2,"не") && s(xsn-2,xsn-2)) &&
        q(xsn-1,"gl_pnin gl_pned gl_pnmn deep_pn") &&
         suw_mnvi(0) && s(xsn-1,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[65]++; if(dbg){print "D65"}; continue };
 if ( q(-4,"prl_mnim prq_mnim") &&
       pre_ro(-3) &&
        q(-2,"prl_edro prl_mnro") &&
         q(-1,"suw_edro suw_mnro") && suw_mnvi(0) && s(-4,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[66]++; if(dbg){print "D66"}; continue };
 if ( q(-3,"prl_mnim prq_mnim") &&
       pre_ro(-2) &&
        q(-1,"suw_edro suw_mnro") && suw_mnvi(0) && s(-3,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[67]++; if(dbg){print "D67"}; continue };
 if ( q(-3,"prl_mnim prq_mnim") &&
       q(-2,"suw_edtv suw_mntv") &&
        q(-1,"suw_edro suw_mnro") && suw_mnvi(0) && s(-3,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[68]++; if(dbg){print "D68"}; continue };
 if ( gl_nemn(-3) &&
       q(-2,"prl_mnim prq_mnim") &&
        q(-1,"suw_edtv suw_mntv") &&
         suw_mnvi(0) && s(-3,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[69]++; if(dbg){print "D69"}; continue };
 if ( q(-4,"prl_mn prq_mn") && sc(-4,",") &&
       pre_pr(-3) &&
        suw_mnpr(-2) &&
         q(-1,"suw_edro suw_mnro") && suw_mnvi(0) && s(-3,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[70]++; if(dbg){print "D70"}; continue };
 if ( pre_ro(-2) &&
       q(-1,"suw_edro suw_mnro") &&
        q(1,"prl_krmn gl_mn") && suw_mnvi(0) && s(-2,0) && sv(-2,0,"-") && p(1) )
 { rett=0; edro2mnvi=1; stopp=1; d[71]++; if(dbg){print "D71"}; continue };
 if ( q(-4,"prl_mnim prq_mnim") &&
       pre_pr(-3) &&
        mest_pr(-2) &&
         q(-1,"suw_edpr suw_mnpr") && s(-4,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[72]++; if(dbg){print "D72"}; continue };
 if ( q(-4,"gl_pned gl_pnmn") &&
       nar_kaq(-3) &&
        pre_da(-2) &&
         q(-1,"suw_edda suw_mnda mest_da") && s(-4,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[73]++; if(dbg){print "D73"}; continue };
 if ( (q(-4,"prl_srav nar_srav")||w(-4,"более мало менее много столько сколько")) &&
        pre_da(-3) && s(-4,-3) &&
         q(-2,"suw_edda suw_mnda") && sc(-2,",") &&
          w(-1,"чем нежели") && s(-1,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[74]++; if(dbg){print "D74"}; continue };
 if ( (q(-2,"prl_srav nar_srav")||w(-2,"более мало менее много столько сколько")) && sc(-2,",") &&
        w(-1,"чем нежели") && s(-1,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[75]++; if(dbg){print "D75"}; continue };

 if ( q(1,"suw_edro suw_mnro isname") &&
       q(2,"nar_spos prl_kred_sr") &&
        q(3,"gl_nemn gl_vzmn") && s(0,2) )
 { rett=0; edro2mnvi=1; stopp=1; d[76]++; if(dbg){print "D76"}; continue };


 if ( wmark("Yro","part") &&
       q(-2,"gl_pein gl_peed gl_pemn deep_pe") &&
        q(-1,"suw_edtv suw_mntv suw_edda suw_mnda mest_da mest_tv") && suw_mnim(0) && s(-2,-1) )
 { rett=stopp=1; d[77]++; if(dbg){print "D77"}; continue };
 if ( p(-2) &&
       suw_any(-1) && s(-1,-1) && sv(-1,-1,"-") &&
   qv(-1,"souz qast pre_any prl_any prq_any mest_ed mest_mn gl_ed gl_pemn gl_pnmn gl_nemn nar_vrem narph_any gl_poed" ) )
 { rett=stopp=1; d[78]++; if(dbg){print "D78"}; continue };
 if ( !(pre_any(-2) && s(-2,-2)) &&
      suw_any(-1) && s(-1,-1) && (p(0)||w(1,"и или")||pre_any(1)) &&
   qv(-1,"souz qast pre_any prl_ed prl_mn mest_ed mest_mn gl_ed gl_pemn gl_pnmn gl_nemn nar_vrem narph_any gl_poed") )
 { rett=stopp=1; d[79]++; if(dbg){print "D79"}; continue };
 if ( pre_any(-2) && p(-3) &&
       suw_any(-1) && s(-2,-1) && Q(-1,"narph_any") &&
   qv(-1,"souz qast pre_any prl_any prq_any mest_ed mest_mn gl_ed gl_pemn gl_pnmn gl_nemn nar_vrem narph_any") )
 { rett=stopp=1; d[80]++; if(dbg){print "D80"}; continue };
 if ( q(-2,"prl_any prq_any mest_any souz") && p(-4) &&
       q(-2,"prl_any prq_any") &&
        suw_any(-1) && s(-3,-1) &&
   qv(-1,"souz qast pre_any prl_any prq_any mest_ed mest_mn gl_ed gl_pemn gl_pnmn gl_nemn nar_vrem narph_any") )
 { rett=stopp=1; d[81]++; if(dbg){print "D81"}; continue };
 if ( q(-2,"prl_any prq_any mest_any souz") && p(-3) &&
       suw_any(-1) && s(-2,-1) &&
   qv(-1,"souz qast pre_any prl_any prq_any mest_ed mest_mn gl_ed gl_pemn gl_pnmn gl_nemn nar_vrem narph_any") )
 { rett=stopp=1; d[82]++; if(dbg){print "D82"}; continue };
 if ( !(pre_any(-2) && s(-2,-2)) &&
      suw_any(-1) && s(-1,-1) && (p(0)||w(1,"и или")||pre_any(1)) &&
   qv(-1,"souz qast pre_any prl_ed prl_mn mest_ed mest_mn gl_ed gl_pemn gl_pnmn gl_nemn nar_vrem narph_any") )
 { rett=stopp=1; d[83]++; if(dbg){print "D83"}; continue };
 if ( suw_edzeim(-1) && qf(5,"gl_paedze") && s(-1,qfn-1) &&
   qv(-1,"souz qast pre_any prl_ed prl_mn mest_ed mest_mn gl_ed gl_pemn gl_pnmn gl_nemn nar_vrem narph_any gl_poed") )
 { rett=stopp=1; d[84]++; if(dbg){print "D84"}; continue };
 if ( prq_any(-2) &&
       q(-1,"suw_edtv suw_mntv") && s(-2,-1) &&
   qv(-1,"souz qast pre_any prl_ed prl_mn mest_ed mest_mn gl_ed gl_pemn gl_pnmn gl_nemn nar_vrem narph_any") )
 { rett=stopp=1; d[85]++; if(dbg){print "D85"}; continue };
 if ( pre_ro(-2) &&
       q(-1,"suw_edro suw_mnro mest_ro") &&
        w(1,"не") && mod_bz(2) && s(-2,1) )
 { rett=stopp=1; d[86]++; if(dbg){print "D86"}; continue };
 if ( q(-3,"gl_need gl_nemn") &&
       pre_pr(-2) &&
        q(-1,"suw_edpr suw_mnpr mest_pr") && s(-3,-1) )
 { rett=stopp=1; d[87]++; if(dbg){print "D87"}; continue };
 if ( w(-1,"пол") && sc(-1,"-") )
 { rett=stopp=1; d[88]++; if(dbg){print "D88"}; continue };
 if ( w(-1,"ни") && sc(0,",") && w(1,"ни") && q(2,"suw_edro suw_mnro") && qv(2,"suw_mnim") )
 { rett=stopp=1; d[89]++; if(dbg){print "D89"}; continue };
 if ( w(-3,"ни") && suw_edro(-2) && suw_mnim(-2) && sc(2,",") && w(-1,"ни") )
 { rett=stopp=1; d[90]++; if(dbg){print "D90"}; continue };
 if ( w(1,"не") && q(2,"gl_pein gl_pnin") && s(0,1) )
 { rett=stopp=1; d[91]++; if(dbg){print "D91"}; continue };
 if ( (q(-2,"prl_srav nar_srav")||w(-2,"более мало менее много столько сколько")) &&
       (q(-1,"prl_edro prq_edro")||w(-1,"же")) && s(-2,-1) && !(gl_in(1) && s(0,0)) )
 { rett=stopp=1; d[92]++; if(dbg){print "D92"}; continue };
 if ( (q(-1,"prl_srav nar_srav")||w(-1,"более мало менее много столько сколько")) && s(-1,-1) && !(gl_in(1) && s(0,0)) )
 { rett=stopp=1; d[93]++; if(dbg){print "D93"}; continue };
 if ( q(-2,"gl_pnin gl_pnin gl_pned gl_pnmn deep_pn") && qv(-2,"gl_poed gl_pomn") &&
       q(-1,"suw_edda suw_mnda mest_da") && suw_mnim(0) && Q(0,"gl_in") && s(-2,-1) && (p(0)||w(1,"и или")||pre_any(1)) )
 { rett=stopp=1; d[94]++; if(dbg){print "D94"}; continue };
 if ( q(-2,"gl_nein gl_nein gl_need gl_nemn deep_ne") && qv(-2,"gl_poed gl_pomn") &&
       q(-1,"suw_edda suw_mnda mest_da") && suw_mnim(0) && Q(0,"gl_in") && s(-2,-1) && (p(0)||w(1,"и или")||pre_any(1)) )
 { rett=stopp=1; d[95]++; if(dbg){print "D95"}; continue };

 if ( q(-3,"pre_tv preph_tv") &&
       q(-2,"suw_edtv suw_mntv mest_tv") &&
        q(-1,"suw_edtv suw_mntv") && s(-3,-1) )
 { rett=stopp=1; d[96]++; if(dbg){print "D96"}; continue };
 if ( pre_pr(-3) &&
       q(-2,"prl_edpr prq_edpr mest_pr") &&
        q(-1,"suw_edpr suw_mnpr suw_edme") && s(-3,-1) &&
        !(w(1,"не") && gl_pnmn(2) && s(0,1)) )
 { rett=stopp=1; d[97]++; if(dbg){print "D97"}; continue };
 if ( pre_pr(-4) &&
       prq_edpr(-3) &&
        q(-2,"suw_edtv suw_mntv") &&
         q(-1,"suw_edda suw_mnda suw_edme") && s(-4,-1) )
 { rett=stopp=1; d[98]++; if(dbg){print "D98"}; continue };

 if ( pre_da(-3) &&
       q(-2,"prl_edda prq_edda mest_da") &&
        q(-1,"suw_edda suw_mnda mest_da") && s(-3,-1) )
 { rett=stopp=1; d[99]++; if(dbg){print "D99"}; continue };
 if ( pre_da(-2) &&
       q(-1,"suw_edda suw_mnda mest_da") && s(-2,-1) )
 { rett=stopp=1; d[100]++; if(dbg){print "D100"}; continue };
 if ( pre_ro(-2) && p(-3) &&
       q(-1,"suw_edro suw_mnro mest_ro") && W(-1,"них") && s(-2,0) )
 { rett=stopp=1; d[101]++; if(dbg){print "D101"}; continue };

break}; return rett }

function sw_em_i_f(rett, stopp) { while (stopp == 0) {
 if ( sw_im_f() )
 { rett=stopp=1; d[102]++; if(dbg){print "D102"}; continue };

 #_#_#
 if (prex == 1) {
 if ( prex_im(-2) &&
       q(-1,"prl_edmuim prq_edmuim muk_edim") && s(-2,-1) )
 { rett=stopp=1; d[103]++; if(dbg){print "D103"}; continue };
 if ( prex_im(-1) && s(-1,-1) )
 { rett=stopp=1; d[104]++; if(dbg){print "D104"}; continue };
 } else {#
 if ( pre_im(-2) &&
       q(-1,"prl_edmuim prq_edmuim muk_edim") && s(-2,-1) )
 { rett=stopp=1; d[105]++; if(dbg){print "D105"}; continue };
 if ( pre_im(-1) && s(-1,-1) )
 { rett=stopp=1; d[106]++; if(dbg){print "D106"}; continue };
 };#_#_#
 if ( q(-1,"prl_edmuim prq_edmuim muk_edim") && s(-1,-1) )
 { rett=stopp=1; d[107]++; if(dbg){print "D107"}; continue };
break}; return rett }

function sw_em_v_f(rett, stopp) { while (stopp == 0) {
 if ( q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && nmark(-1,"GG","Uv") && s(-1,-1) )
 { rett=stopp=1; d[108]++; if(dbg){print "D108"}; continue };
 if ( q(-1,"gl_pein gl_peed gl_pemn deep_pe") && s(-1,-1) &&
     !(q_(0,swo_edmu_ro) && q_(0,sw_edmu_ro)) )
 { rett=stopp=1; d[109]++; if(dbg){print "D109"}; continue };
 #_#_#
 if (prex == 1) {
 if ( q(-3,"prex_vi preph_vi") &&
      (q(-2,"prl_edmuvi prq_edmuvi mest_edmuvi")||wc(-2,"^[0-9]+$")) &&
       (q(-1,"prl_edmuvi prq_edmuvi mest_edmuvi")||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[110]++; if(dbg){print "D110"}; continue };
 if ( q(-2,"prex_vi preph_vi") &&
       q(-1,"prl_edmuvi prq_edmuvi muk_edvi") && s(-2,-1) )
 { rett=stopp=1; d[111]++; if(dbg){print "D111"}; continue };
 if ( prex_vi(-1) && s(-1,-1) )
 { rett=stopp=1; d[112]++; if(dbg){print "D112"}; continue };
 } else {#
 if ( q(-3,"pre_vi preph_vi") &&
      (q(-2,"prl_edmuvi prq_edmuvi mest_edmuvi")||wc(-2,"^[0-9]+$")) &&
       (q(-1,"prl_edmuvi prq_edmuvi mest_edmuvi")||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[113]++; if(dbg){print "D113"}; continue };
 if ( q(-2,"pre_vi preph_vi") &&
       q(-1,"prl_edmuvi prq_edmuvi muk_edvi") && s(-2,-1) )
 { rett=stopp=1; d[114]++; if(dbg){print "D114"}; continue };
 if ( pre_vi(-1) && s(-1,-1) )
 { rett=stopp=1; d[115]++; if(dbg){print "D115"}; continue };
 };#_#_#
 if ( q(-1,"preph_vi prl_edmuvi prq_edmuvi muk_edvi") && s(-1,-1) )
 { rett=stopp=1; d[116]++; if(dbg){print "D116"}; continue };
break}; return rett }

function sw_em_d_f(rett, stopp) { while (stopp == 0) {
 if ( sw_da_f() )
 { rett=stopp=1; d[117]++; if(dbg){print "D117"}; continue };
#if ( q(-2,"gl_nein gl_need gl_nemn deep_ne") && nmark(-2,"GG","Pd-t") &&
#        pre_da(-1) && s(-2,-1) )
#{ rett=stopp=1; d[118]++; if(dbg){print "D118"}; continue };
 if ( q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && nmark(-1,"GG","Ud") && s(-1,-1) )
 { rett=stopp=1; d[119]++; if(dbg){print "D119"}; continue };
 if ( q(-1,"gl_pein gl_peed gl_pemn deep_pe") && nmark(-1,"GG","Ud") && s(-1,-1) )
 { rett=stopp=1; d[120]++; if(dbg){print "D120"}; continue };

 if ( w(-1,"без") && s(-1,-1) )
 { rett=stopp=1; d[121]++; if(dbg){print "D121"}; continue };

 #_#_#
 if (prex == 1) {
 if ( q(-3,"prex_da preph_da") &&
      (q(-2,"prl_edmuda prq_edmuda mest_edmuda")||wc(-2,"^[0-9]+$")) &&
       (q(-1,"prl_edmuda prq_edmuda mest_edmuda")||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[122]++; if(dbg){print "D122"}; continue };
 if ( q(-2,"prex_da preph_da") &&
      (q(-1,"prl_edmuda prq_edmuda mest_edmuda")||wc(-1,"^[0-9]+$")) && s(-2,-1) )
 { rett=stopp=1; d[123]++; if(dbg){print "D123"}; continue };
 if ( prex_da(-1) && s(-1,-1) )
 { rett=stopp=1; d[124]++; if(dbg){print "D124"}; continue };
 } else {#
 if ( q(-3,"pre_da preph_da") &&
      (q(-2,"prl_edmuda prq_edmuda mest_edmuda")||wc(-2,"^[0-9]+$")) &&
       (q(-1,"prl_edmuda prq_edmuda mest_edmuda")||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[125]++; if(dbg){print "D125"}; continue };
 if ( q(-2,"pre_da preph_da") &&
      (q(-1,"prl_edmuda prq_edmuda mest_edmuda")||wc(-1,"^[0-9]+$")) && s(-2,-1) )
 { rett=stopp=1; d[126]++; if(dbg){print "D126"}; continue };
 if ( pre_da(-1) && s(-1,-1) )
 { rett=stopp=1; d[127]++; if(dbg){print "D127"}; continue };
 };#_#_#
 if ( (q(-1,"preph_da prl_edmuda prq_edmuda mest_edmuda")||wc(-1,"^[0-9]+$")) && W(-1,"ему") && s(-1,-1) )
 { rett=stopp=1; d[128]++; if(dbg){print "D128"}; continue };
break}; return rett }

function sw_em_r_f(rett, stopp) { while (stopp == 0) {
 if ( sw_ro_f() )
 { rett=stopp=1; d[129]++; if(dbg){print "D129"}; continue };

 #
 if ( (w(-2,"нет")||q(-2,"pre_ro qi_duom")) &&
        q(-1,"prl_mnro prq_mnro mest_mnro") && s(-2,-1) )
 { rett=stopp=1; d[130]++; if(dbg){print "D130"}; continue };
 if ( (w(-1,"нет")||q(-1,"pre_ro qi_duom")) && s(-1,-1) )
 { rett=stopp=1; d[131]++; if(dbg){print "D131"}; continue };

 #_#_#
 if (prex == 1) {
 if ( q(-3,"prex_ro preph_ro") &&
      (q(-2,"prl_edmuro prq_edmuro mest_edmuro")||wc(-2,"^[0-9]+$")) &&
       (q(-1,"prl_edmuro prq_edmuro mest_edmuro")||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[132]++; if(dbg){print "D132"}; continue };
 if ( q(-2,"prex_ro preph_ro") &&
      (q(-1,"prl_edmuro prq_edmuro mest_edmuro")||wc(-1,"^[0-9]+$")) && s(-2,-1) )
 { rett=stopp=1; d[133]++; if(dbg){print "D133"}; continue };
 if ( prex_ro(-1) && s(-1,-1) )
 { rett=stopp=1; d[134]++; if(dbg){print "D134"}; continue };
 } else {#
 if ( q(-3,"pre_ro preph_ro") &&
      (q(-2,"prl_edmuro prq_edmuro mest_edmuro")||wc(-2,"^[0-9]+$")) &&
       (q(-1,"prl_edmuro prq_edmuro mest_edmuro")||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[135]++; if(dbg){print "D135"}; continue };
 if ( pre_ro(-2) &&
      (q(-1,"prl_edmuro prq_edmuro mest_edmuro")||wc(-1,"^[0-9]+$")) && W(-1,"него") && s(-2,-1) )
 { rett=stopp=1; d[136]++; if(dbg){print "D136"}; continue };
 if ( pre_ro(-1) && s(-1,-1) )
 { rett=stopp=1; d[137]++; if(dbg){print "D137"}; continue };
 };#_#_#
 if ( (q(-1,"preph_ro prl_edmuro prq_edmuro mest_edmuro")||wc(-1,"^[0-9]+$")) && W(-1,"его него") && s(-1,-1) )
 { rett=stopp=1; d[138]++; if(dbg){print "D138"}; continue };

 if ( sw_edro_f() )
 { rett=stopp=1; d[139]++; if(dbg){print "D139"}; continue };

break}; return rett }

function sw_em_t_f(rett, stopp) { while (stopp == 0) {
 if ( sw_tv_f() )
 { rett=stopp=1; d[140]++; if(dbg){print "D140"}; continue };
 #_#_#
 if (prex == 1) {
 if ( q(-3,"prex_tv preph_tv") &&
      (q(-2,"prl_edmutv prq_edmutv mest_edmutv")||wc(-2,"^[0-9]+$")) &&
       (q(-1,"prl_edmutv prq_edmutv mest_edmutv")||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[141]++; if(dbg){print "D141"}; continue };
 if ( q(-2,"prex_tv preph_tv") &&
       q(-1,"prl_edmutv prq_edmutv") && s(-2,-1) )
 { rett=stopp=1; d[142]++; if(dbg){print "D142"}; continue };
 if ( prex_tv(-1) && s(-1,-1) )
 { rett=stopp=1; d[143]++; if(dbg){print "D143"}; continue };
 } else {#
 if ( q(-3,"pre_tv preph_tv") &&
      (q(-2,"prl_edmutv prq_edmutv mest_edmutv")||wc(-2,"^[0-9]+$")) &&
       (q(-1,"prl_edmutv prq_edmutv mest_edmutv")||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[144]++; if(dbg){print "D144"}; continue };
 if ( q(-2,"pre_tv preph_tv") &&
       q(-1,"prl_edmutv prq_edmutv") && s(-2,-1) )
 { rett=stopp=1; d[145]++; if(dbg){print "D145"}; continue };
 if ( pre_tv(-1) && s(-1,-1) )
 { rett=stopp=1; d[146]++; if(dbg){print "D146"}; continue };
 };#_#_#
 if ( q(-1,"preph_tv prl_edmutv prq_edmutv") && s(-1,-1) )
 { rett=stopp=1; d[147]++; if(dbg){print "D147"}; continue };
break}; return rett }

function sw_em_p_f(rett, stopp) { while (stopp == 0) {
 #
 if ( ismark(-1,"Npre") )
 { rett=0; stopp=1; d[148]++; if(dbg){print "D148"}; continue };
 #_#_#
 if (prex == 1) {
 if ( prex_pr(-3) &&
      (q(-2,"prl_edmupr prq_edmupr mest_edmupr")||wc(-2,"^[0-9]+$")) &&
       (q(-1,"prl_edmupr prq_edmupr mest_edmupr")||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[149]++; if(dbg){print "D149"}; continue };
 if ( prex_pr(-2) &&
       q(-1,"prl_edmupr prq_edmupr") && s(-2,-1) )
 { rett=stopp=1; d[150]++; if(dbg){print "D150"}; continue };
 if ( prex_pr(-1) && s(-1,-1) )
 { rett=stopp=1; d[151]++; if(dbg){print "D151"}; continue };
 } else {#
 if ( pre_pr(-3) &&
      (q(-2,"prl_edmupr prq_edmupr mest_edmupr")||wc(-2,"^[0-9]+$")) &&
       (q(-1,"prl_edmupr prq_edmupr mest_edmupr")||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[152]++; if(dbg){print "D152"}; continue };
 if ( pre_pr(-2) &&
       q(-1,"prl_edmupr prq_edmupr") && s(-2,-1) )
 { rett=stopp=1; d[153]++; if(dbg){print "D153"}; continue };
 if ( pre_pr(-1) && s(-1,-1) )
 { rett=stopp=1; d[154]++; if(dbg){print "D154"}; continue };
 };#_#_#
break}; return rett }

function sw_em_q_f(rett, stopp) { while (stopp == 0) {
 #
 if ( qi_duom(-2) &&
       q(-1,"prl_edmuro prq_edmuro") && s(-2,-1) )
 { rett=stopp=1; d[155]++; if(dbg){print "D155"}; continue };
 if ( qi_duom(-1) && s(-1,-1) )
 { rett=stopp=1; d[156]++; if(dbg){print "D156"}; continue };

break}; return rett }

function sw_em_z_f(rett, stopp) { while (stopp == 0) {
 #
 if ( (w(-2,"с немного чуть-чуть")||q(-2,"suw_edtv gl_in gl_ed gl_nemn gl_pnmn gl_pemn")) &&
        q(-1,"prl_edmuro prq_edmuro mest_edmuro") && s(-2,-1) )
 { rett=stopp=1; d[157]++; if(dbg){print "D157"}; continue };
 if ( q(-2,"gl_in gl_ed gl_nemn gl_pnmn gl_pemn") &&
      (w(-1,"с немного чуть-чуть")||q(-1,"suw_edtv prl_edmuro prq_edmuro mest_edmuro")) && s(-2,-1) )
 { rett=stopp=1; d[158]++; if(dbg){print "D158"}; continue };
 if ( (w(-1,"с немного чуть-чуть")||q(-1,"suw_edtv prl_edmuro prq_edmuro mest_edmuro")) && s(-1,-1) )
 { rett=stopp=1; d[159]++; if(dbg){print "D159"}; continue };
break}; return rett }

function sw_es_i_f(rett, stopp) { while (stopp == 0) {
 if ( sw_im_f() )
 { rett=stopp=1; d[160]++; if(dbg){print "D160"}; continue };

 #_#_#
 if (prex == 1) {
 if ( prex_im(-2) &&
       q(-1,"prl_edsrim prq_edsrim") && s(-2,-1) )
 { rett=stopp=1; d[161]++; if(dbg){print "D161"}; continue };
 if ( prex_im(-1) && s(-1,-1) )
 { rett=stopp=1; d[162]++; if(dbg){print "D162"}; continue };
 } else {#
 if ( pre_im(-2) &&
       q(-1,"prl_edsrim prq_edsrim") && s(-2,-1) )
 { rett=stopp=1; d[163]++; if(dbg){print "D163"}; continue };
 if ( pre_im(-1) && s(-1,-1) )
 { rett=stopp=1; d[164]++; if(dbg){print "D164"}; continue };
 };#_#_#
 if ( q(-1,"prl_edsrim prq_edsrim") && s(-1,-1) )
 { rett=stopp=1; d[165]++; if(dbg){print "D165"}; continue };
break}; return rett }

function sw_es_v_f(rett, stopp) { while (stopp == 0) {
 if ( q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && nmark(-1,"GG","Uv") && s(-1,-1) )
 { rett=stopp=1; d[166]++; if(dbg){print "D166"}; continue };
 if ( q(-1,"gl_pein gl_peed gl_pemn deep_pe") && s(-1,-1) )
 { rett=stopp=1; d[167]++; if(dbg){print "D167"}; continue };
 #_#_#
 if (prex == 1) {
 if ( q(-3,"prex_vi preph_vi") &&
       q(-2,"prl_edsrvi prq_edsrvi mest_edmuvi") &&
        q(-1,"prl_edsrvi prq_edsrvi mest_edmuvi") && s(-3,-1) )
 { rett=stopp=1; d[168]++; if(dbg){print "D168"}; continue };
 if ( q(-2,"prex_vi preph_vi") &&
      q(-1,"prl_edsrvi prq_edsrvi") && s(-2,-1) )
 { rett=stopp=1; d[169]++; if(dbg){print "D169"}; continue };
 if ( prex_vi(-1) && s(-1,-1) )
 { rett=stopp=1; d[170]++; if(dbg){print "D170"}; continue };
 } else {#
 if ( q(-3,"pre_vi preph_vi") &&
       q(-2,"prl_edsrvi prq_edsrvi mest_edmuvi") &&
        q(-1,"prl_edsrvi prq_edsrvi mest_edmuvi") && s(-3,-1) )
 { rett=stopp=1; d[171]++; if(dbg){print "D171"}; continue };
 if ( q(-2,"pre_vi preph_vi") &&
       q(-1,"prl_edsrvi prq_edsrvi") && s(-2,-1) )
 { rett=stopp=1; d[172]++; if(dbg){print "D172"}; continue };
 if ( pre_vi(-1) && s(-1,-1) )
 { rett=stopp=1; d[173]++; if(dbg){print "D173"}; continue };
 };#_#_#
 if ( q(-1,"preph_vi prl_edsrvi prq_edsrvi") && s(-1,-1) )
 { rett=stopp=1; d[174]++; if(dbg){print "D174"}; continue };
break}; return rett }

function sw_es_r_f(rett, stopp) { while (stopp == 0) {
 if ( sw_ro_f() )
 { rett=stopp=1; d[175]++; if(dbg){print "D175"}; continue };

 #
 if ( (w(-2,"нет")||q(-2,"pre_ro qi_duom")) &&
        q(-1,"prl_mnro prq_mnro mest_mnro") && s(-2,-1) )
 { rett=stopp=1; d[176]++; if(dbg){print "D176"}; continue };
 if ( (w(-1,"нет")||qi_duom(-1)) && s(-1,-1) )
 { rett=stopp=1; d[177]++; if(dbg){print "D177"}; continue };
 if ( w(-3,"не") &&
       q(-2,"gl_ed gl_in gl_poed") &&
        q(-1,"prl_edsrro prl_edsrro mest_ro") && s(-3,-1) )
 { rett=stopp=1; d[178]++; if(dbg){print "D178"}; continue };

 #_#_#
 if (prex == 1) {
 if ( q(-3,"prex_ro preph_ro") &&
       q(-2,"prl_edsrro prq_edsrro mest_edsrro") &&
        q(-1,"prl_edsrro prq_edsrro mest_edsrro") && s(-3,-1) )
 { rett=stopp=1; d[179]++; if(dbg){print "D179"}; continue };
 if ( q(-2,"prex_ro preph_ro") &&
       q(-1,"prl_edsrro prq_edsrro mest_edsrro") && W(-1,"него") && s(-2,-1) )
 { rett=stopp=1; d[180]++; if(dbg){print "D180"}; continue };
 if ( prex_ro(-1) && s(-1,-1) )
 { rett=stopp=1; d[181]++; if(dbg){print "D181"}; continue };
 } else {#
 if ( q(-3,"pre_ro preph_ro") &&
       q(-2,"prl_edsrro prq_edsrro mest_edsrro") &&
        q(-1,"prl_edsrro prq_edsrro mest_edsrro") && s(-3,-1) )
 { rett=stopp=1; d[182]++; if(dbg){print "D182"}; continue };
 if ( q(-2,"pre_ro preph_ro") &&
       q(-1,"prl_edsrro prq_edsrro mest_edsrro") && W(-1,"него") && s(-2,-1) )
 { rett=stopp=1; d[183]++; if(dbg){print "D183"}; continue };
 if ( pre_ro(-1) && s(-1,-1) )
 { rett=stopp=1; d[184]++; if(dbg){print "D184"}; continue };
 };#_#_#
 if ( q(-1,"preph_ro prl_edsrro prq_edsrro mest_edsrro") && W(-1,"его него чем") && s(-1,-1) )
 { rett=stopp=1; d[185]++; if(dbg){print "D185"}; continue };

 if ( sw_edro_f() )
 { rett=stopp=1; d[186]++; if(dbg){print "D186"}; continue };

break}; return rett }

function sw_es_d_f(rett, stopp) { while (stopp == 0) {
 if ( sw_da_f() )
 { rett=stopp=1; d[187]++; if(dbg){print "D187"}; continue };
 #
 if ( q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && nmark(-1,"GG","Ud") && s(-1,-1) )
 { rett=stopp=1; d[188]++; if(dbg){print "D188"}; continue };
 if ( q(-1,"gl_pein gl_peed gl_pemn deep_pe") && nmark(-1,"GG","Ud") && s(-1,-1) )
 { rett=stopp=1; d[189]++; if(dbg){print "D189"}; continue };
 #_#_#
 if (prex == 1) {
 if ( q(-3,"prex_da preph_da") &&
       q(-2,"prl_edsrda prq_edsrda mest_edmuda") &&
        q(-1,"prl_edsrda prq_edsrda mest_edmuda") && s(-3,-1) )
 { rett=stopp=1; d[190]++; if(dbg){print "D190"}; continue };
 if ( q(-2,"prex_da preph_da") &&
       q(-1,"prl_edsrda prq_edsrda") && s(-2,-1) )
 { rett=stopp=1; d[191]++; if(dbg){print "D191"}; continue };
 if ( prex_da(-1) && s(-1,-1) )
 { rett=stopp=1; d[192]++; if(dbg){print "D192"}; continue };
 } else {#
 if ( q(-3,"pre_da preph_da") &&
       q(-2,"prl_edsrda prq_edsrda mest_edmuda") &&
        q(-1,"prl_edsrda prq_edsrda mest_edmuda") && s(-3,-1) )
 { rett=stopp=1; d[193]++; if(dbg){print "D193"}; continue };
 if ( q(-2,"pre_da preph_da") &&
       q(-1,"prl_edsrda prq_edsrda") && s(-2,-1) )
 { rett=stopp=1; d[194]++; if(dbg){print "D194"}; continue };
 if ( pre_da(-1) && s(-1,-1) )
 { rett=stopp=1; d[195]++; if(dbg){print "D195"}; continue };
 };#_#_#
 if ( q(-1,"preph_da prl_edsrda prq_edsrda") && s(-1,-1) )
 { rett=stopp=1; d[196]++; if(dbg){print "D196"}; continue };
break}; return rett }

function sw_es_t_f(rett, stopp) { while (stopp == 0) {
 if ( sw_tv_f() )
 { rett=stopp=1; d[197]++; if(dbg){print "D197"}; continue };
 #_#_#
 if (prex == 1) {
 if ( q(-3,"prex_tv preph_tv") &&
       q(-2,"prl_edsrtv prq_edsrtv mest_edmutv") &&
        q(-1,"prl_edsrtv prq_edsrtv mest_edmutv") && s(-3,-1) )
 { rett=stopp=1; d[198]++; if(dbg){print "D198"}; continue };
 if ( q(-2,"prex_tv preph_tv") &&
       q(-1,"prl_edsrtv prq_edsrtv") && s(-2,-1) )
 { rett=stopp=1; d[199]++; if(dbg){print "D199"}; continue };
 if ( prex_tv(-1) && s(-1,-1) )
 { rett=stopp=1; d[200]++; if(dbg){print "D200"}; continue };
 } else {#
 if ( q(-3,"pre_tv preph_tv") &&
       q(-2,"prl_edsrtv prq_edsrtv mest_edmutv") &&
        q(-1,"prl_edsrtv prq_edsrtv mest_edmutv") && s(-3,-1) )
 { rett=stopp=1; d[201]++; if(dbg){print "D201"}; continue };
 if ( q(-2,"pre_tv preph_tv") &&
       q(-1,"prl_edsrtv prq_edsrtv") && s(-2,-1) )
 { rett=stopp=1; d[202]++; if(dbg){print "D202"}; continue };
 if ( pre_tv(-1) && s(-1,-1) )
 { rett=stopp=1; d[203]++; if(dbg){print "D203"}; continue };
 };#_#_#
 if ( q(-1,"preph_tv prl_edsrtv prq_edsrtv") && s(-1,-1) )
 { rett=stopp=1; d[204]++; if(dbg){print "D204"}; continue };
break}; return rett }

function sw_es_p_f(rett, stopp) { while (stopp == 0) {
 #
 #_#_#
 if (prex == 1) {
 if ( prex_pr(-3) &&
       q(-2,"prl_edsrpr prq_edsrpr mest_edsrpr") &&
        q(-1,"prl_edsrpr prq_edsrpr mest_edsrpr") && s(-3,-1) )
 { rett=stopp=1; d[205]++; if(dbg){print "D205"}; continue };
 if ( prex_pr(-2) &&
       q(-1,"prl_edsrpr prq_edsrpr mest_edsrpr") && s(-2,-1) )
 { rett=stopp=1; d[206]++; if(dbg){print "D206"}; continue };
 if ( prex_pr(-1) && s(-2,-1) )
 { rett=stopp=1; d[207]++; if(dbg){print "D207"}; continue };
 } else {#
 if ( pre_pr(-3) &&
       q(-2,"prl_edsrpr prq_edsrpr mest_edsrpr") &&
        q(-1,"prl_edsrpr prq_edsrpr mest_edsrpr") && s(-3,-1) )
 { rett=stopp=1; d[208]++; if(dbg){print "D208"}; continue };
 if ( pre_pr(-2) &&
       q(-1,"prl_edsrpr prq_edsrpr mest_edsrpr") && s(-2,-1) )
 { rett=stopp=1; d[209]++; if(dbg){print "D209"}; continue };
 if ( pre_pr(-1) && s(-1,-1) )
 { rett=stopp=1; d[210]++; if(dbg){print "D210"}; continue };
 };#_#_#
break}; return rett }

function sw_ez_i_f(rett, stopp) { while (stopp == 0) {
 if ( sw_im_f() )
 { rett=stopp=1; d[211]++; if(dbg){print "D211"}; continue };

 if ( qf(5,"gl_paedze") && s(0,qfn-1) )
 { rett=stopp=1; d[212]++; if(dbg){print "D212"}; continue };
 if ( w(-1,"она") && gl_paedze(0) && s(0,0) )
 { rett=0; stopp=1; d[213]++; if(dbg){print "D213"}; continue };
 if ( q(-2,"mest_ro suw_edro suw_mnro") &&
       q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && nmark(-1,"GG","Ur") && s(-2,-1) )
 { rett=stopp=1; d[214]++; if(dbg){print "D214"}; continue };
 if ( q(-1,"mest_ro suw_edro suw_mnro") &&
       q(1,"gl_pnin gl_pned gl_pnmn deep_pn") && nmark(1,"GG","Ur") && s(-1,0) )
 { rett=stopp=1; d[215]++; if(dbg){print "D215"}; continue };

 #_#_#
 if (prex == 1) {
 if ( prex_im(-2) &&
       q(-1,"prl_edzeim prq_edzeim mest_edzeim") && s(-2,-1) )
 { rett=stopp=1; d[216]++; if(dbg){print "D216"}; continue };
 if ( prex_im(-1) && s(-1,-1) )
 { rett=stopp=1; d[217]++; if(dbg){print "D217"}; continue };
 } else {#
 if ( pre_im(-2) &&
       q(-1,"prl_edzeim prq_edzeim mest_edzeim") && s(-2,-1) )
 { rett=stopp=1; d[218]++; if(dbg){print "D218"}; continue };
 if ( pre_im(-1) && s(-1,-1) )
 { rett=stopp=1; d[219]++; if(dbg){print "D219"}; continue };
 };#_#_#
 if ( q(-1,"prl_edzeim prq_edzeim mest_edzeim") && s(-1,-1) )
 { rett=stopp=1; d[220]++; if(dbg){print "D220"}; continue };
break}; return rett }

function sw_ez_v_f(rett, stopp) { while (stopp == 0) {
 if ( q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && nmark(-1,"GG","Uv") && s(-1,-1) )
 { rett=stopp=1; d[221]++; if(dbg){print "D221"}; continue };
 if ( q(-1,"gl_pein gl_peed gl_pemn deep_pe") && s(-1,-1) )
 { rett=stopp=1; d[222]++; if(dbg){print "D222"}; continue };
 #_#_#
 if (prex == 1) {
 if ( q(-3,"prex_vi preph_vi") &&
       q(-2,"prl_edzevi prq_edzevi mest_edzevi") &&
        q(-1,"prl_edzevi prq_edzevi mest_edzevi") && s(-3,-1) )
 { rett=stopp=1; d[223]++; if(dbg){print "D223"}; continue };
 if ( q(-2,"prex_vi preph_vi") &&
       q(-1,"prl_edzevi prq_edzevi mest_edzevi") && s(-2,-1) )
 { rett=stopp=1; d[224]++; if(dbg){print "D224"}; continue };
 if ( prex_vi(-1) && s(-1,-1) )
 { rett=stopp=1; d[225]++; if(dbg){print "D225"}; continue };
 } else {#
 if ( q(-3,"pre_vi preph_vi") &&
       q(-2,"prl_edzevi prq_edzevi mest_edzevi") &&
        q(-1,"prl_edzevi prq_edzevi mest_edzevi") && s(-3,-1) )
 { rett=stopp=1; d[226]++; if(dbg){print "D226"}; continue };
 if ( q(-2,"pre_vi preph_vi") &&
       q(-1,"prl_edzevi prq_edzevi mest_edzevi") && s(-2,-1) )
 { rett=stopp=1; d[227]++; if(dbg){print "D227"}; continue };
 if ( pre_vi(-1) && s(-1,-1) )
 { rett=stopp=1; d[228]++; if(dbg){print "D228"}; continue };
 };#_#_#
 if ( q(-1,"preph_vi prl_edzevi prq_edzevi mest_edzevi") && s(-1,-1) )
 { rett=stopp=1; d[229]++; if(dbg){print "D229"}; continue };
break}; return rett }

function sw_ez_d_f(rett, stopp) { while (stopp == 0) {
 if ( sw_da_f() )
 { rett=stopp=1; d[230]++; if(dbg){print "D230"}; continue };
 #_#_#
 if (prex == 1) {
 if ( q(-3,"prex_da preph_da") &&
       q(-2,"prl_edzeda prq_edzeda mest_edzeda") &&
        q(-1,"prl_edzeda prq_edzeda mest_edzeda") && s(-3,-1) )
 { rett=stopp=1; d[231]++; if(dbg){print "D231"}; continue };
 if ( q(-2,"prex_da preph_da") &&
       q(-1,"prl_edzeda prq_edzeda mest_da") && s(-2,-1) )
 { rett=stopp=1; d[232]++; if(dbg){print "D232"}; continue };
 if ( prex_da(-1) && s(-1,-1) )
 { rett=stopp=1; d[233]++; if(dbg){print "D233"}; continue };
 } else {#
 if ( q(-3,"pre_da preph_da") &&
       q(-2,"prl_edzeda prq_edzeda mest_edzeda") &&
        q(-1,"prl_edzeda prq_edzeda mest_edzeda") && s(-3,-1) )
 { rett=stopp=1; d[234]++; if(dbg){print "D234"}; continue };
 if ( q(-2,"pre_da preph_da") &&
       q(-1,"prl_edzeda prq_edzeda mest_da") && s(-2,-1) )
 { rett=stopp=1; d[235]++; if(dbg){print "D235"}; continue };
 if ( pre_da(-1) && s(-1,-1) )
 { rett=stopp=1; d[236]++; if(dbg){print "D236"}; continue };
 };#_#_#
 if ( q(-1,"preph_da prl_edzeda prq_edzeda mest_da") && s(-1,-1) )
 { rett=stopp=1; d[237]++; if(dbg){print "D237"}; continue };
break}; return rett }

function sw_em_l_f(rett, stopp) { while (stopp == 0) {
 #
 if ( pre_pr(-3) &&
       prq_edpr(-2) &&
        q(-1,"suw_edtv suw_mntv") && s(-3,-1) )
 { rett=stopp=1; d[238]++; if(dbg){print "D238"}; continue };
 #
 if ( w(-3,"в на") &&
      (q(-2,"prl_edmupr prq_edmupr mest_pr mest_vi")||wc(-2,"^[0-9]+$")) &&
       (q(-1,"prl_edmupr prq_edmupr mest_pr mest_vi")||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[239]++; if(dbg){print "D239"}; continue };
 if ( w(-2,"в на") &&
      (q(-1,"prl_edmupr prq_edmupr mest_pr mest_vi")||wc(-1,"^[0-9]+$")) && s(-2,-1) )
 { rett=stopp=1; d[240]++; if(dbg){print "D240"}; continue };
 #
 if ( w(-1,"в во на") && s(-1,-1) )
 { rett=stopp=1; d[241]++; if(dbg){print "D241"}; continue };
break}; return rett }

function sw_ez_l_f(rett, stopp) { while (stopp == 0) {
 #
 if ( !(nmark(-4,"GG","Nme") && s(-4,-4) ) &&
      pre_pr(-3) &&
       prq_edpr(-2) &&
        q(-1,"suw_edtv suw_mntv") && s(-3,-1) )
 { rett=stopp=1; d[242]++; if(dbg){print "D242"}; continue };
 #
 if ( w(-3,"в на") &&
       q(-2,"prl_edzepr prq_edzepr mest_pr mest_vi") &&
        q(-1,"prl_edzepr prq_edzepr mest_pr mest_vi") && s(-2,-1) )
 { rett=stopp=1; d[243]++; if(dbg){print "D243"}; continue };
 if ( w(-2,"в на") &&
       q(-1,"prl_edzepr prq_edzepr mest_pr") && s(-2,-1) )
 { rett=stopp=1; d[244]++; if(dbg){print "D244"}; continue };
 #
 if ( !(nmark(-2,"GG","Nme") && s(-2,-2) ) &&
       w(-1,"в во на") && s(-1,-1) )
 { rett=stopp=1; d[245]++; if(dbg){print "D245"}; continue };
break}; return rett }

function sw_ez_r_f(rett, stopp) { while (stopp == 0) {
 if ( sw_ro_f() )
 { rett=stopp=1; d[246]++; if(dbg){print "D246"}; continue };

 #
 if ( (w(-2,"нет")||qi_duoz(-2)) &&
        q(-1,"prl_edzero prl_edzero prq_edzero prq_edzero mest_ro") && s(-2,-1) )
 { rett=stopp=1; d[247]++; if(dbg){print "D247"}; continue };
 if ( qi_duoz(-2) &&
       q(-1,"prl_mnim prq_mnim mest_mnim") && s(-2,-1) && se(-2," ") )
 { rett=stopp=1; d[248]++; if(dbg){print "D248"}; continue };
 #
 if ( (w(-1,"нет")||qi_duoz(-1)) && s(-1,-1) )
 { rett=stopp=1; d[249]++; if(dbg){print "D249"}; continue };

 #_#_#
 if (prex == 1) {
 if ( q(-3,"prex_ro preph_ro") &&
       q(-2,"prl_edzero prq_edzero mest_edzero") &&
        q(-1,"prl_edzero prq_edzero mest_edzero") && s(-3,-1) )
 { rett=stopp=1; d[250]++; if(dbg){print "D250"}; continue };
 if ( q(-2,"prex_ro preph_ro") &&
      (q(-1,"prl_edzero prq_edzero mest_edzero")||w(-1,"его их")) && s(-2,-1) )
 { rett=stopp=1; d[251]++; if(dbg){print "D251"}; continue };
 if ( prex_ro(-1) && s(-1,-1) )
 { rett=stopp=1; d[252]++; if(dbg){print "D252"}; continue };
 } else {#
 if ( q(-3,"pre_ro preph_ro") &&
       q(-2,"prl_edzero prq_edzero mest_edzero") &&
        q(-1,"prl_edzero prq_edzero mest_edzero") && s(-3,-1) )
 { rett=stopp=1; d[253]++; if(dbg){print "D253"}; continue };
 if ( q(-2,"pre_ro preph_ro") &&
      (q(-1,"prl_edzero prq_edzero mest_edzero")||w(-1,"его их")) && s(-2,-1) )
 { rett=stopp=1; d[254]++; if(dbg){print "D254"}; continue };
 if ( pre_ro(-1) && s(-1,-1) )
 { rett=stopp=1; d[255]++; if(dbg){print "D255"}; continue };
 };#_#_#
 if ( q(-1,"preph_ro prl_edzero prq_edzero mest_edzero") && W(-1,"её") && s(-1,-1) )
 { rett=stopp=1; d[256]++; if(dbg){print "D256"}; continue };

 if ( sw_edro_f() )
 { rett=stopp=1; d[257]++; if(dbg){print "D257"}; continue };

break}; return rett }

function sw_ez_t_f(rett, stopp) { while (stopp == 0) {
 if ( sw_tv_f() )
 { rett=stopp=1; d[258]++; if(dbg){print "D258"}; continue };
 #
 #_#_#
 if (prex == 1) {
 if ( q(-3,"prex_tv preph_tv") &&
       q(-2,"prl_edzetv prq_edzetv mest_edzetv") &&
        q(-1,"prl_edzetv prq_edzetv mest_edzetv") && s(-3,-1) )
 { rett=stopp=1; d[259]++; if(dbg){print "D259"}; continue };
 if ( q(-2,"prex_tv preph_tv") &&
       q(-1,"prl_edzetv prq_edzetv mest_tv") && s(-2,-1) )
 { rett=stopp=1; d[260]++; if(dbg){print "D260"}; continue };
 if ( prex_tv(-1) && s(-1,-1) )
 { rett=stopp=1; d[261]++; if(dbg){print "D261"}; continue };
 } else {#
 if ( q(-3,"pre_tv preph_tv") &&
       q(-2,"prl_edzetv prq_edzetv mest_edzetv") &&
        q(-1,"prl_edzetv prq_edzetv mest_edzetv") && s(-3,-1) )
 { rett=stopp=1; d[262]++; if(dbg){print "D262"}; continue };
 if ( q(-2,"pre_tv preph_tv") &&
       q(-1,"prl_edzetv prq_edzetv mest_tv") && s(-2,-1) )
 { rett=stopp=1; d[263]++; if(dbg){print "D263"}; continue };
 if ( pre_tv(-1) && s(-1,-1) )
 { rett=stopp=1; d[264]++; if(dbg){print "D264"}; continue };
 };#_#_#
 if ( q(-1,"preph_tv prl_edzetv prq_edzetv mest_tv") && s(-1,-1) )
 { rett=stopp=1; d[265]++; if(dbg){print "D265"}; continue };
break}; return rett }

function sw_ez_p_f(rett, stopp) { while (stopp == 0) {
 #_#_#
 if (prex == 1) {
 if ( prex_pr(-3) &&
       q(-2,"prl_edzepr prq_edzepr mest_edzepr") &&
        q(-1,"prl_edzepr prq_edzepr mest_edzepr") && s(-3,-1) )
 { rett=stopp=1; d[266]++; if(dbg){print "D266"}; continue };
 if ((prex_pr(-2)||w(-2,"по")) &&
       q(-1,"prl_edzepr prq_edzepr mest_pr") && s(-2,-1) )
 { rett=stopp=1; d[267]++; if(dbg){print "D267"}; continue };
 if ( (prex_pr(-1)||w(-1,"по")) && s(-1,-1) )
 { rett=stopp=1; d[268]++; if(dbg){print "D268"}; continue };
 } else {#
 if ( pre_pr(-3) &&
       q(-2,"prl_edzepr prq_edzepr mest_edzepr") &&
        q(-1,"prl_edzepr prq_edzepr mest_edzepr") && s(-3,-1) )
 { rett=stopp=1; d[269]++; if(dbg){print "D269"}; continue };
 if (pre_pr(-2) &&
      q(-1,"prl_edzepr prq_edzepr mest_pr") && s(-2,-1) )
 { rett=stopp=1; d[270]++; if(dbg){print "D270"}; continue };
 if ( pre_pr(-1)||w(-1,"по") && s(-1,-1) )
 { rett=stopp=1; d[271]++; if(dbg){print "D271"}; continue };
 };#_#_#
break}; return rett }

function sw_mn_i_f(rett, stopp) { while (stopp == 0) {
 if ( edro2mnim==1 )
 { edro2mnim==""; rett=stopp=1; d[272]++; if(dbg){print "D272"}; continue };
 if ( sw_im_f() )
 { rett=stopp=1; d[273]++; if(dbg){print "D273"}; continue };


 if ( pre_pr(-3) &&
       q(-2,"prl_edpr prq_edpr mest_pr") &&
        q(-1,"suw_edpr suw_mnpr suw_edme") &&
         w(1,"не") && gl_pnmn(2) && s(-3,1) )
 { rett=stopp=1; d[274]++; if(dbg){print "D274"}; continue };


 if ( gl_vzmn(-1) && s(-1,-1) )
 { rett=stopp=1; d[275]++; if(dbg){print "D275"}; continue };
 if ( (qf(5,"gl_vzmn")||qf(5,"gl_nemn")) && s(0,qfn-1) )
 { rett=stopp=1; d[276]++; if(dbg){print "D276"}; continue };
 if ( (w(-1,"мы вы они")||suw_mnim(-1)) &&
        q(1,"suw_edro suw_mnro") && sc(-1,"—") )
 { rett=stopp=1; d[277]++; if(dbg){print "D277"}; continue };
 if ( (w(-1,"мы вы они")||suw_mnim(-1)) &&
        q(1,"suw_edro suw_mnro") && s(-1,0) )
 { rett=stopp=1; d[278]++; if(dbg){print "D278"}; continue };
 if ( w(1,"есть") && s(0,0) && p(1) )
 { rett=stopp=1; d[279]++; if(dbg){print "D279"}; continue };
 if ( w(1,"не") &&
       q(2,"nar_spos nar_mest") &&
        gl_mn(3) && s(0,2) )
 { rett=stopp=1; d[280]++; if(dbg){print "D280"}; continue };
 #
 if ( !(suw_mnim(-1) && s(-1,-1)) &&
      prl_krmn(1) && s(0,0) )
 { rett=stopp=1; d[281]++; if(dbg){print "D281"}; continue };
 if ( !(suw_mnim(-1) && s(-1,-1)) &&
      mod_mn(1) &&
       gl_in(2) && s(0,1) )
 { rett=stopp=1; d[282]++; if(dbg){print "D282"}; continue };


 #_#_#
 if (prex == 1) {
 if ( prex_im(-2) &&
       q(-1,"prl_mnim prq_mnim mest_mnim muk_mnim") && s(-2,-1) )
 { rett=stopp=1; d[283]++; if(dbg){print "D283"}; continue };
 if ( prex_im(-1) && s(-1,-1) )
 { rett=stopp=1; d[284]++; if(dbg){print "D284"}; continue };
 } else {#
 if ( pre_im(-2) &&
       q(-1,"prl_mnim prq_mnim mest_mnim muk_mnim") && s(-2,-1) )
 { rett=stopp=1; d[285]++; if(dbg){print "D285"}; continue };
 if ( pre_im(-1) && s(-1,-1) )
 { rett=stopp=1; d[286]++; if(dbg){print "D286"}; continue };
 };#_#_#
 if ( (q(-1,"prl_mnim prq_mnim muk_mnim")||(mest_mnim(-1) && Q(0,"prl_krmn"))||wc(-1,"[ео]вы$")) && s(-1,-1) )
 { rett=stopp=1; d[287]++; if(dbg){print "D287"}; continue };
break}; edro2mnim=""; return rett }

function sw_mn_v_f(rett, stopp) { while (stopp == 0) {
 if ( edro2mnvi==1 )
 { rett=stopp=1; d[288]++; if(dbg){print "D288"}; continue };

 if ( q(-1,"gl_pein gl_peed gl_pemn deep_pe") && s(-1,-1) )
 { rett=stopp=1; d[289]++; if(dbg){print "D289"}; continue };
 if ( q(-1,"gl_in gl_ed gl_mn deep gl_poed") && nmark(-1,"GG","Uv") && s(-1,-1) )
 { rett=stopp=1; d[290]++; if(dbg){print "D290"}; continue };
#if ( q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && nmark(-1,"GG","Uv") && s(-1,-1) )
#{ rett=stopp=1; d[291]++; if(dbg){print "D291"}; continue };
#if ( q(-1,"gl_pein gl_peed gl_pemn deep_pe") && nmark(-1,"GG","Uv") && s(-1,-1) )
#{ rett=stopp=1; d[292]++; if(dbg){print "D292"}; continue };
#if ( q(-1,"gl_nein gl_need gl_nemn deep_ne") && nmark(-1,"GG","Uv") && s(-1,-1) )
#{ rett=stopp=1; d[293]++; if(dbg){print "D293"}; continue };

 #
 if ( W(-3,"не") &&
       q(-2,"deep_pe gl_peed gl_pein gl_pemn") &&
        q(-1,"prl_mnvi prq_mnvi mest_vi") && s(-2,-1) )
 { rett=stopp=1; d[294]++; if(dbg){print "D294"}; continue };
 if ( W(-2,"не") &&
       q(-1,"deep_pe gl_peed gl_pein gl_pemn") && qv(-1,"suw_edda suw_edvi") && s(-1,-1) )
 { rett=stopp=1; d[295]++; if(dbg){print "D295"}; continue };
#if ( !(suw_any(-1) && s(-1,-1) && suw_edro(0)) &&
#       q(1,"deep_pn gl_pned gl_pnin gl_pnmn") && s(0,0) )
#{ rett=stopp=1; d[296]++; if(dbg){print "D296"}; continue };

 #_#_#
 if (prex == 1) {
 if ( q(-2,"prex_vi preph_vi") &&
       q(-1,"prl_mnvi prq_mnvi mest_pmnim") && s(-2,-1) )
 { rett=stopp=1; d[297]++; if(dbg){print "D297"}; continue };
 if ( prex_vi(-1) && s(-1,-1) )
 { rett=stopp=1; d[298]++; if(dbg){print "D298"}; continue };
 } else {#
 if ( q(-2,"pre_vi preph_vi") &&
      q(-1,"prl_mnvi prq_mnvi mest_pmnim") && s(-2,-1) )
 { rett=stopp=1; d[299]++; if(dbg){print "D299"}; continue };
 if ( pre_vi(-1) && s(-1,-1) )
 { rett=stopp=1; d[300]++; if(dbg){print "D300"}; continue };
 };#_#_#
 if ( q(-1,"preph_vi prl_mnvi prq_mnvi mest_pmnim") && s(-1,-1) )
 { rett=stopp=1; d[301]++; if(dbg){print "D301"}; continue };
break}; edro2mnvi=""; return rett }

function sw_mn_r_f(rett, stopp) { while (stopp == 0) {
 if ( sw_ro_f() )
 { rett=stopp=1; d[302]++; if(dbg){print "D302"}; continue };

 if ( suw_any(-1) && nmark(-1,"GS","qis") && s(-1,-1) )
 { rett=stopp=1; d[303]++; if(dbg){print "D303"}; continue };
 #
 if ( q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && nmark(-1,"GG","Nnero") && s(-1,-1) )
 { rett=0; stopp=1; d[304]++; if(dbg){print "D304"}; continue };
 if ( q(-1,"gl_pein gl_peed gl_pemn deep_pe") && nmark(-1,"GG","Nnero") && s(-1,-1) )
 { rett=0; stopp=1; d[305]++; if(dbg){print "D305"}; continue };
 if ( q(-1,"gl_nein gl_need gl_nemn gl_vzed deep_ne") && nmark(-1,"GG","Nnero") && s(-1,-1) )
 { rett=0; stopp=1; d[306]++; if(dbg){print "D306"}; continue };

 if ( w(-2,"не") &&
       q(-1,"gl_peed gl_pein gl_pemn gl_poed deep_pe") && s(-2,-1) )
 { rett=stopp=1; d[307]++; if(dbg){print "D307"}; continue };
 if ( w(-2,"не") &&
       q(-1,"gl_need gl_nein gl_nemn gl_poed gl_vzed deep_ne") && s(-2,-1) )
 { rett=stopp=1; d[308]++; if(dbg){print "D308"}; continue };
 if ( w(-2,"не") &&
       q(-1,"gl_pned gl_pnin gl_pnmn gl_poed deep_pn") && s(-2,-1) )
 { rett=stopp=1; d[309]++; if(dbg){print "D309"}; continue };


 #_#_#
 if (prex == 1) {
 if ( q(-2,"prex_ro preph_ro") &&
      (q(-1,"prl_mnro prq_mnro qi_ed qi_mn")||wc(-1,"^[0-9]+$")) && s(-2,-1) )
 { rett=stopp=1; d[310]++; if(dbg){print "D310"}; continue };
 if ( prex_ro(-1) && s(-1,-1) )
 { rett=stopp=1; d[311]++; if(dbg){print "D311"}; continue };
 } else {#
 if ( q(-2,"pre_ro preph_ro") &&
      (q(-1,"prl_mnro prq_mnro qin_im")||wc(-1,"^[0-9]+$")) && s(-2,-1) )
 { rett=stopp=1; d[312]++; if(dbg){print "D312"}; continue };
 if ( pre_ro(-1) && s(-1,-1) )
 { rett=stopp=1; d[313]++; if(dbg){print "D313"}; continue };
 };#_#_#
 if ( (q(-1,"preph_ro prl_mnro prq_mnro qi_ed qi_mn")||wc(-1,"^[0-9]+$")) && s(-1,-1) )
 { rett=stopp=1; d[314]++; if(dbg){print "D314"}; continue };

 #
#if ( q(-1,"qik_im qik_mnim qik_mnro") && s(-1,-1) )
 if ( pre_vi(1) &&
      (q(2,"qi_ed qi_mn")||wc(2,"^[0-9]+$")||w(2,"пару")) && s(0,1) )
 { rett=stopp=1; d[315]++; if(dbg){print "D315"}; continue };
 if ( (q(-1,"qi_ed qi_mn")||wc(-1,"^[0-9]+$")||w(-1,"пару")) && s(-1,-1) )
 { rett=stopp=1; d[316]++; if(dbg){print "D316"}; continue };
 if ( !(gl_paedmu_f() && gl_paedmu(0) && s(0,0) ) &&
       (q(1,"qi_ed qi_mn")||wc(1,"^[0-9]+$")) && s(0,0) )
 { rett=stopp=1; d[317]++; if(dbg){print "D317"}; continue };
break}; return rett }

function sw_mn_d_f(rett, stopp) { while (stopp == 0) {
 if ( sw_da_f() )
 { rett=stopp=1; d[318]++; if(dbg){print "D318"}; continue };
 #_#_#
 if (prex == 1) {
 if ( q(-2,"prex_da preph_da") &&
      q(-1,"prl_mnda prq_mnda qin_da") && s(-2,-1) )
 { rett=stopp=1; d[319]++; if(dbg){print "D319"}; continue };
 if ( prex_da(-1) && s(-1,-1) )
 { rett=stopp=1; d[320]++; if(dbg){print "D320"}; continue };
 } else {#
 if ( q(-2,"pre_da preph_da") &&
      q(-1,"prl_mnda prq_mnda qin_da") && s(-2,-1) )
 { rett=stopp=1; d[321]++; if(dbg){print "D321"}; continue };
 if ( pre_da(-1) && s(-1,-1) )
 { rett=stopp=1; d[322]++; if(dbg){print "D322"}; continue };
 };#_#_#
 if ( q(-1,"preph_da prl_mnda prq_mnda qin_da") && s(-1,-1) )
 { rett=stopp=1; d[323]++; if(dbg){print "D323"}; continue };
break}; return rett }

function sw_mn_p_f(rett, stopp) { while (stopp == 0) {
 #_#_#
 if (prex == 1) {
 if ( prex_pr(-2) &&
      q(-1,"prl_mnpr prq_mnpr qin_pr") && s(-2,-1) )
 { rett=stopp=1; d[324]++; if(dbg){print "D324"}; continue };
 if ( prex_pr(-1) && s(-1,-1) )
 { rett=stopp=1; d[325]++; if(dbg){print "D325"}; continue };
 } else {#
 if ( pre_pr(-2) &&
      q(-1,"prl_mnpr prq_mnpr qin_pr") && s(-2,-1) )
 { rett=stopp=1; d[326]++; if(dbg){print "D326"}; continue };
 if ( pre_pr(-1) && s(-1,-1) )
 { rett=stopp=1; d[327]++; if(dbg){print "D327"}; continue };
 };#_#_#
break}; return rett }

function pl_em_p_f(rett, stopp) { while (stopp == 0) {
 if ( pre_pr(-1) &&
       q(1,"suw_edmupr suw_edmume") && s(-1,0) )
 { rett=stopp=1; d[328]++; if(dbg){print "D328"}; continue };
 if ( pre_pr(-1) && s(-1,-1) && p(0))
 { rett=stopp=1; d[329]++; if(dbg){print "D329"}; continue };
break}; return rett }

function pl_es_p_f(rett, stopp) { while (stopp == 0) {
 if ( pre_pr(-1) &&
       suw_edpr(1) && s(-1,0) )
 { rett=stopp=1; d[330]++; if(dbg){print "D330"}; continue };
 if ( pre_pr(-1) && s(-1,-1) && p(0))
 { rett=stopp=1; d[331]++; if(dbg){print "D331"}; continue };
break}; return rett }

function pl_ez_v_f(rett, stopp) { while (stopp == 0) {
 if ( q(-1,"pre_vi preph_vi") &&
       suw_edvi(1) && s(-1,0) )
 { rett=stopp=1; d[332]++; if(dbg){print "D332"}; continue };
break}; return rett }

function pl_kr_em_f(rett, stopp) { while (stopp == 0) {
 cst="я ты он был буду будь стал стану"
 if ( (w(-2,cst)||suw_edmuim(-2)) &&
      prl_kred_sr(-1) && s(-2,-1) && (p(0)||q(1,"gl_in pre_any")) )
 { rett=stopp=1; d[333]++; if(dbg){print "D333"}; continue };
 if ( (w(-1,cst)||suw_edmuim(-1)) && s(-1,-1) && (p(0)||q(1,"gl_in pre_any")) )
 { rett=stopp=1; d[334]++; if(dbg){print "D334"}; continue };
 if ( w(-1,cst) && s(0,0) )
 { rett=stopp=1; d[335]++; if(dbg){print "D335"}; continue };
 if ( w(1,"был будь") && s(0,0) )
 { rett=stopp=1; d[336]++; if(dbg){print "D336"}; continue };
break}; return rett }

function pl_kr_ez_f(rett, stopp) { while (stopp == 0) {
 if ( (w(-2,"я ты она была стала")||suw_edzeim(-2)) &&
      prl_kred_sr(-1) && s(-2,-1) )
 { rett=stopp=1; d[337]++; if(dbg){print "D337"}; continue };
 if ( (w(-1,"я ты она была стала")||suw_edzeim(-1)) && s(-1,-1) )
 { rett=stopp=1; d[338]++; if(dbg){print "D338"}; continue };
break}; return rett }

function pl_krmn_f(rett, stopp) { while (stopp == 0) {
 if ( (w(-2,"мы вы они были стали")||(suw_mnim(-2) && Q(-2,"suw_edro"))) &&
      prl_kred_sr(-1) && s(-2,-1) )
 { rett=stopp=1; d[339]++; if(dbg){print "D339"}; continue };
 if ( (w(-1,"мы вы они были стали")||(suw_mnim(-1) && Q(-1,"suw_edro"))) && s(-1,-1) )
 { rett=stopp=1; d[340]++; if(dbg){print "D340"}; continue };
 if ( suw_mnim(-1) && s(-1,-1) && p(-2) )
 { rett=stopp=1; d[341]++; if(dbg){print "D341"}; continue };
break}; return rett }

function gl_inf_f(rett, stopp) { while (stopp == 0) {
 if ( q(-1,"mod_ed mod_mn mod_bz") && s(-1,-1) )
 { rett=stopp=1; d[342]++; if(dbg){print "D342"}; continue };
 #
 if ( !( q(-1,"pre_da pre_im pre_vi pre_ro pre_pr") && s(-1,-1)) &&
       q(1,"suw_edvi suw_mnvi mest_vi") && s(0,0) )
 { rett=stopp=1; d[343]++; if(dbg){print "D343"}; continue };
 #
 if ( !( q(-1,"pre_da pre_im pre_vi pre_ro pre_pr") && s(-1,-1)) &&
         pre_vi(1) &&
         q(2,"suw_edvi suw_mnvi mest_vi") && s(0,1) )
 { rett=stopp=1; d[344]++; if(dbg){print "D344"}; continue };
break}; return rett }

function gl_poed_f(rett, stopp) { while (stopp == 0) {
 if ( p(-2) && w(-1,"не") && s(-1,-1) && p(0) )
 { rett=stopp=1; d[345]++; if(dbg){print "D345"}; continue };
#if ( p(-1) && sc(0,"!") )
#{ rett=stopp=1; d[346]++; if(dbg){print "D346"}; continue };
break}; return rett }

function gl_paedmu_f(rett, stopp) { while (stopp == 0) {
 if ( (w(-2,"я ты он")||suw_edmuim(-2)) &&
       q(-1,"nar_spos prl_kred_sr") && Q(-1,"prl_edmuim") && s(-2,-1) )
 { rett=stopp=1; d[347]++; if(dbg){print "D347"}; continue };
 #
 if ( (w(1,"я ты он")||suw_edmuim(1)) &&
       q(2,"prl_kred_sr gl_in") && Q(1,"prl_edmuim") && s(0,1) )
 { rett=stopp=1; d[348]++; if(dbg){print "D348"}; continue };
 #
 if ( (w(1,"я ты он")||q(1,"suw_edmuim prl_kred_sr")) && Q(1,"prl_edmuim") && s(0,0) )
 { rett=stopp=1; d[349]++; if(dbg){print "D349"}; continue };
 #
 if ( (w(-1,"я ты он")||q(-1,"suw_edmuim prl_kred_sr gl_in")) && Q(-1,"prl_edmuim") && s(-1,-1) )
 { rett=stopp=1; d[350]++; if(dbg){print "D350"}; continue };
break}; return rett }

function gl_pamn_f(rett, stopp) { while (stopp == 0) {
 #
 if ( (suw_mnim(-2)||w(-2,"мы вы они")) &&
        prl_kred_sr(-1) && s(-2,-1) )
 { rett=stopp=1; d[351]++; if(dbg){print "D351"}; continue };
 #
 if ( (suw_mnim(-1)||w(-1,"мы вы они")) && s(-1,-1) )
 { rett=stopp=1; d[352]++; if(dbg){print "D352"}; continue };
break}; return rett }

function gl_pomn_f(rett, stopp) { while (stopp == 0) {
 #
 if ( q(-4,"gl_poed gl_pomn gl_povzmn") &&
        w(-3,"что") &&
        q(-2,"gl_ed gl_nemn gl_pemn gl_pnmn") &&
          w(-1,"и") && s(-4,-1) )
 { rett=stopp=1; d[353]++; if(dbg){print "D353"}; continue };
 #
 if ( w(-2,"так") &&
       w(-1,"что вот") && s(-2,-1) )
 { rett=stopp=1; d[354]++; if(dbg){print "D354"}; continue };
break}; return rett }

function gl_ed1e_f(rett, stopp) { while (stopp == 0) {
 #
 if ( w(-2,"я") &&
      q(-1,"prl_kred_sr nar_mest nar_spos") &&
       q(1,"suw_edvi suw_mnvi pre_any") && s(-2,0) )
 { rett=stopp=1; d[355]++; if(dbg){print "D355"}; continue };
 if ( w(-1,"я") &&
      q(1,"prl_kred_sr nar_mest nar_spos") &&
       q(2,"suw_edvi suw_mnvi pre_any") && s(-1,1) )
 { rett=stopp=1; d[356]++; if(dbg){print "D356"}; continue };
 if ( w(-1,"я") &&
      q(1,"suw_edvi suw_mnvi nar_napr nar_spos gl_in pre_any") && s(-1,0) )
 { rett=stopp=1; d[357]++; if(dbg){print "D357"}; continue };
 if ( w(-1,"я") && s(-1,-1) )
 { rett=stopp=1; d[358]++; if(dbg){print "D358"}; continue };
break}; return rett }

function gl_mn1e_f(rett, stopp) { while (stopp == 0) {
 #
 if ( wb(-5,"мы если когда коли куда") && s(wbn,-1) )
 { rett=stopp=1; d[359]++; if(dbg){print "D359"}; continue };
 #
 if ( p(-1) && p(0) )
 { rett=stopp=1; d[360]++; if(dbg){print "D360"}; continue };
break}; return rett }

function gl_paedze_f(rett, stopp) { while (stopp == 0) {
 #
 if ( wb(-5,"я ты вы она") && s(wbn,-1) )
 { rett=stopp=1; d[361]++; if(dbg){print "D361"}; continue };
 #
 if ( qb(-5,"suw_edzeim") && s(qbn,-1) )
 { rett=stopp=1; d[362]++; if(dbg){print "D362"}; continue };
 if ( suw_edzeim(-3) && s(-3,-3) &&
       gl_ed(-2) && sc(-2,",") &&
        w(-1,"что как") && s(-1,-1) )
 { rett=stopp=1; d[363]++; if(dbg){print "D363"}; continue };
break}; return rett }

function gl_mn2e_f(rett, stopp) { while (stopp == 0) {
 #
 if ( wb(-5,"будто где если зачем когда коли которого которую которые который которых куда насколько небось откуда пока почему пошто сколько что") &&
      (p(wbn-1)||sc(wbn-1,"[pv]")||q(wbn-1,"souz qast")) && s(wbn,-1) )
 { rett=stopp=1; d[364]++; if(dbg){print "D364"}; continue };
 #
 if ( wb(-5,"как") &&
       w(wbn-1,"бы долго же") && s(wbn,-1) )
 { rett=stopp=1; d[365]++; if(dbg){print "D365"}; continue };
 #
 if ( sc(0,"?") )
 { rett=stopp=1; d[366]++; if(dbg){print "D366"}; continue };
break}; return rett }

