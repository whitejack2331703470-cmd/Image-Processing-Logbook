clear all;
close all;
clc;


f = imread('assets/moon.tif'); 
imshow(f);
title('Original Image');

% apply median filter with a 7x7 kernel
% 'zero' means padding boundaries with zeros
g_median = medfilt2(f, [7 7], 'zero');

% show comparison
figure;
montage({f, g_median});
title('Original vs Median Filtered Result');