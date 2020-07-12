Program Jezebel_Cfg;

Uses MakeLvl, CfgWay, Crt, CrtKit, Dos, ddovr2;

Var
  doneconfig,Doneatmain:boolean;
  configfile:text;

{ Converts a String to all uppercase }
function ucase (tempstr: string): string;
var
  i : integer;
begin
  for i := 1 to length (tempstr) do tempstr [i] := upcase (tempstr [i] );
  ucase := tempstr;
end;

Procedure EditConfigFile;
Var
  newBBS,BBSName,NewSysop,SysopName,DropFile,newspeed,Speed:String;
  newdrop,software,sparebyte:byte;
  spareword,maxtimein:word;
  nofossilinit,spareboolean,fossil,digi:boolean;
  spareinteger:integer;
  sparelongint,lockspeed:longint;
  UseDatFossil,sysopfirst,sysoplast,bname,sparestring:string;



Procedure ChangeBBS;
begin
clrscr;
Pipeln('|07Your BBS name is|08: |15'+BName);
Pipe('|14What do you want to change it to|15? |07');
Readln(newBBS);
Pipe('|15Is |07'+newbbs+'|15 ok? |13');
If yesno('N')='Y' then BName:=NewBBS;
end;

Procedure ChangeSysopFirst;
begin
clrscr;
Pipeln('|07Your First name is|08: |15'+SysopFirst);
Pipe('|14What do you want to change it to|15? |07');
Readln(newSysop);
Pipe('|15Is |07'+newsysop+'|15 ok? |13');
If yesno('N')='Y' then SysopFirst:=NewSysop;
end;

Procedure ChangeSysopLast;
begin
clrscr;
Pipeln('|07Your Last name is|08: |15'+SysopFirst);
Pipe('|14What do you want to change it to|15? |07');
Readln(newSysop);
Pipe('|15Is |07'+newsysop+'|15 ok? |13');
If yesno('N')='Y' then SysopLast:=NewSysop;
end;

Procedure ChangeDrop;
begin
clrscr;
Pipeln('|07Your Dropfile is currently set as|08: |15'+Uplow(DropFile));
Pipeln('|13Jezebel |15Sysop Configuration Editor |07- |14Drop File');
Pipeln('|05ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ');
Pipeln('|07(|153|07)  |13Quick-BBS (DorinfoX.def)');
Pipeln('|07(|154|07)  |13Pc-Board Ver. 12.0');
Pipeln('|07(|155|07)  |13WWIV (World War 4)');
Pipeln('|07(|156|07)  |13Pc-Board Ver. 15+');
Pipeln('|07(|157|07)  |13RBBS (DorinfoX.def)');
Pipeln('|07(|158|07)  |13Pheonix');
Pipeln('|07(|159|07)  |13Dorinfo1.def (for boards that use 1 for all nodes)');
Pipeln('|07(|1510|07) |13Pc-Board Ver. 14');
Pipeln('|07(|1511|07) |15Generic DOOR.SYS');
Pipeln('|07(|1512|07) |13SpitFire (SFDoors.DAT)');
Pipeln('|07(|1513|07) |132AM');
Pipeln('|07(|1514|07) |13Tri-BBS');
Pipeln('|05ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ');
repeat
Pipe('|13What do you want to change it to|15? |07');
Readln(newdrop);
until (newdrop>2) and (newdrop<15);
software:=NewDrop;
end;

Procedure ChangeFossil;
begin
ClrScr;
Pipe('|15Do you have a DigiBoard|07? ');
if yesno('N')='Y' then begin DIGI:=TRUE; FOSSIL:=False; NOFOSSILINIT:=TRUE; exit; end;
Pipeln('|15Windows 95 with WinFossil, or OS/2 Warp with SIO|07:');
Pipe('|15Use Extended Fossil features|07? ');
if yesno('Y')='Y' then begin DIGI:=FALSE; FOSSIL:=TRUE; NOFOSSILINIT:=TRUE; exit; end;
Pipe('|15Do you want to use standard fossil features (X00 & BNU)|07? ');
if yesno('Y')='Y' then begin DIGI:=FALSE; FOSSIL:=TRUE; NOFOSSILINIT:=FALSE; exit; end;
PIPELN('|14Ok, Sim-BBS doesn''t HAVE to have a fossil...');
DIGI:=FALSE;FOSSIL:=FALSE;NOFOSSILINIT:=TRUE;
end;


