function J = computeCostMulti(X, y, theta)
% J(theta) = (1/2m) * sigma(1 to m){h_theta(x(i))-y(i)}^2

m = length(y); % number of training examples
h = X*theta - y;
J = sum(h .^ 2) / (2*m);

end
