%{

LAB2-Inverted Pendulum Simulator

Description for this file:
This is a file of Probability Search function.
ProbabilitySearch function is a function that gets a probability from
Gaussian distribution by using normcdf function.

Input:theta,thetadot,u,deltaT
Output:thetaprarray,thetaprarraydot

%}

function [thetaprarray,thetaprarraydot] = ProbabilitySearch(theta,thetadot,u,deltaT)

[Nexttheta,Nextthetadot] = simulateOneStep(theta,thetadot,deltaT,u);

mutheta=Nexttheta+0;
muthetadot=Nextthetadot+0;

sigmatheta=sqrt(0.01);
sigmathetadot=sqrt(0.001);

p0 = normcdf([-5*pi/20],mutheta,sigmatheta);
pr0=p0(1);
p1 = normcdf([-5*pi/20 -4*pi/20],mutheta,sigmatheta);
pr1=p1(2)-p1(1);
p2 = normcdf([-4*pi/20 -3*pi/20],mutheta,sigmatheta);
pr2=p2(2)-p2(1);
p3 = normcdf([-3*pi/20 -2*pi/20],mutheta,sigmatheta);
pr3=p3(2)-p3(1);
p4 = normcdf([-2*pi/20 -1*pi/20],mutheta,sigmatheta);
pr4=p4(2)-p4(1);
p5 = normcdf([-1*pi/20 -pi/18000],mutheta,sigmatheta);
pr5=p5(2)-p5(1);
p6 = normcdf([-pi/18000 pi/18000],mutheta,sigmatheta);
pr6=p6(2)-p6(1);
p7 = normcdf([pi/18000 1*pi/20],mutheta,sigmatheta);
pr7=p7(2)-p7(1);
p8 = normcdf([1*pi/20 2*pi/20],mutheta,sigmatheta);
pr8=p8(2)-p8(1);
p9 = normcdf([2*pi/20 3*pi/20],mutheta,sigmatheta);
pr9=p9(2)-p9(1);
p10 = normcdf([3*pi/20 4*pi/20],mutheta,sigmatheta);
pr10=p10(2)-p10(1);
p11 = normcdf([4*pi/20 5*pi/20],mutheta,sigmatheta);
pr11=p11(2)-p11(1);
p12 = normcdf([5*pi/20],mutheta,sigmatheta);
pr12=1-p12(1);


thetaprarray=[pr0,pr1,pr2,pr3,pr4,pr5,pr6,pr7,pr8,pr9,pr10,pr11,pr12];

pd1 = normcdf([-2.2 -1.8],muthetadot,sigmathetadot);
prd1=pd1(2)-pd1(1);
pd2 = normcdf([-1.8 -1.4],muthetadot,sigmathetadot);
prd2=pd2(2)-pd2(1);
pd3 = normcdf([-1.4 -1.0],muthetadot,sigmathetadot);
prd3=pd3(2)-pd3(1);
pd4 = normcdf([-1.0 -0.6],muthetadot,sigmathetadot);
prd4=pd4(2)-pd4(1);
pd5 = normcdf([-0.6 -0.02],muthetadot,sigmathetadot);
prd5=pd5(2)-pd5(1);
pd6 = normcdf([-0.02 0.02],muthetadot,sigmathetadot);
prd6=pd6(2)-pd6(1);
pd7 = normcdf([0.02 0.6],muthetadot,sigmathetadot);
prd7=pd7(2)-pd7(1);
pd8 = normcdf([0.6 1.0],muthetadot,sigmathetadot);
prd8=pd8(2)-pd8(1);
pd9 = normcdf([1.0 1.4],muthetadot,sigmathetadot);
prd9=pd9(2)-pd9(1);
pd10 = normcdf([1.4 1.8],muthetadot,sigmathetadot);
prd10=pd10(2)-pd10(1);
pd11 = normcdf([1.8 2.2],muthetadot,sigmathetadot);
prd11=pd11(2)-pd11(1);



thetaprarraydot=[prd1;prd2;prd3;prd4;prd5;prd6;prd7;prd8;prd9;prd10;prd11];