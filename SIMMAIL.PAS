{$G+,O+}
unit simmail;
interface
procedure checkmail;
procedure sendmail;
procedure makeevent(touser,fromuser,subject,eventstr:string); {Hey, Osh!
This thing'll let ya send mail FROM THE GAME to the user! Run like this:
makeevent('laforge','the Phone Company','We couldn''t install your lines.');
and then laforge (case insensitive) will get mail from the phone company,
saying "We couldn't install your lines."
Cool huh?
}
implementation
uses OverLay, crt, ddplus, jezway, pipecode;
type
    mailrec=record
                  touser,fromuser,subject:string;
                  message:array[1..15] of string;
                  del:boolean;
    end;
var
   theonetofind:string;
   foundhim:boolean;
   k:scoreboard;
   old:mailrec;
   mail:mailrec;
   mailf:file of mailrec;
   numuserlines,spynum,i1,i2:integer;

function ucase (tempstr: string): string;
var
  i : integer;
begin
  for i := 1 to length (tempstr) do tempstr [i] := upcase (tempstr [i] );
  ucase := tempstr;
end;

procedure wreadln (var thestr, wwrap: string);
var
  s, s2: string [162];
  a, b, c: integer;
  ch: char;
  done: boolean;
begin;
  done := false;
  if thestr <> '' then swrite (thestr);
  wwrap := '';
  repeat;
    sread_char (ch);
    if (ch = #8) and (length (thestr) > 0) then begin;
      swrite (#8 + ' ' + #8);
      delete (thestr, length (thestr), 1);
    end;
    if not (ch in [#$0d, #$08] ) then begin;
      thestr := thestr + ch;
      swrite (ch);
    end;
    if length (thestr) > 72 then begin;
      c := 0;
      for b := 1 to length (thestr) do if thestr [b] = ' ' then c := b;
      s := '';
      if c > 60 then begin;
        for b := c + 1 to length (thestr) do begin;
          s := s + thestr [b];
          swrite (#8 + ' ' + #8);
        end;
        for b := c to length (thestr) do delete (thestr, length (thestr), 1);
      end;
      wwrap := s;
      done := true;
    end;
  until (ch = #13) or (done);
  swriteln ('');
end;

procedure mainloop;
var
  s: string;
  a, b: integer;
  done: boolean;
  wwrap: string;
begin;
  done := false;
  wwrap := '';
  repeat;
    SET_FOREGROUND (10);
    write (SOUTPUT, numuserlines);
    pipe ('|02> |15');
    s := wwrap;
    wreadln (s, wwrap);
    mail.message [numuserlines] := s;
    if s = '' then exit;
    if numuserlines=15 then exit;
    inc(numuserlines);
  until done;
  {checkusertext;}
end;


procedure reply;
var touser:string;
sfile:file of scoreboard;
score:scoreboard;
found:boolean;
mee,egg:integer;
begin
     old:=mail;
     close(mailf);
     touser:=mail.fromuser;
     if not exist('mail.dat') then begin
        rewrite(mailf);
     end;
     reset(mailf);
     i2 := -1;
     repeat
           inc(i2);
           seek(mailf,i2);
           if eof(mailf) then break;
           read(mailf,mail);
           if mail.del = TRUE then break;
     until 5<4;
     seek(mailf,i2);
     crlf(1);
     mail.touser:=touser;
     if (mail.touser = 'Jezebel') or (mail.touser='')
     or (mail.touser='Brian Schulteis')
     then exit;
     egg:=0;
     repeat
     inc(egg);
     if mail.message[egg]='' then break;
     until egg>15;
     if egg<14 then begin
     Pipe('|13Quote Previous Message? |05');
     Yesno('Y');
     egg:=0;
     if choice='Y' then begin
        egg:=0;
        repeat
        inc(egg);
        mail.message[egg]:='> '+spaces(old.message[egg],77);
        until old.message[egg+1]=''; end; end else egg:=0;
     mail.touser := ucase(mail.touser);
{     dpipeln('|15Enter your message now. You have |13two|15 lines.');
     inpt(mail.message[1],60,15,1);
     inpt(mail.message[2],60,15,1);
     mail.del := FALSE;
     mail.fromuser := ucase(userh);

     write(mailf,mail);
     crlf;
     dpipeln('|13Mail sent!');}
     pipeln('|15Enter your message now. You have |13'+litos(15-egg)+'|15 lines.');
     if egg>0 then begin
     for mee:=1 to egg do
                pipeln('|07'+mail.message[mee]);
     end;

     inc(egg);
     numuserlines:=egg; mainloop;
{     pipe('|13'+litos(egg)+'|05> ');
     prompt2(mail.message[egg],75,7,0);
     until (mail.message[egg]='') or (egg=15);}
     egg:=numuserlines;
     mail.del := FALSE;
     mail.fromuser := ucase(stripe(VirusName));
     if (egg<2) and (mail.message[1]='') then delay(1) else begin
     write(mailf,mail);
     crlf(1);
     pipeln('|13Mail sent|15!'); end;
     stop;
end;



procedure checkmail;
var
  egg:integer;
begin
     if not exist('mail.dat') then begin
        rewrite(mailf);
        close(mailf);
        exit;
     end;
     reset(mailf);
     if eof(mailf) then begin
        close(mailf);

        exit;
     end;
     i1:=-1;
     repeat
           inc(i1);
           seek(mailf,i1);
           if eof(mailf) then begin
              close(mailf);
              exit;
           end;
           read(mailf,mail);
           if (ucase(mail.touser) = ucase(stripe(VirusName))) and not mail.del then begin
              sclrscr;
              mailtop(mail.subject,mail.fromuser);
              egg:=0;
              repeat
              inc(egg);
              if mail.message[egg][1]='>' then pipeln('|07'+mail.message[egg])
              else pipeln('|15'+mail.message[egg]);
              until (mail.message[egg]='') or (egg=15);
              mail.del := TRUE;
              seek(mailf,i1);
              write(mailf,mail);
  PIPELN ('|15[|05R|15]|07eply |15[|05N|15]|07ext Message|15');
  PIPE ('|07E|08nd |07o|08f |07m|08essage |07c|08ommand|15: |13');
  repeat
    SREAD_Char (CHOICE); CHOICE := upcase (CHOICE);
  until pos (choice, 'RNQ') > 0;
  pipeln (CHOICE);
              if choice='R' then reply;
           end;
     until eof(mailf);
     close(mailf);
end;

procedure FindThemNow;
Var f,g,h:byte;
begin
  FoundHim:=false;
  g:=0;
  h:=0;
  reset(scorefile);
  for f:=1 to 100 do begin;
    seek(Scorefile,f);
    read(Scorefile,k);
    if StrUpcase(stripe(k.VirusName))=StrUpCase(TheOneToFind) then begin foundhim:=true; g:=f; end;
    if (k.User='') and (h=0) then h:=f;
  end; close(scorefile);
  swriteln('');
  if (g=0) and (h=0) then begin;
    foundhim:=false;
    exit;
  end;
  spynum:=g;
  if (g=0) then begin;
    foundhim:=false;
  end;
end;


procedure sendmail;
var touser:string;
sfile:file of scoreboard;
score:scoreboard;
found:boolean;
egg:integer;
begin
     if not exist('mail.dat') then begin
        rewrite(mailf);
     end;
     reset(mailf);
     i2 := -1;
{     repeat
           inc(i2);
           seek(mailf,i2);
           if eof(mailf) then begin i2:=i2+1; break; end;
           read(mailf,mail);
           if mail.del = TRUE then break;
     until eof(mailf);}
     repeat
           inc(i2);
           seek(mailf,i2);
           if eof(mailf) then break;
           read(mailf,mail);
           if mail.del = TRUE then break;
     until 5<4;

     seek(mailf,i2);
     crlf(1);
     pipeln('|15Make sure you enter their WHOLE name (BuT CaSe DoEs NoT MaTtEr!)');
     pipe('|13Send mail to whom|15? |07');
     sread(mail.touser);
     if mail.touser = '' then begin
        close(mailf);
        exit;
     end;
     mail.touser := ucase(mail.touser);
     theonetofind:=mail.touser;
     findthemnow;
     if not foundhim then begin
        close(mailf);
        crlf(1);
        pipeln('|12User not found!');
        stop;
        exit;
     end;
     pipe('|13Message Topic|15: |07');
     sread(mail.subject);
     crlf(1);
     pipeln('|15Enter your message now. You have |1315|15 lines.');
     egg:=0;
     inc(egg);
     numuserlines:=egg; mainloop;
     egg:=numuserlines;
     mail.del := FALSE;
     mail.fromuser := ucase(stripe(virusname));
     if (egg<2) and (mail.message[1]='') then delay(1) else begin
     write(mailf,mail);
     crlf(1);
     pipeln('|13Mail sent!'); end;
     close(mailf);
     stop;
end;

procedure makeevent(touser,fromuser,subject,eventstr:string);
begin
     if not exist('mail.dat') then begin
        rewrite(mailf);
     end;
     reset(mailf);
     i1 := -1;
     repeat
           inc(i1);
           seek(mailf,i1);
           if eof(mailf) then break;
           read(mailf,mail);
           if mail.del = TRUE then break;
     until eof(mailf);
     seek(mailf,i1);
     mail.touser := stripe(touser);
     mail.fromuser := stripe(fromuser);
     mail.subject:=subject;
     mail.message[1] := eventstr;
     mail.message[2] := '';
     mail.del := FALSE;
     write(mailf,mail);
     close(mailf);
end;

begin
     assign(mailf,'mail.dat');
end.