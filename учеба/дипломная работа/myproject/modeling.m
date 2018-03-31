function modeling()

% загружаем изображение
image_data = imread('cat.png', 'png');

% отображение данных в коэффициенты
% [new_image_data, counter] = transform_to_coef_dct(image_data, min_coef_value, sqr_size);
figure;
estm = 2
% анализ коэффициентов
sqr_size_matrix = 8;
min_coef_matrix1 = [0 1 2 5 10 15 20 25 30 35 40 45 50 55];
min_coef_matrix2 = [0 1 2 5 10 15 20 25 30 35 40 45 50 55];

analysis_ssim_psnr_immse(image_data, estm, 4, 1, ...
                            min_coef_matrix1);
analysis_ssim_psnr_immse(image_data, estm, sqr_size_matrix, 1, ...
                            min_coef_matrix1);
analysis_ssim_psnr_immse(image_data, estm, 16, 1, ...
                            min_coef_matrix1);
analysis_ssim_psnr_immse(image_data, estm, sqr_size_matrix, 2, ...
                            min_coef_matrix2);
% legend('dct','dwt');
legend('1','2','3','4');