# Формирует списки однозначных ё-форм

BEGIN { PROCINFO["sorted_in"]="@ind_num_asc"
  indb = "scriptdb/"
  inax = "scriptaux/"

   cmd = "zcat " indb "yoyo_alt.gz " indb "yodef.gz | sed -r 's/_.+=//g'";
   while ((cmd|getline) > 0) {
         yok=gensub("'","","g",$1)
         yodef[yok]=$1;

   }; close(cmd);
   cmd = "zcat " indb "namebase.gz | sed -r 's/_.+=//g'";
   while ((cmd|getline) > 0) {
     if ($1 ~ "ё") {
         yok=gensub("'","","g",$1)
         yolca[yok]=$1;

   };}; close(cmd);
   cmd = "zcat " indb "malc.gz " indb "yolc.gz | sed -r 's/_.+=//g'";
   while ((cmd|getline) > 0) {
     if ($1 ~ "ё") {
         yok=gensub("'","","g",$1)
         yolca[yok]=$1;

   };}; close(cmd);
   cmd = "zcat " indb "mano-lc.gz " indb "mano-uc.gz " indb "yomo-lc.gz " indb "yomo-uc.gz " indb "nomo.gz";
#  cmd = "zcat " indb "mano-lc.gz";
   while ((cmd|getline) > 0) {

         for (i=2; i<=NF; i++) { if ( $i ~ "ё") omoyo[$i] };

      }; close(cmd);

   for (i in omoyo) {
            yok=gensub("'","","g",i)
      if ( !(yok in yodef) ) {
        if (yok !~ "-" ) {yodef[yok] = i };
      }

   }

      for (i in yodef) { yopat = yopat "\n_" i "="; yodic = yodic "\n_" i "=" yodef[i] };
      for (i in yolca) { lcpat = lcpat "\n_" i "="; lcdic = lcdic "\n_" i "=" yolca[i] };

      printf(substr(yodic,2), lcdic) | "gzip > " indb "yoyo.gz";
      printf(substr(yopat,2), lcpat) | "gzip > " inax "yoyo.pat.gz";

      print substr(lcdic,2) | "gzip > " indb "yoyo_lc.gz";
      print substr(lcpat,2) | "gzip > " inax "yoyo_lc.pat.gz";

      gsub("ё","е",yopat); gsub("ё","е",lcpat);

      print substr(yopat,2) | "gzip > " inax "yoye.pat.gz";
      print substr(lcpat,2) | "gzip > " inax "yoye_lc.pat.gz";

}
