% SequenceOfCurrent_Baihan_Lin.m
% Baihan Lin, Oct 2016

clear all;

A = load('SequenceOfCurrentsDatamatrix.dat');

plot(A);

% mean(I) = iNH(c)
% var(I) = i^2*NH(c)(1-H(c))
% var(I) = i^2*NH(c)+i^2*NH(c)^2

plot(mean(A,2),var(A.'));

para = polyfit(mean(A,2).',var(A.'),2);

p1 = para(1)
p2 = para(2)
p3 = para(3)

t=1:3000;
fit=p1*t.^2+p2*t+p3;
plot(mean(A,2),var(A.'),t,fit);

