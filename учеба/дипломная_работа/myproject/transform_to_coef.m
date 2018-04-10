%
%
% method ��������� ������� ��� ��������������
% ��� method = 1 ������ : DCT
% ��� method = 2 ������ : DWT
% ��� method = 3 ������ : LOT
function coef = transform_to_coef(image_data, sqr_size, method, reverse)
switch method
    case 1
        coef = transform_to_coef_dct( ...
                image_data, sqr_size, reverse);
    case 2
        coef = transform_to_coef_dwt( ...
                image_data, reverse);
    otherwise 
        error('�������� �������� ������ ��������������');
            
end