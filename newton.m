%
% In this example, we use the Newton's method to solve
%   cos x - x = 0
%

% Set the initial guess for x, TOL, N
x0 = pi/3;
TOL = 1e-8;
N = 100;

% Set the iteration index
i = 1;

% set the initial error
err = 1;

% start the iteration
while  ( i<=N & err>TOL )
  i = i+1;
  x = x0 - (cos(x0)-x0)/(-sin(x0)-1);
  err = abs(x-x0);
  x0 = x;
end

% Print the result
if  ( err<TOL )
  fprintf('Found the root %12.10f after %d iterations.\n', x, i-1);
else
  fprintf('Method failed after %d iterations', i);
end