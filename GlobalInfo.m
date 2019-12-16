global ModelInfo

% Coefficients used for calculating X and XDerivative functions
ModelInfo.a = 5;
ModelInfo.b = 5;

% Number of points
n = 4;
ModelInfo.n = n;

% number of nodes for Gauss-Legrange quadrature
ModelInfo.r = 3;

% Boundaries of t vatiable
t0 = 0;
tn = 2*pi;
ModelInfo.t0 = t0;
ModelInfo.tn = tn;

% Step of the iteration process
ModelInfo.h = tn/n;