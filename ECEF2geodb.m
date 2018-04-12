function [lat, lon, h] = ECEF2geodb(a, b, X, Y, Z) % Fra ECEF til ellipsoidiske koordinater ved Bowrings metode

rho = sqrt((X^2)+(Y^2));
e2 = e_2(a, b);
en2 = e_n2(a, b);
my = atan((Z*a)/(rho*b));

lat = atan((Z+en2*b*(sin(my))^3)/(rho-e2*a*(cos(my))^3));

lon = atan(Y/X);

N = Nrad(a, b, lat);
h = sqrt(X^2 + Y^2)*cos(lat) + Z*sin(lat) - N*(1-e2*(sin(lat))^2);
end
