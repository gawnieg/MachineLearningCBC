%splits the data into parts that have elements of examples with 
%bestAttribute = ui and the corresponding binaryTargets

function [examplesui, binaryTargetsui, attributesui] = ModifyExampleData(examples,ui,binaryTargets,bestAttribute,attributes)

attribute_index =0;

for i = 1:length(attributes) %attributes will be the same size as examples is wide
   if attributes(i)== bestAttribute
       attribute_index =i;
   end           
end

[m,n]= size(examples);
temp_example_sui = zeros(m,n); 
%this will be oversized, need to delete excess rows after
[m1,n1]=size(binaryTargets);
binaryTargetsui = zeros(m1,n1);

[A,B] = size(examples);

j =1; %index for examplesui
for i = 1:A
    %if the column with bestAttribute is equal to ui, then that row should be kept
    if examples(i,attribute_index)== ui 
        %adding  row to examplesui
        temp_example_sui(j,:) = examples(i,:); 
        % adding same row to binaryTargetsui
        binaryTargetsui(j,:) = binaryTargets(i,:); 
        j = j +1;
    end
end

% now get rid of excess zeroes added earlier in temp_example_sui
% keep one to j, discard the rest
temp_example_sui = temp_example_sui([1:(j-1)],:); 
binaryTargetsui = binaryTargetsui([1:(j-1)],:); 

[length_example_sui,width_example_sui]=size(temp_example_sui);

%then need to remove attribute row itself   
% get data up to attribute col
temp_1 = temp_example_sui(:,[1:attribute_index-1]); 
% get data from attribute index +1 to end, to exclude
temp_2 = temp_example_sui(:,[(attribute_index+1):width_example_sui]); 
examplesui = horzcat(temp_1, temp_2); % horizontally concatenate the two

%now need to get rid of the attribute
attributes(:,attribute_index)=[];
attributesui=attributes;

    
end