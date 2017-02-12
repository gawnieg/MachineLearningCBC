%function to test whether all members of vector are the same number (num),
%returns 0 or 1
function [bin] = allVector(vector, num)

for i = 1:length(vector)
    if vector(i) ~= num
        bin = 0;
        return
    end
end

bin = 1;
