function sim = gaussianKernel(x1, x2, sigma)

x1 = x1(:); x2 = x2(:);
temp1 = x1 - x2;
temp1 = temp1 .^ 2;
sim = exp(-sum(temp1) / (2* sigma ^ 2));
    
end
