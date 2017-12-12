function X = generate_plan(x, k)
n = length(x);
X = zeros(n, k);

for i = 1:k
    X(:, i) = x.^(i-1);
end


end