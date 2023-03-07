# Деомографизатор
# Читает файл(ы) словаря с морфологической информацией и заменяет омографы согласно правилам

# Перенумеровать правила в vim:
# let @a=1|%s/"R\zs\d\+\ze"/\=''.(@a+setreg('a',@a+1))/g|%s/ r\[\zs\d\+\ze\]++; if(dbg){print "R\(\d\+\)"/\1/g|%s/{system(cmd); for (i=1; i<=\zs\d\+\ze;/\=''.(@a-1)/g
#
# NB: во всех функциях поле указывается относительно 0, 0 - это позиция поискового слова.
# если задана переменные indb при запуске, то искать словари в директории "indb/", иначе по месту запуска
# если задана переменные inax при запуске, то писать служебные файлы в директории "inax/", иначе по месту запуска (имеет смысл только для gawk>=5.2.1)
# Последняя версия файла тут: https://github.com/Balamoote/gtts-scripts
### START !_#_!

@include "scriptdb/functions.awk"
@include "scriptdb/defunct.awk"
@include "scriptdb/classes.awk"

BEGIN { PROCINFO["sorted_in"]="@ind_num_asc"

   #dbg = 0
   #dbgstat = 0

   unxy    = "[\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
   unxn    = "[^\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
   RUUC    = "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ]+"
   rulc    = "[абвгдеёжзийклмнопрстуфхцчшщъыьэюя]+"
   patword = "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb00-9]+"
   regword = "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
   fsword  = "[^АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
   capword = "^[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ]+$"
   vvpat   = "[,—]"
   hysnip  = regword "[-]" regword

   savefs = FS;
   FS = fsword;
} {
    num++; book[num] = $0;

    for (i=1; i<=NF; i++) { ci=tolower($i);
#_#_#txtmppra
        if($i in vse    && num!=o000    ) {vseT [ci]             = vseT [ci]             num " "; o000     = num}; # "все" (но не вСЕ,вСе,всЕ)   #_#_# vsez !_#_!
        if($i in allomo && num!=o001[$i]) {omap [allomo[$i]][$i] = omap [allomo[$i]][$i] num " "; o001[$i] = num}; # 
#_#_#txtmpprb

  };
} END {

FS = savefs
###START_END###

### все !_#_!
for(wrd in vseT){wln=split(vseT[wrd],omlin," ");for(y=1;y<=wln;y++){b=strtonum(omlin[y]);nf=splitline(book[b]);hyphback(book[b]); # header1
getwpos(wrd);for(i in wpos){i=strtonum(i);if(tolower(l[i])!=tolower(wrd))continue;is_vsyo=vsyo[l[i]];is_vsje=vsje[l[i]];          # header2

 #v всё же
 if ( w(-1,"не") &&
       w(1,"же ж") &&
       (suw_mnim(2)||gl_vzmn(2)) && s(-1,1) )
 { l[i]=is_vsje; r[1]++; if(dbg){print "R1"}; continue};
 if ( w(1,"же ж") &&
       mest_it(2) &&
        gl_pnmn(3) && s(0,2) )
 { l[i]=is_vsje; r[2]++; if(dbg){print "R2"}; continue};
 if ( s(0,0) && w(1,"же ж равно едино одно") )
 { l[i]=is_vsyo; r[3]++; if(dbg){print "R3"}; continue};

 # География
 if ( (geo_sr(1)||wc(1,"[ео]во$ [иы]но$")) && s(0,0) && cap(1) )
 { l[i]=is_vsyo; r[4]++; if(dbg){print "R4"}; continue};
 if ( geo_mn(1) && s(0,0) && cap(1) )
 { l[i]=is_vsje; r[5]++; if(dbg){print "R5"}; continue};


 #v всё в (порядке)
 if ( w(1,"ли") &&
       pre_tv(2) &&
       (mest_tv(3)||prl_edtv(3)||prl_mntv(3)) &&
        (suw_edtv(4)||suw_mntv(4)) &&
          w(5,"в") &&
           w(6,"порядке норме ажуре шоколаде исправности") && s(0,5) && (p(6)||w(7,"и")||pre_any(7)||gl_edsr(7)) )
 { l[i]=is_vsyo; r[6]++; if(dbg){print "R6"}; continue};
 if ( w(1,"ли") &&
       pre_tv(2) &&
       (mest_tv(3)||suw_edtv(3)||suw_mntv(3)) &&
         w(4,"в") &&
          w(5,"порядке норме ажуре шоколаде исправности") && s(0,4) && (p(5)||w(6,"и")||pre_any(6)||gl_edsr(6)) )
 { l[i]=is_vsyo; r[7]++; if(dbg){print "R7"}; continue};
 if ( w(1,"ли уже ведь") &&
       nar_mest(2) &&
        w(3,"в") &&
         w(4,"порядке норме ажуре шоколаде исправности") && s(0,3) && (p(4)||w(5,"и")||pre_any(5)||gl_edsr(5)) )
 { l[i]=is_vsyo; r[8]++; if(dbg){print "R8"}; continue};
 if ( w(1,"ли уже ведь") &&
       w(2,"в") &&
        w(3,"порядке норме ажуре шоколаде исправности") && s(0,2) && (p(3)||w(4,"и")||pre_any(4)||gl_edsr(4)) )
 { l[i]=is_vsyo; r[9]++; if(dbg){print "R9"}; continue};
 if ( (phf(1,"как будто")||phf(1,"вроде бы")) &&
        w(hfn,"в") &&
         prl_edpr(hfn+1) &&
          w(hfn+2,"порядке норме ажуре шоколаде исправности") && s(0,hfn+1) && (p(hfn+2)||w(hfn+3,"и")||pre_any(3)||gl_edsr(hfn+3)) )
 { l[i]=is_vsyo; r[10]++; if(dbg){print "R10"}; continue};
 if ( (phf(1,"как будто")||phf(1,"вроде бы")) &&
        w(hfn,"в") &&
         w(hfn+1,"порядке норме ажуре шоколаде исправности") && s(0,hfn) && (p(hfn+1)||w(hfn+2,"и")||pre_any(2)||gl_edsr(hfn+2)) )
 { l[i]=is_vsyo; r[11]++; if(dbg){print "R11"}; continue};
 if ( (qast(1)||nar_mest(1)) &&
        w(2,"в") &&
         w(3,"порядке норме ажуре шоколаде исправности") && s(0,2) && (p(3)||w(4,"и")||pre_any(4)||gl_edsr(4)) )
 { l[i]=is_vsyo; r[12]++; if(dbg){print "R12"}; continue};
 if ( w(1,"в") &&
      (prl_edpr(2)||prq_edpr(2)) &&
        w(3,"порядке порядок норме норму ажуре шоколаде исправности") && s(0,2) && (p(3)||w(4,"и")||pre_any(4)||gl_edsr(4)) )
 { l[i]=is_vsyo; r[13]++; if(dbg){print "R13"}; continue};
 if ( w(1,"в") &&
       w(2,"порядке порядок норме норму ажуре шоколаде целом исправности меру") && s(0,1) && (p(2)||w(3,"и")||pre_any(3)||gl_edsr(3)) )
 { l[i]=is_vsyo; r[14]++; if(dbg){print "R14"}; continue};
 if ( qast(1) &&
       w(2,"на") &&
        w(3,"мази") && s(0,2) && (p(3)||w(4,"и")) )
 { l[i]=is_vsyo; r[15]++; if(dbg){print "R15"}; continue};
 if ( w(1,"на") &&
       w(2,"мази") && s(0,1) && (p(2)||w(3,"и")) )
 { l[i]=is_vsyo; r[16]++; if(dbg){print "R16"}; continue};

 # все все
 if ( w(1,"все") &&
      (gl_pemn(2)||gl_pnmn(2)||gl_nemn(2)) && s(0,1) )
 { l[i]=is_vsje; r[17]++; if(dbg){print "R17"}; continue};
 if ( wist(-1,"все́") &&
      (gl_pemn(1)||gl_pnmn(1)||gl_nemn(1)) && s(-1,0) )
 { l[i]=is_vsyo; r[18]++; if(dbg){print "R18"}; continue};


 #v всё ещё
 if ( w(1,"ещё еще") && s(0,0) )
 { l[i]=is_vsyo; r[19]++; if(dbg){print "R19"}; continue};

 #v всё ещё
 if ( w(1,"и") &&
       w(2,"вся") && s(0,1) )
 { l[i]=is_vsyo; r[20]++; if(dbg){print "R20"}; continue};
 if ( w(1,"и") &&
       w(2,"всяческие") && s(0,1) )
 { l[i]=is_vsje; r[21]++; if(dbg){print "R21"}; continue};

 #v всё так и
 if ( phf(1,"так и") &&
      (gl_edsr(3)||w(3,"есть")) && s(0,2) )
 { l[i]=is_vsyo; r[22]++; if(dbg){print "R22"}; continue};
 if ( phf(1,"так и") &&
      (gl_nemn(3)||gl_pemn(3)||gl_pnmn(3)) && s(0,2) )
 { l[i]=is_vsje; r[23]++; if(dbg){print "R23"}; continue};
 if ( phs(-1,"и так") && !(mest_mn(hsn)) &&
      (gl_nemn(1)||gl_pemn(1)||gl_pnmn(1)) && !(glc_mn(1,"syg")) && s(hsn+1,0) )
 { l[i]=is_vsje; r[24]++; if(dbg){print "R24"}; continue};
 if ( phf(1,"и так") &&
      (gl_ed(3)||w(3,"есть")) && s(0,2) )
 { l[i]=is_vsyo; r[25]++; if(dbg){print "R25"}; continue};


 # фразы

 if ( phf(1,"бы ничего") && sc(hfn-1,",") && s(0,hfn-2) &&
       w(hfn,"только но да однако") )
 { l[i]=is_vsyo; r[26]++; if(dbg){print "R26"}; continue};

 if ( w(-1,"на") && (phf(1,"про все")||phf(1,"про всё")) && s(-1,1) )
 { l[i]=is_vsyo; r[27]++; if(dbg){print "R27"}; continue};
 if ( (phs(-1,"на всё про")||phs(-1,"на все про")) && s(-3,-1) )
 { l[i]=is_vsyo; r[28]++; if(dbg){print "R28"}; continue};

 if ((phs(-1,"вот и")||
      phs(-1,"ну вот и") ) &&
       s(hsn+1,-1) && p(0) )
 { l[i]=is_vsyo; r[29]++; if(dbg){print "R29"}; continue};


 if ((phf(1,"не слава богу")||
      phf(1,"одно и то же")||
      phf(1,"раз и навсегда")||
      phf(1,"как на духу")||
      phf(1,"точно так")||
      phf(1,"или ничего")||
      phf(1,"и дело")||
      phf(1,"это само по себе")||
      phf(1,"совсем не так") ) &&
       s(0,hfn-2) )
 { l[i]=is_vsyo; r[30]++; if(dbg){print "R30"}; continue};

 if ((phf(1,"на одно лицо")||
      phf(1,"в одном лице")||
      phf(1,"под богом ходим")||
      phf(1,"за и против") ) &&
       s(0,hfn-2) )
 { l[i]=is_vsje; r[31]++; if(dbg){print "R31"}; continue};

 if ( mest_mnim(1) &&
      (nar_mest(2)||nar_vrem(2)) &&
      (phf(3,"на одно лицо")||
       phf(3,"под богом ходим") ) &&
        s(0,hfn-2) )
 { l[i]=is_vsje; r[32]++; if(dbg){print "R32"}; continue};

 if ( mest_mnim(1) &&
      (phf(2,"на одно лицо")||
       phf(2,"под богом ходим") ) &&
        s(0,hfn-2) )
 { l[i]=is_vsje; r[33]++; if(dbg){print "R33"}; continue};

 if ((phf(1,"не так уж")||
      phf(1,"так уж") ) &&
       prl_kred_sr(hfn) && s(0,hfn-1) )
 { l[i]=is_vsyo; r[34]++; if(dbg){print "R34"}; continue};

 if ( phf(1,"потому что") && s(0,0) && sc(1,",") )
 { l[i]=is_vsyo; r[35]++; if(dbg){print "R35"}; continue};
 if ( phf(1,"тип топ") && s(0,0) && se(1,"-") )
 { l[i]=is_vsyo; r[36]++; if(dbg){print "R36"}; continue};
 if ( phf(1,"не так") && s(0,hfn-2) && p(hfn-1) )
 { l[i]=is_vsyo; r[37]++; if(dbg){print "R37"}; continue};

 if ((phf(1,"в том же")||
      phf(1,"в таком") ) && w(hfn,"роде духе разрезе виде смысле") && s(0,hfn-1) )
 { l[i]=is_vsyo; r[38]++; if(dbg){print "R38"}; continue};


 if ( mest_mnim(1) &&
       phf(2,"под богом ходим") && s(0,2) )
 { l[i]=is_vsje; r[39]++; if(dbg){print "R39"}; continue};
 if ( phf(1,"только и") &&
      (gl_pnmn(3)||gl_pemn(3)||gl_nemn(3)) &&
        w(4,"что") && s(0,2) && sc(3,",") )
 { l[i]=is_vsje; r[40]++; if(dbg){print "R40"}; continue};
 if ( w(1,"как") &&
       w(2,"один одна") && ( s(0,1)||( sc(0,",") && s(1,1)) ) )
 { l[i]=is_vsje; r[41]++; if(dbg){print "R41"}; continue};

 if ( phf(1,"не так уж") &&
       w(4,"и") &&
        prl_kred_sr(5) && s(0,4) )
 { l[i]=is_vsyo; r[42]++; if(dbg){print "R42"}; continue};
 if ( w(-1,"и") && p(0,",") && s(-1,-1) && (w(-2,"p")||p(-2)) )
 { l[i]=is_vsyo; r[43]++; if(dbg){print "R43"}; continue};

 if ( phs(-1,"всё равно") &&
       gl_pnmn(1) &&
       (mest_ed(2)||mest_mn(2)) && s(-1,0) && sc(1,",") )
 { l[i]=is_vsje; r[44]++; if(dbg){print "R44"}; continue};
 if ( phf(1,"больше по") &&
      (suw_edda(3)||suw_mnda(3)) && s(0,2) )
 { l[i]=is_vsyo; r[45]++; if(dbg){print "R45"}; continue};

 if ( (phf(1,"песенка спета")) &&
       (cap(0)||p(-1)||w(-1,"и")) && sc(0,",") && s(1,hfn-2) && p(hfn-1) )
 { l[i]=is_vsyo; r[46]++; if(dbg){print "R46"}; continue};

 if ( w(1,"позади понапрасну") && s(0,0) && p(1) )
 { l[i]=is_vsyo; r[47]++; if(dbg){print "R47"}; continue};
  if ( wf(5,"до") &&
       w(wfn+1,"одного единого единой") && s(0,wfn) )
 { l[i]=is_vsje; r[48]++; if(dbg){print "R48"}; continue};

 if ( w(-1,"и") &&
       w(1,"лишь только") &&
       (w(2,"потому оттого")||pre_vi(2)||pre_ro(2)) && s(-1,1) )
 { l[i]=is_vsyo; r[49]++; if(dbg){print "R49"}; continue};
 if ( w(-1,"и") && s(-1,-1) && p(0,",") )
 { l[i]=is_vsyo; r[50]++; if(dbg){print "R50"}; continue};
 if ( w(-1,"и") && s(-1,-1) &&
       w(1,"что") && sc(0,0,",") )
 { l[i]=is_vsyo; r[51]++; if(dbg){print "R51"}; continue};

 # Это

 # все + сущ.мн.
 if ( mest_it(1) &&
      (gl_vzmn(2)||gl_nemn(2)||mod_bz(2)) && s(0,1) )
 { l[i]=is_vsyo; r[52]++; if(dbg){print "R52"}; continue};
 if ((phs(-1,"ещё далеко не")||
      phs(-1,"ещё не")||
      phs(-1,"далеко не") ) &&
      mest_it(hsn) && s(hsn,-1) )
 { l[i]=is_vsyo; r[53]++; if(dbg){print "R53"}; continue};

 if ( mest_it(1) &&
      (phf(2,"не более чем")||
       phf(2,"не в счёт") ) && s(0,hfn-2) )
 { l[i]=is_vsyo; r[54]++; if(dbg){print "R54"}; continue};
 if ( mest_it(-1) &&
       phf(1,"не по душе" ) && s(0,hfn-2) )
 { l[i]=is_vsyo; r[55]++; if(dbg){print "R55"}; continue};
 if ( mest_it(1) &&
       phf(2,"и в самом деле") &&
        nar_step(6) &&
         prl_kred_sr(7) && s(0,6) )
 { l[i]=is_vsyo; r[56]++; if(dbg){print "R56"}; continue};
 if ( mest_it(1) &&
       w(2,"никак") &&
        w(3,"не") &&
         gl_in(4) && s(0,3) )
 { l[i]=is_vsyo; r[57]++; if(dbg){print "R57"}; continue};
 if ( mest_it(-1) &&
       suw_mnim(1) && s(-1,0) && p(1) )
 { l[i]=is_vsyo; r[58]++; if(dbg){print "R58"}; continue};
 if ( mest_it(-1) &&
       suw_mnim(1) && s(-1,0) )
 { l[i]=is_vsyo; r[59]++; if(dbg){print "R59"}; continue};
 if ( mest_it(1) &&
       mest_im(2) &&
        mest_da(3) && s(0,2) )
 { l[i]=is_vsyo; r[60]++; if(dbg){print "R60"}; continue};
 if ( mest_it(1) &&
       mest_da(2) &&
       (nar_vrem(3)||nar_step(3)) &&
         prl_kred_sr(4) && s(0,3) )
 { l[i]=is_vsyo; r[61]++; if(dbg){print "R61"}; continue};
 if ( mest_it(1) &&
       mest_da(2) &&
       (nar_vrem(3)||nar_step(3)) &&
         w(4,"не") &&
          gl_ed(5) && s(0,4) )
 { l[i]=is_vsyo; r[62]++; if(dbg){print "R62"}; continue};
 if ( mest_it(1) &&
       mest_da(2) &&
        prl_kred_sr(3) && s(0,2) && p(3) )
 { l[i]=is_vsyo; r[63]++; if(dbg){print "R63"}; continue};
 if ( mest_da(-1) &&
       mest_it(1) && s(-1,0) )
 { l[i]=is_vsyo; r[64]++; if(dbg){print "R64"}; continue};
 if ( nar_vopr(-2) &&
       mest_it(-1) && s(-2,-1) && p(0) )
 { l[i]=is_vsyo; r[65]++; if(dbg){print "R65"}; continue};
 if ( mest_it(-1) &&
       suw_edim(1) && s(-1,0) )
 { l[i]=is_vsyo; r[66]++; if(dbg){print "R66"}; continue};
 if ( (pre_vi(-1)||pre_ro(-1)||pre_da(-1)) &&
       gl_nemn(1) && s(-1,0) )
 { l[i]=is_vsyo; r[67]++; if(dbg){print "R67"}; continue};
 if ( (pre_vi(-1)||pre_ro(-1)||pre_da(-1)) &&
       mest_it(1) && s(-1,0) )
 { l[i]=is_vsyo; r[68]++; if(dbg){print "R68"}; continue};
 if ( mest_it(1) &&
       suw_edim(2) && s(0,1) )
 { l[i]=is_vsyo; r[69]++; if(dbg){print "R69"}; continue};
 if ( qast(1) &&
       mest_it(2) && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[70]++; if(dbg){print "R70"}; continue};
 if ( mest_it(1) &&
       suw_mnim(2) && s(0,1) )
 { l[i]=is_vsyo; r[71]++; if(dbg){print "R71"}; continue};
 if ( mest_it(1) &&
      (nar_kaq(2)||nar_spos(2)||mest_ed(2)) && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[72]++; if(dbg){print "R72"}; continue};
 if ( mest_it(1) &&
       pre_ro(2) &&
       (mest_ro(3)||suw_edro(3)||suw_mnro(3)) && s(0,2) && p(3) )
 { l[i]=is_vsyo; r[73]++; if(dbg){print "R73"}; continue};
 if ( mest_it(-1) &&
       pre_da(1) &&
       (mest_da(2)||suw_edda(2)||suw_mnda(2)||prl_edda(2)||prl_mnda(2)) && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[74]++; if(dbg){print "R74"}; continue};
 if ( mest_it(-1) &&
       pre_ro(1) &&
       (mest_ro(2)||suw_edro(2)||suw_mnro(2)) && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[75]++; if(dbg){print "R75"}; continue};
 if ( mest_it(1) &&
       qast(2) &&
        pre_ro(3) &&
        (mest_ro(4)||suw_edro(4)||suw_mnro(4)) && s(0,3) && p(4) )
 { l[i]=is_vsyo; r[76]++; if(dbg){print "R76"}; continue};
 if ( mest_it(-1) &&
       mest_da(1) && s(-1,0) && p(1) )
 { l[i]=is_vsyo; r[77]++; if(dbg){print "R77"}; continue};
 if ( mest_it(1) &&
       nar_vrem(2) &&
       (gl_pnmn(3)||gl_pemn(3)) &&
        (suw_mnvi(4)||prl_mnim(4)) && s(0,3) )
 { l[i]=is_vsyo; r[78]++; if(dbg){print "R78"}; continue};
 if ( mest_mn(-1) &&
       mest_it(1) &&
        (gl_pemn(2)||gl_pnmn(2)) && s(-1,1) && p(2))
 { l[i]=is_vsyo; r[79]++; if(dbg){print "R79"}; continue};
 if ( mest_mn(1) &&
       mest_it(2) &&
       (gl_pnmn(3)||gl_nemn(3)) && s(0,2) && p(3) )
 { l[i]=is_vsje; r[80]++; if(dbg){print "R80"}; continue};
 if ( mest_it(1) &&
       mest_mnim(2) &&
       (gl_pnmn(3)||gl_nemn(3)) &&
         pre_any(4) && s(0,4) )
 { l[i]=is_vsyo; r[81]++; if(dbg){print "R81"}; continue};
 if ( mest_it(-1) &&
       mest_im(1) &&
       (prl_kred(2)||prl_krmn(2)) && s(-1,1) )
 { l[i]=is_vsyo; r[82]++; if(dbg){print "R82"}; continue};
 if ( mest_it(-1) &&
       mest_ed(1) &&
        gl_ed(2) && s(-1,1) )
 { l[i]=is_vsyo; r[83]++; if(dbg){print "R83"}; continue};
 if ( mest_it(-1) &&
       mest_mn(1) &&
       (gl_pnmn(2)||gl_nemn(2)) && s(-1,1) && p(2) )
 { l[i]=is_vsyo; r[84]++; if(dbg){print "R84"}; continue};
 if ( gl_nemn(-1) &&
       mest_it(1) &&
        gl_in(2) && s(-1,1) )
 { l[i]=is_vsyo; r[85]++; if(dbg){print "R85"}; continue};
 if ( mest_it(1) && !(qf(5,"gl_pemn")||qf(5,"gl_pnmn")||qf(5,"gl_in")) && s(0,0) )
 { l[i]=is_vsyo; r[86]++; if(dbg){print "R86"}; continue};
 if ( mest_it(-2) && 
      w(-1,"не") && s(-2,-1) && p(0) )
 { l[i]=is_vsyo; r[87]++; if(dbg){print "R87"}; continue};
 if ( mest_it(1) &&
      (gl_ed(2)||gl_in(2)) && s(0,1) )
 { l[i]=is_vsyo; r[88]++; if(dbg){print "R88"}; continue};
 if ( (vvod(-2)||gl_ed(-2)) &&
        mest_it(-1) && sc(-2,",") && s(-1,-1) && p(0) )
 { l[i]=is_vsyo; r[89]++; if(dbg){print "R89"}; continue};


 # Все как и
 if ( phs(-1,"как и") && s(-2,0) &&
       mest_mn(1) )
 { l[i]=is_vsje; r[90]++; if(dbg){print "R90"}; continue};
 if ( phs(-2,"как и") && s(-3,-1) &&
       mest_mn(-1) )
 { l[i]=is_vsje; r[91]++; if(dbg){print "R91"}; continue};
 if ( phs(-1,"как и") &&
       (mest_im(1)||prl_mnim(1)) && s(-2,0) )
 { l[i]=is_vsje; r[92]++; if(dbg){print "R92"}; continue};
 if ( phs(-1,"как и") &&
       pre_ro(1) &&
        mest_ro(2) && s(-2,1) )
 { l[i]=is_vsje; r[93]++; if(dbg){print "R93"}; continue};

 # как все
 if ( (gl_in(-2)||prl_edim(-2)||prl_mnim(-2)||prl_edtv(-2)||prl_mntv(-2)) &&
        w(-1,"как") && s(-1,-1) && sc(-2,",") && p(0) )
 { l[i]=is_vsje; r[94]++; if(dbg){print "R94"}; continue};
 if ( gl_in(-2) &&
        w(-1,"как") && s(-2,-1) && p(0) )
 { l[i]=is_vsje; r[95]++; if(dbg){print "R95"}; continue};
 if ( mod_ed(-2) && sc(-2,",") &&
        w(-1,"как") && s(-2,-1) && p(0) )
 { l[i]=is_vsje; r[96]++; if(dbg){print "R96"}; continue};
 if ( w(1,"как") &&
       w(2,"будто") &&
        gl_edsr(3) && s(0,2) )
 { l[i]=is_vsyo; r[97]++; if(dbg){print "R97"}; continue};
 if ( w(1,"как") &&
       mod_bz(2) && s(0,1) )
 { l[i]=is_vsyo; r[98]++; if(dbg){print "R98"}; continue};

 # все как
 if ( w(1,"как") &&
       w(2,"надо нужно есть было") && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[99]++; if(dbg){print "R99"}; continue};
 if ( w(1,"как") &&
      (nar_mest(2)||nar_kaq(2)||nar_vrem(2)) && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[100]++; if(dbg){print "R100"}; continue};
 if ( gl_pemn(1) &&
       w(2,"как") &&
        w(3,"надо нужно есть было дома") && s(0,2) && p(3) )
 { l[i]=is_vsyo; r[101]++; if(dbg){print "R101"}; continue};
 if ( w(1,"как") && sc(0,",") &&
      (prl_edtv(2)||prl_mntv(2)) &&
       (suw_edtv(3)||suw_mntv(3)) && s(1,2) )
 { l[i]=is_vsyo; r[102]++; if(dbg){print "R102"}; continue};
 if ( w(1,"как") && sc(0,",") &&
      (mest_da(2)||suw_edda(2)||suw_mnda(2)) &&
        w(3,"и") &&
        (gl_in(4)||gl_ed(4)||gl_nemn(4)||gl_pemn(4)||gl_pnmn(4)) && s(1,3) )
 { l[i]=is_vsyo; r[103]++; if(dbg){print "R103"}; continue};

 # Все то же
 if ( phs(-2,"вот и") &&
       mest_mnim(-1) &&
       (mest_it(1)||muk_ed(1)||muk_mn(1)) &&
         w(2,"же ж") && s(0,1) )
 { l[i]=is_vsje; r[104]++; if(dbg){print "R104"}; continue};
 if ( prl_kred_sr(1) &&
      (mest_it(2)||muk_ed(2)||muk_mn(2)) &&
        w(3,"же ж") && s(0,2) )
 { l[i]=is_vsyo; r[105]++; if(dbg){print "R105"}; continue};
 if ( pre_vi(1) &&
      (mest_it(2)||muk_ed(2)||muk_mn(2)) &&
        w(3,"же ж") && s(0,2) )
 { l[i]=is_vsyo; r[106]++; if(dbg){print "R106"}; continue};
 if ( (mest_it(1)||muk_ed(1)||muk_mn(1)) &&
        w(2,"же ж") && s(0,1) )
 { l[i]=is_vsyo; r[107]++; if(dbg){print "R107"}; continue};

 # Все то же
 if ( w(1,"вместе") && se(1," — ") &&
      (mest_mn(2)||mest_ed(2)||cap(2)) && sc(2,",") &&
       (mest_mn(3)||mest_ed(3)||cap(3)) && p(3) )
 { l[i]=is_vsje; r[108]++; if(dbg){print "R108"}; continue};

 #v Все + предлог
 if (!(mest_mn(-1)||mest_ed(-1)||gl_ed(-1)||gl_in(-1)||gl_vzmn(-1)||gl_nemn(-1)||gl_pemn(-1)||gl_pnmn(-1)||gl_poed(-1)||gl_pomn(-1)) &&
        pre_da(1) &&
        (suw_edda(2)||suw_mnda(2)) && s(0,0) )
 { l[i]=is_vsyo; r[109]++; if(dbg){print "R109"}; continue};
 if ( pre_da(-1) && s(0,0) )
 { l[i]=is_vsyo; r[110]++; if(dbg){print "R110"}; continue};
 if ( ( (w(1,"ли") && s(0,0) )||( w(1,"то") && se(0,"-") ) ) &&
       w(2,"у") &&
        mest_ro(3) &&
        (prl_kred_sr(4)||w(4,"есть")) && s(0,3) && p(4) )
 { l[i]=is_vsyo; r[111]++; if(dbg){print "R111"}; continue};
 if ( w(-3,"у") &&
       mest_ro(-2) &&
        nar_spos(-1) &&
         nar_mest(1) && s(-3,0) && p(1) )
 { l[i]=is_vsyo; r[112]++; if(dbg){print "R112"}; continue};
 if ( w(-2,"у") &&
       mest_ro(-1) &&
        nar_mest(1) && s(-2,0) && p(1) )
 { l[i]=is_vsyo; r[113]++; if(dbg){print "R113"}; continue};
 if ( pre_vi(-1) &&
       w(1,"чтобы") && s(-1,-1) && sc(0,",") )
 { l[i]=is_vsyo; r[114]++; if(dbg){print "R114"}; continue};
 if ( mest_mnim(1) && sc(0,",") &&
      (pre_ro(2)||pre_vi(2)) &&
        w(3,"кого") && s(1,2) )
 { l[i]=is_vsje; r[115]++; if(dbg){print "R115"}; continue};
 if ( (pre_ro(1)||pre_vi(1)) && sc(0,",") &&
       w(2,"кого" ) && s(1,1) )
 { l[i]=is_vsje; r[116]++; if(dbg){print "R116"}; continue};
 if ( pre_vi(1) &&
      (suw_edvi(2)||suw_mnvi(2)) &&
       (suw_edro(3)||suw_mnro(3)) && s(0,2) )
 { l[i]=is_vsyo; r[117]++; if(dbg){print "R117"}; continue};
 if ( pre_ro(-1) &&
      (prl_edro(1)||prl_mnro(1)) &&
       (suw_edro(2)||suw_mnro(2)) &&
         suw_mnro(3) && s(-1,2) )
 { l[i]=is_vsyo; r[118]++; if(dbg){print "R118"}; continue};
 if ( pre_ro(1) &&
       mest_ro(2) &&
        prq_edim(3) && s(0,2) )
 { l[i]=is_vsyo; r[119]++; if(dbg){print "R119"}; continue};
 if ( gl_in(-1) &&
       pre_ro(1) &&
       (suw_mnro(2)||suw_edro(2)||cap(2)) && s(0,1) )
 { l[i]=is_vsyo; r[120]++; if(dbg){print "R120"}; continue};
 if ( (gl_poed(-1)||gl_pomn(-1)||gl_povzmn(-1)) &&
       pre_da(1) &&
       (prl_edda(2)||prl_mnda(2)||mest_da(2)) &&
        (suw_edda(3)||suw_mnda(3)) && s(0,2) )
 { l[i]=is_vsyo; r[121]++; if(dbg){print "R121"}; continue};
 if ( (gl_poed(-1)||gl_pomn(-1)||gl_povzmn(-1)) &&
       pre_da(1) &&
       (suw_edda(2)||suw_mnda(2)) && s(0,1) )
 { l[i]=is_vsyo; r[122]++; if(dbg){print "R122"}; continue};
 if ( (gl_poed(-1)||gl_pomn(-1)||gl_povzmn(-1)) &&
       pre_ro(1) &&
       (prl_edro(2)||prl_mnro(2)||mest_ro(2)) &&
        (suw_edro(3)||suw_mnro(3)) && s(0,2) )
 { l[i]=is_vsyo; r[123]++; if(dbg){print "R123"}; continue};
 if ( (gl_poed(-1)||gl_pomn(-1)||gl_povzmn(-1)) &&
       pre_ro(1) &&
       (suw_edro(2)||suw_mnro(2)) && s(0,1) )
 { l[i]=is_vsyo; r[124]++; if(dbg){print "R124"}; continue};
 if ( pre_ro(1) &&
       (suw_mnro(2)) && s(0,1) )
 { l[i]=is_vsje; r[125]++; if(dbg){print "R125"}; continue};
 if ( pre_ro(1) && sc(0,",") &&
       (suw_mnro(2)||cap(2)) && s(1,1) && p(2) )
 { l[i]=is_vsje; r[126]++; if(dbg){print "R126"}; continue};
 if ( (pre_ro(-1)||pre_tv(-1)) && s(-1,-1) && p(0,",") )
 { l[i]=is_vsyo; r[127]++; if(dbg){print "R127"}; continue};
 if ( w(1,"за") &&
       mest_vi(2) &&
        w(3,"горой") && s(0,2) )
 { l[i]=is_vsje; r[128]++; if(dbg){print "R128"}; continue};
 if ( w(-1,"со ко") && s(-1,-1) )
 { l[i]=is_vsyo; r[129]++; if(dbg){print "R129"}; continue};
 if ( w(1,"до") &&
       w(2,"конца") && s(0,1) )
 { l[i]=is_vsyo; r[130]++; if(dbg){print "R130"}; continue};
 if ( w(1,"до") &&
       w(2,"единого") && s(0,1) )
 { l[i]=is_vsje; r[131]++; if(dbg){print "R131"}; continue};
 if ( pre_pr(-3) &&
      (prl_edpr(-2)||mest_pr(-2)) &&
       (suw_edpr(-1)||suw_mnpr(-1)) && s(-3,-1) && p(0) )
 { l[i]=is_vsyo; r[132]++; if(dbg){print "R132"}; continue};
 if ( (prl_edtv(-2)||prl_mntv(-2)||prl_edim(-2)||prl_mnim(-2)) &&
        pre_pr(-1) && s(-2,-1) && p(0) )
 { l[i]=is_vsyo; r[133]++; if(dbg){print "R133"}; continue};
 if ( pre_vi(-1) &&
        pre_any(1) && s(-1,0) )
 { l[i]=is_vsyo; r[134]++; if(dbg){print "R134"}; continue};

 # все что
 if ( w(1,"что") &&
       gl_ed(2) )
 { l[i]=is_vsyo; r[135]++; if(dbg){print "R135"}; continue};

 # всё, на что
 if ( sc(0,",") &&
       pre_vi(1) &&
        w(2,"что") && s(1,1) )
 { l[i]=is_vsyo; r[136]++; if(dbg){print "R136"}; continue};
 if ( sc(0,",") &&
       pre_vi(1) &&
        w(2,"кого") && s(1,1) )
 { l[i]=is_vsje; r[137]++; if(dbg){print "R137"}; continue};
 if ( pre_vi(-1) &&
       gl_vzmn(1) &&
       (mest_im(2)||prl_edim(2)||prl_mnim(2)) && s(-1,1) )
 { l[i]=is_vsyo; r[138]++; if(dbg){print "R138"}; continue};
 if ( sc(0,",") &&
       pre_da(1) &&
        w(2,"чему") && s(1,1) )
 { l[i]=is_vsyo; r[139]++; if(dbg){print "R139"}; continue};
 if ( sc(0,",") &&
       pre_da(1) &&
        w(2,"кому") && s(1,1) )
 { l[i]=is_vsje; r[140]++; if(dbg){print "R140"}; continue};
 if ( sc(0,",") &&
       pre_pr(1) &&
        w(2,"чём чем") && s(1,1) )
 { l[i]=is_vsyo; r[141]++; if(dbg){print "R141"}; continue};
 if ( sc(0,",") &&
       pre_pr(1) &&
        w(2,"ком") && s(1,1) )
 { l[i]=is_vsje; r[142]++; if(dbg){print "R142"}; continue};
 if ( pre_pr(1) &&
      (mest_pr(2)||suw_edpr(2)||suw_mnpr(2)) &&
        gl_edsr(3) && s(0,2) )
 { l[i]=is_vsyo; r[143]++; if(dbg){print "R143"}; continue};
 if ( pre_pr(-1) &&
       nar_mest(1) && s(-1,0) && p(1) )
 { l[i]=is_vsyo; r[144]++; if(dbg){print "R144"}; continue};
 if ( pre_pr(-2) &&
      (mest_pr(-1)||suw_edtv(2)||suw_mntv(2)) && s(-2,-1) && p(0) )
 { l[i]=is_vsyo; r[145]++; if(dbg){print "R145"}; continue};

 # всё так же
 if ( phf(1,"так же") &&
      (prl_kred(hfn)||gl_ed(hfn)||gl_vzmn(hfn)) && s(0,hfn-1) )
 { l[i]=is_vsyo; r[146]++; if(dbg){print "R146"}; continue};

 # предикат
 if ( predik(1) && sc(0,",") && p(1) )
 { l[i]=is_vsyo; r[147]++; if(dbg){print "R147"}; continue};
 if ( predik(1) && sc(0,",") && s(1,1) &&
       gl_in(2) && p(2) )
 { l[i]=is_vsyo; r[148]++; if(dbg){print "R148"}; continue};
 if ( predik(1) &&
       w(2,"и") &&
        predik(3) && s(0,2) && qq(1,3) )
 { l[i]=is_vsyo; r[149]++; if(dbg){print "R149"}; continue};

 # обращение
 if ( cap(1) && sc(0,",") && sc(1,",") &&
       nar_step(2) && p(2) )
 { l[i]=is_vsyo; r[150]++; if(dbg){print "R150"}; continue};


 # кастомные наречия
 if ( narc_napr(1,"jn") && s(0,0) && p(1) )
 { l[i]=is_vsje; r[151]++; if(dbg){print "R151"}; continue};


 # кастомные глаголы glc_, с возможностью учёта glc_(1,"mark") и метки m() в словаре dic_cust.gz
 if ( phf(1,"в один голос") && 
      glc_mn(hfn,"j") && s(0,hfn-1) )
 { l[i]=is_vsje; r[152]++; if(dbg){print "R152"}; continue};
 if ( glc_mn(1,"y") &&
       w(2,"и") &&
       (gl_pemn(3)||gl_nemn(3)||gl_pnmn(3)||gl_vzmn(3)) && s(0,2) )
 { l[i]=is_vsyo; r[153]++; if(dbg){print "R153"}; continue};
 if ( prl_kred_sr(1) &&
       glc_mn(2,"y") && s(0,1) )
 { l[i]=is_vsyo; r[154]++; if(dbg){print "R154"}; continue};
 if ( pre_pr(-4) &&
      (prl_edpr(-3)||prl_mnpr(-3)||mest_pr(-3)||wc(-3,"ой$ их$")) &&
       (suw_edpr(-2)||suw_mnpr(-2)) &&
         glc_mn(-1,"ogj") && s(-4,-1) && p(0) )
 { l[i]=is_vsje; r[155]++; if(dbg){print "R155"}; continue};
 if ( pre_pr(-3) &&
      (suw_edpr(-2)||suw_mnpr(-2)||mest_pr(-2)) &&
        glc_mn(-1,"ogj") && s(-3,-1) && p(0) )
 { l[i]=is_vsje; r[156]++; if(dbg){print "R156"}; continue};
 if ( pre_pr(-2) &&
      (suw_edpr(-1)||suw_mnpr(-1)) &&
        glc_mn(1,"ogj") && s(-2,0) && p(1) )
 { l[i]=is_vsje; r[157]++; if(dbg){print "R157"}; continue};
 if ( pre_pr(1) &&
      (prl_edpr(2)||prl_mnpr(2)||mest_pr(2)||wc(2,"ой$ их$")) &&
       (suw_edpr(3)||suw_mnpr(3)) &&
         glc_mn(4,"ogj") && s(0,3) && p(4) )
 { l[i]=is_vsje; r[158]++; if(dbg){print "R158"}; continue};
 if ( pre_pr(1) &&
      (suw_edpr(2)||suw_mnpr(2)) &&
        glc_mn(3,"ogj") && s(0,2) && p(3) )
 { l[i]=is_vsje; r[159]++; if(dbg){print "R159"}; continue};
 if ( mod_mn(1) &&
       glc_in(2,"py") &&
        pre_any(3) && s(0,3) )
 { l[i]=is_vsyo; r[160]++; if(dbg){print "R160"}; continue};
 if ( glc_in(-1,"qy") && s(-1,-1) &&
      (w(1,"чтобы будто")||mest_im(1)||nar_vopr(1)) && sc(0,",") )
 { l[i]=is_vsyo; r[161]++; if(dbg){print "R161"}; continue};
 if ( glc_mn(-1,"qy") && s(-1,-1) &&
      (w(1,"чтобы будто")||mest_im(1)||nar_vopr(1)) && sc(0,",") )
 { l[i]=is_vsyo; r[162]++; if(dbg){print "R162"}; continue};
 if ( (mest_mnim(1)||prl_kred_sr(1)) &&
       glc_mn(2,"qj") && s(0,1) &&
       (w(3,"чтобы будто куда")||mest_im(3)||nar_vopr(3)) && sc(2,",") )
 { l[i]=is_vsje; r[163]++; if(dbg){print "R163"}; continue};
 if ( glc_mn(1,"qj") && s(0,0) &&
       pre_any(2) &&
       (w(3,"чтобы будто")||mest_im(3)||nar_vopr(3)) && sc(1,",") )
 { l[i]=is_vsje; r[164]++; if(dbg){print "R164"}; continue};
 if ( mest_mnim(-4) &&
       w(-3,"же ведь") &&
        phs(-1,"и так") &&
         glc_mn(1,"syg") && s(hsn-1,0) )
 { l[i]=is_vsyo; r[165]++; if(dbg){print "R165"}; continue};
 if ( glc_mn(1,"qj") && s(0,0) &&
      (w(2,"чтобы будто")||mest_im(2)||nar_vopr(2)) && sc(1,",") )
 { l[i]=is_vsje; r[166]++; if(dbg){print "R166"}; continue};
 if ( mest_it(1) &&
       glc_mn(2,"syg") && s(0,1) )
 { l[i]=is_vsyo; r[167]++; if(dbg){print "R167"}; continue};
 if ( mest_mnim(-2) &&
       prl_kred_sr(-1) &&
        glc_mn(1,"syg") && s(-1,1) )
 { l[i]=is_vsyo; r[168]++; if(dbg){print "R168"}; continue};
 if ( mest_mnim(-2) &&
       prl_kred_sr(-1) &&
        prl_kred_sr(1) &&
         glc_mn(2,"syg") && s(-1,1) )
 { l[i]=is_vsyo; r[169]++; if(dbg){print "R169"}; continue};
 if ( mest_mnim(-1) &&
       phf(1,"не так") &&
        glc_mn(hfn,"syg") && s(-1,hfn-1) )
 { l[i]=is_vsyo; r[170]++; if(dbg){print "R170"}; continue};
 if ( mest_mn(-2) &&
       w(-1,"же ведь") &&
        mest_it(1) &&
         glc_mn(2,"syg") && s(-2,1) )
 { l[i]=is_vsyo; r[171]++; if(dbg){print "R171"}; continue};
 if ( w(-1,"так") &&
       glc_mn(1,"nj") && s(-1,0) && p(1) )
 { l[i]=is_vsje; r[172]++; if(dbg){print "R172"}; continue};
 if ( w(1,"так") &&
       glc_mn(2,"nj") && s(0,1) && p(2) )
 { l[i]=is_vsje; r[173]++; if(dbg){print "R173"}; continue};
 if ( mest_mnim(-2) &&
        glc_mn(-1,"sgy") &&
          pre_pr(1) &&
          (suw_edpr(2)||suw_mnpr(2)) && s(-2,1) )
 { l[i]=is_vsyo; r[174]++; if(dbg){print "R174"}; continue};
 if ( cap(-3) &&
       w(-2,"и") &&
        cap(-1) &&
         glc_mn(1,"syg") && s(-3,0) && p(1) )
 { l[i]=is_vsyo; r[175]++; if(dbg){print "R175"}; continue};
 if ( mest_mnim(1) &&
        glc_mn(2,"syg") && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[176]++; if(dbg){print "R176"}; continue};
 if ( mest_mnim(-2) &&
       prl_kred_sr(-1) &&
        glc_mn(1,"syg") && s(-2,0) && p(1) )
 { l[i]=is_vsyo; r[177]++; if(dbg){print "R177"}; continue};
 if ( mest_mnim(-2) &&
        glc_mn(-1,"sgy") && s(-2,-1) && p(0) )
 { l[i]=is_vsyo; r[178]++; if(dbg){print "R178"}; continue};
 if ( (suw_noedim(-2)||suw_nomnim(-2)) &&
        glc_mn(-1,"ogj") && s(-2,-1) && p(0) )
 { l[i]=is_vsje; r[179]++; if(dbg){print "R179"}; continue};
 if ( glc_po(-2,"j") &&
       mest_mnim(-1) && s(-2,-1) )
 { l[i]=is_vsje; r[180]++; if(dbg){print "R180"}; continue};
 if ( mest_mnim(-2) &&
       glc_mn(-1,"syg") &&
        (suw_edro(1)||suw_mnro(1)) &&
          pre_vi(2) && s(-2,2) )
 { l[i]=is_vsyo; r[181]++; if(dbg){print "R181"}; continue};
 if ( mest_mn(-1) &&
        glc_mn(1,"syg") && s(-1,0) && p(1) )
 { l[i]=is_vsyo; r[182]++; if(dbg){print "R182"}; continue};
 if ( mest_it(-1) &&
        glc_mn(1,"ogj") && s(-1,0) && p(1) )
 { l[i]=is_vsje; r[183]++; if(dbg){print "R183"}; continue};
 if ( (suw_edvi(-1)||suw_mnvi(-1)||suw_mntv(-1)||mest_vi(-1)) &&
        glc_mn(1,"ogj Vjg") && s(-1,0) && (p(1)||((w(2,"и")||pre_any(0)) && s(-1,1))) )
 { l[i]=is_vsje; r[184]++; if(dbg){print "R184"}; continue};
 if ( (suw_edvi(-2)||suw_mnvi(-2)||suw_mntv(-2)||mest_vi(-2)) &&
        glc_mn(-1,"ogj") && s(-2,-1) && p(0) )
 { l[i]=is_vsje; r[185]++; if(dbg){print "R185"}; continue};
 if ( glc_mn(1,"myg") && s(0,0) &&
       zvat(2) && sc(1,",") )
 { l[i]=is_vsyo; r[186]++; if(dbg){print "R186"}; continue};
 if ( pre_pr(1) &&
      (suw_edpr(2)||suw_mnpr(2)||suw_edme(2)) &&
        glc_mn(3,"pj") &&
         pre_any(4) && s(0,4) )
 { l[i]=is_vsje; r[187]++; if(dbg){print "R187"}; continue};
 if ( glc_po(1,"j") &&
       (mest_vi(2)||suw_edvi(2)||suw_mnvi(2)) && s(0,1) )
 { l[i]=is_vsje; r[188]++; if(dbg){print "R188"}; continue};
 if ( glc_mn(1,"pj") &&
       pre_any(2) && s(0,1) )
 { l[i]=is_vsje; r[189]++; if(dbg){print "R189"}; continue};
 if ( glc_mn(-2,"j") &&
       mest_da(-1) && s(-2,-1) )
 { l[i]=is_vsje; r[190]++; if(dbg){print "R190"}; continue};
 if ( vvod(-2) &&
       glc_mn(-1,"ogj") && sc(-2,",") && s(-1,-1) && p(0) )
 { l[i]=is_vsje; r[191]++; if(dbg){print "R191"}; continue};
 if ( glc_mn(1,"j") && s(0,0) &&
      !(w(2,"и") && qq(1,3)) )
 { l[i]=is_vsje; r[192]++; if(dbg){print "R192"}; continue};
 if ( glc_mn(-1,"j") && s(-1,-1) && p(0) )
 { l[i]=is_vsje; r[193]++; if(dbg){print "R193"}; continue};
 if ( w(1,"уже ведь") &&
       glc_mn(2,"y") && s(0,1) )
 { l[i]=is_vsyo; r[194]++; if(dbg){print "R194"}; continue};
 if ( glc_mn(1,"y") && s(0,0) && p(1) )
 { l[i]=is_vsyo; r[195]++; if(dbg){print "R195"}; continue};
 if ( glc_mn(-1,"y") &&
       nar_step(1) && s(-1,0) )
 { l[i]=is_vsyo; r[196]++; if(dbg){print "R196"}; continue};
 if ( glc_mn(-1,"y") && s(-1,-1) && p(0) )
 { l[i]=is_vsyo; r[197]++; if(dbg){print "R197"}; continue};
 if ( glc_po(-1,"y") && s(-1,-1) && p(0) )
 { l[i]=is_vsyo; r[198]++; if(dbg){print "R198"}; continue};
 if ( (mest_da(-1)||suw_edda(-1)||suw_mnda(-1)) &&
       glc_mn(1,"oyg") && s(-1,0) )
 { l[i]=is_vsyo; r[199]++; if(dbg){print "R199"}; continue};
 if ( glc_mn(-1,"py") &&
       pre_vi(1) &&
       (suw_edvi(2)||suw_mnvi(2)) && s(-1,1) )
 { l[i]=is_vsyo; r[200]++; if(dbg){print "R200"}; continue};
 if ( pre_pr(1) &&
      (suw_edpr(2)||suw_mnpr(2)) &&
        glc_mn(3,"py") && s(0,2) )
 { l[i]=is_vsyo; r[201]++; if(dbg){print "R201"}; continue};
 
 # модальное mod_, с возможностью учёта метки m() в словаре dic_cust.gz
 if ( sc(0,",") && (cap(0)||p(-1)) &&
      (mod_ed(1)||mod_mn(1)) &&
        gl_in(2) && s(1,1) )
 { l[i]=is_vsyo; r[202]++; if(dbg){print "R202"}; continue};
 if ( mod_ed(1) &&
       gl_in(2) && s(0,1) )
 { l[i]=is_vsyo; r[203]++; if(dbg){print "R203"}; continue};
 if ( mod_mn(1) &&
       prl_kred_sr(2) &&
        gl_in(3) && s(0,2) )
 { l[i]=is_vsje; r[204]++; if(dbg){print "R204"}; continue};
 if ( mest_mn(-2) &&
       mod_mn(-1) &&
        gl_in(1) && s(-2,0) )
 { l[i]=is_vsyo; r[205]++; if(dbg){print "R205"}; continue};
 if ( gl_in(-2) &&
       mod_mn(-1) && s(-2,-1) )
 { l[i]=is_vsje; r[206]++; if(dbg){print "R206"}; continue};
 if ( mod_ed(-2) &&
       pre_vi(-1) && s(-2,-1) && p(0) )
 { l[i]=is_vsyo; r[207]++; if(dbg){print "R207"}; continue};
 if ( mod_bz(-2) &&
       glc_in(-1,"y") && s(-2,-1))
 { l[i]=is_vsyo; r[208]++; if(dbg){print "R208"}; continue};
 if ( mod_bz(-2) &&
       gl_in(-1) && 
       (suw_edda(1)||suw_mnda(1)) && !(suw_mnim(1)) && s(-2,0))
 { l[i]=is_vsyo; r[209]++; if(dbg){print "R209"}; continue};
 if ( mod_bz(1) &&
       mod_ed(2) &&
        gl_in(3) && s(0,2) )
 { l[i]=is_vsyo; r[210]++; if(dbg){print "R210"}; continue};
 if ( mod_bz(1) &&
       gl_in(2) && s(0,1))
 { l[i]=is_vsyo; r[211]++; if(dbg){print "R211"}; continue};
 if ( mod_bz(-1) && s(-1,-1) && p(0) )
 { l[i]=is_vsyo; r[212]++; if(dbg){print "R212"}; continue};
 if ( mod_bz(1) && s(0,0) && p(1) )
 { l[i]=is_vsyo; r[213]++; if(dbg){print "R213"}; continue};
 if ( mod_mn(1) &&
       nar_napr(2) && s(0,1) )
 { l[i]=is_vsje; r[214]++; if(dbg){print "R214"}; continue};
 if ( phf(1,"никак не") &&
       mod_mn(hfn) && s(0,hfn-1) )
 { l[i]=is_vsyo; r[215]++; if(dbg){print "R215"}; continue};
 if ( (suw_edim(-3)||suw_mnim(-3)) &&
        mod_mn(-2) &&
         gl_in(-1) && s(-2,-1) && p(0) )
 { l[i]=is_vsje; r[216]++; if(dbg){print "R216"}; continue};
 if ( w(1,"не") &&
       mod_mn(2) &&
        gl_in(3) && s(0,2) )
 { l[i]=is_vsje; r[217]++; if(dbg){print "R217"}; continue};
 if ( mod_mn(1) &&
       mest_edim(2) &&
       gl_in(3) && s(0,2) )
 { l[i]=is_vsje; r[218]++; if(dbg){print "R218"}; continue};
 if ( mod_mn(1) &&
       gl_in(2) && s(0,1) )
 { l[i]=is_vsje; r[219]++; if(dbg){print "R219"}; continue};
 if ( mod_mn(1) &&
       glc_in(2,"j") && s(0,1) )
 { l[i]=is_vsje; r[220]++; if(dbg){print "R220"}; continue};
 if ( mod_mn(1) &&
      (mest_ed(2)||mest_mn(2)) && s(0,1) && p(2) )
 { l[i]=is_vsje; r[221]++; if(dbg){print "R221"}; continue};
 if ( mod_mn(1) && s(0,0) && p(1) )
 { l[i]=is_vsje; r[222]++; if(dbg){print "R222"}; continue};


 #------------------------------------------------------------------------

 # глагол в единственном числе
 if ( gl_ed(-2) &&
       mest_it(-1) && s(-2,-1) )
 { l[i]=is_vsyo; r[223]++; if(dbg){print "R223"}; continue};
 if ( mest_it(-1) &&
      (nar_vrem(1)||nar_mest(1)||nar_spos(1)||nar_step(1)||nar_srav(1)||nar_kaq(1)) &&
       (gl_ed(2)||gl_in(2)) && s(-1,1) )
 { l[i]=is_vsyo; r[224]++; if(dbg){print "R224"}; continue};
 if ( prl_kred_sr(1) &&
       prl_kred_sr(2) &&
       (gl_ed(3)||gl_in(3)) && s(0,2) )
 { l[i]=is_vsyo; r[225]++; if(dbg){print "R225"}; continue};
 if ( pre_tv(1) &&
      (mest_tv(2)||suw_edtv(2)||suw_mntv(2)) &&
       (gl_ed(3)||gl_in(3)) && s(0,2) )
 { l[i]=is_vsyo; r[226]++; if(dbg){print "R226"}; continue};
 if ( pre_vi(1) &&
      (prl_edvi(2)||prl_edvi(2)) &&
       (mest_vi(3)||suw_edvi(3)||suw_mnvi(3)) &&
        (gl_ed(4)||gl_in(4)) && s(0,3) )
 { l[i]=is_vsyo; r[227]++; if(dbg){print "R227"}; continue};
 if ( pre_ro(1) &&
      (mest_ro(2)||suw_edro(2)||suw_mnro(2)) &&
       (gl_ed(3)||gl_in(3)) && s(0,2) )
 { l[i]=is_vsyo; r[228]++; if(dbg){print "R228"}; continue};
 if ( pre_vi(1) &&
      (mest_vi(2)||suw_edvi(2)||suw_mnvi(2)) &&
       (gl_ed(3)||gl_in(3)) && s(0,2) )
 { l[i]=is_vsyo; r[229]++; if(dbg){print "R229"}; continue};
 if ( mest_it(1) &&
      (nar_vrem(2)||nar_mest(2)||nar_spos(2)||nar_step(2)||nar_srav(2)||nar_kaq(2)) &&
       (gl_ed(3)||gl_in(3)) && s(0,2) )
 { l[i]=is_vsyo; r[230]++; if(dbg){print "R230"}; continue};
 if ( mest_it(1) &&
      (nar_vrem(2)||nar_mest(2)||nar_spos(2)||nar_step(2)||nar_srav(2)||nar_kaq(2)) && s(0,2) && (p(2)||w(3,"и")) )
 { l[i]=is_vsyo; r[231]++; if(dbg){print "R231"}; continue};
 if ( mest_it(1) && s(0,0) && sc(1,",") &&
       vvod(2) && sc(2,",") &&
       (gl_ed(3)||gl_in(3)) )
 { l[i]=is_vsyo; r[232]++; if(dbg){print "R232"}; continue};
 if ( gl_ed(-1) &&
      (muk_edtv(1)||muk_mntv(1)) &&
       (suw_edtv(2)||suw_mntv(2)) s(-1,1) )
 { l[i]=is_vsyo; r[233]++; if(dbg){print "R233"}; continue};
 if ( mest_it(1) && s(0,0) && sc(1,",") &&
       vvod(2) && sc(2,",") &&
       (gl_nemn(3)||gl_pnmn(3)) )
 { l[i]=is_vsje; r[234]++; if(dbg){print "R234"}; continue};
 if ( gl_ed(-1) &&
      (nar_kaq(1)||nar_step(1)) &&
        prl_kred_sr(2) && s(-1,1) )
 { l[i]=is_vsyo; r[235]++; if(dbg){print "R235"}; continue};
 if ( gl_ed(-1) &&
      (nar_kaq(1)||nar_step(1)) &&
        prl_kred_sr(2) && s(-1,1) )
 { l[i]=is_vsyo; r[236]++; if(dbg){print "R236"}; continue};
 if ( mest_edim(-3) &&
       mest_da(-2) &&
        gl_ed(-1) &&
         pre_any(1) && s(-3,1) )
 { l[i]=is_vsyo; r[237]++; if(dbg){print "R237"}; continue};
 if ( suw_mnim(-2) &&
       gl_ed(-1) &&
        pre_any(1) && s(-2,1) )
 { l[i]=is_vsje; r[238]++; if(dbg){print "R238"}; continue};
 if ( (cap(0)||p(-1,",")||sc(-1,"<p>")) &&
       (gl_ed(1)||gl_vzed(1)) && sc(0,",") )
 { l[i]=is_vsyo; r[239]++; if(dbg){print "R239"}; continue};



 if ( sc(0,",") &&
       vvod(1) && sc(1,",") &&
       (gl_ed(2)||gl_in(2)) )
 { l[i]=is_vsyo; r[240]++; if(dbg){print "R240"}; continue};
 if ( sc(0,",") &&
       vvod(1) && sc(1,",") &&
       (gl_nemn(2)||gl_pnmn(2)) )
 { l[i]=is_vsje; r[241]++; if(dbg){print "R241"}; continue};
 if ( mest_it(1) &&
       qast(2) &&
        prq_kred_sr(3) && s(0,2) && p(3) )
 { l[i]=is_vsyo; r[242]++; if(dbg){print "R242"}; continue};
 if ( w(-1,"за") &&
       prl_kred(1) && s(-1,0) && p(1) )
 { l[i]=is_vsyo; r[243]++; if(dbg){print "R243"}; continue};
 if ( (mest_it(1)||w(1,"что")) &&
       prl_kred_sr(2) && s(0,1) )
 { l[i]=is_vsyo; r[244]++; if(dbg){print "R244"}; continue};
 if ( mest_it(-1) &&
       predik(1) && s(-1,0) && p(1) )
 { l[i]=is_vsyo; r[245]++; if(dbg){print "R245"}; continue};
 if ( gl_in(-2) &&
       mest_it(-1) && s(-2,-1) && p(0) )
 { l[i]=is_vsyo; r[246]++; if(dbg){print "R246"}; continue};
 if ( mest_it(-1) &&
       mest_im(1) &&
        suw_edim(2) && s(-1,1) )
 { l[i]=is_vsyo; r[247]++; if(dbg){print "R247"}; continue};
 if ( mest_it(-1) &&
       pre_ro(1) &&
       (mest_ro(2)||prl_edro(2)||prl_mnro(2)) &&
        (suw_edro(3)||suw_mnro(3)) && s(-1,2) )
 { l[i]=is_vsyo; r[248]++; if(dbg){print "R248"}; continue};
 if ( mest_it(-1) &&
       w(1,"что чтобы") && s(-1,-1) && sc(0,",") )
 { l[i]=is_vsyo; r[249]++; if(dbg){print "R249"}; continue};
 if ( mest_it(-1) &&
       w(1,"кто") && s(-1,-1) && sc(0,",") )
 { l[i]=is_vsje; r[250]++; if(dbg){print "R250"}; continue};
 if ( mest_it(-1) &&
       pre_ro(1) &&
        w(2,"того") &&
         w(3,"что чтобы") && s(-1,1) && sc(2,",") )
 { l[i]=is_vsyo; r[251]++; if(dbg){print "R251"}; continue};
 if ( mest_it(1) &&
       pre_ro(2) &&
        w(3,"того") &&
         w(4,"что чтобы") && s(0,2) && sc(3,",") )
 { l[i]=is_vsyo; r[252]++; if(dbg){print "R252"}; continue};
 if ( mest_it(1) &&
       mest_da(2) &&
        nar_kaq(3) &&
         gl_edsr(4) && s(0,3) )
 { l[i]=is_vsyo; r[253]++; if(dbg){print "R253"}; continue};
 if ( mest_it(1) &&
      (prl_edim(2)||prl_mnim(2)||prq_mnim(2)) &&
       (suw_edim(3)||suw_mnim(3)) && s(0,2) )
 { l[i]=is_vsyo; r[254]++; if(dbg){print "R254"}; continue};
 if ( mest_it(1) &&
       pre_pr(2) &&
       (suw_edpr(3)||suw_mnpr(3)) && s(0,2) )
 { l[i]=is_vsyo; r[255]++; if(dbg){print "R255"}; continue};
 if ( mest_it(1) &&
       pre_ro(2) &&
       (mest_ro(3)||suw_edro(3)||suw_mnro(3)) && s(0,2) )
 { l[i]=is_vsyo; r[256]++; if(dbg){print "R256"}; continue};
 if ( mest_it(1) && s(0,0) && p(1) )
 { l[i]=is_vsyo; r[257]++; if(dbg){print "R257"}; continue};
 if ( mest_it(-1) && cap(-1) &&
       (mest_ed(1)||mest_mn(1)) && s(-1,0) && p(1) )
 { l[i]=is_vsyo; r[258]++; if(dbg){print "R258"}; continue};


 # Все + ... + причастие =====================================
 if ( prq_krmn(-4) &&
       w(-3,"еще ещё") &&
        prl_kred_sr(-2) &&
         w(-1,"не") && s(-4,-1) )
 { l[i]=is_vsje; r[259]++; if(dbg){print "R259"}; continue};
 if ( prq_krmn(-3) &&
       prl_kred_sr(-2) &&
        w(-1,"не") && s(-3,-1) )
 { l[i]=is_vsje; r[260]++; if(dbg){print "R260"}; continue};
 if ( prq_kred_sr(-4) &&
       w(-3,"еще ещё") &&
        prl_kred_sr(-2) &&
         w(-1,"не") && s(-4,-1) )
 { l[i]=is_vsyo; r[261]++; if(dbg){print "R261"}; continue};
 if ( prq_kred_sr(-3) &&
       prl_kred_sr(-2) &&
        w(-1,"не") && s(-3,-1) )
 { l[i]=is_vsyo; r[262]++; if(dbg){print "R262"}; continue};
 if ( w(1,"уже") &&
      (nar_mest(2)||nar_step(2)) &&
        prq_kred_sr(3) && s(0,2) )
 { l[i]=is_vsyo; r[263]++; if(dbg){print "R263"}; continue};
 if ( mest_mnim(1) &&
       pre_ro(2) &&
       (suw_edro(3)||suw_mnro(3)) &&
         prq_krmn(4) && s(0,3) )
 { l[i]=is_vsje; r[264]++; if(dbg){print "R264"}; continue};
 if ( (mest_tv(1)||prl_edtv(1)||prl_mntv(1)) &&
       (suw_edtv(2)||suw_mntv(2)) &&
         prq_krmn(3) && s(0,2) )
 { l[i]=is_vsje; r[265]++; if(dbg){print "R265"}; continue};
 if ( suw_edim(1) &&
       prq_kred_sr(2) && sc(0,",") && s(1,1) )
 { l[i]=is_vsyo; r[266]++; if(dbg){print "R266"}; continue};
 if ( (nar_mest(1)||nar_step(1)) &&
        prq_kred_sr(2) && s(0,1) )
 { l[i]=is_vsyo; r[267]++; if(dbg){print "R267"}; continue};
 if ( qast(1) &&
       prq_kred_sr(2) && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[268]++; if(dbg){print "R268"}; continue};
 if ( pre_ro(1) &&
      (suw_mnro(2)||suw_edro(2)) &&
        prq_kred_sr(3) && s(0,2) && (p(3)||w(4,"и")) )
 { l[i]=is_vsyo; r[269]++; if(dbg){print "R269"}; continue};
 if ( gl_in(-2) &&
       prq_krmn(-1) && s(-2,-1) && p(0) )
 { l[i]=is_vsje; r[270]++; if(dbg){print "R270"}; continue};
 if ( prq_kred_sr(-2) &&
       nar_step(-1) && s(-2,-1) && p(0) )
 { l[i]=is_vsyo; r[271]++; if(dbg){print "R271"}; continue};
 if ( prq_kred_sr(-1) && s(-1,-1) && p(0) )
 { l[i]=is_vsyo; r[272]++; if(dbg){print "R272"}; continue};
 if ( (prq_edim(1)||prq_kred(1)) && s(0,0) )
 { l[i]=is_vsyo; r[273]++; if(dbg){print "R273"}; continue};
 if ( mest_ed(1) &&
      (prq_edim(2)||prq_kred(2)) && Q(2,"gl_pemn") && s(0,1) )
 { l[i]=is_vsyo; r[274]++; if(dbg){print "R274"}; continue};
 if ( pre_tv(-1) &&
       (prq_edtv(1)||prq_mntv(1)) &&
        (suw_edtv(2)||suw_mntv(2)) && s(-1,1) )
 { l[i]=is_vsyo; r[275]++; if(dbg){print "R275"}; continue};
 if ( (prq_edtv(-1)||prq_mntv(-1)||prl_edtv(-1)||prl_mntv(-1)) && sc(-1,",") &&
       (prq_edtv(1)||prq_mntv(1)) &&
        (suw_edtv(2)||suw_mntv(2)) && s(0,1) )
 { l[i]=is_vsyo; r[276]++; if(dbg){print "R276"}; continue};
 if ((nar_vrem(1)||qast(1)) &&
       nar_kaq(2) &&
       (prq_edim(3)||prq_kred(3)) && s(0,2) )
 { l[i]=is_vsyo; r[277]++; if(dbg){print "R277"}; continue};
 if ( (prq_mnim(1) && w(1,"щие$")) && !(suw_mnim(1)) && s(0,0) && p(1,",") )
 { l[i]=is_vsyo; r[278]++; if(dbg){print "R278"}; continue};
 if ( (prq_edro(-1)||prq_mnro(-1)) &&
        pre_pr(1) && s(-1,0) )
 { l[i]=is_vsyo; r[279]++; if(dbg){print "R279"}; continue};
 if ( prq_mnim(1) &&
       pre_ro(2) && s(0,1) )
 { l[i]=is_vsje; r[280]++; if(dbg){print "R280"}; continue};
 if ( w(1,"не") &&
       prq_mnim(2) &&
        pre_ro(3) && s(0,2) )
 { l[i]=is_vsje; r[281]++; if(dbg){print "R281"}; continue};
 if ( w(1,"даже") && sc(0,",") &&
       w(2,"не") &&
        prq_mnim(3) &&
         suw_edda(4) && s(1,3) )
 { l[i]=is_vsje; r[282]++; if(dbg){print "R282"}; continue};
 if ( w(1,"не") && sc(0,",") &&
       prq_mnim(2) &&
        suw_edda(3) && s(1,2) )
 { l[i]=is_vsje; r[283]++; if(dbg){print "R283"}; continue};
 if ( mest_vi(1) &&
      (prq_mnim(2)||prq_krmn(2)) && s(0,1) )
 { l[i]=is_vsje; r[284]++; if(dbg){print "R284"}; continue};
 if ( prl_srav(1) &&
      (prq_edro(2)||prq_mnro(2)) && s(0,1) )
 { l[i]=is_vsyo; r[285]++; if(dbg){print "R285"}; continue};
 if ( (prq_edro(1)||prq_mnro(1)) && s(0,0) )
 { l[i]=is_vsyo; r[286]++; if(dbg){print "R286"}; continue};
 if ( prq_edsrim(1) && sc(0,",") )
 { l[i]=is_vsyo; r[287]++; if(dbg){print "R287"}; continue};
 if ( qf(3,"prq_kred_sr") && s(0,qfn-1) && p(qfn) )
 { l[i]=is_vsyo; r[288]++; if(dbg){print "R288"}; continue};



 # Все + ... + прилагательное =====================================
 if ( (prl_mnim(1)||prq_mnim(1)||prl_mnro(1)||prq_mnro(1)||prl_krmn(1)) &&
        w(2,"и или") &&
        (prl_mnim(3)||prq_mnim(3)||prl_mnro(3)||prq_mnro(3)||prl_krmn(3)) && s(0,2) && qq(1,3)  )
 { l[i]=is_vsyo; r[289]++; if(dbg){print "R289"}; continue};
 if ( (prl_edim(1)||prl_edda(1)||prl_edro(1)||prl_edtv(1)||prl_edpr(1)||prl_kred(1)) &&
        w(2,"и или") &&
        (prl_edim(3)||prl_edda(3)||prl_edro(3)||prl_edtv(3)||prl_edpr(3)||prl_kred(3)) && s(0,2) && qq(1,3)  )
 { l[i]=is_vsyo; r[290]++; if(dbg){print "R290"}; continue};
 if ( (prl_mnim(1)||prq_mnim(1)||prl_mnro(1)||prq_mnro(1)||prl_krmn(1)) &&
        w(2,"и или") &&
        (prl_mnim(3)||prq_mnim(3)||prl_mnro(3)||prq_mnro(3)||prl_krmn(3)) &&
          suw_mnim(4) &&
           gl_nemn(5) && s(0,4)  )
 { l[i]=is_vsje; r[291]++; if(dbg){print "R291"}; continue};
 if ( (prl_mnim(1)||prq_mnim(1)||prl_mnro(1)||prq_mnro(1)||prl_krmn(1)) &&
        w(2,"и или") &&
        (prl_mnim(3)||prq_mnim(3)||prl_mnro(3)||prq_mnro(3)||prl_krmn(3)) &&
          suw_mnim(4) && s(0,3)  )
 { l[i]=is_vsje; r[292]++; if(dbg){print "R292"}; continue};
 if ( (prl_mnim(1)||prq_mnim(1)||prl_mnro(1)||prq_mnro(1)||prl_krmn(1)) && W(1,"новые новых") &&
       (prl_mnim(2)||prq_mnim(2)||prl_mnro(2)||prq_mnro(2)||prl_krmn(2)) && s(0,1) )
 { l[i]=is_vsje; r[293]++; if(dbg){print "R293"}; continue};
 if ( w(1,"и") &&
      (prl_mnim(2)||prq_mnim(2)||prl_krmn(2)) && s(0,1) )
 { l[i]=is_vsje; r[294]++; if(dbg){print "R294"}; continue};
 if ( prl_mnim(-2) &&
       w(-1,"и") &&
        prq_mnim(1) && p(1) && s(-1,0) )
 { l[i]=is_vsyo; r[295]++; if(dbg){print "R295"}; continue};
 if ( (prl_mnim(1)||prq_mnim(1)||prl_krmn(1)) && p(1) && s(0,0) && W(1,"новые") )
 { l[i]=is_vsje; r[296]++; if(dbg){print "R296"}; continue};
 if ( mest_tv(1) &&
       prl_krmn(2) && s(0,1) )
 { l[i]=is_vsje; r[297]++; if(dbg){print "R297"}; continue};
 if ( prl_krmn(1) && s(0,0) )
 { l[i]=is_vsje; r[298]++; if(dbg){print "R298"}; continue};
 if ( wc(1,".о$") && se(1,"-") &&
      (prl_mnim(2)||prq_mnim(2)||prl_krmn(2)) &&
        suw_mnim(3) && s(0,0) && s(2,2))
 { l[i]=is_vsje; r[299]++; if(dbg){print "R299"}; continue};
 if ( (prl_mnim(1)||prq_mnim(1)||prl_krmn(1)) && W(1,"новые") &&
        suw_mnim(2) && s(0,1) )
 { l[i]=is_vsje; r[300]++; if(dbg){print "R300"}; continue};
 if ( (prl_edim(1)||prl_kred(1)) &&
        suw_edim(2) && s(0,1) )
 { l[i]=is_vsyo; r[301]++; if(dbg){print "R301"}; continue};
 if ( (prl_pvedtv(1)||prl_pvmntv(1)) &&
       (suw_edtv(2)||suw_mntv(2)) && s(0,1) )
 { l[i]=is_vsyo; r[302]++; if(dbg){print "R302"}; continue};
 if ( (qast(1)||nar_kaq(1)) &&
       (nar_kaq(2)||nar_step(2)) &&
         prl_kred_sr(3) && s(0,2) )
 { l[i]=is_vsyo; r[303]++; if(dbg){print "R303"}; continue};
 if ( w(1,"ли") &&
       suw_mnim(2) &&
        prl_krmn(3) && s(0,2) )
 { l[i]=is_vsje; r[304]++; if(dbg){print "R304"}; continue};
 if ( suw_mnim(1) &&
       prl_krmn(2) && s(0,1) )
 { l[i]=is_vsje; r[305]++; if(dbg){print "R305"}; continue};
 if ( (mest_da(-1)||suw_edda(-1)||suw_mnda(-1)) &&
        prl_kred_sr(1) && s(-1,0) )
 { l[i]=is_vsyo; r[306]++; if(dbg){print "R306"}; continue};
 if ( prl_kred_sr(1) &&
       pre_pr(2) && s(0,1) )
 { l[i]=is_vsyo; r[307]++; if(dbg){print "R307"}; continue};
 if ( w(1,"так") &&
        prl_krmn(2) && s(0,1) )
 { l[i]=is_vsje; r[308]++; if(dbg){print "R308"}; continue};
 if ((phf(1,"как будто")||
      phf(1,"вроде бы") ) &&
      prl_krmn(hfn) && s(0,hfn-1) )
 { l[i]=is_vsje; r[309]++; if(dbg){print "R309"}; continue};
 if ( (mest_ed(1)||mest_mn(1)) &&
       (nar_kaq(2)||nar_step(2)||nar_spos(2)) &&
         prl_krmn(3) && s(0,1) )
 { l[i]=is_vsje; r[310]++; if(dbg){print "R310"}; continue};
 if ( (nar_kaq(1)||nar_step(1)||nar_spos(1)) &&
        prl_krmn(2) && s(0,1) )
 { l[i]=is_vsje; r[311]++; if(dbg){print "R311"}; continue};
 if ( pre_tv(-2) &&
      (suw_edtv(-1)||suw_mntv(-1)) &&
        prl_kred_sr(1) && s(-2,0) && p(1) )
 { l[i]=is_vsyo; r[312]++; if(dbg){print "R312"}; continue};
 if ( w(1,"вроде как") &&
       w(2,"бы как") &&
        prl_kred_sr(3) && s(0,2) && p(3) )
 { l[i]=is_vsyo; r[313]++; if(dbg){print "R313"}; continue};
 if ( w(1,"так настолько") &&
       prl_kred_sr(2) &&
        w(3,"и") &&
         prl_kred_sr(4) && s(0,3) && p(4) )
 { l[i]=is_vsyo; r[314]++; if(dbg){print "R314"}; continue};
 if ( (w(1,"именно")||prl_kred_sr(1)) &&
        w(2,"так") && sc(2,",") &&
         w(3,"как чтобы") && s(0,1) )
 { l[i]=is_vsyo; r[315]++; if(dbg){print "R315"}; continue};
 if ( (w(1,"именно")||prl_kred_sr(1)) &&
        w(2,"так") && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[316]++; if(dbg){print "R316"}; continue};
 if ( w(1,"вроде как так") &&
       prl_kred_sr(2) && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[317]++; if(dbg){print "R317"}; continue};
 if ( pre_pr(1) &&
      (mest_pr(2)||prl_edpr(2)||prl_mnpr(2)) &&
       (suw_edpr(3)||suw_mnpr(3)) &&
         prl_kred_sr(4) && s(0,3) )
 { l[i]=is_vsyo; r[318]++; if(dbg){print "R318"}; continue};
 if ( pre_tv(1) &&
       (mest_tv(2)||suw_edtv(2)||suw_mntv(2)) &&
         prl_edsrim(3) && s(0,2) )
 { l[i]=is_vsyo; r[319]++; if(dbg){print "R319"}; continue};
 if ( nar_mest(1) &&
       pre_vi(2) &&
       (suw_edvi(3)||suw_mnvi(3)) &&
         prl_kred_sr(4) && s(0,3) )
 { l[i]=is_vsyo; r[320]++; if(dbg){print "R320"}; continue};
 if ( pre_vi(1) &&
       (mest_vi(2)||suw_edvi(2)||suw_mnvi(2)) &&
         prl_edsrim(3) && s(0,2) )
 { l[i]=is_vsyo; r[321]++; if(dbg){print "R321"}; continue};
 if ( (mest_ed(1)||nar_step(1)) &&
        nar_step(2) &&
        (prl_kred_sr(3)||prl_edsrim(3)) && s(0,2) )
 { l[i]=is_vsyo; r[322]++; if(dbg){print "R322"}; continue};
 if ( mest_ed(1) &&
       (prl_kred_sr(2)||prl_edsrim(2)) &&
        (mest_da(3)||suw_edda(3)||suw_mnda(3)) && s(0,2) )
 { l[i]=is_vsyo; r[323]++; if(dbg){print "R323"}; continue};
 if ( (nar_mest(1)||nar_vrem(1)) &&
        prl_edsrim(2) && s(0,1) )
 { l[i]=is_vsyo; r[324]++; if(dbg){print "R324"}; continue};
 if ( prl_edsrim(1) && s(0,0) )
 { l[i]=is_vsyo; r[325]++; if(dbg){print "R325"}; continue};
 if ( pre_vi(-1) &&
      (prl_kred_sr(1)||prl_edsrim(1)) && s(-1,0) && p(1) )
 { l[i]=is_vsyo; r[326]++; if(dbg){print "R326"}; continue};
 if ( vvod(-1) &&
      (prl_kred_sr(1)||prl_edsrim(1)) && sc(-1,",") && s(0,0) && p(1) )
 { l[i]=is_vsyo; r[327]++; if(dbg){print "R327"}; continue};
 if ( (gl_nemn(-2)||gl_pnmn(-2)||gl_pemn(-2)||gl_in(-2)) &&
        mest_mn(-1) &&
        (prl_kred_sr(1)||prl_edsrim(1)) && s(-2,0) && p(1) )
 { l[i]=is_vsje; r[328]++; if(dbg){print "R328"}; continue};
 if ( (gl_nemn(-1)||gl_pnmn(-1)||gl_pemn(-1)) &&
       (prl_kred_sr(1)||prl_edsrim(1)) && s(-1,0) && p(1) )
 { l[i]=is_vsje; r[329]++; if(dbg){print "R329"}; continue};
 if ( (prl_kred_sr(1)||prl_edsrim(1)) &&
        pre_ro(2) && s(0,2) )
 { l[i]=is_vsyo; r[330]++; if(dbg){print "R330"}; continue};
 if ( (prl_kred_sr(1)||prl_edsrim(1)) && s(0,0) && p(1) )
 { l[i]=is_vsyo; r[331]++; if(dbg){print "R331"}; continue};
 if ( gl_vzmn(-2) &&
      (prl_kred_sr(-1)||nar_kaq(-1)) && s(-2,-1) )
 { l[i]=is_vsje; r[332]++; if(dbg){print "R332"}; continue};
 if ( (prl_kred_sr(-1)||nar_kaq(-1)) &&
        w(1,"кто кого кому кем") && sc(0,",") && s(-1,-1) )
 { l[i]=is_vsje; r[333]++; if(dbg){print "R333"}; continue};
 if (  w(1,"кто кого кому кем") && sc(0,",") )
 { l[i]=is_vsje; r[334]++; if(dbg){print "R334"}; continue};
 if ( (prl_kred_sr(-1)||nar_kaq(-1)) &&
        pre_ro(1) &&
        (suw_edro(2)||suw_mnro(2)) && s(-1,1) && p(2) )
 { l[i]=is_vsje; r[335]++; if(dbg){print "R335"}; continue};
 if ( (prl_kred_sr(-1)||nar_kaq(-1)) && s(-1,-1) && p(0) )
 { l[i]=is_vsyo; r[336]++; if(dbg){print "R336"}; continue};
 if ( (mest_ed(1)||nar_kaq(1)||nar_vrem(1)) &&
        (prl_kred_sr(2)||prl_edsrim(2)) && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[337]++; if(dbg){print "R337"}; continue};
 if ( pre_pr(1) &&
      (mest_pr(2)||suw_edpr(2)||suw_mnpr(2)) &&
        prl_kred_sr(3) && s(0,2) && p(3) )
 { l[i]=is_vsyo; r[338]++; if(dbg){print "R338"}; continue};
 if ( (prl_edtv(3)||prl_mntv(3)) &&
        w(2,"и") &&
        (prl_edtv(3)||prl_mntv(3)) && s(0,2) && qq(1,3) )
 { l[i]=is_vsyo; r[339]++; if(dbg){print "R339"}; continue};
 if ( (prl_mnim(1)||prl_mnro(1)) &&
        w(2,"и или") &&
        (prl_mnim(3)||prl_mnro(3)) && s(0,2) )
 { l[i]=is_vsje; r[340]++; if(dbg){print "R340"}; continue};
 if ( (prl_srav(1)||nar_step(1)||nar_kaq(1)||nar_srav(1)) &&
        w(2,"и или") &&
        (prl_srav(3)||nar_step(3)||nar_kaq(3)||nar_srav(3)) && s(0,2) )
 { l[i]=is_vsyo; r[341]++; if(dbg){print "R341"}; continue};
 if ( prl_srav(1) && se(1,", ") &&
       prl_srav(2) && s(0,0) )
 { l[i]=is_vsyo; r[342]++; if(dbg){print "R342"}; continue};
 if ( prl_srav(1) &&
       prl_edro(2) &&
        suw_edro(3) && s(0,2) )
 { l[i]=is_vsyo; r[343]++; if(dbg){print "R343"}; continue};
 if ( prl_srav(1) &&
      (suw_mnro(2)||prl_edro(2)||prl_mnro(2)) && s(0,1) )
 { l[i]=is_vsyo; r[344]++; if(dbg){print "R344"}; continue};
 if ( prl_srav(1) &&
      (suw_edim(2)||suw_mnim(2)) && s(0,1) )
 { l[i]=is_vsyo; r[345]++; if(dbg){print "R345"}; continue};
 if ( nar_spos(1) &&
       prl_mnim(2) && s(0,1) && p(2) )
 { l[i]=is_vsje; r[346]++; if(dbg){print "R346"}; continue};
 if ( w(1,"ли же ведь") &&
       prl_mnim(2) && s(0,1) && (p(2)||(w(3,"и")||pre_any(3))) )
 { l[i]=is_vsje; r[347]++; if(dbg){print "R347"}; continue};
 if ( prl_mnim(1) && W(1,"новые") && s(0,0) && (p(1)||(w(2,"и")||pre_any(2))) )
 { l[i]=is_vsje; r[348]++; if(dbg){print "R348"}; continue};

 # Все + ... + существительное =====================================

 if ( souz(1) && sc(0,",") &&
       w(2,"не") &&
        prq_mnim(3) &&
         suw_edda(4) &&
          suw_mnvi(5) && s(1,4) )
 { l[i]=is_vsje; r[349]++; if(dbg){print "R349"}; continue};
 if ( souz(1) && sc(0,",") &&
       prq_mnim(2) &&
        suw_edda(3) &&
         suw_mnvi(4) && s(1,3) )
 { l[i]=is_vsje; r[350]++; if(dbg){print "R350"}; continue};
 if (  prq_mnim(1) &&
        suw_edda(2) &&
         suw_mnvi(3) && s(1,2) )
 { l[i]=is_vsje; r[351]++; if(dbg){print "R351"}; continue};
 if ( w(1,"не") &&
       prq_mnim(2) &&
        suw_edda(3) &&
         suw_mnvi(4) && s(1,3) )
 { l[i]=is_vsje; r[352]++; if(dbg){print "R352"}; continue};
 if ( w(1,"нет") &&
      (suw_edro(2)||suw_mnro(2)) && s(0,1) )
 { l[i]=is_vsyo; r[353]++; if(dbg){print "R353"}; continue};
 if ( (suw_edim(1)||suw_edne(1)) &&
       (suw_edro(2)||suw_mnro(2)||suw_mnvi(2)) &&
         gl_edsr(3) && s(0,2) )
 { l[i]=is_vsyo; r[354]++; if(dbg){print "R354"}; continue};
 if ( (mest_ed(1)||mest_mn(1)) &&
        suw_mnim(2) && s(0,1) )
 { l[i]=is_vsje; r[355]++; if(dbg){print "R355"}; continue};
 if ( suw_edim(1) && se(1,"-") &&
       suw_mnim(2) && s(0,0) )
 { l[i]=is_vsje; r[356]++; if(dbg){print "R356"}; continue};
 if ( (prl_mnim(1)||prq_mnim(1)) &&
        mest_da(2) &&
         suw_mnim(3) && s(0,2) )
 { l[i]=is_vsje; r[357]++; if(dbg){print "R357"}; continue};
 if ( (mest_ed(1)||mest_mn(1)||prl_kred_sr(1)) &&
       (prl_mnim(2)||prq_mnim(2)) &&
         suw_mnim(3) && s(0,2) )
 { l[i]=is_vsje; r[358]++; if(dbg){print "R358"}; continue};
 if ( mest_tv(1) &&
       w(2,"же") &&
       (prl_mnim(3)||prq_mnim(3)) &&
         suw_mnim(4) && s(0,3) )
 { l[i]=is_vsje; r[359]++; if(dbg){print "R359"}; continue};
 if ( suw_mnim(1) &&
       (gl_nemn(2)||gl_pemn(2)||gl_pnmn(2)) && s(0,1) )
 { l[i]=is_vsje; r[360]++; if(dbg){print "R360"}; continue};
 if ( suw_mnim(-1) &&
       prl_krmn(1) && s(-1,0) )
 { l[i]=is_vsje; r[361]++; if(dbg){print "R361"}; continue};
 if ( suw_mnim(1) && !(prl_mnim(1)||prl_mnvi(1)) && s(0,0) )
 { l[i]=is_vsje; r[362]++; if(dbg){print "R362"}; continue};
 if ( (mest_ed(1)||mest_mn(1)||nar_kaq(1)) &&
       (prl_mnim(2)||prq_mnim(2)) &&
         suw_edim(3) && s(0,2) )
 { l[i]=is_vsyo; r[363]++; if(dbg){print "R363"}; continue};
 if ( (mest_edsr(1)||mest_mn(1)) &&
        prl_edsrim(2) &&
         suw_edsrim(3) && s(0,2) )
 { l[i]=is_vsyo; r[364]++; if(dbg){print "R364"}; continue};
 if ( (mest_ed(1)||mest_mn(1)) &&
        suw_edsrim(2) && s(0,1) )
 { l[i]=is_vsyo; r[365]++; if(dbg){print "R365"}; continue};
 if ( suw_edim(1) && !(nar_spos(1)) && s(0,0) )
 { l[i]=is_vsyo; r[366]++; if(dbg){print "R366"}; continue};
 if ( (mest_ed(1)||mest_mn(1)) &&
        suw_edim(2) &&
         qik_edim(3) && s(0,2) )
 { l[i]=is_vsje; r[367]++; if(dbg){print "R367"}; continue};
 if ( mest_ed(1) &&
       qast(2) &&
        suw_edim(3) && s(0,2) )
 { l[i]=is_vsyo; r[368]++; if(dbg){print "R368"}; continue};
 if ( (suw_edsrim(1)||suw_edsrvi(1)) && s(0,0)  )
 { l[i]=is_vsyo; r[369]++; if(dbg){print "R369"}; continue};
 if ( (prl_mnim(1)||wc(1,"ские$")) && W(1,"новые") &&
       (suw_edro(2)||suw_mnro(2)) && s(0,1) )
 { l[i]=is_vsje; r[370]++; if(dbg){print "R370"}; continue};
 if ( w(1,"ли же") &&
      (prl_mnim(2)||wc(2,"ские$")) &&
        suw_mnim(3) && s(0,2) )
 { l[i]=is_vsje; r[371]++; if(dbg){print "R371"}; continue};
 if ( suw_edim(1) &&
       (suw_edro(2)||suw_mnro(2)) && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[372]++; if(dbg){print "R372"}; continue};
 if ( suw_edim(1) && s(0,0) && p(1) )
 { l[i]=is_vsyo; r[373]++; if(dbg){print "R373"}; continue};
 if ( mest_mn(-1) && s(-1,-1) &&
       prl_edim(1) &&
        suw_edim(2) && se(0," — ") && s(1,1) )
 { l[i]=is_vsje; r[374]++; if(dbg){print "R374"}; continue};
 if ( mest_mn(1) && s(0,0) &&
      (suw_edim(2)||suw_mnim(2)) && se(1," — ") )
 { l[i]=is_vsje; r[375]++; if(dbg){print "R375"}; continue};
 if ( (mest_im(1)||mest_vi(1)) && s(1,1) &&
        suw_edim(2) && se(0," — ") )
 { l[i]=is_vsyo; r[376]++; if(dbg){print "R376"}; continue};
 if ( suw_edim(1) && se(0," — ") && p(1) )
 { l[i]=is_vsyo; r[377]++; if(dbg){print "R377"}; continue};
 if ( suw_edim(1) &&
      (suw_edro(2)||suw_mnro(2)) && s(0,1) )
 { l[i]=is_vsyo; r[378]++; if(dbg){print "R378"}; continue};
 if ( suw_mnim(-1) && sc(-1,",") &&
       pre_pr(1) &&
       (prl_edpr(2)||prl_mnpr(2)) &&
        (suw_edpr(3)||suw_mnpr(3)) && s(0,2) )
 { l[i]=is_vsje; r[379]++; if(dbg){print "R379"}; continue};
 if ( w(-3,"каждый каждую каждое") &&
       suw_edvi(-2) &&
       (gl_pemn(-1)||gl_pnmn(-1)||gl_nemn(-1)) && 
        w(1,"новые") && s(-3,0) )
 { l[i]=is_vsyo; r[380]++; if(dbg){print "R380"}; continue};
 if ( w(-2,"каждый каждую каждое") &&
       suw_edvi(-1) &&
        w(1,"новые") && s(-2,0) )
 { l[i]=is_vsyo; r[381]++; if(dbg){print "R381"}; continue};
 if ( suw_edsrim(-1) && sc(-1,",") &&
       pre_pr(1) &&
       (prl_edpr(2)||prl_mnpr(2)) &&
        (suw_edpr(3)||suw_mnpr(3)) && s(0,2) )
 { l[i]=is_vsyo; r[382]++; if(dbg){print "R382"}; continue};
 if ( suw_edsrim(-1) && sc(-1,",") &&
       pre_pr(1) &&
       (suw_edpr(2)||suw_mnpr(2)) && s(0,1) )
 { l[i]=is_vsyo; r[383]++; if(dbg){print "R383"}; continue};


 # наречия =============================================
 
 if ( qb(-7,"mest_mnim") &&
       w(-1,"то") && sc(-2,",") &&
        nar_spos(1) && s(-1,0) && p(1) )
 { l[i]=is_vsje; r[384]++; if(dbg){print "R384"}; continue};


 if ( w(-2,"да вот ну") &&
       w(-1,"и") &&
        w(1,"тут") && s(-2,0) && p(1) && sv(1,1,",") )
 { l[i]=is_vsyo; r[385]++; if(dbg){print "R385"}; continue};
 if ( (nar_napr(1)) &&
        w(2,"и или") &&
        (nar_napr(3)) && s(0,2)  )
 { l[i]=is_vsyo; r[386]++; if(dbg){print "R386"}; continue};
 if ( nar_step(1) &&
       nar_srav(2) && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[387]++; if(dbg){print "R387"}; continue};
 if ( (w(1,"куда")||prl_kred_sr(1)) &&
        nar_srav(2) && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[388]++; if(dbg){print "R388"}; continue};
 if ( nar_srav(1) &&
       (gl_ed(2)||gl_nemn(2)||gl_pnmn(2)||gl_pemn(2)) && s(0,1) )
 { l[i]=is_vsyo; r[389]++; if(dbg){print "R389"}; continue};
 if ( nar_srav(1) && s(0,0) && p(1) )
 { l[i]=is_vsyo; r[390]++; if(dbg){print "R390"}; continue};
 if ( (nar_kaq(1)||nar_vrem(1)||mest_ed(1)) && s(0,0) && p(1) && cap(0) )
 { l[i]=is_vsyo; r[391]++; if(dbg){print "R391"}; continue};
 if ( (gl_vzmn(-1)||gl_nemn(-1)) &&
        prl_srav(1) &&
        (prl_edim(2)||prl_mnim(2)||prl_edro(2)||prl_mnro(2)||prl_edtv(2)||prl_mntv(2)) && s(-1,1) )
 { l[i]=is_vsyo; r[392]++; if(dbg){print "R392"}; continue};
 if ( nar_step(1) &&
      (prl_mntv(2)||prl_edtv(2)) && s(0,1) )
 { l[i]=is_vsyo; r[393]++; if(dbg){print "R393"}; continue};
 if ( (gl_vzmn(-1)||gl_nemn(-1)) &&
       (nar_spos(1)||nar_napr(1)||nar_step(1)) &&
         prl_kred_sr(2) && s(-1,1) && p(2) )
 { l[i]=is_vsyo; r[394]++; if(dbg){print "R394"}; continue};
 if ( (gl_vzmn(-1)||gl_nemn(-1)) &&
       (nar_spos(1)||nar_napr(1)||nar_step(1)) && s(-1,0) )
 { l[i]=is_vsje; r[395]++; if(dbg){print "R395"}; continue};
 if ( w(1,"как") &&
       w(2,"раз будто") &&
        nar_spos(3) && s(0,2) && p(3) )
 { l[i]=is_vsyo; r[396]++; if(dbg){print "R396"}; continue};
 if ( (nar_kaq(1)||nar_spos(1)||nar_step(1)||prl_kred_sr(1)) &&
        prl_kred_sr(2) && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[397]++; if(dbg){print "R397"}; continue};
 if ( nar_step(1) &&
      (prl_mnvi(2)||prl_edvi(2)) &&
        suw_mnvi(3) && s(0,2) )
 { l[i]=is_vsyo; r[398]++; if(dbg){print "R398"}; continue};
 if ( (qast(1)||nar_step(1)) &&
        nar_kaq(2) && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[399]++; if(dbg){print "R399"}; continue};
 if ( nar_mest(1) &&
       w(2,"не") &&
        gl_ed(3) && s(0,2) )
 { l[i]=is_vsyo; r[400]++; if(dbg){print "R400"}; continue};
 if ( mest_da(-1) &&
       nar_mest(1) && s(-1,0) && p(1) )
 { l[i]=is_vsyo; r[401]++; if(dbg){print "R401"}; continue};
 if ( (nar_kaq(1)||nar_step(1)) &&
        prl_kred_sr(2) &&
         !(gl_pemn(3)||gl_nemn(3)||gl_pnmn(3)) && s(-1,1) )
 { l[i]=is_vsyo; r[402]++; if(dbg){print "R402"}; continue};
 if ( (gl_ed(-1)||gl_nemn(-1)||gl_pemn(-1)||gl_pnmn(-1)) &&
        nar_mest(1) &&
         suw_mnim(2) && s(-1,1) )
 { l[i]=is_vsyo; r[403]++; if(dbg){print "R403"}; continue};
 if ( nar_mest(1) &&
       suw_mnim(2) && s(0,1) )
 { l[i]=is_vsje; r[404]++; if(dbg){print "R404"}; continue};

 # всё не так плохо
 if ( w(1,"не") &&
       w(2,"так") &&
       (nar_vrem(3)||nar_mest(3)||nar_spos(3)||nar_srav(3)||nar_kaq(3)||suw_edvi(3)||mest_ed(3)) && s(0,2) && p(3) )
 { l[i]=is_vsyo; r[405]++; if(dbg){print "R405"}; continue};
 if ( w(1,"не") &&
       w(2,"так") && se(2,"-") &&
        w(3,"то") &&
        (nar_vrem(4)||nar_mest(4)||nar_spos(4)||nar_srav(4)||nar_kaq(4)||suw_edvi(4)||mest_ed(4)) && s(0,2) && s(3,3) && p(4) )
 { l[i]=is_vsyo; r[406]++; if(dbg){print "R406"}; continue};
 if ( nar_mest(1) &&
       w(2,"же") && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[407]++; if(dbg){print "R407"}; continue};

 # Все + ... + числительное =====================================
 # все + числ.
 if ( w(1,"один одна одно одни") && s(0,0) )
 { l[i]=is_vsyo; r[408]++; if(dbg){print "R408"}; continue};
 if ( qis_im(1) && s(0,0) )
 { l[i]=is_vsje; r[409]++; if(dbg){print "R409"}; continue};
 if ( (qik_edim(1)||qik_mnim(1)||wc(1,"^[0-9]+$")) && s(0,0) )
 { l[i]=is_vsje; r[410]++; if(dbg){print "R410"}; continue};

 # все + местоимения =============================================
 # все + мест.мн
 if ( w(-1,"чем даже") &&
       mest_mnim(1) && s(-1,0) )
 { l[i]=is_vsje; r[411]++; if(dbg){print "R411"}; continue};
 if ( mest_mn(-3) && sc(-3,",") &&
       w(-2,"а но") &&
        w(-1,"не") && s(-2,-1) )
 { l[i]=is_vsje; r[412]++; if(dbg){print "R412"}; continue};
 if ( w(-1,"не") && s(-1,-1) &&
       w(1,"а но") && sc(0,",") &&
       (mest_mn(2)||prl_mnim(2)) && s(1,1) )
 { l[i]=is_vsje; r[413]++; if(dbg){print "R413"}; continue};
 if ( mest_mnim(1) &&
       prl_kred_sr(2) &&
        w(3,"и") &&
        (gl_pnmn(4)||gl_nemn(4)||gl_pemn(4)) && s(0,3) )
 { l[i]=is_vsje; r[414]++; if(dbg){print "R414"}; continue};
 if ( mest_mnim(-3) && sc(-3,",") &&
       suw_mnim(-2) && sc(-2,",") &&
        (gl_pnmn(-1)||gl_pemn(-1)||gl_nemn(-1)) && s(-1,-1) && (p(0)||pre_any(1)) )
 { l[i]=is_vsyo; r[415]++; if(dbg){print "R415"}; continue};
 if ( mest_im(-2) &&
       mest_mnim(-1) &&
        mest_mnim(1) && s(-2,0) )
 { l[i]=is_vsje; r[416]++; if(dbg){print "R416"}; continue};
 if ( mest_mnim(1) &&
       (nar_vrem(2)||nar_mest(2)) &&
         w(3,"не") &&
          muk_mnim(4) && s(0,3) )
 { l[i]=is_vsje; r[417]++; if(dbg){print "R417"}; continue};
 if ( mest_mnim(1) &&
       prl_kred_sr(2) &&
        pre_pr(3) && s(0,3) )
 { l[i]=is_vsje; r[418]++; if(dbg){print "R418"}; continue};
 if ( mest_mnim(1) &&
       pre_pr(2) && s(0,2) )
 { l[i]=is_vsje; r[419]++; if(dbg){print "R419"}; continue};
 if ( mest_mnim(1) &&
       mest_vi(2) &&
        gl_pnmn(3) && s(0,2) && p(3) )
 { l[i]=is_vsje; r[420]++; if(dbg){print "R420"}; continue};
 if ( mest_da(1) &&
        gl_ed(2) && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[421]++; if(dbg){print "R421"}; continue};
 if ( mest_mnim(1) &&
      (nar_kaq(2)||nar_step(2)||prl_kred_sr(2)) &&
        w(3,"и или") &&
        (nar_kaq(4)||nar_step(4)||prl_kred_sr(4)) &&
          prl_krmn(5) && s(0,4) )
 { l[i]=is_vsje; r[422]++; if(dbg){print "R422"}; continue};
 if ( mest_mnim(1) &&
      (nar_kaq(2)||nar_step(2)||prl_kred_sr(2)) &&
        (prl_krmn(3)||prl_mnim(3)) && s(0,2) )
 { l[i]=is_vsje; r[423]++; if(dbg){print "R423"}; continue};
 if ( mest_mnim(-1) &&
      (nar_kaq(1)||nar_step(1)) &&
        prl_kred_sr(2) && s(-1,1) )
 { l[i]=is_vsje; r[424]++; if(dbg){print "R424"}; continue};
 if ( mest_mn(1) &&
      (prl_kred_sr(2)||nar_kaq(2)) &&
       (gl_pnmn(3)||gl_nemn(3)||gl_pemn(3)) && s(0,2) )
 { l[i]=is_vsje; r[425]++; if(dbg){print "R425"}; continue};
 if ( mest_mn(1) &&
       nar_spos(2) &&
        prq_mnim(3) && s(0,2) )
 { l[i]=is_vsje; r[426]++; if(dbg){print "R426"}; continue};
 if ( mest_mn(1) &&
       qast(2) &&
       (gl_vzmn(3)||gl_nemn(3)) && s(0,2) )
 { l[i]=is_vsje; r[427]++; if(dbg){print "R427"}; continue};
 if ( mest_mn(-1) &&
      (gl_pnmn(1)||gl_nemn(1)) &&
        prl_kred_sr(2) &&
        (prl_mnim(3)||prl_krmn(3)) && s(-1,2) )
 { l[i]=is_vsje; r[428]++; if(dbg){print "R428"}; continue};
 if ( mest_mn(-1) &&
      (gl_nemn(1)||gl_pemn(1)||gl_pnmn(1)) &&
       (prl_edtv(2)||prl_mntv(2)) &&
        (suw_edtv(3)||suw_mntv(3)) && s(-1,2) )
 { l[i]=is_vsje; r[429]++; if(dbg){print "R429"}; continue};
 if ( mest_mn(-1) &&
       gl_povzmn(1) && s(-1,0) )
 { l[i]=is_vsje; r[430]++; if(dbg){print "R430"}; continue};
 if ( mest_mn(-1) &&
       pre_tv(1) &&
        mest_tv(2) &&
         prl_krmn(3) && s(-1,2) )
 { l[i]=is_vsje; r[431]++; if(dbg){print "R431"}; continue};
 if ( mest_mn(1) &&
       nar_mest(2) &&
         prl_krmn(3) && s(0,2) )
 { l[i]=is_vsje; r[432]++; if(dbg){print "R432"}; continue};
 if ( mest_mn(1) &&
       pre_tv(2) &&
       (mest_tv(3)||suw_edtv(3)||suw_mntv(3)) && s(-1,2) )
 { l[i]=is_vsje; r[433]++; if(dbg){print "R433"}; continue};
 if ( mest_mn(-1) &&
       pre_ro(1) &&
        cap(2) && s(-1,1) )
 { l[i]=is_vsje; r[434]++; if(dbg){print "R434"}; continue};
 if ( mest_mn(-1) &&
       nar_step(1) &&
        prl_kred_sr(2) &&
         gl_pemn(3) && sc(3,",") && s(-1,2) &&
          (w(4,"чтобы будто")||mest_im(4)||nar_vopr(4)) )
 { l[i]=is_vsje; r[435]++; if(dbg){print "R435"}; continue};
 if ( mest_mn(-1) &&
       nar_step(1) && sc(1,",") &&
        nar_step(2) &&
         gl_pemn(3) && s(-1,0) && s(2,2) )
 { l[i]=is_vsje; r[436]++; if(dbg){print "R436"}; continue};
 if ( mest_mnim(-1) &&
       gl_nemn(1) &&
        pre_tv(2) &&
        (mest_tv(3)||suw_edtv(3)||suw_mntv(3)) s(-1,2) )
 { l[i]=is_vsje; r[437]++; if(dbg){print "R437"}; continue};
 if ( mest_mn(-1) &&
       nar_step(1) &&
       (mest_ro(2)||suw_edro(2)||suw_mnro(2)) &&
         gl_pnmn(3) && s(-1,2) )
 { l[i]=is_vsje; r[438]++; if(dbg){print "R438"}; continue};
 if ( w(-2,"а") &&
       mest_mnim(-1) &&
       (gl_pnmn(1)||gl_nemn(1)) &&
         prl_kred_sr(2) && s(-2,1) )
 { l[i]=is_vsyo; r[439]++; if(dbg){print "R439"}; continue};
 if ( mest_mn(1) &&
      (nar_step(2)||prl_kred_sr(2)) &&
        prl_krmn(3) && s(0,2) )
 { l[i]=is_vsje; r[440]++; if(dbg){print "R440"}; continue};
 if ( mest_mn(1) &&
      (prl_krmn(2)||mest_mn(2)||prl_mnim(2)) && s(0,1) && p(2) )
 { l[i]=is_vsje; r[441]++; if(dbg){print "R441"}; continue};
 if ( mest_mn(1) &&
       nar_vrem(2) &&
        mod_mn(3) &&
         gl_in(4) && s(0,3) )
 { l[i]=is_vsje; r[442]++; if(dbg){print "R442"}; continue};
 if ( mest_mn(1) &&
       prl_mnim(2) &&
        prl_mnim(3) &&
         suw_mnim(4) && s(0,3) )
 { l[i]=is_vsje; r[443]++; if(dbg){print "R443"}; continue};
 if ( mest_mn(-2) &&
       w(-1,"ведь же ж") && s(-2,-1) && p(0) )
 { l[i]=is_vsje; r[444]++; if(dbg){print "R444"}; continue};
 if ( mest_mnim(-2) &&
       w(-1,"же ведь") &&
        pre_pr(1) &&
        (suw_edpr(2)||suw_mnpr(2)) && s(-2,1) )
 { l[i]=is_vsje; r[445]++; if(dbg){print "R445"}; continue};
 if ( mest_mnim(-1) &&
       pre_pr(1) &&
       (suw_edpr(2)||suw_mnpr(2)) && s(-1,1) )
 { l[i]=is_vsje; r[446]++; if(dbg){print "R446"}; continue};
 if ( mest_mn(1) &&
       pre_pr(2) &&
       (suw_edpr(3)||suw_mnpr(3)) && s(0,2) )
 { l[i]=is_vsje; r[447]++; if(dbg){print "R447"}; continue};
 if ( mest_mn(1) &&
       w(2,"друг") &&
        w(3,"друга дружку") && s(0,2) )
 { l[i]=is_vsje; r[448]++; if(dbg){print "R448"}; continue};
 if ( (gl_nemn(1)||gl_pnmn(1)) &&
        phf(2,"друг с другом") && s(0,hfn-2) )
 { l[i]=is_vsje; r[449]++; if(dbg){print "R449"}; continue};
 if ( (mest_ed(1)||mest_mn(1)) &&
        qip_mnro(2) &&
         suw_mnro(3) && s(0,2) )
 { l[i]=is_vsje; r[450]++; if(dbg){print "R450"}; continue};
 if ( mest_mnim(1) &&
       (gl_vzmn(2)||gl_nemn(2)||gl_pemn(2)||gl_pnmn(2)||prl_krmn(2)) && s(0,1) )
 { l[i]=is_vsje; r[451]++; if(dbg){print "R451"}; continue};
 if ( mest_ed(1) &&
      (nar_mest(2)||nar_priq(2)) && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[452]++; if(dbg){print "R452"}; continue};
 if ( mest_ed(1) &&
       pre_tv(2) &&
       (mest_tv(3)||suw_edtv(3)||suw_mntv(3)||prl_edtv(3)||prl_mntv(3)) && s(0,1) )
 { l[i]=is_vsyo; r[453]++; if(dbg){print "R453"}; continue};
 if ( mest_ed(1) &&
       nar_step(2) &&
        nar_kaq(3) && s(0,2) )
 { l[i]=is_vsyo; r[454]++; if(dbg){print "R454"}; continue};
 if ( mest_ed(1) &&
      (nar_kaq(2)||nar_step(2)||nar_spos(2)) &&
       (gl_ed(3)||gl_in(3)) && s(0,2) )
 { l[i]=is_vsyo; r[455]++; if(dbg){print "R455"}; continue};
 if ( mest_ed(1) &&
      (nar_kaq(2)||nar_step(2)) &&
        qast(3) &&
        (gl_ed(4)||gl_in(4)) && s(0,3) )
 { l[i]=is_vsyo; r[456]++; if(dbg){print "R456"}; continue};
 if ( mest_mn(1) && cap(0) && s(0,0) && p(1) )
 { l[i]=is_vsje; r[457]++; if(dbg){print "R457"}; continue};
 if ( mest_edsrim(-1) && prevje != b-1 && s(-1,-1) && p(0) )
 { l[i]=is_vsyo; r[458]++; if(dbg){print "R458"}; continue};

 # Местоимения + все
 # мест.да
 if ( mest_da(-1) &&
       nar_mest(1) && s(-1,0) )
 { l[i]=is_vsyo; r[459]++; if(dbg){print "R459"}; continue};

 # Мест + все + ... + глагол ============================================
 # все + ... + гл.мн.
 if ( qb(-5,"mest_mn") &&
       suw_edim(-1) &&
       (gl_vzmn(1)||gl_nemn(1)) && s(-1,0) && p(1) )
 { l[i]=is_vsje; r[460]++; if(dbg){print "R460"}; continue};
 if ( mest_mn(-3) &&
       w(-2,"не") &&
        gl_nemn(-1) &&
         gl_in(1) && s(-2,0) )
 { l[i]=is_vsje; r[461]++; if(dbg){print "R461"}; continue};
 if ( gl_nemn(-2) &&
       w(-1,"не") && s(-2,-1) && p(0) )
 { l[i]=is_vsje; r[462]++; if(dbg){print "R462"}; continue};
 if ( mest_mn(-2) &&
       gl_nemn(-1) &&
        gl_in(1) && s(-2,0) )
 { l[i]=is_vsje; r[463]++; if(dbg){print "R463"}; continue};
 if ( (gl_in(-1)||gl_ed(-1)) &&
       (prl_edtv(1)||prl_mntv(1)) &&
        (suw_edtv(2)||suw_mntv(2)) && s(-1,1) )
 { l[i]=is_vsyo; r[464]++; if(dbg){print "R464"}; continue};
 if ( gl_in(-1) &&
       pre_pr(1) &&
       (suw_edpr(2)||suw_mnpr(2)) &&
         prl_edtv(3) && s(-1,2) )
 { l[i]=is_vsyo; r[465]++; if(dbg){print "R465"}; continue};
 if ( mest_mn(-1) &&
      (nar_mest(1)||nar_kaq(1)||nar_vrem(1)||nar_spos(1)) &&
        gl_nemn(2) && s(-1,1) )
 { l[i]=is_vsje; r[466]++; if(dbg){print "R466"}; continue};
 if ( mest_mn(-1) &&
       mest_da(1) &&
        gl_nemn(2) && s(-1,1) && p(2))
 { l[i]=is_vsje; r[467]++; if(dbg){print "R467"}; continue};
 if ( (gl_pnmn(1)||gl_pemn(1)||gl_nemn(1)) && sc(1,",") &&
        w(2,"кто никто") && s(0,0) )
 { l[i]=is_vsje; r[468]++; if(dbg){print "R468"}; continue};
 if ( (suw_edvi(-3)||suw_mnvi(-3)||mest_vi(-3)) &&
       (gl_pnmn(-2)||gl_pemn(-2)||gl_nemn(-2)) &&
         mest_mnim(-1) && s(-3,-1) )
 { l[i]=is_vsje; r[469]++; if(dbg){print "R469"}; continue};
 if ( mest_mn(-1) &&
      (gl_pnmn(1)||gl_pemn(1)) &&
        suw_mnvi(2) && s(-1,1) )
 { l[i]=is_vsje; r[470]++; if(dbg){print "R470"}; continue};
 if ( mest_mn(-1) &&
      (gl_pomn(1)||gl_povzmn(1)) &&
        nar_mest(2) && s(-1,1) )
 { l[i]=is_vsje; r[471]++; if(dbg){print "R471"}; continue};
 if ( mest_mn(1) &&
       nar_mest(2) &&
        gl_vzmn(3) && s(0,2) )
 { l[i]=is_vsje; r[472]++; if(dbg){print "R472"}; continue};
 if ( mest_mn(1) &&
      (gl_pnmn(2)||gl_pemn(2)) &&
        suw_mnvi(3) && s(0,2) )
 { l[i]=is_vsje; r[473]++; if(dbg){print "R473"}; continue};
 if ( mest_ed(1) &&
       gl_ed(2) && s(0,1) && p(2) )
 { l[i]=is_vsyo; r[474]++; if(dbg){print "R474"}; continue};
 if ( (gl_pnmn(1)||gl_pemn(1)) &&
       (prl_mnim(2)||prq_mnim(2)||prq_edim(2)||prl_edim(2)) &&
         suw_mnvi(3) && s(0,2) )
 { l[i]=is_vsje; r[475]++; if(dbg){print "R475"}; continue};
 # оглядывающий + все + вокруг + всех
 if ( nar_mest(-1) &&
       w(1,"как") &&
        pre_ro(2) &&
        (mest_ro(3)||suw_edro(3)||suw_mnro(3)||prl_edro(3)||prl_mnro(3)||prq_edro(3)||prq_mnro(3)) && s(-1,2) )
 { l[i]=is_vsyo; r[476]++; if(dbg){print "R476"}; continue};
 if ( (prq_edim(-1)||prq_mnim(-1)) &&
        pre_ro(1) &&
        (mest_ro(2)||suw_edro(2)||suw_mnro(2)||prl_edro(2)||prl_mnro(2)||prq_edro(2)||prq_mnro(2)) && s(-1,1) )
 { l[i]=is_vsyo; r[477]++; if(dbg){print "R477"}; continue};
 # все + против + всех
 if ( gl_in(-1) &&
       pre_ro(1) &&
       (mest_ro(2)||prl_edro(2)||prl_mnro(2)) && s(-1,1) )
 { l[i]=is_vsyo; r[478]++; if(dbg){print "R478"}; continue};
 if ( w(1,"для ради") && Q(-1,"gl_vzed") &&
      (mest_ro(2)||suw_edro(2)||suw_mnro(2)||prl_edro(2)||prl_mnro(2)||prq_edro(2)||prq_mnro(2)) && s(-1,1) && p(2) )
 { l[i]=is_vsyo; r[479]++; if(dbg){print "R479"}; continue};
 if ( vvb(-1) && suw_mnim(vvn) &&
       pre_ro(1) &&
       (mest_ro(2)||suw_edro(2)||suw_mnro(2)||prl_edro(2)||prl_mnro(2)||prq_edro(2)||prq_mnro(2)) && s(0,1) )
 { l[i]=is_vsje; r[480]++; if(dbg){print "R480"}; continue};
 if ( gl_ed(-1) &&
       pre_ro(1) &&
       (mest_ro(2)||suw_edro(2)||suw_mnro(2)||prl_edro(2)||prl_mnro(2)||prq_edro(2)||prq_mnro(2)) && s(-1,1) && p(2) )
 { l[i]=is_vsyo; r[481]++; if(dbg){print "R481"}; continue};
 if ( pre_ro(1) &&
      (mest_ro(2)||suw_edro(2)||suw_mnro(2)||prl_edro(2)||prl_mnro(2)||prq_edro(2)||prq_mnro(2)) &&
        w(3,"так слишком") &&
         prl_kred_sr(4) && s(0,3) )
 { l[i]=is_vsyo; r[482]++; if(dbg){print "R482"}; continue};
 if ( pre_ro(1) && !(gl_vzed(-1)||gl_ed(-1)||gl_ed(3)) &&
      (mest_ro(2)||suw_edro(2)||suw_mnro(2)||prl_edro(2)||prl_mnro(2)||prq_edro(2)||prq_mnro(2)) && s(0,1) )
 { l[i]=is_vsyo; r[483]++; if(dbg){print "R483"}; continue};
 if ( w(1,"кроме") && sc(0,",") &&
       cap(2) && s(1,1) )
 { l[i]=is_vsje; r[484]++; if(dbg){print "R484"}; continue};


 # дееп =============================================================
 if ( (prl_srav(1)||nar_step(1)) &&
        deep(2) && s(0,1) )
 { l[i]=is_vsyo; r[485]++; if(dbg){print "R485"}; continue};
 if ( deep(1) &&
      (gl_nemn(2)||gl_pnmn(2)||gl_pemn(2)) && s(0,1) )
 { l[i]=is_vsje; r[486]++; if(dbg){print "R486"}; continue};
 if ( deep(-2) &&
      (suw_edtv(-1)||suw_mntv(-1)) &&
        nar_mest(1) && s(-2,0) )
 { l[i]=is_vsyo; r[487]++; if(dbg){print "R487"}; continue};
 if ( deep(-2) &&
       pre_vi(-1) &&
       (prl_edtv(1)||prl_mntv(1)||suw_edvi(1)||suw_mnvi(1)) && Q(1,"mest_mnim") && s(-2,0) )
 { l[i]=is_vsyo; r[488]++; if(dbg){print "R488"}; continue};
 if ( deep(-2) &&
       mest_vi(-1) &&
        (prl_srav(1)||prl_edtv(1)||prl_mntv(1)||suw_edvi(1)||suw_mnvi(1)) && s(-2,0) )
 { l[i]=is_vsyo; r[489]++; if(dbg){print "R489"}; continue};
 if ( deep(-1) &&
       pre_vi(1) &&
       (prl_edvi(2)||prl_mnvi(2)||suw_edvi(2)||suw_mnvi(2)) && s(-1,1) )
 { l[i]=is_vsyo; r[490]++; if(dbg){print "R490"}; continue};
 if ( deep(-1) &&
       pre_pr(1) &&
       (prl_edpr(2)||suw_edpr(2)||suw_mnpr(2)) && s(-1,1) )
 { l[i]=is_vsyo; r[491]++; if(dbg){print "R491"}; continue};
 if ( deep(-1) &&
       pre_tv(1) &&
       (prl_edtv(2)||prl_mntv(2)||suw_edtv(2)||suw_mntv(2)||mest_tv(2)) && s(-1,1) )
 { l[i]=is_vsyo; r[492]++; if(dbg){print "R492"}; continue};
 if ( deep(-1) &&
       prl_srav(1) && s(-1,0) )
 { l[i]=is_vsyo; r[493]++; if(dbg){print "R493"}; continue};
 if ( deep(-1) &&
       gl_nemn(1) && s(-1,0) )
 { l[i]=is_vsje; r[494]++; if(dbg){print "R494"}; continue};
 if ( w(1,"включая") && sc(0,",") &&
      (suw_edvi(2)||suw_mnvi(2)) && s(1,1) )
 { l[i]=is_vsje; r[495]++; if(dbg){print "R495"}; continue};
 if ( deep(-1) &&
       nar_mest(1) && s(-1,0) )
 { l[i]=is_vsyo; r[496]++; if(dbg){print "R496"}; continue};
 if ( deep(-1) && s(-1,-1) && p(0) )
 { l[i]=is_vsyo; r[497]++; if(dbg){print "R497"}; continue};
 if ( gl_nemn(-1) &&
      (prl_mnim(1)||prq_mnim(1)||prl_krmn(1)) &&
        deep(2) && s(-1,0) && sc(1,",") )
 { l[i]=is_vsyo; r[498]++; if(dbg){print "R498"}; continue};

 # Все + ... + глагол ============================================
 # все + ... + гл.мн.
 if ( w(1,"так") &&
      (gl_vzmn(2)||gl_nemn(2)) && s(0,1) )
 { l[i]=is_vsje; r[499]++; if(dbg){print "R499"}; continue};
 if ( (nar_mest(1)||nar_kaq(1)||nar_vrem(1)||nar_spos(1)) &&
       (gl_vzmn(2)||gl_nemn(2)) && s(0,1) )
 { l[i]=is_vsje; r[500]++; if(dbg){print "R500"}; continue};
 if ( (nar_mest(1)||nar_kaq(1)||nar_vrem(1)||nar_spos(1)) &&
       (gl_pnmn(2)||gl_pemn(2)) && s(0,1) )
 { l[i]=is_vsje; r[501]++; if(dbg){print "R501"}; continue};
 if ( nar_vrem(1) &&
       nar_vrem(2) &&
       (gl_vzmn(3)||gl_nemn(3)) && s(0,2) )
 { l[i]=is_vsje; r[502]++; if(dbg){print "R502"}; continue};
 if ( (gl_vzed(-1)||gl_vzmn(-1)||gl_nemn(-1)) &&
        prl_srav(1) && s(-1,0) )
 { l[i]=is_vsyo; r[503]++; if(dbg){print "R503"}; continue};
 if ( nar_srav(1) &&
      (gl_vzmn(2)||gl_nemn(2)||gl_pemn(2)) && s(0,1) )
 { l[i]=is_vsyo; r[504]++; if(dbg){print "R504"}; continue};
 if ( suw_mnim(-1) && cap(-1) &&
      (gl_vzmn(1)||gl_nemn(1)) && s(0,0) && p(1) )
 { l[i]=is_vsyo; r[505]++; if(dbg){print "R505"}; continue};
 if ( Q(-2,"pre_vi") &&
       suw_edim(-1) &&
       (gl_vzmn(1)||gl_nemn(1)) && s(-1,0) && p(1) )
 { l[i]=is_vsyo; r[506]++; if(dbg){print "R506"}; continue};
 if ( (suw_edim(-3)||suw_mnim(-3)) &&
        pre_pr(-2) &&
        (suw_edpr(-1)||suw_mnpr(-1)) &&
         (gl_vzmn(1)||gl_nemn(1)) && s(0,0) && p(1) )
 { l[i]=is_vsyo; r[507]++; if(dbg){print "R507"}; continue};
 if ( gl_vzmn(-3) &&
       pre_tv(-2) &&
       (suw_edtv(-1)||suw_mntv(-1)||mest_tv(-1)) )
 { l[i]=is_vsje; r[508]++; if(dbg){print "R508"}; continue};


 # Всё + ... + глагол.мн + дополнение ============================
  if ( gl_pemn(-2) &&
        w(-1,"себя") && s(-2,-1) )
 { l[i]=is_vsje; r[509]++; if(dbg){print "R509"}; continue};
if ( gl_nemn(1) &&
      nar_kaq(2) &&
       prq_krmn(3) && s(0,2) )
 { l[i]=is_vsje; r[510]++; if(dbg){print "R510"}; continue};
 if ( gl_nemn(1) &&
       prl_krmn(2) && s(0,1) )
 { l[i]=is_vsje; r[511]++; if(dbg){print "R511"}; continue};
 if ( (gl_pemn(1)||gl_pnmn(1)) &&
       (suw_edro(2)||suw_mnro(2)) && s(0,1) )
 { l[i]=is_vsje; r[512]++; if(dbg){print "R512"}; continue};

 if ( (gl_pemn(1)||gl_pnmn(1)) &&
       (suw_edtv(2)||suw_mntv(2)||suw_edda(2)||suw_mnda(2)) && s(0,1) )
 { l[i]=is_vsyo; r[513]++; if(dbg){print "R513"}; continue};

 # все + гл.мн и/или гл.мн
 if ( (gl_pemn(1)||gl_nemn(1)||gl_pnmn(1)||gl_vzmn(1)) &&
        w(2,"и") &&
        (gl_pemn(3)||gl_nemn(3)||gl_pnmn(3)||gl_vzmn(3)) && s(0,2) && qq(1,3) )
 { l[i]=is_vsyo; r[514]++; if(dbg){print "R514"}; continue};
 if ( mest_mnim(-2) && w(-1,"то") && se(-2,"-") &&
      (gl_pemn(1)||gl_nemn(1)||gl_pnmn(1)||gl_vzmn(1)) &&
        w(2,"и") &&
        (gl_pemn(3)||gl_nemn(3)||gl_pnmn(3)||gl_vzmn(3)) && s(0,2) )
 { l[i]=is_vsyo; r[515]++; if(dbg){print "R515"}; continue};
 if ( mest_mnim(-1) &&
      (gl_pemn(1)||gl_nemn(1)||gl_pnmn(1)||gl_vzmn(1)) &&
        w(2,"и") &&
        (gl_pemn(3)||gl_nemn(3)||gl_pnmn(3)||gl_vzmn(3)) && s(0,2) )
 { l[i]=is_vsyo; r[516]++; if(dbg){print "R516"}; continue};
 if ( w(1,"и") &&
      (gl_pemn(2)||gl_nemn(2)||gl_pnmn(2)||gl_vzmn(2)) &&
        w(3,"и") &&
        (gl_pemn(4)||gl_nemn(4)||gl_pnmn(4)||gl_vzmn(4)) && s(0,3) )
 { l[i]=is_vsje; r[517]++; if(dbg){print "R517"}; continue};
 if ( (gl_pemn(1)||gl_nemn(1)||gl_pnmn(1)||gl_vzmn(1)) &&
        w(2,"и") &&
        (gl_pemn(3)||gl_nemn(3)||gl_pnmn(3)||gl_vzmn(3)) && s(0,2) )
 { l[i]=is_vsje; r[518]++; if(dbg){print "R518"}; continue};

 # гл.ед + ... + всё
 if ( (gl_ed(-1)||gl_in(-1)) &&
       (nar_vrem(1)||nar_mest(1)||nar_spos(1)||nar_srav(1)||nar_kaq(1)||suw_edvi(1)) && s(-1,0) )
 { l[i]=is_vsyo; r[519]++; if(dbg){print "R519"}; continue};
 # гл.ед + всё
 if ( (gl_ed(-2)||gl_in(-2)) &&
        mest_da(-1) &&
         pre_pr(1) &&
         (prl_edpr(2)||prl_mnro(2)||suw_edpr(2)||suw_mnpr(2)) && s(-2,1) )
 { l[i]=is_vsyo; r[520]++; if(dbg){print "R520"}; continue};
 # гл.ед + всё
 if ( (gl_ed(-1)||gl_in(-1)) &&
        suw_mnvi(1) && s(-1,0) && W(1,"новые") )
 { l[i]=is_vsje; r[521]++; if(dbg){print "R521"}; continue};


 # всё то, что
 if ( w(1,"то") && sc(1,",") &&
       mest_edsr(2) )
 { l[i]=is_vsyo; r[522]++; if(dbg){print "R522"}; continue};
 # всё, что
 if ( sc(0,",") &&
       mest_edsr(1) && W(2,"есть") )
 { l[i]=is_vsyo; r[523]++; if(dbg){print "R523"}; continue};
 # все те, кто
 if ( w(1,"те") && sc(1,",") &&
      (mest_edmu(1)||mest_edze(1)) )
 { l[i]=is_vsje; r[524]++; if(dbg){print "R524"}; continue};
 # все, кто
 if ( sc(0,",") &&
       (mest_edmu(1)||mest_edze(1)) )
 { l[i]=is_vsje; r[525]++; if(dbg){print "R525"}; continue};
 # учитывало всё, кроме
 if ( gl_ed(-1) && s(-1,-1) &&
       sc(0,",") &&
        w(1,"кроме") )
 { l[i]=is_vsyo; r[526]++; if(dbg){print "R526"}; continue};

 # все, которые
 if ( sc(0,",") &&
      (mest_da(1)||suw_edda(1)||suw_mnda(1)) )
 { l[i]=is_vsyo; r[527]++; if(dbg){print "R527"}; continue};
 if ( sc(0,",") &&
      (mest_mn(1)||prq_mnim(1)) && W(1,"мы вы") )
 { l[i]=is_vsje; r[528]++; if(dbg){print "R528"}; continue};

 # Ну всё,
 if ( w(-1,"ну") && s(-1,-1) )
 { l[i]=is_vsyo; r[529]++; if(dbg){print "R529"}; continue};
 if ( phs(-1,"ну всё") && sc(-1,",") && p(0) )
 { l[i]=is_vsyo; r[530]++; if(dbg){print "R530"}; continue};



 # Всё + ... + глагол.ед ============================================
 if ( (nar_vrem(1)||nar_mest(1)||nar_spos(1)||nar_srav(1)||nar_kaq(1)||nar_step(3)) &&
        gl_edsr(2) && s(0,1) )
 { l[i]=is_vsyo; r[531]++; if(dbg){print "R531"}; continue};
 if ( gl_edsr(-3) &&
       w(-2,"ли же ведь") &&
        mest_it(-1) && s(-3,-1) )
 { l[i]=is_vsyo; r[532]++; if(dbg){print "R532"}; continue};
 if ( gl_edsr(-1) && s(-1,-1) )
 { l[i]=is_vsyo; r[533]++; if(dbg){print "R533"}; continue};
 if ( gl_vzed(1) && Q(1,"gl_vzmn") && s(0,0) )
 { l[i]=is_vsyo; r[534]++; if(dbg){print "R534"}; continue};
 if ( prl_kred_sr(1) &&
       gl_in(2) && s(0,1) )
 { l[i]=is_vsyo; r[535]++; if(dbg){print "R535"}; continue};
 if ( gl_vzed(-1) &&
      (pre_vi(1)||pre_ro(1)||pre_tv(1)) && s(-1,0) )
 { l[i]=is_vsyo; r[536]++; if(dbg){print "R536"}; continue};
 if ( w(-2,"так") &&
      (mest_edim(-1)||mest_mnim(-1)) &&
        w(1,"себе") &&
         w(2,"и") && s(-2,1) )
 { l[i]=is_vsyo; r[537]++; if(dbg){print "R537"}; continue};
 if ( (gl_ed(-1)) &&
        w(1,"так") && sc(1,",") &&
         w(2,"что чтобы") && s(-1,-1) && s(0,0) )
 { l[i]=is_vsyo; r[538]++; if(dbg){print "R538"}; continue};
 if ( sc(0,",") &&
       gl_vzed(-1) && s(-1,-1) )
 { l[i]=is_vsyo; r[539]++; if(dbg){print "R539"}; continue};
 if ( qast(1) &&
       qast(2) &&
       (nar_vrem(3)||nar_mest(3)||nar_spos(3)||nar_srav(3)||nar_kaq(3)||suw_edvi(3)||mest_ed(3)) &&
        (gl_ed(4)||gl_in(4)) && s(0,3) )
 { l[i]=is_vsyo; r[540]++; if(dbg){print "R540"}; continue};
 if ( qast(1) &&
       qast(2) &&
       (nar_vrem(3)||nar_mest(3)||nar_spos(3)||nar_srav(3)||nar_kaq(3)||suw_edvi(3)||mest_ed(3)) &&
         qast(4) &&
         (gl_ed(5)||gl_in(5)) && s(0,4) )
 { l[i]=is_vsyo; r[541]++; if(dbg){print "R541"}; continue};
 if ( qast(1) &&
      (nar_vrem(2)||nar_mest(2)||nar_spos(2)||nar_srav(2)||nar_kaq(2)||suw_edvi(2)||mest_ed(2)) &&
       (gl_ed(3)||gl_in(3)) && s(0,2) )
 { l[i]=is_vsyo; r[542]++; if(dbg){print "R542"}; continue};
 if ( qast(1) &&
      (nar_vrem(2)||nar_mest(2)||nar_spos(2)||nar_srav(2)||nar_kaq(2)||suw_edvi(2)||mest_ed(2)) &&
        qast(3) &&
        (gl_ed(4)||gl_in(4)) && s(0,3) )
 { l[i]=is_vsyo; r[543]++; if(dbg){print "R543"}; continue};
 if ( mest_mnim(-2) &&
       gl_pnmn(-1) &&
       (nar_vrem(1)||nar_mest(1)||nar_spos(1)||nar_srav(1)||nar_kaq(1)||suw_edvi(1)||mest_ed(1)) && s(-2,0) )
 { l[i]=is_vsje; r[544]++; if(dbg){print "R544"}; continue};
 if ( (nar_vrem(1)||nar_mest(1)||nar_spos(1)||nar_srav(1)||nar_kaq(1)||suw_edvi(1)||mest_ed(1)) &&
        qast(2) &&
        (gl_ed(3)||gl_in(3)) && s(0,2) )
 { l[i]=is_vsyo; r[545]++; if(dbg){print "R545"}; continue};
 if ( gl_nemn(-1) &&
       gl_in(1) && s(-1,0) && p(1) )
 { l[i]=is_vsyo; r[546]++; if(dbg){print "R546"}; continue};
 if ( nar_mest(1) &&
       mest_da(2) &&
        gl_ed(3) && s(0,2) )
 { l[i]=is_vsyo; r[547]++; if(dbg){print "R547"}; continue};
 if ( nar_mest(1) &&
       mest_da(2) &&
        qast(3) &&
         gl_ed(4) && s(0,3) )
 { l[i]=is_vsyo; r[548]++; if(dbg){print "R548"}; continue};
 if ( nar_mest(1) &&
       gl_pnmn(2) &&
        gl_in(3) && s(0,2) )
 { l[i]=is_vsje; r[549]++; if(dbg){print "R549"}; continue};
 if ( nar_mest(1) &&
       gl_pnmn(2) &&
        qast(3) &&
         gl_in(4) && s(0,3) )
 { l[i]=is_vsje; r[550]++; if(dbg){print "R550"}; continue};
 if ( (gl_pnmn(1)||gl_pemn(1)) &&
       gl_in(2) && s(0,1) )
 { l[i]=is_vsje; r[551]++; if(dbg){print "R551"}; continue};
 if ( (gl_pnmn(1)||gl_pemn(1)) &&
       qast(2) &&
        gl_in(3) && s(0,2) )
 { l[i]=is_vsje; r[552]++; if(dbg){print "R552"}; continue};
 if ( (gl_ed(1)||gl_in(1)) && s(0,0) && cap(0) && p(1) )
 { l[i]=is_vsyo; r[553]++; if(dbg){print "R553"}; continue};
 if ( pre_ro(-2) &&
       mest_ro(-1) &&
       (gl_ed(1)||gl_in(1)) && s(-2,0) )
 { l[i]=is_vsyo; r[554]++; if(dbg){print "R554"}; continue};
 if ( w(1,"и не ли так как же") &&
      (gl_ed(2)||gl_in(2)) && s(0,1) )
 { l[i]=is_vsyo; r[555]++; if(dbg){print "R555"}; continue};
 if ( gl_ed(-3) &&
       w(-2,"бы") &&
        mest_mnvi(-1) &&
        (gl_ed(1)||gl_in(1)) && s(-3,0) )
 { l[i]=is_vsje; r[556]++; if(dbg){print "R556"}; continue};
 if ( gl_ed(-3) &&
       pre_pr(-2) &&
       (suw_edpr(-1)||suw_mnpr(-1)||prl_edpr(-1)||prl_mnpr(-1)||wc(-1,"ах$")) && s(-3,-1) )
 { l[i]=is_vsyo; r[557]++; if(dbg){print "R557"}; continue};
 if ( gl_ed(-1) &&
       pre_pr(1) &&
       (suw_edpr(2)||suw_mnpr(2)||prl_edpr(2)||prl_mnpr(2)||wc(2,"ах$")) && s(-1,1) )
 { l[i]=is_vsyo; r[558]++; if(dbg){print "R558"}; continue};
 if ( gl_ed(-2) &&
       mest_mnvi(-1) &&
       (gl_ed(1)||gl_in(1)) && s(-2,0) )
 { l[i]=is_vsje; r[559]++; if(dbg){print "R559"}; continue};
 if ( mest_mnvi(-1) &&
      (gl_ed(1)||gl_in(1)) && s(-1,0) )
 { l[i]=is_vsyo; r[560]++; if(dbg){print "R560"}; continue};
 if ( (gl_ed(1)||gl_in(1)) && s(0,0) )
 { l[i]=is_vsyo; r[561]++; if(dbg){print "R561"}; continue};
 if ( mest_da(1) &&
      (gl_ed(2)||gl_in(2)) && s(0,1) )
 { l[i]=is_vsyo; r[562]++; if(dbg){print "R562"}; continue};
 if (  (nar_vrem(1)||nar_mest(1)||nar_spos(1)||nar_step(1)||nar_srav(1)||nar_kaq(1)) &&
        (gl_ed(2)||gl_in(2)) && s(0,1) )
 { l[i]=is_vsyo; r[563]++; if(dbg){print "R563"}; continue};


 # все + ... + перех глагол ============================================
 if ( mest_mn(1) &&
      (gl_pemn(2)||gl_pnmn(2)) &&
        w(3,"о об") &&
        (mest_pr(4)||suw_edtv(4)||suw_mntv(4)) && s(0,3) )
 { l[i]=is_vsje; r[564]++; if(dbg){print "R564"}; continue};
 if ( (gl_pemn(1)||gl_pnmn(1)) &&
        w(2,"о об") &&
        (mest_pr(3)||suw_edtv(3)||suw_mntv(3)) && s(0,2) )
 { l[i]=is_vsje; r[565]++; if(dbg){print "R565"}; continue};
 if ( mest_vi(1) &&
      (gl_pemn(2)||gl_pnmn(2)) &&
       (suw_mnvi(3)||prl_mnvi(3)) && s(0,1) )
 { l[i]=is_vsyo; r[566]++; if(dbg){print "R566"}; continue};
 if ( mest_vi(1) &&
      (gl_pemn(2)||gl_pnmn(2)) && s(0,1) )
 { l[i]=is_vsje; r[567]++; if(dbg){print "R567"}; continue};
 if ( wc(1,"..ы$") &&
      (gl_pemn(2)||gl_pnmn(2)||gl_nemn(2)||gl_vzmn(2)) && s(0,1) )
 { l[i]=is_vsje; r[568]++; if(dbg){print "R568"}; continue};
 if ( prl_kred_sr(1) &&
      (gl_pemn(2)||gl_pnmn(2)) &&
       (suw_edvi(3)||suw_mnvi(3)) && s(0,2) )
 { l[i]=is_vsje; r[569]++; if(dbg){print "R569"}; continue};
 if ( mest_vi(1) &&
       qast(2) &&
       (gl_pemn(3)||gl_pnmn(3)) && s(0,2) )
 { l[i]=is_vsje; r[570]++; if(dbg){print "R570"}; continue};
 if (gl_pemn(1) &&
     (prl_edvi(2)||prl_mnvi(2)||prq_mnvi(2)) &&
       (suw_edvi(3)||suw_mnvi(3)) && s(0,2) )
 { l[i]=is_vsje; r[571]++; if(dbg){print "R571"}; continue};
 if (qast(1) &&
      gl_pemn(2) &&
      (prl_edvi(3)||prl_mnvi(3)||prq_edvi(3)||prq_mnvi(3)) &&
       (suw_edvi(4)||suw_mnvi(4)) && s(0,3) )
 { l[i]=is_vsje; r[572]++; if(dbg){print "R572"}; continue};
 if (mest_mnim(1) &&
     (gl_pemn(2)||gl_pnmn(2)) &&
      (prl_edvi(3)||prl_mnvi(3)||prq_edvi(3)||prq_mnvi(3)) &&
       (suw_edvi(4)||suw_mnvi(4)) && s(0,3) )
 { l[i]=is_vsje; r[573]++; if(dbg){print "R573"}; continue};
 if (mest_mnim(1) &&
     (gl_pemn(2)||gl_pnmn(2)) &&
      (prl_edvi(3)||prl_mnvi(3)||prq_mnvi(3)||prl_edvi(3)) &&
       (prl_edvi(4)||prl_mnvi(4)||prq_mnvi(4)||prl_edvi(4)) && s(0,3) )
 { l[i]=is_vsje; r[574]++; if(dbg){print "R574"}; continue};
 if (mest_mnim(1) &&
      qast(2) &&
      (gl_pemn(3)||gl_pnmn(3)) &&
       (prl_edvi(4)||prl_mnvi(4)||prq_mnvi(4)) &&
        (suw_edvi(5)||suw_mnvi(5)) && s(0,4) )
 { l[i]=is_vsje; r[575]++; if(dbg){print "R575"}; continue};
 if (gl_pnmn(1) &&
      pre_vi(2) &&
       suw_edvi(3) && s(0,2) )
 { l[i]=is_vsje; r[576]++; if(dbg){print "R576"}; continue};
 if ( (gl_nemn(1)||gl_pnmn(1)||gl_pemn(1)) &&
        nar_srav(2) && s(0,1) && p(2) )
 { l[i]=is_vsje; r[577]++; if(dbg){print "R577"}; continue};
 if ( suw_mnvi(-1) &&
      (gl_nemn(1)||gl_pnmn(1)||gl_pemn(1)) &&
        pre_pr(2) &&
        (suw_edpr(3)||suw_edme(3)) && s(-1,2) )
 { l[i]=is_vsyo; r[578]++; if(dbg){print "R578"}; continue};
 if ( (gl_nemn(1)||gl_pnmn(1)||gl_pemn(1)) &&
        pre_pr(2) &&
        (suw_edpr(3)||suw_edme(3)) && s(0,2) )
 { l[i]=is_vsje; r[579]++; if(dbg){print "R579"}; continue};
 if (qast(1) &&
      gl_pnmn(2) &&
       pre_vi(3) &&
        suw_edvi(4) && s(0,3) )
 { l[i]=is_vsje; r[580]++; if(dbg){print "R580"}; continue};
 if (gl_pnmn(1) &&
      pre_vi(2) &&
       mest_vi(3) &&
        suw_edvi(4) && s(0,3) )
 { l[i]=is_vsje; r[581]++; if(dbg){print "R581"}; continue};
 if (qast(1) &&
      gl_pnmn(2) &&
       pre_vi(3) &&
        mest_vi(4) &&
         suw_edvi(5) && s(0,4) )
 { l[i]=is_vsje; r[582]++; if(dbg){print "R582"}; continue};
 if (gl_pnmn(1) &&
      pre_vi(2) &&
       mest_vi(3) && s(0,2) && p(3) )
 { l[i]=is_vsje; r[583]++; if(dbg){print "R583"}; continue};
 if (prl_kred_sr(1) &&
      gl_pnmn(2) &&
       pre_vi(3) &&
        mest_vi(4) && s(0,3) )
 { l[i]=is_vsje; r[584]++; if(dbg){print "R584"}; continue};
 if (pre_vi(1) &&
      mest_vi(2) &&
       gl_pnmn(3) && s(0,2) )
 { l[i]=is_vsje; r[585]++; if(dbg){print "R585"}; continue};
 if (pre_vi(1) &&
      mest_vi(2) &&
       qast(3) &&
        gl_pnmn(4) && s(0,3) )
 { l[i]=is_vsje; r[586]++; if(dbg){print "R586"}; continue};
 if (pre_tv(1) &&
      mest_tv(2) &&
       nar_mest(3) &&
        gl_vzmn(4) && s(0,3) )
 { l[i]=is_vsje; r[587]++; if(dbg){print "R587"}; continue};
 if (pre_pr(1) &&
     (prl_edpr(2)||prl_mnpr(2)) &&
      (suw_edpr(3)||suw_mnpr(3)) &&
        gl_ed(4) && s(0,3) )
 { l[i]=is_vsyo; r[588]++; if(dbg){print "R588"}; continue};
 if (pre_pr(1) &&
     (prl_edpr(2)||prl_mnpr(2)) &&
      (suw_edpr(3)||suw_mnpr(3)) &&
       (gl_vzmn(4)||gl_nemn(4)) && s(0,3) )
 { l[i]=is_vsje; r[589]++; if(dbg){print "R589"}; continue};
 if ( (gl_pemn(1)||gl_pnmn(1)) &&
        mest_vi(2) &&
        (prl_edvi(3)||prl_mnvi(3)||prq_mnvi(3)||suw_edvi(3)||suw_mnvi(3)) && s(0,2) )
 { l[i]=is_vsje; r[590]++; if(dbg){print "R590"}; continue};
 if (qast(1) &&
     (gl_pemn(2)||gl_pnmn(2)) &&
       mest_vi(3) &&
       (prl_edvi(4)||prl_mnvi(4)||prq_mnvi(4)||suw_edvi(4)||suw_mnvi(4)) && s(0,3) )
 { l[i]=is_vsje; r[591]++; if(dbg){print "R591"}; continue};
 if ( (gl_pemn(1)||gl_pnmn(1)) && cap(0) &&
       (suw_edvi(2)||suw_mnvi(2)||mest_vi(2)) &&
         gl_in(3) && s(0,2) )
 { l[i]=is_vsyo; r[592]++; if(dbg){print "R592"}; continue};
 if ( (gl_pemn(1)||gl_pnmn(1)) &&
       (suw_edvi(2)||suw_mnvi(2)||mest_vi(2)) && s(0,1) )
 { l[i]=is_vsje; r[593]++; if(dbg){print "R593"}; continue};
 if (mest_da(-1) &&
     (suw_edvi(1)||suw_mnvi(1)) &&
      (gl_pemn(2)||gl_pnmn(2)) && s(-1,1) )
 { l[i]=is_vsje; r[594]++; if(dbg){print "R594"}; continue};
 if ((qast(1)||mest_da(1)) &&
      (gl_pemn(2)||gl_pnmn(2)) &&
       (suw_edvi(3)||suw_mnvi(3)||mest_vi(3)) && s(0,2) )
 { l[i]=is_vsje; r[595]++; if(dbg){print "R595"}; continue};



 # гл.мн. + дополнение с прдл. в вин. п.
 if ( gl_nemn(-2) &&
       pre_vi(-1) &&
       (suw_edtv(1)||suw_mntv(1)) && s(-2,0) )
 { l[i]=is_vsyo; r[596]++; if(dbg){print "R596"}; continue};

 # гл.мн. + дополнение с прдл. в пр. п.
 if ( (suw_mnim(-2)||suw_mnne(-2)) &&
         gl_nemn(-1) &&
          pre_pr(1) && s(-2,1) )
 { l[i]=is_vsje; r[597]++; if(dbg){print "R597"}; continue};
 if ( pre_pr(1) &&
        suw_edpr(2) &&
        (gl_nemn(3)||gl_pnmn(3)) &&
          pre_pr(4) && s(0,3) )
 { l[i]=is_vsje; r[598]++; if(dbg){print "R598"}; continue};
 if ( mest_mnim(1) &&
       pre_tv(2) &&
       (suw_edtv(3)||suw_mntv(3)) &&
        (gl_nemn(4)||gl_pnmn(4)) &&
          pre_pr(5) && s(0,4) )
 { l[i]=is_vsje; r[599]++; if(dbg){print "R599"}; continue};
 if ( pre_tv(1) &&
      (suw_edtv(2)||suw_mntv(2)) &&
       (gl_nemn(3)||gl_pnmn(3)) &&
         pre_pr(4) && s(0,3) )
 { l[i]=is_vsje; r[600]++; if(dbg){print "R600"}; continue};

 # гл.мн. + дополнение с прдл. в тв. п.
 if ( (suw_mnim(-2)||suw_mnne(-2)) &&
         gl_nemn(-1) &&
          pre_tv(1) && s(-2,1) )
 { l[i]=is_vsje; r[601]++; if(dbg){print "R601"}; continue};
 if ( pre_pr(1) &&
        suw_edpr(2) &&
        (gl_nemn(3)||gl_pnmn(3)) &&
          pre_tv(4) && s(0,3) )
 { l[i]=is_vsje; r[602]++; if(dbg){print "R602"}; continue};
 if ( mest_mnim(1) &&
       pre_tv(2) &&
       (suw_edtv(3)||suw_mntv(3)) &&
        (gl_nemn(4)||gl_pnmn(4)) &&
          pre_tv(5) && s(0,4) )
 { l[i]=is_vsje; r[603]++; if(dbg){print "R603"}; continue};
 if ( pre_tv(1) &&
      (suw_edtv(2)||suw_mntv(2)) &&
       (gl_nemn(3)||gl_pnmn(3)) &&
         pre_tv(4) && s(0,3) )
 { l[i]=is_vsje; r[604]++; if(dbg){print "R604"}; continue};



 # гл.мн + все + ...  ============================================
 # гл.мн + все + ... + доп.
 if ( (gl_vzmn(-1)||gl_nemn(-1)) &&
        sc(0,",") &&
        (nar_mest(1)||nar_kaq(1)||nar_vrem(1)||nar_spos(1)||mest_mn(1)||suw_edda(1)) && s(-1,-1) )
 { l[i]=is_vsje; r[605]++; if(dbg){print "R605"}; continue};
 if ( (gl_pemn(1)) && sc(1,",") &&
        w(2,"что") && s(0,0) )
 { l[i]=is_vsje; r[606]++; if(dbg){print "R606"}; continue};
 if ( (gl_vzmn(-1)||gl_nemn(-1)) && s(-1,-1) &&
        sc(0,",") )
 { l[i]=is_vsje; r[607]++; if(dbg){print "R607"}; continue};


 # ... + всё[;.?!]
 if ( (w(-1,"и")||mest_ed(-1)||nar_vrem(-1)) && s(-1,-1) && cap(-1) && p(0) )
 { l[i]=is_vsyo; r[608]++; if(dbg){print "R608"}; continue};

 if ( (gl_vzmn(-1)||gl_nemn(-1)) && s(-1,-1) && p(0) )
 { l[i]=is_vsje; r[609]++; if(dbg){print "R609"}; continue};

 if ( (gl_ed(-1)||gl_in(-1)) && s(-1,-1) && (p(0)||pre_any(1)) )
 { l[i]=is_vsyo; r[610]++; if(dbg){print "R610"}; continue};

 if ( w(1,"были") && s(0,0) )
 { l[i]=is_vsje; r[611]++; if(dbg){print "R611"}; continue};


 # звательное ---------------------------
 if ( zvat(1) && sc(0,",") && p(1) )
 { l[i]=is_vsyo; r[612]++; if(dbg){print "R612"}; continue};

 # вводные предложения ----------------------------------------------------
 if ( mest_mnim(1) &&
       nar_mest(2) &&
        vv(2) &&
         suw_mnim(vvn+1) )
 { l[i]=is_vsje; r[613]++; if(dbg){print "R613"}; continue};
 if ( vv(0) &&
       suw_mnim(vvn+1) )
 { l[i]=is_vsje; r[614]++; if(dbg){print "R614"}; continue};
 if ( mest_mnim(1) && vv(1) &&
      (nar_spos(vvn+1)||prl_kred_sr(vvn+1)) &&
        prl_krmn(vvn+2) && s(0,0) && s(vvn+1,vvn+1) && p(vvn+2) )
 { l[i]=is_vsje; r[615]++; if(dbg){print "R615"}; continue};
 if ( mest_mnim(1) && vv(1) &&
       gl_povzmn(vvn+1) && s(0,0) )
 { l[i]=is_vsje; r[616]++; if(dbg){print "R616"}; continue};
 if ( mest_mnim(1) && vv(1) &&
       nar_mest(vvn+1) &&
        nar_mest(vvn+2) && s(0,0) && s(vvn+1,vvn+1) )
 { l[i]=is_vsje; r[617]++; if(dbg){print "R617"}; continue};
 if ( vv(1) &&
       gl_edsr(vvn+1) )
 { l[i]=is_vsyo; r[618]++; if(dbg){print "R618"}; continue};
 if ( vv(0) && (gl_vzmn(vvn+1)||gl_nemn(vvn+1)) )
 { l[i]=is_vsje; r[619]++; if(dbg){print "R619"}; continue};
 if ( vvb(-1) && suw_mnim(vvn) )
 { l[i]=is_vsje; r[620]++; if(dbg){print "R620"}; continue};
 if ( vvb(-2) &&
       w(vvn,"вот") &&
        w(-1,"и") && s(-1,-1) && p(0) )
 { l[i]=is_vsyo; r[621]++; if(dbg){print "R621"}; continue};

 # поиск вперёд ----------------------------------------------------------
 if ( qf(7,"gl_edsr") &&
       (prl_kred_sr(qfn+1)||suw_edtv(qfn+1)) && s(0,qfn) )
 { l[i]=is_vsyo; r[622]++; if(dbg){print "R622"}; continue};
 if ( qf(7,"gl_nemn") &&
       prq_krmn(qfn+1) && s(0,qfn) )
 { l[i]=is_vsje; r[623]++; if(dbg){print "R623"}; continue};
 if ( qf(5,"gl_edsr") && s(0,qfn-1) )
 { l[i]=is_vsyo; r[624]++; if(dbg){print "R624"}; continue};
 if ( mest_it(1) &&
       mest_da(2) &&
        qf(7,"prl_kred_sr") && s(0,qfn-1) && p(qfn) )
 { l[i]=is_vsyo; r[625]++; if(dbg){print "R625"}; continue};
 if ( mest_mn(1) &&
       qf(6,"gl_vzmn") && s(0,qfn-1) )
 { l[i]=is_vsje; r[626]++; if(dbg){print "R626"}; continue};
 if ( qf(5,"gl_vzmn") && s(0,qfn-1) )
 { l[i]=is_vsje; r[627]++; if(dbg){print "R627"}; continue};

 #--- фразы ----------------------------------------------------

 # поиск назад ------------------------------------------------------------
 if ( pre_ro(1) && qb(-4,"mest_mn") &&
      (suw_edro(2)||suw_mnro(2)) && s(qbn,1) )
 { l[i]=is_vsyo; r[628]++; if(dbg){print "R628"}; continue};
 if ( qb(-7,"mest_im") &&
       phs(-1,"как и") && s(-2,-1) )
 { l[i]=is_vsje; r[629]++; if(dbg){print "R629"}; continue};
 if ( qb(-5,"suw_mnim") &&
        pre_pr(1) &&
        (mest_pr(2)||suw_edtv(2)||suw_mntv(2)) && s(qbn,1) )
 { l[i]=is_vsje; r[630]++; if(dbg){print "R630"}; continue};
 if ( (qb(-5,"prl_krmn")||qb(-5,"mest_mnim")) && sv(qbn,0,".") &&
       (prl_kred_sr(1)||prl_edsrim(1)) && s(0,0) && p(1) )
 { l[i]=is_vsje; r[631]++; if(dbg){print "R631"}; continue};

 if ( wb_raw(-7,"все́") && sv(wbn,-2,"[!.?]") && p(-1) )
 { l[i]=is_vsje; r[632]++; if(dbg){print "R632"}; continue};
 if ( wb(-7,"всё") && sv(wbn,-2,"[!.?]") && p(-1) )
 { l[i]=is_vsyo; r[633]++; if(dbg){print "R633"}; continue};


 # Конечное подбирание хвостов ----------------------------------------------
 if ( (nar_spos(1)||nar_napr(1)||nar_step(1)) && s(0,0) && p(1) )
 { l[i]=is_vsyo; r[634]++; if(dbg){print "R634"}; continue};
 if ( suw_mnim(1) && (prl_mnim(1)||prl_mnvi(1)) && W(1,"новые") && s(0,0) )
 { l[i]=is_vsje; r[635]++; if(dbg){print "R635"}; continue};
 if ( (prq_mnim(1)||prq_krmn(1)) && s(0,0) )
 { l[i]=is_vsje; r[636]++; if(dbg){print "R636"}; continue};
 if ( (gl_vzmn(1)||gl_nemn(1)) && s(0,0) && p(1) )
 { l[i]=is_vsje; r[637]++; if(dbg){print "R637"}; continue};
 if ( prl_srav(1) && s(0,0) )
 { l[i]=is_vsyo; r[638]++; if(dbg){print "R638"}; continue};
 if ( gl_poed(-1) && s(-1,-1) && p(0) )
 { l[i]=is_vsyo; r[639]++; if(dbg){print "R639"}; continue};
 if ( deep(1) && s(0,0) )
 { l[i]=is_vsyo; r[640]++; if(dbg){print "R640"}; continue};

 # короткие предложения в зависимости от предыдущей строки
 if (i<=5 && prevyo == b-1 )
 { l[i]=is_vsyo; r[641]++; if(dbg){print "R641"}; continue};

 # короткие предложения в зависимости от предыдущей строки
 if (i<=5 && prevje == b-1 )
 { l[i]=is_vsje; r[642]++; if(dbg){print "R642"}; continue};

             }; delete wpos;

 # всё/все́ в предыдущей строке
 if (nf-i <= 7 && l[i] in vsyos) {prevyo = b};
 if (nf-i <= 7 && l[i] in vsjes) {prevje = b};

 book[b]=joinpat(l,sep,nf) };};                                                ##_footer_vsez

### x1000 !_#_!
 #  x1000 klitika_  none_
for(wrd in omap["x1000"]){omakevars(x1000,"x1000");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"Ykl") && notsym(-1,unxy) && s(-1,-1) )
 { l[i-1]=gensub(/([АЕЁИОУЫЭЮЯаеёиоуыэюя])/,"\\1\xcc\x81",1,l[i-1]); l[i]=gensub(/^(.)/,"\xcc\xa0\\1\xcc\xad",1,l[i]); r[643]++; if(dbg){print "R643"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1001 !_#_!
 #  x1001 gl_pomn_      zalt_
for(wrd in omap["x1001"]){omakevars(x1001,"x1001");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pomn_f() )
 { l[i]=omo1; r[644]++; if(dbg){print "R644"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1002 !_#_!
 #  x1002 pq_kr_em_     zalt1_     zalt2_
for(wrd in omap["x1002"]){omakevars(x1002,"x1002");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[645]++; if(dbg){print "R645"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1003 !_#_!
 #  x1003 sw_em_r_      zalt_
for(wrd in omap["x1003"]){omakevars(x1003,"x1003");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[646]++; if(dbg){print "R646"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1004 !_#_!
 #  x1004 sw_1em_vr_2mn_iv_   zalt_
for(wrd in omap["x1004"]){omakevars(x1004,"x1004");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[647]++; if(dbg){print "R647"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[648]++; if(dbg){print "R648"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[649]++; if(dbg){print "R649"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[650]++; if(dbg){print "R650"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1005 !_#_!
 #  x1005 sw_1ez_r_2mn_iv_    zalt_
for(wrd in omap["x1005"]){omakevars(x1005,"x1005");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[651]++; if(dbg){print "R651"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[652]++; if(dbg){print "R652"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[653]++; if(dbg){print "R653"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1006 !_#_!
 #  x1006 sw_em_d_      zalt_
for(wrd in omap["x1006"]){omakevars(x1006,"x1006");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[654]++; if(dbg){print "R654"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1007 !_#_!
 #  x1007 sw_em_i_      zalt_
for(wrd in omap["x1007"]){omakevars(x1007,"x1007");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[655]++; if(dbg){print "R655"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1008 !_#_!
 #  x1008 sw_em_iv_     zalt_
for(wrd in omap["x1008"]){omakevars(x1008,"x1008");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[656]++; if(dbg){print "R656"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[657]++; if(dbg){print "R657"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1009 !_#_!
 #  x1009 sw_es_iv_     zalt_
for(wrd in omap["x1009"]){omakevars(x1009,"x1009");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo1; r[658]++; if(dbg){print "R658"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo1; r[659]++; if(dbg){print "R659"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[660]++; if(dbg){print "R660"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1010 !_#_!
 #  x1010 sw_es_t_      zalt_
for(wrd in omap["x1010"]){omakevars(x1010,"x1010");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_t_f() )
 { l[i]=omo1; r[661]++; if(dbg){print "R661"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1011 !_#_!
 #  x1011 sw_ez_d_      zalt_
for(wrd in omap["x1011"]){omakevars(x1011,"x1011");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; r[662]++; if(dbg){print "R662"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1012 !_#_!
 #  x1012 sw_ez_dp_     zalt_
for(wrd in omap["x1012"]){omakevars(x1012,"x1012");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; r[663]++; if(dbg){print "R663"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo1; r[664]++; if(dbg){print "R664"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1013 !_#_!
 #  x1013 sw_ez_i_      zalt_
for(wrd in omap["x1013"]){omakevars(x1013,"x1013");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; r[665]++; if(dbg){print "R665"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1014 !_#_!
 #  x1014 sw_ez_r_      zalt1_     zalt2_
for(wrd in omap["x1014"]){omakevars(x1014,"x1014");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[666]++; if(dbg){print "R666"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1015 !_#_!
 #  x1015 sw_ez_v_      zalt_
for(wrd in omap["x1015"]){omakevars(x1015,"x1015");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; r[667]++; if(dbg){print "R667"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1016 !_#_!
 #  x1016 sw_mn_iv_     zalt1_     zalt2_
for(wrd in omap["x1016"]){omakevars(x1016,"x1016");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[668]++; if(dbg){print "R668"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[669]++; if(dbg){print "R669"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1017 !_#_!
 #  x1017 sw_mn_p_      zalt_
for(wrd in omap["x1017"]){omakevars(x1017,"x1017");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_p_f() )
 { l[i]=omo1; r[670]++; if(dbg){print "R670"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1018 !_#_!
 #  x1018 sw_em_v_      zalt_
for(wrd in omap["x1018"]){omakevars(x1018,"x1018");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[671]++; if(dbg){print "R671"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x1019 !_#_!
 #  x1019 hyphdef_word_   default_
for(wrd in omap["x1019"]){omakevars(x1019,"x1019");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"Yhys") && se(-1,"-") )
 { l[i]=omo1; r[672]++; if(dbg){print "R672"}; continue};
 if ( !(sc(-1,"-")||s1(0,"-")) )
 { l[i]=omo2; r[673]++; if(dbg){print "R673"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1020 !_#_!
 #  x1020 hyphany_word_  (default_)
for(wrd in omap["x1020"]){omakevars(x1020,"x1020");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(-1,"-") )
 { l[i]=omo1; r[674]++; if(dbg){print "R674"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1021 !_#_!
 #  x1021 hyph1_word_hyph2_    (default_)
for(wrd in omap["x1021"]){omakevars(x1021,"x1021");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(-1,"-") && s1(0,"-") )
 { l[i]=omo1; r[675]++; if(dbg){print "R675"}; continue};
 if ( s1(0,"-") )
 { l[i]=omo1; r[676]++; if(dbg){print "R676"}; continue};
 
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1022 !_#_!
 #  x1022 word_hyphdef_  (default_)
for(wrd in omap["x1022"]){omakevars(x1022,"x1022");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( s1(0,"-") && ismark(1,"Yhyf") && w(1,"то") )
 { l[i]=omo1; l[i+1]=gensub(/^(.+)$/,"\xcc\xa0\\1\xcc\xa0",1,l[i+1]); r[677]++; if(dbg){print "R677"}; continue};
 if ( s1(0,"-") && ismark(1,"Yhyf") )
 { l[i]=omo1; r[678]++; if(dbg){print "R678"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1023 !_#_!
 #  x1023 word_hyphany_  (default_)
for(wrd in omap["x1023"]){omakevars(x1023,"x1023");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( s1(0,"-") )
 { l[i]=omo1; r[679]++; if(dbg){print "R679"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1024 !_#_!
 #  x1024 sw_em_v_  (zalt_)
for(wrd in omap["x1024"]){omakevars(x1024,"x1024");for(y=1;y<=wln;y++)                    # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( (pre_vi(-1)||preph_vi(-1)) && s(-1,-1) )
 { l[i]=omo1; r[680]++; if(dbg){print "R680"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1025 !_#_!
 #  x1025 tem_je_       тем  те́м
for(wrd in omap["x1025"]){omakevars(x1025,"x1025");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 l[i]=omo1; r[681]++; if(dbg){print "R681"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1026 !_#_!
 #  x1026 orgbody_      orgplay_ орган  о́рган ... орга́н ...
for(wrd in omap["x1026"]){omakevars(x1026,"x1026");for(y=1;y<=wln;y++)                    # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"власти дыхания здравоохранения зрения обоняния осязания порядка правопорядка самоуправления слуха управления чувств") && s(0,0) )
 { l[i]=omo1; r[682]++; if(dbg){print "R682"}; continue};
 #
 if(iwrd=="орган") {
   if ( w(-1,"внутренний государственный местный официальный полицейский половой руководящий советский союзный судебный федеральный хватательный чувствительный электровосприимчивый") && s(-1,-1) )
   { l[i]=omo2; r[683]++; if(dbg){print "R683"}; continue};
 };
 if(iwrd=="органа") {
   if ( w(-1,"внутреннего государственного местного официального полицейского полового руководящего советского союзного судебного федерального хватательного чувствительного электровосприимчивого") && s(-1,-1) )
   { l[i]=omo2; r[684]++; if(dbg){print "R684"}; continue};
 };
 if(iwrd=="органам") {
   if ( w(-1,"внутренним государственным местным официальным полицейским половым руководящим советским союзным судебным федеральным хватательным чувствительным электровосприимчивым") && s(-1,-1) )
   { l[i]=omo2; r[685]++; if(dbg){print "R685"}; continue};
 };
 if(iwrd=="органами") {
   if ( w(-1,"внутренними государственными местными официальными полицейскими половыми руководящими советскими союзными судебными федеральными хватательными чувствительными электровосприимчивыми") && s(-1,-1) )
   { l[i]=omo2; r[686]++; if(dbg){print "R686"}; continue};
 };
 if(iwrd=="органах") {
   if ( w(-1,"внутренних государственных местных официальных полицейских половых руководящих советских союзных судебных федеральных хватательных чувствительных электровосприимчивых") && s(-1,-1) )
   { l[i]=omo2; r[687]++; if(dbg){print "R687"}; continue};
 };
 if(iwrd=="органе") {
   if ( w(-1,"внутреннем государственном местном официальном полицейском половом руководящем слоюзном советском судебном федеральном хватательном чувствительном электровосприимчивом") && s(-1,-1) )
   { l[i]=omo2; r[688]++; if(dbg){print "R688"}; continue};
 };
 if(iwrd=="органов") {
   if ( w(-1,"внутренних государственных местных официальных полицейских половых руководящих советских союзных судебных федеральных хватательных чувствительных электровосприимчивых") && s(-1,-1) )
   { l[i]=omo2; r[689]++; if(dbg){print "R689"}; continue};
 };
 if(iwrd=="органом") {
   if ( w(-1,"внутренним государственным местным официальным полицейским половым руководящим слоюзным советским судебным федеральным хватательным чувствительным электровосприимчивым") && s(-1,-1) )
   { l[i]=omo2; r[690]++; if(dbg){print "R690"}; continue};
 };
 if(iwrd=="органу") {
   if ( w(-1,"внутреннему государственному местному официальному полицейскому половому руководящему слоюзному советскому судебному федеральному хватательному чувствительному электровосприимчивому") && s(-1,-1) )
   { l[i]=omo2; r[691]++; if(dbg){print "R691"}; continue};
 };
 if(iwrd=="органы") {
   if ( w(-1,"внутренние государственные местные официальные полицейские половые руководящие слоюзные советские судебные федеральные хватательные чувствительные электровосприимчивые") && s(-1,-1) )
   { l[i]=omo2; r[692]++; if(dbg){print "R692"}; continue};
 };

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1027 !_#_!
 #  x1027 sw_1em_d_2ez_v_  zatl_sw_1em_d_     парку  па́рку  парку́
for(wrd in omap["x1027"]){omakevars(x1027,"x1027");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[693]++; if(dbg){print "R693"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; r[694]++; if(dbg){print "R694"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1028 !_#_!
 #  x1028 pq_kr_em_     pl_kr_em_   проклят  про́клят  прокля́т
for(wrd in omap["x1028"]){omakevars(x1028,"x1028");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[693]++; if(dbg){print "R693"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1029 !_#_!
 #  x1029 pq_kr_es_     pl_kr_es_   проклято  про́клято  прокля́то
for(wrd in omap["x1029"]){omakevars(x1029,"x1029");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"я оно ты будь буду будет было стало")||suw_edsrim(-1) && s(-1,-1) )
 { l[i]=omo1; r[693]++; if(dbg){print "R693"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1030 !_#_!
 #  x1030 pq_kr_ez_     pl_kr_ez_   проклята  про́клята  прокля́та
for(wrd in omap["x1030"]){omakevars(x1030,"x1030");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"я она ты будь будет была стала")||suw_edmuim(-1) && s(-1,-1) )
 { l[i]=omo1; r[693]++; if(dbg){print "R693"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1031 !_#_!
 #  x1031 pq_kr_mn_     pl_kr_mn_   прокляты  про́кляты  прокля́ты
for(wrd in omap["x1031"]){omakevars(x1031,"x1031");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"мы вы они будь будут были стали")||suw_edmuim(-1) && s(-1,-1) )
 { l[i]=omo1; r[693]++; if(dbg){print "R693"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1032 !_#_!
 #  x1032 ghost_        parfume_   духами  ду́хами  духа́ми
for(wrd in omap["x1031"]){omakevars(x1031,"x1031");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"светлыми добрыми злыми лесными подземными тёмными") && s(-1,-1) )
 { l[i]=omo1; r[693]++; if(dbg){print "R693"}; continue};
 #
 if ( wc(-1,"^запах ^благоух ^воня ^пользова") && s(-1,-1) )
 { l[i]=omo2; r[693]++; if(dbg){print "R693"}; continue};
 if ( w(-1,"дешёвыми дорогими женскими модными мужскими тошнотворными") && s(-1,-1) )
 { l[i]=omo2; r[693]++; if(dbg){print "R693"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1033 !_#_!
 #  x1033 ghost_        parfume_  духах  ду́хах  духа́х
for(wrd in omap["x1033"]){omakevars(x1033,"x1033");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"светлых добрых злых лесных подземных тысячи тёмных") && s(-1,-1) )
 { l[i]=omo1; r[693]++; if(dbg){print "R693"}; continue};
 #
 if ( w(-1,"дешёвых дорогих женских модных мужских тошнотворных") && s(-1,-1) )
 { l[i]=omo2; r[693]++; if(dbg){print "R693"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1034 !_#_!
 #  x1034 ghost_        parfume_  духи  ду́хи  духи́
for(wrd in omap["x1034"]){omakevars(x1034,"x1034");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"светлые добрые злые лесные подземные тёмные") && s(-1,-1) )
 { l[i]=omo1; r[693]++; if(dbg){print "R693"}; continue};
 #
 if ( w(-1,"дешёвые дорогие женские модные мужские тошнотворные") && s(-1,-1) )
 { l[i]=omo2; r[693]++; if(dbg){print "R693"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x1035 !_#_!
 #  x1035 ghost_        parfume_  духов  ду́хов  духо́в
for(wrd in omap["x1035"]){omakevars(x1035,"x1035");for(y=1;y<=wln;y++)                    # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"светлых добрых злых лесных подземных тысяч тёмных вонь") && s(-1,-1) )
 { l[i]=omo1; r[693]++; if(dbg){print "R693"}; continue};
 if ( wc(-1,"^впусти ^вызава ^выпусти ^заклина ^призыв ^укроти ^укрощ") && s(-1,-1) )
 { l[i]=omo1; r[693]++; if(dbg){print "R693"}; continue};
 #
 if ( w(-1,"дешёвых дорогих женских модных мужских тошнотворных") && s(-1,-1) )
 { l[i]=omo2; r[693]++; if(dbg){print "R693"}; continue};
 if ( wc(-1,"^аромат ^запах ^благоух ^изготов ^флакон ^шлейф ^воня ^пользова") && s(-1,-1) )
 { l[i]=omo2; r[693]++; if(dbg){print "R693"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                           ##_footer

### x2001 !_#_!
 #  x2001 deep_na_      mest_ez_i_
for(wrd in omap["x2001"]){omakevars(x2001,"x2001");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[695]++; if(dbg){print "R695"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2002 !_#_!
 #  x2002 deep_na_      sw_1em_r_2ez_i_
for(wrd in omap["x2002"]){omakevars(x2002,"x2002");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[696]++; if(dbg){print "R696"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[697]++; if(dbg){print "R697"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2003 !_#_!
 #  x2003 deep_na_      sw_em_r_
for(wrd in omap["x2003"]){omakevars(x2003,"x2003");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[698]++; if(dbg){print "R698"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2004 !_#_!
 #  x2004 deep_na_      sw_em_vr_
for(wrd in omap["x2004"]){omakevars(x2004,"x2004");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[699]++; if(dbg){print "R699"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[700]++; if(dbg){print "R700"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2005 !_#_!
 #  x2005 deep_na_      sw_es_r_
for(wrd in omap["x2005"]){omakevars(x2005,"x2005");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[701]++; if(dbg){print "R701"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2006 !_#_!
 #  x2006 deep_na_      sw_ez_i_
for(wrd in omap["x2006"]){omakevars(x2006,"x2006");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[702]++; if(dbg){print "R702"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2007 !_#_!
 #  x2007 deep_pa_      sw_em_iv_
for(wrd in omap["x2007"]){omakevars(x2007,"x2007");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[703]++; if(dbg){print "R703"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[704]++; if(dbg){print "R704"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2008 !_#_!
 #  x2008 deep_pa_      sw_em_r_
for(wrd in omap["x2008"]){omakevars(x2008,"x2008");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[705]++; if(dbg){print "R705"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2009 !_#_!
 #  x2009 deep_pa_      sw_ez_i_
for(wrd in omap["x2009"]){omakevars(x2009,"x2009");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[706]++; if(dbg){print "R706"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2010 !_#_!
 #  x2010 deep_pa_      sw_mn_r_
for(wrd in omap["x2010"]){omakevars(x2010,"x2010");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[707]++; if(dbg){print "R707"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2011 !_#_!
 #  x2011 gl_ed1e_      m2_1sw_em_d_2pl_ez_t_
for(wrd in omap["x2011"]){omakevars(x2011,"x2011");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[708]++; if(dbg){print "R708"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[709]++; if(dbg){print "R709"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2012 !_#_!
 #  x2012 gl_ed1e_      mest_ez_v_  мою  мо́ю  мою́
for(wrd in omap["x2012"]){omakevars(x2012,"x2012");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pre_vi(-1) &&
      (prl_edvi(1)||prq_edvi(1)) &&
        suw_edvi(2) && s(-1,1) )
 { l[i]=omo2; r[710]++; if(dbg){print "R710"}; continue};
 if ( pre_vi(-1) &&
       suw_edvi(1) && s(-1,0) )
 { l[i]=omo2; r[711]++; if(dbg){print "R711"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[712]++; if(dbg){print "R712"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2013 !_#_!
 #  x2013 gl_ed1e_      qip_ez_v_
for(wrd in omap["x2013"]){omakevars(x2013,"x2013");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[713]++; if(dbg){print "R713"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2014 !_#_!
 #  x2014 gl_ed1e_      sw_1em_d_2ez_v_
for(wrd in omap["x2014"]){omakevars(x2014,"x2014");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[715]++; if(dbg){print "R715"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[714]++; if(dbg){print "R714"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[716]++; if(dbg){print "R716"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2015 !_#_!
 #  x2015 gl_ed1e_      sw_1em_v_2ez_vd_
for(wrd in omap["x2015"]){omakevars(x2015,"x2015");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[719]++; if(dbg){print "R719"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[717]++; if(dbg){print "R717"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[718]++; if(dbg){print "R718"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[720]++; if(dbg){print "R720"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2016 !_#_!
 #  x2016 gl_ed1e_      sw_em_d_
for(wrd in omap["x2016"]){omakevars(x2016,"x2016");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[721]++; if(dbg){print "R721"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[722]++; if(dbg){print "R722"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2017 !_#_!
 #  x2017 gl_ed1e_      sw_em_dr_
for(wrd in omap["x2017"]){omakevars(x2017,"x2017");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[723]++; if(dbg){print "R723"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[724]++; if(dbg){print "R724"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[725]++; if(dbg){print "R725"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2018 !_#_!
 #  x2018 gl_ed1e_      sw_em_iv_
for(wrd in omap["x2018"]){omakevars(x2018,"x2018");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[726]++; if(dbg){print "R726"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[727]++; if(dbg){print "R727"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[728]++; if(dbg){print "R728"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2019 !_#_!
 #  x2019 gl_ed1e_      sw_ems_d_
for(wrd in omap["x2019"]){omakevars(x2019,"x2019");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[729]++; if(dbg){print "R729"}; continue};
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; r[730]++; if(dbg){print "R730"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[731]++; if(dbg){print "R731"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2020 !_#_!
 #  x2020 gl_ed1e_      sw_em_t_
for(wrd in omap["x2020"]){omakevars(x2020,"x2020");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[732]++; if(dbg){print "R732"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[733]++; if(dbg){print "R733"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2021 !_#_!
 #  x2021 gl_ed1e_      sw_es_d_
for(wrd in omap["x2021"]){omakevars(x2021,"x2021");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; r[734]++; if(dbg){print "R734"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[735]++; if(dbg){print "R735"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2022 !_#_!
 #  x2022 gl_ed1e_      sw_ez_t_
for(wrd in omap["x2022"]){omakevars(x2022,"x2022");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[736]++; if(dbg){print "R736"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[737]++; if(dbg){print "R737"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2023 !_#_!
 #  x2023 gl_ed1e_      sw_ez_v_
for(wrd in omap["x2023"]){omakevars(x2023,"x2023");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[738]++; if(dbg){print "R738"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[739]++; if(dbg){print "R739"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2024 !_#_!
 #  x2024 gl_ed1e_      sw_mn_d_
for(wrd in omap["x2024"]){omakevars(x2024,"x2024");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_d_f() )
 { l[i]=omo2; r[740]++; if(dbg){print "R740"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[741]++; if(dbg){print "R741"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2025 !_#_!
 #  x2025 gl_ed3e_      pl_kr_em_
for(wrd in omap["x2025"]){omakevars(x2025,"x2025");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo2; r[742]++; if(dbg){print "R742"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2026 !_#_!
 #  x2026 gl_ed3e_      sw_em_iv_
for(wrd in omap["x2026"]){omakevars(x2026,"x2026");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[743]++; if(dbg){print "R743"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[744]++; if(dbg){print "R744"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2027 !_#_!
 #  x2027 gl_ed3e_      sw_mn_r_
for(wrd in omap["x2027"]){omakevars(x2027,"x2027");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[745]++; if(dbg){print "R745"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2028 !_#_!
 #  x2028 gl_inf_       sw_1ez_dpr_2mn_iv_
for(wrd in omap["x2028"]){omakevars(x2028,"x2028");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_inf_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[747]++; if(dbg){print "R747"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[748]++; if(dbg){print "R748"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[749]++; if(dbg){print "R749"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[750]++; if(dbg){print "R750"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[751]++; if(dbg){print "R751"}; continue};


 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2029 !_#_!
 #  x2029 gl_inf_       sw_ez_iv_
for(wrd in omap["x2029"]){omakevars(x2029,"x2029");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[752]++; if(dbg){print "R752"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[753]++; if(dbg){print "R753"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2030 !_#_!
 #  x2030 gl_mn1e_      mest_ems_p_
for(wrd in omap["x2030"]){omakevars(x2030,"x2030");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2031 !_#_!
 #  x2031 gl_mn1e_      pl_ems_p_
for(wrd in omap["x2031"]){omakevars(x2031,"x2031");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo2; r[754]++; if(dbg){print "R754"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2032 !_#_!
 #  x2032 gl_mn1e_      pl_kr_em_
for(wrd in omap["x2032"]){omakevars(x2032,"x2032");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn1e_f() )
 { l[i]=omo1; r[755]++; if(dbg){print "R755"}; continue};
 #
 if ( pl_kr_em_f() )
 { l[i]=omo2; r[756]++; if(dbg){print "R756"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2033 !_#_!
 #  x2033 gl_mn1e_      pq_kr_em_
for(wrd in omap["x2033"]){omakevars(x2033,"x2033");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo2; r[757]++; if(dbg){print "R757"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2034 !_#_!
 #  x2034 gl_mn1e_      sw_em_iv_
for(wrd in omap["x2034"]){omakevars(x2034,"x2034");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[758]++; if(dbg){print "R758"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[759]++; if(dbg){print "R759"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2035 !_#_!
 #  x2035 gl_mn1e_      sw_em_t_
for(wrd in omap["x2035"]){omakevars(x2035,"x2035");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[760]++; if(dbg){print "R760"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2036 !_#_!
 #  x2036 gl_mn1e_      sw_es_t_
for(wrd in omap["x2036"]){omakevars(x2036,"x2036");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_t_f() )
 { l[i]=omo2; r[761]++; if(dbg){print "R761"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2037 !_#_!
 #  x2037 gl_mn1e_      sw_mn_r_
for(wrd in omap["x2037"]){omakevars(x2037,"x2037");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[762]++; if(dbg){print "R762"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2038 !_#_!
 #  x2038 gl_mn2e_      gl_pomn_
for(wrd in omap["x2038"]){omakevars(x2038,"x2038");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; r[763]++; if(dbg){print "R763"}; continue};
 #
 if ( gl_pomn_f() )
 { l[i]=omo2; r[764]++; if(dbg){print "R764"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2039 !_#_!
 #  x2039 gl_mn2e_      m2_1sw_em_p_2gl_pomn_
for(wrd in omap["x2039"]){omakevars(x2039,"x2039");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; r[765]++; if(dbg){print "R765"}; continue};
 #
 if ( gl_pomn_f() )
 { l[i]=omo2; r[766]++; if(dbg){print "R766"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; r[767]++; if(dbg){print "R767"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2040 !_#_!
 #  x2040 gl_mn2e_      sw_em_p_
for(wrd in omap["x2040"]){omakevars(x2040,"x2040");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; r[768]++; if(dbg){print "R768"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; r[769]++; if(dbg){print "R769"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2041 !_#_!
 #  x2041 gl_mn2e_      sw_ez_dp_
for(wrd in omap["x2041"]){omakevars(x2041,"x2041");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[770]++; if(dbg){print "R770"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[771]++; if(dbg){print "R771"}; continue};
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; r[772]++; if(dbg){print "R772"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2042 !_#_!
 #  x2042 gl_mn3e_      pq_kr_em_
for(wrd in omap["x2042"]){omakevars(x2042,"x2042");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo2; r[773]++; if(dbg){print "R773"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2043 !_#_!
 #  x2043 gl_mn3e_      sw_mn_r_
for(wrd in omap["x2043"]){omakevars(x2043,"x2043");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[774]++; if(dbg){print "R774"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2044 !_#_!
 #  x2044 gl_mn3e_      sw_mn_vr_
for(wrd in omap["x2044"]){omakevars(x2044,"x2044");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[775]++; if(dbg){print "R775"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[776]++; if(dbg){print "R776"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2045 !_#_!
 #  x2045 gl_paedmu_pe_	  m2_1pl_kr_em_2gl_paedmu_ne_
for(wrd in omap["x2045"]){omakevars(x2045,"x2045");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo2; r[777]++; if(dbg){print "R777"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2046 !_#_!
 #  x2046 gl_paedmu_    pl_kr_em_  смел  смёл  сме́л
for(wrd in omap["x2046"]){omakevars(x2046,"x2046");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"не") &&
       qf(3,"gl_in") && s(-1,qfn-1) )
 { l[i]=omo2; r[778]++; if(dbg){print "R778"}; continue};
 #
 if ( pl_kr_em_f() )
 { l[i]=omo2; r[779]++; if(dbg){print "R779"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2047 !_#_!
 #  x2047 gl_paedmu_    sw_1em_i_2mn_r_
for(wrd in omap["x2047"]){omakevars(x2047,"x2047");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; r[780]++; if(dbg){print "R780"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[781]++; if(dbg){print "R781"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[782]++; if(dbg){print "R782"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2048 !_#_!
 #  x2048 gl_paedmu_    sw_1em_iv_2mn_r_
for(wrd in omap["x2048"]){omakevars(x2048,"x2048");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; r[783]++; if(dbg){print "R783"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[784]++; if(dbg){print "R784"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[785]++; if(dbg){print "R785"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[786]++; if(dbg){print "R786"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2049 !_#_!
 #  x2049 gl_paedmu_    sw_em_i_
for(wrd in omap["x2049"]){omakevars(x2049,"x2049");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; r[787]++; if(dbg){print "R787"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[788]++; if(dbg){print "R788"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2050 !_#_!
 #  x2050 gl_paedmu_    sw_em_iv_
for(wrd in omap["x2050"]){omakevars(x2050,"x2050");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[789]++; if(dbg){print "R789"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[790]++; if(dbg){print "R790"}; continue};
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; r[791]++; if(dbg){print "R791"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2051 !_#_!
 #  x2051 gl_paedmu_	sw_mn_r_
for(wrd in omap["x2051"]){omakevars(x2051,"x2051");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="начал") {
   if ( gl_in(1) && s(0,0) )
   { l[i]=omo1; r[792]++; if(dbg){print "R792"}; continue};
   if ( w(1,"было") &&
         (gl_in(2)||isname(2)||w(2,"он")) && s(0,1) )
   { l[i]=omo1; r[793]++; if(dbg){print "R793"}; continue};
   if ( sc(-1,"—") &&
         (isname(1)||q_(1,swn_edmu_im)||w(1,"он")) && s(0,0) )
   { l[i]=omo1; r[794]++; if(dbg){print "R794"}; continue};
 };
 if(iwrd ~ /^(сел|слез)$/) {
   if ( (pre_vi(1)||preph_vi(1)) &&
         (suw_edvi(2)||suw_mnvi(2)||prl_edvi(2)||prl_mnvi(2)||prq_edvi(2)||prq_mnvi(2)||mest_vi(2)) && s(0,1) )
   { l[i]=omo1; r[795]++; if(dbg){print "R795"}; continue};
   if ( (pre_ro(1)||preph_ro(1)) &&
         (suw_edro(2)||suw_mnro(2)||prl_edro(2)||prl_mnro(2)||prq_edro(2)||prq_mnro(2)||mest_ro(2)) && s(0,1) )
   { l[i]=omo1; r[796]++; if(dbg){print "R796"}; continue};
   if ( pre_pr(1) &&
         (suw_edpr(2)||suw_mnpr(2)||prl_edpr(2)||prl_mnpr(2)||prq_edpr(2)||prq_mnpr(2)||mest_pr(2)) && s(0,1) )
   { l[i]=omo1; r[797]++; if(dbg){print "R797"}; continue};
   if ( gl_in(1) && s(0,0) )
   { l[i]=omo1; r[798]++; if(dbg){print "R798"}; continue};
 };
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[799]++; if(dbg){print "R799"}; continue};
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; r[800]++; if(dbg){print "R800"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2052 !_#_!
 #  x2052 gl_paedmu_    sw_mn_vr_
for(wrd in omap["x2052"]){omakevars(x2052,"x2052");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_paedmu_f() )
 { l[i]=omo1; r[801]++; if(dbg){print "R801"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[802]++; if(dbg){print "R802"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[803]++; if(dbg){print "R803"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2053 !_#_!
 #  x2053 gl_paedsr_    sw_es_iv_
for(wrd in omap["x2053"]){omakevars(x2053,"x2053");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="начало") {
   if ( gl_in(1) && s(0,0) )
   { l[i]=omo1; r[804]++; if(dbg){print "R804"}; continue};
 };
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; r[805]++; if(dbg){print "R805"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; r[806]++; if(dbg){print "R806"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2054 !_#_!
 #  x2054 m2_1sw_es_r_2gl_paedze_  sw_mn_iv_  дела   де́ла   дела́
for(wrd in omap["x2054"]){omakevars(x2054,"x2054");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="дела") {
   if ( wb(-5,"как") && s(wbn,-1) )
   { l[i]=omo2; r[807]++; if(dbg){print "R807"}; continue};
 };
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; r[808]++; if(dbg){print "R808"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[809]++; if(dbg){print "R809"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[810]++; if(dbg){print "R810"}; continue};
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; r[811]++; if(dbg){print "R811"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2055 !_#_!
 #  x2055 gl_paedze_    sw_1es_r_2mn_iv_
for(wrd in omap["x2055"]){omakevars(x2055,"x2055");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="начала") {
   if ( w(-2,"с") &&
         w(-1,"самого") && s(-2,-1) )
   { l[i]=omo2; r[812]++; if(dbg){print "R812"}; continue};
   if ( gl_in(1) && s(0,0) )
   { l[i]=omo1; r[813]++; if(dbg){print "R813"}; continue};
   if ( (suw_edzeim(1)||w(1,"она")) && s(0,0) )
   { l[i]=omo1; r[814]++; if(dbg){print "R814"}; continue};
 };
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[815]++; if(dbg){print "R815"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[816]++; if(dbg){print "R816"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[817]++; if(dbg){print "R817"}; continue};
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; r[818]++; if(dbg){print "R818"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2056 !_#_!
 #  x2056 gl_paedze_    sw_em_i_
for(wrd in omap["x2056"]){omakevars(x2056,"x2056");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[819]++; if(dbg){print "R819"}; continue};
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; r[820]++; if(dbg){print "R820"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2057 !_#_!
 #  x2057 gl_paedze_    sw_em_r_
for(wrd in omap["x2057"]){omakevars(x2057,"x2057");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[821]++; if(dbg){print "R821"}; continue};
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; r[822]++; if(dbg){print "R822"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2058 !_#_!
 #  x2058 gl_pamn_      gl_poed_
for(wrd in omap["x2058"]){omakevars(x2058,"x2058");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; r[823]++; if(dbg){print "R823"}; continue};
 #
 if ( gl_poed_f() )
 { l[i]=omo2; r[746]++; if(dbg){print "R746"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2059 !_#_!
 #  x2059 gl_pamn_      nar_mest_
for(wrd in omap["x2059"]){omakevars(x2059,"x2059");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; r[824]++; if(dbg){print "R824"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2060 !_#_!
 #  x2060 gl_pamn_      sw_1ez_dpr_2mn_iv_
for(wrd in omap["x2060"]){omakevars(x2060,"x2060");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; r[825]++; if(dbg){print "R825"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[826]++; if(dbg){print "R826"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[827]++; if(dbg){print "R827"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[828]++; if(dbg){print "R828"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[829]++; if(dbg){print "R829"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[830]++; if(dbg){print "R830"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2061 !_#_!
 #  x2061 gl_pamn_      sw_1ez_r_2mn_iv_
for(wrd in omap["x2061"]){omakevars(x2061,"x2061");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; r[831]++; if(dbg){print "R831"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[832]++; if(dbg){print "R832"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[833]++; if(dbg){print "R833"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[834]++; if(dbg){print "R834"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2062 !_#_!
 #  x2062 gl_pamn_      sw_ez_dpr_  устали  уста́ли  у́стали
for(wrd in omap["x2062"]){omakevars(x2062,"x2062");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"без") && s(-1,-1) )
 { l[i]=omo2; r[835]++; if(dbg){print "R835"}; continue};
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; r[836]++; if(dbg){print "R836"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2063 !_#_!
 #  x2063 gl_poed_      mest_ez_dprt_  нашей  наше́й  на́шей
for(wrd in omap["x2063"]){omakevars(x2063,"x2063");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( (pre_da(-1)||pre_pr(-1)||pre_ro(-1)||pre_tv(-1)) &&
       (suw_edzeda(1)||suw_edzepr(1)||suw_edzero(1)||suw_edzetv(1)||prl_edzeda(1)||prl_edzepr(1)||prl_edzero(1)||prl_edzetv(1)) && s(-1,0) )
 { l[i]=omo2; r[837]++; if(dbg){print "R837"}; continue};
 if ( (pre_da(-1)||pre_pr(-1)||pre_ro(-1)||pre_tv(-1)) && s(-1,-1) && p(0) )
 { l[i]=omo2; r[838]++; if(dbg){print "R838"}; continue};
 if ( (suw_edzeda(1)||suw_edzepr(1)||suw_edzero(1)||suw_edzetv(1)||prl_edzeda(1)||prl_edzepr(1)||prl_edzero(1)||prl_edzetv(1)) && s(0,0) )
 { l[i]=omo2; r[839]++; if(dbg){print "R839"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2064 !_#_!
 #  x2064 gl_poed_pamn_	sw_1ez_dpr_2mn_iv_  отмели  отмели́  о́тмели
for(wrd in omap["x2064"]){omakevars(x2064,"x2064");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[840]++; if(dbg){print "R840"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[841]++; if(dbg){print "R841"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[842]++; if(dbg){print "R842"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[843]++; if(dbg){print "R843"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[844]++; if(dbg){print "R844"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2065 !_#_!
 #  x2065 gl_poed_      sw_1em_n_2ez_dpr_3mn_iv_
for(wrd in omap["x2065"]){omakevars(x2065,"x2065");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[845]++; if(dbg){print "R845"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[846]++; if(dbg){print "R846"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[847]++; if(dbg){print "R847"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[848]++; if(dbg){print "R848"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[849]++; if(dbg){print "R849"}; continue};


 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2066 !_#_!
 #  x2066 gl_poed_      sw_1ez_dpr_2mn_iv_
for(wrd in omap["x2066"]){omakevars(x2066,"x2066");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[850]++; if(dbg){print "R850"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[851]++; if(dbg){print "R851"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[852]++; if(dbg){print "R852"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[853]++; if(dbg){print "R853"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[854]++; if(dbg){print "R854"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2067 !_#_!
 #  x2067 gl_poed_      sw_1ez_dprn_2mn_iv_  суши  суши́  су́ши
for(wrd in omap["x2067"]){omakevars(x2067,"x2067");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[855]++; if(dbg){print "R855"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[856]++; if(dbg){print "R856"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2068 !_#_!
 #  x2068 gl_poed_      sw_1ez_dprv_2mn_iv_
for(wrd in omap["x2068"]){omakevars(x2068,"x2068");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[857]++; if(dbg){print "R857"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[858]++; if(dbg){print "R858"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2069 !_#_!
 #  x2069 gl_poed_      sw_1ez_r_2mn_iv_
for(wrd in omap["x2069"]){omakevars(x2069,"x2069");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="пищи") {
   if ( wc(-1,"^запас") && s(-1,-1) )
   { l[i]=omo2; r[1037]++; if(dbg){print "R1037"}; continue};
 };
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[859]++; if(dbg){print "R859"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[860]++; if(dbg){print "R860"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[861]++; if(dbg){print "R861"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2070 !_#_!
 #  x2070 gl_poed_      sw_1mn_iv_2gl_pamn_
for(wrd in omap["x2070"]){omakevars(x2070,"x2070");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( gl_pamn_f() )
 { l[i]=omo2; r[862]++; if(dbg){print "R862"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[863]++; if(dbg){print "R863"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[864]++; if(dbg){print "R864"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2071 !_#_!
 #  x2071 gl_poed_      sw_em_i_
for(wrd in omap["x2071"]){omakevars(x2071,"x2071");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[865]++; if(dbg){print "R865"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2072 !_#_!
 #  x2072 gl_poed_      sw_es_dpr_
for(wrd in omap["x2072"]){omakevars(x2072,"x2072");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; r[866]++; if(dbg){print "R866"}; continue};
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; r[867]++; if(dbg){print "R867"}; continue};
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[868]++; if(dbg){print "R868"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2073 !_#_!
 #  x2073 gl_poed_      sw_es_n_  веди  веди́  ве́ди
for(wrd in omap["x2073"]){omakevars(x2073,"x2073");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2074 !_#_!
 #  x2074 gl_poed_	sw_ez_dpr_
for(wrd in omap["x2074"]){omakevars(x2074,"x2074");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[869]++; if(dbg){print "R869"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[870]++; if(dbg){print "R870"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[871]++; if(dbg){print "R871"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2075 !_#_!
 #  x2075 gl_poed_      sw_ez_iv_  казни  казни́  ка́зни
for(wrd in omap["x2075"]){omakevars(x2075,"x2075");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2076 !_#_!
 #  x2076 gl_poed_      sw_ez_r_
for(wrd in omap["x2076"]){omakevars(x2076,"x2076");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[872]++; if(dbg){print "R872"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2077 !_#_!
 #  x2077 gl_poed_      sw_ez_t_
for(wrd in omap["x2077"]){omakevars(x2077,"x2077");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[873]++; if(dbg){print "R873"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2078 !_#_!
 #  x2078 gl_poed_      sw_mn_i_
for(wrd in omap["x2078"]){omakevars(x2078,"x2078");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[874]++; if(dbg){print "R874"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2079 !_#_!
 #  x2079 gl_poed_      sw_mn_iv_
for(wrd in omap["x2079"]){omakevars(x2079,"x2079");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[875]++; if(dbg){print "R875"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[876]++; if(dbg){print "R876"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2080 !_#_!
 #  x2080 gl_poed_      sw_mn_r_
for(wrd in omap["x2080"]){omakevars(x2080,"x2080");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[877]++; if(dbg){print "R877"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2081 !_#_!
 #  x2081 gl_pomn_      sw_em_p_
for(wrd in omap["x2081"]){omakevars(x2081,"x2081");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pomn_f() )
 { l[i]=omo1; r[878]++; if(dbg){print "R878"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; r[879]++; if(dbg){print "R879"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2082 !_#_!
 #  x2082 m2_1gl_mn1e_2pq_kr_em_   sw_em_t_
for(wrd in omap["x2082"]){omakevars(x2082,"x2082");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[880]++; if(dbg){print "R880"}; continue};
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[881]++; if(dbg){print "R881"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2083 !_#_!
 #  x2083 m2_1gl_mn1e_2qik_d_      sw_mn_r_
for(wrd in omap["x2083"]){omakevars(x2083,"x2083");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[882]++; if(dbg){print "R882"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2084 !_#_!
 #  x2084 m2_1gl_poed_2nar_spos_   sw_ez_t_  порой  поро́й  по́рой
for(wrd in omap["x2084"]){omakevars(x2084,"x2084");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[883]++; if(dbg){print "R883"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2085 !_#_!
 #  x2085 m2_1nar_kaq_2pred_ro_	   sw_em_t_
for(wrd in omap["x2085"]){omakevars(x2085,"x2085");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[884]++; if(dbg){print "R884"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2086 !_#_!
 #  x2086 m2_1nar_vrem_2pred_ro_   sw_em_p_     после   по́сле   после́
for(wrd in omap["x2086"]){omakevars(x2086,"x2086");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( p(-1) )
 { l[i]=omo1; r[885]++; if(dbg){print "R885"}; continue};
 if ( w(-1,"а и по но однако") && s(-1,-1) )
 { l[i]=omo1; r[886]++; if(dbg){print "R886"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; r[887]++; if(dbg){print "R887"}; continue};
 #
 if ( (suw_edro(1)||suw_mnro(1)||prl_edro(1)||prl_mnro(1)||mest_ro(1)) )
 { l[i]=omo1; r[888]++; if(dbg){print "R888"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2087 !_#_!
 #  x2087 m2_1pl_srav_2gl_poed_	   pl_ez_dprt_  свежей  свеже́й  све́жей
for(wrd in omap["x2087"]){omakevars(x2087,"x2087");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2088 !_#_!
 #  x2088 m2_1pl_srav_2gl_poed_	   sw_ez_t_  бурей  буре́й  бу́рей
for(wrd in omap["x2088"]){omakevars(x2088,"x2088");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[889]++; if(dbg){print "R889"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2089 !_#_!
 #  x2089 m2_1sw_em_d_2gl_ed1e_	   pl_ez_dprt_
for(wrd in omap["x2089"]){omakevars(x2089,"x2089");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[890]++; if(dbg){print "R890"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[891]++; if(dbg){print "R891"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2090 !_#_!
 #  x2090 m2_1sw_em_d_2gl_ed1e_	   sw_em_l_
for(wrd in omap["x2090"]){omakevars(x2090,"x2090");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; r[892]++; if(dbg){print "R892"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[893]++; if(dbg){print "R893"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[894]++; if(dbg){print "R894"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2091 !_#_!
 #  x2091 m2_1sw_em_d_2gl_poed_	   pl_ez_dprt_
for(wrd in omap["x2091"]){omakevars(x2091,"x2091");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[895]++; if(dbg){print "R895"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2092 !_#_!
 #  x2092 m2_1sw_em_l_2gl_ed1e_	   sw_em_d_
for(wrd in omap["x2092"]){omakevars(x2092,"x2092");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; r[896]++; if(dbg){print "R896"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[897]++; if(dbg){print "R897"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[898]++; if(dbg){print "R898"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2093 !_#_!
 #  x2093 m2_1sw_em_l_2gl_ed1e_	   sw_em_dz_
for(wrd in omap["x2093"]){omakevars(x2093,"x2093");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[899]++; if(dbg){print "R899"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; r[900]++; if(dbg){print "R900"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[901]++; if(dbg){print "R901"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2094 !_#_!
 #  x2094 m2_1sw_em_p_2nar_vrem_   pl_srav_
for(wrd in omap["x2094"]){omakevars(x2094,"x2094");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[902]++; if(dbg){print "R902"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2095 !_#_!
 #  x2095 m2_1sw_em_p_2pl_ems_p_   sw_es_t_
for(wrd in omap["x2095"]){omakevars(x2095,"x2095");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; r[903]++; if(dbg){print "R903"}; continue};
 #
 if ( sw_es_t_f() )
 { l[i]=omo2; r[904]++; if(dbg){print "R904"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[905]++; if(dbg){print "R905"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2096 !_#_!
 #  x2096 m2_1sw_em_r_2pl_kr_em_r_   pl_kr_ez_  бела бе́ла бела́
for(wrd in omap["x2096"]){omakevars(x2096,"x2096");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[906]++; if(dbg){print "R906"}; continue};
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo2; r[907]++; if(dbg){print "R907"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2097 !_#_!
 #  x2097 m2_1sw_em_t_2pl_ems_p_   sw_em_iv_
for(wrd in omap["x2097"]){omakevars(x2097,"x2097");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; r[908]++; if(dbg){print "R908"}; continue};
 #
 if ( sw_em_t_f() )
 { l[i]=omo1; r[909]++; if(dbg){print "R909"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[910]++; if(dbg){print "R910"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[911]++; if(dbg){print "R911"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2098 !_#_!
 #  x2098 m2_1sw_es_p_2pl_ems_p_   sw_es_t_
for(wrd in omap["x2098"]){omakevars(x2098,"x2098");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; r[912]++; if(dbg){print "R912"}; continue};
 #
 if ( sw_es_t_f() )
 { l[i]=omo2; r[913]++; if(dbg){print "R913"}; continue};
 #
 if ( sw_es_p_f() )
 { l[i]=omo1; r[914]++; if(dbg){print "R914"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2099 !_#_!
 #  x2099 m2_1sw_ez_dp_2nar_napr_  sw_es_ivp_
for(wrd in omap["x2099"]){omakevars(x2099,"x2099");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; r[915]++; if(dbg){print "R915"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; r[916]++; if(dbg){print "R916"}; continue};
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; r[917]++; if(dbg){print "R917"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; r[918]++; if(dbg){print "R918"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo1; r[919]++; if(dbg){print "R919"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2100 !_#_!
 #  x2100 m2_1sw_ez_l_2gl_poed_pamn_      sw_1ez_dpr_2mn_iv_
for(wrd in omap["x2100"]){omakevars(x2100,"x2100");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_ez_l_f() )
 { l[i]=omo1; r[920]++; if(dbg){print "R920"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[921]++; if(dbg){print "R921"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[922]++; if(dbg){print "R922"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[923]++; if(dbg){print "R923"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[924]++; if(dbg){print "R924"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[925]++; if(dbg){print "R925"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2101 !_#_!
 #  x2101 m2_1sw_ez_l_2gl_poed_    sw_1ez_dpr_2mn_iv_
for(wrd in omap["x2101"]){omakevars(x2101,"x2101");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_ez_l_f() )
 { l[i]=omo1; r[926]++; if(dbg){print "R926"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[927]++; if(dbg){print "R927"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[928]++; if(dbg){print "R928"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[929]++; if(dbg){print "R929"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[930]++; if(dbg){print "R930"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[931]++; if(dbg){print "R931"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2102 !_#_!
 #  x2102 m2_1sw_ez_r_2gl_poed_	   sw_mn_iv_
for(wrd in omap["x2102"]){omakevars(x2102,"x2102");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[932]++; if(dbg){print "R932"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[933]++; if(dbg){print "R933"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[934]++; if(dbg){print "R934"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2103 !_#_!
 #  x2103 m2_1sw_ez_t_2nar_spos_   pl_1em_iv_2dprt_ez_  дорогой  доро́гой  дорого́й
for(wrd in omap["x2103"]){omakevars(x2103,"x2103");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( p(-1) && p(0) )
 { l[i]=omo2; r[935]++; if(dbg){print "R935"}; continue};
 if ( w(-1,"мой наш твой свой") )
 { l[i]=omo2; r[936]++; if(dbg){print "R936"}; continue};
 if ( suw_edim(1) && s(0,0) && p(1) )
 { l[i]=omo2; r[937]++; if(dbg){print "R937"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo1; r[938]++; if(dbg){print "R938"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2104 !_#_!
 #  x2104 m2_1sw_mn_iv_2deep_na_   sw_es_r_  моря  моря́  мо́ря
for(wrd in omap["x2104"]){omakevars(x2104,"x2104");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[941]++; if(dbg){print "R941"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[939]++; if(dbg){print "R939"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[940]++; if(dbg){print "R940"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2105 !_#_!
 #  x2105 gl_paedze_    sw_es_r_
for(wrd in omap["x2105"]){omakevars(x2105,"x2105");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[942]++; if(dbg){print "R942"}; continue};
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; r[943]++; if(dbg){print "R943"}; continue};
 
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2106 !_#_!
 #  x2106 m2_1sw_mn_iv_2gl_poed_+(sw_ez_r_)      sw_ez_dpr_  мочи  мочи́  мо́чи
for(wrd in omap["x2106"]){omakevars(x2106,"x2106");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-2,"что") &&
       w(-1,"было есть") && s(-2,-1) )
 { l[i]=omo2; r[944]++; if(dbg){print "R944"}; continue};
 if ( w(-2,"изо со") &&
       w(-1,"всей") && s(-2,-1) )
 { l[i]=omo2; r[945]++; if(dbg){print "R945"}; continue};
 if ( w(1,"нет") && s(0,0) && p(1) )
 { l[i]=omo2; r[946]++; if(dbg){print "R946"}; continue};
 if ( w(-1,"не") &&
       (suw_edro(1)||suw_mnro(1)) && s(-1,0) )
 { l[i]=omo1; r[947]++; if(dbg){print "R947"}; continue};
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[948]++; if(dbg){print "R948"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[949]++; if(dbg){print "R949"}; continue};
##
#if ( sw_ez_d_f() )
#{ l[i]=omo2; r[950]++; if(dbg){print "R950"}; continue};
##
#if ( sw_ez_p_f() )
#{ l[i]=omo2; r[951]++; if(dbg){print "R951"}; continue};
##
#if ( sw_ez_r_f() )
#{ l[i]=omo2; r[952]++; if(dbg){print "R952"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2107 !_#_!
 #  x2107 m2_1sw_mn_iv_2pl_ez_i_   sw_es_r_
for(wrd in omap["x2107"]){omakevars(x2107,"x2107");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[953]++; if(dbg){print "R953"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[954]++; if(dbg){print "R954"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[955]++; if(dbg){print "R955"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2108 !_#_!
 #  x2108 m2_1sw_mn_iv_2pl_kr_mn_  sw_ez_r_
for(wrd in omap["x2108"]){omakevars(x2108,"x2108");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[956]++; if(dbg){print "R956"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[957]++; if(dbg){print "R957"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[958]++; if(dbg){print "R958"}; continue};
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; r[959]++; if(dbg){print "R959"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2109 !_#_!
 #  x2109 m2_1sw_mn_r_2gl_poed_    sw_ez_t_
for(wrd in omap["x2109"]){omakevars(x2109,"x2109");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_poed_f() )
 { l[i]=omo1; r[746]++; if(dbg){print "R746"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[960]++; if(dbg){print "R960"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo1; r[961]++; if(dbg){print "R961"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2110 !_#_!
 #  x2110 m2_1sw_mn_r_2pl_kr_em_   sw_em_iv_
for(wrd in omap["x2110"]){omakevars(x2110,"x2110");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo1; r[962]++; if(dbg){print "R962"}; continue};
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[963]++; if(dbg){print "R963"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[964]++; if(dbg){print "R964"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[965]++; if(dbg){print "R965"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2111 !_#_!
 #  x2111 m3_1sw_em_i_2pl_em_iv_3pl_ez_dprt_     sw_ez_t_
for(wrd in omap["x2111"]){omakevars(x2111,"x2111");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[966]++; if(dbg){print "R966"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[967]++; if(dbg){print "R967"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2112 !_#_!
 #  x2112 m3_1sw_ez_dpr_2sw_mn_iv_3gl_pamn_	 sw_ez_l_   да'ли дали'
for(wrd in omap["x2112"]){omakevars(x2112,"x2112");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( gl_pamn_f() )
 { l[i]=omo1; r[968]++; if(dbg){print "R968"}; continue};
 #
 if ( sw_ez_l_f() )
 { l[i]=omo2; r[969]++; if(dbg){print "R969"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[970]++; if(dbg){print "R970"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[971]++; if(dbg){print "R971"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; r[972]++; if(dbg){print "R972"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo1; r[973]++; if(dbg){print "R973"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[974]++; if(dbg){print "R974"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2113 !_#_!
 #  x2113 mest_d_       sw_ez_v_   кому +дефис
for(wrd in omap["x2113"]){omakevars(x2113,"x2113");for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( s1(0,"-") && w(1,"то либо нибудь никому") )
 { l[i]=gensub(/(.)$/,"\\1\xcc\x81",1,l[i]); sep[i]=gensub(/-/,"-\xcc\xa0",1,sep[i]); r[975]++; if(dbg){print "R975"}; continue};
 if ( s1(-1,"-") && w(-1,"кое") )
 { l[i]=gensub(/(.)$/,"\\1\xcc\x81",1,l[i]); r[976]++; if(dbg){print "R976"}; continue};
 if ( sc(0,"?") )
 { l[i]=omo1; r[977]++; if(dbg){print "R977"}; continue};

 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[978]++; if(dbg){print "R978"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2114 !_#_!
 #  x2114 mezd_	        sw_mn_p_
for(wrd in omap["x2114"]){omakevars(x2114,"x2114");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_p_f() )
 { l[i]=omo2; r[979]++; if(dbg){print "R979"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2115 !_#_!
 #  x2115 nar_pre_combo_  sw_1ez_r_2mn_iv_
for(wrd in omap["x2115"]){omakevars(x2115,"x2115");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[980]++; if(dbg){print "R980"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[981]++; if(dbg){print "R981"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[982]++; if(dbg){print "R982"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2116 !_#_!
 #  x2116 nar_spos_     pl_kr_es_
for(wrd in omap["x2116"]){omakevars(x2116,"x2116");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2117 !_#_!
 #  x2117 nar_spos_     sw_em_d_
for(wrd in omap["x2117"]){omakevars(x2117,"x2117");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[983]++; if(dbg){print "R983"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2118 !_#_!
 #  x2118 nar_spos_     sw_em_t_
for(wrd in omap["x2118"]){omakevars(x2118,"x2118");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[984]++; if(dbg){print "R984"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2119 !_#_!
 #  x2119 nar_vrem_     pl_ez_dprt_
for(wrd in omap["x2119"]){omakevars(x2119,"x2119");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2120 !_#_!
 #  x2120 nar_vrem_     sw_em_t_   потом    пото́м    по́том
for(wrd in omap["x2120"]){omakevars(x2120,"x2120");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( p(-2) &&
       w(-1,"а и но однако") && s(-1,-1) )
 { l[i]=omo1; r[985]++; if(dbg){print "R985"}; continue};
 if ( p(-1) )
 { l[i]=omo1; r[986]++; if(dbg){print "R986"}; continue};
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[987]++; if(dbg){print "R987"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2121 !_#_!
 #  x2121 phrase_       pl_1ems_t_2mn_d_
for(wrd in omap["x2121"]){omakevars(x2121,"x2121");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2122 !_#_!
 #  x2122 phrase_       sw_em_r_  < следа >
for(wrd in omap["x2122"]){omakevars(x2122,"x2122");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"без ни") && s(-1,-1) &&
       w(0,"следа") )
 { l[i]=omo1; r[988]++; if(dbg){print "R988"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[989]++; if(dbg){print "R989"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2123 !_#_!
 #  x2123 phrase_       sw_em_vr_
for(wrd in omap["x2123"]){omakevars(x2123,"x2123");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[990]++; if(dbg){print "R990"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[991]++; if(dbg){print "R991"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2124 !_#_!
 #  x2124 phrase_		sw_mn_iv_
for(wrd in omap["x2124"]){omakevars(x2124,"x2124");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[992]++; if(dbg){print "R992"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[993]++; if(dbg){print "R993"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2125 !_#_!
 #  x2125 pl_1em_iv_2ez_dprt_    sw_ez_t_
for(wrd in omap["x2125"]){omakevars(x2125,"x2125");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(-1,"-") )
 { l[i]=omo1; r[994]++; if(dbg){print "R994"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[995]++; if(dbg){print "R995"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2126 !_#_!
 #  x2126 pl_em_iv_		sw_mn_r_
for(wrd in omap["x2126"]){omakevars(x2126,"x2126");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[996]++; if(dbg){print "R996"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2127 !_#_!
 #  x2127 pl_em_iv_		sw_mn_vr_
for(wrd in omap["x2127"]){omakevars(x2127,"x2127");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[997]++; if(dbg){print "R997"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[998]++; if(dbg){print "R998"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2128 !_#_!
 #  x2128 pl_em_p_		sw_em_t_
for(wrd in omap["x2128"]){omakevars(x2128,"x2128");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[999]++; if(dbg){print "R999"}; continue};
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[1000]++; if(dbg){print "R1000"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2129 !_#_!
 #  x2129 pl_ems_d_		sw_em_d_
for(wrd in omap["x2129"]){omakevars(x2129,"x2129");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[1001]++; if(dbg){print "R1001"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2130 !_#_!
 #  x2130 pl_ems_p_		sw_em_iv_
for(wrd in omap["x2130"]){omakevars(x2130,"x2130");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; r[1002]++; if(dbg){print "R1002"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[1003]++; if(dbg){print "R1003"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[1004]++; if(dbg){print "R1004"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2131 !_#_!
 #  x2131 pl_ems_p_		sw_ems_t_
for(wrd in omap["x2131"]){omakevars(x2131,"x2131");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; r[1005]++; if(dbg){print "R1005"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2132 !_#_!
 #  x2132 pl_ems_p_		sw_em_t_
for(wrd in omap["x2132"]){omakevars(x2132,"x2132");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; r[1006]++; if(dbg){print "R1006"}; continue};
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[1007]++; if(dbg){print "R1007"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2133 !_#_!
 #  x2133 pl_ems_p_		sw_es_t_
for(wrd in omap["x2133"]){omakevars(x2133,"x2133");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_em_p_f()||pl_es_p_f() )
 { l[i]=omo1; r[1008]++; if(dbg){print "R1008"}; continue};
 #
 if ( sw_es_t_f() )
 { l[i]=omo2; r[1009]++; if(dbg){print "R1009"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2134 !_#_!
 #  x2134 pl_ems_t_		sw_em_t_
for(wrd in omap["x2134"]){omakevars(x2134,"x2134");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[1010]++; if(dbg){print "R1010"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2135 !_#_!
 #  x2135 pl_es_iv_		pl_srav_
for(wrd in omap["x2135"]){omakevars(x2135,"x2135");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2136 !_#_!
 #  x2136 pl_ez_dprt_   sw_1em_iv_2ez_t_
for(wrd in omap["x2136"]){omakevars(x2136,"x2136");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[1011]++; if(dbg){print "R1011"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[1012]++; if(dbg){print "R1012"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[1013]++; if(dbg){print "R1013"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2137 !_#_!
 #  x2137 pl_ez_dprt_   sw_ez_t_
for(wrd in omap["x2137"]){omakevars(x2137,"x2137");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[1014]++; if(dbg){print "R1014"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2138 !_#_!
 #  x2138 pl_ez_dprt_   sw_mn_r_
for(wrd in omap["x2138"]){omakevars(x2138,"x2138");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1015]++; if(dbg){print "R1015"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2139 !_#_!
 #  x2139 pl_ez_i_		sw_1es_r_2mn_iv_
for(wrd in omap["x2139"]){omakevars(x2139,"x2139");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[1016]++; if(dbg){print "R1016"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1017]++; if(dbg){print "R1017"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1018]++; if(dbg){print "R1018"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2140 !_#_!
 #  x2140 pl_ez_i_		sw_es_r_
for(wrd in omap["x2140"]){omakevars(x2140,"x2140");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[1019]++; if(dbg){print "R1019"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2141 !_#_!
 #  x2141 pl_ez_i_		sw_mn_i_
for(wrd in omap["x2141"]){omakevars(x2141,"x2141");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1020]++; if(dbg){print "R1020"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2142 !_#_!
 #  x2142 pl_ez_t_		sw_1em_d_2ez_t_
for(wrd in omap["x2142"]){omakevars(x2142,"x2142");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[1021]++; if(dbg){print "R1021"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[1022]++; if(dbg){print "R1022"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2143 !_#_!
 #  x2143 pl_ez_v_		sw_es_d_
for(wrd in omap["x2143"]){omakevars(x2143,"x2143");for(y=1;y<=wln;y++)         # header1
 #
 if ( pl_ez_v_f() )
 { l[i]=omo1; r[1023]++; if(dbg){print "R1023"}; continue};
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; r[1024]++; if(dbg){print "R1024"}; continue};
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2144 !_#_!
 #  x2144 pl_kr_em_		sw_em_i_
for(wrd in omap["x2144"]){omakevars(x2144,"x2144");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[1025]++; if(dbg){print "R1025"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[1026]++; if(dbg){print "R1026"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2145 !_#_!
 #  x2145 pl_kr_em_		sw_em_iv_
for(wrd in omap["x2145"]){omakevars(x2145,"x2145");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[1027]++; if(dbg){print "R1027"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[1028]++; if(dbg){print "R1028"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[1029]++; if(dbg){print "R1029"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2146 !_#_!
 #  x2146 pl_kr_em_		sw_em_t_  знако́м  зна́ком  знаком
for(wrd in omap["x2146"]){omakevars(x2146,"x2146");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[1031]++; if(dbg){print "R1031"}; continue};
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[1030]++; if(dbg){print "R1030"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2147 !_#_!
 #  x2147 pl_kr_em_		sw_mn_r_
for(wrd in omap["x2147"]){omakevars(x2147,"x2147");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[1032]++; if(dbg){print "R1032"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1033]++; if(dbg){print "R1033"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2148 !_#_!
 #  x2148 pl_kr_em_		sw_mn_vr_
for(wrd in omap["x2148"]){omakevars(x2148,"x2148");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[1034]++; if(dbg){print "R1034"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1035]++; if(dbg){print "R1035"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1036]++; if(dbg){print "R1036"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2149 !_#_!
 #  x2149 pl_kr_es_		sw_es_iv_
for(wrd in omap["x2149"]){omakevars(x2149,"x2149");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="добро") {
   if ( w(1,"пожаловать") && s(0,0) )
   { l[i]=omo2; r[1037]++; if(dbg){print "R1037"}; continue};
 };

 #
 if ( sw_es_i_f() )
 { l[i]=omo2; r[1038]++; if(dbg){print "R1038"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; r[1039]++; if(dbg){print "R1039"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2150 !_#_!
 #  x2150 pl_kr_ez_		sw_1es_r_2mn_iv_
for(wrd in omap["x2150"]){omakevars(x2150,"x2150");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[1040]++; if(dbg){print "R1040"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1041]++; if(dbg){print "R1041"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1042]++; if(dbg){print "R1042"}; continue};
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; r[1043]++; if(dbg){print "R1043"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2151 !_#_!
 #  x2151 pl_kr_ez_		sw_em_r_
for(wrd in omap["x2151"]){omakevars(x2151,"x2151");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[1044]++; if(dbg){print "R1044"}; continue};
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; r[1045]++; if(dbg){print "R1045"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2152 !_#_!
 #  x2152 pl_kr_ez_		sw_em_vr_
for(wrd in omap["x2152"]){omakevars(x2152,"x2152");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[1046]++; if(dbg){print "R1046"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[1047]++; if(dbg){print "R1047"}; continue};
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; r[1048]++; if(dbg){print "R1048"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2153 !_#_!
 #  x2153 pl_kr_ez_		sw_es_r_
for(wrd in omap["x2153"]){omakevars(x2153,"x2153");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[1049]++; if(dbg){print "R1049"}; continue};
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; r[1050]++; if(dbg){print "R1050"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2154 !_#_!
 #  x2154 pl_kr_ez_		sw_ez_i_
for(wrd in omap["x2154"]){omakevars(x2154,"x2154");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[1051]++; if(dbg){print "R1051"}; continue};
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; r[1052]++; if(dbg){print "R1052"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2155 !_#_!
 #  x2155 pl_kr_mn_		sw_1ez_r_2mn_iv_
for(wrd in omap["x2155"]){omakevars(x2155,"x2155");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[1053]++; if(dbg){print "R1053"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1054]++; if(dbg){print "R1054"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1055]++; if(dbg){print "R1055"}; continue};
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; r[1056]++; if(dbg){print "R1056"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2156 !_#_!
 #  x2156 pl_kr_mn_		sw_ez_r_
for(wrd in omap["x2156"]){omakevars(x2156,"x2156");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[1057]++; if(dbg){print "R1057"}; continue};
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; r[1058]++; if(dbg){print "R1058"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2157 !_#_!
 #  x2157 pl_kr_mn_		sw_mn_i_
for(wrd in omap["x2157"]){omakevars(x2157,"x2157");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1059]++; if(dbg){print "R1059"}; continue};
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; r[1060]++; if(dbg){print "R1060"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2158 !_#_!
 #  x2158 pl_kr_mn_		sw_mn_iv_
for(wrd in omap["x2158"]){omakevars(x2158,"x2158");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1061]++; if(dbg){print "R1061"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1062]++; if(dbg){print "R1062"}; continue};
 #
 if ( pl_krmn_f() )
 { l[i]=omo1; r[1063]++; if(dbg){print "R1063"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2159 !_#_!
 #  x2159 pl_srav_		sw_1ez_t_2mn_r_
for(wrd in omap["x2159"]){omakevars(x2159,"x2159");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[1064]++; if(dbg){print "R1064"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1065]++; if(dbg){print "R1065"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2160 !_#_!
 #  x2160 pl_srav_		sw_em_p_
for(wrd in omap["x2160"]){omakevars(x2160,"x2160");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; r[1066]++; if(dbg){print "R1066"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2161 !_#_!
 #  x2161 pl_srav_		sw_ez_t_
for(wrd in omap["x2161"]){omakevars(x2161,"x2161");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[1067]++; if(dbg){print "R1067"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2162 !_#_!
 #  x2162 pl_srav_		sw_mn_r_
for(wrd in omap["x2162"]){omakevars(x2162,"x2162");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1068]++; if(dbg){print "R1068"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2163 !_#_!
 #  x2163 pq_ems_p_		sw_em_t_
for(wrd in omap["x2163"]){omakevars(x2163,"x2163");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[1069]++; if(dbg){print "R1069"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2164 !_#_!
 #  x2164 pq_kr_em_		pq_kr_em_
for(wrd in omap["x2164"]){omakevars(x2164,"x2164");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2165 !_#_!
 #  x2165 pq_kr_em_		sw_1em_iv_2mn_vr_
for(wrd in omap["x2165"]){omakevars(x2165,"x2165");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[1070]++; if(dbg){print "R1070"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[1071]++; if(dbg){print "R1071"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1072]++; if(dbg){print "R1072"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1073]++; if(dbg){print "R1073"}; continue};
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[1074]++; if(dbg){print "R1074"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2166 !_#_!
 #  x2166 pq_kr_em_		sw_em_iv_
for(wrd in omap["x2166"]){omakevars(x2166,"x2166");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[1075]++; if(dbg){print "R1075"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[1076]++; if(dbg){print "R1076"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[1077]++; if(dbg){print "R1077"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2167 !_#_!
 #  x2167 pq_kr_em_		sw_mn_r_
for(wrd in omap["x2167"]){omakevars(x2167,"x2167");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[1078]++; if(dbg){print "R1078"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1079]++; if(dbg){print "R1079"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2168 !_#_!
 #  x2168 pq_kr_ez_		sw_em_r_
for(wrd in omap["x2168"]){omakevars(x2168,"x2168");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; r[1080]++; if(dbg){print "R1080"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[1081]++; if(dbg){print "R1081"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2169 !_#_!
 #  x2169 pq_kr_ez_		sw_ez_i_
for(wrd in omap["x2169"]){omakevars(x2169,"x2169");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; r[1082]++; if(dbg){print "R1082"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[1083]++; if(dbg){print "R1083"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2170 !_#_!
 #  x2170 pq_kr_mn_		sw_1ez_r_2mn_i_
for(wrd in omap["x2170"]){omakevars(x2170,"x2170");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[1084]++; if(dbg){print "R1084"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1085]++; if(dbg){print "R1085"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2171 !_#_!
 #  x2171 pq_kr_mn_		sw_1ez_r_2mn_iv_
for(wrd in omap["x2171"]){omakevars(x2171,"x2171");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo2; r[1086]++; if(dbg){print "R1086"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1087]++; if(dbg){print "R1087"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1088]++; if(dbg){print "R1088"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2172 !_#_!
 #  x2172 pq_kr_mn_		sw_mn_iv_
for(wrd in omap["x2172"]){omakevars(x2172,"x2172");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1089]++; if(dbg){print "R1089"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1090]++; if(dbg){print "R1090"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2173 !_#_!
 #  x2173 pre_combo_     sw_mn_d_
for(wrd in omap["x2173"]){omakevars(x2173,"x2173");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_d_f() )
 { l[i]=omo2; r[1091]++; if(dbg){print "R1091"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2174 !_#_!
 #  x2174 predik_		sw_ez_dp_
for(wrd in omap["x2174"]){omakevars(x2174,"x2174");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[1092]++; if(dbg){print "R1092"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[1093]++; if(dbg){print "R1093"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2175 !_#_!
 #  x2175 pred_tv_		sw_em_iv_   пере́д    перёд
for(wrd in omap["x2175"]){omakevars(x2175,"x2175");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( isname(1) && wc(1,"им$ ом$ ой$ ами$ ими$ ыми$") && s(0,0) )
 { l[i]=omo1; r[1094]++; if(dbg){print "R1094"}; continue};
 if ( isname(1) &&
       isname(2) && wc(2,"им$ ом$ ой$ ами$ ими$ ыми$") && s(0,1) )
 { l[i]=omo1; r[1094]++; if(dbg){print "R1094"}; continue};
 
 #
 if ( (suw_edtv(1)||suw_mntv(1)||prl_edtv(1)||prl_mntv(1)||mest_tv(1)) && s(0,0) )
 { l[i]=omo1; r[1095]++; if(dbg){print "R1095"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[1096]++; if(dbg){print "R1096"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[1097]++; if(dbg){print "R1097"}; continue};
 
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2176 !_#_!
 #  x2176 qast_		sw_es_p_
for(wrd in omap["x2176"]){omakevars(x2176,"x2176");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; r[1098]++; if(dbg){print "R1098"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2177 !_#_!
 #  x2177 qip_ez_dprt_		sw_ez_t_    пятой  пя́той  пято́й
for(wrd in omap["x2177"]){omakevars(x2177,"x2177");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[1099]++; if(dbg){print "R1099"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2178 !_#_!
 #  x2178 sw_1em_d_2ez_v_		sw_em_l_
for(wrd in omap["x2178"]){omakevars(x2178,"x2178");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if(iwrd=="ладу") {
   if ( w(-1,"в") && s(-1,-1) )
   { l[i]=omo2; r[1100]++; if(dbg){print "R1100"}; continue};
 };
 #
 if ( suw_mnro(1) && s(0,0) )
 { l[i]=omo1; r[1101]++; if(dbg){print "R1101"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[1102]++; if(dbg){print "R1102"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; r[1103]++; if(dbg){print "R1103"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; r[1104]++; if(dbg){print "R1104"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2179 !_#_!
 #  x2179 sw_1em_d_2ez_v_		sw_es_n_
for(wrd in omap["x2179"]){omakevars(x2179,"x2179");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[1106]++; if(dbg){print "R1106"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; r[1105]++; if(dbg){print "R1105"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2180 !_#_!
 #  x2180 sw_1em_l_2ez_v_		sw_em_d_
for(wrd in omap["x2180"]){omakevars(x2180,"x2180");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; r[1107]++; if(dbg){print "R1107"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[1109]++; if(dbg){print "R1109"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; r[1108]++; if(dbg){print "R1108"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2181 !_#_!
 #  x2181 sw_1em_l_2ez_v_		sw_em_dz_
for(wrd in omap["x2181"]){omakevars(x2181,"x2181");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[1110]++; if(dbg){print "R1110"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; r[1112]++; if(dbg){print "R1112"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; r[1111]++; if(dbg){print "R1111"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2182 !_#_!
 #  x2182 sw_1em_p_2es_ivp_		sw_ez_dp_
for(wrd in omap["x2182"]){omakevars(x2182,"x2182");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo1; r[1113]++; if(dbg){print "R1113"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo1; r[1114]++; if(dbg){print "R1114"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[1115]++; if(dbg){print "R1115"}; continue};
 #
 if ( sw_es_p_f() )
 { l[i]=omo1; r[1116]++; if(dbg){print "R1116"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[1117]++; if(dbg){print "R1117"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[1118]++; if(dbg){print "R1118"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2183 !_#_!
 #  x2183 sw_1em_p_2ez_dp_		sw_es_n_
for(wrd in omap["x2183"]){omakevars(x2183,"x2183");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[1119]++; if(dbg){print "R1119"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; r[1120]++; if(dbg){print "R1120"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo1; r[1121]++; if(dbg){print "R1121"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2184 !_#_!
 #  x2184 sw_1em_p_2ez_d_		sw_ez_p_
for(wrd in omap["x2184"]){omakevars(x2184,"x2184");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[1122]++; if(dbg){print "R1122"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; r[1123]++; if(dbg){print "R1123"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[1124]++; if(dbg){print "R1124"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2185 !_#_!
 #  x2185 sw_1em_r_2ez_i_		sw_mn_iv_
for(wrd in omap["x2185"]){omakevars(x2185,"x2185");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; r[1125]++; if(dbg){print "R1125"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1126]++; if(dbg){print "R1126"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1127]++; if(dbg){print "R1127"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1128]++; if(dbg){print "R1128"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2186 !_#_!
 #  x2186 sw_1em_r_2phrase_		sw_mn_i_
for(wrd in omap["x2186"]){omakevars(x2186,"x2186");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1129]++; if(dbg){print "R1129"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1130]++; if(dbg){print "R1130"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2187 !_#_!
 #  x2187 sw_1ems_d_2ez_v_		sw_em_l_  миру  ми́ру  миру́
for(wrd in omap["x2187"]){omakevars(x2187,"x2187");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_l_f() && mark("Yme",lc(-1)) )
 { l[i]=omo2; r[1131]++; if(dbg){print "R1131"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[1132]++; if(dbg){print "R1132"}; continue};
 #
 if ( sw_es_d_f() )
 { l[i]=omo1; r[1133]++; if(dbg){print "R1133"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo1; r[1134]++; if(dbg){print "R1134"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2188 !_#_!
 #  x2188 sw_1ems_n_2ez_r_		sw_mn_iv_
for(wrd in omap["x2188"]){omakevars(x2188,"x2188");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[1135]++; if(dbg){print "R1135"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1136]++; if(dbg){print "R1136"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1137]++; if(dbg){print "R1137"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2189 !_#_!
 #  x2189 sw_1em_vr_2ez_i_		sw_mn_iv_
for(wrd in omap["x2189"]){omakevars(x2189,"x2189");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; r[1138]++; if(dbg){print "R1138"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[1139]++; if(dbg){print "R1139"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1140]++; if(dbg){print "R1140"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1141]++; if(dbg){print "R1141"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1142]++; if(dbg){print "R1142"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2190 !_#_!
 #  x2190 sw_1em_vr_2ez_r_		sw_mn_iv_
for(wrd in omap["x2190"]){omakevars(x2190,"x2190");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[1143]++; if(dbg){print "R1143"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1144]++; if(dbg){print "R1144"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[1145]++; if(dbg){print "R1145"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1146]++; if(dbg){print "R1146"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1147]++; if(dbg){print "R1147"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2191 !_#_!
 #  x2191 sw_1es_n_2ez_r_		sw_mn_v_
for(wrd in omap["x2191"]){omakevars(x2191,"x2191");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[1148]++; if(dbg){print "R1148"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1149]++; if(dbg){print "R1149"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2192 !_#_!
 #  x2192 sw_1es_r_2mn_iv_		sw_ez_i_
for(wrd in omap["x2192"]){omakevars(x2192,"x2192");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[1150]++; if(dbg){print "R1150"}; continue};
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; r[1151]++; if(dbg){print "R1151"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[1152]++; if(dbg){print "R1152"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[1153]++; if(dbg){print "R1153"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2193 !_#_!
 #  x2193 sw_1ez_dp_2mn_iv_		sw_ez_rl_
for(wrd in omap["x2193"]){omakevars(x2193,"x2193");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[1154]++; if(dbg){print "R1154"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[1155]++; if(dbg){print "R1155"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[1156]++; if(dbg){print "R1156"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[1157]++; if(dbg){print "R1157"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2194 !_#_!
 #  x2194 sw_1ez_dpr_2mn_iv_	        sw_ez_l_
for(wrd in omap["x2194"]){omakevars(x2194,"x2194");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="связи") {
   if ( w(-1,"в") && w(1,"с") && s(-1,0) )
   { l[i]=omo2; r[1158]++; if(dbg){print "R1158"}; continue}
   else
   { l[i]=omo1; r[1159]++; if(dbg){print "R1159"}; continue};
 };
 #
 if ( sw_ez_l_f() )
 { l[i]=omo2; r[1160]++; if(dbg){print "R1160"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo1; r[1161]++; if(dbg){print "R1161"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo1; r[1162]++; if(dbg){print "R1162"}; continue};
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[1163]++; if(dbg){print "R1163"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[1164]++; if(dbg){print "R1164"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[1165]++; if(dbg){print "R1165"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2195 !_#_!
 #  x2195 sw_1ez_dr_2mn_iv_		sw_ez_p_
for(wrd in omap["x2195"]){omakevars(x2195,"x2195");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[1166]++; if(dbg){print "R1166"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[1167]++; if(dbg){print "R1167"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[1168]++; if(dbg){print "R1168"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2196 !_#_!
 #  x2196 sw_1ez_drp_2mn_iv_		sw_ez_l_
for(wrd in omap["x2196"]){omakevars(x2196,"x2196");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_l_f() )
 { l[i]=omo2; r[1169]++; if(dbg){print "R1169"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[1170]++; if(dbg){print "R1170"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[1171]++; if(dbg){print "R1171"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2197 !_#_!
 #  x2197 sw_1ez_i_2mn_iv_		sw_em_r_
for(wrd in omap["x2197"]){omakevars(x2197,"x2197");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[1172]++; if(dbg){print "R1172"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; r[1173]++; if(dbg){print "R1173"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[1174]++; if(dbg){print "R1174"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[1175]++; if(dbg){print "R1175"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2198 !_#_!
 #  x2198 sw_1ez_i_2mn_iv_		sw_es_r_
for(wrd in omap["x2198"]){omakevars(x2198,"x2198");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[1176]++; if(dbg){print "R1176"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; r[1177]++; if(dbg){print "R1177"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[1178]++; if(dbg){print "R1178"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[1179]++; if(dbg){print "R1179"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2199 !_#_!
 #  x2199 sw_1ez_p_2mn_iv_		sw_ez_dl_ #= груди =#
for(wrd in omap["x2199"]){omakevars(x2199,"x2199");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(0,"груди") && w(-1,"в на") )
 { l[i]=omo2; r[1180]++; if(dbg){print "R1180"}; continue};
 #
 if ( sw_ez_l_f() )
 { l[i]=omo2; r[1181]++; if(dbg){print "R1181"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[1182]++; if(dbg){print "R1182"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo1; r[1183]++; if(dbg){print "R1183"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[1184]++; if(dbg){print "R1184"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[1185]++; if(dbg){print "R1185"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2200 !_#_!
 #  x2200 sw_1mn_r_2pl_kr_em_		sw_em_iv_
for(wrd in omap["x2200"]){omakevars(x2200,"x2200");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[1186]++; if(dbg){print "R1186"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[1187]++; if(dbg){print "R1187"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo1; r[1188]++; if(dbg){print "R1188"}; continue};
 #
 if ( pl_kr_em_f() )
 { l[i]=omo1; r[1189]++; if(dbg){print "R1189"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2201 !_#_!
 #  x2201 sw_ed_iv_		sw_mn_d_
for(wrd in omap["x2201"]){omakevars(x2201,"x2201");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_d_f() )
 { l[i]=omo2; r[1190]++; if(dbg){print "R1190"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2202 !_#_!
 #  x2202 sw_em_dl_		sw_ez_v_
for(wrd in omap["x2202"]){omakevars(x2202,"x2202");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[1191]++; if(dbg){print "R1191"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[1192]++; if(dbg){print "R1192"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; r[1193]++; if(dbg){print "R1193"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2203 !_#_!
 #  x2203 sw_em_dp_		sw_em_l_
for(wrd in omap["x2203"]){omakevars(x2203,"x2203");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"Ykl") && notsym(-1,unxy) && s(-1,-1) )
 { l[i-1]=gensub(/([АЕЁИОУЫЭЮЯаеёиоуыэюя])/,"\\1\xcc\x81",1,l[i-1]); l[i]=gensub(/^(.)/,"\xcc\xa0\\1\xcc\xad",1,l[i]); r[1194]++; if(dbg){print "R1194"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[1195]++; if(dbg){print "R1195"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[1196]++; if(dbg){print "R1196"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; r[1197]++; if(dbg){print "R1197"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2204 !_#_!
 #  x2204 sw_em_dr_		sw_em_l_
for(wrd in omap["x2204"]){omakevars(x2204,"x2204");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"Ykl") && notsym(-1,unxy) && s(-1,-1) )
 { l[i-1]=gensub(/([АЕЁИОУЫЭЮЯаеёиоуыэюя])/,"\\1\xcc\x81",1,l[i-1]); l[i]=gensub(/^(.)/,"\xcc\xa0\\1\xcc\xad",1,l[i]); r[1198]++; if(dbg){print "R1198"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; r[1199]++; if(dbg){print "R1199"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[1200]++; if(dbg){print "R1200"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1201]++; if(dbg){print "R1201"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2205 !_#_!
 #  x2205 sw_em_d_		sw_em_k_
for(wrd in omap["x2205"]){omakevars(x2205,"x2205");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[1202]++; if(dbg){print "R1202"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2206 !_#_!
 #  x2206 sw_em_d_		sw_em_l_
for(wrd in omap["x2206"]){omakevars(x2206,"x2206");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( ismark(-1,"Ykl") && notsym(-1,unxy) && s(-1,-1) )
 { l[i-1]=gensub(/([АЕЁИОУЫЭЮЯаеёиоуыэюя])/,"\\1\xcc\x81",1,l[i-1]); l[i]=gensub(/^(.)/,"\xcc\xa0\\1\xcc\xad",1,l[i]); r[1203]++; if(dbg){print "R1203"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; r[1204]++; if(dbg){print "R1204"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[1205]++; if(dbg){print "R1205"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2207 !_#_!
 #  x2207 sw_em_d_		sw_em_p_
for(wrd in omap["x2207"]){omakevars(x2207,"x2207");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; r[1206]++; if(dbg){print "R1206"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[1207]++; if(dbg){print "R1207"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2208 !_#_!
 #  x2208 sw_em_d_		sw_em_v_
for(wrd in omap["x2208"]){omakevars(x2208,"x2208");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[1208]++; if(dbg){print "R1208"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[1209]++; if(dbg){print "R1209"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2209 !_#_!
 #  x2209 sw_em_d_		sw_ez_d_
for(wrd in omap["x2209"]){omakevars(x2209,"x2209");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[1210]++; if(dbg){print "R1210"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[1211]++; if(dbg){print "R1211"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2210 !_#_!
 #  x2210 sw_em_d_		sw_ez_v_
for(wrd in omap["x2210"]){omakevars(x2210,"x2210");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[1212]++; if(dbg){print "R1212"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[1213]++; if(dbg){print "R1213"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2211 !_#_!
 #  x2211 sw_em_dv_		sw_em_l_
for(wrd in omap["x2211"]){omakevars(x2211,"x2211");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[1214]++; if(dbg){print "R1214"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[1215]++; if(dbg){print "R1215"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; r[1216]++; if(dbg){print "R1216"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2212 !_#_!
 #  x2212 sw_em_dz_		sw_em_l_
for(wrd in omap["x2212"]){omakevars(x2212,"x2212");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[1217]++; if(dbg){print "R1217"}; continue};
 #
 if ( sw_em_z_f() )
 { l[i]=omo1; r[1218]++; if(dbg){print "R1218"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo2; r[1219]++; if(dbg){print "R1219"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2213 !_#_!
 #  x2213 sw_em_dz_		sw_ez_v_
for(wrd in omap["x2213"]){omakevars(x2213,"x2213");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo1; r[1220]++; if(dbg){print "R1220"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[1221]++; if(dbg){print "R1221"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2214 !_#_!
 #  x2214 sw_em_i_		sw_em_t_
for(wrd in omap["x2214"]){omakevars(x2214,"x2214");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[1222]++; if(dbg){print "R1222"}; continue};
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[1223]++; if(dbg){print "R1223"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2215 !_#_!
 #  x2215 sw_em_i_		sw_em_vr_
for(wrd in omap["x2215"]){omakevars(x2215,"x2215");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[1224]++; if(dbg){print "R1224"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[1225]++; if(dbg){print "R1225"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[1226]++; if(dbg){print "R1226"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2216 !_#_!
 #  x2216 sw_em_i_		sw_mn_r_
for(wrd in omap["x2216"]){omakevars(x2216,"x2216");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[1227]++; if(dbg){print "R1227"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1228]++; if(dbg){print "R1228"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2217 !_#_!
 #  x2217 sw_em_i_		sw_mn_vr_
for(wrd in omap["x2217"]){omakevars(x2217,"x2217");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[1229]++; if(dbg){print "R1229"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1230]++; if(dbg){print "R1230"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1231]++; if(dbg){print "R1231"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2218 !_#_!
 #  x2218 sw_em_iv_		sw_em_t_
for(wrd in omap["x2218"]){omakevars(x2218,"x2218");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[1232]++; if(dbg){print "R1232"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[1233]++; if(dbg){print "R1233"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[1234]++; if(dbg){print "R1234"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2219 !_#_!
 #  x2219 sw_em_iv_		sw_mn_p_
for(wrd in omap["x2219"]){omakevars(x2219,"x2219");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[1235]++; if(dbg){print "R1235"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[1236]++; if(dbg){print "R1236"}; continue};
 #
 if ( sw_mn_p_f() )
 { l[i]=omo2; r[1237]++; if(dbg){print "R1237"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2220 !_#_!
 #  x2220 sw_em_iv_		sw_mn_r_
for(wrd in omap["x2220"]){omakevars(x2220,"x2220");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1238]++; if(dbg){print "R1238"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[1239]++; if(dbg){print "R1239"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[1240]++; if(dbg){print "R1240"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2221 !_#_!
 #  x2221 sw_em_iv_		sw_mn_vr_
for(wrd in omap["x2221"]){omakevars(x2221,"x2221");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
  if(iwrd=="белок") {
   if ( wc(-2,"^охот") &&
         pre_vi(-1) && s(-2,-1) )
   { l[i]=omo2; r[1273]++; if(dbg){print "R1273"}; continue};
 };
if ( qxs(-1,"что","за") )
 { l[i]=omo1; r[1241]++; if(dbg){print "R1241"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo1; r[1241]++; if(dbg){print "R1241"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[1242]++; if(dbg){print "R1242"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1243]++; if(dbg){print "R1243"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1244]++; if(dbg){print "R1244"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2222 !_#_!
 #  x2222 sw_em_l_		sw_ems_dz_
for(wrd in omap["x2222"]){omakevars(x2222,"x2222");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[1245]++; if(dbg){print "R1245"}; continue};
 #
 if ( sw_es_d_f() )
 { l[i]=omo2; r[1246]++; if(dbg){print "R1246"}; continue};
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; r[1247]++; if(dbg){print "R1247"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2223 !_#_!
 #  x2223 sw_em_n_		sw_em_p_
for(wrd in omap["x2223"]){omakevars(x2223,"x2223");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; r[1248]++; if(dbg){print "R1248"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2224 !_#_!
 #  x2224 sw_em_n_		sw_mn_iv_
for(wrd in omap["x2224"]){omakevars(x2224,"x2224");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1249]++; if(dbg){print "R1249"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1250]++; if(dbg){print "R1250"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2225 !_#_!
 #  x2225 sw_em_n_		sw_mn_vr_
for(wrd in omap["x2225"]){omakevars(x2225,"x2225");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1251]++; if(dbg){print "R1251"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1252]++; if(dbg){print "R1252"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2226 !_#_!
 #  x2226 sw_em_p_		sw_em_t_
for(wrd in omap["x2226"]){omakevars(x2226,"x2226");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[1253]++; if(dbg){print "R1253"}; continue};
 #
 if ( sw_em_t_f() )
 { l[i]=omo2; r[1254]++; if(dbg){print "R1254"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2227 !_#_!
 #  x2227 sw_em_p_		sw_es_iv_
for(wrd in omap["x2227"]){omakevars(x2227,"x2227");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; r[1255]++; if(dbg){print "R1255"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; r[1256]++; if(dbg){print "R1256"}; continue};
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[1257]++; if(dbg){print "R1257"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2228 !_#_!
 #  x2228 sw_em_p_		sw_es_n_
for(wrd in omap["x2228"]){omakevars(x2228,"x2228");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[1258]++; if(dbg){print "R1258"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2229 !_#_!
 #  x2229 sw_em_p_		sw_es_p_     сти́ле  стиле́
for(wrd in omap["x2229"]){omakevars(x2229,"x2229");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[1259]++; if(dbg){print "R1259"}; continue};
 #
#if ( sw_es_p_f() )
#{ l[i]=omo2; r[1260]++; if(dbg){print "R1260"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2230 !_#_!
 #  x2230 sw_em_p_		sw_ez_dp_
for(wrd in omap["x2230"]){omakevars(x2230,"x2230");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 if(iwrd=="кружке") {
   if ( w(1,"воды пива вина сока молока жидкости эля") && s(0,0) )
   { l[i]=omo2; r[1273]++; if(dbg){print "R1273"}; continue};
 };
 #
 if ( sw_em_p_f() )
 { l[i]=omo1; r[1261]++; if(dbg){print "R1261"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[1262]++; if(dbg){print "R1262"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[1263]++; if(dbg){print "R1263"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2231 !_#_!
 #  x2231 sw_em_q_		sw_em_r_
for(wrd in omap["x2231"]){omakevars(x2231,"x2231");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_q_f() )
 { l[i]=omo1; r[1264]++; if(dbg){print "R1264"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[1265]++; if(dbg){print "R1265"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2232 !_#_!
 #  x2232 sw_em_r_		sw_es_ivr_
for(wrd in omap["x2232"]){omakevars(x2232,"x2232");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; r[1266]++; if(dbg){print "R1266"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; r[1267]++; if(dbg){print "R1267"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1268]++; if(dbg){print "R1268"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2233 !_#_!
 #  x2233 sw_em_r_		sw_ez_i_
for(wrd in omap["x2233"]){omakevars(x2233,"x2233");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1269]++; if(dbg){print "R1269"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[1270]++; if(dbg){print "R1270"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2234 !_#_!
 #  x2234 sw_em_r_		sw_mn_i_
for(wrd in omap["x2234"]){omakevars(x2234,"x2234");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1271]++; if(dbg){print "R1271"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1272]++; if(dbg){print "R1272"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2235 !_#_!
 #  x2235 sw_em_r_		sw_mn_iv_
for(wrd in omap["x2235"]){omakevars(x2235,"x2235");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 if(iwrd=="города") {
   if ( w(-1,"смелость") && w(1,"берёт") && s(-1,0) )
   { l[i]=omo2; r[1273]++; if(dbg){print "R1273"}; continue};
 };
 if(iwrd=="шенкеля") {
   if ( wb(-3,"дать дал дала дав") && s(wbn,-1) )
   { l[i]=omo2; r[1274]++; if(dbg){print "R1274"}; continue};
 };
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1275]++; if(dbg){print "R1275"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1276]++; if(dbg){print "R1276"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1277]++; if(dbg){print "R1277"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2236 !_#_!
 #  x2236 sw_ems_p_		sw_es_iv_
for(wrd in omap["x2236"]){omakevars(x2236,"x2236");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; r[1278]++; if(dbg){print "R1278"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; r[1279]++; if(dbg){print "R1279"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2237 !_#_!
 #  x2237 sw_ems_r_		sw_mn_iv_
for(wrd in omap["x2237"]){omakevars(x2237,"x2237");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1280]++; if(dbg){print "R1280"}; continue};
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; r[1281]++; if(dbg){print "R1281"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1282]++; if(dbg){print "R1282"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1283]++; if(dbg){print "R1283"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2238 !_#_!
 #  x2238 sw_em_t_		sw_ems_p_
for(wrd in omap["x2238"]){omakevars(x2238,"x2238");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; r[1284]++; if(dbg){print "R1284"}; continue};
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; r[1285]++; if(dbg){print "R1285"}; continue};
 #
 if ( sw_em_t_f() )
 { l[i]=omo1; r[1286]++; if(dbg){print "R1286"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2239 !_#_!
 #  x2239 sw_em_t_		sw_es_p_
for(wrd in omap["x2239"]){omakevars(x2239,"x2239");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo1; r[1287]++; if(dbg){print "R1287"}; continue};
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; r[1288]++; if(dbg){print "R1288"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2240 !_#_!
 #  x2240 sw_em_t_		sw_mn_r_
for(wrd in omap["x2240"]){omakevars(x2240,"x2240");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_t_f() )
 { l[i]=omo1; r[1289]++; if(dbg){print "R1289"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1290]++; if(dbg){print "R1290"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2241 !_#_!
 #  x2241 sw_em_vr_		sw_ez_i_
for(wrd in omap["x2241"]){omakevars(x2241,"x2241");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[1291]++; if(dbg){print "R1291"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[1292]++; if(dbg){print "R1292"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1293]++; if(dbg){print "R1293"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2242 !_#_!
 #  x2242 sw_em_vr_		sw_mn_i_
for(wrd in omap["x2242"]){omakevars(x2242,"x2242");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1294]++; if(dbg){print "R1294"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[1295]++; if(dbg){print "R1295"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1296]++; if(dbg){print "R1296"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2243 !_#_!
 #  x2243 sw_em_vr_		sw_mn_iv_
for(wrd in omap["x2243"]){omakevars(x2243,"x2243");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_v_f() )
 { l[i]=omo1; r[1297]++; if(dbg){print "R1297"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1298]++; if(dbg){print "R1298"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1299]++; if(dbg){print "R1299"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1300]++; if(dbg){print "R1300"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2244 !_#_!
 #  x2244 sw_emz_r_		sw_mn_iv_
for(wrd in omap["x2244"]){omakevars(x2244,"x2244");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[1301]++; if(dbg){print "R1301"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1302]++; if(dbg){print "R1302"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1303]++; if(dbg){print "R1303"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2245 !_#_!
 #  x2245 sw_es_d_		sw_ez_t_
for(wrd in omap["x2245"]){omakevars(x2245,"x2245");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_d_f() )
 { l[i]=omo1; r[1304]++; if(dbg){print "R1304"}; continue};
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[1305]++; if(dbg){print "R1305"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2246 !_#_!
 #  x2246 sw_es_d_		sw_ez_v_
for(wrd in omap["x2246"]){omakevars(x2246,"x2246");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_d_f() )
 { l[i]=omo1; r[1306]++; if(dbg){print "R1306"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[1307]++; if(dbg){print "R1307"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2247 !_#_!
 #  x2247 sw_es_i_		sw_es_v_
for(wrd in omap["x2247"]){omakevars(x2247,"x2247");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo1; r[1308]++; if(dbg){print "R1308"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; r[1309]++; if(dbg){print "R1309"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2248 !_#_!
 #  x2248 sw_es_iv_		sw_es_p_
for(wrd in omap["x2248"]){omakevars(x2248,"x2248");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 prex=1
 #
 if ( sw_es_i_f() )
 { l[i]=omo1; r[1310]++; if(dbg){print "R1310"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo1; r[1311]++; if(dbg){print "R1311"}; continue};
 #
 if ( sw_es_p_f() )
 { l[i]=omo2; r[1312]++; if(dbg){print "R1312"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2249 !_#_!
 #  x2249 sw_es_n_		sw_ez_dp_
for(wrd in omap["x2249"]){omakevars(x2249,"x2249");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[1313]++; if(dbg){print "R1313"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[1314]++; if(dbg){print "R1314"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2250 !_#_!
 #  x2250 sw_es_n_		sw_ez_p_
for(wrd in omap["x2250"]){omakevars(x2250,"x2250");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[1315]++; if(dbg){print "R1315"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2251 !_#_!
 #  x2251 sw_es_n_		sw_ez_v_
for(wrd in omap["x2251"]){omakevars(x2251,"x2251");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[1316]++; if(dbg){print "R1316"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2252 !_#_!
 #  x2252 sw_es_p_		sw_ez_dp_
for(wrd in omap["x2252"]){omakevars(x2252,"x2252");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_p_f() )
 { l[i]=omo1; r[1317]++; if(dbg){print "R1317"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo2; r[1318]++; if(dbg){print "R1318"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo2; r[1319]++; if(dbg){print "R1319"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2253 !_#_!
 #  x2253 sw_es_r_		sw_ez_i_
for(wrd in omap["x2253"]){omakevars(x2253,"x2253");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; r[1320]++; if(dbg){print "R1320"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[1321]++; if(dbg){print "R1321"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2254 !_#_!
 #  x2254 sw_es_r_      sw_mn_iv_
for(wrd in omap["x2254"]){omakevars(x2254,"x2254");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; r[1322]++; if(dbg){print "R1322"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1323]++; if(dbg){print "R1323"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1324]++; if(dbg){print "R1324"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2255 !_#_!
 #  x2255 sw_es_r_		sw_mn_v_
for(wrd in omap["x2255"]){omakevars(x2255,"x2255");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; r[1325]++; if(dbg){print "R1325"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1326]++; if(dbg){print "R1326"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2256 !_#_!
 #  x2256 sw_ez_iv_		sw_mn_r_
for(wrd in omap["x2256"]){omakevars(x2256,"x2256");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1327]++; if(dbg){print "R1327"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2257 !_#_!
 #  x2257 sw_ez_r_		sw_mn_i_
for(wrd in omap["x2257"]){omakevars(x2257,"x2257");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[1328]++; if(dbg){print "R1328"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1329]++; if(dbg){print "R1329"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2258 !_#_!
 #  x2258 sw_ez_r_      sw_mn_iv_
for(wrd in omap["x2258"]){omakevars(x2258,"x2258");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[1330]++; if(dbg){print "R1330"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1331]++; if(dbg){print "R1331"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1332]++; if(dbg){print "R1332"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2259 !_#_!
 #  x2259 sw_ez_r_		sw_mn_v_
for(wrd in omap["x2259"]){omakevars(x2259,"x2259");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_r_f() )
 { l[i]=omo1; r[1333]++; if(dbg){print "R1333"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1334]++; if(dbg){print "R1334"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2260 !_#_!
 #  x2260 sw_ez_t_		sw_ez_v_
for(wrd in omap["x2260"]){omakevars(x2260,"x2260");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo1; r[1335]++; if(dbg){print "R1335"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo2; r[1336]++; if(dbg){print "R1336"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2261 !_#_!
 #  x2261 sw_ez_t_		sw_mn_r_
for(wrd in omap["x2261"]){omakevars(x2261,"x2261");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo1; r[1337]++; if(dbg){print "R1337"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1338]++; if(dbg){print "R1338"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2262 !_#_!
 #  x2262 sw_ez_t_		sw_mn_vr_
for(wrd in omap["x2262"]){omakevars(x2262,"x2262");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo1; r[1339]++; if(dbg){print "R1339"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1340]++; if(dbg){print "R1340"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1341]++; if(dbg){print "R1341"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2263 !_#_!
 #  x2263 sw_mn_p_		sw_mn_r_
for(wrd in omap["x2263"]){omakevars(x2263,"x2263");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_p_f() )
 { l[i]=omo1; r[1342]++; if(dbg){print "R1342"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1343]++; if(dbg){print "R1343"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2264 !_#_!
 #  x2264 sw_mn_p_      sw_mn_vr_
for(wrd in omap["x2264"]){omakevars(x2264,"x2264");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_p_f() )
 { l[i]=omo1; r[1344]++; if(dbg){print "R1344"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1345]++; if(dbg){print "R1345"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1346]++; if(dbg){print "R1346"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2265 !_#_!
 #  x2265 mest_1ems_t_2mn_d_       mest_ems_p_
for(wrd in omap["x2265"]){omakevars(x2265,"x2265");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"во о обо на при") && s(-1,-1) )
 { l[i]=omo2; r[1347]++; if(dbg){print "R1347"}; continue;};
 #
 if ( !(w(-1,"во о обо на при") && s(-1,-1)) )
 { l[i]=omo1; r[1348]++; if(dbg){print "R1348"}; continue;};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2266 !_#_!
 #  x2266 m2_1mest_es_r_2souz_     mest_es_p_    чем  че́м  чём
for(wrd in omap["x2266"]){omakevars(x2266,"x2266");for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( !(w(-2,"не") && s(-2,-2)) && 
         w(-1,"в о об на при по") && s(-1,-1) )
 { l[i]=omo2; r[1349]++; if(dbg){print "R1349"}; continue;};
 #
 if ( tolower(l[i])==iwrd )
 { l[i]=omo1; r[1350]++; if(dbg){print "R1350"}; continue;};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2267 !_#_!
 #  x2267 qip_iv_       sw_mn_vr_   < сорок > со́рок соро́к
for(wrd in omap["x2267"]){omakevars(x2267,"x2267");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( (suw_mnro(1)||suw_mnsq(1)||qi_ed(1)||qi_mn(1)) && s(0,0) )
 { l[i]=omo1; r[1351]++; if(dbg){print "R1351"}; continue;};
 if ( (suw_mnro(-1)||suw_mnsq(-1)||qi_ed(-1)||qi_mn(-1)) && s(-1,-1) )
 { l[i]=omo1; r[1352]++; if(dbg){print "R1352"}; continue;};
 if ( (qi_ed(-2)||qi_mn(-2)) &&
        w(-1,"или") && s(-2,-1) )
 { l[i]=omo1; r[1353]++; if(dbg){print "R1353"}; continue;};
 if ( w(1,"или") &&
      (qi_ed(2)||qi_mn(2)) && s(0,1) )
 { l[i]=omo1; r[1354]++; if(dbg){print "R1354"}; continue;};
 if ( w(-1,"за по под") && s(-1,-1) )
 { l[i]=omo1; r[1355]++; if(dbg){print "R1355"}; continue;};
 if ( suw_mnro(-2) &&
       w(-1,"в на за под") && s(-2,-1) )
 { l[i]=omo1; r[1356]++; if(dbg){print "R1356"}; continue;};

 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1357]++; if(dbg){print "R1357"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo2; r[1358]++; if(dbg){print "R1358"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2268 !_#_!
 #  x2268 qip_dprt_     sw_ez_i_   сорока сорока́ соро́ка
for(wrd in omap["x2268"]){omakevars(x2268,"x2268");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2ш
 prex=1
 #
 if ( pre_pr(-1) &&
       (suw_mnpr(1)||qik_pr(1)) && s(-1,0) )
 { l[i]=omo1; r[1359]++; if(dbg){print "R1359"}; continue};
 if ( (suw_mnro(-1)||suw_mnsq(-1)||qik_ro(-1)) && s(-1,-1) )
 { l[i]=omo1; r[1360]++; if(dbg){print "R1360"}; continue};
 if ( (suw_mnro(1)||suw_mnsq(1)||qik_ro(1)) && s(0,0) )
 { l[i]=omo1; r[1361]++; if(dbg){print "R1361"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[1362]++; if(dbg){print "R1362"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2269 !_#_!
 #  x2269 mest_ems_d_   sw_em_d_   тому то́му тому́
for(wrd in omap["x2269"]){omakevars(x2269,"x2269");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(0,",") &&
      (muk_ed(1)||muk_mn(1)||mest_ed(1)||mest_mn(1)||w(1,"что чтоб чтобы как")) )
 { l[i]=omo1; r[1363]++; if(dbg){print "R1363"}; continue};
 if ( pre_da(-1) &&
      (suw_edmuda(1)||suw_edsrda(1)||w(1,"же")) && s(-1,0) )
 { l[i]=omo1; r[1364]++; if(dbg){print "R1364"}; continue};
 if ( (suw_edro(-1)||suw_mnro(-1)||qik_im(-1)) &&
       w(1,"назад") && s(-1,-1) )
 { l[i]=omo1; r[1365]++; if(dbg){print "R1365"}; continue};
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[1366]++; if(dbg){print "R1366"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2270 !_#_!
 #  x2270	deep_na_    pre_combo_  судя судя́ су́дя
for(wrd in omap["x2270"]){omakevars(x2270,"x2270");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"по") && s(0,0) )
 { l[i]=omo2; r[1367]++; if(dbg){print "R1367"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2271 !_#_!
 #  x2271 m2_1sw_ez_i_2predik_     sw_ez_i_  пора  пора́  по́ра
for(wrd in omap["x2271"]){omakevars(x2271,"x2271");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( qf(3,"gl_in") && s(0,qfn-1) )
 { l[i]=omo1; r[1368]++; if(dbg){print "R1368"}; continue};
 if ( mest_da(-1) )
 { l[i]=omo1; r[1369]++; if(dbg){print "R1369"}; continue};
 if ( p(-1)||p(1) )
 { l[i]=omo1; r[1370]++; if(dbg){print "R1370"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2272 !_#_!
 #  x2272 m2_1pl_kr_ed_2sw_mn_iv_  sw_es_r_  права  права́  пра́ва
for(wrd in omap["x2272"]){omakevars(x2272,"x2272");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[1371]++; if(dbg){print "R1371"}; continue};
 #
 if ( pl_kr_ez_f() )
 { l[i]=omo1; r[1372]++; if(dbg){print "R1372"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[1373]++; if(dbg){print "R1373"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo1; r[1374]++; if(dbg){print "R1374"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2273 !_#_!
 #  x2273 samogo1_ samogo2_   самого са́мого самого́
for(wrd in omap["x2273"]){omakevars(x2273,"x2273");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"лучшего") && p(1) && s(0,0) )
 { l[i]=omo1; r[1376]++; if(dbg){print "R1376"}; continue};
 #
 if ( (w(1,"себя тебя меня")||muk_edmuro(1)||(w(1,"его")&&p(1))) && s(0,0) )
 { l[i]=omo2; r[1375]++; if(dbg){print "R1375"}; continue};
 if ( (w(-1,"себя тебя меня его")||muk_edmuro(1)) && p(0) && s(-1,-1) )
 { l[i]=omo2; r[1376]++; if(dbg){print "R1376"}; continue};
 #
 if ( (prl_edmuro(1)||prl_edsrro(1)||mest_vi(1)||mest_ro(1)) &&
       isname(2) && s(0,1) )
 { l[i]=omo2; r[1377]++; if(dbg){print "R1377"}; continue};
 if ( (prl_edmuro(1)||prl_edsrro(1)) && sc(1,",") && s(0,0) &&
       w(2,"самого") &&
       (prl_edmuro(3)||prl_edsrro(3)) && s(2,3) )
 { l[i]=omo1; r[1378]++; if(dbg){print "R1378"}; continue};
 if ( (prl_edmuro(1)||prl_edsrro(1)) &&
       w(2,"и или") &&
       (prl_edmuro(3)||prl_edsrro(3)) && s(0,2) )
 { l[i]=omo1; r[1379]++; if(dbg){print "R1379"}; continue};
 if ( (prl_edmuro(-2)||prl_edsrro(-2)) &&
       w(-1,"и или") &&
       (prl_edmuro(1)||prl_edsrro(1)) && s(-2,0) )
 { l[i]=omo1; r[1380]++; if(dbg){print "R1380"}; continue};
 if ( (prl_edmuro(1)||prl_edsrro(1)||mest_vi(1)||mest_ro(1)) &&
       (suw_edmuro(2)||suw_edsrro(2)||pre_any(2)) && s(0,1) )
 { l[i]=omo1; r[1381]++; if(dbg){print "R1381"}; continue};
 if ( (prl_edmuro(1)||prl_edsrro(1)||mest_vi(1)||mest_ro(1)) && s(0,0) && p(1) && Q_(1,swo_edmu_ro) )
 { l[i]=omo1; r[1381]++; if(dbg){print "R1381"}; continue};
 #
 if ( mest_vi(1) && s(0,0) )
 { l[i]=omo2; r[1382]++; if(dbg){print "R1382"}; continue};
 if ( pre_ro(-2) && W(-2,"с") &&
      (mest_ro(-1)) && s(-2,-1) && !((suw_edro(1)||suw_mnro(1)) && s(0,0)) )
 { l[i]=omo2; r[1383]++; if(dbg){print "R1383"}; continue};
 if ( pre_ro(-1) &&
      (q_(1,swn_edmu_ro)||q_(1,swn_edsr_ro)||mest_ro(1)) && s(-1,0) )
 { l[i]=omo1; r[1384]++; if(dbg){print "R1384"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2274 !_#_!
 #  x2274 samoe1_ samoe2_     самое  са́мое  самоё
for(wrd in omap["x2274"]){omakevars(x2274,"x2274");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer
### x2275 !_#_!
 #  x2275 samoy1_ samoy2_     самой  са́мой  само́й
for(wrd in omap["x2275"]){omakevars(x2275,"x2275");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"себе себя ей") && s(0,0) )
 { l[i]=omo2; r[1385]++; if(dbg){print "R1385"}; continue};
 if ( w(-1,"по и") &&
       w(1,"своей твоей его её их нашей вашей") &&
       (suw_edzeda(2)||suw_edzero(2)||suw_edzetv(2)||suw_edzepr(2)) && s(-1,1) )
 { l[i]=omo2; r[1386]++; if(dbg){print "R1386"}; continue};
 #
 if ( (prl_edzeda(1)||prl_edzero(1)||prl_edzetv(1)) && sc(1,",") && s(0,0) &&
       w(2,"самой") &&
       (prl_edzeda(3)||prl_edzero(3)||prl_edzetv(3)) && s(2,3) )
 { l[i]=omo1; r[1387]++; if(dbg){print "R1387"}; continue};
 if ( (prl_edzeda(1)||prl_edzero(1)||prl_edzetv(1)) &&
       (suw_edzeda(2)||suw_edzero(2)||suw_edzetv(2)||suw_edzepr(2)||pre_any(2)) && s(0,1) )
 { l[i]=omo1; r[1388]++; if(dbg){print "R1388"}; continue};
 #
 if ( (muk_edzeda(-2)||muk_edzero(-2)||muk_edzetv(-2)||muk_edzepr(-2)) &&
        w(-1,"же") && s(-2,-1) )
 { l[i]=omo1; r[1389]++; if(dbg){print "R1389"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer
### x2276 !_#_!
 #  x2276 samom1_ samom2_     самом  са́мом  само́м
for(wrd in omap["x2276"]){omakevars(x2276,"x2276");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"себе мне нём тебе") && s(-1,-1) )
 { l[i]=omo2; r[1390]++; if(dbg){print "R1390"}; continue};
 if ( (w(1,"себе мне нём тебе")||muk_edmupr(1)) && s(0,0) )
 { l[i]=omo2; r[1390]++; if(dbg){print "R1390"}; continue};
 if ( muk_edmupr(-1) && s(-1,-1) )
 { l[i]=omo1; r[1390]++; if(dbg){print "R1390"}; continue};
 #
 if ( (prl_edmupr(1)||prl_edsrpr(1)) && sc(1,",") && s(0,0) &&
       w(2,"самом") &&
       (prl_edmupr(3)||prl_edsrpr(3)) && s(2,3) )
 { l[i]=omo1; r[1391]++; if(dbg){print "R1391"}; continue};
 if ( (prl_edmupr(1)||prl_edsrpr(1)||mest_vi(1)||mest_pr(1)) &&
       (suw_edmupr(2)||suw_edsrpr(2)||pre_any(2)) && s(0,1) )
 { l[i]=omo1; r[1392]++; if(dbg){print "R1392"}; continue};

 # индивидуальные слова
 cst = "верху виду деле зените конце краю начале низу носу разгаре расцвете сердце центре"
 if ( pre_pr(-1) &&
       w(1,cst) &&
        s(-1,0) )
 { l[i]=omo1; r[1390]++; if(dbg){print "R1390"}; continue};
 if ( pre_pr(-1) && s(-1,-1) &&
     ((w(1,"ли же") && s(0,1))||(w(1,"то") && se(0,"-") && s(1,1))) &&
        w(2,cst) )
 { l[i]=omo1; r[1390]++; if(dbg){print "R1390"}; continue};

 cst = "сигнале действии городе принципе путешествии селении селе смысле человечестве народе корабле шаттле"
 if ( pre_pr(-1) &&
       w(1,cst) &&
        s(0,0) )
 { l[i]=omo2; r[1390]++; if(dbg){print "R1390"}; continue};
 

 #
 if ( pre_pr(-1) &&
      (q_(1,swn_edmu_pr)||q_(1,swn_edsr_pr)) && s(-1,0) )
 { l[i]=omo1; r[1393]++; if(dbg){print "R1393"}; continue};
 #
 if ( muk_edmupr(-2) &&
        w(-1,"же") && s(-2,-1) )
 { l[i]=omo1; r[1394]++; if(dbg){print "R1394"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2277 !_#_!
 #  x2277 samomu1_ samomu2_   самому  са́мому  самому́
for(wrd in omap["x2277"]){omakevars(x2277,"x2277");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( (w(1,"себе тебе мне ему")||muk_edmuda(1)) && s(0,0) )
 { l[i]=omo2; r[1395]++; if(dbg){print "R1395"}; continue};
 if ( (w(-1,"себе тебе мне ему")||muk_edmuda(-1)) &&
        suw_edda(1) && s(-1,0) )
 { l[i]=omo1; r[1396]++; if(dbg){print "R1396"}; continue};
 if ( (w(-1,"себе тебе мне ему")||muk_edmuda(-1)) && s(-1,-1) )
 { l[i]=omo2; r[1397]++; if(dbg){print "R1397"}; continue};
 #
 if ( (prl_edmuda(1)||prl_edsrda(1)) && sc(1,",") && s(0,0) &&
       w(2,"самому") &&
       (prl_edmuda(3)||prl_edsrda(3)) && s(2,3) )
 { l[i]=omo1; r[1398]++; if(dbg){print "R1398"}; continue};
 if ( (prl_edmuda(1)||prl_edsrda(1)||mest_da(1)) &&
       (suw_edmuda(2)||suw_edsrda(2)||pre_any(2)) && s(0,1) )
 { l[i]=omo1; r[1399]++; if(dbg){print "R1399"}; continue};
 #
 if ( (pre_da(-1)||preph_da(-1)) &&
      (q_(1,swn_edmu_da)||q_(1,swn_edsr_da)) && s(-1,0) )
 { l[i]=omo1; r[1400]++; if(dbg){print "R1400"}; continue};
 #
 if ( muk_edmuda(-2) &&
       w(-1,"же") && s(-2,-1) )
 { l[i]=omo1; r[1401]++; if(dbg){print "R1401"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2278 !_#_!
 #  x2278 sw_1es_r_2ez_i_   sw_mn_iv_
for(wrd in omap["x2278"]){omakevars(x2278,"x2278");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; r[1402]++; if(dbg){print "R1402"}; continue};
 #
 if ( sw_es_r_f() )
 { l[i]=omo1; r[1403]++; if(dbg){print "R1403"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1404]++; if(dbg){print "R1404"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1405]++; if(dbg){print "R1405"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2279 !_#_!
 #  x2279 m2_1nar_step_2qin_iv_  pl_kr_es_
for(wrd in omap["x2279"]){omakevars(x2279,"x2279");for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sc(0,"-") && w(1,"мал мало мальски маля помалу") )
 { l[i]=omo1; r[1406]++; if(dbg){print "R1406"}; continue};
 #
 if ( w(1,"где как какой кого кто ли того что") && s(0,0) )
 { l[i]=omo1; r[1407]++; if(dbg){print "R1407"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2280 !_#_!
 #  x2280 m2_1sw_ez_i_2deep_na_	sw_em_r_  душа  душа́  ду́ша
for(wrd in omap["x2280"]){omakevars(x2280,"x2280");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo1; r[1408]++; if(dbg){print "R1408"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[1409]++; if(dbg){print "R1409"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2281 !_#_!
 #  x2281 gl_paedze_    sw_ez_i_  жила  жила́  жи́ла
for(wrd in omap["x2281"]){omakevars(x2281,"x2281");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[1410]++; if(dbg){print "R1410"}; continue};
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; r[1411]++; if(dbg){print "R1411"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2282 !_#_!
 #  x2282 m2_1nar_mest_2souz_	prl_ems_vr_  отчего  отчего́  о́тчего
for(wrd in omap["x2282"]){omakevars(x2282,"x2282");for(y=1;y<=wln;y++)         # header1
{makebookvars_nohyphback();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( !(suw_edro(1) && s(0,0)) )
 { l[i]=omo1; r[1412]++; if(dbg){print "R1412"}; continue};
 #
 if ( w(1,"дома") && s(0,0) )
 { l[i]=omo2; r[1413]++; if(dbg){print "R1413"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2283 !_#_!
 #  x2283 m2_1sw_em_r_2nar_spos_   sw_mn_iv_  отчего  отчего́  о́тчего
for(wrd in omap["x2283"]){omakevars(x2283,"x2283");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( pre_ro(-2) &&
      (suw_edro(-1)||suw_mnro(-1)||mest_ro(-1)) && W(-1,"неё") && s(-2,-1))
 { l[i]=omo1; r[1414]++; if(dbg){print "R1414"}; continue};
 #
 if ( ( w(-1,"я мы ты вы он она оно кто")||mest_edim(-1)||q_(-1,mst_ed_mu_im)) && s(-1,-1))
 { l[i]=omo1; r[1415]++; if(dbg){print "R1415"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1416]++; if(dbg){print "R1416"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo2; r[1417]++; if(dbg){print "R1417"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo2; r[1418]++; if(dbg){print "R1418"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2284 !_#_!
 #  x2284   gl_ed1e     pl_ez_v_  целую  целу́ю  це́лую
for(wrd in omap["x2284"]){omakevars(x2284,"x2284");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"армию борозду бутылку вечность галактику горку гору группу деревню квартиру корзину кружку историю колонку колонну кучу неделю ночь пачку планету пригоршню расу свинью секунду стену страницу страну сумку тонну чашку цивилизацию эскадрилью") && s(0,0))
 { l[i]=omo2; r[1419]++; if(dbg){print "R1419"}; continue};
 #
 if ( pl_ez_v_f() )
 { l[i]=omo2; r[1420]++; if(dbg){print "R1420"}; continue};
 #
 if ( suw_mnvi(1) && s(0,0) )
 { l[i]=omo1; r[1421]++; if(dbg){print "R1421"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[1422]++; if(dbg){print "R1422"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2285 !_#_!
 #  x2285 bolshaya1_ bolshaya2_   большая  бо́льшая  больша́я
for(wrd in omap["x2285"]){omakevars(x2285,"x2285");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"значительно куда много намного несколько") && s(-1,-1) )
 { l[i]=omo1; r[1395]++; if(dbg){print "R1395"}; continue};
 if ( w(1,"часть половина") && s(0,0) )
 { l[i]=omo1; r[1395]++; if(dbg){print "R1395"}; continue};
 if ( sc(0,",") && w(1,"чем") )
 { l[i]=omo1; r[1395]++; if(dbg){print "R1395"}; continue};
 #
 if ( w(-1,"весьма довольно достаточно очень самая слишком") && s(-1,-1) )
 { l[i]=omo2; r[1395]++; if(dbg){print "R1395"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2286 !_#_!
 #  x2286 bolshie1_  bolshie2_   большие  бо́льшие  больши́е
for(wrd in omap["x2286"]){omakevars(x2286,"x2286");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"значительно куда много намного несколько") && s(-1,-1) )
 { l[i]=omo1; r[1395]++; if(dbg){print "R1395"}; continue};
 if ( w(1,"части половины") && s(0,0) )
 { l[i]=omo1; r[1395]++; if(dbg){print "R1395"}; continue};
 if ( sc(0,",") && w(1,"чем") )
 { l[i]=omo1; r[1395]++; if(dbg){print "R1395"}; continue};
 #
 if ( w(-1,"весьма довольно достаточно очень самые слишком") && s(-1,-1) )
 { l[i]=omo2; r[1395]++; if(dbg){print "R1395"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2287 !_#_!
 #  x2287 bolshim1_  bolshim2_   большим  бо́льшим  больши́м
for(wrd in omap["x2287"]){omakevars(x2287,"x2287");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"значительно куда много намного несколько") && s(-1,-1) )
 { l[i]=omo1; r[1395]++; if(dbg){print "R1395"}; continue};
 if ( w(1,"частям половинам") && s(0,0) )
 { l[i]=omo1; r[1395]++; if(dbg){print "R1395"}; continue};
 if ( sc(0,",") && w(1,"чем") )
 { l[i]=omo1; r[1395]++; if(dbg){print "R1395"}; continue};
 if ( pre_tv(-2) &&
       w(-1"чем тем ещё") &&
        (suw_edtv(1)||suw_mntv(1)) && s(-2,0) )
 { l[i]=omo1; r[1395]++; if(dbg){print "R1395"}; continue};
 #
 if ( w(-1,"весьма довольно достаточно очень самым слишком") && s(-1,-1) )
 { l[i]=omo2; r[1395]++; if(dbg){print "R1395"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2288 !_#_!
 #  x2288 bolshimi1_  bolshimi2_   большими  бо́льшими  больши́ми
for(wrd in omap["x2288"]){omakevars(x2288,"x2288");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"значительно куда много намного несколько") && s(-1,-1) )
 { l[i]=omo1; r[1395]++; if(dbg){print "R1395"}; continue};
 if ( w(1,"частями половинами") && s(0,0) )
 { l[i]=omo1; r[1395]++; if(dbg){print "R1395"}; continue};
 if ( sc(0,",") && w(1,"чем") )
 { l[i]=omo1; r[1395]++; if(dbg){print "R1395"}; continue};
 #
 if ( w(-1,"весьма довольно достаточно очень самыми слишком") && s(-1,-1) )
 { l[i]=omo2; r[1395]++; if(dbg){print "R1395"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2289 !_#_!
 #  x2289 bolshih1_  bolshih2_   больших  бо́льших  больши́х
for(wrd in omap["x2289"]){omakevars(x2289,"x2289");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"значительно куда намного") && s(-1,-1) )
 { l[i]=omo1; r[1395]++; if(dbg){print "R1395"}; continue};
 if ( w(1,"частей половин") && s(0,0) )
 { l[i]=omo1; r[1395]++; if(dbg){print "R1395"}; continue};
 if ( sc(0,",") && w(1,"чем") )
 { l[i]=omo1; r[1395]++; if(dbg){print "R1395"}; continue};
 #
 if ( w(-1,"весьма довольно достаточно очень самых слишком много несколько") && s(-1,-1) )
 { l[i]=omo2; r[1395]++; if(dbg){print "R1395"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x2290 !_#_!
 #  x2290 bolshuu1_  bolshuu2_   большую  бо́льшую  большу́ю
for(wrd in omap["x2290"]){omakevars(x2290,"x2290");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-1,"значительно куда много намного несколько") && s(-1,-1) )
 { l[i]=omo1; r[1395]++; if(dbg){print "R1395"}; continue};
 if ( w(1,"частю половину") && s(0,0) )
 { l[i]=omo1; r[1395]++; if(dbg){print "R1395"}; continue};
 if ( sc(0,",") && w(1,"чем") )
 { l[i]=omo1; r[1395]++; if(dbg){print "R1395"}; continue};
 #
 if ( w(-1,"весьма довольно достаточно очень самую слишком") && s(-1,-1) )
 { l[i]=omo2; r[1395]++; if(dbg){print "R1395"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3001 !_#_!
 #  x3001 gl_paedze_    sw_em_r_   sw_mn_iv_
for(wrd in omap["x3001"]){omakevars(x3001,"x3001");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[1423]++; if(dbg){print "R1423"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo3; r[1424]++; if(dbg){print "R1424"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo3; r[1425]++; if(dbg){print "R1425"}; continue};
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; r[1426]++; if(dbg){print "R1426"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3002 !_#_!
 #  x3002 gl_paedze_    sw_es_r_   sw_mn_iv_
for(wrd in omap["x3002"]){omakevars(x3002,"x3002");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_r_f() )
 { l[i]=omo2; r[1427]++; if(dbg){print "R1427"}; continue};
 #
 if ( sw_mn_i_f() )
 { l[i]=omo3; r[1428]++; if(dbg){print "R1428"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo3; r[1429]++; if(dbg){print "R1429"}; continue};
 #
 if ( gl_paedze_f() )
 { l[i]=omo1; r[1430]++; if(dbg){print "R1430"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3003 !_#_!
 #  x3003 nar_napr_     sw_ez_t_   sw_mn_r_
for(wrd in omap["x3003"]){omakevars(x3003,"x3003");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_ez_t_f() )
 { l[i]=omo2; r[1431]++; if(dbg){print "R1431"}; continue};
 #
 if ( sw_mn_r_f() )
 { l[i]=omo3; r[1432]++; if(dbg){print "R1432"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3004 !_#_!
 #  x3004 m2_1sw_mn_i_2deep_na_    sw_em_vr_     sw_ez_i_
for(wrd in omap["x3004"]){omakevars(x3004,"x3004");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_i_f() )
 { l[i]=omo1; r[1433]++; if(dbg){print "R1433"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[1434]++; if(dbg){print "R1434"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[1435]++; if(dbg){print "R1435"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo3; r[1436]++; if(dbg){print "R1436"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3005 !_#_!
 #  x3005 gl_ed1e_      sw_em_d_   sw_ez_v_
for(wrd in omap["x3005"]){omakevars(x3005,"x3005");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_d_f() )
 { l[i]=omo2; r[1437]++; if(dbg){print "R1437"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo3; r[1438]++; if(dbg){print "R1438"}; continue};
 #
 if ( gl_ed1e_f() )
 { l[i]=omo1; r[1439]++; if(dbg){print "R1439"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3006 !_#_!
 #  x3006 pl_es_iv_     sw_es_iv_  sw_es_p_
for(wrd in omap["x3006"]){omakevars(x3006,"x3006");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_es_i_f() )
 { l[i]=omo2; r[1440]++; if(dbg){print "R1440"}; continue};
 #
 if ( sw_es_v_f() )
 { l[i]=omo2; r[1441]++; if(dbg){print "R1441"}; continue};
 #
 if ( sw_es_p_f() )
 { l[i]=omo3; r[1442]++; if(dbg){print "R1442"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3007 !_#_!
 #  x3007 sw_em_r_      sw_ez_i_   sw_mn_v_
for(wrd in omap["x3007"]){omakevars(x3007,"x3007");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_r_f() )
 { l[i]=omo1; r[1443]++; if(dbg){print "R1443"}; continue};
 #
 if ( sw_ez_i_f() )
 { l[i]=omo2; r[1444]++; if(dbg){print "R1444"}; continue};
 #
 if ( sw_mn_v_f() )
 { l[i]=omo3; r[1445]++; if(dbg){print "R1445"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3008 !_#_!
 #  x3008 sw_em_l_    sw_em_r_     sw_ez_v_
for(wrd in omap["x3008"]){omakevars(x3008,"x3008");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_l_f() )
 { l[i]=omo1; r[1446]++; if(dbg){print "R1446"}; continue};
 #
 if ( sw_em_r_f() )
 { l[i]=omo2; r[1447]++; if(dbg){print "R1447"}; continue};
 #
 if ( sw_ez_v_f() )
 { l[i]=omo3; r[1448]++; if(dbg){print "R1448"}; continue};
 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3009 !_#_!
 #  x3009 gl_ed3e_      sw_em_iv_  sw_mn_r_
for(wrd in omap["x3009"]){omakevars(x3009,"x3009");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_mn_r_f() )
 { l[i]=omo3; r[1449]++; if(dbg){print "R1449"}; continue};
 #
 if ( sw_em_i_f() )
 { l[i]=omo2; r[1450]++; if(dbg){print "R1450"}; continue};
 #
 if ( sw_em_v_f() )
 { l[i]=omo2; r[1451]++; if(dbg){print "R1451"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3010 !_#_!
 #  x3010 gl_mn2e_      sw_em_p_   sw_ez_dp_
for(wrd in omap["x3010"]){omakevars(x3010,"x3010");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( sw_em_p_f() )
 { l[i]=omo2; r[1452]++; if(dbg){print "R1452"}; continue};
 #
 if ( sw_ez_d_f() )
 { l[i]=omo3; r[1453]++; if(dbg){print "R1453"}; continue};
 #
 if ( sw_ez_p_f() )
 { l[i]=omo3; r[1454]++; if(dbg){print "R1454"}; continue};
 #
 if ( gl_mn2e_f() )
 { l[i]=omo1; r[1455]++; if(dbg){print "R1455"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x3011 !_#_!
 #  x3011 heal_1bud_2pov_  gl_pomn_ gl_mn2e_  выходите  вы́ходите  выходи́те  выхо́дите
for(wrd in omap["x3011"]){omakevars(x3011,"x3011");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4700 !_#_!
 #  x4700 cost_         stand_     стОит   стоИт
for(wrd in omap["x4700"]){omakevars(x4700,"x4700");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(1,"того") && sc(1,",") &&
       w(2,"чтобы") )
 { l[i]=omo1; r[1456]++; if(dbg){print "R1456"}; continue};
 #
 if ( (phs(-1,"один другого")||
       phs(-1,"мало что")||
       phs(-1,"ничего не")||
       phs(-1,"друг друга") ) && s(hsn,-1) )
 { l[i]=omo1; r[1457]++; if(dbg){print "R1457"}; continue};
 #
 if ( (phf(1,"один другого")||
       phf(1,"мало что")||
       phf(1,"ничего не")||
       phf(1,"друг друга") ) && s(0,hfn-1) )
 { l[i]=omo1; r[1458]++; if(dbg){print "R1458"}; continue};
 #
 if ( w(1,"дёшево денег дорого недорого немало мало") && s(0,0) )
 { l[i]=omo1; r[1459]++; if(dbg){print "R1459"}; continue};
 #
 if ( w(-1,"дёшево денег дорого недорого немало мало") && s(-1,-1) )
 { l[i]=omo1; r[1460]++; if(dbg){print "R1460"}; continue};
 #
 if ( qb(-5,"gl_in") && s(qbn,-1) )
 { l[i]=omo1; r[1461]++; if(dbg){print "R1461"}; continue};
 #
 if ( qf(5,"gl_in") && s(0,qfn-1) )
 { l[i]=omo1; r[1462]++; if(dbg){print "R1462"}; continue};
 #
 if ( (nar_mest(1)||nar_spos(1)) && s(1,1) )
 { l[i]=omo2; r[1463]++; if(dbg){print "R1463"}; continue};
 #
 if ( pre_ro(1) &&
      (suw_edro(2)||suw_mnro(2)||prl_edro(2)||prl_mnro(2)||prq_edro(2)||prq_mnro(2)||mest_ro(2)) && s(0,1) )
 { l[i]=omo2; r[1464]++; if(dbg){print "R1464"}; continue};
 #
 if ( pre_pr(1) &&
      (suw_edpr(2)||suw_mnpr(2)||prl_edpr(2)||prl_mnpr(2)||prq_edpr(2)||prq_mnpr(2)||mest_pr(2)) && s(0,1) )
 { l[i]=omo2; r[1465]++; if(dbg){print "R1465"}; continue};
 #
 if ( pre_tv(1) &&
      (suw_edtv(2)||suw_mntv(2)||prl_edtv(2)||prl_mntv(2)||prq_edtv(2)||prq_mntv(2)||mest_tv(2)) && s(0,1) )
 { l[i]=omo2; r[1466]++; if(dbg){print "R1466"}; continue};
 #
 if ( (nar_spos(1)||nar_kaq(1)) && s(0,1) )
 { l[i]=omo2; r[1467]++; if(dbg){print "R1467"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4701 !_#_!
 #  x4701 comeout_    heal_    выходить  выходи́ть  вы́ходить
for(wrd in omap["x4701"]){omakevars(x4701,"x4701");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( (pre_vi(1)||preph_vi(1)) &&
       (suw_edvi(2)||suw_mnvi(2)||prl_edvi(2)||prl_mnvi(2)||prq_edvi(2)||prq_mnvi(2)||mest_vi(2)) && s(0,1) )
 { l[i]=omo1; r[1468]++; if(dbg){print "R1468"}; continue};
 if ( (pre_ro(1)||preph_ro(1)) &&
       (suw_edro(2)||suw_mnro(2)||prl_edro(2)||prl_mnro(2)||prq_edro(2)||prq_mnro(2)||mest_ro(2)) && s(0,1) )
 { l[i]=omo1; r[1469]++; if(dbg){print "R1469"}; continue};
 if ( (pre_da(1)||preph_da(1)) &&
       (suw_edda(2)||suw_mnda(2)||prl_edda(2)||prl_mnda(2)||prq_edda(2)||prq_mnda(2)||mest_da(2)) && s(0,1) )
 { l[i]=omo1; r[1470]++; if(dbg){print "R1470"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4702 !_#_!
 #  x4702 know_    lead_    введение  ве́дение  веде́ние
for(wrd in omap["x4702"]){omakevars(x4702,"x4702");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 if ( w(-2,"в") &&
      (mest_vi(-1)||mest_pr(-1)) &&
        (suw_edvi(0)||suw_mnvi(0)||suw_edpr(0)||suw_mnpr(0)) &&
	  (suw_edro(1)||suw_mnro(1)) &&
	   (wc(2,"^наход[ия] ^переда")||w(2,"был была были было")) && s(-2,1) )
 { l[i]=omo1; r[1471]++; if(dbg){print "R1471"}; continue};
 if ( w(-2,"в") &&
      (mest_vi(-1)||mest_pr(-1)) &&
        (suw_edvi(0)||suw_mnvi(0)||suw_edpr(0)||suw_mnpr(0)) &&
	   (wc(1,"^наход[ия] ^переда")||w(1,"был была были было")) && s(-2,0) )
 { l[i]=omo1; r[1472]++; if(dbg){print "R1472"}; continue};
 #
 if ( prl_kred_sr(1) &&
      (prl_edro(2)||prl_mnro(2)||prq_edro(2)||prq_mnro(2)||mest_ro(2)) &&
       (prl_edro(3)||prl_mnro(3)||prq_edro(3)||prq_mnro(3)||mest_ro(3)||suw_edro(3)||suw_mnro(3)) && s(0,2) )
 { l[i]=omo2; r[1473]++; if(dbg){print "R1473"}; continue};
 if ( (prl_edro(1)||prl_mnro(1)||prq_edro(1)||prq_mnro(1)||mest_ro(1)) &&
       (suw_edro(2)||suw_mnro(2)) && s(0,1) )
 { l[i]=omo2; r[1474]++; if(dbg){print "R1474"}; continue};
 if ( (suw_edro(1)||suw_mnro(1)) && s(0,0) )
 { l[i]=omo2; r[1475]++; if(dbg){print "R1475"}; continue};

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer

### x4777 !_#_!
 #  x4777 forced_       none_
for(wrd in omap["x4777"]){omakevars(x4777,"x4777");for(y=1;y<=wln;y++)         # header1
{makebookvars();for(i in wpos){makewposvars();if(tolower(l[i])!=iwrd)continue; # header2
 #
 l[i]=omo1; r[1476]++; if(dbg){print "R1476"}; continue;

 }; delete wpos; book[b]=joinpat(l,sep,nf) };};                                ##_footer


### THE_x_END !_#_!

# вывести изменённую строку

for (i in book) { print book[i] }

#dbg = 1
#dbgstat = 1;
#cmd = "rm _stat.txt _yo.txt _vsez.txt"
#if (dbgstat==1) {system(cmd); for (i=1; i<=1476; i++) { printf ("%s%s %s %s\n", "R", i, "=", r[i]) >> "_stat.txt"};
#for (i in prevyo) {print i, prevyo[i] >> "_yo.txt"}
#for (i in vsez) { print i, vsez[i] >> "_vsez.txt" }
#                }
  }
###_END_###
