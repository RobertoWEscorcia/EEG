clc;clear all;close all;

load('movimiento')

s = f;

Fs = 256;
T = 1/Fs;
L = 1292;
f = Fs*(0:(L))/L;

y = fft(s);

plot(f,y)
