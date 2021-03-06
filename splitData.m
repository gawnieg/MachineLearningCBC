%split the data into 9/10 for training, 1/10 for testing
function [testFoldX, testFoldY, trainFoldX, trainFoldY] = splitData(counter, kFold, x, y)
%counter runs from 1 to kFold

A = length(y);

start = (round(counter * (A/kFold))) + 1;
fin = round((counter+1) * (A/kFold));

firstpartx = x([1:start-1],:);
secondpartx = x([fin+1:A],:);
trainFoldX = vertcat(firstpartx,secondpartx);

firstparty = y([1:start-1],:);
secondparty = y([fin+1:A],:);
trainFoldY = vertcat(firstparty,secondparty);

testFoldX = x([start:fin],:);
testFoldY = y([start:fin],:);


