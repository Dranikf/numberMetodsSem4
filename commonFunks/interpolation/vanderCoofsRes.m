function y = vanderCoofsRes(c , x)
    n = numel(c);
    
    y = zeros(size(x));
    for i = 1:n
        
        y = y + c(i)*(x.^(i-1));
        
    end
    
end
