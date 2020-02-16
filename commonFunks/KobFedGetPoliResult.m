% ����� y �� �������� ������� � � ������������� �������� � ��
% y(i) = (x(i)^0)* c(1) + (x(i)^1)* c(2)+ ... + (x(i)^(n-1))* c(n), n-1
% ������� ��������
% ��������� ������ � ����� � ����������� ����� �������� �� GitHub.com/Dranikf
function y = KobFedGetPoliResult(c , x)
    n = numel(c);
    
    y = zeros(size(x));
    for i = 1:n
        
        y = y + c(i)*(x.^(i-1));
        
    end
    
end