function [L]=L(T, p, r)
% Computes Lik
%Inputs:
% T - points ti, where i is from 1 to n
% p - points in which we find Lik, from 1 to n
% r - numer of points on each distance
%
%Outputs:
% Lik - counted matrix

% Number of points in X
n = length(T);
h = ( T(n) - T(1) ) / (n-1);

L = [];
% Compute Lik
for i=2:n
    for k=1:r
        if (p(i) >= T(i-1) && p(i) <= T(i))
            point = ( p(i) - T(i-1) ) / h;
            newXr = linspace(T(i-1), T(i), r);
            L(i+1,k) = Alpha(newXr, point, k);
        else
            L(i+1,k) = 0;
        end
        
    end
end