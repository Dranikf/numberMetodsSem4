% ���������� ������ ������ �� ����� �.�.
% ����� � ��� ��������������� ��� ���������� + ����� ������ ���� ����������
% � ���� ������������ ������� � ������� � ���� ������������ ������� ����
% ��������� ������ � ����� � ����������� ����� �������� �� GitHub.com/Dranikf
function x = KobFedGauss(A , b)

matrixSize = size(A);

for k = 1:matrixSize(2) - 1
    for i = k+1:matrixSize(2)
        t = A(i,k) / A(k, k);
        b(i) = b(i) - b(k)*t;
        for j = k+1:matrixSize(2)
            A(i,j) = A(i,j) - A(k,j)*t;
        end
    end
end

b
A