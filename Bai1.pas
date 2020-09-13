uses crt;
var r:real;
    max,P,Q,Pmax,Qmax:integer;
begin
     clrscr;
     write('R=');readln(r);
     write('Max=');readln(max);
     Pmax:=0;Qmax:=max;
     for Q:=1 to max do
     begin
          P:=round(r*q);
          if abs(P/Q-r)<abs(Pmax/Qmax-r) then
          begin
               Pmax:=P;
               Qmax:=Q;
          end;
     end;
     writeln(Pmax,'/',Qmax,'=',Pmax/Qmax:0:9);
     readln;
end.
