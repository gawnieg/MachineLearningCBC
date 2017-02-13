%returns recall of dataset, calculated from confusion matrix
function [recall] = calculateRecall(confMatrix)

for i = 1:6
    sumRow = sum(confMatrix(i,:));
    recall(i) = (confMatrix(i,i)/sumRow);
end

end