function sample3d()
% код демонстрации трехмерных графиков

close all;

% минимум квадратичной формы, передается в myfunc2
x0 = [0; 0];

% подготовка сетки
x1 = -10:0.2:+10; 
x2 = -10:0.2:+10;
[X1,X2] = meshgrid(x1,x2); 

% расчет значения функции во всех точках сетки
grid_matrix = [X1(:) X2(:)]; % сетка значений в виде прямоугольной матрицы
J = myfunc2(x0, grid_matrix); % расчет значений функции во всех точках сетки
% преобразование рассчитанных значений функции из вектора в матрицу
J = reshape(J,length(x2),length(x1)); 


% Трехмерный график
figure; 
hold on
mesh(X1, X2, J); xlabel('x_1'); ylabel('x_2'); % 3D график
scatter3(x0(1), x0(2), myfunc(x0,x0), 'o','MarkerFaceColor','r'); % точка
hold off

% График изолиний
figure;
hold on
contour(X1, X2, J); xlabel('x_1'); ylabel('x_2'); % график изолиний
scatter3(x0(1), x0(2), myfunc(x0,x0), 'o','MarkerFaceColor','r'); % точка
hold off


end


function z = myfunc2(x0, x)
% расчет множества значений myfunc 
% для сетки значений прямоугольной матрицы x
z = zeros(size(x, 1), 1);
for i = 1:length(z)
    z(i) = myfunc(x0, x(i, :)');
end

end

function z = myfunc(x0, x)
% квадратичная форма (двумерная "парабола")
z = sum((x - x0).^2);

end
