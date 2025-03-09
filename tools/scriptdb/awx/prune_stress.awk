# Скипт сортировки акцентированных словоформ 
BEGIN { PROCINFO["sorted_in"]="@ind_num_asc" }
      {
         word[$1][$2];
         
         gsub("ё","е",$0); gsub("\x27","",$0);
         if (ignore_hy == 1) {  gsub("-","",$0) }
         if ($1 != $2) printf("%s %s\n", "Ошибка:", $0)
      }
END {

  totnum = length(word)
  printf("%s %s\n", "Акцентированных словоформ:", totnum  )

       for (i in word) {
          for (j in word[i]) {

            if (length(word[i])==1) { print "_" i "=" j >> "_U_una"}
            else { print "_" i "=" j >> "_U_omo"}

      }}
 }
