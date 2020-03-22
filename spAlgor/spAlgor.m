% function for getting biggest eigenvalue of matrix by SP algoritm
% by Fedor Kobak github.com/Dranikf

function result = spAlgor(A , sVector ,  epsl , info)


	stoper = 0;

	y = reshape(sVector , numel(sVector) ,1 );
	plambd = 0;
	x = 0

	while(true)
		S = y' * y;
        stopStr = num2str(stoper);
		% is it first iteration
		if (stoper)

			t = y'*x;
			
            % ans now need check is it enought iterations
            if(stoper > 1)
                plambd = lambd;
                lambd = S / t;
                dif = lambd - plambd;
                if(abs(dif) < epsl)
                    break;
                end
                
            else
                lambd = sqrt(S) / t;
            end
            

			if(info)
				disp(['data for iteration ' , stopStr ]);
				disp(['y(' , stopStr , ')']);y
				disp(['S(' , stopStr , ') = ' , num2str(S) ]);
				disp(['x(' , num2str(stoper - 1) , ') = ']);x
				disp(['t(' , stopStr , ') = ' , num2str(t)]);
				disp(['lamb(', stopStr  , ') = ' , num2str(lambd)]);
            end
            
		else
			if(info)
				disp(['its zero iteration!!']);
				disp(['y(' , stopStr , ')']);y
				disp(['S(' , stopStr , ') = ' , num2str(S) ]);
			end
		end
		
		
		x = y ./ sqrt(S); 
		y = A * x;

		if(stoper > 100)
			break;
		else
			stoper = stoper + 1;
		end
    end

   	if(info)
        disp(['data for iteration ' , stopStr ]);
		disp(['y(' , stopStr , ')']);y
		disp(['S(' , stopStr , ') = ' , num2str(S) ]);
		disp(['x(' , num2str(stoper - 1) , ') = ']);x
		disp(['t(' , stopStr , ') = ' , num2str(t)]);
		disp(['lamb(', stopStr  , ') = ' , num2str(lambd)]);
    end
    
	result = lambd;
end
