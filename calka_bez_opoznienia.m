L=3;
temp=conv([2 1],[2 1]);
temp2=conv(temp,[2 1]);
M=conv([1 0],temp2);
t=0:0.1:50;

y=step(L,M,t);
%plot(t,y);
XA=20.9;
XB=33.3;
YA=44.7136;
YB=81.9001;
a=(YB-YA)/(XB-XA);
%y=ax+b; b=y-ax;

b=68.4005-a*28.8;
T=1/a;
tau=-b/a;
% 1
%------------e-taus
%Ts
[lp mp]=pade(tau,8);
Lz = conv(1,lp);
Mz = conv([T 0],mp);
yz=step(Lz,Mz,t);
plot(t,y,t,yz);