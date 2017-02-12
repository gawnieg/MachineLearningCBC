load('cleandata_students.mat');

%initialise array of confusion matrices, one for each fold
confMatrixArray = zeros(6,6,10);

for i = 1:10
    %split the data into nine folds for training and one fold for testing
    [testFoldX, testFoldY, trainFoldX, trainFoldY] = splitData(i-1,10,x,y);
    for emotion = 1:6
        %creating the binarytarget for each emotion 1 to 6
        binaryTarget = makeBinaryTarget(emotion,trainFoldY); 
        attributes = [1:45]; % new attribute array 
        %train one tree for each emotion on nine tenths of the data
        trainedTrees(emotion) = decisionTreeLearning(trainFoldX, attributes, binaryTarget);
                
    end
    %now function to test already trained tree, by making predictions and
    %creating confusion matrices
    predictions = testTrees(trainedTrees, testFoldX);
    confMatrix = confusionMatrix(predictions, testFoldY);
    confMatrixArray(:,:,i) = confMatrix; 
end

totalConfMatrix = zeros(6,6);

for i = 1:10
    %create a total confusion matrix by adding all the previous ones
    totalConfMatrix = totalConfMatrix + confMatrixArray(:,:,i);
end

%calculate the recall, precision, f1, and classification rate of the trees
recall = calculateRecall(totalConfMatrix);
precision = calculatePrecision(totalConfMatrix);
fAlpha = calculateFAlpha(1,recall,precision);
classRate = calculateClassificationRate(totalConfMatrix);

%pruning_example(x,y);