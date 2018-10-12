%{

LAB2-Inverted Pendulum Simulator

Description for this file:
This file produce Table "PolicyState".

%}

for i=1:11
    policy(i,1)=NaN;
end

for i=12:132
    policy(i,1)=0;
end

for i=133:143
    policy(i,1)=NaN;
end
PolicyState=table(policy);