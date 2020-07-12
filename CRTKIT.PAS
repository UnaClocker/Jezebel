{$G+}
unit CRTKIT;

interface

uses Crt;

function Pipe (Thestring: string): string;
function Pipeln (Thestring: string): string;

implementation

procedure fg(x:byte);
begin
textcolor(x);
end;

procedure bg(x:byte);
begin
textbackground(x);
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
      if b >= 1 then if b <= 15 then FG(b);
      if b >= 16 then if b <= 23 then BG(b-16);
      if b<>0 then a := a + 2;
    end else begin if c= '`' then begin;
      d[1]:= thestring[a+1];
      a:=a+1;
      case d[1] of
      '1': fg(1);
      '2': fg(2);
      '3': fg(3);
      '4': fg(4);
      '5': fg(5);
      '6': fg(6);
      '7': fg(7);
      '8': fg(8);
      '9': fg(9);
      '0': fg(10);
      '!': fg(11);
      '@': fg(12);
      '#': fg(13);
      '$': fg(14);
      '%': fg(15);
      end;
      end else write(c);
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
      if b >= 1 then if b <= 15 then FG(b);
      if b >= 16 then if b <= 23 then BG(b-16);
      if b<>0 then a := a + 2;
    end else begin if c= '`' then begin;
      d[1]:= thestring[a+1];
      a:=a+1;
      case d[1] of
      '1': fg(1);
      '2': fg(2);
      '3': fg(3);
      '4': fg(4);
      '5': fg(5);
      '6': fg(6);
      '7': fg(7);
      '8': fg(8);
      '9': fg(9);
      '0': fg(10);
      '!': fg(11);
      '@': fg(12);
      '#': fg(13);
      '$': fg(14);
      '%': fg(15);
      end;
      end else write(c);
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
    end else dwrite(c);}
  end;end;
  writeln('');
end;

end.

