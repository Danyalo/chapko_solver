global ModelInfo

n = ModelInfo.n;
h = ModelInfo.h;
t0 = ModelInfo.t0;
tn = ModelInfo.tn;
r = ModelInfo.r;

% Exact solution
func = @(x,y) x^2 - y^2; 
f = @(t) (r*cos(t))^2-(r*sin(t))^2;
a = 1;
b = 3;
x1 = @(t)a*cos(t);
x2 = @(t)b*sin(t);

n =64;
x0 = 0;
xn = 2*pi;
h = xn/n;

x1_der =@(t) -a*sin(t);
x1_der2 =@(t) -a*cos(t);
x2_der =@(t) b*cos(t);
x2_der2 =@(t) -b*sin(t);

t = array(t0,tn,n);
vector = transpose(arrayfun(f,t));
matrix = [];
nodes = lgwt(n, a, b);
doubleSum(n, r, t, nodes);
for i=1:n
    for j=1:n
        %matrix(i,j) = -pi +h* Kernel_t_t(x1_der,x2_der, x1_der2, x2_der2,t(j));
    end
end
