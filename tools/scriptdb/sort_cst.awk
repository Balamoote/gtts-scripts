# Утилита сортировки строк типа cst="стр3 стр1 стр2" в строки cst="стр1 стр2 стр3"
# 
# Для приведения в порядок скриптов sed с их списками вариантов поисковых строк:
# 
#   awk -f sort_cst.awk omo-index.sed > omo-insex.sed-sorted
#
# Вложенные скобки считаются ошибкой, т.к. это сказывается на производительности.
# Если выходной файл отличается по размеру от входного, обязательно нужно проверить, почему так получилось.
#
# Последняя версия файла находится тут: https://github.com/Balamoote/gtts-scripts
function sortchunk(chunk, sep,     rett, charr, chars, i, chnum)
{        split(chunk, charr, sep); for ( i in charr ) { chars[charr[i]] = charr[i] }; chnum = asort(chars);
         rett = chars[1]; for ( i = 2; i <= chnum; i++ ) { rett = rett sep chars[i] }; return rett };

BEGIN { RS = "\n";
        reg = "cst=\x22[А-ЯЁёа-я0-9 ]+\x22";
      }
{
    if ($0 ~ reg ) {
      cline = "";
      rump  = $0;

        sp = index ( rump, "cst=\x22" );
        fp = index ( rump, "\x22;" );
        chunk = sortchunk(substr (rump, sp+5, fp-sp-5), " ");

        cline = cline substr (rump, 1, sp+4) chunk substr(rump, fp);

     print cline;

     } else { print $0 };
}
