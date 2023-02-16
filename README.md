# Generalized Mean Intercept Length Tensor (GMIL)

This repository provides the code for estimating the GMIL from trabecular bone samples as described in:

R. Moreno, M. Borga, Ö. Smedby "Generalizing the mean intercept length tensor for gray-level images". Medical Physics (39), pp. 4599-4612. 2012. https://doi.org/10.1118/1.4730502



# Installation Instructions
Just copy the provided matlab scripts

test.m contains a basic example of how to use the main function "generalized_MIL_tensor.m"

# Description of the repository

The main function is "generalized_MIL_tensor.m" that calls the other provided scripts. 
The directory "Simons" contains a subset of the Frederik J. Simons' library to compute spherical harmonics. These functions were downloaded in 2013 from his website: 
http://geoweb.princeton.edu/people/simons/software.html
A newer version of these functions are available in his repository https://github.com/csdms-contrib/slepian_alpha. Notice that GMIL should work with the new version, but the functions were tested only with the old version of the library. Only the matlab scripts that are used by GMIL are provided.

The "LEGENDRE" directory is required by Simons' library to store precomputed Legendre functions. It is filled the first time GMIL is run.

# Data

The repository comes with a small sample of trabecular bone (test_data.mat)


# Citation
If you use this code, please cite the paper:

R. Moreno, M. Borga, Ö. Smedby "Generalizing the mean intercept length tensor for gray-level images". Medical Physics (39), pp. 4599-4612. 2012. https://doi.org/10.1118/1.4730502



Rodrigo Moreno 
Last modification November 2013. rodmore@kth.se
