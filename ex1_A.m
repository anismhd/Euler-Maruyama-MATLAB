function A = ex1_A( time, X )
    W = 5;
    eta = 0.05;
    k = W^2;
    c = 2*W*eta;
    m = 1.0;
    A = [0 , 1; -k/m, -c/m];
    A = A*X;
    return
end

