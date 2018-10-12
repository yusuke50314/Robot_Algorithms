%{

LAB2-Inverted Pendulum Simulator

Description for this file:
This is a file for using value iteration and get the optmal policy for every state.

%}

%Initialization
filename = 'LAB2_STATE.txt';
filename2 = 'LAB2_POLICY.txt';
State=readtable(filename);
Policy=readtable(filename2);
load ValueofState.mat;
load ValueofStateNext.mat;
load ValueofStateResult.mat;
load PolicyState.mat;
load PolicyStateResult.mat;
load Table_of_Probability_action.mat;
load DeltaofState.mat;

%Input Parameter
deltaT=0.1; %difference of time
mu=[0,0]; %mean of bivariate Gaussian
sigma=[0.01,0;0,0.001]; %covariance matrix of bivariate Gaussian
gamma=0.95;
delta=0;
policynum=19;
count=0;
maxcount=0;

%%%%% VALUE ITERATION %%%%%

while delta==0

for i=1:143
    v=ValueofState{i,1};

 if i~=72 && i~=1 && i~=2 && i~=3 && i~=4 && i~=5 && i~=6 && i~=7 && i~=8 && i~=9 && i~=10 && i~=11 && i~=133 && i~=134 && i~=135 && i~=136 && i~=137 && i~=138 && i~=139 && i~=140 && i~=141 && i~=142 && i~=143 
    sumGain=0;
    
    %Policy 1
    action=1;
    sumGain1=0;
   
    %Sum up the Gain1
    for j=1:13 %Column of "Table_of_Probability_acion"
        for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
            if Table_of_Probability_action{k,j}~=0 %Check probability of s'
               l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
               if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                  reward=1;
               else
                  reward=0;
               end
               sumGain1=sumGain1+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
            end   
        end
    end
    sumGain1=round(sumGain1,5);

    %Policy 2
    action=2;
    sumGain2=0;
   
    %Sum up the Gain2
    for j=1:13 %Column of "Table_of_Probability_acion"
        for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
            if Table_of_Probability_action{k,j}~=0 %Check probability of s'
               l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
               A=ValueofState{l,1}; %Check current Value of State
               if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                  reward=1;
               else
                  reward=0;
               end
               sumGain2=sumGain2+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
            end
        end
    end
    sumGain2=round(sumGain2,5);

    %Policy 3
    action=3;
    sumGain3=0;
   
    %Sum up the Gain3
    for j=1:13 %Column of "Table_of_Probability_acion"
        for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
            if Table_of_Probability_action{k,j}~=0 %Check probability of s'
               l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
               A=ValueofState{l,1}; %Check current Value of State
               if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                  reward=1;
               else
                  reward=0;
               end
               sumGain3=sumGain3+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
            end
        end
    end
    sumGain3=round(sumGain3,5);

    %Policy 4
    action=4;
    sumGain4=0;
    
    %Sum up the Gain4
    for j=1:13 %Column of "Table_of_Probability_acion"
        for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
            if Table_of_Probability_action{k,j}~=0 %Check probability of s'
               l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
               A=ValueofState{l,1}; %Check current Value of State
               if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                  reward=1;
               else
                  reward=0;
               end
               sumGain4=sumGain4+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
            end
        end
    end
    sumGain4=round(sumGain4,5);

    %Policy 5
    action=5;
    sumGain5=0;
   
    %Sum up the Gain5
    for j=1:13 %Column of "Table_of_Probability_acion"
        for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
            if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
                A=ValueofState{l,1}; %Check current Value of State
                if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                   reward=1;
                else
                   reward=0;
                end
                sumGain5=sumGain5+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
            end
        end
    end
    sumGain5=round(sumGain5,5);

    %Policy 6
    action=6;
    sumGain6=0;
   
    %Sum up the Gain6
    for j=1:13 %Column of "Table_of_Probability_acion"
        for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
            if Table_of_Probability_action{k,j}~=0 %Check probability of s'
               l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
               A=ValueofState{l,1}; %Check current Value of State
               if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                  reward=1;
               else
                  reward=0;
               end
               sumGain6=sumGain6+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
            end
        end
    end
    sumGain6=round(sumGain6,5);
   
    %Policy 7
    action=7;
    sumGain7=0;
   
    %Sum up the Gain7
    for j=1:13 %Column of "Table_of_Probability_acion"
        for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
            if Table_of_Probability_action{k,j}~=0 %Check probability of s'
               l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
               A=ValueofState{l,1}; %Check current Value of State
               if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                  reward=1;
               else
                  reward=0;
               end
               sumGain7=sumGain7+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
            end
        end
    end
    sumGain7=round(sumGain7,5);
   
    %Policy 8
    action=8;
    sumGain8=0;
   
    %Sum up the Gain8
    for j=1:13 %Column of "Table_of_Probability_acion"    
        for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
            if Table_of_Probability_action{k,j}~=0 %Check probability of s'
               l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
               A=ValueofState{l,1}; %Check current Value of State
               if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                  reward=1;
               else
                  reward=0;
               end
               sumGain8=sumGain8+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
            end
        end
    end
    sumGain8=round(sumGain8,5);

    %Policy 9
    action=9;
    sumGain9=0;
   
    %Sum up the Gain9
    for j=1:13 %Column of "Table_of_Probability_acion"    
        for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"  
            if Table_of_Probability_action{k,j}~=0 %Check probability of s'
               l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
               A=ValueofState{l,1}; %Check current Value of State
               if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                  reward=1;
               else
                  reward=0;
               end
               sumGain9=sumGain9+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
            end
        end
    end
    sumGain9=round(sumGain9,5);
   
    %Policy 10
    action=10;
    sumGain10=0;
   
    %Sum up the Gain10
    for j=1:13 %Column of "Table_of_Probability_acion"    
        for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1331+(i*11) %Row of "Table_of_Probability_acion"
            if Table_of_Probability_action{k,j}~=0 %Check probability of s'
               l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
               A=ValueofState{l,1}; %Check current Value of State
               if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                  reward=1;
               else
                  reward=0;
               end
               sumGain10=sumGain10+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
            end
        end
    end
    sumGain10=round(sumGain10,5);

    %Policy 11
    action=11;
    sumGain11=0;
   
    %Sum up the Gain11
    for j=1:13 %Column of "Table_of_Probability_acion"    
        for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"    
            if Table_of_Probability_action{k,j}~=0 %Check probability of s'
               l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
               A=ValueofState{l,1}; %Check current Value of State
               if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                  reward=1;
               else
                  reward=0;
               end
               sumGain11=sumGain11+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
            end
        end
    end
    sumGain11=round(sumGain11,5);

    %Policy 12
    action=12;
    sumGain12=0;
   
    %Sum up the Gain12
    for j=1:13 %Column of "Table_of_Probability_acion"      
        for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"    
            if Table_of_Probability_action{k,j}~=0 %Check probability of s'
               l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
               A=ValueofState{l,1}; %Check current Value of State
               if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                  reward=1;
               else
                  reward=0;
               end
               sumGain12=sumGain12+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
            end
        end
    end
    sumGain12=round(sumGain12,5);

    %Policy 13
    action=13;
    sumGain13=0;
   
    %Sum up the Gain13
    for j=1:13 %Column of "Table_of_Probability_acion"
        for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"    
            if Table_of_Probability_action{k,j}~=0 %Check probability of s'
               l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
               A=ValueofState{l,1}; %Check current Value of State
               if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                  reward=1;
               else
                  reward=0;
               end
               sumGain13=sumGain13+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
            end
        end 
    end
    sumGain13=round(sumGain13,5);
   
    %Policy 14
    action=14;
    sumGain14=0;
   
    %Sum up the Gain14
    for j=1:13 %Column of "Table_of_Probability_acion"
        for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
            if Table_of_Probability_action{k,j}~=0 %Check probability of s'
               l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
               if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                  reward=1;
               else
                  reward=0;
               end
               sumGain14=sumGain14+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
            end
        end
    end
    sumGain14=round(sumGain14,5);    
     
    %Policy 15
    action=15;
    sumGain15=0;
   
    %Sum up the Gain15
    for j=1:13 %Column of "Table_of_Probability_acion"
       for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
           if Table_of_Probability_action{k,j}~=0 %Check probability of s'
              l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
              if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                 reward=1;
              else
                 reward=0;
              end
              sumGain15=sumGain15+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
           end  
       end
    end
    sumGain15=round(sumGain15,5);
   
    %Policy 16
    action=16;
    sumGain16=0;
   
    %Sum up the Gain16
    for j=1:13 %Column of "Table_of_Probability_acion"
       for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
           if Table_of_Probability_action{k,j}~=0 %Check probability of s'
              l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
              if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                 reward=1;
              else
                 reward=0;
              end
              sumGain16=sumGain16+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
           end 
       end
    end
    sumGain16=round(sumGain16,5);

    %Policy 17
    action=17;
    sumGain17=0;
   
    %Sum up the Gain17
    for j=1:13 %Column of "Table_of_Probability_acion"
       for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
           if Table_of_Probability_action{k,j}~=0 %Check probability of s'
              l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
              if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                 reward=1;
              else
                 reward=0;
              end
              sumGain17=sumGain17+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
           end    
       end
    end
    sumGain17=round(sumGain17,5);
    
    %Policy 18
    action=18;
    sumGain18=0;
   
    %Sum up the Gain18
    for j=1:13 %Column of "Table_of_Probability_acion"
       for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"  
           if Table_of_Probability_action{k,j}~=0 %Check probability of s'
              l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
              if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                 reward=1;
              else
                 reward=0;
              end
              sumGain18=sumGain18+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
           end  
       end
    end  
    sumGain18=round(sumGain18,5);
  
    %Policy 19
    action=19;
    sumGain19=0;
   
    %Sum up the Gain19
    for j=1:13 %Column of "Table_of_Probability_acion"
       for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion" 
           if Table_of_Probability_action{k,j}~=0 %Check probability of s'
              l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;     
              if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                 reward=1;
              else
                 reward=0;
              end
              sumGain19=sumGain19+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
           end
       end
    end
    sumGain19=round(sumGain19,5);

    sumGain=sumGain1+sumGain2+sumGain3+sumGain4+sumGain5+sumGain6+sumGain7+sumGain8+sumGain9+sumGain10+sumGain11+sumGain12+sumGain13+sumGain14+sumGain15+sumGain16+sumGain17+sumGain18+sumGain19;
    ValueofStateNext{i,1}=sumGain/policynum;
