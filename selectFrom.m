%if an example can be assigned more than one emotion, randomly select
%between them. if it is not classified as any emotion, randomly choose one
%of all 6

function [prediction] = selectFrom(selection)

X = randi([1,6],1);
if (allVector(selection,0) == 1)
    prediction = X;
    return;
end

if (selection(X) == 1)
    prediction = X;
    return;
else
    prediction = selectFrom(selection);
end
