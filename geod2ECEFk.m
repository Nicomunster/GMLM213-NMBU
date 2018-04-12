function [X, Y, Z] = geod2ECEFk(R, lat, lon, h)
X = (R+h)*cos(lat)*cos(lon);
Y = (R+h)*cos(lat)*sin(lon);
Z = (R+h)*sin(lat);
end

