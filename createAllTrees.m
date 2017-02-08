fid = fopen('trees.mat', 'w');
if (fid == -1)
    error('cannot open file for writing');
end

for i = 1:6 
    attributes = [1:45];
    classifications = y;
    examples = x;
    binaryTarget = makeBinaryTarget(i,classifications);
    trees(i) = decisionTreeLearning(examples,attributes,binaryTarget);
end

save('trees.mat', 'trees');
    