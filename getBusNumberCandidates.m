function newImage = getBusNumberCandidates(I, s)
   newImage = I;
   CC = bwconncomp(newImage);
   Bboxes = s;
%    Bboxes = {s(:).BoundingBox};
   minRatio = 1.5;
   maxRatio = 3;
   idx = cellfun(@(pika) minRatio<=(pika(3)/pika(4)) ...
      && (pika(3)/pika(4))<=maxRatio , Bboxes);

   newImage(cell2mat(CC.PixelIdxList(~idx)')) = false; %Set not above to false 
end