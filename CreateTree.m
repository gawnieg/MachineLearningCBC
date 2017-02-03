% function to implement pseudo code loop. 

%{

function DECISION-TREE-LEARNING(examples,attributes,binary_targets) returns a decision tree for a given
target label
    if all examples have the same value of binary_targets
    then return a leaf node with this value
    else if attributes is empty
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