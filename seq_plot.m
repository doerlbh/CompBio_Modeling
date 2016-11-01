
clear all;

A = load('SequenceOfCurrentsDatamatrix.dat');

plot(A);

plot(mean(A,2),var(A.'));


