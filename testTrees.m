function [predictions] = testTrees(trainedTrees, x2)

predictions = zeros(length(x2),1);

    
for j = 1:length(x2) 
   %disp('j')
   %disp(j)
  % disp(x2(j,:))
  selection = zeros(1,6);
  for i = 1:6

    if testRow2(x2(j,:),trainedTrees(i)) == 1
       selection(i) = 1;
       %predictions(j) = i;  %Overwritting for each tree as spec said if fits for one than one tree then pick tree at random. 
       % same as doing this is overwritting for the last tree that
       % fits. 
    end
  end
  %disp(selection)
  predictions(j) = selectFrom(selection);

end
end


