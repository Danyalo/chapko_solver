function [alpha]=Alpha(X, p)
% Computes alpha k for 
%Inputs:
% X � points xk, where k is from 0 to r
% p - point in which we find alpha k
%
%Outputs:
% Alpha k � counted number

% Number of points in X
n=length(X);

% Compute numerator
alpha = 1;
for i=1:n
    for k=1:n
        if (k~=i)
            alpha = alpha * ((p - X(i))/(X(k) - X(i)));
        end
    end
end