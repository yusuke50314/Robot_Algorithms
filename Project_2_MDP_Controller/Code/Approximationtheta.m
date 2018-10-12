%{

LAB2-Inverted Pendulum Simulator

Description for this file:
This is a file of approximation theta function.
Approximationtheta function is a function that approximate noised theta to specific theta. 

Input:num
Output:apppronum

%}


function [appronum] = Approximationtheta(num)
if(-5*pi/20<=num&&num<-4*pi/20)
    appronum=-9*pi/40;
elseif(-4*pi/20<=num&&num<-3*pi/20)
    appronum=-7*pi/40;
elseif(-3*pi/20<=num&&num<-2*pi/20)
    appronum=-5*pi/40;
elseif(-2*pi/20<=num&&num<-1*pi/20)
    appronum=-3*pi/40;
elseif(-1*pi/20<=num&&num<-pi/18000)
    appronum=-pi/40;
elseif(-pi/18000<=num&&num<=+pi/18000)
    appronum=0;
elseif(+pi/18000<num&&num<=1*pi/20)
    appronum=+pi/40;
elseif(+1*pi/20<num&&num<=+2*pi/20)
    appronum=+3*pi/40;
elseif(+2*pi/20<num&&num<=+3*pi/20)
    appronum=+5*pi/40;
elseif(+3*pi/20<num&&num<=+4*pi/20)
    appronum=+7*pi/40;
elseif(+4*pi/20<num&&num<=+5*pi/20)
    appronum=+9*pi/40;
elseif(num<-5*pi/20)
    appronum=-1.57;
elseif(num>5*pi/20)
    appronum=1.57;
end