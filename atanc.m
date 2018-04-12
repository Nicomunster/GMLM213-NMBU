%  Modified atan
function [atanc]=atanc(y,x)
z=atan2(y,x);
atanc=mod(2*pi+z,2*pi);
end