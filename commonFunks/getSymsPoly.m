% функция для постраения полинома в текстовом виде из вектора в котором переданы его коофиценты
% с - коэффициенты полинома

function s = getSymsPoly( c )
    syms x;
    disp('hello mean');
    s = c(1);
    for i = 2:numel(c)
        
        s = s + c(i)*(x^i);
        
    end
    s
end

