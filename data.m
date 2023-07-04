clear
close all
clc

%% const data
massa = 20; %kg
alfa  = deg2rad(3); %angolo di attacco
rho = 1.225; %densità
S_ala = .46*7.3;
quota=100;
%% Variable DATA (da modificare)
v_cruise = 13;
C_D = 0.029; 
C_Dfriction = C_D;
C_L = 0.5639;
<<<<<<< HEAD

%% Computed DATA
D = 0.5*rho*v_cruise^2*S_ala*C_D;
Thrust = D;
L =  0.5*rho*v_cruise^2*S_ala*C_L;
peso = massa*9.8;
CL = peso/(0.5*rho*v_cruise^2*S_ala);

attrito = Thrust*0.01; % da definire
=======
% attrito = Thrust*0.01; % da definire
%% Computed DATA
D = 0.5*rho*v_cruise^2*S_ala*C_D;
Thrust = D;
L =  0.5*rho*v_cruise^2*S_ala*C_L
peso = massa*9.8;
CL = peso/(0.5*rho*v_cruise^2*S_ala);
>>>>>>> 7491c91ff31720674e6cbd23f4751fd08fb9ff64
