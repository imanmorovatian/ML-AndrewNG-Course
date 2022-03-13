function [bestEpsilon, bestF1] = selectThreshold(yval, pval)

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    predictions = (pval < epsilon);
    
    tp = sum( (predictions == 1) & (yval == 1) );
    fp = sum( (predictions == 1) & (yval == 0) );
    fn = sum( (predictions == 0) & (yval == 1) );
    precision = tp / (tp + fp);
    recall = tp / (tp + fn);
    F1 = (2 * precision * recall) / (precision + recall);
    
    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
