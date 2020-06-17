f = sym('-0.5*(x/y)+x^2')
h=0.1; %шаг
y0=1;%начальные значения
x0=1;
b = 2; % тут надо написать конец интервала интегрирования

syms y;% это то куда будет писться каждый y(i+1)
i = 1;
for tempX = 1:h:b  
   
	x0 = [x0 , tempX];	
    y0 = [y0, y0(i)+h*subs(f , {'x' 'y'} , {x0(i), y0(i)})];

	i = i + 1;
end

plot(x0 , y0)

syms y;% это то куда будет писться каждый y(i+1)
i = 1;
x0 = 1;
y0 = 1;
for tempX = 1:h:b  
	x0 = [x0 , tempX];	
	sol = solve(y0(i) + h*subs(f , 'x', x0(i) + h) - y);
    y0 = [y0 ,  sol(2)];

	i = i + 1;
end

hold on;
plot(x0 , y0 , 'r')
