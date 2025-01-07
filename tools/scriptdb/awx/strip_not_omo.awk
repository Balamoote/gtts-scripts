# Очистить файл от ударений и служебного, кроме указанных слов
# somo = отдельное слово
# xomo = группа омографов
# indb = путь к файлу automo.gz
function splitline(string,    ret) {              # Разбить строку на слова
                ret=patsplit(string,l,patword,sep); return ret }
function joinpat(array, seps, nuf,    ret, i, k) {  # Склеить строку обратно
                ret = seps[0]; for (i=1; i<= nuf; i++) {ret = ret array[i] seps[i]}; return ret }
function lc(n,   ret) {                             # перевести в нижний регистр и пастеризовать
                ret = gensub(unxy,"","g",tolower(l[i])); gsub(/ё/,"е",ret); return ret }
BEGIN {
   _unxy   = "\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0"
   _RUUC   = "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"
   _rulc   = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"

   unxy    = "[" _unxy "]"
   patword = "[" _RUUC _rulc _unxy "0-9]+"

   cmd = "zcat " indb "automo.gz"; while ((cmd|getline) > 0) { automo[$1][$2] };

   somo = tolower(somo);
   xomo = tolower(xomo);

 }{

  nf=splitline($0);
  for (i in l) {
    if ( somo ) { word = lc(i); if (word != somo) { l[i] = gensub(unxy,"","g",l[i]) }; };i
    if ( xomo ) { word = lc(i); if ( !(word in automo[xomo]) ) { l[i] = gensub(unxy,"","g",l[i]) }; };i
  }

  line = joinpat(l,sep,nf)
  print line

   }
