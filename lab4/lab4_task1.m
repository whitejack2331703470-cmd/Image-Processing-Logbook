clear all;
close all;
clc;

% read broken text image
A = imread('assets/text-broken.tif');

% 1. Use a cross shape SE
B1 = [0 1 0; 1 1 1; 0 1 0]; 
A1 = imdilate(A, B1);

% 2. Use a 3x3 square SE (all ones)
B2 = ones(3,3); 
A2 = imdilate(A, B2);

% 3. Use a diagonal cross SE
Bx = [1 0 1; 0 1 0; 1 0 1];
Ax = imdilate(A, Bx);

% 4. Dilate twice with B1
A_twice = imdilate(A1, B1);

% Display results
figure;
montage({A, A1, A2, Ax, A_twice}, 'Size', [1 5]);
title('Original, Cross, Square, Diagonal, Dilated Twice');

% read wirebond mask image
A_mask = imread('assets/wirebond-mask.tif');

% create disk SE with different radii
SE2 = strel('disk', 2);
SE10 = strel('disk', 10);
SE20 = strel('disk', 20);

% perform erosion
E2 = imerode(A_mask, SE2);
E10 = imerode(A_mask, SE10);
E20 = imerode(A_mask, SE20);

% display
figure;
montage({A_mask, E2, E10, E20}, 'Size', [2 2]);
title('Original, Radius 2, Radius 10, Radius 20');
