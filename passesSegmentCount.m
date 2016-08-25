function images = passesSegmentCount(Icell, minlpseg, maxlpseg)
   images = cell(1, numel(Icell));
   imagesIdx =1;
   for i = 1:numel(Icell)
      a = Icell{i};
      a2 = im2bw(a);
      [a3, bBoxes] = getCandidateRegions(a2);
      nbb = numel(bBoxes);
      
      if minlpseg <= nbb && nbb <= maxlpseg
%          figure, imshow(a3);title(num2str(numel(bBoxes)));
         images{imagesIdx} = a3;
         imagesIdx=imagesIdx+1;
      end
   end
    images = images(~cellfun('isempty',images));
end