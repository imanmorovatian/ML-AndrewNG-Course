function centroids = computeCentroids(X, idx, K)

[m n] = size(X);
centroids = zeros(K, n);

for i = 1:K
    ctr = 0;
    for j = 1:length(idx)
        if idx(j,:) == i
            centroids(i,:) = centroids(i,:) + X(j,:);
            ctr = ctr + 1;
        end
    end
    centroids(i,:) = centroids(i,:) / ctr;
end

end

