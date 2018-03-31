%
%
% estim ��������� ������� ��� ������
% ��� estim = 1 ������ : ssim
% ��� estim = 2 ������ : psnr
% ��� estim = 3 ������ : immse

function analysis_ssim_psnr_immse(image_data, estim_num, ... 
            sqr_size_matrix, method , min_coef_matrix)

%min_coef_matrix = [1 5 10 30 40 75];
%sqr_size_matrix = [4 8 16];

% ������� � ��������
% method = 1;

hold on;

for j = 1 : size(sqr_size_matrix, 2)
    
    my_estim = double(zeros(size(min_coef_matrix)));

    per_null_matrix = double(zeros(size(min_coef_matrix)));

    for i = 1 : size(min_coef_matrix, 2)
       [new_image_data, counter] = transform_to_coef( ... 
                        image_data, min_coef_matrix(1, i), ...
                        sqr_size_matrix(1, j), method);
        switch estim_num
            case 1
            my_estim(1,i) = ssim(image_data, new_image_data);
            per_null_matrix(1, i) = counter;  
            title('������ SSIM');
            %figure
            %imshow(new_image_data);

            case 2
            my_estim(1,i) = psnr(image_data, new_image_data);
            per_null_matrix(1, i) = counter; 
            title('������ PSNR');

            case 3
            my_estim(1,i) = immse(image_data, new_image_data);
            per_null_matrix(1, i) = counter;
            % ���������� ���� ����� �� ����������
            title('������ IMMSE');
            
            otherwise 
                error('�������� �������� ������ �����������');
        end
        str{j} = [num2str(sqr_size_matrix(1, j)) , 'x', ...
                      num2str(sqr_size_matrix(1, j))];

    end
    my_estim
    per_null_matrix
    plot(per_null_matrix, my_estim);
    xlabel('������� ������� �������������');
    ylabel('�������� ������');
    %legend(str);
    grid on;
end  



