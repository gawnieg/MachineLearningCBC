function [mode] = majorityValue(binaryTarget)

[count0,count1] = counting(binaryTarget);
%disp(count0); DISPLAYING WHAT WAS COUNTED
%disp(count1);

if count0 > count1
    mode = 0;
else 
    mode = 1;
end


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




