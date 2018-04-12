function [az1, az2, s] = geod2p(x1, y1, x2, y2) % Geodesiens andre (indirekte) problem i planet
az1 = atan2((y2-y1), (x2-x1));

if az1 < 0
    az1 = az1 + 2*pi;
end

az2 = az1 + pi;
if az2 > 2*pi
    az2 = az2 - 2*pi;
end

s = sqrt((x2-x1)^2 + (y2-y1)^2);
end