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
@include "scriptdb/classes.awk"

BEGIN {
      PROCINFO["sorted_in"]="@ind_num_asc"

   # dbg = 1
   # dbgstat = 1

    unxy    = "[\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
    unxn    = "[^\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
    RUUC    = "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ]+"
    rulc    = "[абвгдеёжзийклмнопрстуфхцчшщъыьэюя]+"
    patword = "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb00-9]+"
    regword = "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
    fsword  = "[^АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
    vvpat   = "[,—]"
    hysnip  = regword "[-]" regword

    # массивы для разных целей

    # расширенное "это"
    cst = "это то се сие оно сё";
        stoar(cst,mst_it," ");
    # слова с признаками модальности
    cst = "готово можно надо нужно должно нельзя могло смогло было стало хотело желало стало";
        stoar(cst,md_bz," ");
    cst = "будет буду был была готов готова мог могла может можешь смог смогла сможет хотел хотела захотел захотела хотел хотела должен должна желал желала стал стала станет";
        stoar(cst,md_ed," ");
    cst = "готовы могут можете будут будем смогли сможете хотят хотите хотели захотят захотели могли хотели должны желали стали станут просим";
        stoar(cst,md_mn," ");

    cst = "все";
        stoar(cst,vsez," ");

   savefs = FS;
   FS = fsword;
} {
    num++; book[num] = $0;

    for (i=1; i<=NF; i++) { ci=tolower($i);

        if(ci in vsez && num!=prevnum) {vsez["все"]=vsez["все"] " " num;prevnum=num}; #_#_#vsez "все" не делим по регистрам

  };

} END {
FS = savefs
###START_END##

### все !_#_!
for(wrd in vsez){wln=split(vsez[wrd],omlin," "); for(y=1;y<=wln;y++){b=strtonum(omlin[y]); # header1
nf=splitline(book[b]); hyphback(book[b]); getwpos(wrd); for(i in wpos){i=strtonum(i);     # header2
    
 #v всё же
 if ( w(-1,"не") &&
       w(1,"же ж") &&
       (suw_mnim(2)||gl_vzmn(2)) && s(-1,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[1]++; if(dbg){print "R1"}; continue;};
 if ( w(1,"же ж") &&
       mest_it(2) &&
        gl_pnmn(3) && s(0,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[2]++; if(dbg){print "R2"}; continue;};
 if ( s(0,0) && w(1,"же ж равно едино одно") )
 { sub(/[Ее]/, "ё", l[i]); r[3]++; if(dbg){print "R3"}; continue;};

 # География
 if ( (geo_sr(1)||wc(1,"([ео]во|[иы]но)$")) && s(0,0) && cap(1) )
 { sub(/[Ее]/, "ё", l[i]); r[4]++; if(dbg){print "R4"}; continue;};
 if ( geo_mn(1) && s(0,0) && cap(1) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[5]++; if(dbg){print "R5"}; continue;};


 #v всё в (порядке)
 if ( w(1,"ли уже ведь") &&
       nar_mest(2) &&
        w(3,"в") &&
         w(4,"порядке норме ажуре шоколаде исправности") && s(0,3) && (p(4)||w(5,"и с")||gl_edsr(5)) )
 { sub(/[Ее]/, "ё", l[i]); r[6]++; if(dbg){print "R6"}; continue;};
 if ( w(1,"ли уже ведь") &&
       w(2,"в") &&
        w(3,"порядке норме ажуре шоколаде исправности") && s(0,2) && (p(3)||w(4,"и с")||gl_edsr(4)) )
 { sub(/[Ее]/, "ё", l[i]); r[7]++; if(dbg){print "R7"}; continue;};
 if ( (phf(1,"как будто")||phf(1,"вроде бы")) &&
        w(hfn,"в") &&
         w(hfn+1,"порядке норме ажуре шоколаде исправности") && s(0,hfn) && (p(hfn+1)||w(hfn+2,"и с")||gl_edsr(hfn+2)) )
 { sub(/[ее]/, "ё", l[i]); r[8]++; if(dbg){print "R8"}; continue;};
 if ( (qast(1)||nar_mest(1)) &&
        w(2,"в") &&
         w(3,"порядке норме ажуре шоколаде исправности") && s(0,2) && (p(3)||w(4,"и с")||gl_edsr(4)) )
 { sub(/[ее]/, "ё", l[i]); r[9]++; if(dbg){print "R9"}; continue;};
 if ( w(1,"в") &&
      (prl_edpr(2)||prq_edpr(2)) &&
        w(3,"порядке порядок норме норму ажуре шоколаде исправности") && s(0,2) && (p(3)||w(4,"и с")||gl_edsr(4)) )
 { sub(/[Ее]/, "ё", l[i]); r[10]++; if(dbg){print "R10"}; continue;};
 if ( w(1,"в") &&
       w(2,"порядке порядок норме норму ажуре шоколаде целом исправности") && s(0,1) && (p(2)||w(3,"и с")||gl_edsr(3)) )
 { sub(/[Ее]/, "ё", l[i]); r[11]++; if(dbg){print "R11"}; continue;};
 if ( qast(1) &&
       w(2,"на") &&
        w(3,"мази") && s(0,2) && (p(3)||w(4,"и")) )
 { sub(/[Ее]/, "ё", l[i]); r[12]++; if(dbg){print "R12"}; continue;};
 if ( w(1,"на") &&
       w(2,"мази") && s(0,1) && (p(2)||w(3,"и")) )
 { sub(/[Ее]/, "ё", l[i]); r[13]++; if(dbg){print "R13"}; continue;};

 # все все
 if ( w(1,"все") &&
      (gl_pemn(2)||gl_pnmn(2)||gl_nemn(2)) && s(0,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); sub(/[Ее]/, "ё", l[i+1]); r[14]++; if(dbg){print "R14"}; continue;};

 #v всё ещё
 if ( w(1,"ещё еще") && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); r[15]++; if(dbg){print "R15"}; continue;};

 #v всё ещё
 if ( w(1,"и") &&
       w(2,"вся") && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[16]++; if(dbg){print "R16"}; continue;};
 if ( w(1,"и") &&
       w(2,"всяческие") && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[17]++; if(dbg){print "R17"}; continue;};

 #v всё так и
 if ( phf(1,"так и") &&
      (gl_edsr(3)||w(3,"есть")) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[18]++; if(dbg){print "R18"}; continue;};
 if ( phf(1,"так и") &&
      (gl_nemn(3)||gl_pemn(3)||gl_pnmn(3)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[19]++; if(dbg){print "R19"}; continue;};
 if ( phs(-1,"и так") && Q(-3,"mest_mn") &&
      (gl_nemn(1)||gl_pemn(1)||gl_pnmn(1)) && s(-2,0) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[20]++; if(dbg){print "R20"}; continue;};
 if ( phf(1,"и так") &&
      (gl_ed(3)||w(3,"есть")) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[21]++; if(dbg){print "R21"}; continue;};


 # фразы

 if ( phf(1,"бы ничего") && sc(2,",") && s(0,1) &&
       w(3,"только но да однако") )
 { sub(/[Ее]/, "ё", l[i]); r[22]++; if(dbg){print "R22"}; continue;};
 if ( w(-1,"на") && (phf(1,"про все")||phf(1,"про всё")) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[23]++; if(dbg){print "R23"}; continue;};
 if ( (phs(-1,"на всё про")||phs(-1,"на все про")) && s(-3,-1) )
 { sub(/[Ее]/, "ё", l[i]); r[24]++; if(dbg){print "R24"}; continue;};
 if ( phf(1,"не слава богу") && s(0,hfn-2) )
 { sub(/[Ее]/, "ё", l[i]); r[25]++; if(dbg){print "R25"}; continue;};
 if ( phf(1,"одно и то же") && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); r[26]++; if(dbg){print "R26"}; continue;};
 if ( phf(1,"потому что") && s(0,0) && sc(1,",") )
 { sub(/[Ее]/, "ё", l[i]); r[27]++; if(dbg){print "R27"}; continue;};
 if ( phf(1,"тип топ") && s(0,0) && se(1,"-") )
 { sub(/[Ее]/, "ё", l[i]); r[28]++; if(dbg){print "R28"}; continue;};
 if ( phs(-1,"ну вот и") && s(-3,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); r[29]++; if(dbg){print "R29"}; continue;};
 if ( phs(-1,"вот и") && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); r[30]++; if(dbg){print "R30"}; continue;};
 if ( phf(1,"раз и навсегда") && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[31]++; if(dbg){print "R31"}; continue;};
 if ( phf(1,"точно так") && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[32]++; if(dbg){print "R32"}; continue;};
 if ( phf(1,"или ничего") && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[33]++; if(dbg){print "R33"}; continue;};
 if ( phf(1,"под богом ходим") && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[34]++; if(dbg){print "R34"}; continue;};
 if ( phf(1,"и дело") && s(0,1) )
 { sub(/([Ее])/, "ё", l[i]); r[35]++; if(dbg){print "R35"}; continue;};
 if ( phf(1,"за и против") && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[36]++; if(dbg){print "R36"}; continue;};
 if ( phf(1,"только и") &&
       (gl_pnmn(3)||gl_pemn(3)||gl_nemn(3)) &&
         w(4,"что") && s(0,2) && sc(3,",") )
 { sub(/([Ее])/, "<_&_>", l[i]); r[37]++; if(dbg){print "R37"}; continue;};
 if ( w(1,"как") &&
       w(2,"один одна") && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[38]++; if(dbg){print "R38"}; continue;};
 if ( phf(1,"это само по себе") && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); r[39]++; if(dbg){print "R39"}; continue;};
 if ( phf(1,"не так уж") &&
       prl_kred_sr(4) && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); r[40]++; if(dbg){print "R40"}; continue;};
 if ( phf(1,"так уж") &&
       prl_kred_sr(hfn) && s(0,hfn-1) )
 { sub(/[Ее]/, "ё", l[i]); r[41]++; if(dbg){print "R41"}; continue;};
 if ( phf(1,"не так уж") &&
       w(4,"и") &&
        prl_kred_sr(5) && s(0,4) )
 { sub(/[Ее]/, "ё", l[i]); r[42]++; if(dbg){print "R42"}; continue;};
 if ( phf(1,"не так") && p(2) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[43]++; if(dbg){print "R43"}; continue;};
 if ( phf(1,"совсем не так") && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[44]++; if(dbg){print "R44"}; continue;};
 if ( w(-1,"и") && p(0,",") && s(-1,-1) && (w(-2,"p")||p(-2)) )
 { sub(/[Ее]/, "ё", l[i]); r[45]++; if(dbg){print "R45"}; continue;};
 if ( phf(1,"в том же") && w(4,"роде духе разрезе виде смысле") && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); r[46]++; if(dbg){print "R46"}; continue;};
 if ( phf(1,"в таком") && w(3,"роде духе разрезе виде смысле") && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[47]++; if(dbg){print "R47"}; continue;};
 if ( phs(-1,"всё равно") &&
       gl_pnmn(1) &&
       (mest_ed(2)||mest_mn(2)) && s(-1,0) && sc(1,",") )
 { sub(/([Ее])/, "<_&_>", l[i]); r[48]++; if(dbg){print "R48"}; continue;};
 if ( phf(1,"больше по") &&
      (suw_edda(3)||suw_mnda(3)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[49]++; if(dbg){print "R49"}; continue;};

 if ( (phf(1,"песенка спета")) &&
       (cap(0)||p(-1)||w(-1,"и")) && sc(0,",") && s(1,hfn-2) && p(hfn-1) )
 { sub(/[Ее]/, "ё", l[i]); r[50]++; if(dbg){print "R50"}; continue;};

 if ( w(1,"позади понапрасну") && s(0,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[51]++; if(dbg){print "R51"}; continue;};
  if ( wf(5,"до") &&
       w(wfn+1,"одного единого") && s(0,wfn) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[52]++; if(dbg){print "R52"}; continue;};

 if ( w(-1,"и") && s(-1,-1) && p(0,",") )
 { sub(/[Ее]/, "ё", l[i]); r[53]++; if(dbg){print "R53"}; continue;};
 if ( w(-1,"и") && s(-1,-1) &&
       w(2,"что") && sc(0,0,",") )
 { sub(/[Ее]/, "ё", l[i]); r[54]++; if(dbg){print "R54"}; continue;};

 # Это

 # все + сущ.мн.
 if ( mest_it(1) &&
      (gl_vzmn(2)||gl_nemn(2)||mod_bz(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[55]++; if(dbg){print "R55"}; continue;};
 if ( mest_it(-4) &&
       phs(-1,"ещё далеко не") && s(-4,-1) )
 { sub(/[Ее]/, "ё", l[i]); r[56]++; if(dbg){print "R56"}; continue;};
 if ( mest_it(-3) &&
       phs(-1,"ещё не") && s(-3,-1) )
 { sub(/[Ее]/, "ё", l[i]); r[57]++; if(dbg){print "R57"}; continue;};
 if ( mest_it(1) &&
       phf(2,"не более чем") && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); r[58]++; if(dbg){print "R58"}; continue;};
 if ( mest_it(-3) &&
       phs(-1,"далеко не") && s(-3,-1) )
 { sub(/[Ее]/, "ё", l[i]); r[59]++; if(dbg){print "R59"}; continue;};
 if ( mest_it(1) &&
       phf(2,"не в счёт") && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); r[60]++; if(dbg){print "R60"}; continue;};
 if ( mest_it(1) &&
       phf(2,"и в самом деле") &&
        nar_step(6) &&
         prl_kred_sr(7) && s(0,6) )
 { sub(/[Ее]/, "ё", l[i]); r[61]++; if(dbg){print "R61"}; continue;};
 if ( mest_it(1) &&
       w(2,"никак") &&
        w(3,"не") &&
         gl_in(4) && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); r[62]++; if(dbg){print "R62"}; continue;};
 if ( mest_it(-1) &&
       suw_mnim(1) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[63]++; if(dbg){print "R63"}; continue;};
 if ( mest_it(-1) &&
       suw_mnim(1) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); r[64]++; if(dbg){print "R64"}; continue;};
 if ( mest_it(1) &&
       mest_im(2) &&
        mest_da(3) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[65]++; if(dbg){print "R65"}; continue;};
 if ( mest_it(1) &&
       mest_da(2) &&
       (nar_vrem(3)||nar_step(3)) &&
         prl_kred_sr(4) && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); r[66]++; if(dbg){print "R66"}; continue;};
 if ( mest_it(1) &&
       mest_da(2) &&
       (nar_vrem(3)||nar_step(3)) &&
         w(4,"не") &&
          gl_ed(5) && s(0,4) )
 { sub(/[Ее]/, "ё", l[i]); r[67]++; if(dbg){print "R67"}; continue;};
 if ( mest_it(1) &&
       mest_da(2) &&
        prl_kred_sr(3) && s(0,2) && p(3) )
 { sub(/[Ее]/, "ё", l[i]); r[68]++; if(dbg){print "R68"}; continue;};
 if ( mest_da(-1) &&
       mest_it(1) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); r[69]++; if(dbg){print "R69"}; continue;};
 if ( nar_vopr(-2) &&
       mest_it(-1) && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); r[70]++; if(dbg){print "R70"}; continue;};
 if ( mest_it(-1) &&
       suw_edim(1) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); r[71]++; if(dbg){print "R71"}; continue;};
 if ( (pre_vi(-1)||pre_ro(-1)||pre_da(-1)) &&
       gl_nemn(1) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); r[72]++; if(dbg){print "R72"}; continue;};
 if ( (pre_vi(-1)||pre_ro(-1)||pre_da(-1)) &&
       mest_it(1) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); r[73]++; if(dbg){print "R73"}; continue;};
 if ( mest_it(1) &&
       suw_edim(2) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[74]++; if(dbg){print "R74"}; continue;};
 if ( qast(1) &&
       mest_it(2) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[75]++; if(dbg){print "R75"}; continue;};
 if ( mest_it(1) &&
       suw_mnim(2) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[76]++; if(dbg){print "R76"}; continue;};
 if ( mest_it(1) &&
      (nar_kaq(2)||nar_spos(2)||mest_ed(2)) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[77]++; if(dbg){print "R77"}; continue;};
 if ( mest_it(1) &&
       pre_ro(2) &&
       (mest_ro(3)||suw_edro(3)||suw_mnro(3)) && s(0,2) && p(3) )
 { sub(/[Ее]/, "ё", l[i]); r[78]++; if(dbg){print "R78"}; continue;};
 if ( mest_it(-1) &&
       pre_da(1) &&
       (mest_da(2)||suw_edda(2)||suw_mnda(2)||prl_edda(2)||prl_mnda(2)) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[79]++; if(dbg){print "R79"}; continue;};
 if ( mest_it(-1) &&
       pre_ro(1) &&
       (mest_ro(2)||suw_edro(2)||suw_mnro(2)) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[80]++; if(dbg){print "R80"}; continue;};
 if ( mest_it(1) &&
       qast(2) &&
        pre_ro(3) &&
        (mest_ro(4)||suw_edro(4)||suw_mnro(4)) && s(0,3) && p(4) )
 { sub(/[Ее]/, "ё", l[i]); r[81]++; if(dbg){print "R81"}; continue;};
 if ( mest_it(-1) &&
       mest_da(1) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[82]++; if(dbg){print "R82"}; continue;};
 if ( mest_it(1) &&
       nar_vrem(2) &&
       (gl_pnmn(3)||gl_pemn(3)) &&
        (suw_mnvi(4)||prl_mnim(4)) && s(0,3) )
 { sub(/([Ее])/, "ё", l[i]); r[83]++; if(dbg){print "R83"}; continue;};
 if ( mest_mn(-1) &&
       mest_it(1) &&
        (gl_pemn(2)||gl_pnmn(2)) && s(-1,1) && p(2))
 { sub(/[Ее]/, "ё", l[i]); r[84]++; if(dbg){print "R84"}; continue;};
 if ( mest_mn(1) &&
       mest_it(2) &&
       (gl_pnmn(3)||gl_nemn(3)) && s(0,2) && p(3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[85]++; if(dbg){print "R85"}; continue;};
 if ( mest_it(1) &&
       mest_mnim(2) &&
       (gl_pnmn(3)||gl_nemn(3)) &&
         pre_any(4) && s(0,4) )
 { sub(/([Ее])/, "ё", l[i]); r[86]++; if(dbg){print "R86"}; continue;};
 if ( mest_it(-1) &&
       mest_ed(1) &&
        gl_ed(2) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[87]++; if(dbg){print "R87"}; continue;};
 if ( mest_it(-1) &&
       mest_mn(1) &&
       (gl_pnmn(2)||gl_nemn(2)) && s(-1,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[88]++; if(dbg){print "R88"}; continue;};
 if ( gl_nemn(-1) &&
       mest_it(1) &&
        gl_in(2) && s(-1,1) )
 { sub(/([Ее])/, "ё", l[i]); r[89]++; if(dbg){print "R89"}; continue;};
 if ( mest_it(1) && !(qf(5,"gl_pemn")||qf(5,"gl_pnmn")||qf(5,"gl_in")) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); r[90]++; if(dbg){print "R90"}; continue;};
 if ( mest_it(-2) && 
      w(-1,"не") && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); r[91]++; if(dbg){print "R91"}; continue;};
 if ( mest_it(1) &&
      (gl_ed(2)||gl_in(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[92]++; if(dbg){print "R92"}; continue;};
 if ( (vvod(-2)||gl_ed(-2)) &&
        mest_it(-1) && sc(-2,",") && s(-1,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); r[93]++; if(dbg){print "R93"}; continue;};


 # Все как и
 if ( phs(-1,"как и") && s(-2,0) &&
       mest_mn(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[94]++; if(dbg){print "R94"}; continue;};
 if ( phs(-2,"как и") && s(-3,-1) &&
       mest_mn(-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[95]++; if(dbg){print "R95"}; continue;};
 if ( phs(-1,"как и") &&
       (mest_im(1)||prl_mnim(1)) && s(-2,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[96]++; if(dbg){print "R96"}; continue;};
 if ( phs(-1,"как и") &&
       pre_ro(1) &&
        mest_ro(2) && s(-2,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[97]++; if(dbg){print "R97"}; continue;};

 # как все
 if ( (gl_in(-2)||prl_edim(-2)||prl_mnim(-2)||prl_edtv(-2)||prl_mntv(-2)) &&
        w(-1,"как") && s(-1,-1) && sc(-2,",") && p(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[98]++; if(dbg){print "R98"}; continue;};
 if ( gl_in(-2) &&
        w(-1,"как") && s(-2,-1) && p(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[99]++; if(dbg){print "R99"}; continue;};
 if ( mod_ed(-2) && sc(-2,",") &&
        w(-1,"как") && s(-2,-1) && p(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[100]++; if(dbg){print "R100"}; continue;};
 if ( w(1,"как") &&
       w(2,"будто") &&
        gl_edsr(3) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[101]++; if(dbg){print "R101"}; continue;};
 if ( w(1,"как") &&
       mod_bz(2) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[102]++; if(dbg){print "R102"}; continue;};

 # все как
 if ( w(1,"как") &&
       w(2,"надо нужно есть было") && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[103]++; if(dbg){print "R103"}; continue;};
 if ( w(1,"как") &&
      (nar_mest(2)||nar_kaq(2)||nar_vrem(2)) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[104]++; if(dbg){print "R104"}; continue;};
 if ( gl_pemn(1) &&
       w(2,"как") &&
        w(3,"надо нужно есть было дома") && s(0,2) && p(3) )
 { sub(/[Ее]/, "ё", l[i]); r[105]++; if(dbg){print "R105"}; continue;};

 # Все то же
 if ( phs(-2,"вот и") &&
       mest_mnim(-1) &&
       (mest_it(1)||muk_ed(1)||muk_mn(1)) &&
         w(2,"же ж") && s(0,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[106]++; if(dbg){print "R106"}; continue;};
 if ( prl_kred_sr(1) &&
      (mest_it(2)||muk_ed(2)||muk_mn(2)) &&
        w(3,"же ж") && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[107]++; if(dbg){print "R107"}; continue;};
 if ( (mest_it(1)||muk_ed(1)||muk_mn(1)) &&
        w(2,"же ж") && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[108]++; if(dbg){print "R108"}; continue;};

 # Все то же
 if ( w(1,"вместе") && se(1," — ") &&
      (mest_mn(2)||mest_ed(2)||cap(2)) && sc(2,",") &&
       (mest_mn(3)||mest_ed(3)||cap(3)) && p(3) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[109]++; if(dbg){print "R109"}; continue;};

 #v Все + предлог
 if (!(mest_mn(-1)||mest_ed(-1)||gl_ed(-1)||gl_in(-1)||gl_vzmn(-1)||gl_nemn(-1)||gl_pemn(-1)||gl_pnmn(-1)||gl_poed(-1)||gl_pomn(-1)) &&
        pre_da(1) &&
        (suw_edda(2)||suw_mnda(2)) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); r[110]++; if(dbg){print "R110"}; continue;};
 if ( pre_da(-1) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); r[111]++; if(dbg){print "R111"}; continue;};
 if ( pre_vi(-1) &&
       w(1,"чтобы") && s(-1,-1) && sc(0,",") )
 { sub(/[Ее]/, "ё", l[i]); r[112]++; if(dbg){print "R112"}; continue;};
 if ( mest_mnim(1) && sc(0,",") &&
      (pre_ro(2)||pre_vi(2)) &&
        w(3,"кого") && s(1,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[113]++; if(dbg){print "R113"}; continue;};
 if ( (pre_ro(1)||pre_vi(1)) && sc(0,",") &&
       w(2,"кого" ) && s(1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[114]++; if(dbg){print "R114"}; continue;};
 if ( pre_ro(1) &&
       mest_ro(2) &&
        prq_edim(3) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[115]++; if(dbg){print "R115"}; continue;};
 if ( gl_in(-1) &&
       pre_ro(1) &&
       (suw_mnro(2)||suw_edro(2)||cap(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[116]++; if(dbg){print "R116"}; continue;};
 if ( (gl_poed(-1)||gl_pomn(-1)||gl_povzmn(-1)) &&
       pre_da(1) &&
       (prl_edda(2)||prl_mnda(2)||mest_da(2)) &&
        (suw_edda(3)||suw_mnda(3)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[117]++; if(dbg){print "R117"}; continue;};
 if ( (gl_poed(-1)||gl_pomn(-1)||gl_povzmn(-1)) &&
       pre_da(1) &&
       (suw_edda(2)||suw_mnda(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[118]++; if(dbg){print "R118"}; continue;};
 if ( (gl_poed(-1)||gl_pomn(-1)||gl_povzmn(-1)) &&
       pre_ro(1) &&
       (prl_edro(2)||prl_mnro(2)||mest_ro(2)) &&
        (suw_edro(3)||suw_mnro(3)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[119]++; if(dbg){print "R119"}; continue;};
 if ( (gl_poed(-1)||gl_pomn(-1)||gl_povzmn(-1)) &&
       pre_ro(1) &&
       (suw_edro(2)||suw_mnro(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[120]++; if(dbg){print "R120"}; continue;};
 if ( pre_ro(1) &&
       (suw_mnro(2)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[121]++; if(dbg){print "R121"}; continue;};
 if ( pre_ro(1) && sc(0,",") &&
       (suw_mnro(2)||cap(2)) && s(1,1) && p(2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[122]++; if(dbg){print "R122"}; continue;};
 if ( (pre_ro(-1)||pre_tv(-1)) && s(-1,-1) && p(0,",") )
 { sub(/[Ее]/, "ё", l[i]); r[123]++; if(dbg){print "R123"}; continue;};
 if ( w(1,"за") &&
       mest_vi(2) &&
        w(3,"горой") && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[124]++; if(dbg){print "R124"}; continue;};
 if ( w(-1,"со ко") && s(-1,-1) )
 { sub(/[Ее]/, "ё", l[i]); r[125]++; if(dbg){print "R125"}; continue;};
 if ( w(1,"до") &&
       w(2,"конца") && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[126]++; if(dbg){print "R126"}; continue;};
 if ( w(1,"до") &&
       w(2,"единого") && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[127]++; if(dbg){print "R127"}; continue;};
 if ( pre_pr(-3) &&
      (prl_edpr(-2)||mest_pr(-2)) &&
       (suw_edpr(-1)||suw_mnpr(-1)) && s(-3,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); r[128]++; if(dbg){print "R128"}; continue;};

 # все что
 if ( w(1,"что") &&
       gl_ed(2) )
 { sub(/[Ее]/, "ё", l[i]); r[129]++; if(dbg){print "R129"}; continue;};

 # всё, на что
 if ( sc(0,",") &&
       pre_vi(1) &&
        w(2,"что") && s(1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[130]++; if(dbg){print "R130"}; continue;};
 if ( sc(0,",") &&
       pre_vi(1) &&
        w(2,"кого") && s(1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[131]++; if(dbg){print "R131"}; continue;};
 if ( pre_vi(-1) &&
       gl_vzmn(1) &&
       (mest_im(2)||prl_edim(2)||prl_mnim(2)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[132]++; if(dbg){print "R132"}; continue;};
 if ( sc(0,",") &&
       pre_da(1) &&
        w(2,"чему") && s(1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[133]++; if(dbg){print "R133"}; continue;};
 if ( sc(0,",") &&
       pre_da(1) &&
        w(2,"кому") && s(1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[134]++; if(dbg){print "R134"}; continue;};
 if ( sc(0,",") &&
       pre_pr(1) &&
        w(2,"чём чем") && s(1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[135]++; if(dbg){print "R135"}; continue;};
 if ( sc(0,",") &&
       pre_pr(1) &&
        w(2,"ком") && s(1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[136]++; if(dbg){print "R136"}; continue;};
 if ( pre_pr(1) &&
      (mest_pr(2)||suw_edpr(2)||suw_mnpr(2)) &&
        gl_edsr(3) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[137]++; if(dbg){print "R137"}; continue;};
 if ( pre_pr(-1) &&
       nar_mest(1) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[138]++; if(dbg){print "R138"}; continue;};
 if ( pre_pr(-2) &&
      (mest_pr(-1)||suw_edtv(2)||suw_mntv(2)) && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); r[139]++; if(dbg){print "R139"}; continue;};

 # всё так же
 if ( phf(1,"так же") &&
      (prl_kred(hfn)||gl_ed(hfn)||gl_vzmn(hfn)) && s(0,hfn-1) )
 { sub(/[Ее]/, "ё", l[i]); r[140]++; if(dbg){print "R140"}; continue;};

 # предикат
 if ( predik(1) && sc(0,",") && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[141]++; if(dbg){print "R141"}; continue;};
 if ( predik(1) && sc(0,",") && s(1,1) &&
       gl_in(2) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[142]++; if(dbg){print "R142"}; continue;};
 if ( predik(1) &&
       w(2,"и") &&
        predik(3) && s(0,2) && qq(1,3) )
 { sub(/[Ее]/, "ё", l[i]); r[143]++; if(dbg){print "R143"}; continue;};

 # обращение
 if ( cap(1) && sc(0,",") && sc(1,",") &&
       nar_step(2) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[144]++; if(dbg){print "R144"}; continue;};


 # кастомные наречия
 if ( narc_napr(1,"jn") && s(0,0) && p(1) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[145]++; if(dbg){print "R145"}; continue;};


 # кастомные глаголы glc_, с возможностью учёта glc_(1,"mark) и метки m() в словаре dic_cust.gz
 if ( phf(1,"в один голос") && 
      glc_mn(hfn,"j") && s(0,hfn-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[146]++; if(dbg){print "R146"}; continue;};
 if ( glc_mn(1,"y") &&
       w(2,"и") &&
       (gl_pemn(3)||gl_nemn(3)||gl_pnmn(3)||gl_vzmn(3)) && s(0,2) )
 { sub(/([Ее])/, "ё", l[i]); r[147]++; if(dbg){print "R147"}; continue;};
 if ( prl_kred_sr(1) &&
       glc_mn(2,"y") && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[148]++; if(dbg){print "R148"}; continue;};
 if ( pre_pr(-4) &&
      (prl_edpr(-3)||prl_mnpr(-3)||mest_pr(-3)||wc(-3,"(ой$|их$)")) &&
       (suw_edpr(-2)||suw_mnpr(-2)) &&
         glc_mn(-1,"ogj") && s(-4,-1) && p(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[149]++; if(dbg){print "R149"}; continue;};
 if ( pre_pr(-3) &&
      (suw_edpr(-2)||suw_mnpr(-2)||mest_pr(-2)) &&
        glc_mn(-1,"ogj") && s(-3,-1) && p(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[150]++; if(dbg){print "R150"}; continue;};
 if ( pre_pr(-2) &&
      (suw_edpr(-1)||suw_mnpr(-1)) &&
        glc_mn(1,"ogj") && s(-2,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[151]++; if(dbg){print "R151"}; continue;};
 if ( pre_pr(1) &&
      (prl_edpr(2)||prl_mnpr(2)||mest_pr(2)||wc(2,"(ой$|их$)")) &&
       (suw_edpr(3)||suw_mnpr(3)) &&
         glc_mn(4,"ogj") && s(0,3) && p(4) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[152]++; if(dbg){print "R152"}; continue;};
 if ( pre_pr(1) &&
      (suw_edpr(2)||suw_mnpr(2)) &&
        glc_mn(3,"ogj") && s(0,2) && p(3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[153]++; if(dbg){print "R153"}; continue;};
 if ( mod_mn(1) &&
       glc_in(2,"ny") &&
        pre_any(3) && s(0,3) )
 { sub(/([Ее])/, "ё", l[i]); r[154]++; if(dbg){print "R154"}; continue;};
 if ( glc_in(-1,"qy") && s(-1,-1) &&
      (w(1,"чтобы будто")||mest_im(1)||nar_vopr(1)) && sc(0,",") )
 { sub(/([Ее])/, "ё", l[i]); r[155]++; if(dbg){print "R155"}; continue;};
 if ( glc_mn(-1,"qy") && s(-1,-1) &&
      (w(1,"чтобы будто")||mest_im(1)||nar_vopr(1)) && sc(0,",") )
 { sub(/([Ее])/, "ё", l[i]); r[156]++; if(dbg){print "R156"}; continue;};
 if ( (mest_mnim(1)||prl_kred_sr(1)) &&
       glc_mn(2,"qj") && s(0,1) &&
       (w(3,"чтобы будто куда")||mest_im(3)||nar_vopr(3)) && sc(2,",") )
 { sub(/([Ее])/, "<_&_>", l[i]); r[157]++; if(dbg){print "R157"}; continue;};
 if ( glc_mn(1,"qj") && s(0,0) &&
       pre_any(2) &&
       (w(3,"чтобы будто")||mest_im(3)||nar_vopr(3)) && sc(1,",") )
 { sub(/([Ее])/, "<_&_>", l[i]); r[158]++; if(dbg){print "R158"}; continue;};
 if ( glc_mn(1,"qj") && s(0,0) &&
      (w(2,"чтобы будто")||mest_im(2)||nar_vopr(2)) && sc(1,",") )
 { sub(/([Ее])/, "<_&_>", l[i]); r[159]++; if(dbg){print "R159"}; continue;};
 if ( mest_it(1) &&
       glc_mn(2,"syg") && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[160]++; if(dbg){print "R160"}; continue;};
 if ( mest_mnim(-1) &&
       prl_kred_sr(1) &&
        glc_mn(2,"syg") && s(-1,1) )
 { sub(/([Ее])/, "ё", l[i]); r[161]++; if(dbg){print "R161"}; continue;};
 if ( mest_mnim(-1) &&
       phf(1,"не так") &&
        glc_mn(hfn,"syg") && s(-1,hfn-1) )
 { sub(/([Ее])/, "ё", l[i]); r[162]++; if(dbg){print "R162"}; continue;};
 if ( mest_mn(-2) &&
       w(-1,"же ведь") &&
        mest_it(1) &&
         glc_mn(2,"syg") && s(-2,1) )
 { sub(/([Ее])/, "ё", l[i]); r[163]++; if(dbg){print "R163"}; continue;};
 if ( w(-1,"так") &&
       glc_mn(1,"nj") && s(-1,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[164]++; if(dbg){print "R164"}; continue;};
 if ( w(1,"так") &&
       glc_mn(2,"nj") && s(0,1) && p(2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[165]++; if(dbg){print "R165"}; continue;};
 if ( mest_mnim(-2) &&
        glc_mn(-1,"sgy") &&
          pre_pr(1) &&
          (suw_edpr(2)||suw_mnpr(2)) && s(-2,1) )
 { sub(/([Ее])/, "ё", l[i]); r[166]++; if(dbg){print "R166"}; continue;};
 if ( cap(-3) &&
       w(-2,"и") &&
        cap(-1) &&
         glc_mn(1,"syg") && s(-3,0) && p(1) )
 { sub(/([Ее])/, "ё", l[i]); r[167]++; if(dbg){print "R167"}; continue;};
 if ( mest_mnim(1) &&
        glc_mn(2,"syg") && s(0,1) && p(2) )
 { sub(/([Ее])/, "ё", l[i]); r[168]++; if(dbg){print "R168"}; continue;};
 if ( mest_mnim(-2) &&
       prl_kred_sr(-1) &&
        glc_mn(1,"syg") && s(-2,0) && p(1) )
 { sub(/([Ее])/, "ё", l[i]); r[169]++; if(dbg){print "R169"}; continue;};
 if ( mest_mnim(-2) &&
        glc_mn(-1,"sgy") && s(-2,-1) && p(0) )
 { sub(/([Ее])/, "ё", l[i]); r[170]++; if(dbg){print "R170"}; continue;};
 if ( (suw_noedim(-2)||suw_nomnim(-2)) &&
        glc_mn(-1,"ogj") && s(-2,-1) && p(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[171]++; if(dbg){print "R171"}; continue;};
 if ( glc_po(-2,"j") &&
       mest_mnim(-1) && s(-2,-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[172]++; if(dbg){print "R172"}; continue;};
 if ( mest_mnim(-2) &&
       glc_mn(-1,"syg") &&
        (suw_edro(1)||suw_mnro(1)) &&
          pre_vi(2) && s(-2,2) )
 { sub(/([Ее])/, "ё", l[i]); r[173]++; if(dbg){print "R173"}; continue;};
 if ( mest_mn(-1) &&
        glc_mn(1,"syg") && s(-1,0) && p(1) )
 { sub(/([Ее])/, "ё", l[i]); r[174]++; if(dbg){print "R174"}; continue;};
 if ( mest_it(-1) &&
        glc_mn(1,"ogj") && s(-1,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[175]++; if(dbg){print "R175"}; continue;};
 if ( (suw_edvi(-1)||suw_mnvi(-1)||suw_mntv(-1)||mest_vi(-1)) &&
        glc_mn(1,"ogj") && s(-1,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[176]++; if(dbg){print "R176"}; continue;};
 if ( (suw_edvi(-2)||suw_mnvi(-2)||suw_mntv(-2)||mest_vi(-2)) &&
        glc_mn(-1,"ogj") && s(-2,-1) && p(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[177]++; if(dbg){print "R177"}; continue;};
 if ( glc_mn(1,"myg") && s(0,0) &&
       zvat(2) && sc(1,",") )
 { sub(/([Ее])/, "ё", l[i]); r[178]++; if(dbg){print "R178"}; continue;};
 if ( pre_pr(1) &&
      (suw_edpr(2)||suw_mnpr(2)||suw_edme(2)) &&
        glc_mn(3,"pj") &&
         pre_any(4) && s(0,4) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[179]++; if(dbg){print "R179"}; continue;};
 if ( glc_po(1,"j") &&
       (mest_vi(2)||suw_edvi(2)||suw_mnvi(2)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[180]++; if(dbg){print "R180"}; continue;};
 if ( glc_mn(1,"pj") &&
       pre_any(2) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[181]++; if(dbg){print "R181"}; continue;};
 if ( glc_mn(-2,"j") &&
       mest_da(-1) && s(-2,-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[182]++; if(dbg){print "R182"}; continue;};
 if ( vvod(-2) &&
       glc_mn(-1,"ogj") && sc(-2,",") && s(-1,-1) && p(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[183]++; if(dbg){print "R183"}; continue;};
 if ( glc_mn(1,"j") && s(0,0) &&
      !(w(2,"и") && qq(1,3)) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[184]++; if(dbg){print "R184"}; continue;};
 if ( glc_mn(-1,"j") && s(-1,-1) && p(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[185]++; if(dbg){print "R185"}; continue;};
 if ( w(1,"уже ведь") &&
       glc_mn(2,"y") && s(0,1) )
 { sub(/([Ее])/, "ё", l[i]); r[186]++; if(dbg){print "R186"}; continue;};
 if ( glc_mn(1,"y") && s(0,0) && p(1) )
 { sub(/([Ее])/, "ё", l[i]); r[187]++; if(dbg){print "R187"}; continue;};
 if ( glc_mn(-1,"y") &&
       nar_step(1) && s(-1,0) )
 { sub(/([Ее])/, "ё", l[i]); r[188]++; if(dbg){print "R188"}; continue;};
 if ( glc_mn(-1,"y") && s(-1,-1) && p(0) )
 { sub(/([Ее])/, "ё", l[i]); r[189]++; if(dbg){print "R189"}; continue;};
 if ( glc_po(-1,"y") && s(-1,-1) && p(0) )
 { sub(/([Ее])/, "ё", l[i]); r[190]++; if(dbg){print "R190"}; continue;};
 if ( (mest_da(-1)||suw_edda(-1)||suw_mnda(-1)) &&
       glc_mn(1,"oyg") && s(-1,0) )
 { sub(/([Ее])/, "ё", l[i]); r[191]++; if(dbg){print "R191"}; continue;};
 
 # модальное mod_, с возможностью учёта метки m() в словаре dic_cust.gz
 if ( sc(0,",") && (cap(0)||p(-1)) &&
      (mod_ed(1)||mod_mn(1)) &&
        gl_in(2) && s(1,1) )
 { sub(/([Ее])/, "ё", l[i]); r[192]++; if(dbg){print "R192"}; continue;};
 if ( mod_mn(1) &&
       gl_in(2) &&
        mest_da(3) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[193]++; if(dbg){print "R193"}; continue;};
 if ( mest_mn(-2) &&
       mod_mn(-1) &&
        gl_in(1) && s(-2,0) )
 { sub(/([Ее])/, "ё", l[i]); r[194]++; if(dbg){print "R194"}; continue;};
 if ( gl_in(-2) &&
       mod_mn(-1) && s(-2,-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[195]++; if(dbg){print "R195"}; continue;};
 if ( mod_ed(-2) &&
       pre_vi(-1) && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); r[196]++; if(dbg){print "R196"}; continue;};
 if ( mod_bz(-2) &&
       glc_in(-1,"y") && s(-2,-1))
 { sub(/[Ее]/, "ё", l[i]); r[197]++; if(dbg){print "R197"}; continue;};
 if ( mod_bz(-2) &&
       gl_in(-1) && 
       (suw_edda(1)||suw_mnda(1)) && !(suw_mnim(1)) && s(-2,0))
 { sub(/[Ее]/, "ё", l[i]); r[198]++; if(dbg){print "R198"}; continue;};
 if ( mod_bz(1) &&
       gl_in(2) && s(0,1))
 { sub(/[Ее]/, "ё", l[i]); r[199]++; if(dbg){print "R199"}; continue;};
 if ( mod_bz(-1) && s(-1,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); r[200]++; if(dbg){print "R200"}; continue;};
 if ( mod_bz(1) && s(0,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[201]++; if(dbg){print "R201"}; continue;};
 if ( mod_mn(1) &&
       nar_napr(2) && s(0,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[202]++; if(dbg){print "R202"}; continue;};
 if ( (suw_edim(-3)||suw_mnim(-3)) &&
        mod_mn(-2) &&
         gl_in(-1) && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[203]++; if(dbg){print "R203"}; continue;};
 if ( w(1,"не") &&
       mod_mn(2) &&
        gl_in(3) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[204]++; if(dbg){print "R204"}; continue;};
 if ( mod_mn(1) &&
       glc_in(2,"j") && s(0,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[205]++; if(dbg){print "R205"}; continue;};
 if ( mod_mn(1) &&
      (mest_ed(2)||mest_mn(2)) && s(0,1) && p(2) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[206]++; if(dbg){print "R206"}; continue;};
 if ( glc_mn(-1,"ny") &&
       pre_vi(1) &&
       (suw_edvi(2)||suw_mnvi(2)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[207]++; if(dbg){print "R207"}; continue;};
 if ( pre_pr(1) &&
      (suw_edpr(2)||suw_mnpr(2)) &&
        glc_mn(3,"ny") && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[208]++; if(dbg){print "R208"}; continue;};


 #------------------------------------------------------------------------

 # глагол в единственном числе
 if ( mest_it(-1) &&
      (nar_vrem(1)||nar_mest(1)||nar_spos(1)||nar_step(1)||nar_srav(1)||nar_kaq(1)) &&
       (gl_ed(2)||gl_in(2)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[209]++; if(dbg){print "R209"}; continue;};
 if ( prl_kred_sr(1) &&
       prl_kred_sr(2) &&
       (gl_ed(3)||gl_in(3)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[210]++; if(dbg){print "R210"}; continue;};
 if ( pre_tv(1) &&
      (mest_tv(2)||suw_edtv(2)||suw_mntv(2)) &&
       (gl_ed(3)||gl_in(3)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[211]++; if(dbg){print "R211"}; continue;};
 if ( mest_it(1) &&
      (nar_vrem(2)||nar_mest(2)||nar_spos(2)||nar_step(2)||nar_srav(2)||nar_kaq(2)) &&
       (gl_ed(3)||gl_in(3)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[212]++; if(dbg){print "R212"}; continue;};
 if ( mest_it(1) &&
      (nar_vrem(2)||nar_mest(2)||nar_spos(2)||nar_step(2)||nar_srav(2)||nar_kaq(2)) && s(0,2) && (p(2)||w(3,"и")) )
 { sub(/[Ее]/, "ё", l[i]); r[213]++; if(dbg){print "R213"}; continue;};
 if ( mest_it(1) && s(0,0) && sc(1,",") &&
       vvod(2) && sc(2,",") &&
       (gl_ed(3)||gl_in(3)) )
 { sub(/[Ее]/, "ё", l[i]); r[214]++; if(dbg){print "R214"}; continue;};
 if ( gl_ed(-1) &&
      (muk_edtv(1)||muk_mntv(1)) &&
       (suw_edtv(2)||suw_mntv(2)) s(-1,1) )
 { sub(/([Ее])/, "ё", l[i]); r[215]++; if(dbg){print "R215"}; continue;};
 if ( mest_it(1) && s(0,0) && sc(1,",") &&
       vvod(2) && sc(2,",") &&
       (gl_nemn(3)||gl_pnmn(3)) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[216]++; if(dbg){print "R216"}; continue;};
 if ( gl_ed(-1) &&
      (nar_kaq(1)||nar_step(1)) &&
        prl_kred_sr(2) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[217]++; if(dbg){print "R217"}; continue;};
 if ( mest_edim(-3) &&
       mest_da(-2) &&
        gl_ed(-1) &&
         pre_any(1) && s(-3,1) )
 { sub(/[Ее]/, "ё", l[i]); r[218]++; if(dbg){print "R218"}; continue;};
 if ( suw_mnim(-2) &&
       gl_ed(-1) &&
        pre_any(1) && s(-2,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[219]++; if(dbg){print "R219"}; continue;};
 if ( (cap(0)||p(-1,",")||sc(-1,"<p>")) &&
       (gl_ed(1)||gl_vzed(1)) && sc(0,",") )
 { sub(/[Ее]/, "ё", l[i]); r[220]++; if(dbg){print "R220"}; continue;};



 if ( sc(0,",") &&
       vvod(1) && sc(1,",") &&
       (gl_ed(2)||gl_in(2)) )
 { sub(/[Ее]/, "ё", l[i]); r[221]++; if(dbg){print "R221"}; continue;};
 if ( sc(0,",") &&
       vvod(1) && sc(1,",") &&
       (gl_nemn(2)||gl_pnmn(2)) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[222]++; if(dbg){print "R222"}; continue;};
 if ( mest_it(1) &&
       qast(2) &&
        prq_kred_sr(3) && s(0,2) && p(3) )
 { sub(/[Ее]/, "ё", l[i]); r[223]++; if(dbg){print "R223"}; continue;};
 if ( w(-1,"за") &&
       prl_kred(1) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[224]++; if(dbg){print "R224"}; continue;};
 if ( mest_it(1) &&
       prl_kred_sr(2) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[225]++; if(dbg){print "R225"}; continue;};
 if ( mest_it(-1) &&
       predik(1) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[226]++; if(dbg){print "R226"}; continue;};
 if ( gl_in(-2) &&
       mest_it(-1) && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); r[227]++; if(dbg){print "R227"}; continue;};
 if ( mest_it(-1) &&
       mest_im(1) &&
        suw_edim(2) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[228]++; if(dbg){print "R228"}; continue;};
 if ( mest_it(-1) &&
       pre_ro(1) &&
       (mest_ro(2)||prl_edro(2)||prl_mnro(2)) &&
        (suw_edro(3)||suw_mnro(3)) && s(-1,2) )
 { sub(/[Ее]/, "ё", l[i]); r[229]++; if(dbg){print "R229"}; continue;};
 if ( mest_it(-1) &&
       w(1,"что чтобы") && s(-1,-1) && sc(0,",") )
 { sub(/[Ее]/, "ё", l[i]); r[230]++; if(dbg){print "R230"}; continue;};
 if ( mest_it(-1) &&
       w(1,"кто") && s(-1,-1) && sc(0,",") )
 { sub(/([Ее])/, "<_&_>", l[i]); r[231]++; if(dbg){print "R231"}; continue;};
 if ( mest_it(-1) &&
       pre_ro(1) &&
        w(2,"того") &&
         w(3,"что чтобы") && s(-1,1) && sc(2,",") )
 { sub(/[Ее]/, "ё", l[i]); r[232]++; if(dbg){print "R232"}; continue;};
 if ( mest_it(1) &&
       pre_ro(2) &&
        w(3,"того") &&
         w(4,"что чтобы") && s(0,2) && sc(3,",") )
 { sub(/[Ее]/, "ё", l[i]); r[233]++; if(dbg){print "R233"}; continue;};
 if ( mest_it(1) &&
       mest_da(2) &&
        nar_kaq(3) &&
         gl_edsr(4) && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); r[234]++; if(dbg){print "R234"}; continue;};
 if ( mest_it(1) &&
      (prl_edim(2)||prl_mnim(2)||prq_mnim(2)) &&
       (suw_edim(3)||suw_mnim(3)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[235]++; if(dbg){print "R235"}; continue;};
 if ( mest_it(1) &&
       pre_pr(2) &&
       (suw_edpr(3)||suw_mnpr(3)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[236]++; if(dbg){print "R236"}; continue;};
 if ( mest_it(1) &&
       pre_ro(2) &&
       (mest_ro(3)||suw_edro(3)||suw_mnro(3)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[237]++; if(dbg){print "R237"}; continue;};
 if ( mest_it(1) && s(0,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[238]++; if(dbg){print "R238"}; continue;};
 if ( mest_it(-1) && cap(-1) &&
       (mest_ed(1)||mest_mn(1)) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[239]++; if(dbg){print "R239"}; continue;};


 # Все + ... + причастие =====================================
 if ( prq_krmn(-4) &&
       w(-3,"еще ещё") &&
        prl_kred_sr(-2) &&
         w(-1,"не") && s(-4,-1) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[240]++; if(dbg){print "R240"}; continue;};
 if ( prq_krmn(-3) &&
       prl_kred_sr(-2) &&
        w(-1,"не") && s(-3,-1) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[241]++; if(dbg){print "R241"}; continue;};
 if ( prq_kred_sr(-4) &&
       w(-3,"еще ещё") &&
        prl_kred_sr(-2) &&
         w(-1,"не") && s(-4,-1) )
 { sub(/[Ее]/, "ё", l[i]); r[242]++; if(dbg){print "R242"}; continue;};
 if ( prq_kred_sr(-3) &&
       prl_kred_sr(-2) &&
        w(-1,"не") && s(-3,-1) )
 { sub(/[Ее]/, "ё", l[i]); r[243]++; if(dbg){print "R243"}; continue;};
 if ( w(1,"уже") &&
      (nar_mest(2)||nar_step(2)) &&
        prq_kred_sr(3) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[244]++; if(dbg){print "R244"}; continue;};
 if ( (mest_tv(1)||prl_edtv(1)||prl_mntv(1)) &&
        (suw_edro(2)||suw_mnro(2)) &&
         prq_krmn(3) && s(0,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[245]++; if(dbg){print "R245"}; continue;};
 if ( (nar_mest(1)||nar_step(1)) &&
        prq_kred_sr(2) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[246]++; if(dbg){print "R246"}; continue;};
 if ( qast(1) &&
       prq_kred_sr(2) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[247]++; if(dbg){print "R247"}; continue;};
 if ( pre_ro(1) &&
      (suw_mnro(2)||suw_edro(2)) &&
        prq_kred_sr(3) && s(0,2) && (p(3)||w(4,"и")) )
 { sub(/[Ее]/, "ё", l[i]); r[248]++; if(dbg){print "R248"}; continue;};
 if ( gl_in(-2) &&
       prq_krmn(-1) && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[249]++; if(dbg){print "R249"}; continue;};
 if ( prq_kred_sr(-2) &&
       nar_step(-1) && s(-2,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); r[250]++; if(dbg){print "R250"}; continue;};
 if ( prq_kred_sr(-1) && s(-1,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); r[251]++; if(dbg){print "R251"}; continue;};
 if ( (prq_edim(1)||prq_kred(1)) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); r[252]++; if(dbg){print "R252"}; continue;};
 if ( mest_ed(1) &&
      (prq_edim(2)||prq_kred(2)) && Q(2,"gl_pemn") && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[253]++; if(dbg){print "R253"}; continue;};
 if ( pre_tv(-1) &&
       (prq_edtv(1)||prq_mntv(1)) &&
        (suw_edtv(2)||suw_mntv(2)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[254]++; if(dbg){print "R254"}; continue;};
 if ( (prq_edtv(-1)||prq_mntv(-1)||prl_edtv(-1)||prl_mntv(-1)) && sc(-1,",") &&
       (prq_edtv(1)||prq_mntv(1)) &&
        (suw_edtv(2)||suw_mntv(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[255]++; if(dbg){print "R255"}; continue;};
 if ((nar_vrem(1)||qast(1)) &&
       nar_kaq(2) &&
       (prq_edim(3)||prq_kred(3)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[256]++; if(dbg){print "R256"}; continue;};
 if ( (prq_mnim(1) && w(1,"щие$")) && !(suw_mnim(1)) && s(0,0) && p(1,",") )
 { sub(/[Ее]/, "ё", l[i]); r[257]++; if(dbg){print "R257"}; continue;};
 if ( prq_mnim(1) &&
       pre_ro(2) && s(0,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[258]++; if(dbg){print "R258"}; continue;};
 if ( w(1,"не") &&
       prq_mnim(2) &&
        pre_ro(3) && s(0,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[259]++; if(dbg){print "R259"}; continue;};
 if ( w(1,"даже") && sc(0,",") &&
       w(2,"не") &&
        prq_mnim(3) &&
         suw_edda(4) && s(1,3) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[260]++; if(dbg){print "R260"}; continue;};
 if ( w(1,"не") && sc(0,",") &&
       prq_mnim(2) &&
        suw_edda(3) && s(1,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[261]++; if(dbg){print "R261"}; continue;};
 if ( mest_vi(1) &&
      (prq_mnim(2)||prq_krmn(2)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[262]++; if(dbg){print "R262"}; continue;};
 if ( prl_srav(1) &&
      (prq_edro(2)||prq_mnro(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[263]++; if(dbg){print "R263"}; continue;};
 if ( (prq_edro(1)||prq_mnro(1)) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); r[264]++; if(dbg){print "R264"}; continue;};
 if ( prq_edsrim(1) && sc(0,",") )
 { sub(/[Ее]/, "ё", l[i]); r[265]++; if(dbg){print "R265"}; continue;};
 if ( qf(3,"prq_kred_sr") && s(0,qfn-1) && p(qfn) )
 { sub(/[Ее]/, "ё", l[i]); r[266]++; if(dbg){print "R266"}; continue;};



 # Все + ... + прилагательное =====================================
 if ( (prl_mnim(1)||prq_mnim(1)||prl_mnro(1)||prq_mnro(1)||prl_krmn(1)) &&
        w(2,"и или") &&
        (prl_mnim(3)||prq_mnim(3)||prl_mnro(3)||prq_mnro(3)||prl_krmn(3)) && s(0,2) && qq(1,3)  )
 { sub(/[Ее]/, "ё", l[i]); r[267]++; if(dbg){print "R267"}; continue;};
 if ( (prl_edim(1)||prl_edda(1)||prl_edro(1)||prl_edtv(1)||prl_edpr(1)||prl_kred(1)) &&
        w(2,"и или") &&
        (prl_edim(3)||prl_edda(3)||prl_edro(3)||prl_edtv(3)||prl_edpr(3)||prl_kred(3)) && s(0,2) && qq(1,3)  )
 { sub(/[Ее]/, "ё", l[i]); r[268]++; if(dbg){print "R268"}; continue;};
 if ( (prl_mnim(1)||prq_mnim(1)||prl_mnro(1)||prq_mnro(1)||prl_krmn(1)) &&
        w(2,"и или") &&
        (prl_mnim(3)||prq_mnim(3)||prl_mnro(3)||prq_mnro(3)||prl_krmn(3)) &&
          suw_mnim(4) &&
           gl_nemn(5) && s(0,4)  )
 { sub(/([Ее])/, "<_&_>", l[i]); r[269]++; if(dbg){print "R269"}; continue;};
 if ( (prl_mnim(1)||prq_mnim(1)||prl_mnro(1)||prq_mnro(1)||prl_krmn(1)) &&
        w(2,"и или") &&
        (prl_mnim(3)||prq_mnim(3)||prl_mnro(3)||prq_mnro(3)||prl_krmn(3)) &&
          suw_mnim(4) && s(0,3)  )
 { sub(/([Ее])/, "<_&_>", l[i]); r[270]++; if(dbg){print "R270"}; continue;};
 if ( (prl_mnim(1)||prq_mnim(1)||prl_mnro(1)||prq_mnro(1)||prl_krmn(1)) && W(1,"новые новых") &&
       (prl_mnim(2)||prq_mnim(2)||prl_mnro(2)||prq_mnro(2)||prl_krmn(2)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[271]++; if(dbg){print "R271"}; continue;};
 if ( w(1,"и") &&
      (prl_mnim(2)||prq_mnim(2)||prl_krmn(2)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[272]++; if(dbg){print "R272"}; continue;};
 if ( prl_mnim(-2) &&
       w(-1,"и") &&
        prq_mnim(1) && p(1) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); r[273]++; if(dbg){print "R273"}; continue;};
 if ( (prl_mnim(1)||prq_mnim(1)||prl_krmn(1)) && p(1) && s(0,0) && W(1,"новые") )
 { sub(/([Ее])/, "<_&_>", l[i]); r[274]++; if(dbg){print "R274"}; continue;};
 if ( mest_tv(1) &&
       prl_krmn(2) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[275]++; if(dbg){print "R275"}; continue;};
 if ( prl_krmn(1) && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[276]++; if(dbg){print "R276"}; continue;};
 if ( wc(1,".о$") && se(1,"-") &&
      (prl_mnim(2)||prq_mnim(2)||prl_krmn(2)) &&
        suw_mnim(3) && s(0,0) && s(2,2))
 { sub(/([Ее])/, "<_&_>", l[i]); r[277]++; if(dbg){print "R277"}; continue;};
 if ( (prl_mnim(1)||prq_mnim(1)||prl_krmn(1)) && W(1,"новые") &&
        suw_mnim(2) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[278]++; if(dbg){print "R278"}; continue;};
 if ( (prl_edim(1)||prl_kred(1)) &&
        suw_edim(2) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[279]++; if(dbg){print "R279"}; continue;};
 if ( (prl_pvedtv(1)||prl_pvmntv(1)) &&
       (suw_edtv(2)||suw_mntv(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[280]++; if(dbg){print "R280"}; continue;};
 if ( (qast(1)||nar_kaq(1)) &&
       (nar_kaq(2)||nar_step(2)) &&
         prl_kred_sr(3) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[281]++; if(dbg){print "R281"}; continue;};
 if ( w(1,"ли") &&
       suw_mnim(2) &&
        prl_krmn(3) && s(0,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[282]++; if(dbg){print "R282"}; continue;};
 if ( suw_mnim(1) &&
       prl_krmn(2) && s(0,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[283]++; if(dbg){print "R283"}; continue;};
 if ( (mest_da(-1)||suw_edda(-1)||suw_mnda(-1)) &&
        prl_kred_sr(1) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); r[284]++; if(dbg){print "R284"}; continue;};
 if ( w(1,"так") &&
        prl_krmn(2) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[285]++; if(dbg){print "R285"}; continue;};
 if ( (nar_kaq(1)||nar_step(1)) &&
        prl_krmn(2) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[286]++; if(dbg){print "R286"}; continue;};
 if ( pre_tv(-2) &&
      (suw_edtv(-1)||suw_mntv(-1)) &&
        prl_kred_sr(1) && s(-2,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[287]++; if(dbg){print "R287"}; continue;};
 if ( w(1,"вроде как") &&
       w(2,"бы как") &&
        prl_kred_sr(3) && s(0,2) && p(3) )
 { sub(/[Ее]/, "ё", l[i]); r[288]++; if(dbg){print "R288"}; continue;};
 if ( w(1,"так настолько") &&
       prl_kred_sr(2) &&
        w(3,"и") &&
         prl_kred_sr(4) && s(0,3) && p(4) )
 { sub(/[Ее]/, "ё", l[i]); r[289]++; if(dbg){print "R289"}; continue;};
 if ( (w(1,"именно")||prl_kred_sr(1)) &&
        w(2,"так") && sc(2,",") &&
         w(3,"как чтобы") && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[290]++; if(dbg){print "R290"}; continue;};
 if ( (w(1,"именно")||prl_kred_sr(1)) &&
        w(2,"так") && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[291]++; if(dbg){print "R291"}; continue;};
 if ( w(1,"вроде как так") &&
       prl_kred_sr(2) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[292]++; if(dbg){print "R292"}; continue;};
 if ( (mest_ed(1)||nar_step(1)) &&
        nar_step(2) &&
        (prl_kred_sr(3)||prl_edsrim(3)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[293]++; if(dbg){print "R293"}; continue;};
 if ( mest_ed(1) &&
       (prl_kred_sr(2)||prl_edsrim(2)) &&
        (mest_da(3)||suw_edda(3)||suw_mnda(3)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[294]++; if(dbg){print "R294"}; continue;};
 if ( (nar_mest(1)||nar_vrem(1)) &&
        prl_edsrim(2) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[295]++; if(dbg){print "R295"}; continue;};
 if ( prl_edsrim(1) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); r[296]++; if(dbg){print "R296"}; continue;};
 if ( pre_vi(-1) &&
      (prl_kred_sr(1)||prl_edsrim(1)) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[297]++; if(dbg){print "R297"}; continue;};
 if ( vvod(-1) &&
      (prl_kred_sr(1)||prl_edsrim(1)) && sc(-1,",") && s(0,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[298]++; if(dbg){print "R298"}; continue;};
 if ( (gl_nemn(-2)||gl_pnmn(-2)||gl_pemn(-2)||gl_in(-2)) &&
        mest_mn(-1) &&
        (prl_kred_sr(1)||prl_edsrim(1)) && s(-2,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[299]++; if(dbg){print "R299"}; continue;};
 if ( (gl_nemn(-1)||gl_pnmn(-1)||gl_pemn(-1)) &&
       (prl_kred_sr(1)||prl_edsrim(1)) && s(-1,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[300]++; if(dbg){print "R300"}; continue;};
 if ( (prl_kred_sr(1)||prl_edsrim(1)) &&
        pre_ro(2) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[301]++; if(dbg){print "R301"}; continue;};
 if ( (prl_kred_sr(1)||prl_edsrim(1)) && s(0,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[302]++; if(dbg){print "R302"}; continue;};
 if ( gl_vzmn(-2) &&
      (prl_kred_sr(-1)||nar_kaq(-1)) && s(-2,-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[303]++; if(dbg){print "R303"}; continue;};
 if ( (prl_kred_sr(-1)||nar_kaq(-1)) &&
        w(1,"кто кого кому кем") && sc(0,",") && s(-1,-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[304]++; if(dbg){print "R304"}; continue;};
 if (  w(1,"кто кого кому кем") && sc(0,",") )
 { sub(/([Ее])/, "<_&_>", l[i]); r[305]++; if(dbg){print "R305"}; continue;};
 if ( (prl_kred_sr(-1)||nar_kaq(-1)) &&
        pre_ro(1) &&
        (suw_edro(2)||suw_mnro(2)) && s(-1,1) && p(2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[306]++; if(dbg){print "R306"}; continue;};
 if ( (prl_kred_sr(-1)||nar_kaq(-1)) && s(-1,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); r[307]++; if(dbg){print "R307"}; continue;};
 if ( (mest_ed(1)||nar_kaq(1)||nar_vrem(1)) &&
        (prl_kred_sr(2)||prl_edsrim(2)) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[308]++; if(dbg){print "R308"}; continue;};
 if ( pre_pr(1) &&
      (mest_pr(2)||suw_edpr(2)||suw_mnpr(2)) &&
        prl_kred_sr(3) && s(0,2) && p(3) )
 { sub(/[Ее]/, "ё", l[i]); r[309]++; if(dbg){print "R309"}; continue;};
 if ( (prl_edtv(3)||prl_mntv(3)) &&
        w(2,"и") &&
        (prl_edtv(3)||prl_mntv(3)) && s(0,2) && qq(1,3) )
 { sub(/[Ее]/, "ё", l[i]); r[310]++; if(dbg){print "R310"}; continue;};
 if ( (prl_mnim(1)||prl_mnro(1)) &&
        w(2,"и или") &&
        (prl_mnim(3)||prl_mnro(3)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[311]++; if(dbg){print "R311"}; continue;};
 if ( (prl_srav(1)||nar_step(1)||nar_kaq(1)||nar_srav(1)) &&
        w(2,"и или") &&
        (prl_srav(3)||nar_step(3)||nar_kaq(3)||nar_srav(3)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[312]++; if(dbg){print "R312"}; continue;};
 if ( prl_srav(1) && se(1,", ") &&
       prl_srav(2) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); r[313]++; if(dbg){print "R313"}; continue;};
 if ( prl_srav(1) &&
       prl_edro(2) &&
        suw_edro(3) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[314]++; if(dbg){print "R314"}; continue;};
 if ( prl_srav(1) &&
      (suw_mnro(2)||prl_edro(2)||prl_mnro(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[315]++; if(dbg){print "R315"}; continue;};
 if ( prl_srav(1) &&
      (suw_edim(2)||suw_mnim(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[316]++; if(dbg){print "R316"}; continue;};
 if ( nar_spos(1) &&
       prl_mnim(2) && s(0,1) && p(2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[317]++; if(dbg){print "R317"}; continue;};

 # Все + ... + существительное =====================================

 if ( souz(1) && sc(0,",") &&
       w(2,"не") &&
        prq_mnim(3) &&
         suw_edda(4) &&
          suw_mnvi(5) && s(1,4) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[318]++; if(dbg){print "R318"}; continue;};
 if ( souz(1) && sc(0,",") &&
       prq_mnim(2) &&
        suw_edda(3) &&
         suw_mnvi(4) && s(1,3) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[319]++; if(dbg){print "R319"}; continue;};
 if (  prq_mnim(1) &&
        suw_edda(2) &&
         suw_mnvi(3) && s(1,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[320]++; if(dbg){print "R320"}; continue;};
 if ( w(1,"не") &&
       prq_mnim(2) &&
        suw_edda(3) &&
         suw_mnvi(4) && s(1,3) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[321]++; if(dbg){print "R321"}; continue;};
 if ( w(1,"нет") &&
      (suw_edro(2)||suw_mnro(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[322]++; if(dbg){print "R322"}; continue;};
 if ( (suw_edim(1)||suw_edne(1)) &&
       (suw_edro(2)||suw_mnro(2)||suw_mnvi(2)) &&
         gl_edsr(3) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[323]++; if(dbg){print "R323"}; continue;};
 if ( (mest_ed(1)||mest_mn(1)) &&
        suw_mnim(2) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[324]++; if(dbg){print "R324"}; continue;};
 if ( suw_edim(1) && se(1,"-") &&
       suw_mnim(2) && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[325]++; if(dbg){print "R325"}; continue;};
 if ( (prl_mnim(1)||prq_mnim(1)) &&
        mest_da(2) &&
         suw_mnim(3) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[326]++; if(dbg){print "R326"}; continue;};
 if ( (mest_ed(1)||mest_mn(1)||prl_kred_sr(1)) &&
       (prl_mnim(2)||prq_mnim(2)) &&
         suw_mnim(3) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[327]++; if(dbg){print "R327"}; continue;};
 if ( mest_tv(1) &&
       w(2,"же") &&
       (prl_mnim(3)||prq_mnim(3)) &&
         suw_mnim(4) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[328]++; if(dbg){print "R328"}; continue;};
 if ( suw_mnim(1) &&
       (gl_nemn(2)||gl_pemn(2)||gl_pnmn(2)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[329]++; if(dbg){print "R329"}; continue;};
 if ( suw_mnim(-1) &&
       prl_krmn(1) && s(-1,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[330]++; if(dbg){print "R330"}; continue;};
 if ( suw_mnim(1) && !(prl_mnim(1)||prl_mnvi(1)) && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[331]++; if(dbg){print "R331"}; continue;};
 if ( (mest_ed(1)||mest_mn(1)||nar_kaq(1)) &&
       (prl_mnim(2)||prq_mnim(2)) &&
         suw_edim(3) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[332]++; if(dbg){print "R332"}; continue;};
 if ( (mest_ed(1)||mest_mn(1)) &&
        suw_edsrim(2) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[333]++; if(dbg){print "R333"}; continue;};
 if ( suw_edim(1) && !(nar_spos(1)) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); r[334]++; if(dbg){print "R334"}; continue;};
 if ( (mest_ed(1)||mest_mn(1)) &&
        suw_edim(2) &&
         qik_edim(3) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[335]++; if(dbg){print "R335"}; continue;};
 if ( mest_ed(1) &&
       qast(2) &&
        suw_edim(3) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[336]++; if(dbg){print "R336"}; continue;};
 if ( (suw_edsrim(1)||suw_edsrvi(1)) && s(0,0)  )
 { sub(/[Ее]/, "ё", l[i]); r[337]++; if(dbg){print "R337"}; continue;};
 if ( (prl_mnim(1)||wc(1,"ские$")) && W(1,"новые") &&
       (suw_edro(2)||suw_mnro(2)) && s(0,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[338]++; if(dbg){print "R338"}; continue;};
 if ( w(1,"ли же") &&
      (prl_mnim(2)||wc(2,"ские$")) &&
        suw_mnim(3) && s(0,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[339]++; if(dbg){print "R339"}; continue;};
 if ( suw_edim(1) &&
       (suw_edro(2)||suw_mnro(2)) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[340]++; if(dbg){print "R340"}; continue;};
 if ( suw_edim(1) && s(0,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[341]++; if(dbg){print "R341"}; continue;};
 if ( mest_mn(-1) && s(-1,-1) &&
       prl_edim(1) &&
        suw_edim(2) && se(0," — ") && s(1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[342]++; if(dbg){print "R342"}; continue;};
 if ( mest_mn(1) && s(0,0) &&
      (suw_edim(2)||suw_mnim(2)) && se(1," — ") )
 { sub(/([Ее])/, "<_&_>", l[i]); r[343]++; if(dbg){print "R343"}; continue;};
 if ( (mest_im(1)||mest_vi(1)) && s(1,1) &&
        suw_edim(2) && se(0," — ") )
 { sub(/[Ее]/, "ё", l[i]); r[344]++; if(dbg){print "R344"}; continue;};
 if ( suw_edim(1) && se(0," — ") && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[345]++; if(dbg){print "R345"}; continue;};
 if ( suw_edim(1) &&
      (suw_edro(2)||suw_mnro(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[346]++; if(dbg){print "R346"}; continue;};
 if ( suw_mnim(-1) && sc(-1,",") &&
       pre_pr(1) &&
       (prl_edpr(2)||prl_mnpr(2)) &&
        (suw_edpr(3)||suw_mnpr(3)) && s(0,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[347]++; if(dbg){print "R347"}; continue;};
 if ( w(-3,"каждый каждую каждое") &&
       suw_edvi(-2) &&
       (gl_pemn(-1)||gl_pnmn(-1)||gl_nemn(-1)) && 
        w(1,"новые") && s(-3,0) )
 { sub(/[Ее]/, "ё", l[i]); r[348]++; if(dbg){print "R348"}; continue;};
 if ( w(-2,"каждый каждую каждое") &&
       suw_edvi(-1) &&
        w(1,"новые") && s(-2,0) )
 { sub(/[Ее]/, "ё", l[i]); r[349]++; if(dbg){print "R349"}; continue;};


 # наречия =============================================
 
 if ( qb(-7,"mest_mnim") &&
       w(-1,"то") && sc(-2,",") &&
        nar_spos(1) && s(-1,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[350]++; if(dbg){print "R350"}; continue;};


 if ( nar_step(1) &&
       nar_srav(2) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[351]++; if(dbg){print "R351"}; continue;};
 if ( (w(1,"куда")||prl_kred_sr(1)) &&
        nar_srav(2) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[352]++; if(dbg){print "R352"}; continue;};
 if ( nar_srav(1) &&
       (gl_ed(2)||gl_nemn(2)||gl_pnmn(2)||gl_pemn(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[353]++; if(dbg){print "R353"}; continue;};
 if ( nar_srav(1) && s(0,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[354]++; if(dbg){print "R354"}; continue;};
 if ( (nar_kaq(1)||nar_vrem(1)||mest_ed(1)) && s(0,0) && p(1) && cap(0) )
 { sub(/[Ее]/, "ё", l[i]); r[355]++; if(dbg){print "R355"}; continue;};
 if ( (gl_vzmn(-1)||gl_nemn(-1)) &&
        prl_srav(1) &&
        (prl_edim(2)||prl_mnim(2)||prl_edro(2)||prl_mnro(2)||prl_edtv(2)||prl_mntv(2)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[356]++; if(dbg){print "R356"}; continue;};
 if ( nar_step(1) &&
      (prl_mntv(2)||prl_edtv(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[357]++; if(dbg){print "R357"}; continue;};
 if ( (gl_vzmn(-1)||gl_nemn(-1)) &&
       (nar_spos(1)||nar_napr(1)||nar_step(1)) &&
         prl_kred_sr(2) && s(-1,1) && p(2) )
 { sub(/([Ее])/, "ё", l[i]); r[358]++; if(dbg){print "R358"}; continue;};
 if ( (gl_vzmn(-1)||gl_nemn(-1)) &&
       (nar_spos(1)||nar_napr(1)||nar_step(1)) && s(-1,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[359]++; if(dbg){print "R359"}; continue;};
 if ( (nar_kaq(1)||nar_spos(1)||nar_step(1)||prl_kred_sr(1)) &&
        prl_kred_sr(2) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[360]++; if(dbg){print "R360"}; continue;};
 if ( nar_step(1) &&
      (prl_mnvi(2)||prl_edvi(2)) &&
        suw_mnvi(3) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[361]++; if(dbg){print "R361"}; continue;};
 if ( (qast(1)||nar_step(1)) &&
        nar_kaq(2) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[362]++; if(dbg){print "R362"}; continue;};
 if ( nar_mest(1) &&
       w(2,"не") &&
        gl_ed(3) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[363]++; if(dbg){print "R363"}; continue;};
 if ( mest_da(-1) &&
       nar_mest(1) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[364]++; if(dbg){print "R364"}; continue;};
 if ( (nar_kaq(1)||nar_step(1)) &&
        prl_kred_sr(2) &&
         !(gl_pemn(3)||gl_nemn(3)||gl_pnmn(3)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[365]++; if(dbg){print "R365"}; continue;};
 if ( (gl_ed(-1)||gl_nemn(-1)||gl_pemn(-1)||gl_pnmn(-1)) &&
        nar_mest(1) &&
         suw_mnim(2) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[366]++; if(dbg){print "R366"}; continue;};
 if ( nar_mest(1) &&
       suw_mnim(2) && s(0,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[367]++; if(dbg){print "R367"}; continue;};

 # всё не так плохо
 if ( w(1,"не") &&
       w(2,"так") &&
       (nar_vrem(3)||nar_mest(3)||nar_spos(3)||nar_srav(3)||nar_kaq(3)||suw_edvi(3)||mest_ed(3)) && s(0,2) && p(3) )
 { sub(/[Ее]/, "ё", l[i]); r[368]++; if(dbg){print "R368"}; continue;};
 if ( nar_mest(1) &&
       w(2,"же") && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[369]++; if(dbg){print "R369"}; continue;};

 # Все + ... + числительное =====================================
 # все + числ.
 if ( w(1,"один одна одно одни") && s(0,0) )
 { sub(/([Ее])/, "ё", l[i]); r[370]++; if(dbg){print "R370"}; continue;};
 if ( qis_im(1) && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[371]++; if(dbg){print "R371"}; continue;};
 if ( (qik_edim(1)||qik_mnim(1)||wc(1,"^[0-9]+$")) && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[372]++; if(dbg){print "R372"}; continue;};

 # все + местоимения =============================================
 # все + мест.мн
 if ( w(-1,"чем даже") &&
       mest_mnim(1) && s(-1,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[373]++; if(dbg){print "R373"}; continue;};
 if ( mest_mn(-3) && sc(-3,",") &&
       w(-2,"а но") &&
        w(-1,"не") && s(-2,-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[374]++; if(dbg){print "R374"}; continue;};
 if ( w(-1,"не") && s(-1,-1) &&
       w(1,"а но") && sc(0,",") &&
       (mest_mn(2)||prl_mnim(2)) && s(1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[375]++; if(dbg){print "R375"}; continue;};
 if ( mest_mn(1) &&
       prl_kred_sr(2) &&
        w(3,"и") &&
        (gl_pnmn(4)||gl_nemn(4)||gl_pemn(4)) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[376]++; if(dbg){print "R376"}; continue;};
 if ( mest_mnim(-3) && sc(-3,",") &&
       suw_mnim(-2) && sc(-2,",") &&
        (gl_pnmn(-1)||gl_pemn(-1)||gl_nemn(-1)) && s(-1,-1) && (p(0)||pre_any(1)) )
 { sub(/[Ее]/, "ё", l[i]); r[377]++; if(dbg){print "R377"}; continue;};
 if ( mest_im(-2) &&
       mest_mnim(-1) &&
        mest_mnim(1) && s(-2,0) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[378]++; if(dbg){print "R378"}; continue;};
 if ( mest_mnim(1) &&
       mest_vi(2) &&
        gl_pnmn(3) && s(0,2) && p(3) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[379]++; if(dbg){print "R379"}; continue;};
 if ( mest_da(1) &&
        gl_ed(2) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[380]++; if(dbg){print "R380"}; continue;};
 if ( mest_mnim(-1) &&
      (nar_kaq(1)||nar_step(1)) &&
        prl_kred_sr(2) && s(-1,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[381]++; if(dbg){print "R381"}; continue;};
 if ( mest_mn(1) &&
      (prl_kred_sr(2)||nar_kaq(2)) &&
       (gl_pnmn(3)||gl_nemn(3)||gl_pemn(3)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[382]++; if(dbg){print "R382"}; continue;};
 if ( mest_mn(1) &&
       nar_spos(2) &&
        prq_mnim(3) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[383]++; if(dbg){print "R383"}; continue;};
 if ( mest_mn(1) &&
       qast(2) &&
       (gl_vzmn(3)||gl_nemn(3)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[384]++; if(dbg){print "R384"}; continue;};
 if ( mest_mn(-1) &&
      (gl_pnmn(1)||gl_nemn(1)) &&
        prl_kred_sr(2) &&
        (prl_mnim(3)||prl_krmn(3)) && s(-1,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[385]++; if(dbg){print "R385"}; continue;};
 if ( mest_mn(-1) &&
       gl_povzmn(1) && s(-1,0) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[386]++; if(dbg){print "R386"}; continue;};
 if ( mest_mn(-1) &&
       pre_tv(1) &&
        mest_tv(2) &&
         prl_krmn(3) && s(-1,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[387]++; if(dbg){print "R387"}; continue;};
 if ( mest_mn(1) &&
       nar_mest(2) &&
         prl_krmn(3) && s(0,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[388]++; if(dbg){print "R388"}; continue;};
 if ( mest_mn(1) &&
       pre_tv(2) &&
       (mest_tv(3)||suw_edtv(3)||suw_mntv(3)) && s(-1,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[389]++; if(dbg){print "R389"}; continue;};
 if ( mest_mn(-1) &&
       pre_ro(1) &&
        cap(2) && s(-1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[390]++; if(dbg){print "R390"}; continue;};
 if ( mest_mn(-1) &&
       nar_step(1) &&
        prl_kred_sr(2) &&
         gl_pemn(3) && sc(3,",") && s(-1,2) &&
          (w(4,"чтобы будто")||mest_im(4)||nar_vopr(4)) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[391]++; if(dbg){print "R391"}; continue;};
 if ( mest_mn(-1) &&
       nar_step(1) && sc(1,",") &&
        nar_step(2) &&
         gl_pemn(3) && s(-1,0) && s(2,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[392]++; if(dbg){print "R392"}; continue;};
 if ( mest_mnim(-1) &&
       gl_nemn(1) &&
        pre_tv(2) &&
        (mest_tv(3)||suw_edtv(3)||suw_mntv(3)) s(-1,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[393]++; if(dbg){print "R393"}; continue;};
 if ( mest_mn(-1) &&
       nar_step(1) &&
       (mest_ro(2)||suw_edro(2)||suw_mnro(2)) &&
         gl_pnmn(3) && s(-1,2) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[394]++; if(dbg){print "R394"}; continue;};
 if ( mest_mn(-1) &&
      (gl_pnmn(1)||gl_nemn(1)) &&
        prl_kred_sr(2) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[395]++; if(dbg){print "R395"}; continue;};
 if ( mest_mn(1) &&
      (nar_step(2)||prl_kred_sr(2)) &&
        prl_krmn(3) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[396]++; if(dbg){print "R396"}; continue;};
 if ( mest_mn(1) &&
      (prl_krmn(2)||mest_mn(2)||prl_mnim(2)) && s(0,1) && p(2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[397]++; if(dbg){print "R397"}; continue;};
 if ( mest_mn(1) &&
       nar_vrem(2) &&
        mod_mn(3) &&
         gl_in(4) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[398]++; if(dbg){print "R398"}; continue;};
 if ( mest_mn(1) &&
       prl_mnim(2) &&
        prl_mnim(3) &&
         suw_mnim(4) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[399]++; if(dbg){print "R399"}; continue;};
 if ( mest_mn(-2) &&
       w(-1,"ведь же ж") && s(-2,-1) && p(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[400]++; if(dbg){print "R400"}; continue;};
 if ( mest_mn(1) &&
       pre_pr(2) &&
       (suw_edpr(3)||suw_mnpr(3)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[401]++; if(dbg){print "R401"}; continue;};
 if ( mest_mn(1) &&
       w(2,"друг") &&
        w(3,"друга дружку") && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[402]++; if(dbg){print "R402"}; continue;};
 if ( (gl_nemn(1)||gl_pnmn(1)) &&
        phf(2,"друг с другом") && s(0,hfn-2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[403]++; if(dbg){print "R403"}; continue;};
 if ( (mest_ed(1)||mest_mn(1)) &&
        qip_mnro(2) &&
         suw_mnro(3) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[404]++; if(dbg){print "R404"}; continue;};
 if ( mest_mnim(1) &&
       (gl_vzmn(2)||gl_nemn(2)||gl_pemn(2)||gl_pnmn(2)||prl_krmn(2)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[405]++; if(dbg){print "R405"}; continue;};
 if ( mest_ed(1) &&
      (nar_mest(2)||nar_priq(2)) && s(0,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[406]++; if(dbg){print "R406"}; continue;};
 if ( mest_ed(1) &&
       pre_tv(2) &&
       (mest_tv(3)||suw_edtv(3)||suw_mntv(3)||prl_edtv(3)||prl_mntv(3)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[407]++; if(dbg){print "R407"}; continue;};
 if ( mest_ed(1) &&
       nar_step(2) &&
        nar_kaq(3) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[408]++; if(dbg){print "R408"}; continue;};
 if ( mest_ed(1) &&
      (nar_kaq(2)||nar_step(2)||nar_spos(2)) &&
       (gl_ed(3)||gl_in(3)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[409]++; if(dbg){print "R409"}; continue;};
 if ( mest_ed(1) &&
      (nar_kaq(2)||nar_step(2)) &&
        qast(3) &&
        (gl_ed(4)||gl_in(4)) && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); r[410]++; if(dbg){print "R410"}; continue;};
 if ( mest_mn(1) && cap(0) && s(0,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[411]++; if(dbg){print "R411"}; continue;};
 if ( mest_edsrim(-1) && s(-1,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); r[412]++; if(dbg){print "R412"}; continue;};

 # Местоимения + все
 # мест.да
 if ( mest_da(-1) &&
       nar_mest(1) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); r[413]++; if(dbg){print "R413"}; continue;};

 # Мест + все + ... + глагол ============================================
 # все + ... + гл.мн.
 if ( qb(-5,"mest_mn") &&
       suw_edim(-1) &&
       (gl_vzmn(1)||gl_nemn(1)) && s(-1,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[414]++; if(dbg){print "R414"}; continue;};
 if ( mest_mn(-3) &&
       w(-2,"не") &&
        gl_nemn(-1) &&
         gl_in(1) && s(-2,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[415]++; if(dbg){print "R415"}; continue;};
 if ( gl_nemn(-2) &&
       w(-1,"не") && s(-2,-1) && p(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[416]++; if(dbg){print "R416"}; continue;};
 if ( mest_mn(-2) &&
       gl_nemn(-1) &&
        gl_in(1) && s(-2,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[417]++; if(dbg){print "R417"}; continue;};
 if ( gl_in(-1) &&
       pre_pr(1) &&
       (suw_edpr(2)||suw_mnpr(2)) &&
         prl_edtv(3) && s(-1,2) )
 { sub(/[Ее]/, "ё", l[i]); r[418]++; if(dbg){print "R418"}; continue;};
 if ( mest_mn(-1) &&
      (nar_mest(1)||nar_kaq(1)||nar_vrem(1)||nar_spos(1)) &&
        gl_nemn(2) && s(-1,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[419]++; if(dbg){print "R419"}; continue;};
 if ( mest_mn(-1) &&
       mest_da(1) &&
        gl_nemn(2) && s(-1,1) && p(2))
 { sub(/[Ее]/, "<_&_>", l[i]); r[420]++; if(dbg){print "R420"}; continue;};
 if ( (gl_pnmn(1)||gl_pemn(1)||gl_nemn(1)) && sc(1,",") &&
        w(2,"кто никто") && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[421]++; if(dbg){print "R421"}; continue;};
 if ( (suw_edvi(-3)||suw_mnvi(-3)||mest_vi(-3)) &&
       (gl_pnmn(-2)||gl_pemn(-2)||gl_nemn(-2)) &&
         mest_mnim(-1) && s(-3,-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[422]++; if(dbg){print "R422"}; continue;};
 if ( mest_mn(-1) &&
      (gl_pnmn(1)||gl_pemn(1)) &&
        suw_mnvi(2) && s(-1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[423]++; if(dbg){print "R423"}; continue;};
 if ( mest_mn(-1) &&
      (gl_pomn(1)||gl_povzmn(1)) &&
        nar_mest(2) && s(-1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[424]++; if(dbg){print "R424"}; continue;};
 if ( mest_mn(1) &&
       nar_mest(2) &&
        gl_vzmn(3) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[425]++; if(dbg){print "R425"}; continue;};
 if ( mest_mn(1) &&
      (gl_pnmn(2)||gl_pemn(2)) &&
        suw_mnvi(3) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[426]++; if(dbg){print "R426"}; continue;};
 if ( mest_ed(1) &&
       gl_ed(2) && s(0,1) && p(2) )
 { sub(/([Ее])/, "ё", l[i]); r[427]++; if(dbg){print "R427"}; continue;};
 if ( (gl_pnmn(1)||gl_pemn(1)) &&
       (prl_mnim(2)||prq_mnim(2)||prq_edim(2)||prl_edim(2)) &&
         suw_mnvi(3) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[428]++; if(dbg){print "R428"}; continue;};
 # оглядывающий + все + вокруг + всех
 if ( nar_mest(-1) &&
       w(1,"как") &&
        pre_ro(2) &&
         (mest_ro(3)||suw_edro(3)||suw_mnro(3)||prl_edro(3)||prl_mnro(3)||prq_edro(3)||prq_mnro(3)) && s(-1,2) )
 { sub(/[Ее]/, "ё", l[i]); r[429]++; if(dbg){print "R429"}; continue;};
 if ( (prq_edim(-1)||prq_mnim(-1)) &&
        pre_ro(1) &&
        (mest_ro(2)||suw_edro(2)||suw_mnro(2)||prl_edro(2)||prl_mnro(2)||prq_edro(2)||prq_mnro(2)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[430]++; if(dbg){print "R430"}; continue;};
 # все + против + всех
 if ( gl_in(-1) &&
       pre_ro(1) &&
       (mest_ro(2)||prl_edro(2)||prl_mnro(2)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[431]++; if(dbg){print "R431"}; continue;};
 if ( w(1,"для ради") && Q(-1,"gl_vzed") &&
      (mest_ro(2)||suw_edro(2)||suw_mnro(2)||prl_edro(2)||prl_mnro(2)||prq_edro(2)||prq_mnro(2)) && s(-1,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[432]++; if(dbg){print "R432"}; continue;};
 if ( vvb(-1) && suw_mnim(vvn) &&
       pre_ro(1) &&
       (mest_ro(2)||suw_edro(2)||suw_mnro(2)||prl_edro(2)||prl_mnro(2)||prq_edro(2)||prq_mnro(2)) && s(0,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[433]++; if(dbg){print "R433"}; continue;};
 if ( gl_ed(-1) &&
       pre_ro(1) &&
       (mest_ro(2)||suw_edro(2)||suw_mnro(2)||prl_edro(2)||prl_mnro(2)||prq_edro(2)||prq_mnro(2)) && s(-1,1) && p(2) )
 { sub(/[Ее]/, "ё", l[i]); r[434]++; if(dbg){print "R434"}; continue;};
 if ( pre_ro(1) &&
      (mest_ro(2)||suw_edro(2)||suw_mnro(2)||prl_edro(2)||prl_mnro(2)||prq_edro(2)||prq_mnro(2)) &&
        w(3,"так слишком") &&
         prl_kred_sr(4) && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); r[435]++; if(dbg){print "R435"}; continue;};
 if ( pre_ro(1) && !(gl_vzed(-1)||gl_ed(-1)||gl_ed(3)) &&
      (mest_ro(2)||suw_edro(2)||suw_mnro(2)||prl_edro(2)||prl_mnro(2)||prq_edro(2)||prq_mnro(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[436]++; if(dbg){print "R436"}; continue;};
 if ( w(1,"кроме") && sc(0,",") &&
         cap(2) && s(1,1) )
 { sub(/[Ее]/, "<_&_>", l[i]); r[437]++; if(dbg){print "R437"}; continue;};


 # дееп =============================================================
 if ( (prl_srav(1)||nar_step(1)) &&
        deep(2) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[438]++; if(dbg){print "R438"}; continue;};
 if ( deep(1) &&
      (gl_nemn(2)||gl_pnmn(2)||gl_pemn(2)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[439]++; if(dbg){print "R439"}; continue;};
 if ( deep(-2) &&
      (suw_edtv(-1)||suw_mntv(-1)) &&
        nar_mest(1) && s(-2,0) )
 { sub(/[Ее]/, "ё", l[i]); r[440]++; if(dbg){print "R440"}; continue;};
 if ( deep(-2) &&
       mest_vi(-1) &&
        prl_srav(1) && s(-2,0) )
 { sub(/[Ее]/, "ё", l[i]); r[441]++; if(dbg){print "R441"}; continue;};
 if ( deep(-1) &&
       pre_vi(1) &&
       (prl_edvi(2)||prl_mnvi(2)||suw_edvi(2)||suw_mnvi(2)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[442]++; if(dbg){print "R442"}; continue;};
 if ( deep(-1) &&
       pre_pr(1) &&
       (prl_edpr(2)||suw_edpr(2)||suw_mnpr(2)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[443]++; if(dbg){print "R443"}; continue;};
 if ( deep(-1) &&
       pre_tv(1) &&
       (prl_edtv(2)||prl_mntv(2)||suw_edtv(2)||suw_mntv(2)||mest_tv(2)) && s(-1,1) )
 { sub(/[Ее]/, "ё", l[i]); r[444]++; if(dbg){print "R444"}; continue;};
 if ( deep(-1) &&
       prl_srav(1) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); r[445]++; if(dbg){print "R445"}; continue;};
 if ( deep(-1) &&
       gl_nemn(1) && s(-1,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[446]++; if(dbg){print "R446"}; continue;};
 if ( deep(-1) && s(-1,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); r[447]++; if(dbg){print "R447"}; continue;};
 if ( gl_nemn(-1) &&
      (prl_mnim(1)||prq_mnim(1)||prl_krmn(1)) &&
        deep(2) && s(-1,0) && sc(1,",") )
 { sub(/[Ее]/, "ё", l[i]); r[448]++; if(dbg){print "R448"}; continue;};

 # Все + ... + глагол ============================================
 # все + ... + гл.мн.
 if ( w(1,"так") &&
       (gl_vzmn(2)||gl_nemn(2)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[449]++; if(dbg){print "R449"}; continue;};
 if ( (nar_mest(1)||nar_kaq(1)||nar_vrem(1)||nar_spos(1)) &&
       (gl_vzmn(2)||gl_nemn(2)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[450]++; if(dbg){print "R450"}; continue;};
 if ( (nar_mest(1)||nar_kaq(1)||nar_vrem(1)||nar_spos(1)) &&
       (gl_pnmn(2)||gl_pemn(2)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[450]++; if(dbg){print "R450"}; continue;};
 if ( nar_vrem(1) &&
       nar_vrem(2) &&
       (gl_vzmn(3)||gl_nemn(3)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[451]++; if(dbg){print "R451"}; continue;};
 if ( (gl_vzed(-1)||gl_vzmn(-1)||gl_nemn(-1)) &&
        prl_srav(1) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); r[452]++; if(dbg){print "R452"}; continue;};
 if ( nar_srav(1) &&
      (gl_vzmn(2)||gl_nemn(2)||gl_pemn(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[453]++; if(dbg){print "R453"}; continue;};
 if ( suw_mnim(-1) && cap(-1) &&
      (gl_vzmn(1)||gl_nemn(1)) && s(0,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[454]++; if(dbg){print "R454"}; continue;};
 if ( Q(-2,"pre_vi") &&
       suw_edim(-1) &&
       (gl_vzmn(1)||gl_nemn(1)) && s(-1,0) && p(1) )
 { sub(/([Ее])/, "ё", l[i]); r[455]++; if(dbg){print "R455"}; continue;};
 if ( (suw_edim(-3)||suw_mnim(-3)) &&
        pre_pr(-2) &&
        (suw_edpr(-1)||suw_mnpr(-1)) &&
         (gl_vzmn(1)||gl_nemn(1)) && s(0,0) && p(1) )
 { sub(/([Ее])/, "ё", l[i]); r[456]++; if(dbg){print "R456"}; continue;};
 if ( gl_vzmn(-3) &&
       pre_tv(-2) &&
       (suw_edtv(-1)||suw_mntv(-1)||mest_tv(-1)) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[457]++; if(dbg){print "R457"}; continue;};


 # Всё + ... + глагол.мн + дополнение ============================
  if ( gl_pemn(-2) &&
        w(-1,"себя") && s(-2,-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[458]++; if(dbg){print "R458"}; continue;};
if ( gl_nemn(1) &&
       nar_kaq(2) &&
        prq_krmn(3) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[459]++; if(dbg){print "R459"}; continue;};
 if ( gl_nemn(1) &&
       prl_krmn(2) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[460]++; if(dbg){print "R460"}; continue;};
 if ( (gl_pemn(1)||gl_pnmn(1)) &&
       (suw_edro(2)||suw_mnro(2)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[461]++; if(dbg){print "R461"}; continue;};

 if ( (gl_pemn(1)||gl_pnmn(1)) &&
       (suw_edtv(2)||suw_mntv(2)||suw_edda(2)||suw_mnda(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[462]++; if(dbg){print "R462"}; continue;};

 # все + гл.мн и/или гл.мн
 if ( (gl_pemn(1)||gl_nemn(1)||gl_pnmn(1)||gl_vzmn(1)) &&
        w(2,"и") &&
        (gl_pemn(3)||gl_nemn(3)||gl_pnmn(3)||gl_vzmn(3)) && s(0,2) && qq(1,3) )
 { sub(/[Ее]/, "ё", l[i]); r[463]++; if(dbg){print "R463"}; continue;};
 if ( mest_mnim(-2) && w(-1,"то") && se(-2,"-") &&
      (gl_pemn(1)||gl_nemn(1)||gl_pnmn(1)||gl_vzmn(1)) &&
        w(2,"и") &&
        (gl_pemn(3)||gl_nemn(3)||gl_pnmn(3)||gl_vzmn(3)) && s(0,2) )
 { sub(/([Ее])/, "ё", l[i]); r[464]++; if(dbg){print "R464"}; continue;};
 if ( mest_mnim(-1) &&
      (gl_pemn(1)||gl_nemn(1)||gl_pnmn(1)||gl_vzmn(1)) &&
        w(2,"и") &&
        (gl_pemn(3)||gl_nemn(3)||gl_pnmn(3)||gl_vzmn(3)) && s(0,2) )
 { sub(/([Ее])/, "ё", l[i]); r[465]++; if(dbg){print "R465"}; continue;};
 if ( w(1,"и") &&
      (gl_pemn(2)||gl_nemn(2)||gl_pnmn(2)||gl_vzmn(2)) &&
        w(3,"и") &&
        (gl_pemn(4)||gl_nemn(4)||gl_pnmn(4)||gl_vzmn(4)) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[466]++; if(dbg){print "R466"}; continue;};
 if ( (gl_pemn(1)||gl_nemn(1)||gl_pnmn(1)||gl_vzmn(1)) &&
        w(2,"и") &&
        (gl_pemn(3)||gl_nemn(3)||gl_pnmn(3)||gl_vzmn(3)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[467]++; if(dbg){print "R467"}; continue;};

 # гл.ед + ... + всё
 if ( (gl_ed(-1)||gl_in(-1)) &&
       (nar_vrem(1)||nar_mest(1)||nar_spos(1)||nar_srav(1)||nar_kaq(1)||suw_edvi(1)) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); r[468]++; if(dbg){print "R468"}; continue;};
 # гл.ед + всё
 if ( (gl_ed(-2)||gl_in(-2)) &&
        mest_da(-1) &&
         pre_pr(1) &&
         (prl_edpr(2)||prl_mnro(2)||suw_edpr(2)||suw_mnpr(2)) && s(-2,1) )
 { sub(/[Ее]/, "ё", l[i]); r[469]++; if(dbg){print "R469"}; continue;};
 # гл.ед + всё
 if ( (gl_ed(-1)||gl_in(-1)) &&
        suw_mnvi(1) && s(-1,0) && W(1,"новые") )
 { sub(/([Ее])/, "<_&_>", l[i]); r[470]++; if(dbg){print "R470"}; continue;};


 # всё то, что
 if ( w(1,"то") && sc(1,",") &&
       mest_edsr(2) )
 { sub(/[Ее]/, "ё", l[i]); r[471]++; if(dbg){print "R471"}; continue;};
 # всё, что
 if ( sc(0,",") &&
       mest_edsr(1) && W(2,"есть") )
 { sub(/[Ее]/, "ё", l[i]); r[472]++; if(dbg){print "R472"}; continue;};
 # все те, кто
 if ( w(1,"те") && sc(1,",") &&
       (mest_edmu(1)||mest_edze(1)) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[473]++; if(dbg){print "R473"}; continue;};
 # все, кто
 if ( sc(0,",") &&
       (mest_edmu(1)||mest_edze(1)) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[474]++; if(dbg){print "R474"}; continue;};
 # учитывало всё, кроме
 if ( gl_ed(-1) && s(-1,-1) &&
       sc(0,",") &&
        w(1,"кроме") )
 { sub(/[Ее]/, "ё", l[i]); r[475]++; if(dbg){print "R475"}; continue;};

 # все, которые
 if ( sc(0,",") &&
      (mest_da(1)||suw_edda(1)||suw_mnda(1)) )
 { sub(/[Ее]/, "ё", l[i]); r[476]++; if(dbg){print "R476"}; continue;};
 if ( sc(0,",") &&
      (mest_mn(1)||prq_mnim(1)) && W(1,"мы вы") )
 { sub(/([Ее])/, "<_&_>", l[i]); r[477]++; if(dbg){print "R477"}; continue;};

 # Ну всё,
 if ( w(-1,"ну") && s(-1,-1) )
 { sub(/[Ее]/, "ё", l[i]); r[478]++; if(dbg){print "R478"}; continue;};



 # Всё + ... + глагол.ед ============================================
 if ( (nar_vrem(1)||nar_mest(1)||nar_spos(1)||nar_srav(1)||nar_kaq(1)||nar_step(3)) &&
        gl_edsr(2) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[479]++; if(dbg){print "R479"}; continue;};
 if ( pre_tv(1) &&
       (mest_tv(2)||suw_edtv(2)||suw_mntv(2)) &&
         prl_edsrim(3) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[480]++; if(dbg){print "R480"}; continue;};
 if ( gl_edsr(-1) && s(-1,-1) )
 { sub(/[Ее]/, "ё", l[i]); r[481]++; if(dbg){print "R481"}; continue;};
 if ( gl_vzed(1) && Q(1,"gl_vzmn") && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); r[482]++; if(dbg){print "R482"}; continue;};
 if ( prl_kred_sr(1) &&
       gl_in(2) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[483]++; if(dbg){print "R483"}; continue;};
 if ( gl_vzed(-1) &&
      (pre_vi(1)||pre_ro(1)||pre_tv(1)) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); r[484]++; if(dbg){print "R484"}; continue;};
 if ( (gl_ed(-1)) &&
        w(1,"так") && sc(1,",") &&
         w(2,"что чтобы") && s(-1,-1) && s(0,0) )
 { sub(/([Ее])/, "ё", l[i]); r[485]++; if(dbg){print "R485"}; continue;};
 if ( sc(0,",") &&
       gl_vzed(-1) && s(-1,-1) )
 { sub(/[Ее]/, "ё", l[i]); r[486]++; if(dbg){print "R486"}; continue;};
 if ( qast(1) &&
       qast(2) &&
       (nar_vrem(3)||nar_mest(3)||nar_spos(3)||nar_srav(3)||nar_kaq(3)||suw_edvi(3)||mest_ed(3)) &&
        (gl_ed(4)||gl_in(4)) && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); r[487]++; if(dbg){print "R487"}; continue;};
 if ( qast(1) &&
       qast(2) &&
       (nar_vrem(3)||nar_mest(3)||nar_spos(3)||nar_srav(3)||nar_kaq(3)||suw_edvi(3)||mest_ed(3)) &&
         qast(4) &&
         (gl_ed(5)||gl_in(5)) && s(0,4) )
 { sub(/[Ее]/, "ё", l[i]); r[488]++; if(dbg){print "R488"}; continue;};
 if ( qast(1) &&
      (nar_vrem(2)||nar_mest(2)||nar_spos(2)||nar_srav(2)||nar_kaq(2)||suw_edvi(2)||mest_ed(2)) &&
       (gl_ed(3)||gl_in(3)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[489]++; if(dbg){print "R489"}; continue;};
 if ( qast(1) &&
      (nar_vrem(2)||nar_mest(2)||nar_spos(2)||nar_srav(2)||nar_kaq(2)||suw_edvi(2)||mest_ed(2)) &&
        qast(3) &&
        (gl_ed(4)||gl_in(4)) && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); r[490]++; if(dbg){print "R490"}; continue;};
 if ( mest_mnim(-2) &&
       gl_pnmn(-1) &&
       (nar_vrem(1)||nar_mest(1)||nar_spos(1)||nar_srav(1)||nar_kaq(1)||suw_edvi(1)||mest_ed(1)) && s(-2,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[491]++; if(dbg){print "R491"}; continue;};
 if ( (nar_vrem(1)||nar_mest(1)||nar_spos(1)||nar_srav(1)||nar_kaq(1)||suw_edvi(1)||mest_ed(1)) &&
        qast(2) &&
        (gl_ed(3)||gl_in(3)) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[492]++; if(dbg){print "R492"}; continue;};
 if ( gl_nemn(-1) &&
       gl_in(1) && s(-1,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[493]++; if(dbg){print "R493"}; continue;};
 if ( nar_mest(1) &&
       mest_da(2) &&
        gl_ed(3) && s(0,2) )
 { sub(/[Ее]/, "ё", l[i]); r[494]++; if(dbg){print "R494"}; continue;};
 if ( nar_mest(1) &&
       mest_da(2) &&
        qast(3) &&
         gl_ed(4) && s(0,3) )
 { sub(/[Ее]/, "ё", l[i]); r[495]++; if(dbg){print "R495"}; continue;};
 if ( nar_mest(1) &&
       gl_pnmn(2) &&
        gl_in(3) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[496]++; if(dbg){print "R496"}; continue;};
 if ( nar_mest(1) &&
       gl_pnmn(2) &&
        qast(3) &&
         gl_in(4) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[497]++; if(dbg){print "R497"}; continue;};
 if ( (gl_pnmn(1)||gl_pemn(1)) &&
       gl_in(2) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[498]++; if(dbg){print "R498"}; continue;};
 if ( (gl_pnmn(1)||gl_pemn(1)) &&
       qast(2) &&
        gl_in(3) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[499]++; if(dbg){print "R499"}; continue;};
 if ( (gl_ed(1)||gl_in(1)) && s(0,0) && cap(0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[500]++; if(dbg){print "R500"}; continue;};
 if ( pre_ro(-2) &&
       mest_ro(-1) &&
       (gl_ed(1)||gl_in(1)) && s(-2,0) )
 { sub(/[Ее]/, "ё", l[i]); r[501]++; if(dbg){print "R501"}; continue;};
 if ( w(1,"и не ли так как же") &&
      (gl_ed(2)||gl_in(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[502]++; if(dbg){print "R502"}; continue;};
 if ( gl_ed(-3) &&
       w(-2,"бы") &&
        mest_mnvi(-1) &&
        (gl_ed(1)||gl_in(1)) && s(-3,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[503]++; if(dbg){print "R503"}; continue;};
 if ( gl_ed(-3) &&
       pre_pr(-2) &&
       (suw_edpr(-1)||suw_mnpr(-1)||prl_edpr(-1)||prl_mnpr(-1)||wc(-1,"ах$")) && s(-3,-1) )
 { sub(/([Ее])/, "ё", l[i]); r[504]++; if(dbg){print "R504"}; continue;};
 if ( gl_ed(-1) &&
       pre_pr(1) &&
       (suw_edpr(2)||suw_mnpr(2)||prl_edpr(2)||prl_mnpr(2)||wc(2,"ах$")) && s(-1,1) )
 { sub(/([Ее])/, "ё", l[i]); r[505]++; if(dbg){print "R505"}; continue;};
 if ( gl_ed(-2) &&
       mest_mnvi(-1) &&
       (gl_ed(1)||gl_in(1)) && s(-2,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[506]++; if(dbg){print "R506"}; continue;};
 if ( mest_mnvi(-1) &&
      (gl_ed(1)||gl_in(1)) && s(-1,0) )
 { sub(/[Ее]/, "ё", l[i]); r[507]++; if(dbg){print "R507"}; continue;};
 if ( (gl_ed(1)||gl_in(1)) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); r[508]++; if(dbg){print "R508"}; continue;};
 if (  mest_da(1) &&
        (gl_ed(2)||gl_in(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[509]++; if(dbg){print "R509"}; continue;};
 if (  (nar_vrem(1)||nar_mest(1)||nar_spos(1)||nar_step(1)||nar_srav(1)||nar_kaq(1)) &&
        (gl_ed(2)||gl_in(2)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[510]++; if(dbg){print "R510"}; continue;};


 # все + ... + перех глагол ============================================
 if ( mest_mn(1) &&
      (gl_pemn(2)||gl_pnmn(2)) &&
        w(3,"о об") &&
        (mest_pr(4)||suw_edtv(4)||suw_mntv(4)) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[511]++; if(dbg){print "R511"}; continue;};
 if ( (gl_pemn(1)||gl_pnmn(1)) &&
        w(2,"о об") &&
        (mest_pr(3)||suw_edtv(3)||suw_mntv(3)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[512]++; if(dbg){print "R512"}; continue;};
 if ( mest_vi(1) &&
      (gl_pemn(2)||gl_pnmn(2)) &&
       (suw_mnvi(3)||prl_mnvi(3)) && s(0,1) )
 { sub(/[Ее]/, "ё", l[i]); r[513]++; if(dbg){print "R513"}; continue;};
 if ( mest_vi(1) &&
      (gl_pemn(2)||gl_pnmn(2)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[514]++; if(dbg){print "R514"}; continue;};
 if ( wc(1,"..ы$") &&
      (gl_pemn(2)||gl_pnmn(2)||gl_nemn(2)||gl_vzmn(2)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[515]++; if(dbg){print "R515"}; continue;};
 if ( prl_kred_sr(1) &&
      (gl_pemn(2)||gl_pnmn(2)) &&
       (suw_edvi(3)||suw_mnvi(3)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[516]++; if(dbg){print "R516"}; continue;};
 if ( mest_vi(1) &&
       qast(2) &&
       (gl_pemn(3)||gl_pnmn(3)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[517]++; if(dbg){print "R517"}; continue;};
 if (gl_pemn(1) &&
     (prl_edvi(2)||prl_mnvi(2)||prq_mnvi(2)) &&
       (suw_edvi(3)||suw_mnvi(3)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[518]++; if(dbg){print "R518"}; continue;};
 if (qast(1) &&
      gl_pemn(2) &&
      (prl_edvi(3)||prl_mnvi(3)||prq_edvi(3)||prq_mnvi(3)) &&
       (suw_edvi(4)||suw_mnvi(4)) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[519]++; if(dbg){print "R519"}; continue;};
 if (mest_mnim(1) &&
     (gl_pemn(2)||gl_pnmn(2)) &&
      (prl_edvi(3)||prl_mnvi(3)||prq_edvi(3)||prq_mnvi(3)) &&
       (suw_edvi(4)||suw_mnvi(4)) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[520]++; if(dbg){print "R520"}; continue;};
 if (mest_mnim(1) &&
     (gl_pemn(2)||gl_pnmn(2)) &&
      (prl_edvi(3)||prl_mnvi(3)||prq_mnvi(3)||prl_edvi(3)) &&
       (prl_edvi(4)||prl_mnvi(4)||prq_mnvi(4)||prl_edvi(4)) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[521]++; if(dbg){print "R521"}; continue;};
 if (mest_mnim(1) &&
      qast(2) &&
      (gl_pemn(3)||gl_pnmn(3)) &&
       (prl_edvi(4)||prl_mnvi(4)||prq_mnvi(4)) &&
        (suw_edvi(5)||suw_mnvi(5)) && s(0,4) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[522]++; if(dbg){print "R522"}; continue;};
 if (gl_pnmn(1) &&
      pre_vi(2) &&
       suw_edvi(3) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[523]++; if(dbg){print "R523"}; continue;};
 if ( (gl_nemn(1)||gl_pnmn(1)||gl_pemn(1)) &&
        nar_srav(2) && s(0,1) && p(2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[524]++; if(dbg){print "R524"}; continue;};
 if ( suw_mnvi(-1) &&
      (gl_nemn(1)||gl_pnmn(1)||gl_pemn(1)) &&
        pre_pr(2) &&
        (suw_edpr(3)||suw_edme(3)) && s(-1,2) )
 { sub(/[Ее]/, "ё", l[i]); r[525]++; if(dbg){print "R525"}; continue;};
 if ( (gl_nemn(1)||gl_pnmn(1)||gl_pemn(1)) &&
        pre_pr(2) &&
        (suw_edpr(3)||suw_edme(3)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[526]++; if(dbg){print "R526"}; continue;};
 if (qast(1) &&
      gl_pnmn(2) &&
       pre_vi(3) &&
        suw_edvi(4) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[527]++; if(dbg){print "R527"}; continue;};
 if (gl_pnmn(1) &&
      pre_vi(2) &&
       mest_vi(3) &&
        suw_edvi(4) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[528]++; if(dbg){print "R528"}; continue;};
 if (qast(1) &&
      gl_pnmn(2) &&
       pre_vi(3) &&
        mest_vi(4) &&
         suw_edvi(5) && s(0,4) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[529]++; if(dbg){print "R529"}; continue;};
 if (gl_pnmn(1) &&
      pre_vi(2) &&
       mest_vi(3) && s(0,2) && p(3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[530]++; if(dbg){print "R530"}; continue;};
 if (prl_kred_sr(1) &&
      gl_pnmn(2) &&
       pre_vi(3) &&
        mest_vi(4) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[531]++; if(dbg){print "R531"}; continue;};
 if (pre_vi(1) &&
      mest_vi(2) &&
       gl_pnmn(3) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[532]++; if(dbg){print "R532"}; continue;};
 if (pre_vi(1) &&
      mest_vi(2) &&
       qast(3) &&
        gl_pnmn(4) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[533]++; if(dbg){print "R533"}; continue;};
 if (pre_tv(1) &&
      mest_tv(2) &&
       nar_mest(3) &&
        gl_vzmn(4) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[534]++; if(dbg){print "R534"}; continue;};
 if (pre_pr(1) &&
     (prl_edpr(2)||prl_mnpr(2)) &&
      (suw_edpr(3)||suw_mnpr(3)) &&
        gl_ed(4) && s(0,3) )
 { sub(/([Ее])/, "ё", l[i]); r[535]++; if(dbg){print "R535"}; continue;};
 if (pre_pr(1) &&
     (prl_edpr(2)||prl_mnpr(2)) &&
      (suw_edpr(3)||suw_mnpr(3)) &&
       (gl_vzmn(4)||gl_nemn(4)) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[536]++; if(dbg){print "R536"}; continue;};
 if ( (gl_pemn(1)||gl_pnmn(1)) &&
        mest_vi(2) &&
        (prl_edvi(3)||prl_mnvi(3)||prq_mnvi(3)||suw_edvi(3)||suw_mnvi(3)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[537]++; if(dbg){print "R537"}; continue;};
 if (qast(1) &&
     (gl_pemn(2)||gl_pnmn(2)) &&
       mest_vi(3) &&
       (prl_edvi(4)||prl_mnvi(4)||prq_mnvi(4)||suw_edvi(4)||suw_mnvi(4)) && s(0,3) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[538]++; if(dbg){print "R538"}; continue;};
 if ( (gl_pemn(1)||gl_pnmn(1)) && cap(0) &&
       (suw_edvi(2)||suw_mnvi(2)||mest_vi(2)) &&
         gl_in(3) && s(0,2) )
 { sub(/([Ее])/, "ё", l[i]); r[539]++; if(dbg){print "R539"}; continue;};
 if ( (gl_pemn(1)||gl_pnmn(1)) &&
       (suw_edvi(2)||suw_mnvi(2)||mest_vi(2)) && s(0,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[540]++; if(dbg){print "R540"}; continue;};
 if (mest_da(-1) &&
     (suw_edvi(1)||suw_mnvi(1)) &&
      (gl_pemn(2)||gl_pnmn(2)) && s(-1,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[541]++; if(dbg){print "R541"}; continue;};
 if ((qast(1)||mest_da(1)) &&
      (gl_pemn(2)||gl_pnmn(2)) &&
       (suw_edvi(3)||suw_mnvi(3)||mest_vi(3)) && s(0,2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[542]++; if(dbg){print "R542"}; continue;};



 # гл.мн + все + ...  ============================================
 # гл.мн + все + ... + доп.
 if ( (gl_vzmn(-1)||gl_nemn(-1)) &&
        sc(0,",") &&
        (nar_mest(1)||nar_kaq(1)||nar_vrem(1)||nar_spos(1)||mest_mn(1)||suw_edda(1)) && s(-1,-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[543]++; if(dbg){print "R543"}; continue;};
 if ( (gl_pemn(1)) && sc(1,",") &&
        w(2,"что") && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[544]++; if(dbg){print "R544"}; continue;};
 if ( (gl_vzmn(-1)||gl_nemn(-1)) && s(-1,-1) &&
        sc(0,",") )
 { sub(/([Ее])/, "<_&_>", l[i]); r[545]++; if(dbg){print "R545"}; continue;};


 # ... + всё[;.?!]
 if ( (w(-1,"и")||mest_ed(-1)||nar_vrem(-1)) && s(-1,-1) && cap(-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); r[546]++; if(dbg){print "R546"}; continue;};

 if ( (gl_vzmn(-1)||gl_nemn(-1)) && s(-1,-1) && p(0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[547]++; if(dbg){print "R547"}; continue;};

 if ( (gl_ed(-1)||gl_in(-1)) && s(-1,-1) && (p(0)||pre_any(1)) )
 { sub(/[Ее]/, "ё", l[i]); r[548]++; if(dbg){print "R548"}; continue;};

 if ( w(1,"были") && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[549]++; if(dbg){print "R549"}; continue;};


 # звательное ---------------------------
 if ( zvat(1) && sc(0,",") && p(1) )
 { sub(/([Ее])/, "ё", l[i]); r[550]++; if(dbg){print "R550"}; continue;};

 # вводные предложения ----------------------------------------------------
 if ( vv(0) &&
       suw_mnim(vvn+1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[551]++; if(dbg){print "R551"}; continue;};
 if ( mest_mnim(1) && vv(1) &&
      (nar_spos(vvn+1)||prl_kred_sr(vvn+1)) &&
        prl_krmn(vvn+2) && s(0,0) && s(vvn+1,vvn+1) && p(vvn+2) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[552]++; if(dbg){print "R552"}; continue;};
 if ( mest_mnim(1) && vv(1) &&
       gl_povzmn(vvn+1) && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[553]++; if(dbg){print "R553"}; continue;};
 if ( mest_mnim(1) && vv(1) &&
       nar_mest(vvn+1) &&
        nar_mest(vvn+2) && s(0,0) && s(vvn+1,vvn+1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[554]++; if(dbg){print "R554"}; continue;};
 if ( vv(1) &&
       gl_edsr(vvn+1) )
 { sub(/[Ее]/, "ё", l[i]); r[555]++; if(dbg){print "R555"}; continue;};
 if ( vv(0) && (gl_vzmn(vvn+1)||gl_nemn(vvn+1)) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[556]++; if(dbg){print "R556"}; continue;};
 if ( vvb(-1) && suw_mnim(vvn) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[557]++; if(dbg){print "R557"}; continue;};
 if ( vvb(-2) &&
       w(vvn,"вот") &&
        w(-1,"и") && s(-1,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); r[558]++; if(dbg){print "R558"}; continue;};

 # поиск вперёд ----------------------------------------------------------
 if ( qf(7,"gl_edsr") &&
       (prl_kred_sr(qfn+1)||suw_edtv(qfn+1)) && s(0,qfn) )
 { sub(/[Ее]/, "ё", l[i]); r[559]++; if(dbg){print "R559"}; continue;};
 if ( qf(7,"gl_nemn") &&
       prq_krmn(qfn+1) && s(0,qfn) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[560]++; if(dbg){print "R560"}; continue;};
 if ( qf(5,"gl_edsr") && s(0,qfn-1) )
 { sub(/[Ее]/, "ё", l[i]); r[561]++; if(dbg){print "R561"}; continue;};
 if ( mest_it(1) &&
       mest_da(2) &&
        qf(7,"prl_kred_sr") && s(0,qfn-1) && p(qfn) )
 { sub(/[Ее]/, "ё", l[i]); r[562]++; if(dbg){print "R562"}; continue;};
 if ( mest_mn(1) &&
       qf(6,"gl_vzmn") && s(0,qfn-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[563]++; if(dbg){print "R563"}; continue;};
 if ( qf(5,"gl_vzmn") && s(0,qfn-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[564]++; if(dbg){print "R564"}; continue;};

 #--- фразы ----------------------------------------------------

 # поиск назад ------------------------------------------------------------
 if ( pre_ro(1) && qb(-4,"mest_mn") &&
      (suw_edro(2)||suw_mnro(2)) && s(qbn,1) )
 { sub(/[Ее]/, "ё", l[i]); r[565]++; if(dbg){print "R565"}; continue;};
 if ( qb(-7,"mest_im") &&
       phs(-1,"как и") && s(-2,-1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[566]++; if(dbg){print "R566"}; continue;};
 if ( qb(-5,"suw_mnim") &&
        pre_pr(1) &&
        (mest_pr(2)||suw_edtv(2)||suw_mntv(2)) && s(qbn,1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[567]++; if(dbg){print "R567"}; continue;};
 if ( (qb(-5,"prl_krmn")||qb(-5,"mest_mnim")) && sv(qbn,0,".") &&
       (prl_kred_sr(1)||prl_edsrim(1)) && s(0,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[568]++; if(dbg){print "R568"}; continue;};

 # Конечное подбирание хвостов ----------------------------------------------
 if ( (nar_spos(1)||nar_napr(1)||nar_step(1)) && s(0,0) && p(1) )
 { sub(/[Ее]/, "ё", l[i]); r[569]++; if(dbg){print "R569"}; continue;};
 if ( suw_mnim(1) && (prl_mnim(1)||prl_mnvi(1)) && W(1,"новые") && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[570]++; if(dbg){print "R570"}; continue;};
 if ( (prq_mnim(1)||prq_krmn(1)) && s(0,0) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[571]++; if(dbg){print "R571"}; continue;};
 if ( (gl_vzmn(1)||gl_nemn(1)) && s(0,0) && p(1) )
 { sub(/([Ее])/, "<_&_>", l[i]); r[572]++; if(dbg){print "R572"}; continue;};
 if ( gl_poed(-1) && s(-1,-1) && p(0) )
 { sub(/[Ее]/, "ё", l[i]); r[573]++; if(dbg){print "R573"}; continue;};
 if ( deep(1) && s(0,0) )
 { sub(/[Ее]/, "ё", l[i]); r[574]++; if(dbg){print "R574"}; continue;};

 # короткие предложения в зависимости от предыдущей строки
 if (i<=5 && b-prevyo == 1 )
 { sub(/[Ее]/, "ё", l[i]); r[575]++; if(dbg){print "R575"}; continue;};

 # короткие предложения в зависимости от предыдущей строки
 if (i<=5 && b-prevje == 1 )
 { sub(/([Ее])/, "<_&_>", l[i]); r[576]++; if(dbg){print "R576"}; continue;};

             }; delete wpos;

 # всё/все́ в предыдущей строке
 if (nf-i <= 7 ) {
        if (tolower(l[i]) == "всё"    ) {prevyo = b};
        if (tolower(l[i]) == "вс<_е_>") {prevje = b};
 };

 book[b]=joinpat(l,sep,nf)
 book[b]=gensub(/<_([Ее])_>/,"\\1\xcc\x81","g",book[b]) };}; ###_footer_vsez
 
### THE_x_END !_#_!

# вывести изменённую строку

for (i in book) { print book[i]}

#dbg = 1
#dbgstat = 1;
 cmd = "rm _stat.txt _yo.txt _vsez.txt"
 if (dbgstat==1) {system(cmd); for (i=1; i<=576; i++) { printf ("%s%s %s %s\n", "R", i, "=", r[i]) >> "_stat.txt"};
 for (i in prevyo) {print i, prevyo[i] >> "_yo.txt"}
 for (i in vsez) { print i, vsez[i] >> "_vsez.txt" }
                 }
  } ###_END_###
