uses crt;
var n,i:0..60000;
    f:text;
    function nto(n:integer):boolean;
    var i:0..30000;
    begin
         nto:=false;
         for i:=2 to n div 2 do
             if n mod i=0 then exit;
         nto:=true;
    end;
begin
     clrscr;
     write('N=');readln(N);
     assign(f,'SONT.TXT');
     rewrite(f);
     for i:=2 to n do
         if nto(i)=true then writeln(f,i);
     readln;
     close(f);
end.
