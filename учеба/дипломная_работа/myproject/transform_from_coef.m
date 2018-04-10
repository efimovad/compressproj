%
% method ��������� ������� ��� ��������������
% ��� method = 1 ������ : DCT
% ��� method = 2 ������ : DWT
% ��� method = 3 ������ : LOT
function [new_image_data] = transform_from_coef(coef, ...
                                               min_coef, sqr_size, method)
switch method
    case 1
        [new_image_data] = transform_from_coef_dct( ...
                coef, min_coef, sqr_size);
    case 2
        [new_image_data] = transform_from_coef_dwt( ...
                coef, min_coef);
    otherwise 
        error('�������� �������� ������ ��������������');
            
end