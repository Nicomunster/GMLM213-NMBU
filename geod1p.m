function [x2, y2] = geod1p(x1, y1, az1, s) % Geodesiens f�rste (direkte) problem i planet
x2 = x1 + s*cos(az1);
y2 = y1 + s*sin(az1);
end