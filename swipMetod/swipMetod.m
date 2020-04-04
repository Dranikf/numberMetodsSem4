% swip metod for 3 diagonal system
% by Fedor Kobak github.com/Dranikf
%
%a - matrix of system 
%b - vecor of free elements

function resVec = swipMetod(a , r , info)

	b(1) = 0;
	c(1) = a(1 , 1);	
	d(1) = a(1 , 2);
	delta(1) = -(a(1 , 2) / (a(1, 1)));
	lambda(1) = r(1)/a(1,1);

	if(info)
		disp(['delta(1) = ' , num2str(delta(1))]);
		disp(['lambda(1) = ' , num2str(lambda(1))]);
	end

	len = numel(r);
	
	infoDisp('!!!!!!!!!!!!!!straight run!!!!!!!!!!!!!!!!!', info);
	for (i = 2:len - 1)
		
		b(i) = a(i , i -1);
		c(i) = a(i , i);	
		d(i) = a(i , i+1);
		
		delta(i) = -(d(i) / (c(i) + b(i)*delta(i-1)));
		lambda(i) = (r(i) - b(i) * lambda(i-1)) / (c(i) + b(i)*delta(i-1));

		if(info)
			disp(['===== iteration ' , num2str(i)  , '======'])
			disp(['b = ' , num2str(b(i))]);
			disp(['c = ' , num2str(c(i))]);
			disp(['d = ' , num2str(d(i))]);
			disp(['lambda(i) = ' , num2str(lambda(i))]);
			disp(['delta(i) = ' , num2str(delta(i))]);
			disp(['===== iteration ' , num2str(i)  , '======'])
		end		


	end
	
	b(len) = a(len , len - 1);
	c(len) = a(len , len);

	infoDisp('!!!!!!!!!!!!!!straight run!!!!!!!!!!!!!!!!!', info);
	
	x(len) = (r(len) - b(len)* lambda(len-1)) / (c(len) + b(len)*delta(len -1)); 
		
	infoDisp(['x(' , num2str(len) , ') = ' , num2str(x(len)) ], info);

	infoDisp('!!!!!!!!!!!!!!return run!!!!!!!!!!!!!!!!!' , info);

	for(i = len-1:-1:1)
		
		x(i) = x(i+1)* delta(i) + lambda(i);
		infoDisp(['x(' , num2str(i) , ') = ' , num2str(x(i)) ], info);

	end	

	infoDisp('!!!!!!!!!!!!!!return run!!!!!!!!!!!!!!!!!' , info);

	resVec = x;
end
