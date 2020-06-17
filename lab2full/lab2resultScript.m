x = [0.847 1.546 1.834 2.647 2.91];
y = [-1.104 1.042 0.029 -0.344 -0.449];

disp('its splines!!')
splines = spline3_1forLab(x , y , 0 , 0, false)

disp('S(x1+x2)');
splineSubs(x , x(1) + x(2), splines)


plot(x , y , '.r' , 'MarkerSize' , 20);

hold on
vx = x(1):0.01:x(5);
plot(vx , splineSubs(x , vx , splines) )

legend( 'points', 'splines')
hold off
