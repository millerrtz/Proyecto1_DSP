% Generar una señal chirp en el dominio del tiempo
Fs = 1000;          % Frecuencia de muestreo
T = 1/Fs;           % Período de muestreo
t = 0:T:2;          % Vector de tiempo de 0 a 2 segundos
f_ini = 10;         % Frecuencia inicial
f_fin = 50;         % Frecuencia final
senal_chirp = chirp(t, f_ini, 2, f_fin);

% Paso 1: Obtener la transformada de Fourier de la señal chirp
transformada_fourier_chirp = fft(senal_chirp);
frecuencias_chirp = linspace(0, Fs, length(transformada_fourier_chirp));

% Visualizar la transformada de Fourier de la señal chirp
figure;
subplot(3, 1, 1);
plot(frecuencias_chirp, abs(transformada_fourier_chirp));
title('Transformada de Fourier de la Señal Chirp');
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');

% Paso 2: Filtrar la señal en el dominio del tiempo
cutoff_frequency = 20;

% Crear un filtro paso bajo en el dominio del tiempo
filtro_temporal = lowpassfilter(length(senal_chirp), cutoff_frequency, Fs);

% Filtrar la señal en el dominio del tiempo
senal_chirp_filtrada_temporal = filtro_temporal .* senal_chirp;

% Visualizar la señal chirp filtrada en el dominio del tiempo
subplot(3, 1, 2);
plot(t, real(senal_chirp_filtrada_temporal));
title('Señal Chirp Filtrada en el Dominio Temporal');

function filtro = lowpassfilter(N, fc, Fs)
    f = linspace(-Fs/2, Fs/2, N);
    filtro = zeros(size(f));
    filtro(abs(f) <= fc) = 1;
end