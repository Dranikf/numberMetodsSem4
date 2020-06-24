% построение чебышевской сетки по узлам от a до b с шагом step
% Кобак Ф.А.

function y = KFChebGrid(a , b, step)

	if(numel(a) ~= 1)
			disp('a format incorrect');
	end
	
	if(numel(b) ~= 1)
			disp('b format incorrect');
	end

	if(numel(step) ~= 1)
			disp('step format incorrent');
	end
	
	y = [];

	for k = a:step:b
		
		y = [y , (b+a)/2 + ((b - a)/2 * cos(((2*k +1)/ (2* (k + 1))) * k ))];

	end

end
