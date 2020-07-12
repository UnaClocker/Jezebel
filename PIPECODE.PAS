{$G+,O+}
unit pipecode;

interface

uses Crt,DDPlus;
type LineString=string[80];

var
  ch:char;
  Abort:boolean;
  LineCount,Chn:integer;
  TextFile:text;
  choice:char;


function Pipe (Thestring: string): string;
function Pipeln (Thestring: string): string;

implementation

procedure FG(BAH:Byte);
begin
Set_Foreground(Bah);
end;

Procedure BG(BAH:Byte);
begin
Set_BackGround(Bah);
end;



function Pipe;
var
  a, b, e, f, count: integer;
  c: string [1];
  d: string [2];
  ch : char;
  lengtht : integer;
begin
  d := 'AB';
  lengtht := length(thestring);
  for a := 1 to lengtht do
  begin;
    c := thestring[a];
    if c = '|' then begin;
      d[1] := thestring[a+1];
      d[2] := thestring[a+2];
      val(d, b, b);
      if b >= 0 then if b <= 15 then begin Set_Foreground(b); end;
      if b >= 16 then if b <= 23 then Set_BackGround(b-16);
      a := a + 2;
    end else begin if c= '`' then begin;
      d[1]:= thestring[a+1];
      a:=a+1;
      case d[1] of
      '1': begin fg(1); BG(Current_BackGround); end;
      '2': begin fg(2);BG(Current_BackGround); end;
      '3': begin fg(3);BG(Current_BackGround); end;
      '4': begin fg(4);BG(Current_BackGround); end;
      '5': begin fg(5);BG(Current_BackGround); end;
      '6': begin fg(6);BG(Current_BackGround); end;
      '7': begin fg(7);BG(Current_BackGround); end;
      '8': begin fg(8);BG(Current_BackGround); end;
      '9': begin fg(9);BG(Current_BackGround); end;
      '0': begin fg(10);BG(Current_BackGround); end;
      '!': begin fg(11);BG(Current_BackGround); end;
      '@': begin fg(12);BG(Current_BackGround); end;
      '#': begin fg(13);BG(Current_BackGround); end;
      '$': begin fg(14);BG(Current_BackGround); end;
      '%': begin fg(15);BG(Current_BackGround); end;
      end;
      end else swrite(c);
  end;
end;
end;

function Pipeln;
var
  a, b, e, f, count: integer;
  c: string [1];
  d: string [2];
  ch : char;
  lengtht : integer;
begin
  d := 'AB';
  lengtht := length(thestring);
  for a := 1 to lengtht do
  begin;
    c := thestring[a];
    if c = '|' then begin;
      d[1] := thestring[a+1];
      d[2] := thestring[a+2];
      val(d, b, b);
      if b >= 0 then if b <= 15 then begin FG(b); BG(Current_BackGround); end;
      if b >= 16 then if b <= 23 then BG(b-16);
      a := a + 2;
    end else begin if c= '`' then begin;
      d[1]:= thestring[a+1];
      a:=a+1;
      case d[1] of
      '1': begin fg(1); BG(Current_BackGround); end;
      '2': begin fg(2);BG(Current_BackGround); end;
      '3': begin fg(3);BG(Current_BackGround); end;
      '4': begin fg(4);BG(Current_BackGround); end;
      '5': begin fg(5);BG(Current_BackGround); end;
      '6': begin fg(6);BG(Current_BackGround); end;
      '7': begin fg(7);BG(Current_BackGround); end;
      '8': begin fg(8);BG(Current_BackGround); end;
      '9': begin fg(9);BG(Current_BackGround); end;
      '0': begin fg(10);BG(Current_BackGround); end;
      '!': begin fg(11);BG(Current_BackGround); end;
      '@': begin fg(12);BG(Current_BackGround); end;
      '#': begin fg(13);BG(Current_BackGround); end;
      '$': begin fg(14);BG(Current_BackGround); end;
      '%': begin fg(15);BG(Current_BackGround); end;
      end;
      end else swrite(c);
{begin
  d := 'AB';
  lengtht := length(thestring);
  for a := 1 to lengtht do
  begin;
    c := thestring[a];
    if c = '|' then begin;
      d[1] := thestring[a+1];
      d[2] := thestring[a+2];
      val(d, b, b);
      if b >= 1 then if b <= 15 then FG(b);
      if b >= 16 then if b <= 23 then BG(b-16);
      if b<>0 then a := a + 2;
    end else swrite(c);}
  end;end;
  swriteln('');
end;


end.

