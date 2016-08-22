clearvars;
close all;

RGB = imread('Input/9.jpg');
I=rgb2gray(RGB);
J=histeq(I);
num=100/255;
% figure;
% im2bw(getProcessedImage(I), num);
% title('I');
% figure;
% title('J');
% imshowpair(getProcessedImage(I), getProcessedImage(J), 'montage');
bw = im2bw(getProcessedImage(J), num);
se = strel('rectangle', [2, 2]);
imshow(bw);

