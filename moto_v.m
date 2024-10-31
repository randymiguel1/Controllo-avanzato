function [motoX, motoY, Time] = moto_v(Xi,Yi,Xf,Yf,Ti)
w = 20*pi;
Ts = 0.1;

[SubTrayX, SubTrayY,Tf] = segmento(Xi,Xf,Yi, Yf, Ti, Ts , w);
motoX = SubTrayX;
motoY = SubTrayY;

Time = Tf;
end