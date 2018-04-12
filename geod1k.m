function [lat2, lon2, az2] = geod1k(R, lat1, lon1, az1, s) % Geodesiens første problem på kule

A = az1;
b = (pi/2)-lat1;
c = s/R;

a = acos(cos(b)*cos(c)+sin(b)*sin(c)*cos(A));
lat2 = (pi/2)-a;

C = atanc(sin(A)*sin(c)*sin(b),cos(c)-cos(a)*cos(b));
lon2 = lon1 + C;

B = atanc(sin(C)*sin(b)*sin(a),cos(b)-cos(a)*cos(c));
az2 = 2*pi-B;

end