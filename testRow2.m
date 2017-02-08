function [prediction] = testRow2(row, tree)

%disp('Recursing')
%disp('tree.class')
%disp(tree.class)
%disp(row)

if (~isempty(tree.class))
    prediction = tree.class;

end

%disp('is not empty')
if row(tree.op) == 0
    prediction = testRow2(row, tree.kids{1});
%return;
elseif row(tree.op) == 1
    prediction = testRow2(row, tree.kids{2});
%return;
end


end