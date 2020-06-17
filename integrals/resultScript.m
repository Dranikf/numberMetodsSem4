f = sym('(3.8 - x^2) / (x^3 +1.5)')


analSol = double(int(f , 0 ,1));
disp(['analitic solution ' , num2str(analSol)]);

x = 0:(1/12):1;

right = rectangFun(f , x , 2 , false);
disp(['right rectangles formula result ' , num2str(right) , '. error ' , num2str(abs(right - analSol))]);
left = rectangFun(f , x , 3 , false);
disp(['left rectangles formula result ' , num2str(left),'. error ' , num2str(abs(left - analSol))]);
cent = rectangFun(f , x , 1 , false);
disp(['central rectangles formula result ' , num2str(cent) ,  '. error ' , num2str(abs(cent - analSol))]);

y = subs(f , x);

trap = trapezFormulaArr(x , y , false);
disp(['trapezoidal formula result ' , num2str(trap) , '. error ' , num2str(abs(trap - analSol))]);
simpson = simpsonFormula(x , y , false);
disp(['simpson formula result ' , num2str(simpson) , '. error ' , num2str(abs(simpson - analSol))]);

plot(x , y)
