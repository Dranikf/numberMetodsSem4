% function for creation symbolic system by matrix ans vector of empty elements
% by Fedor Kobak github.com/Dranikf
% A - matrix, b - vector of empty elements

function result = linSysByMat(A , b)

	s = size(A);
	strX = 'x'; % its for creating symbolic vector of x
    %init by zeros
	for i = 1:s(1)
        result(i) = sym(-b(i));
    end

	for j = 1:s(2)
		temp = sym([strX , num2str(j)]);
		for i = 1:s(1)
           	
           result(i) = result(i) + temp * A(i , j);
        end
	end

end
