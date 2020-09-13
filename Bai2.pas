uses crt;
const a:array[1..3] of char=('1','2','3');
var f:text;
    S:string;
    n:byte;
    d:array[1..100000] of string;
    dem,i:longword;
    function check(x:byte):boolean;
    var i,j:integer;
    begin
         check:=true;
         if x=1 then exit;
         check:=false;
         for i:=1 to (x div 2) do
             if copy(S,x-2*i+1,i)=copy(S,x-i+1,i) then exit;
         check:=true;
    end;
    procedure print;
    var i,j:longword;
        kt:boolean;
        p:string;
    begin
         for i:=1 to dem do
         begin
              {----------kiem tra xem S<d[i] hay khong-----------------}
              p:=d[i];
              kt:=true;
              if length(S)=length(P) then
                 for j:=1 to length(S) do
                     if S[j]<P[j] then
                     begin
                          kt:=false;
                          break;
                     end;
              if length(S)>length(P) then
                 for j:=1 to length(P) do
                     if S[j]<>P[j] then
                     begin
                          kt:=false;
                          break;
                     end;
              {----neu S<d[i] thi chen S vao vi tri d[i]----------------}
              if kt=true then
              begin
                   dem:=dem+1;
                   for j:=dem downto i+1 do d[j]:=d[j-1];
                   d[i]:=S;
                   exit;
              end;
         end;
         {neu S nam cuoi day}
         dem:=dem+1;
         d[dem]:=S;
    end;
    procedure try(i:byte);
    var j:byte;
        p:string;
    begin
         for j:=1 to 3 do
         begin
              p:=S;
              delete(S,i,1);S:=S+a[j];
              if check(i)=true then
              begin
                   print;
                   if i<n then try(i+1);
              end;
              S:=p;
         end;
    end;
begin
     clrscr;
     assign(f,'XVB.TXT');
     rewrite(f);
     write('n=');readln(n);
     dem:=0;
     try(1);
     for i:=1 to dem do writeln(f,d[i]);
     writeln(f,'Co ',dem,' day.');
     close(f);
     readln;
end.
