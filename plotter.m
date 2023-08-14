%%%% PLOTTER
% Lanciare per sezioni (non tutto insieme)

%% TRAJECTORY out.sim_position
close all
time = out.sim_position.Time;
x = out.sim_position.Data(:,1);
z  = out.sim_position.Data(:,3);
figure(1)
plot3(x,time,z,'k',LineWidth=1.5)
grid on
xlabel('x [m]')
ylabel('time [s]')
zlabel('z [m]')
title('UAV Trajectory')
ylim([80, 160]) 
%  saveas(figure(1),[pwd '/images/trajectory.png'])

%% Altitude plot out.sim_position
figure(2)
plot(time,z,'k',LineWidth=1.5)
grid on
hold on
xline(Time_stop_motor,'r--',LineWidth=1.5)
xline(Time_start_parachute,'b--',LineWidth=1.5)
xlabel('time [s]')
ylabel('Altitude [m]')
title('UAV Altitude')
xlim([80, 160]) 
legend('','Time stop motor','Time start parachute',Location='best')
%  saveas(figure(2),[pwd '/images/altitude.png'])

 %% Forza paracadute out.sim_Fpara
close all
time = out.sim_Fpara.Time;
Fpara = out.sim_Fpara.Data;

figure(3)
plot(time,Fpara,'k')
hold on
xline(Time_stop_motor,'r--',LineWidth=1.5)
xline(Time_start_parachute,'b--',LineWidth=1.5)
xlabel('time [s]')
ylabel('Force [N]')
title('Force on parachute')
grid on
legend('','Time stop motor','Time start parachute',Location='best')
xlim([80, 160]) 
% saveas(figure(3),[pwd '/images/force_parachute.png'])
%% Velocity u & w out.sim_velocity
close all
time = out.sim_velocity.Time;
u = out.sim_velocity.Data(:,1);
w = out.sim_velocity.Data(:,3);
figure(4)
plot(time,u,'k',LineWidth=1.5)
hold on
plot(time,w,'Color',[0.8500 0.3250 0.0980],LineWidth=1.5)
xline(Time_stop_motor,'r--',LineWidth=1.5)
xline(Time_start_parachute,'b--',LineWidth=1.5)
xlabel('time [s]')
ylabel('velocity [m/s]')
title('Velocity')
grid on
xlim([80, 160]) 
% legend('u','w','Time stop motor','Time start parachute',Location='best')
% saveas(figure(4),[pwd '/images/velocity.png'])

%% Velocità comprata senza paracadute (maneggiare con cura la sezione ->
% -> assicurarsi che sia lanciata la sim senza paracadute)
hold on
time = out.sim_velocity.Time;
u = out.sim_velocity.Data(:,1);
w = out.sim_velocity.Data(:,3);
plot(time,u,'-.c',LineWidth=1.5)
hold on
plot(time,w,'-.','Color',[0.8500 0.6250 0.0980],LineWidth=1.5)
title('Velocity compared with no parachute')
legend('u','w','Time stop motor','Time start parachute','u NO parachute','w NO parachute',Location='best')

%% Energy out.sim_energy
close all 
% time = out.sim_energy.Time;
%  E = out.sim_energy.Data(:,1);
%  time_NOparachute = out.sim_energy_NOpara.Time; %fare Sim togliendo
%  Parachute
%  E_NOparachute = out.sim_energy_NOpara.Data(:,1);

%%
 figure(5)
plot(time,E,'k',LineWidth=1.5)
hold on
plot(time_NOparachute,E_NOparachute,'Color',[0.8500 0.3250 0.0980],LineWidth=1.5)

xline(Time_stop_motor,'r--',LineWidth=1.5)
xline(Time_start_parachute,'b--',LineWidth=1.5)
% xline(time(end),'--','Color',[0.8500 0.3250 0.0980],LineWidth=1.5)
xlabel('time [s]')
ylabel('Energy [J]')
grid on
xlim([80 160])
title('Kinetic energy')
legend('Parachute','NO parachute','Time stop motor','Time start parachute',Location='best')
% saveas(figure(5),[pwd '/images/energy_NOpara.png'])

%%