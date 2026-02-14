clear all;
close all;
clc;
% read and show the noisy PCB image
f = imread('assets/noisyPCB.jpg');
imshow(f);
title('Original Noisy Image');

% create a 9x9 averaging filter
w_box = fspecial('average', [9 9]);

% create a 7x7 Gaussian filter with sigma = 1.0
w_gauss = fspecial('gaussian', [7 7], 1.0);

% apply filters to the image
% '0' means fill the boundaries with black pixels
g_box = imfilter(f, w_box, 0);
g_gauss = imfilter(f, w_gauss, 0);

% show results side by side
figure;
montage({f, g_box, g_gauss});
title('Original (Left), Box Filter (Middle), Gaussian Filter (Right)');