clearvars;
close all;

num = 8;
RGB = imread(strcat('Input/',num2str(num),'.jpg'));
greyscale=rgb2gray(RGB);

se=strel('disk',2);
oct=strel('octagon', 3);

b=getAreaOfInterest(greyscale);
newImage = getPreprocessedImage(b);

[hy, hx] = size(newImage);
LB = round(hy*hx/1250);
UB = LB*5;
final=bwareaopen(newImage,100);

final2 = imopen(final, oct);
final2 = imdilate(final2, se);
[cRegion, bBoxes] = getCandidateRegions(final2);
imshow(cRegion);
title('Pika');
% s = regionprops(final2, 'BoundingBox');
% bBoxes={s(:).BoundingBox};
% 
% figure;
% imshow(final2)
% hold on
% for k = 1: size(bBoxes, 2)
%    rectangle('Position', bBoxes{k}, 'EdgeColor','r','LineWidth',2 )
% end
% hold off
% title('Candidate regions');

% final4 = getBusNumberCandidates(final2, bBoxes);
% figure;
% imshow(multiplyImage(final4, b));

% pika = multiplyImage(final4, b);
% figure;
% imshow(pika);
% 
% sImages = getSegmentedImages(final4, pika);
% 
% tri = sImages{3};
% b = im2bw(tri);
% c = imfill(b, 'holes');

% imshow(imfill(im2bw(sImages{4}), 'holes'))