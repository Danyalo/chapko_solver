function [L]=L(X, H, p, r)
% Computes Lik
%Inputs:
% X – points xi, where i is from 1 to n
% p - points in which we find Lik
% r - numer of points on each distance
% H - step for 1 - n points
%
%Outputs:
% Lik – counted array ????
% Number of points in X
%n=size(X,1);
n = length(X);

%global ModelInfo
%r = ModelInfo.r;
L = [,];
% Compute Lik
for i=2:n
    for k=0:r
        if (p(i) >= X(i-1) && p(i) <= X(i))
            point=(p(i)-X(i-1))/H;
            newXr = linspace(X(i-1), X(i), r);
            L(i+1,k+1) = Alpha(newXr, point);
        else
            L(i+1,k+1) = 0;
        end
        
    end
end