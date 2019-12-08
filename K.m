function result=K(t,theta)

if (t ~= theta)
    tResult = X(t);
    thetaResult = X(theta);
    tDerivativeResult = XDerivative(t);
    thetaDerivativeResult = XDerivative(theta);
    
    numerator = 2 * ((tResult(0) - thetaResult(0)) * thetaDerivativeResult(1) ...
                   - (tResult(1) - thetaResult(1)) * thetaDerivativeResult(0) );
    denominator = (norm(tResult - thetaResult)).^2;
    
    result = numerator / denominator;
end