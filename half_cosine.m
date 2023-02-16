function res = half_cosine( options )
% creates the vonMisesFisher kernel
% INPUT: 
%   options.angular_step: angular step of the grid
% OUTPUT:
%   the half-cosine function mapped into a grid of the S2.
%
% This code can only be used for academic purposes. If you use this code, 
% please cite the paper:
%
% R. Moreno, M. Borga, Ö. Smedby "Generalizing the mean intercept 
% length tensor for gray-level images". Medical Physics(39), pp.
% 4599-4612. 2012
%
% Rodrigo Moreno 
% Last modification: May 2013

phi = (0:options.angular_step:90)*pi/180;

res = repmat(cos(phi)',[1 360/options.angular_step+1]);
res = [res;zeros(size(res,1)-1,size(res,2))];
end