Procedure ChangeSpeed;
begin
clrscr;
Pipeln('|07Your Port is currently set to be locked at|08: |15'+itos(Lockspeed));
Pipeln('');
Pipeln('|02Please choose one of the below|08:');
Pipeln('|1419200');
Writeln('38400');
Writeln('57600');
Writeln('115200');
Pipeln('Or.. 0 if you don''t lock your port for some reason.');
writeln;
repeat
Pipe('|10What do you want to lock your port at|15? |07');
Readln(newspeed);
until (newspeed='0') or (newspeed='19200') or (newspeed='38400') or
      (newspeed='57600') or (newspeed='115200');
Pipe('|15Is |07'+newspeed+'|15 ok? |13');
If yesno('N')='Y' then Val(Newspeed,lockspeed,spareinteger);
end;

Procedure Choosedrop;
begin
Case software of
  3:dropfile:='QUICK';
  4:dropfile:='PCB12';
  5:dropfile:='WWIV';
  6:dropfile:='PCB15';
  7:dropfile:='RBBS';
  8:dropfile:='PHOENIX';
  9:dropfile:='DORINFO1';
  10:dropfile:='PCB14';
  11:dropfile:='DOORSYS';
  12:dropfile:='SPITFIRE';
  13:dropfile:='2AM';
  14:dropfile:='TRIBBS';
end;
end;

Procedure ChooseFossil;
begin
if digi then begin UseDatFossil:='DigiBoard'; exit; end;
IF not fossil then begin UseDatFossil:='No'; exit; end;
if (nofossilinit) then begin UseDatFossil:='Extended Fossil'; exit; end;
if (fossil) then begin UseDatFossil:='Fossil'; exit; end;
UseDatFossil:='No Fossil';
end;

Procedure doname;
begin
Writeln(configfile,'; -= Jezebel Configuration File =-');
writeln(configfile,'; Thank you for trying out this wonderful game that I put many many');
writeln(configfile,'; hours into. This game is well tested, but may still have bugs, so please');
writeln(configfile,'; let me know if you find any. Check for new versions at:');
writeln(configfile,'; HTTP://home.onestop.net/zodian');
writeln(configfile,'; or Email me at:');
writeln(configfile,'; UnaBonger@Budsters.com    Thanks.');
writeln(configfile,'; -= Jezebel Configuration File =-');
Writeln(configfile,'BBSNAME '+bname);
end;

Procedure Dofirst;
begin
writeln(configfile,'SYSOPFIRST '+sysopfirst);
end;

Procedure DoLast;
begin
Writeln(configfile,'SYSOPLAST '+sysoplast);
end;

Procedure DoSoftware;
begin
Writeln(configfile,'BBSType '+dropfile);
end;

Procedure DoLocked;
begin
if lockspeed=0 then exit;
writeln(configfile,'LOCKBAUD '+itos(lockspeed));
end;

Procedure DoFossil;
begin
If digi then begin
writeln(configfile,'DIGI');
exit; end;
If not fossil then exit;
If nofossilinit then begin
Writeln(configfile,'XFOSSIL');
exit; end;
If fossil then begin
Writeln(configfile,'FOSSIL');
exit; end;
end;

begin
Loadconfig('jezebel.ctl',software,sparestring,sparestring,spareword,spareinteger,
           sparebyte,sparelongint,sparebyte,spareboolean,sparebyte,
           spareboolean,spareboolean,NoFossilInit,bname,sparestring,sysopfirst,
           sysoplast,maxtimein,spareboolean,sparebyte,sparebyte,spareboolean,
           spareboolean,spareboolean,spareboolean,fossil,digi,sparestring,sparebyte,
           lockspeed,spareboolean,spareword,spareword,spareword,spareword,sparebyte,
           sparebyte,sparebyte,sparebyte);
