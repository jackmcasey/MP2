function solarsyscallback(SIM_TIME,data,solarsystem,sldt,sldz,speed,toggle,select,txt)
% Function called on changing of user controlled objects to change current
% plot of solarsystem based on input.
% Input SIM_TIME = time in days of simulation
% Input data = matrix containing information of system at various states
% Input solarsystem = struct containing physical attributes of planets 
% Input sldt = slider containg time information
% Input sldz = slider containing zoom factor
% Input speed = slider determining rate of frame skip in plotting when...
% ...toggle value is play
% Input toggle = switch object acting as play/pause button
% Input select = state of radio button group to select central body 
% Input txt = texture files for bodies

    zoom = sldz.Value;          % set zoom angle as float
    t = round(sldt.Value);      % set time as int
    sel = selector(select);     % select central body
    switch toggle.Value         % determine whether simulation play
        case 'Play'
            % play at rate determined by speed
            for i = t : 2*round(speed.Value) : SIM_TIME-1   

                plotsolarsys(gca,solarsystem,data,i,zoom,sel,txt) % plot bodies
                if i > sldt.Limits(2)       % check if simulation complete
                    sldt.Value = sldt.Limits(2);
                    toggle.Value = 'Stop';  % if so stop
                else
                    sldt.Value = i;
                end
                
                if toggle.Value == 'Stop'
                    break
                end
            end
        % other case
        case 'Stop'
            plotsolarsys(gca,solarsystem,data,t,zoom,sel,txt)
    end
end