function t = array(a,b,n)

t = zeros(n,1);

for j=1:n
    t(j) = ( a + (j-1) * b )/ (n - 1);
end
end
