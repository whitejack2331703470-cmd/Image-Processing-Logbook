clear all; close all; clc;


f = imread('assets/moon.tif');
f_double = double(f); 


w = fspecial('laplacian', 0);


g1 = imfilter(f_double, w, 'replicate');


g = f_double - g1;

g = uint8(g);
imshowpair(f, g, 'montage');
title('Original Moon vs Sharpened Moon');