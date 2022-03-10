function idx = findClosestCentroids(X, centroids)

K = size(centroids, 1);
idx = zeros(size(X,1), 1);

for i = 1:length(idx)
    min = X(i,:) - centroids(1,:);
    min = min .^ 2;
    min = sum(min);
    idx(i) = 1;
    
    for j = 2:K
        dif = X(i,:) - centroids(j,:);
        dif = dif .^ 2;
        dif = sum(dif);
        
        if dif < min
            idx(i) = j;
            min = dif;
        end
    end
    
end

end

