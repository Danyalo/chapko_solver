function result=K(t,theta)

if (t ~= theta)
    x_t = Boundary(t);
    x_theta = Boundary(theta);
    x_der_theta = BoundaryDer(theta);
    
    numerator = 2 * ((x_t(1) - x_theta(1)) * x_der_theta(2) ...
                   - (x_t(2) - x_theta(2)) * x_der_theta(1) );
    denominator = (norm(x_t - x_theta)).^2;
    
    result = numerator / denominator;
else
    x_t_der = BoundaryDer(t);
    x_t_der2 = BoundaryDer2(t);
    
    numerator = - x_t_der(1) * x_t_der2(2) ...
                + x_t_der(2) * x_t_der2(1);
    denominator = (norm(x_t_der)).^2;
    
    result = numerator / denominator;
end
