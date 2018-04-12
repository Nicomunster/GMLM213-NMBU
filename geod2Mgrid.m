function [north, east] = geod2Mgrid(a, b, lat, lon)

e = sqrt(e_2(a,b));

north = a*(log(tan(pi/4+lat/2))...
    + e/2*log((1-e*sin(lat))...
    /(1+e*sin(lat))));
east = a*lon;

end
