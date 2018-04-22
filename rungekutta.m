function [out] = rungekutta(solarsystem, h, iterations)

    omega = [1/6 2/6 2/6 1/6];

    f = waitbar(0,'Setting up Runge-Kutta...');

    % Extract coords and velocities.
    for i = 1: length(solarsystem)
        vec0(i, 1:3) = solarsystem(i).coords;
        vec0(i, 4:6) = solarsystem(i).velocity;
    end

    % Zero out array for data.
    out = zeros(length(solarsystem),6,iterations);

    % initial conditions TODO
    v = vec0; 

    % Store values for first iteration.
    out(:,:,1) = v;
    
    for count = 2:iterations
        waitbar(count/iterations,f,sprintf('Runge-Kutta, Iteration %d of %d...', count, iterations));
        tv = v; % Temporary variable.
        k1 = h*accelerations(solarsystem, tv);

        tv = v + 0.5*k1;
        k2 = h*accelerations(solarsystem, tv);

        tv = v + 0.5*k2;
        k3 = h*accelerations(solarsystem, tv);

        tv = v + 1.0*k3;
        k4 = h*accelerations(solarsystem, tv);

        % Update v.
        v = v + (omega(1)*k1 + omega(2)*k2 + omega(3)*k3 + omega(4)*k4);

        % Store values for this iteration.
        out(:,:,count) = v;
    end
    waitbar(1,f,'Runge-Kutta Complete.');
    close(f)
end