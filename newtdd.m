function c=newtdd(x,y,n)
for j=1:n
v(j,1)=y(j); % Fill in y column of Newton triangle
end
for i=2:n % For column i,
for j=1:n+1-i % fill in column from top to bottom
v(j,i)=(v(j+1,i-1)-v(j,i-1))/(x(j+i-1)-x(j));
end
end
for i=1:n
c(i)=v(1,i); % Read along top of triangle
end % for output coefficients