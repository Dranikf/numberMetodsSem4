function [resX , resY] = hoinMetod(expr , x0 , y0 , b , h, info)

	resY = y0;
	resX = [];

	counter = 1;

	for( Xcount = x0:h:b)

		resX = [resX , Xcount];
		fVal = subs(expr , {'x' 'y'}  , {resX(counter) , resY(counter)});
		fVal2 = subs(expr , {'x' , 'y'} , {resX(counter) + h , resY(counter) + h*fVal});

		resY(counter + 1) = resY(counter) + (h/2)*(fVal + fVal2);

		if(info)
			disp(['iteration number ' , num2str(counter) , '++++++++++++'])
			disp([num2str(resY(counter)) , ' + (' , num2str(h) , '/2) * (', num2str(fVal), '+ f(' , num2str(resX(counter) + h) , ',' , num2str(resY(counter+1)) , ' + ', num2str(h) , '*' , num2str(fVal) , ')) = ']);
			disp([num2str(resY(counter)) , ' + ' , num2str(h/2) , ' * (', num2str(fVal), ' + ' , num2str(fVal2)  , ') = ' , num2str(resY(counter + 1))]);
			disp(['iteration number ' , num2str(counter) , '++++++++++++'])
		end

		counter = counter + 1;

    end
    
    resY(numel(resY)) = [];

end
