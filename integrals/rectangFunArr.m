% build integral of rectengles formula
% by Fedor Kobak github.com/Dranikf

% xVec is pointns array
% yVec is function values at points
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

function res = rectangFunArr(xVec, yVec , fType, info)


	arrSize = numel(xVec);

	res = 0;

	for (i = 2:arrSize)

		h = xVec(i) - xVec(i-1);

		if(fType == 1)
			pY = yVec(i);
		elseif(fType == 2 )
			pY = yVec(i);
		else
			pY = yVec(i-1);
		end

		recSize = h * pY;
		res = res + recSize;

		if(info)
			disp(['+++++++iter ' , num2str(i-1) , '++++++++++']);
			disp(['point in x ' , num2str(xVec(i))]);
			disp(['point in y ' , num2str(pY)]);
			disp(['size of rectangle ' , num2str(recSize)]);
			disp(['sum ' , num2str(res)]);
			disp(['+++++++iter ' , num2str(i-1) , '++++++++++']);
		end	

	end

end
