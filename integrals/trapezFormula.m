% function for buildig integral by trapezoidal formula
%
% expr is a symbolic expression for buildeng integral
% xVec is an points array 
% info is it needed to show extra info
function res = trapezFormula(expr , xVec, info)
	
	arrSize = numel(xVec);

	summa = (subs(expr, xVec(1)) + subs(expr , xVec(arrSize))) / 2;
	
	if(info)
		disp('extreme points data++++++++++++++++++++++');
		disp(['f(x(0)) / 2  = ', num2str(subs(expr, xVec(1)) / 2 )]);
		disp(['f(x(' , num2str(arrSize) , ')) / 2 = ' , num2str(subs(expr , xVec(arrSize)) / 2 )]);
		disp(['summa value is ' , num2str(summa)]);
		disp('extreme points data++++++++++++++++++++++');
	end

	for(i = 2:arrSize-1)
		summa = summa + subs(expr , xVec(i));	

		if(info)
			disp(['point ' , num2str(i-1) , ' data++++++++++++++']);
			disp(['f(x(' , num2str(i-1) , ')) = ' , num2str(subs(expr , xVec(i)))]);	
			disp(['summa value is ' , num2str(summa)]);
			disp(['point ' , num2str(i-1) , ' data++++++++++++++']);
		end
	end

	res = summa* ((xVec(arrSize) - xVec(1)) / (arrSize - 1));

end
