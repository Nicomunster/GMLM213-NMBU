function [north, east] = geod2TMgrid(a, b, lat, lon, lat0, lon0, scale, fnorth, feast) % Fra ellipsoiden til transversal mercator

B = Marc(a, b, lat)-Marc(a,b,lat0);
N = Nrad(a, b, lat);
e2 = e_2(a, b);
eps2 = e2/(1-e2)*(cos(lat))^2;

x = B + 1/2*(lon-lon0)^2*N*sin(lat)*cos(lat)...
    +1/24*(lon-lon0)^4*N*sin(lat)*(cos(lat))^3*(5-(tan(lat))^2+9*eps2+4*eps2^2);
y = (lon-lon0)*N*cos(lat)+1/6*(lon-lon0)^3*N*(cos(lat))^3*(1-(tan(lat))^2+eps2)...
    +1/120*(lon-lon0)^5*N*(cos(lat))^5*(5-18*(tan(lat))^2+(tan(lat))^4);

x = x*scale;
y = y*scale;

north = x + fnorth;
east = y + feast;

end