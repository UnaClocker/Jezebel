Program Jezebel;
{$G+,F+,B+,D-}

{ Jezebel - The Virus Simulation doorgame for DOS based BBS systems
Copyright (C) 1996-1998 Zodian Software & Brian J. Schulteis

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

In general, you are welcome to modify this source, add to it, remove
from it, whatever it takes to make it work for you. Then you may
add your name to the author list, and pass on the source code with
the modified version of the program. You MAY NOT distribute the modified
program without the source.

Contact the original author, Brian J. Schulteis at
                             UnaBonger@Sinclair.net or
                             Schulteis@USA.NET
                             Zodian Software's Homepage is at:
                             http://home.onestop.net/zodian

}



USES SiMMaiL, SoRTeM, DDPLuS, SeWTaLK, PiPeCoDe,
     CRT, DoS, eLoG, JezWay,Overlay;
     {$O JezWay}
     {$O sewtalk}

procedure CreateUser;
begin
  sclrscr;
  PIPELN ('|05Welcome to Jezebel|15!');
  CRLF (1);
  PIPE ('|13Do you want to become a virus|15? ');
  YesNo ('Y');
  if CHOICE = 'N' then halt;
  delay (400);
 choose1;
  repeat
    sgOTO_XY (12, 10);
    prompt2(VirusName, 23,15,5);
    Virusname:=Striphigh(virusname);
  until ((Length(stripe(VirusName))> 2) and (ucase(stripe(VirusName)) <> 'JEZEBEL'));
  Choose2;
  repeat
      SET_FOREGROUND(15);
      SET_BACKGROUND(5);
      sgoto_xy(43,17);
      SREAD_Char (CHOICE); CHOICE := upcase (CHOICE);
    until pos (choice, 'MF') > 0;
    pipe (CHOICE);crlf(1);
    SET_BACKGROUND(0);
  Scores. User := Userh;
  Scores. VirusName := VirusName;
  Scores. Sex:=choice;
  Sex:=choice;
  makeevent (virusname, 'Jezebel','Welcome!','I hope you make me proud!');
  ADDNEWS ('|13' + virusname + '|16|05 crawled out of the pond today|08!');
  ADDNEWS ('');
  SGOTO_XY (8, 12);
   Flirted:=False;
   Attacks:=1;
   Size:=64;
   FilesInfected:=0;
   Team:=0;
   Mutation:=0;
   Battles:=20;
   Stealth:=1;
   Charm:=1;
   Offspring:=0;
   proto:=0;
   Dead:=False;
   Wrongguess:=false;
   originalsize:=size;
   reset(scorefile);
   Scores.Size:=64;
   Scores.Deleted:=false;
   scores.dead:=false;
   scores.user:=userh;
   scores.virusname:=virusname;
   seek(scorefile,usernum);
   write(scorefile,scores);
   close(scorefile);
end;


Procedure NotDoneYet;
begin
SCLRSCR;
Pipeln('|15We at Zodian Software regret to inform you that this function has not been');
pipeln('installed in this version. You can look forward to this feature being added');
pipeln('to a future version. Thank you for playing the game, and please enjoy the');
pipeln('features that have been added to this version.');
stop;
end;

Procedure Maint;
var
   maintfile:file of scoreboard;
   maintdat:scoreboard;
   ig:integer;
begin
createnews;
assign(maintfile,'SCORES.DAT');
reset(maintfile);
for ig:=1 to 100 do begin
  seek(maintfile,ig);
  read(maintfile,maintdat);
  if not maintdat.deleted then begin
    if ((maintdat.lastonm<>month) and (day>13)) then begin maintdat.deleted:=true;
                                                   pipeln('|04'+maintdat.virusname+'|12 deleted.');
                                                   end
    else if ((maintdat.lastonm=month) and ((day-maintdat.lastond)>14))
    then begin maintdat.deleted:=true;
                                                   pipeln('|04'+maintdat.virusname+'|12 deleted.');
                                                   end;
    if maintdat.dead then begin
      case maintdat.stealth of
      1: if maintdat.size<64 then maintdat.size:=64;
      2: if maintdat.size<128 then maintdat.size:=128;
      3: if maintdat.size<256 then maintdat.size:=265;
      4: if maintdat.size<512 then maintdat.size:=512;
      5: if maintdat.size<1024 then maintdat.size:=1024;
      6: if maintdat.size<2048 then maintdat.size:=2048;
      7: if maintdat.size<4096 then maintdat.size:=4096;
      8: if maintdat.size<10000 then maintdat.size:=10000;
      9: if maintdat.size<100000 then maintdat.size:=100000;
      10: if maintdat.size<1000000 then maintdat.size:=1000000;
      11: if maintdat.size<10000000 then maintdat.size:=10000000;
      12: if maintdat.size<100000000 then maintdat.size:=100000000;
      end;
      maintdat.dead:=false;
      Pipeln('|02'+maintdat.virusname+' returned from the dead.');
                          end;
      maintdat.attacks:=maintdat.stealth;
      maintdat.flirted:=false;
      maintdat.wrongguess:=false;
      maintdat.battles:=20;
      seek(maintfile,ig);
      write(maintfile,maintdat);
                               end;
                    end;
stop;
end;



procedure LoadUser;
begin;
  seek (Scorefile, Usernum);
  read (Scorefile, Scores);
  close(scorefile);
  VirusName:=scores.VirusName;
  sex:=scores.sex;
  flirted:=scores.flirted;
  size:=Scores.size;
  FilesInfected:=Scores.FilesInfected;
  LastOnD:=Scores.LastOnD;
  LastOnM:=Scores.LastOnM;
  LastOnY:=Scores.LastOnY;
  Battles:=Scores.Battles;
  Stealth:=Scores.Stealth;
  Mutation:=Scores.Mutation;
  VIRUSTYPE:=SCORES.VirusType;
  Charm:=Scores.Charm;
  Attacks:=Scores.Attacks;
  offspring:=scores.offspring;
  proto:=scores.proto;
  Dead:=Scores.dead;
  WrongGuess:=scores.wrongguess;
  if lastond<>day then begin
  dead:=false; flirted:=false; wrongguess:=false; end;
  OriginalSize:=Scores.originalsize;
