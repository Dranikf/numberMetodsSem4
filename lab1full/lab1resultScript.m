
x = [0.847 1.546 1.834 2.647 2.91];
y = [-1.104 1.042 0.029 -0.344 -0.449]

disp('Lagrange interpolation poly');
lagPoly = lagIntPoly(x , y, 0)
disp('first Newton intrtpolation poly');
nPoly = NewtonIntPolyArr(x , y, x(1) , 2.91 , 1 , false , 0)

disp('L(x1 + x2)')
subs(lagPoly , x(1) + x(2))
disp('N(x1+x2)')
subs(nPoly , x(1) + x(2))

Y2 = subs(lagPoly , x);
Y3 = subs(nPoly , x);

plot(x, [Y2 ; Y3]);

legend('lagrange' , 'newton')
