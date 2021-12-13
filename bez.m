clear
axis equal
px =[30, 50, 60 , 70, 80, 40,];
py =[20, 30, 20, 10, 50, 20,];

 plot(px,py,'ro--');
 hold on

n = 5;

syms t 

fx(t)= 0*t;
fy(t)= 0*t;

for i=0:n
    b=nchoosek(n, i)*t^i*(1-t)^(n-i);
    fx(t)= fx(t)+b*px(i+1);
    fy(t)= fy(t)+b*py(i+1);
end
fplot(fx,fy,[0 1],'blue');
t0 = 0.6;

fplot(fx(t0),fy(t0),'*','MarkerSize',10)

fxd= diff(fx, t);
fyd= diff(fy, t);
quiver(fx(t0),fy(t0),fxd(t0),fyd(t0));

quiver(fx(0),fy(0),fxd(0),fyd(0));
quiver(fx(1),fy(1),fxd(1),fyd(1));