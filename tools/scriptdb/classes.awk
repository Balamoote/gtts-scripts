@load "rwarray"

BEGIN {
# Скрипт чтения словарных баз в массивы
# Последняя версия файла тут: https://github.com/Balamoote/gtts-scripts
    # let @a=1|%s/;DIC\["\zs[0-9]\+\ze"\]/\=''.(@a+setreg('a',@a+1))/g|%s/k<=\zs\d\+\ze;/\=''.(@a-1)/g 
    # %s:\[$1\];\zs\ze:DIC["1"]++;:gc
    # %s:DIC\["\d\+"\]++;::gc

 # Проверяем версию gawk, если меньше 5.2.1, то выключаем функции сохранения и восстановления массивов и переменных: базы тогда читаются всегда заново.
    redix=gawk52="42"
    cmd = "awk -Wversion | head -1"
    cmd|getline verheader; close(cmd)
    split(verheader, gnuawk, "[ .,]")
    if (gnuawk[1] == "GNU" && gnuawk[2] == "Awk" && gnuawk[3] >= 5 && gnuawk[4] >= 2 && gnuawk[5] >= 1) { gawk52 = 1 };
 # Если словари и этот скрипт не изменились и gawk>=5.2.1, восстановить состояние, иначе прочитать всё заново.
   if ( gawk52 == 1 ) {
    cmd   = "md5sum -c --status " inax "classes.md5 >/dev/null 2>&1"
    redix = system(cmd); close(cmd);};

   classcache = inax "classes.bin"
   
   if (redix == 0 && gawk52 == 1) { readall(classcache) } else {

   cmd = "zcat " indb "dic_prq.gz";
   while ((cmd|getline) > 0) {

      if ($1~ "-") { dichyph [$1] };

      if($2~ /_ед_жен_/ ){
        if ($2~ /_ед_жен_тв$/ && $2~ /ю$/           ){  pl_edze_tv        [$1]=""; continue };
        if ($2~ /_ед_жен_тв$/ && $2~ /й$/           ){  pl_edze_dr        [$1]=""; continue };
        if ($2~ /_ед_жен_вин$/                      ){  pq_edze_dr        [$1]=""; continue };
        if ($2~ /_ед_жен_дат$/                      ){  pq_edze_dr        [$1]=""; continue };
        if ($2~ /_ед_жен_им$/                       ){  pq_edze_im        [$1]=""; continue };
        if ($2~ /_ед_жен_пр$/                       ){  pq_edze_dr        [$1]=""; continue };
        if ($2~ /_ед_жен_род$/                      ){  pq_edze_dr        [$1]=""; continue };
      };                                                                                       
      if($2~ /_ед_муж_/ ){                                                                     
        if ($2~ /_ед_муж_вин_неод$/                 ){  pq_edmu_im        [$1]=""; continue };
        if ($2~ /_ед_муж_вин_одуш$/                 ){  pq_edmu_ro        [$1]=""; continue };
        if ($2~ /_ед_муж_дат$/                      ){  pq_edmu_da        [$1]=""; continue };
        if ($2~ /_ед_муж_им$/                       ){  pq_edmu_im        [$1]=""; continue };
        if ($2~ /_ед_муж_пр$/                       ){  pq_edmu_pr        [$1]=""; continue };
        if ($2~ /_ед_муж_род$/                      ){  pq_edmu_ro        [$1]=""; continue };
        if ($2~ /_ед_муж_тв$/                       ){  pq_edmu_tv        [$1]=""; continue };
      };                                                                                       
      if($2~ /_ед_ср_/ ){                                                                      
        if ($2~ /_ед_ср_вин$/                       ){  pq_edsr_im        [$1]=""; continue };
        if ($2~ /_ед_ср_дат$/                       ){  pq_edsr_da        [$1]=""; continue };
        if ($2~ /_ед_ср_им$/                        ){  pq_edsr_im        [$1]=""; continue };
        if ($2~ /_ед_ср_пр$/                        ){  pq_edsr_pr        [$1]=""; continue };
        if ($2~ /_ед_ср_род$/                       ){  pq_edsr_ro        [$1]=""; continue };
        if ($2~ /_ед_ср_тв$/                        ){  pq_edsr_tv        [$1]=""; continue };
      };                                                                                      
      if($2~ /_мн_/ ){                                                                        
        if ($2~ /_мн_вин_неод$/                     ){  pq_mn_im          [$1]=""; continue };
        if ($2~ /_мн_вин_одуш$/                     ){  pq_mn_ro          [$1]=""; continue };
        if ($2~ /_мн_дат$/                          ){  pq_mn_da          [$1]=""; continue };
        if ($2~ /_мн_им$/                           ){  pq_mn_im          [$1]=""; continue };
        if ($2~ /_мн_пр$/                           ){  pq_mn_ro          [$1]=""; continue };
        if ($2~ /_мн_род$/                          ){  pq_mn_ro          [$1]=""; continue };
        if ($2~ /_мн_тв$/                           ){  pq_mn_tv          [$1]=""; continue };
      };                                            
      if($2~  /^прч_крат_/ ){                       
        if ($2~ /_ед_жен$/                          ){  pq_kred_ze        [$1]=""; continue };
        if ($2~ /_ед_муж$/                          ){  pq_kred_mu        [$1]=""; continue };
        if ($2~ /_ед_ср$/                           ){  pq_kred_sr        [$1]=""; continue };
        if ($2~ /_мн$/                              ){  pq_krmn           [$1]=""; continue };
      };
     }; # чтение prq-dic
   close(cmd);
   cmd = "zcat " indb "dic_prl.gz";
   while ((cmd|getline) > 0) {

      if ($1~ "-") { dichyph [$1] };

      if($2~  /^прл_ед_жен_/ ){
        if ($2~ /^прл_ед_жен_тв$/ && $2~ /ю$/       ){  pl_edze_tv        [$1]=""; continue };
        if ($2~ /^прл_ед_жен_тв$/ && $2~ /й$/       ){  pl_edze_dr        [$1]=""; continue };
        if ($2~ /^прл_ед_жен_вин$/                  ){  pl_edze_dr        [$1]=""; continue };
        if ($2~ /^прл_ед_жен_дат$/                  ){  pl_edze_dr        [$1]=""; continue };
        if ($2~ /^прл_ед_жен_им$/                   ){  pl_edze_im        [$1]=""; continue };
        if ($2~ /^прл_ед_жен_пр$/                   ){  pl_edze_dr        [$1]=""; continue };
        if ($2~ /^прл_ед_жен_род$/                  ){  pl_edze_dr        [$1]=""; continue };
      };                                                                  
      if($2~  /^прл_ед_муж_/ ){                                           
        if ($2~ /^прл_ед_муж_вин_неод$/             ){  pl_edmu_im        [$1]=""; continue };
        if ($2~ /^прл_ед_муж_вин_одуш$/             ){  pl_edmu_ro        [$1]=""; continue };
        if ($2~ /^прл_ед_муж_дат$/                  ){  pl_edmu_da        [$1]=""; continue };
        if ($2~ /^прл_ед_муж_им$/                   ){  pl_edmu_im        [$1]=""; continue };
        if ($2~ /^прл_ед_муж_пр$/                   ){  pl_edmu_pr        [$1]=""; continue };
        if ($2~ /^прл_ед_муж_род$/                  ){  pl_edmu_ro        [$1]=""; continue };
        if ($2~ /^прл_ед_муж_тв$/                   ){  pl_edmu_tv        [$1]=""; continue };
      };                                                                  
      if($2~  /^прл_ед_ср_/ ){                                            
        if ($2~ /^прл_ед_ср_вин$/                   ){  pl_edsr_im        [$1]=""; continue };
        if ($2~ /^прл_ед_ср_дат$/                   ){  pl_edsr_da        [$1]=""; continue };
        if ($2~ /^прл_ед_ср_им$/                    ){  pl_edsr_im        [$1]=""; continue };
        if ($2~ /^прл_ед_ср_пр$/                    ){  pl_edsr_pr        [$1]=""; continue };
        if ($2~ /^прл_ед_ср_род$/                   ){  pl_edsr_ro        [$1]=""; continue };
        if ($2~ /^прл_ед_ср_тв$/                    ){  pl_edsr_tv        [$1]=""; continue };
      };
      if($2~  /^прл_мн_/ ){
        if ($2~ /^прл_мн_вин_неод$/                 ){  pl_mn_im          [$1]=""; continue };
        if ($2~ /^прл_мн_вин_одуш$/                 ){  pl_mn_ro          [$1]=""; continue };
        if ($2~ /^прл_мн_дат$/                      ){  pl_mn_da          [$1]=""; continue };
        if ($2~ /^прл_мн_им$/                       ){  pl_mn_im          [$1]=""; continue };
        if ($2~ /^прл_мн_пр$/                       ){  pl_mn_ro          [$1]=""; continue };
        if ($2~ /^прл_мн_род$/                      ){  pl_mn_ro          [$1]=""; continue };
        if ($2~ /^прл_мн_тв$/                       ){  pl_mn_tv          [$1]=""; continue };
      };
        if ($2~ /^прл_сравн$/                       ){  pl_srv            [$1]=""; continue };
      if($2~  /^прл_крат_/ ){
        if ($2~ /^прл_крат_ед_муж$/                 ){  pl_kred_mu        [$1]=""; continue };
        if ($2~ /^прл_крат_ед_жен$/                 ){  pl_kred_ze        [$1]=""; continue };
        if ($2~ /^прл_крат_ед_ср$/                  ){  pl_kred_sr        [$1]=""; continue };
        if ($2~ /^прл_крат_мн$/                     ){  pl_krmn           [$1]=""; continue };
      };
      if($2~  /^прл_прев_ед_жен_/ ){
        if ($2~ /^прл_прев_ед_жен_тв$/ && $2~ /ю$/  ){  pl_pv_edze_tv     [$1]=""; continue };
        if ($2~ /^прл_прев_ед_жен_тв$/ && $2~ /й$/  ){  pl_pv_edze_dr     [$1]=""; continue };
        if ($2~ /^прл_прев_ед_жен_вин$/             ){  pl_pv_edze_dr     [$1]=""; continue };
        if ($2~ /^прл_прев_ед_жен_дат$/             ){  pl_pv_edze_dr     [$1]=""; continue };
        if ($2~ /^прл_прев_ед_жен_им$/              ){  pl_pv_edze_im     [$1]=""; continue };
        if ($2~ /^прл_прев_ед_жен_пр$/              ){  pl_pv_edze_dr     [$1]=""; continue };
        if ($2~ /^прл_прев_ед_жен_род$/             ){  pl_pv_edze_dr     [$1]=""; continue };
      };
      if($2~  /^прл_прев_ед_муж_/ ){
        if ($2~ /^прл_прев_ед_муж_вин_неод$/        ){  pl_pv_edmu_im     [$1]=""; continue };
        if ($2~ /^прл_прев_ед_муж_вин_одуш$/        ){  pl_pv_edmu_ro     [$1]=""; continue };
        if ($2~ /^прл_прев_ед_муж_дат$/             ){  pl_pv_edmu_da     [$1]=""; continue };
        if ($2~ /^прл_прев_ед_муж_им$/              ){  pl_pv_edmu_im     [$1]=""; continue };
        if ($2~ /^прл_прев_ед_муж_пр$/              ){  pl_pv_edmu_pr     [$1]=""; continue };
        if ($2~ /^прл_прев_ед_муж_род$/             ){  pl_pv_edmu_ro     [$1]=""; continue };
        if ($2~ /^прл_прев_ед_муж_тв$/              ){  pl_pv_edmu_tv     [$1]=""; continue };
      };                                                                  
      if($2~  /^прл_прев_ед_ср_/ ){                                       
        if ($2~ /^прл_прев_ед_ср_вин$/              ){  pl_pv_edsr_im     [$1]=""; continue };
        if ($2~ /^прл_прев_ед_ср_дат$/              ){  pl_pv_edsr_da     [$1]=""; continue };
        if ($2~ /^прл_прев_ед_ср_им$/               ){  pl_pv_edsr_im     [$1]=""; continue };
        if ($2~ /^прл_прев_ед_ср_пр$/               ){  pl_pv_edsr_pr     [$1]=""; continue };
        if ($2~ /^прл_прев_ед_ср_род$/              ){  pl_pv_edsr_ro     [$1]=""; continue };
        if ($2~ /^прл_прев_ед_ср_тв$/               ){  pl_pv_edsr_tv     [$1]=""; continue };
      };
      if($2~  /^прл_прев_мн_/ ){
        if ($2~ /^прл_прев_мн_вин_неод$/            ){  pl_pv_mn_im       [$1]=""; continue };
        if ($2~ /^прл_прев_мн_вин_одуш$/            ){  pl_pv_mn_ro       [$1]=""; continue };
        if ($2~ /^прл_прев_мн_дат$/                 ){  pl_pv_mn_da       [$1]=""; continue };
        if ($2~ /^прл_прев_мн_им$/                  ){  pl_pv_mn_im       [$1]=""; continue };
        if ($2~ /^прл_прев_мн_пр$/                  ){  pl_pv_mn_pr       [$1]=""; continue };
        if ($2~ /^прл_прев_мн_род$/                 ){  pl_pv_mn_ro       [$1]=""; continue };
        if ($2~ /^прл_прев_мн_тв$/                  ){  pl_pv_mn_tv       [$1]=""; continue };
      };
        if ($2~ /^прл_неизм$/                       ){  pl_neiz           [$1]=""; continue };
    }; # чтение prl-dic
   close(cmd);
   cmd = "zcat " indb "dic_suw.gz";
   while ((cmd|getline) > 0) {

      if ($1~ "-") { dichyph [$1] };

      if ($2~ /^сущ_неод_/ ) {
       if ($2~ /^сущ_неод_мн_/ ) {
        if ($2~ /^сущ_неод_мн_вин$/                 ){  swn_mn_im         [$1]=""; continue };
        if ($2~ /^сущ_неод_мн_дат$/                 ){  swn_mn_da         [$1]=""; continue };
        if ($2~ /^сущ_неод_мн_им$/                  ){  swn_mn_im         [$1]=""; continue };
        if ($2~ /^сущ_неод_мн_пр$/                  ){  swn_mn_pr         [$1]=""; continue };
        if ($2~ /^сущ_неод_мн_род$/                 ){  swn_mn_ro         [$1]=""; continue };
        if ($2~ /^сущ_неод_мн_тв$/                  ){  swn_mn_tv         [$1]=""; continue };
        if ($2~ /^сущ_неод_мн_нескл$/               ){  swn_mn_ne         [$1]=""; continue };
        if ($2~ /^сущ_неод_мн_счет$/                ){  swn_mn_sq         [$1]=""; continue };
       };                                                                 
       if ($2~ /^сущ_неод_ед_жен_/ ) {                                    
        if ($2~ /^сущ_неод_ед_жен_тв$/              ){  swn_edze_tv       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_жен_вин$/             ){  swn_edze_vi       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_жен_дат$/             ){  swn_edze_da       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_жен_им$/              ){  swn_edze_im       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_жен_пр$/              ){  swn_edze_pr       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_жен_род$/             ){  swn_edze_ro       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_жен_нескл$/           ){  swn_edze_ne       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_жен_мест$/            ){  swn_edze_me       [$1]=""; continue };
       };                                                                 
       if ($2~ /^сущ_неод_ед_муж_/ ) {                                    
        if ($2~ /^сущ_неод_ед_муж_вин$/             ){  swn_edmu_im       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_муж_дат$/             ){  swn_edmu_da       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_муж_им$/              ){  swn_edmu_im       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_муж_пр$/              ){  swn_edmu_pr       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_муж_род$/             ){  swn_edmu_ro       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_муж_тв$/              ){  swn_edmu_tv       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_муж_нескл$/           ){  swn_edmu_ne       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_муж_мест$/            ){  swn_edmu_me       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_муж_парт$/            ){  swn_edmu_pt       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_муж_счет$/            ){  swn_edmu_sq       [$1]=""; continue };
       };                                                                 
       if ($2~ /^сущ_неод_ед_ср_/ ) {                                     
        if ($2~ /^сущ_неод_ед_ср_вин$/              ){  swn_edsr_vi       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_ср_дат$/              ){  swn_edsr_da       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_ср_им$/               ){  swn_edsr_im       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_ср_пр$/               ){  swn_edsr_pr       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_ср_род$/              ){  swn_edsr_ro       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_ср_тв$/               ){  swn_edsr_tv       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_ср_нескл$/            ){  swn_edsr_ne       [$1]=""; continue };
       };                                                                 
        if ($2~ /^сущ_неод_ед_общ_вин$/             ){  swn_edob_vi       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_общ_дат$/             ){  swn_edob_da       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_общ_им$/              ){  swn_edob_im       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_общ_нескл$/           ){  swn_edob_ne       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_общ_пр$/              ){  swn_edob_pr       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_общ_род$/             ){  swn_edob_ro       [$1]=""; continue };
        if ($2~ /^сущ_неод_ед_общ_тв$/              ){  swn_edob_tv       [$1]=""; continue };
      };                                                                  
      if ($2~ /^сущ_одуш_/ ) {                                            
       if ($2~ /^сущ_одуш_мн_/ ) {                                        
        if ($2~ /^сущ_одуш_мн_вин$/                 ){  swo_mn_ro         [$1]=""; continue };
        if ($2~ /^сущ_одуш_мн_дат$/                 ){  swo_mn_da         [$1]=""; continue };
        if ($2~ /^сущ_одуш_мн_им$/                  ){  swo_mn_im         [$1]=""; continue };
        if ($2~ /^сущ_одуш_мн_пр$/                  ){  swo_mn_pr         [$1]=""; continue };
        if ($2~ /^сущ_одуш_мн_род$/                 ){  swo_mn_ro         [$1]=""; continue };
        if ($2~ /^сущ_одуш_мн_тв$/                  ){  swo_mn_tv         [$1]=""; continue };
        if ($2~ /^сущ_одуш_мн_нескл$/               ){  swo_mn_ne         [$1]=""; continue };
        if ($2~ /^сущ_одуш_мн_счет$/                ){  swo_mn_sq         [$1]=""; continue };
       };                                                                 
       if ($2~ /^сущ_одуш_ед_муж_/ ) {                                    
        if ($2~ /^сущ_одуш_ед_муж_вин$/             ){  swo_edmu_ro       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_муж_дат$/             ){  swo_edmu_da       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_муж_им$/              ){  swo_edmu_im       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_муж_пр$/              ){  swo_edmu_pr       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_муж_род$/             ){  swo_edmu_ro       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_муж_тв$/              ){  swo_edmu_tv       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_муж_нескл$/           ){  swo_edmu_ne       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_муж_зват$/            ){  swo_edmu_zv       [$1]=""; continue };
       };                                                                 
       if ($2~ /^сущ_одуш_ед_жен_/ ) {                                    
        if ($2~ /^сущ_одуш_ед_жен_тв$/              ){  swo_edze_tv       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_жен_вин$/             ){  swo_edze_vi       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_жен_дат$/             ){  swo_edze_da       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_жен_им$/              ){  swo_edze_im       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_жен_пр$/              ){  swo_edze_pr       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_жен_род$/             ){  swo_edze_ro       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_жен_нескл$/           ){  swo_edze_ne       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_жен_зват$/            ){  swo_edze_zv       [$1]=""; continue };
       };                                                                 
       if ($2~ /^сущ_одуш_ед_общ_/ ) {                                    
        if ($2~ /^сущ_одуш_ед_общ_тв$/              ){  swo_edob_tv       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_общ_вин$/             ){  swo_edob_vi       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_общ_дат$/             ){  swo_edob_da       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_общ_им$/              ){  swo_edob_im       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_общ_пр$/              ){  swo_edob_pr       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_общ_род$/             ){  swo_edob_ro       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_общ_нескл$/           ){  swo_edob_ne       [$1]=""; continue };
       };                                                                 
       if ($2~ /^сущ_одуш_ед_ср_/ ) {                                     
        if ($2~ /^сущ_одуш_ед_ср_вин$/              ){  swo_edsr_vi       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_ср_дат$/              ){  swo_edsr_da       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_ср_им$/               ){  swo_edsr_im       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_ср_пр$/               ){  swo_edsr_pr       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_ср_род$/              ){  swo_edsr_ro       [$1]=""; continue };
        if ($2~ /^сущ_одуш_ед_ср_тв$/               ){  swo_edsr_tv       [$1]=""; continue };
       };                                                                 
      };                                                                  
      if ($2~ /^сущ_мн_/ ) {                                              
        if ($2~ /^сущ_мн_дат$/                      ){  sw_mn_da          [$1]=""; continue };
        if ($2~ /^сущ_мн_им$/                       ){  sw_mn_im          [$1]=""; continue };
        if ($2~ /^сущ_мн_пр$/                       ){  sw_mn_pr          [$1]=""; continue };
        if ($2~ /^сущ_мн_род$/                      ){  sw_mn_ro          [$1]=""; continue };
        if ($2~ /^сущ_мн_тв$/                       ){  sw_mn_tv          [$1]=""; continue };
        if ($2~ /^сущ_мн_вин$/                      ){  sw_mn_vi          [$1]=""; continue };
        if ($2~ /^сущ_мн_нескл$/                    ){  sw_mn_ne          [$1]=""; continue };
      };                                                                  
      if ($2~ /^сущ_ед_жен_/ ) {                                          
        if ($2~ /^сущ_ед_жен_тв$/                   ){  sw_edze_tv        [$1]=""; continue };
        if ($2~ /^сущ_ед_жен_вин$/                  ){  sw_edze_vi        [$1]=""; continue };
        if ($2~ /^сущ_ед_жен_дат$/                  ){  sw_edze_da        [$1]=""; continue };
        if ($2~ /^сущ_ед_жен_им$/                   ){  sw_edze_im        [$1]=""; continue };
        if ($2~ /^сущ_ед_жен_пр$/                   ){  sw_edze_pr        [$1]=""; continue };
        if ($2~ /^сущ_ед_жен_род$/                  ){  sw_edze_ro        [$1]=""; continue };
       };                                                                 
       if ($2~ /^сущ_ед_муж_/ ) {                                         
        if ($2~ /^сущ_ед_муж_дат$/                  ){  sw_edmu_da        [$1]=""; continue };
        if ($2~ /^сущ_ед_муж_им$/                   ){  sw_edmu_im        [$1]=""; continue };
        if ($2~ /^сущ_ед_муж_пр$/                   ){  sw_edmu_pr        [$1]=""; continue };
        if ($2~ /^сущ_ед_муж_род$/                  ){  sw_edmu_ro        [$1]=""; continue };
        if ($2~ /^сущ_ед_муж_тв$/                   ){  sw_edmu_tv        [$1]=""; continue };
        if ($2~ /^сущ_ед_муж_вин$/                  ){  sw_edmu_vi        [$1]=""; continue };
        if ($2~ /^сущ_ед_муж_нескл$/                ){  sw_edmu_ne        [$1]=""; continue };
       };                                                                 
       if ($2~ /^сущ_ед_общ_/ ) {                                         
        if ($2~ /^сущ_ед_общ_нескл$/                ){  sw_edob_ne        [$1]=""; continue };
        if ($2~ /^сущ_ед_общ_вин$/                  ){  sw_edob_vi        [$1]=""; continue };
        if ($2~ /^сущ_ед_общ_дат$/                  ){  sw_edob_da        [$1]=""; continue };
        if ($2~ /^сущ_ед_общ_им$/                   ){  sw_edob_im        [$1]=""; continue };
        if ($2~ /^сущ_ед_общ_пр$/                   ){  sw_edob_pr        [$1]=""; continue };
        if ($2~ /^сущ_ед_общ_род$/                  ){  sw_edob_ro        [$1]=""; continue };
        if ($2~ /^сущ_ед_общ_тв$/                   ){  sw_edob_tv        [$1]=""; continue };
       };                                                                 
       if ($2~ /^сущ_ед_ср_/ ) {                                          
        if ($2~ /^сущ_ед_ср_вин$/                   ){  sw_edsr_vi        [$1]=""; continue };
        if ($2~ /^сущ_ед_ср_дат$/                   ){  sw_edsr_da        [$1]=""; continue };
        if ($2~ /^сущ_ед_ср_им$/                    ){  sw_edsr_im        [$1]=""; continue };
        if ($2~ /^сущ_ед_ср_пр$/                    ){  sw_edsr_pr        [$1]=""; continue };
        if ($2~ /^сущ_ед_ср_род$/                   ){  sw_edsr_ro        [$1]=""; continue };
        if ($2~ /^сущ_ед_ср_тв$/                    ){  sw_edsr_tv        [$1]=""; continue };
      };
    }; # чтение suw-dic
   close(cmd);
   cmd = "zcat " indb "dic_gl.gz";
   while ((cmd|getline) > 0) {

      if ($1~ "-") { dichyph [$1] };

      if($2~  /^гл_несов_непер_/ ){

        if ($2~ /^гл_несов_непер_воз_инф$/          ){  gn_vz_ne_in       [$1]=""; continue };

       if ($2~ /^гл_несов_непер_воз_наст_/ ) {
        if ($2~ /^гл_несов_непер_воз_наст_ед_1е$/   ){  gn_vz_nena_e1     [$1]=""; continue };
        if ($2~ /^гл_несов_непер_воз_наст_ед_2е$/   ){  gn_vz_nena_e2     [$1]=""; continue };
        if ($2~ /^гл_несов_непер_воз_наст_ед_3е$/   ){  gn_vz_nena_e3     [$1]=""; continue };
        if ($2~ /^гл_несов_непер_воз_наст_мн_1е$/   ){  gn_vz_nena_m1     [$1]=""; continue };
        if ($2~ /^гл_несов_непер_воз_наст_мн_2е$/   ){  gn_vz_nena_m2     [$1]=""; continue };
        if ($2~ /^гл_несов_непер_воз_наст_мн_3е$/   ){  gn_vz_nena_m3     [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_несов_непер_воз_пов_ед$/       ){  gn_vz_nepo_ed     [$1]=""; continue };
        if ($2~ /^гл_несов_непер_воз_пов_мн$/       ){  gn_vz_nepo_mn     [$1]=""; continue };
                                                             
       if ($2~ /^гл_несов_непер_воз_прош_/ ) {               
        if ($2~ /^гл_несов_непер_воз_прош_ед_жен$/  ){  gn_vz_nepa_edze   [$1]=""; continue };
        if ($2~ /^гл_несов_непер_воз_прош_ед_муж$/  ){  gn_vz_nepa_edmu   [$1]=""; continue };
        if ($2~ /^гл_несов_непер_воз_прош_ед_ср$/   ){  gn_vz_nepa_edsr   [$1]=""; continue };
        if ($2~ /^гл_несов_непер_воз_прош_мн$/      ){  gn_vz_nepa_mn     [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_несов_непер_инф$/              ){  gn_nein           [$1]=""; continue };
                                                                          
       if ($2~ /^гл_несов_непер_наст_/ ) {                                
        if ($2~ /^гл_несов_непер_наст_ед_1е$/       ){  gn_nena_e1        [$1]=""; continue };
        if ($2~ /^гл_несов_непер_наст_ед_2е$/       ){  gn_nena_e2        [$1]=""; continue };
        if ($2~ /^гл_несов_непер_наст_ед_3е$/       ){  gn_nena_e3        [$1]=""; continue };
        if ($2~ /^гл_несов_непер_наст_мн_1е$/       ){  gn_nena_m1        [$1]=""; continue };
        if ($2~ /^гл_несов_непер_наст_мн_2е$/       ){  gn_nena_m2        [$1]=""; continue };
        if ($2~ /^гл_несов_непер_наст_мн_3е$/       ){  gn_nena_m3        [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_несов_непер_пов_ед$/           ){  gn_nepo_ed        [$1]=""; continue };
        if ($2~ /^гл_несов_непер_пов_мн$/           ){  gn_nepo_mn        [$1]=""; continue };

       if ($2~ /^гл_несов_непер_прош_/ ) {
        if ($2~ /^гл_несов_непер_прош_ед_жен$/      ){  gn_nepa_edze      [$1]=""; continue };
        if ($2~ /^гл_несов_непер_прош_ед_муж$/      ){  gn_nepa_edmu      [$1]=""; continue };
        if ($2~ /^гл_несов_непер_прош_ед_ср$/       ){  gn_nepa_edsr      [$1]=""; continue };
        if ($2~ /^гл_несов_непер_прош_мн$/          ){  gn_nepa_mn        [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_несов_непер_инф_безл$/         ){  gn_nein_bz        [$1]=""; continue };
        if ($2~ /^гл_несов_непер_воз_инф_безл$/     ){  gn_vz_nein_bz     [$1]=""; continue };
                                                                          
      };                                                                  
      if($2~  /^гл_несов_перех_/ ){                                       
                                                                          
        if ($2~ /^гл_несов_перех_инф$/              ){  gn_pein           [$1]=""; continue };
                                                                          
       if ($2~ /^гл_несов_перех_наст_/ ) {                                
        if ($2~ /^гл_несов_перех_наст_ед_1е$/       ){  gn_pena_e1        [$1]=""; continue };
        if ($2~ /^гл_несов_перех_наст_ед_2е$/       ){  gn_pena_e2        [$1]=""; continue };
        if ($2~ /^гл_несов_перех_наст_ед_3е$/       ){  gn_pena_e3        [$1]=""; continue };
        if ($2~ /^гл_несов_перех_наст_мн_1е$/       ){  gn_pena_m1        [$1]=""; continue };
        if ($2~ /^гл_несов_перех_наст_мн_2е$/       ){  gn_pena_m2        [$1]=""; continue };
        if ($2~ /^гл_несов_перех_наст_мн_3е$/       ){  gn_pena_m3        [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_несов_перех_пов_ед$/           ){  gn_pepo_ed        [$1]=""; continue };
        if ($2~ /^гл_несов_перех_пов_мн$/           ){  gn_pepo_mn        [$1]=""; continue };

       if ($2~ /^гл_несов_перех_прош_/ ) {
        if ($2~ /^гл_несов_перех_прош_ед_жен$/      ){  gn_pepa_edze      [$1]=""; continue };
        if ($2~ /^гл_несов_перех_прош_ед_муж$/      ){  gn_pepa_edmu      [$1]=""; continue };
        if ($2~ /^гл_несов_перех_прош_ед_ср$/       ){  gn_pepa_edsr      [$1]=""; continue };
        if ($2~ /^гл_несов_перех_прош_мн$/          ){  gn_pepa_mn        [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_несов_перех_инф_безл$/         ){  gn_pein_bz        [$1]=""; continue };
      };                                                                  
      if($2~  /^гл_несов_перне_/ ){                                       
                                                                          
        if ($2~ /^гл_несов_перне_инф$/              ){  gn_pnin           [$1]=""; continue };
                                                                          
       if ($2~ /^гл_несов_перне_наст_/ ) {                                
        if ($2~ /^гл_несов_перне_наст_ед_1е$/       ){  gn_pnna_e1        [$1]=""; continue };
        if ($2~ /^гл_несов_перне_наст_ед_2е$/       ){  gn_pnna_e2        [$1]=""; continue };
        if ($2~ /^гл_несов_перне_наст_ед_3е$/       ){  gn_pnna_e3        [$1]=""; continue };
        if ($2~ /^гл_несов_перне_наст_мн_1е$/       ){  gn_pnna_m1        [$1]=""; continue };
        if ($2~ /^гл_несов_перне_наст_мн_2е$/       ){  gn_pnna_m2        [$1]=""; continue };
        if ($2~ /^гл_несов_перне_наст_мн_3е$/       ){  gn_pnna_m3        [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_несов_перне_пов_ед$/           ){  gn_pnpo_ed        [$1]=""; continue };
        if ($2~ /^гл_несов_перне_пов_мн$/           ){  gn_pnpo_mn        [$1]=""; continue };

       if ($2~ /^гл_несов_перне_прош_/ ) {
        if ($2~ /^гл_несов_перне_прош_ед_жен$/      ){  gn_pnpa_edze      [$1]=""; continue };
        if ($2~ /^гл_несов_перне_прош_ед_муж$/      ){  gn_pnpa_edmu      [$1]=""; continue };
        if ($2~ /^гл_несов_перне_прош_ед_ср$/       ){  gn_pnpa_edsr      [$1]=""; continue };
        if ($2~ /^гл_несов_перне_прош_мн$/          ){  gn_pnpa_mn        [$1]=""; continue };
       };                                                                 
      };                                                                  
      if($2~  /^гл_сов_непер_/ ){                                         
       if ($2~ /^гл_сов_непер_буд_/ ) {                                   
        if ($2~ /^гл_сов_непер_буд_ед_1е$/          ){  gs_nebu_e1        [$1]=""; continue };
        if ($2~ /^гл_сов_непер_буд_ед_2е$/          ){  gs_nebu_e2        [$1]=""; continue };
        if ($2~ /^гл_сов_непер_буд_ед_3е$/          ){  gs_nebu_e3        [$1]=""; continue };
        if ($2~ /^гл_сов_непер_буд_мн_1е$/          ){  gs_nebu_m1        [$1]=""; continue };
        if ($2~ /^гл_сов_непер_буд_мн_2е$/          ){  gs_nebu_m2        [$1]=""; continue };
        if ($2~ /^гл_сов_непер_буд_мн_3е$/          ){  gs_nebu_m3        [$1]=""; continue };
       };                                                                 
       if ($2~ /^гл_сов_непер_воз_буд_/ ) {                               
        if ($2~ /^гл_сов_непер_воз_буд_ед_1е$/      ){  gs_vz_nebu_e1     [$1]=""; continue };
        if ($2~ /^гл_сов_непер_воз_буд_ед_2е$/      ){  gs_vz_nebu_e2     [$1]=""; continue };
        if ($2~ /^гл_сов_непер_воз_буд_ед_3е$/      ){  gs_vz_nebu_e3     [$1]=""; continue };
        if ($2~ /^гл_сов_непер_воз_буд_мн_1е$/      ){  gs_vz_nebu_m1     [$1]=""; continue };
        if ($2~ /^гл_сов_непер_воз_буд_мн_2е$/      ){  gs_vz_nebu_m2     [$1]=""; continue };
        if ($2~ /^гл_сов_непер_воз_буд_мн_3е$/      ){  gs_vz_nebu_m3     [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_сов_непер_воз_инф$/            ){  gs_vz_nein        [$1]=""; continue };
        if ($2~ /^гл_сов_непер_воз_пов_ед$/         ){  gs_vz_nepo_ed     [$1]=""; continue };
        if ($2~ /^гл_сов_непер_воз_пов_мн$/         ){  gs_vz_nepo_mn     [$1]=""; continue };
                                                                          
       if ($2~ /^гл_сов_непер_воз_прош_/ ) {                              
        if ($2~ /^гл_сов_непер_воз_прош_ед_жен$/    ){  gs_vz_nepa_edze   [$1]=""; continue };
        if ($2~ /^гл_сов_непер_воз_прош_ед_муж$/    ){  gs_vz_nepa_edmu   [$1]=""; continue };
        if ($2~ /^гл_сов_непер_воз_прош_ед_ср$/     ){  gs_vz_nepa_edsr   [$1]=""; continue };
        if ($2~ /^гл_сов_непер_воз_прош_мн$/        ){  gs_vz_nepa_mn     [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_сов_непер_инф$/                ){  gs_nein           [$1]=""; continue };
        if ($2~ /^гл_сов_непер_пов_ед$/             ){  gs_nepo_ed        [$1]=""; continue };
        if ($2~ /^гл_сов_непер_пов_мн$/             ){  gs_nepo_mn        [$1]=""; continue };

       if ($2~ /^гл_сов_непер_прош_/ ) {
        if ($2~ /^гл_сов_непер_прош_ед_жен$/        ){  gs_nepa_edze      [$1]=""; continue };
        if ($2~ /^гл_сов_непер_прош_ед_муж$/        ){  gs_nepa_edmu      [$1]=""; continue };
        if ($2~ /^гл_сов_непер_прош_ед_ср$/         ){  gs_nepa_edsr      [$1]=""; continue };
        if ($2~ /^гл_сов_непер_прош_мн$/            ){  gs_nepa_mn        [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_сов_непер_воз_инф_безл$/       ){  gs_vz_nein_bz     [$1]=""; continue };
        if ($2~ /^гл_сов_непер_инф_безл$/           ){  gs_nein_bz        [$1]=""; continue };
      };                                                                  
      if($2~  /^гл_сов_перех_/ ){                                         
       if ($2~ /^гл_сов_перех_буд_/ ) {                                   
        if ($2~ /^гл_сов_перех_буд_ед_1е$/          ){  gs_pebu_e1        [$1]=""; continue };
        if ($2~ /^гл_сов_перех_буд_ед_2е$/          ){  gs_pebu_e2        [$1]=""; continue };
        if ($2~ /^гл_сов_перех_буд_ед_3е$/          ){  gs_pebu_e3        [$1]=""; continue };
        if ($2~ /^гл_сов_перех_буд_мн_1е$/          ){  gs_pebu_m1        [$1]=""; continue };
        if ($2~ /^гл_сов_перех_буд_мн_2е$/          ){  gs_pebu_m2        [$1]=""; continue };
        if ($2~ /^гл_сов_перех_буд_мн_3е$/          ){  gs_pebu_m3        [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_сов_перех_инф$/                ){  gs_pein           [$1]=""; continue };
        if ($2~ /^гл_сов_перех_пов_ед$/             ){  gs_pepo_ed        [$1]=""; continue };
        if ($2~ /^гл_сов_перех_пов_мн$/             ){  gs_pepo_mn        [$1]=""; continue };

       if ($2~ /^гл_сов_перех_прош_/ ) {
        if ($2~ /^гл_сов_перех_прош_ед_жен$/        ){  gs_pepa_edze      [$1]=""; continue };
        if ($2~ /^гл_сов_перех_прош_ед_муж$/        ){  gs_pepa_edmu      [$1]=""; continue };
        if ($2~ /^гл_сов_перех_прош_ед_ср$/         ){  gs_pepa_edsr      [$1]=""; continue };
        if ($2~ /^гл_сов_перех_прош_мн$/            ){  gs_pepa_mn        [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_сов_перех_инф_безл$/           ){  gs_pein_bz        [$1]=""; continue };
      };                                                                  
      if($2~  /^гл_сов_перне_/ ){                                         
       if ($2~ /^гл_сов_перне_буд_/ ) {                                   
        if ($2~ /^гл_сов_перне_буд_ед_1е$/          ){  gs_pnbu_e1        [$1]=""; continue };
        if ($2~ /^гл_сов_перне_буд_ед_2е$/          ){  gs_pnbu_e2        [$1]=""; continue };
        if ($2~ /^гл_сов_перне_буд_ед_3е$/          ){  gs_pnbu_e3        [$1]=""; continue };
        if ($2~ /^гл_сов_перне_буд_мн_1е$/          ){  gs_pnbu_m1        [$1]=""; continue };
        if ($2~ /^гл_сов_перне_буд_мн_2е$/          ){  gs_pnbu_m2        [$1]=""; continue };
        if ($2~ /^гл_сов_перне_буд_мн_3е$/          ){  gs_pnbu_m3        [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_сов_перне_инф$/                ){  gs_pnin           [$1]=""; continue };
        if ($2~ /^гл_сов_перне_пов_ед$/             ){  gs_pnpo_ed        [$1]=""; continue };
        if ($2~ /^гл_сов_перне_пов_мн$/             ){  gs_pnpo_mn        [$1]=""; continue };

       if ($2~ /^гл_сов_перне_прош_/ ) {
        if ($2~ /^гл_сов_перне_прош_ед_жен$/        ){  gs_pnpa_edze      [$1]=""; continue };
        if ($2~ /^гл_сов_перне_прош_ед_муж$/        ){  gs_pnpa_edmu      [$1]=""; continue };
        if ($2~ /^гл_сов_перне_прош_ед_ср$/         ){  gs_pnpa_edsr      [$1]=""; continue };
        if ($2~ /^гл_сов_перне_прош_мн$/            ){  gs_pnpa_mn        [$1]=""; continue };
       };                                                                 
      };                                                                  
      if($2~  /^гл_2вид_перех_/ ){                                        
       if ($2~ /^гл_2вид_перех_буд_/ ) {                                  
        if ($2~ /^гл_2вид_перех_буд_ед_1е$/         ){  g2_pebu_e1        [$1]=""; continue };
        if ($2~ /^гл_2вид_перех_буд_ед_2е$/         ){  g2_pebu_e2        [$1]=""; continue };
        if ($2~ /^гл_2вид_перех_буд_ед_3е$/         ){  g2_pebu_e3        [$1]=""; continue };
        if ($2~ /^гл_2вид_перех_буд_мн_1е$/         ){  g2_pebu_m1        [$1]=""; continue };
        if ($2~ /^гл_2вид_перех_буд_мн_2е$/         ){  g2_pebu_m2        [$1]=""; continue };
        if ($2~ /^гл_2вид_перех_буд_мн_3е$/         ){  g2_pebu_m3        [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_2вид_перех_инф$/               ){  g2_pein           [$1]=""; continue };
                                                                          
       if ($2~ /^гл_2вид_перех_наст_/ ) {                                 
        if ($2~ /^гл_2вид_перех_наст_ед_1е$/        ){  g2_pena_e1        [$1]=""; continue };
        if ($2~ /^гл_2вид_перех_наст_ед_2е$/        ){  g2_pena_e2        [$1]=""; continue };
        if ($2~ /^гл_2вид_перех_наст_ед_3е$/        ){  g2_pena_e3        [$1]=""; continue };
        if ($2~ /^гл_2вид_перех_наст_мн_1е$/        ){  g2_pena_m1        [$1]=""; continue };
        if ($2~ /^гл_2вид_перех_наст_мн_2е$/        ){  g2_pena_m2        [$1]=""; continue };
        if ($2~ /^гл_2вид_перех_наст_мн_3е$/        ){  g2_pena_m3        [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_2вид_перех_пов_ед$/            ){  g2_pepo_ed        [$1]=""; continue };
        if ($2~ /^гл_2вид_перех_пов_мн$/            ){  g2_pepo_mn        [$1]=""; continue };

       if ($2~ /^гл_2вид_перех_прош_/ ) {
        if ($2~ /^гл_2вид_перех_прош_ед_жен$/       ){  g2_pepa_edze      [$1]=""; continue };
        if ($2~ /^гл_2вид_перех_прош_ед_муж$/       ){  g2_pepa_edmu      [$1]=""; continue };
        if ($2~ /^гл_2вид_перех_прош_ед_ср$/        ){  g2_pepa_edsr      [$1]=""; continue };
        if ($2~ /^гл_2вид_перех_прош_мн$/           ){  g2_pepa_mn        [$1]=""; continue };
       };                                                                 
      };                                                                  
      if($2~  /^гл_2вид_непер_/ ){                                        
       if ($2~ /^гл_2вид_непер_буд_/ ) {                                  
        if ($2~ /^гл_2вид_непер_буд_ед_1е$/         ){  g2_nebu_e1        [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_буд_ед_2е$/         ){  g2_nebu_e2        [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_буд_ед_3е$/         ){  g2_nebu_e3        [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_буд_мн_1е$/         ){  g2_nebu_m1        [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_буд_мн_2е$/         ){  g2_nebu_m2        [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_буд_мн_3е$/         ){  g2_nebu_m3        [$1]=""; continue };
       };                                                                 
       if ($2~ /^гл_2вид_непер_воз_буд_/ ) {                              
        if ($2~ /^гл_2вид_непер_воз_буд_ед_1е$/     ){  g2_vz_nebu_e1     [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_воз_буд_ед_2е$/     ){  g2_vz_nebu_e2     [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_воз_буд_ед_3е$/     ){  g2_vz_nebu_e3     [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_воз_буд_мн_1е$/     ){  g2_vz_nebu_m1     [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_воз_буд_мн_2е$/     ){  g2_vz_nebu_m2     [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_воз_буд_мн_3е$/     ){  g2_vz_nebu_m3     [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_2вид_непер_воз_инф$/           ){  g2_vz_nein        [$1]=""; continue };
                                                                          
       if ($2~ /^гл_2вид_непер_воз_наст_/ ) {                             
        if ($2~ /^гл_2вид_непер_воз_наст_ед_1е$/    ){  g2_vz_nena_e1     [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_воз_наст_ед_2е$/    ){  g2_vz_nena_e2     [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_воз_наст_ед_3е$/    ){  g2_vz_nena_e3     [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_воз_наст_мн_1е$/    ){  g2_vz_nena_m1     [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_воз_наст_мн_2е$/    ){  g2_vz_nena_m2     [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_воз_наст_мн_3е$/    ){  g2_vz_nena_m3     [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_2вид_непер_воз_пов_ед$/        ){  g2_vz_nepo_ed     [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_воз_пов_мн$/        ){  g2_vz_nepo_mn     [$1]=""; continue };
                                                             
       if ($2~ /^гл_2вид_непер_воз_прош_/ ) {                
        if ($2~ /^гл_2вид_непер_воз_прош_ед_жен$/   ){  g2_vz_nepa_edze   [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_воз_прош_ед_муж$/   ){  g2_vz_nepa_edmu   [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_воз_прош_ед_ср$/    ){  g2_vz_nepa_edsr   [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_воз_прош_мн$/       ){  g2_vz_nepa_mn     [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_2вид_непер_инф$/               ){  g2_nein           [$1]=""; continue };
                                                                          
       if ($2~ /^гл_2вид_непер_наст_/ ) {                                 
        if ($2~ /^гл_2вид_непер_наст_ед_1е$/        ){  g2_nena_e1        [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_наст_ед_2е$/        ){  g2_nena_e2        [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_наст_ед_3е$/        ){  g2_nena_e3        [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_наст_мн_1е$/        ){  g2_nena_m1        [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_наст_мн_2е$/        ){  g2_nena_m2        [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_наст_мн_3е$/        ){  g2_nena_m3        [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_2вид_непер_пов_ед$/            ){  g2_nepo_ed        [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_пов_мн$/            ){  g2_nepo_mn        [$1]=""; continue };

       if ($2~ /^гл_2вид_непер_прош_/ ) {
        if ($2~ /^гл_2вид_непер_прош_ед_жен$/       ){  g2_nepa_edze      [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_прош_ед_муж$/       ){  g2_nepa_edmu      [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_прош_ед_ср$/        ){  g2_nepa_edsr      [$1]=""; continue };
        if ($2~ /^гл_2вид_непер_прош_мн$/           ){  g2_nepa_mn        [$1]=""; continue };
       };                                                                 
      };                                                                  
      if($2~  /^гл_2вид_перне_/ ){                                        
       if ($2~ /^гл_2вид_перне_буд_/ ) {                                  
        if ($2~ /^гл_2вид_перне_буд_ед_1е$/         ){  g2_pnbu_e1        [$1]=""; continue };
        if ($2~ /^гл_2вид_перне_буд_ед_2е$/         ){  g2_pnbu_e2        [$1]=""; continue };
        if ($2~ /^гл_2вид_перне_буд_ед_3е$/         ){  g2_pnbu_e3        [$1]=""; continue };
        if ($2~ /^гл_2вид_перне_буд_мн_1е$/         ){  g2_pnbu_m1        [$1]=""; continue };
        if ($2~ /^гл_2вид_перне_буд_мн_2е$/         ){  g2_pnbu_m2        [$1]=""; continue };
        if ($2~ /^гл_2вид_перне_буд_мн_3е$/         ){  g2_pnbu_m3        [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_2вид_перне_инф$/               ){  g2_pnin           [$1]=""; continue };
                                                                          
       if ($2~ /^гл_2вид_перне_наст_/ ) {                                 
        if ($2~ /^гл_2вид_перне_наст_ед_1е$/        ){  g2_pnna_e1        [$1]=""; continue };
        if ($2~ /^гл_2вид_перне_наст_ед_2е$/        ){  g2_pnna_e2        [$1]=""; continue };
        if ($2~ /^гл_2вид_перне_наст_ед_3е$/        ){  g2_pnna_e3        [$1]=""; continue };
        if ($2~ /^гл_2вид_перне_наст_мн_1е$/        ){  g2_pnna_m1        [$1]=""; continue };
        if ($2~ /^гл_2вид_перне_наст_мн_2е$/        ){  g2_pnna_m2        [$1]=""; continue };
        if ($2~ /^гл_2вид_перне_наст_мн_3е$/        ){  g2_pnna_m3        [$1]=""; continue };
       };                                                                 
                                                                          
        if ($2~ /^гл_2вид_перне_пов_ед$/            ){  g2_pnpo_ed        [$1]=""; continue };
        if ($2~ /^гл_2вид_перне_пов_мн$/            ){  g2_pnpo_mn        [$1]=""; continue };

       if ($2~ /^гл_2вид_перне_прош_/ ) {
        if ($2~ /^гл_2вид_перне_прош_ед_жен$/       ){  g2_pnpa_edze      [$1]=""; continue };
        if ($2~ /^гл_2вид_перне_прош_ед_муж$/       ){  g2_pnpa_edmu      [$1]=""; continue };
        if ($2~ /^гл_2вид_перне_прош_ед_ср$/        ){  g2_pnpa_edsr      [$1]=""; continue };
        if ($2~ /^гл_2вид_перне_прош_мн$/           ){  g2_pnpa_mn        [$1]=""; continue };
       };
      };
    }; # чтение gl-dic
   close(cmd);
   cmd = "zcat " indb "dic_rest.gz";
   while ((cmd|getline) > 0) {

    if ($1~ "-") { dichyph [$1] };

    if ($2~  /^дееп_/ ){
        if ($2~ /^дееп_сов_перех_прош$/             ){  dps_pe_pa         [$1]=""; continue };
        if ($2~ /^дееп_сов_непер_воз_прош$/         ){  dps_vz_ne_pa      [$1]=""; continue };
        if ($2~ /^дееп_несов_непер_воз_наст$/       ){  dpn_vz_ne_na      [$1]=""; continue };
        if ($2~ /^дееп_несов_перех_наст$/           ){  dpn_pe_na         [$1]=""; continue };
        if ($2~ /^дееп_сов_непер_прош$/             ){  dps_ne_pa         [$1]=""; continue };
        if ($2~ /^дееп_сов_перне_прош$/             ){  dps_pn_pa         [$1]=""; continue };
        if ($2~ /^дееп_несов_непер_наст$/           ){  dpn_ne_na         [$1]=""; continue };
        if ($2~ /^дееп_несов_перне_наст$/           ){  dpn_pn_na         [$1]=""; continue };
        if ($2~ /^дееп_несов_перех_прош$/           ){  dpn_pe_pa         [$1]=""; continue };
        if ($2~ /^дееп_несов_перне_прош$/           ){  dpn_pn_pa         [$1]=""; continue };
        if ($2~ /^дееп_несов_непер_прош$/           ){  dpn_ne_pa         [$1]=""; continue };
    };
    if($2~  /^нар/ ){
        if ($2~ /^нар_сравн$/                       ){  nr_srv            [$1]=""; continue };
        if ($2~ /^нар_опред_кач$/                   ){  nr_opka           [$1]=""; continue };
        if ($2~ /^нар_опред_спос$/                  ){  nr_opsp           [$1]=""; continue };
        if ($2~ /^нар_опред_степ$/                  ){  nr_opst           [$1]=""; continue };
        if ($2~ /^нар_обст_врем$/                   ){  nr_obvr           [$1]=""; continue };
        if ($2~ /^нар_обст_места$/                  ){  nr_obme           [$1]=""; continue };
        if ($2~ /^нар_обст_напр$/                   ){  nr_obna           [$1]=""; continue };
        if ($2~ /^нар_обст_причин$/                 ){  nr_obpr           [$1]=""; continue };
        if ($2~ /^нар_обст_цель$/                   ){  nr_obce           [$1]=""; continue };
        if ($2~ /^нар_вопр$/                        ){  nr_vopr           [$1]=""; continue };
        if ($2~ /^нар_мест$/                        ){  nr_mest           [$1]=""; continue };
        if ($2~ /^нар_прев$/                        ){  nr_pv             [$1]=""; continue };
        if ($2~ /^нар$/                             ){  nr_nar            [$1]=""; continue };
    };

        if ($2~ /^предик$/                          ){  predk             [$1]=""; continue };
        if ($2~ /^межд$/                            ){  mzd               [$1]=""; continue };
        if ($2~ /^част$/                            ){  qst               [$1]=""; continue };
        if ($2~ /^ввод$/                            ){  vvodn             [$1]=""; continue };
        if ($2~ /^союз$/                            ){  suyz              [$1]=""; continue };

    if($2~  /^мест_/ ){
        if ($2~ /^мест_(сущ|прл)_ед_муж_вин$/       ){  mst_ed_mu_vi      [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_муж_вин_неод$/  ){  mst_ed_mu_im      [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_муж_вин_одуш$/  ){  mst_ed_mu_ro      [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_муж_дат$/       ){  mst_ed_mu_da      [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_муж_им$/        ){  mst_ed_mu_im      [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_муж_пр$/        ){  mst_ed_mu_pr      [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_муж_род$/       ){  mst_ed_mu_ro      [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_муж_тв$/        ){  mst_ed_mu_tv      [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_жен_вин$/       ){  mst_ed_ze_vi      [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_жен_дат$/       ){  mst_ed_ze_da      [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_жен_им$/        ){  mst_ed_ze_im      [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_жен_пр$/        ){  mst_ed_ze_pr      [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_жен_род$/       ){  mst_ed_ze_ro      [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_жен_тв$/        ){  mst_ed_ze_tv      [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_ср_вин$/        ){  mst_ed_sr_vi      [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_ср_дат$/        ){  mst_ed_sr_da      [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_ср_им$/         ){  mst_ed_sr_im      [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_ср_пр$/         ){  mst_ed_sr_pr      [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_ср_род$/        ){  mst_ed_sr_ro      [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_ср_тв$/         ){  mst_ed_sr_tv      [$1]=""; continue };
                                                                          
        if ($2~ /^мест_(сущ|прл)_мн_вин_неод$/      ){  mst_mn_im         [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_мн_вин_одуш$/      ){  mst_mn_ro         [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_мн_вин$/           ){  mst_mn_vi         [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_мн_дат$/           ){  mst_mn_da         [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_мн_им$/            ){  mst_mn_im         [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_мн_пр$/            ){  mst_mn_pr         [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_мн_род$/           ){  mst_mn_ro         [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_мн_тв$/            ){  mst_mn_tv         [$1]=""; continue };
                                                                          
        if ($2~ /^мест_(сущ|прл)_ед_вин$/           ){  mst_ed_vi         [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_им$/            ){  mst_ed_im         [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_дат$/           ){  mst_ed_da         [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_пр$/            ){  mst_ed_pr         [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_род$/           ){  mst_ed_ro         [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_тв$/            ){  mst_ed_tv         [$1]=""; continue };
                                                                          
        if ($2~ /^мест_(сущ|прл)_ед_муж$/           ){  mst_ed_mu         [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_ед_жен$/           ){  mst_ed_ze         [$1]=""; continue };
                                                                          
        if ($2~ /^мест_(сущ|прл)_им$/               ){  mst_im            [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_вин$/              ){  mst_vi            [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_дат$/              ){  mst_da            [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_пр$/               ){  mst_pr            [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_род$/              ){  mst_ro            [$1]=""; continue };
        if ($2~ /^мест_(сущ|прл)_тв$/               ){  mst_tv            [$1]=""; continue };
        if ($2~ /^мест_прл_мн$/                     ){  mst_mn            [$1]=""; continue };
                                                                          
        if ($2~ /^мест_сущ$/                        ){  mst_suw           [$1]=""; continue };
        if ($2~ /^мест_прл_ед_ср$/                  ){  mst_ed_sr         [$1]=""; continue };
    };
    if($2~  /^предл_/ ){
        if ($2~ /^предл_вин$/                       ){  pred_vi           [$1]=""; continue };
        if ($2~ /^предл_дат$/                       ){  pred_da           [$1]=""; continue };
        if ($2~ /^предл_им$/                        ){  pred_im           [$1]=""; continue };
        if ($2~ /^предл_пр$/                        ){  pred_pr           [$1]=""; continue };
        if ($2~ /^предл_род$/                       ){  pred_ro           [$1]=""; continue };
        if ($2~ /^предл_тв$/                        ){  pred_tv           [$1]=""; continue };
    };
    if ($2~ /^числ_/ ) {                                qall              [$1]="";
      if ($2~ /^числ_кол_/ ) {
        if ($2~ /^числ_кол_вин$/                    ){  qko_vi            [$1]=""; continue };
        if ($2~ /^числ_кол_дат$/                    ){  qko_da            [$1]=""; continue };
        if ($2~ /^числ_кол_ед_жен_вин$/             ){  qko_ed_ze_vi      [$1]=""; continue };
        if ($2~ /^числ_кол_ед_жен_дат$/             ){  qko_ed_ze_da      [$1]=""; continue };
        if ($2~ /^числ_кол_ед_жен_им$/              ){  qko_ed_ze_im      [$1]=""; continue };
        if ($2~ /^числ_кол_ед_жен_пр$/              ){  qko_ed_ze_pr      [$1]=""; continue };
        if ($2~ /^числ_кол_ед_жен_род$/             ){  qko_ed_ze_ro      [$1]=""; continue };
        if ($2~ /^числ_кол_ед_жен_тв$/              ){  qko_ed_ze_tv      [$1]=""; continue };
        if ($2~ /^числ_кол_ед_муж_вин$/             ){  qko_ed_mu_vi      [$1]=""; continue };
        if ($2~ /^числ_кол_ед_муж_дат$/             ){  qko_ed_mu_da      [$1]=""; continue };
        if ($2~ /^числ_кол_ед_муж_им$/              ){  qko_ed_mu_im      [$1]=""; continue };
        if ($2~ /^числ_кол_ед_муж_пр$/              ){  qko_ed_mu_pr      [$1]=""; continue };
        if ($2~ /^числ_кол_ед_муж_род$/             ){  qko_ed_mu_ro      [$1]=""; continue };
        if ($2~ /^числ_кол_ед_муж_тв$/              ){  qko_ed_mu_tv      [$1]=""; continue };
        if ($2~ /^числ_кол_ед_ср_вин$/              ){  qko_ed_sr_vi      [$1]=""; continue };
        if ($2~ /^числ_кол_ед_ср_дат$/              ){  qko_ed_sr_da      [$1]=""; continue };
        if ($2~ /^числ_кол_ед_ср_им$/               ){  qko_ed_sr_im      [$1]=""; continue };
        if ($2~ /^числ_кол_ед_ср_пр$/               ){  qko_ed_sr_pr      [$1]=""; continue };
        if ($2~ /^числ_кол_ед_ср_род$/              ){  qko_ed_sr_ro      [$1]=""; continue };
        if ($2~ /^числ_кол_ед_ср_тв$/               ){  qko_ed_sr_tv      [$1]=""; continue };
        if ($2~ /^числ_кол_жен_вин$/                ){  qko_ze_vi         [$1]=""; continue };
        if ($2~ /^числ_кол_жен_им$/                 ){  qko_ze_im         [$1]=""; continue };
        if ($2~ /^числ_кол_им$/                     ){  qko_im            [$1]=""; continue };
        if ($2~ /^числ_кол_мн_вин$/                 ){  qko_mn_vi         [$1]=""; continue };
        if ($2~ /^числ_кол_мн_дат$/                 ){  qko_mn_da         [$1]=""; continue };
        if ($2~ /^числ_кол_мн_им$/                  ){  qko_mn_im         [$1]=""; continue };
        if ($2~ /^числ_кол_мн_пр$/                  ){  qko_mn_pr         [$1]=""; continue };
        if ($2~ /^числ_кол_мн_род$/                 ){  qko_mn_ro         [$1]=""; continue };
        if ($2~ /^числ_кол_мн_тв$/                  ){  qko_mn_tv         [$1]=""; continue };
        if ($2~ /^числ_кол_пр$/                     ){  qko_pr            [$1]=""; continue };
        if ($2~ /^числ_кол_род$/                    ){  qko_ro            [$1]=""; continue };
        if ($2~ /^числ_кол_тв$/                     ){  qko_tv            [$1]=""; continue };
      };
      if ($2~ /^числ_неопр_/ ) {

        if ($2~ /^числ_неопр_вин$/                  ){  qne_vi            [$1]=""; continue };
        if ($2~ /^числ_неопр_дат$/                  ){  qne_da            [$1]=""; continue };
        if ($2~ /^числ_неопр_им$/                   ){  qne_im            [$1]=""; continue };
        if ($2~ /^числ_неопр_пр$/                   ){  qne_pr            [$1]=""; continue };
        if ($2~ /^числ_неопр_род$/                  ){  qne_ro            [$1]=""; continue };
        if ($2~ /^числ_неопр_тв$/                   ){  qne_tv            [$1]=""; continue };
      };
      if ($2~ /^числ_поряд_/ ) {

        if ($2~ /^числ_поряд_ед_жен_вин$/           ){  qpo_ed_ze_vi      [$1]=""; continue };
        if ($2~ /^числ_поряд_ед_жен_дат$/           ){  qpo_ed_ze_da      [$1]=""; continue };
        if ($2~ /^числ_поряд_ед_жен_им$/            ){  qpo_ed_ze_im      [$1]=""; continue };
        if ($2~ /^числ_поряд_ед_жен_пр$/            ){  qpo_ed_ze_pr      [$1]=""; continue };
        if ($2~ /^числ_поряд_ед_жен_род$/           ){  qpo_ed_ze_ro      [$1]=""; continue };
        if ($2~ /^числ_поряд_ед_жен_тв$/            ){  qpo_ed_ze_tv      [$1]=""; continue };
        if ($2~ /^числ_поряд_ед_муж_вин_неод$/      ){  qpo_ed_mu_im      [$1]=""; continue };
        if ($2~ /^числ_поряд_ед_муж_вин_одуш$/      ){  qpo_ed_mu_ro      [$1]=""; continue };
        if ($2~ /^числ_поряд_ед_муж_дат$/           ){  qpo_ed_mu_da      [$1]=""; continue };
        if ($2~ /^числ_поряд_ед_муж_им$/            ){  qpo_ed_mu_im      [$1]=""; continue };
        if ($2~ /^числ_поряд_ед_муж_пр$/            ){  qpo_ed_mu_pr      [$1]=""; continue };
        if ($2~ /^числ_поряд_ед_муж_род$/           ){  qpo_ed_mu_ro      [$1]=""; continue };
        if ($2~ /^числ_поряд_ед_муж_тв$/            ){  qpo_ed_mu_tv      [$1]=""; continue };
        if ($2~ /^числ_поряд_ед_ср_вин$/            ){  qpo_ed_sr_vi      [$1]=""; continue };
        if ($2~ /^числ_поряд_ед_ср_дат$/            ){  qpo_ed_sr_da      [$1]=""; continue };
        if ($2~ /^числ_поряд_ед_ср_им$/             ){  qpo_ed_sr_im      [$1]=""; continue };
        if ($2~ /^числ_поряд_ед_ср_пр$/             ){  qpo_ed_sr_pr      [$1]=""; continue };
        if ($2~ /^числ_поряд_ед_ср_род$/            ){  qpo_ed_sr_ro      [$1]=""; continue };
        if ($2~ /^числ_поряд_ед_ср_тв$/             ){  qpo_ed_sr_tv      [$1]=""; continue };
        if ($2~ /^числ_поряд_мн_вин_неод$/          ){  qpo_mn_im         [$1]=""; continue };
        if ($2~ /^числ_поряд_мн_вин_одуш$/          ){  qpo_mn_ro         [$1]=""; continue };
        if ($2~ /^числ_поряд_мн_дат$/               ){  qpo_mn_da         [$1]=""; continue };
        if ($2~ /^числ_поряд_мн_им$/                ){  qpo_mn_im         [$1]=""; continue };
        if ($2~ /^числ_поряд_мн_пр$/                ){  qpo_mn_pr         [$1]=""; continue };
        if ($2~ /^числ_поряд_мн_род$/               ){  qpo_mn_ro         [$1]=""; continue };
        if ($2~ /^числ_поряд_мн_тв$/                ){  qpo_mn_tv         [$1]=""; continue };
      };
      if ($2~ /^числ_собир_/ ) {

        if ($2~ /^числ_собир_вин$/                  ){  qso_vi            [$1]=""; continue };
        if ($2~ /^числ_собир_дат$/                  ){  qso_da            [$1]=""; continue };
        if ($2~ /^числ_собир_жен_вин$/              ){  qso_ze_vi         [$1]=""; continue };
        if ($2~ /^числ_собир_жен_дат$/              ){  qso_ze_da         [$1]=""; continue };
        if ($2~ /^числ_собир_жен_им$/               ){  qso_ze_im         [$1]=""; continue };
        if ($2~ /^числ_собир_жен_пр$/               ){  qso_ze_pr         [$1]=""; continue };
        if ($2~ /^числ_собир_жен_род$/              ){  qso_ze_ro         [$1]=""; continue };
        if ($2~ /^числ_собир_жен_тв$/               ){  qso_ze_tv         [$1]=""; continue };
        if ($2~ /^числ_собир_им$/                   ){  qso_im            [$1]=""; continue };
        if ($2~ /^числ_собир_муж_вин$/              ){  qso_mu_vi         [$1]=""; continue };
        if ($2~ /^числ_собир_муж_дат$/              ){  qso_mu_da         [$1]=""; continue };
        if ($2~ /^числ_собир_муж_им$/               ){  qso_mu_im         [$1]=""; continue };
        if ($2~ /^числ_собир_муж_пр$/               ){  qso_mu_pr         [$1]=""; continue };
        if ($2~ /^числ_собир_муж_род$/              ){  qso_mu_ro         [$1]=""; continue };
        if ($2~ /^числ_собир_муж_тв$/               ){  qso_mu_tv         [$1]=""; continue };
        if ($2~ /^числ_собир_пр$/                   ){  qso_pr            [$1]=""; continue };
        if ($2~ /^числ_собир_род$/                  ){  qso_ro            [$1]=""; continue };
        if ($2~ /^числ_собир_ср_вин$/               ){  qso_sr_vi         [$1]=""; continue };
        if ($2~ /^числ_собир_ср_дат$/               ){  qso_sr_da         [$1]=""; continue };
        if ($2~ /^числ_собир_ср_им$/                ){  qso_sr_im         [$1]=""; continue };
        if ($2~ /^числ_собир_ср_пр$/                ){  qso_sr_pr         [$1]=""; continue };
        if ($2~ /^числ_собир_ср_род$/               ){  qso_sr_ro         [$1]=""; continue };
        if ($2~ /^числ_собир_ср_тв$/                ){  qso_sr_tv         [$1]=""; continue };
        if ($2~ /^числ_собир_тв$/                   ){  qso_tv            [$1]=""; continue };
      };
    };
   }; # чтение rest-dic
   close(cmd);
   cmd = "zcat " indb "dic_cust.gz";
   while ((cmd|getline) > 0) {

   if ($1~ "-") { dichyph [$1] };

        if ($2~ /^gl_/ && $2~ /_мн/ && $2!~ /_пов/ && $2!~ /_воз/ ){ gc_mn[$1]=$3; continue };
        if ($2~ /^gl_/ && $2~ /_инф/                              ){ gc_in[$1]=$3; continue };
        if ($2~ /^gl_/ && $2~ /_пов/                              ){ gc_po[$1]=$3; continue };
        if ($2~ /^gl_/ && $2~ /_ед/                               ){ gc_ed[$1]=$3; continue };


#  if ($2~ /^gl_/) {
#     if ($2~ /^gl_2вид_/ ) {
#       if ($2~ /^gl_2вид_непер_буд_мн_1е$/         ){  gc2_nebu_m1       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_непер_буд_мн_2е$/         ){  gc2_nebu_m2       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_непер_буд_мн_3е$/         ){  gc2_nebu_m3       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_непер_воз_буд_мн_1е$/     ){  gc2_vz_nebu_m1    [$1]=$3; continue };
#       if ($2~ /^gl_2вид_непер_воз_буд_мн_2е$/     ){  gc2_vz_nebu_m2    [$1]=$3; continue };
#       if ($2~ /^gl_2вид_непер_воз_буд_мн_3е$/     ){  gc2_vz_nebu_m3    [$1]=$3; continue };
#       if ($2~ /^gl_2вид_непер_воз_наст_мн_1е$/    ){  gc2_vz_nena_m1    [$1]=$3; continue };
#       if ($2~ /^gl_2вид_непер_воз_наст_мн_2е$/    ){  gc2_vz_nena_m2    [$1]=$3; continue };
#       if ($2~ /^gl_2вид_непер_воз_наст_мн_3е$/    ){  gc2_vz_nena_m3    [$1]=$3; continue };
#       if ($2~ /^gl_2вид_непер_воз_пов_мн$/        ){  gc2_vz_nepo_mn    [$1]=$3; continue };
#       if ($2~ /^gl_2вид_непер_воз_прош_мн$/       ){  gc2_vz_nepa_mn    [$1]=$3; continue };
#       if ($2~ /^gl_2вид_непер_наст_мн_1е$/        ){  gc2_nena_m1       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_непер_наст_мн_2е$/        ){  gc2_nena_m2       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_непер_наст_мн_3е$/        ){  gc2_nena_m3       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_непер_пов_мн$/            ){  gc2_nepo_mn       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_непер_прош_мн$/           ){  gc2_nepa_mn       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_перех_буд_мн_1е$/         ){  gc2_pebu_m1       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_перех_буд_мн_2е$/         ){  gc2_pebu_m2       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_перех_буд_мн_3е$/         ){  gc2_pebu_m3       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_перех_наст_мн_1е$/        ){  gc2_pena_m1       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_перех_наст_мн_2е$/        ){  gc2_pena_m2       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_перех_наст_мн_3е$/        ){  gc2_pena_m3       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_перех_пов_мн$/            ){  gc2_pepo_mn       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_перех_прош_мн$/           ){  gc2_pepa_mn       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_перне_буд_мн_1е$/         ){  gc2_pnbu_m1       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_перне_буд_мн_2е$/         ){  gc2_pnbu_m2       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_перне_буд_мн_3е$/         ){  gc2_pnbu_m3       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_перне_наст_мн_1е$/        ){  gc2_pnna_m1       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_перне_наст_мн_2е$/        ){  gc2_pnna_m2       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_перне_наст_мн_3е$/        ){  gc2_pnna_m3       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_перне_пов_мн$/            ){  gc2_pnpo_mn       [$1]=$3; continue };
#       if ($2~ /^gl_2вид_перне_прош_мн$/           ){  gc2_pnpa_mn       [$1]=$3; continue };
#     };
#     if ($2~ /^gl_несов_/ ) {

#       if ($2~ /^gl_несов_непер_воз_наст_мн_1е$/   ){  gcn_vz_nena_m1    [$1]=$3; continue };
#       if ($2~ /^gl_несов_непер_воз_наст_мн_2е$/   ){  gcn_vz_nena_m2    [$1]=$3; continue };
#       if ($2~ /^gl_несов_непер_воз_наст_мн_3е$/   ){  gcn_vz_nena_m3    [$1]=$3; continue };
#       if ($2~ /^gl_несов_непер_воз_пов_мн$/       ){  gcn_vz_nepo_mn    [$1]=$3; continue };
#       if ($2~ /^gl_несов_непер_воз_прош_мн$/      ){  gcn_vz_nepa_mn    [$1]=$3; continue };
#       if ($2~ /^gl_несов_непер_наст_мн_1е$/       ){  gcn_nena_m1       [$1]=$3; continue };
#       if ($2~ /^gl_несов_непер_наст_мн_2е$/       ){  gcn_nena_m2       [$1]=$3; continue };
#       if ($2~ /^gl_несов_непер_наст_мн_3е$/       ){  gcn_nena_m3       [$1]=$3; continue };
#       if ($2~ /^gl_несов_непер_пов_мн$/           ){  gcn_nepo_mn       [$1]=$3; continue };
#       if ($2~ /^gl_несов_непер_прош_мн$/          ){  gcn_nepa_mn       [$1]=$3; continue };
#       if ($2~ /^gl_несов_перех_наст_мн_1е$/       ){  gcn_pena_m1       [$1]=$3; continue };
#       if ($2~ /^gl_несов_перех_наст_мн_2е$/       ){  gcn_pena_m2       [$1]=$3; continue };
#       if ($2~ /^gl_несов_перех_наст_мн_3е$/       ){  gcn_pena_m3       [$1]=$3; continue };
#       if ($2~ /^gl_несов_перех_пов_мн$/           ){  gcn_pepo_mn       [$1]=$3; continue };
#       if ($2~ /^gl_несов_перех_прош_мн$/          ){  gcn_pepa_mn       [$1]=$3; continue };
#       if ($2~ /^gl_несов_перне_наст_мн_1е$/       ){  gcn_pnna_m1       [$1]=$3; continue };
#       if ($2~ /^gl_несов_перне_наст_мн_2е$/       ){  gcn_pnna_m2       [$1]=$3; continue };
#       if ($2~ /^gl_несов_перне_наст_мн_3е$/       ){  gcn_pnna_m3       [$1]=$3; continue };
#       if ($2~ /^gl_несов_перне_пов_мн$/           ){  gcn_pnpo_mn       [$1]=$3; continue };
#       if ($2~ /^gl_несов_перне_прош_мн$/          ){  gcn_pnpa_mn       [$1]=$3; continue };
#     };
#     if ($2~ /^gl_сов_/ ) {

#       if ($2~ /^gl_сов_непер_буд_мн_1е$/          ){  gcs_nebu_m1       [$1]=$3; continue };
#       if ($2~ /^gl_сов_непер_буд_мн_2е$/          ){  gcs_nebu_m2       [$1]=$3; continue };
#       if ($2~ /^gl_сов_непер_буд_мн_3е$/          ){  gcs_nebu_m3       [$1]=$3; continue };
#       if ($2~ /^gl_сов_непер_воз_буд_мн_1е$/      ){  gcs_vz_nebu_m1    [$1]=$3; continue };
#       if ($2~ /^gl_сов_непер_воз_буд_мн_2е$/      ){  gcs_vz_nebu_m2    [$1]=$3; continue };
#       if ($2~ /^gl_сов_непер_воз_буд_мн_3е$/      ){  gcs_vz_nebu_m3    [$1]=$3; continue };
#       if ($2~ /^gl_сов_непер_воз_пов_мн$/         ){  gcs_vz_nepo_mn    [$1]=$3; continue };
#       if ($2~ /^gl_сов_непер_воз_прош_мн$/        ){  gcs_vz_nepa_mn    [$1]=$3; continue };
#       if ($2~ /^gl_сов_непер_пов_мн$/             ){  gcs_nepo_mn       [$1]=$3; continue };
#       if ($2~ /^gl_сов_непер_прош_мн$/            ){  gcs_nepa_mn       [$1]=$3; continue };
#       if ($2~ /^gl_сов_перех_буд_мн_1е$/          ){  gcs_pebu_m1       [$1]=$3; continue };
#       if ($2~ /^gl_сов_перех_буд_мн_2е$/          ){  gcs_pebu_m2       [$1]=$3; continue };
#       if ($2~ /^gl_сов_перех_буд_мн_3е$/          ){  gcs_pebu_m3       [$1]=$3; continue };
#       if ($2~ /^gl_сов_перех_пов_мн$/             ){  gcs_pepo_mn       [$1]=$3; continue };
#       if ($2~ /^gl_сов_перех_прош_мн$/            ){  gcs_pepa_mn       [$1]=$3; continue };
#       if ($2~ /^gl_сов_перне_буд_мн_1е$/          ){  gcs_pnbu_m1       [$1]=$3; continue };
#       if ($2~ /^gl_сов_перне_буд_мн_2е$/          ){  gcs_pnbu_m2       [$1]=$3; continue };
#       if ($2~ /^gl_сов_перне_буд_мн_3е$/          ){  gcs_pnbu_m3       [$1]=$3; continue };
#       if ($2~ /^gl_сов_перне_пов_мн$/             ){  gcs_pnpo_mn       [$1]=$3; continue };
#       if ($2~ /^gl_сов_перне_прош_мн$/            ){  gcs_pnpa_mn       [$1]=$3; continue };
#     };
#  };                                                                     
   if ($2~ /^muk_/) {                                                     
        if($2~  /_ед_муж_им$/                       ){  muc_edmuim        [$1]=""; continue };
        if($2~  /_ед_жен_им$/                       ){  muc_edzeim        [$1]=""; continue };
        if($2~  /_ед_ср_им$/                        ){  muc_edsrim        [$1]=""; continue };
        if($2~  /_ед_муж_вин/                       ){  muc_edmuvi        [$1]=""; continue };
        if($2~  /_ед_жен_вин/                       ){  muc_edzevi        [$1]=""; continue };
        if($2~  /_ед_ср_вин/                        ){  muc_edsrvi        [$1]=""; continue };
        if($2~  /_ед_муж_дат$/                      ){  muc_edmuda        [$1]=""; continue };
        if($2~  /_ед_жен_дат$/                      ){  muc_edzeda        [$1]=""; continue };
        if($2~  /_ед_ср_дат$/                       ){  muc_edsrda        [$1]=""; continue };
        if($2~  /_ед_муж_род$/                      ){  muc_edmuro        [$1]=""; continue };
        if($2~  /_ед_жен_род$/                      ){  muc_edzero        [$1]=""; continue };
        if($2~  /_ед_ср_род$/                       ){  muc_edsrro        [$1]=""; continue };
        if($2~  /_ед_муж_тв$/                       ){  muc_edmutv        [$1]=""; continue };
        if($2~  /_ед_жен_тв$/                       ){  muc_edzetv        [$1]=""; continue };
        if($2~  /_ед_ср_тв$/                        ){  muc_edsrtv        [$1]=""; continue };
        if($2~  /_ед_муж_пр$/                       ){  muc_edmupr        [$1]=""; continue };
        if($2~  /_ед_жен_пр$/                       ){  muc_edzepr        [$1]=""; continue };
        if($2~  /_ед_ср_пр$/                        ){  muc_edsrpr        [$1]=""; continue };
        if($2~  /_мн_им$/                           ){  muc_mnim          [$1]=""; continue };
        if($2~  /_мн_вин/                           ){  muc_mnvi          [$1]=""; continue };
        if($2~  /_мн_дат$/                          ){  muc_mnda          [$1]=""; continue };
        if($2~  /_мн_род$/                          ){  muc_mnro          [$1]=""; continue };
        if($2~  /_мн_тв$/                           ){  muc_mntv          [$1]=""; continue };
        if($2~  /_мн_пр$/                           ){  muc_mnpr          [$1]=""; continue };
        if($2~  /^muk_прл_им$/                      ){  muc_mnim          [$1]=""; continue };
        if($2~  /^muk_прл_вин$/                     ){  muc_mnvi          [$1]=""; continue };
        if($2~  /^muk_прл_дат$/                     ){  muc_mnda          [$1]=""; continue };
        if($2~  /^muk_прл_род$/                     ){  muc_mnro          [$1]=""; continue };
        if($2~  /^muk_прл_тв$/                      ){  muc_mntv          [$1]=""; continue };
        if($2~  /^muk_прл_пр$/                      ){  muc_mnpr          [$1]=""; continue };
   };                                                                     
#   if($2~  /^nac/ ){
#       if ($2~ /^nar_сравн$/                       ){  nrc_srv           [$1]=""; continue };
#       if ($2~ /^nar_опред_кач$/                   ){  nrc_opka          [$1]=""; continue };
        if ($2~ /^nar_опред_спос$/                  ){  nrc_opsp          [$1]=""; continue };
#       if ($2~ /^nar_опред_степ$/                  ){  nrc_opst          [$1]=""; continue };
#       if ($2~ /^nar_обст_врем$/                   ){  nrc_obvr          [$1]=""; continue };
#       if ($2~ /^nar_обст_места$/                  ){  nrc_obme          [$1]=""; continue };
        if ($2~ /^nar_обст_напр$/                   ){  nrc_obna          [$1]=""; continue };
#       if ($2~ /^nar_обст_причин$/                 ){  nrc_obpr          [$1]=""; continue };
#       if ($2~ /^nar_обст_цель$/                   ){  nrc_obce          [$1]=""; continue };
#       if ($2~ /^nar_вопр$/                        ){  nrc_vopr          [$1]=""; continue };
#       if ($2~ /^nar_мест$/                        ){  nrc_mest          [$1]=""; continue };
#       if ($2~ /^nar_прев$/                        ){  nrc_pv            [$1]=""; continue };
#       if ($2~ /^nar$/                             ){  nrc_nar           [$1]=""; continue };
#   };

   if ($2~ /^zvat_/                                 ){  zvt               [$1]=""; continue };

   if ($2~ /^md/) {                                                     
        if($2~  /^mdbz_/                            ){  md_bz             [$1]=$3; continue };
        if($2~  /^mded_/                            ){  md_ed             [$1]=$3; continue };
        if($2~  /^mdmn_/                            ){  md_mn             [$1]=$3; continue };
      };
   if ($2~ /^geo_/) {                                                     
        if($2~  /^geo_ед_ср_им$/                    ){  geo_edsrim        [$1]=""; continue };
        if($2~  /^geo_мн_им$/                       ){  geo_mnim          [$1]=""; continue };
      };
   } close(cmd);
 
   cmd = "zcat " indb "automo.gz | sed -r 's/([аеёиоуыэюя])\\x27/\\1\\xcc\\x81/g; s/\\\\xcc\\\\xa0/\\xcc\\xa0/g; s/\\\\xcc\\\\xa3/\\xcc\\xa3/g; s/\\\\xcc\\\\xa4/\\xcc\\xa4/g; s/\\\\xcc\\\\xad/\\xcc\\xad/g; s/\\\\xcc\\\\xb0/\\xcc\\xb0/g; s/^([^ ]+)\\s([^ ]+)\\s(.+)$/\\1 \\2 \\u\\1 \\u\\2 \\3/g'";
   while ((cmd|getline) > 0) {

        if($5~  /^mn1e_/ &&$5~ /_мн_1е$/            ){  ogl_mn1e    [$1]=$2; ogl_mn1e    [$3]=$4; ogl_mn1e    [$1,"info"]=$6; continue };
        if($5~  /^mn2e_/ &&$5~ /_мн_2е$/            ){  ogl_mn2e    [$1]=$2; ogl_mn2e    [$3]=$4; ogl_mn2e    [$1,"info"]=$6; continue };
        if($5~  /^mn3e_/ &&$5~ /_мн_3е$/            ){  ogl_mn3e    [$1]=$2; ogl_mn3e    [$3]=$4; ogl_mn3e    [$1,"info"]=$6; continue };
        if($5~  /^pomn_/ &&$5~ /_пов_мн$/           ){  ogl_pomn    [$1]=$2; ogl_pomn    [$3]=$4; ogl_pomn    [$1,"info"]=$6; continue };
                                                                                      
        if($5~  /^plkred_прл_крат/ &&$5~ /_ед_муж$/ ){  opl_kredmu  [$1]=$2; opl_kredmu  [$3]=$4; opl_kredmu  [$1,"info"]=$6; continue };
        if($5~  /^pqkred_прч_крат/ &&$5~ /_ед_муж$/ ){  opq_kredmu  [$1]=$2; opq_kredmu  [$3]=$4; opq_kredmu  [$1,"info"]=$6; continue };

        if($5~  /^osw_сущ_/ &&$5~ /_ед_муж_им$/     ){  osw_edmu_im [$1]=$2; osw_edmu_im [$3]=$4; osw_edmu_im [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_муж_вин$/    ){  osw_edmu_vi [$1]=$2; osw_edmu_vi [$3]=$4; osw_edmu_vi [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_муж_род$/    ){  osw_edmu_ro [$1]=$2; osw_edmu_ro [$3]=$4; osw_edmu_ro [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_муж_дат$/    ){  osw_edmu_da [$1]=$2; osw_edmu_da [$3]=$4; osw_edmu_da [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_муж_тв$/     ){  osw_edmu_tv [$1]=$2; osw_edmu_tv [$3]=$4; osw_edmu_tv [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_муж_пр$/     ){  osw_edmu_pr [$1]=$2; osw_edmu_pr [$3]=$4; osw_edmu_pr [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_муж_мест$/   ){  osw_edmu_me [$1]=$2; osw_edmu_me [$3]=$4; osw_edmu_me [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_муж_нескл$/  ){  osw_edmu_ne [$1]=$2; osw_edmu_ne [$3]=$4; osw_edmu_ne [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_муж_парт$/   ){  osw_edmu_pa [$1]=$2; osw_edmu_pa [$3]=$4; osw_edmu_pa [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_муж_счет$/   ){  osw_edmu_sq [$1]=$2; osw_edmu_sq [$3]=$4; osw_edmu_sq [$1,"info"]=$6; continue };
                                                                               
        if($5~  /^osw_сущ_/ &&$5~ /_ед_жен_им$/     ){  osw_edze_im [$1]=$2; osw_edze_im [$3]=$4; osw_edze_im [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_жен_вин$/    ){  osw_edze_vi [$1]=$2; osw_edze_vi [$3]=$4; osw_edze_vi [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_жен_род$/    ){  osw_edze_ro [$1]=$2; osw_edze_ro [$3]=$4; osw_edze_ro [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_жен_дат$/    ){  osw_edze_da [$1]=$2; osw_edze_da [$3]=$4; osw_edze_da [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_жен_тв$/     ){  osw_edze_tv [$1]=$2; osw_edze_tv [$3]=$4; osw_edze_tv [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_жен_пр$/     ){  osw_edze_pr [$1]=$2; osw_edze_pr [$3]=$4; osw_edze_pr [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_жен_мест$/   ){  osw_edze_me [$1]=$2; osw_edze_me [$3]=$4; osw_edze_me [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_жен_нескл$/  ){  osw_edze_ne [$1]=$2; osw_edze_ne [$3]=$4; osw_edze_ne [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_жен_парт$/   ){  osw_edze_pa [$1]=$2; osw_edze_pa [$3]=$4; osw_edze_pa [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_жен_счет$/   ){  osw_edze_sq [$1]=$2; osw_edze_sq [$3]=$4; osw_edze_sq [$1,"info"]=$6; continue };
                                                                             
        if($5~  /^osw_сущ_/ &&$5~ /_ед_ср_им$/      ){  osw_edsr_im [$1]=$2; osw_edsr_im [$3]=$4; osw_edsr_im [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_ср_вин$/     ){  osw_edsr_vi [$1]=$2; osw_edsr_vi [$3]=$4; osw_edsr_vi [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_ср_род$/     ){  osw_edsr_ro [$1]=$2; osw_edsr_ro [$3]=$4; osw_edsr_ro [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_ср_дат$/     ){  osw_edsr_da [$1]=$2; osw_edsr_da [$3]=$4; osw_edsr_da [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_ср_тв$/      ){  osw_edsr_tv [$1]=$2; osw_edsr_tv [$3]=$4; osw_edsr_tv [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_ср_пр$/      ){  osw_edsr_pr [$1]=$2; osw_edsr_pr [$3]=$4; osw_edsr_pr [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_ср_мест$/    ){  osw_edsr_me [$1]=$2; osw_edsr_me [$3]=$4; osw_edsr_me [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_ср_нескл$/   ){  osw_edsr_ne [$1]=$2; osw_edsr_ne [$3]=$4; osw_edsr_ne [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_ср_парт$/    ){  osw_edsr_pa [$1]=$2; osw_edsr_pa [$3]=$4; osw_edsr_pa [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_ед_ср_счет$/    ){  osw_edsr_sq [$1]=$2; osw_edsr_sq [$3]=$4; osw_edsr_sq [$1,"info"]=$6; continue };
                                 
        if($5~  /^osw_сущ_/ &&$5~ /_мн_им$/         ){  osw_mn_im   [$1]=$2; osw_mn_im   [$3]=$4; osw_mn_im   [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_мн_вин$/        ){  osw_mn_vi   [$1]=$2; osw_mn_vi   [$3]=$4; osw_mn_vi   [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_мн_род$/        ){  osw_mn_ro   [$1]=$2; osw_mn_ro   [$3]=$4; osw_mn_ro   [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_мн_дат$/        ){  osw_mn_da   [$1]=$2; osw_mn_da   [$3]=$4; osw_mn_da   [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_мн_тв$/         ){  osw_mn_tv   [$1]=$2; osw_mn_tv   [$3]=$4; osw_mn_tv   [$1,"info"]=$6; continue };
        if($5~  /^osw_сущ_/ &&$5~ /_мн_пр$/         ){  osw_mn_pr   [$1]=$2; osw_mn_pr   [$3]=$4; osw_mn_pr   [$1,"info"]=$6; continue };

        if($2~  /^desc$/                            ){  custom_desc [$1]=$5;                      continue };
                                                                                           
#       if($5~  /^osw_сущ_одуш_ед_общ_им$/          ){  osw_edob_im [$1]=$2; osw_edob_im [$3]=$4; osw_edob_im [$1,"info"]=$6; continue };
#       if($5~  /^osw_сущ_одуш_ед_общ_вин$/         ){  osw_edob_vi [$1]=$2; osw_edob_vi [$3]=$4; osw_edob_vi [$1,"info"]=$6; continue };
#       if($5~  /^osw_сущ_одуш_ед_общ_род$/         ){  osw_edob_ro [$1]=$2; osw_edob_ro [$3]=$4; osw_edob_ro [$1,"info"]=$6; continue };
#       if($5~  /^osw_сущ_одуш_ед_общ_дат$/         ){  osw_edob_da [$1]=$2; osw_edob_da [$3]=$4; osw_edob_da [$1,"info"]=$6; continue };
#       if($5~  /^osw_сущ_одуш_ед_общ_тв$/          ){  osw_edob_tv [$1]=$2; osw_edob_tv [$3]=$4; osw_edob_tv [$1,"info"]=$6; continue };
#       if($5~  /^osw_сущ_одуш_ед_общ_пр$/          ){  osw_edob_pr [$1]=$2; osw_edob_pr [$3]=$4; osw_edob_pr [$1,"info"]=$6; continue };

#       if($5~  /^osw_сущ_ед_общ_им$/               ){  osw_edob_im [$1]=$2; osw_edob_im [$3]=$4; osw_edob_im [$1,"info"]=$6; continue };
#       if($5~  /^osw_сущ_ед_общ_вин$/              ){  osw_edob_vi [$1]=$2; osw_edob_vi [$3]=$4; osw_edob_vi [$1,"info"]=$6; continue };
#       if($5~  /^osw_сущ_ед_общ_род$/              ){  osw_edob_ro [$1]=$2; osw_edob_ro [$3]=$4; osw_edob_ro [$1,"info"]=$6; continue };
#       if($5~  /^osw_сущ_ед_общ_тв$/               ){  osw_edob_tv [$1]=$2; osw_edob_tv [$3]=$4; osw_edob_tv [$1,"info"]=$6; continue };

   } close(cmd);

 # Записать состояние словарных массивов
  if (gawk52 == 1) { writeall(classcache) };
  cmd = "md5sum " indb "classes.awk " inax "classes.bin " indb "dic_cust.gz " indb "dic_gl.gz " indb "dic_prl.gz " indb "dic_prq.gz " indb "dic_rest.gz " indb "dic_suw.gz " \
         indb "automo.gz" " > " inax "classes.md5"
  system(cmd); close(cmd)
   } #gnuawk

 # Коррекции - удаление омографов из массивов
 delete g2_nena_e1["есть"];delete g2_nena_e2["есть"];delete g2_nena_e3["есть"];delete g2_nena_m1["есть"];delete g2_nena_m2["есть"];delete g2_nena_m3["есть"];delete qst["есть"];

 delete gs_pebu_m3["выглядят"];
 delete gn_nepo_ed["времени"];
 delete gs_pepa_edze["дела"];
 delete gs_pepo_ed["почти"];
 delete gn_pepo_ed["пять"];
 delete gs_pepo_ed["пришли"];
 delete gn_nepa_edsr["тускло"];
 delete gs_pepa_edsr["дело"];
 delete soyz["все-таки"]; delete qst["все-таки"];
 delete dpn_pe_na["для"];
 delete dpn_pn_na["хотя"];
 delete gn_pepo_ed["три"];
 delete swn_edsr_ne["надо"];
 delete swn_edze_da["были"];delete swn_edze_pr["были"];delete swn_edze_ro["были"];delete swn_mn_im["были"];
 delete swo_edmu_tv["им"];
 delete swo_edmu_ro["его"];delete swo_edmu_ro["этого"];delete sw_edmu_ro["этого"];
 delete swn_edsr_im["сто"]; delete swn_edsr_vi["сто"];
 delete swn_edmu_im["сорок"]
 delete swn_edmu_im["тут"]; delete swn_mn_ro["тут"];
 delete swn_mn_im["или"];


# for (k=1; k<=664; k++) { printf ("%s%s %s %s\n", "R", k, "=", DIC[k]); sumdic = sumdic + DIC[k] }; print sumdic;

}

