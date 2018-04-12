% Geodetisk direkte problem, for elliposide
function [lat2,lon2,az2] = geod1(a,b,lat1,lon1,az1,s)

f = flattrykning(a,b);
e2 = e_2(a,b);

% Ellipsoide til kule
beta1 = atan(tan(lat1)*b/a);
sigma1 = atanc(tan(beta1),cos(az1));
az0 = asin(sin(az1)*cos(beta1));

g = e2*(cos(az0))^2;
H = 1/8*g-1/16*g^2+37/1024*g^3;
b0 = b*(1+1/4*g-3/64*g^2+5/256*g^3);

% Ellipsoidisk avstand
s1 = b0*(sigma1-H*sin(2*sigma1)-1/4*H^2*sin(4*sigma1)- ...
    1/6*H^3*sin(6*sigma1));
s2 = s1 + s;

% Sfærisk avstand
sigma2 = s2/b0+(H-3/4*H^3)*sin(2*s2/b0)+ ...
    5/4*H^2*sin(4*s2/b0)+29/12*H^3*sin(6*s2/b0); 
sigma = sigma2 - sigma1;

% Sfærisk n-vektor
x = cos(beta1)*cos(sigma) - sin(beta1)*sin(sigma)*cos(az1);
y = sin(sigma)*sin(az1);
z = sin(beta1)*cos(sigma) + cos(beta1)*sin(sigma)*cos(az1);
beta2 = atanc(z,(sqrt(x^2+y^2)));
deltalon = atanc(y,x);

% Kule til ellipsoide
K = 1/4*(f+f^2)*(cos(az0))^2-1/4*(cos(az0))^4;
lat2 = atanc(a*tan(beta2),b);
lon2 = lon1 + deltalon - f*sin(az0)*((1-K-K^2)*sigma...
    + K*sin(sigma)*cos(sigma1+sigma2))...
    + K^2*sin(sigma)*cos(sigma)*cos(2*(sigma1+sigma2));
az2 = atanc(sin(az1)*cos(beta1),(cos(beta1)*cos(sigma)*cos(az1) - sin(beta1*sin(sigma))));

end