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
title('Candidate Regions');

final3 = getBusNumberCandidates(final2, bBoxes);

pika = multiplyImage(final3, b);
figure,imshow(pika), title('Pika');

sImages = getSegmentedImages(final3, pika);

tri = sImages{3};
b = im2bw(tri);
c = imfill(b, 'holes');

% figure, imshow(filled), title('filed');
[img, bBoxes] =getCandidateRegions(b); 
figure, imshow(img), title('New candidate');