function [motoX, motoY, Time] = cuadrato(Xi,Yi,Xf,Yf,Ti)

Ts = 0.1;
w = 10*pi;
%Punto 1
[SubTrayX, SubTrayY,Tf] = segmento(Xi,Xi,Yi, Yf, Ti, Ts,w);
motoX = SubTrayX;
motoY = SubTrayY;

%Punto 2

[SubTrayX, SubTrayY,Tf] = segmento(Xi,Xf, Yf , Yf , Tf, Ts,w);
motoX = [motoX, SubTrayX];
motoY = [motoY, SubTrayY];

%Punto 3
[SubTrayX, SubTrayY,Tf] = segmento(Xf,Xf,Yf, Yi, Tf, Ts,w);
motoX = [motoX, SubTrayX];
motoY = [motoY, SubTrayY];

%Punto 4
[SubTrayX, SubTrayY,Tf] = segmento(Xf,Xi,Yi, Yi, Tf, Ts,w);
motoX = [motoX, SubTrayX];
motoY = [motoY, SubTrayY];

Time = Tf;

end