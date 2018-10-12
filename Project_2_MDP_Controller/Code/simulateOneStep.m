%{

LAB1-Inverted Pendulum Simulator

Description for this file:
This is a file of simulateOneStep function.
SimulateOneStep function is a function that takes as parameters theta(t),
thetadot(t), u(t), deltaT and predicts theta(t+deltaT), thetadot(t+deltaT).

Input:theta,thetadot,deltaT,u
Output:thetaN,ThetadotN

%}

function [thetaN,thetadotN] = simulateOneStep(theta,thetadot,deltaT,u)

%Parameter
m=1; %mass of inertia of the system to be balanced
g=9.8; %acceleration due to gravity
l=1; %distance from the base to the center of mass of the balanced body
gamma=1; %coefficient of rotational friction
J=(m*l^2)/3; %moment of inertia of the system to be balanced
Jt=J+m*l^2; 

%Function Detail
thetadotdot=(m*g*l*sin(theta))/Jt-(gamma*thetadot)/Jt+(l*cos(theta)*u)/Jt; %From Equation (2.10)
thetaN=theta+deltaT*thetadot; %From Euler's Method
thetadotN=thetadot+deltaT*thetadotdot; %From Euler's Method
