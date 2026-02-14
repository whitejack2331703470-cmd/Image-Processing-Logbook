clear all; close all; clc;

% Step 1: Load the dental X-ray image
% The file is located in the assets folder
f = imread('assets/fillings.tif');

% Step 2: Binarization
% Fillings are usually made of metal, so they appear very bright (near white)
% I used a high threshold (0.9) to isolate only the brightest spots
bw = imbinarize(f, 0.9); 

% Step 3: Cleaning up noise
% Some small bright spots might just be noise, not real fills
% I used an opening operation with a small disk to remove them
se = strel('disk', 2);
bw_clean = imopen(bw, se);

% Step 4: Counting and Measuring
% bwconncomp finds all separated white objects
cc = bwconncomp(bw_clean);

% Use cellfun to count pixels in each detected fill
numPixels = cellfun(@numel, cc.PixelIdxList);

% Output the results to the Command Window
fprintf('The patient has %d fills in total.\n', cc.NumObjects);
disp('The size of each fill (in pixels) is:');
disp(numPixels);

% Step 5: Final Check
imshowpair(f, bw_clean, 'montage');
title('Original X-ray vs Detected Fills');