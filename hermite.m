clear
px = [2,8, 12];
py = [2,1, -2];
%Érintők:
vx = [3, 2, 4];
vy = [10, -8, 0];
plot(px, py, '*')

axis equal
axis([0 18 -5 8])
hold on
%quiver-t használunk vektorok kirajzolására.
%megadjuk a pontok x és y koordinátáját a hozzá tartozó érintővektorokkal
quiver(px(1), py(1), vx(1), vy(1));
quiver(px(2), py(2), vx(2), vy(2));
quiver(px(3), py(3), vx(3), vy(3));

t1 = 0; t2 = 1;
syms a3 a2 a1 a0 t
syms b3 b2 b1 b0 t
% Első görbe X és Y paraméteres egyenlete:
x(t) = a3*t^3 + a2*t^2 + a1*t + a0;
y(t) = b3*t^3 + b2*t^2 + b1*t + b0;


xd(t) = diff(x(t), t);
yd(t) = diff(y(t), t);
%Felírjuk az egyenletet a deriváltba való behelyettesítés utáni értékek
%kiszámításához, X és Y függvényekre.
ex1 = [
    x(t1) == px(1), ...
    xd(t1) == vx(1), ...
    x(t2) == px(2), ...
    xd(t2) == vx(2) ...
];

ey1 = [
    y(t1) == py(1), ...
    yd(t1) == vy(1), ...
    y(t2) == py(2), ...
    yd(t2) == vy(2) ...
];

mx = solve(ex1, [a3 a2 a1 a0]);
my = solve(ey1, [b3 b2 b1 b0]);
%Paraméterekbe való behelyettesítés:
cx1(t) = subs(x, [a3 a2 a1 a0], [mx.a3 mx.a2 mx.a1 mx.a0]);
cy1(t) = subs(y, [b3 b2 b1 b0], [my.b3 my.b2 my.b1 my.b0]);
fplot(cx1(t), cy1(t), [t1 t2])

% Második görbe:

ex2 = [
    x(t1) == px(2), ...
    xd(t1) == vx(2), ...
    x(t2) == px(3), ...
    xd(t2) == vx(3) ...
];
ey2 = [
    y(t1) == py(2), ...
    yd(t1) == vy(2), ...
    y(t2) == py(3), ...
    yd(t2) == vy(3) ...
];
mx = solve(ex2, [a3 a2 a1 a0]);
my = solve(ey2, [b3 b2 b1 b0]);
cx2(t) = subs(x, [a3 a2 a1 a0], [mx.a3 mx.a2 mx.a1 mx.a0]);
cy2(t) = subs(y, [b3 b2 b1 b0], [my.b3 my.b2 my.b1 my.b0]);

fplot(cx2(t), cy2(t), [t1 t2])