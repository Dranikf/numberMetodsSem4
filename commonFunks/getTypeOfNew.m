% function for checking what pype of Newton Poly is needed
% by Fedor Kobak github.com/Dranikf
%

function [step, startIndex] = getTypeOfNew(x , point)
	b= max(x);
	region = max(x) - min(x);
	h = region / numel(x);
	indexCounter = 1;
	for i = x 
		if( i >= point)	
			
			if(region / 2 <= b - i)
				% need to build firs interpolation poly
				step = 1;
			else
				% need to build second interpolation poly
				step = -1;
			end

			if(i - point <= h / 2)
				startIndex = indexCounter;
			else
				startIndex = indexCounter - 1;
					
			break;
            end
        end
        indexCounter = indexCounter + 1;
    end
end
