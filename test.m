% This file shows an example of using our method for computing the
% generalized MIL tensor
%
% This code can only be used for academic purposes. If you use this code, 
% please cite the paper:
%
% R. Moreno, M. Borga, Ö. Smedby "Generalizing the mean intercept 
% length tensor for gray-level images". Medical Physics (39), pp.
% 4599-4612. 2012
%
% Rodrigo Moreno 
% Last modification November 2013. rodrigo.moreno@liu.se

% Our code uses the Frederik J. Simons' implementation of spherical harmonics
% that can be obtained from
% http://geoweb.princeton.edu/people/simons/software.html
% The use of this library is not critical for computing the GMIL, any other 
% library can be used instead, but a few modifications of the provided code
% can be necessary
addpath('Simons'); 

% Some parameters
options.sigma = 1; %Sigma used for the estimation of the gradient
options.filter_threshold = .1; %threshold used to filter out noisy estimations of the gradient
options.kappa = 10; %parameter of the von Mises-Fisher kernel
options.L = 5; %bandwidth for the spherical harmonics representation
options.angular_step = 1; %angular resolution of the EGI in degrees
options.kerneltype = 'vMF'; %HC or vMF

% loading some data
load('test_data.mat'); %the voxel size is assumed isotropic

% creating the kernel
if strcmp(options.kerneltype, 'vMF')
    kernel = vonMisesFisher(options);
else
    kernel = half_cosine(options);
end

% computing the GMIL
GMIL = generalized_MIL_tensor(data,kernel,options);

% eigendecomposition
[e_vec,e_val] = eig(GMIL);
e_val = diag(e_val)';
e_val= e_val/max(e_val)
e_vec

