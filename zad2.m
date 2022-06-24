%1.5
%(20s+1)(0.5s+1)^4
L=1.5;
temp=conv([0.5 1], [0.5 1]);
temp2=conv([0.5 1], [0.5 1]);

M=conv([20 1],conv(temp,temp2));
t=0:0.1:150;
y=step(L,M,t);
plot(t,y); %inercja
k=max(y);

yn=y/max(y);
plot(t,yn);
[Mi i] = max(diff(yn));
h= yn(i)*100; % h=10%<20% inercja 1.rzedu.
%     k
%  --------e-taus
%  (Ts+1)

punkty = [t' yn];
t10=4.1;
t90=48;
T=(t90-t10)/2.2;
tau = t10-0.1*T;
%     1.5
%  --------e-2.1s
%  (19.95s+1)

[lp mp]=pade(tau,8);
Lz=conv(k,lp);
tempz=conv([0.5 1], [0.5 1]);
tempz2=conv([0.5 1], [0.5 1]);
Mz=conv([T 1],mp);

yz=step(Lz,Mz,t);
plot(t,y,t,yz);

