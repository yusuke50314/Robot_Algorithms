function [mu,cov,N]=EKF_SLAM_U(mu,cov,ut,ur,z,N)

theta=mu(3,1);
deltaT=1;

%Noise R
R=zeros(3,3);
R(1,1)=0.01;
R(2,2)=0.01;
R(3,3)=0.001;

%Noise Q
Q=zeros(2,2);
Q(1,1)=0.01;
Q(2,2)=0.001;

%Motion
xdash=ut*deltaT*cos(theta);
ydash=ut*deltaT*sin(theta);
thetadash=ur*deltaT;
M=[xdash;ydash;thetadash];

%Motion (jacobian)
J=zeros(3,3);%%%%%%%%%%%
J(1,3)=-ut*deltaT*sin(theta);
J(2,3)=ut*deltaT*cos(theta);

%Construct F
F=zeros(3,3+2*N);
for i=1:3
F(i,i)=1;
end

%Predict mean
mu_dash=zeros(3+2*N,1);
mu_dash=mu+transpose(F)*M;
x_predict=mu_dash(1,1);
y_predict=mu_dash(2,1);
theta_predict=mu_dash(3,1);


%Calculate G
I=eye(3+2*N,3+2*N);
G=I+transpose(F)*J*F;

%Predict covariance
cov_dash=zeros(3+2*N,3+2*N);
cov_dash=G*cov*transpose(G)+transpose(F)*R*F;

%Sensor
%{
init_simulator()
move_robot(ut,ur)
get_landmarks()
z=struct2table(ans);
%}
snum=size(z);
snum=snum(1,1);

%For loop for the number of sensor informations
if snum>=1
for i=1:snum

%One sensor information
r=z{i,1};
phi=z{i,2};
z_i=[r;phi];

%Update mean & covariance 
mu_dash(3+(2*N)+1,1)=x_predict+r*cos(phi+theta_predict);
mu_dash(3+(2*N)+2,1)=y_predict+r*sin(phi+theta_predict);
%mu_dash(3+(2*N)+1,1)=mu_dash(1,1)+r*cos(phi+mu_dash(3,1));
%mu_dash(3+(2*N)+2,1)=mu_dash(2,1)+r*sin(phi+mu_dash(3,1));
landmark_x=mu_dash(3+(2*N)+1,1);
landmark_y=mu_dash(3+(2*N)+2,1);
cov_dash(3+(2*N)+1,1:3+(2*N))=0;
cov_dash(3+(2*N)+2,1:3+(2*N))=0;
cov_dash(1:3+(2*N)+2,3+(2*N)+1)=0;
cov_dash(1:3+(2*N)+2,3+(2*N)+2)=0;
cov_dash(3+(2*N)+1,3+(2*N)+1)=9223372036854;
cov_dash(3+(2*N)+2,3+(2*N)+2)=9223372036854;
N_l=N+1;

H=zeros(2,3+2*N_l);
H_save=zeros((3+2*N_l)*2,N_l);
H_i=zeros(2,3+2*N_l);
pai=zeros(1,N_l);

%For Loop for comparing N+1 with 1...N
for k=1:N+1

%Difference of Robot and Landmark
delta_x=mu_dash(3+(2*(k-1))+1,1)-mu_dash(1,1);
delta_y=mu_dash(3+(2*(k-1))+2,1)-mu_dash(2,1);
delta=[delta_x;delta_y];
q=transpose(delta)*delta;

%Parameter that sensor should get
z_dash=[sqrt(q);wrapToPi(atan2(delta_y,delta_x)-mu_dash(3,1))];
z_dash_save(1:2,k)=z_dash(1:2,1);

%Construct F_k
F_k=zeros(5,3+2*N_l);
F_k(1,1)=1;
F_k(2,2)=1;
F_k(3,3)=1;
F_k(4,3+(2*k-2)+1)=1;
F_k(5,3+(2*k-2)+2)=1;

%Calculate H
h=[-sqrt(q)*delta_x,-sqrt(q)*delta_y,0,sqrt(q)*delta_x, sqrt(q)*delta_y;
    delta_y,-delta_x,-q,-delta_y,delta_x];
H=h/q*F_k;

for n=1:3+2*N_l
H_save(1+2*(n-1),k)=H(1,n);
H_save(2+2*(n-1),k)=H(2,n);
end

psi=H*cov_dash*transpose(H)+Q;
psi_save(1,k)=psi(1,1);
psi_save(2,k)=psi(2,1);
psi_save(3,k)=psi(1,2);
psi_save(4,k)=psi(2,2);
diff_1=[z_i(1)-z_dash(1);wrapToPi(z_i(2)-z_dash(2))];
pai(1,k)=transpose(diff_1)/psi*(diff_1);

end
val=sum(eig(cov(1:3,1:3)));
pai(1,N+1)=val*2000; %alpha
[pai_min,j]=min(pai);

for n=1:3+2*N_l
H_j(1,n)=H_save(1+2*(n-1),j);
H_j(2,n)=H_save(2+2*(n-1),j);
end

psi_j(1,1)=psi_save(1,j);
psi_j(2,1)=psi_save(2,j);
psi_j(1,2)=psi_save(3,j);
psi_j(2,2)=psi_save(4,j);

%Check
N_c=N;
N=max(N,j);

%Calculate K
K=cov_dash*transpose(H_j)/psi_j;
K_c=K*H_j;

if N_c==N
    mu_dash=mu_dash(1:3+2*N,1);
    cov_dash=cov_dash(1:3+2*N,1:3+2*N);
    K=K(1:3+2*N,1:2);
    K_c=K_c(1:3+2*N,1:3+2*N);
end


%Upadate Process
diff_2=[z_i(1)-z_dash_save(1,j);wrapToPi(z_i(2)-z_dash_save(2,j))];
mu_dash=mu_dash+K*(diff_2);
cov_dash=cov_dash-K_c*cov_dash;

%{
if N_c==N
    mu_dash=mu_dash(1:3+2*N,1);
    cov_dash=cov_dash(1:3+2*N,1:3+2*N);
end
%}

end

end

mu=mu_dash;
cov=cov_dash;

end