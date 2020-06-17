f = sym('(y/(x^2)) + exp(x)');
x0 = 1; y0 = 1.3679; h = 0.1; b=2;epsil = 0.6737;
info = false;

tempH = h;
[rxh2 , ryh2] = eilerMetod(f , x0 , y0, b , tempH*2 , info);
while (true)

	[rx, ry] = eilerMetod(f , x0 , y0, b , tempH , info);

	t_ry = ry(1:2:numel(ry)); 
	t_rx = rx(1:2:numel(rx));

	diffR = get1Norm(ryh2 - t_ry);

	if(diffR < epsil)
		break;
	end

	rxh2 = rx; ryh2 = ry;
	tempH = tempH/2;

end

disp('Eiler metod solution');
eilerSol = [rx;ry]
plot(rx , ry ,'r');
hold on;

tempH = h;
[rxh2 , ryh2] = eilerMetodSpesh(f , x0 , y0, b , tempH*2 , info);
while (true)

	[rx, ry] = eilerMetodSpesh(f , x0 , y0, b , tempH , info);

	t_ry = ry(1:2:numel(ry)); 
	t_rx = rx(1:2:numel(rx));

	diffR = get1Norm(ryh2 - t_ry)

	if(diffR < epsil)
		break;
	end

	rxh2 = rx; ryh2 = ry;
	tempH = tempH/2;

end

disp('implicit Eiler metod solution');
eilerSpeshSol = [rx;ry]
plot(rx , ry ,'m');
hold on;


epsil = 10^(-4);
tempH = h;
[rxh2 , ryh2] = hoinMetod(f , x0 , y0, b , tempH*2 , info);
while (true)

	[rx, ry] = hoinMetod(f , x0 , y0, b , tempH , info);

	t_ry = ry(1:2:numel(ry)); 
	t_rx = rx(1:2:numel(rx));

	diffR = get1Norm(ryh2 - t_ry)

	if(diffR/3 < epsil)
		break;
	end

	rxh2 = rx; ryh2 = ry;
	tempH = tempH/2;

end

disp('hoin metod solution');
hoinSol = [rx;ry]
plot(rx , ry ,'g');
hold on;

[rxh2, ryh2] = adamsMetod(f , x0 , y0 , b , rx(3) , ry(3) , 2*tempH , info);
[rx , ry] = adamsMetod(f , x0 , y0 , b , rx(2) , ry(2) , tempH , info);

t_ry = ry(1:2:numel(ry)); 
t_rx = rx(1:2:numel(rx));

diffR = get1Norm(ryh2 - t_ry);

disp(['adams metod sulution with accuracy ' , num2str(diffR/3)])
adams = [rx , ry]
plot(rx , ry, 'b');
