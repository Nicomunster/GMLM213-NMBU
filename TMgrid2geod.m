function [lat, lon] = TMgrid2geod(a, b, north, east, lat0, lon0, scale, fnorth, feast) % Fra transversal mercator til ellipsoiden

north = north - fnorth;
east = east - feast;
x = north/scale;
y = east/scale;

latf = footlat(a,b,x,lat0);

e2 = e_2(a,b);
eps2f = (e2/(1-e2))*(cos(latf))^2;
Mf = Mrad(a,b,latf);
Nf = Nrad(a,b,latf);

lat = latf-(y^2*tan(latf))/(2*Mf*Nf)...
    +((y^4*tan(latf))/(24*Mf*Nf^3))*(5+3*(tan(latf))^2+eps2f-9*eps2f*(tan(latf))^2-4*eps2f^2);
lon = y/(Nf*cos(latf))-(y^3/(6*Nf^3*cos(latf)))*(1+2*(tan(latf))^2+eps2f)...
    +(y^5/(120*Nf^5*cos(latf)))*(5+28*(tan(latf))^2+24*(tan(latf))^4)+lon0;
end
