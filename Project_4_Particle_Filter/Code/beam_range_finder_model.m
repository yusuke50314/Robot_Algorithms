%{
//beam_range_finder.m
matlab file that contains the function for Algorithm 2 in Lab4 asignment paper.
%}

function [q]=beam_range_finder_model(sensor,dstate,q)

dsigma=0.001;

for k=1:3
x=dstate(k);
y=sensor(k);
q=q*(1/(sqrt(2*pi*dsigma)))*exp(-(x-y)^2/(2*dsigma));
end

