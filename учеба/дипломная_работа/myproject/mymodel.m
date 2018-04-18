function mymodel()

% загружаем изображение
image_data = imread('cat.png', 'png');
length = size(image_data,1);
width = size(image_data,2);

dwt_coef = transform_to_coef_dwt(image_data, 0);
dct_coef4 = transform_to_coef_dct(image_data, 4,0);
dct_coef8 = transform_to_coef_dct(image_data, 8,0);

min_coef = [2 3 5 9];
 
est1 = zeros(size(min_coef));
est2 = zeros(size(min_coef));
est3 = zeros(size(min_coef));
 
len1 = zeros(size(min_coef));
len2 = zeros(size(min_coef));
len3 = zeros(size(min_coef));

for i=1:size(min_coef, 2)
    rdct4 = [];
    rdct8 = [];
    %% Квантование %%
    qdwt = ravn_quant(dwt_coef, min_coef(1,i), 0);
    qdct4 = ravn_quant(dct_coef4, min_coef(1,i), 0);
    qdct8 = ravn_quant(dct_coef8, min_coef(1,i), 0);
    
    %% Переупорядочивание %%
    rdwt = tree(qdwt,1);
    for l=1:length/4
        for k=1:width/4
            block = qdct4(1+4*(l-1):4*l, 1+4*(k-1):4*k);
            rdct4 = [rdct4 zigzag_fieldb(block)];
        end
    end
    rldct4 = runlevel3(rdct4, 4);
    
    for l=1:length/8
        for k=1:width/8
            block = qdct8(1+8*(l-1):8*l, 1+8*(k-1):8*k);
            rdct8 = [rdct8 zigzag_fieldb(block)];
        end
    end
    rldct8 = runlevel3(rdct8, 8);
     
    %%  %%
    qrdwt = ravn_quant(qdwt, min_coef(1,i), 1);
    qrdct4 = ravn_quant(qdct4, min_coef(1,i), 1);
    qrdct8 = ravn_quant(qdct8, min_coef(1,i), 1);
    
    %% Обратное преобразование %%
    imdwt = transform_to_coef_dwt(qrdwt, 1);
    imdct4 = transform_to_coef_dct(qrdct4, 4,1);
    imdct8 = transform_to_coef_dct(qrdct8, 8,1);
    
    %% Оценка качества изображения %%
    est1(1,i) = psnr(image_data, imdwt); 
    est2(1,i) = psnr(image_data, imdct4);
    est3(1,i) = psnr(image_data, imdct8);
    
    %% Энтропийное кодирование %%
    [cdwt, len1(1,i)] = my_huff(qdwt, rdwt, 8);
    [cdct4, len2(1,i)] = my_huff(qdct4, rldct4, 8);
    [cdct8, len3(1,i)] = my_huff(qdct8, rldct8, 8);

end

figure
plot(len1,est1)
hold on
plot(len2,est2)
plot(len3,est3)
legend('dwt','dct4','dct8');