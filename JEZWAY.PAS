unit Jezway;
{$G+,O+,B+}

interface

uses Overlay,Crt,DDPlus,pipecode,simmail;

Type
  SCOREBOARD = Record
    User,VirusName,SpaceC:String;
    Sex,SpareA,SpareB:Char;
    Attacks,VirusType:Byte;
    SpareE,Size,FilesInfected:LongInt;
    SpareF,Proto,LastonD,LastOnM,LastOnY:Word;
    SpareG,Flirted,Dead,Deleted,WRONGGUESS:Boolean;
    OriginalSize,SpareI:LongInt;
    Team,offspring,Charm,SpareJ:Byte;
    Mutation,Battles,Stealth:Byte;
  end;

Type
  PROGRAMS = Record
    ProgName:String;
    PDeadLine:String;
    UDeadLine:String;
    MaxSize:LongInt;
    RewardK:LongInt;
  end;



Var
 Oldnews,Newsfile:text;
 Progs:Programs;
 Programfile: File of Programs;
 k,Scores:Scoreboard;
 Scorefile:File of Scoreboard;
 proto,UserNum,LastOnD,LastOnM,LastOnY,day,month,year,tday:word;
 Flirted,Gotit,Wrongguess,foundhim,Dead,PIZZA,Careful,
 Married,TimeToExit,entering_game:boolean;
 Attacks:Byte;
 add1news,theonetofind,UserH,VirusName:String;
 mut,spynum,CODE:Integer;
 OriginalSize,Size,FilesInfected:LongInt;
 Sex:Char;
 i:integer;
 Charm,offspring,VirusType,Team,Mutation,Battles,Stealth:Byte;

procedure showhelp;
function Strupcase (tempstr: linestring): linestring;
function litos(alf:longint):string;
function exist (filename: string) : boolean;
procedure FindThemNow;
procedure YesNo(default:char);
procedure YorN(default:char);
function Stripe (MYString:string):string;
function Spaces (Thestring:string; Me:integer):string;
function dots(Thestring:string;Me:Integer):string;
procedure Stop;
function Uplow (TempStr:Linestring):Linestring;
function ucase (tempstr: string): string;
procedure crlf (blah: integer);
procedure shownews;
Procedure Addnews(linetoadd:string);
Procedure Createnews;
Procedure MakeAnnouncement;
procedure Intro;
function StartStop: boolean;
procedure ShowF(Filnam:Linestring);
procedure Spinner(X,y,f,num:byte);
procedure choose1;
procedure telldead;
Procedure Laugh;
procedure choose2;
procedure mailtop (titl: string; from: string);
procedure tophalf(SIDE2:BOOLEAN);
Procedure Middle(INSRT:String; LIN:Byte; SIDE2:BOOLEAN);
Procedure BottomHalf(SIDE2:BOOLEAN;NOTALLWAY:BOOLEAN;DONTO:BYTE);
procedure showsewer;
procedure showmain;
procedure stats;
Procedure SeeBattle;
Procedure Infection;
Procedure JezPoster;
Procedure ExchangePPP;
Procedure AskRiddle;
Procedure FlirtJ;
Procedure FlirtB;
function striphigh(stripword:string):string;
function whatsregname:string;

implementation

procedure showhelp;
begin
clrscr;
textcolor(13);
Writeln('DOOR COMMAND LINE PARMS:  You need to use these when running this doorgame:');
textcolor(5);
Writeln('/Bxxx - Specify locked baud rate (i.e. /B38400) [Optional]');
Writeln('/Cx   - Specify comport number.  (x is 1-4) [Optional]');
Writeln('/E    - Use EMS for extra memory. [Do you have EMS memory?]');
Writeln('/L    - Local mode [If your just testing the door]');
Writeln('/Nx   - Specify node number. (x is 1-255) [Optional]');
Writeln('/Pyyy - Specify path to drop file (i.e. /Pc:\bbs\node1). [Required!]');
end;





function Strupcase (tempstr: linestring): linestring;
var
  i : integer;
begin
  for i := 1 to length (tempstr) do tempstr [i] := upcase (tempstr [i] );
  Strupcase := tempstr;
end;


function litos(alf:longint):string;
var
 zoodle:string;
begin
str(alf,zoodle);
litos:=zoodle;
end;

function exist (filename: string) : boolean;
var
  sample : text;
begin
  assign (textfile, filename);
  {$I-}
  reset (textfile);
  {$I+}
  if ioresult = 0 then
  begin
    exist := true;
    close (textfile);
  end
  else
    exist := false;
end;

procedure FindThemNow;
Var
    f,g,h:integer;
begin
  FoundHim := false;
  g := 0;
  h := 0;
  reset(scorefile);
  for f := 1 to 100 do begin;
    seek (Scorefile, f);
    read (Scorefile, k);
    if (StrUpcase (stripe (k. virusname) ) = StrUpCase (TheOneToFind)) and (not k.deleted)
    then begin foundhim := true; g := f; end;
    if (k. deleted) and (h = 0) then h := f;
  end;
  swriteln ('');
  if (g = 0) and (h = 0) then begin;
    foundhim := false;
    exit;
  end;
  spynum := g;
  if (g = 0) then begin;
    foundhim := false;
  end;
  close(scorefile);
end;


