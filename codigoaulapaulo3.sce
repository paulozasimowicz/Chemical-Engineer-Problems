
clc
close
clear

//modelo
function f=fsol1(x,mumax,km,D,sf,Y,k1)
  
  mu=mumax*x(2)/(km+x(2)+(k1*(x(2)^2)));
  f(1)=(mu-D)*x(1);
  f(2)=(sf-x(2))*D-mu*x(1)/Y;
endfunction

//main
k1=0.4545;
mumax=0.53;
km=0.12;
D=0.3;
sf=4;
Y=0.4;

icont=1;
for i=1:10
for j=1:10
    xo=rand(1,2).*[2 4];
[xres,f,info]=fsolve(xo',list(fsol1,mumax,km,D,sf,Y,k1));
if info==1
    vetor(icont,:)=[xres];
    icont=icont+1;
end
end
end
disp(vetor)
disp(xres)
disp(f)
disp(info)
