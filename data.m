clear
close all
clc

%% Aggiornato con dati adatti ad Amelia 1.0

Time_simulation=400;
dt=0.01;

%% const data
altitude=250;
mass = 15; %kg
alfa  = deg2rad(2); %angolo di attacco
% rho = densita_a_quota(altitude); %densità
rho=1.1959; % Preso da Simulink
rho=1.255;
S_ala = 1.484; %senza winglet

%% Variable DATA (da modificare)
% v_cruise = 15;
C_D = 0.024; 
Time_stop_motor=200;
Time_start_parachute= Time_stop_motor+15;
CD_caduta = 1.01; %VSP

%% Computed DATA

CL = 0.691;
weight = mass*9.8;
v_cruise = sqrt(weight/(0.5*rho*S_ala*CL));
D = 0.5*rho*v_cruise^2*S_ala*C_D;
Thrust = D;
L =  0.5*rho*v_cruise^2*S_ala*CL;
v_discesa = 5;

%% polare

polare = readmatrix("polare.csv");
angoli = linspace(polare(1,1),polare(end,1));
polare2 = spline(polare(:,1),polare(:,2),angoli);

%% parachute
% CD_parachute = [1.7,1.3,1.10,0.9,0.87,0.85,0.84,0.82,0.81,0.80]; %da modificare prendendo estrapolazione dati da paper in funzione della veloctià
% V_parachute = linspace(3,12,10);
diam_parachute = 2.7;% [m] diametro paracadute 
chord=2;

S_parachute = pi*(diam_parachute/2)^2;% area cerchio paracadute
T = 8*diam_parachute/10^.9; % paper Guglieri (il Cirrus si apre in 5 - 7 s)
Tempo = 4*diam_parachute/(15.5*.85); % paper Knacke (tempo di inflaction) 
                                     % ci prende addirittura bene (assurdo)
                                     % Consideriamo Solid Flat Circular Parachute
CD_para=weight/(0.5*rho*v_discesa^2*S_parachute);

