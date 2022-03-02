function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
% theta(j) = theta(j) - (alpha/m) * sigma(1 to m){ (h_theta(i)-y(i)) * x_j(i) }

m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    theta = theta - ( alpha * sum( (X*theta - y) .* X )' / m ); 
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
