function res = simpIterMetod(expr , a , b , epsil , info)

	mdexpr = -diff(expr);
	maxX = fminbnd(matlabFunction(mdexpr) , a , b);

	M = subs(expr , maxX);

	fi = sym('x') - (1/M)*expr;
    
    dfi = diff(fi);
    antiABSdfi = -abs(dfi);
    maxX = fminbnd(matlabFunction(antiABSdfi) , a , b);
	q = subs(abs(dfi) , maxX);
	
	px = a;
	i = 0 ;
	while(true)
		x = subs(fi , px);

		if((q/(1-q))*abs(x - px) < epsil)
			res = x;
			return;
		end

		px = x;

		if (info)
			disp(['+++++++++++++++++' , num2str(i)]);
			disp(num2str(x));
			disp(['+++++++++++++++++' , num2str(i)]);
		end

		i = i + 1;
	end

end
