function [Ra] = Rrad(a, b, lat, az1) % Krumningsradius i retning az1
M = Mrad(a, b, lat);
N = Nrad(a, b, lat);
Ra = (M*N)/(N*(cos(az1))^2 + M*(sin(az1))^2);
end
