% 1. Load the original colorful image into MATLAB
RGB = imread('peppers.png'); 

% 2. Open a new window and show the original picture
figure;
imshow(RGB);
title('Original RGB Image');

% 3. Check the file details like size and format (using imfinfo)
info = imfinfo('peppers.png');
disp(info);

% 4. Convert the color image to grayscale
% This uses the formula: I = 0.299*R + 0.587*G + 0.114*B to calculate brightness
I = rgb2gray(RGB);

% 5. Open another window to show the new gray version
figure;
imshow(I);
title('Grayscale Image');

% 6. Put both images side-by-side to compare them (using montage mode)
figure;
imshowpair(RGB, I, 'montage');
title('Original colour image (left) vs grayscale image (right)');

% task 11
% 1. Use imsplit to break the 3D RGB matrix into three 2D planes
% R, G, and B will each be a grayscale image representing that color's intensity
[R, G, B] = imsplit(RGB); 

% 2. Show all three channels side-by-side to compare them
% We use a 1x3 grid (1 row, 3 columns)
figure;
montage({R, G, B}, 'Size', [1 3]);
title('Red Channel (Left), Green Channel (Middle), Blue Channel (Right)');

%task 12
% 1. Convert the RGB image to the XYZ color space
% This maps the colors to a device-independent mathematical space
XYZ = rgb2xyz(RGB);

% 2. Show the result
% You will notice the image looks very strange and "washed out"
figure;
imshow(XYZ);
title('Image in XYZ Color Space');

% 1. Convert RGB to HSV color space
HSV_img = rgb2hsv(RGB);

% 2. Split the HSV image into its 3 components: Hue, Saturation, and Value
[H, S, V] = imsplit(HSV_img);

% 3. Display them side-by-side to see how they differ
figure;
montage({H, S, V}, 'Size', [1 3]);
title('Hue (Left), Saturation (Middle), and Value (Right)');