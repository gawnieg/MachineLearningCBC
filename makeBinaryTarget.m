%return a vector specifying whether or not an example is positive or
%negative for a given emotion
function [binary_target] = makeBinaryTarget(attribute,vector)

binary_target = zeros(length(vector),1);

for i = 1:length(vector)
    if vector(i) == attribute
        binary_target(i) = 1;
    else
        binary_target(i) = 0;
    end
end