procedure YesNo (default: char);
begin
  swrite (default);
  repeat
    sREAD_Char (choice);
    choice := upcase (choice);
    if choice = #13 then choice := default;
  until choice in ['Y', 'N'];
  if choice = 'Y' then pipeln (#8 + '|13Yes') else pipeln (#8 + '|13No');
end;

procedure YorN (default: char);
begin
  swrite (default);
  repeat
    sREAD_Char (choice);
    choice := upcase (choice);
    if choice = #13 then choice := default;
  until choice in ['Y', 'N'];
  if choice = 'Y' then pipeln (#8 + '|09Yes') else pipeln (#8 + '|09No');
end;

procedure Stop;
var
  badass:char;
  I:integer;
begin
  PIPE('|15ş|13ù|05ú |15P|13r|05ess |15A|13n|05y |15K|13e|05y |05ú|13ù|15ş');
  sread_char(badass);
  for I := 1 to 21 do
    swrite(#8);
end;

function Stripe;
var
  a, b, e, f, count: integer;
  c: string [1];
  d: string [2];
  ch : char;
  lengtht : integer;
  strip:string;
begin
  Stripe:='';
  strip:='';
  lengtht := length(Mystring);
  for a := 1 to lengtht do
  begin;
    c := mystring[a];
    if c = '|' then begin;
      a := a + 2;
    end else begin if c='`' then begin
    a:=a+1; end; end;
    if (c<>'|') and (c<>'`') then Strip:=Strip+c;
  end;
  stripe:=strip;
end;



function Spaces;
var
  I:integer;
  B:string;
begin
  if length(stripe(TheString))>Me then begin
    repeat
      delete(Thestring,length(stripe(TheString)),1);
    until length(stripe(TheString))=Me;
  end;
  if length(stripe(TheString))<Me then begin
    repeat
      TheString:=Thestring+' ';
    until length(stripe(TheString))=Me;
  end;
  if length(stripe(TheString))=Me then Spaces:=TheString;
end;

function dots;
var
  I:integer;
  B:string;
begin
  if length(stripe(TheString))>Me then begin
    repeat
      delete(Thestring,length(stripe(TheString)),1);
    until length(stripe(TheString))=Me;
  end;
  if length(stripe(TheString))<Me then begin
    repeat
      TheString:=Thestring+'.';
    until length(stripe(TheString))=Me;
  end;
  if length(stripe(TheString))=Me then DOTS:=TheString;
end;

function uplow (tempstr: linestring): linestring;
var
  i : integer;
begin
  for i := 1 to length (tempstr) do begin
    if (ord (tempstr [i] ) > 64) and (ord (tempstr [i] ) < 91) then
      tempstr [i] := chr (ord (tempstr [i] ) + 32);
    if tempstr[(i-1)]=' ' then tempstr[i]:=upcase(tempstr[i]);
  end;
  tempstr [1] := upcase (tempstr [1] );
  uplow := tempstr;
end;

{ Print X number of blank lines }
procedure crlf (blah: integer);
var blahh: integer;
begin
  for blahh := 1 to blah do swriteln ('');
end;

{ Converts a String to all uppercase }
function ucase (tempstr: string): string;
var
  i : integer;
begin
  for i := 1 to length (tempstr) do tempstr [i] := upcase (tempstr [i] );
  ucase := tempstr;
end;

{Procedure Shownews;
var line:string;
    lines:integer;
begin
SCLRSCR;
assign(newsfile,'jezebel.nws');
reset(newsfile);
repeat
readln(newsfile,line);
pipeln(line);
inc(lines);
if lines=23 then begin stop; lines:=0; end;
until eof(newsfile);
stop;
close(newsfile);
end;}
procedure CorY (default: char);
begin
  swrite (default);
  repeat
    sREAD_Char (choice);
    choice := upcase (choice);
    if choice = #13 then choice := default;
  until choice in ['C', 'Y'];
  if choice = 'Y' then pipeln (#8 + '|07Yesterday') else pipeln (#8 + '|07Continue');
end;

procedure SHOWNEWS;
begin
  SHOWF ('jezebel.nws');
  PIPE ('|07(|13C|07)|05ontinue Game or View |07(|13Y|07)|05esterday''s News|08: |15');
  CorY ('C'); ;
  delay (1000);
  if Choice = 'Y' then begin
    if not EXIST ('JEZNEWS.OLD') then begin
      PIPELN ('|04Sorry, No old news available at this time.'); stop; exit;
    end;
    SHOWF ('JEZNEWS.OLD');
    stop;
  end;
end;



Procedure Addnews(linetoadd:string);
begin
assign(newsfile,'JEZEBEL.NWS');
append(newsfile);
writeln(newsfile,linetoadd);
close(newsfile);
end;

Procedure Createnews;
var rando:integer;
begin
  assign(newsfile,'JEZEBEL.NWS');
  if EXIST ('JEZEBEL.NWS') then begin
    assign (OLDNEWS, 'JEZNEWS.OLD'); rewrite (OLDNEWS);
    reset (NewsFile);
    repeat
      readln (Newsfile, Add1News);
      writeln (OldNews, Add1News);
    until eof (NEWSFile);
    close (Newsfile);
    close (OldNews);
  end;
rewrite(newsfile);
writeln(newsfile,'|16|05          |05ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ');
writeln(newsfile,'          Ûß|15.ú. |05ßßÛÛßßßßßßßÛÛÛßßßßßßßßßÛßßßßßßßßßßßßßßßÛÛßßßßßßßÛÛÛÛ');
writeln(newsfile,'          ÛÜ|15''|05ÜÜ|15ø¬DoaS$$$Ss |05ßÛ |15,sS$$$Ss. sS$Ss sSs s#$#s|05Şİ|15.s#$$#a |05ßÛÛ');
writeln(newsfile,'          ÛÛÛÛÛ |15$$$''|05ÜÜÜ|15''$$$ |05Û |15$$'' |05ş |15''$$ ''$$$'' $$$  $$$ |05Ş |15$$$''ø$$$a |05Û');
writeln(newsfile,'          ÛÛÛÛÛ |15$$''|05ÜÛÛÛ |15$$$ |05Û |15$$$$$$$$''|05Ş |15$$$  $$$  $$$ |05Û |15''$$s. ''$$ |05Û');
writeln(newsfile,'          ÛÛÛÛÛ |15$$ |05ÛÛÛÛ |15$$$ |05Û |15$$''      |05ß |15$$$  $$$  $$$ |05İ |15a ''$$$a ''|05ŞÛ');
writeln(newsfile,'          ²ÛÛÛ |15s$$s |05ÛÛÛ |15$$''|05ÜÛÜ|15''ü¬«««¬üø|05Ü |15''$$ıı$$$ıı$$'' |05İ |15$$a "$$$ |05ŞÛ');
writeln(newsfile,'          ²²ÛÛÛÜÜÜÜÛÛÛÛ |15$''|05ÜÛÛÛÛÛÜÜÜÜÜÛÛÛÛÜ|15''|05ÜÛÛÜÜÜÛÜ|15''|05ÜÛÛÛ |15''$$$s$$'' |05ÛÛ');
writeln(newsfile,'          ±±²ÛÛÛÛÛÛÛÛÛÛÜ|15ø|05ÜÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÜ |15''$$'' |05'+
'ÜÛÛÛ');
writeln(newsfile,'          °±±²²ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ');
writeln(newsfile,'');
writeln(newsfile,'|07Todays Headline:');
rando:=random(7)+1;
case rando of
    1: writeln(newsfile,'|13Jezebel stopped by today, but left immediately.');
    2: writeln(newsfile,'|13Mr. User is beginning to suspect that he has a virus.');
    3: writeln(newsfile,'|15READ ALL ABOUT IT|07! |13Computer virus catches a virus!');
    4: writeln(newsfile,'|13Doctor''s study reports that laughing can firm abs!');
    5: writeln(newsfile,'|13Jezebel breaks into Wall Street, Microsoft stock disapears!');
    6: writeln(newsfile,'|13The Zodian Software Team got arrested for Trademark infringement!');
    7: writeln(newsfile,'|13Bill Gates has a baby daughter, and names her Jezebel!');
end;
writeln(newsfile,'');
close(newsfile);
end;

Procedure MakeAnnouncement;
var add1news:string;
begin
sclrscr;
  PIPELN ('|05You have one line to put in the daily news for others to read.');
  CRLF (1);
  PIPE ('|13> |15');
  prompt2(ADD1NEWS, 75,15,0);
  if length(ADD1NEWS)<2 then
    exit
  else begin
    ADDNEWS ('|05' + virusname + ' |13says|15:|07');
    ADDNEWS (ADD1NEWS);
    ADDNEWS ('');
  end;
end;

Procedure ExchangeScreen;
begin
SCLRSCR;
Pipeln('|16                       |04ÜÜÜÜ');
Pipeln('             °|00|20²|16  |04ÄÜÜÜÛßß                     ÜÜÛßÛßß');
Pipeln('          ÄÜÜ|00|20°|04|16²ßÛ|12|20ÜÜÛß|04|16Û°                    ÜÛß                       '+
       ' |02°|00|18²|16    |02°');
Pipeln('°    |04ßßßÛÛ|06|20°|04|16ß  |02° |04Û|12|20Ş|23²|20² |04|16Û|00|20°|04|16Ü                   '+
       'Ş|12|20°|04|16±             ßßßÛÜÜÜ   |02Ü|00|18°|02|16²|00|18²|16 |02°|00|18²°²|16');
Pipeln('|18°|02|16°|00|18²|02|16°  ° |04Ş|06|20°±|04|16± |02°±°|04ÛÛ|12|20Û²° |04|16ßßßßß |02şß  °|00'+
       '|18²|16  |04Ü ÜÜÜÜÜÜÛ²Ü                 ß|12|20ß|04|16ßßÜÜ |02ß|00|18°|02|16Ü  ß|00|18°|02|16Ü');
Pipeln('|00|18°|02|16²|00|18°|02|16²|00|18²|16    |04ß|06|20°|04|16ÛÜ |02° |04Û|12|20°²° |04|16Û|00|20'+
       '°|04|16° |02Ü|10|18Ü|02|16Ü  °|00|18²|02|16²|00|18±|02|16°|00|18²|02|16°  ° |04ßß Ü|23Û|16ßß'+
       '|22²|16ÜÜÜÜÜ Ü |02°   °   |04ÜÜÜ  ßÜ |02ßß  Ş|10|18°|16');
Pipeln('|18°° |02|16²Ü |04ß ßßßßß|15|20°|04|16ÛÜÛÛ|12|20°|04|16ÛÛÛ|22²|16ÜÜ |02ß   ÜÜ|10|18°|00°|02'+
       '|16²|00|18°|02|16±°°±|00|18²|02|16°°  |04ß|12|20ŞÜ|04|16Ü   ßİ    |02° °±°   |12|20°°|00°|16'+
       '  |04Ş|12± |02° Ü|10|18°|02|16ß');
Pipe('Ş|10|18°|02|16ÜÛÜÜ|10|18Ü|02|16ÜÜÜÜÜÜİ° |04Ü|12|20° |04|16ÜÛÜ|12±  |02°|00|18²|16 |04ßşÜ |02ßß|10|18');
Pipeln('°°|00°|02|16²|00|18°|02|16²|00|18°°|02|16²°  |04Ş|12|23Û|16Û±  |04Üß|02° °|00|18²|02|16±|00|18²|02'+
       '|16±|00|18±|02|16±°|12ÜÜ²|20±°|16° |04ß |02Ü|00|18° |02|16ßŞİ');
Pipe('ßşÜŞÜÜ|10|18°|02|16Ûßß|00|18°|02|16ÜÜ|00|18°|02|16² |12|20°²°°°|14°|04|16² |02°|00|18°|02|16²|00|18²');
Pipeln('|16  |04Ş|12|20ŞÜ|16ÜÜ|04Ü |02ßßßßß|10|18°|16 |04ßÜ |12|20Ş|23Û|20İ|16°|04Ş|12±  |02°|00|18²|02|16±±'+
       '|00|18°|02|16²|00|18°|02|16²Ü  |04Ü|12° ²  |10°|18ß|02|16ß °|10|18°|02|16ß');
Pipe(' °Ş|10|18°|16±|02ßİ   ° ß|10|18°|02|16± |04Û|12|20Û²²±°|00°|04|16° |02ß|10|18°|00°|02|16Ü |04ß|12|20ßÛÛ');
Pipeln('ÛÛÛÛÜ|16Ü|20Ü|16Ü|04ÜÄ Ş|07|20°|12Ş|23²|14|20°|12|16²|04Û|12° |02°±|00|18°|02|16²|00|18°|10°°°°|02'+
       '|16Û± |12|20°|04|16ÜÜ|15|20°|04|16Ü |00|18°|02|16İ Ü|00|18°|10±|02|16Ü');
Pipeln('°|00|18°|02|16İŞÜ  °  |04Ü   |02° |04Û|12|20ÛÛ|19²|20²±°|16°° |02Ü|10|18°°|02|16± |04Ş|12'+
       '|20Ş|23²|20ÛÛÛÛÛÛ²|16± |04Ü ß |12|20Ş²²°|04|16Û± |00|18°|02|16²|10|18°°°|16±|04Ü |02ßßß '+
       '|12|20°ÛÜ|04|16Ü |02Ü|10|18Ü|16 |02°Ûßİ');
Pipeln('Ü|18 |10°°±|02|16Ü °    |04ßÜ  Û|12|20ŞÛÛ|22²|20²|16± |02Ü|10|18Üİ|02|16ß |04ÜÄÜ|12|20ÜÛÛÛ'+
       'ÛÛÛß|04|16ßÜÄÄÄÄÄÛ|12|20°°|04|16ÛÛ|00|20±|16 |02Ş|10|18°±±±|16ÜÜÜİ|04ßÜ |12|20°Û|23Û|20±|04'+
       '|16± |10|18°|16 |00|18°|02|16İ  °');
Pipe(' Şßß|10|18°|02|16ßÛ|00|18°|02|16ÜÜÜ°|00|18²|04|16Ş|12|20ÜÜÜÜÛÛÛ²|16°|02Ş|10|18Ş|23²|16Ü |04ß|12');
Pipeln('|20ßÜÛÛÛÛÛ|16²|20ß|04|16ß |02°|04Şİ |02Ş|10|18°|16±|04ŞÛ|20 |12° |00°|12|16° |10|18±²²²|23ÛÛ'+
       '|18Û|16± |04ŞÛ|12|20°|16Û|23²|20ß|04|16ß |02ßÛ|10|18°|02|16ß °±');
Pipeln(' ßß|10|18ß|02|16ß  °   |04ÄÜß  Û|12|20Ûß|23Û|20ß|04|16ß |02ß|10ß|18ßÛ|02|16İ|00|20±|12ŞÛÛÛÛÛß'+
       '|04|16ß  |02Ü² |04ßÜ |02ß²Ü|04ß|12|20°²°°|16± |10²|23²|18ÛÛß|16ß|02ß |04Üß |00|20±|12|16Û|20ß'+
       '|16ßß|04ß |02Ûİ°Ş|00|18°|02|16²');
Pipeln(' Ü²ß|10|18°|02|16ÜÜÜİ |04Ü|12|20Ü|04|16ÜÜÜ|12Ü|20ÜÛÛÛÛÛÛÜ|16ÜÜÜÜÜ|20ÜÛßÛÜİ|04|16İ |02ßß|10ß|02'+
       'ß °° |04ßş Ü|12Ü|20Û²²|16²Ü |10ß|02ß |04ÜÜ|23²|16ß|12|20ß|04|16ßßß |02Üİß|10|18ß|02|16ß|18 |16Ü'+
       '|00|18°|02|16Û|10±|18°|16');
Pipeln('|02Ş|10|18°|16±    |04ÄÜß ß                  Ş|12|20Şß|16ßß|04ßßß ß |02°|00|18°|10|16±|18²ÛÜ'+
       '|16ÜÜÜ|02Ü |12ßÛİ |04ßßßß |02Ü|10ÜÜÜ|18İ|02|16Ü|10|18Ü°  |02|16ßßßßßß|10Ş|18²|16');
Pipeln('|02ß|10|18°|02|16ÜÜ ° |04Şİ |15Exchange Protoplasm |04ß   |02ß|10ßßßßßßßßßßßßßßßß|02ß|08'+
       'ß |12ß |02ß|10ßßßßßß    |02ß ßßß²ÜÜ   |10ß');
Pipeln('|02°  ßß|00|18°|02|16Ü |04ßÜ                                                              |02°  ßÜ °');
Pipeln('|00|18°|02|16°|00|18²|16 |02ßßß|10|18°|02|16Ü  |04ß  |151|08] |07Poster Of Jezebel  |101PP     '+
       '|154|08] |07Extra Mutation  |102PP Each     |02ŞÛ|00|18°|16');
Pipeln('|10|18°|00°|02|16²°|00|18²|16  |02Ş²     |152|08] |07Extra Charm    |101PP Each    |155|08'+
       '] |07Change Name  |103PP            |02Üß °');
Pipeln('°     Üß      |153|08] |07Extra Battles  |101PP Each    |156|08] |07Extra Attacks    |101PP Each |02ß');
Pipe('|14Your Choice|15: |02');
end;


procedure intro;
begin
SCLRSCR;
Pipeln('|16                                         |15ß|23±°|16           ß|23±°|16');
Pipeln(' |13|21ßßßßßßßßßßßßß|16ßßßßßßß|21ßßßßßßßßßßßßßßßßßßßß|16 |15|23°|07|16Û |13|21ßßßßßßßßßß|16 |15'+
       '|23°|07|16Û |13|21ßßßßßßßßßßßßßßßßßßßß|16');
Pipeln(' |21            |16 |15Ü|07ßß|15|23°±|07|16ß|15Ü |21                   |16 |07Û|08|23°|16 |21 '+
       '         |16 |07Û|08|23°|16 |21                    |16');
Pipeln(' |21            |00ßßß|16 |15|23±°|16 |00|21ß|16  |15ÜÜÜ  ÜÜÜÜÜ |00|21Ü|16 |15ÜÜÜ |00|21Ü|16 '+
       '|08|23°|07|16ÛÜÜ |00|21ÜÜ|16 |15ÜÜÜ |00|21Ü|16 |08|23°|07|16Û |21   |15Version          |16');
Pipeln(' |21               |16 |23°±|16  |07Ü|15|23°±|16 |23±°|16 |23°|07|16ßÜ|15|23°|07|16ß Ü|15|23°±'+
       '|16 |23±°|16  |08|23±°|16 |23±°|16 |07Ü|15|23°±|16 |23±°|16  |08|23±°|16 |21      |151.3           |16');
Pipeln(' |21           |00ÜÜÜ |16 |15|23±°|16  |07²± ßßß Ü²ß Ü ²± ßßß  |08|23²±|16 |23²±|16 |07²± '+
       'ßßß  |08|23²±|07|16Ü |00|21Ü                  |16');
Pipeln(' |21           |16 |08ß|07ÜÜÜ|08|23²|16ß |00|21ß|16 |08ß|07±ÜÜß |08|23Ü|07|16ÜÜ±|08|23°|16'+
       '  ß|07±ÜÜß |08Ü|23±°|07|16Ü±|08ß  ß|07±ÜÜß |00|21ß|16 |08ß|23²±|07|16Ü |21                 |16');
Pipeln(' |21            |00ßßßßßß   ßßßßßßßßßßßß ßßßßßßßßßßßß  ßßßßß   ßßßßß                 |16');
Pipeln(' |08ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛßßßßßßßßßßßßßßßßßßßßßßßßÛ');
Pipeln('  |13C''om! Lets go Man!     |15ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ |08Û |05CopyLEFT  |08(|07'+
       'c|08) |131996/7/8 |08Û');
Pipeln('       |13Ouch! I Lost!     |15Û|07ÛßßßßßßßßßßßßßßßßßßßßİÛÛÛ|15Û |08Û |05The Z-Soft '+
       'Team|15:       |08Û');
Pipeln('  |13How do I restore?!?!?! |15Û|07Û  |14BBS Fatal Error!  |07İÛ|08|23ß|07|16Û|15Û |08'+
       'Û   |15Brian J. Schulteis   |08Û');
Pipeln(' |13Uh Oh there goes my     |15Û|07Û  |11Memory Overflow!  |07İÛÛÛ|15Û |08Û   |15& Ja'+
       'son Kessler      |08Û');
Pipeln('                  |13drive! |15Û|07Û  |12Illegal Access!!  |07İÛ|00|23o|07|16Û|15Û '+
       '|08Û |14SCHULTEIS@USA.NET      |08Û');
Pipe(' |13Try this one!?!?!       |15Û|07Û |02A>|07Scan C:');
Set_Foreground(23);
sWrite('_');
Pipeln('|07         İÛ|00|23o|07|16Û|15Û '+
       '|08Û |14home.onestop.net/zodian|08Û');
Pipeln('          |13Nooooooooo!!!  |15Û|07ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜİÛ|23 |16Û|15Û |08ßßßßßßßßßßßßßßßßßßßßßßßßßß');
Pipeln('|13Geez.. Don''t make        |15ßß|23ßß|16ßßßßßßßßßßßßßßßßßßß|23ßß|16ßß');
Pipeln('   |13a big fit!     |15ÛÛÛÛÛÛÛÛÛÛÛÛÛÛßßßßßßßßßßßßßßßßßßßßßßßßßßÛ');
Pipeln('  |13Ouch! I Lost!   |15ÛÛ|23  |05IBM  |15|16ÛÛÛÛÛ  |12Ü            |07³Í|12/|07Í[|15--|07]ÍÍÍ|15Û');
Pipeln('|13Bwahahahahaha!    |15ÛÛÛÛÛÛÛÛÛÛÛÛÛÛ|07ÄÄÄÄÄ|15ÄÄÄÄ|07ÄÄÄÄÄÄ|15Å|07ÄÄÄ|15ÄÄÄÄÄÄÄÛ');
Pipeln('  |13I have you now! |15Ûİİİİİİİİİİ|00|23Ş|15|16ÛÛ  |12Ü            |07³ |12ù |07ÍÍÍÍ ş |15Û');
Pipeln(' |13What''s a GPF?    |15ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ');
  pipeln ('|11                                  |15F|13RE|05EWA|13RE!|15!');
end;

function startstop: boolean;
begin
  startstop := false;
  abort := false;
  ch := chr (0);
  chn := 0;
  if skeypressed then
  begin
    sREAD_char (ch);
    chn := ord (ch);
  end;
  if ( (chn = 83) or (chn = 115) ) then
    abort := true
  else
    if (chn = 80) or (chn = 112) or (linecount = 22) then
    begin
      startstop := true;
      stop;
      set_foreground (15);
      chn := ord (ch);
      if ( (chn = 83) or (chn = 115) ) then abort := true;
      linecount := 0;
    end;
end;

procedure ShowF(filnam: linestring);
var
  temp: string [255];
begin
  assign (textfile, filnam);
  reset (textfile);
  readln(Textfile,Temp);
  sCLRSCR;
  repeat
    repeat
      readln (textfile, temp);
      pipeln (temp);
      linecount := succ (linecount);
    until eof (textfile) or startstop or abort;
  until eof (textfile) or abort;
  close (textfile);
  linecount := 0;
end;

procedure Spinner(X,y,f,num:byte);
begin
  sgoto_xy(X,y);
  set_foreground(f);
  case num of
    1: swrite('ú');
    2: swrite('ù');
    3: swrite('*');
    4: swrite('');
    5: swrite('*');
    6: swrite('ù');
  end;
end;

procedure Choose1;
begin
SCLRSCR;
Pipeln('|13|21ß|05|16ß|08ß|05ß|08ßß ß  ß');
Pipeln('|21ß|16 |13|21ß|05|16ß |08w|05e|13lcome .|05.|08.');
Pipeln('Û    J|05e|13zebel |08V|05e|13rsion |081|05.|132');
Pipeln('|08Ü    T|05h|13e |08Z|05o|13dian |08S|05o|13ftware |08T|05e|13am');
CRLF(1);
Pipeln('|08ß');
Pipeln('     |13ÚÄ|05Ä|13Ä|05ÄÄ|08Ä|05Ä|08ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');
Pipeln('     |05³ |08Ş|21 |15Choose A Name for yourself: |08|16İ ³');
Pipeln('     Ã|05Ä|08ÄÄ|05Ä|08ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ|05Ä|08Ä´');
Pipeln('     ³ .|05:|13]                         [|05:|08. |05³');
Pipeln('     |08ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ|05Ä|08Ä|05ÄÄ|13Ä|05Ä|13Ù');
end;

Procedure TellDead;
begin
SCLRSCR;
Pipeln('|14|16A|04n|09s|15i |02by:        |08°°|02°|07°°°°|02°|07°°°°°°°°°°°°°°°|02°|07°°°°|02°'+
       '|07°|02°|07°');
Pipeln('|02Phalacy       |08°°°|07°°|02°|07°|08²±±|02°|08±±±±±±±±±±±±±±±|02°|08±±±±|02°|07°|02°|07°°');
Pipeln('             |08°°°|07°°|02°|07°|08²±±±±|02°|08±±±|02°|08±±±±±±±±±±±|02°|08±±±|02°|08±'+
       '|07°|02°°|07°°');
Pipeln('            |08°°°|07°°°|02°|07°|08²±±|04±|02°|04±±±|08±±|02°|04±±±±±±±|08±±|04±|02°|04'+
       '±±|08±±|02°|08±±|07°|02°|07°°°');
Pipeln('           |08°°°|07°°|02°|07°|08²|02°|08±±±|02°|08±±±±|04±|08±|02°|08±±±|04±|08±±±±±'+
       '|02°|08±±±|04±|08±±|02°|08±|07°°|02°|07°°');
Pipeln('           |08°°°|07°|02°|07°°|08²±|02°|08±|02°|04±±±±±|08±|02°|08±±±±|04±|08±±±±|02°'+
       '|04±±±±|08±±±±|02°|07°|02°|07°°°');
Pipeln('           |08°°°|02°|07°°°|08²±±|02°|08±|04±|08±±|04±|02°°|08±±±±±|04±|08±±±±±|02°'+
       '|08±±±±±±|02°|08±|07°°|02°|07°°');
Pipeln('           |08°°°|07°|02°|07°°|02°|08±|02°|08±±|04±|08±±|02°|04±|08±±±±±±|04±|08±±±±±|04'+
       '±|02°|08±±±±|02°|08±±|07°°|02°|07°°');
Pipeln('           |08°°°|02°|07°°|02°|08²±±|02°|08±|04±|08±|02°|08±±|04±|08±±|04±±±±±±±|08±±|04'+
       '±|02°|08±±±±±|02°|08±|07°°°|02°|07°');
Pipeln('           |08°°|02°|07°°|02°|07°|08²±±±|02°|08±±±|02°|08±±±±±±±±±±±±±±±|02°|08±±±±|02°°'+
       '|07°°°°|02°');
Pipeln('           |08°|02°|08°|07°°°|02°|08²±±±±|02°|08±±|02°|08±±±±±±±±±±±±±±±±|02°|08±±|02°|08'+
       '±±|02°|07°°|02°|07°');
Pipeln('           |08°°|02°|07°°°°|02°|08±±±±±|02°°|08±±±±±±±±±±±±±±±±±±|02°°|08±±±|07°|02°°|07°°');
Pipeln('           |08°°°|02°|07°°°|02°|08±±±±±±|02°|08±±±±±±±±±±±±±±±±±±±±±±±|07°|02°|07°°|02°');
Pipeln('           |08°°°|07°|02°|07°|02°|08²±±±±±±±|02°|08±±±±±±±±±±±|02°|08±±±±±±±±±±|07°°|02°°|07°');
Pipeln('           |08°°°|07°°|02°|07°|02°|08±±±|02±|08±±±±|02°²|08±±±±±|02Û|08±|02°|08±±|02°°|08'+
       '±±±±|02±|08±±±|07°°|02°°|07°');
Pipeln('           |08°°°|02°|07°°|02°°Û|07°°|02°Û|07°°|02°|07°|02°°Û|07°°°|02°|07°|02°|07°°|02°Û'+
       '|07°°|02°|07°°°|02Û|07°°|02°|07°|02°|07°');
Pipeln('  |02şßİ°ßÛŞß|08°|02±±²|07°|02°Û|07°|02²|07°|02±°|07°°|02°|07°|02Û°°|07°|02°|07°|02Û°Û±²'+
       '|07°|02±²°|07°°|02Û|07°°°°|02Û|07°°°|02°ßŞ°Û°ßİÛş Ûİ°');
Pipeln(' ß²İŞ²ßßŞŞ°ßŞ°İÛ°ßŞÜİ±İ°Ü±ÛŞ°Üİ²ÛŞİÜ±ß°ÜİŞ²ß°ŞÜİ²Ş°±²ß°Ü±²ß°°Û °ßİŞÛ');
crlf(1);
Pipeln('                           |12YOU ARE DEAD!!');
crlf(1);
pipeln('|07Thanks for playing, but you''ll have to try again tommorrow!');
pipeln('|15Remember, Jezebel hates quitters, try again tommorrow!');
stop;
end;

Procedure Laugh;
var
  laughfile:text;
  laughat:string;
  laughnum:integer;
  rnd1:integer;
begin
if size=originalsize then begin
pipeln('|04You just don''t seem to find anything funny.');
stop;
exit;
end;
assign(laughfile,'LAUGH.DAT');
reset(laughfile);
readln(laughfile,laughnum);
rnd1:=random(laughnum)+1;
for laughnum:=1 to rnd1 do
readln(laughfile,laughat);
close(laughfile);
sclrscr;
Pipeln('|15Your Joke is|07:');
pipeln('|13'+laughat);
crlf(1);
Pipeln('|15Bwahahahahahahhaha|07!! |15Laughter is the best medicine|07!');
size:=originalsize;
Pipeln('|05You are now back to |13'+litos(size)+'|05 bytes.');
stop;
end;


Procedure Choose2;
begin
SGOTO_XY(41,11);
Pipeln('|05ÄÄ|08Ä|05Ä|08ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');
SGOTO_XY(37,12);
Pipeln('|05³ |08Ş|21 |15What kind of Virus Are You?      |08|16İ ³');
SGOTO_XY(37,13);
Pipeln('Ã|05Ä|08ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ|05Ä|08Ä|05Ä|08ÄÄ´');
SGOTO_XY(37,14);
Pipeln('³ |13M|05] |14Male Virus |08- |07Impress Jezebel      |08³');
SGOTO_XY(37,15);
Pipeln('³ |13F|05] |14Female Virus |08- |07Impress Brian      |08³');
SGOTO_XY(37,16);
Pipeln('³                                      ³');
SGOTO_XY(37,17);
Pipeln('³ .|05:|13]   [|05:|08.                            |05³');
SGOTO_XY(37,18);
Pipe('|08ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ|05Ä|08Ä|05ÄÄ|13Ä|05Ä|13Ù');
end;


procedure mailtop (titl: string; from: string);
begin
  sCLRSCR;
  PIPELN ('  |07Ú|08Ä |05Title|15: |13' + SPACES (TITL, 30) + '               |07-                  |08Ä¿');
  PIPE ('|08  ÀÄ|07Ä |05From|15: |13' + SPACES (FROM, 20) + '       |05To|15: |13' + SPACES (virusname,
  20) );
  pipeln ('    |07ú |08ù|07ù |08ÄÄ|07Ä|08ÄÄÙ');
  CRLF(1);
  PIPE (' |05msg |131   |05of |131 |07Ä |08Ä  Ä|07Ä '
  +'|08ÄÄ|07Ä|08ÄÄÄÄÄÄÄÄÄ|07ÄÄ|08');
  pipeln ('ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ|07Ä|08ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ');
  CRLF(1);
end;

Procedure TopHalf(SIDE2:BOOLEAN);
begin
IF SIDE2 then SGOTO_XY(41,1);
Pipeln('|05|16Ú--ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ--Ä¿');
IF SIDE2 then SGOTO_XY(41,2);
Pipeln('³ |13|21İ |08ú|07ú|15ú        top virii        ú|07ú|08ú |13|16İ |05³');
IF SIDE2 then SGOTO_XY(41,3);
Pipeln('Ã--ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ--Ä´');
IF SIDE2 then SGOTO_XY(41,4);
Pipeln('³ |15|23Ûßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß|08Ü|16 |05³');
end;

Procedure Middle(INSRT:String; LIN:Byte; SIDE2:BOOLEAN);
begin
IF SIDE2 then SGOTO_XY(41,LIN+4);
Pipeln('³ |15Û|23 '+INSRT+'  |08|16Û |05³');
end;

Procedure BottomHalf(SIDE2:BOOLEAN;NOTALLWAY:BOOLEAN;DONTO:BYTE);
begin
IF (SIDE2) and (NOT NOTALLWAY) then SGOTO_XY(41,21) else
IF SIDE2 then SGOTO_XY(41,DONTO);
Pipeln('³ |15|23ß|08ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ|16Û |05³');
IF (SIDE2) and (NOT NOTALLWAY) then SGOTO_XY(41,22) else
if SIDE2 then SGOTO_XY(41,DONTO+1);
{If (NOT SIDE2) and (NOTALLWAY) then SGOTO_XY(1,22);}
Pipeln('À--ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ--ÄÙ');
end;

Procedure ShowSewer;
begin
sclrscr;
pipeln('|08|16ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß');
Pipeln('|10ÖÄÒÄ¿ Ò  Â ÒÄÄ¿   ÖÄÄÄÄÄ¿ ÒÄÄÄÄÄ¿ Ò  Ò  Â ÒÄÄÄÄÄ¿ ÒÄÄÄÄÄ¿ ÖÄÄÄÄÄ¿  |02Where else');
Pipeln('  |10º   ÇÄÄ´ ÇÄ     º       º       º  º  ³ º       º     ³ º        |02can a Virus');
Pipeln('  |10Ğ   Ğ  Á ĞÄÄÙ   ÓÄÄÄÄÄ¿ ÇÄÄ     º  º  ³ ÇÄÄ     ÇÄÄÄÂÄÙ ÓÄÄÄÄÄ¿  |02grow?');
Pipeln('                        |10³ º       º  º  ³ º       º   ³         ³');
Pipeln('                  ÓÄÄÄÄÄÙ ĞÄÄÄÄÄÙ ÓÄÄĞÄÄÙ ĞÄÄÄÄÄÙ Ğ   ÁÄ  ÓÄÄÄÄÄÙ');
Pipeln('|08ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß');
Pipeln('|10|18°|02|16ÛÛ²|10|18²|02|16ß|10|18°|02|16ßÛ|10|18°|02|16²|10|18°|02|16ÛÛß²|10|18²±°|02|16Û|10|18°|02|16'+
       '²ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß²|10|18°±²|02|16²Û|10|18²|02|16ß|10|18²Û²²|02|16Ûß²Û|10|18°°|02|16Û|10|18°°±');
Pipeln('²°|02|16Ş |10|18±|16 |02Ü  |10|18°|16  |02²  Şİ ²|10|18²|02|16ß  |14As you enter the sewer, you can    |02'+
       'ß |10|18±|16  |02²  |10|18²|16  |18±|16  |02Û |10|18°|02|16ßß|10|18°|02|16Ş|10|18');
Pipeln('±|02|16²  ²    ²  ±   İ  ² |14hear oozing from other Virii growing.  |10|18°|16  |02±  |10|18±|16  |02Ü  İ ²  Ü');
Pipeln('|10|18°|02|16Ü  ±    ±  °      Ü |15ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ |02Ü  °  |18²|16       ±    ');
Pipeln('|10|18°|16   |02°    °  |13A|08] |13A|05t|07tempt Growth           |13M|08] |13M|05a|07ke '+
       'Announcement      |02²       °   ß');
Pipeln('  °         |13C|08] |13C|05o|07nverse w/ Slime        |13S|08] |13S|05p|07y on other Virii          |02°');
Pipeln('  ±    °    |13D|08] |13D|05a|07ily News               |13T|08] |13T|05r|07ansfer Protopla'+
       'sm         |02±      °');
Pipeln('  ² ß  ±    |13E|08] |13E|05x|07change Protoplasm      |13V|08] |13V|05i|07ew your Stats             |02²      ±');
if upcase(sex)='M' then
Pipeln('            |13F|08] |13F|05l|07irt w/ Jezebel         |13R|08] |13R|05e|07turn to Surface')
else
Pipeln('            |13F|08] |13F|05l|07irt w/ Brian           |13R|08] |13R|05e|07turn to Surface');
Pipeln('|02ş ²  Ü                                                                ß  ² ß ş°');
Pipeln(' ßÜş   ÜÜÜÜ  Ü                                                        şß Ûş');
Pipeln('|08ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß');
Pipeln('|02Ü|10|18±|16ßş |02[|10Sewers|02]');
Pipe(' ßş : |10');
end;


Procedure ShowMain;
begin
SCLRSCR;
Pipeln('|16                            |13Ü|21  |05|16Ü|08ßÛ|05ÜÜ|08ßÛÜ|05Ü            |13Ü|21  '+
       '|05|16Ü  |13Ü|21  |05|16Üú |13Ü|05ÛÛÜßÛÛÛÜÜ   .');
Pipeln('|16                          |05.ŞÛÛÛÛİ|08Û|21İ  |13|16Ü|08ß|21İ  |13|16Ü |05.  ù  Ü|21  '+
       '   |16İŞÛ|21  |16Û|13İ|05ŞÛÛÛÛİ  ßÛÛÛ|13Ü');
Pipeln('                            |05ßÛÛÛ|13İ |08ß|21   |05|16İŞ|21   |16İ      ÜÜß|21   |13'+
       '|16İ |05ßÛÛß  ßÛÛÛ|13İ    |05ÛÛÛİ');
Pipeln('      |13|21Û|16ßßß|05ß|13ß|05ßß|08ß|05ßß|08ß  ß|05ß|08ß  ß   |05ŞÛÛÛ úŞÛÛÛ ÛÛÛ|13Û    '+
       '|05Ü|21  |16Ûİ|21    |16   |08ÜÜÛ  |05ŞÛÛÛ ø  ŞÛÛÛ ');
Pipeln('      |13|21²|16  |05ÚÄÄ|13Ä|05Ä|13ÄÄÄÄÄÄÄÄÄÄ¿    |05ÛÛÛÛ  ŞÛÛÛ|13İ|05ŞÛÛÛİ |13Ü|21    |05'+
       '|16ß |21    |16  |08|21Ûß  |16 |05øÛÛÛÛ    ŞÛÛÛ|13İ');
Pipeln('      |21±|16  |05³ |15Jezebel Main |13³    |05ÛÛÛÛ  ÛÛÛÛİÛÛÛÛİŞÛÛ|21 |16ßÜ|08|21ß|05|16İ'+
       '|21    |16  |21    |16  ÛÛÛÛ    ÛÛÛÛİ');
Pipeln('      |13|21±|16  |05ÀÄ|13Ä|05Ä|13ÄÄÄÄÄÄÄÄÄÄÄÙ    |05ŞÛÛÛ  ÛÛÛÛ ÛÛÛÛ ÛÛÛİß|21  |16ßŞ|21  '+
       ' |16  Ş|21   |16  ÛÛÛÛ    ÛÛÛÛ  ');
Pipeln('      |13|21°|16                    |05ú ŞÛÛİ  ŞÛÛİ ŞÛÛİ ŞÛÛİ   úŞÛÛİ  ŞÛÛ|13İ  |05ŞÛÛİú '+
       '  ŞÛÛİ');
Pipeln('      |13|21°|16                       |05ßß    ßß   ßß   ßß      ßß ø  ßß    ßß      ßß °');
Pipeln('      |13|21°|16                                     |05ú                    .           °');
Pipeln('      |21 |16     ú|14?|05ú|15Help                                                          |05±');
Pipeln('      |21 |16     ú|14W|05ú|15rite |07M|15ail                               |07S|13tats'+
       '|07:                |05²');
Pipeln('      |21 |16     ú|14L|05ú|15ist |07K|15nown |07V|15irii                         |13|21Û|16ßßß'+
       '|05ß|13ß|05ßß|13ß|05ß|13ß|05ßß|13ß|05ß|13ß|05ßß|13ßßÛ |21°|16');
Pipeln('      |05²     ú|14B|05ú|15attles                                  |13|21²|16 |07Y|13our '+
       '|07N|13ame|07:        |13Û |21±|16');
Pipeln('      |05²     ú|14A|05ú|15ttack |07V|15irii                             |13|21±|16 |07'+
       SPACES(VIRUSNAME,17)+' |13Û |21±|16');
Pipeln('      |05²     ú|14V|05ú|15iew |07S|15tats                               |13|21±|16 |07S'+
       '|13ize|07:             |13|21Û|16 |21²|16');
Pipeln('      |05±     ú|14S|05ú|15ewers                                   |13|21°|16 |07'+
       SPACES(LITOS(SIZE)+' |15Bytes',17)+' |13|21Û|16 |21Û|16');
Pipeln('      |05°                                                |13Û |07B|13attl'+
       'es |07L|13eft|07:     |13|21Û|16 |21Û|16');
Pipeln('      |05°     ú|14Q|05ú|15uit |07G|15ame                                |13Û |07'+
       SPACES(LITOS(battles),17)+'|13 Û |21Û|16');
Pipeln('      |05ÚÄÄ|13Ä|05Ä|13ÄÄÄÄÄÄÄÄÄÄ¿                                 Û|05ÜÜ|13Ü|05Ü|13ÜÜ|05'+
       'Ü|13Ü|05Ü|13ÜÜ|05ÜÜ|13Ü|05Ü|13ÜÜÜÜ|21Û|16 Û');
Pipeln('      |05³ |15C|07hoice|08: |05< >  |13³                                   |08Ü  Ü|05Ü|08'+
       'Ü  Ü|05ÜÜ|08Ü|05ÜÜ|13Ü|05Ü|13ÜÜÜÜ|21Û|16');
Pipe('      |05ÀÄ|13Ä|05Ä|13ÄÄÄÄÄÄÄÄÄÄÄÙ');SGoto_xy(18,21); set_foreground(13);
end;

procedure stats;
begin
SCLRSCR;
Pipeln('|16     |13ÚÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂÂ¿');
Pipeln('     Ã|05ÅÅÅÅÅÅÅÅÅÅÅ|15ÜÛÛÛÛÛÜ|05Å|15ÛÛÛÛÛÛÛ|05Å|15ÜÛÛÛÛÛÜ|05Å|15ÛÛÛÛÛÛÛ|05Å|15ÜÛÛÛÛÛÜ|05ÅÅÅÅÅÅÅÅÅÅÅÅÅ|13´');
Pipeln('     Ã|05ÅÅÅÅÅÅÅÅÅÅÅ|15ÛÛÜÜÜÜ|05ÅÅÅÅ|15ŞÛİ|05ÅÅÅ|15ÛÛÜÜÜÛÛ|05ÅÅÅ|15ŞÛİ|05ÅÅÅ|15ÛÛÜÜÜÜ|05ÅÅÅÅÅÅÅÅÅÅÅÅÅÅ|13´');
Pipeln('     Ã|05ÅÅÅÅÅÅÅÅÅÅÅÅ|15ßßßßÛÛ|05ÅÅÅ|15ŞÛİ|05ÅÅÅ|15ÛÛßßßÛÛ|05ÅÅÅ|15ŞÛİ|05ÅÅÅÅ|15ßßßßÛÛ|05ÅÅÅÅÅÅÅÅÅÅÅÅÅ|13´');
Pipeln('     Ã|05ÅÅÅÅÅÅÅÅÅÅÅ|15ßÛÛÛÛÛß|05ÅÅÅ|15ŞÛİ|05ÅÅÅ|15ÛÛ|05ÅÅÅ|15ÛÛ|05ÅÅÅ|15ŞÛİ|05ÅÅÅ|15ßÛÛÛÛÛß|05ÅÅÅÅÅÅÅÅÅÅÅÅÅ|13´');
Pipeln('     ÀÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÙ');
Pipeln('  |15B|13B|05S |15N|13a|05me|07: |14'+SPACES(Uplow(Userh),21)+
       '|15B|13a|05ttles |15L|13e|05ft|07: |14'+litos(Battles));
Pipeln('  |15V|13i|05rus |15N|13a|05me|07: |14'+Spaces(Virusname,19)+
       '|15S|13t|05ealth |15L|13e|05vel|07: |14'+litos(Stealth));
Pipeln('  |15S|13i|05ze|07: |14'+Spaces(litos(size),25)+
       '|15A|13t|05tacks|07: |14'+litos(attacks));
Pipeln('  |15F|13i|05les |15I|13n|05fected|07: |14'+Spaces(litos(FilesInfected),15)+
       '|15P|13r|05otoplasm |15P|13o|05ds|07: |14'+litos(proto));
Pipeln('  |15T|13e|05am |15#|07: |14'+SPACES(litos(team),4)+'                   '+
       '|15C|13h|05arm|07: |14'+litos(Charm));
Pipeln('  |15M|13u|05tation |15L|13e|05vel|07: |14'+litos(mutation));
stop;
end;

Procedure SeeBattle;
begin
SCLRSCR;
Pipeln('|16   |07ÜÜ|08ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ ÜÜÜÜÜÜÜÜÜÜÜÜ ÜÜÜÜÜÜÜÜ|07ÜÜ');
Pipeln(' |08Ü|23ß±Ü|16ÛÛÛÛÛÛ|23ÛÛÛÛ²ÛÛÛ²²|16ÜÛ|23²|16ÛÛ|23²|16Û|23²²|16ÛÛÛß ßÛ²ÛÛÛÛÛ|23Ü±ß|16Ü');
Pipeln('Ş|23İŞ|16ÛÛÛÛ|23Û|16ÛÛÛ|23ÛÛÛÛ²ÛÛÛ²²|16ÜÛ|23²|16ÛÛ|23²|16Û|23²²|16ÛÛÛß ßÛ²ÛÛÛÛÛÛÛ|23İŞ|16İ');
Pipeln('|23ÛŞ|16ÛÛÛ²ß |05You have |13'+SPACES(litos(battles),2)+
' |05Battles Left Today   |08ß²ÛÛÛ|23İ|16Û');
Pipeln('Û ßÛİ Ú|15ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿    |08ŞÛÛÛ²');
Pipeln('ÜßÜÛ  ³ |13S|08]|05can for files to infect!    |15³     |08|23²|16ß Û');
Pipeln('±²|23Û²|16  ³ |13L|08]|05augh (Good for your health) |15³     |08|23²|16ÛÜ²');
Pipeln('²|23ÛÛ²|16  ³ |13V|08]|05iew all your Stats          |15³     |08ÛÛ Û');
Pipeln('|23Û|16ß ß  ³ |13R|08]|05eturn to the main menu      |15³     |08Û ÛÜ');
Pipeln('ÛÛÜ²  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ|15Ù     |08|23²|16Û²²');
Pipeln('²Ü²±  Ú|15ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿               |08|23²|16ß Û');
Pipeln('±²Û²  ³ |15Y|07our |15C|07hoice|15: [ ]    ³               |08İ Û');
Pipeln('²|23Û|16Û|23²|16  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ|15Ù               |08|23²|16Ü Û');
Pipeln('|23ÛŞ|16ÛÛİ   |13You Have |07'+SPACES(litos(size),13)+
       '             |08ŞÛÛ|23İ|16Û');
Pipeln('Ş|23İŞ|16ÛÛÜÜ |13of |07'+SPACES(litos(originalsize)+' |13bytes',19)+
       '           |08ÜÜÛ|23ÛİŞ|16İ');
Pipeln(' ß|23Ü±ß|16Û|23ßÛ|16ÛÛÛ|23ÛÛÛÛ²ÛÛÛ²²|16ÜÛ|23²|16ÛÛ|23²|16Û|23²²|16ÛÛÛß ßÛ²ÛÛÛ|23ß|16Û|23ß±Ü|16ß');
SGOTO_XY(23,12);
end;


Procedure Infection;
var rand1,rand2:integer;
begin
 rand1:=random(10);
 if rand1=8 then begin
    crlf(1);
    Pipeln('|15'+k.virusname+'|07 attempts to purge you without success');
    exit;
                 end;
 if rand1=9 then begin
    crlf(1);
    Pipeln('|07You attempt to enhance the program with yourself, but make no progress.');
    exit;
                 end;
 if rand1<4 then begin
    crlf(1);
    Rand2:=random(k.size)+1;
    Pipeln('|15'+k.virusname+'|07 succesfully purges |15'+litos(rand2)+'|07 bytes of you.');
    size:=size-rand2;
    if size<1 then begin
      if mutation>0 then begin
                         mut:=mutation;
                         if random(100 div mut)+1 = 1 then begin
                                 pipeln('`!M`$U`#T`@A`0T`9I`!O`$N|15!');stop;
                                 size:=originalsize;
                                 dec(mutation);
                                 addnews('|15®|12®|04® |15'+virusname+'|16 mutated today! |04¯|12¯|15¯');
                                 addnews('');
                                 exit;
                                                             end;
                         end;
      pipeln('|04Sorry..... You''ve been killed.. I guess he was too strong for you..');
      addnews('|15®|07®|08® |13'+virusname+' |05was killed while trying to enslave |13'+k.virusname+'|05 today.'+
              '|08¯|07¯|15¯');
      addnews('');
      dead:=true;
      makeevent(k.virusname,'Jezebel','Victory!','You killed '+virusname+' in self defense today, congratulations!');
      k.originalsize:=k.originalsize+(originalsize div 10);
      k.size:=k.size+(originalsize div 10);
      inc(filesinfected);
      originalsize:=originalsize-(originalsize div 10);
      k.size:=k.originalsize;
      reset(scorefile);
      seek(scorefile,spynum);
      write(scorefile,k);
      close(scorefile);
      stop;
                   end;
    exit;
                 end;
 if rand1<8 then begin
    crlf(1);
    Rand2:=random(size)+1;
    Pipeln('|07You successfully enhance |15'+litos(rand2)+'|07 bytes of |15'+k.virusname+'|07.');
    k.size:=k.size-rand2;
    if k.size<1 then begin
      if k.mutation>0 then begin
                         mut:=k.mutation;
                         if random(100 div mut)+1 = 1 then begin
                                 pipeln('`!M`$U`#T`@A`0T`9I`!O`$N|15!');stop;
                                 k.size:=k.originalsize;
                                 dec(k.mutation);
                                 exit;
                                                             end;
                         end;

      pipeln('|13CONGRATULATIONS! You overwhelmed it!');
      addnews('|15'+k.virusname+'|07 became |15'+virusname+'|07''s slave today!');
      addnews('');
      makeevent(k.virusname,'Jezebel','Defeat!','You were enslaved by '+virusname+' for a day.');
      originalsize:=originalsize+(k.originalsize div 10);
      size:=size+(k.originalsize div 10);
      inc(filesinfected);
      k.originalsize:=k.originalsize-(k.originalsize div 10);
      k.size:=k.originalsize;
      k.dead:=true;
      reset(scorefile);
      seek(scorefile,spynum);
      write(scorefile,k);
      close(scorefile);
      stop;
    exit;
                            end;
                 end;
end;

Procedure JezPoster;
begin
if proto<1 then begin SCLRSCR; Pipeln('|04You need at least one protoplasm pod|15!');
stop; exit; end;
dec(proto);
SCLRSCR;
Pipeln('|06|23°°°°°°°°°|07|16ßßßÜÜ|06|23°±±°°±±°°|07|16ß|04Ü|12|20²±°°|04|16ÛÜÜ|06ß|23±²|16 |04Û|12'+
       '|20°±±²|16Û |06Û|23±°±°±°°|07|16ÛÛÛÛÛ|08|23°°°°°°±±²±±°°|07|16ÜÜ|15Jezebel!');
Pipeln('|07Û|06|23°°|07|16ßßßÜÜÜ|06|23±°°±²²|16ßßßß|23²²|16ß|04ÜÛ|12|20²±|04|16ÜÜßß|12|20°|04|16Û'+
       '|12|20°|04|16Ü ßÜÜßß|12|20±²|16İ|06Ş|23²²²|04|16ÜÜ Ü  ÜÜÜÜÜÜÜÜ|08ßßß|23²²²±±°°°°|07|16ÛÛÛÛÛÜ');
Pipeln('ÜÜ|06|23°°°|07|16Û|06|23°±±²²|16ß|04Ü|12|20°|04|16Ü²ÛÛÛÜ ÛÛßßßßß|12|20° |04|16Ü ßÜşßÛÛ|12'+
       '|20²|16İ|06Ü|04ß|12|20±|16 |06ß |04Û|12|20°|04|16ßßÜßß|12|20°±|04|16ßßß|12|20±²²|04|16ßÛ|12'+
       '|20°|04|16ÜÜ |08ß|23²²±°|07|16Û|08|23°|07|16ÛÛÛÛÛ');
Pipeln('|06|23°|07|16Û|06|23°°°±±²|16ß|04ÜÜ|12|20²±|04|16ßßÜÜÜÛ Û  |12|20²²|16ßßş   |04ß|06ÜÜ|12|22'+
       '°°|04|16Ş|12|20°|04|16Ş|12|20²|16 |06İ|04ß|12|20°|16 |22°|06|16Ü|04ßÜ|12ßÜ|04ß|12|20°|04|16'+
       'ÜÜ|12ßßß |04ÜÜßÜÛÛßÛÜ |08ß|23²±±°|07|16ÛÛÛÛÛ');
Pipeln('|06|23°°|08°|07|16ßßß|04ÜÜßßÜÜ|12|20°|04|16Û|12|20°|04|16Û²Û Û ÜŞ|12|20±|16 |06ÜÜÜ|12|22'+
       '°°°±±±±±|16 |04ÛŞ|12|20±|16İ|22±|16Ü|04ßÜ|06ß|12|22±±|16Ü|04ßÜ|12ßßÜÜ|04ßßßß|12ÜÜÜ|04ßßÜßÜ'+
       '|12|20°|04|16Û |08ß|07ÜÜÜßßßÛÛ');
Pipeln('|08|23±°|07|16ß|04ÜÜ|12|20°|04|16ßÜ|12|20°|04|16ßßßÜßßßÜÜßÜÜßŞİ|12|22°°±±±±±±±±±±|04|16ŞÛ '+
       '|12|20±|16 |22²²²|16 |04ßÜ|12ß   |04ßßÜÜ|12ßßßßß|04ÜÜßßÜÛÛ|12|20°|04|16ŞÛ |07ÛÛÛÛÛÛÜÜ');
Pipeln('|08|23²|16 |04Û|12|20°°|04|16ÛßÜÜ|12|20°|04|16ßÜ ß²ßÜÜßß|06Ü|12|22°|06|16Ü|04ßÜ|06ß|12|22'+
       '±±±²²²²²²|16 |20°|04|16İß|12Ü|22²²|16ß  ÜÜ|04ß|12Ü|22²²²|16ß  |04ßß|12|20°|04|16ßß|12ÜÛ '+
       '|04ÛÛÛÛÛÜßÛ |07ÛÛÛÛÛÛÛ');
Pipeln('İ|04Û|12|20°°|04|16ßÜ|12|20°°|04|16ÛßÜÜßßßß |06Ü |12|22°±|06|16Ûßß ßß|12|22±²²²²²²|16ß|04'+
       'Üß|12Ü|22²²²|16 Ü|22²²|16ßßß    |15Ş|23²|16 |12|22²²²Û|16Û|22²²|16 |04ßÛÛÜß|12|20°|04|16Ü'+
       'ßÛ |07ßßÛÛÛÛ');
Pipeln('|12|20°°|04|16ÛßÜ|12|20°°|04|16ßÜÛ|12|20°|04|16ÛÛÛÛİ|12|22°°°±|16ÜÜÜÜÜÜÜ   ßß|22²²²|16Ü|22'+
       '²²²²|16Ü|22²²²|16  |02ÜÜ |15ß Ü|23²±|16 |12|22²²²²|16Û|22²±|16 İ|04ÛÛÛ|12|20±|04|16ÜßÛ|12'+
       '|20°|04|16Û  |07ÜÜßß');
Pipeln('|12|20°|04|16ÛßÜ|12|20°|04|16ÛßÜ|12|20°°|04|16ÛÛ²Û²ß|06Ş|12|22°±²²|16ßßßßßßßß|22²²|16ÜÜß'+
       '|22²²²²²|16ÛŞ|22²²|16İ|15ŞÜÜÜÜÛÛßß|12Ü|22²²²²²|16Û|22²±|16İ|20²|04|16Ş|12|20°|04|16Û|12'+
       '|20°±±|04|16ßÛŞİ |08|23±°°|07|16Û');
Pipeln('|04ÛßÜ|12|20°|04|16Û |12|20°° |04|16ÛÛßßÜÜÛ |12|22±±²|16 |15|23±|16Ü ş |02ÜÜ  |15Ü |12ÛÛ'+
       '|22²²|16ÛÛÛ|22²²²|16Û |15ßß|12ÜÜÜÜÜÛ|22²²Û²²²²|16İ|07Û|12ß|04Ü|12|20±|16 |04ÛÛÛ|12|20°°'+
       '|04|16Üß|12|20°|04|16İ |08|23²²°°|16');
Pipeln('|04Û |12|20°|04|16Û |12|20±°|04|16ÛÛß²ÛÛ|12|20°|04|16Ûß |12|22±²²²|16 |15|23±²|16ÜÜÜÜÜÛßß'+
       ' |12|22²|16ÛİÛÛÛ|22ÛÛ|16ÛÛ|22²²²Û|16ÛÛÛÛÛÛÛÛ|22Û²²±|16İ|07³|04ÛÛ|12|20°°|04|16Ş|12|20°|04'+
       '|16Û|12|20°|04|16İ|12|20°|16 |04Û|12|20°|16 |08Üß|23²²|16');
Pipeln(' |12|20±°|16 |20²±|04|16ÛÛ Û|20 |12°°|04|16ßÜßÜ|06ß|12|22²|16ÛŞ|22²|16ÜÜ|15ßßß|12ÜÜÜÛ|22'+
       '²²²|16ÛÛŞÛÛ|22²Û|16ÛÛÛÛÛÛÛÛÛÛÛÛÛÛ|22Û²²±|16İ|07³|04²ÛÛ|12|20°|04|16Ş|12|20°|04|16'+
       'ÛİÛ Û Û |08|23²²²|16Ü');
Pipeln('|12|20±°|04|16Û |12|20±°|04|16Û ²Û|12|20°±|16 |04Û |12|20±°|04|16İ|07Û |12Ş|22²²|16ÛÛÛÛÛ'+
       'ÛÛÛÛÛÛÛÛÛ|22Û|16ÛÛ|22²Û|16ÛÛÛÛÛÛÛÛÛÛÛÛÛ|22²²²±|16İ|07³ |04ÛÛ|12|20°|16 |04ÛÛÛ |12|20°|16 '+
       '|04Û  |08ßßß');
Pipeln('|12|20°|04|16Û |12|20²±|04|16ÛİÛÛÛ|12|20°|16 |20°|16 |20±°°|04|16İ|07³|04Ş|12Ş|22±²²|16ÛÛÛ'+
       'ÛÛÛÛÛÛÛÛÛ ÛÛßßÛÛÛÛÛÛÛÛÛÛÛÛÛÛ|22²²±±|16 |07³|10ÛÜ|04ßÛ ÛÛÛİÛÛ|12|20°|04|16ÛPmt!');
Pipeln('ÛÛ |12|20±°|04|16Û²ÛÛ|12|20°±|16 |04Û |12|20°°|04|16Ûİ|07³|04ŞÜ|06Ş|12|22±±²|16ÛÛÛÛÛÛÛÛÛÛİ '+
       'ÜÜÛÜÜÛÛÛÛÛÛÛÛÛÛÛÛ|22²²±|06|16ß|10ÜÜÛ|18²|16ßÜ|04ßÛŞÛ|12|20°°|16 |04Ûİ|12|20°|04|16İ');
Pipeln('Û |12|20±°|04|16ÛÛßÛÛÛ |12|20°|16 |20°|04|16ÛÛ|12|20°|04|16İ|07³|04Ş²Ü|06ß|12|22±±²²|16ÛÛÛÛ'+
       'ÛÛÛÛÛÛÛÛÛßßßßßßÛÛÛÛÛÛ|22Û²±±±|06|16İ  |10Ü|18±°|16 |04²ÛŞ|12|20°±±°|04|16ŞÛ Ûİ');
Pipeln('Û |12|20±|04|16ÛÛİÛÛÛ Û |12|20°°|04|16Ûß|10Ü |18²|16 Ü|04²Ü|06ß|12|22±±±²|16ÛÛÛÛÛßß|04ÜÜÜÜÜÛß'+
       'ß|12|20°°°|04|16Ü|12ßÛÛÛÛ|22²±±±|06|16ß|04Ü |10ß|04Ü|02ß|04ÜÛ|20 |12°|04|16Ş|12|20±²²|04'+
       '|16İİÛ|12|20°|04|16ÛÛ');
Pipeln('Û |12|20°|04|16Û² Û|12|20°|04|16Û |12|20°|16 |20°|04|16Ûß|10ÜÜ|18²²±|16ÜÜ|04ß²Ü|06ß|12|22±'+
       '±²²|16ÛÛÜ|04ß|12|20±|04|16ßß|15ÜÜÜÜßß|04ÜÜ|12|20°|16 ÛÛÛ|22²²±±|06|16ß|04Ü²Û Û ²İÛ|12|20°'+
       '|04|16İ|12|20°±²±|04|16İ|12|20°|04|16ŞÛÛÛİ');
Pipeln(' |12|20±°|04|16ÛÛ |12|20°°|04|16Û Û Û²Û |10Üß|18°|16ßÜ |04²ÛİÛ |06ß|12|22±±²²|16ÛÜß|20²|16Ü'+
       '|04ÜÜÜ|12Ü|20²²±|04|16ß|12ÜÛÛÛ|22²²±|06|16ß  |04²²ÛŞİÛÛŞ|20 |12°|16 |20±²±°|04|16Ş|12|20°'+
       '|04|16İÛÛÛ|12|20°|16');
Pipeln(' |20°|04|16ÛÛÛ |12|20°|04|16ÛÛ Û Û²²ÛÜÜ|02ß|04ÜÜÛ |12|20°|16 |20°|04|16İ|12|20²|16Ü|06ß|12'+
       '|22±±²²|16ÛÜ|04ßßßßßß|12ÜÜÛÛÛÛ|22²|16ÛßÜÛİ|04°±²ÛŞİ|12|20°|04|16ÛŞ|20 |12°|16 |04Û|12|20°°'+
       '|04|16ÛŞ|12|20°°|04|16ŞÛÛÛ|12|20°|16');
Pipeln('|20°°|04|16ÛÛ |12|20°|04|16ÛÛ Û²Û Û²²ÛÛÛÛ|12|20°|04|16² ²İ|12|20°|16 |20±|04|16± |06Üßß|12'+
       '|22±²²|16ÛÛÛÛÛÛÛÛÛÛÛÛßÜ|22²|16ÛÛİ |04°² Û ÛİÛ|12|20°|04|16İÛÛÛ|12|20°|04|16İÛÛ|12|20°|04|16İÛÛ Û');
Pipeln('|12|20°|04|16Û²² |12|20°|04|16Û² ²İÛİÛÛ²²ÛÛ|12|20°|04|16Û²² İÛ ²± |06Ş|12|22°°|06|16ÜÜ|12ßß'+
       'ÛÛÛÛÛÛÛßßÜÜ|22²²|16ÛÛÛİ |04°± Û ²İÛ|12|20°|04|16İ|12|20°|04|16Û|20 |12°|04|16İÛÛ|12|20°°|04'+
       '|16Ş|12|20°|04|16Ûİ');
stop;
end;

Procedure ExchangePPP;

Procedure Mocharm;
Var BUYING:Byte;
begin
If proto<1 then begin SCLRSCR; Pipeln('|04You need at least one ProtoPlasm Pod|15!');
stop; exit; end;
SCLRSCR;
Pipeln('|05You have |13'+litos(proto)+'|05 protoplasm pods, and charm costs |131 PP|05 each|13.');
Pipe('|05How many would you like to buy|13? |15');
SREAD_Num_Byte(Buying);
if buying=0 then exit;
If Buying>proto then begin Pipeln('|04Read carefully, you don''t have that many!');
                           stop; exit; end;
proto:=proto-buying;
charm:=charm+buying;
Pipeln('|07You now have |15'+litos(charm)+' |07charm|15.');stop;
end;

Procedure MoBattles;
Var BUYING:Byte;
begin
If proto<1 then begin SCLRSCR; Pipeln('|04You need at least one ProtoPlasm Pod|15!');
stop; exit; end;
SCLRSCR;
Pipeln('|05You have |13'+litos(proto)+'|05 protoplasm pods, and extra battles are |131 PP|05 each|13.');
Pipe('|05How many would you like to buy|13? |15');
SREAD_Num_Byte(Buying);
if buying=0 then exit;
If Buying>proto then begin Pipeln('|04Read carefully, you don''t have that many!');
                           stop; exit; end;
proto:=proto-buying;
battles:=battles+buying;
Pipeln('|07You now have |15'+litos(battles)+'|07 battles left|15.'); stop;
end;

Procedure MoAttacks;
Var BUYING:Byte;
begin
If proto<1 then begin SCLRSCR; Pipeln('|04You need at least one ProtoPlasm Pod|15!');
stop; exit; end;
SCLRSCR;
Pipeln('|05You have |13'+litos(proto)+'|05 protoplasm pods, and extra attacks are |131 PP|05 each|13.');
Pipe('|05How many would you like to buy|13? |15');
SREAD_Num_Byte(Buying);
if buying=0 then exit;
If Buying>proto then begin Pipeln('|04Read carefully, you don''t have that many!');
                           stop; exit; end;
proto:=proto-buying;
attacks:=attacks+buying;
Pipeln('|07You now have |15'+litos(attacks)+'|07 attacks left|15.'); stop;
end;

Procedure MoMutation;
Var BUYING:Byte;
begin
If proto<2 then begin SCLRSCR; Pipeln('|04You need at least two ProtoPlasm Pods|15!');
stop; exit; end;
SCLRSCR;
Pipeln('|05You have |13'+litos(proto)+'|05 protoplasm pods, and extra mutation is |132 PP|05 each|13.');
Pipe('|05How many would you like to buy|13? |15');
SREAD_Num_Byte(Buying);
if buying=0 then exit;
If (Buying*2)>proto then begin Pipeln('|04Read carefully, you don''t have that many!');
                           stop; exit; end;
proto:=proto-(buying*2);
mutation:=mutation+buying;
Pipeln('|07You now have |15'+litos(mutation)+'|07 mutation|15.'); stop;
end;

Procedure ChangeName;
Var NewName:string;
begin
SCLRSCR;
If Proto<3 then begin Pipeln('|04You need 3 protoplasm pods to change your name!');
stop; exit; end;
Pipe('|05Would you like to change your name|15? |13');
yesno('N');
If choice='Y' then begin
proto:=proto-3;
Pipeln('|15Here''s a free tip, You can use color codes in your name!');
Repeat
repeat
Pipe('|07I want my new name to be|08: ');
Prompt2(newname,50,15,5);
newname:=Striphigh(newname);
until ((Length(stripe(newName))> 2) and (ucase(stripe(newName)) <> 'JEZEBEL'));
Pipeln('|07Your new name is|08: |15'+newname+'|16');
Pipe('|05Is this ok|15? |13');
yesno('Y');
until choice='Y';
Pipeln('|07Ok|15,|07 Changed|15.');
virusname:=newname;
stop;
end;
end;



begin
repeat
    ExchangeScreen;
    repeat
      SREAD_Char (CHOICE); CHOICE := upcase (CHOICE);
    until pos (choice, '12345RQ') > 0;
    pipeln (CHOICE);crlf(1);
    Case Choice of
      '1': JezPoster;
      '2': MoCharm;
      '3': MoBattles;
      '4': MoMutation;
      '5': ChangeName;
      '6': MoAttacks;
      'R': exit;
      'Q': exit;
    end;
until 5<4;
end;




Procedure AskRiddle;
Type
    Riddles = Record
    lines: array[1..10] of string[80];
    clue: string[50];
    answer: string[50];
end;


var totals,ridnum:integer;
    i:byte;
    guess:string;
    rid:riddles;
    ridfile:file of riddles;
begin
assign(ridfile,'RIDDLES.DAT');
reset(ridfile);
i:=0;
Repeat
seek(ridfile,i);
read(ridfile,rid);
inc(i);
until eof(ridfile);
totals:=i; i:=random(totals)+1;
seek(ridfile,i);
read(ridfile,rid);
close(ridfile);
SCLRSCR;
Pipeln('|02You have the brute strength to go up a level, but Jezebel wants to know');
Pipeln('if you have the brains to go up a level. She wants you to answer a');
Pipeln('riddle for her.|10');
stop;
SCLRSCR;
i:=0;
Repeat
inc(i);
Writeln(SOUTPUT,rid.lines[i]);
until (length(rid.lines[i+1])<2) or (i=10);
crlf(1);
Pipe('|15 '); Writeln(SOUTPUT,rid.clue);
Pipe('|08>'); Prompt2(guess,length(rid.answer),15,2);
If ucase(guess)=ucase(rid.answer) then gotit:=true else begin gotit:=false;
                                                              wrongguess:=true;
                                                              end;
If Gotit then begin
Stop;
Pipeln('|10You Got it|15! |10Jezebel smiles upon thee|15!');
stop;
end else begin
Stop;
Pipeln('|04Sorry, That was not the correct answer. Go study, and try again tommorrow.');
Stop;
end;
end;

Procedure FlirtJ;

Procedure Nod;
begin
Crlf(1);
if charm<5 then
Pipeln('|11She barely notices. But you feel better.')
else
Pipeln('|11She smiles warmly. You feel better.');
size:=size+10;
originalsize:=originalsize+10;
flirted:=true;
stop;
end;

Procedure Poem;
begin
CRLF(1);
if charm<10 then begin
Pipeln('|04She laughs in your face and calls you a little boy!');
addnews('|14Jezebel laughed at '+virusname+' for reciting a poem to her today.');
addnews('');
stop; flirted:=true; exit; end;
Pipeln('|11She listens intently, and giggles gently. You feel better.');
size:=size+20;
originalsize:=originalsize+20;
flirted:=true;
stop;
end;

Procedure Sing;
Begin
CRLF(1);
if charm<20 then begin
Pipeln('|04She laughs in your face and makes fun of your voice.');
addnews('|14Jezebel laughed at '+virusname+' for singing to her today!');
addnews('');
stop; flirted:=true; exit; end;
Pipeln('|11She listens intently, and blushes at the sound of her name. You feel great.');
size:=size+30;
originalsize:=originalsize+30;
flirted:=true;
stop;
end;

Procedure Rose;
begin
CRLF(1);
if charm<30 then begin
Pipeln('|04She shoves the rose up your keester!');
addnews('|14Jezebel rejected '+virusname+'''s rose today, he''s still removing');
addnews('the thorns!');
addnews('');
stop; flirted:=true; exit; end;
Pipeln('|11She takes the rose, eats the flower, and thanks you with a kiss! SCHWING!');
size:=size+50;
originalsize:=originalsize+50;
flirted:=true;
stop;
end;

Procedure Invite;
begin
CRLF(1);
if charm<40 then begin
Pipeln('|04She tells you to take a bath more often!');
addnews('|14Jezebel wants everyone to know that '+virusname+' never takes a bath!');
addnews('');
stop; flirted:=true; exit; end;
Pipeln('|11She shows up, wearing a teddy. You two have a great meal together!');
size:=size+90;
originalsize:=originalsize+90;
flirted:=true;
stop;
end;

Procedure Kiss;
begin
CRLF(1);
if charm<50 then begin
Pipeln('|04She darn near takes off your tongue!');
addnews('|14Jezebel is placing sexual harrassment charges against '+virusname+'.');
addnews('');
stop; flirted:=true; exit; end;
Pipeln('|11She takes you over to a dark corner, and you end up necking for six hours.');
size:=size+130;
originalsize:=originalsize+130;
flirted:=true;
stop;
end;

Procedure bed;
begin
CRLF(1);
if charm<60 then begin
Pipeln('|04She stuffs a broomstick up yer keester!');
addnews('|14'+virusname+' is having a broomstick surgically removed today!');
addnews('');
stop; flirted:=true; exit; end;
Pipeln('|11She accepts!');
stop;
pipeln('|08She shows up, wearing nothing but her socks!');
stop;
Pipeln('|08She does things to you that you''ll just have to imagine!');
stop;
size:=size+1000;
originalsize:=originalsize+1000;
flirted:=true;
stop;
end;


begin
SCLRSCR;
If flirted then begin
Pipeln('|03She walks away.');
stop; exit; end;
Pipeln('|15Flirt With Jezebel, eh? Do you think your man enough?');
crlf(1);
inc(charm);
Pipeln('|14N|02]|10od at her.');
Pipeln('|14R|02]|10ecite a poem to her');
Pipeln('|14S|02]|10ing to her');
Pipeln('|14G|02]|10ive her a Rose');
Pipeln('|14I|02]|10nvite her over for dinner');
Pipeln('|14P|02]|10lant a big kiss on her lips');
Pipeln('|14T|02]|10ake her to bed');
crlf(1);
Pipe('|12Whatcha gunna do: ');
    repeat
      SREAD_Char (CHOICE); CHOICE := upcase (CHOICE);
    until pos (choice, 'NRSGIPT') > 0;
    pipeln (CHOICE);crlf(1);
    Case Choice of
    'N': Nod;
    'R': Poem;
    'S': Sing;
    'G': Rose;
    'I': Invite;
    'P': Kiss;
    'T': Bed;
end;
end;

Procedure FlirtB;

Procedure Nod;
begin
Crlf(1);
if charm<5 then
Pipeln('|11He barely notices. But you feel better.')
else
Pipeln('|11He smiles warmly. You feel better.');
size:=size+10;
originalsize:=originalsize+10;
flirted:=true;
stop;
end;

Procedure Chuckle;
begin
CRLF(1);
if charm<10 then begin
Pipeln('|04He tells you to stop making so much noise.');
addnews('|14Brian told '+virusname+' to shutup today.');
addnews('');
stop; flirted:=true; exit; end;
Pipeln('|11He grins and smiles at you. You feel better.');
size:=size+20;
originalsize:=originalsize+20;
flirted:=true;
stop;
end;

Procedure Sing;
Begin
CRLF(1);
if charm<20 then begin
Pipeln('|04He laughs in your face and makes fun of your voice.');
addnews('|14Brian laughed at '+virusname+'''s singing voice today!');
addnews('');
stop; flirted:=true; exit; end;
Pipeln('|11He listens intently, and drools slightly. You feel great.');
size:=size+30;
originalsize:=originalsize+30;
flirted:=true;
stop;
end;

Procedure Book;
begin
CRLF(1);
if charm<30 then begin
Pipeln('|04He shoves the book up your keester!');
addnews('|14Brian rejected '+virusname+'''s book today, she''s still adding');
addnews('bandaids to the papercuts!');
addnews('');
stop; flirted:=true; exit; end;
Pipeln('|11He takes the book, reads it, and thanks you with a kiss! HUBBA HUBBA');
size:=size+50;
originalsize:=originalsize+50;
flirted:=true;
stop;
end;

Procedure Invite;
begin
CRLF(1);
if charm<40 then begin
Pipeln('|04He tells you to take a bath more often!');
addnews('|14Brian wants everyone to know that '+virusname+' never takes a bath!');
addnews('');
stop; flirted:=true; exit; end;
Pipeln('|11He shows up, with a box of chocolates. You two have a great meal together!');
size:=size+90;
originalsize:=originalsize+90;
flirted:=true;
stop;
end;

Procedure Kiss;
begin
CRLF(1);
if charm<50 then begin
Pipeln('|04He spits on the ground and runs!');
addnews('|14Brian is placing sexual harrassment charges against '+virusname+'.');
addnews('');
stop; flirted:=true; exit; end;
Pipeln('|11He takes you over to a dark corner, and you end up necking for six hours.');
size:=size+130;
originalsize:=originalsize+130;
flirted:=true;
stop;
end;

Procedure bed;
begin
CRLF(1);
if charm<60 then begin
Pipeln('|04He calls you a slut, and tells you to get lost!');
addnews('|14'+virusname+' is looking for a man, anyone interested?');
addnews('');
stop; flirted:=true; exit; end;
Pipeln('|11He accepts!');
stop;
pipeln('|08He shows up, wearing nothing but his socks!');
stop;
Pipeln('|08He does things to you that you''ll just have to email him to find out!');
stop;
size:=size+1000;
originalsize:=originalsize+1000;
flirted:=true;
stop;
end;


begin
SCLRSCR;
If flirted then begin
Pipeln('|03He walks away.');
stop; exit; end;
Pipeln('|15Flirt With Brian, eh? Do you think your fine enough?');
crlf(1);
Pipeln('|14N|02]|10od at him.');
Pipeln('|14C|02]|10huckle at his jokes');
Pipeln('|14S|02]|10ing to him');
Pipeln('|14G|02]|10ive him a StarTrek book');
Pipeln('|14I|02]|10nvite him over for dinner');
Pipeln('|14P|02]|10lant a big kiss on his lips');
Pipeln('|14T|02]|10ake him to bed');
crlf(1);
Pipe('|12Whatcha gunna do: ');
    repeat
      SREAD_Char (CHOICE); CHOICE := upcase (CHOICE);
    until pos (choice, 'NCSGIPT') > 0;
    pipeln (CHOICE);crlf(1);
    Case Choice of
    'N': Nod;
    'C': Chuckle;
    'S': Sing;
    'G': Book;
    'I': Invite;
    'P': Kiss;
    'T': Bed;
end;
end;

function striphigh(stripword:string):string;
var ag,imp:integer;

begin
imp:=length(stripword);
repeat
if ((ord(stripword[imp])<32) or (ord(stripword[imp])>127)) then
   DELETE(stripword,imp,1);
dec(imp);
until ((imp<1) or (imp=0));
striphigh:=stripword;
end;


function whatsregname:string;
var
  buh:string;
begin
     buh := board_name;
     insert('|07',buh,2);
     whatsregname:='|15'+buh;
end;
end.
