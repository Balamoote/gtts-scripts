# повторяющиеся функции для deomo
# let @a=1|%s/"D\zs\d\+\ze"/\=''.(@a+setreg('a',@a+1))/g|%s/ d\[\zs\d\+\ze\]++; if(dbg){print "D\(\d\+\)"/\1/g
# При срабатывании функции выдают значение TRUE, при вызове аргументы НЕ указываются.
function sw_im_f(rett, stopp) { while (stopp == 0) {
 #
 if ( id(1,"uw4edim") && s(0) )
 { rett=stopp=1; d[1]++; if(dbg){print "D1"}; continue };

 if ( w(-1,"снова опять") && s(-1) && p(-2) && p(0) )
 { rett=stopp=1; d[2]++; if(dbg){print "D2"}; continue };
 if ( w(-1,"воистину") && s(-1) && p(-2) )
 { rett=stopp=1; d[3]++; if(dbg){print "D3"}; continue };
 if ( w(-1,"как") &&
       q(1,"prl_edro prl_mnro") &&
        q(2,"suw_edro suw_mnro") && s(-1,1) )
 { rett=stopp=1; d[4]++; if(dbg){print "D4"}; continue };

 if ( sc(0,"^\\s—\\s$") && wc(1,"^[0-9]+$") &&
      w(2,"шт упак мин сек час ч м с руб коп") && p(2) )
 { rett=stopp=1; d[5]++; if(dbg){print "D5"}; continue };
 #
 if ( (qxs(-1,"а и но","вот как где сколько","и же его её их")||
       qxs(-1,"а и","вот")||
       qxs(-1,"вот","и же его её их")||
       qxs(-1,"вот","мне тебе ей вам нам им","и")||
       w(-1,"вот") ) && s(-1) )
 { rett=stopp=1; d[6]++; if(dbg){print "D6"}; continue };
 if ( (qxs(-3,"а и но","вот как где сколько","и же его её их")||
       qxs(-3,"а и","вот")||
       qxs(-3,"вот","и же его её их")||
       qxs(-3,"вот","мне тебе ей вам нам им","и")||
       w(-3,"вот") ) &&
       q(-2,"suw_edim suw_mnim") &&
       w(-1,"и") && s(-3,-1) )
 { rett=stopp=1; d[7]++; if(dbg){print "D7"}; continue };
 if ( qxs(-1,"больше совсем сейчас тоже","не") &&
       q(xsn-1,"mest_da suw_edda suw_mnda") && s(xsn-1) )
 { rett=stopp=1; d[8]++; if(dbg){print "D8"}; continue };
 if ( qxs(-2,"больше совсем сейчас тоже","не") &&
       q(xsn-1,"mest_im suw_edim suw_mnim") && s(xsn-1) &&
       q(-1,"mest_da suw_edda suw_mnda") && s(-1) )
 { rett=stopp=1; d[9]++; if(dbg){print "D9"}; continue };

 if ( w(-3,"у") &&
       q(-2,"mest_ro suw_edro suw_mnro") &&
        base(-1,"быть") && s(-3,-1) )
 { rett=stopp=1; d[10]++; if(dbg){print "D10"}; continue };
 if ( q(-2,"mest_it") &&
       q(-1,"mest_im") && s(-2,-1) )
 { rett=stopp=1; d[11]++; if(dbg){print "D11"}; continue };
 if ( (p(-1) || (w(-1,"а и вот что") && s(-1)) ) &&
        se(0," — ") &&
         q(1,"mest_it") )
 { rett=stopp=1; d[12]++; if(dbg){print "D12"}; continue };
  if ( (p(-3) || (w(-3,"а и вот что") && s(-3)) ) &&
	 q(-2,"suw_mnim") &&
          se(-2," — ") &&
           q(-1,"mest_it nar_step") && s(-1) )
 { rett=stopp=1; d[13]++; if(dbg){print "D13"}; continue };
  if ( (p(-2) || (w(-2,"а и вот что") && s(-2)) ) &&
	 q(-1,"suw_mnim") &&
          se(-1," — ") &&
           q(-1,"mest_it nar_step") )
 { rett=stopp=1; d[14]++; if(dbg){print "D14"}; continue };
 if ( (p(-1) || (w(-1,"а и вот") && s(-1)) ) &&
       q(1,"suw_edro suw_mnro") && se(1," — ") && s(0) &&
         q(2,"mest_it") )
 { rett=stopp=1; d[15]++; if(dbg){print "D15"}; continue };

 if ( q(1,"pre_ro") && Qw_(-1,"pre_any") &&
       q(2,"mest_ro") &&
        q(3,"suw_edim suw_mnim suw_edne") && s(0,2) )
 { rett=stopp=1; d[16]++; if(dbg){print "D16"}; continue };

 if ( w(-3,"более менее") && s(-3) &&
       q(-2,"prl_mnim") && sc(-2,",") &&
        w(-1,"чем") && s(-1) )
 { rett=stopp=1; d[17]++; if(dbg){print "D17"}; continue };
 if ( w(-1,"чем") && sc(-2,",") &&
      (q(1,"prl_srav nar_srav")||w(-1,"более менее")) && s(-1,0) )
 { rett=stopp=1; d[18]++; if(dbg){print "D18"}; continue };
 if ( w(-4,"более менее") &&
      q(-3,"prl_mntv") &&
        q(-2,"suw_mntv") && sc(-2,",") &&
         w(-1,"чем") && s(0) )
 { rett=stopp=1; d[19]++; if(dbg){print "D19"}; continue };

 if ( w(-3,"у") &&
       q(-2,"mest_ro suw_edro suw_mnro") &&
        q(-1,"nar_vrem") && s(-3,-1) )
 { rett=stopp=1; d[20]++; if(dbg){print "D20"}; continue };
 if ( w(-3,"у") &&
       q(-2,"mest_ro suw_edro suw_mnro") &&
        q(-1,"nar_vrem nar_spos") && s(-3,-1) )
 { rett=stopp=1; d[21]++; if(dbg){print "D21"}; continue };
 if ( w(-2,"у") &&
        q(-1,"mest_ro suw_edro suw_mnro") && s(-2,-1) && W(0,"белок") )
 { rett=stopp=1; d[22]++; if(dbg){print "D22"}; continue };

 if ( w(-2,"к") &&
        q(-1,"mest_da suw_edda suw_mnda") && s(-2,-1) && W(0,"белок") )
 { rett=stopp=1; d[23]++; if(dbg){print "D23"}; continue };

 if ( q(-3,"mest_it") &&
      qxs(-1,"всего ведь же","лишь только просто его её их не") && s(-3) )
 { rett=stopp=1; d[24]++; if(dbg){print "D24"}; continue };
 if ( q(-2,"mest_it") &&
       w(-1,"же ж лишь только просто его её их не") && s(-2,-1) )
 { rett=stopp=1; d[25]++; if(dbg){print "D25"}; continue };
#if ( q(-2,"mest_it") &&
#      w(-1,"не его её их") && s(-2,-1) )
#{ rett=stopp=1; d[26]++; if(dbg){print "D26"}; continue };
 if ( q(-1,"mest_it") && s(-1) )
 { rett=stopp=1; d[27]++; if(dbg){print "D27"}; continue };

 #
 cst_gl = "цвету суть кучу тону толщу"
 cst0   = "дома повести велики"
 if ( W(0,cst0) ) {
    #
    if ( mod_ed(-2) && gl_needge(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
          W(-1,"быть") )
    { rett=stopp=1; d[28]++; if(dbg){print "D28"}; continue };
    if ( q(-1,"gl_needge deep_ne") && s(-1) && p(0) &&
          W(-1,cst_gl) )
    { rett=stopp=1; d[29]++; if(dbg){print "D29"}; continue };
    if ( q(1,"mest_da suw_edda suw_mnda") &&
          q(2,"gl_nein gl_needge deep_ne") && s(0,1) && p(-1) &&
           W(1,cst_gl) )
    { rett=stopp=1; d[30]++; if(dbg){print "D30"}; continue };
    if ( q(1,"gl_nein gl_needge deep_ne") && s(0) && p(-1) &&
          W(1,cst_gl) )
    { rett=stopp=1; d[31]++; if(dbg){print "D31"}; continue };
    if ( q(1,"gl_pnin gl_pned deep_pn") && s(0) && p(1) &&
          W(1,cst_gl) && Qw_(-1,"pre_any") )
    { rett=stopp=1; d[32]++; if(dbg){print "D32"}; continue };
    if ( q(2,"gl_pnin gl_pned deep_pn") && s(0,1) && p(2) &&
          w(1,"не") && W(2,cst_gl) && Qw_(-1,"pre_any") )
    { rett=stopp=1; d[33]++; if(dbg){print "D33"}; continue };
    if ( q(1,"gl_nein gl_need deep_ne") && s(0) && p(1) &&
          W(1,cst_gl) && Qw_(-1,"pre_any") )
    { rett=stopp=1; d[34]++; if(dbg){print "D34"}; continue };
    if ( q(2,"gl_nein gl_need deep_ne") && s(0,1) && p(2) &&
          w(1,"не") && W(2,cst_gl) && Qw_(-1,"pre_any") )
    { rett=stopp=1; d[35]++; if(dbg){print "D35"}; continue };
    #
    if ( mod_ed(-2) && gl_peedge(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
          W(-1,"быть") )
    { rett=stopp=1; d[36]++; if(dbg){print "D36"}; continue };
    if ( gl_peedge(-1) && s(-1) && p(0) &&
          W(-1,cst_gl) )
    { rett=stopp=1; d[37]++; if(dbg){print "D37"}; continue };
    if ( q(1,"gl_pein gl_peedge deep_pe") && s(0) && p(-1) &&
          W(1,cst_gl) )
    { rett=stopp=1; d[38]++; if(dbg){print "D38"}; continue };
 #
 if ( suw_edmuim(0) ) {
    #
    if ( mod_ed(-2) && gl_needmu(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
          W(-1,"быть") )
    { rett=stopp=1; d[39]++; if(dbg){print "D39"}; continue };
    if ( gl_needmu(-1) && s(-1) && p(0) &&
          W(-1,cst_gl) )
    { rett=stopp=1; d[40]++; if(dbg){print "D40"}; continue };
    if ( q(1,"nar_spos prl_kred_sr") &&
          q(2,"gl_ed") && s(0,1) && p(-1) &&
           W(2,cst_gl) )
    { rett=stopp=1; d[41]++; if(dbg){print "D41"}; continue };
    if ( q(1,"gl_ed") && s(0) && p(-1) &&
          W(1,cst_gl) )
    { rett=stopp=1; d[42]++; if(dbg){print "D42"}; continue };
    #
    if ( mod_ed(-2) && gl_peedmu(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
           W(-1,"быть") )
    { rett=stopp=1; d[43]++; if(dbg){print "D43"}; continue };
    if ( gl_peedmu(-1) && s(-1) && p(0) &&
          W(-1,cst_gl) )
    { rett=stopp=1; d[44]++; if(dbg){print "D44"}; continue };
    if ( gl_peedmu(1) && s(0) && p(-1) &&
          W(1,cst_gl) )
    { rett=stopp=1; d[45]++; if(dbg){print "D45"}; continue };
    if ( q(1,"suw_edmuim prl_edmuim mest_edmuim") && se(0,"-") )
    { rett=stopp=1; d[46]++; if(dbg){print "D46"}; continue };

 };
 if ( suw_edsrim(0) ) {
    #
    if ( mod_ed(-2) && gl_needsr(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
          W(-1,"быть") )
    { rett=stopp=1; d[47]++; if(dbg){print "D47"}; continue };
    if ( gl_needsr(-1) && s(-1) && p(0) &&
          W(-1,cst_gl) )
    { rett=stopp=1; d[48]++; if(dbg){print "D48"}; continue };
    if ( q(1,"nar_spos prl_kred_sr") &&
          q(2,"gl_ed") && s(0,1) && p(-1) &&
           W(2,cst_gl) )
    { rett=stopp=1; d[49]++; if(dbg){print "D49"}; continue };
    if ( q(1,"gl_ed") && s(0) && p(-1) &&
          W(1,cst_gl) )
    { rett=stopp=1; d[50]++; if(dbg){print "D50"}; continue };
    #
    if ( mod_ed(-2) && gl_peedsr(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
          W(-1,"быть") )
    { rett=stopp=1; d[51]++; if(dbg){print "D51"}; continue };
    if ( gl_peedsr(-1) && s(-1) && p(0) &&
          W(-1,cst_gl) )
    { rett=stopp=1; d[52]++; if(dbg){print "D52"}; continue };
    if ( q(1,"suw_edsrim prl_edsrim mest_edsrim") && se(0,"-") )
    { rett=stopp=1; d[53]++; if(dbg){print "D53"}; continue };

 };
 if ( suw_edzeim(0) ) {
    #
    if ( mod_ed(-2) && gl_needze(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
      W(-1,"быть") )
    { rett=stopp=1; d[54]++; if(dbg){print "D54"}; continue };
    if ( gl_needze(-1) && s(-1) && p(0) &&
          W(-1,cst_gl) )
    { rett=stopp=1; d[55]++; if(dbg){print "D55"}; continue };
    if ( q(1,"nar_spos prl_kred_sr") &&
          q(2,"gl_ed") && s(0,1) && p(-1) &&
           W(2,cst_gl) )
    { rett=stopp=1; d[56]++; if(dbg){print "D56"}; continue };
    if ( q(1,"gl_ed") && s(0) && p(-1) &&
          W(1,cst_gl) )
    { rett=stopp=1; d[57]++; if(dbg){print "D57"}; continue };
    #
    if ( mod_ed(-2) && gl_peedze(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
          W(-1,"быть") )
    { rett=stopp=1; d[58]++; if(dbg){print "D58"}; continue };
    if ( gl_peedze(-1) && s(-1) && p(0) &&
          W(-1,cst_gl) )
    { rett=stopp=1; d[59]++; if(dbg){print "D59"}; continue };
    if ( q(1,"suw_edzeim prl_edzeim mest_edzeim") && se(0,"-") )
    { rett=stopp=1; d[60]++; if(dbg){print "D60"}; continue };

 };
 if ( suw_mnim(0) ) {
    #
    if ( mod_ed(-2) && gl_nemn(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
          W(-1,"быть") )
    { rett=stopp=1; d[61]++; if(dbg){print "D61"}; continue };
    if ( q(-1,"gl_nemn gl_vzmn") && s(-1) && p(0) &&
          W(-1,cst_gl) )
    { rett=stopp=1; d[62]++; if(dbg){print "D62"}; continue };
    if ( q(1,"gl_nemn gl_vzmn") && s(0) && p(-1) &&
          W(1,cst_gl) )
    { rett=stopp=1; d[63]++; if(dbg){print "D63"}; continue };
    #
    if ( mod_ed(-2) && gl_pemn(-2) && gl_in(-1) && s(-2,-1) && p(0) &&
          W(-1,"быть") )
    { rett=stopp=1; d[64]++; if(dbg){print "D64"}; continue };
    if ( gl_pemn(-1) && s(-1) && p(0) &&
          W(-1,cst_gl) )
    { rett=stopp=1; d[65]++; if(dbg){print "D65"}; continue };
    if ( gl_pemn(1) && s(0) && p(-1) &&
          W(1,cst_gl) )
    { rett=stopp=1; d[66]++; if(dbg){print "D66"}; continue };
    if ( q(1,"suw_mnim prl_mnim mest_mnim") && se(0,"-") )
    { rett=stopp=1; d[67]++; if(dbg){print "D67"}; continue };
 };};
 if ( q(1,"mest_da suw_edda suw_mnda") &&
        wf(2,8,"ни") && qxs(wfn+1,"к","чему") && s(0,wfn-1) )
 { rett=stopp=1; d[68]++; if(dbg){print "D68"}; continue };
 if ( wf(1,5,"цвета оттенка") && !(Qf(1,wfn-1,"prl_edmuro prl_kred_sr")) &&
       q(wfn+1,"prl_edro suw_edro prq_edro prl_mnro suw_mnro prq_mnro suw_edne") && s(0,wfn) )
 { rett=stopp=1; d[69]++; if(dbg){print "D69"}; continue };

break}; return rett }

function sw_da_f(rett, stopp) { while (stopp == 0) {
 if ( id(1,"uw4edda") && s(0) )
 { rett=stopp=1; d[70]++; if(dbg){print "D70"}; continue };
 #
 if ( !(qb(-5,-1,"pre_any") && s(qbn,-1) ) &&
       q(-1,"gl_pnin gl_pned gl_pnmn gl_popned gl_popnmn deep_pn") && (regn(-1,"Ud")||type(-1,"giv gov")) && s(-1) )
 { rett=stopp=1; d[71]++; if(dbg){print "D71"}; continue };
 if ( q(-1,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") && (regn(-1,"Ud")||type(-1,"giv gov")) && s(-1) )
 { rett=stopp=1; d[72]++; if(dbg){print "D72"}; continue };
 if ( q(-1,"gl_nein gl_need gl_nemn gl_poneed gl_ponemn deep_ne") && (regn(-1,"Ud")||type(-1,"giv gov")) && s(-1) &&
      W(0,"смогу тому") )
 { rett=stopp=1; d[73]++; if(dbg){print "D73"}; continue };
 if ( q(1,"gl_pnin gl_pned gl_pnmn deep_pn") && (regn(1,"Ud")||type(1,"giv gov")) && s(0) &&
       W(0,"смогу тому") )
 { rett=stopp=1; d[74]++; if(dbg){print "D74"}; continue };
 if ( w(1,"не") &&
       q(2,"gl_in gl_ed gl_mn deep") && (regn(2,"Ud")||type(2,"giv gov")) && s(0,1) &&
       W(0,"смогу") )
 { rett=stopp=1; d[75]++; if(dbg){print "D75"}; continue };
#if ( w(1,"не") &&
#      q(2,"gl_nein gl_need gl_nemn deep_ne") && (regn(2,"Ud")||type(2,"giv gov")) && s(0,1) &&
#      W(0,"смогу") )
#{ rett=stopp=1; d[76]++; if(dbg){print "D76"}; continue };
#if ( w(1,"не") &&
#      q(2,"gl_pnin gl_pned gl_pnmn deep_pn") && (regn(2,"Ud")||type(2,"giv gov")) && s(0,1) &&
#      W(0,"смогу") )
#{ rett=stopp=1; d[77]++; if(dbg){print "D77"}; continue };

break}; return rett }

function sw_vi_f(rett, stopp) { while (stopp == 0) {
 if ( id(1,"uw4edvi") && s(0) )
 { rett=stopp=1; d[78]++; if(dbg){print "D78"}; continue };
 #
 if ( q(-1,"gl_in gl_ed gl_mn gl_poed deep") && regn(-1,"Uv") && s(-1) )
 { rett=stopp=1; d[79]++; if(dbg){print "D79"}; continue };
 if ( q(-2,"gl_in gl_ed gl_mn gl_poed deep") && regn(-2,"Uv") &&
       q(-1,"mest_da") && s(-2,-1) )
 { rett=stopp=1; d[80]++; if(dbg){print "D80"}; continue };
 if ( q(-1,"gl_pnin gl_pned gl_pnmn gl_poed deep_pn") && regn(-1,"Uv") && s(-1) )
 { rett=stopp=1; d[81]++; if(dbg){print "D81"}; continue };
 if ( q(-2,"gl_in gl_ed gl_mn gl_poed gl_pomn deep") && type(-2,"gov giv") &&
       q(-1,"mest_da suw_edda suw_mnda") && s(-2,-1) && W(-1,"своему твоему нашему моему") )
 { rett=stopp=1; d[82]++; if(dbg){print "D82"}; continue };
 if ( q(-2,"gl_in gl_ed gl_mn gl_poed gl_pomn deep") && type(-2,"gov") &&
       q(-1,"mest_vi prl_mnvi") && s(-2,-1) )
 { rett=stopp=1; d[83]++; if(dbg){print "D83"}; continue };
 if ( q(-1,"gl_in gl_ed gl_mn gl_poed gl_pomn deep") && type(-1,"gov") && s(-1) )
 { rett=stopp=1; d[84]++; if(dbg){print "D84"}; continue };
 if ( q(-2,"gl_in gl_ed gl_mn deep") && type(-2,"vos") &&
       q(-1,"mest_vi prl_edmuvi") && s(-2,-1) )
 { rett=stopp=1; d[85]++; if(dbg){print "D85"}; continue };
 if ( q(-1,"gl_in gl_ed gl_mn deep") && type(-1,"vos") && s(-1) )
 { rett=stopp=1; d[86]++; if(dbg){print "D86"}; continue };

 if ( q(-3,"gl_in gl_ed gl_mn gl_poed gl_pomn deep") && type(-3,"dvi") &&
       q(-2,"pre_vi") &&
        q(-1,"mest_vi suw_edvi suw_mnvi") && s(-3,-1) )
 { rett=stopp=1; d[87]++; if(dbg){print "D87"}; continue };

 if ( q(-1,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe prq_pe") && s(-1) )
 { rett=stopp=1; d[88]++; if(dbg){print "D88"}; continue };
 if ( q(-3,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") &&
       pre_ro(-2) &&
        q(-1,"mest_ro suw_edro suw_mnro") && s(-3,-1) )
 { rett=stopp=1; d[89]++; if(dbg){print "D89"}; continue };
 if ( q(-1,"gl_pnin gl_pned gl_pnmn gl_popned gl_popnmn deep_pn") && s(-1) )
 { rett=stopp=1; d[90]++; if(dbg){print "D90"}; continue };
 if ( q(-3,"gl_pnin gl_pned gl_pnmn gl_popned gl_popnmn deep_pn") &&
       pre_ro(-2) &&
        q(-1,"mest_ro suw_edro suw_mnro") && s(-3,-1) )
 { rett=stopp=1; d[91]++; if(dbg){print "D91"}; continue };
 if ( q(1,"gl_pein gl_peed gl_pemn deep_pe") &&
       q(2,"name_im_sy name_tv_sy isname") && s(0,1) )
 { rett=stopp=1; d[92]++; if(dbg){print "D92"}; continue };
 if ( q(-2,"gl_pnin gl_pned gl_pnmn gl_poed gl_pomn deep_pn") &&
       w(-1,"ещё") && s(-2,-1) )
 { rett=stopp=1; d[93]++; if(dbg){print "D93"}; continue };
 if ( q(1,"suw_edim suw_mnim") && p(-1) && Q(1,"gl_mn") &&
       q(2,"gl_pnin gl_pned gl_pnmn gl_poed gl_pomn deep_pn") && s(0,1) )
 { rett=stopp=1; d[94]++; if(dbg){print "D94"}; continue };

 if ( qb(-5,-1,"pre_any") && s(qbn,-1) &&
       q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && s(-1) )
 { rett=stopp=1; d[95]++; if(dbg){print "D95"}; continue };

 if ( qxs(-1,"в","виду") &&
      q(xsn-2,"mest_im suw_edim suw_mnim") &&
       base(xsn-1,"иметь") && s(xsn-2) )
 { rett=stopp=1; d[96]++; if(dbg){print "D96"}; continue };


 if ( pre_ro(-2) && p(-3) &&
       q(-2,"suw_edro suw_mnro") &&
        q(-1,"gl_peed gl_pemn deep_pe gl_pned gl_pnmn deep_pn") && s(-2,-1) && p(0) )
 { rett=stopp=1; d[97]++; if(dbg){print "D97"}; continue };
 if ( pre_tv(-2) && p(-3) &&
       q(-2,"suw_edtv suw_mntv") &&
        q(-1,"gl_peed gl_pemn deep_pe gl_pned gl_pnmn deep_pn") && s(-2,-1) && p(0) )
 { rett=stopp=1; d[98]++; if(dbg){print "D98"}; continue };
 if ( q(1,"suw_edzevi prl_edzevi mest_edzevi") && se(0,"-") )
 { rett=stopp=1; d[99]++; if(dbg){print "D99"}; continue };


 if ( qxs(-1,"в","виду") &&
      q(xsn-2,"mest_im suw_edim suw_mnim") &&
       base(xsn-1,"иметь") && s(xsn-2) )
 { rett=stopp=1; d[100]++; if(dbg){print "D100"}; continue };


 if ( (p(-2)||(w(-2,"а и но") && s(-2)))&&
       q(-1,"suw_edim suw_mnim mest_im name_im_sy") &&
        q(1,"gl_pein gl_peed gl_pemn gl_poed gl_pomn deep_pe") && s(-1,0) && p(1) )
 { rett=stopp=1; d[101]++; if(dbg){print "D101"}; continue };

break}; return rett }

function sw_tv_f(rett, stopp) { while (stopp == 0) {
 if ( id(1,"uw4edtv") && s(0) )
 { rett=stopp=1; d[102]++; if(dbg){print "D102"}; continue };
 #
 if ( q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && regn(-1,"Ut") && s(-1) )
 { rett=stopp=1; d[103]++; if(dbg){print "D103"}; continue };
 if ( q(1,"gl_pnin gl_pned gl_pnmn deep_pn") && regn(1,"Ut") && s(0) )
 { rett=stopp=1; d[104]++; if(dbg){print "D104"}; continue };
 if ( q(-2,"suw_edim suw_mnim mest_im") &&
       q(-1,"gl_pein gl_peed gl_pemn deep_pe") && s(-2,-1) && Q(0,"nar_vrem") )
 { rett=stopp=1; d[105]++; if(dbg){print "D105"}; continue };
 if ( q(-2,"gl_pein gl_peed gl_pemn deep_pe prq_pe") &&
       q(-1,"suw_edim suw_mnim mest_im mest_3e") && s(-2,-1) && Q(0,"nar_vrem") )
 { rett=stopp=1; d[106]++; if(dbg){print "D106"}; continue };

break}; return rett }

function sw_ro_f(rett, stopp) { while (stopp == 0) {

 # Сильное управление

#if ( q(-2,"gl_ed gl_mn gl_in deep") && wc(-2,"^до") &&
#      w(-1,"до") && s(-2,-1) )
#{ rett=stopp=1; d[107]++; if(dbg){print "D107"}; continue };
#if ( q(-2,"gl_ed gl_mn gl_in deep") && wc(-2,"^вы ^у ^из") &&
#      w(-1,"из") && s(-2,-1) )
#{ rett=stopp=1; d[108]++; if(dbg){print "D108"}; continue };
#if ( q(-2,"gl_ed gl_mn gl_in deep") && wc(-2,"^от ^об ^из ^у") &&
#      w(-1,"от") && s(-2,-1) )
#{ rett=stopp=1; d[109]++; if(dbg){print "D109"}; continue };
#if ( q(-2,"gl_ed gl_mn gl_in deep") && wc(-2,"^с") &&
#      w(-1,"с со") && s(-2,-1) )
#{ rett=stopp=1; d[110]++; if(dbg){print "D110"}; continue };

 if ((qi_duoz(-2)||wc(-2,"[234][^0-9]*$")) && Ww_(-3,"номер") &&
       q(-1,"mest_mnim mest_mnvi prl_mnim prl_mnvi prq_mnim prq_mnvi") && Q(-1,"mest_edim mest_edvi") && s(-2,-1) )
 { rett=stopp=1; d[111]++; if(dbg){print "D111"}; continue };

 if ( !(q(-3,"suw_mnim") && sc(-3,",")) &&
       q(-2,"prq_mnvi") &&
        nar_mest(-1) && pre_ro(-1) && s(-2,-1) )
 { rett=0; stopp=1; edro2mnvi=1; d[112]++; if(dbg){print "D112"}; continue };
 if ( !(q(-3,"suw_mnim") && sc(-3,",")) &&
      q(-2,"prq_mnvi") &&
       nar_mest(-1) && pre_ro(-1) && s(-2,-1) &&
      !(q(1,"prl_mnim suw_mnim") && s(1)) )
 { rett=0; stopp=1; edro2mnvi=1; d[113]++; if(dbg){print "D113"}; continue };

 if ( w(-2,"не") && q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && regn(-1,"Nnero") && s(-2,-1) )
 { rett=0; stopp=1; edro2mnvi=1; d[114]++; if(dbg){print "D114"}; continue };
 if ( w(-2,"не") && q(-1,"gl_pein gl_peed gl_pemn deep_pe") && regn(-1,"Nnero") && s(-2,-1) )
 { rett=0; stopp=1; edro2mnvi=1; d[115]++; if(dbg){print "D115"}; continue };
 if ( w(-2,"не") && q(-1,"gl_nein gl_need gl_nemn gl_vzmn gl_vzed deep_ne") && regn(-1,"Nnero") && s(-2,-1) )
 { rett=0; stopp=1; edro2mnvi=1; d[116]++; if(dbg){print "D116"}; continue };
 if ( Qw_(-2,"pre_ro preph_ro") && !(w(-2,"не") && regn(-1,"Ynero") && s(-2) ) &&
        q(-1,"mest_pmnim mest_3e prl_mnim prl_mnvi prq_mnim prq_mnvi") && Q(-1,"mest_edim mest_edvi") && s(-1) )
 { rett=0; stopp=1; edro2mnvi=1; d[117]++; if(dbg){print "D117"}; continue };
 if ( Qw_(-3,"pre_ro preph_ro") && !(w(-3,"не") && regn(-2,"Ynero") && s(-3) ) &&
         q(-2,"mest_mnim mest_mnvi prl_mnim prl_mnvi prq_mnim prq_mnvi") && Q(-2,"mest_edim mest_edvi") && s(-2) && sc(-1,"-") )
 { rett=0; stopp=1; edro2mnvi=1; d[118]++; if(dbg){print "D118"}; continue };

 if ( pre_tv(-3) && p(-4) &&
      q(-2,"mest_tv suw_edtv suw_mntv") &&
       q(-1,"gl_in gl_ed gl_mn deep") && s(-3,-1) && p(0) )
 { rett=0; stopp=1; edro2mnim=1; d[119]++; if(dbg){print "D119"}; continue };
 if ( q(-2,"mest_ro suw_edro suw_mnro") &&
       q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && regn(-1,"Ur") && s(-2,-1) )
 { rett=0; stopp=1; edro2mnvi=1; d[120]++; if(dbg){print "D120"}; continue };

 if ( q(-3,"pre_tv preph_tv") &&
       q(-2,"mest_tv prl_edtv prl_mntv") &&
        q(-1,"suw_edtv suw_mntv suw_edne") &&
	 q(1,"suw_edim name_im_sy") &&
	  q(2,"gl_ed") && s(-3,1) )
 { rett=stopp=1; d[121]++; if(dbg){print "D121"}; continue };

 if ( q(-4,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") &&
       q(-3,"suw_edvi suw_mnvi") &&
        q(-2,"suw_edro suw_mnro") &&
         q(-1,"suw_edro suw_mnro") && s(-4,-1) && Q(0,"gl_in") )
 { rett=stopp=1; d[122]++; if(dbg){print "D122"}; continue };
 if ( q(-3,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") &&
       q(-2,"suw_edvi suw_mnvi") &&
        q(-1,"suw_edro suw_mnro") && s(-3,-1) && Q(0,"gl_in") )
 { rett=stopp=1; d[123]++; if(dbg){print "D123"}; continue };
 if ( q(-2,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") &&
       q(-1,"suw_edvi suw_mnvi") && s(-2,-1) && Q(0,"gl_in") )
 { rett=stopp=1; d[124]++; if(dbg){print "D124"}; continue };
 if ( q(-3,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") &&
       q(-2,"suw_edda suw_mnda mest_da") &&
        q(-1,"suw_edvi suw_mnvi") && s(-3,-1) && Q(0,"gl_in") )
 { rett=stopp=1; d[125]++; if(dbg){print "D125"}; continue };
 if ( q(-3,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") &&
       q(-2,"suw_edvi suw_mnvi") && s(-3,-2) && se(-1,"-") && Q(0,"gl_in") )
 { rett=stopp=1; d[126]++; if(dbg){print "D126"}; continue };
 if ( q(-3,"gl_nein gl_need gl_nemn gl_vzmn deep_ne") &&
       pre_tv(-2) &&
        q(-1,"suw_edtv suw_mntv") && Q(-1,"mest_tv prl_edtv prl_mntv") && s(-3,-1) )
 { rett=stopp=1; d[127]++; if(dbg){print "D127"}; continue };
 if ( q(-4,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") &&
       q(-3,"suw_edvi suw_mnvi") &&
        pre_ro(-2) &&
         q(-1,"suw_edro suw_mnro mest_ro") && s(-4,-1) )
 { rett=stopp=1; d[128]++; if(dbg){print "D128"}; continue };

 if ( q(-2,"mest_edim prl_edim") &&
       q(-1,"suw_edsrim") &&
        q(1,"suw_edim suw_mnim qik_im") && s(-2,0) )
 { rett=stopp=1; d[129]++; if(dbg){print "D129"}; continue };

 if ( q(-4,"suw_edtv suw_mntv") &&
       souz_iili(-3) &&
        q(-2,"prl_edtv prl_mntv") &&
         q(-1,"suw_edtv suw_mntv") && s(-4,-1) )
 { rett=stopp=1; d[130]++; if(dbg){print "D130"}; continue };
 if ( souz_iili(1) &&
       q(2,"prl_edro prl_mnro prq_edro prq_mnro") &&
        q(3,"suw_edro suw_mnro") && s(0,2) )
 { rett=stopp=1; d[131]++; if(dbg){print "D131"}; continue };
 if ( souz_iili(1) &&
       q(2,"prq_edro prq_mnro") &&
        pre_pr(3) &&
        (q(4,"mest_pr suw_edpr suw_mnpr")||w(4,"него неё них")) &&
          q(5,"suw_edro suw_mnro") && s(0,4) )
 { rett=stopp=1; d[132]++; if(dbg){print "D132"}; continue };
 if ( q(-3,"prq_edro") &&
        pre_pr(-2) &&
        (q(-1,"mest_pr suw_edpr suw_mnpr")||w(-1,"него неё них")) && s(-3,-1) )
 { rett=stopp=1; d[133]++; if(dbg){print "D133"}; continue };
 if ( souz_iili(1) &&
       q(2,"suw_edro suw_mnro") && Q(2,"suw_mnim gl_ed souz") && s(0,1) )
 { rett=stopp=1; d[134]++; if(dbg){print "D134"}; continue };
 if ( q(-2,"suw_edro suw_mnro name_ro_sy") && Q(-2,"suw_mnim gl_ed") &&
       souz_iili(-1) && s(-2,-1) )
 { rett=stopp=1; d[135]++; if(dbg){print "D135"}; continue };
 if ( q(-3,"suw_mnim") && Q(-3,"prl_mnim") &&
       q(-2,"suw_edro suw_mnro") &&
        souz_iili(-1) &&
         q(1,"gl_mn gl_vzmn") && s(-3,0) )
 { rett=stopp=1; d[136]++; if(dbg){print "D136"}; continue };

 if ( q(-2,"prl_mnim prq_mnim") && !( (pre_vi(-3)||preph_vi(-3)) && s(-3)) &&
       q(-1,"suw_edim suw_mnim") && s(-2,-1) && sv(-1,"-") )
 { rett=stopp=1; d[137]++; if(dbg){print "D137"}; continue };

 if ( q(1,"mest_im suw_edim suw_mnim") && s(0) &&
       narph_any(2) &&
        w(xsn+1,"не") &&
         q(xsn+2,"gl_peed gl_pemn gl_pein gl_pned gl_pnmn gl_pnin prq_any") && regn(xsn+2,"Ynero") && s(xsn,xsn+1) )
 { rett=stopp=1; d[138]++; if(dbg){print "D138"}; continue };
 if ( q(1,"mest_im suw_edim suw_mnim") && s(0) &&
       narph_any(2) && vv(xsn,xsn+5) &&
        w(vvn+1,"не") &&
         q(vvn+2,"gl_peed gl_pemn gl_pein gl_pned gl_pnmn gl_pnin prq_any") && regn(vvn+2,"Ynero") && s(vvn+1) )
 { rett=stopp=1; d[139]++; if(dbg){print "D139"}; continue };
 if ( q(1,"mest_im suw_edim suw_mnim") &&
       w(2,"не") &&
        q(3,"gl_peed gl_pemn gl_pein gl_pned gl_pnmn gl_pnin prq_any") && regn(3,"Ynero") && s(0,2) )
 { rett=stopp=1; d[140]++; if(dbg){print "D140"}; continue };
 if ( w(1,"не") &&
       q(2,"gl_peed gl_pemn gl_pein gl_pned gl_pnmn gl_pnin prq_any") && regn(2,"Ynero") && s(0,1) )
 { rett=stopp=1; d[141]++; if(dbg){print "D141"}; continue };
 if ( w(-2,"не") &&
       q(-1,"gl_peed gl_pemn gl_pein gl_pned gl_pnmn gl_pnin prq_any") && regn(-1,"Ynero") && s(-2,-1) )
 { rett=stopp=1; d[142]++; if(dbg){print "D142"}; continue };
 if ( w(-4,"не") &&
       q(-3,"gl_peed gl_pemn gl_pein gl_pned gl_pnmn gl_pnin prq_any") && regn(-3,"Ynero") &&
        pre_tv(-2) &&
	     q(-1,"mest_tv suw_edtv suw_mntv") && s(-4,-1) )
 { rett=stopp=1; d[143]++; if(dbg){print "D143"}; continue };
 if ( w(-3,"не") &&
       q(-2,"gl_peed gl_pemn gl_pein gl_pned gl_pnmn gl_pnin") &&
        w(-1,"и ли ведь бы же") && s(-3,-1) )
 { rett=stopp=1; d[144]++; if(dbg){print "D144"}; continue };
 if ( w(-4,"не") &&
       q(-3,"gl_peed gl_pemn gl_pein gl_pned gl_pnmn gl_pnin") &&
        w(-2,"там тут ли ведь бы же") &&
         w(-1,"и") && s(-4,-1) )
 { rett=stopp=1; d[145]++; if(dbg){print "D145"}; continue };

 if ( q(-6,"mest_da suw_edda suw_mnda") &&
       q(-5,"gl_peed gl_pemn gl_pein gl_pned gl_pnmn gl_pnin deep_pe deep_pn prq_pe") &&
        q(-4,"prl_edim prl_mnim") &&
         souz_iili(-3) &&
          q(-2,"prl_edim prl_mnim") &&
           q(-1,"suw_edim suw_mnim") &&
            q(1,"suw_edro suw_mnro") && s(-6,0) )
 { rett=stopp=1; d[146]++; if(dbg){print "D146"}; continue };
 if ( q(-4,"mest_da suw_edda suw_mnda") &&
       q(-3,"gl_peed gl_pemn gl_pein gl_pned gl_pnmn gl_pnin deep_pe deep_pn prq_pe") &&
        q(-2,"prl_edim prl_mnim") &&
         q(-1,"suw_edim suw_mnim") &&
          q(1,"suw_edro suw_mnro") && s(-4,0) )
 { rett=stopp=1; d[147]++; if(dbg){print "D147"}; continue };
 if ( q(-3,"mest_da suw_edda suw_mnda") &&
       q(-2,"gl_peed gl_pemn gl_pein gl_pned gl_pnmn gl_pnin deep_pe deep_pn prq_pe") &&
        q(-1,"suw_edim suw_mnim") &&
         q(1,"suw_edro suw_mnro") && s(-3,0) )
 { rett=stopp=1; d[148]++; if(dbg){print "D148"}; continue };

 if ( q(-2,"gl_peed gl_pemn gl_pein gl_pned gl_pnmn gl_pnin deep_pe deep_pn prq_pe") &&
       q(-1,"suw_edvi suw_mnvi") &&
        q(1,"mest_tv prl_edtv prl_mntv") &&
         q(2,"suw_edtv suw_mntv") && s(-2,1) )
 { rett=stopp=1; d[149]++; if(dbg){print "D149"}; continue };
 if ( q(-2,"gl_peed gl_pemn gl_pein gl_pned gl_pnmn gl_pnin deep_pe deep_pn prq_pe") &&
       q(-1,"suw_edvi suw_mnvi") &&
        q(1,"mest_tv suw_edtv suw_mntv") && s(-2,0) )
 { rett=stopp=1; d[150]++; if(dbg){print "D150"}; continue };

 if ( q(-2,"gl_need gl_nemn gl_nein gl_need gl_pned gl_pnmn gl_pnin deep_ne deep_pn prq_pn") &&
       q(-1,"mest_da suw_edda suw_mnda") &&
        q(1,"gl_in") && s(-2,0) )
 { rett=stopp=1; d[151]++; if(dbg){print "D151"}; continue };

 if ( ((q(-1,"souz nar_any prl_kred_sr") && s(-1))||p(-1)) &&
        w(1,"не") &&
         q(2,"gl_peed gl_pemn gl_pein gl_pned gl_pnmn gl_pnin") && s(0,1) && p(2) )
 { rett=stopp=1; d[152]++; if(dbg){print "D152"}; continue };

 if ( q(-2,"gl_in gl_ed gl_mn gl_poed gl_pomn deep") && regn(-2,"Ur") &&
       q(-1,"nar_vrem prl_kred_sr mest_ro prl_edro prl_mnro") && s(-2,-1) && Q(0,"gl_in"))
 { rett=stopp=1; d[153]++; if(dbg){print "D153"}; continue };
 if ( q(-1,"gl_in gl_ed gl_mn gl_vzmn gl_poed gl_pomn deep") && regn(-1,"Ur") && s(-1) )
 { rett=stopp=1; d[154]++; if(dbg){print "D154"}; continue };

 if ( q(-3,"suw_edim suw_mnim mest_im") &&
       q(-2,"gl_in gl_ed gl_mn deep") && regn(-2,"Ur") &&
        q(-1,"mest_ro prl_edro prq_edro") && s(-3,-1) && Q(0,"gl_in") )
 { rett=stopp=1; d[155]++; if(dbg){print "D155"}; continue };

 if ( prq_pe(-4) &&
       q(-3,"suw_edvi suw_mnvi") &&
        pre_vi(-2) &&
         q(-1,"suw_edvi suw_mnvi") && s(-4,-1) )
 { rett=stopp=1; d[156]++; if(dbg){print "D156"}; continue };


 if ( q(-1,"suw_edim suw_mnim") && Q(-1,"prl_edim prl_mnim mest_im") &&
       q(1,"gl_pein gl_peed gl_pemn gl_pnin gl_pned gl_pnmn") &&
        q(2,"prl_edvi prl_mnvi mest_vi") &&
         q(3,"suw_edvi suw_mnvi") && s(-1,2) )
 { rett=stopp=1; d[157]++; if(dbg){print "D157"}; continue };
 if ( q(-1,"suw_edim suw_mnim") && Q(-1,"prl_edim prl_mnim mest_im") &&
       q(1,"gl_pein gl_peed gl_pemn gl_pnin gl_pned gl_pnmn") &&
        q(2,"suw_edvi suw_mnvi gl_in prl_kred_sr mest_vi nar_step") && s(-1,1) )
 { rett=stopp=1; d[158]++; if(dbg){print "D158"}; continue };
 if ( q(-3,"gl_pein gl_peed gl_pemn gl_pnin gl_pned gl_pnmn") &&
       q(-2,"prl_edvi mest_vi") &&
        q(-1,"suw_edvi") && s(-3,-1) )
 { rett=stopp=1; d[159]++; if(dbg){print "D159"}; continue };
 if ( q(-1,"suw_edim suw_mnim") &&
       q(1,"qast") &&
        q(2,"qast") &&
         q(3,"gl_pein gl_peed gl_pemn gl_pnin gl_pned gl_pnmn") &&
          q(4,"suw_edtv suw_mntv gl_in prl_kred_sr mest_tv nar_step") && s(-1,3) )
 { rett=stopp=1; d[160]++; if(dbg){print "D160"}; continue };
 if ( q(-1,"suw_edim suw_mnim") &&
        q(1,"qast") &&
         q(2,"gl_pein gl_peed gl_pemn gl_pnin gl_pned gl_pnmn") &&
          q(3,"suw_edtv suw_mntv gl_in prl_kred_sr mest_tv nar_step") && s(-1,2) )
 { rett=stopp=1; d[161]++; if(dbg){print "D161"}; continue };

 if ( q(-1,"suw_edtv suw_mntv") &&
       q(1,"gl_pein gl_peed gl_pemn") && s(-1,0) )
 { rett=stopp=1; d[162]++; if(dbg){print "D162"}; continue };
 if ( q(-1,"suw_edda suw_mnda") &&
	   q(1,"gl_pein gl_peed gl_pemn") && s(-1,0) )
 { rett=stopp=1; d[163]++; if(dbg){print "D163"}; continue };

 if ( q(-5,"mest_im suw_edim suw_mnim souz") &&
       pre_ro(-4) &&
        q(-3,"prl_edro prl_mnro mest_ro") &&
         q(-2,"prl_edro prl_mnro") &&
          q(-1,"suw_edro suw_mnro") && s(-5,-1) )
 { rett=stopp=1; d[164]++; if(dbg){print "D164"}; continue };
 if ( q(-4,"mest_im suw_edim suw_mnim souz") &&
       pre_ro(-3) &&
        q(-2,"prl_edro prl_mnro mest_ro") &&
         q(-1,"suw_edro suw_mnro") && s(-4,-1) && !(narph_any(-1)) )
 { rett=stopp=1; d[165]++; if(dbg){print "D165"}; continue };
 if ( q(-3,"mest_im suw_edim suw_mnim souz") && prex!=1 &&
       pre_ro(-2) &&
        q(-1,"suw_edro suw_mnro") && s(-3,-1) )
 { rett=stopp=1; d[166]++; if(dbg){print "D166"}; continue };
 if ( q(-5,"mest_im suw_edim suw_mnim souz") &&
       pre_ro(-4) &&
        q(-3,"suw_edro suw_mnro") &&
         souz_iili(-2) &&
          q(-1,"suw_edro suw_mnro") && s(-5,-1) )
 { rett=stopp=1; d[167]++; if(dbg){print "D167"}; continue };

 if (  prq_any(-3) && Q(-3,"prq_mnim") && p(-4) &&
        pre_ro(-2) &&
         q(-1,"suw_edro suw_mnro") && s(-3,-1) )
 { rett=stopp=1; d[168]++; if(dbg){print "D168"}; continue };
 if (  prq_any(-4) && Q(-4,"prq_mnim") && p(-5) &&
        q(-3,"prl_kred_sr nar_spos") &&
         pre_ro(-2) &&
          q(-1,"suw_edro suw_mnro") && s(-4,-1) )
 { rett=stopp=1; d[169]++; if(dbg){print "D169"}; continue };

 if ( w(-3,"чем") &&
      q(-2,"suw_edim suw_mnim") &&
       q(-1,"suw_edro suw_mnro") &&
        q(1,"prl_edtv prl_mntv suw_edtv suw_mntv") && s(-3,0) )
 { rett=stopp=1; d[170]++; if(dbg){print "D170"}; continue };

 if ( q(-6,"pre_ro preph_ro") &&
       q(-5,"suw_edro suw_mnro") &&
        pre_tv(-4) &&
	 q(-3,"mest_tv prl_edtv prl_mntv prq_edtv prq_mntv") &&
          q(-2,"suw_edtv suw_mntv") &&
	   souz_iili(-1) &&
            q(1,"suw_edro suw_mnro") && s(-6,0) )
 { rett=stopp=1; d[171]++; if(dbg){print "D171"}; continue };
 if ( q(-5,"pre_ro preph_ro") &&
       q(-4,"suw_edro suw_mnro") &&
        pre_tv(-3) &&
         q(-2,"suw_edtv suw_mntv") &&
	  souz_iili(-1) &&
           q(1,"suw_edro suw_mnro") && s(-5,0) )
 { rett=stopp=1; d[172]++; if(dbg){print "D172"}; continue };

 # рп. в перечислениях
 if ( souz_iili(1) &&
       q(2,"mest_ro prl_edro prl_mnro") &&
        q(3,"prl_edro prl_mnro") &&
         q(4,"suw_edro suw_mnro") && s(0,3) )
 { rett=stopp=1; d[173]++; if(dbg){print "D173"}; continue };
 if ( souz_iili(1) &&
       q(2,"mest_ro prl_edro prl_mnro") &&
        q(3,"suw_edro suw_mnro") && s(0,2) )
 { rett=stopp=1; d[174]++; if(dbg){print "D174"}; continue };
 if ( q(1,"mest_ro prl_edro prl_mnro") && sc(0,",") &&
       q(2,"suw_edro suw_mnro") && s(1) )
 { rett=stopp=1; d[175]++; if(dbg){print "D175"}; continue };
 if ( Q(0,"suw_edne") && souz_iili(1) &&
       q(2,"suw_edro suw_mnro") && Q(2,"suw_mnim gl_paedmu") && s(0,1) )
 { rett=stopp=1; d[176]++; if(dbg){print "D176"}; continue };
 if ( souz_iili(1) && sc(0,",") &&
       q(2,"suw_edro suw_mnro") && Q(2,"suw_mnim gl_paedmu") && s(1) )
 { rett=stopp=1; d[177]++; if(dbg){print "D177"}; continue };
 if ( q(1,"suw_edro suw_mnro") && sc(0,",") && Qw_(-1,"suw_any prl_mnim") &&
       souz_iili(2) &&
        q(3,"suw_edro suw_mnro") && (Q(1,"suw_mnim gl_paedmu")||Q(3,"suw_mnim gl_paedmu")) && s(1,2) )
 { rett=stopp=1; d[178]++; if(dbg){print "D178"}; continue };
 if ( Q(0,"suw_edne") && q(-1,"suw_edro suw_mnro") && sc(-1,",") &&
       souz_iili(1) &&
        q(2,"suw_edro suw_mnro") && (Q(-1,"suw_mnim gl_paedmu")||Q(2,"suw_mnim gl_paedmu")) && s(0,1) )
 { rett=stopp=1; d[179]++; if(dbg){print "D179"}; continue };
 if ( q(-3,"suw_edro suw_mnro") && sc(-3,",") &&
       q(-2,"suw_edro suw_mnro") &&
        souz_iili(-1) && s(-2,-1) && (Q(-3,"suw_mnim gl_paedmu")||Q(-2,"suw_mnim gl_paedmu")) )
 { rett=stopp=1; d[180]++; if(dbg){print "D180"}; continue };
 if ( q(-5,"suw_edim suw_mnim") &&
       q(-4,"mest_ro prl_edro prl_mnro") &&
        q(-3,"suw_edro suw_mnro") &&
         souz_iili(-2) &&
          q(-1,"suw_edim suw_mnim") && s(-5,-1) )
 { rett=stopp=1; d[181]++; if(dbg){print "D181"}; continue };
 if ( q(-4,"suw_edim suw_mnim") &&
       q(-3,"suw_edro suw_mnro") &&
        souz_iili(-2) &&
         q(-1,"suw_edim suw_mnim") && s(-4,-1) )
 { rett=stopp=1; d[182]++; if(dbg){print "D182"}; continue };
 if ( q(-2,"suw_edro suw_mnro") && Q(-2,"suw_mnim gl_paedmu") &&
       souz_iili(-1) && s(-2,-1) )
 { rett=stopp=1; d[183]++; if(dbg){print "D183"}; continue };
 if ( q(-2,"pre_ro preph_ro") && s(-2) &&
       q(-1,"suw_edro suw_mnro name_ro_sy isname") && sc(-1,",") &&
        q(1,"suw_edro suw_mnro name_ro_sy isname") && s(0) && p(1) )
 { rett=stopp=1; d[184]++; if(dbg){print "D184"}; continue };
 if ( q(-2,"pre_vi preph_vi") && s(-2) &&
       q(-1,"suw_edvi suw_mnvi") && sc(0,",") &&
        q(1,"suw_edro suw_mnro") && p(1) )
 { rett=stopp=1; d[185]++; if(dbg){print "D185"}; continue };
 if ( q(-3,"suw_edro suw_mnro name_ro_sy") && Q(-3,"suw_mnim gl_paedmu") &&
       souz_iili(-2) &&
        q(-1,"nar_spos prl_kred_sr") && s(-3,-1) )
 { rett=stopp=1; d[186]++; if(dbg){print "D186"}; continue };
 if ( qxs(-1,"и или да","даже") && s(xsn-1) &&
       suw_mnro(xsn-1) && Q(xsn-1,"suw_mnim gl_paedmu") )
 { rett=stopp=1; d[187]++; if(dbg){print "D187"}; continue };
 if ( q(1,"suw_edro suw_mnro") && s(0) &&
       qxs(2,"и или да","опять снова даже") &&
        q(xsn+1,"suw_edro suw_mnro") && s(xsn) && Q(xsn+1,"suw_mnim") )
 { rett=stopp=1; d[188]++; if(dbg){print "D188"}; continue };
 if ( qxs(-1,"и или да","опять снова даже") && s(xsn-1) &&
       suw_mnro(xsn-1) &&
        suw_mnro(xsn-2) && sc(xsn-2,",") && (Q(xsn-1,"suw_mnim gl_paedmu")||Q(xsn-2,"suw_mnim gl_paedmu")) )
 { rett=stopp=1; d[189]++; if(dbg){print "D189"}; continue };
 if ( Q(0,"suw_edne") && souz_iili(1) &&
       q(2,"suw_edim suw_mnim") && Q(2,"suw_edro") && s(0,1) && type(2,"unit") )
 { rett=stopp=1; d[190]++; if(dbg){print "D190"}; continue };
 if ( q(-2,"suw_edim suw_mnim") && !(q(-2,"suw_edro suw_mnro")||q(1,"suw_edro suw_mnro")) &&
       souz_iili(-1) &&
        q(1,"suw_edim suw_mnim") && s(-2,0)  )
 { rett=stopp=1; d[191]++; if(dbg){print "D191"}; continue };
 if ( qF(1,5,"suw_edro suw_mnro","suw_edim suw_mnim") && sq(-1,qfn-1,",") )
 { rett=stopp=1; d[192]++; if(dbg){print "D192"}; continue };
 if ( qB(-5,-1,"suw_edro suw_mnro","suw_edim suw_mnim") && sq(qbn,-1,",") && p(0) && Qw_(qbn-1,"suw_edim suw_mnim qi_mn pre_ro preph_ro") )
 { rett=stopp=1; d[193]++; if(dbg){print "D193"}; continue };

 if ( ist_suw_mnro(-2) && Q(0,"gl_paedze") && Qist(-2,"ist_suw_edsrro") &&
       souz_iili(-1) && s(-2,-1) )
 { rett=stopp=1; d[194]++; if(dbg){print "D194"}; continue };
 if ( p(-1) && (p(0)||(q(1,"qast") && s(0) && p(1))) &&
       qb(-4,-1,"ist_suw_ro") && qq(qbn,0) )
 { rett=stopp=1; d[195]++; if(dbg){print "D195"}; continue };

 if ( pre_vi(-3) &&
       q(-2,"prl_edvi prl_mnvi mest_vi") &&
        q(-1,"suw_edvi suw_mnvi") && Q(-1,"prl_mnvi") && !( qf(1,5,"gl_mn gl_vzmn") && s(0,qfn-1) ) && s(-3,-1) &&
	!(narph_any(-1)) )
 { rett=stopp=1; d[196]++; if(dbg){print "D196"}; continue };

 if ( w(-1,"и ни") &&
       w(1,"не") &&
        q(2,"gl_ed gl_in gl_mn gl_poed gl_pomn deep") && s(-1,1) )
 { rett=stopp=1; d[197]++; if(dbg){print "D197"}; continue };
 if ( w(-5,"не") &&
       q(-4,"gl_ed gl_in gl_mn gl_poed gl_pomn deep") &&
        q(-3,"prl_edro") &&
         pre_ro(-2) &&
	  q(-1,"suw_edro suw_mnro") && s(-5,-1) )
 { rett=stopp=1; d[198]++; if(dbg){print "D198"}; continue };
 if ( w(-3,"не") &&
       q(-2,"gl_ed gl_in gl_mn gl_poed gl_pomn deep") && type(-2,"giv") &&
        q(-1,"suw_edda suw_mnda mest_da") && s(-3,-1) )
 { rett=stopp=1; d[199]++; if(dbg){print "D199"}; continue };
 if ( w(-3,"не") &&
       q(-2,"gl_ed gl_in gl_mn gl_poed gl_pomn deep") &&
        q(-1,"prl_edro prq_edro") && s(-3,-1) )
 { rett=stopp=1; d[200]++; if(dbg){print "D200"}; continue };
 if ( w(-2,"не") &&
       q(-1,"gl_ed gl_in gl_mn gl_poed gl_pomn deep") && s(-2,-1) )
 { rett=stopp=1; d[201]++; if(dbg){print "D201"}; continue };
 if ( w(-2,"нет") &&
        w(-1,"и ни никакого никакой никаких") && s(-2,-1) )
 { rett=stopp=1; d[202]++; if(dbg){print "D202"}; continue };
 if ( w(-3,"не") &&
       q(-2,"gl_ed gl_in gl_mn gl_poed gl_pomn deep") &&
        w(-1,"и ни никакого никакой никаких") && s(-3,-1) )
 { rett=stopp=1; d[203]++; if(dbg){print "D203"}; continue };
 if ( w(-4,"не") &&
       q(-3,"gl_ed gl_in gl_mn gl_poed gl_pomn deep") &&
        q(-2,"prl_edro prl_mnro prq_edro prq_mnro mest_ro") &&
         q(-1,"suw_edro suw_mnro") && s(-4,-1) )
 { rett=stopp=1; d[204]++; if(dbg){print "D204"}; continue };
 if ( p(-1) &&
       w(1,"не") &&
        q(2,"gl_in gl_ed gl_mn deep gl_vzed gl_vzmn") && s(0,1) && p(2) )
 { rett=stopp=1; d[205]++; if(dbg){print "D205"}; continue };

 if ( q(-1,"suw_edim suw_mnim") && Q(-1,"prl_mnim") &&
       q(1,"gl_ed gl_mn gl_in deep") &&
        w(2,"до из от с со") && s(-1,1) )
 { rett=stopp=1; d[206]++; if(dbg){print "D206"}; continue };

 if ( qf(1,5,"mod_bz mod_ed mod_mn") &&
       w(qfn-1,"не") && s(0,qfn-1) && p(qfn) )
 { rett=stopp=1; d[207]++; if(dbg){print "D207"}; continue };

 if ( q(-6,"gl_nein gl_need gl_nemn gl_vzmn gl_poneed gl_ponemn deep_ne") &&
       pre_pr(-5) &&
        q(-4,"prl_edpr prl_mnpr qik_pr") &&
         q(-3,"suw_edpr suw_mnpr") &&
          pre_ro(-2) &&
           q(-1,"suw_edro suw_mnro") && s(-6,-1) )
 { rett=stopp=1; d[208]++; if(dbg){print "D208"}; continue };
 if ( q(-3,"gl_nein gl_need gl_nemn gl_vzmn gl_poneed gl_ponemn deep_ne") &&
       pre_ro(-2) &&
        q(-1,"suw_edro suw_mnro") && s(-3,-1) )
 { rett=stopp=1; d[209]++; if(dbg){print "D209"}; continue };
 if ( q(-4,"gl_nein gl_need gl_nemn gl_vzmn gl_poneed gl_ponemn deep_ne") &&
       q(-3,"nar_mest") &&
        pre_ro(-2) &&
         q(-1,"suw_edro suw_mnro") && s(-4,-1) )
 { rett=stopp=1; d[210]++; if(dbg){print "D210"}; continue };
 if ( q(-2,"pre_ro preph_ro") &&
       q(-1,"suw_edro suw_mnro") &&
        q(1,"gl_nein gl_need gl_nemn gl_vzmn gl_vzmn") &&
         q(2,"mest_im prl_edim prl_mnim") &&
          q(3,"suw_edim suw_mnim") && s(-3,-1) )
 { rett=stopp=1; d[211]++; if(dbg){print "D211"}; continue };

 if ( preph_ro(-2) &&
       q(-1,"suw_edro suw_mnro") && s(-2,-1) )
 { rett=stopp=1; d[212]++; if(dbg){print "D212"}; continue };

break}; return rett }

function sw_edro_f(rett,   stopp) { while (stopp == 0) {

 if ( id(-2,"hw4edro") &&
       q(-1,"prl_edro prq_edro mest_ro") && s(-2,-1) )
 { rett=stopp=1; d[213]++; if(dbg){print "D213"}; continue };
 if ( id(-1,"hw4edro") && s(-1) )
 { rett=stopp=1; d[214]++; if(dbg){print "D214"}; continue };
 if ( id(-2,"hw4edro") && q(0,"ipa_liquid ipa_loose") &&
       pre_ro(-1) && s(-2,-1) )
 { rett=stopp=1; d[215]++; if(dbg){print "D215"}; continue };

 if ( id(1,"uw4edro") && s(0) )
 { rett=stopp=1; d[216]++; if(dbg){print "D216"}; continue };

 if ( prq_any(-2) && regn(-2,"Ur") &&
       q(-1,"prl_edro mest_ro muk_edro") && s(-2,-1) )
 { rett=stopp=1; d[217]++; if(dbg){print "D217"}; continue };
 if ( prq_any(-3) && regn(-3,"Ur") &&
       q(-2,"suw_edro suw_mnro") &&
        souz_iili(-1) && s(-3,-1) )
 { rett=stopp=1; d[218]++; if(dbg){print "D218"}; continue };
 if ( prq_any(-1) && regn(-1,"Ur") && s(-1) )
 { rett=stopp=1; d[219]++; if(dbg){print "D219"}; continue };

 if ( suw_any(-2) && type(-2,"unit") &&
       q(-1,"prl_edro prq_edro mest_ro") && s(-2,-1) && wmark("TY","kwan") )
 { rett=stopp=1; stopp=1; d[220]++; if(dbg){print "D220"}; continue };
 if ( suw_any(-1) && type(-1,"unit") && s(-1) && wmark("TY","kwan") )
 { rett=stopp=1; d[221]++; if(dbg){print "D221"}; continue };
 if ( q(-3,"gl_need gl_nemn gl_vzmn deep_ne gl_pned gl_pnmn deep_pn") && type(-3,"vos") &&
       pre_vi(-2) && q(-1,"suw_edvi suw_mnvi") &&
        q(1,"suw_edro suw_mnro prl_edro prl_mnro name_ro_sy isname") && s(-3,0) )
 { rett=stopp=1; d[222]++; if(dbg){print "D222"}; continue };

 if ( prq_sdedro(-2) &&
       (q(-1,"suw_edtv suw_mntv")||wc(-1,"[ео]й$ [ео]м$ ами$")) && s(-2,-1) )
 { rett=stopp=1; d[223]++; if(dbg){print "D223"}; continue };
 if ( prq_sdmnim(-4) &&
       pre_da(-3) &&
        q(-2,"suw_edda suw_mnda mest_da") &&
         suw_mnim(-1) && s(-4,-1) )
 { rett=stopp=1; d[224]++; if(dbg){print "D224"}; continue };

 if ( qxs(-2,"сколько где","у") &&
        q(-1,"mest_ro suw_edro suw_mnro") && p(0) )
 { rett=stopp=1; d[225]++; if(dbg){print "D225"}; continue };
 if ( qxs(-2,"сколько где","у") &&
        q(-1,"mest_ro suw_edro suw_mnro") &&
         pre_pr(1) &&
          q(2,"suw_edpr suw_mnpr") && s(0,1) )
 { rett=stopp=1; d[226]++; if(dbg){print "D226"}; continue };

 if ( qxs(-1,"не","может","быть")||
      qxs(-1,"может","не","быть хватить оказаться" ) )
 { rett=stopp=1; d[227]++; if(dbg){print "D227"}; continue };

 if ( q(-3,"gl_need gl_nemn gl_vzmn deep_ne gl_pned gl_pnmn deep_pn") && p(-4) &&
       pre_vi(-2) &&
        q(-1,"suw_edvi suw_mnvi") && s(-3,-1) && p(0) )
 { rett=stopp=1; d[228]++; if(dbg){print "D228"}; continue };

 if ( q(-5,"gl_need gl_nemn gl_vzmn deep_ne gl_pned gl_pnmn deep_pn") &&
       pre_vi(-4) && q(-3,"suw_edvi suw_mnvi") &&
        pre_vi(-2) && q(-1,"suw_edvi suw_mnvi") && s(-5,-1) )
 { rett=stopp=1; d[229]++; if(dbg){print "D229"}; continue };
 if ( q(-5,"gl_need gl_nemn gl_vzmn deep_ne gl_pned gl_pnmn deep_pn") &&
       pre_da(-4) && q(-3,"suw_edda suw_mnda") &&
        pre_vi(-2) && q(-1,"suw_edvi suw_mnvi") && s(-5,-1) )
 { rett=stopp=1; d[230]++; if(dbg){print "D230"}; continue };

 if ( qf(1,5,"gl_in gl_ed gl_mn deep") &&
       w(qfn-1,"не") && s(0,qfn-1) && type(qfn,"vos") && Q(0,"suw_edim") )
 { rett=stopp=1; d[231]++; if(dbg){print "D231"}; continue };

 if ( q(-3,"suw_edim suw_mnim") &&
       pre_pr(-2) &&
        q(-1,"suw_edpr suw_mnpr") && s(-3,-1) )
 { rett=stopp=1; d[232]++; if(dbg){print "D232"}; continue };

 if ( q(-2,"qi_duom qi_duoz") &&
       q(-1,"suw_edro") &&
        q(1,"gl_mn gl_vzmn") && s(-2,0) )
 { rett=stopp=1; d[233]++; if(dbg){print "D233"}; continue };

 if ( mest_it(-4) &&
       q(-3,"suw_edim suw_mnim") &&
        q(-2,"prl_edro prl_mnro") &&
         q(-1,"suw_edro suw_mnro") &&
          q(1,"mest_ro prl_edro prl_mnro") &&
           q(2,"suw_edro suw_mnro") && s(-4,1) )
 { rett=stopp=1; d[234]++; if(dbg){print "D234"}; continue };
 if ( mest_it(-3) &&
       q(-2,"suw_edim suw_mnim") &&
        q(-1,"suw_edro suw_mnro") &&
         q(1,"mest_ro prl_edro prl_mnro") &&
          q(2,"suw_edro suw_mnro") && s(-3,1) )
 { rett=stopp=1; d[235]++; if(dbg){print "D235"}; continue };
 if ( mest_it(-4) &&
       q(-3,"suw_edim suw_mnim") &&
        q(-2,"prl_edro prl_mnro") &&
         q(-1,"suw_edro suw_mnro") &&
           q(1,"suw_edro suw_mnro") && s(-3,0) )
 { rett=stopp=1; d[236]++; if(dbg){print "D236"}; continue };

 if ( q(-3,"suw_edim") &&
       q(-2,"prl_edro prl_mnro") &&
        q(-1,"suw_edro suw_mnro") &&
         q(1,"gl_ed") && s(-3,0) )
 { rett=stopp=1; d[237]++; if(dbg){print "D237"}; continue };
 if ( q(-2,"suw_edim") &&
       q(-1,"suw_edro suw_mnro") &&
        q(1,"gl_ed") && s(-2,0) )
 { rett=stopp=1; d[238]++; if(dbg){print "D238"}; continue };
 if ( q(-3,"suw_edim") &&
       q(-2,"suw_edro suw_mnro") &&
        q(-1," mest_ro prl_edro") &&
         q(1,"gl_ed") && s(-3,0) )
 { rett=stopp=1; d[239]++; if(dbg){print "D239"}; continue };

 if ( q(-2,"pre_ro preph_ro") &&
       q(-1,"suw_edro suw_mnro") &&
        q(1,"suw_edro suw_mnro") &&
         q(2,"gl_mn gl_vzmn") && s(-2,1) )
 { rett=stopp=1; d[240]++; if(dbg){print "D240"}; continue };

 if ( q(-4,"pre_ro preph_ro") &&
       q(-3,"mest_ro prl_edro prl_mnro") &&
        q(-2,"prl_edro prl_mnro") &&
         q(-1,"suw_edro suw_mnro suw_edne") &&
          q(1,"suw_edro name_ro_sy isname") && s(-4,0) && p(1) )
 { rett=stopp=1; d[241]++; if(dbg){print "D241"}; continue };
 if ( q(-3,"pre_ro preph_ro") &&
       q(-2,"mest_ro prl_edro prl_mnro") &&
        q(-1,"suw_edro suw_mnro suw_edne") &&
         q(1,"suw_edro name_ro_sy isname") && s(-4,0) && p(1) )
 { rett=stopp=1; d[242]++; if(dbg){print "D242"}; continue };

 if ( q(-4,"gl_pein gl_peed gl_pemn deep_pe gl_pnin gl_pned gl_pnmn deep_pn prq_pe") &&
       q(-3,"suw_edvi suw_mnvi") &&
        souz_iili(-2) &&
         q(-1,"suw_edvi suw_mnvi") &&
	  q(1,"suw_edro suw_mnro") &&  s(-4,0) )
 { rett=stopp=1; d[243]++; if(dbg){print "D243"}; continue };

 if ( qb(-6,-3,"pre_ro") &&
       q(-2,"gl_nemn") && regn(-2,"Ut") &&
        q(-1,"suw_edtv suw_mntv mest_tv") && s(-3,-1) )
 { rett=0; stopp=1; edro2mnim=1; d[244]++; if(dbg){print "D244"}; continue };
 if ( q(-3,"suw_edim suw_mnim mest_im mod_bz") &&
       q(-2,"gl_nein gl_need gl_nemn gl_vzmn deep_ne") && regn(-2,"Ut") &&
        q(-1,"suw_edtv suw_mntv mest_tv") && s(-3,-1) )
 { rett=stopp=1; d[245]++; if(dbg){print "D245"}; continue };

 if ( suw_any(-3) && regn(-3,"Ut") && Q(-3,"gl_mn") &&
       q(-2,"prl_edtv prl_mntv mest_tv") &&
        q(-1,"suw_edtv suw_mntv") && s(-3,-1) )
 { rett=stopp=1; d[246]++; if(dbg){print "D246"}; continue };
 if ( suw_any(-2) && regn(-2,"Ut") && Q(-2,"gl_mn") &&
        q(-1,"suw_edtv suw_mntv mest_tv") && s(-2,-1) )
 { rett=stopp=1; d[247]++; if(dbg){print "D247"}; continue };
 if ( (suw_any(-2)||w(-2,"был было была")) && Q(-2,"prl_mnim") &&
        w(-1,"цвета") && s(-2,-1) )
 { rett=stopp=1; d[248]++; if(dbg){print "D248"}; continue };

 if ( prq_mnim(-3) &&
       pre_ro(-2) &&
        q(-1,"suw_edro suw_mnro") &&
	 suw_mnim(1) && s(-3,0) )
 { rett=stopp=1; stopp=1; d[249]++; if(dbg){print "D249"}; continue };
 if ( q(-2,"prl_mnim prq_mnim") &&
       suw_mnim(-1) && Q(-1,"prl_mnim") &&
	q(1,"gl_mn gl_vzmn") && s(-2,0) )
 { rett=stopp=1; stopp=1; d[250]++; if(dbg){print "D250"}; continue };
 #
 if ( q(-3,"pre_vi") &&
       q(-2,"suw_edvi suw_mnvi") &&
        q(-1,"suw_edro") &&
         q(1,"suw_edim") &&
          q(2,"gl_ed mod_ed") && s(-3,1) )
 { rett=stopp=1; d[251]++; if(dbg){print "D251"}; continue };
 if ( qik_vi(-4) &&
       q(-2,"pre_vi") &&
        q(-1,"suw_edvi suw_mnvi") && s(-4,-1) )
 { rett=stopp=1; d[252]++; if(dbg){print "D252"}; continue };

 # родительный падеж: массовая обработка
 if ( q(-3,"gl_pnin gl_pned gl_pnmn deep_pn") && regn(-3,"Pt-v") &&
       pre_tv(-2) &&
        q(-1,"suw_edtv suw_mntv mest_tv") && s(-2,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[253]++; if(dbg){print "D253"}; continue };
 if ( Ww_(-4,"не") && regn(-3,"Pd-v") &&
         q(-3,"gl_pnin gl_pned gl_pnmn deep_pn") &&
          pre_da(-2) &&
           q(-1,"suw_edda suw_mnda mest_da") && s(-3,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[254]++; if(dbg){print "D254"}; continue };

 if ( q(-2,"mest_mnim") &&
       q(-1,"mest_im mest_3e") && s(-2,-1) )
 { rett=0; edro2mnim=1; stopp=1; d[255]++; if(dbg){print "D255"}; continue };
 if ( q(-1,"mest_mnim") && s(-1) )
 { rett=0; edro2mnim=1; stopp=1; d[256]++; if(dbg){print "D256"}; continue };
 if ( q(-3,"mest_mnim") &&
       suw_mnim(-2) &&
        souz_iili(-1) && s(-3,-1) )
 { rett=0; edro2mnim=1; stopp=1; d[257]++; if(dbg){print "D257"}; continue };

 if ( narph_any(-1) &&
       gl_nemn(xsn-1) && s(xsn-1,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[258]++; if(dbg){print "D258"}; continue };

 if ( se(-1,"-") && suw_mnim(0) && suw_mnim(-1) && prl_mnim(-2) )
 { rett=0; edro2mnim=1; stopp=1; d[259]++; if(dbg){print "D259"}; continue };
 if ( se(-1,"-") && suw_mnim(0) && suw_mnim(-1) && Q(-1,"suw_edro") )
 { rett=0; edro2mnim=1; stopp=1; d[260]++; if(dbg){print "D260"}; continue };
 #
 if ( p(-1) &&
       q(1,"prl_edro prl_mnro prq_edro prq_mnro") &&
        q(2,"suw_edro suw_mnro") &&
        (q(3,"suw_edro suw_mnro")||name_ro_sy(3)) && sc(3,",") &&
          prq_mnim(4) && s(-1,1) )
 { rett=0; edro2mnim=1; stopp=1; d[261]++; if(dbg){print "D261"}; continue };
 if ( p(-1) &&
       q(1,"suw_edro suw_mnro") &&
       (q(2,"suw_edro suw_mnro")||name_ro_sy(2)||isname(2)) && sc(2,",") &&
         prq_mnim(3) && s(0,1) )
 { rett=0; edro2mnim=1; stopp=1; d[262]++; if(dbg){print "D262"}; continue };


 if ( Ww_(-2,"не") &&
         deep_na(-1) && s(-1) )
 { rett=0; stopp=1; d[263]++; if(dbg){print "D263"}; continue };
 if ( suw_edzeim(-1) && q(0,"gl_paedze prl_kred_ze") && s(-1) )
 { rett=0; stopp=1; d[264]++; if(dbg){print "D264"}; continue };
 if ( suw_mnim(-1) && q(0,"gl_pamn") && s(-1) )
 { rett=0; stopp=1; d[265]++; if(dbg){print "D265"}; continue };
 if ( q(-1,"preph_vi preph_da preph_tv") && s(-1))
 { rett=0; stopp=1; d[266]++; if(dbg){print "D266"}; continue };
 if ( Ww_(-3,"не") && !(wmark("TY","part")) &&
         q(-2,"gl_pein gl_peed gl_pemn deep_pe") && Q(-2,"suw_edim") &&
          q(-1,"suw_edtv suw_mntv mest_tv") && suw_mnvi(0) && s(-2,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[267]++; if(dbg){print "D267"}; continue };
 if ( Ww_(-3,"не") &&
         prq_pe(-6) &&
          pre_pr(-5) &&
           q(-4,"suw_edpr suw_mnpr") &&
            pre_tv(-3) && q(-2,"mest_mntv prl_mntv prq_mntv") &&
             suw_mntv(-1) && suw_mnvi(0) && s(-5,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[268]++; if(dbg){print "D268"}; continue };
 if ( Ww_(-3,"не") && !(wmark("TY","part")) &&
         q(-2,"gl_pnin gl_pned gl_pnmn deep_pn") && Q(-2,"suw_edim") &&
          q(-1,"suw_edtv suw_mntv mest_tv") && suw_mnvi(0) && s(-2,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[269]++; if(dbg){print "D269"}; continue };
 if ( Ww_(-3,"не") && !(wmark("TY","part")) &&
         q(-2,"gl_pein gl_peed gl_pemn gl_vzmn deep_pe") && Q(-2,"suw_edim") &&
          q(-1,"suw_edda suw_mnda mest_da") && suw_mnvi(0) && Q(0,"gl_in") && s(-2,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[270]++; if(dbg){print "D270"}; continue };
 if ( Ww_(-3,"не") && !(wmark("TY","part")) &&
         q(-2,"gl_pnin gl_pned gl_pnmn deep_pn") && Q(-2,"suw_edim") &&
          q(-1,"suw_edda suw_mnda mest_da") && suw_mnvi(0) && Q(0,"gl_in") && s(-2,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[271]++; if(dbg){print "D271"}; continue };
 if ( swc_edtv(-1) &&
     !(w(xsn-2,"не") && s(xsn-2)) &&
        q(xsn-1,"gl_pnin gl_pned gl_pnmn deep_pn") &&
         suw_mnvi(0) && s(xsn-1,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[272]++; if(dbg){print "D272"}; continue };
 if ( q(-4,"prl_mnim prq_mnim") &&
       pre_ro(-3) &&
        q(-2,"prl_edro prl_mnro") &&
         q(-1,"suw_edro suw_mnro") && suw_mnvi(0) && s(-4,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[273]++; if(dbg){print "D273"}; continue };
 if ( q(-3,"prl_mnim prq_mnim") &&
       pre_ro(-2) &&
        q(-1,"suw_edro suw_mnro") && suw_mnvi(0) && s(-3,-1) &&
        !(suw_mnim(1) && s(1)) )
 { rett=0; edro2mnvi=1; stopp=1; d[274]++; if(dbg){print "D274"}; continue };
 if ( q(-3,"prl_mnim prq_mnim") &&
       q(-2,"suw_edtv suw_mntv") &&
        q(-1,"suw_edro suw_mnro") && suw_mnvi(0) && s(-3,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[275]++; if(dbg){print "D275"}; continue };
 if ( gl_nemn(-3) &&
       q(-2,"prl_mnim prq_mnim") &&
        q(-1,"suw_edtv suw_mntv") &&
         suw_mnvi(0) && s(-3,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[276]++; if(dbg){print "D276"}; continue };
 if ( q(-4,"prl_mn prq_mn") && sc(-4,",") &&
       pre_pr(-3) &&
        suw_mnpr(-2) &&
         q(-1,"suw_edro suw_mnro") && suw_mnvi(0) && s(-3,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[277]++; if(dbg){print "D277"}; continue };
 if ( pre_ro(-2) &&
       q(-1,"suw_edro suw_mnro") &&
        q(1,"prl_krmn gl_mn") && suw_mnvi(0) && s(-2,0) && sQ(-2,0,"-") && p(1) )
 { rett=0; edro2mnvi=1; stopp=1; d[278]++; if(dbg){print "D278"}; continue };
 if ( q(-4,"prl_mnim prq_mnim") &&
       pre_pr(-3) &&
        mest_pr(-2) &&
         q(-1,"suw_edpr suw_mnpr") && s(-4,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[279]++; if(dbg){print "D279"}; continue };
 if ( q(-4,"gl_pned gl_pnmn") &&
       nar_kaq(-3) &&
        pre_da(-2) &&
         q(-1,"suw_edda suw_mnda mest_da") && s(-4,-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[280]++; if(dbg){print "D280"}; continue };

 if ( pre_pr(-4) &&
       q(-3,"prl_edpr prl_mnpr mest_pr") &&
        q(-2,"suw_edpr suw_mnpr") &&
         q(-1,"suw_edro suw_mnro") &&
          q(1,"nar_spos") &&
           q(2,"gl_mn gl_vzmn") && s(-1,1) )
 { rett=0; stopp=1; edro2mnim=1; d[281]++; if(dbg){print "D281"}; continue };

 cst="более мало менее много полно сколько столько";
 if ( (q(-4,"prl_srav nar_srav")||w(-4,cst)) &&
        pre_da(-3) && s(-4,-3) &&
         q(-2,"suw_edda suw_mnda") && sc(-2,",") &&
          w(-1,"чем нежели") && s(-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[282]++; if(dbg){print "D282"}; continue };
 if ( (q(-2,"prl_srav nar_srav")||w(-2,cst)) && sc(-2,",") &&
        w(-1,"чем нежели") && s(-1) )
 { rett=0; edro2mnvi=1; stopp=1; d[283]++; if(dbg){print "D283"}; continue };

 if ( q(1,"suw_edro suw_mnro isname") &&
       q(2,"nar_spos prl_kred_sr") &&
        q(3,"gl_nemn gl_vzmn") && s(0,2) )
 { rett=0; edro2mnvi=1; stopp=1; d[284]++; if(dbg){print "D284"}; continue };

 ##

 if ( se(0,"-") && q(1,"suw_edro suw_mnro") && Q(1,"suw_mnim") )
 { rett=stopp=1; stopp=1; d[285]++; if(dbg){print "D285"}; continue };
 if ( se(-1,"-") && q(-1,"suw_edro suw_mnro") && Q(-1,"suw_mnim") )
 { rett=stopp=1; stopp=1; d[286]++; if(dbg){print "D286"}; continue };


 if ( q(-2,"prl_edro prl_mnro") &&
       q(-1,"mest_da suw_edda suw_mnda") && s(-2,-1) && p(0) )
 { rett=stopp=1; d[287]++; if(dbg){print "D287"}; continue };

 if ( q(-5,"gl_nein gl_need gl_nemn gl_vzed gl_vzmn deep_ne") &&
       pre_da(-4) &&
        q(-3,"prl_edda prl_mnda mest_da") &&
         q(-2,"prl_edda prl_mnda") &&
          q(-1,"suw_edda suw_mnda") && s(-4,-1) )
 { rett=stopp=1; d[288]++; if(dbg){print "D288"}; continue };
 if ( q(-4,"gl_nein gl_need gl_nemn gl_vzed gl_vzmn deep_ne") &&
       pre_da(-3) &&
        q(-2,"prl_edda prl_mnda mest_da") &&
         q(-1,"suw_edda suw_mnda") && s(-4,-1) )
 { rett=stopp=1; d[289]++; if(dbg){print "D289"}; continue };
 if ( q(-2,"gl_nein gl_need gl_nemn gl_vzed gl_vzmn deep_ne") &&
       q(-1,"suw_edda suw_mnda") &&
        q(1,"suw_edro suw_mnro") && s(-2,0) )
 { rett=stopp=1; d[290]++; if(dbg){print "D290"}; continue };

 if ( q(-2,"gl_in gl_ed gl_vzed deep") &&
       q(-1,"suw_edtv suw_mntv") && Q(-1,"pre_any") && s(-2,0) )
 { rett=stopp=1; d[291]++; if(dbg){print "D291"}; continue };

 if ( q(-2,"suw_edtv suw_mntv") && Q(-2,"pre_any") &&
       q(-1,"mest_ro prl_edro prl_mnro") &&
        q(1,"gl_in gl_ed gl_vzed deep") && s(-1,0) )
 { rett=stopp=1; d[292]++; if(dbg){print "D292"}; continue };
 if ( q(-1,"suw_edtv suw_mntv") && Q(-1,"pre_any") &&
        q(1,"gl_in gl_ed gl_vzed deep") && s(-1,0) )
 { rett=stopp=1; d[293]++; if(dbg){print "D293"}; continue };

 if ( q(-4,"gl_pein gl_peed gl_pemn deep_pe prq_pe") &&
       q(-3,"suw_edvi suw_mnvi") &&
        q(-2,"suw_edro suw_mnro") &&
         souz_iili(-1) && s(-2,0) )
 { rett=stopp=1; d[294]++; if(dbg){print "D294"}; continue };
 if ( q(-2,"gl_pein gl_peed gl_pemn deep_pe prq_pe") &&
       q(-1,"suw_edvi suw_mnvi") && Q(-1,"prl_edvi prl_mnvi pre_any") &&
        q(1,"suw_edro suw_mnro") && s(-2,0) )
 { rett=stopp=1; d[295]++; if(dbg){print "D295"}; continue };
 if ( q(-3,"gl_pein gl_peed gl_pemn deep_pe prq_pe") &&
       q(-2,"suw_edvi suw_mnvi") && Q(-2,"prl_edvi prl_mnvi pre_any") &&
        q(-1,"suw_edda suw_mnda") && s(-3,-1) )
 { rett=stopp=1; d[296]++; if(dbg){print "D296"}; continue };

 if ( q(-2,"suw_edsrim") &&
       q(-1,"mest_ro prl_edro") &&
        q(1,"gl_edsr") && s(-2,0) )
 { rett=stopp=1; d[297]++; if(dbg){print "D297"}; continue };
 if ( q(-1,"suw_edsrim") &&
       q(1,"gl_edsr") && s(-1,0) )
 { rett=stopp=1; d[298]++; if(dbg){print "D298"}; continue };

 if ( q(-2,"suw_edim suw_mnim") &&
       q(-1,"mest_ro prl_edro prq_edro") &&
        qf(1,5,"gl_vzmn gl_nemn") && s(-2,qfn-1) )
 { rett=stopp=1; d[299]++; if(dbg){print "D299"}; continue };

#if ( q(-1,"suw_edim suw_mnim") &&
#      q(1,"suw_edro suw_mnro") && s(-1,0) && p(1) )
#{ rett=stopp=1; d[300]++; if(dbg){print "D300"}; continue };

 if ( suw_mnim(-1) &&
       q(1,"nar_spos nar_step prl_kred_sr") &&
        q(2,"gl_mn gl_vzmn") && s(-1,1) )
 { rett=stopp=1; d[301]++; if(dbg){print "D301"}; continue };
 if ( suw_mnim(-1) &&
       q(1,"nar_spos nar_step prl_kred_sr") &&
        q(2,"prl_kred_sr") &&
         q(3,"gl_mn gl_vzmn") && s(-1,2) )
 { rett=stopp=1; d[302]++; if(dbg){print "D302"}; continue };
 if ( suw_mnim(-1) &&
       q(1,"nar_spos nar_step prl_kred_sr") &&
        q(2,"qast") &&
         q(3,"prl_kred_sr") &&
          q(4,"gl_mn gl_vzmn") && s(-1,3) )
 { rett=stopp=1; d[303]++; if(dbg){print "D303"}; continue };

 if ( mest_it(1) &&
        q(2,"gl_peed gl_pned") && s(0,1) )
 { rett=stopp=1; d[304]++; if(dbg){print "D304"}; continue };

 if ( q(-3,"preph_ro") &&
       suw_edro(-2) &&
        souz_iili(-1) && s(-3,-1) )
 { rett=stopp=1; d[305]++; if(dbg){print "D305"}; continue };
 if ( pre_ro(-4) &&
       q(-3,"prl_edro prl_mnro prq_edro prq_mnro mest_edro muk_edro") &&
        q(-2,"suw_edro suw_mnro") &&
         souz_iili(-1) && s(-4,-1) )
 { rett=stopp=1; d[306]++; if(dbg){print "D306"}; continue };
 if ( pre_ro(-5) &&
       q(-4,"prl_edro prl_mnro prq_edro prq_mnro mest_edro muk_edro") &&
        q(-3,"suw_edro suw_mnro") &&
         souz_iili(-2) &&
          q(-1,"mest_ro prl_edro") && s(-5,-1) )
 { rett=stopp=1; d[307]++; if(dbg){print "D307"}; continue };
 if ( q(-4,"prl_edzero prq_edzero mest_edzero muk_edro") && W(-4,"его неё её") &&
       suw_edzero(-3) &&
        souz_iili(-2) &&
         q(-1,"mest_ro") && s(-4,-1) &&
         !( q(1,"prq_mnim") && sc(0,",") ) )
 { rett=stopp=1; d[308]++; if(dbg){print "D308"}; continue };
 if ( q(-3,"prl_edzero prq_edzero mest_edzero muk_edro") && W(-3,"его неё её") &&
       suw_edzero(-2) &&
        souz_iili(-1) && s(-3,-1) &&
         !( q(1,"prq_mnim") && sc(0,",") ) )
 { rett=stopp=1; d[309]++; if(dbg){print "D309"}; continue };

 if ( ((Qw_(-4,"pre_any") && q(-3,"suw_edim") && Q(-3,"prl_edim"))||q(-3,"name_im_sy isname")) &&
       souz_iili(-2) &&
         q(-1,"suw_edim") && Q(-1,"prl_edim") &&
          qf(1,3,"prq_krmn gl_mn gl_vzmn") && s(-3,qfn-1) )
 { rett=stopp=1; d[310]++; if(dbg){print "D310"}; continue };
 if ( q(-4,"pre_da preph_da") &&
       q(-3,"suw_edda suw_mnda") &&
        souz_iili(-2) &&
         q(-1,"suw_edda suw_mnda") && s(-4,-1) )
 { rett=stopp=1; d[311]++; if(dbg){print "D311"}; continue };

 if ( qik_im(-4) &&
       q(-3,"suw_mnro") &&
        q(-2,"prl_edro prl_mnro") &&
         q(-1,"suw_edro suw_mnro") &&
          q(1,"gl_mn gl_vzmn") && s(-4,0) )
 { rett=stopp=1; d[312]++; if(dbg){print "D312"}; continue };
 if ( q(-3,"suw_mnim") &&
       q(-2,"prl_edro prl_mnro") &&
        q(-1,"suw_edro suw_mnro") &&
         q(1,"gl_mn gl_vzmn") && s(-3,0) )
 { rett=stopp=1; d[313]++; if(dbg){print "D313"}; continue };


 if ( w(-1,"пол") && sc(-1,"-") )
 { rett=stopp=1; d[314]++; if(dbg){print "D314"}; continue };

 cst="достаточно мало много нет хватает хватит";
 if ( wf(1,5,cst) && s(0,wfn-1) && p(wfn) )
 { rett=stopp=1; d[315]++; if(dbg){print "D315"}; continue };
 if ( w(-2,cst) &&
       w(-1,"ли") && s(-2,-1) && Q(0,"prl_kred_ze") )
 { rett=stopp=1; d[316]++; if(dbg){print "D316"}; continue };
 if ( w(-1,cst) && s(-1) && Q(0,"prl_kred_ze") )
 { rett=stopp=1; d[317]++; if(dbg){print "D317"}; continue };


 if ( w(-1,"ни") && s(-1) && sc(0,",") &&
       w(1,"ни") && s(1) &&
        q(2,"suw_edro suw_mnro") && Q(2,"suw_mnim") )
 { rett=stopp=1; d[318]++; if(dbg){print "D318"}; continue };
 if ( w(-3,"ни") && s(-3) && sc(-2,",") &&
       q(-2,"suw_edro suw_mnro") && Q(-2,"suw_mnim") &&
        w(-1,"ни") && s(1) )
 { rett=stopp=1; d[319]++; if(dbg){print "D319"}; continue };
 if ( w(-4,"ни") &&
       suw_edro(-3) && s(-4,-3) &&
        suw_mnim(-2) && sc(-2,",") &&
         w(-1,"ни") && s(-1) )
 { rett=stopp=1; d[320]++; if(dbg){print "D320"}; continue };
 if ( w(-6,"не") &&
       q(-5,"mod_ed mod_mn") &&
        gl_in(-4) &&
         pre_ro(-3) &&
          q(-2,"mest_ro suw_edro suw_mnro") &&
           w(-1,"ни") && s(-6,-1) )
 { rett=stopp=1; d[321]++; if(dbg){print "D321"}; continue };
 if ( w(-4,"не") &&
       q(-3,"mod_ed mod_mn") &&
        gl_in(-2) &&
          w(-1,"ни") && s(-4,-1) )
 { rett=stopp=1; d[322]++; if(dbg){print "D322"}; continue };
 if ( w(-5,"не") &&
       q(-4,"mod_ed mod_mn") &&
        qast(-3) &&
         gl_in(-2) &&
          w(-1,"ни") && s(-5,-1) )
 { rett=stopp=1; d[323]++; if(dbg){print "D323"}; continue };

 if ( Qw_(-1,"pre_any") &&
       wf(1,6,"было будет") && w(wfn-1,"не") && s(0,wfn-1) )
 { rett=stopp=1; d[324]++; if(dbg){print "D324"}; continue };
 if ( Qw_(-1,"pre_any") &&
       wf(1,5,"стало станет осталось останется остаётся хватало хватит хватило хватает") && s(0,wfn-1) )
 { rett=stopp=1; d[325]++; if(dbg){print "D325"}; continue };
 if ( Qw_(-1,"pre_any") && qsf(1,5,vvpat) && s(0,qsn-1) && vv(qsn,qsn+7) &&
       wf(vvn+1,vvn+6,"стало станет осталось останется остаётся хватало хватит хватило хватает") && s(vvn+1,wfn-1) )
 { rett=stopp=1; d[326]++; if(dbg){print "D326"}; continue };

 cst="более больше менее меньше";
 if ( w(-2,cst) &&
        w(-1,"ни") && s(-2,-1) )
 { rett=stopp=1; d[327]++; if(dbg){print "D327"}; continue };
 if ( w(-1,"ни") &&
       w(1,cst) s(-1,0) )
 { rett=stopp=1; d[328]++; if(dbg){print "D328"}; continue };

 if ( w(1,"не") && q(2,"gl_pein gl_pnin") && s(0,1) )
 { rett=stopp=1; d[329]++; if(dbg){print "D329"}; continue };

 cst="более мало менее много полно сколько столько";
 if ( (q(-2,"prl_srav nar_srav")||w(-2,cst)) &&
       (q(-1,"prl_edro prq_edro")||w(-1,"же")) && s(-2,-1) && !(gl_in(1) && s(0)) )
 { rett=stopp=1; d[330]++; if(dbg){print "D330"}; continue };
 if ( (q(-1,"prl_srav nar_srav")||w(-1,cst)) && s(-1) && !(gl_in(1) && s(0)) )
 { rett=stopp=1; d[331]++; if(dbg){print "D331"}; continue };

 if ( q(-2,"gl_pnin gl_pnin gl_pned gl_pnmn deep_pn") && Q(-2,"gl_poed gl_pomn") &&
       q(-1,"suw_edda suw_mnda mest_da") && suw_mnim(0) && Q(0,"gl_in") && s(-2,-1) && (p(0)||((souz_iili(1)||pre_any(1)) && s(0))) )
 { rett=stopp=1; d[332]++; if(dbg){print "D332"}; continue };
 if ( q(-2,"gl_nein gl_nein gl_need gl_nemn gl_vzmn deep_ne") && Q(-2,"gl_poed gl_pomn") &&
       q(-1,"suw_edda suw_mnda mest_da") && suw_mnim(0) && Q(0,"gl_in") && s(-2,-1) && (p(0)||((souz_iili(1)||pre_any(1)) && s(0))) )
 { rett=stopp=1; d[333]++; if(dbg){print "D333"}; continue };

 if ( sc(0,",") &&
        q(1,"prq_edro") )
 { rett=stopp=1; d[334]++; if(dbg){print "D334"}; continue };

 if ( prq_edro(-2) &&
       q(-1,"mest_da suw_edda suw_mnda") && s(-2,-1) )
 { rett=stopp=1; d[335]++; if(dbg){print "D335"}; continue };

 if ( q(-3,"pre_tv preph_tv") &&
       q(-2,"suw_edtv suw_mntv mest_tv") &&
        q(-1,"suw_edtv suw_mntv") && s(-3,-1) )
 { rett=stopp=1; d[336]++; if(dbg){print "D336"}; continue };
 if ( q(-2,"pre_tv preph_tv") &&
       q(-1,"suw_edtv suw_mntv mest_tv") && s(-2,-1) && sc(0,",") &&
        q(1,"suw_edtv suw_mntv") )
 { rett=stopp=1; d[337]++; if(dbg){print "D337"}; continue };
 if ( q(-2,"pre_tv preph_tv") &&
       q(-1,"suw_edtv suw_mntv mest_tv") && s(-2,-1) && sc(0,",") &&
        q(1,"mest_tv prl_edtv prl_mntv mest_3e") &&
         q(2,"suw_edtv suw_mntv") && s(1) )
 { rett=stopp=1; d[338]++; if(dbg){print "D338"}; continue };
 if ( pre_pr(-4) &&
       q(-3,"prl_edpr prq_edpr mest_pr") &&
        q(-2,"suw_edpr suw_mnpr suw_edme") &&
         q(-1,"suw_edro suw_mnro suw_edme") && s(-4,-1) &&
       !(w(1,"не") && gl_pnmn(2) && s(0,1)) )
 { rett=stopp=1; d[339]++; if(dbg){print "D339"}; continue };
 if ( pre_pr(-3) &&
       q(-2,"prl_edpr prq_edpr mest_pr") &&
        q(-1,"suw_edpr suw_mnpr suw_edme") && s(-3,-1) &&
       !(w(1,"не") && gl_pnmn(2) && s(0,1)) )
 { rett=stopp=1; d[340]++; if(dbg){print "D340"}; continue };
 if ( pre_pr(-3) &&
        q(-2,"suw_edpr suw_mnpr suw_edme") &&
         q(-1,"suw_edro suw_mnro suw_edme") && s(-3,-1) &&
       !(w(1,"не") && gl_pnmn(2) && s(0,1)) )
 { rett=stopp=1; d[341]++; if(dbg){print "D341"}; continue };
 if ( pre_pr(-4) &&
       prq_edpr(-3) &&
        q(-2,"suw_edtv suw_mntv") &&
         q(-1,"suw_edda suw_mnda suw_edme") && s(-4,-1) )
 { rett=stopp=1; d[342]++; if(dbg){print "D342"}; continue };

 if ( q(-3,"pre_ro preph_ro") &&
       q(-2,"prl_edro prq_edro prl_mnro prq_mnro mest_ro") &&
        q(-1,"suw_edro suw_mnro suw_edme") &&
         q(1,"suw_edim suw_mnim suw_edme") && s(-3,0) )
 { rett=stopp=1; d[343]++; if(dbg){print "D343"}; continue };

 if ( pre_da(-3) &&
       q(-2,"prl_edda prq_edda mest_da") &&
        q(-1,"suw_edda suw_mnda mest_da") && s(-3,-1) )
 { rett=stopp=1; d[344]++; if(dbg){print "D344"}; continue };
 if ( pre_da(-2) &&
       q(-1,"suw_edda suw_mnda mest_da") && s(-2,-1) )
 { rett=stopp=1; d[345]++; if(dbg){print "D345"}; continue };
 if ( pre_ro(-2) && p(-3) &&
       q(-1,"suw_edro suw_mnro mest_ro") && W(-1,"них") && s(-2,0) )
 { rett=stopp=1; d[346]++; if(dbg){print "D346"}; continue };



 # seek реальные фиксированные случаи

 if ( q(-4,"gl_nein gl_need gl_nemn gl_vzmn deep_ne gl_pnin gl_pned gl_pnmn deep_pn") &&
       pre_pr(-3) &&
        q(-2,"suw_edpr suw_edme suw_mnpr mest_pr") &&
         q(-1,"mest_pr prl_edpr mest_3e") && s(-4,-1) )
 { rett=stopp=1; d[347]++; if(dbg){print "D347"}; continue };
 if ( q(-3,"gl_nein gl_need gl_nemn gl_vzmn deep_ne gl_pnin gl_pned gl_pnmn deep_pn") &&
       pre_pr(-2) &&
        q(-1,"suw_edpr suw_edme suw_mnpr mest_pr") && s(-3,-1) )
 { rett=stopp=1; d[348]++; if(dbg){print "D348"}; continue };
 if ( q(-6,"gl_nein gl_need gl_nemn gl_vzmn deep_ne gl_pnin gl_pned gl_pnmn deep_pn") &&
       pre_pr(-5) &&
        q(-4,"mest_pr prl_edpr prl_mnpr") &&
	 q(-3,"suw_edpr suw_edme suw_mnpr") &&
          pre_pr(-2) &&
           q(-1,"suw_edpr suw_mnpr mest_pr") && s(-6,-1) )
 { rett=stopp=1; d[349]++; if(dbg){print "D349"}; continue };
 if ( q(-5,"gl_nein gl_need gl_nemn gl_vzmn deep_ne gl_pnin gl_pned gl_pnmn deep_pn") &&
       pre_tv(-4) &&
        q(-3,"suw_edtv suw_mntv") &&
         pre_pr(-2) &&
          q(-1,"suw_edpr suw_mnpr mest_pr") && s(-5,-1) )
 { rett=stopp=1; d[350]++; if(dbg){print "D350"}; continue };
 if ( q(-5,"gl_nein gl_need gl_nemn gl_vzmn deep_ne") &&
       q(-4,"suw_edim suw_mnim") &&
        q(-3,"suw_edro suw_mnro") &&
         pre_pr(-2) &&
          q(-1,"suw_edpr suw_mnpr mest_pr") && s(-5,-1) )
 { rett=stopp=1; d[351]++; if(dbg){print "D351"}; continue };
 if ( q(-5,"gl_nein gl_need gl_nemn gl_vzmn deep_ne") &&
       q(-4,"mest_tv prl_edtv prl_mntv") &&
        q(-3,"suw_edtv suw_mntv") &&
         pre_pr(-2) &&
          q(-1,"suw_edpr suw_edme suw_mnpr mest_pr") && s(-5,-1) )
 { rett=stopp=1; d[352]++; if(dbg){print "D352"}; continue };
 if ( q(-3,"gl_nein gl_need gl_nemn gl_vzmn deep_ne") &&
       pre_vi(-2) &&
        q(-1,"suw_edvi suw_mnvi") && Q(-1,"mest_vi prl_edvi prl_mnvi") && s(-3,-1) )
 { rett=stopp=1; d[353]++; if(dbg){print "D353"}; continue };
 if ( q(-4,"gl_nein gl_need gl_nemn gl_vzmn deep_ne") &&
       q(-3,"prl_kred_sr nar_kaq nar_spos") &&
        pre_vi(-2) &&
         q(-1,"suw_edvi suw_mnvi") && Q(-1,"mest_vi prl_edvi prl_mnvi") && s(-4,-1) )
 { rett=stopp=1; d[354]++; if(dbg){print "D354"}; continue };
 if ( q(-6,"gl_nein gl_need gl_nemn gl_vzmn deep_ne") &&
       pre_vi(-5) &&
        q(-4,"suw_edvi suw_mnvi") &&
	 q(-3,"nar_mest") &&
          pre_tv(-2) &&
           q(-1,"suw_edtv suw_mntv") && Q(-1,"mest_tv prl_edtv prl_mntv") && s(-6,-1) )
 { rett=stopp=1; d[355]++; if(dbg){print "D355"}; continue };
 if ( q(-6,"gl_nein gl_need gl_nemn gl_vzmn deep_ne") &&
       pre_pr(-5) &&
        q(-4,"prl_edpr prl_mnpr") &&
         q(-3,"suw_edpr suw_edme suw_mnpr") &&
          pre_tv(-2) &&
           q(-1,"suw_edtv suw_mntv") && Q(-1,"mest_tv prl_edtv prl_mntv") && s(-6,-1) )
 { rett=stopp=1; d[356]++; if(dbg){print "D356"}; continue };
 if ( q(-5,"gl_nein gl_need gl_nemn gl_vzmn deep_ne") &&
       pre_pr(-4) &&
        q(-3,"suw_edpr suw_edme suw_mnpr") &&
         pre_tv(-2) &&
          q(-1,"suw_edtv suw_mntv") && Q(-1,"mest_tv prl_edtv prl_mntv") && s(-5,-1) )
 { rett=stopp=1; d[357]++; if(dbg){print "D357"}; continue };

 if ( q(-4,"suw_edvi suw_mnvi") &&
       q(-3,"gl_pein gl_peed gl_pemn gl_vzmn deep_pe") &&
        pre_vi(-2) &&
         q(-1,"suw_edvi suw_mnvi") && Q(-1,"mest_vi prl_edvi prl_mnvi") && s(-4,-1) )
 { rett=stopp=1; d[358]++; if(dbg){print "D358"}; continue };
 if ( q(-5,"gl_pein gl_pnin gl_peed gl_pemn gl_pned gl_pnmn deep_pe deep_pn") &&
       q(-4,"prl_edvi prl_mnvi prq_edvi prq_mnvi mest_vi") &&
        q(-3,"suw_edvi suw_mnvi") &&
         pre_pr(-2) &&
          q(-1,"suw_edpr suw_edme suw_mnpr") && Q(-1,"mest_pr prl_edpr prl_mnpr") && s(-5,-1) )
 { rett=stopp=1; d[359]++; if(dbg){print "D359"}; continue };
 if ( q(-4,"gl_pein gl_pnin gl_peed gl_pemn gl_pned gl_pnmn deep_pe deep_pn") &&
       q(-3,"suw_edvi suw_mnvi mest_vi") &&
        pre_pr(-2) &&
         q(-1,"suw_edpr suw_mnpr") && Q(-1,"mest_pr prl_edpr prl_mnpr") && s(-4,-1) )
 { rett=stopp=1; d[360]++; if(dbg){print "D360"}; continue };
 if ( q(-6,"gl_pein gl_pnin gl_peed gl_pemn gl_pned gl_pnmn deep_pe deep_pn") &&
       q(-5,"prl_edvi prl_mnvi prq_edvi prq_mnvi mest_vi") &&
        q(-4,"suw_edvi suw_mnvi") &&
         pre_pr(-3) &&
          q(-2,"suw_edpr suw_mnpr") && Q(-2,"mest_pr prl_edpr prl_mnpr") &&
	   mest_ro(-1) && s(-6,-1) )
 { rett=stopp=1; d[361]++; if(dbg){print "D361"}; continue };
 if ( q(-5,"gl_pein gl_pnin gl_peed gl_pemn gl_pned gl_pnmn deep_pe deep_pn") &&
       q(-4,"suw_edvi suw_mnvi mest_vi") &&
        pre_pr(-3) &&
         q(-2,"suw_edpr suw_edme suw_mnpr") && Q(-2,"mest_pr prl_edpr prl_mnpr") &&
	  mest_ro(-1) && s(-5,-1) )
 { rett=stopp=1; d[362]++; if(dbg){print "D362"}; continue };
 if ( q(-5,"gl_pein gl_pnin gl_peed gl_pemn gl_pned gl_pnmn deep_pe deep_pn") &&
       q(-4,"prl_edvi prl_mnvi prq_edvi prq_mnvi mest_vi") &&
        q(-3,"suw_edvi suw_mnvi") &&
        pre_vi(-2) &&
         q(-1,"suw_edvi suw_mnvi") && Q(-1,"mest_vi prl_edvi prl_mnvi") && s(-5,-1) )
 { rett=stopp=1; d[363]++; if(dbg){print "D363"}; continue };
 if ( q(-4,"gl_pein gl_pnin gl_peed gl_pemn gl_pned gl_pnmn deep_pe deep_pn") &&
       q(-3,"suw_edvi suw_mnvi mest_vi") &&
        pre_vi(-2) &&
         q(-1,"suw_edvi suw_mnvi") && Q(-1,"mest_vi prl_edvi prl_mnvi") && s(-4,-1) )
 { rett=stopp=1; d[364]++; if(dbg){print "D364"}; continue };
 if ( q(-5,"gl_pein gl_pnin gl_peed gl_pemn gl_pned gl_pnmn deep_pe deep_pn") &&
       q(-4,"suw_edvi suw_mnvi mest_vi") &&
        pre_vi(-3) &&
         q(-2,"suw_edvi suw_mnvi") && Q(-2,"mest_vi prl_edvi prl_mnvi") && s(-5,-2) && sc(-1,"-") )
 { rett=stopp=1; d[365]++; if(dbg){print "D365"}; continue };
 if ( q(-5,"gl_pein gl_pnin gl_peed gl_pemn gl_pned gl_pnmn deep_pe deep_pn") &&
       q(-4,"prl_edvi prl_mnvi prq_edvi prq_mnvi mest_vi") &&
        q(-3,"suw_edvi suw_mnvi") &&
         pre_tv(-2) &&
          q(-1,"suw_edtv suw_mntv") && Q(-1,"mest_tv prl_edtv prl_mntv") && s(-5,-1) )
 { rett=stopp=1; d[366]++; if(dbg){print "D366"}; continue };
 if ( q(-4,"gl_pein gl_pnin gl_peed gl_pemn gl_pned gl_pnmn deep_pe deep_pn") &&
       q(-3,"suw_edvi suw_mnvi mest_vi") &&
        pre_tv(-2) &&
         q(-1,"suw_edtv suw_mntv") && Q(-1,"mest_tv prl_edtv prl_mntv") && s(-4,-1) )
 { rett=stopp=1; d[367]++; if(dbg){print "D367"}; continue };

 # seek желательно включать только для поискановых паттернов
#if ( seek(-7,-3,"gl_nein gl_need gl_nemn gl_vzmn deep_ne","gl_peed gl_pemn gl_pned gl_pnmn deep_pn deep_pe") &&
#      pre_pr(-2) &&
#       q(-1,"suw_edpr suw_mnpr mest_pr") && s(skn,-1) )
#{ rett=stopp=1; d[368]++; if(dbg){print "D368"}; continue };
#if ( seek(-8,-4,"gl_nein gl_need gl_nemn gl_vzmn deep_ne","gl_peed gl_pemn gl_pned gl_pnmn deep_pn deep_pe") &&
#      pre_pr(-3) &&
#       q(-2,"suw_edpr suw_mnpr mest_pr") &&
#        mest_ro(-1) && s(skn,-1) )
#{ rett=stopp=1; d[369]++; if(dbg){print "D369"}; continue };
#if ( seek(-7,-3,"gl_nein gl_need gl_nemn gl_vzmn deep_ne","gl_peed gl_pemn gl_pned gl_pnmn deep_pn deep_pe") &&
#      pre_vi(-2) &&
#       q(-1,"suw_edvi suw_mnvi") && Q(-1,"mest_vi prl_edvi prl_mnvi") && s(skn,-1) )
#{ rett=stopp=1; d[370]++; if(dbg){print "D370"}; continue };
#if ( seek(-8,-4,"gl_nein gl_need gl_nemn gl_vzmn deep_ne","gl_peed gl_pemn gl_pned gl_pnmn deep_pn deep_pe") &&
#      pre_vi(-3) &&
#       q(-2,"suw_edvi suw_mnvi mest_vi") && Q(-2,"prl_edvi prl_mnvi") &&
#        mest_ro(-1) && s(skn,-1) )
#{ rett=stopp=1; d[371]++; if(dbg){print "D371"}; continue };
#if ( seek(-7,-3,"gl_nein gl_need gl_nemn gl_vzmn deep_ne","gl_peed gl_pemn gl_pned gl_pnmn deep_pn deep_pe") &&
#      pre_tv(-2) &&
#       q(-1,"suw_edtv suw_mntv") && Q(-1,"mest_tv prl_edtv prl_mntv") && s(skn,-1) )
#{ rett=stopp=1; d[372]++; if(dbg){print "D372"}; continue };
#if ( seek(-8,-4,"gl_nein gl_need gl_nemn gl_vzmn deep_ne","gl_peed gl_pemn gl_pned gl_pnmn deep_pn deep_pe") &&
#      pre_tv(-3) &&
#       q(-2,"suw_edtv suw_mntv") && Q(-2,"mest_tv prl_edtv prl_mntv") &&
#        mest_ro(-1) && s(skn,-1) )
#{ rett=stopp=1; d[373]++; if(dbg){print "D373"}; continue };
#if ( seek(-7,-3,"gl_nein gl_need gl_nemn gl_vzmn deep_ne","gl_peed gl_pemn gl_pned gl_pnmn deep_pn deep_pe") &&
#      pre_da(-2) &&
#       q(-1,"suw_edda suw_mnda") && Q(-1,"mest_da prl_edda prl_mnda") && s(skn,-1) )
#{ rett=stopp=1; d[374]++; if(dbg){print "D374"}; continue };
#if ( seek(-8,-4,"gl_nein gl_need gl_nemn gl_vzmn deep_ne","gl_peed gl_pemn gl_pned gl_pnmn deep_pn deep_pe") &&
#      pre_da(-3) &&
#       q(-2,"suw_edda suw_mnda") && Q(-2,"mest_da prl_edda prl_mnda") &&
#        mest_ro(-1) && s(skn,-1) )
#{ rett=stopp=1; d[375]++; if(dbg){print "D375"}; continue };


#if ( seek(-9,-4,"gl_pein gl_pnin gl_peed gl_pemn gl_pned gl_pnmn deep_pe deep_pn","gl_need gl_nemn gl_vzmn deep_ne") &&
#      (q(skn+1,"suw_edvi suw_mnvi mest_vi")||(q(skn+1,"prl_edvi prl_mnvi prq_edvi prq_mnvi mest_vi") && q(skn+2,"suw_edvi suw_mnvi"))) &&
#       pre_pr(-2) &&
#        q(-1,"suw_edpr suw_mnpr") && Q(-1,"mest_pr prl_edpr prl_mnpr") && s(skn,-1) )
#{ rett=stopp=1; d[376]++; if(dbg){print "D376"}; continue };
#if ( seek(-9,-5,"gl_pein gl_pnin gl_peed gl_pemn gl_pned gl_pnmn deep_pe deep_pn","gl_need gl_nemn gl_vzmn deep_ne") &&
#      (q(skn+1,"suw_edvi suw_mnvi mest_vi")||(q(skn+1,"prl_edvi prl_mnvi prq_edvi prq_mnvi mest_vi") && q(skn+2,"suw_edvi suw_mnvi"))) &&
#       pre_pr(-3) &&
#        q(-2,"suw_edpr suw_mnpr") && Q(-2,"mest_pr prl_edpr prl_mnpr") &&
#         mest_ro(-1) && s(skn,-1) )
#{ rett=stopp=1; d[377]++; if(dbg){print "D377"}; continue };
#if ( seek(-9,-4,"gl_pein gl_pnin gl_peed gl_pemn gl_pned gl_pnmn deep_pe deep_pn","gl_need gl_nemn gl_vzmn deep_ne") &&
#      (q(skn+1,"suw_edvi suw_mnvi mest_vi")||(q(skn+1,"prl_edvi prl_mnvi prq_edvi prq_mnvi mest_vi") && q(skn+2,"suw_edvi suw_mnvi"))) &&
#       pre_vi(-2) &&
#        q(-1,"suw_edvi suw_mnvi") && Q(-1,"mest_vi prl_edvi prl_mnvi") && s(skn,-1) )
#{ rett=stopp=1; d[378]++; if(dbg){print "D378"}; continue };
#if ( seek(-9,-5,"gl_pein gl_pnin gl_peed gl_pemn gl_pned gl_pnmn deep_pe deep_pn","gl_need gl_nemn gl_vzmn deep_ne") &&
#      (q(skn+1,"suw_edvi suw_mnvi mest_vi")||(q(skn+1,"prl_edvi prl_mnvi prq_edvi prq_mnvi mest_vi") && q(skn+2,"suw_edvi suw_mnvi"))) &&
#       pre_vi(-3) &&
#        q(-2,"suw_edvi suw_mnvi") && Q(-2,"mest_vi prl_edvi prl_mnvi") &&
#         mest_ro(-1) && s(skn,-1) )
#{ rett=stopp=1; d[379]++; if(dbg){print "D379"}; continue };
#if ( seek(-9,-4,"gl_pein gl_pnin gl_peed gl_pemn gl_pned gl_pnmn deep_pe deep_pn","gl_need gl_nemn gl_vzmn deep_ne") &&
#      (q(skn+1,"suw_edvi suw_mnvi mest_vi")||(q(skn+1,"prl_edvi prl_mnvi prq_edvi prq_mnvi mest_vi") && q(skn+2,"suw_edvi suw_mnvi"))) &&
#       pre_tv(-2) &&
#        q(-1,"suw_edtv suw_mntv") && Q(-1,"mest_tv prl_edtv prl_mntv") && s(skn,-1) )
#{ rett=stopp=1; d[380]++; if(dbg){print "D380"}; continue };
#if ( seek(-9,-5,"gl_pein gl_pnin gl_peed gl_pemn gl_pned gl_pnmn deep_pe deep_pn","gl_need gl_nemn gl_vzmn deep_ne") &&
#      (q(skn+1,"suw_edvi suw_mnvi mest_vi")||(q(skn+1,"prl_edvi prl_mnvi prq_edvi prq_mnvi mest_vi") && q(skn+2,"suw_edvi suw_mnvi"))) &&
#       pre_tv(-3) &&
#        q(-2,"suw_edtv suw_mntv") && Q(-2,"mest_tv prl_edtv prl_mntv") &&
#         mest_ro(-1) && s(skn,-1) )
#{ rett=stopp=1; d[381]++; if(dbg){print "D381"}; continue };

if ( p(-2) &&
       suw_any(-1) && s(-1) && sQ(-1,-1,"-") &&
   Q(-1,"souz qast pre_any prl_any prq_any mest_ed mest_mn gl_ed gl_pemn gl_pnmn gl_nemn nar_vrem narph_any gl_poed" ) )
 { rett=stopp=1; d[382]++; if(dbg){print "D382"}; continue };
 if ( Qw_(-3,"pre_any") &&
      suw_any(-2) && mest_3e(-1) && s(-2,-1) && (p(0)||((souz_iili(1)||pre_any(1)) && s(0))) &&
   Q(-2,"souz qast pre_any prl_ed prl_mn mest_ed mest_mn gl_ed gl_pemn gl_pnmn gl_nemn nar_vrem narph_any gl_poed gl_pomn") )
 { rett=stopp=1; d[383]++; if(dbg){print "D383"}; continue };
 if ( Qw_(-2,"pre_any") &&
      suw_any(-1) && s(-1) && (p(0)||((souz_iili(1)||pre_any(1)) && s(0))) &&
   Q(-1,"souz qast pre_any prl_ed prl_mn mest_ed mest_mn gl_ed gl_pemn gl_pnmn gl_nemn nar_vrem narph_any gl_poed gl_pomn") )
 { rett=stopp=1; d[384]++; if(dbg){print "D384"}; continue };
 if ( Qw_(-3,"pre_any") &&
      suw_any(-2) && s(-2) && (p(0)||((souz_iili(2)||pre_any(2)) && s(0))) && sc(-1,"-") &&
   Q(-2,"souz qast pre_any prl_ed prl_mn mest_ed mest_mn gl_ed gl_pemn gl_pnmn gl_nemn nar_vrem narph_any gl_poed gl_pomn") )
 { rett=stopp=1; d[385]++; if(dbg){print "D385"}; continue };
 if ( Qw_(-4,"pre_any") &&
      suw_any(-3) && suw_edro(-2) && souz_iili(-1) && s(-3,-1) &&
   Q(-3,"souz qast pre_any prl_ed prl_mn mest_ed mest_mn gl_ed gl_pemn gl_pnmn gl_nemn nar_vrem narph_any gl_poed") && Q(-3,"narph_any") )
 { rett=stopp=1; d[386]++; if(dbg){print "D386"}; continue };
 if ( pre_any(-2) && p(-3) &&
       suw_any(-1) && s(-2,-1) && Q(-1,"narph_any") &&
   Q(-1,"souz qast pre_any prl_any prq_any mest_ed mest_mn gl_ed gl_pemn gl_pnmn gl_nemn nar_vrem narph_any") )
 { rett=stopp=1; d[387]++; if(dbg){print "D387"}; continue };
 if ( q(-3,"prl_any prq_any mest_any souz") && p(-4) &&
       q(-2,"prl_any prq_any") &&
        suw_any(-1) && s(-3,-1) &&
   Q(-1,"souz qast pre_any prl_any prq_any mest_ed mest_mn gl_ed gl_pemn gl_pnmn gl_nemn nar_vrem narph_any") )
 { rett=stopp=1; d[388]++; if(dbg){print "D388"}; continue };
 if ( q(-2,"prl_any prq_any mest_any souz") && p(-3) &&
       suw_any(-1) && s(-2,-1) &&
   Q(-1,"souz qast pre_any prl_any prq_any mest_ed mest_mn gl_ed gl_pemn gl_pnmn gl_nemn nar_vrem narph_any") )
 { rett=stopp=1; d[389]++; if(dbg){print "D389"}; continue };
 if ( suw_edzeim(-2) &&
       q(-1,"mest_ro prl_edro") &&
        qf(1,5,"gl_paedze") && s(-2,qfn-1) &&
   Q(-2,"souz qast pre_any prl_ed prl_mn mest_ed mest_mn gl_ed gl_pemn gl_pnmn gl_nemn nar_vrem narph_any gl_poed") )
 { rett=stopp=1; d[390]++; if(dbg){print "D390"}; continue };
 if ( suw_edzeim(-1) && qf(1,5,"gl_paedze") && s(-1,qfn-1) &&
   Q(-1,"souz qast pre_any prl_ed prl_mn mest_ed mest_mn gl_ed gl_pemn gl_pnmn gl_nemn nar_vrem narph_any gl_poed") )
 { rett=stopp=1; d[391]++; if(dbg){print "D391"}; continue };
 if ( prq_any(-2) &&
       q(-1,"suw_edtv suw_mntv") && s(-2,-1) &&
   Q(-1,"souz qast pre_any prl_ed prl_mn mest_ed mest_mn gl_ed gl_pemn gl_pnmn gl_nemn nar_vrem narph_any") )
 { rett=stopp=1; d[392]++; if(dbg){print "D392"}; continue };
 if ( pre_ro(-2) &&
       q(-1,"suw_edro suw_mnro mest_ro") &&
        w(1,"не") && mod_bz(2) && s(-2,1) )
 { rett=stopp=1; d[393]++; if(dbg){print "D393"}; continue };


break}; return rett }

function sw_em_i_f(rett, stopp) { while (stopp == 0) {
 if ( q(1,"suw_edro prl_kred_sr") &&
       q(2,"prl_kred_mu prq_kred_mu") && s(0,1) )
 { rett=stopp=1; d[394]++; if(dbg){print "D394"}; continue };
 if ( q(1,"prl_kred_mu prq_kred_mu") && s(0) )
 { rett=stopp=1; d[395]++; if(dbg){print "D395"}; continue };

 if ( q(-2,"prl_edmuim prq_edmuim mest_edmuim muk_edim") &&
       w(-1,"всё это") && Q(0,"gl_paedmu") && s(-2,-1) )
 { rett=stopp=1; d[396]++; if(dbg){print "D396"}; continue };
 if ( w(-1,"всё это") && Q(0,"gl_paedmu") && s(-1) )
 { rett=stopp=1; d[397]++; if(dbg){print "D397"}; continue };

 if ( q(-2,"prl_edmuim prq_edmuim mest_edmuim muk_edim") &&
       w(-1,"один") && s(-2,-1) )
 { rett=stopp=1; d[398]++; if(dbg){print "D398"}; continue };
 if ( w(-1,"один") && s(-1) )
 { rett=stopp=1; d[399]++; if(dbg){print "D399"}; continue };

 if ( (p(-1) || ww_(-1,"а и вот что") ) &&
         q(1,"mest_pedmuim") && s(0) )
 { rett=stopp=1; d[400]++; if(dbg){print "D400"}; continue };

 if ( q(-3,"mest_it") &&
       w(-2,"всего") &&
        w(-1,"лишь только") && s(-3,-1) )
 { rett=stopp=1; d[401]++; if(dbg){print "D401"}; continue };
 if ( q(-2,"mest_it") &&
       w(-1,"же ж лишь только") && s(-2,-1) )
 { rett=stopp=1; d[402]++; if(dbg){print "D402"}; continue };
 if ( q(-2,"mest_it") &&
       w(-1,"не") && s(-2,-1) )
 { rett=stopp=1; d[403]++; if(dbg){print "D403"}; continue };
 if ( q(-1,"mest_it") && s(-1) )
 { rett=stopp=1; d[404]++; if(dbg){print "D404"}; continue };

 if ( w(-2,"и не") &&
       q(-1,"mest_im") && s(-2,-1) && Q(0,"gl_paedmu") )
 { rett=stopp=1; d[405]++; if(dbg){print "D405"}; continue };

 #_#_#
 if ( q(-2,"pre_im") &&
       q(-1,"prl_edmuim prq_edmuim mest_edmuim muk_edim") && s(-2,-1) )
 { rett=stopp=1; d[406]++; if(dbg){print "D406"}; continue };

 if (prex == 1) { pre_string = "prex_im" } else { pre_string = "pre_im" };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[407]++; if(dbg){print "D407"}; continue };
 #_#_#

#if ( q(-1,"prl_edmuim prq_edmuim mest_edmuim muk_edim") && s(-1) )
#{ rett=stopp=1; d[408]++; if(dbg){print "D408"}; continue };
 if ( sQ(-2,-2,"-") &&
       q(-1,"prl_edmuim prq_edmuim mest_edmuim muk_edim") && Q(0,"gl_paedmu gl_bue3") && s(-1) )
 { rett=stopp=1; d[409]++; if(dbg){print "D409"}; continue };
 if ( q(-2,"prl_edmuim prq_edmuim mest_edmuim muk_edim") &&
       w(-1,"то") && sc(-1,"-") && s(-1) )
 { rett=stopp=1; d[410]++; if(dbg){print "D410"}; continue };

 if ( sw_im_f() )
 { rett=stopp=1; d[411]++; if(dbg){print "D411", "sw_im_f"}; continue };

break}; return rett }

function sw_em_v_f(rett, stopp) { while (stopp == 0) {
 if ( sw_vi_f() )
 { rett=stopp=1; d[412]++; if(dbg){print "D412", "sw_vi_f"}; continue };

 if ( q(-1,"gl_pein gl_peed gl_pemn deep_pe") && s(-1) &&
     !(q_(0,swo_edmu_ro) && q_(0,sw_edmu_ro)) )
 { rett=stopp=1; d[413]++; if(dbg){print "D413"}; continue };
 if ( q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && s(-1) &&
     !(q_(0,swo_edmu_ro) && q_(0,sw_edmu_ro)) )
 { rett=stopp=1; d[414]++; if(dbg){print "D414"}; continue };
 if ( qb(-3,-1,"prl_kred_mu") && s(qbn,-1) )
 { rett=stopp=1; d[415]++; if(dbg){print "D415"}; continue };

 #_#_#
 if ( q(-3,"pre_vi preph_vi") &&
      (q(-2,"prl_edmuvi prq_edmuvi mest_edmuvi")||wc(-2,"^[0-9]+$")) &&
       (q(-1,"prl_edmuvi prq_edmuvi mest_edmuvi")||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[416]++; if(dbg){print "D416"}; continue };
 if ( q(-2,"pre_vi preph_vi") &&
       q(-1,"prl_edmuvi prq_edmuvi muk_edvi") && s(-2,-1) )
 { rett=stopp=1; d[417]++; if(dbg){print "D417"}; continue };

 if (prex == 1) { pre_string = "prex_vi preph_vi" } else { pre_string ="pre_vi preph_vi" };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[418]++; if(dbg){print "D418"}; continue };
 #_#_#

 if ( q(-1,"preph_vi prl_edmuvi prq_edmuvi muk_edvi") && s(-1) && !(suw_any(-2) && sc(-2,"-") ) )
 { rett=stopp=1; d[419]++; if(dbg){print "D419"}; continue };
 if ( q(-2,"preph_vi prl_edmuvi prq_edmuvi muk_edvi") &&
       w(-1,"то нибудь либо") && sc(-1,"-") && s(-1) )
 { rett=stopp=1; d[420]++; if(dbg){print "D420"}; continue };

break}; return rett }

function sw_em_d_f(rett, stopp) { while (stopp == 0) {
 if ( loc2emd==1 )
 { rett=stopp=1; d[421]++; if(dbg){print "D421", "sw_da_f"}; continue };

 if ( sw_da_f() )
 { rett=stopp=1; d[422]++; if(dbg){print "D422", "sw_da_f"}; continue };

 if ( w(-1,"без до от с") && s(-1) && Q(0,"suw_edzevi prl_edzetv") )
 { rett=stopp=1; d[423]++; if(dbg){print "D423"}; continue };
 if ( w(1,"нет") && s(0) )
 { rett=stopp=1; d[424]++; if(dbg){print "D424"}; continue };

 #_#_#
 if ( q(-3,"pre_da preph_da") &&
      (q(-2,"prl_edmuda prq_edmuda mest_edmuda")||wc(-2,"^[0-9]+$")) &&
       (q(-1,"prl_edmuda prq_edmuda mest_edmuda")||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[425]++; if(dbg){print "D425"}; continue };
 if ( q(-2,"pre_da preph_da") &&
      (q(-1,"prl_edmuda prq_edmuda mest_edmuda mest_3e")||wc(-1,"^[0-9]+$")) && s(-2,-1) )
 { rett=stopp=1; d[426]++; if(dbg){print "D426"}; continue };

 if (prex == 1) { pre_string = "prex_da preph_da" } else { pre_string = "pre_da preph_da" };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[427]++; if(dbg){print "D427"}; continue };
 #_#_#
 if ( (q(-1,"preph_da prl_edmuda prq_edmuda mest_edmuda")||wc(-1,"^[0-9]+$")) && W(-1,"ему") && s(-1) && Wc(-1,"[ео]ву$") )
 { rett=stopp=1; d[428]++; if(dbg){print "D428"}; continue };
break}; return rett }

function sw_em_r_f(rett, stopp) { while (stopp == 0) {
 #
 if ((q(-4,"qi_duom")||wc(-4,"[234][^0-9]*$")) &&
       q(-3,"prl_mnro prq_mnro mest_mnro") &&
        pre_vi(-2) &&
         q(-1,"suw_edvi suw_mnvi") && s(-4,-1) )
 { rett=stopp=1; d[429]++; if(dbg){print "D429"}; continue };
 if ( (w(-2,"нет")||q(-2,"pre_ro qi_duom")||wc(-2,"[234][^0-9]*$")) &&
        q(-1,"prl_mnro prq_mnro mest_mnro") && s(-2,-1) && W(-1,"них неё них") )
 { rett=stopp=1; d[430]++; if(dbg){print "D430"}; continue };
 if ( (w(-3,"нет")||q(-3,"pre_ro qi_duom")||wc(-3,"[234][^0-9]*$")) &&
        q(-2,"prl_mnro prq_mnro mest_mnro") &&
         q(-1,"prl_mnro prq_mnro mest_mnro") && s(-3,-1) && W(-1,"них неё них") )
 { rett=stopp=1; d[431]++; if(dbg){print "D431"}; continue };

 if ( (w(-1,"нет")||q(-1,"pre_ro qi_duom")||wc(-1,"[234][^0-9]*$")) && s(-1) )
 { rett=stopp=1; d[432]++; if(dbg){print "D432"}; continue };
 if ( prq_edmuro(-3) &&
       pre_pr(-2) &&
        q(-1,"suw_edpr suw_mnpr") && s(-3,-1) )
 { rett=stopp=1; d[433]++; if(dbg){print "D433"}; continue };
 if ( w(-3,"какого") &&
       qast(-2) &&
        q(-1,"mest_im suw_edim suw_mnim") && s(-3,-1) )
 { rett=stopp=1; d[434]++; if(dbg){print "D434"}; continue };
 if ( w(-2,"какого") &&
       q(-1,"mest_im suw_edim suw_mnim") && s(-2,-1) )
 { rett=stopp=1; d[435]++; if(dbg){print "D435"}; continue };
 if ( q(1,"prl_edmuro prl_mnro") && s(0) && p(-1) && p(1) && Q(1,"suw_edro suw_mnro") )
 { rett=stopp=1; d[436]++; if(dbg){print "D436"}; continue };
 if ( q(-2,"prl_edmuro prl_mnro") &&
       q(-1,"mest_da suw_edda suw_mnda") && s(-2,-1) )
 { rett=stopp=1; d[437]++; if(dbg){print "D437"}; continue };

 #_#_#
 if ( q(-3,"pre_ro preph_ro") &&
      (q(-2,"prl_edmuro prq_edmuro mest_ro")||wc(-2,"^[0-9]+$")||wc(-2,".[ео]го$ [ео]ва$")) &&
       (q(-1,"prl_edmuro prq_edmuro")||wc(-1,"^[0-9]+$")||wc(-1,"[ео]го$ [ео]ва$")) && s(-3,-1) )
 { rett=stopp=1; d[438]++; if(dbg){print "D438"}; continue };
 if ( q(-2,"pre_ro preph_ro") &&
      (q(-1,"prl_edmuro prq_edmuro mest_ro")||wc(-1,"^[0-9]+$")||wc(-1,".[ео]го$ [ео]ва$")) && W(-1,"него неё них") && s(-2,-1) )
 { rett=stopp=1; d[439]++; if(dbg){print "D439"}; continue };

 if (prex == 1) { pre_string = "prex_ro preph_ro" } else { pre_string = "pre_ro preph_ro" };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[440]++; if(dbg){print "D440"}; continue };
 #_#_#

 if ( q(-2,"prl_edmuro prq_edmuro mest_edmuro muk_edmuro") &&
       mest_3e(-1) && s(-2,-1) )
 { rett=stopp=1; d[441]++; if(dbg){print "D441"}; continue };
 if ( (q(-2,"preph_ro prl_edmuro prq_edmuro mest_edmuro")||wc(-2,".[ео]го$ [ео]ва$")||wc(-2,"^[0-9]+$")) && W(-2,"его него") &&
        w(-1,"его её их же") && s(-2,-1) )
 { rett=stopp=1; d[442]++; if(dbg){print "D442"}; continue };
 if ( (q(-1,"preph_ro prl_edmuro prq_edmuro mest_edmuro")||wc(-1,".[ео]го$ [ео]ва$")||wc(-1,"^[0-9]+$")) && W(-1,"его него") && s(-1) )
 { rett=stopp=1; d[443]++; if(dbg){print "D443"}; continue };
 if ( (q(1,"prl_edmuro prq_edmuro")||wc(-1,".[ео]го$ [ео]ва$") ) && s(0) && p(1) )
 { rett=stopp=1; d[444]++; if(dbg){print "D444"}; continue };

 if ( sw_edro_f() )
 { rett=stopp=1; d[445]++; if(dbg){print "D445", "sw_edro_f"}; continue };
 if ( sw_ro_f() )
 { rett=stopp=1; d[446]++; if(dbg){print "D446", "sw_ro_f"}; continue };
 if ( edro2mnvi )
 { rett=0; stopp=1; d[447]++; if(dbg){print "D447"}; continue };

break}; return rett }

function sw_em_t_f(rett, stopp) { while (stopp == 0) {
 if ( sw_tv_f() )
 { rett=stopp=1; d[448]++; if(dbg){print "D448", "sw_tv_f"}; continue };

 #_#_#
 if ( q(-3,"pre_tv preph_tv") &&
      (q(-2,"prl_edmutv prq_edmutv mest_edmutv")||wc(-2,"^[0-9]+$")) &&
       (q(-1,"prl_edmutv prq_edmutv mest_edmutv")||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[449]++; if(dbg){print "D449"}; continue };
 if ( q(-2,"pre_tv preph_tv") &&
       q(-1,"prl_edmutv prq_edmutv mest_edmutv") && s(-2,-1) )
 { rett=stopp=1; d[450]++; if(dbg){print "D450"}; continue };

 if (prex == 1) { pre_string = "prex_tv preph_tv" } else { pre_string = "pre_tv preph_tv" };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[451]++; if(dbg){print "D451"}; continue };
 #_#_#

 if ( q(-1,"preph_tv prl_edmutv prq_edmutv mest_edmutv") && s(-1) )
 { rett=stopp=1; d[452]++; if(dbg){print "D452"}; continue };
break}; return rett }

function sw_em_p_f(rett, stopp) { while (stopp == 0) {
 #
 if ( ismark(-1,"Npre") )
 { rett=0; stopp=1; d[453]++; if(dbg){print "D453"}; continue };

 #_#_#
 if ( q(-3,"pre_pr") &&
      (q(-2,"prl_edmupr prq_edmupr mest_edmupr mest_3e")||wc(-2,"^[0-9]+$")) &&
       (q(-1,"prl_edmupr prq_edmupr mest_edmupr")||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[454]++; if(dbg){print "D454"}; continue };
 if ( q(-2,"pre_pr") &&
       q(-1,"prl_edmupr prq_edmupr mest_edmupr") && s(-2,-1) && W(-1,"мне нём") )
 { rett=stopp=1; d[455]++; if(dbg){print "D455"}; continue };

 if (prex == 1) { pre_string = "prex_pr" } else { pre_string = "pre_pr" };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[456]++; if(dbg){print "D456"}; continue };
 #_#_#
 if ( q(-1,"prl_edmupr prq_edmupr") && s(-1) )
 { rett=stopp=1; d[457]++; if(dbg){print "D457"}; continue };

break}; return rett }

function sw_em_q_f(rett, stopp) { while (stopp == 0) {
 #
 if ((qi_duom(-2)||wc(-2,"[234][^0-9]*$")) &&
       q(-1,"prl_edmuro prq_edmuro") && s(-2,-1) )
 { rett=stopp=1; d[458]++; if(dbg){print "D458"}; continue };
 if ((qi_duom(-3)||wc(-3,"[234][^0-9]*$")) &&
       qxs(-1,"с","половиной четвертью небольшим") && s(-3,-1) )
 { rett=stopp=1; d[459]++; if(dbg){print "D459"}; continue };
 if ( w(1,"за по на") &&
      (qi_duom(2)||wc(2,"[234][^0-9]*$")) && s(0,1) )
 { rett=stopp=1; d[460]++; if(dbg){print "D460"}; continue };
 if ( (qi_duom(-1)||wc(-1,"[234][^0-9]*$")) && s(-1) )
 { rett=stopp=1; d[461]++; if(dbg){print "D461"}; continue };
 if ( (qi_duom(1)||wc(1,"[234][^0-9]*$")) && s(0) )
 { rett=stopp=1; d[462]++; if(dbg){print "D462"}; continue };

break}; return rett }

function sw_msz_z_f(rett, stopp) { while (stopp == 0) {
 #
 if ( idb(-6,"gl4part") && Q(idn+1,"gl_in") && s(idn,-1) )
 { rett=stopp=1; d[463]++; if(dbg){print "D463"}; continue };
 if ( idf(6,"gl4part") && s(0,idn-1) )
 { rett=stopp=1; d[464]++; if(dbg){print "D464"}; continue };
 if ( bb(-6,-1,"набрать") && Q(idn+1,"gl_in") && s(idn,-1) )
 { rett=stopp=1; d[465]++; if(dbg){print "D465"}; continue };

 if ( suw_any(-2) && type(-2,"unit") &&
       q(-1,"prl_edro prq_edro mest_ro") && s(-2,-1) )
 { rett=stopp=1; stopp=1; d[466]++; if(dbg){print "D466"}; continue };
 if ( suw_any(-1) && type(-1,"unit") && s(-1) && Q(-1,"prl_any") )
 { rett=stopp=1; d[467]++; if(dbg){print "D467"}; continue };

 if ( pre_vi(-7) &&
       q(-6,"suw_edvi suw_mnvi") &&
        q(-5,"mod_bz") &&
         id(-4,"gl4part") &&
          ipa_any(-3) && sc(-3,",") &&
           qq(-7,-2) && se(-1," — ") && s(-7,-4) )
 { rett=stopp=1; d[468]++; if(dbg){print "D468"}; continue };

 if ( q(1,"mest_da suw_edda suw_mnda") && s(0,1) && p(-1) &&
       q(2,"prl_kred_sr nar_spos nar_kaq narph_any") )
 { rett=stopp=1; d[469]++; if(dbg){print "D469"}; continue };
 if ( q(1,"mest_da suw_edda suw_mnda") && s(0) && p(-1) && p(1) )
 { rett=stopp=1; d[470]++; if(dbg){print "D470"}; continue };
 if ( ipa_any(-2) &&
       q(-1,"mest_da suw_edda suw_mnda") && s(-2) && p(-3) && p(-1) && p(0) )
 { rett=stopp=1; d[471]++; if(dbg){print "D471"}; continue };

 if ( q(-2,"gl_pein gl_peed gl_pemn deep_pe") &&
       q(-1,"suw_edtv suw_mntv suw_edda suw_mnda mest_da mest_tv") && suw_mnim(0) && s(-2,-1) )
 { rett=stopp=1; d[472]++; if(dbg){print "D472"}; continue };
 if ( q(-1,"suw_edtv") && s(-1) && W(0,"холода") )
 { rett=stopp=1; d[473]++; if(dbg){print "D473"}; continue };

break}; return rett }

function sw_em_z_f(rett, stopp) { if (wmark("TY","part")) { while (stopp == 0) {
 if ( sw_msz_z_f() )
 { rett=stopp=1; d[474]++; if(dbg){print "D474", "sw_msz_z_f"}; continue };

 cst="с немного чуть-чуть немножечко";
 if ( (w(-2,cst)||q(-2,"suw_edtv gl_in gl_ed gl_nemn gl_vzmn gl_pnmn gl_pemn")) &&
        q(-1,"prl_edmuro prq_edmuro mest_edmuro") && s(-2,-1) )
 { rett=stopp=1; d[475]++; if(dbg){print "D475"}; continue };
 if ( q(-2,"gl_in gl_ed gl_nemn gl_vzmn gl_pnmn gl_pemn") &&
      (w(-1,cst)||q(-1,"suw_edtv prl_edmuro prq_edmuro mest_edmuro")) && s(-2,-1) )
 { rett=stopp=1; d[476]++; if(dbg){print "D476"}; continue };
 if ( (w(-1,cst)||q(-1,"prl_edmuro prq_edmuro mest_edmuro")) && s(-1) )
 { rett=stopp=1; d[477]++; if(dbg){print "D477"}; continue };

break};}; return rett }

function sw_es_z_f(rett, stopp) { if (wmark("TY","part")) { while (stopp == 0) {
 if ( sw_msz_z_f() )
 { rett=stopp=1; d[478]++; if(dbg){print "D478", "sw_msz_z_f"}; continue };

 cst="с немного чуть-чуть немножечко";
 if ( (w(-2,cst)||q(-2,"suw_edtv gl_in gl_ed gl_nemn gl_vzmn gl_pnmn gl_pemn")) &&
        q(-1,"prl_edsrro prq_edsrro mest_edsrro") && s(-2,-1) )
 { rett=stopp=1; d[479]++; if(dbg){print "D479"}; continue };
 if ( q(-2,"gl_in gl_ed gl_nemn gl_vzmn gl_pnmn gl_pemn") &&
      (w(-1,cst)||q(-1,"suw_edtv prl_edsrro prq_edsrro mest_edsrro")) && s(-2,-1) )
 { rett=stopp=1; d[480]++; if(dbg){print "D480"}; continue };
 if ( (w(-1,cst)||q(-1,"suw_edtv prl_edsrro prq_edsrro mest_edsrro")) && s(-1) )
 { rett=stopp=1; d[481]++; if(dbg){print "D481"}; continue };

 break};}; return rett }

function sw_ez_z_f(rett, stopp) { if (wmark("TY","part")) { while (stopp == 0) {
 if ( sw_msz_z_f() )
 { rett=stopp=1; d[482]++; if(dbg){print "D482", "sw_msz_z_f"}; continue };

 cst="с немного чуть-чуть немножечко";
 if ( (w(-2,cst)||q(-2,"suw_edtv gl_in gl_ed gl_nemn gl_vzmn gl_pnmn gl_pemn")) &&
        q(-1,"prl_edzero prq_edzero mest_edzero") && s(-2,-1) )
 { rett=stopp=1; d[483]++; if(dbg){print "D483"}; continue };
 if ( q(-2,"gl_in gl_ed gl_nemn gl_vzmn gl_pnmn gl_pemn") &&
      (w(-1,cst)||q(-1,"suw_edtv prl_edzero prq_edzero mest_edzero")) && s(-2,-1) )
 { rett=stopp=1; d[484]++; if(dbg){print "D484"}; continue };
 if ( (w(-1,cst)||q(-1,"suw_edtv prl_edzero mest_edzero")) && s(-1) && W(-1,"её") )
 { rett=stopp=1; d[485]++; if(dbg){print "D485"}; continue };

break};}; return rett }

function sw_es_i_f(rett, stopp) { while (stopp == 0) {
 if ( sw_im_f() )
 { rett=stopp=1; d[486]++; if(dbg){print "D486", "sw_im_f"}; continue };

 if ( q(1,"prl_kred_sr prq_kred_sr") && s(0) && p(1) &&
      !(qw_(-1,"suw_edsrim")||p(-1)) )
 { rett=stopp=1; d[487]++; if(dbg){print "D487"}; continue };

 if ( q(-3,"mest_it") &&
       w(-2,"всего") &&
        w(-1,"лишь только") && s(-3,-1) )
 { rett=stopp=1; d[488]++; if(dbg){print "D488"}; continue };
 if ( q(-2,"mest_it") &&
       w(-1,"же ж лишь только") && s(-2,-1) )
 { rett=stopp=1; d[489]++; if(dbg){print "D489"}; continue };
 if ( q(-2,"mest_it") &&
       w(-1,"не") && s(-2,-1) )
 { rett=stopp=1; d[490]++; if(dbg){print "D490"}; continue };
 if ( q(-1,"mest_it") && s(-1) )
 { rett=stopp=1; d[491]++; if(dbg){print "D491"}; continue };
 if ( q(-3,"gl_edsr") &&
       q(-2,"qast") &&
        q(-1,"qast") && s(-3,-1) )
 { rett=stopp=1; d[492]++; if(dbg){print "D492"}; continue };
 if ( q(-2,"gl_edsr") &&
       q(-1,"qast") && s(-2,-1) )
 { rett=stopp=1; d[493]++; if(dbg){print "D493"}; continue };
 if ( q(-1,"gl_edsr") && s(-1) )
 { rett=stopp=1; d[494]++; if(dbg){print "D494"}; continue };
 if ( q(1,"gl_edsr") && s(0) && Qw_(-1,"pre_any") )
 { rett=stopp=1; d[495]++; if(dbg){print "D495"}; continue };

 if ( w(-2,"и не") &&
       q(-1,"mest_im") && s(-2,-1) )
 { rett=stopp=1; d[496]++; if(dbg){print "D496"}; continue };

 #_#_#
 if ( q(-2,"pre_im") &&
       q(-1,"prl_edsrim prq_edsrim mest_edim muk_edsrim") && s(-2,-1) )
 { rett=stopp=1; d[497]++; if(dbg){print "D497"}; continue };

 if (prex == 1) { pre_string = "prex_im" } else { pre_string ="pre_im" };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[498]++; if(dbg){print "D498"}; continue };
 if ( q(-2,pre_string) &&
       q(-1,"prl_edim prl_mnim") && s(-2,-1) )
 { rett=stopp=1; d[499]++; if(dbg){print "D499"}; continue };
 if ( q(-2,pre_string) && sc(-1,"-") && s(-1) )
 { rett=stopp=1; d[500]++; if(dbg){print "D500"}; continue };
 #_#_#

 if ( q(-1,"prl_edsrim prq_edsrim mest_edim muk_edsrim") && s(-1) )
 { rett=stopp=1; d[501]++; if(dbg){print "D501"}; continue };
break}; return rett }

function sw_es_v_f(rett, stopp) { while (stopp == 0) {
 if ( sw_vi_f() )
 { rett=stopp=1; d[502]++; if(dbg){print "D502", "sw_vi_f"}; continue };

 #_#_#
 if ( q(-3,"pre_vi preph_vi") &&
       q(-2,"prl_edsrvi prq_edsrvi mest_edmuvi") &&
        q(-1,"prl_edsrvi prq_edsrvi mest_edmuvi") && s(-3,-1) )
 { rett=stopp=1; d[503]++; if(dbg){print "D503"}; continue };
 if ( q(-2,"pre_vi preph_vi") &&
       q(-1,"prl_edsrvi prq_edsrvi") && s(-2,-1) )
 { rett=stopp=1; d[504]++; if(dbg){print "D504"}; continue };

 if (prex == 1) { pre_string = "prex_vi preph_vi" } else { pre_string = "pre_vi preph_vi" };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[505]++; if(dbg){print "D505"}; continue };
 #_#_#

 if ( q(-1,"preph_vi prl_edsrvi prq_edsrvi") && s(-1) )
 { rett=stopp=1; d[506]++; if(dbg){print "D506"}; continue };
break}; return rett }

function sw_es_r_f(rett, stopp) { while (stopp == 0) {
 #
 if ((q(-4,"qi_duom")||wc(-4,"[234][^0-9]*$")) &&
       q(-3,"prl_mnro prq_mnro mest_mnro") &&
        pre_vi(-2) &&
         q(-1,"suw_edvi suw_mnvi") && s(-4,-1) )
 { rett=stopp=1; d[507]++; if(dbg){print "D507"}; continue };
 if ( (w(-2,"нет")||q(-2,"pre_ro qi_duom")||wc(-2,"[234][^0-9]*$")) &&
        q(-1,"prl_mnro prq_mnro mest_mnro") && s(-2,-1) && W(-1,"него неё них") )
 { rett=stopp=1; d[508]++; if(dbg){print "D508"}; continue };
 if ( (w(-1,"нет")||qi_duom(-1)||wc(-1,"[234][^0-9]*$")) && s(-1) )
 { rett=stopp=1; d[509]++; if(dbg){print "D509"}; continue };
 if ( w(-3,"не") &&
       q(-2,"gl_ed gl_in gl_poed") &&
        q(-1,"prl_edsrro prl_edsrro mest_ro") && s(-3,-1) )
 { rett=stopp=1; d[510]++; if(dbg){print "D510"}; continue };
 if ( w(-3,"какого") &&
       qast(-2) &&
        q(-1,"mest_im suw_edim suw_mnim") && s(-3,-1) )
 { rett=stopp=1; d[511]++; if(dbg){print "D511"}; continue };
 if ( w(-2,"какого") &&
       q(-1,"mest_im suw_edim suw_mnim") && s(-2,-1) )
 { rett=stopp=1; d[512]++; if(dbg){print "D512"}; continue };
 if ( q(1,"prl_edsrro prl_mnro") && s(0) && p(-1) && p(1) && Q(1,"suw_edro suw_mnro") )
 { rett=stopp=1; d[513]++; if(dbg){print "D513"}; continue };
 if ( q(-2,"prl_edsrro prl_mnro") &&
       q(-1,"mest_da suw_edda suw_mnda") && s(-2,-1) )
 { rett=stopp=1; d[514]++; if(dbg){print "D514"}; continue };

 if ( q(-3,"prq_edsrro") &&
       pre_vi(-2) &&
        q(-1,"suw_edvi suw_mnvi") && s(-3,-1) )
 { rett=stopp=1; d[515]++; if(dbg){print "D515"}; continue };

 if ( sw_edro_f() )
 { rett=stopp=1; d[516]++; if(dbg){print "D516", "sw_edro_f"}; continue };
 if ( sw_ro_f() )
 { rett=stopp=1; d[517]++; if(dbg){print "D517", "sw_ro_f"}; continue };
 if ( edro2mnvi )
 { rett=0; stopp=1; d[518]++; if(dbg){print "D518"}; continue };

 #_#_#
 if ( q(-3,"pre_ro preph_ro") &&
      (q(-2,"prl_edsrro prq_edsrro mest_edsrro")||wc(-2,"[ео]го$ [ео]ва$")) &&
       (q(-1,"prl_edsrro prq_edsrro mest_edsrro")||wc(-1,"[ео]го$ [ео]ва$")) && s(-3,-1) )
 { rett=stopp=1; d[519]++; if(dbg){print "D519"}; continue };
 if ( q(-2,"pre_ro preph_ro") &&
      (q(-1,"prl_edsrro prq_edsrro mest_edsrro")||wc(-1,"[ео]го$ [ео]ва$")) && W(-1,"него неё них") && s(-2,-1) )
 { rett=stopp=1; d[520]++; if(dbg){print "D520"}; continue };
 if ( q(-4,"pre_ro preph_ro") &&
      (q(-3,"prl_edsrro prq_edsrro mest_edsrro")||wc(-3,"[ео]го$ [ео]ва$")) &&
       (q(-2,"prl_edsrro prq_edsrro mest_edsrro")||wc(-2,"[ео]го$ [ео]ва$")) && s(-4,-2) && sc(-1,"-") )
 { rett=stopp=1; d[521]++; if(dbg){print "D521"}; continue };
 if ( q(-3,"pre_ro preph_ro") &&
      (q(-2,"prl_edsrro prq_edsrro mest_edsrro")||wc(-2,"[ео]го$ [ео]ва$")) && W(-2,"него неё них") && s(-3,-2) && sc(-1,"-") )
 { rett=stopp=1; d[522]++; if(dbg){print "D522"}; continue };

 if (prex == 1) { pre_string = "prex_ro preph_ro" } else { pre_string = "pre_ro preph_ro" };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[523]++; if(dbg){print "D523"}; continue };
 if ( q(-2,pre_string) && s(-2) && sc(-1,"-") )
 { rett=stopp=1; d[524]++; if(dbg){print "D524"}; continue };
 #_#_#

 if ( q(-2,"preph_ro prl_edsrro prq_edsrro mest_edsrro muk_edsrro") &&
       w(-1,"его её их же") && s(-2,-1) )
 { rett=stopp=1; d[525]++; if(dbg){print "D525"}; continue };
 if ( (q(-1,"prl_edsrro prq_edsrro mest_edsrro")||wc(-1,"[ео]го$ [ео]ва$")||wc(-1,"^[0-9]+$")) && W(-1,"его него чем") && s(-1) )
 { rett=stopp=1; d[526]++; if(dbg){print "D526"}; continue };

break}; return rett }

function sw_es_d_f(rett, stopp) { while (stopp == 0) {
 if ( sw_da_f() )
 { rett=stopp=1; d[527]++; if(dbg){print "D527", "sw_da_f"}; continue };
 #
 if ( q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && regn(-1,"Ud") && s(-1) )
 { rett=stopp=1; d[528]++; if(dbg){print "D528"}; continue };
 if ( q(-1,"gl_pein gl_peed gl_pemn deep_pe") && regn(-1,"Ud") && s(-1) )
 { rett=stopp=1; d[529]++; if(dbg){print "D529"}; continue };
 #_#_#
 if ( q(-3,"pre_da preph_da") &&
       q(-2,"prl_edsrda prq_edsrda mest_edmuda") &&
        q(-1,"prl_edsrda prq_edsrda mest_edmuda") && s(-3,-1) )
 { rett=stopp=1; d[530]++; if(dbg){print "D530"}; continue };
 if ( q(-2,"pre_da preph_da") &&
       q(-1,"prl_edsrda prq_edsrda") && s(-2,-1) )
 { rett=stopp=1; d[531]++; if(dbg){print "D531"}; continue };

 if (prex == 1) { pre_string = "prex_da preph_da" } else { pre_string = "pre_da preph_da" };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[532]++; if(dbg){print "D532"}; continue };
 #_#_#

 if ( q(-1,"preph_da prl_edsrda prq_edsrda") && s(-1) )
 { rett=stopp=1; d[533]++; if(dbg){print "D533"}; continue };
break}; return rett }

function sw_es_t_f(rett, stopp) { while (stopp == 0) {
 if ( sw_tv_f() )
 { rett=stopp=1; d[534]++; if(dbg){print "D534", "sw_tv_f"}; continue };
 #_#_#
 if ( q(-3,"pre_tv preph_tv") &&
       q(-2,"prl_edsrtv prq_edsrtv mest_edmutv") &&
        q(-1,"prl_edsrtv prq_edsrtv mest_edmutv") && s(-3,-1) )
 { rett=stopp=1; d[535]++; if(dbg){print "D535"}; continue };
 if ( q(-2,"pre_tv preph_tv") &&
       q(-1,"prl_edsrtv prq_edsrtv") && s(-2,-1) )
 { rett=stopp=1; d[536]++; if(dbg){print "D536"}; continue };

 if (prex == 1) { pre_string = "prex_tv preph_tv" } else { pre_string = "pre_tv preph_tv" };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[537]++; if(dbg){print "D537"}; continue };
 #_#_#

 if ( q(-1,"preph_tv prl_edsrtv prq_edsrtv") && s(-1) )
 { rett=stopp=1; d[538]++; if(dbg){print "D538"}; continue };
break}; return rett }

function sw_es_p_f(rett, stopp) { while (stopp == 0) {
 #
 #_#_#
  if ( q(-3,"pre_pr") &&
       q(-2,"prl_edsrpr prq_edsrpr mest_edsrpr") &&
        q(-1,"prl_edsrpr prq_edsrpr mest_edsrpr") && s(-3,-1) )
 { rett=stopp=1; d[539]++; if(dbg){print "D539"}; continue };
 if ( q(-2,"pre_pr") &&
       q(-1,"prl_edsrpr prq_edsrpr mest_edsrpr") && s(-2,-1) )
 { rett=stopp=1; d[540]++; if(dbg){print "D540"}; continue };

if (prex == 1) { pre_string = "prex_pr" } else { pre_string ="pre_pr" };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[541]++; if(dbg){print "D541"}; continue };
 #_#_#

break}; return rett }

function sw_ez_i_f(rett, stopp) { while (stopp == 0) {
 if ( sw_im_f() )
 { rett=stopp=1; d[542]++; if(dbg){print "D542", "sw_im_f"}; continue };

 if ( q(1,"prl_kred_ze prq_kred_ze") && s(0) )
 { rett=stopp=1; d[543]++; if(dbg){print "D543"}; continue };

 if ( qf(1,5,"gl_paedze") && s(0,qfn-1) )
 { rett=stopp=1; d[544]++; if(dbg){print "D544"}; continue };
 if ( w(-1,"она") && gl_paedze(0) && s(0) )
 { rett=0; stopp=1; d[545]++; if(dbg){print "D545"}; continue };
 if ( q(-2,"mest_ro suw_edro suw_mnro") &&
       q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && regn(-1,"Ur") && s(-2,-1) )
 { rett=stopp=1; d[546]++; if(dbg){print "D546"}; continue };
 if ( q(-1,"mest_ro suw_edro suw_mnro") &&
       q(1,"gl_pnin gl_pned gl_pnmn deep_pn") && regn(1,"Ur") && s(-1,0) )
 { rett=stopp=1; d[547]++; if(dbg){print "D547"}; continue };

 if ( q(-3,"mest_it") &&
       w(-2,"всего") &&
        w(-1,"лишь только") && s(-3,-1) )
 { rett=stopp=1; d[548]++; if(dbg){print "D548"}; continue };
 if ( q(-2,"mest_it") &&
       w(-1,"же ж лишь только") && s(-2,-1) )
 { rett=stopp=1; d[549]++; if(dbg){print "D549"}; continue };
 if ( q(-2,"mest_it") &&
       w(-1,"не") && s(-2,-1) )
 { rett=stopp=1; d[550]++; if(dbg){print "D550"}; continue };
 if ( q(-1,"mest_it") && s(-1) )
 { rett=stopp=1; d[551]++; if(dbg){print "D551"}; continue };

 if ( w(-2,"и не") &&
       q(-1,"mest_im") && s(-2,-1) )
 { rett=stopp=1; d[552]++; if(dbg){print "D552"}; continue };

 if ( q(-3,"souz mest_it") &&
       w(-2,"не") &&
        q(-1,"mest_im") && s(-3,-1) )
 { rett=stopp=1; d[553]++; if(dbg){print "D553"}; continue };

 #_#_#
 if ( q(-3,"pre_im") &&
       q(-2,"prl_edzeim prq_edzeim mest_edzeim") &&
        q(-1,"prl_edzeim prq_edzeim mest_edzeim") && s(-3,-1) )
 { rett=stopp=1; d[554]++; if(dbg){print "D554"}; continue };
 if ( q(-2,"pre_im") &&
       q(-1,"prl_edzeim prq_edzeim mest_edzeim") && s(-2,-1) )
 { rett=stopp=1; d[555]++; if(dbg){print "D555"}; continue };
 if (prex == 1) { pre_string = "prex_im" } else { pre_string ="pre_im" };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[556]++; if(dbg){print "D556"}; continue };
 #_#_#

 if ( q(-1,"prl_edzeim prq_edzeim mest_edzeim") && s(-1) )
 { rett=stopp=1; d[557]++; if(dbg){print "D557"}; continue };
 if ( qf(1,5,"gl_in gl_ed gl_mn deep") &&
       w(qfn-1,"не") && s(0,qfn-1) && type(qfn,"vos") )
 { rett=stopp=1; d[558]++; if(dbg){print "D558"}; continue };

break}; return rett }

function sw_ez_v_f(rett, stopp) { while (stopp == 0) {
 if ( sw_vi_f() )
 { rett=stopp=1; d[559]++; if(dbg){print "D559", "sw_vi_f"}; continue };

 #_#_#
 if ( q(-3,"pre_vi preph_vi") &&
       (q(-2,"prl_edzevi prq_edzevi mest_edzevi")||wc(-2,"ую$")) &&
        (q(-1,"prl_edzevi prq_edzevi mest_edzevi")||wc(-1,"ую$")) && s(-3,-1) )
 { rett=stopp=1; d[560]++; if(dbg){print "D560"}; continue };
 if ( q(-2,"pre_vi preph_vi") &&
      (q(-1,"prl_edzevi prq_edzevi mest_edzevi")||wc(-1,"ую$")) && s(-2,-1) )
 { rett=stopp=1; d[561]++; if(dbg){print "D561"}; continue };

 if (prex == 1) { pre_string = "prex_vi preph_vi" } else { pre_string = "pre_vi preph_vi" };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[562]++; if(dbg){print "D562"}; continue };
 #_#_#

 if ( (q(-2,"prl_edzevi prq_edzevi mest_edzevi")||wc(-1,"ую$")) &&
        q(-1,"mest_da suw_edda suw_mnda") && s(-2,-1) )
 { rett=stopp=1; d[563]++; if(dbg){print "D563"}; continue };
 if ( (q(-2,"prl_edzevi prq_edzevi mest_edzevi")||wc(-1,"ую$")) &&
        q(-1,"mest_tv suw_edtv suw_mntv") && s(-2,-1) )
 { rett=stopp=1; d[564]++; if(dbg){print "D564"}; continue };
 if ( (q(-2,"preph_vi prl_edzevi prq_edzevi mest_edzevi muk_edzevi")||wc(-1,"ую$")) &&
        qast(-1) && s(-2,-1) )
 { rett=stopp=1; d[565]++; if(dbg){print "D565"}; continue };
 if ( (q(-1,"preph_vi prl_edzevi prq_edzevi mest_edzevi muk_edzevi")||wc(-1,"ую$")) && s(-1) )
 { rett=stopp=1; d[566]++; if(dbg){print "D566"}; continue };
break}; return rett }

function sw_ez_d_f(rett, stopp) { while (stopp == 0) {
 if ( loc2ezd==1 )
 { rett=stopp=1; d[567]++; if(dbg){print "D567", "sw_da_f"}; continue };

 if ( sw_da_f() )
 { rett=stopp=1; d[568]++; if(dbg){print "D568", "sw_da_f"}; continue };
 if ( muk_edzeda(-2) &&
       w(-1,"же лишь только") && s(-2,-1) )
 { rett=stopp=1; d[569]++; if(dbg){print "D569"}; continue };
 if ( muk_edzeda(-1) && s(-1) )
 { rett=stopp=1; d[570]++; if(dbg){print "D570"}; continue };

 #_#_#
 if (prex == 1) { pre_string = "prex_da preph_da" } else { pre_string = "pre_da preph_da" };
 if ( q(-3,pre_string) &&
       q(-2,"prl_edzeda prq_edzeda mest_edzeda muk_edzeda") &&
        q(-1,"prl_edzeda prq_edzeda mest_edzeda") && s(-3,-1) )
 { rett=stopp=1; d[571]++; if(dbg){print "D571"}; continue };
 if ( q(-2,pre_string) &&
       q(-1,"prl_edzeda prq_edzeda mest_da muk_edzeda") && s(-2,-1) )
 { rett=stopp=1; d[572]++; if(dbg){print "D572"}; continue };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[573]++; if(dbg){print "D573"}; continue };
 #_#_#

 if ( q(-1,"preph_da prl_edzeda prq_edzeda mest_da muk_edzeda") && s(-1) && Q(0,"gl_in") )
 { rett=stopp=1; d[574]++; if(dbg){print "D574"}; continue };
break}; return rett }

function sw_em_l_f(rett, stopp) { while (stopp == 0) {
 if ( W(0,"берегу бреду гною хмелю") && q(0,"suw_edmuda") &&
      !( (wb(-5,-1,"в во на") && !(sq(wbn,-1,"[….:;!?]"))) || (wf(1,3,"в во на") && !(sq(0,wfn-1,"[….:;!?]")))) )
 { rett=0; stopp=1; loc2emd=1; d[575]++; if(dbg){print "D575"}; continue };
 if ( id(-1,"hw4loc") && s(-1) )
 { rett=stopp=1; d[576]++; if(dbg){print "D576"}; continue };

 #
 if ( pre_pr(-3) &&
       prq_edpr(-2) &&
        q(-1,"suw_edtv suw_mntv") && s(-3,-1) )
 { rett=stopp=1; d[577]++; if(dbg){print "D577"}; continue };
 #
 if ( w(-4,"в") && s(-3) && s(-4,-3) &&
       q(-3,"prl_edmupr prq_edmupr mest_edmupr mest_3e") &&
        q(-2,"prl_edmupr prq_edmupr mest_edmupr mest_3e") && (sc(-2,",")||s(-2)) &&
         wc(-1,"^[0-9]+$") && s(-1) )
 { rett=stopp=1; d[578]++; if(dbg){print "D578"}; continue };
 if ( w(-3,"в") && s(-3) &&
       q(-2,"prl_edmupr prq_edmupr mest_edmupr mest_3e") && (sc(-2,",")||s(-2)) &&
        wc(-1,"^[0-9]+$") && s(-1) )
 { rett=stopp=1; d[579]++; if(dbg){print "D579"}; continue };
 #
 if ( w(-3,"в во на") &&
      (q(-2,"prl_edmupr prq_edmupr mest_edmupr mest_3e")||wc(-2,"^[0-9]+$")) &&
       (q(-1,"prl_edmupr prq_edmupr mest_edmupr mest_3e")||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[580]++; if(dbg){print "D580"}; continue };
 if ( w(-2,"в во на") &&
      (q(-1,"prl_edmupr prq_edmupr mest_edmupr mest_3e")||wc(-1,"^[0-9]+$")) && s(-2,-1) )
 { rett=stopp=1; d[581]++; if(dbg){print "D581"}; continue };
 #
 if ( w(-1,"в во на") && s(-1) )
 { rett=stopp=1; d[582]++; if(dbg){print "D582"}; continue };
 if ( w(-4,"в во на") && s(-4) &&
      (q(-3,"prl_edmupr prq_edmupr mest_pr mest_vi mest_3e")||wc(-3,"^[0-9]+$")) && sc(-3,",") &&
        q(-2,"nar_step") &&
         q(-1,"prl_edmupr prq_edmupr") && s(-2,-1) )
 { rett=stopp=1; d[583]++; if(dbg){print "D583"}; continue };

 if ( wb(-7,-2,"в во на") &&
       q(-1,"prl_edmupr prq_edmupr mest_pedmupr") && s(wbn,-1) )
 { rett=stopp=1; d[584]++; if(dbg){print "D584"}; continue };
break}; return rett }

function sw_ez_l_f(rett, stopp) { while (stopp == 0) {
 if ( W(0,"кости крови мели пыли шерсти") && q(0,"suw_edzeda") &&
      !( (wb(-5,-1,"в во на") && !(sq(wbn,-1,"[….:;!?]"))) || (wf(1,3,"в во на") && !(sq(0,wfn-1,"[….:;!?]")))) )
 { rett=0; stopp=1; loc2emd=1; d[585]++; if(dbg){print "D585"}; continue };
 if ( (regn(-2,"Nme")||type(-2,"dvi del")) &&
       w(-1,"в во на") && s(-2,-1) )
 { rett=0; stopp=1; d[586]++; if(dbg){print "D586"}; continue };
 if ( type(-2,"vos") &&
       w(-1,"на") && s(-2,-1) )
 { rett=0; stopp=1; d[587]++; if(dbg){print "D587"}; continue };
 #
 if ( !(regn(-4,"Nme") && s(-4) ) &&
      pre_pr(-3) &&
       prq_edpr(-2) &&
        q(-1,"suw_edtv suw_mntv") && s(-3,-1) )
 { rett=stopp=1; d[588]++; if(dbg){print "D588"}; continue };
 #
 if ( w(-3,"в во на") &&
       q(-2,"prl_edzepr prq_edzepr mest_pr mest_vi") &&
        q(-1,"prl_edzepr prq_edzepr mest_pr mest_vi") && s(-2,-1) )
 { rett=stopp=1; d[589]++; if(dbg){print "D589"}; continue };
 if ( w(-2,"в во на") &&
       q(-1,"prl_edzepr prq_edzepr mest_pr") && s(-2,-1) )
 { rett=stopp=1; d[590]++; if(dbg){print "D590"}; continue };
 #
 if (  w(-1,"в во на") && s(-1) )
 { rett=stopp=1; d[591]++; if(dbg){print "D591"}; continue };
break}; return rett }

function sw_ez_r_f(rett, stopp) { while (stopp == 0) {
 #
 if ( (w(-2,"нет")||qi_duoz(-2)||wc(-2,"[234][^0-9]*$")) &&
        q(-1,"prl_edzero prl_edzero prq_edzero prq_edzero mest_ro muk_edzero") && W(-1,"него неё них") && s(-2,-1) )
 { rett=stopp=1; d[592]++; if(dbg){print "D592"}; continue };
 if ((qi_duoz(-2)||wc(-2,"[234][^0-9]*$")) &&
       q(-1,"prl_mnim prq_mnim mest_mnim") && s(-2,-1) && se(-2," ") )
 { rett=stopp=1; d[593]++; if(dbg){print "D593"}; continue };
 if ( q(-2,"gl_in gl_ed gl_mn gl_poed gl_pomn gl_povzmn deep") && regn(-2,"Ur") &&
       q(-1,"prl_edzero prq_edzero") && s(-2,-1) )
 { rett=stopp=1; d[594]++; if(dbg){print "D594"}; continue };
 #
 if ( (w(-2,"нет")||wc(-1,"[234][^0-9]*$")) &&
        w(-1,"даже ли ведь же ж") && s(-2,-1) )
 { rett=stopp=1; d[595]++; if(dbg){print "D595"}; continue };
 if ( (w(-1,"нет")||qi_duoz(-1)||wc(-1,"[234][^0-9]*$")) && s(-1) )
 { rett=stopp=1; d[596]++; if(dbg){print "D596"}; continue };
 if ( muk_edzero(-2) &&
       w(-1,"же лишь только") && s(-2,-1) )
 { rett=stopp=1; d[597]++; if(dbg){print "D597"}; continue };
 if ( muk_edzero(-1) && s(-1) )
 { rett=stopp=1; d[598]++; if(dbg){print "D598"}; continue };
 if ( w(-3,"какой") &&
       qast(-2) &&
        q(-1,"mest_im suw_edim suw_mnim") && s(-3,-1) )
 { rett=stopp=1; d[599]++; if(dbg){print "D599"}; continue };
 if ( w(-2,"какой") &&
       q(-1,"mest_im suw_edim suw_mnim qast") && s(-2,-1) )
 { rett=stopp=1; d[600]++; if(dbg){print "D600"}; continue };

 if ( q(1,"prl_edzero prl_mnro") && s(0) && p(-1) && p(1) && Q(1,"suw_edro suw_mnro") )
 { rett=stopp=1; d[601]++; if(dbg){print "D601"}; continue };
 if ( q(-3,"pre_ro preph_ro") && Qw_(-4,"prq_mnim") &&
       q(-2,"prl_edzero prl_mnro") &&
        q(-1,"mest_da suw_edda suw_mnda") && s(-3,-1) )
 { rett=stopp=1; d[602]++; if(dbg){print "D602"}; continue };
 if ( q(-4,"pre_ro preph_ro") && Qw_(-5,"prq_mnim") &&
       q(-3,"prl_edzero prl_mnro") &&
        q(-2,"mest_da suw_edda suw_mnda") &&
         q(-1,"suw_edda suw_mnda") && s(-4,-1) )
 { rett=stopp=1; d[603]++; if(dbg){print "D603"}; continue };

 if ( sw_edro_f() )
 { rett=stopp=1; d[604]++; if(dbg){print "D604", "sw_edro_f"}; continue };
 if ( sw_ro_f() )
 { rett=stopp=1; d[605]++; if(dbg){print "D605", "sw_ro_f"}; continue };
 if ( edro2mnvi )
 { rett=0; stopp=1; d[606]++; if(dbg){print "D606"}; continue };

 #_#_#
 if (prex == 1) { pre_string = "prex_ro preph_ro" } else { pre_string = "pre_ro preph_ro" };
 if ( q(-3,pre_string) &&
      (q(-2,"prl_edzero prq_edzero mest_edzero muk_edzero")||wc(-2,"[ео]й$ [ео]йся$")) &&
       (q(-1,"prl_edzero prq_edzero")||wc(-1,"[ео]й$ [ео]йся$")) && s(-3,-1) )
 { rett=stopp=1; d[607]++; if(dbg){print "D607"}; continue };
 if ( q(-2,pre_string) &&
      (q(-1,"prl_edzero prq_edzero mest_edzero muk_edzero mest_3e")||wc(-1,"[ео]й$ [ео]йся$")) && W(-1,"неё") && s(-2,-1) )
 { rett=stopp=1; d[608]++; if(dbg){print "D608"}; continue };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[609]++; if(dbg){print "D609"}; continue };
 if ( q(-3,pre_string) &&
       q(-2,"suw_edro suw_mnro") &&
        souz_iili(-1) && s(-3,-1) )
 { rett=stopp=1; d[610]++; if(dbg){print "D610"}; continue };
 if ( q(-2,pre_string) && sc(-1,"-") && s(-2) )
 { rett=stopp=1; d[611]++; if(dbg){print "D611"}; continue };
 #_#_#

 if ( (q(-2,"preph_ro prl_edzero prq_edzero mest_edzero muk_edzero")||wc(-2,"ской$ [ео]вой$")) &&
        w(-1,"его её их же") && s(-2,-1) )
 { rett=stopp=1; d[612]++; if(dbg){print "D612"}; continue };
 if ( (q(-1,"preph_ro prl_edzero mest_edzero muk_edzero")||wc(-1,"ской$ [ео]вой$")) && W(-1,"неё её") && s(-1) )
 { rett=stopp=1; d[613]++; if(dbg){print "D613"}; continue };
 if ( q(-1,"prq_edzero") && sv(-2,",") && s(-1) )
 { rett=stopp=1; d[614]++; if(dbg){print "D614"}; continue };

 if ( Qw_(-3,"pre_ro") &&
       (q(-2,"prl_edzero prq_edzero mest_edzero muk_edzero")||wc(-2,"[ео]й$ [ео]йся$")) &&
        (q(-1,"prl_edzero prq_edzero mest_edzero")||wc(-1,"[ео]й$ [ео]йся$")) && s(-2,-1) )
 { rett=stopp=1; d[615]++; if(dbg){print "D615"}; continue };
 if ( (p(-1)||(q(-1,"prl_edro prq_edro") && s(-1) )) && sc(0,",") &&
       q(1,"prl_edzeim prl_edzevi prq_edzeim prq_edzevi") )
 { rett=stopp=1; d[616]++; if(dbg){print "D616"}; continue };
 if ( q(-5,"pre_ro preph_ro") &&
       (q(-4,"prl_edzero prq_edzero mest_edzero muk_edzero")||wc(-4,"[ео]й$ [ео]йся$")) &&
        (q(-3,"prl_edzero prq_edzero mest_edzero")||wc(-3,"[ео]й$ [ео]йся$")) &&
	  pre_vi(-2) &&
	   q(-1,"suw_edvi suw_mnvi") && s(-5,-1) )
 { rett=stopp=1; d[617]++; if(dbg){print "D617"}; continue };

break}; return rett }

function sw_ez_t_f(rett, stopp) { while (stopp == 0) {
 if ( sw_tv_f() )
 { rett=stopp=1; d[618]++; if(dbg){print "D618", "sw_tv_f"}; continue };

 #_#_#
 if (prex == 1) { pre_string = "prex_tv preph_tv" } else { pre_string ="pre_tv preph_tv" };
 if ( q(-3,pre_string) &&
       q(-2,"prl_edzetv prq_edzetv mest_edzetv") &&
        q(-1,"prl_edzetv prq_edzetv mest_edzetv") && s(-3,-1) )
 { rett=stopp=1; d[619]++; if(dbg){print "D619"}; continue };
 if ( q(-2,pre_string) &&
       q(-1,"prl_edzetv prq_edzetv mest_tv") && s(-2,-1) )
 { rett=stopp=1; d[620]++; if(dbg){print "D620"}; continue };
 if ( q(-1,pre_string) && s(-1) && W(0,"какой") )
 { rett=stopp=1; d[621]++; if(dbg){print "D621"}; continue };
 #_#_#

 if ( q(-1,"preph_tv prl_edzetv prq_edzetv mest_tv") && s(-1) )
 { rett=stopp=1; d[622]++; if(dbg){print "D622"}; continue };
break}; return rett }

function sw_ez_p_f(rett, stopp) { while (stopp == 0) {
 if ( id(1,"uw4edpr") && s(0) )
 { rett=stopp=1; d[623]++; if(dbg){print "D623"}; continue };
 #
 if ( muk_edzepr(-2) &&
       w(-1,"же лишь только") && s(-2,-1) )
 { rett=stopp=1; d[624]++; if(dbg){print "D624"}; continue };
 if ( muk_edzepr(-1) && s(-1) )
 { rett=stopp=1; d[625]++; if(dbg){print "D625"}; continue };
 #_#_#
 if (prex == 1) { pre_string = "prex_pr" } else { pre_string = "pre_pr" };
 if ( q(-3,pre_string) &&
       q(-2,"prl_edzepr prq_edzepr mest_edzepr muk_edzepr") &&
        q(-1,"prl_edzepr prq_edzepr mest_edzepr") && s(-3,-1) )
 { rett=stopp=1; d[626]++; if(dbg){print "D626"}; continue };
 if ( (q(-2,pre_string)||w(-2,"по")) &&
        q(-1,"prl_edzepr prq_edzepr mest_pr muk_edzepr") && s(-2,-1) )
 { rett=stopp=1; d[627]++; if(dbg){print "D627"}; continue };
 if ( (q(-1,pre_string)||w(-1,"по")) && s(-1) )
 { rett=stopp=1; d[628]++; if(dbg){print "D628"}; continue };
 #_#_#

break}; return rett }

function sw_mn_i_f(rett, stopp) { while (stopp == 0) {
 if ( edro2mnim==1 )
 { edro2mnim==""; rett=stopp=1; d[629]++; if(dbg){print "D629"}; continue };

 if ( suw_mnim(1) && se(0,"-") && Q(1,"suw_edro") )
 { rett=stopp=1; d[630]++; if(dbg){print "D630"}; continue };

 if ( (q(1,"suw_edro suw_mnro name_ro_sy")||wc(1,"ов$")) && s(0) && p(-1) && p(1,",") && cap(0) && Q(0,"gl_ed gl_mn") )
 { rett=stopp=1; d[631]++; if(dbg){print "D631"}; continue };

 if ( prl_kred_sr(1) && se(0," — ") &&
       q(2,"prl_mn") && sc(1,"-") )
 { rett=stopp=1; d[632]++; if(dbg){print "D632"}; continue };
 if ( q(1,"prl_mnim prq_mnim") && se(0," — ") &&
       q(2,"suw_mnim") && s(1))
 { rett=stopp=1; d[633]++; if(dbg){print "D633"}; continue };
 if ( q(1,"qi_duom qi_duoz") && se(0," — ") &&
       q(2,"prl_mnim prq_mnim prl_mnro prq_mnro") &&
        q(3,"suw_edro suw_mnim") && s(1,2))
 { rett=stopp=1; d[634]++; if(dbg){print "D634"}; continue };
 if ( q(1,"suw_mnim prl_mnim prl_krmn") && se(0," — ") )
 { rett=stopp=1; d[635]++; if(dbg){print "D635"}; continue };
 if ( q(-2,"suw_mnim") && s(-2) &&
       q(-1,"name_ro_sy isname") && se(-1," — ") )
 { rett=stopp=1; d[636]++; if(dbg){print "D636"}; continue };
 if ( q(-2,"prl_mnim mest_mnim") && s(-2) &&
       q(-1,"suw_mnim") && se(-1," — ") && Q(-1,"suw_edro") )
 { rett=stopp=1; d[637]++; if(dbg){print "D637"}; continue };
 if ( q(-1,"suw_mnim") && se(-1," — ") && Q(-1,"suw_edro") )
 { rett=stopp=1; d[638]++; if(dbg){print "D638"}; continue };

 if ( nar_vopr(-1) && s(-1) &&
      W(-1,"что") && Q(0,"nar_mest") )
 { rett=stopp=1; d[639]++; if(dbg){print "D639"}; continue };
 if ( qxs(1,"сами","по","себе")||
      qxs(1,"сами","собой")||
      qxs(1,"друг","друга дружки") )
 { rett=stopp=1; d[640]++; if(dbg){print "D640"}; continue };
 if ( (qxs(-1,"как","и")||
       qxs(-1,"также","как","и") ) &&
      q(xsn-1,"muk_im suw_edim suw_mnim") && sc(xsn-1,",") )
 { rett=stopp=1; d[641]++; if(dbg){print "D641"}; continue };

 if ( p(-1) && pre_tv(1) &&
        q(2,"suw_edtv suw_mntv suw_edne") && s(0,1) && p(2) )
 { rett=stopp=1; d[642]++; if(dbg){print "D642"}; continue };
 if ( p(-1) && pre_vi(1) &&
        q(2,"suw_edvi suw_mnvi suw_edne") && s(0,1) && p(2) )
 { rett=stopp=1; d[643]++; if(dbg){print "D643"}; continue };
 if ( p(-1) && pre_pr(1) &&
        q(2,"suw_edpr suw_mnpr suw_edne") && s(0,1) && p(2) )
 { rett=stopp=1; d[644]++; if(dbg){print "D644"}; continue };
 if ( p(-1) && pre_ro(1) &&
       q(2,"suw_edro suw_mnro suw_edne") &&
        q(3,"prl_mnim prq_mnim") && s(0,2) )
 { rett=stopp=1; d[645]++; if(dbg){print "D645"}; continue };
 if ( w(-3,"у") &&
       q(-2,"prl_edro prl_mnro") &&
        q(-1,"suw_edro suw_mnro suw_edne") &&
         q(1,"suw_edro suw_mnro") && s(-3,0) )
 { rett=stopp=1; d[646]++; if(dbg){print "D646"}; continue };
 if ( w(-2,"у") &&
       q(-1,"suw_edro suw_mnro suw_edne") &&
        q(1,"suw_edro suw_mnro") && s(-2,0) )
 { rett=stopp=1; d[647]++; if(dbg){print "D647"}; continue };
 if ( q(-3,"prl_mnim prq_mnim") &&
      pre_vi(-2) &&
       q(-1,"suw_edvi suw_mnvi suw_edne") && s(-3,-1) )
 { rett=stopp=1; d[648]++; if(dbg){print "D648"}; continue };

 if ( q(-3,"pre_vi preph_vi") &&
       q(-2,"prl_edvi prl_mnvi") &&
        q(-1,"suw_edvi suw_mnvi") &&
         q(1,"suw_edro") &&
          q(2,"gl_mn gl_vzmn mod_mn") && s(-3,1) )
 { rett=stopp=1; d[649]++; if(dbg){print "D649"}; continue };

 if ( q(1,"pre_pr") &&
       q(2,"prl_edpr prl_mnpr mest_pr") &&
        q(3,"suw_edme suw_edpr suw_mnpr") &&
         q(4,"suw_edro suw_mnro") && sc(4,",") &&
          q(5,"prq_sdmnim prl_mnim") && s(0,3) )
 { rett=stopp=1; d[650]++; if(dbg){print "D650"}; continue };

 if ( q(1,"suw_edro suw_mnro") &&
       souz_iili(2) &&
        q(3,"suw_edro suw_mnro") &&
         q(4,"gl_mn gl_vzmn") && s(0,3) )
 { rett=stopp=1; d[651]++; if(dbg){print "D651"}; continue };
 if ( souz_iili(1) &&
       q(2,"suw_mnim") &&
        q(3,"prl_kred_sr nar_spos nar_kaq") &&
         q(4,"gl_mn gl_vzmn") && s(0,3) )
 { rett=stopp=1; d[652]++; if(dbg){print "D652"}; continue };
 if ( souz_iili(1) && p(-1) &&
       q(2,"suw_mnim") &&
        pre_pr(3) &&
         q(4,"prl_edpr prl_mnpr") &&
          q(5,"suw_edpr suw_mnpr") && s(0,4) )
 { rett=stopp=1; d[653]++; if(dbg){print "D653"}; continue };
 if ( q(-2,"suw_mnim") && p(-3) &&
       souz_iili(-1) &&
        pre_pr(1) &&
         q(2,"prl_edpr prl_mnpr") &&
          q(3,"suw_edpr suw_mnpr") && s(-2,2) )
 { rett=stopp=1; d[654]++; if(dbg){print "D654"}; continue };
 if ( q(1,"mest_ro prl_edro prl_mnro") &&
        q(2,"suw_edro suw_mnro") &&
         q(3,"gl_mn gl_vzmn") && s(0,2) )
 { rett=stopp=1; d[655]++; if(dbg){print "D655"}; continue };
 if ( q(1,"mest_ro prl_edro prl_mnro") &&
       q(2,"prl_edro prl_mnro") &&
        q(3,"suw_edro suw_mnro") &&
         q(4,"gl_mn gl_vzmn") && s(0,3) )
 { rett=stopp=1; d[656]++; if(dbg){print "D656"}; continue };
 if ( q(1,"mest_ro prl_edro prl_mnro") &&
        q(2,"suw_edro suw_mnro") &&
         q(3,"nar_nar nar_spos nar_kaq") &&
          q(4,"gl_mn gl_vzmn") && s(0,3) )
 { rett=stopp=1; d[657]++; if(dbg){print "D657"}; continue };
 if ( q(1,"suw_edro suw_mnro") &&
       q(2,"prl_kred_sr nar_spos nar_kaq") &&
        q(3,"gl_mn gl_vzmn") && s(0,2) )
 { rett=stopp=1; d[658]++; if(dbg){print "D658"}; continue };
 if ( q(1,"mest_mnim") &&
       q(2,"gl_mn gl_vzmn") && s(0,1) )
 { rett=stopp=1; d[659]++; if(dbg){print "D659"}; continue };

 if ( q(1,"suw_edro suw_mnro") &&
       sc(1,",") &&
        q(2,"otnsouz_mn prq_mnvi mest_mnvi") && s(0) )
 { rett=stopp=1; d[660]++; if(dbg){print "D660"}; continue };
 if ( q(1,"suw_edro suw_mnro") &&
       sc(1,",") &&
        q(2,"prl_kred_sr") &&
         q(3,"otnsouz_mn prq_mnvi") && s(0) && s(2) )
 { rett=stopp=1; d[661]++; if(dbg){print "D661"}; continue };
 if ( sc(0,",") &&
       q(1,"prl_kred_sr pre_ro") &&
        q(2,"otnsouz_mn prq_mnvi") && s(1) )
 { rett=stopp=1; d[662]++; if(dbg){print "D662"}; continue };
 if ( sc(0,",") &&
       q(1,"otnsouz_mn prq_mnvi") )
 { rett=stopp=1; d[663]++; if(dbg){print "D663"}; continue };
 if ( sc(0,",") && Q(-1,"suw_mnim") &&
       (w(1,"чуть едва еле только лишь слегка")||q(1,"nar_vrem")) &&
        q(2,"prl_mnim prq_mnim") && s(1))
 { rett=stopp=1; d[664]++; if(dbg){print "D664"}; continue };

 if ( (qxs(-2,"на","что фига хрена хуя")||
       qxs(-2,"для","чего")||
       w(-2,"зачем вот")) &&
         q(-1,"mest_da suw_edda suw_mnda") && s(-2,-1) )
 { rett=stopp=1; d[665]++; if(dbg){print "D665"}; continue };
 if ( w(-3,"вот") &&
       q(-2,"mest_da suw_edda suw_mnda") &&
        w(-1,"и") && s(-3,-1) )
 { rett=stopp=1; d[666]++; if(dbg){print "D666"}; continue };

 if ( pre_pr(-3) &&
       q(-2,"prl_edpr prq_edpr mest_pr") &&
        q(-1,"suw_edpr suw_mnpr suw_edme") &&
         w(1,"не") && gl_pnmn(2) && s(-3,1) )
 { rett=stopp=1; d[667]++; if(dbg){print "D667"}; continue };

 if ( q(-3,"mest_mnim") &&
      qxs(-1,"всего ведь же","лишь только просто его её их") && s(-3) )
 { rett=stopp=1; d[668]++; if(dbg){print "D668"}; continue };
 if ( q(-2,"mest_mnim") &&
       w(-1,"же ж лишь только просто его её их") && s(-2,-1) )
 { rett=stopp=1; d[669]++; if(dbg){print "D669"}; continue };
 if ( q(-1,"mest_mnim") && s(-1) )
 { rett=stopp=1; d[670]++; if(dbg){print "D670"}; continue };

 if ( q(1,"suw_edro suw_mnro prl_kred_sr nar_spos nar_step") &&
       prq_krmn(2) && s(0,1) )
 { rett=stopp=1; d[671]++; if(dbg){print "D671"}; continue };
 if ( q(1,"nar_spos nar_vrem") &&
       q(2,"prl_mnim prq_mnim") && s(0,1) && p(2) )
 { rett=stopp=1; d[672]++; if(dbg){print "D672"}; continue };
 if ( prl_mnim(1) && s(0) && p(1) )
 { rett=stopp=1; d[673]++; if(dbg){print "D673"}; continue };

 if ( q(1,"mest_ro prl_edro prl_mnro") && p(-1) &&
       q(2,"suw_edro suw_mnro") && s(0,1) && p(2) && W(0,"цвета") )
 { rett=stopp=1; d[674]++; if(dbg){print "D674"}; continue };

 if ( q(-4,"gl_pein gl_peed gl_pemn deep_pe") &&
       q(-3,"mest_vi") &&
        souz_iili(-2) &&
         q(-1,"mest_vi") && s(-4,-1) )
 { rett=stopp=1; d[675]++; if(dbg){print "D675"}; continue };
 if ( qxs(-1,"хотя","бы") &&
       q(1,"gl_popeed gl_pein") && s(0) && p(1) )
 { rett=stopp=1; d[676]++; if(dbg){print "D676"}; continue };
 if ( q(1,"gl_popeed gl_popemn gl_pein") && s(0) && p(-1) && p(1) )
 { rett=stopp=1; d[677]++; if(dbg){print "D677"}; continue };

 if ( q(-3,"gl_nemn gl_vzmn") &&
       pre_ro(-2) &&
        q(-1,"mest_ro suw_edro suw_mnro") && s(-3,-1) )
 { rett=stopp=1; d[678]++; if(dbg){print "D678"}; continue };

 if ( q(-3,"gl_nemn gl_vzmn") && Q(-3,"suw_edim") &&
       q(-2,"qast") &&
        q(-1,"qast") && s(-3,-1) )
 { rett=stopp=1; d[679]++; if(dbg){print "D679"}; continue };
 if ( q(-2,"gl_nemn gl_vzmn") && Q(-2,"suw_edim") &&
       q(-1,"mest_vi prl_mnvi prq_mnvi qast nar_vrem") && s(-2,-1) )
 { rett=stopp=1; d[680]++; if(dbg){print "D680"}; continue };
 if ( q(-3,"gl_nemn gl_vzmn") && Q(-3,"suw_edim") &&
       q(-2,"suw_edvi suw_mnvi") &&
        souz_iili(-1) && s(-3,-1) )
 { rett=stopp=1; d[681]++; if(dbg){print "D681"}; continue };
 if ( q(-1,"gl_nemn gl_vzmn") && Q(-1,"suw_edim") && s(-1) )
 { rett=stopp=1; d[682]++; if(dbg){print "D682"}; continue };
 if ( q(-2,"gl_nemn gl_vzmn") && Q(-2,"suw_edim") && s(-2) && sc(-1,"-") )
 { rett=stopp=1; d[683]++; if(dbg){print "D683"}; continue };

 if ( (w(-1,"мы вы они")||suw_mnim(-1)) &&
        q(1,"suw_edro suw_mnro") && sc(-1,"—") )
 { rett=stopp=1; d[684]++; if(dbg){print "D684"}; continue };
#if ( (w(-1,"мы вы они")||suw_mnim(-1)) &&
#       q(1,"suw_edro suw_mnro suw_mnim suw_edim") && Q(1,"gl_mn") && s(-1,0) )
#{ rett=stopp=1; d[685]++; if(dbg){print "D685"}; continue };
 if ( w(1,"есть") && s(0) && p(1) )
 { rett=stopp=1; d[686]++; if(dbg){print "D686"}; continue };
 if ( q(1,"nar_napr") && s(0) && p(1) )
 { rett=stopp=1; d[687]++; if(dbg){print "D687"}; continue };
 if ( q(1,"nar_spos") &&
       q(2,"prq_krmn") && s(0,1) && p(-1) )
 { rett=stopp=1; d[688]++; if(dbg){print "D688"}; continue };
 if ( q(-4,"prq_krmn") &&
       w(-3,"ли") &&
        pre_ro(-2) &&
         q(-1,"mest_ro suw_edro suw_mnro") && s(-4,-1) && p(0) )
 { rett=stopp=1; d[689]++; if(dbg){print "D689"}; continue };
 if ( q(-2,"prq_krmn") &&
       w(-1,"ли") && s(-1) && p(0) )
 { rett=stopp=1; d[690]++; if(dbg){print "D690"}; continue };
 if ( q(-1,"prq_krmn") && s(-1) && p(0) )
 { rett=stopp=1; d[691]++; if(dbg){print "D691"}; continue };
 if ( q(1,"prq_krmn") && s(0) && p(-1) )
 { rett=stopp=1; d[692]++; if(dbg){print "D692"}; continue };
 if ( w(1,"не") &&
       q(2,"nar_spos nar_mest") &&
        gl_mn(3) && s(0,2) )
 { rett=stopp=1; d[693]++; if(dbg){print "D693"}; continue };

 if ( mest_it(-3) &&
       q(-2,"gl_mn gl_vzmn") &&
        w(-1,"не") && s(-3,-1) && p(0) )
 { rett=stopp=1; d[694]++; if(dbg){print "D694"}; continue };
 if ( mest_it(-2) &&
       w(-1,"не") && s(-2,-1) && p(0) )
 { rett=stopp=1; d[695]++; if(dbg){print "D695"}; continue };
 if ( p(-3) && q(-2,"gl_mn gl_vzmn") &&
       w(-1,"не и") && s(-2,-1) && p(0) )
 { rett=stopp=1; d[696]++; if(dbg){print "D696"}; continue };

 #
  if ( q(-3,"pre_ro preph_ro") &&
        q(-2,"mest_ro prl_edro prl_mnro") &&
         q(-1,"suw_edro suw_mnro") &&
          q(1,"suw_edro suw_mnro name_ro_sy isname") &&
           q(2,"gl_mn gl_vzmn") && s(-3,1) )
 { rett=stopp=1; d[697]++; if(dbg){print "D697"}; continue };


 #
 if ( q(1,"suw_edro suw_mnro") && p(-1) &&
       q(2,"gl_mn gl_vzmn prq_krmn") && s(0,1) )
 { rett=stopp=1; d[698]++; if(dbg){print "D698"}; continue };

 if ( souz_iili(1) &&
       q(2,"suw_edim suw_mnim") &&
        q(3,"gl_mn gl_vzmn prq_krmn") && s(0,2) )
 { rett=stopp=1; d[699]++; if(dbg){print "D699"}; continue };

 if ( q(-5,"pre_tv preph_tv") &&
       q(-4,"suw_edtv suw_mntv") &&
        q(-3,"suw_edro suw_mnro") &&
         souz_iili(-2) &&
          q(-1,"suw_edro suw_mnro") &&
           q(1,"gl_mn gl_vzmn") && s(-5,0) )
 { rett=stopp=1; d[700]++; if(dbg){print "D700"}; continue };

 if ( q(1,"prl_mnim") &&
       souz_iili(2) &&
        q(3,"prl_mnim") && s(0,2) )
 { rett=stopp=1; d[701]++; if(dbg){print "D701"}; continue };
 if ( q(1,"prl_mntv") &&
       souz_iili(2) &&
        q(3,"prl_mntv") && s(0,2) )
 { rett=stopp=1; d[702]++; if(dbg){print "D702"}; continue };

 # мн.ч.им.п. в перечислениях
 if ( souz_iili(1) &&
       q(2,"mest_im prl_edim prl_mnim") &&
        q(3,"prl_edim prl_mnim") &&
         q(4,"suw_edim suw_mnim") && s(0,3) )
 { rett=stopp=1; d[703]++; if(dbg){print "D703"}; continue };
 if ( souz_iili(1) &&
       q(2,"mest_im prl_edim prl_mnim") &&
        q(3,"suw_edim suw_mnim") && s(0,2) )
 { rett=stopp=1; d[704]++; if(dbg){print "D704"}; continue };
 if ( Q(0,"suw_edne") && souz_iili(1) &&
       q(2,"suw_edim suw_mnim") && Q(2,"suw_edro") && s(0,1) )
 { rett=stopp=1; d[705]++; if(dbg){print "D705"}; continue };
 if ( souz_iili(1) && sc(0,",") &&
       q(2,"suw_edim suw_mnim") && Q(2,"suw_edro") && s(1) )
 { rett=stopp=1; d[706]++; if(dbg){print "D706"}; continue };
 if ( q(1,"suw_edim suw_mnim") && sc(0,",") &&
       souz_iili(2) &&
        q(3,"suw_edim suw_mnim") && (Q(1,"suw_edro")||Q(3,"suw_edro")) && s(1,2) )
 { rett=stopp=1; d[707]++; if(dbg){print "D707"}; continue };
 if ( Q(0,"suw_edne") && q(-1,"suw_edim suw_mnim") && sc(-1,",") &&
       souz_iili(1) &&
        q(2,"suw_edim suw_mnim") && (Q(-1,"suw_edro")||Q(2,"suw_edro")) && s(0,1) )
 { rett=stopp=1; d[708]++; if(dbg){print "D708"}; continue };
 if ( q(1,"suw_edro suw_mnro") && sc(1,",") && s(0) &&
       q(2,"mest_im mest_3e prl_edim prl_mnim") &&
        q(3,"suw_edim suw_mnim") && Q(3,"suw_edro") && s(2) )
 { rett=stopp=1; d[709]++; if(dbg){print "D709"}; continue };
 if ( q(-4,"mest_mnim prl_mnim") && s(-4) &&
       q(-3,"suw_edim suw_mnim") && sc(-3,",") &&
        q(-2,"suw_edim suw_mnim") &&
         souz_iili(-1) && s(-2,-1) )
 { rett=stopp=1; d[710]++; if(dbg){print "D710"}; continue };
 if ( q(-3,"mest_mnim prl_mnim") && s(-3) &&
       q(-2,"suw_edim suw_mnim") && sc(-2,",") &&
        q(-1,"suw_edim suw_mnim") && p(0) )
 { rett=stopp=1; d[711]++; if(dbg){print "D711"}; continue };
 if ( q(-2,"mest_mnim prl_mnim") && s(-2) &&
       q(-1,"suw_edim suw_mnim") && sc(-1,",") && p(0) )
 { rett=stopp=1; d[712]++; if(dbg){print "D712"}; continue };
 if ( q(-3,"suw_edim suw_mnim") && sc(-3,",") &&
       q(-2,"suw_edim suw_mnim") &&
        souz_iili(-1) && s(-2,-1) && (Q(-3,"suw_edro")||Q(-2,"suw_edro")) )
 { rett=stopp=1; d[713]++; if(dbg){print "D713"}; continue };
 if ( q(-2,"suw_edim suw_mnim") && Q(-2,"suw_edro") &&
       souz_iili(-1) && s(-2,-1) && Q_w(1,"suw_edim") )
 { rett=stopp=1; d[714]++; if(dbg){print "D714"}; continue };
 if ( qxs(-1,"и или да","опять снова даже") && s(xsn-1) &&
       suw_mnim(xsn-1) && Q(xsn-1,"suw_edro") )
 { rett=stopp=1; d[715]++; if(dbg){print "D715"}; continue };
 if ( qxs(-1,"и или да","опять снова даже") && s(xsn-1) &&
       suw_mnim(xsn-1) &&
        suw_mnim(xsn-2) && sc(xsn-2,",") && (Q(xsn-1,"suw_edro")||Q(xsn-2,"suw_edro")) )
 { rett=stopp=1; d[716]++; if(dbg){print "D716"}; continue };
 if ( souz_iili(1) && sc(-1,",") &&
       w(2,"тому") &&
        w(3,"подобная подобное подобный подобные") && s(0,2) )
 { rett=stopp=1; d[717]++; if(dbg){print "D717"}; continue };
 if ( q(1,"mest_mnro prl_mnro") && p(-1) &&
       q(2,"suw_edro suw_mnro") &&
        souz_iili(3) &&
         q(4,"suw_mnro") && s(0,3) )
 { rett=stopp=1; d[718]++; if(dbg){print "D718"}; continue };
 if ( q(-5,"pre_vi preph_vi") &&
       q(-4,"mest_vi prl_edvi prl_mnvi") &&
        q(-3,"prl_edvi prl_mnvi isname") &&
         souz_iili(-2) &&
          q(-1,"prl_mnvi isname") && s(-5,-1) )
 { rett=stopp=1; d[719]++; if(dbg){print "D719"}; continue };
 if ( q(1,"suw_edro suw_mnro") && s(0) &&
       qxs(2,"и или да","опять снова даже") &&
        q(xsn+1,"suw_edim suw_mnim") && s(xsn) && Q(xsn+1,"suw_edro") )
 { rett=stopp=1; d[720]++; if(dbg){print "D720"}; continue };
 if ( qxs(-1,"равно","как","и") &&
       q(xsn-3,"suw_edim suw_mnim") &&
        q(xsn-2,"prl_kred_sr nar_spos") &&
         q(xsn-1,"gl_mn gl_vzmn") && sc(xsn-1,",") && s(xsn-3,xsn-2) )
 { rett=stopp=1; d[721]++; if(dbg){print "D721"}; continue };
 if ( qF(1,5,"suw_edim suw_mnim","suw_edro suw_mnro") && sq(-1,qfn-1,",") )
 { rett=stopp=1; d[722]++; if(dbg){print "D722"}; continue };
 if ( qB(-5,-1,"suw_edim suw_mnim","suw_edro suw_mnro") && sq(qbn,0,",") )
 { rett=stopp=1; d[723]++; if(dbg){print "D723"}; continue };

 if ( ist_suw_mnim(-2) && Q(0,"gl_paedze") && Qist(-2,"ist_suw_edsrro") &&
       souz_iili(-1) && s(-2,-1) )
 { rett=stopp=1; d[724]++; if(dbg){print "D724"}; continue };
 if ( q(-4,"gl_pnmn gl_pemn") &&
       q(-3,"qast") &&
        pre_tv(-2) &&
         q(-1,"mest_tv suw_edvi suw_mnvi") && s(-4,-1) )
 { rett=stopp=1; d[725]++; if(dbg){print "D725"}; continue };
 if ( q(1,"qast") &&
       q(2,"gl_pnmn gl_pemn") &&
        q(3,"mest_vi prl_edvi prl_mnvi") &&
         q(4,"suw_edvi suw_mnvi") && s(0,3) )
 { rett=stopp=1; d[726]++; if(dbg){print "D726"}; continue };
 if ( q(1,"qast") &&
       q(2,"gl_pnmn gl_pemn") &&
        q(3,"suw_edvi suw_mnvi") && s(0,2) )
 { rett=stopp=1; d[727]++; if(dbg){print "D727"}; continue };

 # поисковые
 if ( qsf(0,4,vvpat) &&
       vv(qsn,qsn+7) &&
        seek(vvn+1,vvn+6,"gl_vzmn gl_nemn mod_mn","mest_mnim suw_mnim") && s(vvn+1,skn-1) && Qw_(-1,"suw_mnim") )
 { rett=stopp=1; d[728]++; if(dbg){print "D728"}; continue };
 if ( qsf(0,4,vvpat) &&
       vv(qsn,qsn+7) &&
        q(vvn+1,"gl_vzmn gl_nemn mod_mn") && Qw_(-1,"suw_mnim") )
 { rett=stopp=1; d[729]++; if(dbg){print "D729"}; continue };
 if ( vvb(-7,-1) &&
       q(vvn,"prl_mnim prq_mnim") )
 { rett=stopp=1; d[730]++; if(dbg){print "D730"}; continue };

 if ( Qw_(-1,"suw_mnim") &&
      seek(1,5,"mod_mn","mest_mnim suw_mnim") &&
       gl_in(skn+1) && s(0,skn) )
 { rett=stopp=1; d[731]++; if(dbg){print "D731"}; continue };
 if ( pre_ro(1) &&
	 qf(1,5,"gl_vzmn gl_nemn mod_mn") && s(0,qfn-1) && Qw_(-1,"suw_mnim") )
 { rett=stopp=1; d[732]++; if(dbg){print "D732"}; continue };
 if ( seek(1,7,"gl_vzmn gl_nemn mod_mn","suw_mnim mest_mnim") && s(0,skn-1) && Qw_(-1,"suw_mnim") )
 { rett=stopp=1; d[733]++; if(dbg){print "D733"}; continue };
 if ( !(qb(-5,-1,"suw_mnim") && s(qbn,-1)) &&
      qf(1,7,"gl_pemn") && s(0,qfn-1) )
 { rett=stopp=1; d[734]++; if(dbg){print "D734"}; continue };

 if ( qf(1,7,"gl_pnmn gl_pemn") && W(qfn-1,"не") && s(0,qfn) && Qw_(-1,"suw_mnim") &&
        q(qfn+1,"suw_edro suw_mnro") )
 { rett=stopp=1; d[735]++; if(dbg){print "D735"}; continue };
 #
 if ( seek(1,7,"gl_pnmn gl_pemn","mest_mnim suw_mnim") && W(skn-1,"не") && s(0,skn-1) && Qw_(-1,"suw_mnim suw_mnro") )
 { rett=stopp=1; d[736]++; if(dbg){print "D736"}; continue };
 if ( q(1,"suw_edro suw_mnro") &&
       seek(2,7,"gl_pnmn gl_pemn","mest_mnim suw_mnim") && W(skn-1,"не") && s(0,skn-1) && Qw_(-1,"suw_mnim suw_mnro") )
 { rett=stopp=1; d[737]++; if(dbg){print "D737"}; continue };
 if ( qf(1,7,"gl_pnmn gl_pemn") &&
       q(qfn-2,"prl_edro prl_mnro prq_edro prq_mnro") &&
        q(qfn-1,"suw_edro suw_mnro") && s(0,qfn-1) && Qw_(-1,"suw_mnim") )
 { rett=stopp=1; d[738]++; if(dbg){print "D738"}; continue };

 if ( seek(1,5,"prl_mnim prl_krmn","suw_mnim") && s(0,skn-1) && p(skn) )
 { rett=stopp=1; d[739]++; if(dbg){print "D739"}; continue };
 #
 if ( Qw_(-1,"suw_any") &&
      qf(1,5,"prl_krmn prq_krmn") && s(0,qfn-1) )
 { rett=stopp=1; d[740]++; if(dbg){print "D740"}; continue };


 if ( Q(0,"suw_edne gl_in") && qF(1,7,"suw_mnim","suw_edro") && sq(0,qfn-1,",") )
 { rett=stopp=1; d[741]++; if(dbg){print "D741"}; continue };
 if ( Q(0,"suw_edne") && qB(-7,-1,"suw_mnim","suw_edro") && sq(qbn,-1,",") )
 { rett=stopp=1; d[742]++; if(dbg){print "D742"}; continue };
 if ( Q(0,"suw_edne") && qB(-7,-1,"suw_edim","mest_im") && sq(qbn,-1,",") )
 { rett=stopp=1; d[743]++; if(dbg){print "D743"}; continue };
 #
#if ( qf(1,5,"gl_ed gl_mn")) && type(qfn,"vos") &&
#      w(qfn-1,"не") && s(0,qfn-1) )
#{ rett=stopp=1; d[744]++; if(dbg){print "D744"}; continue };

 if ( q(-3,"prl_edim prl_mnim prq_edim prq_mnim") &&
       souz_iili(-2) &&
        q(-1,"prl_edim prl_mnim prq_edim prq_mnim") && s(-3,-1) )
 { rett=stopp=1; d[745]++; if(dbg){print "D745"}; continue };
 if ( q(-3,"prl_mnim") &&
       w(-2,"у") &&
        q(-1,"mest_ro suw_edro suw_mnro name_ro_sy") && s(-3,-1) )
 { rett=stopp=1; d[746]++; if(dbg){print "D746"}; continue };
 if ( w(-2,"у") &&
       q(-1,"name_ro_sy") && s(-2,-1) )
 { rett=stopp=1; d[747]++; if(dbg){print "D747"}; continue };

 #
 if ( q(-2,"prq_pe prq_pn") &&
       q(-1,"suw_edda suw_mnda mest_da") && s(-2,-1) )
 { rett=stopp=1; d[748]++; if(dbg){print "D748"}; continue };
 if ( q(-2,"prq_pe prq_pn") &&
       q(-1,"prl_mnvi mest_mnvi") && s(-2,-1) )
 { rett=stopp=1; d[749]++; if(dbg){print "D749"}; continue };
 if ( q(-1,"narph_priq") &&
       q(xsn-1,"prq_pe prq_pn") && s(xsn-1,-1) )
 { rett=stopp=1; d[750]++; if(dbg){print "D750"}; continue };
 if ( q(-1,"prq_pe prq_pn") && s(-1) )
 { rett=stopp=1; d[751]++; if(dbg){print "D751"}; continue };
 if ( q(-3,"prq_pe prq_pn") &&
       q(-2,"suw_edvi suw_mnvi") &&
        souz_iili(-1) && s(-3,-1) )
 { rett=stopp=1; d[752]++; if(dbg){print "D752"}; continue };

 if ( p(-1,",") &&
      pre_ro(1) &&
       q(2,"suw_edro suw_mnro") &&
        souz_iili(3) &&
         q(4,"prl_edro prl_mnro prq_edro prq_mnro") &&
          q(5,"suw_edro suw_mnro") && p(5) )
 { rett=stopp=1; d[753]++; if(dbg){print "D753"}; continue };
 if ( p(-1,",") &&
      pre_ro(1) &&
       q(2,"suw_edro suw_mnro") &&
        souz_iili(3) &&
         q(4,"suw_edro suw_mnro") && p(4) )
 { rett=stopp=1; d[754]++; if(dbg){print "D754"}; continue };
 if ( p(-1,",") &&
      pre_ro(1) &&
       q(2,"suw_edro suw_mnro") && p(2) )
 { rett=stopp=1; d[755]++; if(dbg){print "D755"}; continue };
 if ( p(-1,",") && p(0,",") && W(0,"воды") )
 { rett=stopp=1; d[756]++; if(dbg){print "D756"}; continue };

 #_#_#
 if (prex == 1) { pre_string = "prex_im" } else { pre_string ="pre_im" };
 if ( q(-2,pre_string) &&
       q(-1,"prl_mnim prq_mnim mest_mnim muk_mnim") && s(-2,-1) )
 { rett=stopp=1; d[757]++; if(dbg){print "D757"}; continue };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[758]++; if(dbg){print "D758"}; continue };
 #_#_#

 if ( (q(-1,"prl_mnim prq_mnim muk_mnim")||(mest_mnim(-1) && Q(0,"prl_krmn"))||wc(-1,"[ео]вы$")) && s(-1) )
 { rett=stopp=1; d[759]++; if(dbg){print "D759"}; continue };
 if ( (q(-2,"prl_mnim prq_mnim muk_mnim")||(mest_mnim(-2) && Q(0,"prl_krmn"))||wc(-2,"[ео]вы$")) && s(-2) && sc(-1,"-") )
 { rett=stopp=1; d[760]++; if(dbg){print "D760"}; continue };
 if ( narph_any(-1) &&
         (q(xsn-1,"prl_mnim prq_mnim muk_mnim")||(mest_mnim(xsn-1) && Q(0,"prl_krmn"))||wc(xsn-1,"[ео]вы$")) && s(xsn-1) )
 { rett=stopp=1; d[761]++; if(dbg){print "D761"}; continue };

 if ( Qw_(-3,"mest_mnim suw_mnim") &&
       q(-2,"prl_krmn") &&
        q(-1,"mest_vi prl_mnvi") && s(-2,-1) )
 { rett=stopp=1; d[762]++; if(dbg){print "D762"}; continue };
 if ( Qw_(-2,"mest_mnim suw_mnim") &&
       q(-1,"prl_krmn") && s(-1) )
 { rett=stopp=1; d[763]++; if(dbg){print "D763"}; continue };

 if ( sw_im_f() )
 { rett=stopp=1; d[764]++; if(dbg){print "D764", "sw_im_f"}; continue };
break}; return rett }

function sw_mn_v_f(rett, stopp) { while (stopp == 0) {
 if ( edro2mnvi==1 )
 { rett=stopp=1; d[765]++; if(dbg){print "D765"}; continue };

 if ( q(-1,"gl_in gl_ed gl_mn deep gl_poed") && regn(-1,"Uv") && s(-1) )
 { rett=stopp=1; d[766]++; if(dbg){print "D766"}; continue };

 if ( q(-3,"gl_in gl_ed gl_mn deep") && type(-3,"vos") &&
       pre_tv(-2) &&
        q(-1,"suw_edtv suw_mntv mest_tv") && s(-3,-1) )
 { rett=stopp=1; d[767]++; if(dbg){print "D767"}; continue };
 if ( q(-2,"gl_in gl_ed gl_poed gl_pomn gl_mn deep") && type(-2,"vos") &&
       q(-1,"mest_vi prl_mnvi nar_mest") && s(-2,-1) )
 { rett=stopp=1; d[768]++; if(dbg){print "D768"}; continue };
 if ( q(-1,"gl_in gl_ed gl_mn deep") && type(-1,"vos") && s(-1) )
 { rett=stopp=1; d[769]++; if(dbg){print "D769"}; continue };

 if ( qxs(-1,"а","иногда","и") &&
      q(xsn-2,"mest_vi prl_mnvi") &&
        q(xsn-1,"suw_mnvi") && sc(xsn-1,",") && s(xsn-2) )
 { rett=stopp=1; d[770]++; if(dbg){print "D770"}; continue };

 if ( w(1,"и") &&
       q(2,"suw_edvi suw_mnvi") &&
        q(3,"mest_im suw_edim suw_mnim name_im_sy isname") &&
         q(4,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") &&
          q(5,"prl_edtv prl_mntv") &&
           q(6,"suw_edtv suw_mntv") && s(0,5) )
 { rett=stopp=1; d[771]++; if(dbg){print "D771"}; continue };
 if ( w(1,"и") &&
       q(2,"suw_edvi suw_mnvi") &&
        q(3,"mest_im suw_edim suw_mnim name_im_sy isname") &&
         q(4,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") &&
          q(5,"suw_edtv suw_mntv") && s(0,4) )
 { rett=stopp=1; d[772]++; if(dbg){print "D772"}; continue };

 if ( q(1,"mest_im suw_edim suw_mnim name_im_sy isname") &&
       q(2,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") &&
        q(3,"prl_edtv prl_mntv") &&
         q(4,"suw_edtv suw_mntv") && s(0,3) )
 { rett=stopp=1; d[773]++; if(dbg){print "D773"}; continue };
 if ( q(1,"mest_im suw_edim suw_mnim name_im_sy isname") &&
       q(2,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") &&
        q(3,"suw_edtv suw_mntv") && s(0,2) )
 { rett=stopp=1; d[774]++; if(dbg){print "D774"}; continue };
 if ( q(1,"suw_edro suw_mnro name_ro_sy isname") && s(0) &&
       narph_any(2) &&
        q(xsn+1,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") &&
	 pre_tv(xsn+2) &&
          q(xsn+3,"suw_edtv suw_mntv") && s(xsn,xsn+2) )
 { rett=stopp=1; d[775]++; if(dbg){print "D775"}; continue };

 if ( q(-4,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") &&
       q(-3,"prl_edvi prl_mnvi") &&
        q(-2,"suw_edvi suw_mnvi") &&
         souz_iili(-1) && s(-4,-1) )
 { rett=stopp=1; d[776]++; if(dbg){print "D776"}; continue };
 if ( q(-1,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") && s(-1) )
 { rett=stopp=1; d[777]++; if(dbg){print "D777"}; continue };
 if ( q(-2,"gl_pnin gl_pned gl_pnmn gl_popned gl_popnmn deep_pn") &&
       mest_3e(-1) && s(-2,-1))
 { rett=stopp=1; d[778]++; if(dbg){print "D778"}; continue };
 if ( q(-4,"gl_pnin gl_pned gl_pnmn gl_popned gl_popnmn deep_pn") &&
       q(-3,"suw_mnvi mest_3e") &&
        souz_iili(-2) &&
         q(-1,"mest_mnvi mest_3e prl_mnvi") && s(-4,-1) )
 { rett=stopp=1; d[779]++; if(dbg){print "D779"}; continue };
 if ( q(-3,"gl_pnin gl_pned gl_pnmn gl_popned gl_popnmn deep_pn") &&
       suw_mnvi(-2) &&
        souz_iili(-1) && s(-3,-1) )
 { rett=stopp=1; d[780]++; if(dbg){print "D780"}; continue };
 if ( narph_any(-3) &&
       q(xsn-1,"gl_pnin gl_pned gl_pnmn gl_popned gl_popnmn deep_pn") &&
        suw_mnvi(-2) &&
         souz_iili(-1) && s(-3,-1) )
 { rett=stopp=1; d[781]++; if(dbg){print "D781"}; continue };
 if ( q(-4,"gl_pnin gl_pned gl_pnmn gl_popned gl_popnmn deep_pn") &&
       q(-3,"nar_napr") &&
        pre_ro(-2) &&
	 q(-1,"suw_edro suw_mnro") && s(-4,-1) && W(0,"сорок") )
 { rett=stopp=1; d[782]++; if(dbg){print "D782"}; continue };
 if ( q(-2,"gl_pnin gl_pned gl_pnmn gl_popned gl_popnmn deep_pn") &&
       q(-1,"nar_napr") && s(-2,-1) && W(0,"сорок"))
 { rett=stopp=1; d[783]++; if(dbg){print "D783"}; continue };
 if ( q(-1,"gl_pnin gl_pned gl_pnmn gl_popned gl_popnmn deep_pn") && s(-1) && W(0,"сорок"))
 { rett=stopp=1; d[784]++; if(dbg){print "D784"}; continue };

 if ( q(1,"gl_pemn gl_pnmn") &&
       pre_pr(2) &&
        q(3,"suw_edpr suw_mnpr") && s(0,2) )
 { rett=stopp=1; d[785]++; if(dbg){print "D785"}; continue };

 # narphy
 if ( q(-1,"narph_any") &&
       q(xsn-1,"gl_pnin gl_pned gl_pnmn gl_popned gl_popnmn deep_pn") && s(xsn-1) && W(0,"сорок") )
 { rett=stopp=1; d[786]++; if(dbg){print "D786"}; continue };
 if ( q(-1,"narph_any") &&
       q(xsn-1,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") && s(xsn-1) )
 { rett=stopp=1; d[787]++; if(dbg){print "D787"}; continue };

 if ( q(1,"mest_im suw_edim suw_mnim") &&
       q(2,"mod_ed mod_mn") &&
        gl_in(3) && s(0,2) )
 { rett=stopp=1; d[788]++; if(dbg){print "D788"}; continue };

 if ( qb(-5,-2,"mod_mn") &&
       q(qbn+1,"prl_krmn") && s(qbn-2,-1) )
 { rett=stopp=1; d[789]++; if(dbg){print "D789"}; continue };
 if ( qf(1,5,"mod_bz") &&
       gl_in(qfn+1) && s(0,qfn) )
 { rett=stopp=1; d[790]++; if(dbg){print "D790"}; continue };

 if ( q(-3,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") &&
       pre_ro(-2) &&
        q(-1,"suw_edro suw_mnro mest_ro") && s(-3,-1) )
 { rett=stopp=1; d[791]++; if(dbg){print "D791"}; continue };
 if ( q(1,"mest_vi") &&
       qast(2) &&
        q(3,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") &&
         q(4,"suw_edim suw_mnim") && s(0,3) )
 { rett=stopp=1; d[792]++; if(dbg){print "D792"}; continue };
 if ( q(1,"mest_vi qast") &&
        q(2,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") &&
         q(3,"suw_edim suw_mnim") && s(0,2) )
 { rett=stopp=1; d[793]++; if(dbg){print "D793"}; continue };
 if ( q(1,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") && Q(1,"mest_any suw_any") &&
       q(2,"suw_edim suw_mnim") && s(0,1) )
 { rett=stopp=1; d[794]++; if(dbg){print "D794"}; continue };
 if ( q(1,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") && Q(1,"mest_any suw_any") &&
       q(2,"prl_edim prl_mnim") &&
        q(3,"suw_edim suw_mnim") && s(0,2) )
 { rett=stopp=1; d[795]++; if(dbg){print "D795"}; continue };
 if ( q(1,"mest_im prl_edim prl_mnim mest_3e") &&
       q(2,"gl_pein gl_peed gl_pemn gl_popeed gl_popemn deep_pe") && Q(2,"mest_any suw_any") &&
        q(3,"prl_edim prl_mnim") &&
         q(4,"suw_edim suw_mnim") && s(0,3) )
 { rett=stopp=1; d[796]++; if(dbg){print "D796"}; continue };
 if ( q(1,"mest_ro suw_edro suw_mnro name_ro_sy isname") && s(0) &&
       q(2,"narph_any") &&
        q(xsn+1,"gl_paedsr") && s(xsn) &&
      Q(0,"gl_paedze suw_edsrim") && Q(1,"gl_vzed") )
 { rett=stopp=1; d[797]++; if(dbg){print "D797"}; continue };
 if ( q(1,"narph_any") &&
       q(xsn+1,"gl_paedsr") && s(xsn) &&
      Q(0,"gl_paedze suw_edsrim") && Q(1,"gl_vzed") )
 { rett=stopp=1; d[798]++; if(dbg){print "D798"}; continue };
 if ( q(1,"gl_paedsr") && s(0) &&
      Q(0,"gl_paedze suw_edsrim") && Q(1,"gl_vzed") )
 { rett=stopp=1; d[799]++; if(dbg){print "D799"}; continue };

 if ( q(-2,"gl_in gl_ed gl_mn gl_poed gl_pomn deep") && type(-2,"gov") &&
       q(-1,"mest_vi prl_mnvi") && s(-2,-1) )
 { rett=stopp=1; d[800]++; if(dbg){print "D800"}; continue };
 if ( q(-1,"gl_in gl_ed gl_mn gl_poed gl_pomn deep") && type(-1,"gov") && s(-1) )
 { rett=stopp=1; d[801]++; if(dbg){print "D801"}; continue };

 if ( pre_vi(-3) &&
       q(-2,"suw_edvi suw_mnvi") &&
        souz_iili(-1) && s(-3,-1) )
 { rett=stopp=1; d[802]++; if(dbg){print "D802"}; continue };

 if ( q(-3,"prl_edvi prq_edvi") &&
       souz_iili(-2) &&
        q(-1,"prl_edvi prq_edvi") && s(-3,-1) )
 { rett=stopp=1; d[803]++; if(dbg){print "D803"}; continue };

 if ( Ww_(-2,"не") &&
        prq_edmuim(-1) &&
         suw_edmuim(1) && s(-1,0) )
 { rett=stopp=1; d[804]++; if(dbg){print "D804"}; continue };

 #
 if ( Ww_(-3,"не") &&
       q(-2,"deep_pe gl_peed gl_pein gl_pemn gl_popeed gl_popemn") &&
        q(-1,"prl_mnvi prq_mnvi mest_vi") && s(-2,-1) )
 { rett=stopp=1; d[805]++; if(dbg){print "D805"}; continue };
 if ( Ww_(-2,"не") &&
       q(-1,"deep_pe gl_peed gl_pein gl_pemn gl_popeed gl_popemn") && Q(-1,"suw_edda suw_edvi") && s(-1) )
 { rett=stopp=1; d[806]++; if(dbg){print "D806"}; continue };
 if ( Ww_(-2,"не") &&
       q(-4,"deep_pe gl_peed gl_pein gl_pemn gl_popeed gl_popemn") &&
        q(-3,"prl_mnvi prq_mnvi mest_vi") &&
         suw_mnvi(-2) &&
          souz_iili(-1) && s(-4,-1) )
 { rett=stopp=1; d[807]++; if(dbg){print "D807"}; continue };
 if ( Ww_(-2,"не") &&
       q(-3,"deep_pe gl_peed gl_pein gl_pemn gl_popeed gl_popemn") && Q(-3,"suw_edda suw_edvi") &&
         suw_mnvi(-2) &&
          souz_iili(-1) && s(-3,-1) && Q(0,"gl_paedze"))
 { rett=stopp=1; d[808]++; if(dbg){print "D808"}; continue };
 if ( q(-2,"prl_mnim prq_mnim mest_mnim muk_mnim") &&
       w(-1,"то") && sc(-2,"-") && s(-1) )
 { rett=stopp=1; d[809]++; if(dbg){print "D809"}; continue };
 if ( q(1,"mest_im suw_edim suw_mnim") &&
       q(2,"gl_peed gl_pemn gl_popeed gl_popemn") && s(0,1) && p(-1) )
 { rett=stopp=1; d[810]++; if(dbg){print "D810"}; continue };

 if ( qxs(-1,"в","виду") &&
       q(xsn-2,"mest_im suw_edim suw_mnim") &&
        base(xsn-1,"иметь") && s(xsn-2) )
 { rett=stopp=1; d[811]++; if(dbg){print "D811"}; continue };

 #_#_#
 if (prex == 1) { pre_string = "prex_vi preph_vi" } else { pre_string = "pre_vi preph_vi" };
 if ( q(-2,pre_string) &&
       q(-1,"prl_mnvi prq_mnvi mest_vi") && W(-1,"него неё них") && s(-2,-1) )
 { rett=stopp=1; d[812]++; if(dbg){print "D812"}; continue };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[813]++; if(dbg){print "D813"}; continue };
 if ( q(-2,pre_string) && s(-2) && sc(-1,"-") )
 { rett=stopp=1; d[814]++; if(dbg){print "D814"}; continue };
 #_#_#

 if ( q(-2,"prl_edvi prl_mnvi prq_edvi prq_mnvi") &&
       q(-1,"mest_da suw_edda suw_mnda") && s(-2,-1) && p(0) )
 { rett=stopp=1; d[815]++; if(dbg){print "D815"}; continue };

 # мн.ч.вин.п. в перечислениях
 if ( souz_iili(1) &&
       q(2,"mest_vi prl_edvi prl_mnvi") &&
        q(3,"prl_edvi prl_mnvi") &&
         q(4,"suw_edvi suw_mnvi") && s(0,3) )
 { rett=stopp=1; d[816]++; if(dbg){print "D816"}; continue };
 if ( souz_iili(1) &&
       q(2,"mest_vi prl_edvi prl_mnvi") &&
        q(3,"suw_edvi suw_mnvi") && s(0,2) )
 { rett=stopp=1; d[817]++; if(dbg){print "D817"}; continue };
 if ( Q(0,"suw_edne") && souz_iili(1) &&
       q(2,"suw_edvi suw_mnvi") && Q(2,"suw_edro") && s(0,1) )
 { rett=stopp=1; d[818]++; if(dbg){print "D818"}; continue };
 if ( souz_iili(1) && sc(0,",") &&
       q(2,"suw_edvi suw_mnvi") && Q(2,"suw_edro") && s(1) )
 { rett=stopp=1; d[819]++; if(dbg){print "D819"}; continue };
 if ( q(1,"suw_edvi suw_mnvi") && sc(0,",") &&
       souz_iili(2) &&
        q(3,"suw_edvi suw_mnvi") && (Q(1,"suw_edro")||Q(3,"suw_edro")) && s(1,2) )
 { rett=stopp=1; d[820]++; if(dbg){print "D820"}; continue };
 if ( Q(0,"suw_edne") && q(-1,"suw_edvi suw_mnvi") && sc(-1,",") &&
       souz_iili(1) &&
        q(2,"suw_edvi suw_mnvi") && (Q(-1,"suw_edro")||Q(2,"suw_edro")) && s(0,1) )
 { rett=stopp=1; d[821]++; if(dbg){print "D821"}; continue };
 if ( q(-4,"mest_mnvi prl_mnvi") && s(-4) &&
       q(-3,"suw_edvi suw_mnvi") && sc(-3,",") &&
        q(-2,"suw_edvi suw_mnvi") &&
         souz_iili(-1) && s(-2,-1) )
 { rett=stopp=1; d[822]++; if(dbg){print "D822"}; continue };
 if ( q(-3,"suw_edvi suw_mnvi") && sc(-3,",") &&
       q(-2,"suw_edvi suw_mnvi") &&
        souz_iili(-1) && s(-2,-1) && (Q(-3,"suw_edro")||Q(-2,"suw_edro")) )
 { rett=stopp=1; d[823]++; if(dbg){print "D823"}; continue };
 if ( q(-2,"suw_edvi suw_mnvi") && Q(-2,"suw_edro") &&
       souz_iili(-1) && s(-2,-1) )
 { rett=stopp=1; d[824]++; if(dbg){print "D824"}; continue };
 if ( qxs(-1,"и или да","опять снова даже") && s(xsn-1) &&
       suw_mnvi(xsn-1) && Q(xsn-1,"suw_edro") )
 { rett=stopp=1; d[825]++; if(dbg){print "D825"}; continue };
 if ( qxs(-1,"и или да","опять снова даже") && s(xsn-1) &&
       suw_mnvi(xsn-1) &&
        suw_mnvi(xsn-2) && sc(xsn-2,",") && (Q(xsn-1,"suw_edro")||Q(xsn-2,"suw_edro")) )
 { rett=stopp=1; d[826]++; if(dbg){print "D826"}; continue };
 if ( q(1,"suw_edro suw_mnro") && s(0) &&
       qxs(2,"и или да","опять снова даже") &&
        q(xsn+1,"suw_edvi suw_mnvi") && s(xsn) && Q(xsn+1,"suw_edro") )
 { rett=stopp=1; d[827]++; if(dbg){print "D827"}; continue };
 if ( souz_iili(1) && sc(-1,",") &&
       w(2,"тому") &&
        w(3,"подобная подобное подобный подобные") && s(0,2) )
 { rett=stopp=1; d[828]++; if(dbg){print "D828"}; continue };
 if ( q(-3,"gl_nemn gl_vzmn") && Q(-3,"suw_edim") && s(-3) &&
       suw_mnvi(-2) && sc(-2,",") &&
        suw_mnvi(-1) && sc(-1,",") )
 { rett=stopp=1; d[829]++; if(dbg){print "D829"}; continue };
 if ( q(-2,"gl_nemn gl_vzmn") && Q(-2,"suw_edim") && s(-2) &&
       suw_mnvi(-1) && sc(-1,",") )
 { rett=stopp=1; d[830]++; if(dbg){print "D830"}; continue };
 if ( qF(1,5,"suw_edvi suw_mnvi","suw_edro suw_mnro") && sq(-1,qfn-1,",") )
 { rett=stopp=1; d[831]++; if(dbg){print "D831"}; continue };
 if ( qB(-5,-1,"suw_edvi suw_mnvi","suw_edro suw_mnro") && sq(qbn,0,",") )
 { rett=stopp=1; d[832]++; if(dbg){print "D832"}; continue };


 if ( q(-1,"preph_vi prl_mnvi prq_mnvi mest_pmnim") && s(-1) )
 { rett=stopp=1; d[833]++; if(dbg){print "D833"}; continue };
 if ( qb(-8,-4,"gl_pnin gl_pned gl_pnmn deep_pn") &&
       Ww_(qbn-1,"не") && !(wmark("TY","part")) && Q(qbn,"suw_edim") && suw_mnvi(0) && Q(0,"gl_in") &&
        q(qbn+1,"suw_edda suw_mnda mest_da") &&
           souz_iili(-1) && s(-2,-1) )
 { rett=stopp=1; d[834]++; if(dbg){print "D834"}; continue };

 # seek реальные фиксированные случаи
 if ( q(-3,"gl_pein gl_peed gl_pemn deep_pe") && Q(-3,"gl_nein gl_pnin gl_need gl_nemn gl_vzmn gl_pned gl_pnmn deep_pn deep_ne") &&
       pre_pr(-2) &&
        q(-1,"suw_edpr suw_mnpr mest_pr") && s(-3,-1) )
 { rett=stopp=1; d[835]++; if(dbg){print "D835"}; continue };
 if ( q(-3,"gl_pein gl_peed gl_pemn deep_pe") && Q(-3,"gl_nein gl_pnin gl_need gl_nemn gl_vzmn gl_pned gl_pnmn deep_pn deep_ne") &&
       pre_vi(-2) &&
        q(-1,"suw_edvi suw_mnvi mest_vi") && s(-3,-1) )
 { rett=stopp=1; d[836]++; if(dbg){print "D836"}; continue };
 if ( q(-4,"gl_pein gl_peed gl_pemn deep_pe") && Q(-4,"gl_nein gl_pnin gl_need gl_nemn gl_vzmn gl_pned gl_pnmn deep_pn deep_ne") &&
       pre_vi(-3) &&
        q(-2,"suw_edvi suw_mnvi") &&
         q(-1,"mest_vi") && s(-3,-1) )
 { rett=stopp=1; d[837]++; if(dbg){print "D837"}; continue };
 if ( q(-3,"gl_pein gl_peed gl_pemn deep_pe") && Q(-3,"gl_nein gl_pnin gl_need gl_nemn gl_vzmn gl_pned gl_pnmn deep_pn deep_ne") &&
       pre_tv(-2) && !(regn(-3,"Ynero")) &&
        q(-1,"suw_edtv suw_mntv mest_tv") && s(-3,-1) )
 { rett=stopp=1; d[838]++; if(dbg){print "D838"}; continue };


 # seek желательно включать только для поискановых паттернов
#if ( seek(-8,-3,"gl_pein gl_peed gl_pemn deep_pe","gl_nein gl_pnin gl_need gl_nemn gl_vzmn gl_pned gl_pnmn deep_pn deep_ne suw_edvi suw_mnvi") &&
#      pre_pr(-2) &&
#       q(-1,"suw_edpr suw_mnpr mest_pr") && s(skn,-1) )
#{ rett=stopp=1; d[839]++; if(dbg){print "D839"}; continue };
#if ( seek(-9,-4,"gl_pein gl_peed gl_pemn deep_pe","gl_nein gl_pnin gl_need gl_nemn gl_vzmn gl_pned gl_pnmn deep_pn deep_ne suw_edvi suw_mnvi") &&
#      pre_pr(-3) &&
#       q(-2,"suw_edpr suw_mnpr") &&
#        q(-1,"mest_vi") && s(skn,-1) )
#{ rett=stopp=1; d[840]++; if(dbg){print "D840"}; continue };
#if ( seek(-8,-3,"gl_pein gl_peed gl_pemn deep_pe","gl_need gl_nemn gl_vzmn gl_pned gl_pnmn deep_pn deep_ne suw_edvi suw_mnvi") &&
#      pre_vi(-2) &&
#       q(-1,"suw_edvi suw_mnvi mest_vi") && s(skn,-1) )
#{ rett=stopp=1; d[841]++; if(dbg){print "D841"}; continue };
#if ( seek(-9,-4,"gl_pein gl_peed gl_pemn deep_pe","gl_need gl_nemn gl_vzmn gl_pned gl_pnmn deep_pn deep_ne suw_edvi suw_mnvi") &&
#      pre_vi(-3) &&
#       q(-2,"suw_edvi suw_mnvi") &&
#        q(-1,"mest_vi") && s(skn,-1) )
#{ rett=stopp=1; d[842]++; if(dbg){print "D842"}; continue };
#if ( seek(-8,-3,"gl_pein gl_peed gl_pemn deep_pe","gl_need gl_nemn gl_vzmn gl_pned gl_pnmn deep_pn deep_ne suw_edvi suw_mnvi") &&
#      pre_tv(-2) && !(regn(skn,"Ynero")) &&
#       q(-1,"suw_edtv suw_mntv mest_tv") && s(skn,-1) )
#{ rett=stopp=1; d[843]++; if(dbg){print "D843"}; continue };
#if ( seek(-9,-4,"gl_pein gl_peed gl_pemn deep_pe","gl_need gl_nemn gl_vzmn gl_pned gl_pnmn deep_pn deep_ne suw_edvi suw_mnvi") &&
#      pre_tv(-3) &&
#       q(-2,"suw_edtv suw_mntv") &&
#        q(-1,"mest_tv") && s(skn,-1) )
#{ rett=stopp=1; d[844]++; if(dbg){print "D844"}; continue };
 if ( souz_iili(1) && qq(0,2) &&
      q(2,"suw_mnvi") && s(0,1) )
 { rett=stopp=1; d[845]++; if(dbg){print "D845"}; continue };
 if ( souz_iili(-1) && qq(0,-2) &&
      q(-2,"suw_mnvi") && s(-2,-1) )
 { rett=stopp=1; d[846]++; if(dbg){print "D846"}; continue };

break}; edro2mnvi=""; return rett }

function sw_mn_r_f(rett, stopp) { while (stopp == 0) {
 if ( suw_any(-1) && type(-1,"qis") && s(-1) )
 { rett=stopp=1; d[847]++; if(dbg){print "D847"}; continue };
 if ( suw_any(-2) && type(-2,"qis") &&
       q(-1,"prl_any") && se(-2,"-") && s(-1) )
 { rett=stopp=1; d[848]++; if(dbg){print "D848"}; continue };
 #
 if ( q(-1,"gl_pnin gl_pned gl_pnmn deep_pn") && regn(-1,"Nnero") && s(-1) )
 { rett=0; stopp=1; d[849]++; if(dbg){print "D849"}; continue };
 if ( q(-1,"gl_pein gl_peed gl_pemn deep_pe") && regn(-1,"Nnero") && s(-1) )
 { rett=0; stopp=1; d[850]++; if(dbg){print "D850"}; continue };
 if ( q(-1,"gl_nein gl_need gl_nemn gl_vzmn gl_vzed deep_ne") && regn(-1,"Nnero") && s(-1) )
 { rett=0; stopp=1; d[851]++; if(dbg){print "D851"}; continue };

 if ( id(-2,"hw4mnro") &&
       q(-1,"prl_mnro prq_mnro mest_ro") && s(-2,-1) )
 { rett=stopp=1; d[852]++; if(dbg){print "D852"}; continue };
 if ( id(-1,"hw4mnro") && s(-1) )
 { rett=stopp=1; d[853]++; if(dbg){print "D853"}; continue };

 if ( base(-1,"пара") && s(-1) )
 { rett=stopp=1; d[854]++; if(dbg){print "D854"}; continue };
 if ( w(-2,"сколько") &&
       q(-1,"mest_da suw_edda suw_mnda") && s(-2,-1) )
 { rett=stopp=1; d[855]++; if(dbg){print "D855"}; continue };

 if ( suw_ed(-1) &&
       q(1,"nar_kaq prl_kred_sr") &&
        q(2,"gl_ed") && s(-1,0) )
 { rett=stopp=1; d[856]++; if(dbg){print "D856"}; continue };
 if ( suw_ed(-1) &&
       q(1,"gl_ed") && s(-1,0) )
 { rett=stopp=1; d[857]++; if(dbg){print "D857"}; continue };

 if ( q(1,"prq_mnro") && sc(0,",")  )
 { rett=stopp=1; d[858]++; if(dbg){print "D858"}; continue };

 if ( w(-2,"не") &&
       q(-1,"gl_peed gl_pein gl_pemn gl_poed deep_pe") && s(-2,-1) )
 { rett=stopp=1; d[859]++; if(dbg){print "D859"}; continue };
 if ( w(-2,"не") &&
       q(-1,"gl_need gl_nein gl_nemn gl_vzmn gl_poed gl_vzed deep_ne") && s(-2,-1) )
 { rett=stopp=1; d[860]++; if(dbg){print "D860"}; continue };
 if ( w(-2,"не") &&
       q(-1,"gl_pned gl_pnin gl_pnmn gl_poed deep_pn") && s(-2,-1) )
 { rett=stopp=1; d[861]++; if(dbg){print "D861"}; continue };

 if ( q(-2,"gl_pein gl_peed gl_pemn deep_pe prq_pe") && Q(-2,"suw_edim") &&
          q(-1,"suw_edtv suw_mntv mest_tv") && s(-2,-1) )
 { rett=stopp=1; d[862]++; if(dbg){print "D862"}; continue };

 if ( qF(1,7,"suw_mnro","suw_edim") && sq(0,qfn-1,",") )
 { rett=stopp=1; d[863]++; if(dbg){print "D863"}; continue };
 if ( qB(-7,-1,"suw_mnro","suw_edim") && sq(qbn,-1,",") )
 { rett=stopp=1; d[864]++; if(dbg){print "D864"}; continue };


 #_#_#
 if (prex == 1) { pre_string = "prex_ro preph_ro" } else { pre_string ="pre_ro preph_ro" };
 if ( q(-2,pre_string) &&
      (q(-1,"prl_mnro prq_mnro mest_mnro qi_ed qi_mn")||wc(-1,"^[0-9]+$")) && s(-2,-1) )
 { rett=stopp=1; d[865]++; if(dbg){print "D865"}; continue };
 if ( Q(0,"gl_paedmu") && q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[866]++; if(dbg){print "D866"}; continue };
 if ( q(0,"gl_paedmu") && Q(-1,"nar_vrem") && q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[867]++; if(dbg){print "D867"}; continue };
 #_#_#

 if ( (q(-1,"preph_ro prl_mnro prq_mnro mest_mnro qi_ed qi_mn")||wc(-1,"^[0-9]+$")) && s(-1) )
 { rett=stopp=1; d[868]++; if(dbg){print "D868"}; continue };
 if ( (q(-3,"preph_ro prl_mnro prq_mnro mest_mnro qi_ed qi_mn")||wc(-3,"^[0-9]+$")) &&
        pre_tv(-2) && suw_edtv(-1) && s(-3,-1) )
 { rett=stopp=1; d[869]++; if(dbg){print "D869"}; continue };
 if ( (q(-2,"preph_ro prl_mnro prq_mnro mest_mnro qi_ed qi_mn")||wc(-1,"^[0-9]+$")) &&
        w(-1,"то") && sc(-2,"-") && s(-1) )
 { rett=stopp=1; d[870]++; if(dbg){print "D870"}; continue };

 #
 if ( w(1,"ещё эдак этак") &&
       pre_vi(2) &&
       (q(3,"qi_ed qi_mn")||wc(3,"^[0-9]+$")||w(3,"пару")) && s(0,2) )
 { rett=stopp=1; d[871]++; if(dbg){print "D871"}; continue };
 if ( w(1,"ещё эдак этак") &&
       (q(2,"qi_ed qi_mn")||wc(2,"^[0-9]+$")||w(2,"пару")) && s(0,1) )
 { rett=stopp=1; d[872]++; if(dbg){print "D872"}; continue };
 if ( pre_vi(1) &&
      (q(2,"qi_ed qi_mn")||wc(2,"^[0-9]+$")||w(2,"пару")) && s(0,1) )
 { rett=stopp=1; d[873]++; if(dbg){print "D873"}; continue };
 if ( (q(-1,"qi_ed qi_mn")||wc(-1,"^[0-9]+$")||w(-1,"пару")) && s(-1) )
 { rett=stopp=1; d[874]++; if(dbg){print "D874"}; continue };
 if ( Q(0,"gl_paedmu") &&
       (q(1,"qi_ed qi_mn")||wc(1,"^[0-9]+$")) && s(0) )
 { rett=stopp=1; d[875]++; if(dbg){print "D875"}; continue };
 if ( Q(0,"gl_paedmu") && vv(0,5) &&
       (q(vvn+1,"qi_ed qi_mn")||wc(vvn+1,"^[0-9]+$")) )
 { rett=stopp=1; d[876]++; if(dbg){print "D876"}; continue };
 #
 if ( sw_ro_f() )
 { rett=stopp=1; d[877]++; if(dbg){print "D877", "sw_ro_f"}; continue };
 if ( edro2mnvi )
 { rett=0; stopp=1; d[878]++; if(dbg){print "D878"}; continue };


break}; return rett }

function sw_mn_d_f(rett, stopp) { while (stopp == 0) {
 if ( sw_da_f() )
 { rett=stopp=1; d[879]++; if(dbg){print "D879", "sw_da_f"}; continue };
 #_#_#
 if (prex == 1) { pre_string = "prex_da preph_da" } else { pre_string ="pre_da preph_da" };
 if ( q(-2,pre_string) &&
       q(-1,"prl_mnda prq_mnda qin_da") && s(-2,-1) )
 { rett=stopp=1; d[880]++; if(dbg){print "D880"}; continue };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[881]++; if(dbg){print "D881"}; continue };
 #_#_#

 if ( q(-1,"preph_da prl_mnda prq_mnda qin_da") && s(-1) )
 { rett=stopp=1; d[882]++; if(dbg){print "D882"}; continue };
break}; return rett }

function sw_mn_p_f(rett, stopp) { while (stopp == 0) {
 #_#_#
 if (prex == 1) { pre_string = "prex_pr" } else { pre_string ="pre_pr" };
 if ( q(-2,pre_string) &&
       q(-1,"prl_mnpr prq_mnpr qin_pr") && s(-2,-1) )
 { rett=stopp=1; d[883]++; if(dbg){print "D883"}; continue };
 if ( q(-1,pre_string) && s(-1) )
 { rett=stopp=1; d[884]++; if(dbg){print "D884"}; continue };
 #_#_#

break}; return rett }

function nar_vrem_f(rett, stopp) { while (stopp == 0) {
 cst="гораздо значительно лить намного только чуть";
 if ( w(-1,cst) && s(-1) )
 { rett=stopp=1; d[885]++; if(dbg){print "D885"}; continue };
 if ( q(-1,"gl_ed gl_mn gl_vzmn") && s(-1) && p(0) )
 { rett=stopp=1; d[886]++; if(dbg){print "D886"}; continue };
break}; return rett }

function pl_srav_f(rett, stopp) { while (stopp == 0) {
 if ( sc(0,",") &&
       w(1,"чем") )
 { rett=stopp=1; d[887]++; if(dbg){print "D887"}; continue };
 if ( q(-1,"nar_step") && s(-1) && p(0))
 { rett=stopp=1; d[888]++; if(dbg){print "D888"}; continue };
 if ( base(-1,"быть стать становиться оказаться") && s(-1) && p(0))
 { rett=stopp=1; d[889]++; if(dbg){print "D889"}; continue };
break}; return rett }

function pl_em_p_f(rett, stopp) { while (stopp == 0) {
 if ( pre_pr(-1) &&
       q(1,"suw_edmupr suw_edmume") && s(-1,0) )
 { rett=stopp=1; d[890]++; if(dbg){print "D890"}; continue };
 if ( pre_pr(-1) && s(-1) && p(0))
 { rett=stopp=1; d[891]++; if(dbg){print "D891"}; continue };
break}; return rett }

function pl_es_p_f(rett, stopp) { while (stopp == 0) {
 if ( pre_pr(-1) &&
       suw_edpr(1) && s(-1,0) )
 { rett=stopp=1; d[892]++; if(dbg){print "D892"}; continue };
 if ( pre_pr(-1) && s(-1) && p(0))
 { rett=stopp=1; d[893]++; if(dbg){print "D893"}; continue };
break}; return rett }

function pl_em_i_f(rett, stopp) { while (stopp == 0) {
 if ( q(-1,"pre_im") &&
       suw_edmuim(1) && s(-1,0) )
 { rett=stopp=1; d[894]++; if(dbg){print "D894"}; continue };
 if ( suw_edmuim(1) && s(0) )
 { rett=stopp=1; d[895]++; if(dbg){print "D895"}; continue };
break}; return rett }

function pl_es_i_f(rett, stopp) { while (stopp == 0) {
 if ( q(-1,"pre_im") &&
       suw_edsrim(1) && s(-1,0) )
 { rett=stopp=1; d[896]++; if(dbg){print "D896"}; continue };
 if ( q(1,"prl_edsrim prq_edsrim") &&
      suw_edsrim(2) && s(0,1) )
 { rett=stopp=1; d[897]++; if(dbg){print "D897"}; continue };
 if ( suw_edsrim(1) && s(0) )
 { rett=stopp=1; d[898]++; if(dbg){print "D898"}; continue };
 if ( q(-2,"prl_edsrim") &&
       q(-1,"souz_iili") && s(-2,-1) )
 { rett=stopp=1; d[899]++; if(dbg){print "D899"}; continue };
 if ( q(1,"souz_iili") &&
       q(2,"prl_edsrim") && s(0,1) )
 { rett=stopp=1; d[900]++; if(dbg){print "D900"}; continue };
break}; return rett }

function pl_em_v_f(rett, stopp) { while (stopp == 0) {
 if ( q(-1,"pre_vi preph_vi") &&
       suw_edmuvi(1) && s(-1,0) )
 { rett=stopp=1; d[901]++; if(dbg){print "D901"}; continue };
 if ( suw_edmuvi(1) && s(0) )
 { rett=stopp=1; d[902]++; if(dbg){print "D902"}; continue };
break}; return rett }

function pl_es_v_f(rett, stopp) { while (stopp == 0) {
 if ( q(-1,"pre_vi preph_vi") &&
       suw_edsrvi(1) && s(-1,0) )
 { rett=stopp=1; d[903]++; if(dbg){print "D903"}; continue };
 if ( suw_edsrvi(1) && s(0) )
 { rett=stopp=1; d[904]++; if(dbg){print "D904"}; continue };
break}; return rett }

function pl_ez_i_f(rett, stopp) { while (stopp == 0) {
 if ( q(-1,"pre_im") &&
       suw_edim(1) && s(-1,0) )
 { rett=stopp=1; d[905]++; if(dbg){print "D905"}; continue };
 if ( suw_edim(1) && s(0) )
 { rett=stopp=1; d[906]++; if(dbg){print "D906"}; continue };
break}; return rett }

function pl_ez_v_f(rett, stopp) { while (stopp == 0) {
 if ( q(-1,"pre_vi preph_vi") &&
       suw_edvi(1) && s(-1,0) )
 { rett=stopp=1; d[907]++; if(dbg){print "D907"}; continue };
 if ( suw_edvi(1) && s(0) )
 { rett=stopp=1; d[908]++; if(dbg){print "D908"}; continue };
break}; return rett }

function pl_ez_d_f(rett, stopp) { while (stopp == 0) {
 if ( q(-1,"pre_da preph_da") &&
       suw_edda(1) && s(-1,0) )
 { rett=stopp=1; d[909]++; if(dbg){print "D909"}; continue };
break}; return rett }

function pl_ez_r_f(rett, stopp) { while (stopp == 0) {
 if ( q(-1,"pre_ro preph_ro") &&
       suw_edzero(1) && s(-1,0) )
 { rett=stopp=1; d[910]++; if(dbg){print "D910"}; continue };
 if ( q(-1,"prl_edzero prq_edzero") &&
       suw_edzero(1) && s(-1,0) )
 { rett=stopp=1; d[911]++; if(dbg){print "D911"}; continue };
break}; return rett }

function pl_ez_t_f(rett, stopp) { while (stopp == 0) {
 if ( q(-1,"pre_tv preph_tv") &&
       suw_edtv(1) && s(-1,0) )
 { rett=stopp=1; d[912]++; if(dbg){print "D912"}; continue };
break}; return rett }

function pl_ez_p_f(rett, stopp) { while (stopp == 0) {
 if ( q(-1,"pre_pr") &&
       suw_edpr(1) && s(-1,0) )
 { rett=stopp=1; d[913]++; if(dbg){print "D913"}; continue };
break}; return rett }

function pl_kr_em_f(rett, stopp) { while (stopp == 0) {
 cst="будет буду будь был весьма настолько он очень сильно слишком стал станет стань столь так ты чересчур я";
 if ( (w(-2,cst)||(suw_mnim(-2) && Q(-2,"suw_edro"))) &&
        prl_kred_sr(-1) && s(-2,-1) )
 { rett=stopp=1; d[914]++; if(dbg){print "D914"}; continue };
 if ( (w(-1,cst)||(suw_mnim(-1) && Q(-1,"suw_edro prl_mnim"))) && s(-1) )
 { rett=stopp=1; d[915]++; if(dbg){print "D915"}; continue };

 if ( (w(-2,cst)||suw_edmuim(-2)) &&
        prl_kred_sr(-1) && s(-2,-1) && (p(0)||q(1,"gl_in pre_any")) )
 { rett=stopp=1; d[916]++; if(dbg){print "D916"}; continue };
 if ( (w(-1,cst)||suw_edmuim(-1)) && s(-1) && (p(0)||q(1,"gl_in pre_any")) )
 { rett=stopp=1; d[917]++; if(dbg){print "D917"}; continue };
 if ( w(-1,cst) && s(0) )
 { rett=stopp=1; d[918]++; if(dbg){print "D918"}; continue };
 if ( w(1,"был будь стань") && s(0) )
 { rett=stopp=1; d[919]++; if(dbg){print "D919"}; continue };
 if ( w(1,"ли") &&
       suw_edmuim(2) && s(0,1) )
 { rett=stopp=1; d[920]++; if(dbg){print "D920"}; continue };
 if ( prl_kred_sr(-1) && s(-1) && Q(0,"gl_bum3") )
 { rett=stopp=1; d[921]++; if(dbg){print "D921"}; continue };
 if ( q(-1,"suw_edim suw_mnim") &&
       q(1,"suw_edtv suw_mntv suw_edro suw_mnro") && s(-1,0) )
 { rett=stopp=1; d[922]++; if(dbg){print "D922"}; continue };
break}; return rett }

function pl_kr_es_f(rett, stopp) { while (stopp == 0) {
 cst="будет буду будь было весьма настолько оно очень сильно слишком стало станет стань столь так ты чересчур я";
 if ( (w(-2,cst)||(suw_mnim(-2) && Q(-2,"suw_edro"))) &&
        prl_kred_sr(-1) && s(-2,-1) )
 { rett=stopp=1; d[923]++; if(dbg){print "D923"}; continue };
 if ( (w(-1,cst)||(suw_mnim(-1) && Q(-1,"suw_edro prl_mnim"))) && s(-1) )
 { rett=stopp=1; d[924]++; if(dbg){print "D924"}; continue };

 if ( (w(-2,cst)||suw_edmuim(-2)) &&
        prl_kred_sr(-1) && s(-2,-1) && (p(0)||q(1,"gl_in pre_any")) )
 { rett=stopp=1; d[925]++; if(dbg){print "D925"}; continue };
 if ( (w(-1,cst)||suw_edmuim(-1)) && s(-1) && (p(0)||q(1,"gl_in pre_any")) )
 { rett=stopp=1; d[926]++; if(dbg){print "D926"}; continue };
 if ( w(-1,cst) && s(0) )
 { rett=stopp=1; d[927]++; if(dbg){print "D927"}; continue };
 if ( w(1,"был будь стань") && s(0) )
 { rett=stopp=1; d[928]++; if(dbg){print "D928"}; continue };
 if ( prl_kred_sr(-1) && s(-1) && Q(0,"gl_bum3") )
 { rett=stopp=1; d[929]++; if(dbg){print "D929"}; continue };
break}; return rett }

function pl_kr_ez_f(rett, stopp) { while (stopp == 0) {
 cst="будет буду будь была весьма настолько она очень сильно слишком стала станет стань столь так ты чересчур я";
 if ( (w(-2,cst)||(suw_mnim(-2) && Q(-2,"suw_edro"))) &&
        prl_kred_sr(-1) && s(-2,-1) )
 { rett=stopp=1; d[930]++; if(dbg){print "D930"}; continue };
 if ( (w(-1,cst)||(suw_mnim(-1) && Q(-1,"suw_edro prl_mnim"))) && s(-1) )
 { rett=stopp=1; d[931]++; if(dbg){print "D931"}; continue };

 if ( (w(-2,cst)||suw_edzeim(-2)) &&
        prl_kred_sr(-1) && s(-2,-1) )
 { rett=stopp=1; d[932]++; if(dbg){print "D932"}; continue };
 if ( (w(-2,cst)||suw_edzeim(-1)) &&
        w(-1,"же не ведь всё-таки таки и") && s(-2,-1) )
 { rett=stopp=1; d[933]++; if(dbg){print "D933"}; continue };
 if ( (w(-1,cst)||suw_edzeim(-1)) && s(-1) )
 { rett=stopp=1; d[934]++; if(dbg){print "D934"}; continue };
 if ( prl_kred_sr(-1) && s(-1))
 { rett=stopp=1; d[935]++; if(dbg){print "D935"}; continue };
 if ( qast(1) &&
      suw_edzeim(2) && s(0,1))
 { rett=stopp=1; d[936]++; if(dbg){print "D936"}; continue };
 if ( suw_edzeim(1) && s(0))
 { rett=stopp=1; d[937]++; if(dbg){print "D937"}; continue };
break}; return rett }

function pl_krmn_f(rett, stopp) { while (stopp == 0) {
 cst="будем будут будьте были весьма вы мы настолько они очень сильно слишком стали станем станут станьте столь чересчур";
 if ( (w(-2,cst)||(suw_mnim(-2) && Q(-2,"suw_edro"))) &&
        prl_kred_sr(-1) && s(-2,-1) )
 { rett=stopp=1; d[938]++; if(dbg){print "D938"}; continue };
 if ( (w(-1,cst)||(suw_mnim(-1) && Q(-1,"suw_edro prl_mnim"))) && s(-1) )
 { rett=stopp=1; d[939]++; if(dbg){print "D939"}; continue };

 if ( q(-2,"mest_mnim suw_mnim") &&
       q(-1,"nar_spos nar_step prl_kred_sr") && s(-1) )
 { rett=stopp=1; d[940]++; if(dbg){print "D940"}; continue };
 if ( suw_mnim(-1) && s(-1) && p(-2) )
 { rett=stopp=1; d[941]++; if(dbg){print "D941"}; continue };
 if ( prl_kred_sr(-1) && s(-1))
 { rett=stopp=1; d[942]++; if(dbg){print "D942"}; continue };
break}; return rett }

function pq_kr_em_f(rett, stopp) { while (stopp == 0) {
 cst="буду будь был он стал стану ты я";
 if ( (w(-2,cst)||suw_edmuim(-2)) &&
        prl_kred_sr(-1) && s(-2,-1) && (p(0)||q(1,"gl_in pre_any")) )
 { rett=stopp=1; d[943]++; if(dbg){print "D943"}; continue };
 if ( (w(-1,cst)||suw_edmuim(-1)) && s(-1) && (p(0)||q(1,"gl_in pre_any")) )
 { rett=stopp=1; d[944]++; if(dbg){print "D944"}; continue };
 if ( w(-1,cst) && s(0) )
 { rett=stopp=1; d[945]++; if(dbg){print "D945"}; continue };
 if ( w(1,"был будь") && s(0) )
 { rett=stopp=1; d[946]++; if(dbg){print "D946"}; continue };
 if ( prl_kred_sr(-1) && s(-1) && Q(0,"gl_bum3") )
 { rett=stopp=1; d[947]++; if(dbg){print "D947"}; continue };
break}; return rett }

function pq_kr_ez_f(rett, stopp) { while (stopp == 0) {
 if ( (w(-2,"я ты она была стала")||suw_edzeim(-2)) &&
        prl_kred_sr(-1) && s(-2,-1) )
 { rett=stopp=1; d[948]++; if(dbg){print "D948"}; continue };
 if ( (w(-2,"я ты она была стала")||suw_edzeim(-1)) &&
        w(-1,"же не ведь всё-таки таки и") && s(-2,-1) )
 { rett=stopp=1; d[949]++; if(dbg){print "D949"}; continue };
 if ( (w(-1,"я ты она была стала")||suw_edzeim(-1)) && s(-1) )
 { rett=stopp=1; d[950]++; if(dbg){print "D950"}; continue };
 if ( prl_kred_sr(-1) && s(-1))
 { rett=stopp=1; d[951]++; if(dbg){print "D951"}; continue };
break}; return rett }

function pq_krmn_f(rett, stopp) { while (stopp == 0) {
 if ( q(-2,"mest_mnim suw_mnim") &&
       q(-1,"nar_spos nar_step prl_kred_sr") && s(-1) )
 { rett=stopp=1; d[952]++; if(dbg){print "D952"}; continue };
 if ( suw_mnim(-1) && s(-1) && p(-2) )
 { rett=stopp=1; d[953]++; if(dbg){print "D953"}; continue };
 if ( prl_kred_sr(-1) && s(-1))
 { rett=stopp=1; d[954]++; if(dbg){print "D954"}; continue };
break}; return rett }

function gl_inf_f(rett, stopp) { while (stopp == 0) {
 if ( q(-1,"mod_ed mod_mn mod_bz") && s(-1) )
 { rett=stopp=1; d[955]++; if(dbg){print "D955"}; continue };
 #
 if ( !( q(-1,"pre_da pre_im pre_vi pre_ro pre_pr") && s(-1)) &&
       q(1,"suw_edvi suw_mnvi mest_vi") && s(0) )
 { rett=stopp=1; d[956]++; if(dbg){print "D956"}; continue };
 #
 if ( !( q(-1,"pre_any") && s(-1)) &&
          q(1,"prl_edvi prl_mnvi prq_edvi prq_mnvi mest_vi pre_vi") &&
           q(2,"suw_edvi suw_mnvi mest_vi") && s(0,1) )
 { rett=stopp=1; d[957]++; if(dbg){print "D957"}; continue };
 if ( Qw_(-1,"pre_any") &&
       q(1,"nar_step") &&
        q(2,"prl_edvi prl_mnvi prq_edvi prq_mnvi mest_vi pre_vi") &&
         q(3,"suw_edvi suw_mnvi mest_vi") && s(0,2) )
 { rett=stopp=1; d[958]++; if(dbg){print "D958"}; continue };
 if ( q(-2,"suw_edim suw_mnim") &&
       q(-1,"mest_da suw_edda suw_mnda") && s(-2,-1) )
 { rett=stopp=1; d[959]++; if(dbg){print "D959"}; continue };
break}; return rett }

function gl_poed_f(rett, stopp) { while (stopp == 0) {

 if ( p(-1) && q(0,"gl_popeed gl_popned") && W(0,"реки") &&
      q(1,"mest_vi suw_edvi suw_mnvi") && s(0) )
 { rett=stopp=1; d[960]++; if(dbg){print "D960"}; continue };
 if ( p(-2) && w(-1,"не") && s(-1) && p(0) )
 { rett=stopp=1; d[961]++; if(dbg){print "D961"}; continue };
 if ( q(-3,"gl_poed") &&
       w(-2,"и") &&
        w(-1,"не") && s(-3,-1) )
 { rett=stopp=1; d[962]++; if(dbg){print "D962"}; continue };
 if ( p(-1) &&
       q(1,"suw_edim suw_mnim") && sc(1,"!") )
 { rett=stopp=1; d[963]++; if(dbg){print "D963"}; continue };
 if ( p(-1) && gl_popeed(0) && Q(0,"gl_nemn") &&
       pre_vi(1) &&
        q(2,"suw_edvi suw_mnvi") &&
         q(3,"suw_edvi suw_mnvi") && s(0,2))
 { rett=stopp=1; d[964]++; if(dbg){print "D964"}; continue };
break}; return rett }

function gl_paedmu_f(rett, stopp) { while (stopp == 0) {
 if ( (w(-2,"я ты он")||suw_edmuim(-2)) &&
        q(-1,"nar_spos prl_kred_sr") && Q(-2,"prl_edmuim") && s(-2,-1) )
 { rett=stopp=1; d[965]++; if(dbg){print "D965"}; continue };
 if ( (w(-3,"я ты он")||suw_edmuim(-2)) &&
        q(-2,"nar_spos nar_vrem prl_kred_sr") &&
         q(-1,"nar_spos nar_vrem prl_kred_sr") && Q(-2,"prl_edmuim") && s(-2,-1) )
 { rett=stopp=1; d[966]++; if(dbg){print "D966"}; continue };
 #
 if ( (w(1,"я ты он")||suw_edmuim(1)) &&
        q(2,"prl_kred_sr gl_in") && Q(2,"prl_edmuim") && s(0,1) )
 { rett=stopp=1; d[967]++; if(dbg){print "D967"}; continue };
 #
 if ( (w(1,"я ты он")||q(1,"suw_edmuim prl_kred_sr")) && Q(1,"prl_edmuim") && s(0) )
 { rett=stopp=1; d[968]++; if(dbg){print "D968"}; continue };
 #
 if ( (w(-1,"я ты он")||q(-1,"suw_edmuim prl_kred_sr gl_in")) && Q(-1,"prl_edmuim") && s(-1) )
 { rett=stopp=1; d[969]++; if(dbg){print "D969"}; continue };
break}; return rett }

function gl_paedsr_f(rett, stopp) { while (stopp == 0) {
 if ( q(-2,"mest_it suw_edsrim") &&
        q(-1,"nar_spos prl_kred_sr") && s(-2,-1) )
 { rett=stopp=1; d[970]++; if(dbg){print "D970"}; continue };
 if ( q(-1,"mest_it suw_edsrim") &&
        q(1,"nar_spos prl_kred_sr") && s(-1,0) && Q_w(2,"gl_in") )
 { rett=stopp=1; d[971]++; if(dbg){print "D971"}; continue };
 #
 if ( q(1,"mest_it suw_edsrim") &&
        q(2,"prl_kred_sr gl_in") && s(0,1) )
 { rett=stopp=1; d[972]++; if(dbg){print "D972"}; continue };
 if ( q(1,"prl_kred_sr") && p(-1) && p(1) )
 { rett=stopp=1; d[973]++; if(dbg){print "D973"}; continue };
 #
 if ( q(1,"mest_it suw_edsrim") && s(0) )
 { rett=stopp=1; d[974]++; if(dbg){print "D974"}; continue };
 #
 if ( q(-1,"suw_edsrim mest_it prl_kred_sr gl_in") && s(-1) )
 { rett=stopp=1; d[975]++; if(dbg){print "D975"}; continue };
 if ( qb(-6,-2,"gl_paedsr") &&
       souz_iili(-1) && s(-1) )
 { rett=stopp=1; d[976]++; if(dbg){print "D976"}; continue };
break}; return rett }

function gl_pamn_f(rett, stopp) { while (stopp == 0) {
 #
 if ( (suw_mnim(-2)||w(-2,"мы вы они")) &&
        prl_kred_sr(-1) && s(-2,-1) )
 { rett=stopp=1; d[977]++; if(dbg){print "D977"}; continue };
 if ( gl_nemn(0) && q(-5,"pre_vi preph_vi") &&
       q(-4,"prl_edvi prl_mnvi prq_edvi prq_mnvi") &&
        q(-3,"suw_edvi suw_mnvi") &&
         pre_tv(-2) &&
          q(-1,"suw_edtv suw_mntv") &&
           q(1,"prl_edim prl_mnim") &&
            q(2,"suw_edim suw_mnim") && s(-5,1) )
 { rett=stopp=1; d[978]++; if(dbg){print "D978"}; continue };
 #
 if ( (suw_mnim(-1)||w(-1,"мы вы они")) && s(-1) )
 { rett=stopp=1; d[979]++; if(dbg){print "D979"}; continue };
break}; return rett }

function gl_pomn_f(rett, stopp) { while (stopp == 0) {
 #
 if ( mn2e2pomn )
 { rett=stopp=1; d[980]++; if(dbg){print "D980"}; continue };
 if ( p(-1) && p(0) && W(0,"шутите гоните"))
 { rett=stopp=1; d[981]++; if(dbg){print "D981"}; continue };
 if ( w(1,"же") && s(0) && p(-1) && p(1) )
 { rett=stopp=1; d[982]++; if(dbg){print "D982"}; continue };
 if ( q(1,"mest_3e") && s(0) && p(-1) && p(1) )
 { rett=stopp=1; d[983]++; if(dbg){print "D983"}; continue };
 #
 if ( q(-4,"gl_poed gl_pomn gl_povzmn") &&
       w(-3,"что") &&
        q(-2,"gl_ed gl_nemn gl_vzmn gl_pemn gl_pnmn") &&
         w(-1,"и") && s(-4,-1) )
 { rett=stopp=1; d[984]++; if(dbg){print "D984"}; continue };
 #
 if ( w(-2,"так") &&
       w(-1,"что вот") && s(-2,-1) )
 { rett=stopp=1; d[985]++; if(dbg){print "D985"}; continue };
break}; return rett }

function gl_ed1e_f(rett, stopp) { while (stopp == 0) {
 #
 if ( w(-3,"я") &&
       qast(-2) &&
       q(-1,"prl_kred_sr nar_mest nar_spos") &&
        q(1,"suw_edvi suw_mnvi pre_any") && s(-3,0) )
 { rett=stopp=1; d[986]++; if(dbg){print "D986"}; continue };
 if ( w(-2,"я") &&
       q(-1,"prl_kred_sr nar_mest nar_spos") &&
        q(1,"suw_edvi suw_mnvi pre_any") && s(-2,0) )
 { rett=stopp=1; d[987]++; if(dbg){print "D987"}; continue };
 if ( w(-1,"я") &&
       q(1,"prl_kred_sr nar_mest nar_spos") &&
        q(2,"suw_edvi suw_mnvi pre_any") && s(-1,1) )
 { rett=stopp=1; d[988]++; if(dbg){print "D988"}; continue };
 if ( w(-1,"я") &&
       q(1,"suw_edvi suw_mnvi nar_napr nar_spos gl_in pre_any") && s(-1,0) )
 { rett=stopp=1; d[989]++; if(dbg){print "D989"}; continue };
 if ( w(-2,"я") &&
       qast(-1) && s(-2,-1) )
 { rett=stopp=1; d[990]++; if(dbg){print "D990"}; continue };
 if ( w(-1,"я") && s(-1) )
 { rett=stopp=1; d[991]++; if(dbg){print "D991"}; continue };
break}; return rett }

function gl_ed3e_f(rett, stopp) { while (stopp == 0) {
 #
 if ( (w(-2,"он она оно")||q(-2,"suw_edim mest_it")) &&
       q(-1,"prl_kred_sr nar_mest nar_spos") &&
        q(1,"suw_edvi suw_mnvi pre_any") && s(-2,0) )
 { rett=stopp=1; d[992]++; if(dbg){print "D992"}; continue };
 if ( (w(-2,"он она оно")||q(-2,"suw_edim mest_it")) &&
       q(1,"prl_kred_sr nar_mest nar_spos") &&
        q(2,"suw_edvi suw_mnvi pre_any") && s(-1,1) )
 { rett=stopp=1; d[993]++; if(dbg){print "D993"}; continue };
 if ( (w(-2,"он она оно")||q(-2,"suw_edim mest_it")) &&
       q(1,"suw_edvi suw_mnvi nar_napr nar_spos gl_in pre_any") && s(-1,0) )
 { rett=stopp=1; d[994]++; if(dbg){print "D994"}; continue };
 if ( (w(-2,"он она оно")||q(-2,"suw_edim mest_it")) && s(-1) )
 { rett=stopp=1; d[995]++; if(dbg){print "D995"}; continue };
break}; return rett }

function gl_paedze_f(rett, stopp) { while (stopp == 0) {
 #
 if ( wb(-5,-1,"я ты вы она") && s(wbn,-1) )
 { rett=stopp=1; d[996]++; if(dbg){print "D996"}; continue };
 #
 if ( qb(-5,-1,"suw_edzeim") && s(qbn,-1) )
 { rett=stopp=1; d[997]++; if(dbg){print "D997"}; continue };
 if ( suw_edzeim(-3) && s(-3) &&
       gl_ed(-2) && sc(-2,",") &&
        w(-1,"что как") && s(-1) )
 { rett=stopp=1; d[998]++; if(dbg){print "D998"}; continue };
break}; return rett }

function gl_mn1e_f(rett, stopp) { while (stopp == 0) {
 #
 if ( wb(-5,-1,"мы если когда коли куда") && s(wbn,-1) )
 { rett=stopp=1; d[999]++; if(dbg){print "D999"}; continue };
 #
 if ( p(-1) && p(0) )
 { rett=stopp=1; d[1000]++; if(dbg){print "D1000"}; continue };
break}; return rett }

function gl_mn3e_f(rett, stopp) { while (stopp == 0) {
 #
 if ( (q(-1,"suw_mnim muk_mnim otnsouz_mnim")||w(-1,"они")) && s(wbn,-1) )
 { rett=stopp=1; d[1001]++; if(dbg){print "D1001"}; continue };
 #
 if ( p(-1) && p(0) )
 { rett=stopp=1; d[1002]++; if(dbg){print "D1002"}; continue };
break}; return rett }

function gl_mn2e_f(rett, stopp) { while (stopp == 0) {
 #
 if ( qxs(-1,"так","что вот") )
 { rett=0; stopp=1; mn2e2pomn=1; d[1003]++; if(dbg){print "D1003"}; continue };
 if ( w(-2,"а да") &&
      w(-1,"вы") && s(-2,-1) && Q_w(1,"mest_da suw_edda suw_mnda") &&
      W(0,"шутите гоните"))
 { rett=0; stopp=1; mn2e2pomn=1; d[1004]++; if(dbg){print "D1004"}; continue };
 if ( w(-2,"вы") &&
      w(-1,"только лучше") && s(-2,-1) )
 { rett=0; stopp=1; mn2e2pomn=1; d[1005]++; if(dbg){print "D1005"}; continue };
 if ( w(-3,"вы") &&
       q(-2,"mest_vi suw_edvi suw_mnvi") &&
        w(-1,"не") && s(-3,-1) && p(0,"?") )
 { rett=0; stopp=1; mn2e2pomn=1; d[1006]++; if(dbg){print "D1006"}; continue };

 #
 if ( wb(-5,-1,"будто где если зачем когда коли которого которую которые который которых куда насколько небось откуда пока почему пошто сколько что") &&
      (q(wbn-1,"souz qast")||p(wbn-1)||sc(wbn-1,"[pv]")) && s(wbn,-1) )
 { rett=stopp=1; d[1007]++; if(dbg){print "D1007"}; continue };
 #
 if ( wb(-5,-2,"как") &&
       w(wbn-1,"бы долго же") && s(wbn,-1) )
 { rett=stopp=1; d[1008]++; if(dbg){print "D1008"}; continue };
 #
 if ( wb(-5,-1,"вы") && s(wbn,-1) )
 { rett=stopp=1; d[1009]++; if(dbg){print "D1009"}; continue };
 if ( vvb(-5,-1) &&
      w(vvn,"вы") && Ww_(vvn-1,"а") )
 { rett=stopp=1; d[1010]++; if(dbg){print "D1010"}; continue };
 if ( vvb(-5,-1) &&
      wb(vvn-5,vvn,"вы") && s(wbn,vvn-1) )
 { rett=stopp=1; d[1011]++; if(dbg){print "D1011"}; continue };
 #
 if ( sc(0,"?") )
 { rett=stopp=1; d[1012]++; if(dbg){print "D1012"}; continue };
 #
 if ( sc(0,",") &&
       q(1,"mod_mn") &&
        w(2,"не") &&
         q(3,"gl_in") && s(1,2) )
 { rett=stopp=1; d[1013]++; if(dbg){print "D1013"}; continue };
#if ( sc(0,",") &&
#      w(1,"не") &&
#       q(2,"gl_povzmn") && s(1) )
#{ rett=stopp=1; d[1014]++; if(dbg){print "D1014"}; continue };
break}; return rett }

function nar_spos_f(rett, stopp) { while (stopp == 0) {
 #
 if ( p(-1) &&
       q(1,"gl_mn gl_vzmn") &&
        q(2,"mest_mnim suw_mnim") && s(0,1) )
 { rett=stopp=1; d[1015]++; if(dbg){print "D1015"}; continue };
 #
 if ( p(-2) &&
       q(-1,"gl_mn gl_vzmn") &&
        q(1,"mest_mnim suw_mnim") && s(-1,0) )
 { rett=stopp=1; d[1016]++; if(dbg){print "D1016"}; continue };
 #
 if ( p(-3) &&
       q(-2,"gl_mn gl_vzmn") &&
        q(-1,"mest_mnim suw_mnim") && s(-2,-1) )
 { rett=stopp=1; d[1017]++; if(dbg){print "D1017"}; continue };

break}; return rett }

