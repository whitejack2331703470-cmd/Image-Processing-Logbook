clear all;
close all;
clc;
% read the fingerprint image
f = imread('assets/fingerprint.tif');

% create a disk structuring element
se = strel('disk', 1);

% perform Opening: erosion then dilation
% helps to remove small white noise
f_open = imopen(f, se);

% perform Closing: dilation then erosion
% helps to fill small gaps in the ridges
f_close = imclose(f, se);

% display the results
figure;
montage({f, f_open, f_close}, 'Size', [1 3]);
title('Original (Left), Opening (Middle), Closing (Right)');

% combine operations: opening then closing
f_clean = imclose(imopen(f, se), se);

figure;
imshow(f_clean);
title('Fingerprint after Opening and then Closing');