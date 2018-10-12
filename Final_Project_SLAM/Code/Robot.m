%Initialization
N=0;
mu=zeros(3+2*N,1);
cov=zeros(3+2*N,3+2*N);
init_simulator();
%filename = 'inputs.txt';
%u = importdata(filename);
filename1 = 'virtual_landmark.txt';
filename2 = 'control_point.txt';
filename3 = 'map.txt';
land = importdata(filename1);
control = importdata(filename2);
map=importdata(filename3);

%Circle
NP = 16;
alpha  = 2*pi/NP*(0:NP);
circle = [cos(alpha);sin(alpha)];

figure; clf


for land_i=1:9
      
    land_x=land(land_i,1);
    land_y=land(land_i,2);
    
    diff_x=land(land_i,1)-mu(1,1);
    diff_y=land(land_i,2)-mu(2,1);
    
    rotate=wrapToPi(atan2(diff_y,diff_x)-mu(3,1));
    diff=sqrt((diff_x)^2+(diff_y)^2);
    trans_num=round(diff);
  
    if rotate>0
    
    %Sensor
    ut=0;
    ur=rotate;
    move_robot(ut,ur);
    sensor=get_landmarks();
    sen_size=size(sensor);
    if sen_size(1,1)~=0
    z=struct2table(sensor);
    else 
    z=[];
    end

    %Function
    [mu,cov,N]=EKF_SLAM_U(mu,cov,ut,ur,z,N);

    %Ellipsoid for Robot
    ns = 3;
    C = chol(cov(1:2,1:2))'; %Choleski method
    C = [C(1,1) C(1,2);C(2,1) C(2,2)];
    ellip = ns*C*circle;
    ELLx = mu(1)+ellip(1,:);
    ELLy = mu(2)+ellip(2,:);

    plot(ELLx(1,:),ELLy(1,:),'-m');
    xlim([-20 24]);
    ylim([-20 40]);
    hold on;

    %Ellipsoid for Boundary
    ellip = 7*circle;
    ELL_xb = mu(1)+ellip(1,:);
    ELL_yb = mu(2)+ellip(2,:);

    %b1=plot(ELL_xb(1,:),ELL_yb(1,:),'-r');
    hold on;

    if N>0
    for j=1:N
    %Ellipsoid for Landmark
    ns = 3;
    C = chol(cov(3+1+2*(j-1):3+2+2*(j-1),3+1+2*(j-1):3+2+2*(j-1)))'; %Choleski method
    C = [C(1,1) C(1,2);C(2,1) C(2,2)];
    ellip = ns*C*circle;
    ELL_xl = mu(3+1+2*(j-1))+ellip(1,:);
    ELL_yl = mu(3+2+2*(j-1))+ellip(2,:);

    h1(j)=plot(ELL_xl(1,:),ELL_yl(1,:),'-b');
    g1(j)=plot(mu(3+1+2*(j-1)),mu(3+2+2*(j-1)),'o');

    end
    
    %delete(b1);
    delete(g1(1:N));
    delete(h1(1:N));
    
    end

    
  
    end

    if rotate<0
        
        %Sensor
        ut=0;
        ur=rotate;
        move_robot(ut,ur);
        sensor=get_landmarks();
        sen_size=size(sensor);
        if sen_size(1,1)~=0
        z=struct2table(sensor);
        else 
        z=[];
        end

        %Function
        [mu,cov,N]=EKF_SLAM_U(mu,cov,ut,ur,z,N);

        %Ellipsoid for Robot
        ns = 3;
        C = chol(cov(1:2,1:2))'; %Choleski method
        C = [C(1,1) C(1,2);C(2,1) C(2,2)];
        ellip = ns*C*circle;
        ELLx = mu(1)+ellip(1,:);
        ELLy = mu(2)+ellip(2,:);

        plot(ELLx(1,:),ELLy(1,:),'-m');
        xlim([-20 24]);
        ylim([-20 40]);
        hold on;

        %Ellipsoid for Boundary
        ellip = 7*circle;
        ELL_xb = mu(1)+ellip(1,:);
        ELL_yb = mu(2)+ellip(2,:);

        %b1=plot(ELL_xb(1,:),ELL_yb(1,:),'-r');
        hold on;

        if N>0
        for j=1:N
        %Ellipsoid for Landmark
        ns = 3;
        C = chol(cov(3+1+2*(j-1):3+2+2*(j-1),3+1+2*(j-1):3+2+2*(j-1)))'; %Choleski method
        C = [C(1,1) C(1,2);C(2,1) C(2,2)];
        ellip = ns*C*circle;
        ELL_xl = mu(3+1+2*(j-1))+ellip(1,:);
        ELL_yl = mu(3+2+2*(j-1))+ellip(2,:);

        h1(j)=plot(ELL_xl(1,:),ELL_yl(1,:),'-b');
        g1(j)=plot(mu(3+1+2*(j-1)),mu(3+2+2*(j-1)),'o');

        end
        
        %delete(b1);
        delete(g1(1:N));
        delete(h1(1:N));
        
        end

        
   
    end
  
