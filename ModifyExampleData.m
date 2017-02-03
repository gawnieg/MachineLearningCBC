function [examplesui, binaryTargetsui] = ModifyExampleData(examples,ui,binaryTargets,bestAttribute)
    %need to extract the info that is still wanted from the examples passed
    % wanted if examples row with BestAttribute = ui and also the
    % corresponding binaryTarget entry
    
    
    % if we are removing the best attribute column then what about the
    % indexing of the attributes, is this accounted for? are we using the
    % index or what? for example if the bestAttribute is column 4, then we
    % should re-arrange the attributes vector so that it does not have the
    % value 4 and it goes: 1 2 3 5 6 7 ????
    % in which case the bestAttribute is not the index so be carful
    
    %must find index corresponding to bestAttribute so can use it in the
    %loop below
    
    attribute_index =0;
    for i = 1:length(attributes) %attributes will be the same size as examples is wide
       if attributes(i)== bestAttribute
           attribute_index =i;
       end
            
    end
    
    j =1; %index for examplesui
    for i = 1:length(examples)
        if examples(i,attribute_index)== ui %if the column with bestAttribute is equal to ui, then that row should be kept
            temp_example_sui(j)= examples(:,attribute_index); % adding to examplesui
            j = j +1;
        end
    end
    
    %then need to remove attribute row itself   
    temp_1 = temp_example_sui(:,1:attribute_index); % get data up to attribute col
    temp_2 = temp_example_sui(:,(attribute_index+1):length(temp_example_sui)); % get data from attribute index +1 to end, to exclude
    examplesui = horzcat(temp_1, temp_2); % horizontally concatenate the two
    
    
    
    
    
    
    
    
end