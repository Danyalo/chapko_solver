function [alpha]=Alpha(Zigma, p, k)
% Computes alpha k for 
%Inputs:
% Zigma - points zigma_k, where k is from 0 to r
% p - point in which we find alpha k
% k - the lower index of Alpha_k
%
%Outputs:
% Alpha k - counted number

% Number of points in X
r=length(Zigma);

% Compute numerator
alpha = 1;

for i=1:r
    if (k~=i)
        alpha = alpha * ( (p - Zigma(i)) / (Zigma(k) - Zigma(i)) );
    end
end