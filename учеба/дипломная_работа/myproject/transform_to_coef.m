%
%
% method позволяет выбрать вид преобразования
% при method = 1 оценка : DCT
% при method = 2 оценка : DWT
% при method = 3 оценка : LOT
function coef = transform_to_coef(image_data, sqr_size, method, reverse)
switch method
    case 1
        coef = transform_to_coef_dct( ...
                image_data, sqr_size, reverse);
    case 2
        coef = transform_to_coef_dwt( ...
                image_data, reverse);
    otherwise 
        error('Неверный параметр метода преобразования');
            
end