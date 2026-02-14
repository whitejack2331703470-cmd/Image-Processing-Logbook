clear all; close all; clc;
f = imread('assets/text_bw.tif');
se = ones(17,1); 
g = imerode(f, se);
fo = imopen(f, se); 
fr = imreconstruct(g, f); 
montage({f, g, fo, fr}, "size", [2 2]);
ff = imfill(f, 'holes'); 

figure;
montage({f, ff});
title('Before (Left) vs After (Right) imfill');c