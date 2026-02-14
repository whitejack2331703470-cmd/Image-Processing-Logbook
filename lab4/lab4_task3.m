clear all; close all; clc;

% step 1: Pre-processing
I = imread('assets/blobs.tif');
I_inv = imcomplement(I); % invert: make blobs white
level = graythresh(I_inv); % find optimal threshold
BW = imbinarize(I_inv, level); % convert to binary

% step 2: Boundary extraction
SE = ones(3,3); % 3x3 square structuring element
BW_erode = imerode(BW, SE); % shrink objects by 1 pixel
BW_edge = BW - BW_erode; % subtract smaller from original

% step 3: Visualization
montage({I, BW, BW_erode, BW_edge}, 'Size', [2 2]);
title('Original, Binary, Eroded, Boundary');