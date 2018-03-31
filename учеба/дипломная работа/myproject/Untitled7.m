fuction example()
image_data = imread('cat.png', 'png');
lshaar = liftwave('haar');
figure;
imshow(image_data);
% Add a primal ELS to the lifting scheme.
els = {'p',[-0.125 0.125],0};
lsnew = addlift(lshaar,els);

% Perform LWT at level 1 of a simple image.
% x = reshape(1:16,4,4);
[cA,cH,cV,cD] = lwt2(double(image_data),lsnew);

xRec = uint8(ilwt2(cA,cH,cV,cD,lsnew));
figure;
imshow(xRec - image_data);
figure;
imshow(xRec);










%lshaar = liftwave('haar');
image_data = imread('cat.png', 'png');
% Add a primal ELS to the lifting scheme.
els = {'p',[-0.125 0.125],0};
%lsnew = addlift(lshaar,els);

lshaarInt = liftwave('haar','int2int');
lsnewInt = addlift(lshaarInt,els);
[cAint,cHint,cVint,cDint] = lwt2(double(image_data),lsnewInt);

xRec = uint8(ilwt2(cAint,cHint,cVint,cDint,lsnewInt));

cAint(abs(cAint) < 5) = 0;
figure;
imshow(xRec - image_data);
figure;
imshow(xRec);


cAint(abs(cAint) < 20) = 0;
cDint(abs(cDint) < 20) = 0;
cHint(abs(cHint) < 20) = 0;
cVint(abs(cVint) < 20) = 0;
