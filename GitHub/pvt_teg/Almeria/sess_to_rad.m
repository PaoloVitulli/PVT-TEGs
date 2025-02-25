function [r, deg] = sess_to_rad(s1,s2,s3)

deg=s1+(s2/60)+(s3/3600);

r = deg*pi/180; 

end