if trans_num~=0
for i=1:trans_num

%Sensor
ut=1.0;
ur=0;
move_robot(ut,ur);
sensor=get_landmarks();
sen_size=size(sensor);
if sen_size(1,1)~=0
z=struct2table(sensor);
else 
z=[];
end

%{
snum=size(z);
snum=snum(1,1);
if snum>0 && check==0
   loop=1;
   check=1;
   break;
end
%}

%Function
[mu,cov,N]=EKF_SLAM_U(mu,cov,ut,ur,z,N);

%Ellipsoid for Robot
ns = 3;
C = chol(cov(1:2,1:2))'; %Choleski method
C = [C(1,1) C(1,2);C(2,1) C(2,2)];
ellip = ns*C*circle;
ELLx = mu(1)+ellip(1,:);
ELLy = mu(2)+ellip(2,:);

plot(ELLx(1,:),ELLy(1,:),'-m');
xlim([-30 30]);
ylim([-30 30]);
hold on;

%Ellipsoid for Boundary
ellip = 7*circle;
ELL_xb = mu(1)+ellip(1,:);
ELL_yb = mu(2)+ellip(2,:);

%b2=plot(ELL_xb(1,:),ELL_yb(1,:),'-r');
hold on;

if N>0
for j=1:N
%Ellipsoid for Landmark
ns = 3;
C = chol(cov(3+1+2*(j-1):3+2+2*(j-1),3+1+2*(j-1):3+2+2*(j-1)))'; %Choleski method
C = [C(1,1) C(1,2);C(2,1) C(2,2)];
ellip = ns*C*circle;
ELL_xl = mu(3+1+2*(j-1))+ellip(1,:);
ELL_yl = mu(3+2+2*(j-1))+ellip(2,:);

h2(j)=plot(ELL_xl(1,:),ELL_yl(1,:),'-b');
g2(j)=plot(mu(3+1+2*(j-1)),mu(3+2+2*(j-1)),'o');

end
%delete(b2);
delete(g2(1:N));
delete(h2(1:N));
end


%pause(1);





end
end
    
end

%Move to Landmark

previous=0;
next=N;


while previous~=next

    fprintf("N:%d\n",next);
    
for sen_read=previous+1:next

    fprintf("landmark:%d\n",sen_read);
    
land_x=mu(3+1+2*(sen_read-1),1);
land_y=mu(3+2+2*(sen_read-1),1);
    
diff_x=land_x-mu(1,1);
diff_y=land_y-mu(2,1);
    
