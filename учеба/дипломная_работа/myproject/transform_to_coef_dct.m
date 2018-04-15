function new_data = transform_to_coef_dct(image_data, sqr_size, reverse)

width = size(image_data,2);
length = size(image_data,1);

if (reverse == 0)
    new_data = zeros(length,width);
elseif (reverse == 1)
    new_data = uint8(zeros(length,width));
end

for i=1:width/sqr_size
    for j=1:width/sqr_size
        block = image_data(1+sqr_size*(i-1):sqr_size*i, ...
                           1+sqr_size*(j-1):sqr_size*j);
        if (reverse == 0)
            new_block = dct2(block);
            new_data(1+sqr_size*(i-1):sqr_size*i, ... 
                     1+sqr_size*(j-1):sqr_size*j) = new_block;
        elseif (reverse == 1)
            new_block = uint8(idct2(block));
            new_data(1+sqr_size*(i-1):sqr_size*i, ... 
                     1+sqr_size*(j-1):sqr_size*j) = new_block;
        end
        
    end
end
