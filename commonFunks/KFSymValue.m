% function for calculating sym vector value in point
% by Fedor Kobak github.com/Dranikf
function result = KFSymValue(expres , values)
	
	vars = symvar(expres);

	result = subs(expres , vars , values);

end	
