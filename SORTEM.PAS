{$G+}
unit Sortem;

interface
uses ddplus,pipecode,jezway;

function Sorted:boolean;
procedure Sort;

implementation


var
  Scorefile: file of Scoreboard;
  c,r,l:longint;
  numofusers:word;

procedure Findnumofusers;
var
  z:scoreboard;
begin
  repeat
    numofusers:=numofusers+1;
    seek(scorefile,numofusers);
    read(scorefile,z);
  until z.deleted;
end;

function Sorted:boolean;
var
  Z:Scoreboard;
  ZZ:Scoreboard;
  X:longint;
begin
  sorted:=true;
  for X:=1 to numofusers-1 do begin
    seek(scorefile,X);
    read(scorefile,z);
    seek(scorefile,X+1);
    read(scorefile,zz);
    if (z.originalsize<zz.originalsize) and ((not zz.deleted) or (not z.deleted)) then sorted:=false;
  end;
end;

procedure Sort;
var
  foreverhascome:boolean;
  num:word;
  Zap:Scoreboard;
  ZZap:Scoreboard;
  duh:byte;
begin
  sCLRSCR;
  Pipe('|05Sorting High Scores |15[ ]');
  assign(scorefile,'Scores.DAT');
  duh:=1;
  reset(Scorefile);
  findnumofusers;
  foreverhascome:=false;
  repeat
    if skeypressed then foreverhascome:=true;
    if duh>6 then duh:=1
    else duh:=duh+1;
    spinner(22,1,9,duh);
    if num>numofusers then num:=1
    else num:=Num+1;
    {$I-}
    seek(Scorefile,num);
    read(Scorefile,Zap);
    seek(Scorefile,num+1);
    read(Scorefile,ZZap);
    if (Zap.originalsize<ZZap.originalsize) and ((not zzap.deleted) or (not zap.deleted)) then
    begin
      seek(Scorefile,num);
      write(Scorefile,ZZap);
      seek(Scorefile,num+1);
      write(Scorefile,Zap);
    end;
    {$I+}
  until (sorted) or (foreverhascome);
  close(Scorefile);
end;

end.