end;

procedure GetReadyToSave;
var att:integer;
begin;
att:=0;
repeat
inc(att);
reset(scorefile);
seek(scorefile,att);
read(scorefile,k);
until k.deleted;
usernum:=att;
close(scorefile);
  Scores. User := ucase(userh);
  Scores. VirusName := VirusName;
  if dead then scores.size:=0
  else
  sCores. sex:=sex;
  Scores. Wrongguess:=wrongguess;
  Scores.Attacks:=Attacks;
  Scores. Size := originalSize;
  Scores. flirted:=flirted;
  Scores. FilesInfected := FilesInfected;
  Scores. LastOnD := Day;
  Scores. LastOnM := Month;
  Scores. LastOnY := Year;
  Scores. Stealth := Stealth;
  Scores. Mutation:= Mutation;
  Scores. VirusType:=VirusType;
  Scores. Charm:=Charm;
  Scores.offspring:=offspring;
  Scores.proto:=proto;
  Scores.Dead:=dead;
  Scores.Deleted:=false;
  Scores.Battles:=battles;
  Scores.Originalsize:=originalsize;
end;

procedure FindUser;
var
  Z: Scoreboard;
  f,g,h:Integer;
begin
  g := 0;
  h := 0;
  for f := 1 to 100 do begin;
    seek (Scorefile, f);
    read (Scorefile, z);
    if (z. user = ucase (UserH)) and (not z.deleted) then g := f;
    if (z. deleted) and (h = 0) then h := f;
  end;
  swriteln ('');
  if (g = 0) and (h = 0) then begin;
    swriteln ('Sorry, Full Game Today! Maybe some other time!');
    close(scorefile);
    halt;
  end;
  usernum := g;
  if (g = 0) then begin;
    usernum := h;
    fillchar (Scores, sizeof (Scores), 0);
    Scores. User := ucase (UserH);
    close(scorefile);
    CreateUser; exit;
  end;
  LoadUser;
end;

procedure OpenUserFiles;
var f:byte;
begin
  IF USER_LAST_NAME<>'' then USERH:=USER_FIRST_NAME+' '+USER_LAST_NAME
  else USERH:=USER_FIRST_NAME;
  assign (Scorefile, 'Scores.DAT');
  {$I-}
  reset (Scorefile);
  {$I+}
  if ioresult <> 0 then begin;
    createnews;
    rewrite (Scorefile);
    fillchar (Scores, sizeof (Scores), 0);
    scores.deleted:=TRUE;
    for f := 1 to 101 do write (Scorefile, Scores);
    close(scorefile);
  end;
  reset (Scorefile);
  FindUser;
end;


Procedure Run;
begin
Pipeln('|04You manage to escape|15... |04WUSS|15...');
stop;
end;

Procedure Battle;
var
   Levels:string;
   progtoattack,numofprogs:integer;

Procedure findproto;
begin
SCLRSCR;
Pipeln('|15While skimming the hard drive you come across a file called PROTO.POD');
PIPE('|13Open it? |05');
YESNO('N');
IF Choice='Y' then begin
if random(30)=13 then begin
pipeln('|12Oh no|15!|12 It was infected|15! |12But all you lost was all your');
pipeln('protoplasm pods.');
proto:=0;
end else begin
Pipeln('|15It contains a protoplasm pod! You quickly add it to your collection');
inc(proto); end;
end;
stop;
end;

Procedure goforcharm;
begin
SCLRSCR;
Pipeln('|15While skimming the hard drive you come across a fragmented file called');
pipeln('Samantha.EXE.');
pipe('|13Use one of your battle hours to save her? |05');
YESNO('N');
if choice='Y' then begin
pipeln('|05Samantha tells her sister, Jezebel, and she is pleased. You charm is');
pipeln('growing.');
inc(charm);
end
else begin
Pipeln('|05So much for her!');
end;
stop;
end;

Procedure mutateplus;
begin
Sclrscr;
Pipeln('|15You come across a file called NORTON, and he offers you advice for');
pipeln('1 protoplasm pod.');
pipe('|13Listen to him? |05');
yesno('N');
if choice='N' then begin
Pipeln('|07He thanks you and continues on his way...');
end else begin
if proto<1 then begin
                Pipeln('|04He willingly tells you his secret, but when you go to pay him, you');
                pipeln('realize that you don''t have any pods. He''s not happy and takes all');
                pipeln('your mutation, along with any and all your children.');
                mutation:=0; offspring:=0;
                end else begin
                         Pipeln('|02He tells you the secret ways of his people, ways to mutate just before');
                         pipeln('certain death, regaining all your strength for a second chance at life.');
                         Pipeln('but he warns, it only works once in awhile, and the more mutation you');
                         pipeln('have, the more likely it is to work.');
                         inc(mutation); dec(proto);
                         end;
         end;
stop;
end;




