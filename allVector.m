function [bin] = allVector(vector, num)

for i = 1:length(vector)
    if vector(i) ~= num
        bin = 0;
        return
    end
end

bin = 1;
