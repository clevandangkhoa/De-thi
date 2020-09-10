uses crt;
var c,d,x1,x2:real;
    S,delta:real;
begin
     clrscr;
     write('C=');readln(c);
     write('D=');readln(d);
     delta:=9+4*c*d;
     x1:=(3+sqrt(delta))/2;
     x2:=(3-sqrt(delta))/2;
     S:=sin(c*x1*x1*x1)*sqr(sin(c*x1*x1*x1))+d*x2*x2-c*d;
     S:=S/sqrt((c*x1*x1*x1+d*x2*x2-x1)+3.14);
     S:=S+sin(c*x1*x1+d*x2*x2-x1)/cos(c*x1*x1+d*x2*x2-x1);
     writeln(S:0:9);
     readln;
end.
