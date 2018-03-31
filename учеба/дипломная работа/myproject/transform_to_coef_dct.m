function [new_image_data, counter] = transform_to_coef_dct(image_data, ...
                                                 min_coef_value, sqr_size)

width = 256; % ����� ������
length = 256; % ����� �����

str_counter = 0; % ������� �����
counter = 0; % ������� ��������� ������������� 
%sqr_size = 4; % dxd ������ ��������

% ������������� �������� ����� ������������� ������
block = uint8(zeros(sqr_size,sqr_size));
% ������������� �������� ���������������� ����������� ������
restored_image = uint8(zeros(sqr_size,width));
%
%
% !!!!!!!!!!!!������� ����������!!!!!!!!!!!! 
% ���������� restored_image � new_image_data
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%
new_image_data = uint8(zeros(width,length)); 

for i=1:sqr_size:width-sqr_size+1
    for j=1:sqr_size:length-sqr_size+1
        
        % ��������� �� �����
        for l=1:sqr_size
            for k=1:sqr_size
                block(l,k) = image_data(i+l-1,j+k-1);
            end
        end
        
        % ��� ��� ����� 
        dct_block = dct2(block);
        % ��������� �������������, ������� �������� ���� ������
        dct_block(abs(dct_block) < min_coef_value) = 0;
        
        counter = counter + nnz(dct_block);
        
        % �������� �������������� ��� ������
        idct_block = uint8(idct2(dct_block));
        
        % ���������
        restored_image(:,j:j+sqr_size - 1) = idct_block;
        str_counter = str_counter+1;
    end
    new_image_data(i:i+sqr_size - 1,:) = restored_image;
    restored_image = uint8(zeros(sqr_size,width));
end
%    figure; imshow(new_image_data);
   counter = 100 - counter * 100 / (256 * 256);
%    figure; imshow(image_data);
%    title("��������� ���������");

