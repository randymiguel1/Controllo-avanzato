function [TraiettoriaFinaleX, TraiettoriaFinaleY, Tf] = segmento(Xi, Xf, Yi,Yf, Ti, Ts,w)
%polinomi
h = @(m)(m.^3.*(6.*m.^2-15.*m+10)); 
%speed to cut 

dx = abs(Xf - Xi);
dy = abs(Yf - Yi);
 
 if (dx > dy)
     dc = dx;
 else
     dc = dy;
 end     
 
 Tf = Ti + dc/w;

 t = Ti:Ts:Tf;
 m =((t-Ti)/(Tf-Ti));
 TraiettoriaFinaleX = Xi + h(m)*(Xf - Xi);
 TraiettoriaFinaleY = Yi + h(m)*(Yf - Yi);
 
end