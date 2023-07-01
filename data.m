clear
close all
clc

%% const data
massa = 20; %kg
alfa  = deg2rad(3); %angolo di attacco
rho = 1.225; %densità
S_ala = .46*7.3;

%% Variable DATA (da modificare)
v_cruise = 13;
C_D = 0.029; 
C_L = 0.5639;
%% Computed DATA
D = 0.5*rho*v_cruise^2*S_ala*C_D;
Thrust = D;
L =  0.5*rho*v_cruise^2*S_ala*C_L
peso = massa*9.8
CL = Peso/(0.5*rho*v_cruise^2*S_ala);