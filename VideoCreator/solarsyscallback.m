function solarsyscallback(SIM_TIME,fig,data,solarsystem,sldt,sldz,speed,toggle,rec,select,txt,vid)

% Version 2 for use with video writing script create_vid_solar.m
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
% Input rec = switch object acting as record button
% Input select = state of radio button group to select central body 
% Input txt = texture files for bodies

% ------------------------------------------------------------
    
    t = round(sldt.Value);      % set time as int
    zoom = sldz.Value;          % set zoom angle as float
    recor = rec.Value;
    sel = selector(select);     % select central body
    switch toggle.Value         % determine whether simulation play
        case 1
            % play at rate determined by speed
            for i = t : 2*round(speed.Value) : SIM_TIME-1   
                plotsolarsys(gca,solarsystem,data,i,zoom,sel,txt) % plot bodies
                if recor == 1                       % record frames 
                    current_frame = getframe(fig);                  
                    writeVideo(vid,current_frame);
                    waitfor(current_frame) 
                end
                if i > sldt.Limits(2)       % check if simulation complete
                    sldt.Value = sldt.Limits(2);
                    toggle.Value = 0;  % if so stop
                else
                    sldt.Value = i;
                end
                
                if toggle.Value == 0
                    break
                end
            end
        % other case
        case 0
            plotsolarsys(gca,solarsystem,data,t,zoom,sel,txt)
    end
end
