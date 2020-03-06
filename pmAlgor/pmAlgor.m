% calculates biggest eigenvalue throw PM Algoritm
% by Kobak Fedor github.com/Dranikf

% startVector will be used in first iteration
% showInfo == true -> will show info between iterations
function res = pmAlgor(A , startVector , showInfo, admission)

	x = 0;
	stoper = 0;
	isLambGet = false;
	y = reshape(startVector , numel(startVector) , 1);
	lambNew = 0;
	% will leave this when get enought accuracy
	n = get1Norm(y);
	while(true)


		% x can not be 0 if this is not first iteration
		if(~x == 0)
			% get y(k+1)
			y = (A * x);
			n = get1Norm(y);

			% check admission
			if (abs(get1Norm(x)) > admission)

				lambNew = (y' * (1./x)) / numel(y);
				

				% if we was get lambda before
				if(isLambGet == true)
				end
				
				lambOld = lambNew;
	
			end	
		end

		x = y ./ n;

		if (showInfo == true)
			disp(['*********iteration number ' , num2str(stoper) ,'************']);
			disp(['y = ' , num2str(y')]);
			disp(['x = ' , num2str(x')]);
			disp(['lamb = ' , num2str(lambNew)]);
			disp(['y norm = ', num2str(n)]);
			disp(['*********iteration number ' , num2str(stoper) ,'************']);
		end

		% leave cycle if this is too much iterations
		if (stoper > 10)
			break;
		end
		stoper = stoper + 1;

	end

end
