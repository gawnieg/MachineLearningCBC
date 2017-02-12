%return the mode of a binary target
function [mode] = majorityValue(binaryTarget)

[count0,count1] = counting(binaryTarget);

if count0 > count1
    mode = 0;
else 
    mode = 1;
end




