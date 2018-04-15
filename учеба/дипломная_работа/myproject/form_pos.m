function [p, symbols] = form_pos(coef)

length = size(coef,2);
width = size(coef,1);

maxv = max(max(coef));
minv = min(min(coef));

symbols = minv:maxv;
p = zeros(size(symbols));

for i=1:width
    for j=1:length
        val = coef(i, j);
        p(1, val-(minv-1)) = p(1, val-(minv-1)) + 1;     
    end
end

p = p/(length*width);
