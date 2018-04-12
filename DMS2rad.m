function [rad] = DMS2rad(D, M, S) % Konverterer fra grader, minutter og sekunder, til radianer
deg = DMS2deg(D, M, S);
rad = deg2rad(deg);
end