%select from multiple emotions based on which took the least number of
%recursions to calculate
function [prediction] = selectFromNumBased(selection,num_iterations_mat)

X = randi([1,6],1);
if (allVector(selection,0) == 1)
    prediction = X;
    return;
end

temp=1000;  % arbitrarly large number
for i =1:6

    if selection(i) == 1 && num_iterations_mat(i) < temp
        temp = num_iterations_mat(i);    
        prediction = i;
    end

end

end
