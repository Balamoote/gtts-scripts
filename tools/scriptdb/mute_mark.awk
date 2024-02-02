# взять вывод statrep.awk и отметить несработавшие правила Z R V и т.д.
BEGIN {
   cmd = "cat _z.txt";
   while ((cmd|getline) > 0) {

      if ($3 == "empty"  ) { em[substr($1,2)] };
 
  }}

  {

#   targ = gensub(/^.*V\[([0-9]+)\]\+\+;.*$/,"\\1","g",$0)
#   targ = gensub(/^.*R\[([0-9]+)\]\+\+;.*$/,"\\1","g",$0)
    targ = gensub(/^.*Z\[([0-9]+)\]\+\+;.*$/,"\\1","g",$0)

    if ( targ in em ) {
      print $0, "#mute"
      } else {
      print $0
    }

    }
