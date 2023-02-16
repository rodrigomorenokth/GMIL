function T = generalized_MIL_tensor(data,kernel,options)
% computes the generalized mean intercept tensor (GMIL) of the volume using
% the given kernel
% INPUT: 
%   data: the volume to process
%   kernel: the kernel used in the computations. See details in the paper
%   options.angular_step: angular step of the sampling grid of the surface
%           of the sphere
%   options.sigma: parameter sigma used in the estimation of the gradient
%   options.filter_threshold: threshold used to filter out noisy estimations of the gradient
%   options.L = 20; %bandwidth for the spherical harmonics representation
% OUTPUT:
%   T: the GMIL tensor
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


%% compute the gradient (Canny)
[gx,gy,gz] = canny3d(single(data),options.sigma);

%conversion to spherical coordinates (the minus performs the mirrorring)
[az,el,rad] = cart2sph(-gx,-gy,-gz); 
az = az*180/pi; 
el = el*180/pi;
az(az<0) = az(az<0) + 360; %range 0-360
maxrad = max(rad(:));

%filter out noisy gradient estimations
idx = find(rad>options.filter_threshold*maxrad);
az = az(idx);
el = el(idx);
rad = rad(idx);
clear idx;

%% create the mirrored EGI
% the EGI can be obtained through a 2 dimensional weighted histogram with
% a precision given by angular_step
lon = round(az/options.angular_step); 
lon(lon==(360/options.angular_step)) = 0;
lat = round((el+90)/options.angular_step);
rad = rad./(cos(el*pi/180)+1e6*eps); %This is necessary for preserving the surface area of each cell in the sphere
combined_position = int32(sub2ind([180/options.angular_step+1,360/options.angular_step],lat+1,lon+1));

%the weighted histogram
egi = accumarray(combined_position, rad)'; 
num = (180/options.angular_step+1) * (360/options.angular_step);
egi = padarray(egi,[0 num-numel(egi)],'post'); 
egi = reshape(egi,180/options.angular_step+1,360/options.angular_step);

%% spherical harmonics representation
%The implementation by Frederik J. Simons was used, but any other can be used
%instead, e.g. s2kit

%adjustments of the EGI for Simons' toolkit. Setting the average in the poles
egi(1,:) = sum(egi(1,:))/size(egi,2);    
egi(end,:) = sum(egi(end,:))/size(egi,2);
%repeating longitud == 0 at the end
egi = [egi egi(:,1)];

%direct SH transform
sh = xyz2plm(egi,options.L);
shk = xyz2plm(kernel,options.L);

%angular convolution in the frequency domain
t = sh_conv(sh, shk);  
    
%inverse of the spherical harmonics yields the crosses function
crosses = plm2xyz(t,options.angular_step);   

%normalization
crosses = crosses/max(crosses(:));

%% crosses can be seen as an orientation distribution function
% A tensor can be obtained from it. This is the GMIL

T = orientation_tensor_egi(1./(crosses+eps*1e6).^2);



