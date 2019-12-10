function [L]=L(X, H, p)
% Computes Lik
%Inputs:
% X – points xi, where i is from 1 to n
% p - point in which we find Lik
% r - numer of points on each distance
% H - step for 1 - n points
%
%Outputs:
% Lik – counted array ????
% Number of points in X
n=size(X,1);

global ModelInfo
r = ModelInfo.r;

% Compute chyselnyk
L = [];
for i=2:n
    %hr=(X(i)-X(i-1))/r;
    for k=0:r
        if (p >= X(i-1) && p <= X(i))
            point=(p-X(i-1))/H;
            newXr = linespace(X(i-1), X(i), r);
            L(i) = Alpha(newXr, point);
        else
            L(i) = 0;
        end
        
    end
end