rotate=wrapToPi(atan2(diff_y,diff_x)-mu(3,1));
diff=sqrt((diff_x)^2+(diff_y)^2);
trans_num=round(diff);

 
    if rotate>0
    
    %Sensor
    ut=0;
    ur=rotate;
    move_robot(ut,ur);
    sensor=get_landmarks();
    sen_size=size(sensor);
    if sen_size(1,1)~=0
    z=struct2table(sensor);
    else 
    z=[];
    end

    %Function
    [mu,cov,N]=EKF_SLAM_U(mu,cov,ut,ur,z,N);

    %Ellipsoid for Robot
    ns = 3;
    C = chol(cov(1:2,1:2))'; %Choleski method
    C = [C(1,1) C(1,2);C(2,1) C(2,2)];
    ellip = ns*C*circle;
    ELLx = mu(1)+ellip(1,:);
    ELLy = mu(2)+ellip(2,:);

    plot(ELLx(1,:),ELLy(1,:),'-m');
    xlim([-20 24]);
    ylim([-20 40]);
    hold on;

    %Ellipsoid for Boundary
    ellip = 7*circle;
    ELL_xb = mu(1)+ellip(1,:);
    ELL_yb = mu(2)+ellip(2,:);

    %b1=plot(ELL_xb(1,:),ELL_yb(1,:),'-r');
    hold on;

    if N>0
    for j=1:N
    %Ellipsoid for Landmark
    ns = 3;
    C = chol(cov(3+1+2*(j-1):3+2+2*(j-1),3+1+2*(j-1):3+2+2*(j-1)))'; %Choleski method
    C = [C(1,1) C(1,2);C(2,1) C(2,2)];
    ellip = ns*C*circle;
    ELL_xl = mu(3+1+2*(j-1))+ellip(1,:);
    ELL_yl = mu(3+2+2*(j-1))+ellip(2,:);

    h1(j)=plot(ELL_xl(1,:),ELL_yl(1,:),'-b');
    g1(j)=plot(mu(3+1+2*(j-1)),mu(3+2+2*(j-1)),'o');

    end
    end

    %delete(b1);
    delete(g1(1:N));
    delete(h1(1:N));
  
    end

    if rotate<0
        
        %Sensor
        ut=0;
        ur=rotate;
        move_robot(ut,ur);
        sensor=get_landmarks();
        sen_size=size(sensor);
        if sen_size(1,1)~=0
        z=struct2table(sensor);
        else 
        z=[];
        end

        %Function
        [mu,cov,N]=EKF_SLAM_U(mu,cov,ut,ur,z,N);

        %Ellipsoid for Robot
        ns = 3;
        C = chol(cov(1:2,1:2))'; %Choleski method
        C = [C(1,1) C(1,2);C(2,1) C(2,2)];
        ellip = ns*C*circle;
        ELLx = mu(1)+ellip(1,:);
        ELLy = mu(2)+ellip(2,:);

        plot(ELLx(1,:),ELLy(1,:),'-m');
        xlim([-20 24]);
        ylim([-20 40]);
        hold on;

        %Ellipsoid for Boundary
        ellip = 7*circle;
        ELL_xb = mu(1)+ellip(1,:);
        ELL_yb = mu(2)+ellip(2,:);

        %b1=plot(ELL_xb(1,:),ELL_yb(1,:),'-r');
        hold on;

        if N>0
        for j=1:N
        %Ellipsoid for Landmark
        ns = 3;
        C = chol(cov(3+1+2*(j-1):3+2+2*(j-1),3+1+2*(j-1):3+2+2*(j-1)))'; %Choleski method
        C = [C(1,1) C(1,2);C(2,1) C(2,2)];
        ellip = ns*C*circle;
        ELL_xl = mu(3+1+2*(j-1))+ellip(1,:);
        ELL_yl = mu(3+2+2*(j-1))+ellip(2,:);

        h1(j)=plot(ELL_xl(1,:),ELL_yl(1,:),'-b');
        g1(j)=plot(mu(3+1+2*(j-1)),mu(3+2+2*(j-1)),'o');

        end
        end

        %delete(b1);
        delete(g1(1:N));
        delete(h1(1:N));
   
    end
  
if trans_num~=0
for i=1:trans_num

%Sensor
ut=1.0;
ur=0;
move_robot(ut,ur);
sensor=get_landmarks();
sen_size=size(sensor);
if sen_size(1,1)~=0
z=struct2table(sensor);
else 
z=[];
end

%{
snum=size(z);
snum=snum(1,1);
if snum>0 && check==0
   loop=1;
   check=1;
   break;
end
%}

%Function
[mu,cov,N]=EKF_SLAM_U(mu,cov,ut,ur,z,N);

%Ellipsoid for Robot
ns = 3;
C = chol(cov(1:2,1:2))'; %Choleski method
C = [C(1,1) C(1,2);C(2,1) C(2,2)];
ellip = ns*C*circle;
ELLx = mu(1)+ellip(1,:);
ELLy = mu(2)+ellip(2,:);

plot(ELLx(1,:),ELLy(1,:),'-m');
xlim([-30 30]);
ylim([-30 30]);
hold on;

%Ellipsoid for Boundary
ellip = 7*circle;
ELL_xb = mu(1)+ellip(1,:);
ELL_yb = mu(2)+ellip(2,:);

%b2=plot(ELL_xb(1,:),ELL_yb(1,:),'-r');
hold on;

