function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)

X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta

J = sum(sum( ((X * Theta' - Y) .* R) .^ 2)) / 2;
regularization = (lambda / 2) * ( sum(sum(Theta .^ 2)) + sum(sum(X .^ 2)) );
J = J + regularization;

X_grad = ((X * Theta' - Y) .* R) * Theta + lambda * X;
Theta_grad = ((X * Theta' - Y) .* R)' * X + lambda * Theta;

grad = [X_grad(:); Theta_grad(:)];

end
