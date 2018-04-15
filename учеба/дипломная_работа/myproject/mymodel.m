function mymodel()

% загружаем изображение
image_data = imread('cat.png', 'png');
length = size(image_data,1);
width = size(image_data,2);

rdct4 = [];
rdct8 = [];

dwt_coef = transform_to_coef_dwt(image_data, 0);
dct_coef4 = transform_to_coef_dct(image_data, 4,0);
dct_coef8 = transform_to_coef_dct(image_data, 8,0);

% min_coef = [1 2 3 4 5 10 15 20 25 30 40 50 60];
 min_coef = [5 10 15 30];
 
 est1 = zeros(size(min_coef));
 est2 = zeros(size(min_coef));
 est3 = zeros(size(min_coef));
 len1 = zeros(size(min_coef));
 len2 = zeros(size(min_coef));
 len3 = zeros(size(min_coef));

for i=1:size(min_coef, 2)
    %% Квантование %%
    qdwt = low_coef_to_null(dwt_coef, min_coef(1,i));
    qdct4 = low_coef_to_null(dct_coef4, min_coef(1,i));
    qdct8 = low_coef_to_null(dct_coef8, min_coef(1,i));
    
    %% Переупорядочивание %%
    rdwt = tree(qdwt,1);
    for l=1:length/4
        for k=1:width/4
            block = qdct4(1+4*(l-1):4*l, 1+4*(k-1):4*k);
            rdct4 = [rdct4 zigzag_fieldb(block)];
        end
    end
    
    for l=1:length/8
        for k=1:width/8
            block = qdct8(1+8*(l-1):8*l, 1+8*(k-1):8*k);
            rdct8 = [rdct8 zigzag_fieldb(block)];
        end
    end
    
    %% Обратное преобразование %%
    imdwt = transform_to_coef_dwt(qdwt, 1);
    imdct4 = transform_to_coef_dct(qdct4, 4,1);
    imdct8 = transform_to_coef_dct(qdct8, 8,1);
    
    %% Оценка качества изображения %%
    est1(1,i) = psnr(image_data, imdwt); 
    est2(1,i) = psnr(image_data, imdct4);
    est3(1,i) = psnr(image_data, imdct8);
    
    %% Энтропийное кодирование %%
    [cdwt, len1(1,i)] = my_huff(qdwt, rdwt, 8);
    [cdct4, len2(1,i)] = my_huff(qdct4, rdct4, 8);
    [cdct8, len3(1,i)] = my_huff(qdct8, rdct8, 8);

end
len1
len2 
len3
est1
est2
est3
figure
plot(len1,est1)
hold on
plot(len2,est2)
plot(len3,est3)
legend('dwt','dct4','dct8');