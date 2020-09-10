uses crt;
var i,j:integer;
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
         begin
              code:=length(s)-i+1;
              if s[i]<>s[length(s)-i+1] then exit;
         end;
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
     for i:=31 to 31 do
     begin
          j:=10*i+(i div 10);
          if nto(j)=true then
             if nhiphan(j)=true then writeln(j);
     end;
     readln;
end.
