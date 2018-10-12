%{

LAB1-Inverted Pendulum Simulator

Description for this file:
This is a file of simulateSequence function.
SimulateSequence function is a function that takes as input theta(t),
thetadot(t)and vector u with N values for the input and simulates the 
evolution of the pendulum to get theta(t+N*deltaT), thetadot(t+N*deltaT). 
At each simulation step, superimpose noise to both state variables assuming
a bivariate gaussian distribution with given mu and sigma.

Input:theta,thetadot,u,deltaT,mu,sigma
Output:thetaN,ThetadotN

Use Function:
ÅEsimulateOneStep(theta,thetadot,deltaT,u)
ÅEaddNoise(theta,thetadot,mu,sigma)

%}

function [thetaN,thetadotN] = simulateSequence(theta,thetadot,u,deltaT,mu,sigma)

[stepthetaN,stepthetadotN] = simulateOneStep(theta,thetadot,deltaT,u);
[thetaN,thetadotN] = addNoise(stepthetaN,stepthetadotN,mu,sigma);

