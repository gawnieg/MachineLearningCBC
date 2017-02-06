function [examplesui, binaryTargetsui, attributesui] = ModifyExampleData(examples,ui,binaryTargets,bestAttribute,attributes)
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
    disp('best attribute is')
    disp(bestAttribute)
    for i = 1:length(attributes) %attributes will be the same size as examples is wide
       if attributes(i)== bestAttribute
           attribute_index =i;
           disp('attribute_index is ')
           disp(attribute_index)
       end
            
    end
    [m,n]= size(examples);
    temp_example_sui = zeros(m,n); % this will be oversized, need to delete excess rows after, is there another way to do this?
    [m1,n1]=size(binaryTargets);
    binaryTargetsui = zeros(m1,n1);
   
    
    
    
    %disp('temp_example_sui is ')
    %disp(temp_example_sui)
    [A,B] = size(examples);
    
    j =1; %index for examplesui
    for i = 1:A
        disp(length(examples))
        disp('i')
        disp(i)
        disp('attribute index')
        disp(attribute_index)
        if examples(i,attribute_index)== ui %if the column with bestAttribute is equal to ui, then that row should be kept
            %disp('adding row')
            %disp(i)
            %disp(' j is ')
            %disp(j)
            temp_example_sui(j,:) = examples(i,:); % adding  row to examplesui
            binaryTargetsui(j,:) = binaryTargets(i,:); % adding same row to binaryTargetsui
            j = j +1;
        end
    end
    
    % now get rid of excess zeroes added earlier in temp_example_sui
    temp_example_sui = temp_example_sui([1:(j-1)],:); % keep one to j, discard the rest
    binaryTargetsui = binaryTargetsui([1:(j-1)],:); % keep one to j, discard the rest
    
    
    %disp('temp_example_sui is')
    %disp(temp_example_sui)
    [length_example_sui,width_example_sui]=size(temp_example_sui);
    disp('width')
    disp(width_example_sui)
    disp('attribute')
    disp(attribute_index)
    
    %then need to remove attribute row itself   
    temp_1 = temp_example_sui(:,[1:attribute_index-1]); % get data up to attribute col
    temp_2 = temp_example_sui(:,[(attribute_index+1):width_example_sui]); % get data from attribute index +1 to end, to exclude
    examplesui = horzcat(temp_1, temp_2); % horizontally concatenate the two
    disp(size(examplesui))
    %disp('examplesui is')
    %disp(examplesui)
    %disp('binaryTargetsui is')
    %disp(binaryTargetsui)
    
    %now need to get rid of the attribute
    attributes(:,attribute_index)=[];
    attributesui=attributes;
    disp(attributesui)
    
    
    
end