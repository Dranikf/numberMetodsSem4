% function for good presentstion system by matrix
% by Fedor Kobak github.com/Dranikf


% a - matrix of a system
% varName - is a string that will be used for variable name 
% b - is a vector of free items
% indexesNumStart - is an start index for system numeration

function systShow(a, varName , b , indexesNumStart)
	
	sysSize = size(a);
	isEven = ~mod(sysSize(1) , 2);
    
	disp(' /')
	for (i = 1:sysSize(1))
		equationLine = ' |';

		if(isEven)
			if(((sysSize(1) / 2) == i))
				equationLine = '/ ';
			end
			if((sysSize(1) / 2) == i - 1)
				equationLine = '\ ';
			end
		else
			if (round(sysSize(1) / 2) == i)
				equationLine = '<';
            end
        end	

         varInd = indexesNumStart;
        
        for(j = 1:sysSize(2))
			varL = [varName , num2str(varInd)];

			if(a(i, j) >= 0)
				digit = '+';
			else
				digit = '-';
			end

			equationLine = [equationLine , digit , num2str(abs(a(i , j))) ,'*' , varL];
            varInd = varInd + 1;
        end
        
		equationLine = [equationLine , ' = ' , num2str(b(i))];
		disp(equationLine);
	end
	disp(' \')
end	
