%{

LAB1-Inverted Pendulum Simulator

Description for this file:
This is a file for testing three functions in below.
ÅEsimulateOneStep(theta,thetadot,deltaT,u)
ÅEaddNoise(theta,thetadot,mu,sigma)
ÅEsimulateSequence(theta,thetadot,u,deltaT,mu,sigma)

%}

%Input Parameter
theta=1; %angle of the structure above the base
thetadot=1; %angular rate of the structure above the base
deltaT=1; %difference of time
u=1; %force applied at the base
mu=1; %mean of bivariate Gaussian
sigma=1; %covariance matrix of bivariate Gaussian

%Function
[nexttheta,nextthetadot]=simulateOneStep(theta,thetadot,deltaT,u);
[noisedtheta,noisedthetadot]=addNoise(theta,thetadot,mu,sigma);
[noisednexttheta,noisednextthetadot]=simulateSequence(theta,thetadot,u,deltaT,mu,sigma);

%Output
disp('<Input Parameter>');
fprintf('theta(t):%f\n',theta);
fprintf('thetadot(t):%f\n',thetadot);
fprintf('deltaT:%f\n',deltaT);
fprintf('u(t):%f\n',u);
fprintf('mu:%f\n',mu);
fprintf('sigma:%f\n\n',sigma);
disp('<Function:simulateOneStep>');
fprintf('theta(t+deltaT):%f\n',nexttheta);
fprintf('thetadot(t+deltaT):%f\n\n',nextthetadot);
disp('<Function:addNoise>');
fprintf('theta(t)+NOISE:%f\n',noisedtheta);
fprintf('thetadot(t)+NOISE:%f\n\n',noisedthetadot);
disp('<Function:simulateSequence>');
fprintf('theta(t+deltaT)+NOISE:%f\n',noisednexttheta);
fprintf('thetadot(t+deltaT)+NOISE:%f\n',noisednextthetadot);