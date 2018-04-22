function [solarsystem] = init_cond()
% All initial data was taken for the time and date of 01/01/2018 00:00:00.0
% Data courtesy of JPL Horizons.

sun.mass = 1.98855e30;		% Body mass. (KG)
sun.coords = [1.051235396203278E-03  6.681970283294764E-03 -1.021959224016685E-04];		% AU
sun.velocity = [-6.679975171267040E-06  4.182216724308407E-06  1.601209591023377E-07];	% AU/day
sun.radius = 1;	% Average radius of body. (AU) TODO: These are nonsensical placeholders.

%sun.mass = 1.98855e30;		% Body mass. (KG)
sun.coords = [0 0 0];		% AU
sun.velocity = [0 0 0];	% AU/day
%sun.radius = 464.57881e-5;	% Average radius of body. (AU)

mercury.mass = 3.301e23;
mercury.coords = [6.726225763209730E-02 -4.452397716226000E-01 -4.310437662329949E-02];
mercury.velocity = [2.218778463946898E-02  6.526273190919391E-03 -1.584718513868379E-03];
mercury.radius = 2;

venus.mass = 4.867e24;
venus.coords = [-2.099881888578360E-01  6.935102477170179E-01  2.149776727721043E-02];
venus.velocity = [-1.940980380454534E-02 -6.049439665635026E-03  1.036806883240350E-03];
venus.radius = 3;

earth.mass = 5.972e24;
earth.coords = [-7.669093138397997E-01 -6.453364136262559E-01 -7.404663710417766E-05];
earth.velocity = [1.084345404430487E-02 -1.317068933259396E-02  7.770739762225604E-07];
earth.radius = 4;

mars.mass = 6.417e23;
mars.coords = [-4.342290044400229E-01 -1.421971989340744E+00 -1.935493068112238E-02];	
mars.velocity = [1.390698882069885E-02 -2.873722950580952E-03 -4.015832517465610E-04];	
mars.radius = 5;

jupiter.mass = 1.899e27;
jupiter.coords = [-3.654903047741955E+00 -3.981220490447467E+00  9.826519576512345E-02];
jupiter.velocity = [5.470276209217102E-03 -4.744051938949984E-03 -1.026466911634955E-04];
jupiter.radius = 6;

saturn.mass = 5.685e26;
saturn.coords = [6.800210277699996E-01 -1.003494038746233E+01  1.474118507789453E-01];
saturn.velocity = [5.260143782735173E-03  3.591123239732652E-04 -2.155941047688117E-04];
saturn.radius = 6;

uranus.mass = 8.682e25;
uranus.coords = [1.750017028706318E+01  9.458732261871743E+00 -1.915872862912492E-01];
uranus.velocity = [-1.898925730667219E-03  3.276691122562585E-03  3.674276837662068E-05];
uranus.radius = 7;

neptune.mass = 1.024e26;
neptune.coords = [2.878493461543032E+01 -8.227893251344087E+00 -4.939403444347381E-01];
neptune.velocity = [8.414098671107541E-04  3.036776835198880E-03 -8.170470199488461E-05];
neptune.radius = 8;

pluto.mass = 1.471e22;
pluto.coords = [1.114234545016384E+01 -3.164218663267335E+01  1.628850796950538E-01];
pluto.velocity = [3.032755839766569E-03  3.797565302544893E-04 -9.300670164544968E-04];
pluto.radius = 9;

solarsystem = [sun mercury venus earth mars jupiter saturn uranus neptune pluto];

% Subsets of the system for testing purposes.
%solarsystem = [sun mercury venus earth mars];
%solarsystem = [sun jupiter];

end