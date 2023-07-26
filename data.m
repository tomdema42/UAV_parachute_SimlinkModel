clear
close all
clc

%% const data
mass = 15; %kg
alfa  = deg2rad(3); %angolo di attacco
rho = 1.225; %densità
S_ala = 1.49;
altitude=100;
%% Variable DATA (da modificare)
v_cruise = 15;
C_D = 0.014; 
% C_Dfriction = C_D;
Time_stop_motor=50;


%% Computed DATA
D = 0.5*rho*v_cruise^2*S_ala*C_D;
Thrust = D;

weight = mass*9.8;
CL = weight/(0.5*rho*v_cruise^2*S_ala);
L =  0.5*rho*v_cruise^2*S_ala*CL;
%%% Modfiche TOM
%% polare
polare = readmatrix("polare.csv");
angoli = linspace(polare(1,1),polare(end,1));
polare2 = spline(polare(:,1),polare(:,2),angoli);
%% parachute
CD_parachute = [1.7,1.3,1.10,0.9,0.87,0.85,0.84,0.82,0.81,0.80]; %da modificare prendendo estrapolazione dati da paper in funzione della veloctià
V_parachute = linspace(3,12,10);
diam_parachute = 3.04;% [m] diametro paracadute 30 cm
S_parachute = pi*(diam_parachute/2)^2;% area cerchio paracadute
Time_open_parachute=Time_stop_motor+10;
% sim mod_v1.slx
% clc
% 
% plot(ans.Position_x.Data,ans.Position_y.Data)
% xlabel(" X [m]")
% ylabel(" Z [m]")
% grid on