doneconfig:=false;
repeat
CLRSCR;
usedatfossil:='';
choosefossil;
choosedrop;
Pipeln('|13Jezebel |15Sysop Configuration Editor |07- |14Config File');
Pipeln('|15ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ');
Pipeln('   |15(|131|15) |07BBS Name|08: |15'+Bname);
PIPELN('   |15(|132|15) |07Sysop First Name|08: |15'+SysopFirst);
Pipeln('   |15(|133|15) |07Sysop Last Name|08:  |15'+SysopLast);
Pipeln('   |15(|134|15) |07BBS Software|08: |15'+uplow(dropfile));
Pipeln('   |15(|135|15) |07Locked Port Speed|08: |15'+itos(LockSpeed));
Pipeln('   |15(|136|15) |07Use Fossil|08? |15'+UseDatFossil);
Pipeln('   |15(|13Q|15) |07Quit to Main');
Pipeln('|15ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ');
Pipe('|04Your Choice|15: |12');
repeat
repeat until keypressed;
choice:=readkey;
    choice:=upcase(Choice);
    Until Pos (choice, '123456Q?') > 0;
    pipeln (CHOICE);
    Case Choice Of
      '1': ChangeBBS;
      '2': ChangeSysopFirst;
      '3': ChangeSysopLast;
      '4': ChangeDrop;
      '5': ChangeSpeed;
      '6': ChangeFossil;
      'Q': doneconfig := True;
    End;
if not doneconfig then stop;
Until doneconfig;
PIPE('|12Save Config file|15? ');
IF YESNO('Y')='Y' then begin
assign(configfile,'jezebel.ctl');
rewrite(configfile);
doname;
dofirst;
dolast;
dosoftware;
dolocked;
dofossil;
close(configfile); end;
end;

Procedure EditRiddles;
var totals,ridnum:integer;
    i:byte;
    guess:string;
    rid:riddles;
    ridfile:file of riddles;
    Bleh:string;
    Yup:integer;
    newsoftwarename:string[20];
    newmaxnodes,newprice:longint;
    mustsave,donez:boolean;



Procedure ChangeText;
Var Yup:integer;
begin
clrscr;
if length(rid.lines[1])>2 then begin
Pipeln('|07This Riddle Currently Reads|08: |15');
For Yup:=1 to 10 do if length(rid.lines[yup])>2 then Pipeln(rid.lines[yup]);
end;
Pipe('|15Change|13? |05');
if yesno('N')='Y' then begin
Pipeln('|10Enter New Text: |07');
For Yup:=1 to 10 do begin
changed:=true;
Pipe('|05'+itos(yup)+'> |13');
Readln(rid.lines[yup]); if rid.lines[yup]='' then break; end; end;
end;

Procedure ChangeClue;
begin
clrscr;
if rid.clue<>'' then
Pipeln('|07Current Clue is|08: |15'+rid.clue);
Pipe('|10Enter New Clue|02: |07');
Readln(bleh);
bleh:=ucase(bleh);
Pipe('|15Is |07'+bleh+'|15 ok? |13');
If yesno('N')='Y' then begin rid.clue:=bleh; changed:=true; end;
end;

Procedure ChangeAnswer;
begin
clrscr;
if rid.answer<>'' then
Pipeln('|07Current Answer is|08: |15'+rid.clue);
Pipe('|10Enter New Answer|02: |07');
Readln(bleh);
bleh:=ucase(bleh);
Pipe('|15Is |07'+bleh+'|15 ok? |13');
If yesno('N')='Y' then begin rid.answer:=bleh; changed:=true; end;
end;

Procedure Next;
Var Yup:integer;
begin
If Changed then begin Pipe('|13Changed, Save|15? |05');
if yesno('Y')='Y' then begin
seek(ridfile,ridnum);
write(ridfile,rid); end; end;
if mustsave then begin seek(ridfile,ridnum); write(ridfile,rid); end;
inc(ridnum); if ridnum>totals then begin inc(totals); mustsave:=true; end;
seek(ridfile,ridnum);
if not eof(ridfile) then read(ridfile,rid)
else begin
   For Yup:=1 to 10 do rid.lines[yup]:='';
   rid.answer:='';
   rid.clue:='';
end;
end;

