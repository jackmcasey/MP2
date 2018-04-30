tic         % time function

% Function to plot an interactive plot of the solar system using
% Adam-Bashforth-Moulton Method with Runge-Kutta starter. Opens 2 figures,
% one for plots of system, second for UI Controls. Controls allow for
% custon zoom, play speed, central focus, viewing angle, and play button.
% Mouse clicks on system plot and directional keys cause rotations in 3D.


% important variables determining timescale of simulation
DAYS_PER_YEAR = 365.25;
SIM_TIME_EARTH_YEARS = 1;
SIM_TIME = round(DAYS_PER_YEAR*SIM_TIME_EARTH_YEARS);
h = 1;

solarsystem = init_cond();  % initial conditions of system

init4 = rungekutta(solarsystem, h, 4);  % first 4 conditions for ADM
data = adamsbashforthmoulton(solarsystem, init4, h, SIM_TIME);  % create data for simulation
%data = rungekutta(solarsystem, SIM_TIME);

% ----------------------------------------------------------------------
% Set up figures for plots and controls


uifig = uifigure;       % create figure for controls
axis([-32 32 -32 32 -32 32])    % create axis for data 
f = waitbar(0,'Plotting results...');
hold on
axis manual     % prevent auto axis
axis off        % remove axis outline 
ax1 = gca;      % name axis
ax1.Clipping = 'off';   % allow all bodies to be visualised within figure

ax2 = axes(gcf,'Position',[0 0 1 1]);   % create background axis
bg = imread('space.jpg');              % set background
imagesc(bg);
ax2.HandleVisibility = 'off';           % background axis not variable now

% array containing names of planet textures
txture = ["sun.jpg","mercury.jpg","venus.jpg","earth.jpg","mars.jpg","jupiter.jpg","saturn.jpg","uranus.jpg","neptune.jpg","pluto.jpg"];
   
for tx = 1:length(solarsystem)
    txt{tx} = imread(char(txture(tx)));
end

% ----------------------------------------------------------------------
% Plot bodies

plotsolarsys(ax1,solarsystem,data(:,:,1),1,1,1,txt); % plot initial conditions
axes(ax1)   % set current axis for plot and allow rotations
rotate3d on % allow rotations
waitbar(1,f,'Plotting complete.');
close(f)

% ----------------------------------------------------------------------
% UI Controls

% create various sliders and buttons

sldt = uislider(uifig,'Position',[200 125 200 3],'Limits',[1 SIM_TIME]);% time slider
sldz = uislider(uifig,'Position',[200 200 200 3],'Limits',[0 35]);% zoom slider
speed = uislider(uifig,'Position',[200 275 200 3],'Limits',[1 40]);% frame speed slider
toggle = uiswitch(uifig,'Position',[40 275 120 15],'Items',{'Stop','Play'});%play switch    
select = uibuttongroup(uifig,'Position',[0 0 120 220]);% centre select button group

% Labels for UI Controls
txtt = uilabel(uifig,'Position',[270 135 100 20],'Text','Time (Days)');
txtz = uilabel(uifig,'Position',[285 210 100 20],'Text','Zoom');
txtspeed = uilabel(uifig,'Position',[230 285 200 20],'Text','Speed (Days per Frame)');
txtsel = uilabel(uifig,'Position',[15 225 100 20],'Text','Central Body');

% Callback function for each slider etc.
sldt.ValueChangedFcn = @(sldt,event) solarsyscallback(SIM_TIME,data,solarsystem,sldt,sldz,speed,toggle,select,txt);
sldz.ValueChangedFcn = @(sldz,event) solarsyscallback(SIM_TIME,data,solarsystem,sldt,sldz,speed,toggle,select,txt);
toggle.ValueChangedFcn = @(toggle,event) solarsyscallback(SIM_TIME,data,solarsystem,sldt,sldz,speed,toggle,select,txt);
select.SelectionChangedFcn = @(select,event) solarsyscallback(SIM_TIME,data,solarsystem,sldt,sldz,speed,toggle,select,txt);
speed.ValueChangedFcn = @(speed,event) solarsyscallback(SIM_TIME,data,solarsystem,sldt,sldz,speed,toggle,select,txt);

% Radiobuttons relating to buttongroup select above
sel_sun = uiradiobutton(select,'Text','Sun','Position',[10 200 70 15]);
sel_merc = uiradiobutton(select,'Text','Mercury','Position',[10 180 70 15]);
sel_venus = uiradiobutton(select,'Text','Venus','Position',[10 160 70 15]);
sel_earth = uiradiobutton(select,'Text','Earth','Position',[10 140 70 15]);
sel_mars = uiradiobutton(select,'Text','Mars','Position',[10 120 70 15]);
sel_jup = uiradiobutton(select,'Text','Jupiter','Position',[10 100 70 15]);
sel_sat = uiradiobutton(select,'Text','Saturn','Position',[10 80 70 15]);
sel_uran = uiradiobutton(select,'Text','Uranus','Position',[10 60 70 15]);
sel_nept = uiradiobutton(select,'Text','Neptune','Position',[10 40 70 15]);
sel_pluto = uiradiobutton(select,'Text','Pluto','Position',[10 20 70 15]);

% button to reset axis
reset = uibutton(uifig,'Position',[175 35 120 20],'Text','Reset Axis','ButtonPushedFcn',@(reset,event) resetaxis(gca,sldz,sldt,toggle,select,solarsystem,data,txt)) ;
% button to close simulation
ex = uibutton(uifig,'Position',[325 35 120 20],'Text','Close','ButtonPushedFcn',@(ex,event) exfig(uifig)) ;

toc



