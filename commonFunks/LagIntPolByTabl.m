% fubction build lagrange interpolation poly, by spesial table
% by Kobak Fedor github.com/Dranikf
function [table, result] = LagIntPolByTabl(xVec, y) 
	result = 0;
	sym_x = sym('x');
	P = sym(1);

	for i = 1:numel(xVec)
		for j = 1:numel(xVec)

			if(i == j)
				table(i , j) = sym_x - xVec(i); 
				P = P * table(i , j);
			else
				table(i , j) = sym(xVec(i) - xVec(j), 'd');
			end
		end

		table(i , numel(xVec) + 1) = table(i , 1);
		table(i , numel(xVec) + 2) = sym(y(i) , 'd');
		for j = 2:numel(xVec)
			table(i , numel(xVec) + 1) = table(i, numel(xVec) + 1) * table(i , j); 
		end
	
	end
	s = sum(table(: , numel(xVec) + 2) ./ table(: , numel(xVec) + 1));
	result = simplify(P*s); 
	
	
end
