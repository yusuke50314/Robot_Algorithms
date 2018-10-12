%function landmark = getland(n)
xbound=[-25,25];
ybound=[-25,25];

for i=1:25
landmark(i,:)=[round(xbound(1)+(xbound(2)-xbound(1))*rand), round(ybound(1)+(ybound(2)-ybound(1))*rand)]; 
end