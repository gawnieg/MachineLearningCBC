function [binary_target] = makeBinaryTarget(attribute,vector)

binary_target = zeros(length(vector),1);

for i = 1:length(vector)
    if vector(i) == attribute
        binary_target(i) = 1;
    else
        binary_target(i) = 0;
    end
end





%{
line = fgets(fid);
   
    elseif (line == attribute)
        binary_target(end+1) = 1;
    else 
        binary_target(end+1) = 0;
    end
%}