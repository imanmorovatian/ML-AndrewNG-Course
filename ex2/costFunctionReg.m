function [J, grad] = costFunctionReg(theta, X, y, lambda)

    m = length(y); % number of training examples
    J = sum( -y .* log(sigmoid(X*theta)) - (1-y) .* log(1-sigmoid(X*theta)) ) / m + (lambda/(2*m)) * (sum(theta(2:end) .^ 2));
    grad = sum( (sigmoid(X*theta)-y) .* X)' / m;
    grad(2:end) = grad(2:end) + (lambda/m) * theta(2:end);
    
end
