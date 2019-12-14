function v = BoundaryDer(t)

if  t < 0 || t > 2*pi
    error("t should be in range [0, 2PI]");
end

global ModelInfo
a = ModelInfo.a;
b = ModelInfo.b;

v(1) = - a * sin(t);
v(2) =   b * cos(t);
end