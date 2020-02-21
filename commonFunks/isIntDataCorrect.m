% функция проверяет корректность полученных узлов для построения интерполяции
% x - массив значений независимой переменной
% y - массив значений значенйи функции
% последняя версия и связь с разработчиком на github.com/Dranikf

function val = isIntDataCorrect( x , y )

    if (numel(x) == numel(y))
        val = true;
    else
        val = false;
    end

end

