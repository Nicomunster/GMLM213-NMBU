function d4 = red2ell(d1, h1, h2, R, k) % Korrigerer observasjon til avstand på ellipsoiden. Korrigerer for refraksjon, så blir feil f. eks. for GNSS-vektor.
d4 = 2*R*asin(sqrt((R^2*(sin(d1*k/(2*R)))^2-k^2/4*(h2-h1)^2)/(k^2*(R+h1)*(R+h2))));
end