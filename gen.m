

daqreset;

%devices = daqlist %list devices
%devices.DeviceInfo(2)



dq = daq("digilent");
addoutput(dq, "AD2_0", "ao0" ,'Voltage');
addoutput(dq, "AD2_0", "ao1" ,'Voltage');

rate = 5000;
dq.Rate = rate;
totalduration = 10;
n = totalduration * rate;
f = 10;
t = (0:n)/rate;
output = (sin(2*pi*f*t))';
output_l = length(output)
% background continuous
preload(dq, [output(1:n), output(1:n)]);
dq.ScansRequiredFcn = @(src, evt) write(src, [output(1:n), output(1:n)]); 
start(dq, "continuous");


dq2 = daq.createSession('ni');
ses = dq2;
addAnalogInputChannel(dq2,'Dev1', "ai0", 'Voltage');

%dq2 = daq("ni");
%addinput(dq2, "Dev1", "ai0" ,'Voltage');
dq2.Channels(1).TerminalConfig = 'SingleEnded';
dq2.Rate = rate; %max frequency
dq2.DurationInSeconds=totalduration;
%data = read(dq2,n);
data = [];

%% Add the listener

            lh = addlistener(dq2,'DataAvailable', @(src,event) plot(event.TimeStamps, event.Data));
            xlabel('Tiempo');
            ylabel('Voltage');
            title('Señal');
            lh = addlistener(dq2,'DataAvailable', @(src,event) storeData(event.TimeStamps,event.Data));

            %% Start the background acquisition
            dq2.startBackground();
            
            %% Wait for the acquisition to complete
            dq2.wait();
            
            %data=event.Data;
           
            




            %% Plot the acquired data
            figure;
           
            title('Data adquirida');
            xlabel('Samples')
            ylabel('Voltage')
            plot(data);

            %% Clean up
            delete(lh);
            clear dq2;


