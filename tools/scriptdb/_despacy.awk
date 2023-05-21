# функции, корректирующие spacy для каждого класса (род, падеж) слов отдельно
# ОТКЛЮЧЕНО!
function sw_ex_r_cy(rett, stopp) { while (stopp == 0) {
 #
 if ( w(-2,"не") &&
       q(-1,"gl_ed gl_in gl_mn gl_poed gl_pomn deep") && s(-2,-1) )
 { rett=stopp=1; d[33]++; if(dbg){print "D33"}; continue };

break}; return rett }

function sw_em_r_cy(rett, stopp) { while (stopp == 0) {
 #
 if ( (w(-2,"нет")||q(-2,"pre_ro qi_duom")) &&
        q(-1,"prl_mnro prq_mnro mest_mnro") && s(-2,-1) )
 { rett=stopp=1; d[141]++; if(dbg){print "D141"}; continue };
 if ( (w(-1,"нет")||q(-1,"pre_ro qi_duom")) && s(-1) )
 { rett=stopp=1; d[142]++; if(dbg){print "D142"}; continue };

 #_#_#
 if (prex == 1) {
 if ( q(-3,"prex_ro preph_ro") &&
      (q(-2,"prl_edmuro prq_edmuro mest_edmuro")||wc(-2,"^[0-9]+$")) &&
       (q(-1,"prl_edmuro prq_edmuro mest_edmuro")||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[143]++; if(dbg){print "D143"}; continue };
 if ( q(-2,"prex_ro preph_ro") &&
      (q(-1,"prl_edmuro prq_edmuro mest_edmuro")||wc(-1,"^[0-9]+$")) && s(-2,-1) )
 { rett=stopp=1; d[144]++; if(dbg){print "D144"}; continue };
 if ( prex_ro(-1) && s(-1) )
 { rett=stopp=1; d[145]++; if(dbg){print "D145"}; continue };
 } else {#
 if ( q(-3,"pre_ro preph_ro") &&
      (q(-2,"prl_edmuro prq_edmuro mest_edmuro")||wc(-2,"^[0-9]+$")) &&
       (q(-1,"prl_edmuro prq_edmuro mest_edmuro")||wc(-1,"^[0-9]+$")) && s(-3,-1) )
 { rett=stopp=1; d[146]++; if(dbg){print "D146"}; continue };
 if ( pre_ro(-2) &&
      (q(-1,"prl_edmuro prq_edmuro mest_edmuro")||wc(-1,"^[0-9]+$")) && W(-1,"него") && s(-2,-1) )
 { rett=stopp=1; d[147]++; if(dbg){print "D147"}; continue };
 if ( pre_ro(-1) && s(-1) )
 { rett=stopp=1; d[148]++; if(dbg){print "D148"}; continue };
 };#_#_#
 if ( (q(-1,"preph_ro prl_edmuro prq_edmuro mest_edmuro")||wc(-1,"^[0-9]+$")) && W(-1,"его него") && s(-1) )
 { rett=stopp=1; d[149]++; if(dbg){print "D149"}; continue };

break}; return rett }

function sw_ez_r_cy(rett, stopp) { while (stopp == 0) {

 #
 if ( (w(-2,"нет")||qi_duoz(-2)) &&
        q(-1,"prl_edzero prl_edzero prq_edzero prq_edzero mest_ro") && s(-2,-1) )
 { rett=stopp=1; d[258]++; if(dbg){print "D258"}; continue };
 if ( qi_duoz(-2) &&
       q(-1,"prl_mnim prq_mnim mest_mnim") && s(-2,-1) && se(-2," ") )
 { rett=stopp=1; d[259]++; if(dbg){print "D259"}; continue };
 #
 if ( (w(-1,"нет")||qi_duoz(-1)) && s(-1) )
 { rett=stopp=1; d[260]++; if(dbg){print "D260"}; continue };

 #_#_#
 if (prex == 1) {
 if ( q(-3,"prex_ro preph_ro") &&
       q(-2,"prl_edzero prq_edzero mest_edzero") &&
        q(-1,"prl_edzero prq_edzero mest_edzero") && s(-3,-1) )
 { rett=stopp=1; d[261]++; if(dbg){print "D261"}; continue };
 if ( q(-2,"prex_ro preph_ro") &&
      (q(-1,"prl_edzero prq_edzero mest_edzero")||w(-1,"его их")) && s(-2,-1) )
 { rett=stopp=1; d[262]++; if(dbg){print "D262"}; continue };
 if ( prex_ro(-1) && s(-1) )
 { rett=stopp=1; d[263]++; if(dbg){print "D263"}; continue };
 } else {#
 if ( q(-3,"pre_ro preph_ro") &&
       q(-2,"prl_edzero prq_edzero mest_edzero") &&
        q(-1,"prl_edzero prq_edzero mest_edzero") && s(-3,-1) )
 { rett=stopp=1; d[264]++; if(dbg){print "D264"}; continue };
 if ( q(-2,"pre_ro preph_ro") &&
      (q(-1,"prl_edzero prq_edzero mest_edzero")||w(-1,"его их")) && s(-2,-1) )
 { rett=stopp=1; d[265]++; if(dbg){print "D265"}; continue };
 if ( pre_ro(-1) && s(-1) )
 { rett=stopp=1; d[266]++; if(dbg){print "D266"}; continue };
 };#_#_#
 if ( q(-1,"preph_ro prl_edzero prq_edzero mest_edzero") && W(-1,"её") && s(-1) )
 { rett=stopp=1; d[267]++; if(dbg){print "D267"}; continue };

break}; return rett }

function sw_mn_i_cy(rett, stopp) { while (stopp == 0) {
 #
 if ( (qf(5,"gl_vzmn")||qf(5,"gl_nemn")) && s(0,qfn-1) )
 { rett=stopp=1; d[33]++; if(dbg){print "D33"}; continue };

break}; return rett }

function sw_mn_v_cy(rett, stopp) { while (stopp == 0) {
 #
 if ( W(-3,"не") &&
       q(-2,"deep_pe gl_peed gl_pein gl_pemn") &&
        q(-1,"prl_mnvi prq_mnvi mest_vi") && s(-2,-1) )
 { rett=stopp=1; d[305]++; if(dbg){print "D305"}; continue };
 if ( W(-2,"не") &&
       q(-1,"deep_pe gl_peed gl_pein gl_pemn") && Q(-1,"suw_edda suw_edvi") && s(-1) )
 { rett=stopp=1; d[306]++; if(dbg){print "D306"}; continue };
#if ( !(suw_any(-1) && s(-1) && suw_edro(0)) &&
#       q(1,"deep_pn gl_pned gl_pnin gl_pnmn") && s(0) )
#{ rett=stopp=1; d[307]++; if(dbg){print "D307"}; continue };

 #_#_#
 if (prex == 1) {
 if ( q(-2,"prex_vi preph_vi") &&
       q(-1,"prl_mnvi prq_mnvi mest_pmnim") && s(-2,-1) )
 { rett=stopp=1; d[308]++; if(dbg){print "D308"}; continue };
 if ( prex_vi(-1) && s(-1) )
 { rett=stopp=1; d[309]++; if(dbg){print "D309"}; continue };
 } else {#
 if ( q(-2,"pre_vi preph_vi") &&
       q(-1,"prl_mnvi prq_mnvi mest_pmnim") && s(-2,-1) )
 { rett=stopp=1; d[310]++; if(dbg){print "D310"}; continue };
 if ( pre_vi(-1) && s(-1) )
 { rett=stopp=1; d[311]++; if(dbg){print "D311"}; continue };
 };#_#_#
 if ( q(-1,"preph_vi prl_mnvi prq_mnvi mest_pmnim") && s(-1) )
 { rett=stopp=1; d[312]++; if(dbg){print "D312"}; continue };
break}; edro2mnvi=""; return rett }

