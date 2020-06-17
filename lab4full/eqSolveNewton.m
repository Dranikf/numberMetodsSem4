function res = eqSolveNewton(expr , a , b , epsil , info)

	dexpr = diff(expr);
	d2expr = diff(expr);
	
	varname = symvar(expr);

	fi = varname - (expr / dexpr);

	if(subs(d2expr , a)*subs(expr , a) > 0)
		px = a;
	else
		px = b;
	end

	m = subs(dexpr , fminbnd(matlabFunction(dexpr) , a , b));
	i = 0;

	while(true)
		
		x = subs(fi , px);
		y = subs(expr , x);

		if(abs(y/m) <= epsil)	
			res = x;
			return;
		end

		px = x;

		if(info)
			disp(['+++++++++++++++++' , num2str(i)]);
			disp(num2str(x));
			disp(['+++++++++++++++++' , num2str(i)]);
		end

		i = i + 1;
	end
	
end
