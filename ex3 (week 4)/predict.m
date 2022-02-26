function p = predict(Theta1, Theta2, X)

    m = size(X, 1);
    X = [ones(m, 1) X];
    a2 = sigmoid(X*Theta1');
    a2 = [ones(size(a2, 1), 1) a2];
    p = sigmoid(a2*Theta2');
    [~,p] = max(p, [], 2);

end
