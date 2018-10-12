%{

LAB1-Inverted Pendulum Simulator

Description for this file:
This is a file of addnoise function.
Addnoise function is a function that superimposes noise nyu to theta and
thetadot. We assume nyu is a bivariate Gaussian with mean mu and
covariance matrix sigma.

Input:theta,thetadot,mu,sigma
Output:thetaN,ThetadotN

%}

function [thetaN,thetadotN] = addNoise(theta,thetadot,mu,sigma)

Noise=mvnrnd(mu,sigma); %Matlab Function:mvnrnd
thetaN=theta+Noise(1); %Matlab Function:mvnrnd
thetadotN=thetadot+Noise(2); %Matlab Function:mvnrnd