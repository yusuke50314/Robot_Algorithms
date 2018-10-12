%{

LAB3-Kalman Filter (Question 2)

Description for this file:
This is a file for using Kalman Filter and estimate the mean and covariance matrix.
It will print estimated mean and estimated covariance matrix out.
And, it will get figure of trajectory of robot and uncertainty ellipsoid (95%) in step by step.

%}


%Circle
NP = 16;
alpha  = 2*pi/NP*(0:NP);
circle = [cos(alpha);sin(alpha)];
  
%Loading
filename = 'inputs.txt';
filename2 = 'sporadic_sensor_readings.txt';
u = importdata(filename);
z = importdata(filename2);
Z = transpose(z);

%Initialization
steps = 100;
R=[0.01 0 0;
   0 0.01 0;
   0 0 0.001];
Q=[0.001 0 0;
   0 0.001 0;
   0 0 0.001];
M=[5 4 -3;5 7 2];
deltaT=0.5;
T = 1:steps;

%% Initialize first step
X=[0;0;0];
SIG=[0.001 0 0;
     0 0.001 0;
     0 0 0.001];
EST = zeros(3,steps); % Allocate space for results
I = eye(3);
counter=1;

%% Run Kalman filter
for t=1:steps
    
    %Jacobian equation - G
    G = [1 0 -u(t,1)*deltaT*sin(X(3));
         0 1 u(t,1)*deltaT*cos(X(3));
         0 0 1];
     
    %Function
    gfunc = [X(1)+u(t,1)*deltaT*cos(X(3));
             X(2)+u(t,1)*deltaT*sin(X(3));
             X(3)+u(t,2)*deltaT];
    
    %Prediction Process
    Xbar = gfunc;
    SIGbar = G*SIG*transpose(G)+R;
    
    if z(counter,1) == deltaT*t     
        
    %Jacobian equation - H
    H = [(Xbar(1)-M(1,1))/sqrt((Xbar(1)-M(1,1))^2+(Xbar(2)-M(2,1))^2),(Xbar(2)-M(2,1))/sqrt((Xbar(1)-M(1,1))^2+(Xbar(2)-M(2,1))^2),0;
         (Xbar(1)-M(1,2))/sqrt((Xbar(1)-M(1,2))^2+(Xbar(2)-M(2,2))^2),(Xbar(2)-M(2,2))/sqrt((Xbar(1)-M(1,2))^2+(Xbar(2)-M(2,2))^2),0;
         (Xbar(1)-M(1,3))/sqrt((Xbar(1)-M(1,3))^2+(Xbar(2)-M(2,3))^2),(Xbar(2)-M(2,3))/sqrt((Xbar(1)-M(1,3))^2+(Xbar(2)-M(2,3))^2),0];
    
    %Kalman Gain
    K=SIGbar*transpose(H)*(H*SIGbar*transpose(H)+Q)^(-1);
    
    %Function
    hfunc=[sqrt((Xbar(1)-M(1,1))^2+(Xbar(2)-M(2,1))^2);
           sqrt((Xbar(1)-M(1,2))^2+(Xbar(2)-M(2,2))^2);
           sqrt((Xbar(1)-M(1,3))^2+(Xbar(2)-M(2,3))^2)];
    
    %Update Process
    X=Xbar+K*(transpose(z(counter,2:4))-hfunc);
    SIG=(I-K*H)*SIGbar;
    
    counter=counter+1;
    
    else
    
    %Update Process
    X = Xbar;
    SIG = SIGbar;  
        
        
    end
    
    % Store the results
    EST(:,t) = X(1:3);
      
    %Print Result
    fprintf("%d-STEP\n",t);
    mean=X
    covariance=SIG
    
    %Ellipsoid
    ns = 3;
    C = chol(covariance)'; %Choleski method
    C = [C(1,1) C(1,2);C(2,1) C(2,2)];
    ellip = ns*C*circle;
    ELLx = mean(1)+ellip(1,:);
    ELLy = mean(2)+ellip(2,:);
    
    %Print Figure
    if t==1
    figure; clf
    end
    subplot(2,1,1);
    plot(ELLx(1,:),ELLy(1,:),'-m');
    hold on;
    plot(EST(1,1:t),EST(2,1:t),'-b');
    legend('Uncertainty Ellipsoid (95%)','Trajectory of Robot');
    xlabel('x coordinate'); 
    ylabel('y coordinate'); 
    title('\bf Estimation Process')
    h=subplot(2,1,2);
    plot(ELLx(1,:),ELLy(1,:),'-m');
    hold on;
    plot(X(1),X(2),'*b');
    legend('Uncertainty Ellipsoid (95%)','Estimated Mean');
    xlabel('x coordinate'); 
    ylabel('y coordinate'); 
    title('\bf Uncertainty Ellipsoid (95%)')
    if t~=100
    fprintf('Press enter to go to next step.\n');
    pause;
    delete(h)
    end
end
