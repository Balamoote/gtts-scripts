@load "rwarray"

BEGIN { PROCINFO["sorted_in"]="@ind_num_asc"
# Скрипт генерации служебных списков для get-words.sh
# Посл едняя версия файла тут: https://github.com/Balamoote/gtts-scripts
    # внешние переменные
    # indb inax book
    #

 # Проверяем версию gawk, если меньше 5.2.1, то выключаем функции сохранения и восстановления массивов и переменных: базы тогда читаются всегда заново.
    lexpat=wdb0=gawk52="42"
    cmd = "awk -Wversion | head -1"
    cmd|getline verheader; close(cmd)
    split(verheader, gnuawk, "[ .,]")
    if (gnuawk[1] == "GNU" && gnuawk[2] == "Awk" && gnuawk[3] >= 5 && gnuawk[4] >= 2 && gnuawk[5] >= 1) { gawk52 = 1 };
 # Если словари и этот скрипт не изменились и gawk>=5.2.1, восстановить состояние, иначе прочитать всё заново.
   if ( gawk52 == 1 ) {
    cmd   = "md5sum -c --status " inax "wdb0.md5 >/dev/null 2>&1"
    wdb0  = system(cmd); close(cmd);
#   cmd   = "md5sum -c --status " inax "lexxpat.md5 >/dev/null 2>&1"
#   lxpat = system(cmd); close(cmd);
   };

 # Читаем базовый список слов
  cache = inax "wdb0.bin"
  if (wdb0 == 0 && gawk52 == 1) { reada(cache, wordbase0) } else { cmd = "zcat " indb "wordbase0.gz"; savefs = FS; FS = "[_= ]"
      while ((cmd|getline) > 0) { wordbase0[$2] }; close(cmd); FS = savefs;
  if (gawk52 == 1) {writea(cache, wordbase0); cmd = "md5sum " cache " " indb "wordbase0.gz > " inax "wdb0.md5"; system(cmd); close(cmd)};};

  #

      cmd = "cat gwt-" book "/anycap-may.pat"; savefs = FS; FS = "[_= ]"
      while ((cmd|getline) > 0) { anycap_may[$2] }; close(cmd); FS = savefs;

      cmd = "cat gwt-" book "/surcap-raw.pat"; savefs = FS; FS = "[_= ]"
      while ((cmd|getline) > 0) { surcap_raw[$2] }; close(cmd); FS = savefs;

      for (i in anycap_may) { if (!(i in wordbase0)) anycap_lex_pat[i]; print "_" i "=" >> "gwt-" book "/anycap-lex.pat" }; fflush();
      for (i in anycap_may) { if (  i in wordbase0 ) anycap_bas_pat[i]; print "_" i "=" >> "gwt-" book "/anycap-bas.pat" }; fflush();
      for (i in surcap_raw) { if (!(i in wordbase0)) surcap_lex_pat[i]; print "_" i "=" >> "gwt-" book "/surcap-lex.pat" }; fflush();
      for (i in surcap_raw) { if (  i in wordbase0 ) surcap_bas_pat[i]; print "_" i "=" >> "gwt-" book "/surcap-bas.pat" }; fflush();

}
