function [attribute] = chooseBestDecisionAttribute(examples,attributes, binaryTarget)

attribute = length(examples);
[p,n] = counting(binaryTarget);
totalEmotionEntropy = emotionEntropy(p,n);

infogain = 0;

for i = 1:length(attributes)
    examine_col = examples(:,attributes(i)); % select column in examples data
    [p0,p1,n0,n1]=countSubset(examine_col, binaryTarget);
    
    
    remainder_val = remainder(p0,p1,n0,n1,p,n);
    infogainTemp = totalEmotionEntropy - remainder_val;
    if infogainTemp > infogain 
        infogain = infogainTemp; % finding the best value in the examples data
        attribute = attributes(i); %the column selected from the examples data results in the biggest info gain
    end
    
end



%calculate total entropy for given emotion
function [totalEmotionEntropy] = emotionEntropy(p,n)

firstdiv = (p/(p+n));
seconddiv = (n/(p+n));
totalEmotionEntropy = -((firstdiv)*(log(firstdiv)/log(2))) - ((seconddiv)*(log(seconddiv)/log(2)));

%count number of positive and negative examples
function [count0, count1] = counting(binaryTarget)

count0 = 0;
count1 = 0;

for i = 1:length(binaryTarget)
    if binaryTarget(i) == 1
        count1 = count1 + 1;
    elseif binaryTarget(i) == 0
        count0 = count0 + 1;
    end
end

% checking subset for examine_col (=0) = binaryTarget(=0) ->  n0 =
% n0+ 1; for n0,n1,p0,p1
function [p0,p1,n0,n1] = countSubset(exampleCol,binaryTarget)

p0 = 0;
p1 = 0;
n0 = 0;
n1 = 0;

for i = 1:length(binaryTarget)
    if exampleCol(i) == 1 && binaryTarget(i) == 1
        p1 = p1+1;
    elseif exampleCol(i) == 1 && binaryTarget(i) == 0
        n1 = n1 +1;
    elseif exampleCol(i) == 0 && binaryTarget(i) == 1
        p0 = p0+1;
    elseif exampleCol(i) == 0 && binaryTarget(i) == 0
        n0 = n0+1;
    end
end

%calculate remainder function for a given attribute
function [remainder_val] = remainder(p0,p1,n0,n1,p,n)
   
firstval = ((p0+n0)/(p+n))*(emotionEntropy(p0,n0));
secondval = ((p1+n1)/(p+n))*(emotionEntropy(p1,n1));
remainder_val = firstval+secondval;
    

    
    