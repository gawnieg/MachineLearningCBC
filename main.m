% attributes are the Muscle Group values from 1 to 45


% first argument is emotion, 1 to 6, y is the data vector from clean /
% noisy data (don't forget to load!!)
%DrawDecisionTree(trainedTrees(1))

%prediction = testRow2(x(13,:),trees(1));
%disp(prediction)
confMatrixArray = zeros(6,6,10);

for i = 1:10
    [testFoldX, testFoldY, trainFoldX, trainFoldY] = splitData(i-1,10,x,y);
    for j = 1:6
        binaryTarget = makeBinaryTarget(j,trainFoldY); % creating the binarytarget for each emotion 1 to 6
        attributes = [1:45]; % new attribute array 
        trainedTrees(j) = decisionTreeLearning(trainFoldX, attributes, binaryTarget);
        % now function to test already trained tree.
        
    end
    predictions = testTrees(trainedTrees, testFoldX);
    confMatrix = confusionMatrix(predictions, testFoldY);
    confMatrixArray(:,:,i) = confMatrix; 
end
%tree = decisionTreeLearning(x,attributes,binaryTarget);
totalConfMatrix = zeros(6,6);

for i = 1:10 
    totalConfMatrix = totalConfMatrix + confMatrixArray(:,:,i);
end

recall = calculateRecall(totalConfMatrix);
precision = calculatePrecision(totalConfMatrix);
fAlpha = calculateFAlpha(1,recall,precision);
classRate = calculateClassificationRate(totalConfMatrix);

pruning_example(x,y);
%DrawDecisionTree(tree)