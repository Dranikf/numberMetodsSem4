function [resX , resY] = eilerMetod(expr , x0 , y0 , b , h , info)

	resY = y0;
	resX = [];

	counter = 1;

	for( Xcount = x0:h:b)

		resX = [resX , Xcount];
		fVal = subs(expr , {'x' 'y'}  , {resX(counter) , resY(counter)});

		resY(counter + 1) = resY(counter) + fVal*h;

		if(info)
			disp(['iteration number ' , num2str(counter) , '++++++++++++'])
			disp([num2str(resY(counter)) , ' + ' , num2str(h) , '*' , num2str(fVal) , ' = ' , num2str(resY(counter + 1))]);
			disp(['iteration number ' , num2str(counter) , '++++++++++++'])

		end
		counter = counter + 1;

	end

	resY(numel(resY)) = [];

end
