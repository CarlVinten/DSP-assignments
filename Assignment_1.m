clc
clear all
close all
close force

%% The synthesized signal from Matlab
[t, x] = mycos(1000, 44100, pi/2, 0.2, 0.5);

%% Recording selfmade signal
recObj = audiorecorder(44100,24,1);
recDuration = 0.5;
disp("Begin speaking.")
recordblocking(recObj,recDuration);
disp("End of recording.")
audio_Recording = (getaudiodata(recObj));

%% PLotting the synthesized and selfmade signal
figure(1)
sgtitle("Synthesized and selfmade 1 kHz signal in time and frequency domian")
subplot(1,2,1)
plot(t, x)
hold on
plot(t, audio_Recording(1:end-1))
xlim([0 0.003])
xlabel("time [s]")
ylabel("Amplitude")
grid on
grid minor

%% calculating and plotting spectra for selfmade signal
subplot(1,2,2)
y = fft(x);
Y = y / length(y);
delta_f = 1/(length(x)/44100);
freq = 0:delta_f:44100/2;
Y = Y(:);
freq = freq(:);

id = find(freq >= 3000, 1); %Find the index where the frequency is equal to 3000.

semilogx(freq(1:id), 20*log10(2*abs(Y(1:id))))
xlim([100 3000])
hold on


%% calculating and plotting spectra from selfmade signal

y = fft(audio_Recording);
Y = y / length(y);
delta_f = 1/(length(audio_Recording)/44100);
freq = 0:delta_f:44100/2;
Y = Y(:);
freq = freq(:);

id = find(freq >= 3000, 1); %Find the index where the frequency is equal to 3000.

subplot(1,2,2)
semilogx(freq(1:id), 20*log10(abs(y(1:id))))
xlim([100 3000])
xlabel("frequency [Hz]")
ylabel("amplitude [dB]")
grid on
grid minor
hold on

