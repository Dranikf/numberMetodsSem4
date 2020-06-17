
x = [0.847 1.546 1.834 2.647 2.91];
y = [-1.104 1.042 0.029 -0.344 -0.449]

disp('Lagrange interpolation poly');
lagPoly = lagIntPoly(x , y, 0)
disp('first Newton intrtpolation poly');
nPoly = newton2Lab(x , y, x(1)+x(2))
disp('splines test');
subs(diff(lagPoly) , x(1))
subs(diff(lagPoly) , x(5))
splines = spline3_1forLab(x , y , subs(diff(lagPoly) , x(1)) , subs(diff(lagPoly) , x(5)) , false);

disp('L(x1 + x2)')
subs(lagPoly , x(1) + x(2))
disp('N(x1+x2)')
subs(nPoly , x(1) + x(2))
disp('S(x1+x2)');
splineSubs(x , x(1) + x(2), splines)


plot(x , y , '.r' , 'MarkerSize' , 20);

hold on
vx = x(1):0.01:x(5);
plot(vx , [subs(lagPoly , vx) ;subs(nPoly , vx); splineSubs(x , vx , splines) ])

legend( 'points','lagrange' , 'newton' , 'splines')
hold off
