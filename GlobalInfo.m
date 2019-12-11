global ModelInfo

% Coefficient used for calculating X and XDerivative functions
ModelInfo.r = 5;

% Number of points
n = 64;
ModelInfo.n = n;

% Boundaries of t vatiable
t0 = 0;
tn = 2*pi;
ModelInfo.t0 = t0;
ModelInfo.tn = tn;

% Step of the iteration process
ModelInfo.h = tn/n;