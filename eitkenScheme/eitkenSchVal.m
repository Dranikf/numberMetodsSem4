% function calculate value of interpolation poly Lagrange, builded by points xVec, y, in point
% by Kobak Fedor github/Dranikf
% xVec , y - data vectors
% a - level of showing temp calculation process in command window, 0 no info ,  1 default info,  2 extra info
% res - result of calculation 

function  res = eitkenSchVal(xVec , y , point , a )


    for iter1 = 1:numel(xVec) 
		for iter2 = iter1:-1:1
            
			if iter2 == iter1 
				P(iter2, iter1) = y(iter1);
            else
                P(iter2 , iter1) = (((point - xVec(iter2))*P(iter2+1, iter1)) - ((point - xVec(iter1))*P(iter2 , iter1 - 1)))/(xVec(iter1) - xVec(iter2));
				if(a > 1)
					disp(['determinant 1 product  is ' , num2str((point - xVec(iter2))) , ' * ' , num2str(P(iter2+1, iter1)) , ' = ' , num2str(((point - xVec(iter2))*P(iter2+1, iter1)))]);
					disp(['determinant 2 prodict  is ', num2str((point - xVec(iter1))), ' * ' , num2str(P(iter2 , iter1 - 1)), ' = ' , num2str(((point - xVec(iter1))*P(iter2 , iter1 - 1)))]);
					disp(['determinant is ', num2str((((point - xVec(iter2))*P(iter2+1, iter1)) - ((point - xVec(iter1))*P(iter2 , iter1 - 1))))]);
					disp(['denominator is ' , num2str((xVec(iter1) - xVec(iter2)))]);
				end
            end
			
			if(a > 0)
				disp(['P(' , num2str(iter2 -1) , ',' , num2str(iter1 -1) , ') value is', num2str(P(iter2, iter1))]);
				
			end
		end
    end
    
    res =  P(1 , numel(xVec));
end
