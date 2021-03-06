% ���������� ������ ������ �� ����� �.�.
% ����� � ��� ��������������� ��� ���������� + ����� ������ ���� ����������
% � ���� ������������ ������� � ������� � ���� ������������ ������� ����
% ��������� ������ � ����� � ����������� ����� �������� �� GitHub.com/Dranikf
function x = KobFedGauss(A , b , info)

matrixSize = size(A);
x= zeros(1 ,matrixSize(1));

for k = 1:matrixSize(2) - 1
    for i = k+1:matrixSize(2)
        t = A(i,k) / A(k, k);
        b(i) = b(i) - b(k)*t;
        for j = k+1:matrixSize(2)
            A(i,j) = A(i,j) - A(k,j)*t;
        end
    end
end
% ������ ��� ���������
% ��� �������� ���

% ������ ������������
x(matrixSize(1)) = b(matrixSize(1))/ A(matrixSize(1), matrixSize(2));

for k = matrixSize(2) - 1:-1:1
   
    temp = b(k) - sum(A(k, k + 1:matrixSize(2)) .* x(k + 1:matrixSize(2)));
    x(k) = temp / A(k, k);
    
end
