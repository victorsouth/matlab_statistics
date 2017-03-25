function seminar_mnk_2017

x = [5 5 7 7 9 9]';
beta_true = [5; 2];

[Y, X] = generate_sample(beta_true, x, 10);

beta_estimation = regress(Y, X);
Y_true = X*beta_true;
Y_estimation = X*beta_estimation;

plot(x, Y, 'ro', x, Y_true, ...
    x, Y_estimation);



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