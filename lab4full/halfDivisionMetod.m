function res = halfDivisionMetod(expr , a , b , epsil, info)

	px = a;
	i = 0;

	while (true)

		len = (b - a) / 2;
		x = a + len; 
		y = subs(expr , x);

		if(abs(px - x) < epsil || subs(expr , x) == 0)
			res = x;
			return;
		end

		if(info)
			disp(['++++++++++++++++++' , num2str(i)]);	
			disp([num2str(x)]);
			disp(['++++++++++++++++++' , num2str(i)]);	
		end

		i = i + 1;
		px = x;

		ya = subs(expr , a);
		yb = subs(expr , b);

		if(ya*y > 0)
			a = x;
		else
			b = x;
		end	


	end

end
