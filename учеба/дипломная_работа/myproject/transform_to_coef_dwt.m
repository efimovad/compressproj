function new_image_data = transform_to_coef_dwt(image_data, reverse)

length = size(image_data,2);
% тип вейвлета
ls = liftwave('9.7');
% информация о лифтинговой схеме
els = {'p',[-0.125 0.125],0};
lsnew = addlift(ls,els);

if (reverse == 0)
    [cA,cH,cV,cD] = lwt2(double(image_data),lsnew);
    new_image_data = [cA cV; cH cD];
elseif (reverse == 1)
    cA = image_data(1:length/2, 1:length/2);
    cH = image_data(length/2+1:length, 1:length/2);
    cV = image_data(1:length/2, length/2+1:length);
    cD = image_data(length/2+1:length, length/2+1:length);
    new_image_data = uint8(ilwt2(cA,cH,cV,cD,lsnew));
end
                                
                                              