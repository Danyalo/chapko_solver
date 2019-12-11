global ModelInfo

n = ModelInfo.n;
h = ModelInfo.h;
t0 = ModelInfo.t0;
tn = ModelInfo.tn;
r = ModelInfo.r;

% Exact solution
func = @(x,y) x^2 - y^2; 
f = @(t) (r*cos(t))^2-(r*sin(t))^2;

t = array(t0,tn,n);
vector = transpose(arrayfun(f,t));
matrix = [];