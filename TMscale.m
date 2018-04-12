function m = TMscale(a,b,x,y,lat0) % M�lestokkskorreksjon

latf = footlat(a,b,x,lat0);
Mf = Mrad(a,b,latf);
Nf = Nrad(a,b,latf);

m = 1 + (y^2)/(2*Mf*Nf);
end
