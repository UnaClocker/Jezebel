unit CfgWay;
{$O+}
{$G+}

interface

uses Crt,crtkit;

type
  LineString = string [80];
Type
  SCOREBOARD = Record
    User,VirusName,SpaceC:String;
    Sex,SpareA,SpareB:Char;
    SpareD,VirusType:Byte;
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

Type
    Riddles = Record
    lines: array[1..10] of string[80];
    clue: string[50];
    answer: string[50];
end;




Var
 Newsfile:text;
 Progs:Programs;
 Programfile: File of Programs;
 k,Scores:Scoreboard;
 Scorefile:File of Scoreboard;
 proto,UserNum,LastOnD,LastOnM,LastOnY,day,month,year,tday:word;
 Flirted,Gotit,Wrongguess,foundhim,Dead,PIZZA,
 TimeToExit,entering_game:boolean;
 theonetofind,UserH,VirusName:String;
 mut,spynum,CODE:Integer;
 OriginalSize,Size,FilesInfected:LongInt;
 Sex:Char;
 Charm,offspring,VirusType,Team,Mutation,Battles,Stealth:Byte;
  Done1,Done2,Done3,Done4,Done5:boolean;
  NumCPU, NumSoftware, NumUsers,NewsDay:word;
  alias, network, Add1News, d, E, bbsnam, CPUNam, SoftwareName: string;
  NumNodes,LNGINT,Users, Subscribers, Money:longint;
  NodesWaiting,C,R,L,X, YES, NUMMAIL, F, G, H, NUMDOORS,
  RAM, NUMCD, NUMMEG, NUMBPS, BUY: longint;
  OldNews:text;
  file1,textfile,datafile: text;
  duh:byte;
  MAXRAM, MAXNODES, RND, NUMWORK, USERNUMBER, TD,
  linecount,chn,ADSPLACED, NUMVIRUS, VIRUSPROTECT: longint;
  I, NWS, NUSE, RAND, WX, WY: longint;
  completelydone,changed, CANRUNBETTER, REGISTERED, QUITTING: boolean;
  ch,A, B,choice: char;
  better:string;


function YesNo(default:char):char;
procedure fg(xx:byte);
function wtos(xx:word):string;
function itos(xx:longint):string;
function Stripe (MYString:string):string;
procedure intro;
procedure outro;
function Spaces (Thestring:string; Me:integer):string;
procedure Stop;
function Uplow (TempStr:Linestring):Linestring;
Procedure TopOfMain;
Procedure Playeredittor;

implementation

Function ucase (tempstr: linestring): linestring;
Var
  i : Integer;
Begin
  For i := 1 To Length (tempstr) Do tempstr [i] := UpCase (tempstr [i] );
  ucase := tempstr;
End;


