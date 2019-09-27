

syms x y;
M=(4*abs(x))/((abs(x) + 1)^2 + y^2);
L=ellipticK(M);
f=(2*L/(pi*((abs(x) + 1)^2 + y^2)^(1/2)));
g = gradient(f, [x, y]);
[X, Y] = meshgrid(-1:.1:1,-1:.1:1);
X(X==0)=[]; %removes zeros from X
Y(Y==0)=[]; %removes zeros from Y
G1 = subs(g(1), [x y], {X,Y});
G2 = subs(g(2), [x y], {X,Y});
quiver(X, Y, G1, G2)