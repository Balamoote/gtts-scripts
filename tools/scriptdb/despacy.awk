# Функции для работы с файлами, которые были обработаны SpaCy

# все/всё 
function vsyo_sy(n,    wd,rett) { split(sepscy[i+n],sprs,"#"); wd = sprs[2]
                  if( ( wd~ "@_PRON_|@_DET_|@_ADV_" && wd~ "_Number=Sing_" ) || wd~ "@_PART__@" )                                        {rett=1}else{rett=0}; return rett }
function vsje_sy(n,    wd,rett) { split(sepscy[i+n],sprs,"#"); wd = sprs[2]
                  if( wd~ "@_DET_|@_PRON_" && wd~ "_Number=Plur_" )                                                                      {rett=1}else{rett=0}; return rett }

# имена собственные
function name_im_sy(n,    wd,rett) { split(sepscy[i+n],sprs,"#"); wd = sprs[2]
               if( wd~ "@_PROPN_" && wd~ "_Case=Nom_" && wd~ "_Number=Sing_")                                                            {rett=1}else{rett=0}; return rett }
function name_vi_sy(n,    wd,rett) { split(sepscy[i+n],sprs,"#"); wd = sprs[2]
               if( wd~ "@_PROPN_" && wd~ "_Case=Acc_" && wd~ "_Number=Sing_")                                                            {rett=1}else{rett=0}; return rett }
function name_ro_sy(n,    wd,rett) { split(sepscy[i+n],sprs,"#"); wd = sprs[2]
               if( wd~ "@_PROPN_" && wd~ /_Case=Gen_|_Case=Acc_/ && wd~ "_Number=Sing_")                                                 {rett=1}else{rett=0}; return rett }
function name_da_sy(n,    wd,rett) { split(sepscy[i+n],sprs,"#"); wd = sprs[2]
               if( wd~ "@_PROPN_" && wd~ "_Case=Dat_" && wd~ "_Number=Sing_")                                                            {rett=1}else{rett=0}; return rett }
function name_tv_sy(n,    wd,rett) { split(sepscy[i+n],sprs,"#"); wd = sprs[2]
               if( wd~ "@_PROPN_" && wd~ "_Case=Ins_" && wd~ "_Number=Sing_")                                                            {rett=1}else{rett=0}; return rett }
function name_pr_sy(n,    wd,rett) { split(sepscy[i+n],sprs,"#"); wd = sprs[2]
               if( wd~ "@_PROPN_" && wd~ "_Case=Loc_" && wd~ "_Number=Sing_")                                                            {rett=1}else{rett=0}; return rett }
function name_any_sy(n,   wd,rett) { split(sepscy[i+n],sprs,"#"); wd = sprs[2]; if( wd~ "@_PROPN_" )                                     {rett=1}else{rett=0}; return rett }


# По падежам...

function sw_es_r_sy(n,    wd,rett) { split(sepscy[i+n],sprs,"#"); wd = sprs[2]
               if( wd~ "@_NOUN_" && wd~ "_Number=Sing_" && wd~ "_Case=Gen_")                                      {rett=1}else{rett=0}; return rett }

#  
function sw_mn_i_sy(n,    wd,rett) { split(sepscy[i+n],sprs,"#"); wd = sprs[2]
               if( wd~ "@_NOUN_" && wd~ "_Number=Plur_" && wd~ "_Case=Nom_")                                      {rett=1}else{rett=0}; return rett }
function sw_mn_v_sy(n,    wd,rett) { split(sepscy[i+n],sprs,"#"); wd = sprs[2]
               if( wd~ "@_NOUN_" && wd~ "_Number=Plur_" && wd~ "_Case=Acc_")                                      {rett=1}else{rett=0}; return rett }

# для обхода ошибок баз spacy единичные функции для противопоставления ОДНОГО признака, где это возможно

function isSing_sy(n,    wd,rett) { split(sepscy[i+n],sprs,"#"); wd = sprs[2]; if( wd~ "_Number=Sing_" )                                   {rett=1}else{rett=0}; return rett }
function isPlur_sy(n,    wd,rett) { split(sepscy[i+n],sprs,"#"); wd = sprs[2]; if( wd~ "_Number=Plur_" )                                   {rett=1}else{rett=0}; return rett }



