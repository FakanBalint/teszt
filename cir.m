clear

%Körök középpontjai
o1 = [2, 4];
o2 = [3, 5];
r1 = 0.9;
r2 = 0.8;
plot(o1(1), o1(2), 'bo', o2(1), o2(2), 'ro');
axis equal;
hold on

%kör létrehozása.
syms t
circle1X(t) = o1(1) + r1 * cos(t);
circle1Y(t) = o1(2) + r1 * sin(t);
fplot(circle1X, circle1Y, [0 2*pi]);

circle2X(t) = o2(1) + r1 * cos(t);
circle2Y(t) = o2(2) + r1 * sin(t);
fplot(circle2X, circle2Y, [0 2*pi]);

syms u v
eq1 = circle1X(u) == circle2X(v);
eq2 = circle1Y(u) == circle2Y(v);
m = solve([eq1, eq2], [u,v]);
plot(cirlce1X(m.u), circle1Y(m.u), 'ro');