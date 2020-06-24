function expr = ElagrangePoly(x , y)
	
	sx = sym('x'); 
	expr = sym('0');


	for(k = 1:numel(x))
		
		nominator = sym('1');
		denominator = sym('1');

		for(j = 1:numel(x))
			
			if(k == j)
				continue;
			end

			nominator = nominator * (sx - x(j));	
			denominator = denominator *(x(k) - x(j)); 

		end

		expr = expr + (nominator/denominator)*y(k);

	end

end
