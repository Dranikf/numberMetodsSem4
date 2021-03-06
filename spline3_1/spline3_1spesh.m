% function for builging cubic spline defect one
% whith given values of c(0) ans c(n)
% by Fedor Kobak github.com/Dranikf

% x - grid values
% fun - symbolic expression function for interpolation 
% c_0 - is a c(0) value
% c_n - in a c(n) value
% S - is a result as an array of simbolic expressions 


% used common functions systShow()
% used swipMetod

function S = spline3_1spesh(x , fun , c_0 , c_n , info)

	y = subs(fun , x);
	xCount = numel(x);

	%firsrly need to creste 3 diagonal matrix to find c

	h(2) = x(2) - x(1);

	d3MSize = xCount - 2; % in this system i = 2...n-1, thats why -2
	d3M = zeros(1 , xCount); % 3 diagonal matrix
	bV = [];% vector of free elements

	for i = 2:xCount-1
		
		h(i + 1) = x(i + 1) - x(i);
		
		if(i ~=2)
			d3M = [d3M ; zeros(1 , xCount)]; % line start initialization
		end

		d3M(i - 1 , i -1) = h(i);
		d3M(i - 1 , i) = 2 * (h(i) + h(i + 1));
		d3M(i - 1 , i + 1) = h(i+1);

		bV(i-1) = 6*( ((y(i + 1) - y(i))/ h(i+1)) - ((y(i) - y(i -1))/ h(i)));	
		((y(i + 1) - y(i))/ h(i+1))
		((y(i) - y(i -1))/ h(i))
		if(info)
			disp(['++++++++++iteration number ' , num2str(i - 1) , '++++++++++++++++'])
			disp(['++++++++++ h(', num2str(i - 1) , ') = ' , num2str(h(i))]);
            disp(['++++++++++ h(', num2str(i) , ') = ' , num2str(h(i + 1))]);
			disp(' ');
			disp(['sytem at iteration']);
			systShow(d3M , 'c' , bV, 0 );
			disp(' ');
			disp(['++++++++++iteration number ' , num2str(i - 1) , '++++++++++++++++'])
		end	

	end	

	% now operations whith c(0) and c(n)
	% c(1) = f''(a) c(n) = f''(b)
	c = zeros(1, xCount);
	d2fun = diff(fun , 2);
	infoDisp('diff(fun, 2) = ', info);
	infoDisp(d2fun , info);
	c(1) = c_0;
	x(xCount)
	c(xCount) = c_n;

	bV(1) = bV(1) - c(1)*d3M(1);
	bV(d3MSize) = bV(d3MSize) - c(xCount) * d3M(d3MSize, xCount);

	d3M(: , 1) = [];
	d3M(: , xCount - 1) = [];

	if(info)
		
		disp(['c0 = ', num2str(c(1))]);
		disp(['c' , num2str(xCount - 1) ,' = ' , num2str(c(xCount)) ]);
		disp(['final 3 diagonal system']);
		systShow(d3M ,'c', bV , 1);

	end

	infoDisp('+++++++++++++++++swip Metod info++++++++++++++++++' , info);
	c(2:xCount -1) = swipMetod(d3M , bV, info);
	infoDisp('+++++++++++++++++swip Metod info++++++++++++++++++' , info);


	if(info)
		disp('c vector is');
		c
	end

	xSym = sym('x'); % its a symbolic expression for good representstion
	for( i = 2:xCount)
			c(i)
		S(i-1) = y(i) + ((1/3) * c(i) * h(i) + 1/6 * c(i-1)*h(i) + (y(i) - y(i-1))/h(i)) * (xSym - x(i))  + (c(i)/2) * ((xSym - x(i))^2) + ((c(i) - c(i-1))/ 6*h(i))* ((xSym - x(i))^3);	

		if(info)
			disp(['b(' , num2str(i - 1),')', num2str(((1/3) * c(i) * h(i) + 1/6 * c(i-1)*h(i) + (y(i) - y(i-1))/h(i)))]);
			disp(['d(' , num2str(i - 1) , ')' , num2str((c(i) - c(i-1))/ 6*h(i))]);
		end

	end

end
