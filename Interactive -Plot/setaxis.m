function setaxis(sel,data,t,zoom)
% Function to set axis properties
% Input sel = central body in plot
% Input zoom = zoom factor between 1 and 35
% Input data = matrix containing information of system at various states
% Input t = state at which plot is to be calculated

% --------------------------------------------------------------------
% Find centre of axis at values given
    x0 = data(sel,1,t);
    y0 = data(sel,2,t);
    z0 = data(sel,3,t);
% Calculate axis limits  
    x_min = -35.03+zoom+x0;
    x_max = 35.03-zoom+x0;
    y_min = -35.03+zoom+y0;
    y_max = 35.03-zoom+y0;
    z_min = -35.03+zoom+z0;
    z_max = 35.03-zoom+z0;
% Plot axis and set aspect ratio to prevent any stretching
    axis([x_min x_max y_min y_max z_min z_max]) 
    daspect([1 1 1])
end