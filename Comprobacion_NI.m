daqreset;
devices = daqlist %list devices
devices.DeviceInfo(1)



dq = daq("digilent");
%addoutput(dq, "AD2_0", "ao0" ,'Voltage');
%addoutput(dq, "AD2_0", "ao1" ,'Voltage');
rate = 100;
%dq.Rate = rate;
totalduration = 50;
n = totalduration * rate;
f = 1;
t = (1:n)/rate;

%f2=2;
%f3=3;
output=square(2*pi*f*t)';
% %output = (2*sin(2*pi*f*t)+ 1*sin(2*pi*50*t))';
% %output=sawtooth(2*pi*f*t)';
% %output=sinc(2*pi*f*t)';
% %output=(2*sin(2*pi*f*t)+ 1*sin(2*pi*f2*t))';
% %output=chirp(t,1,10,100)';
% %output=(2*sin(2*pi*f*t)+ 1*sin(2*pi*f2*t)+3*sin(2*pi*f3*t))';
%background continuous
preload(dq, [output(1:n), output(1:n)]);
dq.ScansRequiredFcn = @(src, evt) write(src, [output(1:n), output(1:n)]); 
start(dq, "continuous");


dq2 = daq("ni");
addinput(dq2, "Dev2", "ai1" ,'Voltage');
dq2.Channels(1).TerminalConfig = 'SingleEnded';
dq2.Rate = rate; %max frequency
data = read(dq2, n);
% 
figure(1);
title('Blocking Input Stream');
xlabel('Samples');
ylabel('Volts');
plot([data.Dev2_ai1]);
% Crear objeto de sesión para la tarjeta Discovery 2

% s = daq.createSession('ni');
% 
% % Agregar canal de entrada analógica
% ch = addAnalogInputChannel(s,'Dev1','ai0','Voltage');
% 
% % Configurar parámetros de adquisición
% s.Rate = 1000;            % Tasa de muestreo en muestras por segundo
% s.DurationInSeconds = 50;  % Duración de la adquisición en segundos
% 
% % Realizar la adquisición de datos
% data = startForeground(s);
% 
% % Mostrar los datos adquiridos
% time = (0:length(data)-1) / s.Rate;  % Vector de tiempo
% plot(time, data);
% xlabel('Tiempo (s)');
% ylabel('Voltaje');
% title('Señal adquirida');
% Crear objeto de sesión para la tarjeta Discovery 2
