function [U, S] = pca(X)

[m, n] = size(X);

U = zeros(n);
S = zeros(n);

cov = (X' * X) / m;
[U, S, V] = svd(cov);

end
