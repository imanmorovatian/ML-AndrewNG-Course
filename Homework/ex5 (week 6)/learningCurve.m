function [error_train, error_val] = learningCurve(X, y, Xval, yval, lambda)

m = size(X, 1);

error_train = zeros(m, 1);
error_val   = zeros(m, 1);

for i = 1:m
   [theta] = trainLinearReg([ones(i, 1) X(1:i,:)], y(1:i,:), lambda);
   error_train(i) = linearRegCostFunction([ones(i,1) X(1:i,:)], y(1:i,:), theta, 0);
   error_val(i) = linearRegCostFunction([ones(size(Xval,1),1) Xval], yval, theta, 0);
end

end