function YesNo (default: char):char;
begin
  write (default);
  repeat
    repeat until keypressed;
    choice:=readkey;
    choice := upcase (choice);
    if choice = #13 then choice := default;
  until choice in ['Y', 'N'];
  if choice = 'Y' then pipeln (#8 + '|13Yes') else pipeln (#8 + '|13No');
  if choice = 'Y' then yesno:='Y' else yesno:='N';
end;

Procedure fg(xx:byte);
begin
Textcolor(xx);
end;

function wtos(xx:word):string;
var
meme:string;
begin
str(xx,meme);
wtos:=meme;
end;

function itos(xx:longint):string;
var
meme:string;
begin
str(xx,meme);
itos:=meme;
end;

procedure Stop;
var
  badass:char;
  I:integer;
begin
  PIPE('|15Ú|13-|05- |15P|13r|05ess |15A|13n|05y |15K|13e|05y |15-|13-|05-');
  repeat until keypressed;
  badass:=readkey;
  for I := 1 to 21 do begin
  Write(#8); Write('<'); Write(#8);Delay(20); Write(' '); Write(#8); end;
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
    end else Strip:=Strip+c;
  end;
  stripe:=strip;
end;

procedure intro;
begin
CLRSCR;
Pipeln('           |07ÛßÛ ÛßÛßÛßÛ ÛßÛßÛßÛ ÛßÛßÛßÛ ÛßÛßÛßÜ  ÛßÛßÛßÛ ÛßÛ     Ü ÛßÛßÛßÛ');
Pipe('           |08|23°|05|16²|08|23°|16 |23°|05|16²|08|23°|16 |07ßßß ßßß |08|23°|05|16²|08|23°|16 '+
       '|23°|05|16²|08|23°|16 |07ßßß |08|23°|05|16²|08|23°|16 |23°|05|16²|08|23°|16  |23°|05|16²|08|23°');
Pipeln('|16 |07ßßß |08|23°|05|16²|08|23°|16     |07½ ßßß |08|23°|05|16²|08|23°|16');
Pipe('           |23±|05|16±|08|23±|16 |23±|05|16±|08|23±|07|16ß     Ü|08|23±|05|16±|08|23±|07|16ß  '+
       '|08|23±|05|16±|08|23±|07|16ß    |08|23±|05|16±|08|23±|07|16ßß|08|23±|07|16ßÜ |08|23±|05|16±|08');
Pipeln('|23±|07|16ß    |08|23±|05|16±|08|23±|16        |07Ü|08|23±|05|16±|08|23±|07|16ß');
Pipe('       |08ÜÜÜ |23²|05|16°|08|23²|16 |23²|05|16°|08|23²|16 ÜÜÜ |23²|05|16°|08|23²|16 ÜÜÜ |23²'+
       '|05|16°|08|23²|16 ÜÜÜ |23²|05|16°|08|23²|16  |23²|05|16°|08|23²|16 |23²|05|16°|08|23²|16 ÜÜÜ ');
Pipeln('|23²|05|16°|08|23²|16 ÜÜÜ   |23²|05|16°|08|23²|16 ÜÜÜ');
Pipeln('       Û|21Ü|16ÛÜÛ|21Ü|16Û Û|21Ü|16ÛÜÛ|21Ü|16Û Û|21Ü|16ÛÜÛ|21Ü|16Û Û|21Ü|16ÛÜÛ|21Ü|16Û Û|21Ü'+
       '|16ÛÜÜÛ|21Ü|16ß Û|21Ü|16ÛÜÛ|21Ü|16Û Û|21Ü|16ÛÜÛ|21Ü|16Û   Û|21Ü|16ÛÜÛ|21Ü|16Û');
Writeln;
Pipeln('                 |07ÛßÛßÛßÛ ÛßÛßÛßÛ ÛßÛÜ  ÛßÛ ÛßÛßÛßÛ ßÛßÛß ÜßÛßßÛßÜ');
Pipeln('                 |08|23°|05|16²|08|23°|16 |07ßßß |08|23°|05|16²|08|23°|16 |23°|05|16²|08|23°'+
       '|16 |23°|05|16²|08|23°°|07|16Ü |08|23°|05|16²|08|23°|16 |23°|05|16²|08|23°|16 |07ßßß  |08|23°'+
       '|05|16²|08|23°|16  |23°|05|16²|08|23°|16  |07ßßß');
Pipeln('                 |08|23±|05|16±|08|23±|16     |23±|05|16±|08|23±|16 |23±|05|16±|08|23±|16 '+
       '|23±|05|16±|08|23±|16ß|23±|07|16Ü|08|23±|05|16±|08|23±|16 |23±|05|16±|08|23±|07|16ß     |08'+
       '|23±|05|16±|08|23±|16  |23±|05|16±|08|23±|16');
Pipeln('                 |23²|05|16°|08|23²|16 ÜÜÜ |23²|05|16°|08|23²|16 |23²|05|16°|08|23²|16 |23²'+
       '|05|16°|08|23²|16 ß|23²²|05|16°|08|23²|16 |23²|05|16°|08|23²|16      |23²|05|16°|08|23²|16 '+
       ' |23²|05|16°|08|23²|16 ÜÜÜÜ');
Pipeln('                 Û|21Ü|16ÛÜÛ|21Ü|16Û Û|21Ü|16ÛÜÛ|21Ü|16Û Û|21Ü|16Û  ßÛ|21Ü|16Û Û|21Ü|16Û   '+
       '  ÜÛ|21Ü|16ÛÜ ß|21Ü|16ÛÜÜÛ|21Ü|16Û');
Writeln;
Pipeln('           |07ÛßÛßÛßÜ ÛßÛßÛßÜ  ÛßÛßÛßÛ ÜßÛßßÛßÜ ÛßÛßÛßÜ  ÛßÛßÛßÛ ÛßÛßÛßÛßÛ');
Pipe('           |08|23°|05|16²|08|23°|16 |23°|05|16²|08|23°|16 |23°|05|16²|08|23°|16 |23°|05|16²'+
       '|08|23°|16  |23°|05|16²|08|23°|16 |23°|05|16²|08|23°|16 |23°|05|16²|08|23°|16  |07ßßß |08|23');
Pipeln('°|05|16²|08|23°|16 |23°|05|16²|08|23°|16  |23°|05|16²|08|23°|16 |23°|05|16²|08|23°|16 |23°|05'+
       '|16²|08|23°|16 |23°|16 |23°|05|16²|08|23°|16');
Pipe('           |23±|05|16±|08|23±|07|16ßßß  |08|23±|05|16±|08|23±|07|16ßß|08|23±|07|16Ü  |08|23±'+
       '|05|16±|08|23±|16 |23±|05|16±|08|23±|16 |23±|05|16±|08|23±|16      |23±|05|16±|08|23±|07|16ßß');
Pipeln('|08|23±|07|16Ü  |08|23±|05|16±|08|23±|07|16ß|08|23±|05|16±|08|23±|16 |23±|05|16±|08|23±|16   '+
       '|23±|05|16±|08|23±|16');
Pipe('           |23²|05|16°|08|23²|16     |23²|05|16°|08|23²|16  |23²|05|16°|08|23²|16 |23²|05|16°'+
       '|08|23²|16 |23²|05|16°|08|23²|16 |23²|05|16°|08|23²|16 ÜÜÜÜ |23²|05|16°|08|23²|16  |23²|05|16°');
Pipeln('|08|23²|16 |23²|05|16°|08|23²|16 |23²|05|16°|08|23²|16 |23²|05|16°|08|23²|16   |23²|05|16°|08|23²|16');
Pipeln('           Û|21Ü|16Û     Û|21Ü|16Û  Û|21Ü|16Û Û|21Ü|16ÛÜÛ|21Ü|16Û ß|21Ü|16ÛÜÜÛ|21Ü|16Û Û|21Ü|16Û  Û|21'+
       'Ü|16Û Û|21Ü|16Û Û|21Ü|16Û Û|21Ü|16Û   Û|21Ü|16Û');
Pipeln(' |13ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»');
Pipeln(' ÈÍÍÍÍÍÍÍÍÍ» |15Z|05odian |15S|05oftware|15''|05s Latest And Greatest game|15! |05JEZEBEL|15! |13ÉÍÍÍÍÍÍÍÍÍÍ¼');
Pipeln('           ÈÍÍÍÍÍÍÍÍÍÍÍ» |05Coded By|15: |05Brian J|15. |05Schulteis|15. |13ÉÍÍÍÍÍÍÍÍÍÍ¼');
Pipeln('                       ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼');
stop;
end;

procedure outro;
begin
CLRSCR;
Pipeln('           |07ÛßÛ ÛßÛßÛßÛ ÛßÛßÛßÛ ÛßÛßÛßÛ ÛßÛßÛßÜ  ÛßÛßÛßÛ ÛßÛ     Ü ÛßÛßÛßÛ');
Pipe('           |08|23°|05|16²|08|23°|16 |23°|05|16²|08|23°|16 |07ßßß ßßß |08|23°|05|16²|08|23°|16 '+
       '|23°|05|16²|08|23°|16 |07ßßß |08|23°|05|16²|08|23°|16 |23°|05|16²|08|23°|16  |23°|05|16²|08|23°');
Pipeln('|16 |07ßßß |08|23°|05|16²|08|23°|16     |07½ ßßß |08|23°|05|16²|08|23°|16');
Pipe('           |23±|05|16±|08|23±|16 |23±|05|16±|08|23±|07|16ß     Ü|08|23±|05|16±|08|23±|07|16ß  '+
       '|08|23±|05|16±|08|23±|07|16ß    |08|23±|05|16±|08|23±|07|16ßß|08|23±|07|16ßÜ |08|23±|05|16±|08');
Pipeln('|23±|07|16ß    |08|23±|05|16±|08|23±|16        |07Ü|08|23±|05|16±|08|23±|07|16ß');
Pipe('       |08ÜÜÜ |23²|05|16°|08|23²|16 |23²|05|16°|08|23²|16 ÜÜÜ |23²|05|16°|08|23²|16 ÜÜÜ |23²'+
       '|05|16°|08|23²|16 ÜÜÜ |23²|05|16°|08|23²|16  |23²|05|16°|08|23²|16 |23²|05|16°|08|23²|16 ÜÜÜ ');
Pipeln('|23²|05|16°|08|23²|16 ÜÜÜ   |23²|05|16°|08|23²|16 ÜÜÜ');
Pipeln('       Û|21Ü|16ÛÜÛ|21Ü|16Û Û|21Ü|16ÛÜÛ|21Ü|16Û Û|21Ü|16ÛÜÛ|21Ü|16Û Û|21Ü|16ÛÜÛ|21Ü|16Û Û|21Ü'+
       '|16ÛÜÜÛ|21Ü|16ß Û|21Ü|16ÛÜÛ|21Ü|16Û Û|21Ü|16ÛÜÛ|21Ü|16Û   Û|21Ü|16ÛÜÛ|21Ü|16Û');
Writeln;
Pipeln('                 |07ÛßÛßÛßÛ ÛßÛßÛßÛ ÛßÛÜ  ÛßÛ ÛßÛßÛßÛ ßÛßÛß ÜßÛßßÛßÜ');
Pipeln('                 |08|23°|05|16²|08|23°|16 |07ßßß |08|23°|05|16²|08|23°|16 |23°|05|16²|08|23°'+
       '|16 |23°|05|16²|08|23°°|07|16Ü |08|23°|05|16²|08|23°|16 |23°|05|16²|08|23°|16 |07ßßß  |08|23°'+
       '|05|16²|08|23°|16  |23°|05|16²|08|23°|16  |07ßßß');
Pipeln('                 |08|23±|05|16±|08|23±|16     |23±|05|16±|08|23±|16 |23±|05|16±|08|23±|16 '+
       '|23±|05|16±|08|23±|16ß|23±|07|16Ü|08|23±|05|16±|08|23±|16 |23±|05|16±|08|23±|07|16ß     |08'+
       '|23±|05|16±|08|23±|16  |23±|05|16±|08|23±|16');
Pipeln('                 |23²|05|16°|08|23²|16 ÜÜÜ |23²|05|16°|08|23²|16 |23²|05|16°|08|23²|16 |23²'+
       '|05|16°|08|23²|16 ß|23²²|05|16°|08|23²|16 |23²|05|16°|08|23²|16      |23²|05|16°|08|23²|16 '+
       ' |23²|05|16°|08|23²|16 ÜÜÜÜ');
Pipeln('                 Û|21Ü|16ÛÜÛ|21Ü|16Û Û|21Ü|16ÛÜÛ|21Ü|16Û Û|21Ü|16Û  ßÛ|21Ü|16Û Û|21Ü|16Û   '+
       '  ÜÛ|21Ü|16ÛÜ ß|21Ü|16ÛÜÜÛ|21Ü|16Û');
Writeln;
Pipeln('           |07ÛßÛßÛßÜ ÛßÛßÛßÜ  ÛßÛßÛßÛ ÜßÛßßÛßÜ ÛßÛßÛßÜ  ÛßÛßÛßÛ ÛßÛßÛßÛßÛ');
Pipe('           |08|23°|05|16²|08|23°|16 |23°|05|16²|08|23°|16 |23°|05|16²|08|23°|16 |23°|05|16²'+
       '|08|23°|16  |23°|05|16²|08|23°|16 |23°|05|16²|08|23°|16 |23°|05|16²|08|23°|16  |07ßßß |08|23');
Pipeln('°|05|16²|08|23°|16 |23°|05|16²|08|23°|16  |23°|05|16²|08|23°|16 |23°|05|16²|08|23°|16 |23°|05'+
       '|16²|08|23°|16 |23°|16 |23°|05|16²|08|23°|16');
Pipe('           |23±|05|16±|08|23±|07|16ßßß  |08|23±|05|16±|08|23±|07|16ßß|08|23±|07|16Ü  |08|23±'+
       '|05|16±|08|23±|16 |23±|05|16±|08|23±|16 |23±|05|16±|08|23±|16      |23±|05|16±|08|23±|07|16ßß');
Pipeln('|08|23±|07|16Ü  |08|23±|05|16±|08|23±|07|16ß|08|23±|05|16±|08|23±|16 |23±|05|16±|08|23±|16   '+
       '|23±|05|16±|08|23±|16');
Pipe('           |23²|05|16°|08|23²|16     |23²|05|16°|08|23²|16  |23²|05|16°|08|23²|16 |23²|05|16°'+
       '|08|23²|16 |23²|05|16°|08|23²|16 |23²|05|16°|08|23²|16 ÜÜÜÜ |23²|05|16°|08|23²|16  |23²|05|16°');
Pipeln('|08|23²|16 |23²|05|16°|08|23²|16 |23²|05|16°|08|23²|16 |23²|05|16°|08|23²|16   |23²|05|16°|08|23²|16');
Pipeln('           Û|21Ü|16Û     Û|21Ü|16Û  Û|21Ü|16Û Û|21Ü|16ÛÜÛ|21Ü|16Û ß|21Ü|16ÛÜÜÛ|21Ü|16Û Û|21Ü|16Û  Û|21'+
       'Ü|16Û Û|21Ü|16Û Û|21Ü|16Û Û|21Ü|16Û   Û|21Ü|16Û');
Pipeln(' |13ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»');
Pipeln(' ÈÍÍÍÍÍÍÍÍÍ» |15Z|05odian |15S|05oftware|15''|05s Latest And Greatest game|15! |05JEZEBEL|15! |13ÉÍÍÍÍÍÍÍÍÍÍ¼');
Pipeln('           ÈÍÍÍÍÍÍÍÍÍÍÍ» |05Coded By|15: |05Brian J|15. |05Schulteis|15. |13ÉÍÍÍÍÍÍÍÍÍÍ¼');
Pipeln('                       ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼');

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

procedure crlf; begin writeln; end;

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

procedure Spinner(X,y,f,num:byte);
begin
  gotoxy(X,y);
  fg(f);
  case num of
    1: write('ú');
    2: write('ù');
    3: write('*');
    4: write('');
    5: write('*');
    6: write('ù');
  end;
end;

procedure TopOfMain;
begin
  pipeln('      |05ÜßßÜ ÜßßÜ ÜßßßÜ      ÜßßßÜÜßÜ ÜßßßßÜ ÜÜßßÜßÜ   ÜßßÜÜÜßßßÜÜßßßþÜßßßÜ');
  pipe('|05    Üß|15ÜßÛÜ|05ß|15ÜßÛÜ|05ß|15ÜßÛÛ |05Û   Üß|15ÜßÛÛ ÜÛÜ|05ß|15ÜßÛßÛÜ|05ß|15Ü ÛÛ Û |05ÛÜß');
  pipeln('|15ÜßÛÜ ÜÛÛÛ ÜßÛÛ ÜßÛÜ |05Û');
  pipe('|05    Û |23|15²|16ß|23²|16Ü |23²|16ß|23²|16Ü ßÜÜÜ |05Û   Û |15ßÜÜÜ |23²²±|16 |23²|16 |05Ü ');
  pipe('|23|15²±|16 |23²|16 |23²²|16 |23²|16 |05ß  |23|15²|16Ü|23²±|16  |23²|16 |05Ü |23|15²|16 |23');
  pipeln('²±|16 |23²|16ß|23²|16  |05Û');
  pipe('|05    Û |23|15±|16Ü|23±|16ß |23±|16Ü|23±|16ß |23²|16Ü|23²±|16 |05Û   Û |23|15²|16Ü|23²±|16 ');
  pipe('|23|15²±°|16 |23±|16 |05Û |23|15±°|16 |23±|16Ü|23²±|16 |23±|16Ü|23±°|16 |23±|16 |23±°|16  ');
  pipeln('|23±|16 |05Û |23|15±|16Ü|23²°|16 |23±|16 |15ß|23°|16 |05Û');
  pipeln('     ßÜÜÜßßÜÜÜßßÜÜÜÜß     ßÜÜÜÜßÜÜÜßÜß ßÜÜßÜÜÜÜßÜÜÜÜßÜßÜÜßßÜß ßÜÜÜÜßÜÜÜÜß');
end;

{function whatsregname:string;
var
  buh:string;
begin
     if isregistered then begin {buh := bbsname}
{     insert('|07',buh,2);
     whatsregname:='|15'+buh; end;
     if not isregistered then whatsregname := '|15U|07nregistered';
end;}

Procedure PlayerEdittor;


procedure saveit;
begin
if changed then begin
Pipe('|15This user has been changed! Save changes? |13');
If Yesno('Y')='Y' then begin
reset(scorefile);
seek(Scorefile,usernum);
write(scorefile,scores);
close(scorefile);
end;
end;
changed:=false;
end;

Procedure nextuser;
begin
saveit;
inc(usernum);
if usernum>100 then usernum:=1;
reset(scorefile);
seek(scorefile,usernum);
read(scorefile,scores);
close(scorefile);
end;

Procedure previoususer;
begin
saveit;
dec(usernum);
if usernum<1 then usernum:=100;
reset(scorefile);
seek(scorefile,usernum);
read(scorefile,scores);
close(scorefile);
end;

Procedure Goedit;
begin
completelydone:=false;
changed:=false;
repeat
clrscr;
Pipeln('|15User |08#|07'+wtos(usernum));
Pipe('|05[|13A|05] ');
Pipeln('|15Real Name|08:|07       '+scores.user);
Pipe('|05[|13B|05] ');
Pipeln('|15Virus Name|08:|07      '+Scores.virusname);
Pipe('|05[|13C|05] ');
Pipeln('|15Current Size|08: |07   '+itos(Scores.size));
Pipe('|05[|13D|05] ');
Pipeln('|15Max Size|08: |07       '+itos(scores.originalsize));
Pipe('|05[|13E|05] ');
Pipeln('|15ProtoPlasm Pods|08: |07'+wtos(scores.proto));
Pipe('|05[|13F|05] ');
Pipeln('|15Files Infected|08: |07 '+itos(scores.filesinfected));
Pipe('|05[|13G|05] ');
Pipeln('|15Sex|08: |07            '+scores.sex);
Pipe('|05[|13H|05] ');
Pipeln('|15Charm|08: |07          '+itos(scores.charm));
Pipe('|05[|13I|05] ');
Pipeln('|15Mutation|08: |07       '+itos(scores.mutation));
Pipe('|05[|13J|05] ');
Pipeln('|15Stealth Level|08: |07  '+itos(scores.stealth));
Pipe('|05[|13K|05] ');
Pipeln('|15Battles Left|08: |07   '+itos(scores.battles));
Pipe('|05[|13L|05] ');
Pipeln('|15Offspring|08:       |07'+itos(scores.offspring));
Pipe('|05[|13M|05] ');
Pipeln('|15Last On (day)|08: |07  '+wtos(scores.lastond));
Pipe('|05[|13N|05] ');
Pipeln('|15Last On (Month)|08: |07'+itos(scores.lastonm));
Pipe('|05[|13O|05] ');
Pipeln('|15Last On (Year)|08: |07 '+itos(scores.lastony));
Gotoxy(50,2);
Pipe('|05[|13P|05] ');
If scores.flirted then network:='Yes' else Network:='No';
Pipeln('|15Flirted Today|08: |07   '+network);
Gotoxy(50,3);
Pipe('|05[|13R|05] ');
If scores.wrongguess then network:='Yes' else Network:='No';
Pipeln('|15Attempted Growth|08: |07'+network);
Gotoxy(50,4);
Pipe('|05[|13S|05] ');
If scores.dead then network:='Yes' else Network:='No';
Pipeln('|15Player Dead|08: |07     '+network);
Gotoxy(50,5);
Pipe('|05[|13T|05] ');
If scores.deleted then network:='Yes' else Network:='No';
Pipeln('|15Deleted|08: |07         '+network);
Gotoxy(50,6);
Pipeln('|05[|13-|05] |15Previous Player');
Gotoxy(50,7);
Pipeln('|05[|13+|05] |15Next Player');
Gotoxy(50,8);
pipeln('|05[|13Q|05] |15Quit & Save');
Gotoxy(1,18);
Pipe('|07Your Choice|15: |07');
repeat
repeat until keypressed;
choice:=readkey;
    choice:=upcase(Choice);
    Until Pos (choice, 'ABCDEFGHIJKLMNOPRST+-Q?') > 0;
    pipeln (CHOICE);
    Case Choice Of
      '+': NextUser;
      '-': PreviousUser;
      'A': begin changed:=true; Pipe('|15New Name|08: |07');
      readln(scores.user); scores.user:=ucase(scores.user); stop; end;
      'B': begin changed:=true; pipe('|15New Name|08: |07');
      readln(scores.virusname); stop; end;
      'C': begin changed:=true; pipe('|15New Size|08: |07');
      readln(scores.size); stop; end;
      'D': begin changed:=true; pipe('|15New Max Size|08:|07 ');
      readln(scores.originalsize); stop; end;
      'E': begin changed:=true; pipe('|15ProtoPlasm Pods|08: |07');
      readln(scores.proto); stop; end;
      'F': begin changed:=true; pipe('|15Files Infected|08: |07');
      readln(scores.filesinfected); stop; end;
      'G': begin changed:=true; pipe('|15Sex|08: |07');
      readln(scores.sex); stop; end;
      'H': begin changed:=true; pipe('|15Charm|08: |07');
      readln(scores.charm); stop; end;
      'I': begin changed:=true; pipe('|15Mutation|08: |07');
      readln(scores.mutation); stop; end;
      'J': begin changed:=true; pipe('|15Stealth Level|08: |07');
      readln(scores.stealth); stop; end;
      'K': begin changed:=true; pipe('|15Battles Left|08: |07');
      readln(scores.battles); stop; end;
      'L': begin changed:=true; pipe('|15Offspring|08: |07');
      readln(scores.offspring); stop; end;
      'M': begin changed:=true; pipe('|15Last Day On|08: |07');
      readln(scores.lastond); stop; end;
      'N': begin changed:=true; pipe('|15Last Month On|08: |07');
      readln(scores.lastonm); stop; end;
      'O': begin changed:=true; pipe('|15Last Year On|08: |07');
      readln(scores.lastony); stop; end;
      'P': begin changed:=true; pipe('|15Did they flirt today|08? |13');
      if yesno('Y')='Y' then scores.flirted:=true else scores.flirted:=false;
      stop; end;
      'R': begin changed:=true; pipe('|15Did they already mis-guess a riddle|08? |13');
      if yesno('Y')='Y' then scores.wrongguess:=true else scores.wrongguess:=false;
      stop; end;
      'S': begin changed:=true; pipe('|15Is this player dead|08? |13');
      if yesno('Y')='Y' then scores.dead:=true else scores.dead:=false;
      stop; end;
      'T': begin changed:=true; pipe('|15Delete this user|08? |13');
      if yesno('Y')='Y' then scores.deleted:=true else scores.deleted:=false;
      stop; end;
      'Q': begin saveit; COMPLETELYdone := True; stop; end;
    End;
UNTIL completelydone;
end;








begin
  Assign (Scorefile, 'Scores.DAT');
  {$I-}
  Reset (Scorefile);
  {$I+}
  If IOResult <> 0 Then Begin;
    Rewrite (Scorefile);
    FillChar (Scores, SizeOf (Scores), 0);
    For f := 1 To 101 Do Write (Scorefile, Scores);
  End;
  Reset (Scorefile);
  usernum:=1;
  Seek(Scorefile,usernum);
  read(Scorefile,Scores);
  close(scorefile);
  goedit;
end;

end.
