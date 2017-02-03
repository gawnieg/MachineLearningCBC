% attributes are the Muscle Group values from 1 to 45
attributes = [1:45];

% first argument is emotion, 1 to 6, y is the data vector from clean /
% noisy data (don't forget to load!!)
binaryTarget = makeBinaryTarget(6,y);

mode = majorityValue(binaryTarget);

totalEmotionEntropy = chooseBestDecisionAttribute(x,attributes,binaryTarget);
disp(totalEmotionEntropy)