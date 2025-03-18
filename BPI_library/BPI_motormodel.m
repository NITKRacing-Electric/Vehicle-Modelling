v=5;
rpm= 6*v/0.22;

w1= 2*3.14*rpm/60;
T=[200,300,400,300,200];
Eb=2;

I=T*2*3.14*rpm/(60*Eb);

P1 = T*w1;
t=[1,2,3,4,5];
T1=5;
V=[56,96,48,72,48];
I=[1,2,3,4,5];


P2= I.*V;
subplot(2,2,1);
plot(I);
xlabel("time");
ylabel("Current");
subplot(2,2,2);
plot(T);
xlabel("time");
ylabel("Torque");
subplot(2,2,3);
plot(t,P2);
xlabel("time");
ylabel("Electrical Power");