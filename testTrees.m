function [predictions] = testTrees(trainedTrees, x2)

predictions = zeros(length(x2),1);

    
for j = 1:length(x2) 
   %disp('j')
   %disp(j)
  % disp(x2(j,:))
  selection = zeros(1,6);
  num_iterations_mat = zeros(1,6);
  for i = 1:6
      num_iterations =0;
    [test_result, num_iterations]=testRow2(x2(j,:),trainedTrees(i),0);
   % disp('number iterations is ')
   % disp(num_iterations)
    if test_result == 1
       selection(i) = 1; % add a one for that particular tree
       num_iterations_mat(i) = num_iterations; % add the number of iterations to the matrix
       
       %predictions(j) = i;  %Overwritting for each tree as spec said if fits for one than one tree then pick tree at random. 
       % same as doing this is overwritting for the last tree that
       % fits. 
    end
  end
  %if predictions(j) == 0
   %   predictions(j) = randi([1,6],1);
  %end
  %disp(selection)
  
  %predictions(j) = selectFrom(selection); % this line is for selecting randomly
  
  predictions(j) = selectFromNumBased(selection,num_iterations_mat);

end
disp('selction is')
disp(selection)
disp('num_iteration_num')
disp(num_iterations_mat)
%disp('predictions')
%disp(predictions)
end

