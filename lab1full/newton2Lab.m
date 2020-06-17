
function result = newton2Lab(x , y , point)

	n = 10;	

	for(i = numel(x):-1:2)
		
		if(point < x(i) & point > x(i-1))
			n = i;
			break;
		end

    end
    
    
    symX = sym('1');
    symbX = sym('x');
    
    result = sym('0');
    for(i = n:-1:1)
        numenator = y(i) - subs(result, x(i));
        
        denominator = 1;
        for(j = n:-1:i+1)
            denominator = denominator * (x(i) - x(j));
        end
        
        (numenator / denominator)
        result = result + (numenator / denominator) *symX;
        
         symX = symX * (symbX - x(i));
    end
   

end
