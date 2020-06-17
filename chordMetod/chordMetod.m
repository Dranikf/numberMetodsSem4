% function for root of the equation by chordMetod
% by Fedor Kobak github.com/Dranikf

% expr - is an expression for getting root
% a b - is start borders
% info - is it need extra info 
% epsil - is accuracy of sollution

function [solution] = chordMetod(expr ,a , b ,epsil  , info)

	if(info)
		x = a:(b - a)/20:b;
		plot(x , subs(expr , x));
		hold on;
		line([a b] , [0 0] , 'LineStyle' , '--' , 'Color' , 'r');
	end
	
	px = a;
	i = 0;

	dexpr = diff(expr);
	minX = fminbnd(matlabFunction(abs(dexpr)) , a , b);
	m = subs(abs(dexpr) , minX);

	while(true)

		yb = subs(expr , b);
		ya = subs(expr , a);
		x = (-ya / (yb - ya))*(b - a) + a;
		y = subs(expr , x);
		i = i+1;

		if(y == 0 || abs(subs(expr, x))/m <= epsil)			
			solution = x;
			return;
		end

		px = x;

		if(info)	

			disp('++++++++++++++++++++++++++++++++');
			disp(['iteration' , num2str(i)]);
			disp(['x = ', num2str(x)]);
			disp(['y = ', num2str(y)]);
			disp(['f(a) = ' , num2str(ya)]);
			disp(['f(b) = ' , num2str(yb)])
			disp('++++++++++++++++++++++++++++++++');

			line([a b] , [ya yb]);
			plot(x , 0 , '.' , 'MarkerSize' , 20);
			
		end
		

		if(y * ya > 0)
			a = x;
		else
			b = x;
		end
		
	end

	hold off;
end
