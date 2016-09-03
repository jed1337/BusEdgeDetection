function croppedImage = getAreaOfInterest(I, direction)
   if nargin<2
      direction = 'vertical';
   end

   [y, x] = size(I);
   BW = edge(I,'Sobel', [], direction);

   padding  = 0;
   fraction = 1/8;

   iY = round(y*fraction)+padding;
   iX = round(x*fraction)+padding;

   if strcmp(direction,'vertical') ==1
      BW = bwareaopen(BW, iY);
   elseif strcmp(direction,'horizontal') ==1
      BW = bwareaopen(BW, iX);
   else
      printf('direction %s is invalid', direction);
   end

   convHull = bwconvhull(BW);
   measurements = regionprops(convHull, 'BoundingBox');
   boundingBox = measurements.BoundingBox; 
   croppedImage = imcrop(I, boundingBox);
   [cy, cx] =size(croppedImage);
   croppedImage = croppedImage(floor(cy/2):cy, :, 1);   
end