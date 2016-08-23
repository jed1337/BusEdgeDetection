function newImage = multiplyImage(one, two)
   [y1, x1] = size(one);
   [y2, x2] = size(two);
   
   %Adjust dimensions of one
   for i=y1:(y2-1)
      one(end+1, :) = 0;   % new row at end
   end
   for i=x1:(x2-1)
      one(:, end+1) = 0;   % new column at end
   end
   
   %Adjust dimensions of two
   for i=y2:(y1-1)
      two(end+1, :) = 0;   % new row at end
   end
   for i=x2:(x1-1)
      two(:, end+1) = 0;   % new column at end
   end
   
   newImage = immultiply(one, two);
end