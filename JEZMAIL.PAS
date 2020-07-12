unit simmail;
interface
procedure checkmail;
procedure sendmail;
procedure makeevent(touser,fromuser,eventstr:string); {Hey, Osh!
This thing'll let ya send mail FROM THE GAME to the user! Run like this:
makeevent('laforge','the Phone Company','We couldn''t install your lines.');
and then laforge (case insensitive) will get mail from the phone company,
saying "We couldn't install your lines."
Cool huh?
}
implementation
uses ddplus, overway,crt,pipecode;
type
    mailrec=record
                  touser,fromuser,subject:string;
                  message:array[1..15] of string;
                  del:boolean;
    end;
SCOREBOARD = record
    USER:string[35];
    BBSNAM:string[25];
    CPUNAM:string[20];
    SOFTWARENAME:string[20];
    USERS:longint;
    SUBSCRIBERS:longint;
    NUMNODES:longint;
    MONEY:longint;
    NUMDOORS:longint;
    RAM:longint;
    NUMCD:longint;
    NUMMEG:longint;
    NUMBPS:longint;
    CANRUNBETTER:boolean;
    MAXNODES:longint;
    MAXRAM:longint;
    TDAY:word;
    NUMMAIL:longint;
    NUMWORK:longint;
    ADSPLACED:longint;
    NodesWaiting:longint;
    Networked:Boolean;
    Spare1:Boolean;
    Spare2:longInt;
    alias:String;
    Spare4:Longint;
  end;
var
   mail:mailrec;
   mailf:file of mailrec;
   i1,i2:integer;

procedure crlf; begin swriteln(''); end;
{EDOOR 0.9 doesn't have CRLF.. take it out if not needed.}

function ucase (tempstr: string): string;
var
  i : integer;
begin
  for i := 1 to length (tempstr) do tempstr [i] := upcase (tempstr [i] );
  ucase := tempstr;
end;


procedure reply;
var touser:string;
sfile:file of scoreboard;
score:scoreboard;
found:boolean;
egg:integer;
begin
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
     crlf;
     mail.touser:=touser;
     if (mail.touser = 'The Phone Company') or (mail.touser='')
     or (mail.touser='Brian Schulteis')
     then begin exit;
     end;
     mail.touser := ucase(mail.touser);
{     dpipeln('|15Enter your message now. You have |11two|15 lines.');
     inpt(mail.message[1],60,15,1);
     inpt(mail.message[2],60,15,1);
     mail.del := FALSE;
     mail.fromuser := ucase(userh);

     write(mailf,mail);
     crlf;
     dpipeln('|09Mail sent!');}
     pipeln('|15Enter your message now. You have |1115|15 lines.');
     egg:=0;
     repeat
     inc(egg);
     pipe('|11'+litos(egg)+'|03> ');
     prompt(mail.message[egg],75,FALSE);
     until (mail.message[egg]='') or (egg=15);
     mail.del := FALSE;
     mail.fromuser := ucase(stripe(alias));
     if (egg<2) and (mail.message[1]='') then delay(1) else begin
     write(mailf,mail);
     crlf;
     pipeln('|09Mail sent|15!'); end;
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
           if (ucase(mail.touser) = ucase(stripe(alias))) and not mail.del then begin
              sclrscr;
              mailtop(mail.subject,mail.fromuser);
              egg:=0;
              repeat
              inc(egg);
              pipeln('|15'+mail.message[egg]);
              until (mail.message[egg]='') or (egg=15);
              crlf;
              mail.del := TRUE;
              seek(mailf,i1);
              write(mailf,mail);
  PIPELN ('|15[|01R|15]|07eply |15[|01N|15]|07ext Message|15');
  PIPE ('|07E|08nd |07o|08f |07m|08essage |07c|08ommand|15: |03');
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
begin
  FoundHim:=false;
  g:=0;
  h:=0;
  for f:=1 to 100 do begin;
    seek(Scorefile,f);
    read(Scorefile,k);
    if StrUpcase(stripe(k.alias))=StrUpCase(TheOneToFind) then begin foundhim:=true; g:=f; end;
    if (k.User='') and (h=0) then h:=f;
  end;
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
     crlf;
     pipeln('|15Make sure you enter their WHOLE name (BuT CaSe DoEs NoT MaTtEr!)');
     pipe('|09Send mail to whom|15? |07');
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
        crlf;
        pipeln('|12User not found!');
        stop;
        exit;
     end;
     pipe('|09Message Topic|15: |07');
     sread(mail.subject);
     crlf;
     pipeln('|15Enter your message now. You have |1115|15 lines.');
     egg:=0;
     repeat
     inc(egg);
     pipe('|11'+litos(egg)+'|03> ');
     prompt(mail.message[egg],75,FALSE);
     until (mail.message[egg]='') or (egg=15);
     mail.del := FALSE;
     mail.fromuser := ucase(stripe(alias));
     if (egg<2) and (mail.message[1]='') then delay(1) else begin
     write(mailf,mail);
     crlf;
     pipeln('|09Mail sent!'); end;
     close(mailf);
     stop;
end;

procedure makeevent(touser,fromuser,eventstr:string);
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
     mail.touser := touser;
     mail.fromuser := fromuser;
     mail.message[1] := eventstr;
     mail.message[2] := '';
     mail.del := FALSE;
     write(mailf,mail);
     close(mailf);
end;

begin
     assign(mailf,'mail.dat');
end.