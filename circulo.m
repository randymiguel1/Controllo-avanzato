function [MovX, MovY, Time] = circulo(Xc,Yc, R, Ti)
 h = @(m)(m.^3.*(6.*m.^2-15.*m+10));
 V = 10*pi;

 Tf = Ti + (2*pi*R)/V;
 Ts = 0.1;

 t = Ti:Ts:Tf;
 m =((t-Ti)/(Tf-Ti));
 Oi = 2*pi;
 Of = 0;
 
 O = Oi + h(m)*(Of - Oi);

 MovX = Xc + R*cos(O);
 MovY = Yc + R*sin(O);
 Time = Tf;
 
end