% function for buildig integral by trapezoidal formula
%
% xVec is an points array 
% yVec is an values at point
% info is it needed to show extra info
function res = trapezFormulaArr(xVec, yVec, info)
	
	arrSize = numel(xVec);

	summa = (yVec(1) + yVec(arrSize)) / 2;
	
	if(info)
		disp('extreme points data++++++++++++++++++++++');
		disp(['f(x(0)) / 2  = ', num2str(yVec(1)/2) ]);
		disp(['f(x(' , num2str(arrSize) , ')) / 2 = ' , num2str(yVec(arrSize) / 2 )]);
		disp(['summa value is ' , num2str(summa)]);
		disp('extreme points data++++++++++++++++++++++');
	end

	for(i = 2:arrSize-1)
		summa = summa + yVec(i);	

		if(info)
			disp(['point ' , num2str(i-1) , ' data++++++++++++++']);
			disp(['f(x(' , num2str(i-1) , ')) = ' , num2str(yVec(i))]);	
			disp(['summa value is ' , num2str(summa)]);
			disp(['point ' , num2str(i-1) , ' data++++++++++++++']);
		end
	end

	res = summa* ((xVec(arrSize) - xVec(1)) / (arrSize - 1));

end
