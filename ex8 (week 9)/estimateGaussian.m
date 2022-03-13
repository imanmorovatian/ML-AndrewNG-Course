function [mu sigma2] = estimateGaussian(X)

[m, n] = size(X);

mu = (sum(X) / m)';
sigma2 = (sum((X - mu') .^ 2) / m)';

end
