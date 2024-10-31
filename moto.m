function [motoX, motoY, Time] = moto(Xi,Yi,Xf,Yf,Ti)
w = 5*pi;
Ts = 0.1;

[SubTrayX, SubTrayY,Tf] = segmento(Xi,Xf,Yi, Yf, Ti, Ts , w);
motoX = SubTrayX;
motoY = SubTrayY;

Time = Tf;
end