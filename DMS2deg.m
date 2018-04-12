function [deg] = DMS2deg(D, M, S) % Konverterer fra grader, minutter og sekunder til desimalgrader
if D < 0
    M = -M;
    S = -S;
elseif M < 0
    S = -S;
end

deg = D + M/60 + S/3600;

end