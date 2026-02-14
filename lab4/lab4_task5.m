clear all; close all; clc;

% read the image containing multiple characters
t = imread('assets/text.png');
imshow(t);
title('Original Text Image');

% find all connected components
CC = bwconncomp(t);

% check the structure in Command Window
% it tells you the number of objects found
CC

% count pixels in each connected component
% cellfun applies 'numel' to every cell in the list
numPixels = cellfun(@numel, CC.PixelIdxList);

% find the maximum pixel count and its index
[biggest, idx] = max(numPixels);

% erase the biggest component by setting its pixels to 0
t(CC.PixelIdxList{idx}) = 0;

% show the result
figure;
imshow(t);
title('Largest Component Erased');