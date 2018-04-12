function [lat, lon, h] = ECEF2geodv(a, b, X, Y, Z) % Fra ECEF til ellipsoidiske koordinater ved Vermeilles metode

e2 = e_2(a, b);
p = (X^2+Y^2)/(a^2);
q = ((1-e2)/(a^2))*Z^2;
r = (p+q-e2^2)/6;
s = (e2^2)*(p*q)/(4*r^3);
t = (1+s+sqrt(s*(2+s)))^(1/3);
u = r*(1+t+(1/t));
v = sqrt(u^2+(e2^2)*q);
w = e2*((u+v-q)/(2*v));
k = sqrt(u+v+w^2)-w;
D = (k*sqrt(X^2+Y^2))/(k+e2);
h = ((k+e2-1)/k)*sqrt(D^2+Z^2);
lat = 2*(atan(Z/(D+sqrt(D^2+Z^2))));

if Y >= 0
    lon = pi/2 - 2*(atan(X/(sqrt(X^2+Y^2)+Y)));
else
    lon = -pi/2 + 2*(atan(X/(sqrt(X^2+Y^2)+Y)));
end

end