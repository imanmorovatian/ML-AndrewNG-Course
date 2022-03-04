function x = emailFeatures(word_indices)

n = 1899;
x = zeros(n, 1);

for i = 1:n
    x(i,1) = 0;
    for j = 1:length(word_indices)
        if i == word_indices(j)
            x(i,1) = 1;
            break;
        end
    end
end
