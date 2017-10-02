clear all; close all; clc;
%% EXAMPLE 1
%
%   ddX + 2*eta*W* dX + W^2 * X = dW
%
N = 10000;
time = linspace(0,50,5001);
mean = time*0.0;
second_moment = time*0.0;
X0 = [0.0; 0.0];
for i=1:N
    X = Monte_Carlo_Euler_Maruyama ( time, X0, @ex1_A, @ex1_G, 0 );
    mean = mean + X(1,:);
    second_moment = second_moment + X(1,:).^2;
    if i==10
        plot(time, second_moment/10)
        hold all
    elseif i==100
        plot(time, second_moment/100)
    elseif i==1000
        plot(time, second_moment/1000)
    elseif i==10000
        plot(time, second_moment/10000)
    end
end
legend('10 Simulation', '100 Simulation', '1000 Simulation', '10000 Simulation')
xlabel('time (sec)')
ylabel('unit^2');
title('Second Moment of SDoF')