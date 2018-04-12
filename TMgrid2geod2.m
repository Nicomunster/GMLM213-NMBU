% TMgrid to ellipsoid
function [lat,lon]=TMgrid2geod(a,b,north,east,lat0,lon0,scale,fnorth,feast)

north=north-fnorth;
east=east-feast;

x=north/scale;
y=east/scale;

latf=footlat(a,b,x,lat0);

Mf=Mrad(a,b,latf);
Nf=Nrad(a,b,latf);
ef=e_2(a,b)/(1-e_2(a,b))*cos(latf)^2;

lat=latf-1/2*y^2*tan(latf)/(Mf*Nf)+...
    1/24*y^4*tan(latf)/(Mf*Nf^3)*(5+3*tan(latf)^2+ef-9*ef*tan(latf)^2-4*ef^2)-...
    1/720*y^6*tan(latf)/(Mf*Nf^5)*(61+90*tan(latf)^2+45*tan(latf)^4);

l=y/(Nf*cos(latf))-...
  1/6*y^3/(Nf^3*cos(latf))*(1+2*tan(latf)^2+ef)+...
  1/120*y^5/(Nf^5*cos(latf))*(5+28*tan(latf)^2+24*tan(latf)^4);

lon=l+lon0;
end