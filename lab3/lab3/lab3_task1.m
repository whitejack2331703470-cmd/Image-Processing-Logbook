clear all;  
close all;   
clc;         
imfinfo('assets/breastXray.tif')
f = imread('assets/breastXray.tif'); % 将图像数据读取到矩阵 f 中
imshow(f); 

% check min and max intensity
[fmin, fmax] = bounds(f(:)) 

% test yourself: pixel intensity at (3,10)
pixel_val = f(3,10)

% display right half of the image
[r, c] = size(f);
imshow(f(:, round(c/2):end)); 

% task: create negative image
% map [0,1] to [1,0] to invert colors
g1 = imadjust(f, [0 1], [1 0]);
figure;
montage({f, g1});

% show histogram of original image
figure;
imhist(f);
title('histogram of original image');

% automatic contrast enhancement
g_hist = histeq(f);

% show enhanced image and its histogram
figure;
subplot(1,2,1); imshow(g_hist); title('equalized image');
subplot(1,2,2); imhist(g_hist); title('equalized histogram');

% save the result to your assets folder
imwrite(g_hist, 'assets/breastXray_enhanced.tif');