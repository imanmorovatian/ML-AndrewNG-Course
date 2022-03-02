function [J, grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1)); % 25 * 401

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1)); % 10 * 26

% X = 5000 * 400

m = size(X, 1);

a1 = X;
a1 = [ones(size(a1, 1), 1) a1];

z2 = a1 * Theta1'; % 5000 * 25
a2 = sigmoid(z2);
a2 = [ones(size(a2, 1), 1) a2]; % 5000 * 26

z3 = a2 * Theta2'; % 5000 * 10
a3 = sigmoid(z3); % h_theta

y = (y == 1:num_labels); % 5000 * 10

temp1 = (-y .* log(a3)) - ((1 - y) .* log(1-a3));
temp1 = sum(temp1, 2); % for inner sum k = 1 to 10
temp2 = sum(temp1); % the second sum i = 1 to m
J = temp2 / m;

regularization = sum(sum(Theta1(:,2:end) .^ 2)) + sum(sum(Theta2(:,2:end) .^ 2));

J = J + regularization * (lambda / (2*m));

Theta1_grad = zeros(size(Theta1)); % 25 * 401
Theta2_grad = zeros(size(Theta2)); % 10 * 26

for t = 1:m
    % forward
    
    x_t = X(t,:); % 1 * 400
    a_1 = x_t; 
    a_1 = [1;a_1']; % 401 * 1
    
    z_2 = Theta1 * a_1; % (25 * 401)(401 * 1) = 25 * 1
    a_2 = sigmoid(z_2);
    a_2 = [1; a_2]; % 26 * 1
    
    z_3 = Theta2 * a_2; % (10 * 26)(26 * 1) = 10 * 1
    a_3 = sigmoid(z_3);
    
    % backpropagation
    
    y_t = y(t,:); % 1 * 10
    y_t = y_t'; % 10 * 1
    
    delta3 = a_3 - y_t; % 10 * 1
    
    delta2 = (Theta2' * delta3) .* [0; sigmoidGradient(z_2)]; % ((26 * 10)(10 * 1)) (25+1 * 1) = 
                                                        % (26 * 1) .* (26 * 1)
    
    Theta2_grad = Theta2_grad + delta3 * a_2'; % (10 * 26) + ( 10 * 1)(1 * 26)
    Theta1_grad = Theta1_grad + delta2(2:end,:) * a_1'; % (25 * 401) + (26-1 * 1)(1 * 401)
    
end

Theta1_grad = Theta1_grad / m;
Theta1_grad(:,2:end) = Theta1_grad(:,2:end) + (lambda/m) * Theta1(:, 2:end);

Theta2_grad = Theta2_grad / m;
Theta2_grad(:,2:end) = Theta2_grad(:,2:end) + (lambda/m) * Theta2(:, 2:end);

grad = [Theta1_grad(:) ; Theta2_grad(:)];

end
