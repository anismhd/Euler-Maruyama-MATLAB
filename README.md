# Euler-Maruyama-MATLAB
Euler-Maruyama function for Solving Stochastic Differential Equations using Numerical Integration of Ito integrals

This a MATLAB function for solving stochastic differential equations using Euler-Maruyama integration.
Initially written as part of structural reliability class of STG Ragukhanth, IIT Madras.
       Later reviced and uploaded to GitHub on 1st October 2017.
       
           by
           Anis Mohammed Vengasseri
           anis.mhd@gmail.com
           https://github.com/anismhd
           
 Description of Function
 
 Function inputs are,
   1. time - a vector stores time
   2. X0   - A vector that stores initial condition
   3. A    - Stochastic Differential Coefficients, see equation (1)
   4. G    - Stochastic Differential Coefficients, see equation (1)
   5. figure_on - >0 will display input and output figures

   stochastic differential equation of the form
   $$   dX = A(X_t) dt + G(X_t) dW $$

Example 1:

Solution of SDoF subjected to white noise.

Second moment of displacement are,

![alt text](https://github.com/anismhd/Euler-Maruyama-MATLAB/example1.png)
