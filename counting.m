%returns number of positive and negative examples in the binary target
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