function [J, grad] = costFunction(theta, X, y)

    m = length(y); % number of training examples
    J = sum( -y .* log(sigmoid(X*theta)) - (1-y) .* log(1-sigmoid(X*theta)) ) / m;
    grad = sum( (sigmoid(X*theta)-y) .* X)' / m;
    
end
