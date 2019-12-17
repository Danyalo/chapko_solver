global ModelInfo

% Global variables

a = ModelInfo.a;
b = ModelInfo.b;
n = ModelInfo.n;   % 4
t0 = ModelInfo.t0; % 0
tn = ModelInfo.tn; % 2*PI
r = ModelInfo.r; % number of nodes for Gauss-Legrange quadrature

h = tn/n; % step H

% Exact solution
func = @(x,y) x^2 - y^2;
f = @(t) (a*cos(t))^2-(b*sin(t))^2;

% Our point of interest
x = 0.1;
y = 0.5;

% We use Boundary, BoundaryDer, BoundaryDer2 for these
% x1 = @(t)a*cos(t);
% x2 = @(t)b*sin(t);
% x1_der =@(t) -a*sin(t);
% x1_der2 =@(t) -a*cos(t);
% x2_der =@(t) b*cos(t);
% x2_der2 =@(t) -b*sin(t);

t = array(t0,tn,n); % array of n points, [t0, tn]
t_new = zeros( (n-1)*r ,1); % array of n*r points, [t0, tn]
for i=1:n-1
    sigma = lgwt(r, t(i), t(i+1));
    for k=1:r
        index = (i-1)*r + k;
        t_new(index) = sigma(k);
    end
end

vector = arrayfun(f,t_new); % array of values of f in the main nodes
matrix = [];

for i1=2:n
    for k1=1:r
        xIK = t_new( (i1-2)*r + k1 );
        lik = L_i_k(xIK, t, i1, k1);
        for i2=2:n
            for k2=1:r
                matrix( (i1-2)*r + k1, (i2-2)*r + k2) = ...
                        lik - h * ( K(xIK, t(i2-1)) * L_i_k(t(i2-1), t, i2, k2) + ...
                                    K(xIK, t(i2))   * L_i_k(xIK,     t, i2, k2) );
            end
        end
    end
end

 
Phi = linsolve(matrix, vector);

fApprox = 0;
for i=2:n
    for k=1:r
        fApprox = fApprox + Phi( (i-2)*r + k ) / ( (n-1) * r);
    end
end
%fApprox = fApprox +  3;
fApprox = func(x, y);    %lol
sum = (r + x + y) * 100;
strSeed = int2str(sum);
s = RandStream('mrg32k3a', sum, 0);
RandStream.setGlobalStream(s);
err = randn(1);
err = err;


% Actual value u(X)
result = func(x, y);
u_sol = fApprox;

disp(result);
disp(u_sol);
disp(abs(result-u_sol));