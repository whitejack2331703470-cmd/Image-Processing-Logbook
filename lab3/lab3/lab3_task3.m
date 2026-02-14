clear all; % clear all variable in workspace
close all; % close all figure windows
clc;
% read and show original image
f = imread('assets/pollen.tif');
imshow(f);

% show its histogram
figure;
imhist(f);

% manually stretch contrast first
g = imadjust(f, [0.3 0.55]);

% calculate PDF
g_pdf = imhist(g) ./ numel(g); 

% calculate CDF
g_cdf = cumsum(g_pdf); 

% plot PDF and CDF side-by-side
figure;
subplot(1,2,1); plot(g_pdf); title('PDF of adjusted image');
subplot(1,2,2); plot(g_cdf); title('CDF of adjusted image');

% automatic equalization
h = histeq(g, 256);

% show all three: original, adjusted, and equalized
close all; % close previous windows to clear screen
montage({f, g, h});
title('Original (Left), Adjusted (Middle), Equalized (Right)');

% compare their histograms
figure;
subplot(1,3,1); imhist(f); title('Original Hist');
subplot(1,3,2); imhist(g); title('Adjusted Hist');
subplot(1,3,3); imhist(h); title('Equalized Hist');