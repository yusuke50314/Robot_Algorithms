%{

LAB2-Inverted Pendulum Simulator

Description for this file:
This is a file for getting are probability of every state in case of all force u.

%}

%Initialization
filename = 'LAB2_STATE.txt';
State=readtable(filename);

for j=-55:55
    if j==-55||j==-34||j==-21||j==-13||j==-8||j==-5||j==-3||j==-2||j==-1||j==0||j==1||j==2||j==3||j==5||j==8||j==13||j==21||j==34||j==55
        %j=-13;
        for i=1:143
            theta=State{i,1};
            thetadot=State{i,2};
            u=j;
            deltaT=0.1;
            
            [a,b] = ProbabilitySearch(theta,thetadot,u,deltaT);
            
            c=b*a;
           
            if i==1
                
                Table_of_Probability=array2table(c);
            else
                
                Table_of_Probabilitynew=array2table(c);
                Table_of_Probability=vertcat(Table_of_Probability,Table_of_Probabilitynew);
            end
        end
        if j==-55
            Table_of_Probability_action=Table_of_Probability;
        else
            Table_of_Probability_action=vertcat(Table_of_Probability_action,Table_of_Probability);
        end
    end
end