clearvars;
close all;

num = 10;
RGB = imread(strcat('Input/',num2str(num),'.jpg'));
greyscale=rgb2gray(RGB);

% figure, imshowpair(RGB, greyscale, 'montage'), title('RGB and Greyscale');
% figure, imshow(RGB), %title('RGB Image');
% figure, imshow(greyscale), %title('Greyscale Image');

se=strel('disk',2);
oct=strel('octagon', 3);

b=getAreaOfInterest(greyscale);
newImage = getPreprocessedImage(b);
% figure, imshowpair(b, newImage, 'montage'), title('Area of interest and filled edges');
% figure, imshow(b), %title('Area of interest');
% figure, imshow(newImage), %title('Filled edges');

[hy, hx] = size(newImage);
LB = round(hy*hx/1250);
UB = LB*5;
final=bwareaopen(newImage,100);

final2 = imopen(final, oct);
final2 = imdilate(final2, se);
[cRegion, bBoxes] = getCandidateRegions(final2);
% figure, imshow(cRegion), title('Candidate Regions');

final3 = getBusNumberCandidates(final2, bBoxes);
% figure, imshowpair(cRegion, final3, 'montage'), title('Candidate Regions and Dimension-filtered candidate regions');
figure, imshow(cRegion),% title('Candidate Regions');
% figure, imshow(final3), %title('Dimension-filled candidate regions');

pika = multiplyImage(final3, b);
figure,imshow(pika), %title('Multiplied Image');

sImages = getSegmentedImages(final3, pika);
[imgBbox, imgOrig] = passesSegmentCount(sImages, 4, 9);
subplotplus(imgBbox); %title(sprintf('Segment count filtered \ncandidate region'));
subplotplus(imgOrig);%title('Final output');