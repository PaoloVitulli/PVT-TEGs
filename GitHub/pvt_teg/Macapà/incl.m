function theta = incl(l,b,g,d,w)

%This function calculates the the angle of incidence of beam radiation on a
%surface 

%l: latitude [deg]
%b: Slope [deg]
%g: Surface azimuth angle [deg]
%d: Declination [deg]
%w: Hour angle [deg]
%theta: Angle of incidence of solar radiation [deg]

theta = acosd(sind(d)*sind(l)*cosd(b)-sind(d)*cosd(l)*sind(b)*cosd(g)+cosd(d)*cosd(l)*cosd(b)*cosd(w)+cosd(d)*sind(l)*sind(b)*cosd(g)*cosd(w)+cosd(d)*sind(b)*sind(g)*sind(w));

end
