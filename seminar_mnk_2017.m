function seminar_mnk_2017

x = [5 5 7 7 9 9]';
beta_true = [5; 2];

[Y, X] = generate_sample(beta_true, x, 1);

beta_estimation = regress(Y, X);
Y_true = X*beta_true;
Y_estimation = X*beta_estimation;

x_new = 8;
[Y_new, X_new] = generate_sample(beta_true, x_new, 1);


plot(x, Y, 'ro', ...
    x, Y_true, ...
    x, Y_estimation);
xlim([4 10]);


end 

function [Y, X] = generate_sample(beta_true, x, Dnoise)
n = length(x);
k = length(beta_true);

eps = randn(n, 1) * sqrt(Dnoise);
X = zeros(n, k);

for j = 1:k
    X(:, j) = x.^(j-1);
end
Y = X*beta_true + eps;

end