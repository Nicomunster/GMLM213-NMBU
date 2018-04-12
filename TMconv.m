function gamma = TMconv(a,b,x,y,lat0) % Meridiankonvergens

latf = footlat(a,b,x,lat0);
Nf = Nrad(a,b,latf);
e2 = e_2(a,b);
eps2f = e2/(1-e2)*(cos(latf))^2;
gamma = y*tan(latf)/Nf-y^3*tan(latf)/(3*Nf^3)*(1+(tan(latf))^2-eps2f-2*eps2f^2);

end