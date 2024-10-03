function [t,x] = untitled2(f,fs,phi,A,T)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
t = 1/fs:1/fs:T-1/fs;
x = A * cos(2*pi*f*t + phi)

end