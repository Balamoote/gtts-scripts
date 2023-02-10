# Набор правил обработки для deomo.awk в виде специфицеских для класса слова. Вынесены в отдельный файл, чтобы не загромождать основной файл.
# При срабатывании функции выдают значение TRUE, при вызове аргументы НЕ указываются.

function sw_ez_dpr_f(rett, stopper) { while (stopper == 0) {
 #
 if ( (pre_da(-2)||pre_ro(-2)||pre_pr(-2)) &&
       (prl_edzeda(-1)||prl_edzero(-1)||prl_edzepr(-1)||prq_edzeda(-1)||prq_edzero(-1)||prq_edzepr(-1)||mest_da(-1)||mest_ro(-1)||mest_pr(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 #
 if ( (pre_da(-1)||pre_ro(-1)||pre_pr(-1)||prl_edzeda(-1)||prl_edzero(-1)||prl_edzepr(-1)||prq_edzeda(-1)||prq_edzero(-1)||prq_edzepr(-1)||mest_da(-1)||mest_ro(-1)||mest_pr(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };

break}; return rett }

function sw_es_r_f(rett, stopper) { while (stopper == 0) {
 #
 if ( (pre_ro(-1)||prl_edsrro(-1)||prq_edsrro(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };

break}; return rett }

function sw_ez_d_f(rett, stopper) { while (stopper == 0) {
 #
 if ( pre_da(-2) && 
      (prl_edzeda(-1)||prq_edzeda(-1)||mest_da(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 #
 if ( (pre_da(-1)||prl_edzeda(-1)||prq_edzeda(-1)||mest_da(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };

break}; return rett }

function sw_ez_l_f(rett, stopper) { while (stopper == 0) {
 #
 if ( w(-2,"в на") &&
      (prl_edzepr(-1)||prq_edzepr(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 #
 if ( w(-1,"в на") && s(-1,-1) )
 { rett=stopper=1; continue };
 #
 if ( (w(-2,"нет")||qi_duoz(-2)) &&
         (prl_mnim(-1)||prl_mnvi(-1)||prq_mnim(-1)||prq_mnvi(-1)||mest_im(-1)||mest_vi(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };

break}; return rett }

function sw_ez_r_f(rett, stopper) { while (stopper == 0) {
 #
 if ( (w(-2,"нет")||qi_duoz(-2)) &&
         (prl_mnim(-1)||prl_mnvi(-1)||prq_mnim(-1)||prq_mnvi(-1)||mest_im(-1)||mest_vi(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 #
 if ( pre_ro(-2) && 
      (prl_edzero(-1)||prq_edzero(-1)||mest_ro(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 #
 if ( (pre_ro(-1)||prl_edzero(-1)||prq_edzero(-1)||mest_ro(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };

break}; return rett }

function sw_ez_p_f(rett, stopper) { while (stopper == 0) {
 #
 if (pre_pr(-2) &&
     (prl_edzepr(-1)||prq_edzepr(-1)||mest_pr(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 #
 if ( (pre_pr(-1)||prl_edzepr(-1)||prq_edzepr(-1)||mest_pr(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };

break}; return rett }

function sw_mn_iv_f(rett, stopper) { while (stopper == 0) {
 #
 if ( (pre_im(-1)||pre_vi(-1)||prl_mnim(-1)||prl_mnvi(-1)||prq_mnim(-1)||prq_mnvi(-1)||mest_im(-1)||mest_vi(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };

break}; return rett }

function sw_mn_r_f(rett, stopper) { while (stopper == 0) {
 #
 if ( pre_ro(-2) &&
      (prl_mnro(-1)||prq_mnro(-1)) && s(-2,-1) )
 { rett=stopper=1; continue };
 #
 if ( (pre_ro(-1)||prl_mnro(-1)||prq_mnro(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 #
 if ( (qik_im(-1)||qik_mnim(-1)||qik_mnro(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };

break}; return rett }

function gl_paedmu_f(rett, stopper) { while (stopper == 0) {
 #
 if ( (w(-1,"я ты он")||suw_edmuim(-1)||prl_kred_sr(-1)||gl_in(-1)) && s(-1,-1) )
 { rett=stopper=1; continue };
 #
 if ( (w(1,"я ты он")||suw_edmuim(1)) &&
       (prl_kred_sr(2)||gl_in(2)) && s(0,1) )
 { rett=stopper=1; continue };
 #
 if ( (w(1,"я ты он")||suw_edmuim(1)||prl_kred_sr(1)||gl_in(1)) && s(0,0) )
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

