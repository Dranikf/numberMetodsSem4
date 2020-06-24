%function for generation random data for testing interpolation
% by Fedor Kobak github.com/Dranikf

%input +++++++++++++++++++++++
%n - number of point in the Grid
%inter - interval of x values
%valInter - inrval of rand y values, uniform distribution
%gridParam:
%	'default' - use equidistant nodes (used by default)
%	'chebGrid' - use Chebishev grid

function [x , y] = genInterData(n, inter, valInter ,gridParam)

	x = []; y = [];

	a = inter(1); b = inter(2);

	if(a >= b)
		return;
	end

	step = (b-a)/(n-1);
	if(strcmp(gridParam, 'chebGrid'))
		x = KFChebGrid(a , b ,step);	
	elseif(strcmp(gridParam , 'default'))
		x = a:step:b;
	end
	
	y = unifrnd(valInter(1) , valInter(2), 1 , n);

end	
