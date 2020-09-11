uses crt;
var N,i,t:0..60000;
    a:array[2..60000] of boolean;
    f:text;
begin
     clrscr;
     assign(f,'STN.TXT');
     rewrite(f);
     write('N=');readln(n);
     fillchar(a,sizeof(a),true);
     for i:=2 to n do
         if a[i]=true then 
         begin
              write(f,i,' ');
              t:=2*i;
              while t<=n do
              begin
                   a[t]:=false;
                   t:=t+i;
              end;
         end;
     close(f);
end.
