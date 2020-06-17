%function for computing value by splines

% x - is an values by vich buildet splines
% splines - is array of functions which is splines
% val - is value for computiog

function result = splineSubs(x , val , splines)

	xSize = numel(x);
	result = [];

	for(v= val)

		if (v <= x(1))
			newVal = subs(splines(1) , v);
		elseif(v > x(xSize))
			newVal = subs(splines(xSize - 1), v);	
		else
			for(i = 1:xSize - 1)
				if(v < x(i+1) && v >= x(i))
					newVal = subs(splines(i) , v);
				end
			end
		end

		result = [result , newVal];
	end


end
