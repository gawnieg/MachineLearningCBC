%returns the total classification rate from a confusion matrix
function [classificationRate] = calculateClassificationRate(confMatrix)

matrixTotal = sum(confMatrix(:));
diagSum = 0;

for i = 1:6
    diagSum = diagSum + confMatrix(i,i);
end

classificationRate = diagSum/matrixTotal;

end