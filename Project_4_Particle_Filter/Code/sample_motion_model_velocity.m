%{
//sample_motion_model_velocity.m
matlab file that contains the function for Algorithm 1 in Lab4 asignment paper.
%}


function [newstate]=sample_motion_model_velocity(input,state)

%Initialization
a1=0.01;
a2=0.01;
a3=0.01;
a4=0.01;
a5=0.0005;
a6=0.0005;
v=input(1);
o=input(2);
x=state(1);
y=state(2);
theta=state(3);
deltaT=0.5;

%Algorithm
v_dash=v+sqrt((a1*abs(v)+a2*abs(o)))*randn(1,1);
o_dash=o+sqrt((a3*abs(v)+a4*abs(o)))*randn(1,1);
g_dash=sqrt((a5*abs(v)+a6*abs(o)))*randn(1,1);
x_dash=x-(v_dash/o_dash)*sin(theta)+(v_dash/o_dash)*sin(theta+(o_dash*deltaT));
y_dash=y+(v_dash/o_dash)*cos(theta)-(v_dash/o_dash)*cos(theta+(o_dash*deltaT));
theta_dash=theta+(o_dash*deltaT)+(g_dash*deltaT);

newstate=[x_dash;y_dash;theta_dash];