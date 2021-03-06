% ����� �������������� ������������� ��� ���������� ������������ �� ��������� f(x) = y �� ����� �.�.
% �� ������ ��������: 
%   1) p - ������� n �� ������� ���� sum(�(1:n)*x^(1:n)) (x - ��������� ����������)
%   2) ��������������� ������������ �������� � ���� ����� � ��������� ����.
% ��� ����������� ���������� ��������� g = 1, ����� �������� �������������
% ������ (�� ���� ������� ����� ��������� ������� ������������ ����������)
% ��� ���������������� ���������� ������� KobFedGauss, KobFedVand � KobFedGetPoliResult �������
% ����� ����� �� GitHub.com/Dranikf
% ��������� ������ � ����� � ����������� ����� �������� �� GitHub.com/Dranikf

function [c , p] = uncertCoffMetInterpolat(x , y , g)

    % check is interpolation point correct
    if(~isIntDataCorrect(x , y))
        disp('data not correct');
        return
    end

    Vand = KobFedVand(x); % ������� ������� �����������
    c= KobFedGauss(Vand, y); % �������� ������������ �����������, �������� ����������� ����� ������
    %(���� �������� ����� ���� � ��������� �������)

    
    if (g == 1)
        
         resultY = KobFedGetPoliResult(c , x);
        
         subplot(1 , 2 ,1);
         plot(x, y);
         title('input data');
        
         subplot(1 , 2 ,2);
         plot(x , resultY);
         title('interpolation data');
        
    end
    
    p = getSymsPoly(c);
    
end
