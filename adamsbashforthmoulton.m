function Storage = adamsbashforthmoulton(solarsystem, initial4, h, N)
	
	f = waitbar(0,'Running Adams-Bashforth-Moulton...');

	Storage = zeros(length(solarsystem), 6, N+4); % assign store for N+4 time steps of data
	Storage(:,:,[1:4]) = initial4; % store initial data
	v1 = initial4(:,:,1); % state vector at n-4
	v2 = initial4(:,:,2); % state vector at n-3
	v3 = initial4(:,:,3); % state vector at n-2
	v4 = initial4(:,:,4); % state vector at n-1

	for count = 5:N
		waitbar(count/N,f)%,sprintf('Adams-Bashforth-Moulton, Iteration %d of %d...', count, N));
		% Predictor: predict value w at time step count
		f1 = accelerations(solarsystem, v1);
		f2 = accelerations(solarsystem, v2);
		f3 = accelerations(solarsystem, v3);
		f4 = accelerations(solarsystem, v4);

		w = v4 + h*(((55/24)*f4)-((59/24)*f3)+((37/24)*f2)-((9/24)*f1));
		
		% Corrector: correct value at time step count
		f5 = accelerations(solarsystem, w);
		z = v4 + h*(((9/24)*f5)+((19/24)*f4)-((5/24)*f3)+((1/24)*f2));

		% Update.
		v1 = v2;
		v2 = v3;
		v3 = v4;
		v4 = z;
		Storage(:,:,count) = v4; % store new position
	end
	waitbar(1,f,'Adams-Bashforth-Moulton Complete.');
    close(f)
end