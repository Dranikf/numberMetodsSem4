%function for building lagrange Interpolation
%by Fedor Kobak github/Dranikf
% y - array of values of function
% point - a point for which interpolation 
% iType - is a type of interpolation {
% 	0 - if its need to use point parameter
% 	1 - if its need to build first interpolation poly (point is ignore)
% 	2 - if its need to build second interpolation poly (point is ignore)
% 	}
function polyn = NewtonIntPoly(y , a , b , iType , point)
	
	if(a > b)
		disp('a must be smaller then b');
		return;
	end

	region = b - a;
	h = region / numel(y); % step

	x = a:h:b;
	step = 1; % this is step in indexes

	if(~iType)
		if(point > b)
			disp('point is not in regon');
			return;
		end

	elseif(iType == 1)
		PIndex = 1;
		step = 1;
	elseif(iType == 2)
		PIndex = 2;
		step = -1;
	else
		disp('uncnown type');
		return;
	end

	step = 1
	PIndex = 0
	while(true)
		
	end	

end
