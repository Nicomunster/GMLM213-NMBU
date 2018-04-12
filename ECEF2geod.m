function [lat, lon, h] = ECEF2geod(a, b, X, Y, Z) % Fra ECEF til ellipsoidiske koordinater ved iterasjon
e2 = e_2(a, b);
lat0 = 0;
lat = atan2(Z, sqrt(X^2 + Y^2));
N = Nrad(a, b, lat);

while abs(lat0-lat) > 10^(-10)
    lat0 = lat;
    lat = atan2(Z+N*e2*sin(lat), sqrt(X^2+Y^2));
    N = Nrad(a, b, lat);
end

lon = atan2(Y, X);
h = sqrt(X^2 + Y^2)*cos(lat) + Z*sin(lat) - N*(1-e2*(sin(lat))^2);
end