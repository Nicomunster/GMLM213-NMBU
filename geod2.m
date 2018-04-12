% Geodetic indirect problem
% O. Mathisen, Geodetiske beregninger 1995
function [az1,az2,s]=geod2(a,b,lat1,lon1,lat2,lon2)

epsilon=1e-10;
dlon_old=-1;

f=(a-b)/a;
e2=(a^2-b^2)/b^2;

beta1=atan(b/a*tan(lat1));
beta2=atan(b/a*tan(lat2));

dlon=lon2-lon1;
dlon_new=dlon;

while (abs(dlon_new-dlon_old)>epsilon)

   dlon_old=dlon_new;

   X=cos(beta1)*sin(beta2)-sin(beta1)*cos(beta2)*cos(dlon_old);
   Y=cos(beta2)*sin(dlon_old);
   Z=sin(beta1)*sin(beta2)+cos(beta1)*cos(beta2)*cos(dlon_old);

   sigma=atan2(sqrt(X^2+Y^2),Z);
   az1=atanc(Y,X);
   az0=asin(sin(az1)*cos(beta1));

   sigma1=atan2(tan(beta1),cos(az1));
   sigma2=sigma1+sigma;

   K=(f+f^2)/4*cos(az0)^2-f^2/4*cos(az0)^4;

   dlon_new=dlon+f*sin(az0)*((1-K-K^2)*sigma+K*sin(sigma)*cos(sigma1+sigma2)+K^2*sin(sigma)*cos(sigma)*cos(2*(sigma1+sigma2)));

end

dlon=dlon_new;

az2=atanc(cos(beta1)*sin(dlon),(cos(beta1)*sin(beta2)*cos(dlon)-sin(beta1)*cos(beta2)));

g=e2*cos(az0)^2;
H=1/8*g-1/16*g^2+37/1024*g^3;
b0=b*(1+1/4*g-3/64*g^2+5/256*g^3);

s=b0*(sigma-2*H*sin(sigma)*cos(sigma1+sigma2)-H^2/2*sin(2*sigma)*cos(2*(sigma1+sigma2))-H^3/3*sin(3*sigma)*cos(3*(sigma1+sigma2)));
