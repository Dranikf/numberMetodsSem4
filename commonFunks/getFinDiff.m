% function build finite differences by x array
% by Fedor Kobak github.com/Dranikf
function del = getFinDiff(x)
	
	del = [];
	for i = 2:numel(x)
		del = [del , x(i) - x(i - 1)];
	end

end
