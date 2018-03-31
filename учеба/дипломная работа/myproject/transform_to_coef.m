%
%
% method позволяет выбрать вид преобразования
% при method = 1 оценка : DCT
% при method = 2 оценка : DWT
% при method = 3 оценка : LOT
function [new_image_data, counter] = transform_to_coef(image_data, ...
                                               min_coef, sqr_size, method)
switch method
    case 1
        [new_image_data, counter] = transform_to_coef_dct( ...
                image_data, min_coef, sqr_size);
    case 2
        [new_image_data, counter] = transform_to_coef_dwt( ...
                image_data, min_coef);
    otherwise 
        error('Неверный параметр метода преобразования');
            
end