Procedure Infectit;
var randi,rand1,rand2:integer;
begin
 rand1:=random(10);
 if rand1=8 then begin
    crlf(1);
    Pipeln('|15'+progs.progname+'|07 attempts to purge you without success');
    exit;
                 end;
 if rand1=9 then begin
    crlf(1);
    Pipeln('|07You attempt to enhance the program with yourself, but make no progress.');
    exit;
                 end;
 if rand1<4 then begin
    crlf(1);
    if careful then Rand2:=random(progs.maxsize div 2)+1
    else Rand2:=random(progs.maxsize)+1;
    Pipeln('|15'+progs.progname+'|07 succesfully purges |15'+litos(rand2)+'|07 bytes of you.');
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
      pipeln('|04Sorry..... You''ve been killed.. Try again tommorrow..');
      pipeln('|12You hear something.....');
      pipeln('|08"|07'+progs.udeadline+'|08"');
      addnews('|15®|07®|08® |13'+virusname+' |05was killed by |13'+progs.progname+'|05 today.'+
              '|08¯|07¯|15¯');
      addnews('');
      dead:=true; stop; telldead;
                   end;
    exit;
                 end;
 if rand1<8 then begin
    crlf(1);
    Rand2:=random(originalsize)+1;
    Pipeln('|07You successfully enhance |15'+litos(rand2)+'|07 bytes of |15'+progs.progname+'|07.');
    progs.maxsize:=progs.maxsize-rand2;
    if progs.maxsize<1 then begin
      pipeln('|13CONGRATULATIONS! You overwhelmed it!');
      pipeln('|05You hear something.....');
      pipeln('|08"|07'+progs.pdeadline+'|08"');
      originalsize:=originalsize+progs.rewardk;
      size:=size+progs.rewardk;
      inc(filesinfected);
      stop;
    randi:=random(200)+1;
if (randi=77) or (randi=177) or (randi=122) then begin stop; findproto; exit; end;
if randi=50 then begin stop; goforcharm; exit; end;
if randi=20 then begin stop; mutateplus; exit; end;

    exit;
                            end;
                 end;
end;



Procedure Fightit;
var randi:integer;

Procedure bright;
begin
pipeln('|12A|08>|04bandon this file')
end;

