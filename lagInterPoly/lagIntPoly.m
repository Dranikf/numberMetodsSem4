function  c = lagIntPoly(xVec , y , g)

    % check is interpolation point correct
    if(~isIntDataCorrect(xVec , y))
        disp('data not correct');
        return
    end

    counter = 1;
    syms x;
    
    c = 0;
    
    for i = xVec
        
        tempDen = 1; % temp denominator
        tempNum = 1; % temp numerator
        
        for j = xVec
            if(i ~= j)
                tempDen = tempDen * (i - j);
                tempNum = tempNum*(x - j);
            end
        end
        
        %disp(['denaminator number ', num2str(counter) , ' is ' , num2str(tempDen)]);
        %disp(['numerator number ', num2str(counter) , ' is ' , char(tempNum)]);
        c = c + (tempNum/tempDen)  * y(counter);
        counter = counter + 1;
    end

end

