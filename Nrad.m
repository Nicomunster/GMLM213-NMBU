function N = Nrad(a, b, lat) % Normal meridian krumningsradius
e2 = e_2(a,b);
N = a/sqrt(1-e2*(sin(lat))^2);
end