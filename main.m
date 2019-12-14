global ModelInfo

% Global variables

a = ModelInfo.a;
b = ModelInfo.b;
n = ModelInfo.n;   % 64
t0 = ModelInfo.t0; % 0
tn = ModelInfo.tn; % 2*PI

r = 5; % number of nodes for Gauss-Legrange quadrature
h = tn/n; % step H

% Exact solution
func = @(x,y) x^2 - y^2;
f = @(t) (a*cos(t))^2-(b*sin(t))^2;

% We use Boundary, BoundaryDer, BoundaryDer2 for these
% x1 = @(t)a*cos(t);
% x2 = @(t)b*sin(t);
% x1_der =@(t) -a*sin(t);
% x1_der2 =@(t) -a*cos(t);
% x2_der =@(t) b*cos(t);
% x2_der2 =@(t) -b*sin(t);

t = array(t0,tn,n); % array of n points, [t0, tn]
vector = transpose(arrayfun(f,t)); % array of values of f in the main nodes
matrix = [];

for i=1:n-1
    sigma_i_k = lgwt(r, t(i), t(i+1));
    % do something with nodes here - or store if there's the need to have
    % all n * r nodes at once
end

nodes = lgwt(5, a, b); % example - not useful


testingLik = L(t, zeros(n), r);

doubleSum(n, r, t, nodes);
for i=1:n
    for j=1:n
        %matrix(i,j) = -pi +h* Kernel_t_t(x1_der,x2_der, x1_der2, x2_der2,t(j));
    end
end
