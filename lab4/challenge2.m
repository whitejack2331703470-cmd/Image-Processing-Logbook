clear all; close all; clc;

% step 1: load the image and convert to grayscale
% normal-blood.png is colored, so we need rgb2gray first
img = imread('assets/normal-blood.png');
gray_img = rgb2gray(img);

% step 2: binarization
% the cells are dark on a light background, so we invert it
% after inversion, cells become white (1) and background becomes black (0)
bw = imcomplement(imbinarize(gray_img));

% step 3: clean up the image
% fill the "holes" inside the cells so they are solid white blobs
bw_filled = imfill(bw, 'holes'); 

% step 4: separate touching cells
% this is the "secret sauce": shrinking the cells slightly
% so that those sticking together become separated
se = strel('disk', 4); 
bw_clean = imerode(bw_filled, se);

% step 5: count the objects
% bwconncomp finds all the independent white blobs
cc = bwconncomp(bw_clean);

% step 6: show the results
fprintf('Result: I found %d red blood cells in this image!\n', cc.NumObjects);
imshow(bw_clean);
title(['Total Cell Count: ', num2str(cc.NumObjects)]);