
%This script calculates the incident angle during average days of months in
%a defined location, that is Macapà (Brazil). 

%Macapà: 0° 3' 14.87'' N ---> 0.054131 N 
%Macapà: -52° 55' 34.49" E ---> -51.073752 E 

l=0.054131; %Latitude [deg]
b=0; %Slope angle [deg]
g=0; %Azimuth angle [deg]
w=[-180:15:180]; %Hour angle [deg]

% January, 17
d_jan=-20.9; %Declination [deg]

t_jan=zeros(1,length(w));
for i=1:length(w)
    t_jan(i)=incl(l,b,g,d_jan,w(i)); %Angle of incidence of solar radiation [deg]
end
t_jan_rad=deg2rad(t_jan); %Angle of incidence of solar radiation [rad]

%February, 16
d_feb=-13.0;

t_feb=zeros(1,length(w));
for i=1:length(w)
    t_feb(i)=incl(l,b,g,d_feb,w(i));
end
t_feb_rad=deg2rad(t_feb);

%March, 16
d_mar=-2.4;

t_mar=zeros(1,length(w));
for i=1:length(w)
    t_mar(i)=incl(l,b,g,d_mar,w(i));
end
t_mar_rad=deg2rad(t_mar);

%April, 15
d_apr=9.4;

t_apr=zeros(1,length(w));
for i=1:length(w)
    t_apr(i)=incl(l,b,g,d_apr,w(i));
end
t_apr_rad=deg2rad(t_apr);

%May, 15
d_may=18.8;

t_may=zeros(1,length(w));
for i=1:length(w)
    t_may(i)=incl(l,b,g,d_may,w(i));
end
t_may_rad=deg2rad(t_may);

%June, 11
d_jun=23.1;

t_jun=zeros(1,length(w));
for i=1:length(w)
    t_jun(i)=incl(l,b,g,d_jun,w(i));
end
t_jun_rad=deg2rad(t_jun);

%July, 17
d_jul=21.2;

t_jul=zeros(1,length(w));
for i=1:length(w)
    t_jul(i)=incl(l,b,g,d_jul,w(i));
end
t_jul_rad=deg2rad(t_jul);

%August, 16
d_aug=13.5;

t_aug=zeros(1,length(w));
for i=1:length(w)
    t_aug(i)=incl(l,b,g,d_aug,w(i));
end
t_aug_rad=deg2rad(t_aug);

%September, 15
d_sep=2.2;

t_sep=zeros(1,length(w));
for i=1:length(w)
    t_sep(i)=incl(l,b,g,d_sep,w(i));
end
t_sep_rad=deg2rad(t_sep);

%October, 15
d_oct=-9.6;

t_oct=zeros(1,length(w));
for i=1:length(w)
    t_oct(i)=incl(l,b,g,d_oct,w(i));
end
t_oct_rad=deg2rad(t_oct);

%November, 14
d_nov=-18.9;

t_nov=zeros(1,length(w));
for i=1:length(w)
    t_nov(i)=incl(l,b,g,d_nov,w(i));
end
t_nov_rad=deg2rad(t_nov);

%December
d_dec=-23.0;

t_dec=zeros(1,length(w));
for i=1:length(w)
    t_dec(i)=incl(l,b,g,d_dec,w(i));
end
t_dec_rad=deg2rad(t_dec);

matrix_deg = [t_jan', t_feb', t_mar', t_apr', t_may', t_jun', t_jul', t_aug', t_sep', t_oct', t_nov', t_dec'];
matrix_rad = [t_jan_rad', t_feb_rad', t_mar_rad', t_apr_rad', t_may_rad', t_jun_rad', t_jul_rad', t_aug_rad', t_sep_rad', t_oct_rad', t_nov_rad', t_dec_rad'];
