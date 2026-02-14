clear all; close all; clc;

% step 1: Load grayscale head CT scan
f = imread('assets/headCT.tif');

% step 2: Create a 3x3 square structuring element
se = strel('square', 3);

% step 3: Perform grayscale dilation and erosion
% Dilation brightens and expands light areas
gd = imdilate(f, se); 
% Erosion darkens and shrinks light areas
ge = imerode(f, se); 

% step 4: Morphological Gradient (Edge detection)
% Subtracting the eroded image from dilated image
gg = gd - ge; 

% step 5: Display results as a 2x2 montage
montage({f, gd, ge, gg}, 'size', [2 2]);
title('Original (Top L), Dilation (Top R), Erosion (Bot L), Gradient (Bot R)');