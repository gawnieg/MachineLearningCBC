% function to implement pseudo code loop. 

%{

function DECISION-TREE-LEARNING(examples,attributes,binary_targets) returns a decision tree for a given
target label
    if all examples have the same value of binary_targets -- BASE CASE
    then return a leaf node with this value

    else if attributes is empty --BASE CASE
        then return a leaf node with value = MAJORITY-VALUE(binary_targets)
    
    else
        best_attribute = CHOOSE-BEST-DECISION-ATTRIBUTE(examples,attributes, binary_targets)
        tree = a new decision tree with root as best_attribute
        for each possible value υ i of best_attribute do (note that there are 2 values: 0 and 1)
            add a branch to tree corresponding to best_attibute = υ i
            {examples i , binary_targets i } {elements of examples with best_attribute = υ i and the
            corresponding binary_targets i }
        
            if examples i is empty
            then return a leaf node with value = MAJORITY-VALUE(binary_targets)
            else subtree = DECISION-TREE-LEARNING(examples i ,attributes-{best_attribute},
            binary_targets i )
    
    return tree

%}

function [tree] = decisionTreeLearning(examples,attributes,binaryTargets)
tree = struct('op',[],'kids',[],'class',0);

%base case 1 "examples have the same value of binary_targets" 
if all(binaryTargets) == 1 %&& all(examples) == 1
   disp('adding leaf node with attribute value')
   disp(1)
   tree.class = 1; % but what is attribute?
   return;
elseif all(binaryTargets)==0 %&& all(examples) ==0
   disp('adding leaf node with attribute value')
   disp(0)
   tree.class =0; % but what is attribute?
   return;


%base case 2 
elseif isEmpty(attributes) == 1 % this means it is empty
    majorityValue = majorityValue(binaryTargets);
    %add leaf to tree with bestAttribute as value
    % tree.op = empty?
    tree.class = majorityValue; 
    return;

%recurvise case
else 
    bestAttribute = chooseBestDecisionAttribute(examples,attributes, binaryTargets);
    %make new tree altogether??
    tree = struct('op',[],'kids',[],'class',0);
    tree.op=bestAttribute;
    
    %start of for each -not using for each as there is only two values
    ui = 0;
    tree.kids{ui}= struct('op',[],'kids',[],'class',0); 
    %now call function to split data according to ui and bestAttribute,
    %coming back in example_ui and binaryTargetsui
    [example_sui, binaryTargetsui] = ModifyExampleData(examples,ui,binaryTargets,bestAttribute);
    
    
    
    
    


end

end

      