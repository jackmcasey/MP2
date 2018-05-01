function plotsolarsys(ax,solarsystem,data,t,zoom,sel,txt)
% Function to plot system in current state
% Input ax = Axes to handle
% Input solarsystem = struct containing physical attributes of planets
% Input data = matrix containing information of system at various states
% Input zoom = zoom factor of system
% Input t = state at which plot is to be calculated
% Input txt = texture files for bodies


% -----------------------------------------------------------------

    axes(ax)
    % color of arrows pointing at planets to highlight planets because of
    % ludicrous scale
    pcolor = ['y','w','y','g','r','r','y','b','b','w'];
    cla                             % clear data on axis
    for i = 1 : length(solarsystem) % for loop plotting each body
        hold on
        axis manual
        setaxis(sel,data,t,zoom)
%         axis off
        [x, y, z] = sphere;     % create sphere
        x_val = data(i,1,t);    % Cartesian coordinates if sphere centre 
        y_val = data(i,2,t);
        z_val = data(i,3,t);
        % Plot size-scaled planets, scaled for display purposes
        surf(ax,(solarsystem(i).radius)^(1/4)*x+x_val, (solarsystem(i).radius)^(1/4)*y+y_val, (solarsystem(i).radius)^(1/4)*z+z_val,'EdgeColor','none','FaceColor','texturemap','Cdata',txt{i});
        % Plot arrow above planets to make locations more obvious
        quiver3(ax,x_val,y_val,z_val+(8/(1+sqrt(zoom))),0,0,(-8/(1+sqrt(zoom))),'LineWidth',2.5,'Color',pcolor(i));
%                     x = data(i,1,t);
%                     y = data(i,2,t);
%                     p(i) = scatter3(x, y, z, 'o');
%                     set(p(i), 'XData', x, 'YData', y, 'ZData', z); 

    end
    drawnow
    pause(0.1)
    hold off
end