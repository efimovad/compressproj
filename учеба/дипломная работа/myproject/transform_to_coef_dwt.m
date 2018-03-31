function [new_image_data, counter] = transform_to_coef_dwt(image_data, ...
                                                  min_coef_value)
image_size = size(image_data, 1); 
% тип вейвлета
ls = liftwave('9.7');
% информация о лифтинговой схеме

els = {'p',[-0.125 0.125],0};

lsnew = addlift(ls,els);

[cA,cH,cV,cD] = lwt2(double(image_data),lsnew);

cD(abs(cD) < min_coef_value) = 0;
cH(abs(cH) < min_coef_value) = 0;
cV(abs(cV) < min_coef_value) = 0;

counter = nnz(cA) + nnz(cD) + nnz(cH) + nnz(cV);
counter = 100 - counter * 100 / (image_size * image_size);

new_image_data = uint8(ilwt2(cA,cH,cV,cD,lsnew));
                                           
                                              