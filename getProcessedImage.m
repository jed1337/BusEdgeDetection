function croppedImage = getProcessedImage(I)
%    figure;
%    imshowpair(RGB, I, 'montage');
%    title('Coloured and grey-scale input');
%    linkaxes;
   % imshow(I);
   % figure('units','normalized','outerposition',[0 0 1 1]);

   [y, x] = size(I);
   % figure;
%    BW1 = edge(I,'Sobel', [], 'both');
   BW2 = edge(I,'Sobel', [], 'vertical');
   BW3 = edge(I,'Sobel', [], 'horizontal');

   padding  = 0;
   fraction = 1/6;

   iY = round(y*fraction)+padding;
   iX = round(x*fraction)+padding;

   BW2 = bwareaopen(BW2, iY);
   BW3 = bwareaopen(BW3, iX);

%    figure;
%    imshowpair(BW2, BW3, 'montage');
%    title(sprintf('Vertical & Horizontal. iX: %d iY: %d',iX, iY));
%    linkaxes;
% 
%    figure;
%    title('Vertical & Horizontal convex hull');
%    imshowpair(bwconvhull(BW2), bwconvhull(BW3), 'montage');

   binaryImage = bwconvhull(BW2);
   measurements = regionprops(binaryImage, 'BoundingBox');
   boundingBox = measurements.BoundingBox; 
   croppedImage = imcrop(I, boundingBox);
   [cy, cx] =size(croppedImage);
   croppedImage = croppedImage(floor(cy/2):cy, :, 1);
%    bottomHalf = croppedImage(floor(cy/2):cy, :, 1);
%    figure;
%    imshowpair(croppedImage, bottomHalf, 'montage');
end