function [h, white_criteria, white_criteria_dof, white_p] ...
    = white_heteroscedasticity_test(y, X)

n = length(y);
[b_est, ~, e] = regress(y, X);
e2 = e.^2;

% X-матрица для регрессии на остатки (называется Y)
if max(abs(X(:, 1) - 1)) < 1e-5
    Xwithout_const = X(:, 2:end);
else
    Xwithout_const = X;
end
Y = create_white_matrix(Xwithout_const);
Y = [ones(length(y), 1) Y];


[b_white, ~, r, ~, stats_white] = regress(e2, Y);

R2_white = stats_white(1);
white_criteria = R2_white * n;
N_white = length(b_white);
white_criteria_dof = N_white - 1;

alpha = 0.95;
white_criteria_border = chi2inv(alpha, white_criteria_dof);

white_p = 1 - chi2cdf(white_criteria, white_criteria_dof);

h = white_criteria > white_criteria_border;


end

function Y = create_white_matrix(X)
% сделать квадраты и произведения факторов по Уайту

Y = X;
k = size(X, 2) + 1;

for i = 1:size(X, 2)
    for j = i:size(X, 2)
        Y(:, k) = X(:, i) .* X(:, j);
        k = k + 1;
    end
end

end