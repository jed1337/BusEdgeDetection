function sImages= getSegmentedImages(candidateAreas, I)
   label = bwlabel(candidateAreas);
   ml = max(max(label));
%    im1 = (label==1);

   sImages = cell(ml);
   for j=1:ml
      [row, col] = find(label==j);
      len = max(row)-min(row)+2;
      breadth = max(col)-min(col)+2;
      target=uint8(zeros([len breadth]));
      sy = min(col)-1;
      sx = min(row)-1;

      for i=1:size(row, 1)
         x = row(i, 1)-sx;
         y = col(i, 1)-sy;
         target(x, y)=I(row(i, 1), col(i, 1));
      end

      sImages{j} = target;
%       mytitle=strcat('Object Number:', num2str(j));
%       figure, imshow(target); title(mytitle);
   end
   
%    Removes empty elements
   sImages = sImages(~cellfun(@isempty, sImages));
end