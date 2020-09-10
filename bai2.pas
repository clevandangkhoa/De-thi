uses crt;
var a:array[1..100,1..100] of 0..1;
    b:array[1..100] of 0..2;
    n,i,j:0..100;
    f1,f2:text;
    function check(x,y:byte):boolean;
    var i,j:integer;
    begin
         check:=false;
         for i:=1 to x-1 do
             if (b[i]=y) and (a[i,x]=1) then exit;
         check:=true;
    end;
    procedure print;
    var i:1..100;
    begin
         for i:=1 to n do
             if b[i]=1 then write(f2,i,' ');
         writeln(f2);
         for i:=1 to n do
             if b[i]=2 then write(f2,i,' ');
         close(f2);
         readln;
         halt;
    end;
    procedure try(i:byte);
    var j,p:0..2;
    begin
         for j:=1 to 2 do
             if check(i,j)=true then
             begin
                  p:=b[i];
                  b[i]:=j;
                  if i=n then begin print;halt; end else try(i+1);
                  b[i]:=p;
             end;
    end;
begin
     clrscr;
     assign(f1,'QUANHE.INP');
     assign(f2,'QUANHE.OUT');
     reset(f1);
     rewrite(f2);
     readln(f1,n);
     for i:=1 to n do
         for j:=1 to n do read(f1,a[i,j]);
     close(f1);
     try(1);
     writeln(f2,'KHONG THE');
     close(f2);
     readln;
end.
