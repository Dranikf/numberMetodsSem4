function [x , y] = createRandomArr(a , b , maxStep ,expr , sigma)
    
    x = [];
    y = [];
    
    while(a < b)
        
        a = a + unifrnd(0 , maxStep);
        x = [x , a];
        y = [y , normrnd(subs(expr , a) , sigma)];
        
    end

end