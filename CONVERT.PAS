Program Convert;

Uses CRT;

Type
  OPROGRAMS = Record
    ProgName:String;
    PDeadLine:String;
    UDeadLine:String;
    MaxSize:Integer;
    RewardK:Integer;
  end;
  NPROGRAMS = Record
    ProgName:String;
    PDeadLine:String;
    UDeadLine:String;
    MaxSize:LongInt;
    RewardK:LongInt;
  end;

  Var
  Level:integer;
  LVL:string;
  thison,total:integer;
  old:oprograms;
  new:nprograms;
  npfile:file of nprograms;
  opfile:file of oprograms;

begin
CLRSCR;
Textcolor(10);
Write('What level will we be converting? ');
    repeat
      READln (level);
    until (level>0) and (level<13);
    str(level,lvl);

Assign(opFile,'LEVEL'+lvl+'.DAT');
{$I-}
RESET(oPFile);
{$I+}
TOTAL:=0;
if ioresult=0 then begin
                     repeat
                     inc(total);
                     seek(opfile,total);
                     read(opfile,old);
                     until eof(opfile);
                   end else halt;
thison:=0;
assign(npfile,'LEVEL'+LVL+'.NEW');
rewrite(npfile);
repeat;
inc(thison);
seek(opfile,thison);
seek(npfile,thison);
read(opfile,old);
new.progname:=old.progname;
new.pdeadline:=old.pdeadline;
new.udeadline:=old.udeadline;
new.maxsize:=old.maxsize;
new.rewardk:=old.rewardk;
write(npfile,new);
until thison=total;
Writeln('Done, Remember, Delete LEVEL'+LVL+'.DAT and rename LEVEL'+LVL+'.NEW to .DAT');
Close(npfile);
close(opfile);
end.
