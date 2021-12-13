clear
px = [2, 8, 10];
py = [2, 1, -2];
vx = [-1, -5, 3];
vy = [15, -3, 0];
 
axis equal
axis([0 13 -4 8])
hold on
plot(px,py,'*')
quiver(px(1), py(1), vx(1), vy(1))
quiver(px(2), py(2), vx(2), vy(2))
quiver(px(3), py(3), vx(3), vy(3))
 
t1 = 0; t2 = 1;
syms a3 a2 a1 a0 b3 b2 b1 b0 t
x(t) = a3 * t^3 + a2 * t^2 + a1 * t + a0;
y(t) = b3 * t^3 + b2 * t^2 + b1 * t + b0;
xd(t) = diff(x(t),t);
yd(t) = diff(y(t),t);
ex = [
    x(t1)  == px(1),...
    xd(t1) == vx(1),...
    x(t2)  == px(2),...
    xd(t2) == vx(2),...
    ];
ey = [
    y(t1)  == py(1),...
    yd(t1) == vy(1),...
    y(t2)  == py(2),...
    yd(t2) == vy(2),...
    ];
mx = solve(ex, [a3 a2 a1 a0]);
my = solve(ey, [b3 b2 b1 b0]);
%cx(t) = mx.a3 * t^3 + mx.a2 * t^2 + mx.a1 * t + mx.a0; ugyan az
cx(t) = subs(x, [a3 a2 a1 a0], [mx.a3 mx.a2 mx.a1 mx.a0]);
%cy(t) = my.b3 * t^3 + my.b2 * t^2 + my.b1 * t + my.b0;
cy(t) = subs(y, [b3 b2 b1 b0], [my.b3 my.b2 my.b1 my.b0]);
 
fplot(cx(t), cy(t), [t1 t2])
ex = [
    x(t1)  == px(2),...
    xd(t1) == vx(2),...
    x(t2)  == px(3),...
    xd(t2) == vx(3),...
    ];
ey = [
    y(t1)  == py(2),...
    yd(t1) == vy(2),...
    y(t2)  == py(3),...
    yd(t2) == vy(3),...
    ];
mx = solve(ex, [a3 a2 a1 a0]);
my = solve(ey, [b3 b2 b1 b0]);
cx(t) = subs(x, [a3 a2 a1 a0], [mx.a3 mx.a2 mx.a1 mx.a0]);
cy(t) = subs(y, [b3 b2 b1 b0], [my.b3 my.b2 my.b1 my.b0]);
fplot(cx(t), cy(t), [t1 t2])

