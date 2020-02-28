% реализаци�? �?хемы �?йтена Кобак Ф.�?.
% xVec , y - таблица значений
% a - отределенное значение xVec �? помощью которого будет отчтывать�?�? точно�?ть
% res - значение y �?оответ�?твуещее а по�?ле по�?троени�? интерпол�?ции
% polyn - полученное приближение в �?имвольном виде 

function [ polyn , res] = eitkenScheme(xVec , y , a)

	% промежуточные полиномы ра�?пихаем в двумерный ма�?�?ив
	% P i,i+1,i+2, ... , n-1 , n - в ма�?�?иве от будет иметь индек�? (i, n) - (первый и по�?ледний индек�?ы)
	

	syms x;

	% тут цикл перебирает �?таршие индек�?ы
	% покинем его когда до�?тигнем нужной
	% точно�?ти или закончать�?�? значени�?
    for iter1 = 1:numel(xVec) 
		% тут переберем младшие индек�?ы
		for iter2 = iter1:-1:1
			% �?то дл�? тех �?лементов �? одним индек�?ом, в моей интепретации получает�?�?, что у них �?тарший 
			% и младший индек�?ы �?овпадают
            
			if iter2 == iter1 
				P(iter2, iter1) = sym(y(iter1));
            else
                P(iter2 , iter1) = (((x - xVec(iter2))*P(iter2+1, iter1)) - ((x - xVec(iter1))*P(iter2 , iter1 - 1)))/(xVec(iter1) - xVec(iter2));
                
            end
		end
    end
    
    polyn =  P(1 , numel(xVec));
end
