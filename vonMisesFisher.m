function res = vonMisesFisher( options )
% creates the vonMisesFisher kernel
% INPUT: 
%   options.angular_step: angular step of the grid
%   options.kappa: parameter kappa of the vonMisesFisher function
% OUTPUT:
%   the vonMisesFisher function mapped into a grid of the S2.
%
% This code can only be used for academic purposes. If you use this code, 
% please cite the paper:
%
% R. Moreno, M. Borga, ?. Smedby "Generalizing the mean intercept 
% length tensor for gray-level images". Medical Physics(39), pp.
% 4599-4612. 2012
%
% Rodrigo Moreno 
% Last modification: May 2013

phi = (0:options.angular_step:180)*pi/180;

res = repmat(exp(options.kappa*cos(phi))',[1 360/options.angular_step+1]);
res = res / sum(sum(res(:,1)));
end