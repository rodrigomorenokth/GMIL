function T = orientation_tensor_egi(f)
% creates an orientation tensor from an orientation distribution function f
% on the surface of the sphere
% INPUT: 
%   f: orientation distribution function
% OUTPUT:
%   the tensor that approximates the function f
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

st =180/(size(f,1)-1); %the angular step can be obtained from the size of the input

%create the x,y,z coordinates of the centers of the grid 
[p2,t2] = ndgrid((-90:st:90)*pi/180,(0:st:360)*pi/180);
[x,y,z] = sph2cart(t2(:),p2(:),ones(numel(p2),1));

x = reshape(x,size(p2));
y = reshape(y,size(p2));
z = reshape(z,size(p2));

%perform the appropriate integrals in order to create the tensor
T = [integral_S2(f.*x.^2) integral_S2(f.*x.*y) integral_S2(f.*x.*z); ...
     0 integral_S2(f.*y.^2) integral_S2(f.*y.*z); ...
     0 0 integral_S2(f.*z.^2)];

%the resulting tensor is symmetric
T = T + triu(T,1)';
