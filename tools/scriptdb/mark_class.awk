function readfile(file,  tmp, save_rs)            # Функция чтения файла в скаляр
                { save_rs = RS; RS = "^$"; getline tmp < file; close(file); RS = save_rs; return tmp }

BEGIN {

	classin=readfile("class.list");
	oc=split(classin,omoli,"\n");

	for(i=1; i < oc; i++) { split(omoli[i],omor," "); pair=omor[2] "|" omor[3]; omoreg[pair]=omor[1]; }

} {


if (substr($3,1,1)!="x") {
	fn1=$1; fn2=$2; fn3=$3; fn0=$0; if(fn4) {fn4= " " $4}; 
	if (fn1==fo1) {

           xclass[1]=fn3; xclass[2]=fo3; asort(xclass);
           xtarget = xclass[1] "|" xclass[2];

	   li1 = fo1 " " fo2 " " omoreg[xtarget] "_" fo3 fo4 ;
           li2 = fn1 " " fn2 " " omoreg[xtarget] "_" fn3 fn4 ;
	   print li1; print li2
         };


	} else { print $0 }

fo1=fn1; fo2=fn2; fo3=fn3; fo4=fn4; fo0=fn0;


}
