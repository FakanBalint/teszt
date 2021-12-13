clear
px = [2, 8, 10];
py = [2, 1, -2];
vx = [-1, -5, 3];
vy = [10, -3, 0];
 
axis equal
axis([0 13 -4 8])
hold on
plot(px,py,'*')
%vektor megjelenítés minden Ponthoz(xy) Vektort(xy) társít
quiver(px(1), py(1), vx(1), vy(1))
quiver(px(2), py(2), vx(2), vy(2))
quiver(px(3), py(3), vx(3), vy(3))

t1 = 0; t2 = 1;
syms a3 a2 a1 a0 b3 b2 b1 b0 t
%Egyenlet felírás
% Itt már nem a t pontok "erőssége" határozza meg a curve nagyságát, hanem
% a vektor hossza.
x(t) = a3 * t^3 + a2 * t^2 + a1 * t + a0;
y(t) = b3 * t^3 + b2 * t^2 + b1 * t + b0;
%deriválás
xd(t) = diff(x(t),t);
yd(t) = diff(y(t),t);
%t1 pontban x értéke az x koord. derivált értéke a vektor koord.
%Majd a következő pont értékei a következő x és vektor koord.
for i = 1:2
ex = [
    x(t1)  == px(i),...
    xd(t1) == vx(i),...
    x(t2)  == px(i+1),...
    xd(t2) == vx(i+1),...
];
ey = [
    y(t1)  == py(i),...
    yd(t1) == vy(i),...
    y(t2)  == py(i+1),...
    yd(t2) == vy(i+1),...
];
%Megoldásokat keresünk (matlab segít) a3-tól a0-ig
mx = solve(ex, [a3 a2 a1 a0]);
my = solve(ey, [b3 b2 b1 b0]);
%Behelyettesítés a, b helyekbe a kiszámolt értékekkel.
cx(t) = subs(x, [a3 a2 a1 a0], [mx.a3 mx.a2 mx.a1 mx.a0]);
cy(t) = subs(y, [b3 b2 b1 b0], [my.b3 my.b2 my.b1 my.b0]);
fplot(cx(t), cy(t), [t1 t2])
end