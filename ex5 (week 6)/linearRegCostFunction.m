function [J, grad] = linearRegCostFunction(X, y, theta, lambda)

m = length(y);
h = X * theta; % (12 * 2)(2 * 1) = 12 * 1
J = sum((h - y) .^ 2) / (2*m);
regularization = (lambda / (2*m)) * sum(theta(2:end,:) .^2 );
J = J + regularization;

grad = (h-y)' * X; % (1 * 12)(12 * 2) = 1 * 2
grad = grad';
grad = grad / m;
grad(2:end,:) = grad(2:end,:) + (lambda/m) * theta(2:end,:);

end
