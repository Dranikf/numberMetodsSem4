
xInterval = [1 , 10]

for(i = 1:8)
	subplot(2 ,4, i);
	[x , y] = genInterData(i+3 , xInterval , [3 5] , 'default');
	plot(x , y , 'r.' , 'MarkerSize' , 50);

	hold on;

	vx = xInterval(1):0.1:xInterval(2);

	expr = EuncerMethod(x , y);
	plot(vx , subs(expr , vx), '--' , 'LineWidth' , 5);
	
	expr = ElagrangePoly(x , y);
	plot(vx , subs(expr , vx), 'r');

end


legend( 'points','uncer', 'lagrange', 'Location' , 'NorthEastOutside');
