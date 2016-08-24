function newImage = getBusNumberCandidates(I, s)
   newImage = I;
   CC = bwconncomp(newImage);
   Bboxes = s;
   
   minRatio = 1.5;
   maxRatio = 2.5;
   minWidth = 30;
   minHeight = 11;
   
%  pika(3) = width
%  pika(4) = height
   idxRatio = cellfun(@(pika) minRatio<=(pika(3)/pika(4)) ...
      && (pika(3)/pika(4))<=maxRatio , Bboxes);
   idxDimensions = cellfun(@(pika) pika(3)>minWidth && pika(4)>minHeight, Bboxes);
   
   idx = idxRatio&idxDimensions;
   
   newImage(cell2mat(CC.PixelIdxList(~idx)')) = false; %Set not above to false 
%    newImage(cell2mat(CC.PixelIdxList(~idxRatio&idxDimensions)')) = false; %Set not above to false 
%    newImage(cell2mat(CC.PixelIdxList(~idxRatio)')) = false; %Set not above to false 
end