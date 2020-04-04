% function for getting main minors of matrix
% by Fedor Kobak github.com/Dranikf
% A - matrix for getting mainMinors
% MM - Main Minors - its a result

function MM = getMMinors(A)
	
	s = size(A);
	minorsCount = s(1);

	MM = [];

	if (s(2) <  s(1))
		minorsCount = s(2);
	end

	for i = 1:minorsCount
		 MM = [MM ,det(A(1:i , 1:i))];
	end

end	
