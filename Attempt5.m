clearvars;
close all;

num = 4;
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
final2 = bwarearange(newImage, 100, 1250);
% imshowpair(final, final2, 'montage');

final2 = final;

final3 = imopen(final2, oct);
final3 = imdilate(final3, se);
s = regionprops(final3, 'BoundingBox');
bBoxes={s(:).BoundingBox};

figure;
imshow(final3)
hold on
for k = 1: size(bBoxes, 2)
   rectangle('Position', bBoxes{k},...
   'EdgeColor','r','LineWidth',2 )
end
hold off

figure;
imshow(getBusNumberCandidates(final3, bBoxes));