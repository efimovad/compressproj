function [quant_coef] = ravn_quant(coef, step, reverse)

length = size(coef,1);
width = size(coef,2);

quant_coef = zeros(length,width);

for i=1:length
    for j=1:width
        if (reverse == 0)
            quant_coef(i,j) = round(coef(i,j)/step);
        else
            quant_coef(i,j) = coef(i,j)*step;
        end
    end
end