Procedure Previous;
Begin
If changed then begin Pipe('|13Changed, Save|15? |05');
if yesno('Y')='Y' then begin
seek(ridfile,ridnum);
write(ridfile,rid);
end; end;
if ridnum<1 then dec(ridnum);
seek(ridfile,ridnum);
read(ridfile,rid);
end;


begin
assign(ridfile,'RIDDLES.DAT');
reset(ridfile);
i:=0;
Repeat
seek(ridfile,i);
read(ridfile,rid);
inc(i);
until eof(ridfile);
ridnum:=1;
seek(ridfile,ridnum);
read(ridfile,rid);
totals:=i;
donez:=false;
repeat
CLRSCR;
Pipeln('|13Jezebel |15Sysop Configuration Editor |07- |14Riddle Editor');
Pipeln('|15ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ');
Pipeln('   |15(|131|15) |07Edit Riddle #'+itos(ridnum)+' of '+itos(totals));
PIPELN('   |15(|132|15) |07Clue|08: |15  '+rid.clue);
Pipeln('   |15(|133|15) |07Answer|08: |15'+rid.answer);
Pipeln('   |15(|13+|15) |07Next Riddle');
Pipeln('   |15(|13-|15) |07Previous Riddle');
Pipeln('   |15(|13Q|15) |07Quit to Previous');
Pipeln('|15ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ');
Pipe('|04Your Choice|15: |12');
repeat
repeat until keypressed;
choice:=readkey;
    choice:=upcase(Choice);
    Until Pos (choice, '123+-Q') > 0;
    pipeln (CHOICE);
    Case Choice Of
      '1': Changetext;
      '2': Changeclue;
      '3': Changeanswer;
      '+': Next;
      '-': Previous;
      'Q': begin if changed then begin
      Pipe('|13Changed, Save|15? |05');
      if yesno('Y')='Y' then begin
      seek(ridfile,ridnum);
      write(ridfile,rid);
      close(ridfile);
      end; end;
      donez := True; end;
    End;
stop;
Until donez;
end;