if N>0
for j=1:N
%Ellipsoid for Landmark
ns = 3;
C = chol(cov(3+1+2*(j-1):3+2+2*(j-1),3+1+2*(j-1):3+2+2*(j-1)))'; %Choleski method
C = [C(1,1) C(1,2);C(2,1) C(2,2)];
ellip = ns*C*circle;
ELL_xl = mu(3+1+2*(j-1))+ellip(1,:);
ELL_yl = mu(3+2+2*(j-1))+ellip(2,:);

h2(j)=plot(ELL_xl(1,:),ELL_yl(1,:),'-b');
g2(j)=plot(mu(3+1+2*(j-1)),mu(3+2+2*(j-1)),'o');

end

%pause(1)

%delete(b2);
delete(g2(1:N));
delete(h2(1:N));

end

end
end
    
%Check Process

origin_x=mu(1,1);
origin_y=mu(2,1);

for land_i=1:16
      
    land_x=control(land_i,1)+origin_x;
    land_y=control(land_i,2)+origin_y;
    
    diff_x=land_x-mu(1,1);
    diff_y=land_y-mu(2,1);
    
    rotate=wrapToPi(atan2(diff_y,diff_x)-mu(3,1));
    diff=sqrt((diff_x)^2+(diff_y)^2);
    trans_num=round(diff);
  
    if rotate>0
    
    %Sensor
    ut=0;
    ur=rotate;
    move_robot(ut,ur);
    sensor=get_landmarks();
    sen_size=size(sensor);
    if sen_size(1,1)~=0
    z=struct2table(sensor);
    else 
    z=[];
    end

    %Function
    [mu,cov,N]=EKF_SLAM_U(mu,cov,ut,ur,z,N);

    %Ellipsoid for Robot
    ns = 3;
    C = chol(cov(1:2,1:2))'; %Choleski method
    C = [C(1,1) C(1,2);C(2,1) C(2,2)];
    ellip = ns*C*circle;
    ELLx = mu(1)+ellip(1,:);
    ELLy = mu(2)+ellip(2,:);

    plot(ELLx(1,:),ELLy(1,:),'-m');
    xlim([-20 24]);
    ylim([-20 40]);
    hold on;

    %Ellipsoid for Boundary
    ellip = 7*circle;
    ELL_xb = mu(1)+ellip(1,:);
    ELL_yb = mu(2)+ellip(2,:);

    %b1=plot(ELL_xb(1,:),ELL_yb(1,:),'-r');
    hold on;

    if N>0
    for j=1:N
    %Ellipsoid for Landmark
    ns = 3;
    C = chol(cov(3+1+2*(j-1):3+2+2*(j-1),3+1+2*(j-1):3+2+2*(j-1)))'; %Choleski method
    C = [C(1,1) C(1,2);C(2,1) C(2,2)];
    ellip = ns*C*circle;
    ELL_xl = mu(3+1+2*(j-1))+ellip(1,:);
    ELL_yl = mu(3+2+2*(j-1))+ellip(2,:);

    h1(j)=plot(ELL_xl(1,:),ELL_yl(1,:),'-b');
    g1(j)=plot(mu(3+1+2*(j-1)),mu(3+2+2*(j-1)),'o');

    end
    end

    %delete(b1);
    delete(g1(1:N));
    delete(h1(1:N));
  
    end

    if rotate<0
        
        %Sensor
        ut=0;
        ur=rotate;
        move_robot(ut,ur);
        sensor=get_landmarks();
        sen_size=size(sensor);
        if sen_size(1,1)~=0
        z=struct2table(sensor);
        else 
        z=[];
        end

        %Function
        [mu,cov,N]=EKF_SLAM_U(mu,cov,ut,ur,z,N);

        %Ellipsoid for Robot
        ns = 3;
        C = chol(cov(1:2,1:2))'; %Choleski method
        C = [C(1,1) C(1,2);C(2,1) C(2,2)];
        ellip = ns*C*circle;
        ELLx = mu(1)+ellip(1,:);
        ELLy = mu(2)+ellip(2,:);

        plot(ELLx(1,:),ELLy(1,:),'-m');
        xlim([-20 24]);
        ylim([-20 40]);
        hold on;

        %Ellipsoid for Boundary
        ellip = 7*circle;
        ELL_xb = mu(1)+ellip(1,:);
        ELL_yb = mu(2)+ellip(2,:);

        %b1=plot(ELL_xb(1,:),ELL_yb(1,:),'-r');
        hold on;

        if N>0
        for j=1:N
        %Ellipsoid for Landmark
        ns = 3;
        C = chol(cov(3+1+2*(j-1):3+2+2*(j-1),3+1+2*(j-1):3+2+2*(j-1)))'; %Choleski method
        C = [C(1,1) C(1,2);C(2,1) C(2,2)];
        ellip = ns*C*circle;
        ELL_xl = mu(3+1+2*(j-1))+ellip(1,:);
        ELL_yl = mu(3+2+2*(j-1))+ellip(2,:);

        h1(j)=plot(ELL_xl(1,:),ELL_yl(1,:),'-b');
        g1(j)=plot(mu(3+1+2*(j-1)),mu(3+2+2*(j-1)),'o');

        end
        end

        %delete(b1);
        delete(g1(1:N));
        delete(h1(1:N));
   
    end
  
