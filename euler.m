
% Euler’s method
% euler.m
dt = 0.1;
t = 0.0:dt:5.0;
y = zeros(size(t));
y(1) = 1;
for ii = 1:(length(t)-1)
y(ii+1) = y(ii) + dt * (1-t(ii))*y(ii);
end
exact = exp(t-t.^2/2);
plot(t,y,t,exact,'--')