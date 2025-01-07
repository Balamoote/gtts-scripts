# Подать на вход содержимое списков омографов (mano-*), получить выделение ударения капсом. Кроме начальной гласной
{

for (i=2; i<=NF; i++) { sinda[i]=index(gensub(/[\\xcab0-9]/,"","g",$i),"\x27")-1 };

gsub("\\\\xcc\\\\xa0","\xcc\xa0",$0); gsub("\\\\xcc\\\\xa3","\xcc\xa3",$0); gsub("\\\\xcc\\\\xa4","\xcc\xa4",$0)
gsub("\\\\xcc\\\\xad","\xcc\xad",$0); gsub("\\\\xcc\\\\xb0","\xcc\xb0",$0); gsub("\x27","\xcc\x81",$0); gsub(/[_=]/,"",$0)

for (i=2; i<=NF; i++) {
  if (sinda[i] > 1) {
    w0rd=substr($1,1,sinda[i]-1) toupper(substr($1,sinda[i],1)) substr($1,sinda[i]+1);
    W0rd=toupper(substr(w0rd,1,1)) substr(w0rd,2);
    print w0rd "\n" W0rd };
  }; 

}
