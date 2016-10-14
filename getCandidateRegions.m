function [newImage, bBoxes] = getCandidateRegions(I)
   bBoxes=getBboxes(I);

   if islogical(I)   % Turn the logical image to greyscale
      newImage = uint8(I*(255));
   else              % Retain the greyscale image
      newImage = I;
   end

   sukat = numel(bBoxes);

   f = cell(1, sukat);
   param = {'EdgeColor','r','LineWidth',2};
   params = cell(1, sukat);
   params(:) = {param};

   for k = 1:sukat
      f{k} = @() rectangle('Position', bBoxes{k});
   end

   if numel(f) == 0
      fprintf('F is empty\n');
   else
      newImage = insertInImage(newImage, f, params);
   end
end