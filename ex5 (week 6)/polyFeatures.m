function [X_poly] = polyFeatures(X, p)
X_poly = zeros(size(X,1), p);

X_poly(:,1) = X(:,1);

for i = 2:p
    X_poly(:,i) = X_poly(:,1) .^ i;
end

end
