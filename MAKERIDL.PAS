Program Make_Riddles;
{$B+,V-}


uses Crt,dos;

Type
    Riddles = Record
    lines: array[1..10] of string[80];
    clue: string[50];
    answer: string[50];
end;


var ridnum:integer;
    i:byte;
    rid:riddles;
    ridfile:file of riddles;


Procedure fg(fo:byte);
begin
textcolor(fo);
end;

Procedure asklines;
var linenum:integer;
begin
linenum:=1;
fg(14);
Writeln('Enter your lines:');
repeat
fg(10);
write(linenum);
fg(2);
write('> ');
fg(13);
readln(rid.lines[linenum]);
inc(linenum);
until (rid.lines[linenum-1]='') or (linenum>10);
end;

Procedure AskAnswer;
begin
fg(9);
Write('What''s the answer: ');
fg(3);
repeat
readln(rid.answer);
for i:=1 to length(rid.answer) do
rid.answer[i]:=upcase(rid.answer[i]);
until (rid.answer[length(rid.answer)]<>'.') or (rid.answer='');
end;

Procedure AskClue;
begin
fg(7);
Write('What''s the clue  : ');
fg(15);
repeat
readln(rid.clue);
until rid.clue<>'';
end;


begin
ridnum:=1;
assign(ridfile,'RIDDLES.DAT');
reset(ridfile);
repeat;
CLRSCR;
seek(ridfile,ridnum);
read(ridfile,rid);
fg(4);
Write('Riddle Number');
fg(15);
write(': ');
fg(12);
writeln(ridnum);
i:=0;
repeat
inc(i);
Writeln(i,'] ',rid.lines[i]);
until rid.lines[i+1]='';
writeln('B] ',rid.answer);
writeln('C] ',rid.clue);
Case upcase(readkey) of
 'A': asklines;
 'B': askanswer;
 'C': askclue;
end;
seek(ridfile,ridnum);
write(ridfile,rid);
inc(ridnum);
fg(5);
Write('Continue? ');
fg(13);
repeat until keypressed;
until upcase(readkey)='N';
close(ridfile);
end.