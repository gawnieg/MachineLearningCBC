function [prediction,num_iterations] = testRow2(row, tree,init_iterations)

%disp('Recursing')
%disp('tree.class')
%disp(tree.class)
%disp(row)

%disp('init_iterations')
%disp(init_iterations)

if (~isempty(tree.class))
   
    prediction = tree.class;
     num_iterations = init_iterations+1;
    % disp('init_iterations within if')
    %disp(num_iterations)
end

%disp('is not empty')
if row(tree.op) == 0
        init_iterations=init_iterations+1;
        %disp('passing ')
        %disp(init_iterations)
    [prediction,num_iterations] = testRow2(row, tree.kids{1},init_iterations);

%return;
elseif row(tree.op) == 1
        init_iterations=init_iterations+1;
         %disp('passing  2 ')
       % disp(init_iterations)
    [prediction,num_iterations] = testRow2(row, tree.kids{2},init_iterations);

%return;
end


end