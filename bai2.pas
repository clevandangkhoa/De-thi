uses crt;
var i:byte;
    f:text;
    function nto(n:integer):boolean;
    var i:integer;
    begin
         nto:=false;
         for i:=2 to n div 2 do
             if n mod i=0 then exit;
         nto:=true;
    end;
begin
     clrscr;
     for i:=0 to 99 do
         if nto(i*10+(i div 10))=true then write(i*10+(i div 10),' ');
     readln;
end.
