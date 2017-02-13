%returns a vector of predicted emotions given 6 trained trees and a set a
%data
function [predictions] = testTrees(trainedTrees, x2)

predictions = zeros(length(x2),1);

for j = 1:length(x2) 
    selection = zeros(1,6);
    num_iterations_mat = zeros(1,6);
    for i = 1:6
        num_iterations =0;
        [test_result, num_iterations]=testRow2(x2(j,:),trainedTrees(i),0);
        if test_result == 1
            selection(i) = 1; % add a one for that particular tree
            num_iterations_mat(i) = num_iterations; % add the number of iterations to the matrix
        end
    end
  
    %this line is for selecting randomly
    %predictions(j) = selectFrom(selection); 
  
    predictions(j) = selectFromNumBased(selection,num_iterations_mat);

end

end


