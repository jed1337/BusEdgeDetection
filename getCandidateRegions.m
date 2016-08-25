function [newImage, bBoxes] = getCandidateRegions(I)
s = regionprops(I, 'BoundingBox');
bBoxes={s(:).BoundingBox};

newImage = uint8(I*(255));
sukat = numel(bBoxes);

f = cell(1, sukat);
param = {'EdgeColor','r','LineWidth',2};
params = cell(1, sukat);
params(:) = {param};

for k = 1:sukat
   f{k} = @() rectangle('Position', bBoxes{k});
end

   newImage = insertInImage(newImage, f, params);
%    figure,imshow(newImage)
end