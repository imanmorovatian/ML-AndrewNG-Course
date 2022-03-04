function [C, sigma] = dataset3Params(X, y, Xval, yval)

C_values = [0.01 0.03 0.1 0.3 1 3 10 30 90]; % 1 to 100
sigma_values = [0.01 0.03 0.1 0.3 1 3 10 30 90]; % 0.25 to 16

error = 1000;
best_C = C_values(1);
best_sigma = sigma_values(1);

for i = 1:length(C_values)
    C = C_values(i);
    for j = 1:length(sigma_values)
        sigma = sigma_values(j);
        model = svmTrain(X, y, C, @(x1, x2)gaussianKernel(x1, x2, sigma));
        predictions = svmPredict(model, Xval);
        
        if mean(double(predictions ~= yval)) < error
            error = mean(double(predictions ~= yval));
            best_C = C;
            best_sigma = sigma;
        end
        
    end
end

C = best_C;
sigma = best_sigma;

end
