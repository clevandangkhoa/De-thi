uses crt;
var i:byte;
    f:text;
    function nhiphan(n:integer):boolean;
    var i,j,code:integer;
        tam,s:string;
    begin
         nhiphan:=false;
         while n<>0 do
         begin
              str(n mod 2,tam);
              s:=tam+s;
              n:=n div 2;
         end;
         for i:=1 to (length(s) div 2) do
             if s[i]<>s[length(s)-i+1] then exit;
         nhiphan:=true;
    end;
    function nto(n:longint):boolean;
    var i:longint;
    begin
         nto:=false;
         for i:=2 to n div 2 do
             if n mod i=0 then exit;
         nto:=true;
    end;
begin
     clrscr;
     nhiphan(727);
     for i:=10 to 99 do
         if (nto(i*10+(i div 10))=true) and (nhiphan(i*10+(i div 10))=true) then write(i*10+(i div 10),' ');
     readln;
end.
