%{

LAB2-Inverted Pendulum Simulator

Description for this file:
This is a file of getrow function.
GetRow function is a function that gets a row by theta and thetadot. 

Input:theta,thetadot
Output:row

%}

function [row] = GetRow(theta,thetadot)

if theta==-1.57
    row=1;
elseif theta==-9*pi/40
    row=12;
elseif theta==-7*pi/40
    row=23;
elseif theta==-5*pi/40
    row=34;
elseif theta==-3*pi/40
    row=45;
elseif theta==-1*pi/40
    row=56;
elseif theta==0
    row=67;
elseif theta==1*pi/40
    row=78;
elseif theta==3*pi/40
    row=89;
elseif theta==5*pi/40
    row=100;
elseif theta==7*pi/40
    row=111;
elseif theta==9*pi/40
    row=122;
elseif theta==1.57
    row=133;
end

if thetadot==-2.0
    row=row;
elseif thetadot==-1.6
    row=row+1;
elseif thetadot==-1.2
    row=row+2;
elseif thetadot==-0.8
    row=row+3;
elseif thetadot==-0.4
    row=row+4;
elseif thetadot==0
    row=row+5;
elseif thetadot==0.4
    row=row+6;
elseif thetadot==0.8
    row=row+7;
elseif thetadot==1.2
    row=row+8;
elseif thetadot==1.6
    row=row+9;
elseif thetadot==2.0
    row=row+10;
end