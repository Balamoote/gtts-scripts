# Подпрограмма формирования текстового превью для дискретных скриптов
# Последняя версия файла находится тут: https://github.com/Balamoote/gtts-scripts
# При запуске требует следующие переменные (-v):
#   obook = имя файла книги, которую будут править дискретные скрипты: имя файла
#   twd = ширина терминала: целое положительное число
#   preview = печатать или нет превью: 1 или не 1
#   termcor = величина корректировки ширины терминала: любое целое число
#   editor = используемый редактор: vim или neovim
function finduni(string,  tmp) # Функция определения кол-ва комбинирующих символов в подстроке
{ tmp = gsub(/[\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]/, "", string); return tmp }

function readfile(file,  tmp, save_rs) # Функция чтения файла в скаляр
{ save_rs = RS; RS = "^$"; getline tmp < file; close(file); RS = save_rs; return tmp }

BEGIN {
    # Выставить длину левой подстроки до поискового слова (lookback) и отступ справа (rightpad), остальное выставляется само в зависимости от ширина терминала и длины слова
    lookback = 38;		   # Длина левой подстроки, до поискового слова
    rightpad = 20;		   # отступ от края терминала справа при выводе програсса подготовки дискретных скриптов в терминал
    correcti = strtonum ( termcor )
    totallen = int((twd-4)/2); # Общая длина вывода, должна полность умещаться на половину экрана ("быстрый просмотр" в mc, т.е. еще -2), зависит от файлового менеджера
    maxwidth = twd - rightpad; # максимальная ширина вывода строки омографов во время создания превью

    unxy    = "[\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
    unxn    = "[^\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
    isword  = "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
    patword = "[^АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя\xcc\x81\xcc\xa0\xcc\xa3\xcc\xa4\xcc\xad\xcc\xb0]"
    dotmark = "................................................................................"
    wrdmark = "================================================================================"
    nummark = "###########"

    olexqty = split(readfile("omo-lexx.txt"), olex, "\n"); delete olex[olexqty];
    for ( l in olex ) { split(olex[l], olx, "#"); omolexx[olx[1]] = olx[2] };
    delete olex; delete olx;

    omoqty = split(readfile("omo-luc.lst"), omlst, "\n"); delete omlst[omoqty];
    for (i in omlst) { #b1
        le = split (omlst[i], arr, " ");
        om[i] = arr[1]; omos[arr[1]]; lcm = tolower(om[i]); oml = length(lcm); ompad = sprintf("%" oml+5 "s", "" );
	headr = sprintf ( "%s\n%s%s\n", "#!/bin/bash", ompad, "var=$1; case \"$var\" in");
        sedpart = ""; vimpart = ""; lexxpart = ""; riphead = ""; vpat = arr[2];
        for (s = 2; s <= le; s++ ) { #b2 Сборка опций для sed
            sedline = ompad sprintf ( "%s%s%s%s%s%s%s%s%s%s%s %s\n", "sed -ri \"$2 s/(", unxn, ")\\b", arr[1], "\\b(", unxn, ")/\\1", arr[s], "\\2/g", "\" ../", obook, ";;" );
            sedhead = sprintf ( "%s%s %s %s %s %s%s%s %s %s\n", s-1, ")#", arr[s], "<=", arr[1], ": ./", arr[1], ".sh", s-1, "[номер строки]" );
            sedpart = sedpart sedhead sedline }; #b2
            # Сборка заголовка для ./stripper.sh
            ripline = ompad sprintf ( "%s %s %s %s %s", "cd .. && ./stripper.sh", obook, "-w", arr[1], ";;"  );
            riphead = sprintf ( "%s %s %s %s %s\n%s\n", "0)#", arr[1], "<=", arr[1], "очистить слово от служебных и ударения!", ripline );
            # Сборка заголовка для vim/neovim, переменная editor задаётся в scriptdb/settings.ini
        for (v = 3; v <= le; v++) { vpat = vpat "/" arr[v] };
            vimline = sprintf ( "   %s %s%s%s%s%s%s%s%s%s%s\n", editor, "-c \"set hls | %SubstituteChoice /", unxn, "\\zs\\<", arr[1], "\\>\\ze", unxn, "/", vpat, "/gc\" ../", obook );
            vimhead = sprintf ( "%s %s%s%s%s%s%" totallen "s\n", "*)# Изменить вручную в", editor, ": ./", arr[1], ".sh\n", vimline, ";; esac; exit 0" );


    for ( x in omolexx ) { lx = length(x);
        if ( substr(x, lx, 1 ) == "=" ) {
            if ( oml == lx-1 ) { if ( substr(lcm, 1, lx-1) == substr (x, 1, lx-1) ) { lexxpart = sprintf("%s %s\n", "Шаблон в lexx:", omolexx[x]) } } }
            else { if ( oml >= lx ) { if (substr (lcm, 1, lx) == x)	{  lexxpart = sprintf("%s %s\n", "Шаблон в lexx:", omolexx[x]) } } }
                };  
            if ( lexxpart == "" ) { lexxpart = sprintf("%s\n", "Шаблон в lexx: нет" ) };

            shblock[i] = headr sedpart riphead vimhead lexxpart;
        } #b1
        delete omos[""]
 savefs = FS;   FS = patword;
    } { # Читаем файл книги в массив

    gsub("</?p>", "", $0)
    num++; book[num] = $0;
    for ( i=1; i<=NF; i++ ) { if ($i in omos) {omos[$i] = omos[$i] " " num}; }

} END { #e1 Для каждого омографа из сканируем каждую строку книги
FS = savefs
for ( o in om ) { #e2
    wrd = om[o];
    lifo=split(omos[wrd], omlin, " ");
    for (i in omlin) {if (omlin[i] == omlin[i+1]) {omlin[i]=""};  };

    wlen = length( wrd ); if ( wlen == 0 ) { continue };
    if ( preview == 1 ) { #preview
        replstring = sprintf( "%" wlen "s", "");
        lnumwidt = length(num);	                             # Ширина вывода номера строки из количества строк в книге
        lookfwrd = totallen-lookback-wlen-lnumwidt+correcti; # Длина правой части превьюшки
        maxprint += wlen + 1;                                # Текущая длина вывода в консоль, считаем для перевода строки

        if ( maxprint >= maxwidth ) { printf ("\n" ); maxprint = 0 };

        printf ( "\033[33m%s ", wrd );

        for ( i=1; i<=lifo; i++ ) { #e3
            b = omlin[i]; if ( b == "" ) {continue};
            # Копируем book[b], чтобы выреза́ть из копии уже найденное вхождение
            cline = book[b];                                 # Текущая строка
            clen  = length ( book[b] )                       # Длина текущей строки

            while ( word = match ( cline, wrd ) ) { 	     #e4 while ... match wrd всё ещё в строке
                wend = RSTART + RLENGTH                      # адрес начала правой подстроки
                best = substr(book[b], RSTART - 1, 1);       # адрес до поискового слова
                afst = substr(book[b], wend, 1)              # адерс после поискового слова

                # Проверка, границ слова: не обработано ли оно уже?
                if ( afst !~ isword && best !~ isword ) {    #e5 if best

                   rlen = lookfwrd;                          # Длина правой подстроки, после поискового слова
                   rzlen = 0; lzlen = 0;                     # Длина найденных "нулевых"

                   if ( RSTART > lookback + 1 ) {           #e7.1 if rstart ... левая подстока слева не дотягивается до 1
                       lan = RSTART - lookback; llen = lookback;
                       do {
                           lzlen0 = finduni(substr (book[b], lan, llen));
                           delta  = lzlen0 - lzlen;
                           lan   -= delta;
                           dzq    = finduni(substr (book[b], lan, delta));

                           if ( dzq > 0 ) { lan -= dzq; delta += dzq;
				   if ( substr(book[b], lan, 1) ~ unxy) { lan -= 1; delta += 1 }; };

                           if ( lan >= 1 ) { llen += delta; lpad = "";   }
                           else { llen = RSTART - 1;
                                  lpad = sprintf ( "%" 1 - lan "s", "" ) };

                           lzlen  = finduni(substr(book[b], lan, llen));

                       } while ( lzlen != lzlen0 );
 
                       lstring = lpad substr(book[b], lan, llen);
                    } #e7.1 if rstart on left

                    else if ( RSTART > 1 ) { #e7.2 else if RSTART

                            lan = 1; llen = RSTART - 1 ;
                            lstri = substr(book[b], lan, llen);
                            lzlen0 = finduni(lstri);
                            if ( lzlen0 > 0 ) { llen -= lzlen0 }; # reuse llen
                            lpad = sprintf( "%" lookback - llen "s", "" );
                            lstring = lpad lstri;

                     } #e7.2 else if RSTART

                         else  { lstring = "" ; } #e7.3.

                           # Формирование правой подстроки, без паддинга
                           do {				#e8
                               rzlen0 = finduni(substr( book[b], wend, rlen));
                               delta  = rzlen0 - rzlen;
                               rlen  += delta;
                               dzq    = finduni(substr(book[b], wend+rlen-delta, delta));
                               if ( dzq > 0 ) { rlen += dzq;  };
                               rzlen  = finduni(substr( book[b], wend, rlen));
                           } while ( rzlen != rzlen0 );	#e8

                     rstring = substr ( book[b], wend, rlen );

                     ennum=ennum+1;
                     prevar[ennum]=sprintf ("%" lnumwidt "s|%s%s%s", b, lstring, wrd, rstring);
                   } #e5 if afst
                   cline = substr ( cline, 1, RSTART - 1) replstring substr(cline, wend)
                } #e4 while ... match wrd in current line
            } #e3 main prog

            # Формируем блок текста превью для печати
            headline = sprintf("%s%s %s %s\n", substr(nummark, 1, lnumwidt), substr(dotmark, 1, lookback), substr(wrdmark, 1, wlen), substr(dotmark, 1, lookfwrd - 1)) ;
            prevblock = sprintf ("%s %s\n", "Всего найдено:", ennum) headline;

            for (j in prevar) { prevblock = prevblock sprintf ("%s\n", prevar[j]) };

            # Обнуление цикла
            ennum=0; delete prevar;

        }; #preview
        ofile = wrd ".sh"
        outblock = shblock[o] prevblock
        print outblock >> ofile; fflush();
        close(ofile);

    } #e2
    printf ( "\033[0m%s\n", "" );
#  for (i in omos){ print i omos[i]}
} #e1

