function res = sh_conv(sh, shk)
% convolves the function sh with the kernel shk in the spherical harmonics
% domain
% INPUT: 
%   sh: spherical harmonics representation of the function to convolve
%   shk: spherical harmonics representation of the kernel. It should only
%        contain zonal coefficients
% OUTPUT:
%   res: sh * shk (angular convolution)
%
% Note: this function uses the reperesentation of Simons' spherical
% harmonics toolkit. This function must accordingly be changed if other libraries are
% used (e.g. s2kit).
%
% This code can only be used for academic purposes. If you use this code, 
% please cite the paper:
%
% R. Moreno, M. Borga, Ö. Smedby "Generalizing the mean intercept 
% length tensor for gray-level images". Medical Physics(39), pp.
% 4599-4612. 2012
%
% Rodrigo Moreno 
% Last modification: July 2012

shk = shk(shk(:,2)==0,3);   %select only the zonal coefficients (the others are zero!)
k = ((4*pi./(2*(0:size(shk,1)-1)+1)).^.5)' .* shk; %multiply by this factor to create alpha (see the paper)

%performs the convolution in spherical harmonics
ini = 1;
fin = 1;
res = sh;
for i=1:numel(k)
    res(ini:fin,3:4) = sh(ini:fin,3:4)*k(i);
    ini = fin + 1;
    fin = fin + i + 1;
end
fin = fin - i;
res(fin:end,3:4) = zeros(size(sh,1)-fin+1,2);
end
