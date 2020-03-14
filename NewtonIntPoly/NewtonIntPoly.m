%function for building lagrange Interpolation
%by Fedor Kobak github/Dranikf
% y - array of values of function
% point - a point for which interpolation 
% iType - is a type of interpolation {
% 	0 - if its need to use point parameter
% 	1 - if its need to build first interpolation poly (point is ignore)
% 	2 - if its need to build second interpolation poly (point is ignore)
% 	}
% 	dispT - is need to show temp data
function [polyn , result] = NewtonIntPoly(y , a , b , iType, dispT , point)
	
	if(a > b)
		disp('a must be smaller then b');
		return;
	end

	region = b - a;
	h = region / (numel(y) - 1); % step

	x = a:h:b;
	step = 1; % this is step in indexes

	if(~iType)
		if(point > b)
			disp('point is not in regon');
			return;
		end
		
		[step, PIndex] = getTypeOfNew(x , point)

		if(dispT)
			if(step == 1)
				disp('need to use first interpolation poly');
			else
				disp('need to use second interpolation poly');
			end

			disp(['start x value is '  num2str(x(PIndex))]);

		end
		

	elseif(iType == 1)
		PIndex = 1;
		step = 1;
	elseif(iType == 2)
		PIndex = numel(y);
		step = -1;
	else
		disp('uncnown type');
		return;
	end

	
	q = sym('x');
	q = (q - x(PIndex)) / h;
	if(step == 1)
		endInd = numel(x);
	else
		endInd = 1;
	end	

	indexesVector = PIndex:step:endInd;

	if(step == 1)
		endDiffs = finDiffTable(x(indexesVector) , y(indexesVector));
		diffIndex = 1;
	else
		% in case of indexesVector builded for second formula, we need to inverce it for 
		% building table of differences
		inverceInVec = indexesVector(numel(indexesVector):-1:1);
		endDiffs = finDiffTable(x(inverceInVec) , y(inverceInVec));
		diffIndex = numel(indexesVector) - 1;
	end

	tableSize = size(endDiffs);
	endDiffs = endDiffs(: , 3:tableSize(2)); %  cut a bit diffsTable
	polyn = sym(y(indexesVector(1)));
	qProd = q;

	if (dispT)

		disp('q is ' )
		q

		disp('end diffs table is' );

		endDiffs

	end

	for i = 2:numel(indexesVector)	

		if (dispT)
			disp(['poly part number ' , num2str(i) ,' is ' ]);
			diffIndex
			(qProd * endDiffs(diffIndex, i-1)) / factorial(i -1)
		end

		polyn = polyn + (qProd*endDiffs(diffIndex, i-1)) / factorial(i - 1);
		qProd = qProd*(q - (i-1)*step); % q(q - 1)(q - 2)... or q(q + 1)(q + 2)...

		if diffIndex ~= 1 
			diffIndex = diffIndex - 1;
		end
	end	

	if (~iType)
		result = subs(polyn , point);
	end

end
