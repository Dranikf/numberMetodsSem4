% демка про то сравнение точности при построении интерполяции
% с использованием сетки чебышева и без
% fun - та функция по к которой строим интераоляции
% x - узлы интерполяции default, на них построим первую интерполяцию а для воторой на их основе сделаем чебышева
% step - тот шаг с которым будем проверятьинтерполяцию

function KFchebDemo(fun , x , step)
	
	y = subs(fun , x);
	polyn = lagIntPoly(x, y, 0);
	
	xvalues = min(x): step: max(x);

	subplot(1 , 2, 1);
	defFunValues = subs(fun, xvalues); % значения функции данной по умолчанию
	inter1Values = subs(polyn, xvalues); % значения приближения построенного без сетки чебышева
	plot(xvalues , defFunValues, xvalues , inter1Values);
	title('default plot');

	KFChebGrid(min(x) , max(x) , 0.1)

	% теперь все тоже самое только используя сетку чебышева
end	
