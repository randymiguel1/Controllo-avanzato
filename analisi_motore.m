%% parametri del motori
Ra=1;
La=0.005;
J=0.05;
B=0.002;
Km=0.56;

%% Funzione di trasferimento velocita/voltagio
w_v = tf([Km], [La*J (Ra*J + La*B) (Ra*B + Km*Km)]);

%% Funzione di trasferimento elettrico
e = tf([1], [La Ra]);

%% Funzione di trasferimento meccanico
m = tf([1], [J B]);

%% Controllore di posizione
C_p = 1;

%% Controllore di velocita
C_w = 20*(tf([J B],[1 0]));

%% Controllore di corrente
C_i = 200*(tf([La Ra],[1 0]));

c_w_i = C_p*C_w*C_i*e*m*Km

%% Diagramma dei poli e zeri
figure(1);
hold
pzmap(e);
pzmap(m);
pzmap(w_v);


figure(2);
bodeplot(w_v);




