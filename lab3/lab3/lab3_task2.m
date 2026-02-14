clear all;
close all;
clc;

% read the bone scan image
f = imread('assets/bonescan-front.tif');

% convert uint8 to double for calculation
r = double(f);

% set parameters
k = mean2(r); % average intensity
E = 0.9;      % steepness of the curve

% apply the transformation formula
% use eps to avoid division by zero
s = 1 ./ (1.0 + (k ./ (r + eps)).^E);

% scale back to 0-255 and convert to uint8
g = uint8(255 * s);

% show original and enhanced images side by side
imshowpair(f, g, 'montage');
title('Original (Left) vs Contrast-Stretching (Right)');