end

%fprintf("%d:%f\n",i,ValueofStateNext{i,1});
vnext=ValueofStateNext{i,1};
DeltaofState{i,1}=abs(vnext-v);
end

delta=1;

for i=1:143
    if DeltaofState{i,1}>0.01
       delta=0;
       break
    end
end

ValueofState=ValueofStateNext;

end

for i=1:11
    for j=1:13
        ValueofStateResult{i,j}=ValueofStateNext{11*(i-1)+j,1};
    end
end

fprintf("VALUE INTERATION FINISHED\n");

%%%%%% OPTIMAL POLICY %%%%%

for i=1:143
    v=ValueofState{i,1};

    if i~=72 && i~=1 && i~=2 && i~=3 && i~=4 && i~=5 && i~=6 && i~=7 && i~=8 && i~=9 && i~=10 && i~=11 && i~=133 && i~=134 && i~=135 && i~=136 && i~=137 && i~=138 && i~=139 && i~=140 && i~=141 && i~=142 && i~=143 
       sumGain=0;
    
       %Policy 1
       action=1;
       sumGain1=0;
   
       %Sum up the Gain1
       for j=1:13 %Column of "Table_of_Probability_acion"
           for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
               if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                  l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;  
                  if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                     reward=1;
                  else
                     reward=0;
                  end
                  sumGain1=sumGain1+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));  
               end
           end
       end
       sumGain1=round(sumGain1,5);

       %Policy 2
       action=2;
       sumGain2=0;
   
       %Sum up the Gain2
       for j=1:13 %Column of "Table_of_Probability_acion"
           for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"  
               if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                  l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
                  A=ValueofState{l,1}; %Check current Value of State
                  if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                     reward=1;
                  else
                     reward=0;
                  end
                  sumGain2=sumGain2+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));    
               end    
           end
       end
       sumGain2=round(sumGain2,5);
 
       %Policy 3
       action=3;
       sumGain3=0;
   
       %Sum up the Gain3
       for j=1:13 %Column of "Table_of_Probability_acion"
           for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
               if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                  l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
                  A=ValueofState{l,1}; %Check current Value of State
                  if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                     reward=1;
                  else
                     reward=0;
                  end
                  sumGain3=sumGain3+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
               end      
           end
       end
       sumGain3=round(sumGain3,5);

       %Policy 4
       action=4;
       sumGain4=0;
   
       %Sum up the Gain4
       for j=1:13 %Column of "Table_of_Probability_acion"
           for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
               if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                  l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
                  A=ValueofState{l,1}; %Check current Value of State
                  if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                     reward=1;
                  else
                     reward=0;
                  end
                  sumGain4=sumGain4+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));  
               end    
           end
       end
       sumGain4=round(sumGain4,5);

       %Policy 5
       action=5;
       sumGain5=0;
   
       %Sum up the Gain5
       for j=1:13 %Column of "Table_of_Probability_acion"
           for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
               if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                  l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
                  A=ValueofState{l,1}; %Check current Value of State
                  if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                     reward=1;
                  else
                     reward=0;
                  end
                  sumGain5=sumGain5+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
               end 
           end
       end
       sumGain5=round(sumGain5,5);

       %Policy 6
       action=6;
       sumGain6=0;
   
       %Sum up the Gain6
       for j=1:13 %Column of "Table_of_Probability_acion"
           for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
               if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                  l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
                  A=ValueofState{l,1}; %Check current Value of State
                  if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                     reward=1;
                  else
                     reward=0;
                  end
                  sumGain6=sumGain6+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));   
               end  
           end
       end
       sumGain6=round(sumGain6,5);
   
       %Policy 7
       action=7;
       sumGain7=0;
   
       %Sum up the Gain7
       for j=1:13 %Column of "Table_of_Probability_acion"
           for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion" 
               if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                  l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
                  A=ValueofState{l,1}; %Check current Value of State
                  if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                     reward=1;
                  else
                     reward=0;
                  end
                 sumGain7=sumGain7+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
               end 
           end
       end
       sumGain7=round(sumGain7,5);
   
       %Policy 8
       action=8;
       sumGain8=0;
   
       %Sum up the Gain8
       for j=1:13 %Column of "Table_of_Probability_acion"    
           for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
               if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                  l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
                  A=ValueofState{l,1}; %Check current Value of State
                  if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                     reward=1;
                  else
                     reward=0;
                  end
                  sumGain8=sumGain8+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
               end
           end
       end
       sumGain8=round(sumGain8,5);
   
       %Policy 9
       action=9;
       sumGain9=0;
   
       %Sum up the Gain9
       for j=1:13 %Column of "Table_of_Probability_acion"    
           for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
               if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                  l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
                  A=ValueofState{l,1}; %Check current Value of State
                  if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                     reward=1;
                  else
                     reward=0;
                  end
                  sumGain9=sumGain9+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1})); 
               end
           end
       end
       sumGain9=round(sumGain9,5);
   
       %Policy 10
       action=10;
       sumGain10=0;
  
       %Sum up the Gain10
       for j=1:13 %Column of "Table_of_Probability_acion"    
           for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1331+(i*11) %Row of "Table_of_Probability_acion"
               if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                  l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
                  A=ValueofState{l,1}; %Check current Value of State
                  if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                     reward=1;
                  else
                     reward=0;
                  end
                  sumGain10=sumGain10+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
               end     
           end
       end
       sumGain10=round(sumGain10,5);
   
       %Policy 11
       action=11;
       sumGain11=0;
   
       %Sum up the Gain11
       for j=1:13 %Column of "Table_of_Probability_acion"    
           for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
               if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                  l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
                  A=ValueofState{l,1}; %Check current Value of State
                  if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                     reward=1;
                  else
                     reward=0;
                  end
                  sumGain11=sumGain11+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1})); 
               end 
           end
       end
       sumGain11=round(sumGain11,5);
   
       %Policy 12
       action=12;
       sumGain12=0;
   
       %Sum up the Gain12
       for j=1:13 %Column of "Table_of_Probability_acion"      
           for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
               if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                  l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
                  A=ValueofState{l,1}; %Check current Value of State
                  if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                     reward=1;
                  else
                     reward=0;
                  end
                  sumGain12=sumGain12+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
               end 
           end
       end
       sumGain12=round(sumGain12,5);
 
       %Policy 13
       action=13;
       sumGain13=0;
   
       %Sum up the Gain13
       for j=1:13 %Column of "Table_of_Probability_acion"
           for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
               if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                  l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
                  A=ValueofState{l,1}; %Check current Value of State
                  if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                     reward=1;
                  else
                     reward=0;
                  end
                  sumGain13=sumGain13+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
               end    
           end
       end
       sumGain13=round(sumGain13,5);

       %Policy 14
       action=14;
       sumGain14=0; 
       
       %Sum up the Gain1
       for j=1:13 %Column of "Table_of_Probability_acion"
           for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
               if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                  l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
                  if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                     reward=1;
                  else
                     reward=0;
                  end
                  sumGain14=sumGain14+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
               end
           end
       end
       sumGain14=round(sumGain14,5);

       %Policy 15
       action=15;
       sumGain15=0;
   
       %Sum up the Gain15
       for j=1:13 %Column of "Table_of_Probability_acion"
           for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
               if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                  l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
                  if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                     reward=1;
                  else
                     reward=0;
                  end
                  sumGain15=sumGain15+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
               end
           end
       end
       sumGain15=round(sumGain15,5);

       %Policy 16
       action=16;
       sumGain16=0;
   
       %Sum up the Gain16
       for j=1:13 %Column of "Table_of_Probability_acion"
           for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"   
               if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                  l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;       
                  if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                     reward=1;
                  else
                     reward=0;
                  end
                  sumGain16=sumGain16+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
               end
           end
       end
       sumGain16=round(sumGain16,5);

       %Policy 17
       action=17;
       sumGain17=0;
   
       %Sum up the Gain17
       for j=1:13 %Column of "Table_of_Probability_acion"
           for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
               if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                  l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
                  if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                     reward=1;
                  else
                     reward=0;
                  end
                  sumGain17=sumGain17+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
               end
           end
       end
       sumGain17=round(sumGain17,5);
   
       %Policy 18
       action=18;
       sumGain18=0;
   
       %Sum up the Gain18
       for j=1:13 %Column of "Table_of_Probability_acion"
           for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
               if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                  l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
                  if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                     reward=1;
                  else
                     reward=0;
                  end
                  sumGain18=sumGain18+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
               end
           end
       end
       sumGain18=round(sumGain18,5);

       %Policy 19
       action=19;
       sumGain19=0;
   
       %Sum up the Gain19
       for j=1:13 %Column of "Table_of_Probability_acion"
           for k=(action-1)*1573+(1+(i-1)*11):(action-1)*1573+(i*11) %Row of "Table_of_Probability_acion"
               if Table_of_Probability_action{k,j}~=0 %Check probability of s'
                  l=(k-(i-1)*11-(action-1)*1573)+(j-1)*11;
                  if l~=1 && l~=2 && l~=3 && l~=4 && l~=5 && l~=6 && l~=7 && l~=8 && l~=9 && l~=10 && l~=11 && l~=133 && l~=134 && l~=135 && l~=136 && l~=137 && l~=138 && l~=139 && l~=140 && l~=141 && l~=142 && l~=143 
                     reward=1;
                  else
                     reward=0;
                  end
                  sumGain19=sumGain19+Table_of_Probability_action{k,j}*((reward)+gamma*(ValueofState{l,1}));
               end 
           end
       end
       sumGain19=round(sumGain19,5);
       
       sumGain=[sumGain1,sumGain2,sumGain3,sumGain4,sumGain5,sumGain6,sumGain7,sumGain8,sumGain9,sumGain10,sumGain11,sumGain12,sumGain13,sumGain14,sumGain15,sumGain16,sumGain17,sumGain18,sumGain19];
       sumGainmax=max(sumGain);

       policy=0;
       maxcount=0;
       if sumGainmax==sumGain1
          policy=-55;
          maxcount=maxcount+1;
       end
       if sumGainmax==sumGain2
          if policy>-34
             policy=-34;
          end
          maxcount=maxcount+1;
       end
       if sumGainmax==sumGain3
          if policy>-21
             policy=-21;
          end
          maxcount=maxcount+1;
       end
       if sumGainmax==sumGain4
          if policy>-13
             policy=-13;
          end
          maxcount=maxcount+1;
       end
       if sumGainmax==sumGain5
          if policy>-8
             policy=-8;
          end
          maxcount=maxcount+1;
       end
       if sumGainmax==sumGain6
          if policy>-5
             policy=-5;
          end
          maxcount=maxcount+1;
       end
       if sumGainmax==sumGain7
          if policy>-3
             policy=-3;
          end
          maxcount=maxcount+1;
       end
       if sumGainmax==sumGain8
          if policy>-2
             policy=-2;
          end
          maxcount=maxcount+1;
       end
       if sumGainmax==sumGain9
          if policy>-1
             policy=-1;
          end
          maxcount=maxcount+1;
       end
       if sumGainmax==sumGain10
          policy=0;
          maxcount=maxcount+1;
       end
       if sumGainmax==sumGain11
          if policy<1
             policy=1;
          end
          maxcount=maxcount+1;
       end
       if sumGainmax==sumGain12 
          if policy<2
             policy=2;
          end
          maxcount=maxcount+1;
       end
       if sumGainmax==sumGain13
          if policy<3
             policy=3;
          end
          maxcount=maxcount+1;
       end
       if sumGainmax==sumGain14
          if policy<5
             policy=5;
          end
          maxcount=maxcount+1;
       end
       if sumGainmax==sumGain15
          if policy<8
             policy=8;
          end
          maxcount=maxcount+1;
       end
       if sumGainmax==sumGain16
          if policy<13
             policy=13;
          end
          maxcount=maxcount+1;
       end
       if sumGainmax==sumGain17
          if policy<21
             policy=21;
          end
          maxcount=maxcount+1;
       end
       if sumGainmax==sumGain18
          if policy<34
             policy=34;
          end
          maxcount=maxcount+1;
       end
       if sumGainmax==sumGain19
          if policy<55
             policy=55;
          end
          maxcount=maxcount+1;
       end

       PolicyState{i,1}=policy;
    end

end 

for j=1:13
    for i=1:11
        PolicyStateResult{i,j}=PolicyState{i+(j-1)*11,1};
    end
end


fprintf("GOT OPTIMAL POLICY\n");

fprintf("theta<%.4f  ",State{12,1});
fprintf("OptimalValueFunction:0.0  OptimalPolicy:NaN\n");

for i=12:132
    if State{i,2}>=0
       fprintf("theta=%.4f  thetadot= %.1f  ",State{i,1},State{i,2});
       fprintf("OptimalValueFunction:%f  OptimalPolicy:%d\n",ValueofState{i,1},PolicyState{i,1});
    else
        fprintf("theta=%.4f  thetadot=%.1f  ",State{i,1},State{i,2});
        fprintf("OptimalValueFunction:%f  OptimalPolicy:%d\n",ValueofState{i,1},PolicyState{i,1});
    end
end

fprintf("theta>%.4f  ",State{132,1});
fprintf("OptimalValueFunction:0.0  OptimalPolicy:NaN\n");





















