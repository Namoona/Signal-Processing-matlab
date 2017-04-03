
% this I has each pixcel value from 0 to 256. this is an array
I = imread('digital-images-week2_quizzes-lena.gif');

% show image
subplot(2,2,1);
imshow(I);
title('original')

% save image as new image
imwrite(I,'new.png')

% investigate dimention of image
[x1,y1,z1] = size(I);
n = [x1,y1,z1];
disp(n);



%read or crope specific part of an array
Iread = I(:,:);
Icrop = I(80:250,70:250);

%show croped image
subplot(2,2,2);
imshow(Icrop);
title('croped image');



% to scale the data within (0 to 1)
idouble = im2double(I);
disp(idouble(80:90,80:90));



%create filter of size 3 by 3 which 
%takes avarage of selected window

h3 = fspecial('average', [3,3]);
h5 = fspecial('average', [5,5]);

% apply above defined filter for image array in double
new3 = imfilter(idouble, h3, 'replicate');
new5 = imfilter(idouble, h5, 'replicate');

%show 3x3 image
subplot(2,2,3);
imshow(new3);
title('filtered 3x3');

%show 3x3 image
subplot(2,2,4);
imshow(new5);
title('filtered 5x5');


squarederror = (idouble - new3).^2;
mse3 = sum(sum(squarederror))/(256*256);
psnr3 = 10*log10(1/mse3);


squarederror = (idouble - new5).^2;
mse5 = sum(sum(squarederror))/(256*256);
psnr5 = 10*log10(1/mse5);





