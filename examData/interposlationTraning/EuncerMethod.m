function expression = EuncerMethod(Ax , Ay)
	
	Ay = reshape(Ay ,numel(Ay) , 1);

	vMatrix = fliplr(vander(Ax));
	coofs = inv(vMatrix) * Ay;

	expression = sym('0');
	syms x;
	for(i = 1:numel(coofs))

		expression = expression + (x^(i-1))*coofs(i); 

	end

end
