function [daz, ds] = TMcorr(a,b,x1,y1,x2,y2,lat0) % Kartplanskorreksjoner for avstand og retningsvinkel

[az1, az2, s] = geod2p(x1,y1,x2,y2);
latf = footlat(a,b,x1,lat0);
Ra = Rrad(a,b,latf,az1);

daz = -(x2-x1)/(6*Ra^2)*(2*y1+y2);
ds = s/(6*Ra^2)*(y1^2+y1*y2+y2^2);

end