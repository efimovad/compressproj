
% method ��������� ������� ��� ������������������
% ��� method = 1 : zig zag (frame block) �������� ��� DCT
% ��� method = 2 : zig zag (field block) �������� ��� DCT ��� ������ 8�8
% ��� method = 3 : tree �������� ��� DWT
function reor_coef = reordering(coef, method, depth)
switch method
    case 1
        reor_coef = zigzag(coef);
    case 2
        reor_coef = zigzag_field(coef);
    case 3
        reor_coef = tree(coef, depth);
    otherwise 
        error('�������� �������� ������ ��������������');
end