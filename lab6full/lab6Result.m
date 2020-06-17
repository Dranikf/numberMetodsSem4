
x = [0.184 0.519 0.854 1.188 1.523 1.858 2.192 2.527 2.862];
y = [-1.687 -3.056 -4.493 -6.928 -10.524 -15.4 -22.049 -32.380 -44.538];


plot(x, y , '.r' , 'MarkerSize' , 20);

expr = leastSquareMetod(x , y , 2 , true);
px = 0:0.1:3;
hold on;
plot(px , subs(expr , px));

 try_ = sym('(y - (a*x*log(x) + b*exp(x) + c))^2');
 try2 = sym(0);
 
 for(i= 1: numel(x))
     
     try2 = try2 + subs(try_ ,{'x' 'y'} , {x(i) y(i)});
     
 end
 
 disp('test++++++++++++++')
 da = diff(try2 , 'a')
 db = diff(try2 , 'b')
 dc = diff(try2 , 'c')
 disp('test++++++++++++++')
 
solve(da , db ,dc)
 

ty = (a.*px.*log(px) + b.*exp(px) + c);
plot(px , ty);

ny = subs(expr , x);
disp('residual for square function');
delta = sum((ny - y).^2)