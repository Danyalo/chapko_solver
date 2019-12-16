function L = L_i_k(t, T, i, k)
% Computes Lik
%Inputs:
% t - the point for which we calculate L_k
% T - points ti, where i is from 1 to n
% i - index i of L_i_k; from 2 to n
% k - index k of L_i_k; from 1 to r
%
%Outputs:
% L - counted vector of L_i's

global ModelInfo;
r = ModelInfo.r;

% Number of points in X
n = length(T);
h = ( T(n) - T(1) ) / (n-1);

if (t >= T(i-1) && t <= T(i))
    point = ( t - T(i-1) ) / h; % good
    sigma_i_k = lgwt(r, T(i-1), T(i));
    L = Alpha(sigma_i_k, point, k);
else
    L = 0;
end
