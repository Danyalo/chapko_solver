function [result]=doubleSum(n, r, t, s)

% s - Gauss-Legandre nodes
% t - points tik

result = zeros(n,1);
for i=1:n
    for k=1:r
        result(i) = K(t(i,k), s(k)) * L(t, s, r);
    end
end