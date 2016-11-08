function Y = create_white_matrix(X)
% сделать квадраты и произведени€ факторов по ”айту

Y = X;
k = size(X, 2) + 1;

for i = 1:size(X, 2)
    for j = i:size(X, 2)
        Y(:, k) = X(:, i) .* X(:, j);
        k = k + 1;
    end
end

end