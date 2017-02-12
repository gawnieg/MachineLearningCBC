%returns the precision of a dataset, calculated form the confusion matrix
function [precision] = calculatePrecision(confMatrix)

for i = 1:6
    sumCol = sum(confMatrix(:,i));
    precision(i) = (confMatrix(i,i)/sumCol);
end

end