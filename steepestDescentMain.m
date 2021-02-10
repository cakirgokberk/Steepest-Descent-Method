% Optimization Theory
% Steepest Descent Algorithm
% 28/11/2020


clc;clear;close all;

f = @(x1,x2) (100*(x1-x2.^2).^2+(1-x1).^2);

gradient = @(x1,x2) ( [2*x1-3*x2;-3*x1+6.5*x2-4] );
x0 = [-4.5; -3.5];

lowerLimit = -5;
upperLimit =  5;

e1 = 1e-9;
e2 = 1e-9;
e3 = 1e-9;

N_Max = 200;
tic
[Y,X,iter] = steepestDescent(f,gradient,N_Max,x0,e1,e2,e3,lowerLimit,upperLimit)
toc
ezsurf(f);
