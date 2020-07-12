unit MakeLvl;
{$G+,O+,B+}

interface

Uses CRT,Dos;

Type
  PROGRAMS = Record
    ProgName:String;
    PDeadLine:String;
    UDeadLine:String;
    MaxSize:LongInt;
    RewardK:LongInt;
  end;



Var
 lvl:string;
 newfile:boolean;
 Progs:Programs;
 Programfile: File of Programs;
 total,level,Programnumber:Integer;
 choice:char;
 changed:boolean;

Procedure AskProgname;
Procedure AskPDeadLine;
Procedure AskUDeadLine;
Procedure AskMaxSize;
Procedure AskRewardK;
Procedure Save;
Procedure Next;
Procedure Back;
Procedure Editprogram;

Implementation

Procedure AskProgname;
begin
changed:=true;
textcolor(2);
write('What will this program be called? ');
textcolor(7);
readln(progs.progname);
end;

Procedure AskPDeadLine;
begin
changed:=true;
textcolor(2);
write('What will this program say when killed? ');
textcolor(7);
readln(progs.pdeadline);
end;

Procedure AskUDeadLine;
begin
changed:=true;
textcolor(2);
write('What will this program say when it kills? ');
textcolor(7);
readln(progs.udeadline);
end;

Procedure AskMaxSize;
begin
changed:=true;
textcolor(2);
write('How big will this program be? ');
textcolor(7);
readln(progs.maxsize);
end;

Procedure AskRewardK;
begin
changed:=true;
textcolor(2);
write('How much of a reward will the player get for killing this program? ');
textcolor(7);
readln(progs.rewardK);
end;

Procedure Save;
begin
changed:=false;
Seek(programfile,programnumber);
write(programfile,progs);
if total<programnumber then total:=programnumber;
end;

Procedure Next;
begin
save;
Inc(programnumber);
if programnumber>total then begin
                              progs.progname:='';
                              progs.pdeadline:='';
                              progs.udeadline:='';
                              progs.maxsize:=0;
                              inc(total);
                              progs.rewardk:=0;
                            end else begin
seek(programfile,programnumber);
read(programfile,progs);
end;
end;

Procedure Back;
begin
save;
if programnumber<>1 then begin
dec(programnumber);
seek(programfile,programnumber);
read(programfile,progs);
end;
end;

Procedure editprogram;
begin
CLRSCR;
Textcolor(10);
Write('What level will we be editting? ');
    repeat
      READln (level);
    until (level>0) and (level<13);
    str(level,lvl);

Assign(ProgramFile,'LEVEL'+lvl+'.DAT');
{$I-}
RESET(ProgramFile);
{$I+}
TOTAL:=0;
if ioresult=0 then begin
                     repeat
                     inc(total);
                     seek(programfile,total);
                     if not eof(programfile) then read(programfile,progs);
                     until eof(programfile);
                   end else begin REWRITE(programfile); newfile:=true; end;
programnumber:=1;
Repeat
CLRSCR;
If not changed then begin
seek(programfile,programnumber);
if not eof(programfile) then
read(programfile,progs); end;
textcolor(7);
Write('Program Number: ');
TExtcolor(15);
Write(programnumber);
textcolor(7);
write(' of ');
textcolor(15);
writeln(total);
textcolor(5);
Write('A] Program Name: ');
textcolor(13);
Writeln(progs.progname);
textcolor(5);
Write('B] Death Line: ');
textcolor(13);
Writeln(progs.pdeadline);
textcolor(5);
Write('C] Kill Line: ');
textcolor(13);
Writeln(progs.udeadline);
textcolor(5);
Write('D] Total Size: ');
textcolor(13);
Writeln(progs.maxsize);
textcolor(5);
Write('E] Reward: ');
textcolor(13);
writeln(progs.rewardk);
writeln;
textcolor(15);
write('Your Choice (Q=Quit, +/- to change program): ');
textcolor(7);
repeat
      CHOICE:=Readkey; CHOICE := upcase (CHOICE);
    until pos (choice, 'ABCDEQ+-') > 0;
    writeln (CHOICE);writeln;
    case choice of
      'A': askprogname;
      'B': askpdeadline;
      'C': askudeadline;
      'D': askmaxsize;
      'E': askrewardk;
      '+': begin if not changed then next else begin
           next; end; end;
      '-': begin if not changed then back else begin
           back; end; end;
      'Q': begin if not changed then halt else begin
           save; halt; end; end;
End;
until 5<4;
close(programfile);
End;
end.