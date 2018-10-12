%{

LAB2-Inverted Pendulum Simulator

Description for this file:
This is a file of approximation thetadot function.
Approximationthetadot function is a function that approximate noised thetadot to specific thetadot. 

Input:num
Output:apppronum

%}

function [appronum] = Approximationthetadot(num)
%if(-2.2<=num&&num<-1.8)
if(num<-1.8)
    appronum=-2.0;
elseif(-1.8<=num&&num<-1.4)
    appronum=-1.6;
elseif(-1.4<=num&&num<-1.0)
    appronum=-1.2;
elseif(-1.0<=num&&num<-0.6)
    appronum=-0.8;
elseif(-0.6<=num&&num<-0.02)
    appronum=-0.4;
elseif(-0.02<=num&&num<=+0.02)
    appronum=0;
elseif(+0.02<num&&num<=+0.6)
    appronum=+0.4;
elseif(+0.6<num&&num<=+1.0)
    appronum=+0.8;
elseif(+1.0<num&&num<=+1.4)
    appronum=+1.2;
elseif(+1.4<num&&num<=+1.8)
    appronum=+1.6;
%elseif(+1.8<num&&num<=+2.2)
elseif(+1.8<num)
    appronum=+2.0;
end