clear all; close all; clc;

%% Challenge 1: Improve Lake & Tree contrast
img_lake = imread('assets/lake&tree.png');

img_lake_en = histeq(img_lake);

%% Challenge 2: Find edges of circles
img_circles = imread('assets/circles.tif');

w_sobel = fspecial('sobel');
img_edges = imfilter(double(img_circles), w_sobel);

%% Display all results
figure;
subplot(2,2,1); imshow(img_lake); title('Original Lake');
subplot(2,2,2); imshow(img_lake_en); title('Enhanced Lake');
subplot(2,2,3); imshow(img_circles); title('Original Circles');
subplot(2,2,4); imshow(uint8(abs(img_edges))); title('Sobel Edges');

%% Challenge 3: Improve Office lighting
img_office = imread('assets/office.jpg');

% Using Gamma correction (gamma < 1 to brighten shadows)
img_office_en = imadjust(img_office, [], [], 0.5); 

figure;
imshowpair(img_office, img_office_en, 'montage');
title('Original Office vs Enhanced Lighting');