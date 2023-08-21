# Утилита сортировки строк типа (стр3|стр1|стр2) в строки (стр1|стр2|стр3)
# (устарела, т.к. скрипты этого типа не используются)
# Для приведения в порядок скриптов sed с их списками вариантов поисковых строк:
# 
#   awk -f sort_opt.awk omo-index.sed > omo-insex.sed-sorted
#
# Вложенные скобки считаются ошибкой, т.к. это сказывается на производительности.
# Если выходной файл отличается по размеру от входного, обязательно нужно проверить, почему так получилось.
#
# Последняя версия файла находится тут: https://github.com/Balamoote/gtts-scripts
function sortchunk(chunk, sep,     ret, charr, chars, i, chnum)
{        split(chunk, charr, sep); for ( i in charr ) { chars[charr[i]] = charr[i] }; chnum = asort(chars);
         ret = chars[1]; for ( i = 2; i <= chnum; i++ ) { ret = ret sep chars[i] }; return ret };

BEGIN { RS = "\n";
	reg = "\\[" "[А-ЯЁёа-я]+" "\\]";
      }
{
    if ($0 ~ /\(/ ) {
      cline = "";
      rump  = $0;

    while ( rump ~ "\\(" ) {

        sp = index ( rump, "(" );
        fp = index ( rump, ")" );
        chunk = sortchunk(substr (rump, sp+1, fp-sp-1), "|");

          if ( chunk ~ /[^[]\(/ ) { printf ("\033[31m%s %s\n\033[93m%s\033[0m\n", "Вложенные скобки! Выполнение прервано!", "Проблемная строка:", $0 ); exit 1 };

        cline = cline substr (rump, 1, sp) chunk ")";
        rump  = substr(rump, fp+1);

    };
    
   cline = cline rump;
   rump  = cline; cline = ""

      reg = "\\[" "[А-ЯЁёа-я]+" "\\]"

    while ( match(rump, reg) > 0) {
        chunk = sortchunk(substr (rump, RSTART+1, RLENGTH-2), "");
        cline = cline substr (rump, 1, RSTART) chunk "]";
        rump  = substr(rump, RSTART+RLENGTH);
    };

     cline = cline rump;
     print cline;

     } else { print $0 };
}
