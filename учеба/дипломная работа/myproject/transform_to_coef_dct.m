function [new_image_data, counter] = transform_to_coef_dct(image_data, ...
                                                 min_coef_value, sqr_size)

width = 256; % длина строки
length = 256; % колво строк

str_counter = 0; % счетчик строк
counter = 0; % счетчик ненулевых коэффициентов 
%sqr_size = 4; % dxd размер квадрата

% инициализация текущего блока коэффициентов нулями
block = uint8(zeros(sqr_size,sqr_size));
% инициализация значений восстановленного изображения нулями
restored_image = uint8(zeros(sqr_size,width));
%
%
% !!!!!!!!!!!!НЕМНОГО ПЕРЕДЕЛАТЬ!!!!!!!!!!!! 
% ОБЪЕДИНИТЬ restored_image и new_image_data
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%
new_image_data = uint8(zeros(width,length)); 

for i=1:sqr_size:width-sqr_size+1
    for j=1:sqr_size:length-sqr_size+1
        
        % разбиение на блоки
        for l=1:sqr_size
            for k=1:sqr_size
                block(l,k) = image_data(i+l-1,j+k-1);
            end
        end
        
        % ДКП для блока 
        dct_block = dct2(block);
        % Обнуление коэффициентов, имеющих значение ниже порога
        dct_block(abs(dct_block) < min_coef_value) = 0;
        
        counter = counter + nnz(dct_block);
        
        % Обратное преобразование для оценки
        idct_block = uint8(idct2(dct_block));
        
        % Добавлеие
        restored_image(:,j:j+sqr_size - 1) = idct_block;
        str_counter = str_counter+1;
    end
    new_image_data(i:i+sqr_size - 1,:) = restored_image;
    restored_image = uint8(zeros(sqr_size,width));
end
%    figure; imshow(new_image_data);
   counter = 100 - counter * 100 / (256 * 256);
%    figure; imshow(image_data);
%    title("начальное состояние");

