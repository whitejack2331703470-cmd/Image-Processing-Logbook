clear all; close all; clc;

% step 1: load and binarize
f_gray = imread('assets/fingerprint.tif');
level = graythresh(f_gray); % find optimal threshold
f = imbinarize(f_gray, level); % create binary image

% step 2: thinning iterations
g1 = bwmorph(f, 'thin', 1);
g2 = bwmorph(f, 'thin', 2);
g3 = bwmorph(f, 'thin', 3);
g4 = bwmorph(f, 'thin', 4);
g5 = bwmorph(f, 'thin', 5);

% step 3: thinning to infinity (skeletonization)
% inf repeats until the image stops changing
g_inf = bwmorph(f, 'thin', inf); 

% step 4: visualization (white on black)
figure;
montage({f, g1, g2, g3, g4, g5, g_inf}, 'Size', [1 7]);
title('Original and Thinning Iterations (1, 2, 3, 4, 5, Inf)');

% step 5: display black lines on white background
figure;
imshow(imcomplement(g_inf)); 
title('Skeletonized Fingerprint (Black on White)');