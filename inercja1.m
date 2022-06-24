%15e^-s
%-------------
%(10s+1)(s+1)^2
L=15;
[lp mp]=pade(1,8);
M=conv([10 1],conv([1 1],[1 1]));
Lp=conv(L,lp);
Mp=conv(M,mp);
t=0:0.1:150;
y=step(Lp,Mp,t);
plot(t,y); % inercja
yn=y/max(y);
%plot(t,yn);
[Mi i]=max(diff(yn));
h=yn(i)*100; %h=18.48 < 20 inercja 1.rzedu
k=max(y);
punkty=[t' yn];
t10=3.8;
t90=26.1;
T=(t90-t10)/2.2;
tau=t10-0.1*T;
% k
%------------e-2.78s
% 10.13s+1
[lp2 mp2]=pade(tau,8);
Lz=conv(k,lp2);
Mz=conv([T 1],mp2);
yz=step(Lz,Mz,t);
plot(t,y,t,yz);

