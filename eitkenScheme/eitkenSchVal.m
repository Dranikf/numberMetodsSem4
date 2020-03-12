% function calculate value of interpolation poly Lagrange, builded by points xVec, y, in point
% by Kobak Fedor github/Dranikf
% xVec , y - data vectors
% a - if true then show temp calculation process in command window
% res - result of calculation 

function  res = eitkenScheme(xVec , y , point , a)


    for iter1 = 1:numel(xVec) 
		for iter2 = iter1:-1:1
            
			if iter2 == iter1 
				P(iter2, iter1) = y(iter1);
            else
                P(iter2 , iter1) = (((point - xVec(iter2))*P(iter2+1, iter1)) - ((point - xVec(iter1))*P(iter2 , iter1 - 1)))/(xVec(iter1) - xVec(iter2));
            end
			
			if(a == true)
				disp(['P(' , num2str(iter1) , ',' , num2str(iter2) , ') value is']);
				P	
			end
		end
    end
    
    res =  P(1 , numel(xVec));
end
