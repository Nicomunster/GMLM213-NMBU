function [lat, lon, h] = ECEF2geodk(R, X, Y, Z)
lat = atan2(Z, sqrt(X^2 + Y^2));
lon = atan2(Y, X);
h = sqrt(X^2 + Y^2)*cos(lat) + Z*sin(lat) - R;
end