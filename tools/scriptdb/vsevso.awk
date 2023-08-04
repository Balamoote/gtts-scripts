# Правила для пары все-всё
# let @a=1|%s/"V\zs\d\+\ze"/\=''.(@a+setreg('a',@a+1))/g|%s/ V\[\zs\d\+\ze\]++; if(dbg){print "V\(\d\+\)"/\1/g

function VSEVSO_F() {

### все !_#_!
for(wrd in vseT){wln=split(vseT[wrd],omlin," ");for(y=1;y<=wln;y++){b=strtonum(omlin[y]);nf=splitline(book[b]);splitlinescy(bscy[b]); # header1
hyphback(book[b]);hyphbscy(bscy[b]);getwpos(wrd);for(i in wpos){i=strtonum(i);if(tolower(l[i])!=tolower(wrd))continue;is_vsyo=vsyo[l[i]];is_vsje=vsje[l[i]];          # header2


 #v всё же
 if ( w(-1,"не") &&
      w(1,"же ж") &&
      q(2,"suw_mnim gl_vzmn") && s(-1,1) )
 { l[i]=is_vsje; V[1]++; if(dbg){print "V1"}; continue };
 if ( w(1,"же ж") &&
mest_it(2) &&
gl_pnmn(3) && s(0,2) )
 { l[i]=is_vsje; V[2]++; if(dbg){print "V2"}; continue };
 if ( s(0) && w(1,"же ж равно едино одно") )
 { l[i]=is_vsyo; V[3]++; if(dbg){print "V3"}; continue };

 # География
 if ( (geo_sr(1)||wc(1,"[ео]во$ [иы]но$")) && s(0) && cap(1) )
 { l[i]=is_vsyo; V[4]++; if(dbg){print "V4"}; continue };
 if ( geo_mn(1) && s(0) && cap(1) )
 { l[i]=is_vsje; V[5]++; if(dbg){print "V5"}; continue };

 #v всё в (порядке)
 if ( w(1,"ли") && s(0,2) &&
 pre_tv(2) &&
      q(3,"mest_tv prl_tv") &&
      q(4,"suw_tv") &&
    qxs(5,"в","порядке норме ажуре шоколаде исправности") &&
     (p(xsn)||( (w(xsn+1,"и")||q(xsn+1,"pre_any gl_edsr")) && s(xsn) )) )
 { l[i]=is_vsyo; V[6]++; if(dbg){print "V6"}; continue };
 if ( w(1,"ли") && s(0,2) &&
 pre_tv(2) &&
      q(3,"mest_tv suw_tv") &&
    qxs(4,"в","порядке норме ажуре шоколаде исправности") &&
     (p(xsn)||( (w(xsn+1,"и")||q(xsn+1,"pre_any gl_edsr")) && s(xsn) )) )
 { l[i]=is_vsyo; V[7]++; if(dbg){print "V7"}; continue };
 if ( w(1,"ли уже ведь") && s(0,2) &&
         nar_mest(2) &&
    qxs(3,"в","порядке норме ажуре шоколаде исправности") &&
     (p(xsn)||( (w(xsn+1,"и")||q(xsn+1,"pre_any gl_edsr")) && s(xsn) )) )
 { l[i]=is_vsyo; V[8]++; if(dbg){print "V8"}; continue };
 if ( qxs(1,"ли уже ведь","в","порядке норме ажуре шоколаде исправности") &&
       (p(xsn)||( (w(xsn+1,"и")||q(xsn+1,"pre_any gl_edsr")) && s(xsn) )) )
 { l[i]=is_vsyo; V[9]++; if(dbg){print "V9"}; continue };
 if ( qxs(1,"вроде как","будто бы как","в") &&
 prl_edpr(xsn+1) &&
        w(xsn+2,"порядке норме ажуре шоколаде исправности") &&
        s(xsn,xsn+1) && (p(xsn+2)||( (w(xsn+3,"и")||q(xsn+3,"pre_any gl_edsr")) && s(xsn+2,xsn+2) )) )
 { l[i]=is_vsyo; V[10]++; if(dbg){print "V10"}; continue };
 if ( qxs(1,"вроде как","будто бы как","в","порядке норме ажуре шоколаде исправности") &&
       (p(xsn)||( (w(xsn+1,"и")||q(xsn+1,"pre_any gl_edsr")) && s(xsn) )) )
 { l[i]=is_vsyo; V[11]++; if(dbg){print "V11"}; continue };
 if ( q(1,"qast nar_mest") && s(0,1) &&
    qxs(2,"в","порядке норме ажуре шоколаде исправности") &&
     (p(xsn)||( (w(xsn+1,"и")||q(xsn+1,"pre_any gl_edsr")) && s(xsn) )) )
 { l[i]=is_vsyo; V[12]++; if(dbg){print "V12"}; continue };
 if ( w(1,"в") &&
      q(2,"prl_edpr prq_edpr") &&
      w(3,"порядке порядок норме норму ажуре шоколаде исправности") &&
      s(0,2) && ( p(3)||( (w(4,"и")||q(4,"pre_any gl_edsr")) && s(3) )) )
 { l[i]=is_vsyo; V[13]++; if(dbg){print "V13"}; continue };
 if ( qxs(1,"в","порядке порядок норме норму ажуре шоколаде целом исправности меру") &&
       (p(xsn)||( (w(xsn+1,"и")||q(xsn+1,"pre_any gl_edsr")) && s(xsn) )) )
 { l[i]=is_vsyo; V[14]++; if(dbg){print "V14"}; continue };
 if ( qast(1) && s(0,1) &&
       qxs(2,"на","мази") && (p(xsn)||w(xsn+1,"и")) )
 { l[i]=is_vsyo; V[15]++; if(dbg){print "V15"}; continue };
 if ( qxs(1,"на","мази") &&
       (p(xsn)||w(xsn+1,"и")) )
 { l[i]=is_vsyo; V[16]++; if(dbg){print "V16"}; continue };

 # все все
 if ( w(1,"все") &&
      q(2,"gl_pemn gl_pnmn gl_nemn") && s(0,1) )
 { l[i]=is_vsje; V[17]++; if(dbg){print "V17"}; continue };
 if ( wist(-1,"все́") &&
         q(1,"gl_pemn gl_pnmn gl_nemn") && s(-1,0) )
 { l[i]=is_vsyo; V[18]++; if(dbg){print "V18"}; continue };


 #v всё ещё
 if ( w(1,"ещё еще") && s(0) )
 { l[i]=is_vsyo; V[19]++; if(dbg){print "V19"}; continue };

 #v всё ещё
 if ( w(1,"и") &&
      w(2,"вся") && s(0,1) )
 { l[i]=is_vsyo; V[20]++; if(dbg){print "V20"}; continue };
 if ( w(1,"и") &&
      w(2,"всяческие") && s(0,1) )
 { l[i]=is_vsje; V[21]++; if(dbg){print "V21"}; continue };

 #v всё так и
 if ( phf(1,"так и") &&
 (gl_edsr(3)||w(3,"есть")) && s(0,2) )
 { l[i]=is_vsyo; V[22]++; if(dbg){print "V22"}; continue };
 if ( phf(1,"так и") &&
        q(3,"gl_nemn gl_pemn gl_pnmn") && s(0,2) )
 { l[i]=is_vsje; V[23]++; if(dbg){print "V23"}; continue };
 if ( qxs(-1,"и так") && Qw_(xsn-1,"mest_mn") &&
        q(1,"gl_nemn gl_pemn gl_pnmn gl_vzmn") && !(qm(1,"gl_mn gl_vzmn","GE","syg")) && s(hsn+1,0) )
 { l[i]=is_vsje; V[24]++; if(dbg){print "V24"}; continue };
 if ( phf(1,"и так") &&
   (gl_ed(3)||w(3,"есть")) && s(0,2) )
 { l[i]=is_vsyo; V[25]++; if(dbg){print "V25"}; continue };

 #v все в
 if ( qxs(1,"в","дом замок убежище") && p(-1) && p(xsn) )
 { l[i]=is_vsje; V[26]++; if(dbg){print "V26"}; continue };

 # фразы

 if ( phf(1,"бы ничего") && sc(hfn-1,",") && s(0,hfn-2) &&
        w(hfn,"только но да однако") )
 { l[i]=is_vsyo; V[27]++; if(dbg){print "V27"}; continue };

 if ( w(-1,"на") && qxs(1,"про","все всё") && s(-1,1) )
 { l[i]=is_vsyo; V[28]++; if(dbg){print "V28"}; continue };
 if ( qxs(-1,"на","все всё","про") && s(-3,-1) )
 { l[i]=is_vsyo; V[29]++; if(dbg){print "V29"}; continue };

 if ((qxs(-1,"вот","и")||
      qxs(-1,"ну","вот","и")) && p(0) )
 { l[i]=is_vsyo; V[30]++; if(dbg){print "V30"}; continue };


 if ( qxs(1,"не","слава","богу")||
      qxs(1,"одно","и","то","же")||
      qxs(1,"раз","и","навсегда")||
      qxs(1,"как","на","духу")||
      qxs(1,"точно","так")||
      qxs(1,"или","ничего")||
      qxs(1,"и","дело")||
      qxs(1,"это","само","по","себе")||
      qxs(1,"совсем","не","так") )
 { l[i]=is_vsyo; V[31]++; if(dbg){print "V31"}; continue };

 if ( qxs(1,"на","одно","лицо")||
      qxs(1,"в","одном","лице")||
      qxs(1,"под","богом","ходим")||
      qxs(1,"за","и","против") )
 { l[i]=is_vsje; V[32]++; if(dbg){print "V32"}; continue };

 if (w(-1,"наконец наконец-то") &&
   qxs(1,"в","сборе") && s(-1,-1) )
 { l[i]=is_vsje; V[33]++; if(dbg){print "V33"}; continue };

 if ( mest_mnim(1) &&
              q(2,"nar_mest nar_vrem") &&
           (qxs(3,"на","одно","лицо")||
            qxs(3,"под","богом","ходим") ) && s(0,1) )
 { l[i]=is_vsje; V[34]++; if(dbg){print "V34"}; continue };

 if ( mest_mnim(1) &&
           (phf(2,"на одно лицо")||
            phf(2,"под богом ходим") ) && s(0,hfn-2) )
 { l[i]=is_vsje; V[35]++; if(dbg){print "V35"}; continue };

 if ((phf(1,"не так уж")||
      phf(1,"так уж") ) &&
            prl_kred_sr(hfn) && s(0,hfn-1) )
 { l[i]=is_vsyo; V[36]++; if(dbg){print "V36"}; continue };

 if ( phf(1,"потому что") && s(0) && sc(1,",") )
 { l[i]=is_vsyo; V[37]++; if(dbg){print "V37"}; continue };
 if ( phf(1,"тип топ") && s(0) && se(1,"-") )
 { l[i]=is_vsyo; V[38]++; if(dbg){print "V38"}; continue };
 if ( phf(1,"не так") && s(0,hfn-2) && p(hfn-1) )
 { l[i]=is_vsyo; V[39]++; if(dbg){print "V39"}; continue };

 if ( qxs(1,"в","таком том этом","же","роде духе разрезе виде смысле") )
 { l[i]=is_vsyo; V[40]++; if(dbg){print "V40"}; continue };
 if ( qxs(1,"в","таком том этом","роде духе разрезе виде смысле") )
 { l[i]=is_vsyo; V[41]++; if(dbg){print "V41"}; continue };


 if ( mest_mnim(1) &&
            phf(2,"под богом ходим") && s(0,2) )
 { l[i]=is_vsje; V[42]++; if(dbg){print "V42"}; continue };
 if ( phf(1,"только и") &&
        q(3,"gl_pnmn gl_pemn gl_nemn") &&
        w(4,"что") && s(0,2) && sc(3,",") )
 { l[i]=is_vsje; V[43]++; if(dbg){print "V43"}; continue };
 if ( w(1,"как") &&
      w(2,"один одна") && ( s(0,1)||( sc(0,",") && s(1)) ) )
 { l[i]=is_vsje; V[44]++; if(dbg){print "V44"}; continue };

 if ( phf(1,"не так уж") &&
        w(4,"и") &&
            prl_kred_sr(5) && s(0,4) )
 { l[i]=is_vsyo; V[45]++; if(dbg){print "V45"}; continue };
 if ( w(-1,"и") && p(0,",") && s(-1) && (sc(-2,"p")||p(-2)) )
 { l[i]=is_vsyo; V[46]++; if(dbg){print "V46"}; continue };

 if ( qxs(-1,"всё все","равно") &&
  gl_pnmn(1) &&
        q(2,"mest_ed mest_mn") && s(-1,0) && sc(1,",") )
 { l[i]=is_vsje; V[47]++; if(dbg){print "V47"}; continue };
 if ( phf(1,"больше по") &&
        q(3,"suw_da") && s(0,2) )
 { l[i]=is_vsyo; V[48]++; if(dbg){print "V48"}; continue };
 if ( gl_mn(1) &&
        qxs(2,"кто","во","что","горазд") && s(0) )
 { l[i]=is_vsje; V[49]++; if(dbg){print "V49"}; continue };

 if ( (phf(1,"песенка спета")) &&
      (cap(0)||p(-1)||w(-1,"и")) && sc(0,",") && s(1,hfn-2) && p(hfn-1) )
 { l[i]=is_vsyo; V[50]++; if(dbg){print "V50"}; continue };

 if ( w(1,"позади понапрасну") && s(0) && p(1) )
 { l[i]=is_vsyo; V[51]++; if(dbg){print "V51"}; continue };
  if ( wf(1,5,"до") &&
        w(wfn+1,"одного единого единой") && s(0,wfn) )
 { l[i]=is_vsje; V[52]++; if(dbg){print "V52"}; continue };

 if ( w(-1,"и") &&
      w(1,"лишь только") &&
     (w(2,"потому оттого")||q(2,"pre_vi pre_ro")) && s(-1,1) )
 { l[i]=is_vsyo; V[53]++; if(dbg){print "V53"}; continue };
 if ( w(-1,"и") && s(-1) && p(0,",") )
 { l[i]=is_vsyo; V[54]++; if(dbg){print "V54"}; continue };
 if ( w(-1,"и") && s(-1) &&
      w(1,"что") && sc(0,0,",") )
 { l[i]=is_vsyo; V[55]++; if(dbg){print "V55"}; continue };

 # Это

 # все + сущ.мн.
 if ( mest_it(1) &&
            q(2,"gl_vzmn gl_nemn mod_bz") && s(0,1) )
 { l[i]=is_vsyo; V[56]++; if(dbg){print "V56"}; continue };
 if ((qxs(-1,"ещё еще","далеко","не")||
      qxs(-1,"ещё еще","не")||
      qxs(-1,"далеко","не") ) &&
  mest_it(xsn-1) && s(xsn-1) )
 { l[i]=is_vsyo; V[57]++; if(dbg){print "V57"}; continue };

 if ( mest_it(1) &&
         (qxs(2,"не","более","чем")||
          qxs(2,"не","в","счёт счет") ) && s(0) )
 { l[i]=is_vsyo; V[58]++; if(dbg){print "V58"}; continue };
 if ( mest_it(-1) &&
          qxs(1,"не","по","душе" ) && s(-1) )
 { l[i]=is_vsyo; V[59]++; if(dbg){print "V59"}; continue };
 if ( mest_it(1) && s(0) &&
          qxs(2,"и","в","самом","деле") &&
     nar_step(xsn+1) &&
  prl_kred_sr(xsn+2) && s(xsn,xsn+1) )
 { l[i]=is_vsyo; V[60]++; if(dbg){print "V60"}; continue };
 if ( mest_it(1) &&
            w(2,"никак") &&
            w(3,"не") &&
        gl_in(4) && s(0,3) )
 { l[i]=is_vsyo; V[61]++; if(dbg){print "V61"}; continue };
 if ( mest_it(-1) &&
     suw_mnim(1) && s(-1,0) && p(1) )
 { l[i]=is_vsyo; V[62]++; if(dbg){print "V62"}; continue };
 if ( mest_it(-1) &&
     suw_mnim(1) && s(-1,0) )
 { l[i]=is_vsyo; V[63]++; if(dbg){print "V63"}; continue };
 if ( mest_it(1) &&
      mest_im(2) &&
      mest_da(3) && s(0,2) )
 { l[i]=is_vsyo; V[64]++; if(dbg){print "V64"}; continue };
 if ( mest_it(1) &&
      mest_da(2) &&
            q(3,"nar_vrem nar_step") &&
  prl_kred_sr(4) && s(0,3) )
 { l[i]=is_vsyo; V[65]++; if(dbg){print "V65"}; continue };
 if ( mest_it(1) &&
      mest_da(2) &&
            q(3,"nar_vrem nar_step") &&
            w(4,"не") &&
        gl_ed(5) && s(0,4) )
 { l[i]=is_vsyo; V[66]++; if(dbg){print "V66"}; continue };
 if ( mest_it(1) &&
      mest_da(2) &&
  prl_kred_sr(3) && s(0,2) && p(3) )
 { l[i]=is_vsyo; V[67]++; if(dbg){print "V67"}; continue };
 if ( mest_da(-1) &&
      mest_it(1) && s(-1,0) )
 { l[i]=is_vsyo; V[68]++; if(dbg){print "V68"}; continue };
 if ( nar_vopr(-2) &&
       mest_it(-1) && s(-2,-1) && p(0) )
 { l[i]=is_vsyo; V[69]++; if(dbg){print "V69"}; continue };
 if ( mest_it(-1) &&
     suw_edim(1) && s(-1,0) )
 { l[i]=is_vsyo; V[70]++; if(dbg){print "V70"}; continue };
 if ( q(-1,"pre_vi pre_ro pre_da") &&
gl_nemn(1) && s(-1,0) )
 { l[i]=is_vsyo; V[71]++; if(dbg){print "V71"}; continue };
 if ( q(-1,"pre_vi pre_ro pre_da") &&
mest_it(1) && s(-1,0) )
 { l[i]=is_vsyo; V[72]++; if(dbg){print "V72"}; continue };
 if ( mest_it(1) &&
     suw_edim(2) && s(0,1) )
 { l[i]=is_vsyo; V[73]++; if(dbg){print "V73"}; continue };
 if ( qast(1) &&
   mest_it(2) && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[74]++; if(dbg){print "V74"}; continue };
 if ( mest_it(1) &&
     suw_mnim(2) && s(0,1) )
 { l[i]=is_vsyo; V[75]++; if(dbg){print "V75"}; continue };
 if ( mest_it(1) &&
            q(2,"nar_kaq nar_spos mest_ed") && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[76]++; if(dbg){print "V76"}; continue };
 if ( mest_it(1) &&
       pre_ro(2) &&
            q(3,"mest_ro suw_ro") && s(0,2) && p(3) )
 { l[i]=is_vsyo; V[77]++; if(dbg){print "V77"}; continue };
 if ( mest_it(-1) &&
       pre_da(1) &&
            q(2,"mest_da suw_da prl_da") && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[78]++; if(dbg){print "V78"}; continue };
 if ( mest_it(-1) &&
       pre_ro(1) &&
            q(2,"mest_ro suw_ro") && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[79]++; if(dbg){print "V79"}; continue };
 if ( mest_it(1) &&
         qast(2) &&
       pre_ro(3) &&
            q(4,"mest_ro suw_ro") && s(0,3) && p(4) )
 { l[i]=is_vsyo; V[80]++; if(dbg){print "V80"}; continue };
 if ( mest_it(-1) &&
      mest_da(1) && s(-1,0) && p(1) )
 { l[i]=is_vsyo; V[81]++; if(dbg){print "V81"}; continue };
 if ( mest_it(1) &&
     nar_vrem(2) &&
            q(3,"gl_pnmn gl_pemn") &&
            q(4,"suw_mnvi prl_mnim") && s(0,3) )
 { l[i]=is_vsyo; V[82]++; if(dbg){print "V82"}; continue };
 if ( mest_mn(-1) &&
      mest_it(1) &&
            q(2,"gl_pemn gl_pnmn") && s(-1,1) && p(2))
 { l[i]=is_vsyo; V[83]++; if(dbg){print "V83"}; continue };
 if ( mest_mn(1) &&
      mest_it(2) &&
            q(3,"gl_pnmn gl_nemn") && s(0,2) && p(3) )
 { l[i]=is_vsje; V[84]++; if(dbg){print "V84"}; continue };
 if ( mest_it(1) &&
    mest_mnim(2) &&
            q(3,"gl_pnmn gl_nemn") &&
      pre_any(4) && s(0,4) )
 { l[i]=is_vsyo; V[85]++; if(dbg){print "V85"}; continue };
 if ( mest_it(-1) &&
      mest_im(1) &&
            q(2,"prl_kred prl_krmn") && s(-1,1) )
 { l[i]=is_vsyo; V[86]++; if(dbg){print "V86"}; continue };
 if ( mest_it(-1) &&
      mest_ed(1) &&
        gl_ed(2) && s(-1,1) )
 { l[i]=is_vsyo; V[87]++; if(dbg){print "V87"}; continue };
 if ( mest_it(-1) &&
      mest_mn(1) &&
            q(2,"gl_pnmn gl_nemn") && s(-1,1) && p(2) )
 { l[i]=is_vsyo; V[88]++; if(dbg){print "V88"}; continue };
 if ( gl_nemn(-1) &&
      mest_it(1) &&
        gl_in(2) && s(-1,1) )
 { l[i]=is_vsyo; V[89]++; if(dbg){print "V89"}; continue };
 if ( mest_it(1) && !(qf(1,5,"gl_pemn gl_pnmn gl_in")) && s(0) )
 { l[i]=is_vsyo; V[90]++; if(dbg){print "V90"}; continue };
 if ( mest_it(-2) &&
            w(-1,"не") && s(-2,-1) && p(0) )
 { l[i]=is_vsyo; V[91]++; if(dbg){print "V91"}; continue };
 if ( mest_it(1) &&
            q(2,"gl_ed gl_in") && s(0,1) )
 { l[i]=is_vsyo; V[92]++; if(dbg){print "V92"}; continue };
 if ( q(-2,"vvod gl_ed") &&
mest_it(-1) && sc(-2,",") && s(-1) && p(0) )
 { l[i]=is_vsyo; V[93]++; if(dbg){print "V93"}; continue };


 # Все как и
 if ( phs(-1,"как и") && s(-2,0) &&
  mest_mn(1) )
 { l[i]=is_vsje; V[94]++; if(dbg){print "V94"}; continue };
 if ( phs(-2,"как и") && s(-3,-1) &&
  mest_mn(-1) )
 { l[i]=is_vsje; V[95]++; if(dbg){print "V95"}; continue };
 if ( phs(-1,"как и") &&
        q(1,"mest_im prl_mnim") && s(-2,0) )
 { l[i]=is_vsje; V[96]++; if(dbg){print "V96"}; continue };
 if ( phs(-1,"как и") &&
   pre_ro(1) &&
  mest_ro(2) && s(-2,1) )
 { l[i]=is_vsje; V[97]++; if(dbg){print "V97"}; continue };
 if ( qxs(-1,"как","и") && sc(0,",") &&
        w(1,"что") )
 { l[i]=is_vsyo; V[98]++; if(dbg){print "V98"}; continue };
 if ( qxs(-1,"как","и") && p(0) )
 { l[i]=is_vsje; V[99]++; if(dbg){print "V99"}; continue };

 # как все
 if ( q(-2,"gl_in prl_im prl_tv") &&
      w(-1,"как") && s(-1) && sc(-2,",") && p(0) )
 { l[i]=is_vsje; V[100]++; if(dbg){print "V100"}; continue };
 if ( gl_in(-2) &&
          w(-1,"как") && s(-2,-1) && p(0) )
 { l[i]=is_vsje; V[101]++; if(dbg){print "V101"}; continue };
 if ( mod_ed(-2) && sc(-2,",") &&
           w(-1,"как") && s(-2,-1) && p(0) )
 { l[i]=is_vsje; V[102]++; if(dbg){print "V102"}; continue };
 if ( qxs(1,"как","будто") &&
  gl_edsr(xsn+1) && s(0) && s(xsn) )
 { l[i]=is_vsyo; V[103]++; if(dbg){print "V103"}; continue };
 if ( w(1,"как") &&
 mod_bz(2) && s(0,1) )
 { l[i]=is_vsyo; V[104]++; if(dbg){print "V104"}; continue };

 # все как
 if ( qxs(1,"как","надо нужно есть было") && s(0) && p(2) )
 { l[i]=is_vsyo; V[105]++; if(dbg){print "V105"}; continue };
 if ( w(1,"как") &&
      q(2,"nar_mest nar_kaq nar_vrem") && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[106]++; if(dbg){print "V106"}; continue };
 if ( gl_pemn(1) &&
          qxs(2,"как","надо нужно есть было дома") && s(0,1) && p(xsn) )
 { l[i]=is_vsyo; V[107]++; if(dbg){print "V107"}; continue };
 if ( w(1,"как") && sc(0,",") &&
      q(2,"prl_tv") &&
      q(3,"suw_tv") && s(1,2) )
 { l[i]=is_vsyo; V[108]++; if(dbg){print "V108"}; continue };
 if ( w(1,"как") && sc(0,",") &&
      q(2,"mest_da suw_da") &&
      w(3,"и") &&
      q(4,"gl_in gl_ed gl_nemn gl_pemn gl_pnmn") && s(1,3) )
 { l[i]=is_vsyo; V[109]++; if(dbg){print "V109"}; continue };

 # Все то же
 if ( phs(-2,"вот и") &&
mest_mnim(-1) &&
        q(1,"mest_it muk_ed muk_mn") &&
        w(2,"же ж") && s(0,1) )
 { l[i]=is_vsje; V[110]++; if(dbg){print "V110"}; continue };
 if ( prl_kred_sr(1) &&
                q(2,"mest_it muk_ed muk_mn") &&
                w(3,"же ж") && s(0,2) )
 { l[i]=is_vsyo; V[111]++; if(dbg){print "V111"}; continue };
 if ( pre_vi(1) &&
           q(2,"mest_it muk_ed muk_mn") &&
           w(3,"же ж") && s(0,2) )
 { l[i]=is_vsyo; V[112]++; if(dbg){print "V112"}; continue };
 if ( q(1,"mest_it muk_ed muk_mn") &&
      w(2,"же ж") && s(0,1) )
 { l[i]=is_vsyo; V[113]++; if(dbg){print "V113"}; continue };

 # Все вместе
 if ( q(-1,"gl_pnin gl_pnmn gl_vzmn") &&
      w(1,"вместе") && s(-1,0) )
 { l[i]=is_vsje; V[114]++; if(dbg){print "V114"}; continue };
 if ( q(-2,"gl_pnin gl_pnmn gl_vzmn") &&
      q(-1,"suw_mnim mest_mnim") &&
      w(1,"вместе") && s(-2,0) )
 { l[i]=is_vsje; V[115]++; if(dbg){print "V115"}; continue };

 if ( w(1,"вместе") && se(1," — ") && s(0) &&
      q(2,"mest_mn mest_ed cap") && sc(2,",") &&
      q(3,"mest_mn mest_ed cap") && p(3) )
 { l[i]=is_vsje; V[116]++; if(dbg){print "V116"}; continue };
 if ( w(1,"вместе") &&
      q(2,"mest_mnim suw_mnim") &&
      q(3,"gl_pemn gl_pnmn") &&
      q(4,"suw_vi prl_vi") && s(0,3) )
 { l[i]=is_vsje; V[117]++; if(dbg){print "V117"}; continue };
 if ( w(1,"вместе") &&
      q(2,"mest_vi suw_vi nar_spos nar_step") &&
      q(3,"gl_pemn gl_pnmn") && s(0,2) && p(3) )
 { l[i]=is_vsje; V[118]++; if(dbg){print "V118"}; continue };

 # безглагольные - элипсис есть/находится
 if ( qik_ro(-2) &&
           w(-1,"и") &&
      pre_pr(1) &&
           q(2,"prl_pr") &&
           q(3,"suw_pr") && s(-2,2) )
 { l[i]=is_vsje; V[119]++; if(dbg){print "V119"}; continue };
 if ( wf(1,7,"мнения") &&
       w(wfn-2,"о") &&
       q(wfn-1,"mest_da suw_da") && s(0,wfn-1) )
 { l[i]=is_vsje; V[120]++; if(dbg){print "V120"}; continue };
 if ( suw_mnro(-4) &&
             w(-3,"было") &&
             w(-2,"много мало") && s(-4,-3) && sc(-2,",") &&
             w(-1,"и но") && s(-1) )
 { l[i]=is_vsje; V[121]++; if(dbg){print "V121"}; continue };


 #v Все + предлог
 if ( Qw_(-1,"mest_mn mest_ed gl_ed gl_in gl_vzmn gl_nemn gl_pemn gl_pnmn gl_poed gl_pomn") &&
   pre_da(1) &&
        q(2,"suw_da") && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[122]++; if(dbg){print "V122"}; continue };
 if ( pre_da(1) && p(-1) &&
           q(2,"prl_da mest_da") &&
           q(3,"suw_da") && s(0,2) )
 { l[i]=is_vsyo; V[123]++; if(dbg){print "V123"}; continue };
 if ( pre_da(-1) && s(0) )
 { l[i]=is_vsyo; V[124]++; if(dbg){print "V124"}; continue };
 if ( ( (w(1,"ли") && s(0))||(w(1,"то") && se(0,"-") ) ) &&
         w(2,"у") &&
   mest_ro(3) &&
             (prl_kred_sr(4)||w(4,"есть")) && s(0,3) && p(4) )
 { l[i]=is_vsyo; V[125]++; if(dbg){print "V125"}; continue };
 if ( w(-3,"у") &&
mest_ro(-2) &&
         nar_spos(-1) &&
         nar_mest(1) && s(-3,0) && p(1) )
 { l[i]=is_vsyo; V[126]++; if(dbg){print "V126"}; continue };
 if ( w(-2,"у") &&
mest_ro(-1) &&
         nar_mest(1) && s(-2,0) && p(1) )
 { l[i]=is_vsyo; V[127]++; if(dbg){print "V127"}; continue };
 if ( pre_vi(-1) &&
           w(1,"чтобы") && s(-1) && sc(0,",") )
 { l[i]=is_vsyo; V[128]++; if(dbg){print "V128"}; continue };
 if ( mest_mnim(1) && sc(0,",") &&
              q(2,"pre_ro pre_vi") &&
              w(3,"кого") && s(1,2) )
 { l[i]=is_vsje; V[129]++; if(dbg){print "V129"}; continue };
 if ( q(1,"pre_ro pre_vi") && sc(0,",") &&
      w(2,"кого" ) && s(1) )
 { l[i]=is_vsje; V[130]++; if(dbg){print "V130"}; continue };
 if ( pre_vi(1) &&
           q(2,"suw_vi") &&
           q(3,"suw_ro") && s(0,2) )
 { l[i]=is_vsyo; V[131]++; if(dbg){print "V131"}; continue };
 if ( pre_ro(-1) &&
           q(1,"prl_ro") &&
           q(2,"suw_ro") &&
    suw_mnro(3) && s(-1,2) )
 { l[i]=is_vsyo; V[132]++; if(dbg){print "V132"}; continue };
 if ( pre_ro(1) &&
     mest_ro(2) &&
    prq_edim(3) && s(0,2) )
 { l[i]=is_vsyo; V[133]++; if(dbg){print "V133"}; continue };
 if ( gl_in(-1) &&
     pre_ro(1) &&
          q(2,"suw_ro cap") && s(0,1) )
 { l[i]=is_vsyo; V[134]++; if(dbg){print "V134"}; continue };
 if ( q(-1,"gl_poed gl_pomn gl_povzmn") &&
 pre_da(1) &&
      q(2,"prl_da mest_da") &&
      q(3,"suw_da") && s(0,2) )
 { l[i]=is_vsyo; V[135]++; if(dbg){print "V135"}; continue };
 if ( q(-1,"gl_poed gl_pomn gl_povzmn") &&
 pre_da(1) &&
      q(2,"suw_da") && s(0,1) )
 { l[i]=is_vsyo; V[136]++; if(dbg){print "V136"}; continue };
 if ( q(-1,"gl_poed gl_pomn gl_povzmn") &&
 pre_ro(1) &&
      q(2,"prl_ro mest_ro") &&
      q(3,"suw_ro") && s(0,2) )
 { l[i]=is_vsyo; V[137]++; if(dbg){print "V137"}; continue };
 if ( q(-1,"gl_poed gl_pomn gl_povzmn") &&
 pre_ro(1) &&
      q(2,"suw_ro") && s(0,1) )
 { l[i]=is_vsyo; V[138]++; if(dbg){print "V138"}; continue };
 if ( pre_ro(1) &&
    suw_mnro(2) && s(0,1) )
 { l[i]=is_vsje; V[139]++; if(dbg){print "V139"}; continue };
 if ( pre_ro(1) && sc(0,",") &&
           q(2,"suw_mnro cap") && s(1) && p(2) )
 { l[i]=is_vsje; V[140]++; if(dbg){print "V140"}; continue };
 if ( q(-1,"pre_ro pre_tv") && s(-1) && p(0,",") )
 { l[i]=is_vsyo; V[141]++; if(dbg){print "V141"}; continue };
 if ( w(1,"за") &&
mest_vi(2) &&
      w(3,"горой") && s(0,2) )
 { l[i]=is_vsje; V[142]++; if(dbg){print "V142"}; continue };
 if ( w(-1,"со ко") && s(-1) )
 { l[i]=is_vsyo; V[143]++; if(dbg){print "V143"}; continue };
 if ( w(1,"до") &&
      w(2,"конца") && s(0,1) )
 { l[i]=is_vsyo; V[144]++; if(dbg){print "V144"}; continue };
 if ( w(1,"до") &&
      w(2,"единого") && s(0,1) )
 { l[i]=is_vsje; V[145]++; if(dbg){print "V145"}; continue };
 if ( pre_pr(-3) &&
           q(-2,"prl_edpr mest_pr") &&
           q(-1,"suw_pr") && s(-3,-1) && p(0) )
 { l[i]=is_vsyo; V[146]++; if(dbg){print "V146"}; continue };
 if ( q(-2,"prl_tv prl_im") &&
 pre_pr(-1) && s(-2,-1) && p(0) )
 { l[i]=is_vsyo; V[147]++; if(dbg){print "V147"}; continue };
 if ( pre_vi(-1) &&
     pre_any(1) && s(-1,0) )
 { l[i]=is_vsyo; V[148]++; if(dbg){print "V148"}; continue };

 # все что
 if ( w(1,"что") &&
  gl_ed(2) )
 { l[i]=is_vsyo; V[149]++; if(dbg){print "V149"}; continue };

 # всё, на что
 if ( sc(0,",") &&
  pre_vi(1) &&
       w(2,"что") && s(1) )
 { l[i]=is_vsyo; V[150]++; if(dbg){print "V150"}; continue };
 if ( sc(0,",") &&
  pre_vi(1) &&
       w(2,"кого") && s(1) )
 { l[i]=is_vsje; V[151]++; if(dbg){print "V151"}; continue };
 if ( pre_vi(-1) &&
     gl_vzmn(1) &&
           q(2,"mest_im prl_im") && s(-1,1) )
 { l[i]=is_vsyo; V[152]++; if(dbg){print "V152"}; continue };
 if ( sc(0,",") &&
  pre_da(1) &&
       w(2,"чему") && s(1) )
 { l[i]=is_vsyo; V[153]++; if(dbg){print "V153"}; continue };
 if ( sc(0,",") &&
  pre_da(1) &&
       w(2,"кому") && s(1) )
 { l[i]=is_vsje; V[154]++; if(dbg){print "V154"}; continue };
 if ( sc(0,",") &&
  pre_pr(1) &&
       w(2,"чём чем") && s(1) )
 { l[i]=is_vsyo; V[155]++; if(dbg){print "V155"}; continue };
 if ( sc(0,",") &&
  pre_pr(1) &&
       w(2,"ком") && s(1) )
 { l[i]=is_vsje; V[156]++; if(dbg){print "V156"}; continue };
 if ( pre_pr(1) &&
           q(2,"mest_pr suw_pr") &&
     gl_edsr(3) && s(0,2) )
 { l[i]=is_vsyo; V[157]++; if(dbg){print "V157"}; continue };
 if ( pre_pr(-1) &&
    nar_mest(1) && s(-1,0) && p(1) )
 { l[i]=is_vsyo; V[158]++; if(dbg){print "V158"}; continue };
 if ( pre_pr(-2) &&
           q(-1,"mest_pr suw_tv") && s(-2,-1) && p(0) )
 { l[i]=is_vsyo; V[159]++; if(dbg){print "V159"}; continue };

 # всё так же
 if ( qxs(1,"так","же") &&
        q(xsn+1,"prl_kred gl_ed gl_vzmn") && s(xsn) )
 { l[i]=is_vsyo; V[160]++; if(dbg){print "V160"}; continue };

 # предикат
 if ( predik(1) && sc(0,",") && p(1) )
 { l[i]=is_vsyo; V[161]++; if(dbg){print "V161"}; continue };
 if ( predik(1) && sc(0,",") && s(1) &&
       gl_in(2) && p(2) )
 { l[i]=is_vsyo; V[162]++; if(dbg){print "V162"}; continue };
 if ( predik(1) &&
           w(2,"и") &&
      predik(3) && s(0,2) && qq(1,3) )
 { l[i]=is_vsyo; V[163]++; if(dbg){print "V163"}; continue };

 # обращение
 if ( cap(1) && sc(0,",") && sc(1,",") &&
 nar_step(2) && p(2) )
 { l[i]=is_vsyo; V[164]++; if(dbg){print "V164"}; continue };


 # кастомные наречия
 if ( nar_napr(1) && nmark(1,"GE","j") && s(0) && p(1) )
 { l[i]=is_vsje; V[165]++; if(dbg){print "V165"}; continue };


 # глаголы с метками, функции qm(n,"класс","признак","марка") в основном словаре
 if ( phf(1,"в один голос") &&
       qm(hfn,"gl_mn","GE","j") && s(0,hfn-1) )
 { l[i]=is_vsje; V[166]++; if(dbg){print "V166"}; continue };
 if ( qm(1,"gl_mn","GE","y") &&
       w(2,"и") &&
       q(3,"gl_pemn gl_nemn gl_pnmn gl_vzmn") && s(0,2) )
 { l[i]=is_vsyo; V[167]++; if(dbg){print "V167"}; continue };
 if ( prl_kred_sr(1) &&
               qm(2,"gl_mn","GE","y") && s(0,1) )
 { l[i]=is_vsyo; V[168]++; if(dbg){print "V168"}; continue };
 if ( pre_pr(-4) &&
          (q(-3,"prl_pr mest_pr")||wc(-3,"ой$ их$")) &&
           q(-2,"suw_pr") &&
          qm(-1,"gl_mn","GE","ogj") && s(-4,-1) && p(0) )
 { l[i]=is_vsje; V[169]++; if(dbg){print "V169"}; continue };
 if ( pre_pr(-3) &&
           q(-2,"suw_pr mest_pr") &&
          qm(-1,"gl_mn","GE","ogj") && s(-3,-1) && p(0) )
 { l[i]=is_vsje; V[170]++; if(dbg){print "V170"}; continue };
 if ( pre_pr(-2) &&
           q(-1,"suw_pr") &&
          qm(1,"gl_mn","GE","ogj") && s(-2,0) && p(1) )
 { l[i]=is_vsje; V[171]++; if(dbg){print "V171"}; continue };
 if ( pre_pr(1) &&
          (q(2,"prl_pr mest_pr")||wc(2,"ой$ их$")) &&
           q(3,"suw_pr") &&
          qm(4,"gl_mn","GE","ogj") && s(0,3) && p(4) )
 { l[i]=is_vsje; V[172]++; if(dbg){print "V172"}; continue };
 if ( pre_pr(1) &&
           q(2,"suw_pr") &&
          qm(3,"gl_mn","GE","ogj") && s(0,2) && p(3) )
 { l[i]=is_vsje; V[173]++; if(dbg){print "V173"}; continue };
 if ( mod_mn(1) &&
          qm(2,"gl_in","GE","py") &&
     pre_any(3) && s(0,3) )
 { l[i]=is_vsyo; V[174]++; if(dbg){print "V174"}; continue };
 if ( qm(-1,"gl_in","GE","qy") && s(-1) &&
      (w(1,"чтобы будто")||q(1,"mest_im nar_vopr")) && sc(0,",") )
 { l[i]=is_vsyo; V[175]++; if(dbg){print "V175"}; continue };
 if ( qm(-1,"gl_mn","GE","qy") && s(-1) &&
      (w(1,"чтобы будто")||q(1,"mest_im nar_vopr")) && sc(0,",") )
 { l[i]=is_vsyo; V[176]++; if(dbg){print "V176"}; continue };
 if ( q(1,"mest_mnim prl_kred_sr") &&
     qm(2,"gl_mn","GE","qj") && s(0,1) &&
     (w(3,"чтобы будто куда")||q(3,"mest_im nar_vopr")) && sc(2,",") )
 { l[i]=is_vsje; V[177]++; if(dbg){print "V177"}; continue };
 if ( qm(1,"gl_mn","GE","qj") && s(0) &&
 pre_any(2) &&
      (w(3,"чтобы будто")||q(3,"mest_im nar_vopr")) && sc(1,",") )
 { l[i]=is_vsje; V[178]++; if(dbg){print "V178"}; continue };
 if ( mest_mnim(-4) &&
              w(-3,"же ведь") &&
            phs(-1,"и так") &&
             qm(1,"gl_mn","GE","syg") && s(hsn-1,0) )
 { l[i]=is_vsyo; V[179]++; if(dbg){print "V179"}; continue };
 if ( qm(1,"gl_mn","GE","qj") && s(0) &&
      (w(2,"чтобы будто")||q(2,"mest_im nar_vopr")) && sc(1,",") )
 { l[i]=is_vsje; V[180]++; if(dbg){print "V180"}; continue };
 if ( mest_it(1) &&
           qm(2,"gl_mn","GE","syg") && s(0,1) )
 { l[i]=is_vsyo; V[181]++; if(dbg){print "V181"}; continue };
 if ( mest_mnim(-2) &&
    prl_kred_sr(-1) &&
             qm(1,"gl_mn","GE","syg") && s(-1,1) )
 { l[i]=is_vsyo; V[182]++; if(dbg){print "V182"}; continue };
 if ( mest_mnim(-2) &&
    prl_kred_sr(-1) &&
    prl_kred_sr(1) &&
             qm(2,"gl_mn","GE","syg") && s(-1,1) )
 { l[i]=is_vsyo; V[183]++; if(dbg){print "V183"}; continue };
 if ( mest_mnim(-1) &&
            phf(1,"не так") &&
             qm(hfn,"gl_mn","GE","syg") && s(-1,hfn-1) )
 { l[i]=is_vsyo; V[184]++; if(dbg){print "V184"}; continue };
 if ( mest_mn(-2) &&
            w(-1,"же ведь") &&
      mest_it(1) &&
           qm(2,"gl_mn","GE","syg") && s(-2,1) )
 { l[i]=is_vsyo; V[185]++; if(dbg){print "V185"}; continue };
 if ( w(-1,"так") &&
     qm(1,"gl_mn","GE","nj") && s(-1,0) && p(1) )
 { l[i]=is_vsje; V[186]++; if(dbg){print "V186"}; continue };
 if ( w(1,"так") &&
     qm(2,"gl_mn","GE","nj") && s(0,1) && p(2) )
 { l[i]=is_vsje; V[187]++; if(dbg){print "V187"}; continue };
 if ( mest_mnim(-2) &&
             qm(-1,"gl_mn","GE","sgy") &&
         pre_pr(1) &&
              q(2,"suw_pr") && s(-2,1) )
 { l[i]=is_vsyo; V[188]++; if(dbg){print "V188"}; continue };
 if ( cap(-3) &&
        w(-2,"и") &&
      cap(-1) &&
       qm(1,"gl_mn","GE","syg") && s(-3,0) && p(1) )
 { l[i]=is_vsyo; V[189]++; if(dbg){print "V189"}; continue };
 if ( mest_mnim(1) &&
             qm(2,"gl_mn","GE","syg") && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[190]++; if(dbg){print "V190"}; continue };
 if ( mest_mnim(-2) &&
    prl_kred_sr(-1) &&
             qm(1,"gl_mn","GE","syg") && s(-2,0) && p(1) )
 { l[i]=is_vsyo; V[191]++; if(dbg){print "V191"}; continue };
 if ( mest_mnim(-2) &&
             qm(-1,"gl_mn","GE","sgy") && s(-2,-1) && p(0) )
 { l[i]=is_vsyo; V[192]++; if(dbg){print "V192"}; continue };
 if ( q(-2,"suw_noedim suw_nomnim") &&
     qm(-1,"gl_mn","GE","ogj") && s(-2,-1) && p(0) )
 { l[i]=is_vsje; V[193]++; if(dbg){print "V193"}; continue };
 if ( qm(-2,"gl_po","GE","j") &&
          mest_mnim(-1) && s(-2,-1) )
 { l[i]=is_vsje; V[194]++; if(dbg){print "V194"}; continue };
 if ( mest_mnim(-2) &&
             qm(-1,"gl_mn","GE","syg") &&
              q(1,"suw_ro") &&
         pre_vi(2) && s(-2,2) )
 { l[i]=is_vsyo; V[195]++; if(dbg){print "V195"}; continue };
 if ( mest_mn(-1) &&
           qm(1,"gl_mn","GE","syg") && s(-1,0) && p(1) )
 { l[i]=is_vsyo; V[196]++; if(dbg){print "V196"}; continue };
 if ( mest_it(-1) &&
           qm(1,"gl_mn","GE","ogj") && s(-1,0) && p(1) )
 { l[i]=is_vsje; V[197]++; if(dbg){print "V197"}; continue };
 if ( q(-1,"suw_vi suw_mntv mest_vi") &&
     qm(1,"gl_mn","GE","ogj Vjg") && s(-1,0) && (p(1)||((w(2,"и")||pre_any(0)) && s(-1,1))) )
 { l[i]=is_vsje; V[198]++; if(dbg){print "V198"}; continue };
 if ( q(-2,"suw_vi suw_mntv mest_vi") &&
     qm(-1,"gl_mn","GE","ogj") && s(-2,-1) && p(0) )
 { l[i]=is_vsje; V[199]++; if(dbg){print "V199"}; continue };
 if ( qm(1,"gl_mn","GE","myg") && s(0) &&
   titul(2) && sc(1,",") )
 { l[i]=is_vsyo; V[200]++; if(dbg){print "V200"}; continue };
 if ( pre_pr(1) &&
           q(2,"suw_pr suw_edme") &&
          qm(3,"gl_mn","GE","pj") &&
     pre_any(4) && s(0,4) )
 { l[i]=is_vsje; V[201]++; if(dbg){print "V201"}; continue };
 if ( qm(1,"gl_po","GE","j") &&
       q(2,"mest_vi suw_vi") && s(0,1) )
 { l[i]=is_vsje; V[202]++; if(dbg){print "V202"}; continue };
 if ( qm(1,"gl_mn","GE","pj") &&
 pre_any(2) && s(0,1) )
 { l[i]=is_vsje; V[203]++; if(dbg){print "V203"}; continue };
 if ( qm(-2,"gl_mn","GE","j") &&
 mest_da(-1) && s(-2,-1) )
 { l[i]=is_vsje; V[204]++; if(dbg){print "V204"}; continue };
 if ( vvod(-2) &&
        qm(-1,"gl_mn","GE","ogj") && sc(-2,",") && s(-1) && p(0) )
 { l[i]=is_vsje; V[205]++; if(dbg){print "V205"}; continue };
 if ( qm(1,"gl_mn","GE","j") && s(0) &&
     !(w(2,"и") && qq(1,3)) )
 { l[i]=is_vsje; V[206]++; if(dbg){print "V206"}; continue };
 if ( qm(-1,"gl_mn","GE","j") && s(-1) && p(0) )
 { l[i]=is_vsje; V[207]++; if(dbg){print "V207"}; continue };
 if ( w(1,"уже ведь") &&
     qm(2,"gl_mn","GE","y") && s(0,1) )
 { l[i]=is_vsyo; V[208]++; if(dbg){print "V208"}; continue };
 if ( qm(1,"gl_mn","GE","y") && s(0) && p(1) )
 { l[i]=is_vsyo; V[209]++; if(dbg){print "V209"}; continue };
 if ( qm(-1,"gl_mn","GE","y") &&
nar_step(1) && s(-1,0) )
 { l[i]=is_vsyo; V[210]++; if(dbg){print "V210"}; continue };
 if ( qm(-1,"gl_mn","GE","y") && s(-1) && p(0) )
 { l[i]=is_vsyo; V[211]++; if(dbg){print "V211"}; continue };
 if ( qm(-1,"gl_po","GE","y") && s(-1) && p(0) )
 { l[i]=is_vsyo; V[212]++; if(dbg){print "V212"}; continue };
 if ( q(-1,"mest_da suw_da") &&
     qm(1,"gl_mn","GE","oyg") && s(-1,0) )
 { l[i]=is_vsyo; V[213]++; if(dbg){print "V213"}; continue };
 if ( qm(-1,"gl_mn","GE","py") &&
  pre_vi(1) &&
       q(2,"suw_vi") && s(-1,1) )
 { l[i]=is_vsyo; V[214]++; if(dbg){print "V214"}; continue };
 if ( pre_pr(1) &&
           q(2,"suw_pr") &&
          qm(3,"gl_mn","GE","py") && s(0,2) )
 { l[i]=is_vsyo; V[215]++; if(dbg){print "V215"}; continue };

 # модальное mod_, с возможностью учёта метки m() в словаре dic_cust.gz
 if ( sc(0,",") && (cap(0)||p(-1)) &&
       q(1,"mod_ed mod_mn") &&
   gl_in(2) && s(1) )
 { l[i]=is_vsyo; V[216]++; if(dbg){print "V216"}; continue };
 if ( mod_ed(1) &&
       gl_in(2) && s(0,1) )
 { l[i]=is_vsyo; V[217]++; if(dbg){print "V217"}; continue };
 if ( mod_mn(1) &&
 prl_kred_sr(2) &&
       gl_in(3) && s(0,2) )
 { l[i]=is_vsje; V[218]++; if(dbg){print "V218"}; continue };
 if ( mest_mn(-2) &&
       mod_mn(-1) &&
        gl_in(1) && s(-2,0) )
 { l[i]=is_vsyo; V[219]++; if(dbg){print "V219"}; continue };
 if ( gl_in(-2) &&
     mod_mn(-1) && s(-2,-1) )
 { l[i]=is_vsje; V[220]++; if(dbg){print "V220"}; continue };
 if ( mod_ed(-2) &&
      pre_vi(-1) && s(-2,-1) && p(0) )
 { l[i]=is_vsyo; V[221]++; if(dbg){print "V221"}; continue };
 if ( mod_bz(-2) &&
          qm(-1,"gl_in","GE","y") && s(-2,-1))
 { l[i]=is_vsyo; V[222]++; if(dbg){print "V222"}; continue };
 if ( mod_bz(-2) &&
       gl_in(-1) &&
           q(1,"suw_da") && Q(1,"suw_mnim") && s(-2,0))
 { l[i]=is_vsyo; V[223]++; if(dbg){print "V223"}; continue };
 if ( mod_bz(1) &&
      mod_ed(2) &&
       gl_in(3) && s(0,2) )
 { l[i]=is_vsyo; V[224]++; if(dbg){print "V224"}; continue };
 if ( mod_bz(1) &&
       gl_in(2) && s(0,1))
 { l[i]=is_vsyo; V[225]++; if(dbg){print "V225"}; continue };
 if ( mod_bz(-1) && s(-1) && p(0) )
 { l[i]=is_vsyo; V[226]++; if(dbg){print "V226"}; continue };
 if ( mod_bz(1) && s(0) && p(1) )
 { l[i]=is_vsyo; V[227]++; if(dbg){print "V227"}; continue };
 if ( mod_mn(1) &&
    nar_napr(2) && s(0,1) )
 { l[i]=is_vsje; V[228]++; if(dbg){print "V228"}; continue };
 if ( phf(1,"никак не") &&
   mod_mn(hfn) && s(0,hfn-1) )
 { l[i]=is_vsyo; V[229]++; if(dbg){print "V229"}; continue };
 if ( q(-3,"suw_im") &&
 mod_mn(-2) &&
  gl_in(-1) && s(-2,-1) && p(0) )
 { l[i]=is_vsje; V[230]++; if(dbg){print "V230"}; continue };
 if ( w(1,"не") &&
 mod_mn(2) &&
  gl_in(3) && s(0,2) )
 { l[i]=is_vsje; V[231]++; if(dbg){print "V231"}; continue };
 if ( mod_mn(1) &&
   mest_edim(2) &&
       gl_in(3) && s(0,2) )
 { l[i]=is_vsje; V[232]++; if(dbg){print "V232"}; continue };
 if ( mod_mn(1) &&
       gl_in(2) && s(0,1) )
 { l[i]=is_vsje; V[233]++; if(dbg){print "V233"}; continue };
 if ( mod_mn(1) &&
          qm(2,"gl_in","GE","j") && s(0,1) )
 { l[i]=is_vsje; V[234]++; if(dbg){print "V234"}; continue };
 if ( mod_mn(1) &&
           q(2,"mest_ed mest_mn") && s(0,1) && p(2) )
 { l[i]=is_vsje; V[235]++; if(dbg){print "V235"}; continue };
 if ( mod_mn(1) && s(0) && p(1) )
 { l[i]=is_vsje; V[236]++; if(dbg){print "V236"}; continue };


 #------------------------------------------------------------------------

 # глагол в единственном числе
 if ( gl_ed(-2) &&
    mest_it(-1) && s(-2,-1) )
 { l[i]=is_vsyo; V[237]++; if(dbg){print "V237"}; continue };
 if ( mest_it(-1) &&
            q(1,"nar_vrem nar_mest nar_spos nar_step nar_srav nar_kaq") &&
            q(2,"gl_ed gl_in") && s(-1,1) )
 { l[i]=is_vsyo; V[238]++; if(dbg){print "V238"}; continue };
 if ( prl_kred_sr(1) &&
      prl_kred_sr(2) &&
                q(3,"gl_ed gl_in") && s(0,2) )
 { l[i]=is_vsyo; V[239]++; if(dbg){print "V239"}; continue };
 if ( pre_tv(1) &&
           q(2,"mest_tv suw_tv") &&
           q(3,"gl_ed gl_in") && s(0,2) )
 { l[i]=is_vsyo; V[240]++; if(dbg){print "V240"}; continue };
 if ( pre_vi(1) &&
           q(2,"prl_vi prq_vi") &&
           q(3,"mest_vi suw_vi") &&
           q(4,"gl_ed gl_in") && s(0,3) )
 { l[i]=is_vsyo; V[241]++; if(dbg){print "V241"}; continue };
 if ( pre_ro(1) &&
           q(2,"mest_ro suw_ro") &&
           q(3,"gl_ed gl_in") && s(0,2) )
 { l[i]=is_vsyo; V[242]++; if(dbg){print "V242"}; continue };
 if ( pre_vi(1) &&
           q(2,"mest_vi suw_vi") &&
           q(3,"gl_ed gl_in") && s(0,2) )
 { l[i]=is_vsyo; V[243]++; if(dbg){print "V243"}; continue };
 if ( mest_it(1) &&
            q(2,"nar_vrem nar_mest nar_spos nar_step nar_srav nar_kaq") &&
            q(3,"gl_ed gl_in") && s(0,2) )
 { l[i]=is_vsyo; V[244]++; if(dbg){print "V244"}; continue };
 if ( mest_it(1) &&
            q(2,"nar_vrem nar_mest nar_spos nar_step nar_srav nar_kaq") && s(0,2) && (p(2)||w(3,"и")) )
 { l[i]=is_vsyo; V[245]++; if(dbg){print "V245"}; continue };
 if ( mest_it(1) && s(0) && sc(1,",") &&
         vvod(2) && sc(2,",") &&
            q(3,"gl_ed gl_in") )
 { l[i]=is_vsyo; V[246]++; if(dbg){print "V246"}; continue };
 if ( gl_ed(-1) &&
          q(1,"muk_edtv muk_mntv") &&
          q(2,"suw_tv") s(-1,1) )
 { l[i]=is_vsyo; V[247]++; if(dbg){print "V247"}; continue };
 if ( mest_it(1) && s(0) && sc(1,",") &&
         vvod(2) && sc(2,",") &&
            q(3,"gl_nemn gl_pnmn") )
 { l[i]=is_vsje; V[248]++; if(dbg){print "V248"}; continue };
 if ( gl_ed(-1) &&
          q(1,"nar_kaq nar_step") &&
prl_kred_sr(2) && s(-1,1) )
 { l[i]=is_vsyo; V[249]++; if(dbg){print "V249"}; continue };
 if ( gl_ed(-1) &&
          q(1,"nar_kaq nar_step") &&
prl_kred_sr(2) && s(-1,1) )
 { l[i]=is_vsyo; V[250]++; if(dbg){print "V250"}; continue };
 if ( mest_edim(-3) &&
        mest_da(-2) &&
          gl_ed(-1) &&
        pre_any(1) && s(-3,1) )
 { l[i]=is_vsyo; V[251]++; if(dbg){print "V251"}; continue };
 if ( suw_mnim(-2) &&
         gl_ed(-1) &&
       pre_any(1) && s(-2,1) )
 { l[i]=is_vsje; V[252]++; if(dbg){print "V252"}; continue };
 if ( (cap(0)||p(-1,",")) &&
         q(1,"gl_ed gl_vzed") && sc(0,",") )
 { l[i]=is_vsyo; V[253]++; if(dbg){print "V253"}; continue };



 if ( sc(0,",") &&
    vvod(1) && sc(1,",") &&
       q(2,"gl_ed gl_in") )
 { l[i]=is_vsyo; V[254]++; if(dbg){print "V254"}; continue };
 if ( sc(0,",") &&
    vvod(1) && sc(1,",") &&
       q(2,"gl_nemn gl_pnmn") )
 { l[i]=is_vsje; V[255]++; if(dbg){print "V255"}; continue };
 if ( mest_it(1) &&
         qast(2) &&
  prq_kred_sr(3) && s(0,2) && p(3) )
 { l[i]=is_vsyo; V[256]++; if(dbg){print "V256"}; continue };
 if ( w(-1,"за") &&
         prl_kred(1) && s(-1,0) && p(1) )
 { l[i]=is_vsyo; V[257]++; if(dbg){print "V257"}; continue };
 if ( (mest_it(1)||w(1,"что")) &&
   prl_kred_sr(2) && s(0,1) )
 { l[i]=is_vsyo; V[258]++; if(dbg){print "V258"}; continue };
 if ( mest_it(-1) &&
       predik(1) && s(-1,0) && p(1) )
 { l[i]=is_vsyo; V[259]++; if(dbg){print "V259"}; continue };
 if ( gl_in(-2) &&
    mest_it(-1) && s(-2,-1) && p(0) )
 { l[i]=is_vsyo; V[260]++; if(dbg){print "V260"}; continue };
 if ( mest_it(-1) &&
      mest_im(1) &&
     suw_edim(2) && s(-1,1) )
 { l[i]=is_vsyo; V[261]++; if(dbg){print "V261"}; continue };
 if ( mest_it(-1) &&
       pre_ro(1) &&
            q(2,"mest_ro prl_ro") &&
            q(3,"suw_ro") && s(-1,2) )
 { l[i]=is_vsyo; V[262]++; if(dbg){print "V262"}; continue };
 if ( mest_it(-1) &&
            w(1,"что чтобы") && s(-1) && sc(0,",") )
 { l[i]=is_vsyo; V[263]++; if(dbg){print "V263"}; continue };
 if ( mest_it(-1) &&
            w(1,"кто") && s(-1) && sc(0,",") )
 { l[i]=is_vsje; V[264]++; if(dbg){print "V264"}; continue };
 if ( mest_it(-1) &&
       pre_ro(1) &&
            w(2,"того") &&
            w(3,"что чтобы") && s(-1,1) && sc(2,",") )
 { l[i]=is_vsyo; V[265]++; if(dbg){print "V265"}; continue };
 if ( mest_it(1) &&
       pre_ro(2) &&
            w(3,"того") &&
            w(4,"что чтобы") && s(0,2) && sc(3,",") )
 { l[i]=is_vsyo; V[266]++; if(dbg){print "V266"}; continue };
 if ( mest_it(1) &&
      mest_da(2) &&
      nar_kaq(3) &&
      gl_edsr(4) && s(0,3) )
 { l[i]=is_vsyo; V[267]++; if(dbg){print "V267"}; continue };
 if ( mest_it(1) &&
            q(2,"prl_im prq_mnim") &&
            q(3,"suw_im") && s(0,2) )
 { l[i]=is_vsyo; V[268]++; if(dbg){print "V268"}; continue };
 if ( mest_it(1) &&
       pre_pr(2) &&
            q(3,"suw_pr") && s(0,2) )
 { l[i]=is_vsyo; V[269]++; if(dbg){print "V269"}; continue };
 if ( mest_it(1) &&
       pre_ro(2) &&
            q(3,"mest_ro suw_ro") && s(0,2) )
 { l[i]=is_vsyo; V[270]++; if(dbg){print "V270"}; continue };
 if ( mest_it(1) && s(0) && p(1) )
 { l[i]=is_vsyo; V[271]++; if(dbg){print "V271"}; continue };
 if ( mest_it(-1) && cap(-1) &&
            q(1,"mest_ed mest_mn") && s(-1,0) && p(1) )
 { l[i]=is_vsyo; V[272]++; if(dbg){print "V272"}; continue };


 # Все + ... + причастие =====================================
 if ( prq_krmn(-4) &&
             w(-3,"еще ещё") &&
   prl_kred_sr(-2) &&
             w(-1,"не") && s(-4,-1) )
 { l[i]=is_vsje; V[273]++; if(dbg){print "V273"}; continue };
 if ( prq_krmn(-3) &&
   prl_kred_sr(-2) &&
             w(-1,"не") && s(-3,-1) )
 { l[i]=is_vsje; V[274]++; if(dbg){print "V274"}; continue };
 if ( prq_kred_sr(-4) &&
                w(-3,"еще ещё") &&
      prl_kred_sr(-2) &&
                w(-1,"не") && s(-4,-1) )
 { l[i]=is_vsyo; V[275]++; if(dbg){print "V275"}; continue };
 if ( prq_kred_sr(-3) &&
      prl_kred_sr(-2) &&
                w(-1,"не") && s(-3,-1) )
 { l[i]=is_vsyo; V[276]++; if(dbg){print "V276"}; continue };
 if ( w(1,"уже") &&
      q(2,"nar_mest nar_step") &&
            prq_kred_sr(3) && s(0,2) )
 { l[i]=is_vsyo; V[277]++; if(dbg){print "V277"}; continue };
 if ( mest_mnim(1) &&
         pre_ro(2) &&
              q(3,"suw_ro") &&
       prq_krmn(4) && s(0,3) )
 { l[i]=is_vsje; V[278]++; if(dbg){print "V278"}; continue };
 if ( q(1,"mest_tv prl_tv") &&
      q(2,"suw_tv") &&
         prq_krmn(3) && s(0,2) )
 { l[i]=is_vsje; V[279]++; if(dbg){print "V279"}; continue };
 if ( suw_edim(1) &&
   prq_kred_sr(2) && sc(0,",") && s(1) )
 { l[i]=is_vsyo; V[280]++; if(dbg){print "V280"}; continue };
 if ( q(1,"nar_mest nar_step") &&
            prq_kred_sr(2) && s(0,1) )
 { l[i]=is_vsyo; V[281]++; if(dbg){print "V281"}; continue };
 if ( qast(1) &&
            prq_kred_sr(2) && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[282]++; if(dbg){print "V282"}; continue };
 if ( pre_ro(1) &&
           q(2,"suw_ro") &&
 prq_kred_sr(3) && s(0,2) && (p(3)||w(4,"и")) )
 { l[i]=is_vsyo; V[283]++; if(dbg){print "V283"}; continue };
 if ( gl_in(-2) &&
   prq_krmn(-1) && s(-2,-1) && p(0) )
 { l[i]=is_vsje; V[284]++; if(dbg){print "V284"}; continue };
 if ( prq_kred_sr(-2) &&
         nar_step(-1) && s(-2,-1) && p(0) )
 { l[i]=is_vsyo; V[285]++; if(dbg){print "V285"}; continue };
 if ( prq_kred_sr(-1) && s(-1) && p(0) )
 { l[i]=is_vsyo; V[286]++; if(dbg){print "V286"}; continue };
 if ( q(1,"prq_edim prq_kred") && s(0) )
 { l[i]=is_vsyo; V[287]++; if(dbg){print "V287"}; continue };
 if ( mest_ed(1) &&
            q(2,"prq_edim prq_kred") && Q(2,"gl_pemn") && s(0,1) )
 { l[i]=is_vsyo; V[288]++; if(dbg){print "V288"}; continue };
 if ( pre_tv(-1) &&
           q(1,"prq_tv") &&
           q(2,"suw_tv") && s(-1,1) )
 { l[i]=is_vsyo; V[289]++; if(dbg){print "V289"}; continue };
 if ( q(-1,"prq_tv prl_tv") && sc(-1,",") &&
      q(1,"prq_tv") &&
      q(2,"suw_tv") && s(0,1) )
 { l[i]=is_vsyo; V[290]++; if(dbg){print "V290"}; continue };
 if ( q(1,"nar_vrem qast") &&
nar_kaq(2) &&
      q(3,"prq_edim prq_kred") && s(0,2) )
 { l[i]=is_vsyo; V[291]++; if(dbg){print "V291"}; continue };
 if ( (prq_mnim(1) && w(1,"щие$")) && Q(1,"suw_mnim") && s(0) && p(1,",") )
 { l[i]=is_vsyo; V[292]++; if(dbg){print "V292"}; continue };
 if ( q(-1,"prq_ro") &&
 pre_pr(1) && s(-1,0) )
 { l[i]=is_vsyo; V[293]++; if(dbg){print "V293"}; continue };
 if ( prq_mnim(1) &&
        pre_ro(2) && s(0,1) )
 { l[i]=is_vsje; V[294]++; if(dbg){print "V294"}; continue };
 if ( w(1,"не") &&
         prq_mnim(2) &&
 pre_ro(3) && s(0,2) )
 { l[i]=is_vsje; V[295]++; if(dbg){print "V295"}; continue };
 if ( w(1,"даже") && sc(0,",") &&
      w(2,"не") &&
         prq_mnim(3) &&
         suw_edda(4) && s(1,3) )
 { l[i]=is_vsje; V[296]++; if(dbg){print "V296"}; continue };
 if ( w(1,"не") && sc(0,",") &&
         prq_mnim(2) &&
         suw_edda(3) && s(1,2) )
 { l[i]=is_vsje; V[297]++; if(dbg){print "V297"}; continue };
 if ( mest_vi(1) &&
            q(2,"prq_mnim prq_krmn") && s(0,1) )
 { l[i]=is_vsje; V[298]++; if(dbg){print "V298"}; continue };
 if ( prl_srav(1) &&
             q(2,"prq_ro") && s(0,1) )
 { l[i]=is_vsyo; V[299]++; if(dbg){print "V299"}; continue };
 if ( q(1,"prq_ro") && s(0) )
 { l[i]=is_vsyo; V[300]++; if(dbg){print "V300"}; continue };
 if ( prq_edsrim(1) && sc(0,",") )
 { l[i]=is_vsyo; V[301]++; if(dbg){print "V301"}; continue };
 if ( qf(1,3,"prq_kred_sr") && s(0,qfn-1) && p(qfn) )
 { l[i]=is_vsyo; V[302]++; if(dbg){print "V302"}; continue };



 # Все + ... + прилагательное =====================================
 if ( q(1,"prl_mnim prq_mnim prl_mnro prq_mnro prl_krmn") &&
sz_iili(2) &&
      q(3,"prl_mnim prq_mnim prl_mnro prq_mnro prl_krmn") && s(0,2) && qq(1,3)  )
 { l[i]=is_vsyo; V[303]++; if(dbg){print "V303"}; continue };
 if ( q(1,"prl_edim prl_edda prl_edro prl_edtv prl_edpr prl_kred") &&
sz_iili(2) &&
      q(3,"prl_edim prl_edda prl_edro prl_edtv prl_edpr prl_kred") && s(0,2) && qq(1,3)  )
 { l[i]=is_vsyo; V[304]++; if(dbg){print "V304"}; continue };
 if ( q(1,"prl_mnim prq_mnim prl_mnro prq_mnro prl_krmn") &&
sz_iili(2) &&
      q(3,"prl_mnim prq_mnim prl_mnro prq_mnro prl_krmn") &&
         suw_mnim(4) &&
gl_nemn(5) && s(0,4)  )
 { l[i]=is_vsje; V[305]++; if(dbg){print "V305"}; continue };
 if ( q(1,"prl_mnim prq_mnim prl_mnro prq_mnro prl_krmn") &&
sz_iili(2) &&
      q(3,"prl_mnim prq_mnim prl_mnro prq_mnro prl_krmn") &&
         suw_mnim(4) && s(0,3)  )
 { l[i]=is_vsje; V[306]++; if(dbg){print "V306"}; continue };

 if ( q(1,"prl_mnim prq_mnim prl_mnro prq_mnro prl_krmn") && W(1,"новые новых") &&
      q(2,"prl_mnim prq_mnim prl_mnro prq_mnro prl_krmn") && s(0,1) )
 { l[i]=is_vsje; V[307]++; if(dbg){print "V307"}; continue };
 if ( w(1,"и") &&
      q(2,"prl_mnim prq_mnim prl_krmn") && s(0,1) )
 { l[i]=is_vsje; V[308]++; if(dbg){print "V308"}; continue };
 if ( prl_mnim(-2) &&
             w(-1,"и") &&
      prq_mnim(1) && p(1) && s(-1,0) )
 { l[i]=is_vsyo; V[309]++; if(dbg){print "V309"}; continue };
 if ( q(1,"prl_mnim prq_mnim prl_krmn") && p(1) && s(0) && W(1,"новые") )
 { l[i]=is_vsje; V[310]++; if(dbg){print "V310"}; continue };
 if ( mest_tv(1) &&
     prl_krmn(2) && s(0,1) )
 { l[i]=is_vsje; V[311]++; if(dbg){print "V311"}; continue };
 if ( prl_krmn(1) && s(0) )
 { l[i]=is_vsje; V[312]++; if(dbg){print "V312"}; continue };
 if ( wc(1,".о$") && se(1,"-") &&
       q(2,"prl_mnim prq_mnim prl_krmn") &&
suw_mnim(3) && s(0) && s(2))
 { l[i]=is_vsje; V[313]++; if(dbg){print "V313"}; continue };
 if ( q(1,"prl_mnim prq_mnim prl_krmn") && W(1,"новые") &&
         suw_mnim(2) && s(0,1) )
 { l[i]=is_vsje; V[314]++; if(dbg){print "V314"}; continue };
 if ( q(1,"prl_edim prl_kred") &&
         suw_edim(2) && s(0,1) )
 { l[i]=is_vsyo; V[315]++; if(dbg){print "V315"}; continue };
 if ( q(1,"prl_pvedtv prl_pvmntv") &&
      q(2,"suw_tv") && s(0,1) )
 { l[i]=is_vsyo; V[316]++; if(dbg){print "V316"}; continue };
 if ( q(1,"qast nar_kaq") &&
      q(2,"nar_kaq nar_step") &&
            prl_kred_sr(3) && s(0,2) )
 { l[i]=is_vsyo; V[317]++; if(dbg){print "V317"}; continue };
 if ( w(1,"ли") &&
         suw_mnim(2) &&
         prl_krmn(3) && s(0,2) )
 { l[i]=is_vsje; V[318]++; if(dbg){print "V318"}; continue };
 if ( suw_mnim(1) &&
      prl_krmn(2) && s(0,1) )
 { l[i]=is_vsje; V[319]++; if(dbg){print "V319"}; continue };
 if ( q(-1,"mest_da suw_da") &&
            prl_kred_sr(1) && s(-1,0) )
 { l[i]=is_vsyo; V[320]++; if(dbg){print "V320"}; continue };
 if ( prl_kred_sr(1) &&
           pre_pr(2) && s(0,1) )
 { l[i]=is_vsyo; V[321]++; if(dbg){print "V321"}; continue };
 if ( w(1,"так") &&
         prl_krmn(2) && s(0,1) )
 { l[i]=is_vsje; V[322]++; if(dbg){print "V322"}; continue };
 if ((qxs(1,"как вроде","будто бы") ) &&
 prl_krmn(xsn+1) && s(xsn) )
 { l[i]=is_vsje; V[323]++; if(dbg){print "V323"}; continue };
 if ( q(1,"mest_ed mest_mn") &&
      q(2,"nar_kaq nar_step nar_spos") &&
         prl_krmn(3) && s(0,1) )
 { l[i]=is_vsje; V[324]++; if(dbg){print "V324"}; continue };
 if ( q(1,"nar_kaq nar_step nar_spos") &&
         prl_krmn(2) && s(0,1) )
 { l[i]=is_vsje; V[325]++; if(dbg){print "V325"}; continue };
 if ( pre_tv(-2) &&
           q(-1,"suw_tv") &&
 prl_kred_sr(1) && s(-2,0) && p(1) )
 { l[i]=is_vsyo; V[326]++; if(dbg){print "V326"}; continue };
 if ( w(1,"вроде как") &&
      w(2,"бы как") &&
            prl_kred_sr(3) && s(0,2) && p(3) )
 { l[i]=is_vsyo; V[327]++; if(dbg){print "V327"}; continue };
 if ( w(1,"так настолько") &&
            prl_kred_sr(2) &&
      w(3,"и") &&
            prl_kred_sr(4) && s(0,3) && p(4) )
 { l[i]=is_vsyo; V[328]++; if(dbg){print "V328"}; continue };
 if ( (w(1,"именно")||prl_kred_sr(1)) &&
       w(2,"так") && sc(2,",") &&
       w(3,"как чтобы") && s(0,1) )
 { l[i]=is_vsyo; V[329]++; if(dbg){print "V329"}; continue };
 if ( (w(1,"именно")||prl_kred_sr(1)) &&
       w(2,"так") && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[330]++; if(dbg){print "V330"}; continue };
 if ( w(1,"вроде как так") &&
            prl_kred_sr(2) && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[331]++; if(dbg){print "V331"}; continue };
 if ( pre_pr(1) &&
           q(2,"mest_pr prl_pr") &&
           q(3,"suw_pr") &&
 prl_kred_sr(4) && s(0,3) )
 { l[i]=is_vsyo; V[332]++; if(dbg){print "V332"}; continue };
 if ( pre_tv(1) &&
           q(2,"mest_tv suw_tv") &&
  prl_edsrim(3) && s(0,2) )
 { l[i]=is_vsyo; V[333]++; if(dbg){print "V333"}; continue };
 if ( nar_mest(1) &&
        pre_vi(2) &&
             q(3,"suw_vi") &&
   prl_kred_sr(4) && s(0,3) )
 { l[i]=is_vsyo; V[334]++; if(dbg){print "V334"}; continue };
 if ( pre_vi(1) &&
           q(2,"mest_vi suw_vi") &&
  prl_edsrim(3) && s(0,2) )
 { l[i]=is_vsyo; V[335]++; if(dbg){print "V335"}; continue };
 if ( q(1,"mest_ed nar_step") &&
         nar_step(2) &&
      q(3,"prl_kred_sr prl_edsrim") && s(0,2) )
 { l[i]=is_vsyo; V[336]++; if(dbg){print "V336"}; continue };
 if ( mest_ed(1) &&
            q(2,"prl_kred_sr prl_edsrim") &&
            q(3,"mest_da suw_da") && s(0,2) )
 { l[i]=is_vsyo; V[337]++; if(dbg){print "V337"}; continue };
 if ( q(1,"nar_mest nar_vrem") &&
           prl_edsrim(2) && s(0,1) )
 { l[i]=is_vsyo; V[338]++; if(dbg){print "V338"}; continue };
 if ( prl_edsrim(1) && s(0) )
 { l[i]=is_vsyo; V[339]++; if(dbg){print "V339"}; continue };
 if ( pre_vi(-1) &&
           q(1,"prl_kred_sr prl_edsrim") && s(-1,0) && p(1) )
 { l[i]=is_vsyo; V[340]++; if(dbg){print "V340"}; continue };
 if ( vvod(-1) &&
         q(1,"prl_kred_sr prl_edsrim") && sc(-1,",") && s(0) && p(1) )
 { l[i]=is_vsyo; V[341]++; if(dbg){print "V341"}; continue };
 if ( q(-2,"gl_nemn gl_pnmn gl_pemn gl_in") &&
mest_mn(-1) &&
      q(1,"prl_kred_sr prl_edsrim") && s(-2,0) && p(1) )
 { l[i]=is_vsje; V[342]++; if(dbg){print "V342"}; continue };
 if ( q(-1,"gl_nemn gl_pnmn gl_pemn") &&
      q(1,"prl_kred_sr prl_edsrim") && s(-1,0) && p(1) )
 { l[i]=is_vsje; V[343]++; if(dbg){print "V343"}; continue };
 if ( q(1,"prl_kred_sr prl_edsrim") &&
 pre_ro(2) && s(0,2) )
 { l[i]=is_vsyo; V[344]++; if(dbg){print "V344"}; continue };
 if ( q(1,"prl_kred_sr prl_edsrim") && s(0) && p(1) )
 { l[i]=is_vsyo; V[345]++; if(dbg){print "V345"}; continue };
 if ( gl_vzmn(-2) &&
            q(-1,"prl_kred_sr nar_kaq") && s(-2,-1) )
 { l[i]=is_vsje; V[346]++; if(dbg){print "V346"}; continue };
 if ( q(-1,"prl_kred_sr nar_kaq") &&
      w(1,"кто кого кому кем") && sc(0,",") && s(-1) )
 { l[i]=is_vsje; V[347]++; if(dbg){print "V347"}; continue };
 if (  w(1,"кто кого кому кем") && sc(0,",") )
 { l[i]=is_vsje; V[348]++; if(dbg){print "V348"}; continue };
 if ( q(-1,"prl_kred_sr nar_kaq") &&
 pre_ro(1) &&
      q(2,"suw_ro") && s(-1,1) && p(2) )
 { l[i]=is_vsje; V[349]++; if(dbg){print "V349"}; continue };
 if ( q(-1,"prl_kred_sr nar_kaq") && s(-1) && p(0) )
 { l[i]=is_vsyo; V[350]++; if(dbg){print "V350"}; continue };
 if ( q(1,"mest_ed nar_kaq nar_vrem") &&
      q(2,"prl_kred_sr prl_edsrim") && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[351]++; if(dbg){print "V351"}; continue };
 if ( pre_pr(1) &&
           q(2,"mest_pr suw_pr") &&
 prl_kred_sr(3) && s(0,2) && p(3) )
 { l[i]=is_vsyo; V[352]++; if(dbg){print "V352"}; continue };
 if ( q(3,"prl_tv") &&
      w(2,"и") &&
      q(3,"prl_tv") && s(0,2) && qq(1,3) )
 { l[i]=is_vsyo; V[353]++; if(dbg){print "V353"}; continue };
 if ( q(1,"prl_mnim prl_mnro") &&
sz_iili(2) &&
      q(3,"prl_mnim prl_mnro") && s(0,2) )
 { l[i]=is_vsje; V[354]++; if(dbg){print "V354"}; continue };
 if ( q(1,"prl_srav nar_step nar_kaq nar_srav") &&
sz_iili(2) &&
      q(3,"prl_srav nar_step nar_kaq nar_srav") && s(0,2) )
 { l[i]=is_vsyo; V[355]++; if(dbg){print "V355"}; continue };
 if ( prl_srav(1) && se(1,", ") &&
      prl_srav(2) && s(0) )
 { l[i]=is_vsyo; V[356]++; if(dbg){print "V356"}; continue };
 if ( prl_srav(1) &&
      prl_edro(2) &&
      suw_edro(3) && s(0,2) )
 { l[i]=is_vsyo; V[357]++; if(dbg){print "V357"}; continue };
 if ( prl_srav(1) &&
             q(2,"suw_mnro prl_ro") && s(0,1) )
 { l[i]=is_vsyo; V[358]++; if(dbg){print "V358"}; continue };
 if ( prl_srav(1) &&
             q(2,"suw_im") && s(0,1) )
 { l[i]=is_vsyo; V[359]++; if(dbg){print "V359"}; continue };
 if ( nar_spos(1) &&
      prl_mnim(2) && s(0,1) && p(2) )
 { l[i]=is_vsje; V[360]++; if(dbg){print "V360"}; continue };
 if ( w(1,"ли же ведь") &&
         prl_mnim(2) && s(0,1) && (p(2)||(w(3,"и")||pre_any(3))) )
 { l[i]=is_vsje; V[361]++; if(dbg){print "V361"}; continue };
 if ( w(1,"больших") &&
         suw_mnro(2) && s(0,1) )
 { l[i]=is_vsyo; V[362]++; if(dbg){print "V362"}; continue };
 if ( prl_mnim(1) && W(1,"новые") && s(0) && (p(1)||(w(2,"и")||pre_any(2))) )
 { l[i]=is_vsje; V[363]++; if(dbg){print "V363"}; continue };

 # Все + ... + существительное =====================================

 if ( sz(1) && sc(0,",") &&
       w(2,"не") &&
prq_mnim(3) &&
suw_edda(4) &&
suw_mnvi(5) && s(1,4) )
 { l[i]=is_vsje; V[364]++; if(dbg){print "V364"}; continue };
 if ( sz(1) && sc(0,",") &&
prq_mnim(2) &&
suw_edda(3) &&
suw_mnvi(4) && s(1,3) )
 { l[i]=is_vsje; V[365]++; if(dbg){print "V365"}; continue };
 if (  prq_mnim(1) &&
       suw_edda(2) &&
       suw_mnvi(3) && s(1,2) )
 { l[i]=is_vsje; V[366]++; if(dbg){print "V366"}; continue };
 if ( w(1,"не") &&
         prq_mnim(2) &&
         suw_edda(3) &&
         suw_mnvi(4) && s(1,3) )
 { l[i]=is_vsje; V[367]++; if(dbg){print "V367"}; continue };
 if ( w(1,"нет") &&
      q(2,"suw_ro") && s(0,1) )
 { l[i]=is_vsyo; V[368]++; if(dbg){print "V368"}; continue };
 if ( q(1,"suw_edim suw_edne") &&
      q(2,"suw_ro suw_mnvi") &&
gl_edsr(3) && s(0,2) )
 { l[i]=is_vsyo; V[369]++; if(dbg){print "V369"}; continue };
 if ( q(1,"mest_ed mest_mn") &&
         suw_mnim(2) && s(0,1) )
 { l[i]=is_vsje; V[370]++; if(dbg){print "V370"}; continue };
 if ( suw_edim(1) && se(1,"-") &&
      suw_mnim(2) && s(0) )
 { l[i]=is_vsje; V[371]++; if(dbg){print "V371"}; continue };
 if ( q(1,"prl_mnim prq_mnim") &&
mest_da(2) &&
         suw_mnim(3) && s(0,2) )
 { l[i]=is_vsje; V[372]++; if(dbg){print "V372"}; continue };
 if ( q(1,"mest_ed mest_mn prl_kred_sr") &&
      q(2,"prl_mnim prq_mnim") &&
         suw_mnim(3) && s(0,2) )
 { l[i]=is_vsje; V[373]++; if(dbg){print "V373"}; continue };
 if ( mest_tv(1) &&
            w(2,"же") &&
            q(3,"prl_mnim prq_mnim") &&
     suw_mnim(4) && s(0,3) )
 { l[i]=is_vsje; V[374]++; if(dbg){print "V374"}; continue };
 if ( suw_mnim(1) &&
             q(2,"gl_nemn gl_pemn gl_pnmn") && s(0,1) )
 { l[i]=is_vsje; V[375]++; if(dbg){print "V375"}; continue };
 if ( pre_pr(-4) &&
           q(-3,"prl_pr") &&
           q(-2,"suw_pr") &&
           q(-1,"gl_pemn gl_pnmn") && s(-2,-1) && p(0) )
 { l[i]=is_vsyo; V[376]++; if(dbg){print "V376"}; continue };
 if ( pre_pr(-3) &&
           q(-2,"suw_pr") &&
           q(-1,"gl_pemn gl_pnmn") && s(-2,-1) && p(0) )
 { l[i]=is_vsyo; V[377]++; if(dbg){print "V377"}; continue };
 if ( suw_odmnim(-2) &&
               q(-1,"gl_pemn gl_pnmn") && s(-2,-1) && p(0) )
 { l[i]=is_vsyo; V[378]++; if(dbg){print "V378"}; continue };
 if ( suw_nomnvi(-2) &&
               q(-1,"gl_pemn gl_pnmn") && s(-2,-1) && p(0) )
 { l[i]=is_vsje; V[379]++; if(dbg){print "V379"}; continue };
 if ( suw_mnim(-1) &&
      prl_krmn(1) && s(-1,0) )
 { l[i]=is_vsje; V[380]++; if(dbg){print "V380"}; continue };
 if ( suw_mnim(1) && Q(1,"prl_mnim prl_mnvi") && s(0) )
 { l[i]=is_vsje; V[381]++; if(dbg){print "V381"}; continue };
 if ( q(1,"mest_ed mest_mn nar_kaq") &&
      q(2,"prl_mnim prq_mnim") &&
         suw_edim(3) && s(0,2) )
 { l[i]=is_vsyo; V[382]++; if(dbg){print "V382"}; continue };
 if ( q(1,"mest_edsr mest_mn") &&
           prl_edsrim(2) &&
           suw_edsrim(3) && s(0,2) )
 { l[i]=is_vsyo; V[383]++; if(dbg){print "V383"}; continue };
 if ( q(1,"mest_ed mest_mn") &&
           suw_edsrim(2) && s(0,1) )
 { l[i]=is_vsyo; V[384]++; if(dbg){print "V384"}; continue };
 if ( suw_edim(1) && Q(1,"nar_spos") && s(0) )
 { l[i]=is_vsyo; V[385]++; if(dbg){print "V385"}; continue };
 if ( q(1,"mest_ed mest_mn") &&
         suw_edim(2) &&
         qik_edim(3) && s(0,2) )
 { l[i]=is_vsje; V[386]++; if(dbg){print "V386"}; continue };
 if ( mest_ed(1) &&
         qast(2) &&
     suw_edim(3) && s(0,2) )
 { l[i]=is_vsyo; V[387]++; if(dbg){print "V387"}; continue };
 if ( q(1,"suw_edsrim suw_edsrvi") && s(0)  )
 { l[i]=is_vsyo; V[388]++; if(dbg){print "V388"}; continue };
 if ( (prl_mnim(1)||wc(1,"ские$")) && W(1,"новые") &&
              q(2,"suw_ro") && s(0,1) )
 { l[i]=is_vsje; V[389]++; if(dbg){print "V389"}; continue };
 if ( w(1,"ли же") &&
          (prl_mnim(2)||wc(2,"ские$")) &&
         suw_mnim(3) && s(0,2) )
 { l[i]=is_vsje; V[390]++; if(dbg){print "V390"}; continue };
 if ( suw_edim(1) &&
             q(2,"suw_ro") && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[391]++; if(dbg){print "V391"}; continue };
 if ( suw_edim(1) && s(0) && p(1) )
 { l[i]=is_vsyo; V[392]++; if(dbg){print "V392"}; continue };
 if ( mest_mn(-1) && s(-1) &&
     prl_edim(1) &&
     suw_edim(2) && se(0," — ") && s(1) )
 { l[i]=is_vsje; V[393]++; if(dbg){print "V393"}; continue };
 if ( mest_mn(1) && s(0) &&
            q(2,"suw_im") && se(1," — ") )
 { l[i]=is_vsje; V[394]++; if(dbg){print "V394"}; continue };
 if ( q(1,"mest_im mest_vi") && s(1) &&
         suw_edim(2) && se(0," — ") )
 { l[i]=is_vsyo; V[395]++; if(dbg){print "V395"}; continue };
 if ( suw_edim(1) && se(0," — ") && p(1) )
 { l[i]=is_vsyo; V[396]++; if(dbg){print "V396"}; continue };
 if ( suw_edim(1) &&
             q(2,"suw_ro") && s(0,1) )
 { l[i]=is_vsyo; V[397]++; if(dbg){print "V397"}; continue };
 if ( suw_mnim(-1) && sc(-1,",") &&
        pre_pr(1) &&
             q(2,"prl_pr") &&
             q(3,"suw_pr") && s(0,2) )
 { l[i]=is_vsje; V[398]++; if(dbg){print "V398"}; continue };
 if ( w(-3,"каждый каждую каждое") &&
         suw_edvi(-2) &&
      q(-1,"gl_pemn gl_pnmn gl_nemn") &&
      w(1,"новые") && s(-3,0) )
 { l[i]=is_vsyo; V[399]++; if(dbg){print "V399"}; continue };
 if ( w(-2,"каждый каждую каждое") &&
         suw_edvi(-1) &&
      w(1,"новые") && s(-2,0) )
 { l[i]=is_vsyo; V[400]++; if(dbg){print "V400"}; continue };
 if ( suw_edsrim(-1) && sc(-1,",") &&
          pre_pr(1) &&
               q(2,"prl_pr") &&
               q(3,"suw_pr") && s(0,2) )
 { l[i]=is_vsyo; V[401]++; if(dbg){print "V401"}; continue };
 if ( suw_edsrim(-1) && sc(-1,",") &&
          pre_pr(1) &&
               q(2,"suw_pr") && s(0,1) )
 { l[i]=is_vsyo; V[402]++; if(dbg){print "V402"}; continue };


 # наречия =============================================

 if ( qb(-7,-2,"mest_mnim") &&
       w(-1,"то") && sc(-2,",") &&
nar_spos(1) && s(-1,0) && p(1) )
 { l[i]=is_vsje; V[403]++; if(dbg){print "V403"}; continue };


 if ( w(-2,"да вот ну") &&
      w(-1,"и") &&
      w(1,"тут") && s(-2,0) && p(1) && sQ(1,1,",") )
 { l[i]=is_vsyo; V[404]++; if(dbg){print "V404"}; continue };
 if ( q(1,"nar_napr") &&
sz_iili(2) &&
         nar_napr(3) && s(0,2)  )
 { l[i]=is_vsyo; V[405]++; if(dbg){print "V405"}; continue };
 if ( nar_step(1) &&
      nar_srav(2) && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[406]++; if(dbg){print "V406"}; continue };
 if ( (w(1,"куда")||prl_kred_sr(1)) &&
nar_srav(2) && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[407]++; if(dbg){print "V407"}; continue };
 if ( nar_srav(1) &&
             q(2,"gl_ed gl_nemn gl_pnmn gl_pemn") && s(0,1) )
 { l[i]=is_vsyo; V[408]++; if(dbg){print "V408"}; continue };
 if ( nar_srav(1) && s(0) && p(1) )
 { l[i]=is_vsyo; V[409]++; if(dbg){print "V409"}; continue };
 if ( q(1,"nar_kaq nar_vrem mest_ed") && s(0) && p(1) && cap(0) )
 { l[i]=is_vsyo; V[410]++; if(dbg){print "V410"}; continue };
 if ( q(-1,"gl_vzmn gl_nemn") &&
         prl_srav(1) &&
      q(2,"prl_im prl_ro prl_tv") && s(-1,1) )
 { l[i]=is_vsyo; V[411]++; if(dbg){print "V411"}; continue };
 if ( nar_step(1) &&
             q(2,"prl_tv") && s(0,1) )
 { l[i]=is_vsyo; V[412]++; if(dbg){print "V412"}; continue };
 if ( q(-1,"gl_vzmn gl_nemn") &&
      q(1,"nar_spos nar_napr nar_step") &&
            prl_kred_sr(2) && s(-1,1) && p(2) )
 { l[i]=is_vsyo; V[413]++; if(dbg){print "V413"}; continue };
 if ( q(-1,"gl_vzmn gl_nemn") &&
      q(1,"nar_spos nar_napr nar_step") && s(-1,0) )
 { l[i]=is_vsje; V[414]++; if(dbg){print "V414"}; continue };
 if ( w(1,"как") &&
      w(2,"раз будто") &&
         nar_spos(3) && s(0,2) && p(3) )
 { l[i]=is_vsyo; V[415]++; if(dbg){print "V415"}; continue };
 if ( q(1,"nar_kaq nar_spos nar_step prl_kred_sr") &&
            prl_kred_sr(2) && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[416]++; if(dbg){print "V416"}; continue };
 if ( nar_step(1) &&
             q(2,"prl_vi") &&
      suw_mnvi(3) && s(0,2) )
 { l[i]=is_vsyo; V[417]++; if(dbg){print "V417"}; continue };
 if ( q(1,"qast nar_step") &&
nar_kaq(2) && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[418]++; if(dbg){print "V418"}; continue };
 if ( nar_mest(1) &&
             w(2,"не") &&
         gl_ed(3) && s(0,2) )
 { l[i]=is_vsyo; V[419]++; if(dbg){print "V419"}; continue };
 if ( mest_da(-1) &&
     nar_mest(1) && s(-1,0) && p(1) )
 { l[i]=is_vsyo; V[420]++; if(dbg){print "V420"}; continue };
 if ( q(1,"nar_kaq nar_step") &&
            prl_kred_sr(2) &&
    Q_w(3,"gl_pemn gl_nemn gl_pnmn") && s(0,1) )
 { l[i]=is_vsyo; V[421]++; if(dbg){print "V421"}; continue };
 if ( q(1,"nar_mest") &&
            prl_kred_sr(2) &&
      q(3,"gl_pemn gl_nemn gl_pnmn") && s(0,1) )
 { l[i]=is_vsje; V[422]++; if(dbg){print "V422"}; continue };
 if ( q(-1,"gl_ed gl_nemn gl_pemn gl_pnmn") &&
         nar_mest(1) &&
         suw_mnim(2) && s(-1,1) )
 { l[i]=is_vsyo; V[423]++; if(dbg){print "V423"}; continue };
 if ( nar_mest(1) &&
      suw_mnim(2) && s(0,1) )
 { l[i]=is_vsje; V[424]++; if(dbg){print "V424"}; continue };

 # всё не так плохо
 if ( w(1,"не") &&
      w(2,"так") &&
      q(3,"nar_vrem nar_mest nar_spos nar_srav nar_kaq suw_edvi mest_ed") && s(0,2) && p(3) )
 { l[i]=is_vsyo; V[425]++; if(dbg){print "V425"}; continue };
 if ( w(1,"не") &&
      w(2,"так") && se(2,"-") &&
      w(3,"то") &&
      q(4,"nar_vrem nar_mest nar_spos nar_srav nar_kaq suw_edvi mest_ed") && s(0,2) && s(3) && p(4) )
 { l[i]=is_vsyo; V[426]++; if(dbg){print "V426"}; continue };
 if ( nar_mest(1) &&
             w(2,"же") && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[427]++; if(dbg){print "V427"}; continue };

 # Все + ... + числительное =====================================
 # все + числ.
 if ( w(1,"один одна одно одни") && s(0) )
 { l[i]=is_vsyo; V[428]++; if(dbg){print "V428"}; continue };
 if ( qis_im(1) && s(0) )
 { l[i]=is_vsje; V[429]++; if(dbg){print "V429"}; continue };
 if ( (q(1,"qik_edim qik_mnim")||wc(1,"^[0-9]+$")) && s(0) )
 { l[i]=is_vsje; V[430]++; if(dbg){print "V430"}; continue };

 # все + местоимения =============================================
 # все + мест.мн
 if ( w(-1,"чем даже") &&
          mest_mnim(1) && s(-1,0) )
 { l[i]=is_vsje; V[431]++; if(dbg){print "V431"}; continue };
 if ( mest_mn(-3) && sc(-3,",") &&
            w(-2,"а но") &&
            w(-1,"не") && s(-2,-1) )
 { l[i]=is_vsje; V[432]++; if(dbg){print "V432"}; continue };
 if ( w(-1,"не") && s(-1) &&
      w(1,"а но") && sc(0,",") &&
      q(2,"mest_mn prl_mnim") && s(1) )
 { l[i]=is_vsje; V[433]++; if(dbg){print "V433"}; continue };
 if ( mest_mnim(1) &&
    prl_kred_sr(2) &&
              w(3,"и") &&
              q(4,"gl_pnmn gl_nemn gl_pemn") && s(0,3) )
 { l[i]=is_vsje; V[434]++; if(dbg){print "V434"}; continue };
 if ( mest_mnim(-3) && sc(-3,",") &&
       suw_mnim(-2) && sc(-2,",") &&
              q(-1,"gl_pnmn gl_pemn gl_nemn") && s(-1) && (p(0)||pre_any(1)) )
 { l[i]=is_vsyo; V[435]++; if(dbg){print "V435"}; continue };
 if ( mest_im(-2) &&
    mest_mnim(-1) &&
    mest_mnim(1) && s(-2,0) )
 { l[i]=is_vsje; V[436]++; if(dbg){print "V436"}; continue };
 if ( mest_mnim(1) &&
              q(2,"nar_vrem nar_mest") &&
              w(3,"не") &&
       muk_mnim(4) && s(0,3) )
 { l[i]=is_vsje; V[437]++; if(dbg){print "V437"}; continue };
 if ( mest_mnim(1) &&
    prl_kred_sr(2) &&
         pre_pr(3) && s(0,3) )
 { l[i]=is_vsje; V[438]++; if(dbg){print "V438"}; continue };
 if ( mest_mnim(1) &&
         pre_pr(2) && s(0,2) )
 { l[i]=is_vsje; V[439]++; if(dbg){print "V439"}; continue };
 if ( mest_mnim(1) &&
        mest_vi(2) &&
        gl_pnmn(3) && s(0,2) && p(3) )
 { l[i]=is_vsje; V[440]++; if(dbg){print "V440"}; continue };
 if ( mest_da(1) &&
        gl_ed(2) && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[441]++; if(dbg){print "V441"}; continue };
 if ( mest_mnim(1) &&
              q(2,"nar_kaq nar_step prl_kred_sr") &&
        sz_iili(3) &&
              q(4,"nar_kaq nar_step prl_kred_sr") &&
       prl_krmn(5) && s(0,4) )
 { l[i]=is_vsje; V[442]++; if(dbg){print "V442"}; continue };
 if ( mest_mnim(1) &&
              q(2,"nar_kaq nar_step prl_kred_sr") &&
              q(3,"prl_krmn prl_mnim") && s(0,2) )
 { l[i]=is_vsje; V[443]++; if(dbg){print "V443"}; continue };
 if ( mest_mnim(-1) &&
              q(1,"nar_kaq nar_step") &&
    prl_kred_sr(2) && s(-1,1) )
 { l[i]=is_vsje; V[444]++; if(dbg){print "V444"}; continue };
 if ( mest_mn(1) &&
            q(2,"prl_kred_sr nar_kaq") &&
            q(3,"gl_pnmn gl_nemn gl_pemn") && s(0,2) )
 { l[i]=is_vsje; V[445]++; if(dbg){print "V445"}; continue };
 if ( mest_mn(1) &&
     nar_spos(2) &&
     prq_mnim(3) && s(0,2) )
 { l[i]=is_vsje; V[446]++; if(dbg){print "V446"}; continue };
 if ( mest_mn(1) &&
         qast(2) &&
            q(3,"gl_vzmn gl_nemn") && s(0,2) )
 { l[i]=is_vsje; V[447]++; if(dbg){print "V447"}; continue };
 if ( mest_mn(-1) &&
            q(1,"gl_pnmn gl_nemn") &&
  prl_kred_sr(2) &&
            q(3,"prl_mnim prl_krmn") && s(-1,2) )
 { l[i]=is_vsje; V[448]++; if(dbg){print "V448"}; continue };
 if ( mest_mn(-1) &&
            q(1,"gl_nemn gl_pemn gl_pnmn") &&
            q(2,"prl_tv") &&
            q(3,"suw_tv") && s(-1,2) )
 { l[i]=is_vsje; V[449]++; if(dbg){print "V449"}; continue };
 if ( mest_mn(-1) &&
    gl_povzmn(1) && s(-1,0) )
 { l[i]=is_vsje; V[450]++; if(dbg){print "V450"}; continue };
 if ( mest_mn(-1) &&
       pre_tv(1) &&
      mest_tv(2) &&
     prl_krmn(3) && s(-1,2) )
 { l[i]=is_vsje; V[451]++; if(dbg){print "V451"}; continue };
 if ( mest_mn(1) &&
     nar_mest(2) &&
     prl_krmn(3) && s(0,2) )
 { l[i]=is_vsje; V[452]++; if(dbg){print "V452"}; continue };
 if ( mest_mn(1) &&
       pre_tv(2) &&
            q(3,"mest_tv suw_tv") && s(-1,2) )
 { l[i]=is_vsje; V[453]++; if(dbg){print "V453"}; continue };
 if ( mest_mn(-1) &&
       pre_ro(1) &&
          cap(2) && s(-1,1) )
 { l[i]=is_vsje; V[454]++; if(dbg){print "V454"}; continue };
 if ( mest_mn(-1) &&
     nar_step(1) &&
  prl_kred_sr(2) &&
      gl_pemn(3) && sc(3,",") && s(-1,2) &&
           (w(4,"чтобы будто")||q(4,"mest_im nar_vopr")) )
 { l[i]=is_vsje; V[455]++; if(dbg){print "V455"}; continue };
 if ( mest_mn(-1) &&
     nar_step(1) && sc(1,",") &&
     nar_step(2) &&
      gl_pemn(3) && s(-1,0) && s(2) )
 { l[i]=is_vsje; V[456]++; if(dbg){print "V456"}; continue };
 if ( mest_mnim(-1) &&
        gl_nemn(1) &&
         pre_tv(2) &&
              q(3,"mest_tv suw_tv") s(-1,2) )
 { l[i]=is_vsje; V[457]++; if(dbg){print "V457"}; continue };
 if ( mest_mn(-1) &&
     nar_step(1) &&
            q(2,"mest_ro suw_ro") &&
      gl_pnmn(3) && s(-1,2) )
 { l[i]=is_vsje; V[458]++; if(dbg){print "V458"}; continue };
 if ( w(-2,"а") &&
          mest_mnim(-1) &&
      q(1,"gl_pnmn gl_nemn") &&
            prl_kred_sr(2) && s(-2,1) )
 { l[i]=is_vsyo; V[459]++; if(dbg){print "V459"}; continue };
 if ( mest_mn(1) &&
            q(2,"nar_step prl_kred_sr") &&
     prl_krmn(3) && s(0,2) )
 { l[i]=is_vsje; V[460]++; if(dbg){print "V460"}; continue };
 if ( mest_mn(1) &&
            q(2,"prl_krmn mest_mn prl_mnim") && s(0,1) && p(2) )
 { l[i]=is_vsje; V[461]++; if(dbg){print "V461"}; continue };
 if ( mest_mn(1) &&
     nar_vrem(2) &&
       mod_mn(3) &&
        gl_in(4) && s(0,3) )
 { l[i]=is_vsje; V[462]++; if(dbg){print "V462"}; continue };
 if ( mest_mn(1) &&
     prl_mnim(2) &&
     prl_mnim(3) &&
     suw_mnim(4) && s(0,3) )
 { l[i]=is_vsje; V[463]++; if(dbg){print "V463"}; continue };
 if ( mest_mn(-2) &&
            w(-1,"ведь же ж") && s(-2,-1) && p(0) )
 { l[i]=is_vsje; V[464]++; if(dbg){print "V464"}; continue };
 if ( mest_mnim(-4) &&
             (q(-3,"nar_mest nar_vrem")||w(-3,"же ведь")) &&
         pre_ro(-2) &&
              q(-1,"mest_ro suw_ro") &&
         pre_pr(1) &&
              q(2,"suw_pr") && s(-4,1) )
 { l[i]=is_vsje; V[465]++; if(dbg){print "V465"}; continue };
 if ( mest_mnim(-3) &&
         pre_ro(-2) &&
              q(-1,"mest_ro suw_ro") &&
         pre_pr(1) &&
              q(2,"suw_pr") && s(-3,1) )
 { l[i]=is_vsje; V[466]++; if(dbg){print "V466"}; continue };
 if ( mest_mnim(-2) &&
              w(-1,"же ведь") &&
         pre_pr(1) &&
              q(2,"suw_pr") && s(-2,1) )
 { l[i]=is_vsje; V[467]++; if(dbg){print "V467"}; continue };
 if ( mest_mnim(-1) &&
         pre_pr(1) &&
              q(2,"suw_pr") && s(-1,1) )
 { l[i]=is_vsje; V[468]++; if(dbg){print "V468"}; continue };
 if ( mest_mn(1) &&
       pre_pr(2) &&
            q(3,"suw_pr") && s(0,2) )
 { l[i]=is_vsje; V[469]++; if(dbg){print "V469"}; continue };
 if ( mest_mn(1) &&
          qxs(2,"друг","друга дружку") && s(0,1) )
 { l[i]=is_vsje; V[470]++; if(dbg){print "V470"}; continue };
 if ( q(1,"gl_nemn gl_pnmn") &&
    qxs(2,"друг","с","дружкой другом") && s(0,1) )
 { l[i]=is_vsje; V[471]++; if(dbg){print "V471"}; continue };
 if ( q(1,"mest_ed mest_mn") &&
         qip_mnro(2) &&
         suw_mnro(3) && s(0,2) )
 { l[i]=is_vsje; V[472]++; if(dbg){print "V472"}; continue };
 if ( mest_mnim(1) &&
              q(2,"gl_vzmn gl_nemn gl_pemn gl_pnmn prl_krmn") && s(0,1) )
 { l[i]=is_vsje; V[473]++; if(dbg){print "V473"}; continue };
 if ( mest_ed(1) &&
            q(2,"nar_mest nar_priq") && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[474]++; if(dbg){print "V474"}; continue };
 if ( mest_ed(1) &&
       pre_tv(2) &&
            q(3,"mest_tv suw_tv prl_tv") && s(0,1) )
 { l[i]=is_vsyo; V[475]++; if(dbg){print "V475"}; continue };
 if ( mest_ed(1) &&
     nar_step(2) &&
      nar_kaq(3) && s(0,2) )
 { l[i]=is_vsyo; V[476]++; if(dbg){print "V476"}; continue };
 if ( mest_ed(1) &&
            q(2,"nar_kaq nar_step nar_spos") &&
            q(3,"gl_ed gl_in") && s(0,2) )
 { l[i]=is_vsyo; V[477]++; if(dbg){print "V477"}; continue };
 if ( mest_ed(1) &&
            q(2,"nar_kaq nar_step") &&
         qast(3) &&
            q(4,"gl_ed gl_in") && s(0,3) )
 { l[i]=is_vsyo; V[478]++; if(dbg){print "V478"}; continue };
 if ( w(-1,"их") && p(0) )
 { l[i]=is_vsje; V[479]++; if(dbg){print "V479"}; continue };
 if ( mest_mn(1) && cap(0) && s(0) && p(1) )
 { l[i]=is_vsje; V[480]++; if(dbg){print "V480"}; continue };
 if ( mest_edsrim(-1) && prevje != b-1 && s(-1) && p(0) )
 { l[i]=is_vsyo; V[481]++; if(dbg){print "V481"}; continue };

 # Местоимения + все
 # мест.да
 if ( mest_da(-1) &&
     nar_mest(1) && s(-1,0) )
 { l[i]=is_vsyo; V[482]++; if(dbg){print "V482"}; continue };

 # глаголы действия
 if ( gl_mn(1) && nmark(1,"TY","del") &&
     pre_ro(2) &&
          q(3,"suw_ro") && s(0,1) )
 { l[i]=is_vsyo; V[483]++; if(dbg){print "V483"}; continue };

 # глаголы движения
 if ( qf(1,5,"gl_nemn") && s(0,qfn-1) && Q(1,"nar_srav") && nmark(qfn,"TY","dvi") )
 { l[i]=is_vsje; V[484]++; if(dbg){print "V484"}; continue };

 # глаголы восприятия
 #  получения информации vosinf
 if ( qf(1,3,"gl_mn") && nmark(qfn,"TY","vosinf") &&
     ( p(qfn)||(q(qfn+1,"sz pre_any prl_kred_sr") && s(0,qfn-1)) ))
 { l[i]=is_vsyo; V[485]++; if(dbg){print "V485"}; continue };
 if ( qf(1,5,"gl_pnmn") && nmark(qfn,"TY","vosinf") &&
            prl_kred_sr(qfn+1) && s(0,qfn) && p(qfn+1) )
 { l[i]=is_vsyo; V[486]++; if(dbg){print "V486"}; continue };
 if ( qf(1,5,"gl_pemn") && nmark(qfn,"TY","vosinf") &&
       q(qfn+1,"suw_vi") && s(0,qfn) )
 { l[i]=is_vsje; V[487]++; if(dbg){print "V487"}; continue };
 if ( q(-3,"gl_ed gl_mn") && nmark(-3,"TY","vosinf") &&
    qxs(-1,"далеко","не") && (p(0)||sc(0,"[\x22)»']")) )
 { l[i]=is_vsyo; V[488]++; if(dbg){print "V488"}; continue };

 # глаголы изменения состояния субъекта izs
 #  эмоционального emo
 if ( qf(1,5,"gl_mn") && nmark(qfn,"TY","izsemo") && s(0,qfn-1) )
 { l[i]=is_vsje; V[489]++; if(dbg){print "V489"}; continue };



 # Мест + все + ... + глагол ============================================
 # все + ... + гл.мн.
 if ( qb(-5,-2,"mest_mn") &&
suw_edim(-1) &&
       q(1,"gl_vzmn gl_nemn") && s(-1,0) && p(1) )
 { l[i]=is_vsje; V[490]++; if(dbg){print "V490"}; continue };
 if ( mest_mn(-3) &&
            w(-2,"не") &&
      gl_nemn(-1) &&
        gl_in(1) && s(-2,0) )
 { l[i]=is_vsje; V[491]++; if(dbg){print "V491"}; continue };
 if ( gl_nemn(-2) &&
            w(-1,"не") && s(-2,-1) && p(0) )
 { l[i]=is_vsje; V[492]++; if(dbg){print "V492"}; continue };
 if ( mest_mn(-2) &&
      gl_nemn(-1) &&
        gl_in(1) && s(-2,0) )
 { l[i]=is_vsje; V[493]++; if(dbg){print "V493"}; continue };
 if ( q(-1,"gl_in gl_ed") &&
      q(1,"prl_tv") &&
      q(2,"suw_tv") && s(-1,1) )
 { l[i]=is_vsyo; V[494]++; if(dbg){print "V494"}; continue };
 if ( gl_in(-1) &&
     pre_pr(1) &&
          q(2,"suw_pr") &&
   prl_edtv(3) && s(-1,2) )
 { l[i]=is_vsyo; V[495]++; if(dbg){print "V495"}; continue };
 if ( mest_mn(-1) &&
            q(1,"nar_mest nar_kaq nar_vrem nar_spos") &&
      gl_nemn(2) && s(-1,1) )
 { l[i]=is_vsje; V[496]++; if(dbg){print "V496"}; continue };
 if ( mest_mn(-1) &&
      mest_da(1) &&
      gl_nemn(2) && s(-1,1) && p(2))
 { l[i]=is_vsje; V[497]++; if(dbg){print "V497"}; continue };
 if ( q(1,"gl_pnmn gl_pemn gl_nemn") && sc(1,",") &&
      w(2,"кто никто") && s(0) )
 { l[i]=is_vsje; V[498]++; if(dbg){print "V498"}; continue };
 if ( q(-3,"suw_vi mest_vi") &&
      q(-2,"gl_pnmn gl_pemn gl_nemn") &&
          mest_mnim(-1) && s(-3,-1) )
 { l[i]=is_vsje; V[499]++; if(dbg){print "V499"}; continue };
 if ( mest_mn(-1) &&
            q(1,"gl_pnmn gl_pemn") &&
     suw_mnvi(2) && s(-1,1) )
 { l[i]=is_vsje; V[500]++; if(dbg){print "V500"}; continue };
 if ( mest_mn(-1) &&
            q(1,"gl_pomn gl_povzmn") &&
     nar_mest(2) && s(-1,1) )
 { l[i]=is_vsje; V[501]++; if(dbg){print "V501"}; continue };
 if ( mest_mn(1) &&
     nar_mest(2) &&
      gl_vzmn(3) && s(0,2) )
 { l[i]=is_vsje; V[502]++; if(dbg){print "V502"}; continue };
 if ( mest_mn(1) &&
            q(2,"gl_pnmn gl_pemn") &&
     suw_mnvi(3) && s(0,2) )
 { l[i]=is_vsje; V[503]++; if(dbg){print "V503"}; continue };
 if ( mest_ed(1) &&
        gl_ed(2) && s(0,1) && p(2) )
 { l[i]=is_vsyo; V[504]++; if(dbg){print "V504"}; continue };
 if ( q(1,"gl_pnmn gl_pemn") &&
      q(2,"prl_im prq_im") &&
         suw_mnvi(3) && s(0,2) )
 { l[i]=is_vsje; V[505]++; if(dbg){print "V505"}; continue };
 # оглядывающий + все + вокруг + всех
 if ( nar_mest(-1) &&
             w(1,"как") &&
        pre_ro(2) &&
             q(3,"mest_ro suw_ro prl_ro prq_ro") && s(-1,2) )
 { l[i]=is_vsyo; V[506]++; if(dbg){print "V506"}; continue };
 if ( q(-1,"prq_im") &&
 pre_ro(1) &&
      q(2,"mest_ro suw_ro prl_ro prq_ro") && s(-1,1) )
 { l[i]=is_vsyo; V[507]++; if(dbg){print "V507"}; continue };
 # все + против + всех
 if ( gl_in(-1) &&
     pre_ro(1) &&
          q(2,"mest_ro prl_ro") && s(-1,1) )
 { l[i]=is_vsyo; V[508]++; if(dbg){print "V508"}; continue };
 if ( w(1,"для ради") && Qw_(-1,"gl_vzed") &&
      q(2,"mest_ro suw_ro prl_ro prq_ro") && s(-1,1) && p(2) )
 { l[i]=is_vsyo; V[509]++; if(dbg){print "V509"}; continue };
 if ( vvb(-8,-1) && suw_mnim(vvn) &&
   pre_ro(1) &&
        q(2,"mest_ro suw_ro prl_ro prq_ro") && s(0,1) )
 { l[i]=is_vsje; V[510]++; if(dbg){print "V510"}; continue };
 if ( gl_ed(-1) &&
     pre_ro(1) &&
          q(2,"mest_ro suw_ro prl_ro prq_ro") && s(-1,1) && p(2) )
 { l[i]=is_vsyo; V[511]++; if(dbg){print "V511"}; continue };
 if ( pre_ro(1) &&
           q(2,"mest_ro suw_ro prl_ro prq_ro") &&
           w(3,"так слишком") &&
 prl_kred_sr(4) && s(0,3) )
 { l[i]=is_vsyo; V[512]++; if(dbg){print "V512"}; continue };
 if ( pre_ro(1) && Qw_(-1,"gl_vzed gl_ed gl_ed") &&
           q(2,"mest_ro suw_ro prl_ro prq_ro") && s(0,1) )
 { l[i]=is_vsyo; V[513]++; if(dbg){print "V513"}; continue };
 if ( w(1,"кроме") && sc(0,",") &&
    cap(2) && s(1) )
 { l[i]=is_vsje; V[514]++; if(dbg){print "V514"}; continue };


 # дееп =============================================================
 if ( q(1,"prl_srav nar_step") &&
   deep(2) && s(0,1) )
 { l[i]=is_vsyo; V[515]++; if(dbg){print "V515"}; continue };
 if ( deep(1) &&
         q(2,"gl_nemn gl_pnmn gl_pemn") && s(0,1) )
 { l[i]=is_vsje; V[516]++; if(dbg){print "V516"}; continue };
 if ( deep(-2) &&
         q(-1,"suw_tv") &&
  nar_mest(1) && s(-2,0) )
 { l[i]=is_vsyo; V[517]++; if(dbg){print "V517"}; continue };
 if ( deep(-2) &&
    pre_vi(-1) &&
         q(1,"prl_tv suw_vi") && Q(1,"mest_mnim") && s(-2,0) )
 { l[i]=is_vsyo; V[518]++; if(dbg){print "V518"}; continue };
 if ( deep(-2) &&
   mest_vi(-1) &&
         q(1,"prl_srav prl_tv suw_vi") && s(-2,0) )
 { l[i]=is_vsyo; V[519]++; if(dbg){print "V519"}; continue };
 if ( deep(-1) &&
    pre_vi(1) &&
         q(2,"prl_vi suw_vi") && s(-1,1) )
 { l[i]=is_vsyo; V[520]++; if(dbg){print "V520"}; continue };
 if ( deep(-1) &&
    pre_pr(1) &&
         q(2,"prl_edpr suw_pr") && s(-1,1) )
 { l[i]=is_vsyo; V[521]++; if(dbg){print "V521"}; continue };
 if ( deep(-1) &&
    pre_tv(1) &&
         q(2,"prl_tv suw_tv mest_tv") && s(-1,1) )
 { l[i]=is_vsyo; V[522]++; if(dbg){print "V522"}; continue };
 if ( deep(-1) &&
  prl_srav(1) && s(-1,0) )
 { l[i]=is_vsyo; V[523]++; if(dbg){print "V523"}; continue };
 if ( deep(-1) &&
   gl_nemn(1) && s(-1,0) )
 { l[i]=is_vsje; V[524]++; if(dbg){print "V524"}; continue };
 if ( w(1,"включая") && sc(0,",") &&
      q(2,"suw_vi") && s(1) )
 { l[i]=is_vsje; V[525]++; if(dbg){print "V525"}; continue };
 if ( deep(-1) &&
  nar_mest(1) && s(-1,0) )
 { l[i]=is_vsyo; V[526]++; if(dbg){print "V526"}; continue };
 if ( deep(-1) && s(-1) && p(0) )
 { l[i]=is_vsyo; V[527]++; if(dbg){print "V527"}; continue };
 if ( gl_nemn(-1) &&
            q(1,"prl_mnim prq_mnim prl_krmn") &&
         deep(2) && s(-1,0) && sc(1,",") )
 { l[i]=is_vsyo; V[528]++; if(dbg){print "V528"}; continue };

 # Все + ... + глагол ============================================
 # все + ... + гл.мн.
 if ( w(1,"так") &&
      q(2,"gl_vzmn gl_nemn") && s(0,1) )
 { l[i]=is_vsje; V[529]++; if(dbg){print "V529"}; continue };
 if ( q(1,"nar_mest nar_kaq nar_vrem nar_spos") &&
      q(2,"gl_vzmn gl_nemn") && s(0,1) )
 { l[i]=is_vsje; V[530]++; if(dbg){print "V530"}; continue };
 if ( q(1,"nar_mest nar_kaq nar_vrem nar_spos") &&
      q(2,"gl_pnmn gl_pemn") && s(0,1) )
 { l[i]=is_vsje; V[531]++; if(dbg){print "V531"}; continue };
 if ( nar_vrem(1) &&
      nar_vrem(2) &&
             q(3,"gl_vzmn gl_nemn") && s(0,2) )
 { l[i]=is_vsje; V[532]++; if(dbg){print "V532"}; continue };
 if ( q(-1,"gl_vzed gl_vzmn gl_nemn") &&
         prl_srav(1) && s(-1,0) )
 { l[i]=is_vsyo; V[533]++; if(dbg){print "V533"}; continue };
 if ( nar_srav(1) &&
             q(2,"gl_vzmn gl_nemn gl_pemn") && s(0,1) )
 { l[i]=is_vsyo; V[534]++; if(dbg){print "V534"}; continue };
 if ( suw_mnim(-1) && cap(-1) &&
             q(1,"gl_vzmn gl_nemn") && s(0) && p(1) )
 { l[i]=is_vsyo; V[535]++; if(dbg){print "V535"}; continue };
 if ( Qw_(-2,"pre_vi") &&
 suw_edim(-1) &&
        q(1,"gl_vzmn gl_nemn") && s(-1,0) && p(1) )
 { l[i]=is_vsyo; V[536]++; if(dbg){print "V536"}; continue };
 if ( q(-3,"suw_im") &&
 pre_pr(-2) &&
      q(-1,"suw_pr") &&
      q(1,"gl_vzmn gl_nemn") && s(0) && p(1) )
 { l[i]=is_vsyo; V[537]++; if(dbg){print "V537"}; continue };
 if ( gl_vzmn(-3) &&
       pre_tv(-2) &&
            q(-1,"suw_tv mest_tv") )
 { l[i]=is_vsje; V[538]++; if(dbg){print "V538"}; continue };


 # Всё + ... + глагол.мн + дополнение ============================
  if ( gl_pemn(-2) &&
             w(-1,"себя") && s(-2,-1) )
 { l[i]=is_vsje; V[539]++; if(dbg){print "V539"}; continue };
if ( gl_nemn(1) &&
     nar_kaq(2) &&
    prq_krmn(3) && s(0,2) )
 { l[i]=is_vsje; V[540]++; if(dbg){print "V540"}; continue };
 if ( gl_nemn(1) &&
     prl_krmn(2) && s(0,1) )
 { l[i]=is_vsje; V[541]++; if(dbg){print "V541"}; continue };
 if ( q(1,"gl_pemn gl_pnmn") &&
      q(2,"suw_ro") && s(0,1) )
 { l[i]=is_vsje; V[542]++; if(dbg){print "V542"}; continue };

 if ( q(1,"gl_pemn gl_pnmn") &&
      q(2,"suw_tv suw_da") && s(0,1) )
 { l[i]=is_vsyo; V[543]++; if(dbg){print "V543"}; continue };

 # все + гл.мн и/или гл.мн
 if ( q(1,"gl_pemn gl_nemn gl_pnmn gl_vzmn") &&
      w(2,"и") &&
      q(3,"gl_pemn gl_nemn gl_pnmn gl_vzmn") && s(0,2) && qq(1,3) )
 { l[i]=is_vsyo; V[544]++; if(dbg){print "V544"}; continue };
 if ( mest_mnim(-2) && w(-1,"то") && se(-2,"-") &&
              q(1,"gl_pemn gl_nemn gl_pnmn gl_vzmn") &&
              w(2,"и") &&
              q(3,"gl_pemn gl_nemn gl_pnmn gl_vzmn") && s(0,2) )
 { l[i]=is_vsyo; V[545]++; if(dbg){print "V545"}; continue };
 if ( mest_mnim(-1) &&
              q(1,"gl_pemn gl_nemn gl_pnmn gl_vzmn") &&
              w(2,"и") &&
              q(3,"gl_pemn gl_nemn gl_pnmn gl_vzmn") && s(0,2) )
 { l[i]=is_vsyo; V[546]++; if(dbg){print "V546"}; continue };
 if ( w(1,"и") &&
      q(2,"gl_pemn gl_nemn gl_pnmn gl_vzmn") &&
      w(3,"и") &&
      q(4,"gl_pemn gl_nemn gl_pnmn gl_vzmn") && s(0,3) )
 { l[i]=is_vsje; V[547]++; if(dbg){print "V547"}; continue };
 if ( q(1,"gl_pemn gl_nemn gl_pnmn gl_vzmn") &&
      w(2,"и") &&
      q(3,"gl_pemn gl_nemn gl_pnmn gl_vzmn") && s(0,2) )
 { l[i]=is_vsje; V[548]++; if(dbg){print "V548"}; continue };

 # гл.ед + ... + всё
 if ( q(-1,"gl_ed gl_in") &&
      q(1,"nar_vrem nar_mest nar_spos nar_srav nar_kaq suw_edvi") && s(-1,0) )
 { l[i]=is_vsyo; V[549]++; if(dbg){print "V549"}; continue };
 # гл.ед + всё
 if ( q(-2,"gl_ed gl_in") &&
mest_da(-1) &&
 pre_pr(1) &&
      q(2,"prl_pr suw_pr") && s(-2,1) )
 { l[i]=is_vsyo; V[550]++; if(dbg){print "V550"}; continue };
 # гл.ед + всё
 if ( q(-1,"gl_ed gl_in") &&
         suw_mnvi(1) && s(-1,0) && W(1,"новые") )
 { l[i]=is_vsje; V[551]++; if(dbg){print "V551"}; continue };


 # всё то, что
 if ( w(1,"то") && sc(1,",") &&
          mest_edsr(2) )
 { l[i]=is_vsyo; V[552]++; if(dbg){print "V552"}; continue };
 # всё, что
 if ( sc(0,",") &&
          mest_edsr(1) && W(2,"есть") )
 { l[i]=is_vsyo; V[553]++; if(dbg){print "V553"}; continue };
 if ( gl_mn(1) && sc(1,",") &&
          w(2,"что кто когда") && s(0) )
 { l[i]=is_vsje; V[554]++; if(dbg){print "V554"}; continue };
 # все те, кто
 if ( w(1,"те") && sc(1,",") &&
      q(1,"mest_edmu mest_edze") )
 { l[i]=is_vsje; V[555]++; if(dbg){print "V555"}; continue };
 # все, кто
 if ( sc(0,",") &&
       q(1,"mest_edmu mest_edze") )
 { l[i]=is_vsje; V[556]++; if(dbg){print "V556"}; continue };
 # учитывало всё, кроме
 if ( gl_ed(-1) && s(-1) &&
         sc(0,",") &&
          w(1,"кроме") )
 { l[i]=is_vsyo; V[557]++; if(dbg){print "V557"}; continue };

 # все, которые
 if ( sc(0,",") &&
       q(1,"mest_da suw_da") )
 { l[i]=is_vsyo; V[558]++; if(dbg){print "V558"}; continue };
 if ( sc(0,",") &&
       q(1,"mest_mn prq_mnim") && W(1,"мы вы") )
 { l[i]=is_vsje; V[559]++; if(dbg){print "V559"}; continue };

 # Ну всё,
 if ( w(-1,"ну") && s(-1) )
 { l[i]=is_vsyo; V[560]++; if(dbg){print "V560"}; continue };
 if ( qxw(-1,"ну","всё все") && sc(-1,",") && p(0) )
 { l[i]=is_vsyo; V[561]++; if(dbg){print "V561"}; continue };



 # Всё + ... + глагол.ед ============================================
 if ( q(1,"nar_vrem nar_mest nar_spos nar_srav nar_kaq nar_step") &&
gl_edsr(2) && s(0,1) )
 { l[i]=is_vsyo; V[562]++; if(dbg){print "V562"}; continue };
 if ( gl_edsr(-3) &&
            w(-2,"ли же ведь") &&
      mest_it(-1) && s(-3,-1) )
 { l[i]=is_vsyo; V[563]++; if(dbg){print "V563"}; continue };
 if ( gl_edsr(-1) && s(-1) )
 { l[i]=is_vsyo; V[564]++; if(dbg){print "V564"}; continue };
 if ( gl_vzed(1) && Q(1,"gl_vzmn") && s(0) )
 { l[i]=is_vsyo; V[565]++; if(dbg){print "V565"}; continue };
 if ( prl_kred_sr(1) &&
            gl_in(2) && s(0,1) )
 { l[i]=is_vsyo; V[566]++; if(dbg){print "V566"}; continue };
 if ( gl_vzed(-1) &&
            q(1,"pre_vi pre_ro pre_tv") && s(-1,0) )
 { l[i]=is_vsyo; V[567]++; if(dbg){print "V567"}; continue };
 if ( w(-2,"так") &&
      q(-1,"mest_im") &&
      w(1,"себе") &&
      w(2,"и") && s(-2,1) )
 { l[i]=is_vsyo; V[568]++; if(dbg){print "V568"}; continue };
 if ( q(-1,"gl_ed") &&
      w(1,"так") && sc(1,",") &&
      w(2,"что чтобы") && s(-1) && s(0) )
 { l[i]=is_vsyo; V[569]++; if(dbg){print "V569"}; continue };
 if ( sc(0,",") &&
 gl_vzed(-1) && s(-1) )
 { l[i]=is_vsyo; V[570]++; if(dbg){print "V570"}; continue };
 if ( qast(1) &&
      qast(2) &&
         q(3,"nar_vrem nar_mest nar_spos nar_srav nar_kaq suw_edvi mest_ed") &&
         q(4,"gl_ed gl_in") && s(0,3) )
 { l[i]=is_vsyo; V[571]++; if(dbg){print "V571"}; continue };
 if ( qast(1) &&
      qast(2) &&
         q(3,"nar_vrem nar_mest nar_spos nar_srav nar_kaq suw_edvi mest_ed") &&
      qast(4) &&
         q(5,"gl_ed gl_in") && s(0,4) )
 { l[i]=is_vsyo; V[572]++; if(dbg){print "V572"}; continue };
 if ( qast(1) &&
         q(2,"nar_vrem nar_mest nar_spos nar_srav nar_kaq suw_edvi mest_ed") &&
         q(3,"gl_ed gl_in") && s(0,2) )
 { l[i]=is_vsyo; V[573]++; if(dbg){print "V573"}; continue };
 if ( qast(1) &&
         q(2,"nar_vrem nar_mest nar_spos nar_srav nar_kaq suw_edvi mest_ed") &&
      qast(3) &&
         q(4,"gl_ed gl_in") && s(0,3) )
 { l[i]=is_vsyo; V[574]++; if(dbg){print "V574"}; continue };
 if ( mest_mnim(-2) &&
        gl_pnmn(-1) &&
              q(1,"nar_vrem nar_mest nar_spos nar_srav nar_kaq suw_edvi mest_ed") && s(-2,0) )
 { l[i]=is_vsje; V[575]++; if(dbg){print "V575"}; continue };
 if ( q(1,"nar_vrem nar_mest nar_spos nar_srav nar_kaq suw_edvi mest_ed") &&
   qast(2) &&
      q(3,"gl_ed gl_in") && s(0,2) )
 { l[i]=is_vsyo; V[576]++; if(dbg){print "V576"}; continue };
 if ( gl_nemn(-1) &&
        gl_in(1) && s(-1,0) && p(1) )
 { l[i]=is_vsyo; V[577]++; if(dbg){print "V577"}; continue };
 if ( nar_mest(1) &&
       mest_da(2) &&
         gl_ed(3) && s(0,2) )
 { l[i]=is_vsyo; V[578]++; if(dbg){print "V578"}; continue };
 if ( nar_mest(1) &&
       mest_da(2) &&
          qast(3) &&
         gl_ed(4) && s(0,3) )
 { l[i]=is_vsyo; V[579]++; if(dbg){print "V579"}; continue };
 if ( nar_mest(1) &&
       gl_pnmn(2) &&
         gl_in(3) && s(0,2) )
 { l[i]=is_vsje; V[580]++; if(dbg){print "V580"}; continue };
 if ( nar_mest(1) &&
       gl_pnmn(2) &&
          qast(3) &&
         gl_in(4) && s(0,3) )
 { l[i]=is_vsje; V[581]++; if(dbg){print "V581"}; continue };
 if ( q(1,"gl_pnmn gl_pemn") &&
  gl_in(2) && s(0,1) )
 { l[i]=is_vsje; V[582]++; if(dbg){print "V582"}; continue };
 if ( q(1,"gl_pnmn gl_pemn") &&
   qast(2) &&
  gl_in(3) && s(0,2) )
 { l[i]=is_vsje; V[583]++; if(dbg){print "V583"}; continue };
 if ( q(1,"gl_ed gl_in") && s(0) && cap(0) && p(1) )
 { l[i]=is_vsyo; V[584]++; if(dbg){print "V584"}; continue };
 if ( pre_ro(-2) &&
     mest_ro(-1) &&
           q(1,"gl_ed gl_in") && s(-2,0) )
 { l[i]=is_vsyo; V[585]++; if(dbg){print "V585"}; continue };
 if ( w(1,"и не ли так как же") &&
      q(2,"gl_ed gl_in") && s(0,1) )
 { l[i]=is_vsyo; V[586]++; if(dbg){print "V586"}; continue };
 if ( gl_ed(-3) &&
          w(-2,"бы") &&
  mest_mnvi(-1) &&
          q(1,"gl_ed gl_in") && s(-3,0) )
 { l[i]=is_vsje; V[587]++; if(dbg){print "V587"}; continue };
 if ( gl_ed(-3) &&
     pre_pr(-2) &&
         (q(-1,"suw_pr prl_pr")||wc(-1,"ах$")) && s(-3,-1) )
 { l[i]=is_vsyo; V[588]++; if(dbg){print "V588"}; continue };
 if ( gl_ed(-1) &&
     pre_pr(1) &&
         (q(2,"suw_pr prl_pr")||wc(2,"ах$")) && s(-1,1) )
 { l[i]=is_vsyo; V[589]++; if(dbg){print "V589"}; continue };
 if ( gl_ed(-2) &&
  mest_mnvi(-1) &&
          q(1,"gl_ed gl_in") && s(-2,0) )
 { l[i]=is_vsje; V[590]++; if(dbg){print "V590"}; continue };
 if ( mest_mnvi(-1) &&
              q(1,"gl_ed gl_in") && s(-1,0) )
 { l[i]=is_vsyo; V[591]++; if(dbg){print "V591"}; continue };
 if ( q(1,"gl_ed gl_in") && s(0) )
 { l[i]=is_vsyo; V[592]++; if(dbg){print "V592"}; continue };
 if ( mest_da(1) &&
            q(2,"gl_ed gl_in") && s(0,1) )
 { l[i]=is_vsyo; V[593]++; if(dbg){print "V593"}; continue };
 if (  q(1,"nar_vrem nar_mest nar_spos nar_step nar_srav nar_kaq") &&
       q(2,"gl_ed gl_in") && s(0,1) )
 { l[i]=is_vsyo; V[594]++; if(dbg){print "V594"}; continue };


 # все + ... + перех глагол ============================================
 if ( nar_vrem(-1) &&
             q(1,"gl_pemn gl_pnmn") && s(-1,0) && p(1) )
 { l[i]=is_vsyo; V[595]++; if(dbg){print "V595"}; continue };
 if ( mest_mn(1) &&
            q(2,"gl_pemn gl_pnmn") &&
            w(3,"о об") &&
            q(4,"mest_pr suw_tv") && s(0,3) )
 { l[i]=is_vsje; V[596]++; if(dbg){print "V596"}; continue };
 if ( mest_mn(-2) && s(-1) &&
            w(-1,"ведь уже") &&
            q(1,"gl_pemn gl_pnmn") && s(-2,0) )
 { l[i]=is_vsyo; V[597]++; if(dbg){print "V597"}; continue };
 if ( q(1,"gl_pemn gl_pnmn") &&
      w(2,"о об") &&
      q(3,"mest_pr suw_tv") && s(0,2) )
 { l[i]=is_vsje; V[598]++; if(dbg){print "V598"}; continue };
 if ( mest_vi(1) &&
            q(2,"gl_pemn gl_pnmn") &&
            q(3,"suw_mnvi prl_mnvi") && s(0,1) )
 { l[i]=is_vsyo; V[599]++; if(dbg){print "V599"}; continue };
 if ( mest_vi(1) &&
            q(2,"gl_pemn gl_pnmn") && s(0,1) )
 { l[i]=is_vsje; V[600]++; if(dbg){print "V600"}; continue };
 if ( wc(1,"..ы$") &&
       q(2,"gl_pemn gl_pnmn gl_nemn gl_vzmn") && s(0,1) )
 { l[i]=is_vsje; V[601]++; if(dbg){print "V601"}; continue };
 if ( prl_kred_sr(1) &&
                q(2,"gl_pemn gl_pnmn") &&
                q(3,"suw_vi") && s(0,2) )
 { l[i]=is_vsje; V[602]++; if(dbg){print "V602"}; continue };
 if ( mest_vi(1) &&
         qast(2) &&
            q(3,"gl_pemn gl_pnmn") && s(0,2) )
 { l[i]=is_vsje; V[603]++; if(dbg){print "V603"}; continue };
 if (gl_pemn(1) &&
           q(2,"prl_vi prq_mnvi") &&
           q(3,"suw_vi") && s(0,2) )
 { l[i]=is_vsje; V[604]++; if(dbg){print "V604"}; continue };
 if (qast(1) &&
  gl_pemn(2) &&
        q(3,"prl_vi prq_vi") &&
        q(4,"suw_vi") && s(0,3) )
 { l[i]=is_vsje; V[605]++; if(dbg){print "V605"}; continue };
 if (mest_mnim(1) &&
             q(2,"gl_pemn gl_pnmn") &&
             q(3,"prl_vi prq_vi") &&
             q(4,"suw_vi") && s(0,3) )
 { l[i]=is_vsje; V[606]++; if(dbg){print "V606"}; continue };
 if (mest_mnim(1) &&
             q(2,"gl_pemn gl_pnmn") &&
             q(3,"prl_vi prq_vi") &&
             q(4,"prl_vi prq_vi") && s(0,3) )
 { l[i]=is_vsje; V[607]++; if(dbg){print "V607"}; continue };
 if (mest_mnim(1) &&
          qast(2) &&
             q(3,"gl_pemn gl_pnmn") &&
             q(4,"prl_vi prq_vi") &&
             q(5,"suw_vi") && s(0,4) )
 { l[i]=is_vsje; V[608]++; if(dbg){print "V608"}; continue };
 if (gl_pnmn(1) &&
      pre_vi(2) &&
    suw_edvi(3) && s(0,2) )
 { l[i]=is_vsje; V[609]++; if(dbg){print "V609"}; continue };
 if ( q(1,"gl_nemn gl_pnmn gl_pemn") &&
         nar_srav(2) && s(0,1) && p(2) )
 { l[i]=is_vsje; V[610]++; if(dbg){print "V610"}; continue };
 if ( suw_mnvi(-1) &&
             q(1,"gl_nemn gl_pnmn gl_pemn") &&
        pre_pr(2) &&
             q(3,"suw_edpr suw_edme") && s(-1,2) )
 { l[i]=is_vsyo; V[611]++; if(dbg){print "V611"}; continue };
 if ( q(1,"gl_nemn gl_pnmn gl_pemn") &&
 pre_pr(2) &&
      q(3,"suw_edpr suw_edme") && s(0,2) )
 { l[i]=is_vsje; V[612]++; if(dbg){print "V612"}; continue };
 if (qast(1) &&
  gl_pnmn(2) &&
   pre_vi(3) &&
 suw_edvi(4) && s(0,3) )
 { l[i]=is_vsje; V[613]++; if(dbg){print "V613"}; continue };
 if (gl_pnmn(1) &&
      pre_vi(2) &&
     mest_vi(3) &&
    suw_edvi(4) && s(0,3) )
 { l[i]=is_vsje; V[614]++; if(dbg){print "V614"}; continue };
 if (qast(1) &&
  gl_pnmn(2) &&
   pre_vi(3) &&
  mest_vi(4) &&
 suw_edvi(5) && s(0,4) )
 { l[i]=is_vsje; V[615]++; if(dbg){print "V615"}; continue };
 if (gl_pnmn(1) &&
      pre_vi(2) &&
     mest_vi(3) && s(0,2) && p(3) )
 { l[i]=is_vsje; V[616]++; if(dbg){print "V616"}; continue };
 if (prl_kred_sr(1) &&
         gl_pnmn(2) &&
          pre_vi(3) &&
         mest_vi(4) && s(0,3) )
 { l[i]=is_vsje; V[617]++; if(dbg){print "V617"}; continue };
 if (pre_vi(1) &&
    mest_vi(2) &&
    gl_pnmn(3) && s(0,2) )
 { l[i]=is_vsje; V[618]++; if(dbg){print "V618"}; continue };
 if (pre_vi(1) &&
    mest_vi(2) &&
       qast(3) &&
    gl_pnmn(4) && s(0,3) )
 { l[i]=is_vsje; V[619]++; if(dbg){print "V619"}; continue };
 if (pre_tv(1) &&
    mest_tv(2) &&
   nar_mest(3) &&
    gl_vzmn(4) && s(0,3) )
 { l[i]=is_vsje; V[620]++; if(dbg){print "V620"}; continue };
 if (pre_pr(1) &&
          q(2,"prl_pr") &&
          q(3,"suw_pr") &&
      gl_ed(4) && s(0,3) )
 { l[i]=is_vsyo; V[621]++; if(dbg){print "V621"}; continue };
 if (pre_pr(1) &&
          q(2,"prl_pr") &&
          q(3,"suw_pr") &&
          q(4,"gl_vzmn gl_nemn") && s(0,3) )
 { l[i]=is_vsje; V[622]++; if(dbg){print "V622"}; continue };
 if ( q(1,"gl_pemn gl_pnmn") &&
mest_vi(2) &&
      q(3,"prl_vi prq_mnvi suw_vi") && s(0,2) )
 { l[i]=is_vsje; V[623]++; if(dbg){print "V623"}; continue };
 if (qast(1) &&
        q(2,"gl_pemn gl_pnmn") &&
  mest_vi(3) &&
        q(4,"prl_vi prq_mnvi suw_vi") && s(0,3) )
 { l[i]=is_vsje; V[624]++; if(dbg){print "V624"}; continue };
 if ( q(1,"gl_pemn gl_pnmn") && cap(0) &&
      q(2,"suw_vi mest_vi") &&
  gl_in(3) && s(0,2) )
 { l[i]=is_vsyo; V[625]++; if(dbg){print "V625"}; continue };
 if ( q(1,"gl_pemn gl_pnmn") &&
      q(2,"suw_vi mest_vi") && s(0,1) )
 { l[i]=is_vsje; V[626]++; if(dbg){print "V626"}; continue };
 if ( q(1,"qast mest_da") &&
      q(2,"gl_pemn gl_pnmn") &&
      q(3,"suw_vi mest_vi") && s(0,2) )
 { l[i]=is_vsje; V[627]++; if(dbg){print "V627"}; continue };

 if (mest_da(-1) &&
           q(1,"suw_vi") &&
           q(2,"gl_pemn gl_pnmn") && s(-1,1) )
 { l[i]=is_vsje; V[628]++; if(dbg){print "V628"}; continue };
 if ( mest_ro(-1) && p(-2) &&
            q(1,"gl_pemn gl_pnmn") &&
           (q(2,"suw_tv isname")) && s(-1,1) )
 { l[i]=is_vsje; V[629]++; if(dbg){print "V629"}; continue };


 # гл.мн. + дополнение с прдл. в вин. п.
 if ( gl_nemn(-2) &&
       pre_vi(-1) &&
            q(1,"suw_tv") && s(-2,0) )
 { l[i]=is_vsyo; V[630]++; if(dbg){print "V630"}; continue };

 # гл.мн. + дополнение с прдл. в пр. п.
 if ( q(-2,"suw_mnim suw_mnne") &&
gl_nemn(-1) &&
 pre_pr(1) && s(-2,1) )
 { l[i]=is_vsje; V[631]++; if(dbg){print "V631"}; continue };
 if ( pre_pr(1) &&
    suw_edpr(2) &&
           q(3,"gl_nemn gl_pnmn") &&
      pre_pr(4) && s(0,3) )
 { l[i]=is_vsje; V[632]++; if(dbg){print "V632"}; continue };
 if ( mest_mnim(1) &&
         pre_tv(2) &&
              q(3,"suw_tv") &&
              q(4,"gl_nemn gl_pnmn") &&
         pre_pr(5) && s(0,4) )
 { l[i]=is_vsje; V[633]++; if(dbg){print "V633"}; continue };
 if ( pre_tv(1) &&
           q(2,"suw_tv") &&
           q(3,"gl_nemn gl_pnmn") &&
      pre_pr(4) && s(0,3) )
 { l[i]=is_vsje; V[634]++; if(dbg){print "V634"}; continue };

 # гл.мн. + дополнение с прдл. в тв. п.
 if ( q(-2,"suw_mnim suw_mnne") &&
gl_nemn(-1) &&
 pre_tv(1) && s(-2,1) )
 { l[i]=is_vsje; V[635]++; if(dbg){print "V635"}; continue };
 if ( pre_pr(1) &&
    suw_edpr(2) &&
           q(3,"gl_nemn gl_pnmn") &&
      pre_tv(4) && s(0,3) )
 { l[i]=is_vsje; V[636]++; if(dbg){print "V636"}; continue };
 if ( mest_mnim(1) &&
         pre_tv(2) &&
              q(3,"suw_tv") &&
              q(4,"gl_nemn gl_pnmn") &&
         pre_tv(5) && s(0,4) )
 { l[i]=is_vsje; V[637]++; if(dbg){print "V637"}; continue };
 if ( pre_tv(1) &&
           q(2,"suw_tv") &&
           q(3,"gl_nemn gl_pnmn") &&
      pre_tv(4) && s(0,3) )
 { l[i]=is_vsje; V[638]++; if(dbg){print "V638"}; continue };



 # гл.мн + все + ...  ============================================
 # гл.мн + все + ... + доп.
 if ( q(-1,"gl_vzmn gl_nemn") &&
     sc(0,",") &&
      q(1,"nar_mest nar_kaq nar_vrem nar_spos mest_mn suw_edda") && s(-1) )
 { l[i]=is_vsje; V[639]++; if(dbg){print "V639"}; continue };
 if ( q(1,"gl_pemn") && sc(1,",") &&
      w(2,"что") && s(0) )
 { l[i]=is_vsje; V[640]++; if(dbg){print "V640"}; continue };
 if ( q(-1,"gl_vzmn gl_nemn") && s(-1) &&
     sc(0,",") )
 { l[i]=is_vsje; V[641]++; if(dbg){print "V641"}; continue };


 # ... + всё[;.?!]
 if ( (w(-1,"и")||q(-1,"mest_ed nar_vrem")) && s(-1) && cap(-1) && p(0) )
 { l[i]=is_vsyo; V[642]++; if(dbg){print "V642"}; continue };

 if ( q(-1,"gl_vzmn gl_nemn") && s(-1) && p(0) )
 { l[i]=is_vsje; V[643]++; if(dbg){print "V643"}; continue };

 if ( q(-1,"gl_ed gl_in") && s(-1) && (p(0)||pre_any(1)) )
 { l[i]=is_vsyo; V[644]++; if(dbg){print "V644"}; continue };

 if ( w(1,"были") && s(0) )
 { l[i]=is_vsje; V[645]++; if(dbg){print "V645"}; continue };


 # звательное ---------------------------
 if ( titul(1) && sc(0,",") && p(1) )
 { l[i]=is_vsyo; V[646]++; if(dbg){print "V646"}; continue };

 # вводные предложения ----------------------------------------------------
 if ( mest_mnim(1) &&
       nar_mest(2) &&
             vv(2,9) &&
       suw_mnim(vvn+1) )
 { l[i]=is_vsje; V[647]++; if(dbg){print "V647"}; continue };
 if ( vv(0,7) && q(vvn+1,"gl_vzmn gl_nemn suw_mnim mest_mnim muk_mnim") )
 { l[i]=is_vsje; V[648]++; if(dbg){print "V648"}; continue };
 if ( mest_mnim(1) && vv(1,8) &&
              q(vvn+1,"nar_spos prl_kred_sr") &&
       prl_krmn(vvn+2) && s(0) && s(vvn+1,vvn+1) && p(vvn+2) )
 { l[i]=is_vsje; V[649]++; if(dbg){print "V649"}; continue };
 if ( mest_mnim(1) && vv(1,8) &&
      gl_povzmn(vvn+1) && s(0) )
 { l[i]=is_vsje; V[650]++; if(dbg){print "V650"}; continue };
 if ( mest_mnim(1) && vv(1,8) &&
       nar_mest(vvn+1) &&
       nar_mest(vvn+2) && s(0) && s(vvn+1,vvn+1) )
 { l[i]=is_vsje; V[651]++; if(dbg){print "V651"}; continue };
 if ( vv(1,8) &&
       q(vvn+1,"gl_edsr mest_im") )
 { l[i]=is_vsyo; V[652]++; if(dbg){print "V652"}; continue };
 if ( vvb(-8,-1) && suw_mnim(vvn) )
 { l[i]=is_vsje; V[653]++; if(dbg){print "V653"}; continue };
 if ( vvb(-9,-2) &&
        w(vvn,"вот") &&
        w(-1,"и") && s(-1) && p(0) )
 { l[i]=is_vsyo; V[654]++; if(dbg){print "V654"}; continue };
 if ( vv(0,7) &&
       q(vvn+1,"nar_mest nar_kaq nar_vrem nar_spos") &&
       q(vvn+2,"gl_pnmn gl_pemn") && s(vvn+1) )
 { l[i]=is_vsje; V[655]++; if(dbg){print "V655"}; continue };


 # соседние предложения, определеящий выбор омографа
 if ( nar_mest(1) && sc(1,",") && s(0) &&
         gl_mn(2) &&
             q(3,"mest_vi suw_vi") && s(2) )
 { l[i]=is_vsje; V[656]++; if(dbg){print "V656"}; continue };
 if ( q(-4,"gl_pemn gl_pnmn gl_nemn") &&
         suw_mnvi(-3) && sc(-3,",") &&
    qxs(-1,"и","не") && p(0) )
 { l[i]=is_vsje; V[657]++; if(dbg){print "V657"}; continue };
 if ( qik_vi(-2) &&
    suw_mnvi(-1) && s(-2) && p(-1) &&
          qf(1,5,"suw_edro") &&
           q(qfn-1,"prl_edro prq_edro") && s(0,qfn-1) )
 { l[i]=is_vsje; V[658]++; if(dbg){print "V658"}; continue };


 # поиск вперёд ----------------------------------------------------------
 if ( qf(1,7,"gl_edsr") &&
       q(qfn+1,"prl_kred_sr suw_edtv") && s(0,qfn) )
 { l[i]=is_vsyo; V[659]++; if(dbg){print "V659"}; continue };
 if ( qf(1,7,"gl_nemn") &&
prq_krmn(qfn+1) && s(0,qfn) )
 { l[i]=is_vsje; V[660]++; if(dbg){print "V660"}; continue };
 if ( qf(1,5,"gl_edsr") && s(0,qfn-1) )
 { l[i]=is_vsyo; V[661]++; if(dbg){print "V661"}; continue };
 if ( mest_it(1) &&
      mest_da(2) &&
           qf(3,8,"prl_kred_sr") && s(0,qfn-1) && p(qfn) )
 { l[i]=is_vsyo; V[662]++; if(dbg){print "V662"}; continue };
 if ( mest_mn(1) &&
           qf(2,6,"gl_vzmn") && s(0,qfn-1) )
 { l[i]=is_vsje; V[663]++; if(dbg){print "V663"}; continue };
 if ( qf(1,5,"gl_vzmn") && s(0,qfn-1) )
 { l[i]=is_vsje; V[664]++; if(dbg){print "V664"}; continue };

 #--- фразы ----------------------------------------------------

 # поиск назад ------------------------------------------------------------
 if ( pre_ro(1) && qb(-5,-1,"mest_mn") &&
           q(2,"suw_ro") && s(qbn,1) )
 { l[i]=is_vsyo; V[665]++; if(dbg){print "V665"}; continue };
 if ( qb(-7,-2,"mest_im") &&
     phs(-1,"как и") && s(-2,-1) )
 { l[i]=is_vsje; V[666]++; if(dbg){print "V666"}; continue };
 if ( qb(-5,-1,"suw_mnim") &&
  pre_pr(1) &&
       q(2,"mest_pr suw_tv") && s(qbn,1) )
 { l[i]=is_vsje; V[667]++; if(dbg){print "V667"}; continue };
 if ( qb(-5,-1,"prl_krmn mest_mnim") && sQ(qbn,0,".") &&
       q(1,"prl_kred_sr prl_edsrim") && s(0) && p(1) )
 { l[i]=is_vsje; V[668]++; if(dbg){print "V668"}; continue };

 if ( wb_raw(-7,-2,"все́") && sQ(wbn,-2,"[!.?]") && p(-1) )
 { l[i]=is_vsje; V[669]++; if(dbg){print "V669"}; continue };
 if ( wb(-7,-2,"всё все") && sQ(wbn,-2,"[!.?]") && p(-1) )
 { l[i]=is_vsyo; V[670]++; if(dbg){print "V670"}; continue };
 if ( qxs(-1,"далеко","не") &&  wb(-15,xsn-1,"всё все") &&p(0) )
 { l[i]=is_vsyo; V[671]++; if(dbg){print "V671"}; continue };


 # Spacy имена
 if ( name_vi_sy(-2) &&
               q(-1,"gl_pemn gl_pnmn") && s(-2,-1) && p(0) )
 { l[i]=is_vsje; V[672]++; if(dbg){print "V672"}; continue };


 # неизменяемые
 if ( suw_mnne(1) &&
      nar_spos(2) &&
             q(3,"gl_pemn gl_pnmn") && s(0,2) && p(3) )
 { l[i]=is_vsje; V[673]++; if(dbg){print "V673"}; continue };
 if ( mod_mn(2) &&
       gl_in(3) && s(0,2) )
 { l[i]=is_vsje; V[674]++; if(dbg){print "V674"}; continue };

 # одиничное слово
 if ( p(-1) && p(0) &&
     qf(1,3,"gl_poed gl_pomn gl_povzmn") )
 { l[i]=is_vsyo; V[675]++; if(dbg){print "V675"}; continue };
 if ( p(-1) && p(0) &&
   vvod(1) && p(1) &&
     qf(2,4,"gl_poed gl_pomn gl_povzmn") )
 { l[i]=is_vsyo; V[676]++; if(dbg){print "V676"}; continue };

 # одиничное слово
 if ( p(-1) && p(0) &&
      w(1,"конец погиб амба пиздец капец финиш пришли приехали дожили") && p(1,"[—,]") )
 { l[i]=is_vsyo; V[677]++; if(dbg){print "V677"}; continue };
 if ( p(-1) && p(0) &&
      w(1,"конец") &&
      q(2,"suw_ro") && p(2) )
 { l[i]=is_vsyo; V[678]++; if(dbg){print "V678"}; continue };
 if ( q(-3,"gl_nemn") &&
      w(-2,"бы") && s(-3) && p(-2) &&
      w(-1,"как") && s(-1) && p(0) )
 { l[i]=is_vsje; V[679]++; if(dbg){print "V679"}; continue };
 if ( w(1,"и") && sc(0,",") &&
    qxs(2,"ещё еще","больше") )
 { l[i]=is_vsyo; V[680]++; if(dbg){print "V680"}; continue };


 # Конечное подбирание хвостов ----------------------------------------------
 if ( q(1,"nar_spos nar_napr nar_step") && s(0) && p(1) )
 { l[i]=is_vsyo; V[681]++; if(dbg){print "V681"}; continue };
 if ( suw_mnim(1) && q(1,"prl_mnim prl_mnvi") && W(1,"новые") && s(0) )
 { l[i]=is_vsje; V[682]++; if(dbg){print "V682"}; continue };
 if ( q(1,"prq_mnim prq_krmn") && s(0) )
 { l[i]=is_vsje; V[683]++; if(dbg){print "V683"}; continue };
 if ( q(1,"gl_vzmn gl_nemn") && s(0) && p(1) )
 { l[i]=is_vsje; V[684]++; if(dbg){print "V684"}; continue };
 if ( prl_srav(1) && s(0) )
 { l[i]=is_vsyo; V[685]++; if(dbg){print "V685"}; continue };
 if ( gl_poed(-1) && s(-1) && p(0) )
 { l[i]=is_vsyo; V[686]++; if(dbg){print "V686"}; continue };
 if ( deep(1) && s(0) )
 { l[i]=is_vsyo; V[687]++; if(dbg){print "V687"}; continue };

 # короткие предложения в зависимости от предыдущей строки
 if (i<=5 && prevyo == b-1 && b != 1 )
 { l[i]=is_vsyo; V[688]++; if(dbg){print "V688"}; continue };

 # короткие предложения в зависимости от предыдущей строки
 if (i<=5 && prevje == b-1 && b != 1 )
 { l[i]=is_vsje; V[689]++; if(dbg){print "V689"}; continue };

 # Эскейпы для SpaCy
 if ( w(1,"новые новых") && s(0) )
 {             ; V[690]++; if(dbg){print "V690"}; continue };
 if ( p(-1) && p(0) )
 {             ; V[691]++; if(dbg){print "V691"}; continue };
 if ( p(-2) && p(0) )
 {             ; V[692]++; if(dbg){print "V692"}; continue };
 if ( sc(-2,"[\x22«(']") && sc(0,"[\x22»)']") )
 {             ; V[693]++; if(dbg){print "V693"}; continue };
 if ( qxs(-1,"а","где") && p(-3) && sc(0,"?") )
 {             ; V[694]++; if(dbg){print "V694"}; continue };
 if ( qxs(1,"на","борту") && p(-1) && p(2) )
 {             ; V[695]++; if(dbg){print "V695"}; continue };


 # SpaCy
 if ( vsyo_sy(0) )
 { l[i]=is_vsyo; V[696]++; if(dbg){print "V696"}; continue };
 if ( vsje_sy(0) )
 { l[i]=is_vsje; V[697]++; if(dbg){print "V697"}; continue };

             }; delete wpos;

 # всё/все́ в предыдущей строке
 if (nf-i <= 7 && l[i] in vsyos) {prevyo = b};
 if (nf-i <= 7 && l[i] in vsjes) {prevje = b};

 book[b]=joinpat(l,sep,nf) };};                                                ##_footer_vsez

}
