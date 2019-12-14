function [alpha]=Alpha_k(X, p, k)
% Computes alpha k for 
%Inputs:
% X - points xk, where k is from 0 to r
% p - point in which we find alpha k
% k - the lower index of Alpha_k
%
%Outputs:
% Alpha k - counted number

% Number of points in X
r=length(X);

% Compute numerator
alpha = 1;

for i=1:r
    if (k~=i)
        alpha = alpha * ( (p - X(i)) / (X(k) - X(i)) );
    end
end