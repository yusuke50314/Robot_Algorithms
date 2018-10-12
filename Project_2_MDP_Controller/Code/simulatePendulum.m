%{

LAB2-Inverted Pendulum Simulator

Description for this file:
This is a file of simulate pendulum function.
SimulatePendulum function is a function that gets a result of simulation of Inverted Pendulum. 

Input:theta,thetadot,u
Output:Graph Result

%}

function simulatePendulum(theta,thetadot,u)

%Initialization
load OptimalPolicy.mat;

%Input Parameter
deltaT=0.1; %difference of time
mu=[0,0]; %mean of bivariate Gaussian
sigma=[0.01,0;0,0.001]; %covariance matrix of bivariate Gaussian
count=0;

%Initial Action
[noisedtheta,noisedthetadot] = simulateSequence(theta,thetadot,u,deltaT,mu,sigma);
degtheta=noisedtheta*180/pi;
Observe=[degtheta];
step=0;
Step=[step];

%Approximation
theta=Approximationtheta(noisedtheta);
thetadot=Approximationthetadot(noisedthetadot);
mainsdash=GetRow(theta,thetadot);

while mainsdash~=72

%Action
u=PolicyState{mainsdash,1};
[noisedtheta,noisedthetadot] = simulateSequence(noisedtheta,noisedthetadot,u,deltaT,mu,sigma);
step=step+1;
NewStep=[step];
Step=horzcat(Step,NewStep);
degtheta=noisedtheta*180/pi;
NewObserve=[degtheta];
Observe=horzcat(Observe,NewObserve);

%Approximation
theta=Approximationtheta(noisedtheta);
thetadot=Approximationthetadot(noisedthetadot);
if theta==-1.57 || theta==1.57
    fprintf("%d_Step_Theta:%f\n",count+2,degtheta);
    fprintf("%d_Step_ThetaDot:%f(rad/s)\n",count+2,noisedthetadot);
    fprintf("THETA FAILED!!!\n")
    break
end

mainsdash=GetRow(theta,thetadot);

count=count+1;

if count==500-1 %Max Step-1
    break
end

end

figure
Observe=transpose(Observe);
plot(Step,Observe);
ylim([-45 45]);
title("Simulation - Inverted Pendulum");
xlabel("index");
ylabel("theta [deg]");
