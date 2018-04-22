function [out] = accelerations(solarsystem, vec)
	
	G = 1.488e-34; %AU^3 Kg^-1 Day^-2

	out = zeros(length(solarsystem),0);

	for p0 = 1: length(solarsystem)
		a(1:3) = 0;
	    for p1 = 1: length(solarsystem)
	    	if p0 ~= p1
	    		C = G*solarsystem(p1).mass/(solarsystem(p0).mass/solarsystem(p1).mass+1)^2;
				r = norm(vec(p0,1:3)-vec(p1,1:3));
	        	a(1:3) = a(1:3) -(C/(r^3))*vec(p0,1:3);
	    	end
	    end
		out(p0, 1:3) = vec(p0, 4:6);
		out(p0, 4:6) = a(1:3);
	end

end