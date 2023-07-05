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
C_Dfriction = C_D;
C_L = 0.5639;
Time_stop_motor=2000;


%% Computed DATA
D = 0.5*rho*v_cruise^2*S_ala*C_D;
Thrust = D;
L =  0.5*rho*v_cruise^2*S_ala*C_L;
weight = mass*9.8;
CL = weight/(0.5*rho*v_cruise^2*S_ala);
