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
% imshowpair(final, final2, 'montage');

final3 = imopen(final, oct);
final3 = imdilate(final3, se);
s = regionprops(final3, 'BoundingBox');
bBoxes={s(:).BoundingBox};

figure;
imshow(final3)
hold on
for k = 1: size(bBoxes, 2)
   rectangle('Position', bBoxes{k}, 'EdgeColor','r','LineWidth',2 )
end
hold off
title('Candidate regions');

final4 = getBusNumberCandidates(final3, bBoxes);
% figure;
% imshow(multiplyImage(final4, b));

pika = multiplyImage(final4, b);
edged= edge(pika,'Sobel', [], 'vertical');
% imshowpair(pika, edged, 'montage');
figure;
imshow(pika);
% imshowpair(pika, pika>255/2, 'montage');
