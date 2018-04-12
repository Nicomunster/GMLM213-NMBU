function [D, M, S] = deg2DMS(deg) % Konverterer fra desimalgrader til grader, minutter og sekunder
D = fix(deg);
M = 60*((deg)-D);
S = (M-fix(M))*60;
M = fix(M); 

if deg < 0
    M = -M;
    S = -S;
    if D == 0 && M == 0
        S = -S;
    elseif D == 0
        M = -M;
    end
end
end