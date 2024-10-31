Ra=1;
La=0.005;
J=0.05;
B=0.002;
Km=0.56;

%Limitazioni dei motori |V| < 75 V , | I | < 10 A
Pm = -B/J
Pe = -Ra/La

%% Posizione di Riposo del Laser è (2.5,1.5) 

offsetX = 2.5;
offsetY = 1.5;

conversione = 60*pi;

PosizioneAttualeX = offsetX*conversione;
PosizioneAttualeY = offsetY*conversione;

%% Posizione
 [TraiettoriaX, TraiettoriaY, TraiettoriaTime] = moto_v(-2.5, -1.5 ,PosizioneAttualeX, PosizioneAttualeY, 0);
 TraiettoriaTotaleX = TraiettoriaX;
 TraiettoriaTotaleY = TraiettoriaY;
 TotaleTime = TraiettoriaTime;
 figures = struct('name','moto', 'color', 'w', 'endX' , length(TraiettoriaTotaleY));
 
 %% Posizione iniziale della Figure 1
 [TraiettoriaX, TraiettoriaY, TraiettoriaTime] = moto_v(PosizioneAttualeX, PosizioneAttualeY ,PosizioneAttualeX - 0.5*conversione , PosizioneAttualeY + 1.5*conversione, TraiettoriaTime);
 TraiettoriaTotaleX = [TraiettoriaTotaleX, TraiettoriaX];
 TraiettoriaTotaleY = [TraiettoriaTotaleY, TraiettoriaY];
 TotaleTime = TotaleTime +  TraiettoriaTime;
 figures = [figures struct('name','moto', 'color', 'm', 'endX' , length(TraiettoriaTotaleY))];
 PosizioneAttualeX = PosizioneAttualeX - 0.5*conversione;
 PosizioneAttualeY = PosizioneAttualeY + 1.5*conversione;
 
%% Figura 1
[TraiettoriaX, TraiettoriaY,TraiettoriaTime] =  cuadrato(PosizioneAttualeX, PosizioneAttualeY , PosizioneAttualeX - 2*conversione, PosizioneAttualeY - 2*conversione, TraiettoriaTime);
TraiettoriaTotaleX = [TraiettoriaTotaleX, TraiettoriaX];
TraiettoriaTotaleY = [TraiettoriaTotaleY, TraiettoriaY];
TotaleTime = TotaleTime +  TraiettoriaTime;
figures = [figures struct('name','cuadrato', 'color', 'r', 'endX' , length(TraiettoriaTotaleY))];

%% Posicion init Figure 2
R = 0.75*conversione;
[TraiettoriaX, TraiettoriaY, TraiettoriaTime] = moto_v(PosizioneAttualeX , PosizioneAttualeY ,PosizioneAttualeX + (2*R) + 0.05*conversione, PosizioneAttualeY - (R + 0.0*conversione), TraiettoriaTime);
TraiettoriaTotaleX = [TraiettoriaTotaleX, TraiettoriaX];
TraiettoriaTotaleY = [TraiettoriaTotaleY, TraiettoriaY];
TotaleTime = TotaleTime +  TraiettoriaTime;
figures = [figures struct('name','moto', 'color', 'm', 'endX' , length(TraiettoriaTotaleY))];
 
PosizioneAttualeX = PosizioneAttualeX + R + 0.05*conversione;
PosizioneAttualeY = PosizioneAttualeY - (R + 0.0*conversione);

%% Figura 2
[TraiettoriaX, TraiettoriaY, TraiettoriaTime] =  circulo(PosizioneAttualeX, PosizioneAttualeY , R, TraiettoriaTime);
TraiettoriaTotaleX = [TraiettoriaTotaleX, TraiettoriaX];
TraiettoriaTotaleY = [TraiettoriaTotaleY, TraiettoriaY];
TotaleTime = TotaleTime +  TraiettoriaTime;
figures = [figures struct('name','Circulo', 'color', 'b', 'endX' , length(TraiettoriaTotaleY))];

%All time 14.95

fig = figure('Name','Cut Figures','NumberTitle','off')

%% Lastre

rectangle('Position',[0 0 5 3])
grid on

axis equal
hold on
xlabel('x-axis (m)')
xticks([0 : 0.5 : 5])
xticklabels({-2.5 : 0.5 : 2.5})
ylabel('y-axis (m)')
yticks([0 : 0.5 : 3])
yticklabels({-1.5 : 0.5 : 1.5})

%%
nextFig = 1;
for k=1 : length(figures)
 for i = nextFig :figures(k).endX
     pause(0.005)      % could comment pause while save a graphic
     plot(TraiettoriaTotaleX(i)*1/conversione, TraiettoriaTotaleY(i)*1/conversione,'color',figures(k).color,'Marker','.', 'MarkerSize', 5)
     nextFig = figures(k).endX;
 end 

end

%% WorkSpace
PlotX = timeseries(TraiettoriaTotaleX);
PlotY = timeseries(TraiettoriaTotaleY);
dX = diff(TraiettoriaTotaleX);
dY = diff(TraiettoriaTotaleY);
PlotVelX = timeseries(dX);
PlotVelY = timeseries(dY);
PlotAcelX = timeseries(diff(dX));
PlotAcelY = timeseries(diff(dY));