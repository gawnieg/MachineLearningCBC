%test one example for a particular emotion, and count the number of
%recursive calls
function [prediction,num_iterations] = testRow2(row, tree,init_iterations)

if (~isempty(tree.class))
    prediction = tree.class;
    num_iterations = init_iterations+1;
end

if row(tree.op) == 0
    init_iterations=init_iterations+1;
    [prediction,num_iterations] = testRow2(row, tree.kids{1},init_iterations);
    
elseif row(tree.op) == 1
    init_iterations=init_iterations+1;
    [prediction,num_iterations] = testRow2(row, tree.kids{2},init_iterations);

end

end