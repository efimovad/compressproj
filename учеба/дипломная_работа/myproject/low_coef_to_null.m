function quant_coef = low_coef_to_null(coef, min_coef)
length = size(coef,2);
width = size(coef,1);
for i=1:width
    for j=1:length
        if (abs(coef(i,j)) < min_coef)
            coef(i,j) = 0;
        end
        coef(i,j) = round(coef(i,j));
    end
end

quant_coef = coef;