{Procedure ResetGame;
begin
CLRSCR;
Pipe('|15ARE YOU SURE YOU WANT TO |15COMPLETELY |15RESET THE GAME|08?! |13');
IF YESNO('N')='N' then exit;
  Assign (Scorefile, 'Scores.DAT');
  Rewrite (Scorefile);
  FillChar (Scores, SizeOf (Scores), 0);
  For f := 1 To 101 Do Write (Scorefile, Scores);
  close(scorefile);
  assign(Newsfile,'Simnews.old');
  Rewrite (NewsFile);
  close(newsfile);
  assign(newsfile,'SimNews.asc');
  rewrite(newsfile);
  WriteLn (NewsFile, TDay);
  WriteLn (NewsFile, '|15             |08Ü|05ÜÜ |08ÜÜ         °        Ü     Ü ²        ß°        |05ÜÜ |08Ü');
  Write (NewsFile, '|17±|16±|17ßß|16ÛÜÜ|17²|16Ü|05ÜÜ|08Ü|17²|16Ü |05Û|08ß±Üß|23Û|16ÜÛß|05Ü|08ßß²±²ÜÛÜ ');
  WriteLn (NewsFile, '  ²±Ü²ÜÛ|17±|16²ß°ß|05Ü|08Û°   |05Ü|08ÛÜÛ°Ü Ü ²ß|05Þßþ |17|08²±|16|05ÜÜ|08ÜÛ '
  + '²ß|17²°|16');
  Write (NewsFile, '|17²²|16Ü|05ßß|08ß|17²°|16|05ß|17|13ß|08²±|13ß²|16|15 |05Ý |08°Û²²±|05ß|17|13°|08±');
  Write (NewsFile, '|16|05ß |08ß ß  |05ß²|17|13°|16 |08ß ß  ß|05°    ß±|08²²Û|17|13°|08²|16|05ß ');
  WriteLn (NewsFile, '|08ß ß° ß |05Ü|08Ü|13ÜÜ|17|08ß|13|05ß ß |08ß ßþþÜ|17±|16');
  Write (NewsFile, 'ß|17²|16|05Ý |08ß |05Þ²  ßß   Ý       ±     |08Ü   |05°      |08ß   ß   |17 |16    ');
  WriteLn (NewsFile, '|17|13°|16           |05ß|17|13²°|16        |08þ|17±²|16');
  Write (NewsFile, 'Þ|17±²|16Üþ           |05ÒÄÄ¿ ÖÄÄ¿ ÄÒÄ Ò    Ò  Â      ÖÄÄ¿ ÒÄÄ¿ Ò Ò Â  ÖÄ¿ ');
  WriteLn (NewsFile, '           |17|08²±|16');
  Write (NewsFile, 'Û|17²²|16|05Ý|08Ü           |13º  ³ ÇÄÄ´  º  º    ÓÄÄ´      º  ³ ÇÄ   º º ³  ÓÄ¿ ');
  WriteLn (NewsFile, '           |17|08²±|16');
  Write (NewsFile, '°ß|17²|16Üþ           |15ÐÄÄÙ Ð  Á ÄÐÄ ÐÄÄÙ ÓÄÄÙ      Ð  Á ÐÄÄÙ ÓÄÐÄÙ ÓÄÄÙ    ');
  WriteLn (NewsFile, '        |17|08²±|16');
  Write (NewsFile, 'Ý|17±|16þ|23²|16Ü|17²|16ßÜ  Ü         |05N|08ews |05F|08or|13: ');
  Write (NewsFile, '|08' + SPACES (wtos (Month), 2) + '|05/|08' + spaces (wtos (Day), 2) + '|05/|08' + wtos (Year) );
  WriteLn (NewsFile, '                                   Üß|17±|16±');
  Write (NewsFile, 'ßÜ²|23±|16|07ßß|08ß|07ß|08ßßß ßß ° ßßß²ß ßßßßßßß  ß ßßÛßßßßßþ ßÜ þÜß ßß');
  WriteLn (NewsFile, 'ß ßß°ßþß Ü ß |07ß |08ßß ß þß°ß Û');
  WriteLn (Newsfile, '');
  Writeln(Newsfile,'|15®|10®|02® |14The Game has been RESET! |02¯|10¯|15¯');
  Writeln(Newsfile,'');
  Close (NewsFile);
    Assign (file1, 'bar.dat');
    Rewrite (File1);
{    For i := 1 To 16 Do Begin
      WriteLn (File1, '');
    End;}
{    WriteLn (File1, '|05- |07Brian Schulteis');
    WriteLn (File1, '|15The game has been reset! Good luck!');
    Close (File1);
assign(file1,'Mail.Dat');
rewrite(File1);
close(file1);
pipeln('|04Done|15!');stop;
end;}

Procedure MainMenu;
begin
     Repeat;
     CLRSCR;
     Pipeln('|13Jezebel |15Sysop Configuration Editor |07- |14Main Menu');
     Pipeln('|15ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ');
        Pipeln('  |15(|131|15) |13Edit Players');
     Pipeln('  |15(|132|15) |13Config File Editor');
        Pipeln('  |15(|133|15) |13Edit Riddles');
pipeln('  |15(|134|15) |13Edit Levels');
     Pipeln('  |15(|13Q|15) |13Quit');
     Pipeln('|15ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ');
     Pipe('|04Your Choice|15: |12');
     repeat
           repeat until keypressed;
           choice:=readkey;
           choice:=upcase(Choice);
     Until Pos (choice, '1234Q') > 0;
     pipeln (CHOICE);
    Case Choice Of
      '1': PlayerEdittor;
      '2': EditConfigFile;
      '3': EditRiddles;
      '4': Editprogram;
{      '7': ResetGame;}
      'Q': begin doneatMain := True; stop; end;
    End;
Until doneatmain;
end;


Begin
  GetDate (Year, Month, Day, Tday);
CLRSCR;
GOTOXY(1,25);
PIPE('|21|14Jezebel |15Configuration Program |07- |08(|07c|08) |131996/97/98 Zodian Software                |16');
Window(1,1,80,24);
CLRSCR;
Intro;
doneatmain:=false;
MainMenu;
Window(1,1,80,25);
clrscr;
outro;
end.
