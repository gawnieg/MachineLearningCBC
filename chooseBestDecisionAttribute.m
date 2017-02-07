function [attribute] = chooseBestDecisionAttribute(examples,attributes, binaryTarget)

%attribute = length(examples);
[n,p] = counting(binaryTarget);
%disp(n)
%disp(p)
totalEmotionEntropy = emotionEntropy(p,n);

%disp('total emotion entropy is')
%disp(totalEmotionEntropy)


infogain = 0;

for i = 1:length(attributes)
    examine_col = examples(:,i); % select column in examples data
%    disp(examine_col)
    [p0,p1,n0,n1]=countSubset(examine_col, binaryTarget);
    
    X = [p0,p1,n0,n1];
    
    remainder_val = remainder(p0,p1,n0,n1,p,n);
%    disp('remainder')
%    disp(remainder_val)
    infogainTemp = totalEmotionEntropy - remainder_val;
%    disp(remainder_val)
%    disp('info gain temp is ')
%    disp(infogainTemp)
    if infogainTemp > infogain 
        infogain = infogainTemp; % finding the best value in the examples data
        attribute = attributes(i); %the column selected from the examples data results in the biggest info gain
    end
    
end


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
X = [p0,p1,n0,n1,p,n];
%disp(X)
firstval = ((p0+n0)/(p+n+eps))*(emotionEntropy(p0,n0));
secondval = ((p1+n1)/(p+n+eps))*(emotionEntropy(p1,n1));
Y = [firstval, secondval];
%disp(Y)
remainder_val = firstval+secondval;
    

    
    