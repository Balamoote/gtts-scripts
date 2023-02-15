# Набор правил обработки для deomo.awk в виде специфицеских для класса слова. Вынесены в отдельный файл, чтобы не загромождать основной файл.
# При срабатывании функции выдают значение TRUE, при вызове аргументы НЕ указываются.

function sw_em_i_f(rett, stopper) { while (stopper == 0) {
 #_#_#
 if (prex == 1) {
 if ( prex_im(-2) &&
      (prl_edmuim(-1)||prq_edmuim(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (prex_im(-1)||prl_edmuim(-1)||prq_edmuim(-1)||muk_edim(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_im(-2) &&
      (prl_edmuim(-1)||prq_edmuim(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (pre_im(-1)||prl_edmuim(-1)||prq_edmuim(-1)||muk_edim(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_em_v_f(rett, stopper) { while (stopper == 0) {
 #_#_#
 if (prex == 1) {
 if ( prex_vi(-2) &&
      (prl_edmuvi(-1)||prq_edmuvi(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (prex_vi(-1)||prl_edmuvi(-1)||prq_edmuvi(-1)||muk_edvi(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_vi(-2) &&
      (prl_edmuvi(-1)||prq_edmuvi(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (pre_vi(-1)||prl_edmuvi(-1)||prq_edmuvi(-1)||muk_edvi(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_em_d_f(rett, stopper) { while (stopper == 0) {
 #
 #_#_#
 if (prex == 1) {
 if ( prex_da(-2) &&
      (prl_edmuda(-1)||prq_edmuda(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (prex_da(-1)||prl_edmuda(-1)||prq_edmuda(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_da(-2) &&
      (prl_edmuda(-1)||prq_edmuda(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (pre_da(-1)||prl_edmuda(-1)||prq_edmuda(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_em_r_f(rett, stopper) { while (stopper == 0) {
 #
 if ( (w(-2,"нет")||pre_ro(-2)||qi_duom(-2)) &&
       (prl_mnro(-1)||prq_mnro(-1)||mest_mnro(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (w(-1,"нет")||pre_ro(-1)||qi_duom(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };

 #_#_#
 if (prex == 1) {
 if ( prex_ro(-2) &&
      (prl_edmuro(-1)||prq_edmuro(-1)||mest_edmuro(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (prex_ro(-1)||prl_edmuro(-1)||prq_edmuro(-1)||mest_edmuro(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_ro(-2) &&
      (prl_edmuro(-1)||prq_edmuro(-1)||mest_edmuro(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (pre_ro(-1)||prl_edmuro(-1)||prq_edmuro(-1)||mest_edmuro(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_em_t_f(rett, stopper) { while (stopper == 0) {
 #
 #_#_#
 if (prex == 1) {
 if ( prex_tv(-2) &&
      (prl_edmutv(-1)||prq_edmutv(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (prex_tv(-1)||prl_edmutv(-1)||prq_edmutv(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_tv(-2) &&
      (prl_edmutv(-1)||prq_edmutv(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (pre_tv(-1)||prl_edmutv(-1)||prq_edmutv(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_em_p_f(rett, stopper) { while (stopper == 0) {
 #
 #_#_#
 if (prex == 1) {
 if ( prex_pr(-2) &&
      (prl_edmupr(-1)||prq_edmupr(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( prex_pr(-1) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_pr(-2) &&
      (prl_edmupr(-1)||prq_edmupr(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( pre_pr(-1) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_em_q_f(rett, stopper) { while (stopper == 0) {
 #
 if ( qi_duom(-2) &&
       (prl_edmuro(-1)||prq_edmuro(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( qi_duom(-1) && s(-1,-1) )
 { rett=stopper=1; continue };

break}; return rett }

function sw_es_i_f(rett, stopper) { while (stopper == 0) {
 #_#_#
 if (prex == 1) {
 if ( prex_im(-2) &&
      (prl_edsrim(-1)||prq_edsrim(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (prex_im(-1)||prl_edsrim(-1)||prq_edsrim(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_im(-2) &&
      (prl_edsrim(-1)||prq_edsrim(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (pre_im(-1)||prl_edsrim(-1)||prq_edsrim(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_es_v_f(rett, stopper) { while (stopper == 0) {
 #_#_#
 if (prex == 1) {
 if ( prex_vi(-2) &&
      (prl_edsrvi(-1)||prq_edsrvi(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (prex_vi(-1)||prl_edsrvi(-1)||prq_edsrvi(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_vi(-2) &&
      (prl_edsrvi(-1)||prq_edsrvi(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (pre_vi(-1)||prl_edsrvi(-1)||prq_edsrvi(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_es_r_f(rett, stopper) { while (stopper == 0) {
 #
 if ( (w(-2,"нет")||pre_ro(-2)||qi_duom(-2)) &&
       (prl_mnro(-1)||prq_mnro(-1)||mest_mnro(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (w(-1,"нет")||qi_duom(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 if ( w(-3,"не") &&
      (gl_ed(-2)||gl_in(-2)||gl_poed(-2)) &&
        (prl_edsrro(-1)||prl_edsrro(-1)||mest_ro(-1)) && s(-3,-1) )
 { rett=stopper=1; continue };
 if ( w(-2,"не") &&
       (gl_ed(-1)||gl_in(-1)||gl_poed(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };

 #_#_#
 if (prex == 1) {
 if ( prex_ro(-2) &&
      (prl_edsrro(-1)||prq_edsrro(-1)||mest_edsrro(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (prex_ro(-1)||prl_edsrro(-1)||prq_edsrro(-1)||mest_edsrro(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_ro(-2) &&
      (prl_edsrro(-1)||prq_edsrro(-1)||mest_edsrro(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (pre_ro(-1)||prl_edsrro(-1)||prq_edsrro(-1)||mest_edsrro(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_es_d_f(rett, stopper) { while (stopper == 0) {
 #
 #_#_#
 if (prex == 1) {
 if ( prex_da(-2) &&
      (prl_edsrda(-1)||prq_edsrda(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (prex_da(-1)||prl_edsrda(-1)||prq_edsrda(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_da(-2) &&
      (prl_edsrda(-1)||prq_edsrda(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (pre_da(-1)||prl_edsrda(-1)||prq_edsrda(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_es_t_f(rett, stopper) { while (stopper == 0) {
 #
 #_#_#
 if (prex == 1) {
 if ( prex_tv(-2) &&
      (prl_edsrtv(-1)||prq_edsrtv(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (prex_tv(-1)||prl_edsrtv(-1)||prq_edsrtv(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_tv(-2) &&
      (prl_edsrtv(-1)||prq_edsrtv(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (pre_tv(-1)||prl_edsrtv(-1)||prq_edsrtv(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_es_p_f(rett, stopper) { while (stopper == 0) {
 #
 #_#_#
 if (prex == 1) {
 if ( prex_pr(-2) &&
      (prl_edsrpr(-1)||prq_edsrpr(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( prex_pr(-1) && s(-2,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_pr(-2) &&
      (prl_edsrpr(-1)||prq_edsrpr(-1)) && s(-2,-1) )
 if ( pre_pr(-1) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_ez_i_f(rett, stopper) { while (stopper == 0) {
 #_#_#
 if (prex == 1) {
 if ( prex_im(-2) && 
      (prl_edzeim(-1)||prq_edzeim(-1)||mest_edzeim(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (prex_im(-1)||prl_edzeim(-1)||prq_edzeim(-1)||mest_edzeim(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_im(-2) && 
      (prl_edzeim(-1)||prq_edzeim(-1)||mest_edzeim(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (pre_im(-1)||prl_edzeim(-1)||prq_edzeim(-1)||mest_edzeim(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_ez_v_f(rett, stopper) { while (stopper == 0) {
 #_#_#
 if (prex == 1) {
 if ( prex_vi(-2) && 
      (prl_edzevi(-1)||prq_edzevi(-1)||mest_edzevi(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (prex_vi(-1)||prl_edzevi(-1)||prq_edzevi(-1)||mest_edzevi(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_vi(-2) && 
      (prl_edzevi(-1)||prq_edzevi(-1)||mest_edzevi(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (pre_vi(-1)||prl_edzevi(-1)||prq_edzevi(-1)||mest_edzevi(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_ez_d_f(rett, stopper) { while (stopper == 0) {
 #_#_#
 if (prex == 1) {
 if ( prex_da(-2) && 
      (prl_edzeda(-1)||prq_edzeda(-1)||mest_da(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (prex_da(-1)||prl_edzeda(-1)||prq_edzeda(-1)||mest_da(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_da(-2) && 
      (prl_edzeda(-1)||prq_edzeda(-1)||mest_da(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (pre_da(-1)||prl_edzeda(-1)||prq_edzeda(-1)||mest_da(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_em_l_f(rett, stopper) { while (stopper == 0) {
 #
 if ( w(-2,"в на") &&
      (prl_edmupr(-1)||prq_edmupr(-1)||mest_pr(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 #
 if ( w(-1,"в во на") && s(-1,-1) )
 { rett=stopper=1; continue };
break}; return rett }

function sw_ez_l_f(rett, stopper) { while (stopper == 0) {
 #
 if ( w(-2,"в на") &&
      (prl_edzepr(-1)||prq_edzepr(-1)||mest_pr(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 #
 if ( w(-1,"в во на") && s(-1,-1) )
 { rett=stopper=1; continue };
break}; return rett }

function sw_ez_r_f(rett, stopper) { while (stopper == 0) {
 #
 if ( (w(-2,"нет")||qi_duoz(-2)) &&
         (prl_edzero(-1)||prl_edzero(-1)||prq_edzero(-1)||prq_edzero(-1)||mest_ro(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 #
 if ( (w(-1,"нет")||qi_duoz(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };

 #_#_#
 if (prex == 1) {
 if ( prex_ro(-2) && 
      (prl_edzero(-1)||prq_edzero(-1)||mest_ro(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (prex_ro(-1)||prl_edzero(-1)||prq_edzero(-1)||mest_ro(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_ro(-2) && 
      (prl_edzero(-1)||prq_edzero(-1)||mest_ro(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (pre_ro(-1)||prl_edzero(-1)||prq_edzero(-1)||mest_ro(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_ez_t_f(rett, stopper) { while (stopper == 0) {
 #_#_#
 if (prex == 1) {
 if (prex_pr(-2) &&
     (prl_edzetv(-1)||prq_edzetv(-1)||mest_tv(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (prex_tv(-1)||prl_edzetv(-1)||prq_edzetv(-1)||mest_tv(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if (pre_tv(-2) &&
     (prl_edzetv(-1)||prq_edzetv(-1)||mest_tv(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (pre_tv(-1)||prl_edzetv(-1)||prq_edzetv(-1)||mest_tv(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_ez_p_f(rett, stopper) { while (stopper == 0) {
 #_#_#
 if (prex == 1) {
 if (prex_pr(-2) &&
     (prl_edzepr(-1)||prq_edzepr(-1)||mest_pr(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( prex_pr(-1) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if (pre_pr(-2) &&
     (prl_edzepr(-1)||prq_edzepr(-1)||mest_pr(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( pre_pr(-1) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_mn_i_f(rett, stopper) { while (stopper == 0) {
 #_#_#
 if (prex == 1) {
 if ( prex_im(-2) &&
      (prl_mnim(-1)||prq_mnim(-1)||mest_pmnim(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (prex_im(-1)||prl_mnim(-1)||prq_mnim(-1)||mest_pmnim(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_im(-2) &&
      (prl_mnim(-1)||prq_mnim(-1)||mest_pmnim(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (pre_im(-1)||prl_mnim(-1)||prq_mnim(-1)||mest_pmnim(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_mn_v_f(rett, stopper) { while (stopper == 0) {
 #_#_#
 if (prex == 1) {
 if ( prex_vi(-2) &&
      (prl_mnvi(-1)||prq_mnvi(-1)||mest_pmnim(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (prex_vi(-1)||prl_mnvi(-1)||prq_mnvi(-1)||mest_pmnim(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_vi(-2) &&
      (prl_mnvi(-1)||prq_mnvi(-1)||mest_pmnim(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (pre_vi(-1)||prl_mnvi(-1)||prq_mnvi(-1)||mest_pmnim(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_mn_r_f(rett, stopper) { while (stopper == 0) {
 #
#if ( suw_all(-1) && s(-1,-1) )
#{ rett=stopper=1; continue };

 #_#_#
 if (prex == 1) {
 if ( prex_ro(-2) &&
      (prl_mnro(-1)||prq_mnro(-1)||qin_im(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (prex_ro(-1)||prl_mnro(-1)||prq_mnro(-1)||qin_im(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_ro(-2) &&
      (prl_mnro(-1)||prq_mnro(-1)||qin_im(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (pre_ro(-1)||prl_mnro(-1)||prq_mnro(-1)||qin_im(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#

 #
 if ( (qik_im(-1)||qik_mnim(-1)||qik_mnro(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
break}; return rett }

function sw_mn_d_f(rett, stopper) { while (stopper == 0) {
 #_#_#
 if (prex == 1) {
 if ( prex_da(-2) &&
      (prl_mnda(-1)||prq_mnda(-1)||qin_da(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (prex_da(-1)||prl_mnda(-1)||prq_mnda(-1)||qin_da(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_da(-2) &&
      (prl_mnda(-1)||prq_mnda(-1)||qin_da(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (pre_da(-1)||prl_mnda(-1)||prq_mnda(-1)||qin_da(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function sw_mn_p_f(rett, stopper) { while (stopper == 0) {
 #_#_#
 if (prex == 1) {
 if ( prex_pr(-2) &&
      (prl_mnpr(-1)||prq_mnpr(-1)||qin_pr(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( prex_pr(-1) && s(-1,-1) )
 { rett=stopper=1; continue };
 } else {#
 if ( pre_pr(-2) &&
      (prl_mnpr(-1)||prq_mnpr(-1)||qin_pr(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( pre_pr(-1) && s(-1,-1) )
 { rett=stopper=1; continue };
 };#_#_#
break}; return rett }

function pl_kr_em_f(rett, stopper) { while (stopper == 0) {
 if ( (w(-2,"я ты он был стал")||suw_edmuim(-2)) &&
      prl_kred_sr(-1) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (w(-1,"я ты он был стал")||suw_edmuim(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
break}; return rett }

function pl_kr_ez_f(rett, stopper) { while (stopper == 0) {
 if ( (w(-2,"я ты она была стала")||suw_edzeim(-2)) &&
      prl_kred_sr(-1) && s(-2,-1) )
 { rett=stopper=1; continue };
 if ( (w(-1,"я ты она была стала")||suw_edzeim(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
break}; return rett }

function gl_paedmu_f(rett, stopper) { while (stopper == 0) {
 #
 if ( (w(-1,"я ты он")||suw_edmuim(-1)||prl_kred_sr(-1)||gl_in(-1)) && Q(-1,"prl_edmuim") && s(-1,-1) )
 { rett=stopper=1; continue };
 if ( (w(-2,"я ты он")||suw_edmuim(-2)) && 
       (nar_spos(-1)||prl_kred_sr(-1)) && Q(-1,"prl_edmuim") && s(-2,-1) )
 { rett=stopper=1; continue };
 #
 if ( (w(1,"я ты он")||suw_edmuim(1)) &&
       (prl_kred_sr(2)||gl_in(2)) && Q(1,"prl_edmuim") && s(0,1) )
 { rett=stopper=1; continue };
 #
 if ( (w(1,"я ты он")||suw_edmuim(1)||prl_kred_sr(1)) && Q(1,"prl_edmuim") && s(0,0) )
 { rett=stopper=1; continue };
break}; return rett }

function gl_pomn_f(rett, stopper) { while (stopper == 0) {
 #
 if ( (gl_poed(-4)||gl_pomn(-4)||gl_povzmn(-4)) &&
        w(-3,"что") &&
        (gl_ed(-2)||gl_nemn(-2)||gl_pemn(-2)||gl_pnmn(-2)) &&
          w(-1,"и") && s(-4,-1) )
 { rett=stopper=1; continue };
 #
 if ( w(-2,"так") &&
       w(-1,"что вот") && s(-2,-1) )
 { rett=stopper=1; continue };
break}; return rett }

function gl_mn2e_f(rett, stopper) { while (stopper == 0) {
 #
 if ( wb(-5,"будто где если зачем когда коли которого которую которые который которых куда насколько небось откуда пока почему пошто сколько что") &&
      (p(wbn-1)||sc(wbn-1,"[pv]")||souz(wbn-1)||qast(wbn-1)) && s(wbn,-1) )
 { rett=stopper=1; continue };
 #
 if ( wb(-5,"как") &&
       w(wbn-1,"бы долго же") && s(wbn,-1) )
 { rett=stopper=1; continue };
 #
 if ( sc(0,"?") )
 { rett=stopper=1; continue };
break}; return rett }

