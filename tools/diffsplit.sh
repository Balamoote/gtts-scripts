#!/bin/bash

diff $1 $2 | egrep "^< " | sed -r "s/^< //g; s/$/\n/g" > _dif_cmp.txt
diff $1 $2 | egrep "^> " | sed -r "s/^> //g; s/$/\n/g" > _dif.txt

./stripper.sh _dif.txt -sa
mv _dif.txt _dif.txt.man
mv _dif.txt.str _dif.txt
