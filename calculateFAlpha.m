function [fAlpha] = calculateFAlpha(alpha,recall,precision)
for i = 1:6
    fAlpha(i) = (1 + alpha) *((precision(i)*recall(i))/(alpha*(precision(i)+recall(i))));
end