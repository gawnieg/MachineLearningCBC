function [confMatrix] = confusionMatrix(predictedClasses, actualClasses)

confMatrix = zeros(6,6);

for i = 1:length(actualClasses)
    row = actualClasses(i);
    col = predictedClasses(i);
    confMatrix(row,col) = confMatrix(row,col) + 1;
end