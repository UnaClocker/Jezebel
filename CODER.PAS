unit coder;
interface
Function encrypt (s: string): string;
function encrypt2 (s:string; key:string):string;
function normalize (s:string):string;
implementation
Function encrypt (s: String): String;
Var
  i, m: Integer;
  gh: Integer;
  s2: String;
  CH: Char;
Begin
  RandSeed := Length (s) * 7; {Change the * x number to make diff codes}
  s2 := ''; {You could try making it equal something from the start}
  For i := 1 To Length (s) Do Begin
    gh := Random (Length (s) + 513 );  {You can play with that too.}
    s2 := s2 + Chr (Ord (s [i] ) + gh + 6 * 3 Div 60);  {Could add more here}
  End;
  encrypt := encrypt2(s2,s);
    randomize;
End;

Function encrypt2 (s, key: String): String;
Var
  coded: String;
  i: Integer;
  keyn:longint;
  X: Integer;
  last:byte;
  charkey:longint;
Begin
  coded := '';
  keyn := 3 + length(key);
  For X := 1 To Length (key) Do keyn := keyn + Ord (key [X] );
  last := 2;
  For X := 1 To Length (s) Do Begin
    charkey := last + keyn;
    i := Ord (s [X] );
    i := i + charkey;
    last := i;
    coded := coded + Chr (i);
  End;
  encrypt2 := coded;
End;

Function normalize (s: String): String;
Var s2: String;
  i, p: Integer;
  CH: Char;
  allow: String;
  isok : Boolean;
Begin
  allow := 'QAZWSXEDCRFVTGBYHNUJMIKOLP';
  {I like this... Add anything up there that you want keys to be made of.}
  {It can be ANYTHING. Just make sure no hiascii. :)}
  {Right now it's all letters [upcase, lowcase] and numbers, and stuff.}
  s2 := '';
  For i := 1 To Length (s) Do Begin
    isok := False;
    For p := 1 To Length (allow) Do If s [i] = allow [p] Then isok := True;
    If Not isok Then Begin
      s [i] := Chr (Ord (s [i] ) - 23);
      Dec (i);
      Continue;
    End;
  End;
  normalize := s;
End;
end.