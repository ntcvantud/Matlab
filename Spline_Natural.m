% Use natural spline to interpolate given data.

% Set n, x_i and f(x_i)
n = 10;
x = [-1 -0.8 -0.6 -0.4 -0.2 0 0.2 0.4 0.6 0.8 1];
fx = [0.0385 0.0588 0.1 0.2 0.5 1 0.5 0.2 0.1 0.0588 0.0385];

% Set the coefficients a_i
a = fx;

% Set h_i. Here we use a Matlab function "diff"
% For more information, type "help diff"
h = diff(x);

% Set the matrix A
A = zeros(n+1,n+1);
A(1,1) = 1;
A(n+1,n+1) = 1;
for i=2:n
    A(i,i-1) = h(i-1);
    A(i,i) = 2*(h(i-1) + h(i));
    A(i,i+1) = h(i);
end

% Set the right-hand side vector rhs
rhs = zeros(n+1,1);
for i=2:n
    rhs(i) = 3*(a(i+1)-a(i))/h(i) - 3*(a(i)-a(i-1))/h(i-1);
end

% Solve for c_i
c = A\rhs;

% solve for b_i and d_i
b = (a(2:(n+1))-a(1:n))./h - h.*(c(2:(n+1))+2*c(1:n))'/3;
d = (c(2:(n+1))-c(1:n))'./h/3;

% Draw the graph
figure(1);
plot(x,fx,'*');
hold on;
for i=1:n
    plotx = x(i):0.01:x(i+1);
    tempx = plotx - x(i);
    ploty = a(i) + b(i)*tempx + c(i)*tempx.^2 + d(i)*tempx.^3;
    plot(plotx, ploty);
end
hold off;
axis([-1, 1, -0.5,2]);


