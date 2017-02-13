%returns a trained tree, given a set of examples, binary targets (whether
%or not an example is positive for a given emotion), and a vector of
%attributes
function [tree] = decisionTreeLearning(examples,attributes,binaryTargets)
tree = struct('op',[],'kids',[],'class',0);

%calculate whether all examples have the same value of binary target
allOne = allVector(binaryTargets, 1);
allZero = allVector(binaryTargets, 0);

%base case 1 "examples have the same value of binary_targets" 
if allZero == 1 
   tree.kids =[];
   tree.class =0; 
   return;
   
elseif allOne == 1 
   tree.kids =[];
   tree.class = 1; 
   return;

%base case 2 if attributes is empty
elseif isempty(attributes) == 1 
    majority_value = majorityValue(binaryTargets);
    %add leaf to tree
    tree.kids =[];
    tree.class = majority_value; 
    return;

%recurvise case
else   
    bestAttribute = chooseBestDecisionAttribute(examples,attributes, binaryTargets);
    %if no attribute gives an information gain, end that branch of the tree
    if bestAttribute == -1 
        tree.kids =[];
        tree.class =0; 
        return;
    end    
   
    tree = struct('op',[],'kids',[],'class',0);
    tree.op=bestAttribute;
    
    %for each value of the chosen attribute make new subtree
    for ui =0:1
        tree.kids{ui+1}= struct('op',[],'kids',[],'class',0); %creating new tree 
        %split data according to ui and bestAttribute,
        %returning example_ui and binaryTargetsui       
        [examplesui, binaryTargetsui,attributesui] = ModifyExampleData(examples,ui,binaryTargets,bestAttribute,attributes);
        
        if isempty(examplesui)== 1
            tree.class = majorityValue(binaryTargets);
        else 
            %create subtree as a child of current tree
            tree.kids{ui+1}= decisionTreeLearning(examplesui,attributesui,binaryTargetsui); 
        end
    end
    

end
return;

end
      