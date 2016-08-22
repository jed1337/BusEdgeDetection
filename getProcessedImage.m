function croppedImage = getProcessedImage(I)
   [y, x] = size(I);
   BW2 = edge(I,'Sobel', [], 'vertical');
   BW3 = edge(I,'Sobel', [], 'horizontal');

   padding  = 0;
   fraction = 1/8;

   iY = round(y*fraction)+padding;
   iX = round(x*fraction)+padding;

   BW2 = bwareaopen(BW2, iY);
   BW3 = bwareaopen(BW3, iX);
   
%    figure;
%    title('Vertical & Horizontal convex hull');
%    imshowpair(bwconvhull(BW2), bwconvhull(BW3), 'montage');

   binaryImage = bwconvhull(BW2);
   measurements = regionprops(binaryImage, 'BoundingBox');
   boundingBox = measurements.BoundingBox; 
   croppedImage = imcrop(I, boundingBox);
   [cy, cx] =size(croppedImage);
   croppedImage = croppedImage(floor(cy/2):cy, :, 1);
end