%function for creationg poly from c coofs from interpolation
%by vandermord matrix

function s = getSymsPoly( c )
    syms x;
    s = c(1);
    for i = 2:numel(c)
        
        s = s + c(i)*(x^i);
        
    end

end

