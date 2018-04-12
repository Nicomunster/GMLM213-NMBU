function [D, M, S] = rad2DMS(rad) % Konverterer fra radianer til grader, minutter og sekunder
deg = rad2deg(rad);
[D, M, S] = deg2DMS(deg);
end