begin
randi:=random(200)+1;
if (randi=77) or (randi=177) or (randi=122) then begin stop; findproto; exit; end;
if randi=50 then begin stop; goforcharm; exit; end;
if randi=20 then begin stop; mutateplus; exit; end;
repeat
Pipeln('|05You are currently infecting|15: |13'+progs.progname);
crlf(1);
pipeln('|15I|08)|07nfect this file!');
pipeln('|15V|08>|07iew your stats');
if (stealth=1) and (size<=10) then bright
else if (stealth=2) and (size<=30) then bright
else if (stealth=3) and (size<=50) then bright
else if (stealth=4) and (size<=100) then bright
else if (stealth=5) and (size<=200) then bright
else if (stealth=6) and (size<=400) then bright
else if (stealth=7) and (size<=512) then bright
else if (stealth=8) and (size<=1024) then bright
else if (stealth=9) and (size<=4096) then bright
else if (stealth=10) and (size<=100000) then bright
else if (stealth=11) and (size<=1000000) then bright
else if (stealth=12) and (size<=10000000) then bright
else pipeln('|15A|08>|07bandon this file');
crlf(1);
pipeln('|05You have |13'+litos(size)+' |05bytes of |13'+litos(originalsize)+' |05left.');
pipeln('|05It has |13'+litos(progs.maxsize)+'|05 bytes left.');
crlf(1);
pipe('|12Your Choice|15: |07');
repeat
  SREAD_Char (CHOICE); CHOICE := upcase (CHOICE);
  until pos (choice, #13+'IVA') > 0;
  pipeln (CHOICE);
  case choice of
    #13: infectit;
    'I':  Infectit;
    'V':  Stats;
    'A':  begin RUN; exit; end;
  end;
until (progs.maxsize<=0) or (size<=0);
end;

Procedure Mary;
var
  MARY:string;
begin
SCLRSCR;
Pipeln('|15M|14????');
Pipe('|12What does |15M |12stand for|10? ');
prompt2(mary,5,15,2);
mary:=ucase(mary);
if mary<>'MARY' then exit;
Pipeln('|13Jackpot! That is correct! One more question...');
Pipe('|12What do we think of Mary|10? ');
prompt2(mary,6,15,2);
mary:=ucase(mary);
if mary='BITCH' then begin inc(battles); pipeln('|02Correct|15!'); stop; exit; end;
if mary='BABE' then begin dec(battles); pipeln('|04WRONG|15!'); stop; exit; end;
if mary='SLUT' then begin inc(mutation); pipeln('|02Yes, but only after Matt got to her. :(');
                           stop; exit; end;
if mary='CUTE' then begin inc(proto); pipeln('|03Ehhh.. Yeah..'); stop; exit; end;
if mary='YOUNG' then begin dec(proto); pipeln('|04DUHHHHH...'); stop; exit; end;
if mary='FOXY' then begin dec(mutation); pipeln('|05WRONG|15!'); stop; exit; end;
if mary='CUNT' then begin inc(attacks); inc(battles); inc(proto); inc(mutation);
                           pipeln('JACKPOT!'); stop; exit; end;
Pipeln('|09Sorry|15,|09 You guessed wrong|15,|09 please try again tommorrow|15.');
stop;
end;

begin
{    If Battles<=0 then begin
    Pipeln('|13You have no more battles left today...');
    stop;
    exit;
    end;}
    Str(Stealth,Levels);
    assign (ProgramFile, 'LEVEL'+LEVELS+'.DAT');
    reset (Programfile);
    numofprogs := 0;
    repeat
     inc(numofprogs);
     seek (programfile, numofprogs);
    until eof (programfile);
    numofprogs := numofprogs - 1;
    close (programfile);
    Repeat
     SCLRSCR;
     Reset(ProgramFile);
     progtoattack:=Random(numofprogs)+1;
     seek(programfile,progtoattack);
     read(programfile,progs);
     close(programfile);
     if progs.maxsize>(originalsize div 2) then careful:=true else
     careful:=false;
     SeeBattle;
repeat
  SREAD_Char (CHOICE); CHOICE := upcase (CHOICE);
  until pos (choice, 'SVRLM') > 0;
  pipeln (CHOICE);
  case choice of
    'M':  if not married then begin Mary; married:=true; end;
    'S':  begin if battles<>0 then begin
                                   SCLRSCR;
                                   fightit;
                                   dec(battles);
                                   end else begin
                                            SCLRSCR;
                                            pipeln('|05Sorry, your all done for today!');stop;
                                            end; end;
    'V':  Stats;
    'L':  begin sclrscr; Laugh; end;
    'R':  exit;
  end;
until dead;
end;

procedure Sortit;
begin
  scores.deleted:=true;
  theonetofind:=ucase(stripe(virusname));
  repeat
  findthemnow;
  until foundhim;
  reset(scorefile);
  usernum:=spynum;
  seek(scorefile,usernum);
  write(scorefile,scores);
  close(scorefile);
  GetReadyToSave;
  reset (Scorefile);
  seek (Scorefile, usernum);
  write (Scorefile, Scores);
  close (Scorefile);
  sort;
  reset (Scorefile);
  entering_game := false;
  finduser;
end;

Procedure HighScores;
Var
P:Scoreboard;
xi,yi,zi,XIX,xix2:Byte;
tempo,tempp:string;
toadd:string;
begin
sortit;
reset(scorefile);
XIX:=0;
repeat
INC(XIX);
seek(scorefile,xix);
read(scorefile,p);
until p.deleted;
dec(xix);
SCLRSCR;
tophalf(False);
If xix<=16 then xix2:=xix else xix2:=16;
for zi:=1 to xix2 do begin
seek(scorefile,zi);
read(scorefile,p);
str(p.originalsize,tempo);
tempo:=tempo+' ';
yi:=29-length(tempo);
if p.dead then toadd:='|04D' else toadd:='|02A';
tempp:=dots('|00'+p.virusname+' '+toadd+'|08',yi);
middle(tempp+' '+tempo,zi,FALSE);
end;
bottomhalf(FALSE,FALSE,0);
if xix<=16 then begin
close(scorefile); stop; exit;
end;
tophalf(True);
If xix<=32 then xix2:=xix else xix2:=32;
for zi:=17 to xix2 do begin
seek(scorefile,zi);
read(scorefile,p);
str(p.originalsize,tempo);
tempo:=tempo+' ';
yi:=29-length(tempo);
if p.dead then toadd:='|04D' else toadd:='|02A';
tempp:=dots('|00'+p.virusname+' '+toadd+'|08',yi);
{tempp:=dots('|00'+p.virusname+' |08',yi);}
middle(tempp+' '+tempo,zi-16,TRUE);
end;
IF xix<32 then
bottomhalf(TRUE,TRUE,XIX-11) else
bottomhalf(TRUE,FALSE,0);
if xix<=32 then begin
close(scorefile); SGOTO_XY(1,23); stop; exit;
end;
SGOTO_XY(1,23);
stop;
SCLRSCR;
tophalf(False);
If xix<=48 then xix2:=xix else xix2:=48;
for zi:=33 to xix2 do begin
seek(scorefile,zi);
read(scorefile,p);
str(p.originalsize,tempo);
tempo:=tempo+' ';
yi:=29-length(tempo);
if p.dead then toadd:='|04D' else toadd:='|02A';
tempp:=dots('|00'+p.virusname+' '+toadd+'|08',yi);
middle(tempp+' '+tempo,zi,FALSE);
end;
bottomhalf(FALSE,FALSE,0);
if xix<=48 then begin
close(scorefile); stop; exit;
end;
tophalf(True);
If xix<=64 then xix2:=xix else xix2:=64;
for zi:=49 to xix2 do begin
seek(scorefile,zi);
read(scorefile,p);
str(p.originalsize,tempo);
tempo:=tempo+' ';
yi:=29-length(tempo);
if p.dead then toadd:='|04D' else toadd:='|02A';
tempp:=dots('|00'+p.virusname+' '+toadd+'|08',yi);
middle(tempp+' '+tempo,zi-48,TRUE);
end;
IF xix<64 then
bottomhalf(TRUE,TRUE,XIX-43) else
bottomhalf(TRUE,FALSE,0);
if xix<=64 then begin
close(scorefile); SGOTO_XY(1,23); stop; exit;
end;
SGOTO_XY(1,23);
stop;
SCLRSCR;
tophalf(False);
If xix<=80 then xix2:=xix else xix2:=80;
for zi:=65 to xix2 do begin
seek(scorefile,zi);
read(scorefile,p);
str(p.originalsize,tempo);
tempo:=tempo+' ';
yi:=29-length(tempo);
if p.dead then toadd:='|04D' else toadd:='|02A';
tempp:=dots('|00'+p.virusname+' '+toadd+'|08',yi);
middle(tempp+' '+tempo,zi,FALSE);
end;
bottomhalf(FALSE,FALSE,0);
if xix<=80 then begin
close(scorefile); stop; exit;
end;
tophalf(True);
If xix<=96 then xix2:=xix else xix2:=96;
for zi:=81 to xix2 do begin
seek(scorefile,zi);
read(scorefile,p);
str(p.originalsize,tempo);
tempo:=tempo+' ';
yi:=29-length(tempo);
if p.dead then toadd:='|04D' else toadd:='|02A';
tempp:=dots('|00'+p.virusname+' '+toadd+'|08',yi);
middle(tempp+' '+tempo,zi-80,TRUE);
end;
IF xix<96 then
bottomhalf(TRUE,TRUE,XIX-75) else
bottomhalf(TRUE,FALSE,0);
if xix<=200 then begin
close(scorefile); SGOTO_XY(1,23); stop; end;
end;


Procedure Attack;
var randi:integer;

Procedure bright;
begin
pipeln('|12A|08>|04bandon this attack')
end;

Procedure gonow;
begin
repeat
Pipeln('|05You are currently attacking|15: |13'+k.virusname);
crlf(1);
pipeln('|15E|08)|07nslave this virus!');
pipeln('|15V|08>|07iew your stats');
if (stealth=1) and (size<=10) then bright
else if (stealth=2) and (size<=30) then bright
else if (stealth=3) and (size<=50) then bright
else if (stealth=4) and (size<=100) then bright
else if (stealth=5) and (size<=200) then bright
else if (stealth=6) and (size<=400) then bright
else if (stealth=7) and (size<=512) then bright
else if (stealth=8) and (size<=1024) then bright
else if (stealth=9) and (size<=4096) then bright
else if (stealth=10) and (size<=100000) then bright
else if (stealth=11) and (size<=1000000) then bright
else if (stealth=12) and (size<=10000000) then bright
else pipeln('|15A|08>|07bandon this attack');
crlf(1);
pipeln('|05You have |13'+litos(size)+' |05bytes of |13'+litos(originalsize)+' |05left.');
pipeln('|05It has |13'+litos(k.size)+'|05 bytes left.');
crlf(1);
pipe('|12Your Choice|15: |07');
repeat
  SREAD_Char (CHOICE); CHOICE := upcase (CHOICE);
  until pos (choice, #13+'EVA') > 0;
  pipeln (CHOICE);
  case choice of
    #13:  infection;
    'E':  Infection;
    'V':  Stats;
    'A':  begin RUN; exit; end;
  end;
until (k.dead) or (dead);
if dead then telldead;
if ((not dead) and (k.proto>1)) then begin
CRLF(1);
Pipeln('|13You see something on the ground|15....');
stop;
Pipeln('|13It''s |15'+litos(k.proto)+' |13protoplasm pods, you quickly grab them|15!');
proto:=proto+k.proto;
k.proto:=0;
stop;
end;
end;



begin
{    If Battles<=0 then begin
    Pipeln('|13You have no more battles left today...');
    stop;
    exit;    Don't need this part, works better other way.
    end; }
    Repeat
     SCLRSCR;
     Pipeln('|07You have |15'+litos(attacks)+'|07 attacks left today.');
     Pipeln('|07You have |15'+litos(size)+'|07 of |15'+litos(originalsize)+'|07 bytes left.');
     Crlf(1);
     Pipeln('|15P|08)|07ick a fight with other virii');
     Pipeln('|15V|08)|07iew your status');
     Pipeln('|15L|08)|07augh');
     Pipeln('|15R|08)|07eturn to main');
crlf(1);
pipe('|12Your Choice|15: |07');
repeat
  SREAD_Char (CHOICE); CHOICE := upcase (CHOICE);
  until pos (choice, 'PVRL') > 0;
  pipeln (CHOICE);
  case choice of
    'P':  begin if attacks<>0 then begin
                                   Pipe('|13Who would you like to fight|15: ');
                                   Prompt2(theonetofind,30,15,5);
                                   if ucase(theonetofind)=ucase(stripe(virusname)) then begin
                                   Pipeln('|14Kill yourself|15? |14Odd|15!');
                                   addnews('|07Read All About it|08:');
                                   addnews('|20|15'+virusname+'|00 is suicidal|15!|16');
                                   addnews(''); stop;
                                   exit; end;
                                   findthemnow;
                                   if foundhim=false then begin
                                      Pipeln('Sorry, Can''t find that person.');
                                      stop; exit; end;
                                   reset(scorefile);
                                   seek(scorefile,spynum);
                                   read(scorefile,k);
                                   close(scorefile);
                                   if k.dead then begin
                                      Pipeln('|04Sorry, but that virus is dead already.');
                                      stop;
                                      exit; end;
                                   if (k.stealth<stealth) and (k.originalsize<originalsize) then begin
                                      Pipeln('|05Pick on someone your own size!');
                                      stop;
                                      exit; end;
                                   k.size:=k.originalsize;
                                   gonow;
                                   dec(attacks);
                                   end else begin
                                            pipeln('|05Sorry, your all done for today!');stop;
                                            end; end;
    'V':  Stats;
    'L':  Laugh;
    'R':  exit;
  end;
until dead;
end;





Procedure GrowUp;

Procedure Level2;
begin
If originalsize>=128 then begin
SCLRSCR;
if wrongguess then begin
Pipeln('|04Sorry, One riddle a day!');
stop;
exit;
end;
if not wrongguess then askriddle;
if gotit then begin
pipeln('|15YIPEE|07! |11You are worthy of growth!');
pipeln('Your Stealth will be increased to the second level!');
pipeln('|03You new goal is to infect Virus scanners, before they get you!');
inc(attacks);
STEALTH:=2;
addnews('|15'+Virusname+' |05made it to level 2 today|15!');
addnews('');
stop;
end;
end
else begin
SCLRSCR;
pipeln('|04Sorry, you are not worth of growth yet, you need '+
LITOS(128-originalsize)+' bytes more.');
pipeln('|12Your current goal is to infect Communications software, so that nobody');
pipeln('can download a virus scanner.');
stop;
end;
end;


Procedure Level3;
begin
If originalsize>=256 then begin
SCLRSCR;
if wrongguess then begin
Pipeln('|04Sorry, One riddle a day!');
stop;
exit;
end;
if not wrongguess then askriddle;
If gotit then begin
pipeln('|15YIPEE|07! |11You are worthy of growth!');
pipeln('Your Stealth will be increased to the third level!');
pipeln('|03You new goal is to capture common Virii and use them as slaves!');
inc(attacks);
STEALTH:=3;
Addnews('|15'+Virusname+' |05made it to level 3 today|15!');
addnews('');
stop;
end;
end
else begin
SCLRSCR;
pipeln('|04Sorry, you are not worth of growth yet, you need '+
LITOS(256-originalsize)+' bytes more.');
pipeln('|12Your current goal is to infect Virii scanners so that you can kill safely.');
stop;
end;
end;

Procedure Level4;
begin
If originalsize>=512 then begin
SCLRSCR;
if wrongguess then begin
Pipeln('|04Sorry, One riddle a day!');
stop;
end;
if not wrongguess then askriddle;
If gotit then begin
pipeln('|15YIPEE|07! |11You are worthy of growth!');
pipeln('Your Stealth will be increased to the fourth level!');
pipeln('|03You new goal is to infect Device drivers, and wreak havok on the system.');
inc(attacks);
STEALTH:=4;
Addnews('|15'+virusname+' |05made it to level 4 today|15!');
addnews('');
stop;
end;
end
else begin
SCLRSCR;
pipeln('|04Sorry, you are not worth of growth yet, you need '+
LITOS(512-originalsize)+' bytes more.');
pipeln('|12Your current goal is to capture common Virii and use them as slaves!');
stop;
end;
end;

Procedure Level5;
begin
If originalsize>=1024 then begin
SCLRSCR;
if wrongguess then begin
Pipeln('|04Sorry, One guess per day!');
stop;
end;
if not wrongguess then askriddle;
If gotit then begin
pipeln('|15YIPEE|07! |11You are worthy of growth!');
pipeln('Your Stealth will be increased to the fifth level!');
pipeln('|03You new goal is to infect Web Browsers, so nobody can get to the internet');
pipeln('from your machine.');
inc(attacks);
STEALTH:=5;
Addnews('|15'+virusname+' |05made it to level 5 today|15!');
addnews('');
stop;
end;
end
else begin
SCLRSCR;
pipeln('|04Sorry, you are not worth of growth yet, you need '+
LITOS(1024-originalsize)+' bytes more.');
pipeln('|12Your current goal is to infect Device Drivers, and wreak havok on the');
pipeln('system.');
stop;
end;
end;


Procedure Level6;
begin
If originalsize>=2048 then begin
SCLRSCR;
if wrongguess then begin
Pipeln('|04Sorry, One guess per day!');
stop;
end;
if not wrongguess then askriddle;
if gotit then begin
pipeln('|15YIPEE|07! |11You are worthy of growth!');
pipeln('Your Stealth will be increased to the sixth level!');
pipeln('|03You new goal is to conquere Boot Sector Virii and use them as slaves!');
inc(attacks);
STEALTH:=6;
Addnews('|15'+virusname+' |05made it to level 6 today|15!');
addnews('');
stop;
end;
end
else begin
SCLRSCR;
pipeln('|04Sorry, you are not worth of growth yet, you need '+
LITOS(2048-originalsize)+' bytes more.');
pipeln('|12Your current goal is to infect Web Browsers, so nobody can get to the');
pipeln('Internet from your machine.');
stop;
end;
end;

Procedure Level7;
begin
If originalsize>=4096 then begin
SCLRSCR;
if wrongguess then begin
Pipeln('|04Sorry, One guess per day!');
stop;
end;
if not wrongguess then askriddle;;
if gotit then begin
pipeln('|15YIPEE|07! |11You are worthy of growth!');
pipeln('Your Stealth will be increased to the seventh level!');
pipeln('|03You new goal is to infect Games, and let everyone know about you!');
inc(attacks);
STEALTH:=7;
Addnews('|15'+virusname+' |05made it to level 7 today|15!');
addnews('');
stop;
end;
end
else begin
SCLRSCR;
pipeln('|04Sorry, you are not worth of growth yet, you need '+
LITOS(4096-originalsize)+' bytes more.');
pipeln('|12Your current goal is to conquere Boot Sector Virii and use them as');
pipeln('slaves!');
stop;
end;
end;

Procedure Level8;
begin
If originalsize>=10000 then begin
SCLRSCR;
if wrongguess then begin
Pipeln('|04Sorry, One guess per day!');
stop;
end;
if not wrongguess then askriddle;
If gotit then begin
pipeln('|15YIPEE|07! |11You are worthy of growth!');
pipeln('Your Stealth will be increased to the eighth level!');
pipeln('|03You new goal is to infect Utility Programs!');
inc(attacks);
STEALTH:=8;
Addnews('|15'+virusname+' |05made it to level 8 today|15!');
Addnews('');
stop;
end;
end
else begin
SCLRSCR;
pipeln('|04Sorry, you are not worth of growth yet, you need '+
LITOS(10000-originalsize)+' bytes more.');
pipeln('|12Your current goal is to infect Games, and let everyone know about you!');
stop;
end;
end;

Procedure Level9;
begin
If originalsize>=100000 then begin
SCLRSCR;
if wrongguess then begin
Pipeln('|04Sorry, One guess per day!');
stop;
end;
if not wrongguess then askriddle;;
if gotit then begin
pipeln('|15YIPEE|07! |11You are worthy of growth!');
pipeln('Your Stealth will be increased to the ninenth level!');
pipeln('|03You new goal is to conquere File Virii and use them as slaves!');
inc(attacks);
STEALTH:=9;
Addnews('|15'+virusname+' |05made it to level 9 today|15!');
addnews('');
stop;
end;
end
else begin
SCLRSCR;
pipeln('|04Sorry, you are not worth of growth yet, you need '+
LITOS(100000-originalsize)+' bytes more.');
pipeln('|12Your current goal is to infect Utility Programs!');
stop;
end;
end;

Procedure Level10;
begin
If originalsize>=1000000 then begin
SCLRSCR;
if wrongguess then begin
Pipeln('|04Sorry, One guess per day!');
stop;
end;
if not wrongguess then askriddle;
if gotit then begin
pipeln('|15YIPEE|07! |11You are worthy of growth!');
pipeln('Your Stealth will be increased to the tenth level!');
pipeln('|03You new goal is to infect Word Processors and make life unproductive!');
inc(attacks);
STEALTH:=10;
Addnews('|15'+virusname+' |05made it to level 10 today|15!');
addnews('');
stop;
end;
end
else begin
SCLRSCR;
pipeln('|04Sorry, you are not worth of growth yet, you need '+
LITOS(1000000-originalsize)+' bytes more.');
pipeln('|12Your current goal is to conquere File Virii and use them as slaves!');
stop;
end;
end;

Procedure Level11;
begin
If originalsize>=10000000 then begin
SCLRSCR;
if wrongguess then begin
Pipeln('|04Sorry, One guess per day!');
stop;
end;
if not wrongguess then askriddle;
if gotit then begin
pipeln('|15YIPEE|07! |11You are worthy of growth!');
pipeln('Your Stealth will be increased to the eleventh level!');
pipeln('|03You new goal is to infect BBS Software, and make life boring and dull!');
inc(attacks);
STEALTH:=11;
Addnews('|15'+virusname+' |05made it to level 11 today|15!');
addnews('');
stop;
end;
end
else begin
SCLRSCR;
pipeln('|04Sorry, you are not worth of growth yet, you need '+
LITOS(10000000-originalsize)+' bytes more.');
pipeln('|12Your current goal is to infect Word Processors and make life unproductive!');
stop;
end;
end;

Procedure Level12;
begin
If originalsize>=100000000 then begin
SCLRSCR;
if wrongguess then begin
Pipeln('|04Sorry, One guess per day!');
stop;
end;
if not wrongguess then askriddle;
if gotit then begin
pipeln('|15YIPEE|07! |11You are worthy of growth!');
pipeln('Your Stealth will be increased to the 12th level!');
pipeln('|03You final goal is to infect Operating Systems, and leave nothing behind!');
inc(attacks);
STEALTH:=12;
Addnews('|12'+virusname+' |13made it level |1412 |13today|10!!!!');
addnews('');
stop;
end;
end
else begin
SCLRSCR;
pipeln('|04Sorry, you are not worth of growth yet, you need '+
LITOS(100000000-originalsize)+' bytes more.');
pipeln('|12Your current goal is to infect BBS Software, and make life boring');
pipeln('and dull!');
stop;
end;
end;


begin
Case Stealth of
  10:level11;
  11:level12;
  1:Level2;
  2:Level3;
  3:Level4;
  4:Level5;
  5:level6;
  6:level7;
  7:level8;
  8:level9;
  9:level10;
end;
end;


Procedure Spy;
Begin
  sclrscr;
  If proto < 5 Then Begin PIPELN ('|12This option cost''s 5 protoplasm pods and you don''t have that much!');
    stop;
  End Else Begin
    PIPELN ('|13Ok, I''ll give you someone elses stats for 5 protoplasm pods.');
    PIPE ('|15Who would you like to spy on: ');
    Prompt2(TheOneToFind, 25, 15, 5);
    If Length (TheOneToFind) < 2 Then Begin
      stop;
    End Else Begin
      findthemnow;
      If foundhim = False Then Begin
        pipeln ('|15Sorry, I couldn''t Find that person');
        stop;
      End Else Begin
        reset(scorefile);
        Seek (ScoreFile, spynum);
        Read (Scorefile, k);
        close(scorefile);
        pipeln ('|13' + uplow (TheOneToFind) + '  |15#' + litos (spynum) );
        proto := proto - 5;
        PIPELN ('|15RealName|05: |07' + k. user );
        PIPELN ('|15Size|05: |07' + litos (k. size) );
        pipeln ('|15Last On|05: |07' + litos (k. lastonm)+'/'+litos(k.lastond)+
                                              '/'+litos(k.lastony));
        pipeln ('|15Protoplasm Pods|05: |07' + litos (k. proto) );
        stop;
      End;
    End;
  End;
End;

Procedure Transfers;  { Transfer Protoplasm }
var howmany:integer;
Begin
  sclrscr;
  If proto < 2 Then Begin PIPELN ('|12This option cost''s 1 protoplasm pod and you either don''t have that much'+
                                  ' or you only have 1, hence, none to give out.');
    stop;
  End Else Begin
    PIPELN ('|13Ok, I''ll transfer your pods for 1 protoplasm pod.');
    PIPE ('|15Who would you like to transfer to: ');
    Prompt2(TheOneToFind, 25, 15, 5);
    If Length (TheOneToFind) < 2 Then Begin
      stop;
    End Else Begin
      if theonetofind=stripe(virusname) then begin
      Pipeln('|07Why are you transfering them to yourself? Fool.');
      stop;
      end else begin
      findthemnow;
      If foundhim = False Then Begin
        pipeln ('|15Sorry, I couldn''t Find that person');
        stop;
      End Else Begin
        Pipe('|13Ok, How many can they have |15[|05MAX. '+litos(proto-1)+'|15]|08: ');
        sread_num(howmany);
        if howmany>proto-1 then begin
               Pipeln('|04You don''t have that many.');
               stop;
               end else begin
        reset(scorefile);
        Seek (ScoreFile, spynum);
        Read (Scorefile, k);
        proto := proto - 1;
        proto := proto - howmany;
        k.proto := k.proto +howmany;
        seek(scorefile,spynum);
        write(scorefile,k);
        close(scorefile);
        makeevent(theonetofind,virusname,'Protoplasm!','My Friend! I just transfered '+litos(howmany)+
                                        ' protoplams pods to you. ENJOY!');
        Pipeln('|15Success!');
        stop;
      End;
    End;
  End;
End;
End;
end;




Procedure Sewer;
var
Donesewer:boolean;
DIE:TEXT;
begin
donesewer:=false;
repeat
showsewer;
    repeat
      SREAD_Char (CHOICE); CHOICE := upcase (CHOICE);
    until pos (choice, '!RFECASDMTV') > 0;
    pipeln (CHOICE);crlf(1);
    DELAY(100);
    case choice of
    'F': begin case upcase(sex) of
         'M': FlirtJ;
         'F': FlirtB;
         end;
         end;
    'E': ExchangePPP;
    'C': StartBarTalk;
    'A': Growup;
    'S': Spy;
    'D': ShowNews;
    'M': MakeAnnouncement;
    'V': Stats;
    'R': Donesewer:=true;
    'T': transfers;
end;
until donesewer;
end;

procedure myexit;
begin
  Sortit;
  HighScores;
  CRLF (1);
  pipeln ('                      |05Jezebel awaits your return|15!');
  CRLF (1);
  delay (400);
  pipe ('|13Jezebel |05is falling asleep. Please wait, |05' + virusname );
  delay (400);
  pipe (' |15.');
  delay (400);
  pipe (' |13.');
  delay (400);
  pipe (' |05.');
  delay (400);
  pipeln (' |07ZzZzZzZz |08!');
  CRLF (1);
  pipeln ('|13Returning to |15' + UpLow (Board_NAME) + '|13.')
end;

Procedure AboutAuthor;
begin
SCLRSCR;
Pipeln('|15You found a hidden command!!!');
stop;
pipeln('|14About The Author....');
pipeln('|12Brian Jeremy Schulteis was born December 13th, 1977 in Texas.');
Pipeln('|10He now lives in Port Orchard, Washington with his father.');
pipeln('|11He has a younger sister, am older brother in California, a little baby bro,');
pipeln('|13and an older sister in ???Hell???. This game was written in');
pipeln('|15November 1996. It was started in August 1996, but was put off');
pipeln('|09for a few months. This game was programmed on a 486sx/25 with');
pipeln('|14only 2 megs of ram, and an 80 meg hard drive. This game was');
pipeln('|12compiled with Turbo Pascal 7.0 and the DDPlus door driver.');
pipeln('|10Jason Kessler helped with the game by finding bugs, giving ideas');
pipeln('|13and making most of the levels. Zodian Software was started by');
pipeln('|11Brian Schulteis in early 1995. The name was chosen from his BBS');
pipeln('|15which was called Planet Zod. He got the name "Planet Zod" from');
pipeln('|09a radio commercial talking about a guy named Lars, who had a');
pipeln('|14planet called Zod. He let everyone drink and smoke there, and');
pipeln('|12Brian loved the commercial, so he named his BBS Planet Zod.');
pipeln('|10Two more things: One, Don''t drink, it''s bad for you. and second,');
pipeln('|13LEGALIZE MARIJUANA.. |03;|04)|15  Thanks for playing Jezebel, Now back to the game!');
stop;
pipeln('|15New! |10This info added December 15th, 1997. I am working on putting');
pipeln('|13a BBS back online, only got one registration for this game, so recompiled');
pipeln('|10it as freeware. This time I have a real job, got a real computer, and have');
pipeln('|11considered converting this game to Java and putting it on the net, not');
pipeln('|14sure if that will actually happen or not, but we''ll see. Enjoy the game');
stop;
end;


Procedure MainMenu;
Var
    Choice:Char;
begin
Checkmail;
if dead then timetoexit:=true;
if dead then exit;
showmain;
    repeat
      SREAD_Char (CHOICE); CHOICE := upcase (CHOICE);
    until pos (choice, '*?WLBAVSQ') > 0;
    pipeln (CHOICE);crlf(1);
    case choice of
      '?': begin sclrscr; DisplayFile('Instruct.DOC'); stop; end;
      'W': begin SCLRSCR; SendMail; end;
      'L': HIGHSCORES;
      'B': Battle;
      'A': Attack;
      'V': Stats;
      'S': Sewer;
      '*': AboutAuthor;
      'Q': TimeToExit:=True;
    end;
end;

procedure opendllfile;
var dllfile:text;
    crap:string;
    dy,mnth:word;
    ig:byte;

procedure createdllfile;
var ig:byte;
begin
rewrite(dllfile);
writeln(dllfile,day);
writeln(dllfile,month);
close(dllfile);
end;

begin
if exist('MAINT.DAT') then begin
assign(dllfile,'MAINT.DAT');
reset(dllfile);
readln(dllfile,dy);
readln(dllfile,mnth);
if mnth<>month then begin crlf(1);
                          pipeln('|03Running Maintenance|15....');
                          maint;
                    end
else
if dy<>day then begin crlf(1);
                      pipeln('|03Running Maintenance|15....');
                      maint;
                end;
close(dllfile);
createdllfile;
                                        end else begin
assign(dllfile,'MAINT.DAT');
createdllfile;

                                    end;
end;


Begin
  OvrInit('Jezebel.OVR');
 if OvrResult <> ovrOk then
 begin
   case OvrResult of
     ovrError: Writeln('Program has no overlays.');
     ovrNotFound: Writeln('Overlay file not found.');
   end;
  HALT(1);
 end;
  If paramcount=0 then begin
  Showhelp;
  halt;
  end;
  getdate (year, month, day, Tday);
  Entering_Game := true;
{  SaveExitProc:=Exitproc;
  ExitProc:=@MyExit1;}
  InitDoorDriver('Jezebel.CTL');
  If EMSOK then ovrinitems;
  STATfore := 15;
  STATback := 5;
  progname := 'Jezebel - Version 1.3';
  PIZZa:=true;
  randomize;
  SCLRSCR;
  intro;
  SGOTO_XY(55,17);
  stop;
  SCLRSCR;
  opendllfile;
  openuserfiles;
  shownews;
  if dead then telldead;
  TimeToExit:=False;
  Repeat
  mainmenu;
  Until timeToExit;
  myexit;
end.