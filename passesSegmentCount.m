function [imgBbox, imgOrig] = passesSegmentCount(Icell, minlpseg, maxlpseg)
   imgBbox = cell(1, numel(Icell));
   imgOrig = cell(1, numel(Icell));
   imagesIdx =1;
   for i = 1:numel(Icell)
      a = Icell{i};
      a2 = im2bw(a);
      [a3, bBoxes] = getCandidateRegions(a2);
      nbb = numel(bBoxes);
      
      if minlpseg <= nbb && nbb <= maxlpseg
         imgBbox{imagesIdx} = a3;
         imgOrig{imagesIdx} = a2;
         imagesIdx=imagesIdx+1;
      end
   end
    imgBbox = imgBbox(~cellfun('isempty',imgBbox));
    imgOrig = imgOrig(~cellfun('isempty',imgOrig));
end