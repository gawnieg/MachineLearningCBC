%function to choose the attribute which restults in the large info gain,
%returns the attribute number
function [attribute] = chooseBestDecisionAttribute(examples,attributes, binaryTarget)

[n,p] = counting(binaryTarget); %count number of positive and negative examples
totalEmotionEntropy = emotionEntropy(p,n); %calculate total entropy

infogain = 0;

for i = 1:length(attributes)
    examine_col = examples(:,i); % select column in examples data,
    %corresponding to one attribute
    [p0,p1,n0,n1]=countSubset(examine_col, binaryTarget);
        
    remainder_val = remainder(p0,p1,n0,n1,p,n);
    infogainTemp = totalEmotionEntropy - remainder_val;
    if infogainTemp > infogain 
        infogain = infogainTemp; 
        attribute = attributes(i); 
        %the column selected from the examples data results in the biggest info gain
    end
    
end

%if there is no attribute that gives an information gain, return -1
if exist('attribute') == 0
    attribute = -1;
end

%calculate total entropy for given emotion
function [totalEmotionEntropy] = emotionEntropy(p,n)

firstdiv = (p/(p+n+eps));
seconddiv = (n/(p+n+eps));
totalEmotionEntropy = -((firstdiv)*(log(firstdiv+eps)/log(2))) - ((seconddiv)*(log(seconddiv+eps)/log(2)));


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

%count number of positive and negative examples that have 0 and 1 
%as the value of the chose attribute
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

firstval = ((p0+n0)/(p+n+eps))*(emotionEntropy(p0,n0));
secondval = ((p1+n1)/(p+n+eps))*(emotionEntropy(p1,n1));
remainder_val = firstval+secondval;
    

    
    