if trans_num~=0
for i=1:trans_num

%Sensor
ut=1.0;
ur=0;
move_robot(ut,ur);
sensor=get_landmarks();
sen_size=size(sensor);
if sen_size(1,1)~=0
z=struct2table(sensor);
else 
z=[];
end

%{
snum=size(z);
snum=snum(1,1);
if snum>0 && check==0
   loop=1;
   check=1;
   break;
end
%}

%Function
[mu,cov,N]=EKF_SLAM_U(mu,cov,ut,ur,z,N);

%Ellipsoid for Robot
ns = 3;
C = chol(cov(1:2,1:2))'; %Choleski method
C = [C(1,1) C(1,2);C(2,1) C(2,2)];
ellip = ns*C*circle;
ELLx = mu(1)+ellip(1,:);
ELLy = mu(2)+ellip(2,:);

plot(ELLx(1,:),ELLy(1,:),'-m');
xlim([-30 30]);
ylim([-30 30]);
hold on;

%Ellipsoid for Boundary
ellip = 7*circle;
ELL_xb = mu(1)+ellip(1,:);
ELL_yb = mu(2)+ellip(2,:);

%b2=plot(ELL_xb(1,:),ELL_yb(1,:),'-r');
hold on;

if N>0
for j=1:N
%Ellipsoid for Landmark
ns = 3;
C = chol(cov(3+1+2*(j-1):3+2+2*(j-1),3+1+2*(j-1):3+2+2*(j-1)))'; %Choleski method
C = [C(1,1) C(1,2);C(2,1) C(2,2)];
ellip = ns*C*circle;
ELL_xl = mu(3+1+2*(j-1))+ellip(1,:);
ELL_yl = mu(3+2+2*(j-1))+ellip(2,:);

h2(j)=plot(ELL_xl(1,:),ELL_yl(1,:),'-b');
g2(j)=plot(mu(3+1+2*(j-1)),mu(3+2+2*(j-1)),'o');

end
end


%pause(1);


if i<trans_num||land_i~=16
%delete(b2);
delete(g2(1:N));
delete(h2(1:N));
end

end
end
    
end

end

previous=next;
next=N;

end

plot(map(:,1),map(:,2),'*k');

%{
for i=1:18

%Sensor
ut=0;
ur=10*pi/180;
move_robot(ut,ur);
sensor=get_landmarks();
sen_size=size(sensor);
if sen_size(1,1)~=0
z=struct2table(sensor);
else 
z=[];
end

%Function
[mu,cov,N]=EKF_SLAM_U(mu,cov,ut,ur,z,N);

end

%Sensor
ut=0.5;
ur=0;
move_robot(ut,ur);
sensor=get_landmarks();
sen_size=size(sensor);
if sen_size(1,1)~=0
z=struct2table(sensor);
else 
z=[];
end

%Function
[mu,cov,N]=EKF_SLAM_U(mu,cov,ut,ur,z,N);
%}
%{
%Sensor
ut=0.5;
ur=0;
move_robot(ut,ur);
sensor=get_landmarks();
z=struct2table(sensor);

%Function
[mu,cov,N]=EKF_SLAM_U(mu,cov,ut,ur,z,N);
%}
%{
%Sensor
ut=1;
ur=0;
move_robot(ut,ur);
sensor=get_landmarks();
z=struct2table(sensor);

%Function
[mu,cov,N]=EKF_SLAM_U(mu,cov,ut,ur,z,N);
%}