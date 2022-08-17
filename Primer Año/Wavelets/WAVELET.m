clc;clear all;close all;

load('EEGstr')

f = EEGstr.trial{1, 1}(1,500:1500);
%fs = 256;
%t = (1:1:length(f)) * (1/fs)

%figure;
%plot(t,f);
%ylabel('mV');
%xlabel('Tiempo (s)');
%title('Señal original');


[c ,l] = wavedec(f,4,'db3');
approx = appcoef(c,l,'db3');
[cd1,cd2,cd3,cd4] = detcoef(c,l,[1,2,3,4]);


findpeaks(f)
%plot(fpeaks);
hold
cd1up = upsample(cd4,16);
findpeaks(cd1up);
%plot(cd1upsampling);



% subplot(6,1,1);
% plot(f);
% title('Señal original');
% subplot(6,1,2);
% plot(approx);
% title('Coeficiente de aproximación');
% subplot(6,1,3);
% plot(cd4);
% title('Coeficiente de detalle - Nivel 4');
% subplot(6,1,4);
% plot(cd3);
% title('Coeficiente de detalle - Nivel 3');
% subplot(6,1,5);
% plot(cd2);
% title('Coeficiente de detalle - Nivel 2');
% subplot(6,1,6);
% plot(cd1);
% title('Coeficiente de detalle - Nivel 1');
% 
% entropy(cd1)
% entropy(cd2)
% entropy(cd3)
% entropy(cd4)