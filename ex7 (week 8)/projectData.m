function Z = projectData(X, U, K)

U_reduced = U(:, 1:K);
Z = X * U_reduced;

end
