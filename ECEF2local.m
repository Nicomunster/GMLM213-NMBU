function [e, n, u] = ECEF2local(lat, lon, dX, dY, dZ)
dP = [dX;dY;dZ];
M = [-sin(lon), cos(lon), 0;
    -sin(lat)*cos(lon), -sin(lat)*sin(lon), cos(lat);
    cos(lat)*cos(lon), cos(lat)*sin(lon), sin(lat)];
dp1 = M*dP;
e = dp1(1);
n = dp1(2);
u = dp1(3);