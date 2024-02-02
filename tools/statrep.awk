# Обработать и отсортировать вывод дебажного массива (см. dbgstat = 0|1 в main.awk и аргументы DO_DEBUG() в конце deomo.awk)
{

n=substr($1,2);
a[n] = a[n] + $3

}
END { 
  for (i=1; i<=927; i++) {
      if ( a[i] ) { print n i, "=", a[i]} else {print n i, "=", "empty" }
  }
 }
