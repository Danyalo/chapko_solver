function v = BoundaryDer2(t)

if  t < 0 || t > 2*pi
    error("t should be in range [0, 2PI]");
end

global ModelInfo
r = ModelInfo.r;

v(1) = - r * cos(t);
v(2) = - r * sin(t);
end