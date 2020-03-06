% function return norm of A as max sum of strings elements
% powered by Kobak F. , github.com/Dranikf

function res =  get1Norm(A)

	ASize = size(A);	
	sumVec = 0;
	for i = 1:ASize(1)
		sumVec = [sumVec ,  sum(A(i ,:))];
	end

	res = max(sumVec);
end
