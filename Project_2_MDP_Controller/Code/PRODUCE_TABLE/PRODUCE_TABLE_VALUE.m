%{

LAB2-Inverted Pendulum Simulator

Description for this file:
This file produce Tables "ValueofState" and "ValueofStateNext".

%}

for i=1:143
   V(i,1)=0;
end

V(72,1)=100;

for i=1:11
     V(i,1)=0;
end
for i=133:143
     V(i,1)=0;
end

ValueofState=table(V);
ValueofStateNext=table(V);
