clear;        
clc;

[filename, pathname] = uigetfile('*.*', 'Seleccione un archivo de audio'); % Seleccionar el archivo de audio
[senal1,Fs1] = audioread(fullfile(pathname,filename)); % Leer el archivo de audio

[filename, pathname] = uigetfile('*.*', 'Seleccione un archivo de audio'); % Seleccionar el archivo de audio
[senal2,Fs2] = audioread(fullfile(pathname,filename)); % Leer el archivo de audio

vector = cell(1,3);

vector{1} = senal1(:,1);
vector{2} = senal2(:,:);

ls1 = length(vector{1});
ls2 = length(vector{2});

pad = abs(ls1-ls2);


h= transpose (readmatrix('Filtros_Prueba_Proyecto_DSP_Entregable.xlsx', 'Sheet','Filtro FIR 1'));
h2 = [-0.000779024944408449136062921880352405424 0.000999731876142587964212404827435420884 0.003831402877460619166294364390523696784 0.006331215011077922713567112111832102528 0.004203293161063792818255002714522561291 -0.006457016133813054704904121905428837636 -0.023107528738289289521601332921818539035 -0.033457559743661630102806725517439190298 -0.019904587044922469885044336024293443188 0.028977468595656773187041466144364676438 0.107219132728444313529259090955747524276 0.189581211105815133910468262001813855022 0.242562261249433724907831333439389709383 0.242562261249433724907831333439389709383 0.189581211105815133910468262001813855022 0.107219132728444313529259090955747524276 0.028977468595656773187041466144364676438 -0.019904587044922469885044336024293443188 -0.033457559743661630102806725517439190298 -0.023107528738289289521601332921818539035 -0.006457016133813054704904121905428837636 0.004203293161063792818255002714522561291 0.006331215011077922713567112111832102528 0.003831402877460619166294364390523696784 0.000999731876142587964212404827435420884 -0.000779024944408449136062921880352405424];
h3 = fir1(25,150,"low");