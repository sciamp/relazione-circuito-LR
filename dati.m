freq_in=[350,500,1e3,2e3,5e3,1e4,2e4,35e3,5e4,1e5,2e5,5e5,1e6,2e6]; %% Hertz
periodo_in=[2.9e3,2e3,1e3,48e1,2e2,1e2,50,28,20,10,5,2,1,0.5]; %% Micro sec
Delta_periodo_in=[1e2,1e2,1e2,40,40,20,10,4,4,2,1,0.4,0.2,0.1]; %% Micro sec
V_in=[44,44,44,45,44,46,48,55,62,80,92,92,83,63]*10^(-2); %% Volt
Delta_V_in=2*ones(1,14)*10^(-2); %% Volt
V_out=[40,41,41,40,41,40,38,38,35,26,16,5.4,1,1.4]*10^(-2); %% Volt
Delta_V_out=[2*ones(1,11),0.2*ones(1,3)]*10^(-2); %% Volt
delta_t=[5,5,5,4,4,4,4,3.4,3,2,1.2,0.6,0.35,0.4]; %% Micro sec
Delta_delta_t=[ones(1,7),0.2*ones(1,4),0.1,0.01,0.01]; %% Micro sec 

delta_phi=(2*pi)*freq_in.*(delta_t*10^(-6));
%% Si poteva anche fare senza i 10^-6 tanto si semplificano tutti :P
Delta_delta_phi=(2*pi)*(abs(1./(periodo_in*10^(-6))).*Delta_delta_t*10^(-6) + abs(-delta_t*10^(-6)./((periodo_in*10^(-6)).^2)).*Delta_periodo_in*10^(-6));

%% Rapporto fra l'ampiezza in uscita e in ingresso espresso in decibel
A_db=20*log10(V_out./V_in);

x1=log10(freq_in(1:7));
y1=A_db(1:7);
subplot(2,1,1)
plot(x1,y1,"r*");
hold on;
coeff1=polyfit(x1,y1,1);
xx1=linspace(x1(1),x1(7)+0.5,200);
yy1=coeff1(1)*xx1+coeff1(2);
plot(xx1,yy1,"g");

hold on;

x2=log10(freq_in(8:13));
y2=A_db(8:13);
plot(x2,y2,"bo");
hold on;
coeff2=polyfit(x2,y2,1);
xx2=linspace(x2(1)-0.1,x2(6),200);
yy2=coeff2(1)*xx2+coeff2(2);
plot(xx2,yy2,"m");

hold on;
subplot(2,1,2)
%%semilogx(freq_in(1:13),-delta_phi(1:13),"*");
plot(log10(freq_in(1:13)),-delta_phi(1:13),"*");
hold on
xx3=[2.5,6];
yy3=-pi/4*ones(1,2);
plot(xx3,yy3);
hold off
