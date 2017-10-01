function X = Monte_Carlo_Euler_Maruyama ( time, X0, A, G, figure_on )
% This a MATLAB function for solving stochastic differential equations using Euler-Maruyama integration
%   Initially written as part of structural reliability class
%       Later reviced and uploaded to GitHub on 1st October 2017
%           by
%           Anis Mohammed Vengasseri
%           anis.mhd@gmail.com
%           https://github.com/anismhd
% Description of Function
% Function inputs are,
%   1. time - a vector stores time
%   2. X0   - A vector that stores initial condition
%   3. A    - Stochastic Differential Coefficients, see equation (1)
%   4. G    - Stochastic Differential Coefficients, see equation (1)
%   5. figure_on - >0 will display input and output figures
%
%       dX = A(X,t) + G(X,t)*dW     ------ (1)
%
%
    dimension = length(X0);
    N = size(G(time(1),X0),2);
    dt = time(2)-time(1);
    % Brownian increaments
    dW = sqrt(dt)*randn(N, length(time)-1);
    % Discretized brownian paths
    W = cumsum(dW,2);
    X = zeros(dimension, length(time));
    X(:,1) = X0;
    Xtemp = X0;
    for i=1:length(time)-1
        Winc = dW(:,i);
        A1 = A(time(i), Xtemp);
        G1 = G(time(i), Xtemp);
        Xtemp1 = Xtemp + A1*dt + G1*Winc;
        A2 = A(time(i+1), Xtemp1);
        G2 = G(time(i+1), Xtemp1);
        Xtemp = Xtemp + 0.5*(A1+A2)*dt + (G1+G2)*Winc;
        X(:,i+1) = Xtemp;
    end
    if figure_on
        figure;
        plot(time,W)
        xlabel('time')
        title('Input Brownian Motion')
        for i=1:length(X0)
            figure;
            plot(time, X(i,:))
            xlabel('time')
            title_str = sprintf('X_%i',i);
            title(title_str)
        end
        return
    else
        return
    end
end