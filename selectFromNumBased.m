function [prediction] = selectFromNumBased(selection,num_iterations_mat)

X = randi([1,6],1); % do we still need this?
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
