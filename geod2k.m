function [az1, az2, s] = geod2k(R, lat1, lon1, lat2, lon2) % Geodesiens andre problem på kule

if lon2 < lon1
    a = (pi/2)-lat1;
    b = (pi/2)-lat2;
else
    b = (pi/2)-lat1;
    a = (pi/2)-lat2;
end
    
C = abs(lon1-lon2);

c = acos(cos(a)*cos(b)+sin(a)*sin(b)*cos(C));
s = c*R;

B = atanc(sin(C)*sin(b)*sin(a), cos(b)-cos(a)*cos(c));
A = atanc(sin(C)*sin(b)*sin(a), cos(a)-cos(b)*cos(c));

if lon2 < lon1
    az1 = 2*pi-B;
    az2 = A;
else
    az1 = A;
    az2 = 2*pi-B;
end
end
