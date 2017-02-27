function sample3d()
% ��� ������������ ���������� ��������

close all;

% ������� ������������ �����, ���������� � myfunc2
x0 = [0; 0];

% ���������� �����
x1 = -10:0.2:+10; 
x2 = -10:0.2:+10;
[X1,X2] = meshgrid(x1,x2); 

% ������ �������� ������� �� ���� ������ �����
grid_matrix = [X1(:) X2(:)]; % ����� �������� � ���� ������������� �������
J = myfunc2(x0, grid_matrix); % ������ �������� ������� �� ���� ������ �����
% �������������� ������������ �������� ������� �� ������� � �������
J = reshape(J,length(x2),length(x1)); 


% ���������� ������
figure; 
hold on
mesh(X1, X2, J); xlabel('x_1'); ylabel('x_2'); % 3D ������
scatter3(x0(1), x0(2), myfunc(x0,x0), 'o','MarkerFaceColor','r'); % �����
hold off

% ������ ��������
figure;
hold on
contour(X1, X2, J); xlabel('x_1'); ylabel('x_2'); % ������ ��������
scatter3(x0(1), x0(2), myfunc(x0,x0), 'o','MarkerFaceColor','r'); % �����
hold off


end


function z = myfunc2(x0, x)
% ������ ��������� �������� myfunc 
% ��� ����� �������� ������������� ������� x
z = zeros(size(x, 1), 1);
for i = 1:length(z)
    z(i) = myfunc(x0, x(i, :)');
end

end

function z = myfunc(x0, x)
% ������������ ����� (��������� "��������")
z = sum((x - x0).^2);

end
