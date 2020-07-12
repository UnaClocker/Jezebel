{$G+,O+}
Unit SewTalk;

Interface

Uses Crt, ddplus, DOS, pipecode,jezway,OverLAy;

Procedure StartBarTalk;
Procedure Addline;

Implementation

Type
  linestring = String [80];
  inputs = String [67];
  lines = Record
            oldlines: Array [1..18] Of String [100];
          End;
Var
  File1, linerfile: Text;
  lineentered, currentline, reallong: String;
  i, a, b, e, f, count, lengtht: Integer;
  c: Char;
  D: String [2];
  cr, CH: Char;
  cp: lines;

Procedure YesErNo (default: Char);
Begin
  swrite (default);
  Repeat
    sread_char (CH);
    CH := UpCase (CH);
    If CH = cr Then CH := default;
  Until CH In ['Y', 'N'];
  If CH = 'Y' Then pipeln (#8 + '|10Yeah!!') Else pipeln (#8 + '|10Nope!!');
End;

Procedure Addrandomline;
var
  yyy:Integer;
  nameadd:String;
Procedure addit;
begin
Assign (linerfile, 'slime.dat');
  Reset (linerfile);
  If Not EoF (linerfile) Then Begin
    ReadLn (linerfile, currentline);
    ReadLn (linerfile, currentline);
  End;
  For i := 1 To 16 Do Begin
    If Not EoF (linerfile) Then ReadLn (linerfile, cp. oldlines [i] );
  End;
  Close (linerfile);
  Rewrite (linerfile);
  For i := 1 To 16 Do Begin
    WriteLn (linerfile, cp. oldlines [i] );
  End;
  Close (linerfile);
  Append (linerfile);
  WriteLn (linerfile, '|07- |15', nameadd);
  WriteLn (linerfile, '|06', lineentered,'|16');
  Close (linerfile);
end;

Procedure One;
begin
nameadd:='Jezebel';
lineentered:='Has anyone seen my sister, Samantha?';
end;

Procedure Two;
begin
nameadd:='Samantha';
lineentered:='I''ve been saved! I once was lost, but now I''m found.';
end;

Procedure Three;
begin
nameadd:='Brian Schulteis';
{if not isregistered then
lineentered:='|20|15Register me!'
else}
lineentered:='Thank you for supporting Zodian Software.';
end;

Procedure Four;
begin
nameadd:='Dave Cutler';
lineentered:='Who''s the idiot that wrote this game?';
end;

Procedure Five;
begin
nameadd:='Illusion';
lineentered:='I hear Norton really knows what he''s talking about.';
end;

Procedure Six;
begin
nameadd:='Jasmine';
lineentered:='Hey guys! How''s it goin?';
end;

Procedure Seven;
begin
nameadd:='Mary';
lineentered:='If I told you I loved you, I lied.';
end;

Procedure Eight;
begin
nameadd:='Bill Gates';
lineentered:='Please buy my crappy software!';
end;




begin
Randomize;
yyy:=random(24)+1;
Case yyy of
  1: begin one; addit; end;
  2: begin two; addit; end;
  3: begin three; addit; end;
  4: begin seven; addit; end;
  5: begin eight; addit; end;
  6: begin six; addit; end;
  7: begin four; addit; end;
  8: begin five; addit; end;
  9: begin one; addit; end;
 10: begin two; addit; end;
 11: begin three; addit; end;
 12: begin four; addit; end;
 13: begin five; addit; end;
 14: begin six; addit; end;
 15: begin seven; addit; end;
 16: begin eight; addit; end;
 17: begin one; addit; end;
 18: begin two; addit; end;
 19: begin three; addit; end;
 20: begin four; addit; end;
 21: begin five; addit; end;
 22: begin six; addit; end;
 23: begin seven; addit; end;
 24: begin eight; addit; end;
end;
end;



Procedure addline;
Var
  XXX:Integer;
Begin
  pipeln ('|10Tell us what''s on your mind.');
  prompt2 (lineentered, 70, 15,2);
  If lineentered<>'' then begin
  Assign (linerfile, 'slime.dat');
  Reset (linerfile);
  If Not EoF (linerfile) Then Begin
    ReadLn (linerfile, currentline);
    ReadLn (linerfile, currentline);
  End;
  For i := 1 To 16 Do Begin
    If Not EoF (linerfile) Then ReadLn (linerfile, cp. oldlines [i] );
  End;
  Close (linerfile);
  Rewrite (linerfile);
  For i := 1 To 16 Do Begin
    WriteLn (linerfile, cp. oldlines [i] );
  End;
  Close (linerfile);
  Append (linerfile);
  WriteLn (linerfile, '|07- |15', virusname);
  WriteLn (linerfile, '|14', lineentered,'|16');
  Close (linerfile);
  end;
  Randomize;
  XXX:=Random(5)+1;
  If XXX=3 then addrandomline;
End;

procedure crlf; begin swriteln(''); end;
Procedure make_a_line;
Begin
  pipe ('|08');
  For i := 1 To 70 Do Begin
    pipe ('Ä');
  End;
  crlf;
End;
Procedure StartBarTalk;
Begin
  sclrscr;
  cr:=#13;
  If Not exist ('slime.dat') Then Begin
    Assign (File1, 'slime.dat');
    Rewrite (File1);
    For i := 1 To 16 Do Begin
      WriteLn (File1, '');
    End;
    WriteLn (File1, '|07- |15Brian Schulteis');
    WriteLn (File1, '|14So you think your a virus.. We''ll see!');
    Close (File1);
  End;
  Assign (File1, 'slime.dat');
  Reset (File1);
  pipeln ('|10After tuning into the local slime, you hear:');
  make_a_line;
  While Not EoF (File1) Do
  Begin
    ReadLn (File1, currentline);
    pipeln (currentline);
  End;
  make_a_line;
  Close(File1);
  pipe ('|02Say Something|15? |10');
  YesErNo ('N');
  If CH = 'Y' Then addline;
End;


End.
