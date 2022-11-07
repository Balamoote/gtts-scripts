# Утилита сортировки строк типа (стр3|стр1|стр2) в строки (стр1|стр2|стр3)
# 
# Для приведения в порядок скриптов sed с их списками вариантов поисковых строк:
# 
#   awk -f optsort.awk omo-index.sed > omo-insex.sed-sorted
#
# Вложенные скобки считаются ошибкой, т.к. это сказывается на производительности.
#
# Последняя версия файла находится тут: https://github.com/Balamoote/gtts-scripts
function sortchunk(chunk,    rett, charr, chars, sep, i, chnum)
{        split(chunk, charr, "|"); for ( i in charr ) { chars[charr[i]] = charr[i] }; chnum = asort(chars);
         sep = "|"; rett = chars[1]; for ( i = 2; i <= chnum; i++ ) { rett = rett sep chars[i] }; return rett };

BEGIN { RS = "\n" }
{
    if ($0 ~ "\\|" ) {
      cline = "";
      rump  = $0;

      while ( rump ~ "\\(" ) {

          sp = index( rump, "(" );
          fp = index( rump, ")" );
          chunk = sortchunk(substr(rump, sp+1, fp-sp-1));

            if ( chunk ~ "\\(" ) { printf ("\033[31m%s %s\n\033[93m%s\033[0m\n", "Вложенные скобки! Выполнение прервано!", "Проблемная строка:", $0 ); exit 1 };

          cline = cline substr(rump, 1, sp) chunk ")";
          rump  = substr(rump, fp+1);

      };
        cline = cline rump;
        print cline;
     } else { print $0 };
}
