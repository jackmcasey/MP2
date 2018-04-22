tic
DAYS_PER_YEAR = 365.25;
SIM_TIME_EARTH_YEARS = 16;
SIM_TIME = round(DAYS_PER_YEAR*SIM_TIME_EARTH_YEARS);

solarsystem = init_cond();

init4 = rungekutta(solarsystem, 1, 4);
data = adamsbashforthmoulton(solarsystem, init4, 1, SIM_TIME);
%data = rungekutta(solarsystem, SIM_TIME);

% TODO: plot of orbit over time
% 2Dorbit(planet)

% TODO: 2D plot of system
% 2Dsystem(solarsystem)

% 3D plot of system.
figure
hold on
axis([-5 5 -5 5 -5 5])
f = waitbar(0,'Plotting results...');

for i = 1: length(solarsystem)
	p(i) = scatter3(data(i, 1, 1), data(i, 2, 1), data(i, 3, 1), 'o');
end

for t = 2 : 10 : SIM_TIME
	waitbar(t/SIM_TIME,f)%,sprintf('Plotting timestep %d of %d...', t, SIM_TIME));
	for i = 1 : length(solarsystem)
			x = data(i,1,t);
			y = data(i,2,t);
			z = data(i,3,t);
			scatter3(x, y, z, '.b');
			set(p(i), 'XData', x, 'YData', y, 'ZData', z);
	end
end

waitbar(1,f,'Plotting complete.');
close(f)
toc