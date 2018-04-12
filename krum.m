function [M, N] = krum(a, b, lat) % Beregner meridian krumningsradius (M) og normal merdian krumningrsradius (N)
e_2 = e2(a,b);
M = (a*(1-e_2))/((1-e_2*((sin(lat))^2))^(3/2));
N = a/sqrt(1-e_2*((sin(lat))^2));
end