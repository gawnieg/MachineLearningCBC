% attributes are the Muscle Group values from 1 to 45
attributes = [1:45];

% first argument is emotion, 1 to 6, y is the data vector from clean /
% noisy data (don't forget to load!!)
binaryTarget = makeBinaryTarget(6,y);

mode = majorityValue(binaryTarget);

%getting best attribute (column number for given data x, and for particular
%emotu
bestAttribute = chooseBestDecisionAttribute(x,attributes,binaryTarget);
disp(bestAttribute)

disp('testing ModifyExampleData')
%examples = randi([0 1], 5,5)
ui = 1;
disp(examples)
[examplesui, binaryTargetsui] =ModifyExampleData(examples,ui,binaryTarget,bestAttribute,attributes);