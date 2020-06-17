function [resX , resY] = eilerMetodSpesh(expr ,x0 , y0 , b , h, info)

	resY = y0;
	resX = [];

	syms y;
	vars = symvar(expr);

	counter = 1;

	for( Xcount = x0:h:b)

		resX = [resX , Xcount];
		
		f_xi_yi = subs(expr , {vars} , {resX(counter) + h , y});
		resY(counter + 1) = solve(resY(counter) + h*f_xi_yi - y);

		if(info)
			disp(['iteration number ' , num2str(counter) , '++++++++++++'])
			disp('equation is')
			disp(['y = ' , num2str(resY(counter)) , ' + ' , num2str(h) , '*(' , char(f_xi_yi) , ')']);
			disp(['y = ' , num2str(resY(counter + 1))]);
			disp(['iteration number ' , num2str(counter) , '++++++++++++'])
		end

		counter = counter + 1;

	end

	resY(numel(resY)) = [];

end
