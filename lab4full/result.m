f = sym('x-1.2*cos(x/3)');
a = 0; b =2 ; epsil = 0.01;

disp('half division metod result+++++++++++++++');
halfDivisionMetod(f , a , b , epsil , false)
disp('chords metod result+++++++++++++++++');
chordMetod(f , a, b, epsil , false)
disp('simple iterarions metod resutl++++++++++++++++')
simpIterMetod(f , a , b,  epsil , false)
disp('Newton metod resutl++++++++++++++++')
eqSolveNewton(f , a , b,  epsil , false)