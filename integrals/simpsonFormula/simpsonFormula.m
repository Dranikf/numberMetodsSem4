% function for computiong integral value by simpson formula
% by Fedor Kobak github.com/Dranikf

% x - x values
% y - y function values
% info - is need to show temp info
% res - integral result 

function res = simpsonFormula(x , y, info)

	arrSize = numel(x);

	res = y(1) + y(arrSize);

	if(info)
		disp(['y(0) is ' , num2str(y(1))]);
		disp(['y(n) is ' , num2str(y(arrSize))]);
		disp(['y(0) + y(n) is ', num2str(res)]);
	end

	for(i = 2:arrSize - 1)

		if(~mod(i, 2))
			fact = 4; %in case 2,4,6,... 
		else
			fact = 2; % in case 3, 5 ,...
		end

		additElement = fact * y(i);
		res = res + additElement;

		if(info)
			disp([num2str(fact),'*y(', num2str(i-1) , ') = ', num2str(additElement)]);
			disp(['res at step No' , num2str(i-1) , ' is ', num2str(res)]);
		end


	end
	
	res = res * (x(arrSize) - x(1))/(3*(arrSize-1)); 

end
