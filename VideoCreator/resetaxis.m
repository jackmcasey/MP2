function resetaxis(ax,sldz,sldt,toggle,select,solarsystem,data,txt)
% Function to reset axis of plot on button press
% Input ax = Axes to handle
% Input sldz = slider containing zoom factor
% Input sldt = slider containg time information
% Input toggle = switch determining play or pause function of figure
% Input select = radiobutton group determining central body of system
% Input solarsystem = struct containing physical attributes of system

% -----------------------------------------------------------------

    axes(ax)                % set current axis
    sel = selector(select); % determine central body
    t = round(sldt.Value);  % determine time
    zoom = sldz.Value;      % zoom factor
    cla reset;              % reset axis 
    setaxis(sel,data,t,zoom)% new axis
    axis off
    toggle.Value = 0;
    ax.Clipping = 'off';
    plotsolarsys(ax,solarsystem,data,t,zoom,sel,txt)    % plot data
    rotate3d on             % allow rotation on mouse 
end
