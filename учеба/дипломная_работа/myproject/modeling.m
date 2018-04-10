function coef = modeling()

% загружаем изображение
image_data = imread('cat.png', 'png');

% отображение данных в коэффициенты
% [new_image_data, counter] = transform_to_coef_dct(image_data, min_coef_value, sqr_size);
figure;
%estm = 1;


coef = transform_to_coef(image_data, 8, 2);
% анализ коэффициентов
% sqr_size_matrix = 8;
% min_coef_matrix = [0 1 2 5 10 15 20 25 30 35 40 45 50 55];

% coef1 = analysis_ssim_psnr_immse(image_data, estm, 4, 1, ...
%                             min_coef_matrix);
% coef2 = analysis_ssim_psnr_immse(image_data, estm, 8, 1, ...
%                             min_coef_matrix);
% coef3 = analysis_ssim_psnr_immse(image_data, estm, 16, 1, ...
%                             min_coef_matrix);
% coef4 = analysis_ssim_psnr_immse(image_data, estm, sqr_size_matrix, 2, ...
%                             min_coef_matrix);
% legend('dct','dwt');
% legend('dct 4x4','dct 8x8','dct 16x16','dwt');
% size(coef1)
% size(coef2)
% size(coef3)
% size(coef4)