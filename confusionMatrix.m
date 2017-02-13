%create the confusion matrix from the predicted results of testTrees, 
%and the actual results from cleandata/noisydata
function [confMatrix] = confusionMatrix(predictedClasses, actualClasses)

confMatrix = zeros(6,6);

for i = 1:length(actualClasses)
    row = actualClasses(i);
    col = predictedClasses(i);
    confMatrix(row,col) = confMatrix(row,col) + 1;
end