% function for creating table of Finite differences
% as a matrix, from vectors arrays x , y
% by Fedor Kobak github.com/Dranikf

function A = finDiffTable(x , y)
	% creating a column from x
	x = reshape(x , [numel(x) , 1]);
	%creating a column from y 
	y = reshape(y , [numel(x) , 1]);

	A(: , 1) = x;
	A(: , 2) = y;

	delta  = y;

	for i = 1:(numel(y) - 1)

		delta = getFinDiff(delta);	
		A(:, i + 2) = ([delta , zeros(1 , i)])';

	end

end
