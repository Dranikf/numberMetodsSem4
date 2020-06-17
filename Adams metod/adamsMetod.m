function [rx , ry] = adamsMetod(expr , x0 , y0 , b , x1 , y1, h, info)

	rx = x0 ;
	ry = [y0 , y1];

	counter = 2;

	fVal = subs(expr , {'x' 'y'} , {rx(counter-1) ry(counter-1)});

	for (x = x1:h:b)

		rx = [rx , x];

		fValP = fVal;
		fVal = subs(expr , {'x' 'y'} , {rx(counter) , ry(counter)});
		
		ry(counter + 1) = ry(counter) + (h/2)*(3*fVal - fValP);

		if(info)
			disp(['iteration ' , num2str(counter), '++++++++++++++'])
			disp([num2str(ry(counter)) , ' + (' , num2str(h) , '/2)*(' , num2str(3*fVal) , ' - ' , num2str(fValP),') = ' , num2str(ry(counter + 1))]);	
			disp(['iteration ' , num2str(counter), '++++++++++++++'])
		end
		counter = counter + 1;
		
	end

	ry(numel(ry)) = [];

end
