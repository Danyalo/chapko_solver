function L = L_i(t, T, i)
% Computes Lik
%Inputs:
% t - the point for which we calculate L_k
% T - points ti, where i is from 1 to n
% i - index i of L_i_k; from 2 to n
%
%Outputs:
% L - counted vector of L_i's

global ModelInfo;
r = ModelInfo.r;

% Number of points in X
n = length(T);
h = ( T(n) - T(1) ) / (n-1);

L = zeros(r,1);

for k=1:r
    if (t >= T(i-1) && t <= T(i))
        point = ( t- T(i-1) ) / h; % good
        sigma_i_k = lgwt(r, T(i-1), T(i));
        L(k) = Alpha(sigma_i_k, point, k);
    else
        L(k) = 0;
    end
end