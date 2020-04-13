% build integral of rectengles formula
% by Fedor Kobak github.com/Dranikf

% expr is a symbolic expression for building integral
% xVec is an value array
% fType =
%{
%1 - if its central rectangles
%2 - its right rectangles
%3 - its left rectangles
%}
%
%info - 
%{
%true - if its need to show info
%}

function res = rectangFun(expr , xVec , fType, info)


	arrSize = numel(xVec);

	res = 0;

	for (i = 2:arrSize)

		h = xVec(i) - xVec(i-1);

		if(fType == 1)
			Xi = (xVec(i) + xVec(i-1)) / 2;
		elseif(fType == 2 )
			Xi = xVec(i);
		else
			Xi = xVec(i-1);
		end

		pY = subs(expr , Xi);
		recSize = h * pY;
		res = res + recSize;

		if(info)
			disp(['+++++++iter ' , num2str(i-1) , '++++++++++']);
			disp(['point in x ' , num2str(Xi)]);
			disp(['point in y ' , num2str(pY)]);
			disp(['size of rectangle ' , num2str(recSize)]);
			disp(['sum ' , num2str(res)]);
			disp(['+++++++iter ' , num2str(i-1) , '++++++++++']);
		end	

	end

end
