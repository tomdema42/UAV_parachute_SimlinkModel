clear
close all
clc

%% const data
mass = 20; %kg
alfa  = deg2rad(3); %angolo di attacco
rho = 1.225; %densità
S_ala = .46*7.3;
altitude=100;
%% Variable DATA (da modificare)
v_cruise = 13;
C_D = 0.029; 
% C_Dfriction = C_D;
Time_stop_motor=200;


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
CD_parachute = 0.3; %da modificare prendendo estrapolazione dati da paper in funzione della veloctià
% diam_parahute = 30*0.01;% [m] diametro paracadute 30 cm
S_parachute = S_ala;% area cerchio paracadute
