# Функции для работы с файлами, которые были обработаны SpaCy

# все/всё 
function vsyo_sy(n,    rd,rett) { split(sepscy[i+n],sprs,"#"); rd = sprs[2]
                  if( ( rd~ "@_PRON_|@_DET_|@_ADV_" && rd~ "_Number=Sing_" ) || rd~ "@_PART__@" )                                        {rett=1}else{rett=0}; return rett }
function vsje_sy(n,    rd,rett) { split(sepscy[i+n],sprs,"#"); rd = sprs[2]
                  if( rd~ "@_DET_|@_PRON_" && rd~ "_Number=Plur_" )                                                                      {rett=1}else{rett=0}; return rett }

# имена собственные
function name_im_sy(n,   wd, rd,rett) { split(sepscy[i+n],sprs,"#"); rd = sprs[2]
               if( rd~ "@_PROPN_" && rd~ "_Case=Nom_" && rd~ "_Number=Sing_")                                                            {rett=1}else{rett=0}; return rett }
function name_vi_sy(n,   wd, rd,rett) { split(sepscy[i+n],sprs,"#"); rd = sprs[2]
               if( rd~ "@_PROPN_" && rd~ "_Case=Acc_" && rd~ "_Number=Sing_")                                                            {rett=1}else{rett=0}; return rett }
function name_ro_sy(n,   wd, rd,rett) { split(sepscy[i+n],sprs,"#"); rd = sprs[2]
               if( rd~ "@_PROPN_" && rd~ /_Case=Gen_|_Case=Acc_/ && rd~ "_Number=Sing_")                                                 {rett=1}else{rett=0}; return rett }
function name_da_sy(n,   wd, rd,rett) { split(sepscy[i+n],sprs,"#"); rd = sprs[2]
               if( rd~ "@_PROPN_" && rd~ "_Case=Dat_" && rd~ "_Number=Sing_")                                                            {rett=1}else{rett=0}; return rett }
function name_tv_sy(n,   wd, rd,rett) { split(sepscy[i+n],sprs,"#"); rd = sprs[2]
               if( rd~ "@_PROPN_" && rd~ "_Case=Ins_" && rd~ "_Number=Sing_")                                                            {rett=1}else{rett=0}; return rett }
function name_pr_sy(n,   wd, rd,rett) { split(sepscy[i+n],sprs,"#"); rd = sprs[2]
               if( rd~ "@_PROPN_" && rd~ "_Case=Loc_" && rd~ "_Number=Sing_")                                                            {rett=1}else{rett=0}; return rett }
function name_any_sy(n,  wd, rd,rett) { split(sepscy[i+n],sprs,"#"); rd = sprs[2]; if( rd~ "@_PROPN_" )                                  {rett=1}else{rett=0}; return rett }


# По падежам...

function sw_es_r_sy(n,    rd,rett) { split(sepscy[i+n],sprs,"#"); rd = sprs[2]
               if( rd~ "@_NOUN_" && rd~ "_Number=Sing_" && rd~ "_Case=Gen_")                                      {rett=1}else{rett=0}; return rett }

#  
function sw_mn_i_sy(n,    rd,rett) { split(sepscy[i+n],sprs,"#"); rd = sprs[2]
               if( rd~ "@_NOUN_" && rd~ "_Number=Plur_" && rd~ "_Case=Nom_")                                      {rett=1}else{rett=0}; return rett }
function sw_mn_v_sy(n,    rd,rett) { split(sepscy[i+n],sprs,"#"); rd = sprs[2]
               if( rd~ "@_NOUN_" && rd~ "_Number=Plur_" && rd~ "_Case=Acc_")                                      {rett=1}else{rett=0}; return rett }

# для обхода ошибок баз spacy единичные функции для противопоставления ОДНОГО признака, где это возможно

function isSing_sy(n,    rd,rett) { split(sepscy[i+n],sprs,"#"); rd = sprs[2]; if( rd~ "_Number=Sing_" )                                   {rett=1}else{rett=0}; return rett }
function isPlur_sy(n,    rd,rett) { split(sepscy[i+n],sprs,"#"); rd = sprs[2]; if( rd~ "_Number=Plur_" )                                   {rett=1}else{rett=0}; return rett }



