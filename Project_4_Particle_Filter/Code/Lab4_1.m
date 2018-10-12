%{
//Lab4_1.m
matlab file that I used for Question1.
This code measures the running time and accuracy of several conditions of particle filter.
Currently, the average of running time and accuracy are from 30 results.
%}

%Clearing
clear;
loopend=30;

%Initialization
averuntime=0;
aveerrorx=0;
aveerrory=0;
aveerrort=0;
%num=[500,1000,1500,2000,2500,3000,3500,4000,4500,5000,5500,6000,6500,7000,7500,8000,8500,9000,9500,10000];
num=[500,1000,1500,2000,2500,3000,3500,4000,4500,5000,5500,6000];

%Loading
load EKFparameter.mat;
filename = 'inputs.txt';
filename2 = 'sensor_readings.txt';
u = importdata(filename);
z = importdata(filename2);
u=transpose(u);
z=transpose(z);
deltaT=0.5;
steps = 100;  % Number of time steps

for numloop=1:12

fprintf("number of particle : %d\n",num(1,numloop));

for loop=1:loopend

%Initialization
mnum=num(1,numloop);
X = zeros(3,steps);
M = zeros(3,mnum);
iniM = zeros(3,mnum);
newM = zeros(3,mnum);
M_dash=zeros(3,mnum);
newM_dash = zeros(3,mnum);
M_weight=zeros(1,mnum);
distance=zeros(3,mnum);
functionweight=zeros(1,mnum);
q=zeros(1,mnum);
for i=1:mnum
    q(1,i)=1/mnum;
end
iniq=q;
check=0;

while check==0

tic;
    
%Initialize Particle Position
M(1,1:mnum)=(-4)+10*rand(1,mnum);
M(2,1:mnum)=(-3)+13*rand(1,mnum);
M(3,1:mnum)=2*pi*rand(1,mnum);

for t=1:steps
    
    if t==1
    check=1;
    end
   
%Particles Transitions
for i=1:mnum
    state=M(1:3,i);
    input=u(1:2,t);
    M_dash(1:3,i)=sample_motion_model_velocity(input,state);
end

%Importance Weight Evaluation
for i=1:mnum
    m_dash=M_dash(1:3,i);
    distance(1,i)=sqrt((m_dash(1)-5)^2+(m_dash(2)-5)^2);
    distance(2,i)=sqrt((m_dash(1)-4)^2+(m_dash(2)-7)^2);
    distance(3,i)=sqrt((m_dash(1)+3)^2+(m_dash(2)-2)^2);
    real_distance=distance(1:3,i);
    sensor_distance=z(1:3,t);
    M_weight(1,i)=beam_range_finder_model(sensor_distance,real_distance,q(1,i));
end

%Sum of Weight
sum=0;
for i=1:mnum
    sum=sum+M_weight(1,i);
end
sumweight=sum;

if sumweight==0
    q=iniq;
    check=0;
    break;
end
    
%Normalize Weight
for i=1:mnum
    M_weight(1,i)=M_weight(1,i)/sumweight;
end

%Sum of Weight
sum=0;
for i=1:mnum
    sum=sum+M_weight(1,i);
end
sumweight=sum;

%New State
sum=0;
for i=1:mnum
    sum=sum+M_weight(1,i)*M_dash(1:3,i);
end
X(1:3,t)=sum;

%For Resampling
for i=1:mnum
    if i==1
        functionweight(1,i)=M_weight(1,i);
    else
        functionweight(1,i)=functionweight(1,i-1)+M_weight(1,i);
    end
end

%Resampling Condition
Nsum=0;
for i=1:mnum
    Nsum=Nsum+M_weight(1,i)^2;
end

Neff=1/Nsum;
Nthres=mnum*0.99;

if Neff>=Nthres
    
    M=M_dash;
    q=M_weight;

else

    for i=1:mnum
        sample=rand(1,1);
        
        for j=1:mnum
            if functionweight(1,j)>sample
                newM_dash(1:3,i)=M_dash(1:3,j);
                break
            end
        end
    end

    M=newM_dash;
    q=iniq;

end
end

end %for loop time

runtime=toc;
fprintf("%d - RUNNING TIME : %d\n",loop,runtime);

averuntime=averuntime+runtime;

errorx=0;
errory=0;
errort=0;

for i=1:100
    X(3,i)=rem(X(3,i),2*pi);
    EST(3,i)=rem(EST(3,i),2*pi);
    condition=abs(EST(3,i)-X(3,i));
    if condition>pi
       condition=2*pi-condition; 
    end
    errorx=errorx+(EST(1,i)-X(1,i))^2;
    errory=errory+(EST(2,i)-X(2,i))^2;
    errort=errort+condition^2;
end

errorx=errorx/100;
errory=errory/100;
errort=errort/100;

errorx=sqrt(errorx);
errory=sqrt(errory);
errort=sqrt(errort);

fprintf("%d - RMS Errors : X:%d ,Y:%d, theta:%d\n",loop,errorx,errory,errort);

aveerrorx=aveerrorx+errorx;
aveerrory=aveerrory+errory;
aveerrort=aveerrort+errort;

end

averuntime=averuntime/loopend;
aveerrorx=aveerrorx/loopend;
aveerrory=aveerrory/loopend;
aveerrort=aveerrort/loopend;

fprintf("AVERAGE RUNNING TIME : %d\n",averuntime);
fprintf("Average RMS Errors : X:%d ,Y:%d, theta:%d\n",aveerrorx,aveerrory,aveerrort);


num(2,numloop)=averuntime;
num(3,numloop)=aveerrorx;
num(4,numloop)=aveerrory;
num(5,numloop)=aveerrort;

end

num=transpose(num);
