function v = integral_S2(f)
% integrates over the surface of the sphere (S2) the function f
% INPUT: 
%   f: a function on the surface of the sphere (S2)
%       f is in the range [-90:step:90],[0:step:360] 
% OUTPUT:
%   v: integral of function f on S2
%
% example: integral_S2(ones(181,361)) = 4 pi
%
% This code can only be used for academic purposes. If you use this code, 
% please cite the paper:
%
% R. Moreno, M. Borga, Ö. Smedby "Generalizing the mean intercept 
% length tensor for gray-level images". Medical Physics(39), pp.
% 4599-4612. 2012
%
% Rodrigo Moreno 
% Last modification: Oct 2013

step = 180/(size(f,1)-1);

w = cos((-90:step:90)*pi/180)';

v = sum(sum(f(:,1:end-1).*repmat(w,[1 size(f,2)-1]).*(step*pi/180)^2));
