function M = Mrad(a, b, lat) % Meridian krumningsradius
e2 = e_2(a,b);
M = a*(1-e2)/((1-e2*(sin(lat))^2)^(3/2));
end