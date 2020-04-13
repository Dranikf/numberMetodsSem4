% function retuen characteristic equation for matrix
% by Fedor Kobak github.com/Dranikf
%
% A - matrix for get equation

function equation = getCharEq(A)

	syms l;

	equation = A - l*eye(size(A));
	equation = simple(det(equation));

end	
