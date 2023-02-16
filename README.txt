The provided code shows an example of using our method for computing the
generalized MIL tensor.

Contents:

- test.m contains a basic example of how to use the main function "generalized_MIL_tensor.m"
- Simons directory contains the code of Frederik J. Simons' library to compute spherical harmonics
- LEGENDRE directory is used by Simon's library to store precomputed Legendre functions

This code can only be used for academic purposes. If you use this code, 
please cite the paper:

R. Moreno, M. Borga, Ö. Smedby "Generalizing the mean intercept length 
tensor for gray-level images". Medical Physics (39), pp. 4599-4612. 2012


Our code uses the Frederik J. Simons' implementation of spherical harmonics
that can be obtained from
http://geoweb.princeton.edu/people/simons/software.html
The use of this library is not critical for computing the GMIL, any other 
library can be used instead, but a few modifications of the provided code
can be necessary.

Rodrigo Moreno 
Last modification November 2013. rodrigo.moreno@liu.se
