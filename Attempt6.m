clearvars;
close all;

num = 9;
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
% figure, imshow(cRegion), title('Candidate Regions');

final3 = getBusNumberCandidates(final2, bBoxes);

pika = multiplyImage(final3, b);
% figure,imshow(pika), title('Pika');

sImages = getSegmentedImages(final3, pika);
psc = passesSegmentCount(sImages, 3, 9);
subplotplus(psc);