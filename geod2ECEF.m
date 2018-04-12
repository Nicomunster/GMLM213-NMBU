function [X, Y, Z] = geod2ECEF(a, b, lat, lon, h) % Fra ellipsoidiske koordinater til ECEF
N = Nrad(a,b,lat);

X = (N+h)*cos(lat)*cos(lon);
Y = (N+h)*cos(lat)*sin(lon);
Z = (((b^2)/(a^2))*N+h)*sin(lat);
end