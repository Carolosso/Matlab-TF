%wstep, zaobrazowanie fukcji/ okreslenie inercja czy całka
L=30;
M=conv([1 2],conv([1 5],[1 5]));
t= 0:0.1:50;
y=step(L,M,t);
plot(t,y)
k=max(y);
%normalizujemy żeby k = 1;
yn=y/max(y);
%plot(t,yn)

%sprawdzenie rzędu inercji
[Mi, i] = max(diff(yn));
h=yn(i)*100; % h = 26% > 25% wiec inercja 2.rzedu
%punkty charakterystyczne
punkty = [t' yn];
t10=0.3;
t90=1.7;
T = (t90 - t10)/3.3;
tau = t10 - 0.53*T;

% transmitancja zastepcza II rzedu wzor
%         k
%  ----------------- e-tau*s
%      (Ts+1)^2
% podstawiajac
%         0.6
%  ----------------- e-0.075*s
%      (0.42s+1)^2

[lp mp] = pade(tau,8);
Lz = conv(lp,k);
Mz = conv(conv([T 1],[T 1]),mp);
yz=step(Lz,Mz,t);
plot(t,y,t,yz);

kp=(0.68*T)/(k*tau);
Ti=2*T;
Td=Ti/4;
P=kp;
I=kp/Ti;
D=kd*Td;

